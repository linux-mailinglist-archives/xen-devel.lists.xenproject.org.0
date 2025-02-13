Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 783D6A339F5
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2025 09:28:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.887184.1296720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiUa3-0002eE-5p; Thu, 13 Feb 2025 08:28:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 887184.1296720; Thu, 13 Feb 2025 08:28:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiUa3-0002cZ-3C; Thu, 13 Feb 2025 08:28:19 +0000
Received: by outflank-mailman (input) for mailman id 887184;
 Thu, 13 Feb 2025 08:28:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bpFt=VE=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tiUa0-0002cP-MJ
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2025 08:28:17 +0000
Received: from mail-10631.protonmail.ch (mail-10631.protonmail.ch
 [79.135.106.31]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 779c1637-e9e4-11ef-b3ef-695165c68f79;
 Thu, 13 Feb 2025 09:28:14 +0100 (CET)
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
X-Inumbo-ID: 779c1637-e9e4-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1739435292; x=1739694492;
	bh=AyRPtfaPXYQOOB5XJX5kKao03kYefXCGNmVHMO0sjZY=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=ZfDBzOGXi+8CBz55Xa35t9o2yhISQ5tpzo8S6+xXFd+c4W+FYBl0cV9Z6fyBWd8Oc
	 RubgvdvTR7u1Jy6XF+OOiZYv9DgZzau7gEywEO0wSbBB+rEY/Pt6+acIJ08MWn3zZ2
	 8++0YRmErsfqWwjcDKY9HiX3GCZYr3DJON9dVk6gJJ3/N7Y1bKUPFn1yRVTdAlEoOs
	 My4vEPqRlXgqu7IgNmkOC4kWDdn3KP3RmTs/UddLpqwjA7KJLa2Gry50pq+mYWorRI
	 8P+EGiaXi0glLN9kqYkbkK0cX/avLN+E+G0dCBxkG66gTtlycL6u5hpdrn8t61avaQ
	 f81jZewXfLGiA==
Date: Thu, 13 Feb 2025 08:28:05 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v2] xen/console: print Xen version via keyhandler
Message-ID: <20250213082639.119796-1-dmkhn@proton.me>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 13d5bbd0d79c7f5029e38337d0c9e8dff71d5775
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>

Add Xen version printout to 'h' keyhandler output.

That is useful for debugging systems that have been left intact for a long
time.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v1:
- Moved version printout to 'h' keyhandler
- Kept the build-id reporting past Xen version printout during console
  initialization
---
 xen/common/keyhandler.c    |  5 +++++
 xen/common/version.c       | 20 ++++++++++++++++++--
 xen/drivers/char/console.c |  8 +++-----
 xen/include/xen/version.h  |  3 +++
 4 files changed, 29 insertions(+), 7 deletions(-)

diff --git a/xen/common/keyhandler.c b/xen/common/keyhandler.c
index 6ea54838d4..a82276c6dc 100644
--- a/xen/common/keyhandler.c
+++ b/xen/common/keyhandler.c
@@ -22,6 +22,7 @@
 #include <xen/mm.h>
 #include <xen/watchdog.h>
 #include <xen/init.h>
+#include <xen/version.h>
 #include <asm/div64.h>
=20
 static unsigned char keypress_key;
@@ -129,6 +130,10 @@ static void cf_check show_handlers(unsigned char key)
     unsigned int i;
=20
     printk("'%c' pressed -> showing installed handlers\n", key);
+
+    xen_print_version();
+    xen_print_build_id();
+
     for ( i =3D 0; i < ARRAY_SIZE(key_table); i++ )
         if ( key_table[i].fn )
             printk(" key '%c' (ascii '%02x') =3D> %s\n",
diff --git a/xen/common/version.c b/xen/common/version.c
index bc3714b45f..76197a4ef7 100644
--- a/xen/common/version.c
+++ b/xen/common/version.c
@@ -210,9 +210,25 @@ void __init xen_build_init(void)
         }
     }
 #endif /* CONFIG_X86 */
-    if ( !rc )
-        printk(XENLOG_INFO "build-id: %*phN\n", build_id_len, build_id_p);
 }
+
+void xen_print_version(void)
+{
+    printk("Xen version %d.%d%s (%s@%s) (%s) %s %s\n",
+           xen_major_version(), xen_minor_version(), xen_extra_version(),
+           xen_compile_by(), xen_compile_domain(), xen_compiler(),
+           xen_build_info(), xen_compile_date());
+
+    printk("Latest ChangeSet: %s\n", xen_changeset());
+}
+
+void xen_print_build_id(void)
+{
+    BUG_ON(!build_id_p);
+    BUG_ON(!build_id_len);
+    printk(XENLOG_INFO "build-id: %*phN\n", build_id_len, build_id_p);
+}
+
 #endif /* BUILD_ID */
 /*
  * Local variables:
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 73d24a7821..2c0b474d53 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -1024,14 +1024,12 @@ void __init console_init_preirq(void)
     nrspin_lock(&console_lock);
     __putstr(xen_banner());
     nrspin_unlock(&console_lock);
-    printk("Xen version %d.%d%s (%s@%s) (%s) %s %s\n",
-           xen_major_version(), xen_minor_version(), xen_extra_version(),
-           xen_compile_by(), xen_compile_domain(), xen_compiler(),
-           xen_build_info(), xen_compile_date());
-    printk("Latest ChangeSet: %s\n", xen_changeset());
+
+    xen_print_version();
=20
     /* Locate and print the buildid, if applicable. */
     xen_build_init();
+    xen_print_build_id();
=20
     if ( opt_sync_console )
     {
diff --git a/xen/include/xen/version.h b/xen/include/xen/version.h
index 4856ad1b44..4b96c6cc5c 100644
--- a/xen/include/xen/version.h
+++ b/xen/include/xen/version.h
@@ -29,4 +29,7 @@ int xen_build_id_check(const Elf_Note *n, unsigned int n_=
sz,
 static inline void xen_build_init(void) {};
 #endif
=20
+void xen_print_version(void);
+void xen_print_build_id(void);
+
 #endif /* __XEN_VERSION_H__ */
--=20
2.34.1



