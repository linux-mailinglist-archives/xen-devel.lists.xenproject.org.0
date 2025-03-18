Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 037E9A680C7
	for <lists+xen-devel@lfdr.de>; Wed, 19 Mar 2025 00:37:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.919915.1324289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tugUd-0006aA-WE; Tue, 18 Mar 2025 23:37:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 919915.1324289; Tue, 18 Mar 2025 23:37:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tugUd-0006XK-SM; Tue, 18 Mar 2025 23:37:07 +0000
Received: by outflank-mailman (input) for mailman id 919915;
 Tue, 18 Mar 2025 23:37:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6oY5=WF=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tugUc-0004Rg-OM
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 23:37:06 +0000
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e62e5ca6-0451-11f0-9899-31a8f345e629;
 Wed, 19 Mar 2025 00:37:05 +0100 (CET)
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
X-Inumbo-ID: e62e5ca6-0451-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1742341024; x=1742600224;
	bh=t/sF/l8n4hvHC7Py3lxhnLyK1qkxCg/TVTQUmwT1xmE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=QnQc37B0lZ/5ePkqQQCbS5q7w6GGJ5ZlyguFpYe7LxdSzft8LneyBeVAacN6/DR4L
	 koJZBgGRkJS8NLH5XnMisWGT0FuS8bWM8+tIXmeahENkyXLLUJuJWdTwYFbNG6COhP
	 lYRydQngnzdg7SJVPF7EzdcMK++4vEUOUFLp9A7f67c965GayxoDtxk+C0Mgd83Op6
	 ZJVvltI7DponNppJUMwd7CJ+rsk5y+mp0KIhVBJOD5GjFTCifAx+s1zp3XMnwG0cvc
	 3iY7S5v+DMdDcFhLhSSgS9PtyO35ZUJ+fsF8i3SwJRLNIVkgKxAqtZlmTyog4QJvih
	 ZCFIujC1/UvMA==
Date: Tue, 18 Mar 2025 23:37:00 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v1 7/8] xen/console: introduce console_set_focus()
Message-ID: <20250318233617.849903-8-dmukhin@ford.com>
In-Reply-To: <20250318233617.849903-1-dmukhin@ford.com>
References: <20250318233617.849903-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: fd269600793e4dda519a7b9dcfd7ee8a580717a5
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Switch console_focus address space from integers mapped to domain IDs to
direct domain IDs, simplifying the console input switching code.

Introduce console_set_focus() to set the console owner domain identifier.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/drivers/char/console.c | 81 ++++++++++++++++----------------------
 1 file changed, 34 insertions(+), 47 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 3d538510f4..0e2349a868 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -462,14 +462,12 @@ static void cf_check dump_console_ring_key(unsigned c=
har key)
=20
 /*
  * CTRL-<switch_char> changes input direction, rotating among Xen, Dom0,
- * and the DomUs started from Xen at boot.
+ * and the DomUs.
  */
 #define switch_code (opt_conswitch[0]-'a'+1)
=20
 /* Console owner domain identifier. */
-static unsigned int __read_mostly console_focus =3D 0;
-
-#define max_console_rx (domid_top + 1)
+static domid_t __read_mostly console_focus =3D DOMID_XEN;
=20
 static struct domain *console_get_domain_by_id(domid_t domid)
 {
@@ -488,9 +486,7 @@ static struct domain *console_get_domain_by_id(domid_t =
domid)
=20
 struct domain *console_get_domain(void)
 {
-    if ( console_focus =3D=3D 0 )
-            return NULL;
-    return console_get_domain_by_id(console_focus - 1);
+    return console_get_domain_by_id(console_focus);
 }
=20
 void console_put_domain(struct domain *d)
@@ -508,42 +504,41 @@ static bool console_check_focus_by_id(domid_t domid)
     return !!d;
 }
=20
-static void console_switch_focus(void)
+static int console_set_focus(domid_t domid)
 {
-    unsigned int next_rx =3D console_focus;
+    if ( domid =3D=3D DOMID_XEN )
+        printk("*** Serial input to Xen");
+    else if ( console_check_focus_by_id(domid) )
+        printk("*** Serial input to DOM%u", domid);
+    else
+        return -ENOENT;
=20
-    /*
-     * Rotate among Xen, dom0 and boot-time created domUs while skipping
-     * switching serial input to non existing domains.
-     */
-    for ( ; ; )
-    {
-        domid_t domid;
-
-        if ( next_rx++ >=3D max_console_rx )
-        {
-            console_focus =3D 0;
-            printk("*** Serial input to Xen");
-            break;
-        }
-
-        if ( consoled_is_enabled() && next_rx =3D=3D 1 )
-            domid =3D get_initial_domain_id();
-        else
-            domid =3D next_rx - 1;
-
-        if ( console_check_focus_by_id(domid) )
-        {
-            console_focus =3D next_rx;
-            printk("*** Serial input to DOM%u", domid);
-            break;
-        }
-    }
+    console_focus =3D domid;
=20
     if ( switch_code )
         printk(" (type 'CTRL-%c' three times to switch input)",
                opt_conswitch[0]);
     printk("\n");
+
+    return 0;
+}
+
+/*
+ * Switch console focus.
+ * Rotates input focus among Xen, dom0 and boot-time created domUs while
+ * skipping switching serial input to non existing domains.
+ */
+static void console_switch_focus(void)
+{
+    const domid_t n =3D domid_top + 1;
+    domid_t i =3D ( console_focus =3D=3D DOMID_XEN )
+                ? get_initial_domain_id() : console_focus + 1;
+
+    for ( ; i < n; i++ )
+        if ( !console_set_focus(i) )
+            return;
+
+    console_set_focus(DOMID_XEN);
 }
=20
 static void __serial_rx(char c)
@@ -551,7 +546,7 @@ static void __serial_rx(char c)
     struct domain *d;
     int rc =3D 0;
=20
-    if ( console_focus =3D=3D 0 )
+    if ( console_focus =3D=3D DOMID_XEN )
         return handle_keypress(c, false);
=20
     d =3D console_get_domain();
@@ -1141,14 +1136,6 @@ void __init console_endboot(void)
=20
     video_endboot();
=20
-    /*
-     * If user specifies so, we fool the switch routine to redirect input
-     * straight back to Xen. I use this convoluted method so we still prin=
t
-     * a useful 'how to switch' message.
-     */
-    if ( opt_conswitch[1] =3D=3D 'x' )
-        console_focus =3D max_console_rx;
-
     register_keyhandler('w', dump_console_ring_key,
                         "synchronously dump console ring buffer (dmesg)", =
0);
     register_irq_keyhandler('+', &do_inc_thresh,
@@ -1158,8 +1145,8 @@ void __init console_endboot(void)
     register_irq_keyhandler('G', &do_toggle_guest,
                             "toggle host/guest log level adjustment", 0);
=20
-    /* Serial input is directed to DOM0 by default. */
-    console_switch_focus();
+    if ( opt_conswitch[1] !=3D 'x' )
+        console_set_focus( get_initial_domain_id() );
 }
=20
 int __init console_has(const char *device)
--=20
2.34.1



