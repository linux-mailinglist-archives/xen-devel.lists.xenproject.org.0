Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AEF87F7061
	for <lists+xen-devel@lfdr.de>; Fri, 24 Nov 2023 10:49:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.640335.998367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Sny-0000XI-Ty; Fri, 24 Nov 2023 09:48:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 640335.998367; Fri, 24 Nov 2023 09:48:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6Sny-0000TB-Op; Fri, 24 Nov 2023 09:48:58 +0000
Received: by outflank-mailman (input) for mailman id 640335;
 Fri, 24 Nov 2023 09:48:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vqky=HF=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1r6Snw-0007zs-Jw
 for xen-devel@lists.xenproject.org; Fri, 24 Nov 2023 09:48:56 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id adfac723-8aae-11ee-9b0e-b553b5be7939;
 Fri, 24 Nov 2023 10:48:54 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5AB5813D5;
 Fri, 24 Nov 2023 01:49:40 -0800 (PST)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 74F573F7A6;
 Fri, 24 Nov 2023 01:48:53 -0800 (PST)
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
X-Inumbo-ID: adfac723-8aae-11ee-9b0e-b553b5be7939
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH v6 5/5] arm/dom0less: introduce Kconfig for dom0less feature
Date: Fri, 24 Nov 2023 09:48:41 +0000
Message-Id: <20231124094841.1475381-6-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231124094841.1475381-1-luca.fancellu@arm.com>
References: <20231124094841.1475381-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce a Kconfig for the dom0less feature, enabled by default,
to be able to choose if the feature should be compiled or not.

Provide static inline stubs when the option is disabled for the
functions externally visible.

Use the new Kconfig to remove dom0less DT binding from the efi-boot.h
code when the Kconfig is not enabled, do the same for
allocate_bank_memory inside domain_build.c that currently is used
only by dom0less-build.c module, but it's kept there provisioning
its usage by dom0 code.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
Changes from v5:
 - style fix, don't protect prototype (Michal), add R-by Michal
   since there are no rebase changes
Changes from v4:
 - No changes
Changes from v3:
 - Update Kconfig
Changes from v2:
 - protect allocate_bank_memory with the new Kconfig
---
 xen/arch/arm/Kconfig                      |  8 ++++++++
 xen/arch/arm/Makefile                     |  2 +-
 xen/arch/arm/domain_build.c               |  2 ++
 xen/arch/arm/efi/efi-boot.h               |  4 ++++
 xen/arch/arm/include/asm/dom0less-build.h | 12 ++++++++++++
 xen/common/Kconfig                        |  2 +-
 6 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 57dc9957124f..f73b62e50d00 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -88,6 +88,14 @@ config GICV2
 	  Driver for the ARM Generic Interrupt Controller v2.
 	  If unsure, say Y
 
+config DOM0LESS_BOOT
+	bool "Dom0less boot support" if EXPERT
+	default y
+	help
+	  Dom0less boot support enables Xen to create and start domU guests during
+	  Xen boot without the need of a control domain (Dom0), which could be
+	  present anyway.
+
 config GICV3
 	bool "GICv3 driver"
 	depends on !NEW_VGIC
diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 2fcc3c2535fd..809772417c14 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -16,7 +16,7 @@ obj-y += cpufeature.o
 obj-y += decode.o
 obj-y += device.o
 obj-$(CONFIG_IOREQ_SERVER) += dm.o
-obj-y += dom0less-build.init.o
+obj-$(CONFIG_DOM0LESS_BOOT) += dom0less-build.init.o
 obj-y += domain.o
 obj-y += domain_build.init.o
 obj-$(CONFIG_ARCH_MAP_DOMAIN_PAGE) += domain_page.o
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 7eb766da9c63..df66fb88d8ec 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -416,6 +416,7 @@ static void __init allocate_memory_11(struct domain *d,
     }
 }
 
+#ifdef CONFIG_DOM0LESS_BOOT
 bool __init allocate_bank_memory(struct domain *d, struct kernel_info *kinfo,
                                  gfn_t sgfn, paddr_t tot_size)
 {
@@ -477,6 +478,7 @@ bool __init allocate_bank_memory(struct domain *d, struct kernel_info *kinfo,
 
     return true;
 }
+#endif
 
 /*
  * When PCI passthrough is available we want to keep the
diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
index 6e6db2445566..0cb29f90a066 100644
--- a/xen/arch/arm/efi/efi-boot.h
+++ b/xen/arch/arm/efi/efi-boot.h
@@ -787,6 +787,7 @@ static int __init handle_module_node(const EFI_LOADED_IMAGE *loaded_image,
     return 1;
 }
 
+#ifdef CONFIG_DOM0LESS_BOOT
 /*
  * This function checks for boot modules under the domU guest domain node
  * in the DT.
@@ -834,6 +835,7 @@ static int __init handle_dom0less_domain_node(const EFI_LOADED_IMAGE *loaded_ima
 
     return mb_modules_found;
 }
+#endif
 
 /*
  * This function checks for xen domain nodes under the /chosen node for possible
@@ -861,6 +863,7 @@ static int __init efi_check_dt_boot(const EFI_LOADED_IMAGE *loaded_image)
     {
         int ret;
 
+#ifdef CONFIG_DOM0LESS_BOOT
         if ( !fdt_node_check_compatible(fdt_efi, node, "xen,domain") )
         {
             /* Found a node with compatible xen,domain; handle this node. */
@@ -869,6 +872,7 @@ static int __init efi_check_dt_boot(const EFI_LOADED_IMAGE *loaded_image)
                 return ERROR_DT_MODULE_DOMU;
         }
         else
+#endif
         {
             ret = handle_module_node(loaded_image, &dir_handle, node, addr_len,
                                      size_len, false);
diff --git a/xen/arch/arm/include/asm/dom0less-build.h b/xen/arch/arm/include/asm/dom0less-build.h
index c5625925d940..00f92835eceb 100644
--- a/xen/arch/arm/include/asm/dom0less-build.h
+++ b/xen/arch/arm/include/asm/dom0less-build.h
@@ -3,9 +3,21 @@
 #ifndef __ASM_DOM0LESS_BUILD_H_
 #define __ASM_DOM0LESS_BUILD_H_
 
+#ifdef CONFIG_DOM0LESS_BOOT
+
 void create_domUs(void);
 bool is_dom0less_mode(void);
 
+#else /* !CONFIG_DOM0LESS_BOOT */
+
+static inline void create_domUs(void) {}
+static inline bool is_dom0less_mode(void)
+{
+    return false;
+}
+
+#endif /* CONFIG_DOM0LESS_BOOT */
+
 #endif /* __ASM_DOM0LESS_BUILD_H_ */
 
 /*
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 4d6fe051641d..310ad4229cdf 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -100,7 +100,7 @@ config NUMA
 
 config STATIC_MEMORY
 	bool "Static Allocation Support (UNSUPPORTED)" if UNSUPPORTED
-	depends on ARM
+	depends on DOM0LESS_BOOT
 	help
 	  Static Allocation refers to system or sub-system(domains) for
 	  which memory areas are pre-defined by configuration using physical
-- 
2.34.1


