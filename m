Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2C0AE5AA4
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 05:55:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022929.1398817 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTulC-00089q-RU; Tue, 24 Jun 2025 03:55:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022929.1398817; Tue, 24 Jun 2025 03:55:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTulC-00087g-Lx; Tue, 24 Jun 2025 03:55:50 +0000
Received: by outflank-mailman (input) for mailman id 1022929;
 Tue, 24 Jun 2025 03:55:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1A0Y=ZH=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uTulB-0006IZ-IV
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 03:55:49 +0000
Received: from mail-4322.protonmail.ch (mail-4322.protonmail.ch [185.70.43.22])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1d221973-50af-11f0-a30f-13f23c93f187;
 Tue, 24 Jun 2025 05:55:48 +0200 (CEST)
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
X-Inumbo-ID: 1d221973-50af-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1750737347; x=1750996547;
	bh=lHc3ACLw6pt7GkNxldMDTQDd1/xX/S5inv8S6C9xx9k=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=UyOkXxLnpo9E6dxPOgu5HimdTcmUCgQkr+Qdq1DTRW1QF9vMcC78WwzQQCqabOBta
	 L8Ffb4RLzCkB7jJeVbk6LzzVTbffTP+u+maRLHL9qaKBOh/iOrLTSu0/SEkLWdaJAv
	 RxQkkK5vgXFzOL8c5Cif7CyTZvOEu2bqdnro/sRyiY4tUHbQsqvq3ap3aK43+Y42Gt
	 3p7hovWsFFKZNq37WlljpxELXXSZQmhBe1Bbuj4yyZPzl4vYXjbPgdWRqKUw6zcY9w
	 LnZtEAO2Y0AMShp1Ely9lx0u3Lmeyl4k8Ht9gHVfyPheMjZxpHkHjw4xO76G3yhIGo
	 2vIrVLydr6gRA==
Date: Tue, 24 Jun 2025 03:55:41 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, oleksii.kurochko@gmail.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v1 05/16] arm/vpl011: use void pointer in domain struct
Message-ID: <20250624035443.344099-6-dmukhin@ford.com>
In-Reply-To: <20250624035443.344099-1-dmukhin@ford.com>
References: <20250624035443.344099-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 0ae6ac912a722d1d6ffe02af0bdd19ee8312a069
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>=20

Switch to using void pointer in domain struct to reduce compile-time
dependencies for PL011 emulator.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/arch/arm/include/asm/domain.h |   3 +-
 xen/arch/arm/vpl011.c             | 139 +++++++++++++++++-------------
 2 files changed, 79 insertions(+), 63 deletions(-)

diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/d=
omain.h
index 746ea687d523..2ee9976b55a8 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -9,7 +9,6 @@
 #include <asm/mmio.h>
 #include <asm/gic.h>
 #include <asm/vgic.h>
-#include <asm/vpl011.h>
 #include <public/hvm/params.h>
=20
 struct hvm_domain
@@ -114,7 +113,7 @@ struct arch_domain
     } monitor;
=20
 #ifdef CONFIG_HAS_VUART_PL011
-    struct vpl011 vpl011;
+    void *vpl011;
 #endif
=20
 #ifdef CONFIG_TEE
diff --git a/xen/arch/arm/vpl011.c b/xen/arch/arm/vpl011.c
index a97c3b74208c..3c027ccf0b4e 100644
--- a/xen/arch/arm/vpl011.c
+++ b/xen/arch/arm/vpl011.c
@@ -22,6 +22,7 @@
 #include <xen/console.h>
 #include <xen/serial.h>
 #include <xen/vuart.h>
+#include <xen/xvmalloc.h>
 #include <public/domctl.h>
 #include <public/io/console.h>
 #include <asm/domain_build.h>
@@ -31,6 +32,43 @@
 #include <asm/vpl011.h>
 #include <asm/vreg.h>
