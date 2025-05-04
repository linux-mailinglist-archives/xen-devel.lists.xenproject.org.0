Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B53DAA88E4
	for <lists+xen-devel@lfdr.de>; Sun,  4 May 2025 20:15:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.975646.1363019 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uBdrV-0002Yn-OW; Sun, 04 May 2025 18:14:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 975646.1363019; Sun, 04 May 2025 18:14:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uBdrV-0002Ww-Kh; Sun, 04 May 2025 18:14:49 +0000
Received: by outflank-mailman (input) for mailman id 975646;
 Sun, 04 May 2025 18:14:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hwa9=XU=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uBdrU-0002WI-J0
 for xen-devel@lists.xenproject.org; Sun, 04 May 2025 18:14:48 +0000
Received: from mail-10630.protonmail.ch (mail-10630.protonmail.ch
 [79.135.106.30]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8d4225d-2913-11f0-9eb4-5ba50f476ded;
 Sun, 04 May 2025 20:14:46 +0200 (CEST)
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
X-Inumbo-ID: a8d4225d-2913-11f0-9eb4-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1746382484; x=1746641684;
	bh=jf7ue76YeYbPS45zsnt2Hb+wcYuAiLcM/Jd2uGGzfFU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=dF8nbCWGoEg25pnlwC5izRVGyWMua1fqzESqPvhIw9KOagc31EEmGFgV/cQXKtYTf
	 8ADLFf8Ptjx9mLDbXusPrgfiGDv1HbJIFjEWD7oHX0z6jroto+C1LsvJqo2LI2Be50
	 BQqGZJdboXBs/4/mTOP6myC/p8FbPo3Fw1d5Z/Yd+Tudkhz+ca1KpJky90eWjtghUt
	 iyulzeiDiLnLHL6wIcjMAf0ZH6QoXdhPMoUDt2GAsqz2a0WfyWZ3SOhd8EP5CfpqNN
	 Pryk49Cd2Novd7uRKKmnv+Ld/tHApbkUCf284iibgmEKBOG24vyXqiFTToT+nIX8Ji
	 Z2FM8cNvfARsg==
Date: Sun, 04 May 2025 18:14:40 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v3 2/3] xen/console: introduce console_puts()
Message-ID: <20250504181423.2302345-3-dmukhin@ford.com>
In-Reply-To: <20250504181423.2302345-1-dmukhin@ford.com>
References: <20250504181423.2302345-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: b40dda7706d8352a9e5e0b9586d29980cb6f07ce
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>

guest_console_write() duplicates the code from __putstr(), eliminate code
duplication.

Introduce console_puts() for writing a buffer to console devices.

Also, introduce internal console flags to control which console devices
should be used.

No functional change intended.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v2:
- added CONSOLE_RING_VIRQ flag
- dropped locking changes
---
 xen/drivers/char/console.c | 123 ++++++++++++++++++++++++-------------
 1 file changed, 79 insertions(+), 44 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 20504060cb..b788427aa5 100644
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
+static void console_puts(const char *str, size_t len, unsigned int flags);
+
 /* console: comma-separated list of console outputs. */
 static char __initdata opt_console[30] =3D OPT_CONSOLE_STR;
 string_param("console", opt_console);
@@ -431,9 +453,6 @@ void console_serial_puts(const char *s, size_t nr)
         serial_steal_fn(s, nr);
     else
         serial_puts(sercon_handle, s, nr);
-
-    /* Copy all serial output into PV console */
-    pv_console_puts(s, nr);
 }
=20
 static void cf_check dump_console_ring_key(unsigned char key)
@@ -467,8 +486,7 @@ static void cf_check dump_console_ring_key(unsigned cha=
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
@@ -617,11 +635,66 @@ static inline void xen_console_write_debug_port(const=
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
+        conring_puts(str, len, !!(flags & CONSOLE_RING_VIRQ) );
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
+    console_puts(str, strlen(str), flags);
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
@@ -639,23 +712,7 @@ static long guest_console_write(XEN_GUEST_HANDLE_PARAM=
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
-                conring_puts(kbuf, kcount, true);
-
+            console_puts(kbuf, kcount, flags);
             nrspin_unlock_irq(&console_lock);
         }
         else
@@ -756,28 +813,6 @@ long do_console_io(
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
-    conring_puts(str, len, !conring_no_notify);
-}
-
 static int printk_prefix_check(char *p, char **pp)
 {
     int loglvl =3D -1;
--=20
2.34.1



