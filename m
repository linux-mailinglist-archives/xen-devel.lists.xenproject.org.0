Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE96A680CB
	for <lists+xen-devel@lfdr.de>; Wed, 19 Mar 2025 00:37:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.919910.1324278 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tugUZ-00069s-I0; Tue, 18 Mar 2025 23:37:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 919910.1324278; Tue, 18 Mar 2025 23:37:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tugUZ-00068O-F3; Tue, 18 Mar 2025 23:37:03 +0000
Received: by outflank-mailman (input) for mailman id 919910;
 Tue, 18 Mar 2025 23:37:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6oY5=WF=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tugUX-0003zY-Uk
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 23:37:02 +0000
Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch
 [79.135.106.29]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e3c9c138-0451-11f0-9abc-95dc52dad729;
 Wed, 19 Mar 2025 00:37:01 +0100 (CET)
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
X-Inumbo-ID: e3c9c138-0451-11f0-9abc-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=3f5ub7udzjca3a7xuimpehsshq.protonmail; t=1742341020; x=1742600220;
	bh=44jWyUHkeGYsWs6B7WroNwJN7y0NMAav7xOviMoLEyM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=C41k7+eSoxGga9o6SZ5AC/OVvvYkegAtrbS3cN0FfJyfaZC1YTlAyTZIyhYQeCeqK
	 cmXHWKJPDKceR7rlAMjcg+npv7hszu42GH3N02IiSLbtlDWCCoiEgmzM2tXIoiI3iv
	 aGr65dgaftaJEGUL5a9NQylUFhIuTlvKqcokfEcYpqEGt1t+25W+a6ImSYwoyKXH7y
	 IhSYDmyIdqMaFi0FJJLXx1rqAOfBTAIntDBRK/1D3GFxlgFvpbCQB+XFGDfiFEpA6r
	 rAd59/WFNiK48hrOzxRmhi2iFToqu9L3rXxBwRjnRpvAqHTmFtAlxd7fT7zhpH1Uyz
	 yBEZsIsDxY0GQ==
Date: Tue, 18 Mar 2025 23:36:53 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v1 6/8] xen/console: rename console_rx to console_focus
Message-ID: <20250318233617.849903-7-dmukhin@ford.com>
In-Reply-To: <20250318233617.849903-1-dmukhin@ford.com>
References: <20250318233617.849903-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 1c6e008ce3b97861f4cb50bac51ddf416733710b
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Update the symbol name in preparation for the semantic change
to the physical console input owner domain identifier.

No functional change.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/drivers/char/console.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 5910ff701c..3d538510f4 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -465,12 +465,9 @@ static void cf_check dump_console_ring_key(unsigned ch=
ar key)
  * and the DomUs started from Xen at boot.
  */
 #define switch_code (opt_conswitch[0]-'a'+1)
-/*
- * console_rx=3D0 =3D> input to xen
- * console_rx=3D1 =3D> input to dom0 (or the sole shim domain)
- * console_rx=3DN =3D> input to dom(N-1)
- */
-static unsigned int __read_mostly console_rx =3D 0;
+
+/* Console owner domain identifier. */
+static unsigned int __read_mostly console_focus =3D 0;
=20
 #define max_console_rx (domid_top + 1)
=20
@@ -491,9 +488,9 @@ static struct domain *console_get_domain_by_id(domid_t =
domid)
=20
 struct domain *console_get_domain(void)
 {
-    if ( console_rx =3D=3D 0 )
+    if ( console_focus =3D=3D 0 )
             return NULL;
-    return console_get_domain_by_id(console_rx - 1);
+    return console_get_domain_by_id(console_focus - 1);
 }
=20
 void console_put_domain(struct domain *d)
@@ -513,7 +510,7 @@ static bool console_check_focus_by_id(domid_t domid)
=20
 static void console_switch_focus(void)
 {
-    unsigned int next_rx =3D console_rx;
+    unsigned int next_rx =3D console_focus;
=20
     /*
      * Rotate among Xen, dom0 and boot-time created domUs while skipping
@@ -525,7 +522,7 @@ static void console_switch_focus(void)
=20
         if ( next_rx++ >=3D max_console_rx )
         {
-            console_rx =3D 0;
+            console_focus =3D 0;
             printk("*** Serial input to Xen");
             break;
         }
@@ -537,7 +534,7 @@ static void console_switch_focus(void)
=20
         if ( console_check_focus_by_id(domid) )
         {
-            console_rx =3D next_rx;
+            console_focus =3D next_rx;
             printk("*** Serial input to DOM%u", domid);
             break;
         }
@@ -554,7 +551,7 @@ static void __serial_rx(char c)
     struct domain *d;
     int rc =3D 0;
=20
-    if ( console_rx =3D=3D 0 )
+    if ( console_focus =3D=3D 0 )
         return handle_keypress(c, false);
=20
     d =3D console_get_domain();
@@ -1150,7 +1147,7 @@ void __init console_endboot(void)
      * a useful 'how to switch' message.
      */
     if ( opt_conswitch[1] =3D=3D 'x' )
-        console_rx =3D max_console_rx;
+        console_focus =3D max_console_rx;
=20
     register_keyhandler('w', dump_console_ring_key,
                         "synchronously dump console ring buffer (dmesg)", =
0);
--=20
2.34.1



