Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3BDAA9DCCE
	for <lists+xen-devel@lfdr.de>; Sat, 26 Apr 2025 20:51:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.969285.1358459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8kc9-0002J3-Es; Sat, 26 Apr 2025 18:51:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 969285.1358459; Sat, 26 Apr 2025 18:51:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u8kc9-0002Gh-Bd; Sat, 26 Apr 2025 18:51:01 +0000
Received: by outflank-mailman (input) for mailman id 969285;
 Sat, 26 Apr 2025 18:51:00 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ssvg=XM=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u8kc8-0002Ax-Ol
 for xen-devel@lists.xenproject.org; Sat, 26 Apr 2025 18:51:00 +0000
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch
 [109.224.244.17]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6373d2e0-22cf-11f0-9ffb-bf95429c2676;
 Sat, 26 Apr 2025 20:50:57 +0200 (CEST)
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
X-Inumbo-ID: 6373d2e0-22cf-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1745693455; x=1745952655;
	bh=X6uxeKFKMREBEvEwoljj8FTQK1jI1qMTSNY4thgCXGA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=J2VsX2RvHNtBKOF1MWCr8P/vnZkDDYrpgkhzw504QjfI+bHJazcJTsU8AUtcKlV0b
	 b002yx9LYx8IqLi9kCpFZylE2QIRckFvOXCZjisLxEtoHTKhM1epkqJeqEfbPK2wPw
	 BBPb86bNVzhS/AZlMjlIZ1RXTkr0Wz6GYh9NOnXUMERROKz8IqVQLbCZrpdvV2+aED
	 TFny+QFVAwQQzhMxKIQKJY2H4CPT4pMgP17nRLGNh6Pl8ODTZgy7DeQlK6dCEvaFE9
	 H7pkue52KgkaHbrR1K33wff7PdlnGYco2R5WyL/gTedFNYEUrwLGg5DRN+FApyu+Te
	 Ne9Rgsrs0Ul9Q==
Date: Sat, 26 Apr 2025 18:50:49 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v2 2/3] xen/console: introduce console_puts()
Message-ID: <20250426185021.100646-3-dmukhin@ford.com>
In-Reply-To: <20250426185021.100646-1-dmukhin@ford.com>
References: <20250426185021.100646-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 0960ffa58a63e1250a63a949ef5df9fb8a6dbd79
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>

guest_console_write() duplicates the code from __putstr(), eliminate code
duplication.

Introduce console_puts() for writing a buffer to console devices.

Also, introduce internal console flags to control which console devices
should be used.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes v1->v2:
- fixed locking in dump_console_ring_key()
---
 xen/drivers/char/console.c | 117 ++++++++++++++++++++++---------------
 1 file changed, 71 insertions(+), 46 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index aaa97088aa..8f882a47d1 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -41,6 +41,20 @@
 #include <asm/vpl011.h>
 #endif
=20
+/* Internal console flags. */
+enum {
+    CONSOLE_SERIAL  =3D BIT(0, U),    /* Use serial device. */
+    CONSOLE_PV      =3D BIT(1, U),    /* Use PV console. */
+    CONSOLE_VIDEO   =3D BIT(2, U),    /* Use video device. */
+    CONSOLE_DEBUG   =3D BIT(3, U),    /* Use debug device. */
+    CONSOLE_RING    =3D BIT(4, U),    /* Use console ring. */
+    CONSOLE_DEFAULT =3D CONSOLE_SERIAL | CONSOLE_PV | CONSOLE_VIDEO |
+                      CONSOLE_DEBUG,
+    CONSOLE_ALL     =3D CONSOLE_DEFAULT | CONSOLE_RING,
+};
+
+static void console_puts(const char *str, size_t len, unsigned int flags);
+
 /* console: comma-separated list of console outputs. */
 static char __initdata opt_console[30] =3D OPT_CONSOLE_STR;
 string_param("console", opt_console);
@@ -338,8 +352,6 @@ static bool console_locks_busted;
=20
 static void conring_puts(const char *str, size_t len)
 {
-    ASSERT(rspin_is_locked(&console_lock));
-
     while ( len-- )
         conring[CONRING_IDX_MASK(conringp++)] =3D *str++;
=20
@@ -432,9 +444,6 @@ void console_serial_puts(const char *s, size_t nr)
         serial_steal_fn(s, nr);
     else
         serial_puts(sercon_handle, s, nr);
-
-    /* Copy all serial output into PV console */
-    pv_console_puts(s, nr);
 }
=20
 static void cf_check dump_console_ring_key(unsigned char key)
