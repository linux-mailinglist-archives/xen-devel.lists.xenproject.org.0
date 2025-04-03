Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 073E0A79934
	for <lists+xen-devel@lfdr.de>; Thu,  3 Apr 2025 02:07:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.936148.1337469 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u086N-0002L4-AG; Thu, 03 Apr 2025 00:06:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 936148.1337469; Thu, 03 Apr 2025 00:06:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u086N-0002IR-70; Thu, 03 Apr 2025 00:06:35 +0000
Received: by outflank-mailman (input) for mailman id 936148;
 Thu, 03 Apr 2025 00:06:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Em9L=WV=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1u086M-0001pF-4S
 for xen-devel@lists.xenproject.org; Thu, 03 Apr 2025 00:06:34 +0000
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch
 [109.224.244.17]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 80412bcb-101f-11f0-9eaa-5ba50f476ded;
 Thu, 03 Apr 2025 02:06:33 +0200 (CEST)
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
X-Inumbo-ID: 80412bcb-101f-11f0-9eaa-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1743638792; x=1743897992;
	bh=DJWq/Ys6nmpLJsXwbo5VcgkgnUs3GTyXmEBcuGoVeyo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=j/stRxmIQoJIllzxWPVBCAYzIBg1i89TD0fYa10MFfZnfrOIqUT0DJ0EbG4fXzbEU
	 +11HUlDCoIv9BVigGf5mAsqEbNs3vsBYTDTmm+TngsTSOC4DsKGhcIW6N/Jehtou54
	 5c/rSwAn35jU7lStZEjig2WCiXv/7TW4u8UHZLT2GL2a/JTuKfrf0zuO61h+ffzLNd
	 obf95oPi7SweOKbGxDqolF0McnZPwD21Grtmj60TV2/6zMVt6UddZGPo1J3G4eMVIK
	 8wdZodNGgVro5LrIhUgk1mo6IqchTkf03oiDXBUOIO2XOKA+JtorDVJ2arSAz7USva
	 4o2ziWGOx12Ig==
Date: Thu, 03 Apr 2025 00:06:27 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v1 2/3] xen/console: introduce console_puts()
Message-ID: <20250403000604.169619-3-dmukhin@ford.com>
In-Reply-To: <20250403000604.169619-1-dmukhin@ford.com>
References: <20250403000604.169619-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: cb58e55f650cb81c34a5b94f37bd90dc617546e1
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
 xen/drivers/char/console.c | 112 ++++++++++++++++++++++---------------
 1 file changed, 66 insertions(+), 46 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index aaa97088aa..2618c2e47d 100644
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
@@ -468,8 +477,7 @@ static void cf_check dump_console_ring_key(unsigned cha=
r key)
         c +=3D len;
     }
=20
-    console_serial_puts(buf, sofar);
-    video_puts(buf, sofar);
+    console_puts(buf, sofar, CONSOLE_SERIAL | CONSOLE_VIDEO | CONSOLE_PV);
=20
     free_xenheap_pages(buf, order);
 }
@@ -618,11 +626,61 @@ static inline void xen_console_write_debug_port(const=
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
@@ -640,23 +698,7 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM=
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
@@ -757,28 +799,6 @@ long do_console_io(
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



