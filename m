Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C347E6633
	for <lists+xen-devel@lfdr.de>; Thu,  9 Nov 2023 10:06:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.629507.981812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r10zf-0005or-Uj; Thu, 09 Nov 2023 09:06:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 629507.981812; Thu, 09 Nov 2023 09:06:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r10zf-0005lw-Ri; Thu, 09 Nov 2023 09:06:31 +0000
Received: by outflank-mailman (input) for mailman id 629507;
 Thu, 09 Nov 2023 09:06:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T6cS=GW=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1r10ze-0005V5-ED
 for xen-devel@lists.xenproject.org; Thu, 09 Nov 2023 09:06:30 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 4305d64e-7edf-11ee-9b0e-b553b5be7939;
 Thu, 09 Nov 2023 10:06:26 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 413F11477;
 Thu,  9 Nov 2023 01:07:10 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C30813F703;
 Thu,  9 Nov 2023 01:06:24 -0800 (PST)
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
X-Inumbo-ID: 4305d64e-7edf-11ee-9b0e-b553b5be7939
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v3 1/5] arm/gicv2: make GICv2 driver and vGICv2 optional
Date: Thu,  9 Nov 2023 09:06:11 +0000
Message-Id: <20231109090615.3878767-2-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231109090615.3878767-1-luca.fancellu@arm.com>
References: <20231109090615.3878767-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce Kconfig GICV2 to be able to compile the GICv2 driver only
when needed, the option is active by default.

Introduce Kconfig VGICV2 that compiles the Generic Interrupt
Controller v2 emulation for domains, it is required only when using
GICv2 driver, otherwise using the GICv3 driver it is optional and can
be deselected if the user doesn't want to offer the v2 emulation to
domains or maybe its GICv3 hardware can't offer the GICv2 compatible
mode.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
Changes from v2:
 - No changes
---
 xen/arch/arm/Kconfig        | 19 +++++++++++++++++++
 xen/arch/arm/Makefile       |  4 ++--
 xen/arch/arm/domain_build.c |  4 ++++
 xen/arch/arm/gic-v3.c       |  4 ++++
 xen/arch/arm/vgic.c         |  2 ++
 xen/arch/arm/vgic/Makefile  |  4 ++--
 6 files changed, 33 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 2939db429b78..0045a3762d86 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -80,6 +80,14 @@ config ARM_EFI
 	  UEFI firmware. A UEFI stub is provided to allow Xen to
 	  be booted as an EFI application.
 
+config GICV2
+	bool "GICv2 driver"
+	default y
+	select VGICV2
+	help
+	  Driver for the ARM Generic Interrupt Controller v2.
+	  If unsure, say Y
+
 config GICV3
 	bool "GICv3 driver"
 	depends on !NEW_VGIC
@@ -99,11 +107,22 @@ config OVERLAY_DTB
 	help
 	  Dynamic addition/removal of Xen device tree nodes using a dtbo.
 
+config VGICV2
+	bool "vGICv2 interface for domains"
+	default y
+	help
+	  Allow Xen to expose a Generic Interrupt Controller version 2 like to Xen
+	  domains. This can be configured at the domain creation.
+	  This option is mandatory when using GICv2.
+	  For GICv3, this allows domain to use GICv2 when the hardware supports it.
+	  If unsure say Y.
+
 config HVM
         def_bool y
 
 config NEW_VGIC
 	bool "Use new VGIC implementation"
+	select GICV2
 	---help---
 
 	This is an alternative implementation of the ARM GIC interrupt
diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 7bf07e992046..81c31c36fc3d 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -22,7 +22,7 @@ obj-y += domctl.o
 obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
 obj-y += efi/
 obj-y += gic.o
-obj-y += gic-v2.o
+obj-$(CONFIG_GICV2) += gic-v2.o
 obj-$(CONFIG_GICV3) += gic-v3.o
 obj-$(CONFIG_HAS_ITS) += gic-v3-its.o
 obj-$(CONFIG_HAS_ITS) += gic-v3-lpi.o
