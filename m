Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CE2AE5AA2
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 05:55:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022919.1398807 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTul2-0007d2-IV; Tue, 24 Jun 2025 03:55:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022919.1398807; Tue, 24 Jun 2025 03:55:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTul2-0007a8-Es; Tue, 24 Jun 2025 03:55:40 +0000
Received: by outflank-mailman (input) for mailman id 1022919;
 Tue, 24 Jun 2025 03:55:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1A0Y=ZH=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uTul1-000639-Dx
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 03:55:39 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 16912773-50af-11f0-b894-0df219b8e170;
 Tue, 24 Jun 2025 05:55:37 +0200 (CEST)
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
X-Inumbo-ID: 16912773-50af-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=2aczlvp72nbmndnpqwlicus3vi.protonmail; t=1750737336; x=1750996536;
	bh=pr9da8QLriKGRhTHle+NhpCJzocZTv/fv9SkYEq/Fhw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=HN7U28yX6dmUEKHGm/r6clneTH6+QaKfBhDYbs05T9ULKQdU2S3jIuRiYTjoMIpff
	 zBkh/VPLe52KF7nBfZ5z0UqVCLvsfXyNY9VOw22ttyPwGtCzG965dnDXjAAwz7rUXG
	 j5xx23SMLVs0cuziGpfnDLpYzC7Cv7b/p5rcjVNTB/iGtg+3IYSZGVDoptBOIHYKDH
	 PuEqcfmtmbBPiWWF165El32XL0iJprRddQWGUnEOnsDVGBY1J8pF1rFGa/h74eWZuW
	 VdEKukowFiGjAM2HCnQQPWe0llZv//fK+BGtlRPzpfCgO2QhoPVanhpTi4xg58vI3u
	 K6nE8yBa+BpBw==
Date: Tue, 24 Jun 2025 03:55:32 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, oleksii.kurochko@gmail.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v1 04/16] arm/vpl011: use raw spin_lock_{irqrestore,irqsave}
Message-ID: <20250624035443.344099-5-dmukhin@ford.com>
In-Reply-To: <20250624035443.344099-1-dmukhin@ford.com>
References: <20250624035443.344099-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 6453bdc58832958b3427c6bbd46d5bfab2dde158
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>=20

Replace VPL011_{LOCK,UNLOCK} macros with raw spinlock calls to improve
readability.

No functional change.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/arm/include/asm/vpl011.h |  4 ---
 xen/arch/arm/vpl011.c             | 50 +++++++++++++++----------------
 2 files changed, 25 insertions(+), 29 deletions(-)

diff --git a/xen/arch/arm/include/asm/vpl011.h b/xen/arch/arm/include/asm/v=
pl011.h
index 5c308cc8c148..8f6ea0005e72 100644
--- a/xen/arch/arm/include/asm/vpl011.h
+++ b/xen/arch/arm/include/asm/vpl011.h
@@ -24,10 +24,6 @@
 #include <public/io/console.h>
 #include <xen/mm.h>
=20
-/* helper macros */
-#define VPL011_LOCK(d,flags) spin_lock_irqsave(&(d)->arch.vpl011.lock, fla=
gs)
-#define VPL011_UNLOCK(d,flags) spin_unlock_irqrestore(&(d)->arch.vpl011.lo=
ck, flags)
-
 #define SBSA_UART_FIFO_SIZE 32
 /* Same size as VUART_BUF_SIZE, used in vuart.c */
 #define SBSA_UART_OUT_BUF_SIZE 128
diff --git a/xen/arch/arm/vpl011.c b/xen/arch/arm/vpl011.c
index 2cf88a70ecdb..a97c3b74208c 100644
--- a/xen/arch/arm/vpl011.c
+++ b/xen/arch/arm/vpl011.c
@@ -85,7 +85,7 @@ static void vpl011_write_data_xen(struct domain *d, uint8=
_t data)
     struct vpl011_xen_backend *intf =3D vpl011->backend.xen;
     struct domain *input =3D console_get_domain();
