Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CE0C7738C6
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 10:00:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579371.907358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTHdq-00010d-GA; Tue, 08 Aug 2023 08:00:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579371.907358; Tue, 08 Aug 2023 08:00:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTHdq-0000wf-An; Tue, 08 Aug 2023 08:00:34 +0000
Received: by outflank-mailman (input) for mailman id 579371;
 Tue, 08 Aug 2023 08:00:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H/Vr=DZ=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1qTHdo-0007uw-Al
 for xen-devel@lists.xenproject.org; Tue, 08 Aug 2023 08:00:32 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id a3ced59d-35c1-11ee-8613-37d641c3527e;
 Tue, 08 Aug 2023 10:00:29 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F17F7150C;
 Tue,  8 Aug 2023 01:01:10 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 506C63F6C4;
 Tue,  8 Aug 2023 01:00:27 -0700 (PDT)
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
X-Inumbo-ID: a3ced59d-35c1-11ee-8613-37d641c3527e
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	rahul.singh@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 5/5] arm/dom0less: introduce Kconfig for dom0less feature
Date: Tue,  8 Aug 2023 09:00:10 +0100
Message-Id: <20230808080010.3858575-6-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230808080010.3858575-1-luca.fancellu@arm.com>
References: <20230808080010.3858575-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce a Kconfig for the dom0less feature, enabled by default,
to be able to choose if the feature should be compiled or not.

Provide static inline stubs when the option is disabled for the
functions externally visible.

Use the new Kconfig to remove dom0less DT binding from the efi-boot.h
code when the Kconfig is not enabled.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 xen/arch/arm/Kconfig                      |  9 +++++++++
 xen/arch/arm/Makefile                     |  2 +-
 xen/arch/arm/efi/efi-boot.h               |  4 ++++
 xen/arch/arm/include/asm/dom0less-build.h | 12 ++++++++++++
 4 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 03ec1247ad4c..2fbbfd8518d4 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -86,6 +86,15 @@ config GICV2
 	  Driver for the ARM Generic Interrupt Controller v2.
 	  If unsure, say Y
 
+config DOM0LESS_BOOT
+	bool "Dom0less boot support" if EXPERT
+	depends on ARM
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
index 89ef0c9075b5..5daf8f10114d 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -15,7 +15,7 @@ obj-y += cpufeature.o
 obj-y += decode.o
 obj-y += device.o
 obj-$(CONFIG_IOREQ_SERVER) += dm.o
-obj-y += dom0less-build.init.o
+obj-$(CONFIG_DOM0LESS_BOOT) += dom0less-build.init.o
 obj-y += domain.o
 obj-y += domain_build.init.o
 obj-$(CONFIG_ARCH_MAP_DOMAIN_PAGE) += domain_page.o
diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
index f24df2abb91c..bc6413d0dbfd 100644
--- a/xen/arch/arm/efi/efi-boot.h
+++ b/xen/arch/arm/efi/efi-boot.h
@@ -802,6 +802,7 @@ static int __init handle_module_node(const EFI_LOADED_IMAGE *loaded_image,
     return 1;
 }
 
+#ifdef CONFIG_DOM0LESS_BOOT
 /*
  * This function checks for boot modules under the domU guest domain node
  * in the DT.
@@ -849,6 +850,7 @@ static int __init handle_dom0less_domain_node(const EFI_LOADED_IMAGE *loaded_ima
 
     return mb_modules_found;
 }
+#endif
 
 /*
  * This function checks for xen domain nodes under the /chosen node for possible
@@ -876,6 +878,7 @@ static int __init efi_check_dt_boot(const EFI_LOADED_IMAGE *loaded_image)
     {
         int ret;
 
+#ifdef CONFIG_DOM0LESS_BOOT
         if ( !fdt_node_check_compatible(fdt_efi, node, "xen,domain") )
         {
             /* Found a node with compatible xen,domain; handle this node. */
@@ -884,6 +887,7 @@ static int __init efi_check_dt_boot(const EFI_LOADED_IMAGE *loaded_image)
                 return ERROR_DT_MODULE_DOMU;
         }
         else
+#endif
         {
             ret = handle_module_node(loaded_image, &dir_handle, node, addr_len,
                                      size_len, false);
diff --git a/xen/arch/arm/include/asm/dom0less-build.h b/xen/arch/arm/include/asm/dom0less-build.h
index d95cb6234b62..859944eece16 100644
--- a/xen/arch/arm/include/asm/dom0less-build.h
+++ b/xen/arch/arm/include/asm/dom0less-build.h
@@ -8,9 +8,21 @@
 #ifndef __ARM_DOM0LESS_BUILD_H_
 #define __ARM_DOM0LESS_BUILD_H_
 
+#ifdef CONFIG_DOM0LESS_BOOT
+
 void create_domUs(void);
 bool is_dom0less_mode(void);
 
+#else  /* !CONFIG_DOM0LESS_BOOT */
+
+static inline void create_domUs(void) {}
+static inline bool is_dom0less_mode(void)
+{
+    return false;
+}
+
+#endif /* CONFIG_DOM0LESS_BOOT */
+
 #endif  /* __ARM_DOM0LESS_BUILD_H_ */
 
 /*
-- 
2.34.1


