/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50724 (5.7.24)
 Source Host           : localhost:3306
 Source Schema         : my_db_01

 Target Server Type    : MySQL
 Target Server Version : 50724 (5.7.24)
 File Encoding         : 65001

 Date: 31/12/2022 16:12:42
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for ev_article_cate
-- ----------------------------
DROP TABLE IF EXISTS `ev_article_cate`;
CREATE TABLE `ev_article_cate`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `alias` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_delete` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE,
  UNIQUE INDEX `alias`(`alias`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ev_article_cate
-- ----------------------------
INSERT INTO `ev_article_cate` VALUES (1, '科技', 'KeJi', 0);
INSERT INTO `ev_article_cate` VALUES (2, '历史', 'LiShi', 0);

-- ----------------------------
-- Table structure for ev_articles
-- ----------------------------
DROP TABLE IF EXISTS `ev_articles`;
CREATE TABLE `ev_articles`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `cover_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pub_date` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `state` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_delete` tinyint(1) NOT NULL DEFAULT 0,
  `cate_id` int(11) NOT NULL,
  `author_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ev_articles
-- ----------------------------
INSERT INTO `ev_articles` VALUES (1, 'Node.js入门教程', 'Node.js是基于V8引擎的JS运行环境……', '\\uploads\\b857a4b6f1d2bdda3fd35efead6975b5', '2022-12-31 13:01:33.001', '草稿', 0, 1, 12);

-- ----------------------------
-- Table structure for ev_users
-- ----------------------------
DROP TABLE IF EXISTS `ev_users`;
CREATE TABLE `ev_users`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_pic` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `id`(`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ev_users
-- ----------------------------
INSERT INTO `ev_users` VALUES (12, 'zjr', '$2a$10$NmNIShIs6JYO1OPJWYM7qexS34XwVv.sIqyr62itxsm6s2gfrPRwy', '周吉瑞', '123456@qq.com', 'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAAAXNSR0IArs4c6QAAIABJREFUeF58vXeYnWd19vt7+7vrFM2oy5KrZGzjgjEQmxbTE3oIJSQh+UJICCeN8OX6AoEU+EiAJB/BIRBIAiGBOKaDG+CCjcFFtlwkq2tUZjRtz+57v/15zrWed0TOOX8c5QpjabZm7/cpa93rvu+1ZHWeuEVbrgd+iHIcUBkuiixKcbMMgoBsNMKpV2CyiTWMGR5boDoZkCqoej5ZnFD4EKY2WcXBaVRxbEWapDg7rwC3BtoiUznaynGwUYXGcUHnGTpLsK1UfgO2D5aHfFNnBUoVePK5AE2OVgrHcSgseYlFZjmE7lbe+pZf547vPkKmNBY2lgVWocr/RlO4ils+816eevIIn/3OYxRORpZpNBV0kWI7Obm2sO2ALMvMe2RFjltAZuvyPbPcfM3zHNd1KYoCrTWWZVFohed55vfyfXlXtxqSjSI0CicIsJ2AfDzADlwY9ug8+jlWD5zF0ZpKxSZ3wOoe/rrWEVjTE9hZQaZzPCdEF2O8JCWxChgnDFf71C/YjtOYJC9SnO6INItwKbByjXYgtjWVXLE8P2Ty4k342/egvABLudi2fCzIiwxZXkvnWOSgCooixVUpCoXlNbG1PKDGsW3yosCR1UWTUOBZFZSlccM6Rw8t8Nxnv46ikJ8foFWKNhsr76BxnQDbtvjaP/8J9z/wIP9yx0NgN1GFLJIGczgCMvn8WlHIwqocx3bNwsov2YA0TTGfwJLDYJNlBbZly0OglWVekxQZnuvKH6EKhe97JElqfo7jeDieXR6oPMRzC0Zryyze9n/IRmNAoUmxtYvVOXmntlWBLI9TpBROgB5G2MS4boWoOyDwNZ5fI68GFGkGjodbRERDOdkZXlhFjxW5LrBcaA8TZq6+Fsuuo5SDZWcgZ0ZDUeRoW2FbBY7OKFSCrTQ6L8CTKxOYxTQLohTYdrkh8lu/KsvMU/vneOmL3oYqPLBzlJI7IC+QTQzR1gDbdvn6v/4F+/bt5VNfuR/LDUkKhefkZKpibqPWsoEeKivMKVe2LHv569wtkK9y8uVrUShczzGbY26stlEqNxshm+a4rvlz23bMa4siQxUFrhfKkpFnCZ7ToMhjdH+J+ds/Y9bPacraKJANaR++S+MVoBV24GNpH+yUYtjFKjRWnJOMIirTDex6nTiN0FFC4NgUCWhPIx/x8I9Psm1bjcoFm7C2XIoOKrI+ONoi1xmyvq5Ztow8z/AcG7tIgQRVjMFpmge03QCd5sgRsW0Py7ZMeLKDGr41y+z0xegiICsUOqxgZQnK3PUCiwxLO/zCS5/Ba99wPX/yN7dg29N0hz0KS5Gb21hFqxFKK3MrLFsCqLW+cJ5ZUKWU+X/5zI5ro+VBJPjZjvn8WVqs/3eK61TNwheycX6I5wVmk+QWyTlSeY7lObjyLL5FEY0pbIc/fceN/OFrno+WEzxlo+IILYe3O/cdbVsByvbRroPcFjXu4MlCjGKSlRG5rahsmcSqhNCLGeuMagZWLUDVp0ysZnUZ3QhQM9sparMmT8hWyQO4ctLlBGsXXYywbI0uwNU5GX1sFWD5VXMKfdcjSzNcN6SwLSxP/t4Uf/uJL/CRv/wkruuROh625WM5KSqJgZSASXbt1Nz1ub/jhnf+EUF1OyvtNlkRM44LXNciTTJcx0UVsfk4SDhNZVNyCiUhyMJ2XROGLF2g5cZoCYd2mSscea2iyCWU+Whzy/R6LgHX9fH9MseUj1ygtMb2A7S2CPwa6biPQ8bK/f9I1l8mqMgF0Cbfek4Fq3vq+7rotnFqU1ih5I4EvbpKXnGppIqFw6s0drhUNpwHboqVKMJKlbENbpSYMFW4FvZYw1QTPbMDp/BQ8hBWGTdtOSWWXEkbS42AwmyQSmNsV8BEiHxbYrE8hNwgx6+jbRucCTZO7sa26qQqg3odHdsmvxRZH6eImZ60mHviW1x27c8TTu5hkPcYjBWRwQljtAAFCYm5gAIJNSmuAAtHYr6FsjIsJbdMgpGF7WgKbeP4krglN/hmc8qLIgdEErxEbrW+WZbJV1keY1na3B75Oec2TMsBMrc/RGdj8mjIyg/+EmwPtx6YWyo3XDCU1T/5Ta2sGVTom/DhxWNySYzKxer3SNYG+LNNaDTQdoCdpzhRj8JvYHlVlEpx0pgIh8rmnRR2xSRHWXzJFY45KWn50IWNzod4lm1Orjyb5VSx3PIBVGGZU6YlubpVrLzCzNRlWF4Dx69QMDL5wpaNiXMuvXiC+77/Rd72xl9l/6BBxXXpdjp0k9zkOgk1ltIotf5eykFpOf1ljjLLb0vAKhO2yV0C/SyJ6bKAFsqRDZO8IIfLlU9pkrbkHAnArleGObkBjrxWlSHPHC4ktNkGrKAcCsfCSxWvuXYL//hX78RNMopIY4c2XjMkzRVW++A3NVNT5jQTD3BGMVrCkM7IcUlWTlOd2YL2J0yOKcZt7Dwj7Q0IN0xjSSKLM1SjDsEMmdwWPJNgyw+a4lg5eRqbxxF0JUkNuWF2xUBtidUWXrmRkptUwE/uP8wvvP7XwJ1AewqrENhh4eaaWjPm9JNf5Y/f80H2r1kstMbmpi6uLpHnKSqvouW05hlFJgtt/zRZl28mB0b+/P/xS55fNsmzy5fLa+S/tQeevN4TfFGGXvljpfCDgDyXXCO3wjW3Q3JHCX8Lg64EGhuI73goN0IPYqJjX2Vt3wGU5eL6KUG9BhK6kgyre+ZHWn5Q4Xr48YhE2wSuIisS7CQhz8c4Qd3AV80kyo1xep3yNMiVrzXLk1idoggaOAZJCf63cCSGWhlKZTgWFKmgN4nDBbn2cB25TbaEUJQkTEeRU+f3fuNP+a9bvmdir0WNQsX4eczO3TM89cCn+fpH/4WWs5NPfOM7TPs1VsY9ljtLqExCE6g4NYvz/13zMnGYa1EurJx8S25NIcjTbEiJdc2VEBSC7XooyS2Oi++6ZOt1h/kxlm3yRYnCFK5rm79mWQ5JLEneNTVNEAhyBEslJK0lWg//PZkKse3U5LA8Swk2zpBEOVbv9J06dycJlCKVeFtt4g7WKOwc26qhkzFW1qWY3gBrKc5UE6/dJfVtLN9B15sGDRW1DeZKS4gyCEVqAgktAgslDAhYKGJTTdi25AeJybbJJqFTJ7M0yq3z7Ct+llNzbVyvQp4nSAb9jd/9eW76wLt44tZvceUF1/Chz36XWw4fJ8wsFnotom6fLHPMCZOTa2qBc4tfrly5IOZi5FiOfy5dmE2T/ZFTbOLNudtjWVjyjHYO6/lM0KQcIEeKVjl4WYLjyWJLCHMMupKD4AtAyRSFrIGWtCfwX+EkHf7gN9/E7/zOq/AVjE71+PxtT7F33zEuv3wLP3PxeVjtxYe1IAtlS4nn4+V9snxkKlRdaYDOUHaVoLdImsZScGNnMU51EoI62g/J7BA3lHyyfn3ldOoISxZHTleRkyZ9XF8q8LCMxXIYXclbQVkQOlUu2HE9o4E8dIpr5Xz7G5/kZ65u0DlwkNna+Rx+6ij3PrHEZ37wA5TlcWpxjVxuZ6Yp4nR9MddD0v87IP30dxLzJbwZFCGhBsklvqmm5fObXGFuixwqjRXY4HnYUqkL+vItBJXKL0n4Eqrk75QVfLr+9+W1Ca7kRivBsSumsh/1YwZPfIaDT6/ysrd/gF4vxWGAKgJTlxXyWTqtp6SWNPBMqlArWUMPumUVW99EbpBOiJUNsJPUJMFM8khlEtuTqjlF1zeiLd/cAqFezGlEbofG0dFPN8pxQwPxtPbL4sl2UVqSuOLyS15CazUDO+GhR77KrukR1qhPRTt0Wn36Z/p8/Iv38OD8Kqntc+z0YdzCIRvJyfn/34T1D2TykxNaqFReL59Njgb4TkhgkKNmPBhCHFGZ3ETaXzIbbwUuSlKJWyWTzRQ4Lyd+vRA8l0PObYgcQt/3TbHoemV+yVGEeicXbp7kySd+jNZxCSx8twSd6ynNas3/WFt+De1VsNI+jNoEbk4ejSh0iLVhO5ZTgWjNnPiiv4Q/MUuuFF6RkzeaZE7DxFOBrCZXqMQkb9tU0OMyCthVbPk5UpnoAhsf2yt5q5e8+G088djTtNYewEkW6Z2doz57AW5ric7xtonzX7zzEP/2wEPEacHC8io6KsgTKSzL01zmhf/+Zd7TrLskYdvULF4l4NJNG/nNV76YF+3YSZ5FtJZ6VKpVlmPNNw8f5tYnnqY96GCnhiwjHw9lx7BCuUXmpGHZLo5XJmy5HeuJyfBusshyG2RTSggsYU+h7Rppb4w7bJEXFkVFivACrQpsLRusTRi3eov36SyYwS0EnQzxkhFFHJG7Nq7g41SjJ2fRdoZ26lhRBzuP0NUZ3NGIvFEFt2nINdsuTJGo8gRLboqTYuk6Wqpvcwx8bAEQFDie5JGAP/3jv+CDH/ofhMUSSb9PYFdIOkM8rRgsjpnavoG3/uE/sNCDpXaXVrdNMSzDiVTaP60dJAU4kqQlCMlNtbAcC9ezmPA0v3399fzaG17M9FZNNC5wVhXjoTb0z9pam4XumJNpws3H5nni1EmK0Qg/nCDp97BIsCo+yg1xrcLUTYKiymQuAMIp4a3K8SWEZxlKSzhzcB3H3Cwpg6K1Jexc6CAJ0h625AUTOSXxygmysNrzP9J20i+5G38Cy1dkozWcxlYcoQSSPnZ9EzoX3kdOt4MnpHAu1a9PLmHAa5pQY4pKqXwdWSx5vTyAKQ1NnrCl5hD87njlgsYnCPKEfKjwGx7FcIg1zAyvlabQPjniy7ft5ZbH9rM2ilhbbaMi85PKHGAStRRgcnZ1mZeEaxKqBovGhpBrw2nedPUe3vbzL0BvDVBZCqOEbE2TZinpSJHEBWdW11hONd9bbHHH4WN0l89ipzn+1l2M549gh9XykLoSfoThBc8PKGSl19kteVIpIuVqKoSQFPhbFseB7TJaK9GpkIjmdnmOIVEFTGgp/wWb9ufv1ZkACXmw8RAV1ilshVutk+caKx3iCoLIRhSBj8ozGkPNoFHB8ytooRokHAnnU0TmBkjSFOZYCRVjCxQMiIXitkPDYTFcw8k7ROMEx9fYWW64JXecG4iZpDbOXId3fvbrHFvLeXrpJAwLGEmBuV5DGLZVyKJzwVfhWkJdZEzOTHOB16BeV7zvuddz1auegV+vlIcqjUlXMqQUEuIv6sUUhU27O2B1GPNkJ+FLx49x/MR+ClVgpT7Kz3BTn7xSnnihdAxkNnKFhRbqSCpzS45Bie+CQKgVG88T4rFADYZoYTDU0HxuOU+mYHS0XBjzWeREWb2lh7Q1HhO74Kgy/ilkMUOU0gSCNsImqt8yRZ/wMSpdwLY3orzQ1BTKkvzgkhHhytVbJ5Rlc4T+FpRm4nzeRw2XDZQVLcPKJd+U1IpBN+OYpJNS6DrvfP9NnBwr5hf79PttrEijrHUwey5nCIIzsbqE2htci0+87ZW0F84w1xnwyj17uPY5F+LsmsGdCEjbClsOgbAoI2GaY+KB3CyHcT+m3Y843Im5+fg89x19giQa4ikBg1OMx2tYltRdchAECghk1yafIHWX5BKppXQJaqq1iuHOwmqFUWeMivtmQwRGG+gtN0fIW9kQWyBzYRCs1V1+WJMLuvEoBF+jCNLILFSJJyx0WEO1zhpOn6CGZddQvltqD7YQkwLkRaApr6KhQZATG0q2wNEdGHTJrBRf+JwiJR9HOK5kXYG+GUU8wh7YHDy4yns//TWW44KVpQWSvkUeJ2XxeI73/mnGtvC8Ap1Z3HDpNr74m6+j5oy48+4HcaI6V1x7OVuuvQh7KkDHGZYwCqlCRTl2JougyIaiR0AaaQbtASd7CV/cP8dtx08QdVvmaKm0wKtVyEd9nOqEqeZt0UVMmJQIUJKP5XGR/BigC8kxvsmXWXdgEKdwW7JOtqBaeVNZd0eeX5XrLBvSXrhP214Nu9QJyforBGGNTBKYiDZxhCucvVsndeSUutjhNNaohVUpaXDDkBp+qKxsZVMktptiOBvhRIs4EgrltaIa5nILFMq18SQTxxFZb8j8EzG/9KnPkqsaZ9st0pEmHY5+KhaZPCGQU+gZx8GWhB163P7+tzMTD5i9YAutBw/wwFNnuPryy5i5fBvu7s1YSSayCXqcGFFSpE41lv+ATIhMyyUZZ4xafZb7ObedWebLTx9mYf7MOgnq4FQlb3roaIRdcbGERhJE5TnkmdwUWU0Lx3MNGFI6Nvks7cTYJqSt3wCjgspL11mBc7SO2Q2F1Tr7gHZdoScS7LzA6i9BrQ7hFEo0i3hg8khe22pEFCHIjI4Tx7hhBe0Iq7tenQspJ/KruR9K1C8qesjY34BvSbLNifSYqluFNCd2FIEUoUspf/Y3d3D7kTNYueJYd5V8OCIblIXmOcrDFGCiqrgeV26Z4sOveQ57NvhYYcrkNZehV9Y48+h+0ihg+8WXETx7C0ooVAEamTYLUwhfJLxZlJU6iGgkcnMyTT5OObHQ5e4TS3x9bokD80cxFKyc6SxDT0xjd7vkEioDKUyE+HWFjCCoBGW173tYcjt8LdovUU/uUQ8KiShS+wg0XkfrcogFDa4LY0KqWt3lvdqcXF+UNtDDZcMrOZkFjQp6NMLLY4qJCQrLw0sSk6wc0QKqDZQlCKpUyeSdBIG4WZ+038GXxCakp0iejlfWKkViGFR5nYoz7OM93v7nn2N1aBOpxGgYnWGK3UvIDJIq41QZFkRft3nLiy7nPRfvYvc1O8maDssPP8r2l74AdbrNvCCyvstz/vhtZFmHbJziFi5FlBtN3OjsqcYqLHQqWUC4L0F2mNDYWhpx29xZvjHXYe/c01hJbEKRjnPCWp0si0HYZCmifQnhZldMwWsQn2sTGrhdZbi0gCXysiNARyh6n0KQaIl1SybfsM9CyBamULa6Zx/S5g8D0aQlxMRYaozkqlxXUHEH7Xv4ph6ZIV8+UWreBdibtqBcr6Sx5X9y0RUSnHRsFl3eSGChcF6W1MTyPdtm2F3DCX28Mxm33vwkH7//AQrPYWX5FJ0EsrXIAIxCPvg5IhCLK684nw+/4Jm88trdjEcjWmmHxmST2iXbSVd6JEfOMtHcyni6ir2niSOgIUrNTZBNiEYxnnwmOQi5jVpnHhztGVU0jxLaKwPuObbM1xfaPDB3HOKRWUBRG+2oEFcH9igj1wrH99Ch3BR5B8eIZ6L7yOFM+kO0CDKGs5SQJl/PmSIMnVxqL3KgLTkQZS6yuq29urC9UufQHrmQitHAqIZ2cwYtGnXcw3ErhkYxvFcsSSrFqk2Z71tOgRN3110hJRRQSWLirIQboUx0HKNE4UsTiGKykz0+etN3uet0i8B1WRyM6Az6JF1xocjPMIfOPKSdj/jNN72Gd+/ejLehxuqRp7nk8ssZT1ss7DvA+dc/i+jMWWq1aRYOL3HeW34GXAedpSYESs1EXODIoRIIGqd4Wj6jSMuCXyEfFxT9hO7akHuPLvGFE2c5tNpiGA2p+j6jUUQxHOAGIl1LYSp1VVnBE7iGsHSlJpPC1NWka2vmMBpZVm6lI2hUQroFuVdKziahlaWBAUMSslZXHtcGFUjB5CmceIxEK3vUR4d1HIn9YtNxAzJPeJ0GRdSXEh87CLEajVKizROMb0REfVsT5yk1f8LwVK74RaT6zxP02QF5pDh0uMuffvVuep0R7aFsxpAkiilGkWGBBUIKkJ7csoV3PnsPf/TLr2J0coHZXXWWnjpJuGszE1uaZEtr2BuniOaW6fcU2268msFMihf7KHloQVeyCZFIyQ4qzc1GOJkmMxtT3mK7sBmu9Bl0Eh6ZW+KL84scbLfp9UYkwsut9gwdXwiHZfsURt6zsEPPRJBKwzdRwBgbxmOywsYqIkMfiKhmEoeQmcb65GO566hMNsIokSK8aUnq92vblTeQog78wibxHCrDnqk17broHTlOIvFW7C8eGSlxu03zgvNJ4h65jvGskLTICS2XQmUmZwjk8yUEqTFhoUiWO6SdEUceb/GRb32fM3FOPFZ0B0OGSpO0u4Y+EE+XaNk79+zif7/65Vy13cdKUopBRGW2RjEY05yd5LGH9nHda16A6g5MTlCNGlyxmcANzObKQREuSzZAvm9lBTpNKFILN85JxWwhtH2WkY4yss6Y1YUxB9prfH2hyz0L8/RXVygSiX1iaJDKO4ewAuPYbA4BuPVpU09IOI7l8EZDcANzO4WLPJfEpQAufLFN+ThiiypFxVJWlhAviuHa4r2azMEL6+RiIxE/loRuBQMLKmEdNWgb35ROMjK7ILBcsi2b0cnASKKOVuTiXQoqhj09VxyJzqySPkUUoftDRidSltsD/vo/7+Rgd2QS5GBY0I1EKhY0U9IgIm4FFYtHP/YnbJmpYoUFe3/wCDMzNSqVGpUsob5jI5Vmg2Fnje5im+lNmwmvv4DUkyrYIYsiIxiRCqy10Yn4niyDuHSaIgHBSaQescmHEWqY0m4NWV4Z8eDZLp89cZSTc4dRY6esDzxhL6pkwxzPLpVBEePEOmTXQxxx7Dg2aijuMVVyWXLyxfsnzLYU2BKgZG/FoFGIt0B4LSEWJT4LVBX6/fitGi/EdqtGlLIEiXTWjAZAfVqCK7Y4F9OCfreDnp7GOe98wqRPnEXGZSFv5eRSi9jkEtbiltECVJ5ClME4w0oKjtx7nC89epQHDp2kcBSdYZ/hOCMhZLzcKqtuVVCb3cA//9armRwPSdyIQQusUZcXPO8asizFtRUP7t/L8698rjmZ4eQm7Gt2ktgRheUSFIpUpXhSs+SF0deFapfUm4mSJ5aBVOBuYjZM9TLyrhyWHgsrGX93+Cg/eOowViQ1UMkE2IGYIhxj8jDyrCqtQxKNnGqI26iRRT0h0yQkGIbX6EOZQGHhE2WdRFb2RdkyTLLBj3I7RD+S/CIb0jtyq5bddGqTJP02geDoQYSarFHUpnFHXYosNmX+OErwd+3ESyMpIQnFTZF7pFZq8pSrfJzUgaJFrmyTj5w0p7fQZbwS8W/f2cdtx4+SZop+NCYRuBcrVs+umZMmJ2jT+bNcu3EDH3jR1VQnJlg+3eap08d41gU7OT1cZld1IxduqxvjRdoaEzZt7AvOx77sPEOVS13hFzmFhFhBNpnCkfogKwUg3U9xJD+JyU3sOr2EpJ/QXhhwcmmFh/o+Nz36IN2Fs2WekBJAmFy3TNi5WJQkGHu+iRiGZg997NAviVgdUPguTpqa0O1qn0KYckNVWZLLUcKKG/+mcFmyERIZJHTJDZm/X1MM0eOsLPTSMbrVp9g8gRWn5s8c12Ms8bM+RSUfkGZSRWhsR36QWHIEh4s2HOPmAivXhDAhTRK8pODEj0/RWR7yoW/fT0tiuLYZDgdmU0edhHgksLD8ma+47gpetnsne2YDkthm35GDBIOIqy7YzLOuu4bWmRW6vdNsnZ0hCJoEV1+MvmIHrsRnFRs4a2WCgqQ0F5QjdVHJPTGKcSJtQrMx4DkKHWmSxTEPP3mGWxd73HngAGcWl7Ek+a9TNYKCpPpOhXM75+sSXuucLCxFoO1gub6x1coBl/BltCwxe1jCTkjcKytCU1MJAls3R5iQJTslX4bzj+jMF+VPTlMHW2J4NiILm8Yiaq2uMR60Cc/bbqhriaeOJBgrNBnJ2HLcCEeL9hFSjNrkUW5+r9dSKsrn3nse4W/v2Es3sRkXmiTr0RlK4oe1M71z4ZPLr7yIaO0073vxi7louspd7Zj9jz7MH1//MsKpjFFWo6lWcGoVmonFxO6LKV55MfQiYy0S6VclIn25pLbGszPSVM5ihttXRE92eOTxo+y+eAfTl1axgyq5JOnFET+45zC/8d17GPXH5WYaAGPhTW/lwudcz6E7v2moECPVjiM88VT5AWk8Np9fTOaioBriUG6N3MdCYHVpOdKJyL8CgdNyo4whXJiC/zaEm1zVaj2o3TTBksVWDrrmky8vUp3ayGjcZkp4ng0zpLkgGfnLfultEsVMiWvQxZHTnUSl9VSq1dEQ3UuZO3iGQNvc+tASX3vkPpLCJYkzxnmCTZfl1TrZeEQeap6xYwdxtMaOmQ08d9MMs7UJPnrHD3jPdbu5aLJJ6IVE2uLC2ZDJXFOvbWX6Xc8nCSt4UmVbGa6EZgMhE1NJ22MYHF7jrvuP8YlvfRfdnGUi9PmV8zfyptc/D85zjUMyPdni+PcXeM6Xbi5zyjkq3HJobjyfG191I+M04Pu3fg30CCvLyMcx4URAPhIHjcL2bJRs2LpRWyh5ufViXzLrmpYRRVCfcGBmndYdSvJVVBPJxVbr7I+0N04MfIvXVnE3b8W3hDJpo5SNVa+R2xILEyLXM04PaQEQcsyxDdWHo3KiTsdwXZV6g8HaEt5SyjhN+dcvP8T35k+SjHIGaY4e9gwaWykU/blV8kaFScfm0p2bGI77nF9v8IpLLuZLBw7QWRvz16+8mnrQ5Ds/OcC1Fza4fMc2nHGXTS99AVy1C6syQeg0iFVCpbdAcmKFfM3h63c9yk13PcyZTIxuCROhy+XbNnB9ZZY3PO98Nl+5GXfbJLrpYXUikn1tXvSxz3HwTN/IqqZIsy1e8eZf4v7v30GWeySZmBJinIpH1uqI1dK0O4jQlIvAUnOxlI8rLRxS48gNkPwr4ShxRHRCC6cl1vZzOo4vt0lonNKWanVXHtQMu2RBSNUOyTqt0sBcc1BWiG4ITheuS1Q+uWmeQUJi/JJCTzakSCLGoz5NucJ5hN/NGa4Nuf0r+7h/cZGjax0ipYnELGdpEnvI/OkCe2qGrXaK3QgZtFfYfd75TNlD0kRx18GTvPcVL8RZPkJeTHN0dJa/fNWNnJw/g9tzeOan3oKnJykmGthrHRZ+coKvfOkBHktsji6u0B/3Ga6t8JLrr+OSSshsXvCMmSbnb55my+6NODsrOFMWaXXSGKHT02c5fPsSL/zU54y7xASVSpVrr3gWQTXk4SNHyLoYGsibAAAgAElEQVTL2HlSQn1TTJcmciuQtYhwxJsg59yScCfsuZjzM9NuIZqLFhxsFUaWENqmXE7HOCGN/0A2ZG3xEW33V0mGbfxaA+rNknPqxVg7tqLikUEnroLC9wxsdP3SAyVfs2EftPBfKaFTwUldsm6Pp354lK8+/jT7ji4L6Ul7KHYXEWQcYkuzcPgUv3jjC7AqVX7wxMPM1mYZD1pcvnUD+xbO0E1DPnrdM2jnfU4stnnBMy6l0V+hlYx5w/veTXXPJLFbwzqyxN2ffpB5S3Pb3DFOrCzz4kvO48ZLr+DAiWWeWDrFDkvzkp07mZ2Z4KJLNtLYPUVUd7EaOYhldaJBuDwkPtrijR/5Gg8cOm4c9xJedj/zavSox0qiSEcjpjdvNvB0fvUMerVH7ius0MZVLpkobm6A74XGn6yTHEeck74yxWjZiCOclWeM6KYQFClJ7oh4EUS2WDv7hPZUB52OjHgvFIe8XASorFHDWhvgzjaMT0ukSBFnjImgEDIuwkpTAoF8wxGhVycdR5x6aJ7/+PaPuL/XM868cSoOSEl2LnE8ZK2LcUh+6Vdfzv/+4Y84cmqZ8zfOsGU65NhSm8i2ucANeM2OCZZUzKHlMe9/2Q30l1Y4MbfKL37x18ntTdQPnubmj32HbEONl73++UwWNmm3xx1PrPKH//V5bnj+K9gQh+xoOlzqN3nmRSE7nnMRyXWbsXtj7FRIkRy7WiGgYW5J5cSILe/6GH1HEJph5Thv927efNW1pMmYigujYc7tJ+Y4uXDauDGl1cGWnCrgQQwdQsfIIbYCtNBBKsYRAVAYDLMhPkoKaXHo6BTfEZm3bI2wWp0T2s6HWJGs0hh73BOpgmL7LKEgBlt2O8WtBCZ5SdKTjiNPp6RSDcs11AWTuPTHMSf2HeXokRZfumMvHbn3jmIwFgefAIEcW+fs39/n/N3bee/uC/nTBx9hKnSY8D26cU69qjm0POCXrtlDLRmwkKRMWw4zFc1slvKuD76X6IqNfOtNH+bn3/rzNJ59AXHaQ58cs7Za5zUf/CAX3vAy9h9d5ezCfpQdi9ePad/hppe8mBvfch3Bi3ajx6mpG8glHEvtUEX3B1SOdzj80ArP+7tPG/+YLLbQFm998Y28Y8/5RuQ7s9rj8/Onme/0aJ05aaB1IVS8dIWJBUjqIMcnCBuofpc8kw4quSUCgqQQdHCkGDRmEUn2pXNScrC1tvywdgQRxGsmlmnPxQ8qjMXLWoxNyW8Mq+J8F4FKWthE9UpjI9RKQhdhKxoMiNci2icG/HDvYb771AlGQjhqZXQOaaAL7AhlN3n60DL/83WvYKru8Nd3/5CLNkyRZTmd1WUGVsB4POSdz9rOiCpHzi7wsxefT9EZsO/ISb5wzyfRc2vYUyGqWSE4E5PsP8OX9h3jvMsu5u5jbf7p379iVMk9V13KJ9/3LtYen6dYG1Dtz/Oi33g+aoOonmLiSHCEgBRqxXJxZqbhwDzJXIc3/vV/8MPjLdOhVZ4rxU2//g6umqiwNIr52tE5bj9+nMFQ+Lkhdi008BqvRi5ydCU0qEqYbSuzDc8n1btx3hu6pMARDtGw7MJyCN0iG9Lap60iI1s4TKVWw8FntKFOmPbROkQFYnZIjBIoyMCVH2zKyoIkGVCkOctHTzJTn8KJLQ49ucKdDz3F/vaYXjakP+wanF5on2edN8OX7z7I1os2cePkBlb9gr3Hj7N9epJjp1psnAw5eGrAG597AUXU5kwr4sLN29ge5AzbMR//1w+Q1TKcsSaPI4Jewej4gI/fchfXvPKV/O7n/ove2UOmAFaqxod/5y285bW7+dIX97Gzr7hqW8DmZ27Fu2ojTuCREq1DUTnVGqdepdAO6dEzqKe67Hz/3xs/ldAxcvhsnfGN9/w2aXvE3e0utx3eTzu3Gc7PlWWAZ+F7FbPIcnSNAUJ6UqRQNSy/GOhE+5DUX6I4o3RLUhcQIMl/bfFx7WQ9lB6Rt3s405M40ocnsqUtVKYUm+IlEr+th/EMSbQcS10iXxOcrGC8FtE92eHeBw9wop1zqCUilGec5dO1Kna/wzWX7OF/3Xonz96yiemJkLmlEX6ticrG9PsdCOssnF7l5Zc18LxJVtprnLdhlpl+l2rd4/f/84+w2wqvX1AMEsane5x4+iz6iqt5yR98jGoVxoO+abSp5BmPfPrT/F+f/xe2Cxvbnud/vvAGpi7fgHPlLNqV252hTOuAkMsurixcGKJ6I3i6zT33nOAXvvAfRscoYbDi91/xc7xw8wz3nV3g1iMnmc8zxvOnDWVrVcWNKK1vkmdFzLFFlRDBmFxCkp2ZwlVIz0IsVobvKuVcYXRFXTQ3xB6tQLdHHgaEU5NY6zKrGMnE6W2cJZKYUk0uD6FSKloT9/v4lk+IxelDZ6W9hENPL3Cw0+PBA4e4IGyYbqZt23dx1a7tfPHHj3K6F7G1WWci1LRjl4PzCxTZgJoX0IkSrty2le3+kKNphe1BSE33uXLN593f/iMikQFaI/J+gr8a0TnV4UdPjXn7d79DaGdcedGFfOuD76Td6vIvtx/kvKaHGo642Fds3raBHc/ehbslIJ8uVT5htUXZFESl0gxfNkeYB6kfTnaw5gfc8sAJ3nPPo6RLJ7BU2fb8v97+ZsYLZ7lrscWx3hpJu216DIWtFn+09qT2EbpFoFqpwQixKcjLCFNGyjaUrGn4UXLIXSlIXaze/L1axWNUKh5cl6zpmY4oaagUZ6L8NVvIOemDEKO0KHBZhETMURHTP93B0y7D0x3CyjR33PUwC/0h4XSd9qDNrukNrB1f5dqrLuG3//MWyG1+4YYXs+/wk/z4xAIBIVMTNmmqCXyfyxsicAkbENCc9tkdad75u2/De84sXqZMwWWPUvJegdXTFH1NY2eTB/eeYGdQZePFFZ7eu8pwfsjWpk1lU5PGzATObBU2+DDhURhrf+lBM5sh/efGwSMtBEJ0eyb2q0M97OWIx48MeesP7mJx/pQpiMWiunXDJhobN3GytUbUbhneTzZXekKEd88kxPkBtghzoYcTrfcdSieZNNQJuSnrui7mar/sOrNa8w/oQtzt7iTO8AnyQCCgGKWlubLEx0Z2VCV5GNiiNQwM0ym2qjBzGXQGrCx0GawJlxSy79gJNjQrzC0uoupitvPZUnH487v20gzqXDHd5HCnxyNz82ycCvDCClE/5YrmBEFtlWSwmfOmVtnhTvMrr/05/F+9gmZfeDORYHMRaYzz3YSa0DcmtTQZ4kn3VzcmXRsTeA2DapzJAF0pdX+pm4rQgtAzhgbjXpdvSNtbJK4bUT7BnayRyd9dK1DDMfrQKu/+/lPc/MBDP+W4JNI4nm8EvLzXM8YHI+uKU17sPL5bGgFDbTQYCkkBEtnEQy1NSqKll+ykyVDG/mpLw859WleqWFTIrbNUEuk0lF4Lt7SnCOcvSEruilwtAQBxQqAdWmfXoJ/QrE2wdGqFTj9jaWGVrRfuItIZjdjhyIHHmZmZ5fannubOuTXGhcWuDTlH5rtkYrW0HXzP5qJmk62TFXw7wo5dVDfjt978Yq5490vIMvFTGfK8bOuoNHFkgIAQmCYhCuobmw0TlkKckBRC6GVmocQrJVKyElbWD41HVxpmCvEaFDmeGB5GsXHZp+TGvODMbiRZWsRtjaGd8bv/dDf//vBPTG0iWnrZUu1jVwP0KDU/x0jBRkaw0E0HK0rxJhuoSFoyynYNQX+mIVm7uOvkolAw2tRpoqm392m3kI5Y4W/aOCLmOIpUuozKNqH12AjxsG9c6XZaGA9TPoC4PyJPchrhtNm8ffsO8vTccaaaU0z6FhftuZBR2+F//PNnOTsOuWTHJqx4wJHVkaFcZiYttlQnaLqwuVZnSWuePHiKL7zt9TznT15eTlYobLI8Mm3M0g5taGsxP5tBAdKRPzKsrcBxE15lJEYmNzpDIL2QeYaFrYtrXVyHclJtcpnMIJsn/SKpeCwF3mtUxSG3A9xOB2dxRHI84vy/+ZSxnYoPTaRbQ6+Lh7dWE2aTTJgIuW5CfwQeticdYy7uRIWiJXq8j1TXQjIat/v6L9HnxWemsqSs3Lutx7SpL6T5RS/gK3GWiiPPNySiL1S0EoktF5ufsUjGvQGuKFK9oekvH62NGPZ6HDl+hi0bNnPpMy7n69+4lTDwmbE9/tett7OSO+RenT0bFec1ZnnodMQMPTZtqbK80GdyZgNHBkPmjuW88soL+dzfvBF3a0Na0I2vydhTTfuwcEJCboqLXtyPNSw5dbL4Rj7O0amYC7RxKpaajRg1UnSzYjY3F/ekmLvltgks1Tbu2CINZNKDRou2f9bFjXKGnQFvv/UO7tp7GAoPVzbX+K9kLEtg6jYvaBCvLJUdvUVRClQViS4uXq1G1u6IpRNl+thytPh5RT2TUGlqPGGByxxmDVt7dWr666Rh/rRBEnKnfCEKhRSOJWkbVxVRNMZ3PJLBkPHKqOxTFykyLYiHKTt2bOf00bPGUdFaaBPg8Mk7vsedB0/TjeCZV+xmZ7RKx5O2BDi/VudMxyVq9Hhw3yKFb3HBrt189sXXcvUvXoXa5JuxF/KZRTaVKlgJuSk3RT6b8J5WvWRVdY4rncNZgiu3Wg6ZUDviYLd80+Ic5Sm+JT3jcsbKnKFEo5Az54Jvp9z29WP81oc/w32feB+XnLeVX/3Tf+Arh07hmUZYz9hqlcxVMQK5hVML8SoTxEuLpeFaVEi/bHMT52fQaJC2O4a/UqGCoQzgEQuQCFimOb+UbuX1wmX11vZrYzrWI/yiV/YACoUiwnyWYdmpSXjSuDlqrxnfby4THtZGNGp1ErF8pooskYcNOH7sDLOzDWabm/j2bXdz81NH6BSag3OrvP6ZF/OMDRUeP7XG5sk6y47Lj56eM/ahamUjQWhzYWOWd1+xi+e/eg/ZhXUTnnyrFJwkF0jcN1zQeheTkvkohdwcj8IWa39qOCrbMLEySkPMBhLvS+dgLrc8zUy7hPFoybCEJMKxIqy7V/iZv/gs9/3oI2A3OPT5+5krYl77vGt4xce/Quy7vPTinWaDD7R6PLWwzJL00th14vk5c0CMg8QucH3f2KQEAmftoVl4adCxzBCJclqR1GjmphvS1ULJ99utp7UUMNLOZqmu+aaU8KadXk5XMTZQN0kTauIiGYldyDItZautLpOVGonInVFsKtDlsx2mmjUaTsAHPnczjy+uMswVF09s4uJNiq1FwAv37OaCn30ON33tXtTiCmfHEdn0NH7qcqq7xo3bN/LLb7iB8KIpiqoq28cEbppWZXFwiEdAYrIka6GwxbJaWW9hE61B4ndp3THNnIk8j8YzvinpRciMnm6gvDDXhYO9MmR86BT+ZeejLt+C0+lw8j8fY8t1l1LxFY98+1H+68yY08OIzYFNtyhYjhKeXGyb94rOzJmJEcbOUyR4prPMM81KVjcqnYtioDWo1UbJoJl1SVeiV6kHSw5Z3qul1008QtJEI80rIoVauYwpsoxVR3TiLEmoas+YjlPpH4wFIWrypGDx7DLbJieNscAwnCrj3nv38vE79tKshfhDl82bq7xhssHzfvUlWKOEys/ewD+/55M8a6LJfXPH2LbnYq6anOBHZ9t0xwN+7SXXoiZtqhdNGZgq9YLriXVOMIx0xYqWLL3totuURgTjL5PeEynGDJUamzAgB0pQojGiSYwX75S2DGqUtgIz06SQxqGCbMI3bRK29gkP9fjBZ77BdX/+JqyW4pZ/eZDH+z1OjkZY9QZnlpeZG8YIKOqfPGbUU5leIYvrNeoU+RgraKKHUuNpCrHaSsuH8FjiTjGIu2zUQZWfw2qdfVA7eYRXD3HTAbFQ63KCDJwUZ0ZsnOpm+IVAvsSmG3doKBnIBbnxOWni4Yj6RMN8Tcfwnvd/jDM6YLU75lUbt7F9yySXNavc8ME34ywV3PH3Xyb0q2zetYNoMMYa9JjdUcfzZ7h13wHe/NLrae6YxpsJiRvSNbPeMeUJMSc6vmMOkdH4RTCQDi6ZW2JGEHmGnhDK37gFjStQNG65OYmp0KVh1BDV4qUyqElgsGUMHcbRLvL0SNH5zkFmLtpObWONmz/zEF9dWGY5izgzHtMfrhJnNvXJKXrHjq1Pfyjb7MTzbAcyeULWSIbelENpzs3hEltQuSHrXctibTVNn73DWipGna2KhmsGjZnxEK6MjUgMlSwgR8zPcTQmsHziKGa4MqJW980pW+322bJxI2k/NjTK8kKX3/rUv7FaxKwswu8982Kaobgfx9xw/XX88/d+yC9NTVC97Fl0eqt4UcGWzTMEN+xhPN/iyOMnuPyyiwh3Ns3DOVuaZsSRORW+LJagIdcIXybcipUGxxiixQ+WC3MrnVuyOeu8khCoroyKKmJjCxJ4bH5O4JOZnnQZnlZ2z5reFYkOFZfgJ2fRe0fc9sjj/OvcIj9ePV0OAbCkC7igqNZozszQP3WshMLSzGM6czXeZI28X4apQjqGTU+78Fci/JaTJsQ0IS3ppktADn1r/j4tvSBuvIyVt8nlqIhjXTC2aSyxGMcJFSPe5wYBj3pD04WEGAsqFfJhSsOvkFg5fmzxf/7p29z8xJNm5FM7b/C6TXB9fZpd2uNYaPG6N7+C47f+mCf7XXZPV9j9wuupTgX0k5jGeZvpPThH9fwpg+xMX6N0U1fc8mEFZkr3q1xzCVOiJRhYr0oj27lxgI5MlRDjs7F7mwU3vmOBEOLtld2VdmWB02JSEwXPt0wbmz/ZxKYKT7SJv32UuZPH+KN9j/HIqF+OpWpOU21O4oQFqzLszVXGdywbQuCY0YUSaKxa3figxXEit9OEUjHPCcUhUFyVbdPm0zvKHBKrt3i/NjZH6QfsLpipbibuBp5581SMw2a0kaJer9JtdQlt6Z8bGzNcOhoTug61ap1+b42iVfDHn72ZY+OU7lAxTtb4ncuu42irxXU7t/KO972Zkzffw6HeGpNDlwuft5HGNZfiP9FhdYNL2KwTNlzyIEZLi7gWi79HUdHlEBihJOQJXFn8ch6JFGqSskXdE0ObcZOfG/ckIch06pbhq7zx5QKJ5VW8AakMTZDnlil34tdqzjJ+8jjLNx3i4bkTfP70k+zxq/zZi15rLKrv3Hsv+6MIf7rOWruHH1jkSy0DMsyUJ2MW11hSNCaxCenl4IjyVhrOSdh041o8N89GmUNmtVsPa201sXQfzhxcv/LaxGTRg5UYjUWQkqmAo4RGpUoqA1XwiNOEuJcQhiJeSTzM6Zwd8K7P/DtzmcJPHS6fDYlVyN1zK9STiA9cdznP2XOJIeqe9+wrsYoqky/cQqfVo1lpkJ1fIz/Vwt1QI88K/Nwiln5EoTMEYcnBXh+zlxs3uXRmCeo91/9aUhvnTG5iyzGuSFkMGZomi2ZGgJgJkGVfu3xPTCEyqNNV5A+t8c2PfINH5k/zBy99NRsroJqTBJnN4rFDvHPf4zzEGD+YYpTEhKFDsrRkyEVkcoOwU+c2ZDimSESUEofietOq2INMd1Q5zc50+5pWcnGdrD5mdEChJNT+B+mPekxv2GiQjfR42IX088HKygpVmfajFJ1+n20bNzN/8jTVet3QF/XQ4dTCIoceO81f3/cwa3FBza7wmgsv4DOPP87mCSH7UppFyp7ZHfztL78Bu5HQf/IQG954A+mOBmaihB1jd2PDCliZICsPq5dTCF8lx15c7hVJvuX0A3GRS9+7oS0kUohlSWDw+swqic/rPfkmd8gwDUP+ySH2XfLBmDwv8EJptAkZfuc0f/Xnn+Vv3/F7DGoWcdQzRObw6Bz1aoOT4x5/ePw4e8cdimRsppp6FY9i6TjKDEOQsRrS0qzJ5TAMx+V0PWF0zg23MeYhuaEiUJW5zkx1MEa5s/doKbQoQpqBy8pPfkjQrJHolGajQSJspzQOBVUSMcMJ1yOoJVNE5BT9EYFfZW1thR07dvDRP/8it51Z4sy4xzO27eSluy/gU7f/mOnZabZVHZpuBTdtc/v+Pt/4yK9z2VKH6u+/lHE9pJlERNKf51jEto3/5CKqUTH+X/ySXJTBL9I4mlc8MxzTGNyNFVNoC5kdUrYZy/X/aXz+6UKUY/3MjD6pC8SPJtR7XJB2FN3bj5HnFs0X7qG2YwPJsQXiIwPq+xfohrBvnPKT9hJLDY/vHj9IIk0+MnFVfuTZM2i/asZ3CChyA5dCTv14bLguWXzXjGtan1RaWknWjQ7KAKeyLXrpUa2kSvVnDAHmiBp4+iBOr2WwvxeU6MUYhZWErcwMVjGVuUmYNr1+l8AJ8XybT/zZl/nPk6dJLc3Ln3kVF1U9bnrgUXZvaHD1rl30hymnlle5b6WNN0i49sJpvvOTfyNLOmaulpl3RUZlVLDvw9/lrsf38t6PvAcmtOGNjGYgdUfFJjVzQspxfGbxTcIsex1leKUUkyZhrk/5+SmhJxBUahBBYJ0hB77yEBc/7zoqu2bQYgmVoQlzZ8hP9fHaGT+6/ynuHC2b1ugXXrCdfSeOMQimuOvUKQ6sRqbAtGQsoisaiPi0xJ9l7AymZJBWOfnM5k/KaW0l+FgPpaYAX08m1lprvzYSowyQUR2sWJGL3pCv4BQWkRiPszGeuPN0gSvknK1xY9M2b7pXxf4ibLGdO/zdx77ALWd6+OmQNzzz2diimy8tstkL2RzWSQvFg8stHl9ZkxHGpqt30HXY1sy5/NJn8NrXXs+VncN85KZv0LAb/MPnP2Q8skXFw254Rp41pJy7riesd7BKDjPWG8c16p15/nMkpGnUWO/1k9u9LiuYOiUSmiNAT9VNlS1FnDybCEr5OKd3uMfvf/G7XNSo8xs/cwX1zXXcwOPEyT7//vgxbj50jHacYy/Po8SsLgWo0DHZkML1TSQxDaaFCFTrFlJTG0nfyXoHrmyIZBOp4nur92utG4Y5lT4KN4soWmdwNu0AZxLl1CFrQ1dmf2ToUBKrjR3USTotxssLNAKBdzHhpg383q98iPs7Gc/dtoU3P+dqDs6foTXoUwkDM6ek4tf58sH9LCYulaIgCF2Wu9LkAml/bELJQ5/4ABdeI5O0PUNQpk6Gvb+NO9VETYlxQJZePoNTdvMaXF823ruGllh3mZt5VWUiNR2vhh0vQ5mohIYLlJpEShwZmSGUUWGRCpQdauylMYcfO85KVPDsy7Zh757CGyryXsJgxeLbjz3NJw8cYrEzRK2tUJg6JsWpNimyEbbjlyNnpTXCQHOhogSUSC9/SecI6JBh0cIiyPtbrZXHzQAzicEyq4ReG1d3yJ0p0xUkHVBudRPZuEOuhviZFGIO2dT5OOFWcmuIK6GDPt5oyFtu/BWORAWvuvgC3nDdlaZh5eT8ohnXvdzqsdod8vB4xGLqmB6KJEmoT2zg8ELHzMcS6v9Fl27n6x/5ZZgKYaZiahH52WohxZYyux4a+CunzHBTEgXk+ju22RCjV0goWx9eaRwg5/r019sBhMsyOcmMQBdrbJl4bXFmSivaMDWNPMkgIZjy0fXQJOC0l+AnBStzEXccOs1NTx9mbqVDtnIWx9yQwswYtn0ZxiOajIhPmaHWBYq6ubT8KfNZJVSZEYMl3Viarbutn2gt3U/S4xXY5O4Ergx8jOeRMkpoFdMxZGRGeQgpxgJ0MIkOC3Qvxq7UTaeVSKUffe37eXDpFFfOzvB7r3s5M9edxwP/cY9xlxw4dZIDx49Dcwt3rfXwC8V4MKDanObIkZPUJjYw6LQRz1n7Kx9CbQpQDdvMCzZQVabGzUdYVWnj9kyPuKlF1sORwFupMaRpR2ZQCTNscL8wxQKrJMzl4h5cbx+Tm7M+xFI2Vp5R8qTZZCks5Xvmdsmt8owoVwyk4ypitKS4/eg8f/XIQ6wOoFg9TS6SrhjgfJkIJO0WQqlLKCrnQBquSiyjZp5RKXCd09TN55QQ1lm4R4vwY+zwVmBoYIFglrC3utxlR1p6x2LADgmlddokIMhrIZxexJ6dwWpMYeuC33zhW9m8ZRd+mvLet7wM9cwtzH/vKVbnlxkmitV+zJF2h++viifYYTDoGmfjYCwjt+sU/cjA1FvfcSPXvfFaw5oWollUfDOJwRoXpC2Zp+WRNQSHiJu8pE8MJ2V6M0RiLeO1UWllOp4MIxOYLNSIjKI6l3blJhkHfxnOTB6RmyX1jbTriSwrXVhaIGyO6owYz/dZWYj5ysGT/OO+hxlHFrl4nGWKkgxnrsnkIXkOhZuWc03KxtH/VgrLvvVzI9UlyZcQ2OqcfUDbRb/cMyc0zKmrA/JCBq9Iz4OLNRia1rRMRtZNNsnDBr5U76bDNTKjOLRbx65M8Y9v/x1e86pX8ZWbv8HbX/0sJq7YyRPffphhb0C3H1GpTvDQqVN8Z6FrTGWJzmmv9XD9STq9ZYJqg6Tf4g9e/Rre9/pnUN3WIJcQFbpY4sAXXWick5+WCdFAQ+Bl2YRvZhzKZzYE43/PcS/zy/oMRUPIiItwPcGalrKyVjE8luygpB4zFamUIYTS0ElBvhqjxZR9NuPo6pBPPPQ0Pzx9mGh1tXQjyqdwNH5zouyvlFybKPOM5t8IEG+0mewkCb3smCqvtyT38jZb3dM/0AQVkxfEcSe6tCWQUSb6J4OStJMzaEbGJviVSdNdZWdjEyuN6hWvYDW3YfuzLN59KxubNf7tn77JtTu3sPsNVzB362M89vQpJhyXhbUeB5dbfO3UKjPTG+lHI1Px9ouYwUqPiS2bGS4vsXvXLPf+9mtwzpuErQ2UmNA8mepm44naJp29Z4VTK+cmihAktYcv/fQG5grVItBShiIb7FOOOBd6hHKmvCh6IheaCtuUMsJ9lZW7VPRmgUXnNm16MfZywfBMnwMH5tnbSfnQ3XeaITZWkpi+QVlt7WvcSl1mP5QqYTSkIMSWxRZRTP5P3kcK358OXysPg/kMa8t3a9edJpG+OKZYp5cAACAASURBVBFsVGoqTIGWdjoyP1za4zzpGhI1zvx7IUJlSN6QEUSuaUmQaQ3O5B6sYo3ozEO8/uc+wFf+9gNMX7aBI/c9xS23Psz1s9P88PAcbZ1z2+lFxkWA58m/WlAwlhkqUU59y0Z6vRY7N2/lkff8HGpzHWe2gr2hYk5tJv/Wiah/8s9EyK0dpHCmiy2NOTIHXsY9GZzvmX+zw/QRSjiQjXHLCaaG3pBDJ8NsfFEaRVZd58eMzFBSKbmyCP7vps4zzK6zPNf3WnuvXWfv6U2jkWTJsiQX3DGuYBts0xPHFJOQOBCIwUku4JBCDiX1XCHHQCCEQDhAyAHT7GAbjBN3WbbcZfU6ve/Zva1ezvV+a5wT/vDPmpm11ve95Xnux9FIeiLq8HCWOzzxwiL/ePRVjpaqNOfXZQclJcMGhzMgIS8OaXS5CENdedYFLOA5ookW82gY72dk56/u5Y2t4UZlqLXWD0V+mCZIuyQFMNZYjX+h3kH0homXTpPI9kK3pOxfAv0VwZx4MwQyID2IaF5lwZMqbMZOOpx5aC9//tkv8plbbuaC916JdabGn33jHj5+9ZX8+JWDGLl+9q4uMVNxMLSQbhThtoVblSHTkyeZ9JkcHGHvn9xGYmc+5uJKJEZGRNJGzFHRM0oRI2rA0HZI1j0S6zadSlexSPBldGHQI5ViToZ+MRnbT0p8RIpUTi5eDWQjKYsu+fuJvFNVbFKpBQr54dk6rm0RLHZ48KUqf7xvP63FqbhElWZHtLriKFPiuwSprGgRfNLZXvXfcs2mmkYnJaeka5JMq2Gc2ljKg1EZJBuluDq6GtUDURBllbYUAXSlhWkSkW7VVG9Cug9PMONWk9CuqaMtyo2QssWCbKuzUssMqf+wgqikx3nizg+x+errWTt8nDe85XIMC7723V9w6TnjvLBYZqpa43C5wlIjxi+ZrmCaAkKhZPsumwf7uH18lP9x6+tIXbELqzcgF6aVDjfMyh9XShARGsTuXRErJExPzaW0tk/YcAhbvuoXxMRZr7cRIUc+k1eecUO4JDlDPYhcUiPIyxUVT5GTGYGPSZ8iXBaPZtXh/qkF7t57gNJiSYmlNTHciM5LvjpZkouGTSrPhBQLatyGkS0qmIIwi1X5KzQkSwTYGxPfjSZRabVUASJ3iqx7y8ciETJEbketFz1jMCb7eHUM38KvlNWnTq6fyGqQyBTx5VLMj6IbPQQyCdZaJJS6QyQ2aRYf/AWDGYPH73ueD37jD6ne+zL3P70XJ0zQjlxemV6hZIUcqVnqhxZxpdiT5XwfHB/nvILGA598H07gkhorEEzmVDMVw9c1gVMhMU1qYitUnji6h0BGFJZL1PGVukOABX7dwm+6ytK8Vumq/cVTiyv84tQJeowMhWSS3v4cUx2T1UUZarq4nuSLBFgSThBllCw0EwmxZYNqJ2zlhEQUCREoJj1kZNMi3biWxJDiQ0IFPBE3pBV0wU+l8DvtDbCOlOsbzapqcv9b9dWYezginQO/o/JC9N4hIpXdIUZ5SSiwiEw5riRdxyfM9Sjmu0ACokxfjK0IbEVOSMpkNN2D1q3C2gxP/p+9ZCcG0E0fu93lyOo8bb/Iy7NTyo9xsGbS7no4sjPwNFWnFzcP85aeiH++672kxnNqwZQcKOKLkk688ko6K7t0eStFGSOjCQ/Dl42mRY4EjuixhLtre7gN4cYn1Zo4tCOsepeO5+M5kgyUptas8PJqix8trHHkzAy+4JxU0oHgAaTiEua7zCAFeRiQSfXhuiWSoreKZH+fJYXHttEebn/r2/j7H/9KLcREvyeEJTHuuO0qZAdx6mU0WVbJC7/RP8l9FZsTNjJKanO/iILcGCkV7+AQpGVp0IueGFQeB6miBfyly6ZNJqmmRD8IJDNHZMj8SwwUNog8yGkSpUIy2jCZ6WdoAf/wsb/kjW+9hnwpxbTp8q/HT7JjoJepuRkOldp0bFHWu+JxU/iKVCLFmT9+D4mRNKmhHGHWoOt55HeMKNyTaGYDNSMRv8rGsM6NH4jsyVWV6MQluaKqmpLqFSpJqar9xS/uJ9Sox+/UmJ5zeWRxhXsXpjgzv4wnEAOZicnRlUqS7+1Rszzxf2wbn+TowUNs2zNGmhSbB8Y5sTrP2ZPDfOq6S/jRY09y35El0rl+fL9DIZehI7+a6ZJI9eJU62iBWNzikc5rlVU8AY3FgFqjciQSt62S2EgEkcDL7A5+73jMcgpF3pNQ855ATIv1dZLSEBpDSjAmzY9iygVdlRyQShZi3m/jDFGml+azR7DW2qwuTnF6bp6fzHhUfYu+epmFRJHlcju2IQcRySDguc+8l8nhHCnZtqU1oj4DP8iTGE8R9aXiTWBavmBBtibVOS98FqVAFK6KI6MPodXJAE8nyMoDkJdNhA46QdslYWq0V2s0Sh1OL6/wi7WQ+468SLchR1XM0ZUh5si2bdTq62yZHOCNk5P89Ln9/OFv387dX/8ZxW19bMv1UrUddm0d4/sfeBP/+6fP8p2jxzCSPaQ0j91btrBQmcN2DartAFOs1GrUs3GPvDbGUbd+zMPX6rVplZemRS66JVsv2TdYaOmh2LariYSlEEs4EfeS4JhEndev9FJSniimhzw4gWVqORw5N+1VqalJFlI8+5UHef3OXdhuyO/e8wgLQtGurNO2PWrdlIroy6V8nv3oB9i8SSMxmFaTUrG5Gf15Un0G1nwN49IdhMX0RqyeKMg1pd9VSwC5PwRGKep4K75TpMvzkxpGRla0GUWNSzQ9wnaAVWqzONvgxdU1fjK/wv6TR4mcmEQki6/tu7dSbbfpzWe5/pw9XLytyHTF558feRLaHplNBSZ7CsxXVvjkLTdx1807+PT39/PU1BSWG7B9oI+03mL31u08dHSRetvDa7ZVSS0vYIyrj1e5r00VVB9Srx+LpH7XvBah1ySVGVESlkhCutSAsgZ6Xt1Auprx6LgCrpRFkXhYZfcQJJX1TZfUHIErh0mMzgr+3DT+wCCZXo3nv/rv7Cj089ixeb43vczMko3jtWh0fG7dvpn/ddMVFBMhyeEcejFF0JtTF2l7dZXMJZMYnkFrsUT+uu1Eku4jo5BA8BlxMoLoe6UXkXmXZmuqkRXslFIv5uPkm5Q4YTsBTt2kOVXlZKnF3sVlHlxcYnFmBccWU6bOQLGP3WcNMtPqMtSbY8fwKA/tfZJ0zyiuEJEUuK2Xs7cNs3TyNF/8nVt539t28/a/upeSQDJdndHeFBO5JFouwTNT67TcCK/aVXZyGf8rsrVsPTf6D+Vhl96yXHkp0uwyRr1KYProA31gl9BHLsGXbtWQtBr5/GVAVlGisECzSOlJHKkmtFFlDVOCYUQpqIPQC9oNkklP5Q76hQIP/9W3uKS/D7vRJd+n83f/+QLPnTH5wW9dw0RqmFJlhf6hPKnxPvy8Tkbg90L6bFi0plcYeNsFykAaTbfh2q3qE08KaUKcSDLKVir2gKDrkLBi2ZIvZaZ0w9KQC9ZVtnUdF68R0JxvcnC5yg+mzvD89BK1RkM5naRq+8LH7+DnzzzDasshr5lYYYJmuUGkG3hWSCovMz9ZRukUswnuueNmDpVbfHX/UYp6hNUOSWVSjA8WaDRqTLd9HCfErDZVofFfqpP/poKPgd0KNb4/EuhMEIrV2VOVg5ZNQGaH4rer+loTkZmMEMxY4ZfO4Eumn6gURbavpfGldBb9qufiy5HX7SjURCohhNMUR59+ls17hnn7uz7PHbvHuGCwj026Q2HrLrK5LLZUs/meeDchR2Mxj63iHgzCaof0uaPqDvHbAUY6SXcgpwwzsjtXkX9CGJXLXCikbnwMeF0PrW2TSKXVJFvWqIJi8tZtluYa7F1Y5mez8xxdWcGrNeJoCh2uvWACL51lNNLZMdzPP+57hc2TYyxMLaD3DKJ12wS5DIbmc/O1l/PtT97EVe/9HKnBYQaHhimVKypxIWtoGLlhjs7NUS/X0aWaVKJ2ETXE8BnFON5g2SvPSbN0MAqc5fjp5PowMHA7FaLCmGLkBkjpJokNsfdQbAnSlrlkCPyGwqGmRFQm/rtkGj1oqjdRAF+BrENlZpPJoHfqaPUynUeOqDsoJWW1eDwCEd8Zin+uZklS17sOSfH+ybRVSsRciubxBXpu3E2+mEGTiA9RguTSsbRHpqRqYxkRtqWXkM2frxoxpfhQ3r5YcWK2barLZQ7OtHhsdY39q8ssrVXxu5JjpZEdzHL7lRdxpLTCD297F1f95dfoHxxieDzHy/Nl9K78kzpeJkEmEXDzrp1896ufYPdtf6KEHuJLyYhxVL7YMKKVSNAWtefKQlzhbXwJSpinGsuYCBQPspQua28k6G+VtJkfVzOgwCmTEMuYjBzCNHRn0YrblLZJBGS+cGkdi0h31M7Al62ikEf1lPKt+1EXw24T6nn1g4saPNFcxf6Pw/QoyY6h7HHyb0lGosApScoF7WMI1EYKEcnYkDQbwZLnUkoEIObK/HV71ABQhA+hjEWk3pd+RLyHTqgYvAmhvtUcIYSo+0JYV448FEWa7rJasXnw2AKvttY5vF6mvFoXTIV6Kbft3sLtF+5kZXmJW6+7hHd/5R7+9Tdu4KVGhX8/ssjquk+mmMNyakRmwItfvIsv3PcSRxbm6OnN0LVt8ukU6XSSnmxemV+Lg5tpLCzH2SpK3hrP1v5LVioaE2WHl7J36n75uNGlj0iNE4VtUmEGR+b6ou8TUnUoe5G6mtn7iUFSIsMUuY4cLkkRXkckJHdJLAJOh8DIkQwd3GSCVG2e1aeOMKDpZAQ5ITTO1y4yESfIHCgh6HFR8snnsDFKCJPKPOT5rgpeEaizSH+EJBcMC5Iw3rDJMSmzClk/G76mpq96K8CTJIV2gC/26a4AEOTf0qnW28yum7zasti7eoZD00vYLSuWrCYTXHf+WfzOnkkuvfRcvvz4CR7c9yQ/+/Cv8czUHD84tcaZlTpJSbHrlLnk7G3c+6n38+a/+DJ+YYxGp6tQsf3FNFbHpeXa+G6CVr0VS1flpVCLJAl40WOdmfKvx7sQpQWoVF+NElJdZPqJRD7pzMSXdHqEIJIUTk/FUaj0ZvH0+eLIlXTlvBq/SwK0eHUdWf6oRAVJmRY1vYVdqZM4dBLDDtWGTxSRsiqVcYuUf2Kxlmmv8FNe0yzJAknxqqQEFT+jJaQDiW91KIwNYzkO6XMGMHsTSmclwEtlnZAxuQi/bR+tHeHXTTUysdsWrRaYpqn64VY34GC9ycuNKvvnpimVW7EqhIhzLtjF7nTAX/76u+iZ6OGOr/2SyFrg2795K08fOcF3zqwxV7Fp1huq2fy9t1zMjedup8d1+dzeZ5mrNek0HXr7etUX0LQkNCxDp9GMXb0qqEBOJnGAxb2gGE8DdfLIxMMTxN/DCiYrCWlpLU9gr+Pn8qDLnWErDZUvUsjsSAxRFhygV0fLTMSRd8qtJNPOpGKhRFGDYuCz9uSrFJTJSBwqcvkLIHkjWlv+wMrXLVtVickWSafQdGLqkBLEKQOlEEMdtYmTOZVw1ZODEs3nou0ZVpRQX44qlV0puuNQIdKjlo8tpOuKhdnxqZo+M+UqqXSO6VqdY60uJ5oV5ktNzE5LyWLTPQNc9roJzs4N8vGrzufr9z/EadJcNljgz267iuMn1/nc/pd58eACiTBBT+8AV5+3iY+9682Md9d46uAa+1uLnKy4nJg5xcDAZlrNSpwsHaaVmMF1mxiaQTo/QKddU+JX9cFIRKHgdWUgXyu9FEnwinjwhOiQECKQ+EAkO9aU/bYcU7aa+kpDLTB5iU/1kzkSrqgIhW6dU0dbM6iSOXaSxEwVelMqJlssculEUslB5f9NsZltLH4kJ12OEeHnKkCxWJwVaU1SGWKqqCtHkXydlqdMQ0ZPltRgFmMgg9efVSQ3df+5sVjZa3mEXRevZuPXAsprTU42O6y7nuoVp1stplptZhptVuorhF2fy3ftojBUYKLPYGa5xl9dfRF/99yLNB24dnycj91yMQcOTvPV07M8f7hE2tC56IqreWnfz/nUu9/JXW+/hIMvn2bf/CrHal1eXV3HdFxFTxLNdFrTyfWNUau2MJslsN04w0ReYMHMikBDdiQiFpeEHcXcFehWKkMgcQyyCs1Ibrp0k47UXYoDL2IGka8oQJdwT6Q6cG1sI0t/rsj0vz/EkCz6UzIflSYtFg2oYElRqsgZKVuzDc+GSPRFJSLFgC4rVvnjSoivNIZmqED6kmUlkRLpUKQz4hYWsL1DanMvqdEetJyIsQWQIM1ggN2VXiPEq/vU12qsWCEvLJWZajdUE7vm2Kw3ulQsl7X1RXQr4tHP/hZfevAZLj37LO4/vcifXLmDH7x4mldX1vjTt76Fazb1c7q0zk8XSjzwzEskc334blOJA6++/BK+8barKI4kePyJQxzoBOw7Pcdis06tLnuiIN4hCYJJtpvytSumvfzM/38XosBnUjF2Zh6I3LQs5aUBUMIYBU12832kRLvqicJDV5eiJu5VkbqISFhChKVXT+top2bRz8xixPRtfFEVyUkjDZk8QMlNd6VhjDHOr2EolK9bCQDkTZL+IqN2DGKklIB4mbyKiTOQfYeewncckk6EK4PBVERx9zjJrNgJhMUiLPdQocojsY23Epw+M8espfFypcqZThUn1GgHLqbps7JepRu0GNGyvP/8fo57BjfvPJsvPX6AL771Sr5zZJoXjh3hZ7/zYWy3zGK7ybpf5EuPPKmU/o1qTe1Errv4Qt45kuU9v3YZtfWIew8cZa1jcni9zqmVJpbZjiO8BRwg9DiBG8j6eCMzXpXsr8EwVVzF6jORirMW3INyDgmMS4YmWVzRzopsv1mHYg9apkAUyXmoERl5MMvUH32cnOzzk3Ityk4C0rkQzxLji638e+JZVKxaGYcLAlyQ2RIbpAzzEY6Ew4uqI7LI9RZVuSu5grIMEjOnJDvLnSNjdc/s4FqSV66RzIQM7diEnhNaqKb6DtFRyQJzerHOXKPFqw2To5V1SqYQFEI6nknD9TCbFq5rcc2OCazQZefYZq7Y3MfnHnqa/3nV5Xz/+AIV0+Teu27nlaPHOLm6yODEeXz50SfxO7bKwf3t997GgWf38/qt44z35rn9ltdjrDW55+ghShWTn88usbpUx5GHIj2T1SWpF5V2QbG1Nnbqii63kb6n1atHIxmPaJJTKOQDQ0YNgoCVSAeHIJNXvYAg9SVmRspb+bwMw6T1wGPkJcky0jBNeSo+RmBg5IboSEPUkSAsCT0O1V2A7TCgGdS7ZbK+T6djIytuPSlrYBEiayTSOfTIpnd0RJ2thhh1NsQBkukkkAI5yhrtLl3HZ1N/gb7JIbU6kFGKJOU0mjZzLYupSovnmy3mWx2WGoJTM1QcRy1y0NoeVqvBzW+6gRMzJ3jL9m1sKrj89VMn+N573s7fPrGPnrFt3HX+dtUfPXP8FW68/tf4xD0/olOqqjlftqjzrTs/zt/c+2/cdcvtXFTMMTwgk808d//iPlr0MtsJODQ7pySqnujf6KCFEiMYPwH1UMR7+NoDqTVORrKfjsx1RXtTac3qbZUKyyKUOCSZUwkNLVsUuIjKYXJ//sNY4S3e79wID59u8nIlxRMHTzDY53Hels2MDYxTEIZjFHDfo/tp2CZrzQbt9apC+qWqRxnKpdmmFRgd6WdiuI+BdI5cGLB1eAA/B0ND/ThahFi8TdPBsUJss6seyFSpgRMGnD8+wraJQaqNKm3JrmpHVG2XqXaLE2bA8XKNWruqynLd8gjyDkNuijOlCrt2jRPZST540TmU1xf4l5dX+cMb9vCrk7N0Gh0u3dzH5MQYi50Ge7a8jnuffpEza2skRBqrJcmmQ+79yAd54vABTpY8Lp8c5+3nD7Ds6fzDff9JamCMo6UFzGSG+kqFlKSFSiqdOsbkPo3lSa8lH2mV2YejZHGYwGyTEDWiLN2TYLg2jtZDUpdwlt6YdpYU5nka77H/JEi6ZPQefnRgnv84UeUDN9zE1N6HuHjzBJuLgiRy1Dav3bZx5dzuxkzBjqYzNjlJo3+Qr/zySQ6X1riw2ENPY0mN511dIlsFUtBmU18/d1z/Rq7evVkJHDTbol0VrleHsu2rOIlnZ6aIjF5ePzHGBaPDrFVbnPFtJCx8dm2JFTvkyEoN05VJdi+6W+XssfMYLzR56LkZxnZs4qzeAu/ZvY0Xp6b55ewy77jsEh5/9RXShSKfv+Y6TteqrNYrHGvbLJYb1NtNfEtSHFz+9NZ30G2Uee7MNO+8/HJ6dY1XFo7ylouuoFGvcc/pNVbWVvC1NLbuU6t1VRa8UuqLdTAptaS4neV4jtDaa49HjtEbn+ExrkalHcgXolFQPnXIIRMUUiOYT/+QbKRz/5THIy+ucPtlZ5FcX+GqPUNElokv/Fm5yE0fR2wDrk6l06Fqdql2PE6Ii7VrEuVzDGbybJnYTDi5g0986bu8/cpJekqSVWJjGSn8eovT5WWaXsSkHvHNT/8Rwzkde73BzGqZdsfiifIK+5eqrHkhV2waYEthgJrlUHZC+jIG050OxxZXsLsNZYMbyvXz6Ruv4KFDp9l7corRsSF6khq/d+m57J+d57TpkCWk2TFpBQ7nDg9w/eQeni9NU7VDZhotiuk0czOraLkeZWR9+O7PoJVmuPvR/Vw0OsGurRNsHerjxROnOb40izU8wdMnVnG6DTyBvgW6WjcnRUeghHIqwydeUNXW9kVqBiVBJOLfzuTjQaNkJaXzqpdIdFsEQ7uxDz9Kztf5yeNN9LEi4bEj/NaVW2kL3iKxRBj0qsZO3K5m21KbPNPqkrATmHaXVsNRL8dMs82r1QrHGh3xHym5zUBfgbOvvYW//943OX9oiAlsxooFrhrfyo5NYxyqVfnKA/eKv4bPf/BWruobZWWtwky1yYHVeR6r1Jgq19Xb1juyib58VuXCh1GGU8tLWJ228v4ZqRT77ngHd9z3KEfLFbXQGpsc586rzueF0zOsBxqdukCS01Q6Jtv6C+waG1JCiuTgCD99+kXedf0b+PGvHiWdzCsDURg2+eH7bsMJmhxaWqJhumRGRni1NMsmo4+JvgJmEPD4qXlWG4EikXa7bYVTVCFlajohrYdISddeiARZlPSaBIH4qi2CVAFfRhryprttUqkAI+jHm3mCq79q8+eXj3HD61IYltioRboZn4WBTFzDpEqvEbpDwpF8whZhIMGNokhP021bNDtVyl2XFcvmtOdwqBRwsnyCnb2bueLqy/jeIz9ne+EsRnQHxw+4cOsmbtq0lbMm+7HtkJv/5bvsNJL800c+RMKqUV5u83hpjadLFRY6LVYbTWmP1DBUqjWpHH35hSV0Kwp57gsf5R1/80MqbleFgeXGi/zuzklOlBZZ1fpo1dfVoi2pB2QMg0xC55bJc/jV9DHWHWHuOIoA0am2CLJp8vkCH3/jJYwV+vjuww/y6Te+ibXmujLJzq8sc7jW4aBUdaEMUENMQcfKlMMRCKaMbWTasaHtbZRfiUgMEzrHSKa24hpGrHjXs+ieoDaEPtBLeu4Qn/jBKufnq3zsms00ZDeiZ5T4QVSUwhlJBkasQQpsDDeBaW2EXTkdoratxhyeKcG9SertLqWObA1djrc7HHd0DtfrVEszbB3fzc6dO9h38CRDiQ62rVF3OvRoDn/2tncru8I//cerfO+lvfzbnXdxVrpLaaXB/uV1nl5a4lTHoWO7dDsOrivihjjnXN5mR3fI6z6WqFJEvSJlXlLnxou202qX6Sls49TKDJVWi/PO2karVaGY7yHjwZbhUebdLgfOLJHPGLTqptL09g+PcsVomi0DgzxybIo3vm4X1+7YxI+fPMT2cWmIEzy3UmVNFC1ByOjYGNNzy7gSUWt56m/yWsWl1WuHIukt8EtExigJrxP3E/ILWHWswhgZz+SW932f37ywyO/etFVlVKUV20y65tj4Emzk84k3XNDaCU9WrJLFpakYICNRoFXvMDO7StoTBrCExJg0675iKZ5yXY6VGsw6VWZWK2zSevjA7bfyLz/5Jfm0T0tSrGVC0pXljsMnbrmJt157Le/67Be445o3c9ebzuXwqTbPV0/z1Nwy87UW9XpLLX+U8VOGoAIoU1keogUQm4WQ5pSZmgvPnaAv8mlHOVabDZpWl6KhMzY4gCcjm0Dn3P5eDqyeoZneTOh0sfyQdqWpos9Hhwa5+8Y9fOtYmbdtKTLeN8jd+58mIMdYPklRpgSexem1tkJ3FPuGWK2U8SSM2Y7BBeqh1OrHRXOJ5pTQoziIuFNtkBkYws0OqMv9Q5+8h49cfRk3jLShV/bAiou30eBIWy5lXAovp5MbHsRPjZEoDOCZVRAjpISN+Z4SxaW1BPVqi54enXbX4DOf+0eefvYol+zZjk3EUk2w3h6mVVf2uQ+//za++fAjJLsWplDbxKQp4Swyec7o/PX77+TbP/2uEs/95OMfZmGuxK+mFnlydYX1clmN75UaXilw42ZM8rGEYCSqFWFnSdzTSF4nnYnIG1mqlkm9Y6vJ9JbREc7K68yvtbl85xYlkn7k9AxlU5rDlKIhIXGsePzw9z/MM8cO4GdGSK5NkykUeeDIIi3hFQcBo0Ux8mSYmZsnme/Dl6SIwMZruWqMotTv1bW9kYzadbdBJHwPW8hmkpfej9bTy1/8zQP0pgb50BUZCqlu7KqSOZaiBWloSQczM0Z+fCeREWGbPhIbZkS+ml1JGSHjZSnxpFMW1pauJ1krlRUTbXLrGE6oc+TYCu/79F8oO1iPoKD0QMUQSdd+7rZzOb00Q2CZWEYc0CJvlNwRidBmcGAr9W6LNDZf/8hHWZqd5WcLMywtValLbJHIhKSCScj6QCOdzqoyM87tlSonwTk7NpOKHELbQtq+qhiRxLSTDHj3lm0cblS4eGyMbmsVf8wjWgAABlxJREFULzXIgUqdak0SIYwN2LTBVTvHGB0Y4ZXZeXaNpvjU9Tfzge/8CE+Ip7kcw2OD0LGpt8tYfpJsYZBKo6EGqSJnkiRrrVF+LpKsCpE9aqFNMpHHl2ASv8hafZ07//Q7/PqIywdvu1iFT/paQE60r0kDzyiSHNuKn0mgCbbJyJMUlYpcolEaL/IU21DGHjLpFS68lMXiKxSUazaTZXa6TDbbz6nSKu++ejt33z/NF77+TXpTHoHRT9dcIvR7VFkuCQ2BMOp1KSJknibrTxVuG2/fAgFmaFxw+RuUSX9ltUS5vhpnGcrqWaRMMpOTS3RDfqOEXqHOyEQ/o9kM2aQUGA4dr0k22Ysb+rxhxwDzNY89Q1ma6yuMju7Cd9rsX13DapkEMhTNJukjzdZNQyx1TbYPjvMbZw+QSPTwtb17Wap1GB0u0jXTpCWiIjLoiLg91OjWZS8sYg0Zv9eOi/Y8rq6c+MxVCcbpBLf/3mNMZNb58u9fqOzSTiDQFw1bOIgTO/BzQyQFMZvJk5XjRNaSlqkobfJrS7h0oyQ7AY9cJhXnPolIQtewLDVeo1Zu0+5aHJ73eGFmiRsu2MJcB/72G98i4UiGSezndto2Wi6toJkenThIRr3d4tkTSKZc2pqiT6h7Oi8qxyK+3ImygFNDvDjEMY5CiqtDZdgPNMbOGqaga6Qjh9m6pZCH8hBlMrt765ASbW+RZLpWldW2Tiqb5ANXXMZjs3Ocml2n7NTpkfme5pNMF/FTAbsLRT567ZU8fPAET504hpZK0zFdjHwBx7UYTCdoWYESgnuWRNpKBlX1eKQMiEGXqFkmLbLL0a188A++zZ4t27nzzUMUo5YKvRf/nAp83LKdMDmKJmOIsAKpgmyIYh+f2KRlkSVr12QKt1kln+1RU2B5MM16k2w6rfLLc/LFhaESKTdbJu2OztcePsYvn3+FK/dcyL4XHiN020riI/lOSnvckyUpPkBNTPviF4xVy6GYUVUEk6g0RakoH0HMQInZ7rKT2zih1PkVC9YUYhyd3k29bMoUhHvLqWWBOydIZ/OK9+WYtlrOXbxzO5WVBVbkWE6nlX/mvM2bmK02WOv6iqAkL5ncVnI/7R6boD8bsrWQ4OmpJaaX64yODdIwO3hGD163xfjwMOVqHadRj0O8q/XTKqhVPOp0u0SGwRP7Fnh03xlW9z3OPXe/B0/5+OTSiUhtOz9eYMk/7JokDR0nMhR712vUSRbzKnNETxeUJFUmr6K59TxL/ZCSD6WlQ1rlepyzEQUcOrrOmpXhTKnFSF+WJ19Z5oXp41TX1jA0F7deIcpEKrJO+FxaVlxUMSLjtf/Jg5A7SunHVCCYPKiNlamK49uACCjLblzzq8pmg7uR6TEYHR9Ccy2Wy5ZKe5YmdGAgT8K1qPsaE0PDTPYXOTS3oABqWaFCRC5ZLUu6L8vc4rryy0QpcQVEZPv7ZMbBjWdtJYw6lCyNmZUpKk2TUM8RBBaFYoF6q0loKkKKVFmzUUxaqyqZW29+kvf90ddIl1b4/mevxZTLRrzfgeyyLxUNHImkdPOSOeUp65tw4QVhEASiOxLNbZwVIqN7S+bEsq2zHRWkJY1RZbWDkYxotTr0D/cSOhqW6/N/9y2i5XL86sXDdB1HPZDG+pxiU0k+iUyiNYFI9sRMJl2YFlLhqTWL2qzHOuGNZc9rD0tVVhuWV+Vw3wBOqjJTFlsCtkklVSPnOyaOJ1+UiSeJEJrDBaND1K2AjuuTTycpteVoT3L25iFWaxZW2yaX1RjpG1RfbdkMcCTWQ9cYGBrGsE32jPRj+zJctSkUi6qaFHSt67q0Wx16eweolVdE23s4wm7E4oSeYf7g8w/zzgvOpb3+LLdevUPNWGQfbmy9ENNLkxXDinBm5U0T25uQQU35A0vOuY4epvBEfxMllERI8wTbIVnjMprx1QUvChOBC9dqUvl4lCstDENjbGiAAwsWP31hhiPzq6wuTcefcmTiCxF1Q4IZ2j5hOvaky4OI00E3TJuiTlQMkY0Iode8ewr5F8bmTvm55YBTwmddZaMIlFmNLhSJNqmOKF3LEjg2Z+8oYrdkYKnRabt4gc9g3xi5lE6rXcL2DcwgxXA+IpPPKG2vHSap1y2KfUm25Y0YqBZBR+4LJ8TI5al3yuoFF8pqa1XKfJf/BwxovGoeuwEDAAAAAElFTkSuQmCC');

SET FOREIGN_KEY_CHECKS = 1;
