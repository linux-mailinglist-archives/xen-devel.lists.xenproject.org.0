Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C07A77145
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 01:10:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.933160.1335199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzOHG-0007zr-9K; Mon, 31 Mar 2025 23:10:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 933160.1335199; Mon, 31 Mar 2025 23:10:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzOHG-0007vk-6L; Mon, 31 Mar 2025 23:10:46 +0000
Received: by outflank-mailman (input) for mailman id 933160;
 Mon, 31 Mar 2025 23:10:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=MI1n=WS=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1tzOD2-0003Id-KJ
 for xen-devel@lists.xenproject.org; Mon, 31 Mar 2025 23:06:24 +0000
Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch
 [109.224.244.18]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c3a4c86b-0e84-11f0-9ffb-bf95429c2676;
 Tue, 01 Apr 2025 01:06:23 +0200 (CEST)
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
X-Inumbo-ID: c3a4c86b-0e84-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1743462382; x=1743721582;
	bh=SdBSfazbTf7ETSXxJ/9/JRpjBT4nbA/cZZmRLe9iXXo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=ZkAT7aY9ciihxoUHuqNbDsECqz/6oeK0GS+Ea9FjR7UOYZdrhg3xTBaiqGYIjIlGn
	 JHSFxZ7iJMHKiCD2KZEsOWmZMUSsfcBv7RiZvIJx80Gho2Vtdu7HtHFPe73RXHaTrd
	 Tju9z/N53Db7VVeOiaZDeBCq4aGXs9NWmzfn/SiIded4iMzYv7E5dcmztHbAhB6eE/
	 BjSZPf8ifImIX3dFxxWrupHfpXbjBcL8j4OdHATpFBxfWs6YXq/1GgfzCd782xHZen
	 2cQ3uFWC2O6BXbuLRDQxC+UR948M6u0Unkou2czPgsOidzEjM1pOVazeZOaOtRPAtX
	 XddxIzjF506Sg==
Date: Mon, 31 Mar 2025 23:06:16 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v2 7/7] xen/console: introduce console_get_focus()
Message-ID: <20250331230508.440198-8-dmukhin@ford.com>
In-Reply-To: <20250331230508.440198-1-dmukhin@ford.com>
References: <20250331230508.440198-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 1ffe553bbbf65e1147056fde733ce3781ed5df05
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>

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
index 9905ffd6b9..888dabe8af 100644
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
@@ -526,6 +526,11 @@ static bool cf_check console_set_focus(domid_t domid)
     return true;
 }
=20
+domid_t console_get_focus(void)
+{
+    return console_focus;
+}
+
 /*
  * Switch console focus.
  * Rotates input focus among Xen and domains with console input permission=
.
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



