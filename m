Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FD9AE5AB5
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 06:01:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022959.1398867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTuqD-000396-Cu; Tue, 24 Jun 2025 04:01:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022959.1398867; Tue, 24 Jun 2025 04:01:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTuqD-000366-8F; Tue, 24 Jun 2025 04:01:01 +0000
Received: by outflank-mailman (input) for mailman id 1022959;
 Tue, 24 Jun 2025 04:00:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1A0Y=ZH=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uTumc-0006IZ-Kd
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 03:57:18 +0000
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 50f5f1dd-50af-11f0-a30f-13f23c93f187;
 Tue, 24 Jun 2025 05:57:15 +0200 (CEST)
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
X-Inumbo-ID: 50f5f1dd-50af-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=suhlavfxo5fcjncdpc7tjndoiq.protonmail; t=1750737434; x=1750996634;
	bh=G+phzEkJh7bBPfUI5tVh5uJv49ZZOGGUY1qVym3PEsU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=YGzehV0MRobbiY+vb5LN2ZXUJVWvxD1OCUBrMIbCzKCfh4dQxe3fMG9f8RYkhBV1h
	 or+fkTjdzobaFvZuysUs8aq1DW9wrZeR7s3dWS994aTJXLZvANgHd5TE80KEOjnOlI
	 QPUfnOquaI59Yr/6rVdV+30TNs+3EKBrpMifSBNNJUB6ZhTZpFLHaUO2cqnMoSWqEN
	 jO+1j0xWGhsEZrXecrlwAh0MGYyJfxpYI2ZOgLzn9abxX+DW2R89HRt9nsdqSUNuU4
	 P4GcErm8bQL5zp1t1jXb7ew5s7CXdEb2afYPRkHXMqWRW/1BJnkEeUMp8RivNwelQl
	 6S/ypOMHolQ1Q==
Date: Tue, 24 Jun 2025 03:57:09 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, oleksii.kurochko@gmail.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v1 15/16] drivers/vuart: introduce framework for UART emulators
Message-ID: <20250624035443.344099-16-dmukhin@ford.com>
In-Reply-To: <20250624035443.344099-1-dmukhin@ford.com>
References: <20250624035443.344099-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 9444a946e272c03e86bb37c3bab824ff5afa7c2f
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>=20

Introduce a driver framework to abstract UART emulators in the hypervisor.

That allows for architecture-independent handling of virtual UARTs in the
console driver and simplifies enabling new UART emulators.

The framework is built under CONFIG_HAS_VUART, which is automatically enabl=
ed
once the user enables any UART emulator.

Current implementation supports maximum of one vUART of each kind per domai=
n.

All domains with enabled virtual PL011 will have DOMAIN_EMU_UART_PL011 bit =
set
in d->arch.emulation_flags. Introduce domain_has_vuart() in arch code to ch=
eck
whether domain has virtual UART.

Use domain_has_vuart() in the console driver code to check whether to forwa=
rd
console input to the domain using vUART.

Hook existing PL011 UART emulator to the new driver framework.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Original code: https://lore.kernel.org/xen-devel/20250103-vuart-ns8250-v3-v=
1-7-c5d36b31d66c@ford.com/
---
 xen/arch/arm/dom0less-build.c       | 22 +++----
 xen/arch/arm/domctl.c               |  3 +-
 xen/arch/arm/include/asm/domain.h   |  1 +
 xen/arch/arm/include/asm/kernel.h   |  3 -
 xen/arch/arm/xen.lds.S              |  1 +
 xen/arch/ppc/include/asm/domain.h   |  1 +
 xen/arch/ppc/xen.lds.S              |  1 +
 xen/arch/riscv/include/asm/domain.h |  1 +
 xen/arch/riscv/xen.lds.S            |  1 +
 xen/arch/x86/xen.lds.S              |  1 +
 xen/common/domain.c                 | 10 +++
 xen/common/keyhandler.c             |  3 +
 xen/drivers/char/console.c          |  5 +-
 xen/drivers/vuart/Makefile          |  1 +
 xen/drivers/vuart/vuart-pl011.c     | 71 +++++++++++++++++++--
 xen/drivers/vuart/vuart.c           | 95 +++++++++++++++++++++++++++++
 xen/include/xen/domain-emu.h        |  2 +
 xen/include/xen/domain.h            |  2 +
 xen/include/xen/vuart.h             | 25 ++++++--
 xen/include/xen/xen.lds.h           | 10 +++
 20 files changed, 227 insertions(+), 32 deletions(-)
 create mode 100644 xen/drivers/vuart/vuart.c

diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 11b8498d3b22..c04441ef4657 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -176,14 +176,9 @@ int __init make_arch_nodes(struct kernel_info *kinfo)
     if ( ret )
         return -EINVAL;
=20
-    if ( kinfo->arch.vpl011 )
-    {
-#ifdef CONFIG_HAS_VUART_PL011
-        ret =3D vuart_add_fwnode(kinfo->d, kinfo);
-#endif
-        if ( ret )
-            return -EINVAL;
-    }
+    ret =3D vuart_add_fwnode(kinfo->d, kinfo);
+    if ( ret )
+        return ret;
=20
     return 0;
 }
@@ -207,19 +202,16 @@ int __init init_vuart(struct domain *d, struct kernel=
_info *kinfo,
 {
     int rc =3D 0;
=20
-    kinfo->arch.vpl011 =3D dt_property_read_bool(node, "vpl011");
-
     /*
      * Base address and irq number are needed when creating vpl011 device
      * tree node in prepare_dtb_domU, so initialization on related variabl=
es
      * shall be done first.
      */
-    if ( kinfo->arch.vpl011 )
-    {
+    if ( dt_property_read_bool(node, "vpl011") )
+        d->emulation_flags |=3D DOMAIN_EMU_UART_PL011;
+
+    if ( domain_has_vuart(d) )
         rc =3D vuart_init(d, NULL);
-        if ( rc < 0 )
-            return rc;
-    }
=20
     return rc;
 }
diff --git a/xen/arch/arm/domctl.c b/xen/arch/arm/domctl.c
index dde25ceff6d0..45144eca1ae2 100644
--- a/xen/arch/arm/domctl.c
+++ b/xen/arch/arm/domctl.c
@@ -43,8 +43,9 @@ static int handle_vuart_init(struct domain *d,
     if ( vuart_op->type !=3D XEN_DOMCTL_VUART_TYPE_VPL011 )
         return -EOPNOTSUPP;
=20
-    rc =3D vuart_init(d, &params);
+    d->emulation_flags |=3D DOMAIN_EMU_UART_PL011;
=20
+    rc =3D vuart_init(d, &params);
     if ( !rc )
         vuart_op->evtchn =3D params.evtchn;
=20
diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/d=
omain.h
index 38873c66f1f8..32ef281151d8 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -2,6 +2,7 @@
 #define __ASM_DOMAIN_H__
=20
 #include <xen/cache.h>
+#include <xen/domain-emu.h>
 #include <xen/timer.h>
 #include <asm/page.h>
 #include <asm/p2m.h>
diff --git a/xen/arch/arm/include/asm/kernel.h b/xen/arch/arm/include/asm/k=
ernel.h
index 7c3b7fde5b64..cfeab792c76e 100644
--- a/xen/arch/arm/include/asm/kernel.h
+++ b/xen/arch/arm/include/asm/kernel.h
@@ -13,9 +13,6 @@ struct arch_kernel_info
 #ifdef CONFIG_ARM_64
     enum domain_type type;
 #endif
-
-    /* Enable pl011 emulation */
-    bool vpl011;
 };
=20
 #endif /* #ifdef __ARCH_ARM_KERNEL_H__ */
diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
index 5bfbe1e92c1e..e876e3efbe4c 100644
--- a/xen/arch/arm/xen.lds.S
+++ b/xen/arch/arm/xen.lds.S
@@ -66,6 +66,7 @@ SECTIONS
        __proc_info_end =3D .;
=20
        VPCI_ARRAY
+       VUART_ARRAY
   } :text
=20
 #if defined(BUILD_ID)
