Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D265A680D4
	for <lists+xen-devel@lfdr.de>; Wed, 19 Mar 2025 00:40:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.919966.1324299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tugY4-0001Ab-Cr; Tue, 18 Mar 2025 23:40:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 919966.1324299; Tue, 18 Mar 2025 23:40:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tugY4-000199-9y; Tue, 18 Mar 2025 23:40:40 +0000
Received: by outflank-mailman (input) for mailman id 919966;
 Tue, 18 Mar 2025 23:40:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=6oY5=WF=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tugUf-0004Rg-Mu
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 23:37:09 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e8103e3e-0451-11f0-9899-31a8f345e629;
 Wed, 19 Mar 2025 00:37:08 +0100 (CET)
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
X-Inumbo-ID: e8103e3e-0451-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1742341027; x=1742600227;
	bh=KXwnzdVEulZZ+6NMu1oLFBFCPd+jRq+OUpgMkQKutFo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=VRW/l+26wTM6UCNK6gG3oqU+/nFZ6rIZnIdYZtYSSKM3pO2VR/6b97xn7sO/By5Zd
	 UqSVyNfJ7/9Sdudlu3n0a2LUYfkWVZUjj54FFxW5VgdK9MBzm1r0rXYGGJo3Wp4y91
	 SMMpnVvTF6+WmWmiG7UMeAAHnthVAGKZipNA6k5YWfbNVh+zmNoqGepXnvFhPDIhtj
	 cnL/oKnNK+7DdPVyVNsfh7DId0f/eIweIKQbbadk0r2aFH4G0h2LEFCJmQC0P6YhFa
	 B1ts+Pbzh7UWLbTcNKU4W0npZcjr1PPCkBU5ZY5Z1EMBjSyI6urm6QpPZ8CXHzsbgC
	 Ik3s0D0Ud6QfA==
Date: Tue, 18 Mar 2025 23:37:04 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v1 8/8] xen/console: introduce console_get_focus()
Message-ID: <20250318233617.849903-9-dmukhin@ford.com>
In-Reply-To: <20250318233617.849903-1-dmukhin@ford.com>
References: <20250318233617.849903-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 74e65ad8738b6ac1a189ccd9fad33305fb25fd8c
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Add console_get_focus() as a console public API to the retrieve current
console owner domain ID.

Make console_{get,put}_domain() private and simplify vpl011 code a bit.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/arm/vpl011.c      | 5 +----
 xen/drivers/char/console.c | 9 +++++++--
 xen/include/xen/console.h  | 3 +--
 3 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/xen/arch/arm/vpl011.c b/xen/arch/arm/vpl011.c
index 147958eee8..9ce6151c2a 100644
--- a/xen/arch/arm/vpl011.c
+++ b/xen/arch/arm/vpl011.c
@@ -78,12 +78,11 @@ static void vpl011_write_data_xen(struct domain *d, uin=
t8_t data)
     unsigned long flags;
     struct vpl011 *vpl011 =3D &d->arch.vpl011;
     struct vpl011_xen_backend *intf =3D vpl011->backend.xen;
-    struct domain *input =3D console_get_domain();
=20
     VPL011_LOCK(d, flags);
=20
     intf->out[intf->out_prod++] =3D data;
-    if ( d =3D=3D input )
+    if ( d->domain_id =3D=3D console_get_focus() )
     {
         if ( intf->out_prod =3D=3D 1 )
         {
@@ -123,8 +122,6 @@ static void vpl011_write_data_xen(struct domain *d, uin=
t8_t data)
     vpl011_update_interrupt_status(d);
=20
     VPL011_UNLOCK(d, flags);
-
-    console_put_domain(input);
 }
=20
 /*
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 0e2349a868..906a0ae996 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -484,12 +484,12 @@ static struct domain *console_get_domain_by_id(domid_=
t domid)
     return NULL;
 }
=20
-struct domain *console_get_domain(void)
+static struct domain *console_get_domain(void)
 {
     return console_get_domain_by_id(console_focus);
 }
=20
-void console_put_domain(struct domain *d)
+static void console_put_domain(struct domain *d)
 {
     if ( d )
         rcu_unlock_domain(d);
@@ -523,6 +523,11 @@ static int console_set_focus(domid_t domid)
     return 0;
 }
=20
+domid_t console_get_focus(void)
+{
+    return console_focus;
+}
+
 /*
  * Switch console focus.
  * Rotates input focus among Xen, dom0 and boot-time created domUs while
diff --git a/xen/include/xen/console.h b/xen/include/xen/console.h
index 83cbc9fbda..19da2b755c 100644
--- a/xen/include/xen/console.h
+++ b/xen/include/xen/console.h
@@ -32,8 +32,7 @@ void console_end_sync(void);
 void console_start_log_everything(void);
 void console_end_log_everything(void);
=20
-struct domain *console_get_domain(void);
-void console_put_domain(struct domain *d);
+domid_t console_get_focus(void);
=20
 /*
  * Steal output from the console. Returns +ve identifier, else -ve error.
--=20
2.34.1



