Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 305B2A7770F
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 10:59:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.933677.1335569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzXSk-0002t0-DX; Tue, 01 Apr 2025 08:59:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 933677.1335569; Tue, 01 Apr 2025 08:59:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzXSk-0002qh-9Z; Tue, 01 Apr 2025 08:59:14 +0000
Received: by outflank-mailman (input) for mailman id 933677;
 Tue, 01 Apr 2025 08:59:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=heJ8=WT=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1tzXSi-0002OX-Kq
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 08:59:12 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 93ee04b7-0ed7-11f0-9ea7-5ba50f476ded;
 Tue, 01 Apr 2025 10:59:11 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3A4CB14BF;
 Tue,  1 Apr 2025 01:59:14 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4D3B53F694;
 Tue,  1 Apr 2025 01:59:09 -0700 (PDT)
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
X-Inumbo-ID: 93ee04b7-0ed7-11f0-9ea7-5ba50f476ded
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
Subject: [PATCH v4 2/7] xen/arm: Implement virt/maddr conversion in MPU system
Date: Tue,  1 Apr 2025 09:58:53 +0100
Message-Id: <20250401085858.2228991-3-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250401085858.2228991-1-luca.fancellu@arm.com>
References: <20250401085858.2228991-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Penny Zheng <Penny.Zheng@arm.com>

virt_to_maddr and maddr_to_virt are used widely in Xen code. So
even there is no VMSA in MPU system, we keep the interface in MPU to
to avoid changing the existing common code.

In order to do that, move the virt_to_maddr() and maddr_to_virt()
definitions to mmu/mm.h, move the include of memory management
subsystems (MMU/MPU) on a different place because the mentioned
helpers needs visibility of some macro in asm/mm.h.

Finally implement virt_to_maddr() and maddr_to_virt() for MPU systems
under mpu/mm.h, the MPU version of virt/maddr conversion is simple since
VA==PA.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
v4 changes:
 - no changes
v3 changes:
 - Add Michal R-by
v2 changes:
 - add missing headers, fix header protection macro name convention
 - take into account PADDR_MASK in virt_to_maddr
 - fixed typo in commit message
 - moved also maddr_to_virt to mmu/mm.h and moved include of mmu/mpu.
 - moved introduction of mm.c footer on commit that touches that file.
---
 xen/arch/arm/include/asm/mm.h     | 64 +++++--------------------------
 xen/arch/arm/include/asm/mmu/mm.h | 56 +++++++++++++++++++++++++++
 xen/arch/arm/include/asm/mpu/mm.h | 27 +++++++++++++
 3 files changed, 92 insertions(+), 55 deletions(-)
 create mode 100644 xen/arch/arm/include/asm/mpu/mm.h

diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index a0d8e5afe977..444fd03823ec 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -14,12 +14,6 @@
 # error "unknown ARM variant"
 #endif
 
-#if defined(CONFIG_MMU)
-# include <asm/mmu/mm.h>
-#elif !defined(CONFIG_MPU)
-# error "Unknown memory management layout"
-#endif
-
 /* Align Xen to a 2 MiB boundary. */
 #define XEN_PADDR_ALIGN (1 << 21)
 
@@ -261,55 +255,6 @@ static inline void __iomem *ioremap_wc(paddr_t start, size_t len)
 /* Page-align address and convert to frame number format */
 #define paddr_to_pfn_aligned(paddr)    paddr_to_pfn(PAGE_ALIGN(paddr))
 
