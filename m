Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F2374A333BD
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2025 00:58:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.886943.1296531 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiMca-0007Gy-Pp; Wed, 12 Feb 2025 23:58:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 886943.1296531; Wed, 12 Feb 2025 23:58:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tiMca-0007ES-MH; Wed, 12 Feb 2025 23:58:24 +0000
Received: by outflank-mailman (input) for mailman id 886943;
 Wed, 12 Feb 2025 23:58:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O++Y=VD=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tiMcY-0007EM-IC
 for xen-devel@lists.xenproject.org; Wed, 12 Feb 2025 23:58:23 +0000
Received: from mail-40134.protonmail.ch (mail-40134.protonmail.ch
 [185.70.40.134]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3c5dd798-e99d-11ef-a075-877d107080fb;
 Thu, 13 Feb 2025 00:58:20 +0100 (CET)
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
X-Inumbo-ID: 3c5dd798-e99d-11ef-a075-877d107080fb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1739404699; x=1739663899;
	bh=m2DI9DyCU8xzVp+bB2t/MZ+bBhm8G2NFAhBSL35NC4c=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=FFqoX6USIIy4QpTpfh3gdJGzFjL9rrSz9N5lyfEd6keqZ95cJsdq0W5LavKwiXWog
	 Uugx22eXrSGnK1RJXx/VG0KgKNtSzNSBc7i5FLEQDLpJG3FRWu48DXN4BTKuynEV6X
	 00FMx04uXKli+CHc1zXvUAkLDAIcON2TlY3SbBqz4J1qCoM76YO8PWG+k1+uK0i+Uz
	 k1ts+BIAzAsE2x90juMUKnD5LJsGyG6b5J5i9/ViIaUcmxZZNckom8VpvsOhvR4vtv
	 o9x7DzgFCKcQEW7BdMkAgbnKrN6fKUWN3MCbOpnMi14m5GU3UdX56PTw1ivey/njYW
	 /GTL330Euro3w==
Date: Wed, 12 Feb 2025 23:58:13 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH] xen/console: add keyhandler to print Xen version
Message-ID: <20250212235754.3686278-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: c1b9071fd4d1a8fa81e0e30878314423d2805f97
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Add Xen version printout via keyhandler mechanism.

That is useful for debugging systems that have been left intact for a long
time.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/common/version.c       |  2 --
 xen/drivers/char/console.c | 31 ++++++++++++++++++++++++++-----
 2 files changed, 26 insertions(+), 7 deletions(-)

diff --git a/xen/common/version.c b/xen/common/version.c
index bc3714b45f..9e47ff0744 100644
--- a/xen/common/version.c
+++ b/xen/common/version.c
@@ -210,8 +210,6 @@ void __init xen_build_init(void)
         }
     }
 #endif /* CONFIG_X86 */
-    if ( !rc )
-        printk(XENLOG_INFO "build-id: %*phN\n", build_id_len, build_id_p);
 }
 #endif /* BUILD_ID */
 /*
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 73d24a7821..4f945f3bca 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -974,6 +974,28 @@ void guest_printk(const struct domain *d, const char *=
fmt, ...)
     va_end(args);
 }
=20
+static void xen_print_version(void)
+{
+    const char *str =3D NULL;
+    unsigned int str_len;
+
+    printk("Xen version %d.%d%s (%s@%s) (%s) %s %s\n",
+           xen_major_version(), xen_minor_version(), xen_extra_version(),
+           xen_compile_by(), xen_compile_domain(), xen_compiler(),
+           xen_build_info(), xen_compile_date());
+
+    printk("Latest ChangeSet: %s\n", xen_changeset());
+
+    if ( !xen_build_id((const void **)&str, &str_len) )
+        printk(XENLOG_INFO "build-id: %*phN\n", str_len, str);
+}
+
+static void cf_check do_print_version(unsigned char key, bool unused)
+{
+    printk("'%c' pressed -> printing Xen version\n", key);
+    xen_print_version();
+}
+
 void __init console_init_preirq(void)
 {
     char *p;
@@ -1024,15 +1046,12 @@ void __init console_init_preirq(void)
     nrspin_lock(&console_lock);
     __putstr(xen_banner());
     nrspin_unlock(&console_lock);
-    printk("Xen version %d.%d%s (%s@%s) (%s) %s %s\n",
-           xen_major_version(), xen_minor_version(), xen_extra_version(),
-           xen_compile_by(), xen_compile_domain(), xen_compiler(),
-           xen_build_info(), xen_compile_date());
-    printk("Latest ChangeSet: %s\n", xen_changeset());
=20
     /* Locate and print the buildid, if applicable. */
     xen_build_init();
=20
+    xen_print_version();
+
     if ( opt_sync_console )
     {
         serial_start_sync(sercon_handle);
@@ -1120,6 +1139,8 @@ void __init console_endboot(void)
                             "decrease log level threshold", 0);
     register_irq_keyhandler('G', &do_toggle_guest,
                             "toggle host/guest log level adjustment", 0);
+    register_irq_keyhandler('~', &do_print_version,
+                            "print Xen version", 0);
=20
     /* Serial input is directed to DOM0 by default. */
     switch_serial_input();
--=20
2.34.1