=20
-    VPL011_LOCK(d, flags);
+    spin_lock_irqsave(&vpl011->lock, flags);
=20
     intf->out[intf->out_prod++] =3D data;
     if ( d =3D=3D input )
@@ -127,7 +127,7 @@ static void vpl011_write_data_xen(struct domain *d, uin=
t8_t data)
     vpl011->uartfr |=3D TXFE;
     vpl011_update_interrupt_status(d);
=20
-    VPL011_UNLOCK(d, flags);
+    spin_unlock_irqrestore(&vpl011->lock, flags);
=20
     console_put_domain(input);
 }
@@ -144,7 +144,7 @@ static uint8_t vpl011_read_data_xen(struct domain *d)
     struct vpl011_xen_backend *intf =3D vpl011->backend.xen;
     XENCONS_RING_IDX in_cons, in_prod;
=20
-    VPL011_LOCK(d, flags);
+    spin_lock_irqsave(&vpl011->lock, flags);
=20
     in_cons =3D intf->in_cons;
     in_prod =3D intf->in_prod;
@@ -190,7 +190,7 @@ static uint8_t vpl011_read_data_xen(struct domain *d)
      */
     vpl011->uartfr &=3D ~RXFF;
=20
-    VPL011_UNLOCK(d, flags);
+    spin_unlock_irqrestore(&vpl011->lock, flags);
=20
     return data;
 }
@@ -203,7 +203,7 @@ static uint8_t vpl011_read_data(struct domain *d)
     struct xencons_interface *intf =3D vpl011->backend.dom.ring_buf;
     XENCONS_RING_IDX in_cons, in_prod;
=20
-    VPL011_LOCK(d, flags);
+    spin_lock_irqsave(&vpl011->lock, flags);
=20
     in_cons =3D intf->in_cons;
     in_prod =3D intf->in_prod;
@@ -249,7 +249,7 @@ static uint8_t vpl011_read_data(struct domain *d)
      */
     vpl011->uartfr &=3D ~RXFF;
