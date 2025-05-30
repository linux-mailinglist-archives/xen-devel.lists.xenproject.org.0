Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B883DAC9815
	for <lists+xen-devel@lfdr.de>; Sat, 31 May 2025 01:19:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1001607.1381755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uL90Y-0006It-IL; Fri, 30 May 2025 23:19:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1001607.1381755; Fri, 30 May 2025 23:19:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uL90Y-0006Fi-De; Fri, 30 May 2025 23:19:26 +0000
Received: by outflank-mailman (input) for mailman id 1001607;
 Fri, 30 May 2025 23:19:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=AEV3=YO=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uL90W-00055p-Py
 for xen-devel@lists.xenproject.org; Fri, 30 May 2025 23:19:24 +0000
Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch
 [79.135.106.28]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8587ab02-3dac-11f0-b894-0df219b8e170;
 Sat, 31 May 2025 01:19:23 +0200 (CEST)
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
X-Inumbo-ID: 8587ab02-3dac-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=y532ikq7kra7dhltmtp4fdjura.protonmail; t=1748647162; x=1748906362;
	bh=jkfiK442l+6t8tHuxB/JprzcNDyu+sgNZHPHUFa9lYw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=R4CYcQBGd3VSaCrwWVWPOPLq57+ERM5gNA0mkQ9VY3kwZwHblqr4CJbWs0ZtNQwqz
	 W67sifljb+rsmrA43DjzKs1D2sD8BauHo2lFx8eP/huaC/LbiHBrXdWJWJmnBXk+x+
	 KxR8ljbm9ehSJIvqqy58zginRx5T2FH0DgixNOQ/8/Ny6mbRIfPzcCzhPlLvMlPkaj
	 lA0RMC+dSlosbHblPyWOilSy9AFF7GiHdwfZfHO9VmWouj08bv/HllJEX+4HdlDQd1
	 CwP3pqX4kh+tkp0jPYzmR6uLkwinu2AcdcZpkn8rx9ruB7/o2tYMcvMez9zhXW4Old
	 EZ7gXcJQcgOiA==
Date: Fri, 30 May 2025 23:19:17 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v5 4/4] xen/console: rename console_rx to console_domid
Message-ID: <20250530231841.73386-5-dmukhin@ford.com>
In-Reply-To: <20250530231841.73386-1-dmukhin@ford.com>
References: <20250530231841.73386-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: a63e93d5e86d2fb5344c6fbbda1c4880a17b4a9b
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>

Update the symbol name to match the code better.

No functional change.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/drivers/char/console.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 37289d5558..5797f29d31 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -503,11 +503,11 @@ static void cf_check conring_dump_keyhandler(unsigned=
 char key)
 #define switch_code (opt_conswitch[0]-'a'+1)
=20
 /* Console owner domain identifier. */
-static domid_t __read_mostly console_rx =3D DOMID_XEN;
+static domid_t __read_mostly console_domid =3D DOMID_XEN;
=20
 struct domain *console_get_domain(void)
 {
-    struct domain *d =3D rcu_lock_domain_by_id(console_rx);
+    struct domain *d =3D rcu_lock_domain_by_id(console_domid);
=20
     if ( !d )
         return NULL;
@@ -533,7 +533,7 @@ static void console_set_domid(domid_t domid)
     else
         printk("*** Serial input to DOM%u", domid);
=20
-    console_rx =3D domid;
+    console_domid =3D domid;
=20
     if ( switch_code )
         printk(" (type 'CTRL-%c' three times to switch input)",
@@ -549,10 +549,10 @@ static void console_switch_input(void)
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
@@ -564,7 +564,7 @@ static void __serial_rx(char c)
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



