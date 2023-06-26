Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9A173D669
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 05:39:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.554990.866524 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd4k-0004k3-Eq; Mon, 26 Jun 2023 03:39:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 554990.866524; Mon, 26 Jun 2023 03:39:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd4k-0004gb-8v; Mon, 26 Jun 2023 03:39:38 +0000
Received: by outflank-mailman (input) for mailman id 554990;
 Mon, 26 Jun 2023 03:39:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=24BZ=CO=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qDd24-0007ej-Vx
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 03:36:52 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id b05c4b7f-13d2-11ee-b237-6b7b168915f2;
 Mon, 26 Jun 2023 05:36:52 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 960CC1FB;
 Sun, 25 Jun 2023 20:37:35 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id EEBF23F64C;
 Sun, 25 Jun 2023 20:36:48 -0700 (PDT)
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
X-Inumbo-ID: b05c4b7f-13d2-11ee-b237-6b7b168915f2
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>,
	Wei Chen <wei.chen@arm.com>
Subject: [PATCH v3 33/52] xen/mpu: initialize frametable in MPU system
Date: Mon, 26 Jun 2023 11:34:24 +0800
Message-Id: <20230626033443.2943270-34-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230626033443.2943270-1-Penny.Zheng@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Xen is using page as the smallest granularity for memory managment.
And we want to follow the same concept in MPU system.
That is, structure page_info and the frametable which is used for storing
and managing the smallest memory managment unit is also required in MPU system.

In MPU system, since we can not use a fixed VA address(FRAMETABLE_VIRT_START)
to map frametable like MMU system does and everything is 1:1 mapping, we
instead define a variable "struct page_info *frame_table" as frametable
pointer, and ask boot allocator to allocate appropriate memory for frametable.

As frametable is successfully initialized, the convertion between machine frame
number/machine address/"virtual address" and page-info structure is
ready too, like mfn_to_page/maddr_to_page/virt_to_page, etc

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Wei Chen <wei.chen@arm.com>
---
v3:
- add ASSERT() to confirm the MFN you pass is covered by the frametable.
---
 xen/arch/arm/include/asm/mm.h     | 14 ++++++++++++++
 xen/arch/arm/include/asm/mpu/mm.h |  3 +++
 xen/arch/arm/mpu/mm.c             | 27 +++++++++++++++++++++++++++
 3 files changed, 44 insertions(+)

diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index daa6329505..66d98b9a29 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -341,6 +341,19 @@ static inline uint64_t gvirt_to_maddr(vaddr_t va, paddr_t *pa,
 #define virt_to_mfn(va)     __virt_to_mfn(va)
 #define mfn_to_virt(mfn)    __mfn_to_virt(mfn)
 
+#ifdef CONFIG_HAS_MPU
+/* Convert between virtual address to page-info structure. */
+static inline struct page_info *virt_to_page(const void *v)
+{
+    unsigned long pdx;
+
+    pdx = paddr_to_pdx(virt_to_maddr(v));
+    ASSERT(pdx >= frametable_base_pdx);
+    ASSERT(pdx < frametable_pdx_end);
+
+    return frame_table + pdx - frametable_base_pdx;
+}
+#else
 /* Convert between Xen-heap virtual addresses and page-info structures. */
 static inline struct page_info *virt_to_page(const void *v)
 {
@@ -354,6 +367,7 @@ static inline struct page_info *virt_to_page(const void *v)
     pdx += mfn_to_pdx(directmap_mfn_start);
     return frame_table + pdx - frametable_base_pdx;
 }
+#endif
 
 static inline void *page_to_virt(const struct page_info *pg)
 {
diff --git a/xen/arch/arm/include/asm/mpu/mm.h b/xen/arch/arm/include/asm/mpu/mm.h
index e26bd4f975..98f6df65b8 100644
--- a/xen/arch/arm/include/asm/mpu/mm.h
+++ b/xen/arch/arm/include/asm/mpu/mm.h
@@ -2,6 +2,9 @@
 #ifndef __ARCH_ARM_MM_MPU__
 #define __ARCH_ARM_MM_MPU__
 
+extern struct page_info *frame_table;
+extern unsigned long frametable_pdx_end;
+
 extern int xen_mpumap_update(paddr_t base, paddr_t limit, unsigned int flags);
 extern void setup_staticheap_mappings(void);
 
diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
index 7bd5609102..0a65b58dc4 100644
--- a/xen/arch/arm/mpu/mm.c
+++ b/xen/arch/arm/mpu/mm.c
@@ -27,6 +27,10 @@
 #include <asm/page.h>
 #include <asm/setup.h>
 
+/* Override macros from asm/mm.h to make them work with mfn_t */
+#undef mfn_to_virt
+#define mfn_to_virt(mfn) __mfn_to_virt(mfn_x(mfn))
+
 #ifdef NDEBUG
 static inline void __attribute__ ((__format__ (__printf__, 1, 2)))
 region_printk(const char *fmt, ...) {}
@@ -58,6 +62,9 @@ static DEFINE_SPINLOCK(xen_mpumap_lock);
 
 static DEFINE_SPINLOCK(xen_mpumap_alloc_lock);
 
+struct page_info *frame_table;
+unsigned long frametable_pdx_end __read_mostly;
+
 /* Write a MPU protection region */
 #define WRITE_PROTECTION_REGION(pr, prbar_el2, prlar_el2) ({    \
     const pr_t *_pr = pr;                                       \
@@ -513,6 +520,26 @@ void __init setup_staticheap_mappings(void)
     }
 }
 
+/* Map a frame table to cover physical addresses ps through pe */
+void __init setup_frametable_mappings(paddr_t ps, paddr_t pe)
+{
+    mfn_t base_mfn;
+    unsigned long nr_pdxs = mfn_to_pdx(mfn_add(maddr_to_mfn(pe), -1)) -
+                            mfn_to_pdx(maddr_to_mfn(ps)) + 1;
+    unsigned long frametable_size = nr_pdxs * sizeof(struct page_info);
+
+    frametable_base_pdx = paddr_to_pdx(ps);
+    frametable_size = ROUNDUP(frametable_size, PAGE_SIZE);
+    frametable_pdx_end = frametable_base_pdx + nr_pdxs;
+
+    base_mfn = alloc_boot_pages(frametable_size >> PAGE_SHIFT, 1);
+    frame_table = (struct page_info *)mfn_to_virt(base_mfn);
+
+    memset(&frame_table[0], 0, nr_pdxs * sizeof(struct page_info));
+    memset(&frame_table[nr_pdxs], -1,
+           frametable_size - (nr_pdxs * sizeof(struct page_info)));
+}
+
 /*
  * Local variables:
  * mode: C
-- 
2.25.1