diff --git a/xen/arch/ppc/include/asm/domain.h b/xen/arch/ppc/include/asm/d=
omain.h
index 3a447272c6f2..426e6297c935 100644
--- a/xen/arch/ppc/include/asm/domain.h
+++ b/xen/arch/ppc/include/asm/domain.h
@@ -2,6 +2,7 @@
 #ifndef __ASM_PPC_DOMAIN_H__
 #define __ASM_PPC_DOMAIN_H__
=20
+#include <xen/domain-emu.h>
 #include <xen/xmalloc.h>
 #include <public/hvm/params.h>
=20
diff --git a/xen/arch/ppc/xen.lds.S b/xen/arch/ppc/xen.lds.S
index 1366e2819eed..56bf4a0638d5 100644
--- a/xen/arch/ppc/xen.lds.S
+++ b/xen/arch/ppc/xen.lds.S
@@ -55,6 +55,7 @@ SECTIONS
         *(.data.rel.ro.*)
=20
         VPCI_ARRAY
+        VUART_ARRAY
=20
         . =3D ALIGN(POINTER_ALIGN);
     } :text
diff --git a/xen/arch/riscv/include/asm/domain.h b/xen/arch/riscv/include/a=
sm/domain.h
index c3d965a559b6..fcde3bc78dc6 100644
--- a/xen/arch/riscv/include/asm/domain.h
+++ b/xen/arch/riscv/include/asm/domain.h
@@ -2,6 +2,7 @@
 #ifndef ASM__RISCV__DOMAIN_H
 #define ASM__RISCV__DOMAIN_H
=20
+#include <xen/domain-emu.h>
 #include <xen/xmalloc.h>
 #include <public/hvm/params.h>
=20
diff --git a/xen/arch/riscv/xen.lds.S b/xen/arch/riscv/xen.lds.S
index 8c3c06de01f6..45592fca128f 100644
--- a/xen/arch/riscv/xen.lds.S
+++ b/xen/arch/riscv/xen.lds.S
@@ -50,6 +50,7 @@ SECTIONS
         *(.data.rel.ro.*)
=20
         VPCI_ARRAY
+        VUART_ARRAY
=20
         . =3D ALIGN(POINTER_ALIGN);
     } :text
diff --git a/xen/arch/x86/xen.lds.S b/xen/arch/x86/xen.lds.S
index bf956b6c5fc0..b04ed1e6138c 100644
--- a/xen/arch/x86/xen.lds.S
+++ b/xen/arch/x86/xen.lds.S
@@ -149,6 +149,7 @@ SECTIONS
        __note_gnu_build_id_end =3D .;
 #endif
        VPCI_ARRAY
+       VUART_ARRAY
   } PHDR(text)
=20
 #if defined(CONFIG_PVH_GUEST) && !defined(EFI)
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 8c8f70347a91..071fee81fe2c 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -2436,6 +2436,16 @@ void thaw_domains(void)
     rcu_read_unlock(&domlist_read_lock);
 }
=20
+bool domain_has_vuart(const struct domain *d)
+{
+    uint32_t mask =3D 0;
+
+    if ( IS_ENABLED(CONFIG_HAS_VUART_PL011) )
+        mask |=3D DOMAIN_EMU_UART_PL011;
+
+    return !!(d->emulation_flags & mask);
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/common/keyhandler.c b/xen/common/keyhandler.c
index eccd97c565c6..21e970aded9a 100644
--- a/xen/common/keyhandler.c
+++ b/xen/common/keyhandler.c
@@ -22,6 +22,7 @@
 #include <xen/mm.h>
 #include <xen/watchdog.h>
 #include <xen/init.h>
+#include <xen/vuart.h>
 #include <asm/div64.h>
=20
 static unsigned char keypress_key;
@@ -354,6 +355,8 @@ static void cf_check dump_domains(unsigned char key)
                            v->periodic_period / 1000000);
             }
         }
+
+        vuart_dump(d);
     }
=20
     for_each_domain ( d )
diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index f322d59515ab..5ddc05cc44da 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -594,6 +594,7 @@ static void __serial_rx(char c)
         /*
          * Deliver input to the hardware domain buffer, unless it is
          * already full.
+         * NB: must be the first check: hardware domain may have emulated =
UART.
          */
         if ( (serial_rx_prod - serial_rx_cons) !=3D SERIAL_RX_SIZE )
             serial_rx_ring[SERIAL_RX_MASK(serial_rx_prod++)] =3D c;
