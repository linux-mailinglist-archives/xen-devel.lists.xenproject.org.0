Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E84686EF2C9
	for <lists+xen-devel@lfdr.de>; Wed, 26 Apr 2023 12:52:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526629.818516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prckr-0001fK-BA; Wed, 26 Apr 2023 10:52:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526629.818516; Wed, 26 Apr 2023 10:52:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prckr-0001cc-7l; Wed, 26 Apr 2023 10:52:09 +0000
Received: by outflank-mailman (input) for mailman id 526629;
 Wed, 26 Apr 2023 10:52:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=2HkN=AR=aepfle.de=olaf@srs-se1.protection.inumbo.net>)
 id 1prckp-0001cW-G3
 for xen-devel@lists.xenproject.org; Wed, 26 Apr 2023 10:52:07 +0000
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.54]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 623d8318-e420-11ed-b224-6b7b168915f2;
 Wed, 26 Apr 2023 12:52:05 +0200 (CEST)
Received: from sender by smtp.strato.de (RZmta 49.4.0 AUTH)
 with ESMTPSA id x6987cz3QApxIF3
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Wed, 26 Apr 2023 12:51:59 +0200 (CEST)
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
X-Inumbo-ID: 623d8318-e420-11ed-b224-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; t=1682506319; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=YrrrVEKkY1xSgYZ/BuO72DGofk503zHM4gDgcFMX1aKdNWQ72EjkA92+M0TKuOnie1
    v0qtaBCSPUgGrcPhhxbjpUVq4wZq9XnK4o6HLtVNPdiySYLH4g9MLZAnTVXxTUgjSE4l
    yDFIUeudjppMVwvOmTHhsEBILhaaiLAMEI23AEOcxgwCPBgO5OuD9pcNROQeTZff3ocp
    NI2A4x+s62tF3ZwPgCuKA3/aCf/FTMFkZIv2uGSkdfX/mlGyBWPhOVxsAR/AY0++NaM3
    a/0OGXRUe0DueN+YuM0TsM0EW7jlGDl0UEhXLeBEw1zpKVEx3Hunjvd78gFOjSyojD3i
    epvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1682506319;
    s=strato-dkim-0002; d=strato.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=IrwdqgFkX0ZU6V+Dyc1PJ+89WpXrnJ6yDr5eITXGbIk=;
    b=ZXxDPWcAJaD17yqeCLXedK7trTlY678n7MviBf4sp6ZEnUJal1lPTmZedvVfiW33Z6
    FQ7X3VB1EHJTA9czyTUST0oqbtGKyLdSzeDBakJfo+/e3I2GQzpnM454kVVWD3FWTtVX
    xhEaKXKtQmJCivn6nEZ5giPiiNqjO8cV+eVANoQ8ZJi+TiSHBNzn7HIsN8rACmKvsnye
    5yDNv07Z+JH6h2GK7etnkkS2+MeVXT31m1fSaP0Uv9qStvdj1p/QCzVNYYjhc+AvsijN
    4FNOIPHp/S+cmNtsOVYyUHyoVLo7+Ht0owSAXxCXpdjCUVS/8nrqLkmoPxq/ECjk+oB1
    R5qQ==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1682506319;
    s=strato-dkim-0002; d=aepfle.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=IrwdqgFkX0ZU6V+Dyc1PJ+89WpXrnJ6yDr5eITXGbIk=;
    b=GbJB8GvqAlv+3XL1xBzNIrWQ9tnFIpW/gfRcY1r4XefmTeOEhx4SzwLJVZKT6Nfdg9
    M+nSoU0ZOPJUft0a3KJGJJZP2adU8m84kXYPRVbqEkIPrci73stEHWOMlbmyw5gXtTPz
    k4vLOO4XC7ewX6Qu+h3Mbz4UhqGpAasSJLflGXj4R7ZKNeclnICendUjsg0bCViSkOrQ
    L5YwaQBkfbtF0IvSI3Z22iz4cpKOu9avLkoeW50mkExJUyRNUqcKRPtDjVTJcTzkt7J0
    xOPorAfarGORMHSmDBXMeZAgORjKWk/dGUHLfbnI405QJnV9atreSToDWBDSo9j/Gj+E
    sRBw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1682506319;
    s=strato-dkim-0003; d=aepfle.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=IrwdqgFkX0ZU6V+Dyc1PJ+89WpXrnJ6yDr5eITXGbIk=;
    b=250efq1htmE8aU8OOiwXNUCEZS1+ZFbx3H4aGmt34PqEcMm8k5EFcsTJybbfGgxrey
    /NYe7G/9HO7OR8aeL5Bg==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzpIG0mv9coXAg4wqlr7GpgtSxIX+ZWs95M7PYKTHoBaxED20qrwFA=="
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Cc: Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>
Subject: [PATCH v1] stubdom: fix errors in newlib:cygmon-gmon.c
Date: Wed, 26 Apr 2023 10:51:56 +0000
Message-Id: <20230426105156.2381-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="us-ascii"

