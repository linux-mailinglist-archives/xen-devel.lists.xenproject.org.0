Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72F837EE34E
	for <lists+xen-devel@lfdr.de>; Thu, 16 Nov 2023 15:51:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634381.989814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3di3-0002uE-A4; Thu, 16 Nov 2023 14:51:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634381.989814; Thu, 16 Nov 2023 14:51:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3di3-0002r1-6E; Thu, 16 Nov 2023 14:51:11 +0000
Received: by outflank-mailman (input) for mailman id 634381;
 Thu, 16 Nov 2023 14:51:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Xmdr=G5=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1r3di1-0001sC-DB
 for xen-devel@lists.xenproject.org; Thu, 16 Nov 2023 14:51:09 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 913a46b7-848f-11ee-9b0e-b553b5be7939;
 Thu, 16 Nov 2023 15:51:04 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5BDAC1595;
 Thu, 16 Nov 2023 06:51:50 -0800 (PST)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.5])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B2CDF3F73F;
 Thu, 16 Nov 2023 06:51:00 -0800 (PST)
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
X-Inumbo-ID: 913a46b7-848f-11ee-9b0e-b553b5be7939
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Henry Wang <Henry.Wang@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Wei Chen <wei.chen@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>,
	Julien Grall <jgrall@amazon.com>
Subject: [PATCH v9 4/8] xen/arm: Extract MMU-specific MM code
Date: Thu, 16 Nov 2023 22:50:28 +0800
Message-Id: <20231116145032.1651305-5-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231116145032.1651305-1-Henry.Wang@arm.com>
References: <20231116145032.1651305-1-Henry.Wang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, most of the code is in arm/mm.{c,h} and arm/arm64/mm.c
is MMU-specific. To make the MM code extendable, this commit extracts
the MMU-specific MM code.

Extract the boot CPU MM bringup code from arm/mm.c to mmu/setup.c.
While moving, mark pte_of_xenaddr() as __init to make clear that
this helper is only intended to be used during early boot.

Move arm/arm64/mm.c to arm/arm64/mmu/mm.c. Since the function
setup_directmap_mappings() has different implementations between
arm32 and arm64, move their arch-specific implementation to
arch-specific arm{32,64}/mmu/mm.c instead using #ifdef again.

For header files, move MMU-related function declarations in
asm/mm.h, declaration of global variable init_ttbr and the
declaration of dump_pt_walk() in asm/page.h to asm/mmu/mm.h

Also modify the build system (Makefiles in this case) to pick above
mentioned code changes.

Take the opportunity to fix the in-code comment coding styles when
possible, and drop the unnecessary #include headers in the original
arm/mm.c.

Signed-off-by: Henry Wang <Henry.Wang@arm.com>
Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
v9:
- No change.
v8:
- Add Julien's Acked-by tag.
v7:
- Move pte_of_xenaddr() to mmu/setup.c and mark it as __init.
- Also move the declaration of init_ttbr to asm/mmu/mm.h.
v6:
- Rework the original patch
  "[v5,07/13] xen/arm: Extract MMU-specific code"
---
 xen/arch/arm/arm32/Makefile       |   1 +
 xen/arch/arm/arm32/mmu/Makefile   |   1 +
 xen/arch/arm/arm32/mmu/mm.c       |  31 +++
 xen/arch/arm/arm64/Makefile       |   1 -
 xen/arch/arm/arm64/mmu/Makefile   |   1 +
 xen/arch/arm/arm64/{ => mmu}/mm.c |  37 +++
 xen/arch/arm/include/asm/mm.h     |  25 +-
 xen/arch/arm/include/asm/mmu/mm.h |  50 ++++
 xen/arch/arm/include/asm/page.h   |  15 --
 xen/arch/arm/mm.c                 | 385 ------------------------------
 xen/arch/arm/mmu/Makefile         |   1 +
 xen/arch/arm/mmu/setup.c          | 349 +++++++++++++++++++++++++++
 12 files changed, 477 insertions(+), 420 deletions(-)
 create mode 100644 xen/arch/arm/arm32/mmu/Makefile
 create mode 100644 xen/arch/arm/arm32/mmu/mm.c
 rename xen/arch/arm/arm64/{ => mmu}/mm.c (75%)
 create mode 100644 xen/arch/arm/include/asm/mmu/mm.h
 create mode 100644 xen/arch/arm/mmu/setup.c

diff --git a/xen/arch/arm/arm32/Makefile b/xen/arch/arm/arm32/Makefile
index 520fb42054..40a2b4803f 100644
--- a/xen/arch/arm/arm32/Makefile
+++ b/xen/arch/arm/arm32/Makefile
@@ -1,4 +1,5 @@
 obj-y += lib/
+obj-$(CONFIG_MMU) += mmu/
 
 obj-$(CONFIG_EARLY_PRINTK) += debug.o
 obj-y += domctl.o
