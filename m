Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F117476CF3E
	for <lists+xen-devel@lfdr.de>; Wed,  2 Aug 2023 15:54:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.574953.900603 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRCIf-0001Ku-HY; Wed, 02 Aug 2023 13:54:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 574953.900603; Wed, 02 Aug 2023 13:54:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRCIf-0001JB-En; Wed, 02 Aug 2023 13:54:05 +0000
Received: by outflank-mailman (input) for mailman id 574953;
 Wed, 02 Aug 2023 13:54:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gGWG=DT=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1qRCIe-0001J5-0p
 for xen-devel@lists.xenproject.org; Wed, 02 Aug 2023 13:54:04 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 08958414-313c-11ee-8613-37d641c3527e;
 Wed, 02 Aug 2023 15:54:01 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 91D9D113E;
 Wed,  2 Aug 2023 06:54:43 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 75D893F5A1;
 Wed,  2 Aug 2023 06:53:59 -0700 (PDT)
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
X-Inumbo-ID: 08958414-313c-11ee-8613-37d641c3527e
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [RFC PATCH] arm/gicv2: make GICv2 driver and vGICv2 optional
Date: Wed,  2 Aug 2023 14:53:50 +0100
Message-Id: <20230802135350.745251-1-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce Kconfig GICV2 to be able to compile the GICv2 driver only
when needed, the option is active by default.

Introduce Kconfig VGICV2 that depends on GICV2 or GICV3 and compiles
the GICv2 emulation for guests, it is required only when using GICV2
driver, otherwise using GICV3 it is optional and can be deselected
if the user doesn't want to offer the vGICv2 interface to guests or
maybe its GICv3 hardware can't offer the GICv2 compatible mode.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 xen/arch/arm/Kconfig        | 13 +++++++++++++
 xen/arch/arm/Makefile       |  4 ++--
 xen/arch/arm/domain_build.c |  4 ++++
 xen/arch/arm/gic-v3.c       |  4 ++++
 xen/arch/arm/vgic.c         |  2 ++
 5 files changed, 25 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index fd57a82dd284..dc702f08ace7 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -78,6 +78,14 @@ config ARM_EFI
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
@@ -92,6 +100,11 @@ config HAS_ITS
         bool "GICv3 ITS MSI controller support (UNSUPPORTED)" if UNSUPPORTED
         depends on GICV3 && !NEW_VGIC && !ARM_32
 
+config VGICV2
+	bool "vGICv2 interface for guests"
+	default y
+	depends on (GICV2 || GICV3) && !NEW_VGIC
+
 config HVM
         def_bool y
 
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
index 39b4ee03a505..b2b609eb0c2d 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2775,6 +2775,7 @@ static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
     return res;
 }
 
+#ifdef CONFIG_VGICV2
 static int __init make_gicv2_domU_node(struct kernel_info *kinfo)
 {
     void *fdt = kinfo->fdt;
@@ -2826,6 +2827,7 @@ static int __init make_gicv2_domU_node(struct kernel_info *kinfo)
 
     return res;
 }
+#endif
 
 #ifdef CONFIG_GICV3
 static int __init make_gicv3_domU_node(struct kernel_info *kinfo)
@@ -2901,8 +2903,10 @@ static int __init make_gic_domU_node(struct kernel_info *kinfo)
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
index 95e4f020febe..d18a3317ccc4 100644
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
index 97d6f6106638..86fa8bc7e894 100644
--- a/xen/arch/arm/vgic.c
+++ b/xen/arch/arm/vgic.c
@@ -95,10 +95,12 @@ int domain_vgic_register(struct domain *d, int *mmio_count)
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
-- 
2.34.1


