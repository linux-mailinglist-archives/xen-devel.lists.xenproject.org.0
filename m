Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A82A77710
	for <lists+xen-devel@lfdr.de>; Tue,  1 Apr 2025 10:59:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.933678.1335575 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzXSk-0002zb-No; Tue, 01 Apr 2025 08:59:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 933678.1335575; Tue, 01 Apr 2025 08:59:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tzXSk-0002tN-JE; Tue, 01 Apr 2025 08:59:14 +0000
Received: by outflank-mailman (input) for mailman id 933678;
 Tue, 01 Apr 2025 08:59:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=heJ8=WT=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1tzXSj-0002OX-Mo
 for xen-devel@lists.xenproject.org; Tue, 01 Apr 2025 08:59:13 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 94c1d5fb-0ed7-11f0-9ea7-5ba50f476ded;
 Tue, 01 Apr 2025 10:59:12 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 96AD219F0;
 Tue,  1 Apr 2025 01:59:15 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1B1073F694;
 Tue,  1 Apr 2025 01:59:10 -0700 (PDT)
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
X-Inumbo-ID: 94c1d5fb-0ed7-11f0-9ea7-5ba50f476ded
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v4 3/7] xen/arm: Introduce frame_table and virt_to_page
Date: Tue,  1 Apr 2025 09:58:54 +0100
Message-Id: <20250401085858.2228991-4-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250401085858.2228991-1-luca.fancellu@arm.com>
References: <20250401085858.2228991-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce frame_table in order to provide the implementation of
virt_to_page for MPU system, move the MMU variant in mmu/mm.h.

Introduce FRAMETABLE_NR that is required for 'pdx_group_valid' in
pdx.c, but leave the initialisation of the frame table to a later
stage.
Define FRAMETABLE_SIZE for MPU to support up to 1TB of ram at this
stage, as the only current implementation of armv8-r aarch64, which
is cortex R82, can support 1TB or 256TB (r82 TRM r3p1
ID_AA64MMFR0_EL1.PARange).

Take the occasion to sort alphabetically the headers following
the Xen code style and add the emacs footer in mpu/mm.c.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
Reviewed-by: Michal Orzel <michal.orzel@amd.com>
---
v4 changes:
 - no changes
v3 changes:
 - Simplified MPU virt_to_page conversions (Michal suggested)
 - Mentioned r82 TRM source for frame table size (Michal)
 - Add Michal R-by
v2 changes:
 - sorted headers in mm.c
 - modified commit message
 - moved virt_to_page to MMU and MPU
 - removed frametable_pdx_end, used mfn_valid
---
 xen/arch/arm/include/asm/mm.h         | 14 --------------
 xen/arch/arm/include/asm/mmu/mm.h     | 14 ++++++++++++++
 xen/arch/arm/include/asm/mpu/layout.h |  3 +++
 xen/arch/arm/include/asm/mpu/mm.h     | 14 ++++++++++++++
 xen/arch/arm/mpu/mm.c                 | 14 +++++++++++++-
 5 files changed, 44 insertions(+), 15 deletions(-)

diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index 444fd03823ec..fbffaccef49b 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -294,20 +294,6 @@ static inline uint64_t gvirt_to_maddr(vaddr_t va, paddr_t *pa,
 #error "Unknown memory management layout"
 #endif
 
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
diff --git a/xen/arch/arm/include/asm/mmu/mm.h b/xen/arch/arm/include/asm/mmu/mm.h
index 6737c3ede783..caba987edc85 100644
--- a/xen/arch/arm/include/asm/mmu/mm.h
+++ b/xen/arch/arm/include/asm/mmu/mm.h
@@ -70,6 +70,20 @@ static inline void *maddr_to_virt(paddr_t ma)
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
 /*
  * Print a walk of a page table or p2m
  *
diff --git a/xen/arch/arm/include/asm/mpu/layout.h b/xen/arch/arm/include/asm/mpu/layout.h
index 248e55f8882d..c331d1feaa84 100644
--- a/xen/arch/arm/include/asm/mpu/layout.h
+++ b/xen/arch/arm/include/asm/mpu/layout.h
@@ -3,6 +3,9 @@
 #ifndef __ARM_MPU_LAYOUT_H__
 #define __ARM_MPU_LAYOUT_H__
 
+#define FRAMETABLE_SIZE   GB(16)
+#define FRAMETABLE_NR     (FRAMETABLE_SIZE / sizeof(*frame_table))
+
 #define XEN_START_ADDRESS CONFIG_XEN_START_ADDRESS
 
 /*
diff --git a/xen/arch/arm/include/asm/mpu/mm.h b/xen/arch/arm/include/asm/mpu/mm.h
index 6cfd0f5cd2c2..86f33d9836b7 100644
--- a/xen/arch/arm/include/asm/mpu/mm.h
+++ b/xen/arch/arm/include/asm/mpu/mm.h
@@ -3,9 +3,13 @@
 #ifndef __ARM_MPU_MM_H__
 #define __ARM_MPU_MM_H__
 
+#include <xen/bug.h>
 #include <xen/macros.h>
 #include <xen/page-size.h>
 #include <xen/types.h>
+#include <asm/mm.h>
+
+extern struct page_info *frame_table;
 
 #define virt_to_maddr(va) ((paddr_t)((vaddr_t)(va) & PADDR_MASK))
 
@@ -15,6 +19,16 @@ static inline void *maddr_to_virt(paddr_t ma)
     return _p(ma);
 }
 
+/* Convert between virtual address to page-info structure. */
+static inline struct page_info *virt_to_page(const void *v)
+{
+    mfn_t mfn = _mfn(virt_to_mfn(v));
+
+    ASSERT(mfn_valid(mfn));
+
+    return mfn_to_page(mfn);
+}
+
 #endif /* __ARM_MPU_MM_H__ */
 
 /*
diff --git a/xen/arch/arm/mpu/mm.c b/xen/arch/arm/mpu/mm.c
index 0b8748e57598..3632011c1013 100644
--- a/xen/arch/arm/mpu/mm.c
+++ b/xen/arch/arm/mpu/mm.c
@@ -1,9 +1,12 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 
-#include <xen/lib.h>
 #include <xen/init.h>
+#include <xen/lib.h>
+#include <xen/mm.h>
 #include <xen/sizes.h>
 
+struct page_info *frame_table;
+
 static void __init __maybe_unused build_assertions(void)
 {
     /*
@@ -13,3 +16,12 @@ static void __init __maybe_unused build_assertions(void)
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


