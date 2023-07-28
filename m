Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B367677C1
	for <lists+xen-devel@lfdr.de>; Fri, 28 Jul 2023 23:35:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571584.895801 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPV7R-0000Ky-Vw; Fri, 28 Jul 2023 21:35:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571584.895801; Fri, 28 Jul 2023 21:35:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPV7R-0000Bj-S4; Fri, 28 Jul 2023 21:35:29 +0000
Received: by outflank-mailman (input) for mailman id 571584;
 Fri, 28 Jul 2023 21:35:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/sdN=DO=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qPV7Q-0000AP-BJ
 for xen-devel@lists.xenproject.org; Fri, 28 Jul 2023 21:35:28 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a91792f7-2d8e-11ee-b24e-6b7b168915f2;
 Fri, 28 Jul 2023 23:35:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id C54E78285A0C;
 Fri, 28 Jul 2023 16:35:23 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id PiDgYb4MfAKt; Fri, 28 Jul 2023 16:35:23 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 2C74C82857ED;
 Fri, 28 Jul 2023 16:35:23 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id qHUFi2L4_-67; Fri, 28 Jul 2023 16:35:22 -0500 (CDT)
Received: from raptor-ewks-026.lan (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 404E7828593C;
 Fri, 28 Jul 2023 16:35:22 -0500 (CDT)
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
X-Inumbo-ID: a91792f7-2d8e-11ee-b24e-6b7b168915f2
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 2C74C82857ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1690580123; bh=tuP2jrokv0sMa1vT3Hyg7ytA6VKcWnBgPVQWJzONpGw=;
	h=From:To:Date:Message-Id:MIME-Version;
	b=TPxe1qe+X60Tzu3UrQNcl25Qyep/aUdzAXvJsnctGlpHyhiwDGu5HLorUS2o2rRCG
	 ypkYj4mzzgYLywna4Hft/KeTxTpjQ4mEUu5el7pkbGRhemJPj5S66ZEMMETkxSIARD
	 ukxByK9uQBXiwmMN8hgMI3DmXX9VC/9MWcZbk/9M=
X-Virus-Scanned: amavisd-new at rptsys.com
From: Shawn Anastasio <sanastasio@raptorengineering.com>
To: xen-devel@lists.xenproject.org
Cc: Timothy Pearson <tpearson@raptorengineering.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 1/5] xen/lib: Move simple_strtoul from common/vsprintf.c to lib
Date: Fri, 28 Jul 2023 16:35:06 -0500
Message-Id: <294e48747a0f9aee0be4fd178fcab029fa317528.1690579561.git.sanastasio@raptorengineering.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1690579561.git.sanastasio@raptorengineering.com>
References: <cover.1690579561.git.sanastasio@raptorengineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Move the simple_strtoul routine which is used throughout the codebase
from vsprintf.c to its own file in xen/lib.

This allows libfdt to be built on ppc64 even though xen/common doesn't
build yet.

Signed-off-by: Shawn Anastasio <sanastasio@raptorengineering.com>
---
 xen/common/vsprintf.c    | 37 -------------------------------------
 xen/lib/Makefile         |  1 +
 xen/lib/simple_strtoul.c | 40 ++++++++++++++++++++++++++++++++++++++++
 3 files changed, 41 insertions(+), 37 deletions(-)
 create mode 100644 xen/lib/simple_strtoul.c

diff --git a/xen/common/vsprintf.c b/xen/common/vsprintf.c
index b278961cc3..86330d8082 100644
--- a/xen/common/vsprintf.c
+++ b/xen/common/vsprintf.c
@@ -24,43 +24,6 @@
 #include <asm/div64.h>
 #include <asm/page.h>
=20
-/**
- * simple_strtoul - convert a string to an unsigned long
- * @cp: The start of the string
- * @endp: A pointer to the end of the parsed string will be placed here
- * @base: The number base to use
- */
-unsigned long simple_strtoul(
-    const char *cp, const char **endp, unsigned int base)
-{
-    unsigned long result =3D 0,value;
-
-    if (!base) {
-        base =3D 10;
-        if (*cp =3D=3D '0') {
-            base =3D 8;
-            cp++;
-            if ((toupper(*cp) =3D=3D 'X') && isxdigit(cp[1])) {
-                cp++;
-                base =3D 16;
-            }
-        }
-    } else if (base =3D=3D 16) {
-        if (cp[0] =3D=3D '0' && toupper(cp[1]) =3D=3D 'X')
-            cp +=3D 2;
-    }
-    while (isxdigit(*cp) &&
-           (value =3D isdigit(*cp) ? *cp-'0' : toupper(*cp)-'A'+10) < ba=
se) {
-        result =3D result*base + value;
-        cp++;
-    }
-    if (endp)
-        *endp =3D cp;
-    return result;
-}
-
-EXPORT_SYMBOL(simple_strtoul);
-
 /**
  * simple_strtol - convert a string to a signed long
  * @cp: The start of the string
diff --git a/xen/lib/Makefile b/xen/lib/Makefile
index b311ea739c..bce76f9742 100644
--- a/xen/lib/Makefile
+++ b/xen/lib/Makefile
@@ -13,6 +13,7 @@ lib-y +=3D memset.o
 lib-y +=3D muldiv64.o
 lib-y +=3D parse-size.o
 lib-y +=3D rbtree.o
+lib-y +=3D simple_strtoul.o
 lib-y +=3D sort.o
 lib-y +=3D strcasecmp.o
 lib-y +=3D strchr.o
diff --git a/xen/lib/simple_strtoul.c b/xen/lib/simple_strtoul.c
new file mode 100644
index 0000000000..e43760ad1d
--- /dev/null
+++ b/xen/lib/simple_strtoul.c
@@ -0,0 +1,40 @@
+/*
+ *  Copyright (C) 1991, 1992  Linus Torvalds
+ */
+
+#include <xen/ctype.h>
+
+/**
+ * simple_strtoul - convert a string to an unsigned long
+ * @cp: The start of the string
+ * @endp: A pointer to the end of the parsed string will be placed here
+ * @base: The number base to use
+ */
+unsigned long simple_strtoul(
+    const char *cp, const char **endp, unsigned int base)
+{
+    unsigned long result =3D 0,value;
+
+    if (!base) {
+        base =3D 10;
+        if (*cp =3D=3D '0') {
+            base =3D 8;
+            cp++;
+            if ((toupper(*cp) =3D=3D 'X') && isxdigit(cp[1])) {
+                cp++;
+                base =3D 16;
+            }
+        }
+    } else if (base =3D=3D 16) {
+        if (cp[0] =3D=3D '0' && toupper(cp[1]) =3D=3D 'X')
+            cp +=3D 2;
+    }
+    while (isxdigit(*cp) &&
+           (value =3D isdigit(*cp) ? *cp-'0' : toupper(*cp)-'A'+10) < ba=
se) {
+        result =3D result*base + value;
+        cp++;
+    }
+    if (endp)
+        *endp =3D cp;
+    return result;
+}
--=20
2.30.2


