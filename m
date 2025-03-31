Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F68A77144
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 01:10:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.933159.1335190 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzOHB-0007Wa-1x; Mon, 31 Mar 2025 23:10:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 933159.1335190; Mon, 31 Mar 2025 23:10:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzOHA-0007TX-Uj; Mon, 31 Mar 2025 23:10:40 +0000
Received: by outflank-mailman (input) for mailman id 933159;
 Mon, 31 Mar 2025 23:10:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MI1n=WS=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tzOCv-0003Id-9M
 for xen-devel@lists.xenproject.org; Mon, 31 Mar 2025 23:06:17 +0000
Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch
 [79.135.106.29]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bf3b71f5-0e84-11f0-9ffb-bf95429c2676;
 Tue, 01 Apr 2025 01:06:15 +0200 (CEST)
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
X-Inumbo-ID: bf3b71f5-0e84-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1743462374; x=1743721574;
	bh=nA0e2TwhrmernoJeWCrYjCUgWR7cF87XdlQEarMxjlo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=C6nqmLNoL0nngaACQE0eRKjc2s9vhF7zfdMbcxNdvETuI/R0oRSeLe64aXvCDwrD2
	 BgLS/D3PTGou0OmQiTiNy+IwITGqtVHncvV4+gAQlBk+ReMDJ4S0lKmKjjI19k5AuD
	 IEKZ1VldXSX7+cI8WYC7ZQnB6Civpc+fDs0IgoOwCmWAgdcOK53FkEjNLkSLtea+TR
	 pjPID1RgMXiTv5Mzd2bXewXe0IiLJylQ0rJ4EkiOA6gkc/zwnTeRZAsMvoqWGE3Br2
	 jW0/aLBr0HBMYjMyeW356e1i/9p7J66NTpdsMBDLXq+3+2LUSTZdqxq01IjNc3Lb2a
	 MBRdli7mNQ4wg==
Date: Mon, 31 Mar 2025 23:06:05 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v2 6/7] xen/console: introduce console_set_focus()
Message-ID: <20250331230508.440198-7-dmukhin@ford.com>
In-Reply-To: <20250331230508.440198-1-dmukhin@ford.com>
References: <20250331230508.440198-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 9cf4c79d70e4712c1505e0ff6c87326deab81cd4
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>

Switch console_focus address space from integers mapped to domain IDs to
direct domain IDs, simplifying the console input switching code.

Introduce console_set_focus() to set the console owner domain identifier.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v1:
- update console_focus description
---
 xen/drivers/char/console.c | 88 ++++++++++++++++----------------------
 1 file changed, 37 insertions(+), 51 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 42974c0af7..9905ffd6b9 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -462,17 +462,12 @@ static void cf_check dump_console_ring_key(unsigned c=
har key)
=20
 /*
  * CTRL-<switch_char> changes input direction, rotating among Xen, Dom0,
- * and the DomUs started from Xen at boot.
+ * and the DomUs.
  */
 #define switch_code (opt_conswitch[0]-'a'+1)
-/*
- * console_rx=3D0 =3D> input to xen
- * console_rx=3D1 =3D> input to dom0 (or the sole shim domain)
- * console_rx=3DN =3D> input to dom(N-1)
- */
-static unsigned int __read_mostly console_focus =3D 0;
=20
-#define max_console_rx (domid_top() + 1)
+/* Console owner domain identifier. */
+static domid_t __read_mostly console_focus =3D DOMID_XEN;
=20
 static struct domain *console_get_domain_by_id(domid_t domid)
 {
@@ -491,9 +486,7 @@ static struct domain *console_get_domain_by_id(domid_t =
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
@@ -511,42 +504,43 @@ static bool console_is_input_allowed(domid_t domid)
     return !!d;
 }
=20
-static void console_switch_input(void)
+/*
+ * Set owner of the physical console input.
+ */
+static bool cf_check console_set_focus(domid_t domid)
 {
-    unsigned int next_rx =3D console_focus;
+    if ( domid =3D=3D DOMID_XEN )
+        printk("*** Serial input to Xen");
+    else if ( console_is_input_allowed(domid) )
+        printk("*** Serial input to DOM%u", domid);
+    else
+        return false;
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
-        if ( console_is_input_allowed(domid) )
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
+    return true;
+}
+
+/*
+ * Switch console focus.
+ * Rotates input focus among Xen and domains with console input permission=
.
+ */
+static void console_switch_input(void)
+{
+    const domid_t n =3D domid_top() + 1;
+    domid_t i =3D ( console_focus =3D=3D DOMID_XEN )
+                ? get_initial_domain_id() : console_focus + 1;
+
+    for ( ; i < n; i++ )
+        if ( console_set_focus(i) )
+            return;
+
+    ASSERT(console_set_focus(DOMID_XEN));
 }
=20
 static void __serial_rx(char c)
@@ -554,7 +548,7 @@ static void __serial_rx(char c)
     struct domain *d;
     int rc =3D 0;
=20
-    if ( console_focus =3D=3D 0 )
+    if ( console_focus =3D=3D DOMID_XEN )
         return handle_keypress(c, false);
=20
     d =3D console_get_domain();
@@ -1129,14 +1123,6 @@ void __init console_endboot(void)
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
@@ -1146,8 +1132,8 @@ void __init console_endboot(void)
     register_irq_keyhandler('G', &do_toggle_guest,
                             "toggle host/guest log level adjustment", 0);
=20
-    /* Serial input is directed to DOM0 by default. */
-    console_switch_input();
+    if ( opt_conswitch[1] !=3D 'x' )
+        (void)console_set_focus(get_initial_domain_id());
 }
=20
 int __init console_has(const char *device)
--=20
2.34.1



