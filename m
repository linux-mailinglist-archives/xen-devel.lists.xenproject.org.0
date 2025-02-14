Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 24093A366A8
	for <lists+xen-devel@lfdr.de>; Fri, 14 Feb 2025 21:06:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.889023.1298262 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tj1wU-0002Fr-95; Fri, 14 Feb 2025 20:05:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 889023.1298262; Fri, 14 Feb 2025 20:05:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tj1wU-0002Dt-5k; Fri, 14 Feb 2025 20:05:42 +0000
Received: by outflank-mailman (input) for mailman id 889023;
 Fri, 14 Feb 2025 20:05:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=w5DB=VF=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tj1wR-0002Dn-Id
 for xen-devel@lists.xenproject.org; Fri, 14 Feb 2025 20:05:40 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0e35d140-eb0f-11ef-9aa4-95dc52dad729;
 Fri, 14 Feb 2025 21:05:37 +0100 (CET)
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
X-Inumbo-ID: 0e35d140-eb0f-11ef-9aa4-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1739563535; x=1739822735;
	bh=4Af2BwETEsgb4ThII3LKOhXNdPRxjI14cuaRBdfuuhs=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=HZVcuTFhOd584/CcnbJ6ZjrBkSAEFDjITvghrj8MjlS+6yMNJDRQWVWaUrMi9STaO
	 270YZKCILL/1hezY54TTNK+I5ljI/XUlJKoddLqVE2QcRNCYtQUC28hi0v0epMv+fr
	 i659oRYPDccUP8ut0CH3VwVnx2UDmvF1/qgargDPRzorDjNhhwzcNWZwt2Qf/BGcOB
	 wkidG0kGE1/bHnJsrk1lVCOX/FpVQU5AkxjECbvBBIJ1WdiuiMeVBnmnaYt2ubHL4G
	 93gw3n0jIdJvLzPBlSvoWol594b6a1TQbAjf8dY+rsu7IXHQdvNICl/sEOPc8l2dzr
	 agtKg1173DTLw==
Date: Fri, 14 Feb 2025 20:05:30 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v4] xen/console: print Xen version via keyhandler
Message-ID: <20250214193615.1812503-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 0df6e225f49559340ff6acfe10de9d6556ef875f
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Add Xen version printout to 'h' keyhandler output.

That is useful for debugging systems that have been left intact for a long
time.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v3:
- Dropped assertions for build_id_p
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
index bc3714b45f..ca1f262a12 100644
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
+     * NB: build_id_p may be NULL if XEN_HAS_BUILD_ID=3Dn.
+     * Do not print empty build-id.
+     */
+    if ( build_id_p )
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



