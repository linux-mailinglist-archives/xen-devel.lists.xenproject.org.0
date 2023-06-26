Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C58573D68D
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 05:40:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555090.866866 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd5o-000459-Ci; Mon, 26 Jun 2023 03:40:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555090.866866; Mon, 26 Jun 2023 03:40:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd5n-0003fE-B3; Mon, 26 Jun 2023 03:40:43 +0000
Received: by outflank-mailman (input) for mailman id 555090;
 Mon, 26 Jun 2023 03:40:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=24BZ=CO=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qDd0w-0000HH-M8
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 03:35:42 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 85cf78f1-13d2-11ee-8611-37d641c3527e;
 Mon, 26 Jun 2023 05:35:40 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 256A01FB;
 Sun, 25 Jun 2023 20:36:24 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 7DE363F64C;
 Sun, 25 Jun 2023 20:35:37 -0700 (PDT)
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
X-Inumbo-ID: 85cf78f1-13d2-11ee-8611-37d641c3527e
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>,
	Wei Chen <wei.chen@arm.com>
Subject: [PATCH v3 11/52] xen/arm: mmu: fold FIXMAP into MMU system
Date: Mon, 26 Jun 2023 11:34:02 +0800
Message-Id: <20230626033443.2943270-12-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230626033443.2943270-1-Penny.Zheng@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

FIXMAP in MMU system is used to do special-purpose 4K mapping, like
mapping early UART, temporarily mapping source codes for copy and paste
(copy_from_paddr), etc.

As FIXMAP feature is highly dependent on virtual address translation, we
introduce a new Kconfig CONFIG_HAS_FIXMAP to wrap all releated codes, then
we fold it into MMU system.
Since PMAP relies on FIXMAP, so we fold it too into MMU system.

Under !CONFIG_HAS_FIXMAP, we provide empty stubbers for not breaking
compilation.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
---
v1 -> v2
- new patch
---
v3:
- fold CONFIG_HAS_FIXMAP into CONFIG_HAS_MMU
- change CONFIG_HAS_FIXMAP to an Arm-specific Kconfig
---
 xen/arch/arm/Kconfig              |  7 ++++++-
 xen/arch/arm/include/asm/fixmap.h | 31 ++++++++++++++++++++++++++++---
 2 files changed, 34 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index fb77392b82..22b28b8ba2 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -15,7 +15,6 @@ config ARM
 	select HAS_DEVICE_TREE
 	select HAS_PASSTHROUGH
 	select HAS_PDX
-	select HAS_PMAP
 	select IOMMU_FORCE_PT_SHARE
 
 config ARCH_DEFCONFIG
@@ -63,11 +62,17 @@ source "arch/Kconfig"
 config HAS_MMU
 	bool "Memory Management Unit support in a VMSA system"
 	default y
+	select HAS_PMAP
 	help
 	  In a VMSA system, a Memory Management Unit (MMU) provides fine-grained control of
 	  a memory system through a set of virtual to physical address mappings and associated memory
 	  properties held in memory-mapped tables known as translation tables.
 
+config HAS_FIXMAP
+	bool "Provide special-purpose 4K mapping slots in a VMSA"
+	depends on HAS_MMU
+	default y
+
 config ACPI
 	bool "ACPI (Advanced Configuration and Power Interface) Support (UNSUPPORTED)" if UNSUPPORTED
 	depends on ARM_64
diff --git a/xen/arch/arm/include/asm/fixmap.h b/xen/arch/arm/include/asm/fixmap.h
index d0c9a52c8c..1b5b62866b 100644
--- a/xen/arch/arm/include/asm/fixmap.h
+++ b/xen/arch/arm/include/asm/fixmap.h
@@ -4,9 +4,6 @@
 #ifndef __ASM_FIXMAP_H
 #define __ASM_FIXMAP_H
 
-#include <xen/acpi.h>
-#include <xen/pmap.h>
-
 /* Fixmap slots */
 #define FIXMAP_CONSOLE  0  /* The primary UART */
 #define FIXMAP_MISC     1  /* Ephemeral mappings of hardware */
@@ -22,6 +19,11 @@
 
 #ifndef __ASSEMBLY__
 
+#ifdef CONFIG_HAS_FIXMAP
+
+#include <xen/acpi.h>
+#include <xen/pmap.h>
+
 /*
  * Direct access to xen_fixmap[] should only happen when {set,
  * clear}_fixmap() is unusable (e.g. where we would end up to
@@ -43,6 +45,29 @@ static inline unsigned int virt_to_fix(vaddr_t vaddr)
     return ((vaddr - FIXADDR_START) >> PAGE_SHIFT);
 }
 
+#else /* !CONFIG_HAS_FIXMAP */
+
+#include <xen/mm-frame.h>
+#include <xen/errno.h>
+
+static inline void set_fixmap(unsigned int map, mfn_t mfn,
+                              unsigned int attributes)
+{
+    ASSERT_UNREACHABLE();
+}
+
+static inline void clear_fixmap(unsigned int map)
+{
+    ASSERT_UNREACHABLE();
+}
+
+static inline unsigned int virt_to_fix(vaddr_t vaddr)
+{
+    ASSERT_UNREACHABLE();
+    return -EINVAL;
+}
+#endif /* !CONFIG_HAS_FIXMAP */
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* __ASM_FIXMAP_H */
-- 
2.25.1