diff --git a/xen/arch/arm/arm32/mmu/Makefile b/xen/arch/arm/arm32/mmu/Makefile
new file mode 100644
index 0000000000..b18cec4836
--- /dev/null
+++ b/xen/arch/arm/arm32/mmu/Makefile
@@ -0,0 +1 @@
+obj-y += mm.o
diff --git a/xen/arch/arm/arm32/mmu/mm.c b/xen/arch/arm/arm32/mmu/mm.c
new file mode 100644
index 0000000000..647baf4a81
--- /dev/null
+++ b/xen/arch/arm/arm32/mmu/mm.c
@@ -0,0 +1,31 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#include <xen/init.h>
+#include <asm/fixmap.h>
+
+/*
+ * Set up the direct-mapped xenheap:
+ * up to 1GB of contiguous, always-mapped memory.
+ */
+void __init setup_directmap_mappings(unsigned long base_mfn,
+                                     unsigned long nr_mfns)
+{
+    int rc;
+
+    rc = map_pages_to_xen(XENHEAP_VIRT_START, _mfn(base_mfn), nr_mfns,
+                          PAGE_HYPERVISOR_RW | _PAGE_BLOCK);
+    if ( rc )
+        panic("Unable to setup the directmap mappings.\n");
+
+    /* Record where the directmap is, for translation routines. */
+    directmap_virt_end = XENHEAP_VIRT_START + nr_mfns * PAGE_SIZE;
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/arm64/Makefile b/xen/arch/arm/arm64/Makefile
index f89d5fb4fb..72161ff22e 100644
--- a/xen/arch/arm/arm64/Makefile
+++ b/xen/arch/arm/arm64/Makefile
@@ -11,7 +11,6 @@ obj-y += entry.o
 obj-y += head.o
 obj-y += insn.o
 obj-$(CONFIG_LIVEPATCH) += livepatch.o
-obj-y += mm.o
 obj-y += smc.o
 obj-y += smpboot.o
 obj-$(CONFIG_ARM64_SVE) += sve.o sve-asm.o
diff --git a/xen/arch/arm/arm64/mmu/Makefile b/xen/arch/arm/arm64/mmu/Makefile
index 3340058c08..a8a750a3d0 100644
--- a/xen/arch/arm/arm64/mmu/Makefile
+++ b/xen/arch/arm/arm64/mmu/Makefile
@@ -1 +1,2 @@
 obj-y += head.o
+obj-y += mm.o
diff --git a/xen/arch/arm/arm64/mm.c b/xen/arch/arm/arm64/mmu/mm.c
similarity index 75%
rename from xen/arch/arm/arm64/mm.c
rename to xen/arch/arm/arm64/mmu/mm.c
index cb69df0661..e68edd6151 100644
--- a/xen/arch/arm/arm64/mm.c
+++ b/xen/arch/arm/arm64/mmu/mm.c
@@ -153,6 +153,43 @@ void __init switch_ttbr(uint64_t ttbr)
     update_identity_mapping(false);
 }
 