=20
+static void __vpl011_exit(struct vpl011 *vpl011, struct domain *d)
+{
+    if ( vpl011->virq )
+    {
+        vgic_free_virq(d, vpl011->virq);
+
+        /*
+         * Set to invalid irq (we use SPI) to prevent extra free and to av=
oid
+         * freeing irq that could have already been reserved by someone el=
se.
+         */
+        vpl011->virq =3D 0;
+    }
+
+    if ( vpl011->backend_in_domain )
+    {
+        if ( vpl011->backend.dom.ring_buf )
+            destroy_ring_for_helper(&vpl011->backend.dom.ring_buf,
+                                    vpl011->backend.dom.ring_page);
+
+        if ( vpl011->evtchn )
+        {
+            free_xen_event_channel(d, vpl011->evtchn);
+
+            /*
+             * Set to invalid event channel port to prevent extra free and=
 to
+             * avoid freeing port that could have already been allocated f=
or
+             * other purposes.
+             */
+            vpl011->evtchn =3D 0;
+        }
+    }
+    else
+        XFREE(vpl011->backend.xen);
+
+    xfree(vpl011);
+}
+
 /*
  * Since pl011 registers are 32-bit registers, all registers
  * are handled similarly allowing 8-bit, 16-bit and 32-bit
@@ -43,7 +81,7 @@ static bool vpl011_reg32_check_access(struct hsr_dabt dab=
t)
=20
 static void vpl011_update_interrupt_status(struct domain *d)
 {
-    struct vpl011 *vpl011 =3D &d->arch.vpl011;
+    struct vpl011 *vpl011 =3D d->arch.vpl011;
     uint32_t uartmis =3D vpl011->uartris & vpl011->uartimsc;
=20
     /*
@@ -81,7 +119,7 @@ static void vpl011_update_interrupt_status(struct domain=
 *d)
 static void vpl011_write_data_xen(struct domain *d, uint8_t data)
 {
     unsigned long flags;
-    struct vpl011 *vpl011 =3D &d->arch.vpl011;
+    struct vpl011 *vpl011 =3D d->arch.vpl011;
     struct vpl011_xen_backend *intf =3D vpl011->backend.xen;
     struct domain *input =3D console_get_domain();
=20
@@ -140,7 +178,7 @@ static uint8_t vpl011_read_data_xen(struct domain *d)
 {
     unsigned long flags;
     uint8_t data =3D 0;
-    struct vpl011 *vpl011 =3D &d->arch.vpl011;
+    struct vpl011 *vpl011 =3D d->arch.vpl011;
     struct vpl011_xen_backend *intf =3D vpl011->backend.xen;
     XENCONS_RING_IDX in_cons, in_prod;
=20
@@ -199,7 +237,7 @@ static uint8_t vpl011_read_data(struct domain *d)
 {
     unsigned long flags;
     uint8_t data =3D 0;
-    struct vpl011 *vpl011 =3D &d->arch.vpl011;
+    struct vpl011 *vpl011 =3D d->arch.vpl011;
     struct xencons_interface *intf =3D vpl011->backend.dom.ring_buf;
     XENCONS_RING_IDX in_cons, in_prod;
=20
@@ -284,7 +322,7 @@ static void vpl011_update_tx_fifo_status(struct vpl011 =
*vpl011,
 static void vpl011_write_data(struct domain *d, uint8_t data)
 {
     unsigned long flags;
-    struct vpl011 *vpl011 =3D &d->arch.vpl011;
+    struct vpl011 *vpl011 =3D d->arch.vpl011;
     struct xencons_interface *intf =3D vpl011->backend.dom.ring_buf;
     XENCONS_RING_IDX out_cons, out_prod;
=20
@@ -350,10 +388,9 @@ static int vpl011_mmio_read(struct vcpu *v,
                             register_t *r,
                             void *priv)
 {
+    struct vpl011 *vpl011 =3D v->domain->arch.vpl011;
     struct hsr_dabt dabt =3D info->dabt;
-    uint32_t vpl011_reg =3D (uint32_t)(info->gpa -
-                                     v->domain->arch.vpl011.base_addr);
-    struct vpl011 *vpl011 =3D &v->domain->arch.vpl011;
+    uint32_t vpl011_reg =3D (uint32_t)(info->gpa - vpl011->base_addr);
     struct domain *d =3D v->domain;
     unsigned long flags;
=20
@@ -439,10 +476,9 @@ static int vpl011_mmio_write(struct vcpu *v,
                              register_t r,
                              void *priv)
 {
+    struct vpl011 *vpl011 =3D v->domain->arch.vpl011;
     struct hsr_dabt dabt =3D info->dabt;
-    uint32_t vpl011_reg =3D (uint32_t)(info->gpa -
-                                     v->domain->arch.vpl011.base_addr);
-    struct vpl011 *vpl011 =3D &v->domain->arch.vpl011;
+    uint32_t vpl011_reg =3D (uint32_t)(info->gpa - vpl011->base_addr);
     struct domain *d =3D v->domain;
     unsigned long flags;
=20
@@ -518,7 +554,7 @@ static void vpl011_data_avail(struct domain *d,
                               XENCONS_RING_IDX out_fifo_level,
                               XENCONS_RING_IDX out_size)
 {
-    struct vpl011 *vpl011 =3D &d->arch.vpl011;
+    struct vpl011 *vpl011 =3D d->arch.vpl011;
=20
     /**** Update the UART RX state ****/