@@ -604,11 +605,9 @@ static void __serial_rx(char c)
          */
         send_global_virq(VIRQ_CONSOLE);
     }
-#ifdef CONFIG_HAS_VUART_PL011
-    else
+    else if ( domain_has_vuart(d) )
         /* Deliver input to the emulated UART. */
         rc =3D vuart_putchar(d, c);
-#endif
=20
     if ( consoled_is_enabled() )
         /* Deliver input to the PV shim console. */
diff --git a/xen/drivers/vuart/Makefile b/xen/drivers/vuart/Makefile
index 1c775ffb7f1d..fa9aab666c2a 100644
--- a/xen/drivers/vuart/Makefile
+++ b/xen/drivers/vuart/Makefile
@@ -1,2 +1,3 @@
+obj-$(CONFIG_HAS_VUART) +=3D vuart.o
 obj-$(CONFIG_HAS_VUART_MMIO) +=3D vuart-mmio.o
 obj-$(CONFIG_HAS_VUART_PL011) +=3D vuart-pl011.o
diff --git a/xen/drivers/vuart/vuart-pl011.c b/xen/drivers/vuart/vuart-pl01=
1.c
index bebfb5e0365c..312618ad1b6f 100644
--- a/xen/drivers/vuart/vuart-pl011.c
+++ b/xen/drivers/vuart/vuart-pl011.c
@@ -638,9 +638,9 @@ static void vpl011_data_avail(struct domain *d,
 }
=20
 /*
- * vuart_putchar adds a char to a domain's vpl011 receive buffer.
+ * vpl011_putchar adds a char to a domain's vpl011 receive buffer.
  */
-int vuart_putchar(struct domain *d, char c)
+static int cf_check vpl011_putchar(struct domain *d, char c)
 {
     unsigned long flags;
     struct vpl011 *vpl011 =3D d->arch.vpl011;
@@ -709,7 +709,8 @@ static void vpl011_notification(struct vcpu *v, unsigne=
d int port)
     spin_unlock_irqrestore(&vpl011->lock, flags);
 }
=20
-int vuart_init(struct domain *d, struct vuart_params *params)
+static int cf_check vpl011_init(struct domain *d,
+                                struct vuart_params *params)
 {
     struct vpl011 *vpl011;
     int rc;
@@ -824,7 +825,7 @@ err_out:
     return rc;
 }
=20
-void vuart_exit(struct domain *d)
+static void cf_check vpl011_exit(struct domain *d)
 {
     if ( d->arch.vpl011 )
     {
@@ -833,9 +834,57 @@ void vuart_exit(struct domain *d)
     }
 }
