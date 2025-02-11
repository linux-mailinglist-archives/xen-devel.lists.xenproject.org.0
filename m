Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F816A30501
	for <lists+xen-devel@lfdr.de>; Tue, 11 Feb 2025 08:57:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.885122.1294901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thl8o-00071d-2N; Tue, 11 Feb 2025 07:57:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 885122.1294901; Tue, 11 Feb 2025 07:57:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1thl8n-0006yp-Vc; Tue, 11 Feb 2025 07:57:09 +0000
Received: by outflank-mailman (input) for mailman id 885122;
 Tue, 11 Feb 2025 07:57:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ER+F=VC=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1thl8l-0006yg-8t
 for xen-devel@lists.xenproject.org; Tue, 11 Feb 2025 07:57:08 +0000
Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch
 [79.135.106.28]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c8c54ff6-e84d-11ef-b3ef-695165c68f79;
 Tue, 11 Feb 2025 08:57:05 +0100 (CET)
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
X-Inumbo-ID: c8c54ff6-e84d-11ef-b3ef-695165c68f79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=kxixwlq73rclxeddrljktctjou.protonmail; t=1739260624; x=1739519824;
	bh=tDYcyVZNLKXQ68nFYI3D4n0NhXqSlRJBgo0oMk+nPbc=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector:
	 List-Unsubscribe:List-Unsubscribe-Post;
	b=f7pwvhIvq5VhkVQPmW50BDHBvmmv/gd9rktPc6pRJKPcrcdmOI7dgtZ3rPK4qjwNl
	 bC9n7+7xu6YigECa0DFVBaLlK0TayEA1I4dCor00IIEHQGhx7W+ItaY0fGDRI44A30
	 MSSBaU2+y0zihp+KSDw5RJ3FhlcjbMrLEEe0B14/YHzqWYA3AZ8bZ6wYDyh3XEgJJ0
	 n7QJUnBi7mjq5Ony5L3CH6BCM4mvzJpNwWBxF1LI9c1zdFFAyZ+/BuMntlmp1559S7
	 BduTc6OcthLv8pA9zqRfoVlkGGUDm6kaXpTMnjUM9Zoyg0OKh43UrTWVezKEJbmNf7
	 pO2NGJMVBlLkQ==
Date: Tue, 11 Feb 2025 07:56:58 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH] arm/vuart: move vpl011-related code to vpl011 emulator
Message-ID: <20250211075405.191144-1-dmkhn@proton.me>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 79a84fc07217747927fc96e766727ba23063c3d3
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>

Xen console driver has vpl011-related logic which shall belong vpl011 emula=
tor
code (Arm port). Move vpl011-related code from arch-independent console dri=
ver
to Arm's vpl011.c.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Link to the original patch:
  https://lore.kernel.org/xen-devel/20250103-vuart-ns8250-v3-v1-2-c5d36b31d=
66c@ford.com/
---
 xen/arch/arm/include/asm/vpl011.h |  2 +-
 xen/arch/arm/vpl011.c             | 15 +++++++++++----
 xen/drivers/char/console.c        | 21 +++++++--------------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/xen/arch/arm/include/asm/vpl011.h b/xen/arch/arm/include/asm/v=
pl011.h
index c09abcd7a9..cc83868281 100644
--- a/xen/arch/arm/include/asm/vpl011.h
+++ b/xen/arch/arm/include/asm/vpl011.h
@@ -69,7 +69,7 @@ struct vpl011_init_info {
 int domain_vpl011_init(struct domain *d,
                        struct vpl011_init_info *info);
 void domain_vpl011_deinit(struct domain *d);
-void vpl011_rx_char_xen(struct domain *d, char c);
+int vpl011_rx_char_xen(struct domain *d, char c);
 #else
 static inline int domain_vpl011_init(struct domain *d,
                                      struct vpl011_init_info *info)
diff --git a/xen/arch/arm/vpl011.c b/xen/arch/arm/vpl011.c
index 1fc3114cce..c72f3778bf 100644
--- a/xen/arch/arm/vpl011.c
+++ b/xen/arch/arm/vpl011.c
@@ -567,16 +567,21 @@ static void vpl011_data_avail(struct domain *d,
=20
 /*
  * vpl011_rx_char_xen adds a char to a domain's vpl011 receive buffer.
- * It is only used when the vpl011 backend is in Xen.
  */
-void vpl011_rx_char_xen(struct domain *d, char c)
+int vpl011_rx_char_xen(struct domain *d, char c)
 {
     unsigned long flags;
     struct vpl011 *vpl011 =3D &d->arch.vpl011;
     struct vpl011_xen_backend *intf =3D vpl011->backend.xen;
     XENCONS_RING_IDX in_cons, in_prod, in_fifo_level;
=20
-    ASSERT(!vpl011->backend_in_domain);
+    /* Forward input iff the vpl011 backend is in Xen. */
+    if ( vpl011->backend_in_domain )
+        return -ENODEV;
+
+    if ( intf =3D=3D NULL )
+        return -ENODEV;
+
     VPL011_LOCK(d, flags);
=20
     in_cons =3D intf->in_cons;
@@ -584,7 +589,7 @@ void vpl011_rx_char_xen(struct domain *d, char c)
     if ( xencons_queued(in_prod, in_cons, sizeof(intf->in)) =3D=3D sizeof(=
intf->in) )
     {
         VPL011_UNLOCK(d, flags);
-        return;
+        return -ENOSPC;
     }
=20
     intf->in[xencons_mask(in_prod, sizeof(intf->in))] =3D c;
@@ -596,6 +601,8 @@ void vpl011_rx_char_xen(struct domain *d, char c)
=20
     vpl011_data_avail(d, in_fifo_level, sizeof(intf->in), 0, SBSA_UART_FIF=
O_SIZE);
     VPL011_UNLOCK(d, flags);
+
+    return 0;
 }
=20
 static void vpl011_notification(struct vcpu *v, unsigned int port)
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index b4cec77247..5e6f0fb062 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -553,21 +553,14 @@ static void __serial_rx(char c)
     {
         struct domain *d =3D rcu_lock_domain_by_id(console_rx - 1);
=20
-        /*
-         * If we have a properly initialized vpl011 console for the
-         * domain, without a full PV ring to Dom0 (in that case input
-         * comes from the PV ring), then send the character to it.
-         */
-        if ( d !=3D NULL &&
-             !d->arch.vpl011.backend_in_domain &&
-             d->arch.vpl011.backend.xen !=3D NULL )
-            vpl011_rx_char_xen(d, c);
-        else
-            printk("Cannot send chars to Dom%d: no UART available\n",
-                   console_rx - 1);
-
-        if ( d !=3D NULL )
+        if ( d )
+        {
+            int rc =3D vpl011_rx_char_xen(d, c);
+            if ( rc )
+                printk(KERN_WARNING "%pd: failed to process console input:=
 %d\n",
+                       d, rc);
             rcu_unlock_domain(d);
+        }
=20
         break;
     }
--=20
2.34.1