=20
@@ -576,7 +612,7 @@ static void vpl011_data_avail(struct domain *d,
 int vuart_putchar(struct domain *d, char c)
 {
     unsigned long flags;
-    struct vpl011 *vpl011 =3D &d->arch.vpl011;
+    struct vpl011 *vpl011 =3D d->arch.vpl011;
     struct vpl011_xen_backend *intf =3D vpl011->backend.xen;
     XENCONS_RING_IDX in_cons, in_prod, in_fifo_level;
=20
@@ -614,7 +650,7 @@ static void vpl011_notification(struct vcpu *v, unsigne=
d int port)
 {
     unsigned long flags;
     struct domain *d =3D v->domain;
-    struct vpl011 *vpl011 =3D &d->arch.vpl011;
+    struct vpl011 *vpl011 =3D d->arch.vpl011;
     struct xencons_interface *intf =3D vpl011->backend.dom.ring_buf;
     XENCONS_RING_IDX in_cons, in_prod, out_cons, out_prod;
     XENCONS_RING_IDX in_fifo_level, out_fifo_level;
@@ -644,11 +680,14 @@ static void vpl011_notification(struct vcpu *v, unsig=
ned int port)
=20
 int vuart_init(struct domain *d, struct vuart_params *params)
 {
+    struct vpl011 *vpl011;
     int rc;
-    struct vpl011 *vpl011 =3D &d->arch.vpl011;
=20
-    if ( vpl011->backend.dom.ring_buf )
-        return -EINVAL;
+    BUG_ON(d->arch.vpl011);
+
+    vpl011 =3D xvzalloc(typeof(*vpl011));
+    if ( !vpl011 )
+        return -ENOMEM;
=20
     /*
      * The VPL011 virq is GUEST_VPL011_SPI, except for direct-map domains
@@ -670,7 +709,8 @@ int vuart_init(struct domain *d, struct vuart_params *p=
arams)
         {
             printk(XENLOG_ERR
                    "vpl011: Unable to re-use the Xen UART information.\n")=
;
-            return -EINVAL;
+            rc =3D -EINVAL;
+            goto err_out;
         }
=20
         /*
@@ -684,7 +724,8 @@ int vuart_init(struct domain *d, struct vuart_params *p=
arams)
         {
             printk(XENLOG_ERR
                    "vpl011: Can't re-use the Xen UART MMIO region as it is=
 too small.\n");
-            return -EINVAL;
+            rc =3D -EINVAL;
+            goto err_out;
         }
     }
     else
@@ -707,12 +748,12 @@ int vuart_init(struct domain *d, struct vuart_params =
*params)
                                       &vpl011->backend.dom.ring_page,
                                       &vpl011->backend.dom.ring_buf);
         if ( rc < 0 )
-            goto out;
+            goto err_out;
=20
         rc =3D alloc_unbound_xen_event_channel(d, 0, params->console_domid=
,
                                              vpl011_notification);
         if ( rc < 0 )
-            goto out1;
+            goto err_out;
=20
         vpl011->evtchn =3D params->evtchn =3D rc;
     }
@@ -725,7 +766,7 @@ int vuart_init(struct domain *d, struct vuart_params *p=
arams)
         if ( vpl011->backend.xen =3D=3D NULL )
         {
             rc =3D -ENOMEM;
-            goto out;
+            goto err_out;
         }
     }
=20
@@ -733,7 +774,7 @@ int vuart_init(struct domain *d, struct vuart_params *p=
arams)
     if ( !rc )
     {
         rc =3D -EINVAL;
-        goto out1;
+        goto err_out;
     }
=20
     vpl011->uartfr =3D TXFE | RXFE;
@@ -743,50 +784,22 @@ int vuart_init(struct domain *d, struct vuart_params =
*params)
     register_mmio_handler(d, &vpl011_mmio_handler,
                           vpl011->base_addr, GUEST_PL011_SIZE, NULL);
=20
+    d->arch.vpl011 =3D vpl011;
+
     return 0;
=20
-out1:
-    vuart_exit(d);
-
-out:
+err_out:
+    __vpl011_exit(vpl011, d);
     return rc;
 }
=20
 void vuart_exit(struct domain *d)
 {
-    struct vpl011 *vpl011 =3D &d->arch.vpl011;
-
-    if ( vpl011->virq )
+    if ( d->arch.vpl011 )
     {
-        vgic_free_virq(d, vpl011->virq);
-
-        /*
-         * Set to invalid irq (we use SPI) to prevent extra free and to av=
oid
-         * freeing irq that could have already been reserved by someone el=
se.
-         */
-        vpl011->virq =3D 0;
+        __vpl011_exit(d->arch.vpl011, d);
+        d->arch.vpl011 =3D NULL;
     }
-
-    if ( vpl011->backend_in_domain )
-    {
-        if ( vpl011->backend.dom.ring_buf )
-            destroy_ring_for_helper(&vpl011->backend.dom.ring_buf,
-                                    vpl011->backend.dom.ring_page);
-
-        if ( vpl011->evtchn )
-        {
-            free_xen_event_channel(d, vpl011->evtchn);
-
-            /*
-             * Set to invalid event channel port to prevent extra free and=
 to
-             * avoid freeing port that could have already been allocated f=
or
-             * other purposes.
-             */
-            vpl011->evtchn =3D 0;
-        }
-    }
-    else
-        XFREE(vpl011->backend.xen);
 }
=20
 int __init vuart_add_fwnode(struct domain *d, void *node)
@@ -797,8 +810,12 @@ int __init vuart_add_fwnode(struct domain *d, void *no=
de)
     gic_interrupt_t intr;
     __be32 reg[GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS];
     __be32 *cells;
+    struct vpl011 *vpl011 =3D d->arch.vpl011;
=20
-    res =3D domain_fdt_begin_node(fdt, "sbsa-uart", d->arch.vpl011.base_ad=
dr);
+    if ( !vpl011 )
+        return 0;
+
+    res =3D domain_fdt_begin_node(fdt, "sbsa-uart", vpl011->base_addr);
     if ( res )
         return res;
=20
@@ -808,14 +825,14 @@ int __init vuart_add_fwnode(struct domain *d, void *n=
ode)
=20
     cells =3D &reg[0];
     dt_child_set_range(&cells, GUEST_ROOT_ADDRESS_CELLS,
-                       GUEST_ROOT_SIZE_CELLS, d->arch.vpl011.base_addr,
+                       GUEST_ROOT_SIZE_CELLS, vpl011->base_addr,
                        GUEST_PL011_SIZE);
=20
     res =3D fdt_property(fdt, "reg", reg, sizeof(reg));
     if ( res )
         return res;
=20
-    set_interrupt(intr, d->arch.vpl011.virq, 0xf, DT_IRQ_TYPE_LEVEL_HIGH);
+    set_interrupt(intr, vpl011->virq, 0xf, DT_IRQ_TYPE_LEVEL_HIGH);
=20
     res =3D fdt_property(fdt, "interrupts", intr, sizeof (intr));
     if ( res )
--=20
2.34.1



