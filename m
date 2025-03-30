Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDCF8A75AC4
	for <lists+xen-devel@lfdr.de>; Sun, 30 Mar 2025 18:04:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.931630.1333828 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyv8c-0002Rg-Ug; Sun, 30 Mar 2025 16:03:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 931630.1333828; Sun, 30 Mar 2025 16:03:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyv8c-0002PH-R6; Sun, 30 Mar 2025 16:03:54 +0000
Received: by outflank-mailman (input) for mailman id 931630;
 Sun, 30 Mar 2025 16:03:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=iWEh=WR=mail.com=hehongbo@srs-se1.protection.inumbo.net>)
 id 1tyv8b-0002PB-L2
 for xen-devel@lists.xenproject.org; Sun, 30 Mar 2025 16:03:53 +0000
Received: from mout.mail.com (mout.mail.com [74.208.4.200])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8fa6b1dd-0d80-11f0-9ffb-bf95429c2676;
 Sun, 30 Mar 2025 18:03:48 +0200 (CEST)
Received: from localhost.localdomain ([202.81.229.170]) by smtp.mail.com
 (mrgmxus005 [74.208.5.15]) with ESMTPSA (Nemesis) id
 0LtZ5O-1t0Sma0jDA-015jgB; Sun, 30 Mar 2025 18:03:44 +0200
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 8fa6b1dd-0d80-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mail.com;
	s=s1089575; t=1743350624; x=1743955424; i=hehongbo@mail.com;
	bh=oF78OOmsAcJMdi0rEz2e/GUg/u4gORsyRl/Ou+Gu0Ig=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=DmxkQ81XoPPQlP10i5Vl0AQ3qwsAoBPzLQ3ULX2aV2Qv3tqqgNFAh9zAsGcE/bUh
	 nGJ0OdCtRasJzw4tTTRO+5lMFStBFcM3MEoxpHFOQc59jVaX4TebkT7bsjKnHP3XQ
	 7JSkgLVP6U+4+ec6x+f/zJ79fJigt5AJDpOeAWyYMvvEOh08EE61gZ0FNZNjKEILQ
	 zk3TN/G9h33f4lOmrUtP4w4d23ZT0WJtGqjERgh8XxmpdQFaqCtNHkI3tZnQKG850
	 VirzGFJi/XR/kzTkelJfzQG18d2yrcGqpQLSsThocPloR78QJxLNVd5V0yXOyGoW8
	 zH5Q9Yrmkz02URJQzw==
X-UI-Sender-Class: f2cb72be-343f-493d-8ec3-b1efb8d6185a
From: Hongbo <hehongbo@mail.com>
To: xen-devel@lists.xenproject.org
Cc: Hongbo <hehongbo@mail.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Juergen Gross <jgross@suse.com>
Subject: [XEN PATCH v2 1/1] tools/libxl: search PATH for QEMU if `QEMU_XEN_PATH` is not absolute
Date: Mon, 31 Mar 2025 00:03:04 +0800
Message-Id: <20250330160304.20899-1-hehongbo@mail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20241223031753.13709-1-hehongbo@mail.com>
References: <20241223031753.13709-1-hehongbo@mail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:JS7NwQ+ubojur4xWWgrI9hbYHpAT0pd9Oayj5blPfppS4/Y0USz
 fQzRTDrEYRbmsUHOZfEL5B0FF4su4BVJUt1XdnvjJ5NrwMrA4nVrTaWIwV+xZpWoNovNJeF
 IR6/hMFYxvoMGaFlnN8O8pNtarTUk2A2d66ku8j6pSMbiPpdY2K/3KmCvVbMjme3JP2i/7v
 m2a+8b7L70HLjXa5sv/jg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Gx6iHqN3pJg=;0Tyn0EQOCHpD9pJvkemii4yQY9Q
 1gdeDrDDHCNs7cK9SzYR3rYiF0MNoFdGodeBsuXC21gCeTp0AZdbKAbaULK18xrVb4LAw/Xl5
 Et7VuBwvIUcN7//7P5inGCDS+RHxGGXWgzfqV51jBa3IFsGPNOuIAS/l5YNmSOMj4tNqksZBV
 eh+iJCzl5Z3DDlnNt3EuJjF0rLgvN6739r6NwbCbireMFYLcmRV0OYARYoDXoVn5KgKrrn3Uj
 UaEX6ThgmC5C1p5qltwURCVV+awU/gsQEigZQEHKocQph7Xm5+weiyzhCUuhHhuwxA8r/C7Ph
 NOH52KNkHozcaYFyNoYaewvyDoSYn6DltN6CxwIWYcZz7/UsF8sNvF0+zBcHfU7QJsyYEbyW8
 bySPvAZSptdwHMcC+4lrgOKqHHwFY8xoyDoBX2advNMszbUItlSxMjJ+e4kIdp2/8KJNLkXP9
 jGr1rZvcEA/+k5P8c+NXAuJb348c8lNVXGUo4cB4VQpbGpTyDYZaBqDnf/V0N1f70XfBMbWEJ
 5vG45g2/dVbFXEDso7dEHVwQsK9As/ijd09gI2scc6wTGhaSTfC+55zsnHWZOFfGxXVciXHjD
 j+mEbaRJF0+2xuc+jCnjocxgtZuOaaOFAFOPtYb0HF7iDlaNOoUqllet4fqIkwqRMDfMVPmqL
 wduwpH/6Un7s3Dnrw0DgANo70yi3uR8erMay3Q0SJ3iv00918fm8Jof9NEci1s/SYpmM2ndX0
 y0r1jblS9Cz0Z4r/pvGSiATUwd7Qx6CNwqYEN6dEHISOaxt0UEjfvB87kqoYnWJuW5HlESLRo
 BunO5CbzBr7m0G2IAD5cVhtY3gNg4ZHMfSNDaWAbsl6m08NYHLX66Gaf4P87VerKWSZ+VzraI
 cDudx9PKyDiglBwcW5ZgF5zbeD0QU7uJ7pBLG9W7Mo33EQqHtyi/ppQI2S8RFId26QlXqpte5
 I0S1axGJR3krATrNMLbERMG1gpIsnFGsTJSf5HXVcY8rlbpm8Tk2BKC9rPNX8plqZ6/vMOQSZ
 kyPn424WJqz51vVC19V5bOqDsQD44WD7VDgOaNGnVgJoH0NFcKURzqA9B/aKxiL5EkRCGw8zx
 nDMrMrnCZfscpys8MKg+LM3+f8i2kZ4mKNRtTAMc7gYwdlDMyqKldQEorR2thZm9qjjPfR23r
 rgbKQGrXio2dUnOhGB5xIMc1CZ1cH7bDhXBu/Hl8oaywtUPGB7u7ze3XmcZ1h8e91X5Re1Ol5
 t8R6wuqo/WLIhd5y4JoGl+0gOilaL2K9wnoo1d0MJ1le3eJZ+E3q5OSWaMzNbzFhzbZ3cY6Wi
 LOXzGeUZeTQ/jHK/4wQNyEosep18nvbTz6Es63dWnz8mnBp3nY23fF5SBkeM6kfCoF86FJDKl
 Xa8ryHeE5ijIMt5pT1Ji3Qu1IvZDpG7JSHtW9W/tpVc7rWOOIL8p7X7CVpF5IfGyVaYv53tiV
 joAppR3nZ2Va6i9MUlE3AGqEdZnY=