=20
-    VPL011_UNLOCK(d, flags);
+    spin_unlock_irqrestore(&vpl011->lock, flags);
=20
     /*
      * Send an event to console backend to indicate that data has been
@@ -288,7 +288,7 @@ static void vpl011_write_data(struct domain *d, uint8_t=
 data)
     struct xencons_interface *intf =3D vpl011->backend.dom.ring_buf;
     XENCONS_RING_IDX out_cons, out_prod;
=20
-    VPL011_LOCK(d, flags);
+    spin_lock_irqsave(&vpl011->lock, flags);
=20
     out_cons =3D intf->out_cons;
     out_prod =3D intf->out_prod;
@@ -336,7 +336,7 @@ static void vpl011_write_data(struct domain *d, uint8_t=
 data)
=20
     vpl011->uartfr &=3D ~TXFE;
=20
-    VPL011_UNLOCK(d, flags);
+    spin_unlock_irqrestore(&vpl011->lock, flags);
=20
     /*
      * Send an event to console backend to indicate that there is
@@ -378,34 +378,34 @@ static int vpl011_mmio_read(struct vcpu *v,
     case FR:
         if ( !vpl011_reg32_check_access(dabt) ) goto bad_width;
=20
-        VPL011_LOCK(d, flags);
+        spin_lock_irqsave(&vpl011->lock, flags);
         *r =3D vreg_reg32_extract(vpl011->uartfr, info);
-        VPL011_UNLOCK(d, flags);
+        spin_unlock_irqrestore(&vpl011->lock, flags);
         return 1;
=20
     case RIS:
         if ( !vpl011_reg32_check_access(dabt) ) goto bad_width;
=20
-        VPL011_LOCK(d, flags);
+        spin_lock_irqsave(&vpl011->lock, flags);
         *r =3D vreg_reg32_extract(vpl011->uartris, info);
-        VPL011_UNLOCK(d, flags);
+        spin_unlock_irqrestore(&vpl011->lock, flags);
         return 1;
=20
     case MIS:
         if ( !vpl011_reg32_check_access(dabt) ) goto bad_width;
=20
-        VPL011_LOCK(d, flags);
+        spin_lock_irqsave(&vpl011->lock, flags);
         *r =3D vreg_reg32_extract(vpl011->uartris & vpl011->uartimsc,
                                 info);
-        VPL011_UNLOCK(d, flags);
+        spin_unlock_irqrestore(&vpl011->lock, flags);
         return 1;
=20
     case IMSC:
         if ( !vpl011_reg32_check_access(dabt) ) goto bad_width;
=20
-        VPL011_LOCK(d, flags);
+        spin_lock_irqsave(&vpl011->lock, flags);
         *r =3D vreg_reg32_extract(vpl011->uartimsc, info);
-        VPL011_UNLOCK(d, flags);
+        spin_unlock_irqrestore(&vpl011->lock, flags);
         return 1;
=20
     case ICR:
@@ -476,19 +476,19 @@ static int vpl011_mmio_write(struct vcpu *v,
     case IMSC:
         if ( !vpl011_reg32_check_access(dabt) ) goto bad_width;
=20
-        VPL011_LOCK(d, flags);
+        spin_lock_irqsave(&vpl011->lock, flags);
         vreg_reg32_update(&vpl011->uartimsc, r, info);
         vpl011_update_interrupt_status(v->domain);
-        VPL011_UNLOCK(d, flags);
+        spin_unlock_irqrestore(&vpl011->lock, flags);
         return 1;
=20
     case ICR:
         if ( !vpl011_reg32_check_access(dabt) ) goto bad_width;
=20
-        VPL011_LOCK(d, flags);
+        spin_lock_irqsave(&vpl011->lock, flags);
         vreg_reg32_clearbits(&vpl011->uartris, r, info);
         vpl011_update_interrupt_status(d);
-        VPL011_UNLOCK(d, flags);
+        spin_unlock_irqrestore(&vpl011->lock, flags);
         return 1;
=20
     default:
@@ -587,13 +587,13 @@ int vuart_putchar(struct domain *d, char c)
     if ( intf =3D=3D NULL )
         return -ENODEV;
=20
-    VPL011_LOCK(d, flags);
+    spin_lock_irqsave(&vpl011->lock, flags);
=20
     in_cons =3D intf->in_cons;
     in_prod =3D intf->in_prod;
     if ( xencons_queued(in_prod, in_cons, sizeof(intf->in)) =3D=3D sizeof(=
intf->in) )
     {
-        VPL011_UNLOCK(d, flags);
+        spin_unlock_irqrestore(&vpl011->lock, flags);
         return -ENOSPC;
     }
=20
@@ -605,7 +605,7 @@ int vuart_putchar(struct domain *d, char c)
                                    sizeof(intf->in));
=20
     vpl011_data_avail(d, in_fifo_level, sizeof(intf->in), 0, SBSA_UART_FIF=
O_SIZE);
-    VPL011_UNLOCK(d, flags);
+    spin_unlock_irqrestore(&vpl011->lock, flags);
=20
     return 0;
 }
@@ -619,7 +619,7 @@ static void vpl011_notification(struct vcpu *v, unsigne=
d int port)
     XENCONS_RING_IDX in_cons, in_prod, out_cons, out_prod;
     XENCONS_RING_IDX in_fifo_level, out_fifo_level;
=20
-    VPL011_LOCK(d, flags);
+    spin_lock_irqsave(&vpl011->lock, flags);
=20
     in_cons =3D intf->in_cons;
     in_prod =3D intf->in_prod;
@@ -639,7 +639,7 @@ static void vpl011_notification(struct vcpu *v, unsigne=
d int port)
     vpl011_data_avail(v->domain, in_fifo_level, sizeof(intf->in),
                       out_fifo_level, sizeof(intf->out));
=20
-    VPL011_UNLOCK(d, flags);
+    spin_unlock_irqrestore(&vpl011->lock, flags);
 }
=20
 int vuart_init(struct domain *d, struct vuart_params *params)
--=20
2.34.1