-#define virt_to_maddr(va) ({                                        \
-    vaddr_t va_ = (vaddr_t)(va);                                    \
-    (paddr_t)((va_to_par(va_) & PADDR_MASK & PAGE_MASK) | (va_ & ~PAGE_MASK)); \
-})
-
-#ifdef CONFIG_ARM_32
-/**
- * Find the virtual address corresponding to a machine address
- *
- * Only memory backing the XENHEAP has a corresponding virtual address to
- * be found. This is so we can save precious virtual space, as it's in
- * short supply on arm32. This mapping is not subject to PDX compression
- * because XENHEAP is known to be physically contiguous and can't hence
- * jump over the PDX hole. This means we can avoid the roundtrips
- * converting to/from pdx.
- *
- * @param ma Machine address
- * @return Virtual address mapped to `ma`
- */
-static inline void *maddr_to_virt(paddr_t ma)
-{
-    ASSERT(is_xen_heap_mfn(maddr_to_mfn(ma)));
-    ma -= mfn_to_maddr(directmap_mfn_start);
-    return (void *)(unsigned long) ma + XENHEAP_VIRT_START;
-}
-#else
-/**
- * Find the virtual address corresponding to a machine address
- *
- * The directmap covers all conventional memory accesible by the
- * hypervisor. This means it's subject to PDX compression.
- *
- * Note there's an extra offset applied (directmap_base_pdx) on top of the
- * regular PDX compression logic. Its purpose is to skip over the initial
- * range of non-existing memory, should there be one.
- *
- * @param ma Machine address
- * @return Virtual address mapped to `ma`
- */
-static inline void *maddr_to_virt(paddr_t ma)
-{
-    ASSERT((mfn_to_pdx(maddr_to_mfn(ma)) - directmap_base_pdx) <
-           (DIRECTMAP_SIZE >> PAGE_SHIFT));
-    return (void *)(XENHEAP_VIRT_START -
-                    (directmap_base_pdx << PAGE_SHIFT) +
-                    maddr_to_directmapoff(ma));
-}
-#endif
-
 /*
  * Translate a guest virtual address to a machine address.
  * Return the fault information if the translation has failed else 0.
@@ -340,6 +285,15 @@ static inline uint64_t gvirt_to_maddr(vaddr_t va, paddr_t *pa,
 #define virt_to_mfn(va)     __virt_to_mfn(va)
 #define mfn_to_virt(mfn)    __mfn_to_virt(mfn)
 
+/* Memory management subsystem header placed here to see the above macros */
+#if defined(CONFIG_MMU)
+# include <asm/mmu/mm.h>
+#elif defined(CONFIG_MPU)
+# include <asm/mpu/mm.h>
+#else
+#error "Unknown memory management layout"
+#endif
+
 /* Convert between Xen-heap virtual addresses and page-info structures. */
 static inline struct page_info *virt_to_page(const void *v)
 {
diff --git a/xen/arch/arm/include/asm/mmu/mm.h b/xen/arch/arm/include/asm/mmu/mm.h
index f5a00558c47b..6737c3ede783 100644
--- a/xen/arch/arm/include/asm/mmu/mm.h
+++ b/xen/arch/arm/include/asm/mmu/mm.h
@@ -2,6 +2,13 @@
 #ifndef __ARM_MMU_MM_H__
 #define __ARM_MMU_MM_H__
 
+#include <xen/bug.h>
+#include <xen/pdx.h>
+#include <xen/types.h>
+#include <asm/mm.h>
+#include <asm/mmu/layout.h>
+#include <asm/page.h>
+
 /* Non-boot CPUs use this to find the correct pagetables. */
 extern uint64_t init_ttbr;
 
@@ -14,6 +21,55 @@ extern unsigned long directmap_base_pdx;
 
 #define frame_table ((struct page_info *)FRAMETABLE_VIRT_START)
 
+#define virt_to_maddr(va) ({                                                   \
+    vaddr_t va_ = (vaddr_t)(va);                                               \
+    (paddr_t)((va_to_par(va_) & PADDR_MASK & PAGE_MASK) | (va_ & ~PAGE_MASK)); \
+})
+
+#ifdef CONFIG_ARM_32
+/**
+ * Find the virtual address corresponding to a machine address
+ *
+ * Only memory backing the XENHEAP has a corresponding virtual address to
+ * be found. This is so we can save precious virtual space, as it's in
+ * short supply on arm32. This mapping is not subject to PDX compression
+ * because XENHEAP is known to be physically contiguous and can't hence
+ * jump over the PDX hole. This means we can avoid the roundtrips
+ * converting to/from pdx.
+ *
+ * @param ma Machine address
+ * @return Virtual address mapped to `ma`
+ */
+static inline void *maddr_to_virt(paddr_t ma)
+{
+    ASSERT(is_xen_heap_mfn(maddr_to_mfn(ma)));
+    ma -= mfn_to_maddr(directmap_mfn_start);
+    return (void *)(unsigned long) ma + XENHEAP_VIRT_START;
+}
+#else
+/**
+ * Find the virtual address corresponding to a machine address
+ *
+ * The directmap covers all conventional memory accesible by the
+ * hypervisor. This means it's subject to PDX compression.
+ *
+ * Note there's an extra offset applied (directmap_base_pdx) on top of the
+ * regular PDX compression logic. Its purpose is to skip over the initial
+ * range of non-existing memory, should there be one.
+ *
+ * @param ma Machine address
+ * @return Virtual address mapped to `ma`
+ */
+static inline void *maddr_to_virt(paddr_t ma)
+{
+    ASSERT((mfn_to_pdx(maddr_to_mfn(ma)) - directmap_base_pdx) <
+           (DIRECTMAP_SIZE >> PAGE_SHIFT));
+    return (void *)(XENHEAP_VIRT_START -
+                    (directmap_base_pdx << PAGE_SHIFT) +
+                    maddr_to_directmapoff(ma));
+}
+#endif
+
 /*
  * Print a walk of a page table or p2m
  *
diff --git a/xen/arch/arm/include/asm/mpu/mm.h b/xen/arch/arm/include/asm/mpu/mm.h
new file mode 100644
index 000000000000..6cfd0f5cd2c2
--- /dev/null
+++ b/xen/arch/arm/include/asm/mpu/mm.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __ARM_MPU_MM_H__
+#define __ARM_MPU_MM_H__
+
+#include <xen/macros.h>
+#include <xen/page-size.h>
+#include <xen/types.h>
+
+#define virt_to_maddr(va) ((paddr_t)((vaddr_t)(va) & PADDR_MASK))
+
+/* On MPU systems there is no translation, ma == va. */
+static inline void *maddr_to_virt(paddr_t ma)
+{
+    return _p(ma);
+}
+
+#endif /* __ARM_MPU_MM_H__ */
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