`QEMU_XEN_PATH` will be configured as `qemu-system-i386` with no clue wher=
e, if
`--with-system-qemu` is set without giving a path (as matched in the case =
`yes`
but not `*`). However, the existence of the executable is checked by `acce=
ss()`,
that will not look for anywhere in $PATH but the current directory. And si=
nce it
is possible for `qemu-system-i386` (or any other configured values) to be
executed from PATH later, we'd better find that in PATH and return the ful=
l path
for the caller to check against.

Signed-off-by: Hongbo <hehongbo@mail.com>
=2D--
v2:
 - Identify absolute/relative paths with their first char (being `/` or no=
t).
 - Put the case inside a block `{}` to address `clang` warnings about the =
new
   variable.
 - Avoid unnecessary string duplications.
 - Parity of using `{}` block on both sides of `if` statements.
 - Use `libxl__abs_path()` to get absolute paths.

Updated the patch as requested.

Also, I just realized that there is a `libxl__abs_path()` (occurred just a=
bove
my patched hunk), and I should utilize that instead of doing the `%s/%s`
`snprintf` thing myself.

Let me know if further changes are needed.

Best regards,
Hongbo
=2D--
CC: Anthony PERARD <anthony.perard@vates.tech>
CC: Juergen Gross <jgross@suse.com>
=2D--
 tools/libs/light/libxl_dm.c | 38 +++++++++++++++++++++++++++++++++++--
 1 file changed, 36 insertions(+), 2 deletions(-)

diff --git a/tools/libs/light/libxl_dm.c b/tools/libs/light/libxl_dm.c
index b193a5dc37..8f0bbd5d64 100644
=2D-- a/tools/libs/light/libxl_dm.c
+++ b/tools/libs/light/libxl_dm.c
@@ -331,9 +331,43 @@ const char *libxl__domain_device_model(libxl__gc *gc,
         case LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN_TRADITIONAL:
             dm =3D libxl__abs_path(gc, "qemu-dm", libxl__private_bindir_p=
ath());
             break;
-        case LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN:
-            dm =3D qemu_xen_path(gc);
+        case LIBXL_DEVICE_MODEL_VERSION_QEMU_XEN: {
+            const char *configured_dm =3D qemu_xen_path(gc);
+            if (configured_dm[0] =3D=3D '/')
+            {
+                dm =3D configured_dm;
+            }
+            else
+            {
+                const char *path_env =3D getenv("PATH");
+                if (!path_env)
+                {
+                    dm =3D configured_dm;
+                }
+                else
+                {
+                    char *path_dup =3D libxl__strdup(gc, path_env);
+                    char *saveptr;
+
+                    char *path =3D strtok_r(path_dup, ":", &saveptr);
+                    dm =3D NULL;
+                    while (path)
+                    {
+                        char *candidate =3D libxl__abs_path(gc, configure=
d_dm, path);
+                        if (access(candidate, X_OK) =3D=3D 0)
+                        {
+                            dm =3D candidate;
+                            break;
+                        }
+                        path =3D strtok_r(NULL, ":", &saveptr);
+                    }
+
+                    if (!dm)
+                        dm =3D configured_dm;
+                }
+            }
             break;
+        }
         default:
             LOG(ERROR, "invalid device model version %d",
                 info->device_model_version);
=2D-
2.39.5 (Apple Git-154)


