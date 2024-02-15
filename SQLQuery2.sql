Create Datebase DBStudents

Use DBStudents

Create Table TblStudents
(
StudentID int Primary Key Identity(1,1),
StudentName nchar(50) Not Null,
StudentSurname nchar(55) Not Null Default('XXXXXX')
)

Create Table TblSubjects
(
SubjectID int Primary Key Identity(1,1),
SubjectName nchar(50) Not Null
)

Create Table Exams
(
ExamID int Primary Key Identity(1,1),
ExamDate date,
SubjectID int Foreign Key References TblSubjects(SubjectID)
)

Create Table StudentExams
(
StudentExamsID int Primary Key Identity(1,1),
StudentID int Foreign Key References TblStudents(StudentID),
ExamID int Foreign Key References Exams(ExamID),
ExamResult decimal(5,2)
)

Alter Table TblStudents
Add BirthDate Date

SELECT 
    s.StudentName AS Student_Name,
    ISNULL(s.StudentSurname, 'XXXXXX') AS Student_Surname,
    DATEDIFF(YEAR, s.BirthDate, GETDATE()) AS Student_Age,
    sub.SubjectName AS Subject_Name,
    e.ExamDate AS Exam_Date,
    se.ExamResult AS Exam_Result
FROM 
    TblStudents s
JOIN 
    StudentExams se ON s.StudentID = se.StudentId
JOIN 
    Exams e ON se.ExamId = e.ExamID
JOIN 
    TblSubjects sub ON e.SubjectId = sub.SubjectID;