=20
-int __init vuart_add_fwnode(struct domain *d, void *node)
+static void cf_check vpl011_dump(const struct domain *d)
 {
-    struct kernel_info *kinfo =3D node;
+    struct vpl011 *vdev =3D d->arch.vpl011;
+
+    if ( !vdev )
+        return;
+
+    /* Allow printing state in case of a deadlock. */
+    if ( !spin_trylock(&vdev->lock) )
+        return;
+
+    printk("Virtual PL011@%"PRIpaddr" IRQ#%d owner %pd\n",
+            vdev->base_addr, vdev->virq, d);
+
+    if ( vdev->backend_in_domain )
+    {
+        printk("  Event channel %"PRIu32"\n", vdev->evtchn);
+    }
+    else
+    {
+        const struct vpl011_xen_backend *cons =3D vdev->backend.xen;
+
+        printk("  RX FIFO size %u in_prod %u in_cons %u used %u\n",
+                SBSA_UART_FIFO_SIZE, cons->in_prod, cons->in_cons,
+                cons->in_prod - cons->in_cons);
+
+        printk("  TX FIFO size %u out_prod %u used %u\n",
+                SBSA_UART_OUT_BUF_SIZE, cons->out_prod, cons->out_prod);
+    }
+
+    printk("  %02"PRIx8" DR    %08"PRIx8"\n", DR   , 0);
+    printk("  %02"PRIx8" RSR   %08"PRIx8"\n", RSR  , 0);
+    printk("  %02"PRIx8" FR    %08"PRIx8"\n", FR   , vdev->uartfr);
+    printk("  %02"PRIx8" ILPR  %08"PRIx8"\n", ILPR , 0);
+    printk("  %02"PRIx8" IBRD  %08"PRIx8"\n", IBRD , 0);
+    printk("  %02"PRIx8" FBRD  %08"PRIx8"\n", FBRD , 0);
+    printk("  %02"PRIx8" LCR_H %08"PRIx8"\n", LCR_H, 0);
+    printk("  %02"PRIx8" CR    %08"PRIx8"\n", CR   , vdev->uartcr);
+    printk("  %02"PRIx8" IFLS  %08"PRIx8"\n", IFLS , 0);
+    printk("  %02"PRIx8" IMSC  %08"PRIx8"\n", IMSC , vdev->uartimsc);
+    printk("  %02"PRIx8" RIS   %08"PRIx8"\n", RIS  , vdev->uartris);
+    printk("  %02"PRIX8" MIS   %08"PRIX8"\n", MIS  , vdev->shadow_uartmis)=
;
+    printk("  %02"PRIx8" ICR   %08"PRIx8"\n", ICR  , vdev->uarticr);
+    printk("  %02"PRIx8" DMACR %08"PRIx8"\n", DMACR, 0);
+
+    spin_unlock(&vdev->lock);
+}
+
+static int cf_check vpl011_add_fwnode(struct domain *d, void *info)
+{
+    struct kernel_info *kinfo =3D info;
     void *fdt =3D kinfo->fdt;
     int res;
     gic_interrupt_t intr;
@@ -884,6 +933,16 @@ int __init vuart_add_fwnode(struct domain *d, void *no=
de)
     return 0;
 }