+/* Map the region in the directmap area. */
+void __init setup_directmap_mappings(unsigned long base_mfn,
+                                     unsigned long nr_mfns)
+{
+    int rc;
+
+    /* First call sets the directmap physical and virtual offset. */
+    if ( mfn_eq(directmap_mfn_start, INVALID_MFN) )
+    {
+        unsigned long mfn_gb = base_mfn & ~((FIRST_SIZE >> PAGE_SHIFT) - 1);
+
+        directmap_mfn_start = _mfn(base_mfn);
+        directmap_base_pdx = mfn_to_pdx(_mfn(base_mfn));
+        /*
+         * The base address may not be aligned to the first level
+         * size (e.g. 1GB when using 4KB pages). This would prevent
+         * superpage mappings for all the regions because the virtual
+         * address and machine address should both be suitably aligned.
+         *
+         * Prevent that by offsetting the start of the directmap virtual
+         * address.
+         */
+        directmap_virt_start = DIRECTMAP_VIRT_START +
+            (base_mfn - mfn_gb) * PAGE_SIZE;
+    }
+
+    if ( base_mfn < mfn_x(directmap_mfn_start) )
+        panic("cannot add directmap mapping at %lx below heap start %lx\n",
+              base_mfn, mfn_x(directmap_mfn_start));
+
+    rc = map_pages_to_xen((vaddr_t)__mfn_to_virt(base_mfn),
+                          _mfn(base_mfn), nr_mfns,
+                          PAGE_HYPERVISOR_RW | _PAGE_BLOCK);
+    if ( rc )
+        panic("Unable to setup the directmap mappings.\n");
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index 163d22ecd3..d23ebc7df6 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -14,6 +14,12 @@
 # error "unknown ARM variant"
 #endif
 
+#if defined(CONFIG_MMU)
+# include <asm/mmu/mm.h>
+#else
+# error "Unknown memory management layout"
+#endif
+
 /* Align Xen to a 2 MiB boundary. */
 #define XEN_PADDR_ALIGN (1 << 21)
 
@@ -165,16 +171,6 @@ struct page_info
 #define _PGC_need_scrub   _PGC_allocated
 #define PGC_need_scrub    PGC_allocated
 
-/* Non-boot CPUs use this to find the correct pagetables. */
-extern uint64_t init_ttbr;
-
-extern mfn_t directmap_mfn_start, directmap_mfn_end;
-extern vaddr_t directmap_virt_end;
-#ifdef CONFIG_ARM_64
-extern vaddr_t directmap_virt_start;
-extern unsigned long directmap_base_pdx;
-#endif
-
 #ifdef CONFIG_ARM_32
 #define is_xen_heap_page(page) is_xen_heap_mfn(page_to_mfn(page))
 #define is_xen_heap_mfn(mfn) ({                                 \
@@ -197,7 +193,6 @@ extern unsigned long directmap_base_pdx;
 
 #define maddr_get_owner(ma)   (page_get_owner(maddr_to_page((ma))))
 
-#define frame_table ((struct page_info *)FRAMETABLE_VIRT_START)
 /* PDX of the first page in the frame table. */
 extern unsigned long frametable_base_pdx;
 
@@ -207,19 +202,11 @@ extern unsigned long frametable_base_pdx;
 extern void setup_pagetables(unsigned long boot_phys_offset);
 /* Map FDT in boot pagetable */
 extern void *early_fdt_map(paddr_t fdt_paddr);
-/* Switch to a new root page-tables */
-extern void switch_ttbr(uint64_t ttbr);
 /* Remove early mappings */
 extern void remove_early_mappings(void);
 /* Allocate and initialise pagetables for a secondary CPU. Sets init_ttbr to the
  * new page table */
 extern int init_secondary_pagetables(int cpu);
-/*
- * For Arm32, set up the direct-mapped xenheap: up to 1GB of contiguous,
- * always-mapped memory. Base must be 32MB aligned and size a multiple of 32MB.
- * For Arm64, map the region in the directmap area.
- */
-extern void setup_directmap_mappings(unsigned long base_mfn, unsigned long nr_mfns);
 /* Map a frame table to cover physical addresses ps through pe */
 extern void setup_frametable_mappings(paddr_t ps, paddr_t pe);
 /* map a physical range in virtual memory */
diff --git a/xen/arch/arm/include/asm/mmu/mm.h b/xen/arch/arm/include/asm/mmu/mm.h
new file mode 100644
index 0000000000..439ae314fd
--- /dev/null
+++ b/xen/arch/arm/include/asm/mmu/mm.h
@@ -0,0 +1,50 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#ifndef __ARM_MMU_MM_H__
+#define __ARM_MMU_MM_H__
+
+/* Non-boot CPUs use this to find the correct pagetables. */
+extern uint64_t init_ttbr;
+
+extern mfn_t directmap_mfn_start, directmap_mfn_end;
+extern vaddr_t directmap_virt_end;
+#ifdef CONFIG_ARM_64
+extern vaddr_t directmap_virt_start;
+extern unsigned long directmap_base_pdx;
+#endif
+
+#define frame_table ((struct page_info *)FRAMETABLE_VIRT_START)
+
+/*
+ * Print a walk of a page table or p2m
+ *
+ * ttbr is the base address register (TTBR0_EL2 or VTTBR_EL2)
+ * addr is the PA or IPA to translate
+ * root_level is the starting level of the page table
+ *   (e.g. TCR_EL2.SL0 or VTCR_EL2.SL0 )
+ * nr_root_tables is the number of concatenated tables at the root.
+ *   this can only be != 1 for P2M walks starting at the first or
+ *   subsequent level.
+ */
+void dump_pt_walk(paddr_t ttbr, paddr_t addr,
+                  unsigned int root_level,
+                  unsigned int nr_root_tables);
+
+/* Switch to a new root page-tables */
+extern void switch_ttbr(uint64_t ttbr);
+/*
+ * For Arm32, set up the direct-mapped xenheap: up to 1GB of contiguous,
+ * always-mapped memory. Base must be 32MB aligned and size a multiple of 32MB.
+ * For Arm64, map the region in the directmap area.
+ */
+extern void setup_directmap_mappings(unsigned long base_mfn, unsigned long nr_mfns);
+
+#endif /* __ARM_MMU_MM_H__ */
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/arch/arm/include/asm/page.h b/xen/arch/arm/include/asm/page.h
index aa0080e8d7..ebaf5964f1 100644
--- a/xen/arch/arm/include/asm/page.h
+++ b/xen/arch/arm/include/asm/page.h
@@ -264,21 +264,6 @@ static inline void write_pte(lpae_t *p, lpae_t pte)
 /* Flush the dcache for an entire page. */
 void flush_page_to_ram(unsigned long mfn, bool sync_icache);
 
-/*
- * Print a walk of a page table or p2m
- *
- * ttbr is the base address register (TTBR0_EL2 or VTTBR_EL2)
- * addr is the PA or IPA to translate
- * root_level is the starting level of the page table
- *   (e.g. TCR_EL2.SL0 or VTCR_EL2.SL0 )
- * nr_root_tables is the number of concatenated tables at the root.
- *   this can only be != 1 for P2M walks starting at the first or
- *   subsequent level.
- */
-void dump_pt_walk(paddr_t ttbr, paddr_t addr,
-                  unsigned int root_level,
-                  unsigned int nr_root_tables);
-
 /* Print a walk of the hypervisor's page tables for a virtual addr. */
 extern void dump_hyp_walk(vaddr_t addr);
 /* Print a walk of the p2m for a domain for a physical address. */
diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index 923a90925c..eeb65ca6bb 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -11,136 +11,19 @@
 #include <xen/domain_page.h>
 #include <xen/grant_table.h>
 #include <xen/guest_access.h>
-#include <xen/libfdt/libfdt.h>
 #include <xen/mm.h>
-#include <xen/sizes.h>
 
 #include <xsm/xsm.h>
 
-#include <asm/setup.h>
-
 #include <public/memory.h>
 
 /* Override macros from asm/page.h to make them work with mfn_t */
 #undef virt_to_mfn
 #define virt_to_mfn(va) _mfn(__virt_to_mfn(va))
-#undef mfn_to_virt
-#define mfn_to_virt(mfn) __mfn_to_virt(mfn_x(mfn))
-
-/* Main runtime page tables */
-
-/*
- * For arm32 xen_pgtable are per-PCPU and are allocated before
- * bringing up each CPU. For arm64 xen_pgtable is common to all PCPUs.
- *
- * xen_second, xen_fixmap and xen_xenmap are always shared between all
- * PCPUs.
- */
-
-#ifdef CONFIG_ARM_64
-DEFINE_PAGE_TABLE(xen_pgtable);
-static DEFINE_PAGE_TABLE(xen_first);
-#define THIS_CPU_PGTABLE xen_pgtable
-#else
-/* Per-CPU pagetable pages */
-/* xen_pgtable == root of the trie (zeroeth level on 64-bit, first on 32-bit) */
-DEFINE_PER_CPU(lpae_t *, xen_pgtable);
-#define THIS_CPU_PGTABLE this_cpu(xen_pgtable)
-/* Root of the trie for cpu0, other CPU's PTs are dynamically allocated */
-static DEFINE_PAGE_TABLE(cpu0_pgtable);
-#endif
-
-/* Common pagetable leaves */
-/* Second level page table used to cover Xen virtual address space */
-static DEFINE_PAGE_TABLE(xen_second);
-/* Third level page table used for fixmap */
-DEFINE_BOOT_PAGE_TABLE(xen_fixmap);
-/*
- * Third level page table used to map Xen itself with the XN bit set
- * as appropriate.
- */
-static DEFINE_PAGE_TABLES(xen_xenmap, XEN_NR_ENTRIES(2));
-
-static paddr_t phys_offset;
-
-/* Limits of the Xen heap */
-mfn_t directmap_mfn_start __read_mostly = INVALID_MFN_INITIALIZER;
-mfn_t directmap_mfn_end __read_mostly;
-vaddr_t directmap_virt_end __read_mostly;
-#ifdef CONFIG_ARM_64
-vaddr_t directmap_virt_start __read_mostly;
-unsigned long directmap_base_pdx __read_mostly;
-#endif
 
 unsigned long frametable_base_pdx __read_mostly;
 unsigned long frametable_virt_end __read_mostly;
 
-extern char __init_begin[], __init_end[];
-
-/* Checking VA memory layout alignment. */
-static void __init __maybe_unused build_assertions(void)
-{
-    /* 2MB aligned regions */
-    BUILD_BUG_ON(XEN_VIRT_START & ~SECOND_MASK);
-    BUILD_BUG_ON(FIXMAP_ADDR(0) & ~SECOND_MASK);
-    /* 1GB aligned regions */
-#ifdef CONFIG_ARM_32
-    BUILD_BUG_ON(XENHEAP_VIRT_START & ~FIRST_MASK);
-#else
-    BUILD_BUG_ON(DIRECTMAP_VIRT_START & ~FIRST_MASK);
-#endif
-    /* Page table structure constraints */
-#ifdef CONFIG_ARM_64
-    /*
-     * The first few slots of the L0 table is reserved for the identity
-     * mapping. Check that none of the other regions are overlapping
-     * with it.
-     */
-#define CHECK_OVERLAP_WITH_IDMAP(virt) \
-    BUILD_BUG_ON(zeroeth_table_offset(virt) < IDENTITY_MAPPING_AREA_NR_L0)
-
-    CHECK_OVERLAP_WITH_IDMAP(XEN_VIRT_START);
-    CHECK_OVERLAP_WITH_IDMAP(VMAP_VIRT_START);
-    CHECK_OVERLAP_WITH_IDMAP(FRAMETABLE_VIRT_START);
-    CHECK_OVERLAP_WITH_IDMAP(DIRECTMAP_VIRT_START);
-#undef CHECK_OVERLAP_WITH_IDMAP
-#endif
-    BUILD_BUG_ON(first_table_offset(XEN_VIRT_START));
-#ifdef CONFIG_ARCH_MAP_DOMAIN_PAGE
-    BUILD_BUG_ON(DOMHEAP_VIRT_START & ~FIRST_MASK);
-#endif
-    /*
-     * The boot code expects the regions XEN_VIRT_START, FIXMAP_ADDR(0),
-     * BOOT_FDT_VIRT_START to use the same 0th (arm64 only) and 1st
-     * slot in the page tables.
-     */
-#define CHECK_SAME_SLOT(level, virt1, virt2) \
-    BUILD_BUG_ON(level##_table_offset(virt1) != level##_table_offset(virt2))
-
-#define CHECK_DIFFERENT_SLOT(level, virt1, virt2) \
-    BUILD_BUG_ON(level##_table_offset(virt1) == level##_table_offset(virt2))
-
-#ifdef CONFIG_ARM_64
-    CHECK_SAME_SLOT(zeroeth, XEN_VIRT_START, FIXMAP_ADDR(0));
-    CHECK_SAME_SLOT(zeroeth, XEN_VIRT_START, BOOT_FDT_VIRT_START);
-#endif
-    CHECK_SAME_SLOT(first, XEN_VIRT_START, FIXMAP_ADDR(0));
-    CHECK_SAME_SLOT(first, XEN_VIRT_START, BOOT_FDT_VIRT_START);
-
-    /*
-     * For arm32, the temporary mapping will re-use the domheap
-     * first slot and the second slots will match.
-     */
-#ifdef CONFIG_ARM_32
-    CHECK_SAME_SLOT(first, TEMPORARY_XEN_VIRT_START, DOMHEAP_VIRT_START);
-    CHECK_DIFFERENT_SLOT(first, XEN_VIRT_START, TEMPORARY_XEN_VIRT_START);
-    CHECK_SAME_SLOT(second, XEN_VIRT_START, TEMPORARY_XEN_VIRT_START);
-#endif
-
-#undef CHECK_SAME_SLOT
-#undef CHECK_DIFFERENT_SLOT
-}
-
 void flush_page_to_ram(unsigned long mfn, bool sync_icache)
 {
     void *v = map_domain_page(_mfn(mfn));
@@ -160,229 +43,6 @@ void flush_page_to_ram(unsigned long mfn, bool sync_icache)
         invalidate_icache();
 }
 
-lpae_t pte_of_xenaddr(vaddr_t va)
-{
-    paddr_t ma = va + phys_offset;
-
-    return mfn_to_xen_entry(maddr_to_mfn(ma), MT_NORMAL);
-}
-
-void * __init early_fdt_map(paddr_t fdt_paddr)
-{
-    /* We are using 2MB superpage for mapping the FDT */
-    paddr_t base_paddr = fdt_paddr & SECOND_MASK;
-    paddr_t offset;
-    void *fdt_virt;
-    uint32_t size;
-    int rc;
-
-    /*
-     * Check whether the physical FDT address is set and meets the minimum
-     * alignment requirement. Since we are relying on MIN_FDT_ALIGN to be at
-     * least 8 bytes so that we always access the magic and size fields
-     * of the FDT header after mapping the first chunk, double check if
-     * that is indeed the case.
-     */
-    BUILD_BUG_ON(MIN_FDT_ALIGN < 8);
-    if ( !fdt_paddr || fdt_paddr % MIN_FDT_ALIGN )
-        return NULL;
-
-    /* The FDT is mapped using 2MB superpage */
-    BUILD_BUG_ON(BOOT_FDT_VIRT_START % SZ_2M);
-
-    rc = map_pages_to_xen(BOOT_FDT_VIRT_START, maddr_to_mfn(base_paddr),
-                          SZ_2M >> PAGE_SHIFT,
-                          PAGE_HYPERVISOR_RO | _PAGE_BLOCK);
-    if ( rc )
-        panic("Unable to map the device-tree.\n");
-
-
-    offset = fdt_paddr % SECOND_SIZE;
-    fdt_virt = (void *)BOOT_FDT_VIRT_START + offset;
-
-    if ( fdt_magic(fdt_virt) != FDT_MAGIC )
-        return NULL;
-
-    size = fdt_totalsize(fdt_virt);
-    if ( size > MAX_FDT_SIZE )
-        return NULL;
-
-    if ( (offset + size) > SZ_2M )
-    {
-        rc = map_pages_to_xen(BOOT_FDT_VIRT_START + SZ_2M,
-                              maddr_to_mfn(base_paddr + SZ_2M),
-                              SZ_2M >> PAGE_SHIFT,
-                              PAGE_HYPERVISOR_RO | _PAGE_BLOCK);
-        if ( rc )
-            panic("Unable to map the device-tree\n");
-    }
-
-    return fdt_virt;
-}
-
-void __init remove_early_mappings(void)
-{
-    int rc;
-
-    /* destroy the _PAGE_BLOCK mapping */
-    rc = modify_xen_mappings(BOOT_FDT_VIRT_START,
-                             BOOT_FDT_VIRT_START + BOOT_FDT_VIRT_SIZE,
-                             _PAGE_BLOCK);
-    BUG_ON(rc);
-}
-
-/*
- * After boot, Xen page-tables should not contain mapping that are both
- * Writable and eXecutables.
- *
- * This should be called on each CPU to enforce the policy.
- */
-static void xen_pt_enforce_wnx(void)
-{
-    WRITE_SYSREG(READ_SYSREG(SCTLR_EL2) | SCTLR_Axx_ELx_WXN, SCTLR_EL2);
-    /*
-     * The TLBs may cache SCTLR_EL2.WXN. So ensure it is synchronized
-     * before flushing the TLBs.
-     */
-    isb();
-    flush_xen_tlb_local();
-}
-
-/* Boot-time pagetable setup.
- * Changes here may need matching changes in head.S */
-void __init setup_pagetables(unsigned long boot_phys_offset)
-{
-    uint64_t ttbr;
-    lpae_t pte, *p;
-    int i;
-
-    phys_offset = boot_phys_offset;
-
-    arch_setup_page_tables();
-
-#ifdef CONFIG_ARM_64
-    pte = pte_of_xenaddr((uintptr_t)xen_first);
-    pte.pt.table = 1;
-    pte.pt.xn = 0;
-    xen_pgtable[zeroeth_table_offset(XEN_VIRT_START)] = pte;
-
-    p = (void *) xen_first;
-#else
-    p = (void *) cpu0_pgtable;
-#endif
-
-    /* Map xen second level page-table */
-    p[0] = pte_of_xenaddr((uintptr_t)(xen_second));
-    p[0].pt.table = 1;
-    p[0].pt.xn = 0;
-
-    /* Break up the Xen mapping into pages and protect them separately. */
-    for ( i = 0; i < XEN_NR_ENTRIES(3); i++ )
-    {
-        vaddr_t va = XEN_VIRT_START + (i << PAGE_SHIFT);
-
-        if ( !is_kernel(va) )
-            break;
-        pte = pte_of_xenaddr(va);
-        pte.pt.table = 1; /* third level mappings always have this bit set */
-        if ( is_kernel_text(va) || is_kernel_inittext(va) )
-        {
-            pte.pt.xn = 0;
-            pte.pt.ro = 1;
-        }
-        if ( is_kernel_rodata(va) )
-            pte.pt.ro = 1;
-        xen_xenmap[i] = pte;
-    }
-
-    /* Initialise xen second level entries ... */
-    /* ... Xen's text etc */
-    for ( i = 0; i < XEN_NR_ENTRIES(2); i++ )
-    {
-        vaddr_t va = XEN_VIRT_START + (i << XEN_PT_LEVEL_SHIFT(2));
-
-        pte = pte_of_xenaddr((vaddr_t)(xen_xenmap + i * XEN_PT_LPAE_ENTRIES));
-        pte.pt.table = 1;
-        xen_second[second_table_offset(va)] = pte;
-    }
-
-    /* ... Fixmap */
-    pte = pte_of_xenaddr((vaddr_t)xen_fixmap);
-    pte.pt.table = 1;
-    xen_second[second_table_offset(FIXMAP_ADDR(0))] = pte;
-
-#ifdef CONFIG_ARM_64
-    ttbr = (uintptr_t) xen_pgtable + phys_offset;
-#else
-    ttbr = (uintptr_t) cpu0_pgtable + phys_offset;
-#endif
-
-    switch_ttbr(ttbr);
-
-    xen_pt_enforce_wnx();
-
-#ifdef CONFIG_ARM_32
-    per_cpu(xen_pgtable, 0) = cpu0_pgtable;
-#endif
-}
-
-#ifdef CONFIG_ARM_32
-/*
- * Set up the direct-mapped xenheap:
- * up to 1GB of contiguous, always-mapped memory.
- */
-void __init setup_directmap_mappings(unsigned long base_mfn,
-                                     unsigned long nr_mfns)
-{
-    int rc;
-
-    rc = map_pages_to_xen(XENHEAP_VIRT_START, _mfn(base_mfn), nr_mfns,
-                          PAGE_HYPERVISOR_RW | _PAGE_BLOCK);
-    if ( rc )
-        panic("Unable to setup the directmap mappings.\n");
-
-    /* Record where the directmap is, for translation routines. */
-    directmap_virt_end = XENHEAP_VIRT_START + nr_mfns * PAGE_SIZE;
-}
-#else /* CONFIG_ARM_64 */
-/* Map the region in the directmap area. */
-void __init setup_directmap_mappings(unsigned long base_mfn,
-                                     unsigned long nr_mfns)
-{
-    int rc;
-
-    /* First call sets the directmap physical and virtual offset. */
-    if ( mfn_eq(directmap_mfn_start, INVALID_MFN) )
-    {
-        unsigned long mfn_gb = base_mfn & ~((FIRST_SIZE >> PAGE_SHIFT) - 1);
-
-        directmap_mfn_start = _mfn(base_mfn);
-        directmap_base_pdx = mfn_to_pdx(_mfn(base_mfn));
-        /*
-         * The base address may not be aligned to the first level
-         * size (e.g. 1GB when using 4KB pages). This would prevent
-         * superpage mappings for all the regions because the virtual
-         * address and machine address should both be suitably aligned.
-         *
-         * Prevent that by offsetting the start of the directmap virtual
-         * address.
-         */
-        directmap_virt_start = DIRECTMAP_VIRT_START +
-            (base_mfn - mfn_gb) * PAGE_SIZE;
-    }
-
-    if ( base_mfn < mfn_x(directmap_mfn_start) )
-        panic("cannot add directmap mapping at %lx below heap start %lx\n",
-              base_mfn, mfn_x(directmap_mfn_start));
-
-    rc = map_pages_to_xen((vaddr_t)__mfn_to_virt(base_mfn),
-                          _mfn(base_mfn), nr_mfns,
-                          PAGE_HYPERVISOR_RW | _PAGE_BLOCK);
-    if ( rc )
-        panic("Unable to setup the directmap mappings.\n");
-}
-#endif
-
 /* Map a frame table to cover physical addresses ps through pe */
 void __init setup_frametable_mappings(paddr_t ps, paddr_t pe)
 {
@@ -422,51 +82,6 @@ void __init setup_frametable_mappings(paddr_t ps, paddr_t pe)
     frametable_virt_end = FRAMETABLE_VIRT_START + (nr_pdxs * sizeof(struct page_info));
 }
 
-void *__init arch_vmap_virt_end(void)
-{
-    return (void *)(VMAP_VIRT_START + VMAP_VIRT_SIZE);
-}
-
-/* Release all __init and __initdata ranges to be reused */
-void free_init_memory(void)
-{
-    paddr_t pa = virt_to_maddr(__init_begin);
-    unsigned long len = __init_end - __init_begin;
-    uint32_t insn;
-    unsigned int i, nr = len / sizeof(insn);
-    uint32_t *p;
-    int rc;
-
-    rc = modify_xen_mappings((unsigned long)__init_begin,
-                             (unsigned long)__init_end, PAGE_HYPERVISOR_RW);
-    if ( rc )
-        panic("Unable to map RW the init section (rc = %d)\n", rc);
-
-    /*
-     * From now on, init will not be used for execution anymore,
-     * so nuke the instruction cache to remove entries related to init.
-     */
-    invalidate_icache_local();
-
-#ifdef CONFIG_ARM_32
-    /* udf instruction i.e (see A8.8.247 in ARM DDI 0406C.c) */
-    insn = 0xe7f000f0;
-#else
-    insn = AARCH64_BREAK_FAULT;
-#endif
-    p = (uint32_t *)__init_begin;
-    for ( i = 0; i < nr; i++ )
-        *(p + i) = insn;
-
-    rc = destroy_xen_mappings((unsigned long)__init_begin,
-                              (unsigned long)__init_end);
-    if ( rc )
-        panic("Unable to remove the init section (rc = %d)\n", rc);
-
-    init_domheap_pages(pa, pa + len);
-    printk("Freed %ldkB init memory.\n", (long)(__init_end-__init_begin)>>10);
-}
-
 int steal_page(
     struct domain *d, struct page_info *page, unsigned int memflags)
 {
diff --git a/xen/arch/arm/mmu/Makefile b/xen/arch/arm/mmu/Makefile
index 0e82015ee1..98aea965df 100644
--- a/xen/arch/arm/mmu/Makefile
+++ b/xen/arch/arm/mmu/Makefile
@@ -1,2 +1,3 @@
 obj-y += pt.o
+obj-y += setup.o
 obj-y += smpboot.o
diff --git a/xen/arch/arm/mmu/setup.c b/xen/arch/arm/mmu/setup.c
new file mode 100644
index 0000000000..c2df976ab2
--- /dev/null
+++ b/xen/arch/arm/mmu/setup.c
@@ -0,0 +1,349 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * xen/arch/arm/mmu/setup.c
+ *
+ * MMU system boot CPU MM bringup code.
+ */
+
+#include <xen/init.h>
+#include <xen/libfdt/libfdt.h>
+#include <xen/sizes.h>
+
+#include <asm/fixmap.h>
+
+/* Override macros from asm/page.h to make them work with mfn_t */
+#undef mfn_to_virt
+#define mfn_to_virt(mfn) __mfn_to_virt(mfn_x(mfn))
+
+/* Main runtime page tables */
+
+/*
+ * For arm32 xen_pgtable are per-PCPU and are allocated before
+ * bringing up each CPU. For arm64 xen_pgtable is common to all PCPUs.
+ *
+ * xen_second, xen_fixmap and xen_xenmap are always shared between all
+ * PCPUs.
+ */
+
+#ifdef CONFIG_ARM_64
+DEFINE_PAGE_TABLE(xen_pgtable);
+static DEFINE_PAGE_TABLE(xen_first);
+#define THIS_CPU_PGTABLE xen_pgtable
+#else
+/* Per-CPU pagetable pages */
+/* xen_pgtable == root of the trie (zeroeth level on 64-bit, first on 32-bit) */
+DEFINE_PER_CPU(lpae_t *, xen_pgtable);
+#define THIS_CPU_PGTABLE this_cpu(xen_pgtable)
+/* Root of the trie for cpu0, other CPU's PTs are dynamically allocated */
+static DEFINE_PAGE_TABLE(cpu0_pgtable);
+#endif
+
+/* Common pagetable leaves */
+/* Second level page table used to cover Xen virtual address space */
+static DEFINE_PAGE_TABLE(xen_second);
+/* Third level page table used for fixmap */
+DEFINE_BOOT_PAGE_TABLE(xen_fixmap);
+/*
+ * Third level page table used to map Xen itself with the XN bit set
+ * as appropriate.
+ */
+static DEFINE_PAGE_TABLES(xen_xenmap, XEN_NR_ENTRIES(2));
+
+static paddr_t phys_offset;
+
+/* Limits of the Xen heap */
+mfn_t directmap_mfn_start __read_mostly = INVALID_MFN_INITIALIZER;
+mfn_t directmap_mfn_end __read_mostly;
+vaddr_t directmap_virt_end __read_mostly;
+#ifdef CONFIG_ARM_64
+vaddr_t directmap_virt_start __read_mostly;
+unsigned long directmap_base_pdx __read_mostly;
+#endif
+
+extern char __init_begin[], __init_end[];
+
+/* Checking VA memory layout alignment. */
+static void __init __maybe_unused build_assertions(void)
+{
+    /* 2MB aligned regions */
+    BUILD_BUG_ON(XEN_VIRT_START & ~SECOND_MASK);
+    BUILD_BUG_ON(FIXMAP_ADDR(0) & ~SECOND_MASK);
+    /* 1GB aligned regions */
+#ifdef CONFIG_ARM_32
+    BUILD_BUG_ON(XENHEAP_VIRT_START & ~FIRST_MASK);
+#else
+    BUILD_BUG_ON(DIRECTMAP_VIRT_START & ~FIRST_MASK);
+#endif
+    /* Page table structure constraints */
+#ifdef CONFIG_ARM_64
+    /*
+     * The first few slots of the L0 table is reserved for the identity
+     * mapping. Check that none of the other regions are overlapping
+     * with it.
+     */
+#define CHECK_OVERLAP_WITH_IDMAP(virt) \
+    BUILD_BUG_ON(zeroeth_table_offset(virt) < IDENTITY_MAPPING_AREA_NR_L0)
+
+    CHECK_OVERLAP_WITH_IDMAP(XEN_VIRT_START);
+    CHECK_OVERLAP_WITH_IDMAP(VMAP_VIRT_START);
+    CHECK_OVERLAP_WITH_IDMAP(FRAMETABLE_VIRT_START);
+    CHECK_OVERLAP_WITH_IDMAP(DIRECTMAP_VIRT_START);
+#undef CHECK_OVERLAP_WITH_IDMAP
+#endif
+    BUILD_BUG_ON(first_table_offset(XEN_VIRT_START));
+#ifdef CONFIG_ARCH_MAP_DOMAIN_PAGE
+    BUILD_BUG_ON(DOMHEAP_VIRT_START & ~FIRST_MASK);
+#endif
+    /*
+     * The boot code expects the regions XEN_VIRT_START, FIXMAP_ADDR(0),
+     * BOOT_FDT_VIRT_START to use the same 0th (arm64 only) and 1st
+     * slot in the page tables.
+     */
+#define CHECK_SAME_SLOT(level, virt1, virt2) \
+    BUILD_BUG_ON(level##_table_offset(virt1) != level##_table_offset(virt2))
+
+#define CHECK_DIFFERENT_SLOT(level, virt1, virt2) \
+    BUILD_BUG_ON(level##_table_offset(virt1) == level##_table_offset(virt2))
+
+#ifdef CONFIG_ARM_64
+    CHECK_SAME_SLOT(zeroeth, XEN_VIRT_START, FIXMAP_ADDR(0));
+    CHECK_SAME_SLOT(zeroeth, XEN_VIRT_START, BOOT_FDT_VIRT_START);
+#endif
+    CHECK_SAME_SLOT(first, XEN_VIRT_START, FIXMAP_ADDR(0));
+    CHECK_SAME_SLOT(first, XEN_VIRT_START, BOOT_FDT_VIRT_START);
+
+    /*
+     * For arm32, the temporary mapping will re-use the domheap
+     * first slot and the second slots will match.
+     */
+#ifdef CONFIG_ARM_32
+    CHECK_SAME_SLOT(first, TEMPORARY_XEN_VIRT_START, DOMHEAP_VIRT_START);
+    CHECK_DIFFERENT_SLOT(first, XEN_VIRT_START, TEMPORARY_XEN_VIRT_START);
+    CHECK_SAME_SLOT(second, XEN_VIRT_START, TEMPORARY_XEN_VIRT_START);
+#endif
+
+#undef CHECK_SAME_SLOT
+#undef CHECK_DIFFERENT_SLOT
+}
+
+lpae_t __init pte_of_xenaddr(vaddr_t va)
+{
+    paddr_t ma = va + phys_offset;
+
+    return mfn_to_xen_entry(maddr_to_mfn(ma), MT_NORMAL);
+}
+
+void * __init early_fdt_map(paddr_t fdt_paddr)
+{
+    /* We are using 2MB superpage for mapping the FDT */
+    paddr_t base_paddr = fdt_paddr & SECOND_MASK;
+    paddr_t offset;
+    void *fdt_virt;
+    uint32_t size;
+    int rc;
+
+    /*
+     * Check whether the physical FDT address is set and meets the minimum
+     * alignment requirement. Since we are relying on MIN_FDT_ALIGN to be at
+     * least 8 bytes so that we always access the magic and size fields
+     * of the FDT header after mapping the first chunk, double check if
+     * that is indeed the case.
+     */
+    BUILD_BUG_ON(MIN_FDT_ALIGN < 8);
+    if ( !fdt_paddr || fdt_paddr % MIN_FDT_ALIGN )
+        return NULL;
+
+    /* The FDT is mapped using 2MB superpage */
+    BUILD_BUG_ON(BOOT_FDT_VIRT_START % SZ_2M);
+
+    rc = map_pages_to_xen(BOOT_FDT_VIRT_START, maddr_to_mfn(base_paddr),
+                          SZ_2M >> PAGE_SHIFT,
+                          PAGE_HYPERVISOR_RO | _PAGE_BLOCK);
+    if ( rc )
+        panic("Unable to map the device-tree.\n");
+
+
+    offset = fdt_paddr % SECOND_SIZE;
+    fdt_virt = (void *)BOOT_FDT_VIRT_START + offset;
+
+    if ( fdt_magic(fdt_virt) != FDT_MAGIC )
+        return NULL;
+
+    size = fdt_totalsize(fdt_virt);
+    if ( size > MAX_FDT_SIZE )
+        return NULL;
+
+    if ( (offset + size) > SZ_2M )
+    {
+        rc = map_pages_to_xen(BOOT_FDT_VIRT_START + SZ_2M,
+                              maddr_to_mfn(base_paddr + SZ_2M),
+                              SZ_2M >> PAGE_SHIFT,
+                              PAGE_HYPERVISOR_RO | _PAGE_BLOCK);
+        if ( rc )
+            panic("Unable to map the device-tree\n");
+    }
+
+    return fdt_virt;
+}
+
+void __init remove_early_mappings(void)
+{
+    int rc;
+
+    /* destroy the _PAGE_BLOCK mapping */
+    rc = modify_xen_mappings(BOOT_FDT_VIRT_START,
+                             BOOT_FDT_VIRT_START + BOOT_FDT_VIRT_SIZE,
+                             _PAGE_BLOCK);
+    BUG_ON(rc);
+}
+
+/*
+ * After boot, Xen page-tables should not contain mapping that are both
+ * Writable and eXecutables.
+ *
+ * This should be called on each CPU to enforce the policy.
+ */
+static void xen_pt_enforce_wnx(void)
+{
+    WRITE_SYSREG(READ_SYSREG(SCTLR_EL2) | SCTLR_Axx_ELx_WXN, SCTLR_EL2);
+    /*
+     * The TLBs may cache SCTLR_EL2.WXN. So ensure it is synchronized
+     * before flushing the TLBs.
+     */
+    isb();
+    flush_xen_tlb_local();
+}
+
+/*
+ * Boot-time pagetable setup.
+ * Changes here may need matching changes in head.S
+ */
+void __init setup_pagetables(unsigned long boot_phys_offset)
+{
+    uint64_t ttbr;
+    lpae_t pte, *p;
+    int i;
+
+    phys_offset = boot_phys_offset;
+
+    arch_setup_page_tables();
+
+#ifdef CONFIG_ARM_64
+    pte = pte_of_xenaddr((uintptr_t)xen_first);
+    pte.pt.table = 1;
+    pte.pt.xn = 0;
+    xen_pgtable[zeroeth_table_offset(XEN_VIRT_START)] = pte;
+
+    p = (void *) xen_first;
+#else
+    p = (void *) cpu0_pgtable;
+#endif
+
+    /* Map xen second level page-table */
+    p[0] = pte_of_xenaddr((uintptr_t)(xen_second));
+    p[0].pt.table = 1;
+    p[0].pt.xn = 0;
+
+    /* Break up the Xen mapping into pages and protect them separately. */
+    for ( i = 0; i < XEN_NR_ENTRIES(3); i++ )
+    {
+        vaddr_t va = XEN_VIRT_START + (i << PAGE_SHIFT);
+
+        if ( !is_kernel(va) )
+            break;
+        pte = pte_of_xenaddr(va);
+        pte.pt.table = 1; /* third level mappings always have this bit set */
+        if ( is_kernel_text(va) || is_kernel_inittext(va) )
+        {
+            pte.pt.xn = 0;
+            pte.pt.ro = 1;
+        }
+        if ( is_kernel_rodata(va) )
+            pte.pt.ro = 1;
+        xen_xenmap[i] = pte;
+    }
+
+    /* Initialise xen second level entries ... */
+    /* ... Xen's text etc */
+    for ( i = 0; i < XEN_NR_ENTRIES(2); i++ )
+    {
+        vaddr_t va = XEN_VIRT_START + (i << XEN_PT_LEVEL_SHIFT(2));
+
+        pte = pte_of_xenaddr((vaddr_t)(xen_xenmap + i * XEN_PT_LPAE_ENTRIES));
+        pte.pt.table = 1;
+        xen_second[second_table_offset(va)] = pte;
+    }
+
+    /* ... Fixmap */
+    pte = pte_of_xenaddr((vaddr_t)xen_fixmap);
+    pte.pt.table = 1;
+    xen_second[second_table_offset(FIXMAP_ADDR(0))] = pte;
+
+#ifdef CONFIG_ARM_64
+    ttbr = (uintptr_t) xen_pgtable + phys_offset;
+#else
+    ttbr = (uintptr_t) cpu0_pgtable + phys_offset;
+#endif
+
+    switch_ttbr(ttbr);
+
+    xen_pt_enforce_wnx();
+
+#ifdef CONFIG_ARM_32
+    per_cpu(xen_pgtable, 0) = cpu0_pgtable;
+#endif
+}
+
+void *__init arch_vmap_virt_end(void)
+{
+    return (void *)(VMAP_VIRT_START + VMAP_VIRT_SIZE);
+}
+
+/* Release all __init and __initdata ranges to be reused */
+void free_init_memory(void)
+{
+    paddr_t pa = virt_to_maddr(__init_begin);
+    unsigned long len = __init_end - __init_begin;
+    uint32_t insn;
+    unsigned int i, nr = len / sizeof(insn);
+    uint32_t *p;
+    int rc;
+
+    rc = modify_xen_mappings((unsigned long)__init_begin,
+                             (unsigned long)__init_end, PAGE_HYPERVISOR_RW);
+    if ( rc )
+        panic("Unable to map RW the init section (rc = %d)\n", rc);
+
+    /*
+     * From now on, init will not be used for execution anymore,
+     * so nuke the instruction cache to remove entries related to init.
+     */
+    invalidate_icache_local();
+
+#ifdef CONFIG_ARM_32
+    /* udf instruction i.e (see A8.8.247 in ARM DDI 0406C.c) */
+    insn = 0xe7f000f0;
+#else
+    insn = AARCH64_BREAK_FAULT;
+#endif
+    p = (uint32_t *)__init_begin;
+    for ( i = 0; i < nr; i++ )
+        *(p + i) = insn;
+
+    rc = destroy_xen_mappings((unsigned long)__init_begin,
+                              (unsigned long)__init_end);
+    if ( rc )
+        panic("Unable to remove the init section (rc = %d)\n", rc);
+
+    init_domheap_pages(pa, pa + len);
+    printk("Freed %ldkB init memory.\n", (long)(__init_end-__init_begin)>>10);
+}
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
2.25.1


