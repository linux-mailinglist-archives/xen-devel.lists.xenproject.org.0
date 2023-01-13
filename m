Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E61D7668B80
	for <lists+xen-devel@lfdr.de>; Fri, 13 Jan 2023 06:36:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.476601.738972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGCjX-0002zA-3x; Fri, 13 Jan 2023 05:36:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 476601.738972; Fri, 13 Jan 2023 05:36:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pGCjW-0002w3-VA; Fri, 13 Jan 2023 05:36:06 +0000
Received: by outflank-mailman (input) for mailman id 476601;
 Fri, 13 Jan 2023 05:36:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f25I=5K=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1pGCeQ-0005sJ-1W
 for xen-devel@lists.xenproject.org; Fri, 13 Jan 2023 05:30:50 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 6fbbe079-9303-11ed-91b6-6bf2151ebd3b;
 Fri, 13 Jan 2023 06:30:48 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8DBB513D5;
 Thu, 12 Jan 2023 21:31:30 -0800 (PST)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CFA2A3F587;
 Thu, 12 Jan 2023 21:30:45 -0800 (PST)
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
X-Inumbo-ID: 6fbbe079-9303-11ed-91b6-6bf2151ebd3b
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH v2 23/40] xen/mpu: initialize frametable in MPU system
Date: Fri, 13 Jan 2023 13:28:56 +0800
Message-Id: <20230113052914.3845596-24-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230113052914.3845596-1-Penny.Zheng@arm.com>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Xen is using page as the smallest granularity for memory managment.
And we want to follow the same concept in MPU system.
That is, structure page_info and the frametable which is used for storing
and managing page_info is also required in MPU system.

In MPU system, since there is no virtual address translation (VA == PA),
we can not use a fixed VA address(FRAMETABLE_VIRT_START) to map frametable
like MMU system does.
Instead, we define a variable "struct page_info *frame_table" as frametable
pointer, and ask boot allocator to allocate memory for frametable.

As frametable is successfully initialized, the convertion between machine frame
number/machine address/"virtual address" and page-info structure is
ready too, like mfn_to_page/maddr_to_page/virt_to_page, etc

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/arch/arm/include/asm/mm.h     | 15 ---------------
 xen/arch/arm/include/asm/mm_mmu.h | 16 ++++++++++++++++
 xen/arch/arm/include/asm/mm_mpu.h | 17 +++++++++++++++++
 xen/arch/arm/mm_mpu.c             | 25 +++++++++++++++++++++++++
 4 files changed, 58 insertions(+), 15 deletions(-)

diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index e29158028a..7969ec9f98 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -176,7 +176,6 @@ struct page_info
 
 #define maddr_get_owner(ma)   (page_get_owner(maddr_to_page((ma))))
 
-#define frame_table ((struct page_info *)FRAMETABLE_VIRT_START)
 /* PDX of the first page in the frame table. */
 extern unsigned long frametable_base_pdx;
 
