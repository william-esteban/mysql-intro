CREATE TABLE usuarios(
    id INT PRIMARY KEY AUTO_INCREMENT,
    NOMBRE VARCHAR(45),
    APELLIDO VARCHAR(45),
    FECHA_NACIMIENTO DATE
);

SELECT * FROM users

--#1. Listado de todos los usuarios con solo los nombres, apellidos y edad, que tengan 20 años de edad.
SELECT nombres,apellidos,edad FROM users WHERE edad = 20;

-- 2. Listado de todas las mujeres en la base de datos que tengan entre 20 y 30 años de edad.
SELECT nombres,genero,edad FROM users WHERE genero = "M" AND edad >= 20 AND edad <= 30;

-- 3. Quién es la persona con menos edad de la base de datos.
SELECT nombres,edad FROM users WHERE edad < 10;

-- 4. Cuantos usuarios hay registrados en la base de datos.
SELECT  COUNT(*)  AS users FROM users;

-- 5.Traer los 5 primeros usuarios de la base de datos
SELECT * FROM users ORDER BY "id" LIMIT 5;

-- 6. Traer los 10 últimos usuarios de la base de datos.
SELECT * FROM users ORDER BY "id" DESC LIMIT 10;

-- 7. Listar usuarios que su correo finalice en .net
SELECT * FROM users WHERE correo LIKE '%.net';

-- 8. Listar usuarios no vivan en  colombia.
SELECT * FROM users WHERE pais != 'colombia';

-- 9. Listar usuarios que no vivan en ecuador y panamá.
SELECT * FROM users WHERE pais  NOT IN ("ecuador","panama");

-- 10. Cuantos(numero) usuarios son de colombia y les gusta el rock.
SELECT nombres,musica, COUNT('colombia') AS users FROM users WHERE musica = 'rock';

-- 11. Actualizar el género musical de todos los usuarios de la base de datos de "metal" a "carranga".
UPDATE users SET musica = "metal" WHERE musica = "charranga";

-- 12. Listado de hombres que les guste la "carranga" sean de colombia y tengan entre 10 y 20 años de edad.
SELECT * FROM users WHERE genero = 'H' AND pais = 'colombia' AND musica = 'merengue' AND edad BETWEEN 10 AND 20;

-- 13. Actualizar a todos los usuarios que tengan 99 años, su nuevo género musical favorito será la "merengue".
UPDATE users SET musica = 'merengue' WHERE edad = 99;

-- 14. Listar todos los usuarios que su nombre inicie con "a","A"
SELECT * FROM users WHERE nombres LIKE 'a%' OR nombres LIKE 'A%';

-- 15. Listar todos los usuarios que su apellido finalice en "z","Z"

SELECT * FROM users WHERE apellidos LIKE '%z' OR apellidos LIKE '%Z';

-- Aca alteramos la tabla musica para pueda recibir datos nulos.
ALTER TABLE users MODIFY COLUMN musica VARCHAR(255) DEFAULT NULL;

-- 16. Actualizar los usuarios que tengan 50 años de edad su nuevo género musical será NULL
UPDATE users SET musica = NULL WHERE edad = 50;

-- 17. Listar todos los usuarios que su género musical sea igual a NULL
SELECT * FROM users WHERE musica IS NULL;

-- 18. Cual es el resultado de la suma de todas las edades de la base de datos.
SELECT SUM(edad) AS suma_edades FROM users;

-- 19. Cuantos usuarios tenemos registrados de "ecuador".
SELECT COUNT(*) AS usuarios_registrados_ecuador FROM users WHERE pais = 'ecuador';

-- 20. Cuántos usuarios son de Colombia y les gusta el vallenato.
SELECT COUNT(*) AS usuarios_registrados_colombia FROM users WHERE pais = 'colombia'




-- con esto puedo ver que clases de genero existen en mi base de datos.
SELECT DISTINCT musica FROM users;
-- con este codigo vemos cuantos usuarios escuchan cada genero.
SELECT musica, COUNT(*) AS users FROM users GROUP BY musica
