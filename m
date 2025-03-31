Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 82BDEA77146
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 01:10:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.933164.1335209 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzOHI-0008ND-HP; Mon, 31 Mar 2025 23:10:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 933164.1335209; Mon, 31 Mar 2025 23:10:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzOHI-0008Kn-D9; Mon, 31 Mar 2025 23:10:48 +0000
Received: by outflank-mailman (input) for mailman id 933164;
 Mon, 31 Mar 2025 23:10:46 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MI1n=WS=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tzOCl-00041G-Dc
 for xen-devel@lists.xenproject.org; Mon, 31 Mar 2025 23:06:07 +0000
Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch
 [79.135.106.28]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b9f7c1f9-0e84-11f0-9ea7-5ba50f476ded;
 Tue, 01 Apr 2025 01:06:06 +0200 (CEST)
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
X-Inumbo-ID: b9f7c1f9-0e84-11f0-9ea7-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1743462364; x=1743721564;
	bh=yUXhOIFrBvxndgTJ0FE4JLOgaaCgGWn626ZFG9p4vGE=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=cLVgyW5rQdC5hksr9jOmetIysG9h/yWKWnlzJNGbZ314rk2Ev1DxPXxxmSaNcb91C
	 cJnX19m9NLm9q3LFPK9FCwi4wGmEAPWIa8bNZC4GSWNgmnUZwZbBCOodMsBis83HOu
	 q6jAbEHEIn80ltllHeW4F/TbAN5UuiSOZW6W9RvkqQauIGEaJk0oHziTsi6EC8gqkm
	 te2T1frqQlxW4muz+1TMmwauBAxw9jrZiVgVxfXO/pLAEqsW8LD1CuyAKiQr9kz3/u
	 TfBTusKWaM3AXLaUqpVGHOl7hQdiWTiTdJtJWQuawC/mlor03+U1dZXEdodDtC4Ciy
	 55KyOCOcsJtYw==
Date: Mon, 31 Mar 2025 23:05:57 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v2 5/7] xen/console: rename console_rx to console_focus
Message-ID: <20250331230508.440198-6-dmukhin@ford.com>
In-Reply-To: <20250331230508.440198-1-dmukhin@ford.com>
References: <20250331230508.440198-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 3f33fe318213ab227d7b2ccdc0f8d1b8cf3eb1db
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>

Update the symbol name in preparation for the semantic change
to the physical console input owner domain identifier.

No functional change.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v1:
- keep the original console_focus description
---
 xen/drivers/char/console.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 48da4e5838..42974c0af7 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -470,7 +470,7 @@ static void cf_check dump_console_ring_key(unsigned cha=
r key)
  * console_rx=3D1 =3D> input to dom0 (or the sole shim domain)
  * console_rx=3DN =3D> input to dom(N-1)
  */
-static unsigned int __read_mostly console_rx =3D 0;
+static unsigned int __read_mostly console_focus =3D 0;
=20
 #define max_console_rx (domid_top() + 1)
=20
@@ -491,9 +491,9 @@ static struct domain *console_get_domain_by_id(domid_t =
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
@@ -513,7 +513,7 @@ static bool console_is_input_allowed(domid_t domid)
=20
 static void console_switch_input(void)
 {
-    unsigned int next_rx =3D console_rx;
+    unsigned int next_rx =3D console_focus;
=20
     /*
      * Rotate among Xen, dom0 and boot-time created domUs while skipping
@@ -525,7 +525,7 @@ static void console_switch_input(void)
=20
         if ( next_rx++ >=3D max_console_rx )
         {
-            console_rx =3D 0;
+            console_focus =3D 0;
             printk("*** Serial input to Xen");
             break;
         }
@@ -537,7 +537,7 @@ static void console_switch_input(void)
=20
         if ( console_is_input_allowed(domid) )
         {
-            console_rx =3D next_rx;
+            console_focus =3D next_rx;
             printk("*** Serial input to DOM%u", domid);
             break;
         }
@@ -554,7 +554,7 @@ static void __serial_rx(char c)
     struct domain *d;
     int rc =3D 0;
=20
-    if ( console_rx =3D=3D 0 )
+    if ( console_focus =3D=3D 0 )
         return handle_keypress(c, false);
=20
     d =3D console_get_domain();
@@ -1135,7 +1135,7 @@ void __init console_endboot(void)
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



