Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9492AABC7F4
	for <lists+xen-devel@lfdr.de>; Mon, 19 May 2025 21:40:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.990219.1374183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH6Lk-0004wa-EJ; Mon, 19 May 2025 19:40:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 990219.1374183; Mon, 19 May 2025 19:40:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH6Lk-0004tU-Ar; Mon, 19 May 2025 19:40:36 +0000
Received: by outflank-mailman (input) for mailman id 990219;
 Mon, 19 May 2025 19:40:34 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wD6k=YD=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uH6Li-0004IZ-GC
 for xen-devel@lists.xenproject.org; Mon, 19 May 2025 19:40:34 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 21412ce4-34e9-11f0-a2fa-13f23c93f187;
 Mon, 19 May 2025 21:40:34 +0200 (CEST)
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
X-Inumbo-ID: 21412ce4-34e9-11f0-a2fa-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1747683633; x=1747942833;
	bh=Jbx/DmBBhad1ynkFBQ4ytgn26HdzCVmyX+znU/mgQIM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=D4Iag1UUjfvjjjmL/rrkxzt5BMQLW961ZzRYHMaPYS43dVmzW2UzSPpfvPggugiDL
	 GnzsDI8TERZMLA0mRNkMhBMDn/UiPUI21OjYBJcaZy3hBTQIzcbLPWd8sH50nLM0un
	 MRDUqoDHJZEK172YgMr3kAqXp7Lg+/cHyYSSatoECAeYeXb1czO2f/3NTzBazYlEjQ
	 S2836agH2vjOb1ioeV9HN/6CavYmD8a+wmOYIXV2gHMyz6we2Eq5TpZSHdR8LDj3u2
	 S7G3/WUalHEJWmwlMD5/sfdqG8bpCyoUdL7+fbRXGahx5rnDBBqeyyJAouplCXnb8H
	 fzhOWpADCVq/w==
Date: Mon, 19 May 2025 19:40:28 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v5 2/3] xen/console: introduce console_send()
Message-ID: <20250519194002.1365454-3-dmukhin@ford.com>
In-Reply-To: <20250519194002.1365454-1-dmukhin@ford.com>
References: <20250519194002.1365454-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 6259aa80ae5cb55d00b8a9b3c9137349884dca56
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>

guest_console_write() duplicates the code from __putstr(), eliminate code
duplication.

Introduce console_send() for sending a message on console devices.

Also, introduce internal console flags to control which console devices
should be used.

No functional change intended.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v4:
- fixup for console_send(): do CONSOLE_RING_VIRQ flag processing under
  CONSOLE_RING
---
 xen/drivers/char/console.c | 133 +++++++++++++++++++++++--------------
 1 file changed, 84 insertions(+), 49 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index b4757844e6..0c0cc6677c 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -41,6 +41,28 @@
 #include <asm/vpl011.h>
 #endif
=20
+/* Internal console flags. */
+enum {
+    CONSOLE_SERIAL          =3D BIT(0, U),    /* Use serial device. */
+    CONSOLE_PV              =3D BIT(1, U),    /* Use PV console. */
+    CONSOLE_VIDEO           =3D BIT(2, U),    /* Use video device. */
+    CONSOLE_DEBUG           =3D BIT(3, U),    /* Use debug device. */
+    CONSOLE_RING            =3D BIT(4, U),    /* Use console ring. */
+    CONSOLE_RING_VIRQ       =3D BIT(5, U),    /* Use console ring VIRQ. */
+
+    /* Default console flags. */
+    CONSOLE_DEFAULT         =3D CONSOLE_SERIAL |
+                              CONSOLE_PV |
+                              CONSOLE_VIDEO |
+                              CONSOLE_RING_VIRQ |
+                              CONSOLE_DEBUG,
+
+    /* Use all known console devices. */
+    CONSOLE_ALL             =3D CONSOLE_DEFAULT | CONSOLE_RING,
+};
+
+static void console_send(const char *str, size_t len, unsigned int flags);
+
 /* console: comma-separated list of console outputs. */
 static char __initdata opt_console[30] =3D OPT_CONSOLE_STR;
 string_param("console", opt_console);
@@ -428,9 +450,6 @@ void console_serial_puts(const char *s, size_t nr)
         serial_steal_fn(s, nr);
     else
         serial_puts(sercon_handle, s, nr);
-
-    /* Copy all serial output into PV console */
-    pv_console_puts(s, nr);
 }
=20
 static void cf_check dump_console_ring_key(unsigned char key)
@@ -464,8 +483,7 @@ static void cf_check dump_console_ring_key(unsigned cha=
r key)
         c +=3D len;
     }
=20
-    console_serial_puts(buf, sofar);
-    video_puts(buf, sofar);
+    console_send(buf, sofar, CONSOLE_SERIAL | CONSOLE_VIDEO | CONSOLE_PV);
=20
     free_xenheap_pages(buf, order);
 }
@@ -614,11 +632,71 @@ static inline void xen_console_write_debug_port(const=
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
+ * Send a message on console device(s).
+ *
+ * That will handle all possible scenarios working w/ console
+ * - physical console (serial console, VGA console (x86 only));
+ * - PV console;
+ * - debug console (x86 only): debug I/O port or __HYPERVISOR_console_io
+ *   hypercall;
+ * - console ring.
+ */
+static void console_send(const char *str, size_t len, unsigned int flags)
+{
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
+    {
+        conring_puts(str, len);
+
+        if ( flags & CONSOLE_RING_VIRQ )
+            tasklet_schedule(&conring_tasklet);
+    }
+}
+
+static inline void __putstr(const char *str)
+{
+    unsigned int flags =3D CONSOLE_ALL;
+
+    ASSERT(rspin_is_locked(&console_lock));
+
+    if ( conring_no_notify )
+        flags &=3D ~CONSOLE_RING_VIRQ;
+
+    console_send(str, strlen(str), flags);
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
@@ -636,26 +714,7 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM=
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
-            {
-                conring_puts(kbuf, kcount);
-                tasklet_schedule(&conring_tasklet);
-            }
-
+            console_send(kbuf, kcount, flags);
             nrspin_unlock_irq(&console_lock);
         }
         else
@@ -756,30 +815,6 @@ long do_console_io(
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
-    if ( !conring_no_notify )
-        tasklet_schedule(&conring_tasklet);
-}
-
 static int printk_prefix_check(char *p, char **pp)
 {
     int loglvl =3D -1;
--=20
2.34.1



