Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63666A35097
	for <lists+xen-devel@lfdr.de>; Thu, 13 Feb 2025 22:42:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.888044.1297455 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tigyA-0007Bz-RQ; Thu, 13 Feb 2025 21:42:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 888044.1297455; Thu, 13 Feb 2025 21:42:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tigyA-00079Y-O9; Thu, 13 Feb 2025 21:42:02 +0000
Received: by outflank-mailman (input) for mailman id 888044;
 Thu, 13 Feb 2025 21:42:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bpFt=VE=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tigy7-00079S-Vk
 for xen-devel@lists.xenproject.org; Thu, 13 Feb 2025 21:42:01 +0000
Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch
 [79.135.106.29]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 58cd03d6-ea53-11ef-9aa4-95dc52dad729;
 Thu, 13 Feb 2025 22:41:56 +0100 (CET)
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
X-Inumbo-ID: 58cd03d6-ea53-11ef-9aa4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1739482915; x=1739742115;
	bh=ueq9evstRgYvEEE2mD5DXcC3/CANXT3gVxX9JaeIQDI=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=DxkeXdUz1xIvKE0rh72P91aoLPeh5xDN2N+z7YJqfRy7wrFIUIWrrETkDnx+DlA7c
	 Q8oMXnfplh6TB2J9pbryRIcOKm+u9PZAODxSFZygJbc/IfpC7stKWOcpZdkWtNqV31
	 ugH/wsffPyU6gGHeg0XkDMixr97+wPTMo3fUTKHcGCBj+0aJo+lxqGpiTqQQ3OnKCh
	 DxHV2QPNM+IRsJPaVIpmLx7hUbmyGzZabNAcR7e07VCE01M4wBbuRBVi+yClMDRmm/
	 qY4kXYEJUTrzkpzRogcFUlr7WBBxUGXAl2xK+OWCnc/q1g/Eb2owbDCi3AaC/L9W6b
	 AVpZQ1TvUv8Jw==
Date: Thu, 13 Feb 2025 21:41:49 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v3] xen/console: print Xen version via keyhandler
Message-ID: <20250213214054.1745501-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 586d9eeb0661bd1c2637b2ba72f8db3e6dec44e0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Add Xen version printout to 'h' keyhandler output.

That is useful for debugging systems that have been left intact for a long
time.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v2:
- moved new function declarations to xen/lib.h
- dropped xen_ prefix in new functions
---
 xen/common/keyhandler.c    |  4 ++++
 xen/common/version.c       | 20 ++++++++++++++++++--
 xen/drivers/char/console.c |  8 +++-----
 xen/include/xen/lib.h      |  3 +++
 4 files changed, 28 insertions(+), 7 deletions(-)

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
index bc3714b45f..8672d5544e 100644
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
+    BUG_ON(!build_id_p);
+    BUG_ON(!build_id_len);
+    printk(XENLOG_INFO "build-id: %*phN\n", build_id_len, build_id_p);
+}
+
 #endif /* BUILD_ID */
 /*
  * Local variables:
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 73d24a7821..235d55bbff 100644
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



