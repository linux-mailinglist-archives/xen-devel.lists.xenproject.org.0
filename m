Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC66FABC82C
	for <lists+xen-devel@lfdr.de>; Mon, 19 May 2025 22:12:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.990255.1374223 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH6qr-00026z-8h; Mon, 19 May 2025 20:12:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 990255.1374223; Mon, 19 May 2025 20:12:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH6qr-00024T-5a; Mon, 19 May 2025 20:12:45 +0000
Received: by outflank-mailman (input) for mailman id 990255;
 Mon, 19 May 2025 20:12:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wD6k=YD=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uH6qq-0001VO-Ad
 for xen-devel@lists.xenproject.org; Mon, 19 May 2025 20:12:44 +0000
Received: from mail-10629.protonmail.ch (mail-10629.protonmail.ch
 [79.135.106.29]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9ee05afc-34ed-11f0-b892-0df219b8e170;
 Mon, 19 May 2025 22:12:42 +0200 (CEST)
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
X-Inumbo-ID: 9ee05afc-34ed-11f0-b892-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=lbcbjcqqnncq3hedkmxwtc5dli.protonmail; t=1747685561; x=1747944761;
	bh=qkF9UnSC7+WkiSRXBNkMlXtFklvN0JpodfP2cIlJzU4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=KjlElFsag3cIH+39onDpbCXbSMUoYWS2MmVwsRlP7E7sdcYhD+bFYLnzYIwleKKTI
	 HdmEXxgif6uPPFm8XYsMlkiFKoFRzAV/QzBJFh6fKg++435BY1Azc431z6zCeyNPZ7
	 9ufcjz1pWuOu6Mp/PmRqJACCes7I65lxTSfI6yPbt8RIx0Lo4GTtb6+gcNN2agGDsT
	 8pBTbW1CrQSuduJMVuCEo3wzbWHc/gXPYViE2T86Lnm9NqiahkVdQDStf0EzTq6P7m
	 N2F7NG4AsYWdHW1KHx+ROczQic//0eQwVc1UHRXbAMYykiAj2d1Lg3157yNgM1U0et
	 pNXGpmUqrvRcQ==
Date: Mon, 19 May 2025 20:12:34 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v3 2/5] xen/console: introduce console_get_domid()
Message-ID: <20250519201211.1366244-3-dmukhin@ford.com>
In-Reply-To: <20250519201211.1366244-1-dmukhin@ford.com>
References: <20250519201211.1366244-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 6703ec991965501074107b8c9a962dece9dbce26
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>

Add console_get_domid() to the console driver to retrieve the current conso=
le
owner domain ID.

Use the function in vpl011 emulator which leads to simpler code.

Make console_{get,put}_domain() private to the console driver.

No functional change intended.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v2:
- changed commit subject line
- Link to v2: https://lore.kernel.org/xen-devel/20250331230508.440198-8-dmu=
khin@ford.com/
---
 xen/arch/arm/vpl011.c      |  5 +----
 xen/drivers/char/console.c | 11 +++++++++--
 xen/include/xen/console.h  |  3 +--
 3 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/xen/arch/arm/vpl011.c b/xen/arch/arm/vpl011.c
index 66047bf33c..0f58b2c900 100644
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
+    if ( d->domain_id =3D=3D console_get_domid() )
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
index c8dde38376..86fd0b427d 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -474,19 +474,26 @@ static unsigned int __read_mostly console_rx =3D 0;
=20
 #define max_console_rx (max_init_domid + 1)
=20
-struct domain *console_get_domain(void)
+static struct domain *console_get_domain(void)
 {
     if ( console_rx =3D=3D 0 )
             return NULL;
     return rcu_lock_domain_by_id(console_rx - 1);
 }
=20
-void console_put_domain(struct domain *d)
+static void console_put_domain(struct domain *d)
 {
     if ( d )
         rcu_unlock_domain(d);
 }
=20
+domid_t console_get_domid(void)
+{
+    if ( console_rx =3D=3D 0 )
+        return DOMID_XEN;
+    return console_rx - 1;
+}
+
 static void console_switch_input(void)
 {
     unsigned int next_rx =3D console_rx;
diff --git a/xen/include/xen/console.h b/xen/include/xen/console.h
index 83cbc9fbda..c6f9d84d80 100644
--- a/xen/include/xen/console.h
+++ b/xen/include/xen/console.h
@@ -32,8 +32,7 @@ void console_end_sync(void);
 void console_start_log_everything(void);
 void console_end_log_everything(void);
=20
-struct domain *console_get_domain(void);
-void console_put_domain(struct domain *d);
+domid_t console_get_domid(void);
=20
 /*
  * Steal output from the console. Returns +ve identifier, else -ve error.
--=20
2.34.1



