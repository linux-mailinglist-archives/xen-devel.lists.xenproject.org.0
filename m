Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 974E7668B73
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 06:35:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476538.738824 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGCie-0004iP-Qi; Fri, 13 Jan 2023 05:35:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476538.738824; Fri, 13 Jan 2023 05:35:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGCie-0004bk-Kt; Fri, 13 Jan 2023 05:35:12 +0000
Received: by outflank-mailman (input) for mailman id 476538;
 Fri, 13 Jan 2023 05:35:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f25I=5K=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1pGCe7-0005sJ-A3
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 05:30:31 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 649eb9cb-9303-11ed-91b6-6bf2151ebd3b;
 Fri, 13 Jan 2023 06:30:30 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D6F2813D5;
 Thu, 12 Jan 2023 21:31:11 -0800 (PST)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 246403F587;
 Thu, 12 Jan 2023 21:30:26 -0800 (PST)
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
X-Inumbo-ID: 649eb9cb-9303-11ed-91b6-6bf2151ebd3b
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH v2 17/40] xen/mpu: plump virt/maddr/mfn convertion in MPU system
Date: Fri, 13 Jan 2023 13:28:50 +0800
Message-Id: <20230113052914.3845596-18-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230113052914.3845596-1-Penny.Zheng@arm.com>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

virt_to_maddr and maddr_to_virt are used widely in Xen code. So
even there is no VMSA in MPU system, we keep the interface name to
stay the same code flow.

We move the existing virt/maddr convertion from mm.h to mm_mmu.h.
And the MPU version of virt/maddr convertion is simple, returning
the input address as the output.

We should overide virt_to_mfn/mfn_to_virt in source file mm_mpu.c the
same way in mm_mmu.c.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/arch/arm/include/asm/mm.h     | 26 --------------------------
 xen/arch/arm/include/asm/mm_mmu.h | 26 ++++++++++++++++++++++++++
 xen/arch/arm/include/asm/mm_mpu.h | 13 +++++++++++++
 xen/arch/arm/mm_mpu.c             |  6 ++++++
 4 files changed, 45 insertions(+), 26 deletions(-)

diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index 9b4c07d965..e29158028a 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -250,32 +250,6 @@ static inline void __iomem *ioremap_wc(paddr_t start, size_t len)
 /* Page-align address and convert to frame number format */
 #define paddr_to_pfn_aligned(paddr)    paddr_to_pfn(PAGE_ALIGN(paddr))
 
-static inline paddr_t __virt_to_maddr(vaddr_t va)
-{
-    uint64_t par = va_to_par(va);
-    return (par & PADDR_MASK & PAGE_MASK) | (va & ~PAGE_MASK);
-}
-#define virt_to_maddr(va)   __virt_to_maddr((vaddr_t)(va))
-
-#ifdef CONFIG_ARM_32
-static inline void *maddr_to_virt(paddr_t ma)
-{
-    ASSERT(is_xen_heap_mfn(maddr_to_mfn(ma)));
-    ma -= mfn_to_maddr(directmap_mfn_start);
-    return (void *)(unsigned long) ma + XENHEAP_VIRT_START;
-}
-#else
-static inline void *maddr_to_virt(paddr_t ma)
-{
-    ASSERT((mfn_to_pdx(maddr_to_mfn(ma)) - directmap_base_pdx) <
-           (DIRECTMAP_SIZE >> PAGE_SHIFT));
-    return (void *)(XENHEAP_VIRT_START -
-                    (directmap_base_pdx << PAGE_SHIFT) +
-                    ((ma & ma_va_bottom_mask) |
-                     ((ma & ma_top_mask) >> pfn_pdx_hole_shift)));
-}
-#endif
-
 /*
  * Translate a guest virtual address to a machine address.
  * Return the fault information if the translation has failed else 0.
diff --git a/xen/arch/arm/include/asm/mm_mmu.h b/xen/arch/arm/include/asm/mm_mmu.h
index a5e63d8af8..6d7e5ddde7 100644
--- a/xen/arch/arm/include/asm/mm_mmu.h
+++ b/xen/arch/arm/include/asm/mm_mmu.h
@@ -23,6 +23,32 @@ extern uint64_t init_ttbr;
 extern void setup_directmap_mappings(unsigned long base_mfn,
                                      unsigned long nr_mfns);
 
+static inline paddr_t __virt_to_maddr(vaddr_t va)
+{
+    uint64_t par = va_to_par(va);
+    return (par & PADDR_MASK & PAGE_MASK) | (va & ~PAGE_MASK);
+}
+#define virt_to_maddr(va)   __virt_to_maddr((vaddr_t)(va))
+
+#ifdef CONFIG_ARM_32
+static inline void *maddr_to_virt(paddr_t ma)
+{
+    ASSERT(is_xen_heap_mfn(maddr_to_mfn(ma)));
+    ma -= mfn_to_maddr(directmap_mfn_start);
+    return (void *)(unsigned long) ma + XENHEAP_VIRT_START;
+}
+#else
+static inline void *maddr_to_virt(paddr_t ma)
+{
+    ASSERT((mfn_to_pdx(maddr_to_mfn(ma)) - directmap_base_pdx) <
+           (DIRECTMAP_SIZE >> PAGE_SHIFT));
+    return (void *)(XENHEAP_VIRT_START -
+                    (directmap_base_pdx << PAGE_SHIFT) +
+                    ((ma & ma_va_bottom_mask) |
+                     ((ma & ma_top_mask) >> pfn_pdx_hole_shift)));
+}
+#endif
+
 #endif /* __ARCH_ARM_MM_MMU__ */
 
 /*
diff --git a/xen/arch/arm/include/asm/mm_mpu.h b/xen/arch/arm/include/asm/mm_mpu.h
index 1f3cff7743..3a4b07f187 100644
--- a/xen/arch/arm/include/asm/mm_mpu.h
+++ b/xen/arch/arm/include/asm/mm_mpu.h
@@ -4,6 +4,19 @@
 
 #define setup_mm_mappings(boot_phys_offset) ((void)(boot_phys_offset))
 
+static inline paddr_t __virt_to_maddr(vaddr_t va)
+{
+    /* In MPU system, VA == PA. */
+    return (paddr_t)va;
+}
+#define virt_to_maddr(va)   __virt_to_maddr((vaddr_t)(va))
+
+static inline void *maddr_to_virt(paddr_t ma)
+{
+    /* In MPU system, VA == PA. */
+    return (void *)ma;
+}
+
 #endif /* __ARCH_ARM_MM_MPU__ */
 
 /*
diff --git a/xen/arch/arm/mm_mpu.c b/xen/arch/arm/mm_mpu.c
index 87a12042cc..c9e17ab6da 100644
--- a/xen/arch/arm/mm_mpu.c
+++ b/xen/arch/arm/mm_mpu.c
@@ -29,6 +29,12 @@
 pr_t __aligned(PAGE_SIZE) __section(".data.page_aligned")
      xen_mpumap[ARM_MAX_MPU_MEMORY_REGIONS];
 
+/* Override macros from asm/page.h to make them work with mfn_t */
+#undef virt_to_mfn
+#define virt_to_mfn(va) _mfn(__virt_to_mfn(va))
+#undef mfn_to_virt
+#define mfn_to_virt(mfn) __mfn_to_virt(mfn_x(mfn))
+
 /* Index into MPU memory region map for fixed regions, ascending from zero. */
 uint64_t __ro_after_init next_fixed_region_idx;
 /*
-- 
2.25.1