rpm post-build-checks found a few code bugs in newlib, and marks them as
errors. Add another newlib patch and apply it during stubdom build.

I: A function uses a 'return;' statement, but has actually a value
   to return, like an integer ('return 42;') or similar.
W: xen voidreturn ../../../../newlib-1.16.0/libgloss/i386/cygmon-gmon.c:117, 125, 146, 157, 330

I: Program is using implicit definitions of special functions.
   these functions need to use their correct prototypes to allow
   the lightweight buffer overflow checking to work.
     - Implicit memory/string functions need #include <string.h>.
     - Implicit *printf functions need #include <stdio.h>.
     - Implicit *printf functions need #include <stdio.h>.
     - Implicit *read* functions need #include <unistd.h>.
     - Implicit *recv* functions need #include <sys/socket.h>.
E: xen implicit-fortify-decl ../../../../newlib-1.16.0/libgloss/i386/cygmon-gmon.c:119

I: Program returns random data in a function
E: xen no-return-in-nonvoid-function ../../../../newlib-1.16.0/libgloss/i386/cygmon-gmon.c:362

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---
 stubdom/Makefile                 |  1 +
 stubdom/newlib-cygmon-gmon.patch | 60 ++++++++++++++++++++++++++++++++
 2 files changed, 61 insertions(+)
 create mode 100644 stubdom/newlib-cygmon-gmon.patch

diff --git a/stubdom/Makefile b/stubdom/Makefile
index b312f710cd..cddbbe2da0 100644
--- a/stubdom/Makefile
+++ b/stubdom/Makefile
@@ -95,6 +95,7 @@ newlib-$(NEWLIB_VERSION): newlib-$(NEWLIB_VERSION).tar.gz
 	patch -d $@ -p0 < newlib-chk.patch
 	patch -d $@ -p1 < newlib-stdint-size_max-fix-from-1.17.0.patch
 	patch -d $@ -p1 < newlib-disable-texinfo.patch
+	patch -d $@ -p1 < newlib-cygmon-gmon.patch
 	find $@ -type f | xargs perl -i.bak \
 		-pe 's/\b_(tzname|daylight|timezone)\b/$$1/g'
 	touch $@
diff --git a/stubdom/newlib-cygmon-gmon.patch b/stubdom/newlib-cygmon-gmon.patch
new file mode 100644
index 0000000000..b2dfbfafe2
--- /dev/null
+++ b/stubdom/newlib-cygmon-gmon.patch
@@ -0,0 +1,60 @@
+
+I: A function uses a 'return;' statement, but has actually a value
+   to return, like an integer ('return 42;') or similar.
+W: xen voidreturn ../../../../newlib-1.16.0/libgloss/i386/cygmon-gmon.c:117, 125, 146, 157, 330
+
+I: Program is using implicit definitions of special functions.
+   these functions need to use their correct prototypes to allow
+   the lightweight buffer overflow checking to work.
+     - Implicit memory/string functions need #include <string.h>.
+     - Implicit *printf functions need #include <stdio.h>.
+     - Implicit *printf functions need #include <stdio.h>.
+     - Implicit *read* functions need #include <unistd.h>.
+     - Implicit *recv* functions need #include <sys/socket.h>.
+E: xen implicit-fortify-decl ../../../../newlib-1.16.0/libgloss/i386/cygmon-gmon.c:119
+
+I: Program returns random data in a function
+E: xen no-return-in-nonvoid-function ../../../../newlib-1.16.0/libgloss/i386/cygmon-gmon.c:362
+
+---
+ libgloss/i386/cygmon-gmon.c |    6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+Index: newlib-1.16.0/libgloss/i386/cygmon-gmon.c
+===================================================================
+--- newlib-1.16.0.orig/libgloss/i386/cygmon-gmon.c
++++ newlib-1.16.0/libgloss/i386/cygmon-gmon.c
+@@ -61,6 +61,8 @@
+ static char sccsid[] = "@(#)gmon.c	5.3 (Berkeley) 5/22/91";
+ #endif /* not lint */
+ 
++#include <string.h>
++#include <unistd.h>
+ #define DEBUG
+ #ifdef DEBUG
+ #include <stdio.h>
+@@ -89,7 +91,7 @@ static int	s_scale;
+ 
+ extern int errno;
+ 
+-int
++void
+ monstartup(lowpc, highpc)
+      char	*lowpc;
+      char	*highpc;
+@@ -199,6 +201,7 @@ _mcleanup()
+ 
+ static char already_setup = 0;
+ 
++void
+ _mcount()
+ {
+   register char			*selfpc;
+@@ -341,6 +344,7 @@ overflow:
+  *	profiling is what mcount checks to see if
+  *	all the data structures are ready.
+  */
++void
+ moncontrol(mode)
+     int mode;
+ {

