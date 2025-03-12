Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C096A5DE6B
	for <lists+xen-devel@lfdr.de>; Wed, 12 Mar 2025 14:53:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.910339.1317118 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsMWL-0007wt-3b; Wed, 12 Mar 2025 13:53:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 910339.1317118; Wed, 12 Mar 2025 13:53:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsMWK-0007uP-SS; Wed, 12 Mar 2025 13:53:16 +0000
Received: by outflank-mailman (input) for mailman id 910339;
 Wed, 12 Mar 2025 13:53:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FzNf=V7=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1tsMWJ-0007NP-7l
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 13:53:15 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 5721bf00-ff49-11ef-9898-31a8f345e629;
 Wed, 12 Mar 2025 14:53:13 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7C4FD1595;
 Wed, 12 Mar 2025 06:53:23 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 635193F5A1;
 Wed, 12 Mar 2025 06:53:11 -0700 (PDT)
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
X-Inumbo-ID: 5721bf00-ff49-11ef-9898-31a8f345e629
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>,
	Wei Chen <wei.chen@arm.com>
Subject: [PATCH 04/10] arm/mpu: Implement virt/maddr conversion in MPU system
Date: Wed, 12 Mar 2025 13:52:52 +0000
Message-Id: <20250312135258.1815706-5-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250312135258.1815706-1-luca.fancellu@arm.com>
References: <20250312135258.1815706-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Penny Zheng <Penny.Zheng@arm.com>

virt_to_maddr and maddr_to_virt are used widely in Xen code. So
even there is no VMSA in MPU system, we keep the interface in MPU to
don't change the existing common code.

In order to do that, move the virt_to_maddr() definition to mmu/mm.h,
instead for maddr_to_virt() it's more difficult to isolate it under mmu/
so it will be protected by #ifdef CONFIG_MMU.

Finally implement virt_to_maddr() and maddr_to_virt() for MPU systems
under mpu/mm.h, the MPU version of virt/maddr conversion is simple since
VA==PA.

While there, take the occasion to add emacs footer to mpu/mm.c.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 xen/arch/arm/include/asm/mm.h     | 13 +++++++------
 xen/arch/arm/include/asm/mmu/mm.h |  7 +++++++
 xen/arch/arm/include/asm/mpu/mm.h | 27 +++++++++++++++++++++++++++
 xen/arch/arm/mpu/mm.c             |  9 +++++++++
 4 files changed, 50 insertions(+), 6 deletions(-)
 create mode 100644 xen/arch/arm/include/asm/mpu/mm.h

diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index a0d8e5afe977..e7767cdab493 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -16,8 +16,10 @@
 
 #if defined(CONFIG_MMU)
 # include <asm/mmu/mm.h>
-#elif !defined(CONFIG_MPU)
-# error "Unknown memory management layout"
+#elif defined(CONFIG_MPU)
+# include <asm/mpu/mm.h>
+#else
+#error "Unknown memory management layout"
 #endif
 
 /* Align Xen to a 2 MiB boundary. */
@@ -261,10 +263,7 @@ static inline void __iomem *ioremap_wc(paddr_t start, size_t len)
 /* Page-align address and convert to frame number format */
 #define paddr_to_pfn_aligned(paddr)    paddr_to_pfn(PAGE_ALIGN(paddr))
 
-#define virt_to_maddr(va) ({                                        \
-    vaddr_t va_ = (vaddr_t)(va);                                    \
-    (paddr_t)((va_to_par(va_) & PADDR_MASK & PAGE_MASK) | (va_ & ~PAGE_MASK)); \
-})
+#if defined(CONFIG_MMU)
 
 #ifdef CONFIG_ARM_32
 /**
@@ -310,6 +309,8 @@ static inline void *maddr_to_virt(paddr_t ma)
 }
 #endif
 
+#endif /* CONFIG_MMU */
+
 /*
  * Translate a guest virtual address to a machine address.
  * Return the fault information if the translation has failed else 0.
diff --git a/xen/arch/arm/include/asm/mmu/mm.h b/xen/arch/arm/include/asm/mmu/mm.h
index f5a00558c47b..5ff2071133ee 100644
--- a/xen/arch/arm/include/asm/mmu/mm.h
+++ b/xen/arch/arm/include/asm/mmu/mm.h
@@ -2,6 +2,8 @@
 #ifndef __ARM_MMU_MM_H__
 #define __ARM_MMU_MM_H__
 
+#include <asm/page.h>
+
 /* Non-boot CPUs use this to find the correct pagetables. */
 extern uint64_t init_ttbr;
 
@@ -14,6 +16,11 @@ extern unsigned long directmap_base_pdx;
 
 #define frame_table ((struct page_info *)FRAMETABLE_VIRT_START)
 
+#define virt_to_maddr(va) ({                                                   \
+    vaddr_t va_ = (vaddr_t)(va);                                               \
+    (paddr_t)((va_to_par(va_) & PADDR_MASK & PAGE_MASK) | (va_ & ~PAGE_MASK)); \
+})
+
 /*
  * Print a walk of a page table or p2m
  *
diff --git a/xen/arch/arm/include/asm/mpu/mm.h b/xen/arch/arm/include/asm/mpu/mm.h
new file mode 100644
index 000000000000..57f1e558fd44
--- /dev/null
+++ b/xen/arch/arm/include/asm/mpu/mm.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __ARM_MPU_MM__
+#define __ARM_MPU_MM__
+
+#include <xen/macros.h>
+
+#define virt_to_maddr(va) ({  \
+    (paddr_t)va;              \
+})
+
+/* On MPU systems there is no translation, ma == va. */
+static inline void *maddr_to_virt(paddr_t ma)
+{
+    return _p(ma);
+}
+
+#endif /* __ARM_MPU_MM__ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
index 0b8748e57598..a11e017d8a96 100644
--- a/xen/arch/arm/mpu/mm.c
+++ b/xen/arch/arm/mpu/mm.c
@@ -13,3 +13,12 @@ static void __init __maybe_unused build_assertions(void)
      */
     BUILD_BUG_ON(PAGE_SIZE != SZ_4K);
 }
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.34.1