@@ -57,7 +57,7 @@ obj-$(CONFIG_NEW_VGIC) += vgic/
 ifneq ($(CONFIG_NEW_VGIC),y)
 obj-y += gic-vgic.o
 obj-y += vgic.o
-obj-y += vgic-v2.o
+obj-$(CONFIG_VGICV2) += vgic-v2.o
 obj-$(CONFIG_GICV3) += vgic-v3.o
 obj-$(CONFIG_HAS_ITS) += vgic-v3-its.o
 endif
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 49792dd590ee..3d3a117bde7a 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2490,6 +2490,7 @@ static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
     return res;
 }
 
+#ifdef CONFIG_VGICV2
 static int __init make_gicv2_domU_node(struct kernel_info *kinfo)
 {
     void *fdt = kinfo->fdt;
@@ -2541,6 +2542,7 @@ static int __init make_gicv2_domU_node(struct kernel_info *kinfo)
 
     return res;
 }
+#endif
 
 #ifdef CONFIG_GICV3
 static int __init make_gicv3_domU_node(struct kernel_info *kinfo)
@@ -2616,8 +2618,10 @@ static int __init make_gic_domU_node(struct kernel_info *kinfo)
     case GIC_V3:
         return make_gicv3_domU_node(kinfo);
 #endif
+#ifdef CONFIG_VGICV2
     case GIC_V2:
         return make_gicv2_domU_node(kinfo);
+#endif
     default:
         panic("Unsupported GIC version\n");
     }
diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
index 172ff8c005ff..292abefd8731 100644
--- a/xen/arch/arm/gic-v3.c
+++ b/xen/arch/arm/gic-v3.c
@@ -1334,6 +1334,7 @@ static paddr_t __initdata dbase = INVALID_PADDR;
 static paddr_t __initdata vbase = INVALID_PADDR, vsize = 0;
 static paddr_t __initdata cbase = INVALID_PADDR, csize = 0;
 
+#ifdef CONFIG_VGICV2
 /* If the GICv3 supports GICv2, initialize it */
 static void __init gicv3_init_v2(void)
 {
@@ -1359,6 +1360,9 @@ static void __init gicv3_init_v2(void)
 
     vgic_v2_setup_hw(dbase, cbase, csize, vbase, 0);
 }
+#else
+static inline void gicv3_init_v2(void) { }
+#endif
 
 static void __init gicv3_ioremap_distributor(paddr_t dist_paddr)
 {
diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
index f6b49766f97a..c04fc4f83f96 100644
--- a/xen/arch/arm/vgic.c
+++ b/xen/arch/arm/vgic.c
@@ -96,10 +96,12 @@ int domain_vgic_register(struct domain *d, unsigned int *mmio_count)
            return -ENODEV;
         break;
 #endif
+#ifdef CONFIG_VGICV2
     case GIC_V2:
         if ( vgic_v2_init(d, mmio_count) )
             return -ENODEV;
         break;
+#endif
     default:
         printk(XENLOG_G_ERR "d%d: Unknown vGIC version %u\n",
                d->domain_id, d->arch.vgic.version);
diff --git a/xen/arch/arm/vgic/Makefile b/xen/arch/arm/vgic/Makefile
index 806826948e20..60cbf7f2f94a 100644
--- a/xen/arch/arm/vgic/Makefile
+++ b/xen/arch/arm/vgic/Makefile
@@ -1,5 +1,5 @@
 obj-y += vgic.o
-obj-y += vgic-v2.o
+obj-$(CONFIG_VGICV2) += vgic-v2.o
 obj-y += vgic-mmio.o
-obj-y += vgic-mmio-v2.o
+obj-$(CONFIG_VGICV2) += vgic-mmio-v2.o
 obj-y += vgic-init.o
-- 
2.34.1