@@ -442,6 +451,7 @@ static void cf_check dump_console_ring_key(unsigned cha=
r key)
     uint32_t idx, len, sofar, c;
     unsigned int order;
     char *buf;
+    unsigned long flags;
=20
     printk("'%c' pressed -> dumping console ring buffer (dmesg)\n", key);
=20
@@ -455,6 +465,8 @@ static void cf_check dump_console_ring_key(unsigned cha=
r key)
         return;
     }
=20
+    flags =3D console_lock_recursive_irqsave();
+
     c =3D conringc;
     sofar =3D 0;
     while ( (c !=3D conringp) )
@@ -468,8 +480,9 @@ static void cf_check dump_console_ring_key(unsigned cha=
r key)
         c +=3D len;
     }
=20
-    console_serial_puts(buf, sofar);
-    video_puts(buf, sofar);
+    console_puts(buf, sofar, CONSOLE_SERIAL | CONSOLE_VIDEO | CONSOLE_PV);
+
+    console_unlock_recursive_irqrestore(flags);
=20
     free_xenheap_pages(buf, order);
 }
@@ -618,11 +631,61 @@ static inline void xen_console_write_debug_port(const=
 char *buf, size_t len)
 }
 #endif
=20
+static inline void console_debug_puts(const char *str, size_t len)
+{
+#ifdef CONFIG_X86
+    if ( opt_console_xen )
+    {
+        if ( xen_guest )
+            xen_hypercall_console_write(str, len);
+        else
+            xen_console_write_debug_port(str, len);
+    }
+#endif
+}
+
+/*
+ * Write buffer to all enabled console devices.
+ *
+ * That will handle all possible scenarios working w/ console
+ * - physical console (serial console, VGA console (x86 only));
+ * - PV console;
+ * - debug console (x86 only): debug I/O port or __HYPERVISOR_console_io
+ *   hypercall;
+ * - console ring.
+ */
+static void console_puts(const char *str, size_t len, unsigned int flags)
+{
+    ASSERT(rspin_is_locked(&console_lock));
+
+    if ( flags & CONSOLE_SERIAL )
+        console_serial_puts(str, len);
+
+    if ( flags & CONSOLE_PV )
+        pv_console_puts(str, len);
+
+    if ( flags & CONSOLE_VIDEO )
+        video_puts(str, len);
+
+    if ( flags & CONSOLE_DEBUG )
+        console_debug_puts(str, len);
+
+    if ( flags & CONSOLE_RING )
+        conring_puts(str, len);
+}
+
+static inline void __putstr(const char *str)
+{
+    console_puts(str, strlen(str), CONSOLE_ALL);
+}
+
 static long guest_console_write(XEN_GUEST_HANDLE_PARAM(char) buffer,
                                 unsigned int count)
 {
     char kbuf[128];
     unsigned int kcount =3D 0;
+    unsigned int flags =3D opt_console_to_ring
+                         ? CONSOLE_ALL : CONSOLE_DEFAULT;
     struct domain *cd =3D current->domain;
=20
     while ( count > 0 )
@@ -640,23 +703,7 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM=
(char) buffer,
         {
             /* Use direct console output as it could be interactive */
             nrspin_lock_irq(&console_lock);
-
-            console_serial_puts(kbuf, kcount);
-            video_puts(kbuf, kcount);
-
-#ifdef CONFIG_X86
-            if ( opt_console_xen )
-            {
-                if ( xen_guest )
-                    xen_hypercall_console_write(kbuf, kcount);
-                else
-                    xen_console_write_debug_port(kbuf, kcount);
-            }
-#endif
-
-            if ( opt_console_to_ring )
-                conring_puts(kbuf, kcount);
-
+            console_puts(kbuf, kcount, flags);
             nrspin_unlock_irq(&console_lock);
         }
         else
@@ -757,28 +804,6 @@ long do_console_io(
  * *****************************************************
  */
=20
-static void __putstr(const char *str)
-{
-    size_t len =3D strlen(str);
-
-    ASSERT(rspin_is_locked(&console_lock));
-
-    console_serial_puts(str, len);
-    video_puts(str, len);
-
-#ifdef CONFIG_X86
-    if ( opt_console_xen )
-    {
-        if ( xen_guest )
-            xen_hypercall_console_write(str, len);
-        else
-            xen_console_write_debug_port(str, len);
-    }
-#endif
-
-    conring_puts(str, len);
-}
-
 static int printk_prefix_check(char *p, char **pp)
 {
     int loglvl =3D -1;
--=20
2.34.1