@@ -280,20 +279,6 @@ static inline uint64_t gvirt_to_maddr(vaddr_t va, paddr_t *pa,
 #define virt_to_mfn(va)     __virt_to_mfn(va)
 #define mfn_to_virt(mfn)    __mfn_to_virt(mfn)
 
-/* Convert between Xen-heap virtual addresses and page-info structures. */
-static inline struct page_info *virt_to_page(const void *v)
-{
-    unsigned long va = (unsigned long)v;
-    unsigned long pdx;
-
-    ASSERT(va >= XENHEAP_VIRT_START);
-    ASSERT(va < directmap_virt_end);
-
-    pdx = (va - XENHEAP_VIRT_START) >> PAGE_SHIFT;
-    pdx += mfn_to_pdx(directmap_mfn_start);
-    return frame_table + pdx - frametable_base_pdx;
-}
-
 static inline void *page_to_virt(const struct page_info *pg)
 {
     return mfn_to_virt(mfn_x(page_to_mfn(pg)));
diff --git a/xen/arch/arm/include/asm/mm_mmu.h b/xen/arch/arm/include/asm/mm_mmu.h
index 6d7e5ddde7..bc1b04c4c7 100644
--- a/xen/arch/arm/include/asm/mm_mmu.h
+++ b/xen/arch/arm/include/asm/mm_mmu.h
@@ -23,6 +23,8 @@ extern uint64_t init_ttbr;
 extern void setup_directmap_mappings(unsigned long base_mfn,
                                      unsigned long nr_mfns);
 
+#define frame_table ((struct page_info *)FRAMETABLE_VIRT_START)
+
 static inline paddr_t __virt_to_maddr(vaddr_t va)
 {
     uint64_t par = va_to_par(va);
@@ -49,6 +51,20 @@ static inline void *maddr_to_virt(paddr_t ma)
 }
 #endif
 
+/* Convert between Xen-heap virtual addresses and page-info structures. */
+static inline struct page_info *virt_to_page(const void *v)
+{
+    unsigned long va = (unsigned long)v;
+    unsigned long pdx;
+
+    ASSERT(va >= XENHEAP_VIRT_START);
+    ASSERT(va < directmap_virt_end);
+
+    pdx = (va - XENHEAP_VIRT_START) >> PAGE_SHIFT;
+    pdx += mfn_to_pdx(directmap_mfn_start);
+    return frame_table + pdx - frametable_base_pdx;
+}
+
 #endif /* __ARCH_ARM_MM_MMU__ */
 
 /*
diff --git a/xen/arch/arm/include/asm/mm_mpu.h b/xen/arch/arm/include/asm/mm_mpu.h
index fe6a828a50..eebd5b5d35 100644
--- a/xen/arch/arm/include/asm/mm_mpu.h
+++ b/xen/arch/arm/include/asm/mm_mpu.h
@@ -9,6 +9,8 @@
  */
 extern void setup_static_mappings(void);
 
+extern struct page_info *frame_table;
+
 static inline paddr_t __virt_to_maddr(vaddr_t va)
 {
     /* In MPU system, VA == PA. */
@@ -22,6 +24,21 @@ static inline void *maddr_to_virt(paddr_t ma)
     return (void *)ma;
 }
 
+/* Convert between virtual address to page-info structure. */
+static inline struct page_info *virt_to_page(const void *v)
+{
+    unsigned long va = (unsigned long)v;
+    unsigned long pdx;
+
+    /*
+     * In MPU system, VA == PA, virt_to_maddr() outputs the
+     * exact input address.
+     */
+    pdx = mfn_to_pdx(maddr_to_mfn(virt_to_maddr(va)));
+
+    return frame_table + pdx - frametable_base_pdx;
+}
+
 #endif /* __ARCH_ARM_MM_MPU__ */
 
 /*
diff --git a/xen/arch/arm/mm_mpu.c b/xen/arch/arm/mm_mpu.c
index f057ee26df..7b282be4fb 100644
--- a/xen/arch/arm/mm_mpu.c
+++ b/xen/arch/arm/mm_mpu.c
@@ -69,6 +69,8 @@ static DEFINE_SPINLOCK(xen_mpumap_lock);
 
 static paddr_t dtb_paddr;
 
+struct page_info *frame_table;
+
 /* Write a MPU protection region */
 #define WRITE_PROTECTION_REGION(sel, pr, prbar_el2, prlar_el2) ({       \
     uint64_t _sel = sel;                                                \
@@ -564,6 +566,29 @@ void __init setup_static_mappings(void)
     /* TODO: guest memory section, device memory section, boot-module section, etc */
 }
 
+/* Map a frame table to cover physical addresses ps through pe */
+void __init setup_frametable_mappings(paddr_t ps, paddr_t pe)
+{
+    mfn_t base_mfn;
+    unsigned long nr_pdxs = mfn_to_pdx(mfn_add(maddr_to_mfn(pe), -1)) -
+                            mfn_to_pdx(maddr_to_mfn(ps)) + 1;
+    unsigned long frametable_size = nr_pdxs * sizeof(struct page_info);
+
+    frametable_base_pdx = mfn_to_pdx(maddr_to_mfn(ps));
+    frametable_size = ROUNDUP(frametable_size, PAGE_SIZE);
+    /*
+     * Since VA == PA in MPU and we've already setup Xenheap mapping
+     * in setup_staticheap_mappings(), we could easily deduce the
+     * "virtual address" of frame table.
+     */
+    base_mfn = alloc_boot_pages(frametable_size >> PAGE_SHIFT, 1);
+    frame_table = (struct page_info*)mfn_to_virt(base_mfn);
+
+    memset(&frame_table[0], 0, nr_pdxs * sizeof(struct page_info));
+    memset(&frame_table[nr_pdxs], -1,
+           frametable_size - (nr_pdxs * sizeof(struct page_info)));
+}
+
 /* TODO: Implementation on the first usage */
 void dump_hyp_walk(vaddr_t addr)
 {
-- 
2.25.1


