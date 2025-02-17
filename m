Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE7EA38E13
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 22:33:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.890899.1300025 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk8jy-000767-MF; Mon, 17 Feb 2025 21:33:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 890899.1300025; Mon, 17 Feb 2025 21:33:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk8jy-00073q-J4; Mon, 17 Feb 2025 21:33:22 +0000
Received: by outflank-mailman (input) for mailman id 890899;
 Mon, 17 Feb 2025 21:33:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9Tu2=VI=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tk8jx-00073k-03
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 21:33:21 +0000
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd773f73-ed76-11ef-9896-31a8f345e629;
 Mon, 17 Feb 2025 22:33:18 +0100 (CET)
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
X-Inumbo-ID: cd773f73-ed76-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1739827996; x=1740087196;
	bh=Cf+M6tyQt4dGTCHombz6JfbKiGHLmwtKTmMCbnRl7Hw=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=MkT4gBAffq7A0sO6Nr0uzd8KQaG6j9pZuCm2kP7ZPcgKcBHO4ccwvfMx40SEk1K/d
	 qAlBjRURl2f2NS7U72XuEXBOBmrwdzO3Ku/KU1MGtwB4fbxXjXvI6RdsALvQCkg6e7
	 bGl5dC+O2Dzcz/17J4Xs8oNrOBgDnG1X1lqQfWe6zBn+JiF1fwGVNM+sGfihRV6mO5
	 jDZ4jndFEAdxLJvyk/05iHA3hV2MNxIuB/WudIs+yqnCDY+RjrI36NjBXt92MAuo5y
	 iTdvK4qvA1udiRCpQjeoNmzSTFPJPWqj25TNfiO7hNI0oeKwG//TsN0mIX5DSJMZ++
	 827qq9J+ohw6w==
Date: Mon, 17 Feb 2025 21:33:12 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v5] xen/console: print Xen version via keyhandler
Message-ID: <20250217213253.2067015-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 27a676da69dd4b2bb819ac9cabda3e522b939a9b
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Add Xen version printout to 'h' keyhandler output.

That is useful for debugging systems that have been left intact for a long
time.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes since v4:
- switched to checking build_id_len instead of build_id_p in print_build_id=
()
---
 xen/common/keyhandler.c    |  4 ++++
 xen/common/version.c       | 23 +++++++++++++++++++++--
 xen/drivers/char/console.c |  8 +++-----
 xen/include/xen/lib.h      |  3 +++
 4 files changed, 31 insertions(+), 7 deletions(-)

diff --git a/xen/common/keyhandler.c b/xen/common/keyhandler.c
index 6ea54838d4..0bb842ec00 100644
--- a/xen/common/keyhandler.c
+++ b/xen/common/keyhandler.c
@@ -129,6 +129,10 @@ static void cf_check show_handlers(unsigned char key)
     unsigned int i;
=20
     printk("'%c' pressed -> showing installed handlers\n", key);
+
+    print_version();
+    print_build_id();
+
     for ( i =3D 0; i < ARRAY_SIZE(key_table); i++ )
         if ( key_table[i].fn )
             printk(" key '%c' (ascii '%02x') =3D> %s\n",
diff --git a/xen/common/version.c b/xen/common/version.c
index bc3714b45f..b20754dfad 100644
--- a/xen/common/version.c
+++ b/xen/common/version.c
@@ -210,9 +210,28 @@ void __init xen_build_init(void)
         }
     }
 #endif /* CONFIG_X86 */
-    if ( !rc )
-        printk(XENLOG_INFO "build-id: %*phN\n", build_id_len, build_id_p);
 }
+
+void print_version(void)
+{
+    printk("Xen version %d.%d%s (%s@%s) (%s) %s %s\n",
+           xen_major_version(), xen_minor_version(), xen_extra_version(),
+           xen_compile_by(), xen_compile_domain(), xen_compiler(),
+           xen_build_info(), xen_compile_date());
+
+    printk("Latest ChangeSet: %s\n", xen_changeset());
+}
+
+void print_build_id(void)
+{
+    /*
+     * NB: build_id_len may be 0 if XEN_HAS_BUILD_ID=3Dn.
+     * Do not print empty build-id.
+     */
+    if ( build_id_len )
+        printk("build-id: %*phN\n", build_id_len, build_id_p);
+}
+
 #endif /* BUILD_ID */
 /*
  * Local variables:
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 07b14b7b3f..2e23910dfa 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -1020,14 +1020,12 @@ void __init console_init_preirq(void)
     nrspin_lock(&console_lock);
     __putstr(xen_banner());
     nrspin_unlock(&console_lock);
-    printk("Xen version %d.%d%s (%s@%s) (%s) %s %s\n",
-           xen_major_version(), xen_minor_version(), xen_extra_version(),
-           xen_compile_by(), xen_compile_domain(), xen_compiler(),
-           xen_build_info(), xen_compile_date());
-    printk("Latest ChangeSet: %s\n", xen_changeset());
+
+    print_version();
=20
     /* Locate and print the buildid, if applicable. */
     xen_build_init();
+    print_build_id();
=20
     if ( opt_sync_console )
     {
diff --git a/xen/include/xen/lib.h b/xen/include/xen/lib.h
index 81b722ea3e..686899a63e 100644
--- a/xen/include/xen/lib.h
+++ b/xen/include/xen/lib.h
@@ -47,6 +47,9 @@ int parse_signed_integer(const char *name, const char *s,=
 const char *e,
  */
 int cmdline_strcmp(const char *frag, const char *name);
=20
+void print_version(void);
+void print_build_id(void);
+
 #ifdef CONFIG_DEBUG_TRACE
 extern void debugtrace_dump(void);
 extern void debugtrace_printk(const char *fmt, ...)
--=20
2.34.1