=20
+static const struct vuart_ops vpl011_ops =3D {
+    .add_fwnode =3D vpl011_add_fwnode,
+    .init       =3D vpl011_init,
+    .exit       =3D vpl011_exit,
+    .dump       =3D vpl011_dump,
+    .putchar    =3D vpl011_putchar,
+};
+
+VUART_REGISTER(vpl011, &vpl011_ops);
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/drivers/vuart/vuart.c b/xen/drivers/vuart/vuart.c
new file mode 100644
index 000000000000..ab3c2504bff5
--- /dev/null
+++ b/xen/drivers/vuart/vuart.c
@@ -0,0 +1,95 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/errno.h>
+#include <xen/sched.h>
+#include <xen/vuart.h>
+
+extern const struct vuart_ops *const __vuart_array_start[];
+extern const struct vuart_ops *const __vuart_array_end[];
+
+#define VUART_ARRAY_SIZE    (__vuart_array_end - __vuart_array_start)
+
+#define for_each_vuart(vdev) \
+    for (unsigned __i =3D 0; \
+         __i < VUART_ARRAY_SIZE && (vdev =3D __vuart_array_start[__i], 1);=
 \
+         __i++)
+
+int vuart_add_fwnode(struct domain *d, void *node)
+{
+    const struct vuart_ops *vdev;
+    int rc;
+
+    for_each_vuart(vdev)
+    {
+        if ( !vdev->add_fwnode )
+            continue;
+
+        rc =3D vdev->add_fwnode(d, node);
+        if ( rc )
+            return rc;
+    }
+
+    return 0;
+}
+
+int vuart_init(struct domain *d, struct vuart_params *params)
+{
+    const struct vuart_ops *vdev;
+    int rc;
+
+    for_each_vuart(vdev)
+    {
+        rc =3D vdev->init(d, params);
+        if ( rc )
+            return rc;
+    }
+
+    d->console.input_allowed =3D true;
+
+    return 0;
+}
+
+/*
+ * Release any resources taken by UART emulators.
+ *
+ * NB: no flags are cleared, since currently exit() is called only during
+ * domain destroy.
+ */
+void vuart_exit(struct domain *d)
+{
+    const struct vuart_ops *vdev;
+
+    for_each_vuart(vdev)
+        vdev->exit(d);
+}
+
+void vuart_dump(const struct domain *d)
+{
+    const struct vuart_ops *vdev;
+
+    for_each_vuart(vdev)
+        vdev->dump(d);
+}
+
+/*
+ * Put character to the first suitable emulated UART's FIFO.
+ */
+int vuart_putchar(struct domain *d, char c)
+{
+    const struct vuart_ops *vdev =3D NULL;
+
+    for_each_vuart(vdev)
+        if ( vdev->putchar )
+            break;
+
+    return vdev ? vdev->putchar(d, c) : -ENODEV;
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/include/xen/domain-emu.h b/xen/include/xen/domain-emu.h
index 410963ff480c..1d3a6c80fadd 100644
--- a/xen/include/xen/domain-emu.h
+++ b/xen/include/xen/domain-emu.h
@@ -17,6 +17,8 @@
 #define DOMAIN_EMU_PIRQ             (1U << 9)
 #define DOMAIN_EMU_PCI              (1U << 10)
=20
+#define DOMAIN_EMU_UART_PL011       (1U << 15)
+
 #endif /* XEN_DOMAIN_EMU_H */
=20
 /*
diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
index e10baf2615fd..e40906380760 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -59,6 +59,8 @@ domid_t get_initial_domain_id(void);
 #define is_domain_direct_mapped(d) ((d)->cdf & CDF_directmap)
 #define is_domain_using_staticmem(d) ((d)->cdf & CDF_staticmem)
=20
+bool domain_has_vuart(const struct domain *d);
+
 /*
  * Arch-specifics.
  */
diff --git a/xen/include/xen/vuart.h b/xen/include/xen/vuart.h
index 928b60bbb4e2..1f4b47575359 100644
--- a/xen/include/xen/vuart.h
+++ b/xen/include/xen/vuart.h
@@ -12,16 +12,29 @@ struct vuart_params {
     evtchn_port_t evtchn;
 };
=20
-#ifdef CONFIG_HAS_VUART_PL011
+struct vuart_ops {
+    int (*add_fwnode)(struct domain *d, void *node);
+    int (*init)(struct domain *d, struct vuart_params *params);
+    void (*exit)(struct domain *d);
+    void (*dump)(const struct domain *d);
+    int (*putchar)(struct domain *d, char c);
+};
=20
-int __init vuart_add_fwnode(struct domain *d, void *node);
+#define VUART_REGISTER(name, x) \
+    static const struct vuart_ops *const __name##_entry \
+        __used_section(".data.vuart." #name) =3D (x);
+
+#ifdef CONFIG_HAS_VUART
+
+int vuart_add_fwnode(struct domain *d, void *node);
 int vuart_init(struct domain *d, struct vuart_params *params);
 void vuart_exit(struct domain *d);
+void vuart_dump(const struct domain *d);
 int vuart_putchar(struct domain *d, char c);
=20
 #else
=20
-static inline int __init vuart_add_fwnode(struct domain *d, void *node)
+static inline int vuart_add_fwnode(struct domain *d, void *node)
 {
     return 0;
 }
@@ -35,13 +48,17 @@ static inline void vuart_exit(struct domain *d)
 {
 }
=20
+static inline void vuart_dump(const struct domain *d)
+{
+}
+
 static inline int vuart_putchar(struct domain *d, char c)
 {
     ASSERT_UNREACHABLE();
     return -ENODEV;
 }
=20
-#endif /* CONFIG_HAS_VUART_PL011 */
+#endif /* CONFIG_HAS_VUART */
=20
 #ifdef CONFIG_HAS_VUART_MMIO
=20
diff --git a/xen/include/xen/xen.lds.h b/xen/include/xen/xen.lds.h
index 793d0e11450c..1671257e19ee 100644
--- a/xen/include/xen/xen.lds.h
+++ b/xen/include/xen/xen.lds.h
@@ -194,4 +194,14 @@
 #define VPCI_ARRAY
 #endif
=20
+#ifdef CONFIG_HAS_VUART
+#define VUART_ARRAY     \
+       . =3D ALIGN(POINTER_ALIGN); \
+       __vuart_array_start =3D .;  \
+       *(SORT(.data.vuart.*))    \
+       __vuart_array_end =3D .;
+#else
+#define VUART_ARRAY
+#endif
+
 #endif /* __XEN_LDS_H__ */
--=20
2.34.1



