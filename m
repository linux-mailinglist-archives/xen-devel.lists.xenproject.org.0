Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0805ABC831
	for <lists+xen-devel@lfdr.de>; Mon, 19 May 2025 22:13:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.990265.1374254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH6r7-0003Uy-6k; Mon, 19 May 2025 20:13:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 990265.1374254; Mon, 19 May 2025 20:13:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH6r7-0003TU-26; Mon, 19 May 2025 20:13:01 +0000
Received: by outflank-mailman (input) for mailman id 990265;
 Mon, 19 May 2025 20:12:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wD6k=YD=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uH6r4-0001j7-WE
 for xen-devel@lists.xenproject.org; Mon, 19 May 2025 20:12:59 +0000
Received: from mail-24417.protonmail.ch (mail-24417.protonmail.ch
 [109.224.244.17]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a82ad5cf-34ed-11f0-a2fa-13f23c93f187;
 Mon, 19 May 2025 22:12:58 +0200 (CEST)
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
X-Inumbo-ID: a82ad5cf-34ed-11f0-a2fa-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1747685575; x=1747944775;
	bh=6sXF1UKe68CpK8zF6xNGeqeo9Hd97I7fR8xMKBTgt9Q=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=AoxtZYN3dQWGUjkd5u2yMRqvDReYphUtqaJlT+41xVoS/ZpGGeQ7zb/9u10Y7b1g0
	 GUjV5h6VLlJ2RRoLpN9+frGQDtM43X1iJcw47C02D4Z+mxCAOu2FTumJl3Gxy9g7Wz
	 b2FcgTwYVby+yNiud9mYdRbi97sbO1e9gBlKQRanRauOKJTOG77r2Ds+xGjiiXyDOw
	 sYfs+2h+XRO9y7AY6I1EQzSo0+Q7stcpP6GGM5IIC1HwtxAwlRg5zQZVZUdgOMEZgi
	 T+L+kXJFbAoBKSM+Ztg/2dGEcrDhKW6h4exmk+96H+/RD+RcXg0ljE21a0F+qPM91o
	 mhl6qfJMc1B3Q==
Date: Mon, 19 May 2025 20:12:51 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v3 5/5] xen/console: rename console_rx to console_domid
Message-ID: <20250519201211.1366244-6-dmukhin@ford.com>
In-Reply-To: <20250519201211.1366244-1-dmukhin@ford.com>
References: <20250519201211.1366244-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 34962395dae726ecf123eaf0887728e83acd5270
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>

Update the symbol name to match the code better.

No functional change.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v2:
- new patch
---
 xen/drivers/char/console.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index ff20706ac9..afcc6a236e 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -467,11 +467,11 @@ static void cf_check dump_console_ring_key(unsigned c=
har key)
 #define switch_code (opt_conswitch[0]-'a'+1)
=20
 /* Console owner domain identifier. */
-static domid_t __read_mostly console_rx =3D DOMID_XEN;
+static domid_t __read_mostly console_domid =3D DOMID_XEN;
=20
 static struct domain *console_get_domain(void)
 {
-    struct domain *d =3D rcu_lock_domain_by_id(console_rx);
+    struct domain *d =3D rcu_lock_domain_by_id(console_domid);
=20
     if ( !d )
         return NULL;
@@ -497,7 +497,7 @@ static void console_set_domid(domid_t domid)
     else
         printk("*** Serial input to DOM%u", domid);
=20
-    console_rx =3D domid;
+    console_domid =3D domid;
=20
     if ( switch_code )
         printk(" (type 'CTRL-%c' three times to switch input)",
@@ -507,7 +507,7 @@ static void console_set_domid(domid_t domid)
=20
 domid_t console_get_domid(void)
 {
-    return console_rx;
+    return console_domid;
 }
=20
 /*
@@ -518,10 +518,10 @@ static void console_switch_input(void)
 {
     domid_t hint;
=20
-    if ( console_rx =3D=3D DOMID_XEN )
+    if ( console_domid =3D=3D DOMID_XEN )
         hint =3D get_initial_domain_id();
     else
-        hint =3D console_rx + 1;
+        hint =3D console_domid + 1;
=20
     hint =3D domid_find_with_input_allowed(hint);
=20
@@ -533,7 +533,7 @@ static void __serial_rx(char c)
     struct domain *d;
     int rc =3D 0;
=20
-    if ( console_rx =3D=3D DOMID_XEN )
+    if ( console_domid =3D=3D DOMID_XEN )
         return handle_keypress(c, false);
=20
     d =3D console_get_domain();
--=20
2.34.1



