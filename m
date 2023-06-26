Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1420D73D679
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 05:40:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555044.866684 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd5B-0002Wy-9X; Mon, 26 Jun 2023 03:40:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555044.866684; Mon, 26 Jun 2023 03:40:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDd5A-000263-Cp; Mon, 26 Jun 2023 03:40:04 +0000
Received: by outflank-mailman (input) for mailman id 555044;
 Mon, 26 Jun 2023 03:39:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=24BZ=CO=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qDd13-0007ej-Iq
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 03:35:49 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 89a01ff9-13d2-11ee-b237-6b7b168915f2;
 Mon, 26 Jun 2023 05:35:47 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8B1991FB;
 Sun, 25 Jun 2023 20:36:30 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id D7E4D3F64C;
 Sun, 25 Jun 2023 20:35:43 -0700 (PDT)
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
X-Inumbo-ID: 89a01ff9-13d2-11ee-b237-6b7b168915f2
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Wei Chen <wei.chen@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH v3 13/52] xen/mmu: extract mmu-specific codes from mm.c/mm.h
Date: Mon, 26 Jun 2023 11:34:04 +0800
Message-Id: <20230626033443.2943270-14-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230626033443.2943270-1-Penny.Zheng@arm.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Wei Chen <wei.chen@arm.com>

To make the code readable and maintainable, we move MMU-specific
memory management code from mm.c to mmu/mm.c, arm64/mm.c to arm64/mmu/mm.c,
and MMU-specific definitions from mm.h/page.h/setup.h to mmu/mm.h.
In order to globally export a few variables/functions for both MMU and later
MPU system, We rename them to more generic names, like, init_ttbr -> init_mm,
mmu_init_secondary_cpu() -> mm_init_secondary_cpu(), update_identity_mapping()
-> update_identity_mm().

As later we will create mpu/mm.h and mpu/mm.c for MPU-specific memory
management code, this will avoid lots of #ifdef in memory management code
and header files.

Signed-off-by: Wei Chen <wei.chen@arm.com>
Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
v2:
- new patch
---
v3:
- introduce new directories: mmu/ which includes MMU-specific codes
- rename init_ttbr to init_mm, mmu_init_secondary_cpu() to
mm_init_secondary_cpu(), update_identity_mapping() -> update_identity_mm().
- move mmu-specific function definitions from page.h/setup.h to mmu/mm.h.
---
 xen/arch/arm/Makefile               |    3 +
 xen/arch/arm/arm32/head.S           |    2 +-
 xen/arch/arm/arm64/Makefile         |    2 +-
 xen/arch/arm/arm64/mmu/head.S       |    2 +-
 xen/arch/arm/arm64/{ => mmu}/mm.c   |    7 +-
 xen/arch/arm/arm64/smpboot.c        |    6 +-
 xen/arch/arm/include/asm/arm64/mm.h |    7 +-
 xen/arch/arm/include/asm/mm.h       |   33 +-
 xen/arch/arm/include/asm/mmu/mm.h   |   54 ++
 xen/arch/arm/include/asm/page.h     |   15 -
 xen/arch/arm/include/asm/setup.h    |    3 -
 xen/arch/arm/mm.c                   | 1102 +-------------------------
 xen/arch/arm/mmu/mm.c               | 1125 +++++++++++++++++++++++++++
 xen/arch/arm/smpboot.c              |    4 +-
 14 files changed, 1216 insertions(+), 1149 deletions(-)
 rename xen/arch/arm/arm64/{ => mmu}/mm.c (97%)
 create mode 100644 xen/arch/arm/include/asm/mmu/mm.h
 create mode 100644 xen/arch/arm/mmu/mm.c

diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 7bf07e9920..f825d95e29 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -36,6 +36,9 @@ obj-y += irq.o
 obj-y += kernel.init.o
 obj-$(CONFIG_LIVEPATCH) += livepatch.o
 obj-y += mem_access.o
+ifeq ($(CONFIG_HAS_MMU), y)
+obj-y += mmu/mm.o
+endif
 obj-y += mm.o
 obj-y += monitor.o
 obj-y += p2m.o
diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
index f9f7be9588..51e7e41a55 100644
--- a/xen/arch/arm/arm32/head.S
+++ b/xen/arch/arm/arm32/head.S
@@ -243,7 +243,7 @@ secondary_switched:
          *
          * XXX: This is not compliant with the Arm Arm.
          */
-        mov_w r4, init_ttbr          /* VA of HTTBR value stashed by CPU 0 */
+        mov_w r4, init_mm            /* VA of HTTBR value stashed by CPU 0 */
         ldrd  r4, r5, [r4]           /* Actual value */
         dsb
         mcrr  CP64(r4, r5, HTTBR)
diff --git a/xen/arch/arm/arm64/Makefile b/xen/arch/arm/arm64/Makefile
index 0c4b177be9..55895ecb53 100644
--- a/xen/arch/arm/arm64/Makefile
+++ b/xen/arch/arm/arm64/Makefile
@@ -10,10 +10,10 @@ obj-y += entry.o
 obj-y += head.o
 ifeq ($(CONFIG_HAS_MMU),y)
 obj-y += mmu/head.o
+obj-y += mmu/mm.o
 endif
 obj-y += insn.o
 obj-$(CONFIG_LIVEPATCH) += livepatch.o
-obj-y += mm.o
 obj-y += smc.o
 obj-y += smpboot.o
 obj-$(CONFIG_ARM64_SVE) += sve.o sve-asm.o
diff --git a/xen/arch/arm/arm64/mmu/head.S b/xen/arch/arm/arm64/mmu/head.S
index 295596aca1..3f3f4be829 100644
--- a/xen/arch/arm/arm64/mmu/head.S
+++ b/xen/arch/arm/arm64/mmu/head.S
@@ -257,7 +257,7 @@ ENTRY(enable_runtime_mm)
         /* save return address */
         mov   x5, lr
 
-        load_paddr x0, init_ttbr
+        load_paddr x0, init_mm
         ldr   x0, [x0]
         bl    enable_mmu
         mov   lr, x5
diff --git a/xen/arch/arm/arm64/mm.c b/xen/arch/arm/arm64/mmu/mm.c
similarity index 97%
rename from xen/arch/arm/arm64/mm.c
rename to xen/arch/arm/arm64/mmu/mm.c
index 78b7c7eb00..888ca5d8fc 100644
--- a/xen/arch/arm/arm64/mm.c
+++ b/xen/arch/arm/arm64/mmu/mm.c
@@ -106,7 +106,7 @@ void __init arch_setup_page_tables(void)
     prepare_runtime_identity_mapping();
 }
 
-void update_identity_mapping(bool enable)
+static void update_identity_mapping(bool enable)
 {
     paddr_t id_addr = virt_to_maddr(_start);
     int rc;
@@ -120,6 +120,11 @@ void update_identity_mapping(bool enable)
     BUG_ON(rc);
 }
 
+void update_mm_mapping(bool enable)
+{
+    update_identity_mapping(enable);
+}
+
 extern void switch_ttbr_id(uint64_t ttbr);
 
 typedef void (switch_ttbr_fn)(uint64_t ttbr);
diff --git a/xen/arch/arm/arm64/smpboot.c b/xen/arch/arm/arm64/smpboot.c
index 9637f42469..2b1d086a1e 100644
--- a/xen/arch/arm/arm64/smpboot.c
+++ b/xen/arch/arm/arm64/smpboot.c
@@ -111,18 +111,18 @@ int arch_cpu_up(int cpu)
     if ( !smp_enable_ops[cpu].prepare_cpu )
         return -ENODEV;
 
-    update_identity_mapping(true);
+    update_mm_mapping(true);
 
     rc = smp_enable_ops[cpu].prepare_cpu(cpu);
     if ( rc )
-        update_identity_mapping(false);
+        update_mm_mapping(false);
 
     return rc;
 }
 
 void arch_cpu_up_finish(void)
 {
-    update_identity_mapping(false);
+    update_mm_mapping(false);
 }
 
 /*
diff --git a/xen/arch/arm/include/asm/arm64/mm.h b/xen/arch/arm/include/asm/arm64/mm.h
index e0bd23a6ed..edd9601d42 100644
--- a/xen/arch/arm/include/asm/arm64/mm.h
+++ b/xen/arch/arm/include/asm/arm64/mm.h
@@ -15,13 +15,14 @@ static inline bool arch_mfns_in_directmap(unsigned long mfn, unsigned long nr)
 void arch_setup_page_tables(void);
 
 /*
- * Enable/disable the identity mapping in the live page-tables (i.e.
- * the one pointed by TTBR_EL2).
+ * In MMU system, we enable/disable the identity mapping in the live
+ * page-tables (i.e. the one pointed by TTBR_EL2) through
+ * update_identity_mapping.
  *
  * Note that nested call (e.g. enable=true, enable=true) is not
  * supported.
  */
-void update_identity_mapping(bool enable);
+void update_mm_mapping(bool enable);
 
 #endif /* __ARM_ARM64_MM_H__ */
 
diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index 4262165ce2..5d890a6a45 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -14,6 +14,10 @@
 # error "unknown ARM variant"
 #endif
 
+#ifdef CONFIG_HAS_MMU
+#include <asm/mmu/mm.h>
+#endif
+
 /* Align Xen to a 2 MiB boundary. */
 #define XEN_PADDR_ALIGN (1 << 21)
 
@@ -165,13 +169,6 @@ struct page_info
 #define _PGC_need_scrub   _PGC_allocated
 #define PGC_need_scrub    PGC_allocated
 
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
@@ -194,7 +191,6 @@ extern unsigned long directmap_base_pdx;
 
 #define maddr_get_owner(ma)   (page_get_owner(maddr_to_page((ma))))
 
-#define frame_table ((struct page_info *)FRAMETABLE_VIRT_START)
 /* PDX of the first page in the frame table. */
 extern unsigned long frametable_base_pdx;
 
@@ -203,25 +199,24 @@ extern unsigned long total_pages;
 
 #define PDX_GROUP_SHIFT SECOND_SHIFT
 
+extern uint64_t init_mm;
+
 /* Boot-time pagetable setup */
 extern void setup_pagetables(unsigned long boot_phys_offset);
 /* Map FDT in boot pagetable */
 extern void *early_fdt_map(paddr_t fdt_paddr);
-/* Switch to a new root page-tables */
-extern void switch_ttbr(uint64_t ttbr);
 /* Remove early mappings */
 extern void remove_early_mappings(void);
-/* Allocate and initialise pagetables for a secondary CPU. Sets init_ttbr to the
- * new page table */
-extern int init_secondary_pagetables(int cpu);
-/* Switch secondary CPUS to its own pagetables and finalise MMU setup */
-extern void mmu_init_secondary_cpu(void);
 /*
- * For Arm32, set up the direct-mapped xenheap: up to 1GB of contiguous,
- * always-mapped memory. Base must be 32MB aligned and size a multiple of 32MB.
- * For Arm64, map the region in the directmap area.
+ * Allocate and initialise memory mapping for a secondary CPU.
+ * Sets init_mm to the new memory mapping table
+ */
+extern int init_secondary_mm(int cpu);
+/*
+ * Switch secondary CPUS to its own memory mapping tanle
+ * and finalise MMU/MPU setup
  */
-extern void setup_directmap_mappings(unsigned long base_mfn, unsigned long nr_mfns);
+extern void mm_init_secondary_cpu(void);
 /* Map a frame table to cover physical addresses ps through pe */
 extern void setup_frametable_mappings(paddr_t ps, paddr_t pe);
 /* map a physical range in virtual memory */
diff --git a/xen/arch/arm/include/asm/mmu/mm.h b/xen/arch/arm/include/asm/mmu/mm.h
new file mode 100644
index 0000000000..240410f66e
--- /dev/null
+++ b/xen/arch/arm/include/asm/mmu/mm.h
@@ -0,0 +1,54 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#ifndef __ARCH_ARM_MM_MMU__
+#define __ARCH_ARM_MM_MMU__
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
+/* Find where Xen will be residing at runtime and return a PT entry */
+lpae_t pte_of_xenaddr(vaddr_t);
+
+/* Switch to a new root page-tables */
+extern void switch_ttbr(uint64_t ttbr);
+/*
+ * For Arm32, set up the direct-mapped xenheap: up to 1GB of contiguous,
+ * always-mapped memory. Base must be 32MB aligned and size a multiple of 32MB.
+ * For Arm64, map the region in the directmap area.
+ */
+extern void setup_directmap_mappings(unsigned long base_mfn, unsigned long nr_mfns);
+extern int xen_pt_update(unsigned long virt, mfn_t mfn,
+                         /* const on purpose as it is used for TLB flush */
+                         const unsigned long nr_mfns,
+                         unsigned int flags);
+
+#endif /* __ARCH_ARM_MM_MMU__ */
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
index e7cd62190c..3893303c8f 100644
--- a/xen/arch/arm/include/asm/page.h
+++ b/xen/arch/arm/include/asm/page.h
@@ -240,21 +240,6 @@ static inline int clean_and_invalidate_dcache_va_range
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
diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
index 19dc637d55..f0f64d228c 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -176,9 +176,6 @@ extern lpae_t boot_first_id[XEN_PT_LPAE_ENTRIES];
 extern lpae_t boot_second_id[XEN_PT_LPAE_ENTRIES];
 extern lpae_t boot_third_id[XEN_PT_LPAE_ENTRIES];
 
-/* Find where Xen will be residing at runtime and return a PT entry */
-lpae_t pte_of_xenaddr(vaddr_t);
-
 extern const char __ro_after_init_start[], __ro_after_init_end[];
 
 struct init_info
diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
index e460249736..e665d1f97a 100644
--- a/xen/arch/arm/mm.c
+++ b/xen/arch/arm/mm.c
@@ -15,16 +15,12 @@
 #include <xen/init.h>
 #include <xen/libfdt/libfdt.h>
 #include <xen/mm.h>
-#include <xen/pfn.h>
-#include <xen/pmap.h>
-#include <xen/sched.h>
 #include <xen/sizes.h>
 #include <xen/types.h>
 #include <xen/vmap.h>
 
 #include <xsm/xsm.h>
 
-#include <asm/fixmap.h>
 #include <asm/setup.h>
 
 #include <public/memory.h>
@@ -32,104 +28,9 @@
 /* Override macros from asm/page.h to make them work with mfn_t */
 #undef virt_to_mfn
 #define virt_to_mfn(va) _mfn(__virt_to_mfn(va))
-#undef mfn_to_virt
-#define mfn_to_virt(mfn) __mfn_to_virt(mfn_x(mfn))
 
-#ifdef NDEBUG
-static inline void
-__attribute__ ((__format__ (__printf__, 1, 2)))
-mm_printk(const char *fmt, ...) {}
-#else
-#define mm_printk(fmt, args...)             \
-    do                                      \
-    {                                       \
-        dprintk(XENLOG_ERR, fmt, ## args);  \
-        WARN();                             \
-    } while (0)
-#endif
-
-/* Static start-of-day pagetables that we use before the allocators
- * are up. These are used by all CPUs during bringup before switching
- * to the CPUs own pagetables.
- *
- * These pagetables have a very simple structure. They include:
- *  - 2MB worth of 4K mappings of xen at XEN_VIRT_START, boot_first and
- *    boot_second are used to populate the tables down to boot_third
- *    which contains the actual mapping.
- *  - a 1:1 mapping of xen at its current physical address. This uses a
- *    section mapping at whichever of boot_{pgtable,first,second}
- *    covers that physical address.
- *
- * For the boot CPU these mappings point to the address where Xen was
- * loaded by the bootloader. For secondary CPUs they point to the
- * relocated copy of Xen for the benefit of secondary CPUs.
- *
- * In addition to the above for the boot CPU the device-tree is
- * initially mapped in the boot misc slot. This mapping is not present
- * for secondary CPUs.
- *
- * Finally, if EARLY_PRINTK is enabled then xen_fixmap will be mapped
- * by the CPU once it has moved off the 1:1 mapping.
- */
-DEFINE_BOOT_PAGE_TABLE(boot_pgtable);
-#ifdef CONFIG_ARM_64
-DEFINE_BOOT_PAGE_TABLE(boot_first);
-DEFINE_BOOT_PAGE_TABLE(boot_first_id);
-#endif
-DEFINE_BOOT_PAGE_TABLE(boot_second_id);
-DEFINE_BOOT_PAGE_TABLE(boot_third_id);
-DEFINE_BOOT_PAGE_TABLE(boot_second);
-DEFINE_BOOT_PAGE_TABLE(boot_third);
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
-#define HYP_PT_ROOT_LEVEL 0
-DEFINE_PAGE_TABLE(xen_pgtable);
-static DEFINE_PAGE_TABLE(xen_first);
-#define THIS_CPU_PGTABLE xen_pgtable
-#else
-#define HYP_PT_ROOT_LEVEL 1
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
-static DEFINE_PAGE_TABLE(xen_xenmap);
-
-/* Non-boot CPUs use this to find the correct pagetables. */
-uint64_t init_ttbr;
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
+/* Non-boot CPUs use this to find the correct memory mapping table. */
+uint64_t init_mm;
 
 unsigned long frametable_base_pdx __read_mostly;
 unsigned long frametable_virt_end __read_mostly;
@@ -139,243 +40,6 @@ unsigned long total_pages;
 
 extern char __init_begin[], __init_end[];
 
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
-static lpae_t *xen_map_table(mfn_t mfn)
-{
-    /*
-     * During early boot, map_domain_page() may be unusable. Use the
-     * PMAP to map temporarily a page-table.
-     */
-    if ( system_state == SYS_STATE_early_boot )
-        return pmap_map(mfn);
-
-    return map_domain_page(mfn);
-}
-
-static void xen_unmap_table(const lpae_t *table)
-{
-    /*
-     * During early boot, xen_map_table() will not use map_domain_page()
-     * but the PMAP.
-     */
-    if ( system_state == SYS_STATE_early_boot )
-        pmap_unmap(table);
-    else
-        unmap_domain_page(table);
-}
-
-void dump_pt_walk(paddr_t ttbr, paddr_t addr,
-                  unsigned int root_level,
-                  unsigned int nr_root_tables)
-{
-    static const char *level_strs[4] = { "0TH", "1ST", "2ND", "3RD" };
-    const mfn_t root_mfn = maddr_to_mfn(ttbr);
-    DECLARE_OFFSETS(offsets, addr);
-    lpae_t pte, *mapping;
-    unsigned int level, root_table;
-
-#ifdef CONFIG_ARM_32
-    BUG_ON(root_level < 1);
-#endif
-    BUG_ON(root_level > 3);
-
-    if ( nr_root_tables > 1 )
-    {
-        /*
-         * Concatenated root-level tables. The table number will be
-         * the offset at the previous level. It is not possible to
-         * concatenate a level-0 root.
-         */
-        BUG_ON(root_level == 0);
-        root_table = offsets[root_level - 1];
-        printk("Using concatenated root table %u\n", root_table);
-        if ( root_table >= nr_root_tables )
-        {
-            printk("Invalid root table offset\n");
-            return;
-        }
-    }
-    else
-        root_table = 0;
-
-    mapping = xen_map_table(mfn_add(root_mfn, root_table));
-
-    for ( level = root_level; ; level++ )
-    {
-        if ( offsets[level] > XEN_PT_LPAE_ENTRIES )
-            break;
-
-        pte = mapping[offsets[level]];
-
-        printk("%s[0x%03x] = 0x%"PRIx64"\n",
-               level_strs[level], offsets[level], pte.bits);
-
-        if ( level == 3 || !pte.walk.valid || !pte.walk.table )
-            break;
-
-        /* For next iteration */
-        xen_unmap_table(mapping);
-        mapping = xen_map_table(lpae_get_mfn(pte));
-    }
-
-    xen_unmap_table(mapping);
-}
-
-void dump_hyp_walk(vaddr_t addr)
-{
-    uint64_t ttbr = READ_SYSREG64(TTBR0_EL2);
-
-    printk("Walking Hypervisor VA 0x%"PRIvaddr" "
-           "on CPU%d via TTBR 0x%016"PRIx64"\n",
-           addr, smp_processor_id(), ttbr);
-
-    dump_pt_walk(ttbr, addr, HYP_PT_ROOT_LEVEL, 1);
-}
-
-lpae_t mfn_to_xen_entry(mfn_t mfn, unsigned int attr)
-{
-    lpae_t e = (lpae_t) {
-        .pt = {
-            .valid = 1,           /* Mappings are present */
-            .table = 0,           /* Set to 1 for links and 4k maps */
-            .ai = attr,
-            .ns = 1,              /* Hyp mode is in the non-secure world */
-            .up = 1,              /* See below */
-            .ro = 0,              /* Assume read-write */
-            .af = 1,              /* No need for access tracking */
-            .ng = 1,              /* Makes TLB flushes easier */
-            .contig = 0,          /* Assume non-contiguous */
-            .xn = 1,              /* No need to execute outside .text */
-            .avail = 0,           /* Reference count for domheap mapping */
-        }};
-    /*
-     * For EL2 stage-1 page table, up (aka AP[1]) is RES1 as the translation
-     * regime applies to only one exception level (see D4.4.4 and G4.6.1
-     * in ARM DDI 0487B.a). If this changes, remember to update the
-     * hard-coded values in head.S too.
-     */
-
-    switch ( attr )
-    {
-    case MT_NORMAL_NC:
-        /*
-         * ARM ARM: Overlaying the shareability attribute (DDI
-         * 0406C.b B3-1376 to 1377)
-         *
-         * A memory region with a resultant memory type attribute of Normal,
-         * and a resultant cacheability attribute of Inner Non-cacheable,
-         * Outer Non-cacheable, must have a resultant shareability attribute
-         * of Outer Shareable, otherwise shareability is UNPREDICTABLE.
-         *
-         * On ARMv8 sharability is ignored and explicitly treated as Outer
-         * Shareable for Normal Inner Non_cacheable, Outer Non-cacheable.
-         */
-        e.pt.sh = LPAE_SH_OUTER;
-        break;
-    case MT_DEVICE_nGnRnE:
-    case MT_DEVICE_nGnRE:
-        /*
-         * Shareability is ignored for non-Normal memory, Outer is as
-         * good as anything.
-         *
-         * On ARMv8 sharability is ignored and explicitly treated as Outer
-         * Shareable for any device memory type.
-         */
-        e.pt.sh = LPAE_SH_OUTER;
-        break;
-    default:
-        e.pt.sh = LPAE_SH_INNER;  /* Xen mappings are SMP coherent */
-        break;
-    }
-
-    ASSERT(!(mfn_to_maddr(mfn) & ~PADDR_MASK));
-
-    lpae_set_mfn(e, mfn);
-
-    return e;
-}
-
-/* Map a 4k page in a fixmap entry */
-void set_fixmap(unsigned int map, mfn_t mfn, unsigned int flags)
-{
-    int res;
-
-    res = map_pages_to_xen(FIXMAP_ADDR(map), mfn, 1, flags);
-    BUG_ON(res != 0);
-}
-
-/* Remove a mapping from a fixmap entry */
-void clear_fixmap(unsigned int map)
-{
-    int res;
-
-    res = destroy_xen_mappings(FIXMAP_ADDR(map), FIXMAP_ADDR(map) + PAGE_SIZE);
-    BUG_ON(res != 0);
-}
-
 void flush_page_to_ram(unsigned long mfn, bool sync_icache)
 {
     void *v = map_domain_page(_mfn(mfn));
@@ -395,13 +59,6 @@ void flush_page_to_ram(unsigned long mfn, bool sync_icache)
         invalidate_icache();
 }
 
-lpae_t pte_of_xenaddr(vaddr_t va)
-{
-    paddr_t ma = va + phys_offset;
-
-    return mfn_to_xen_entry(maddr_to_mfn(ma), MT_NORMAL);
-}
-
 void * __init early_fdt_map(paddr_t fdt_paddr)
 {
     /* We are using 2MB superpage for mapping the FDT */
@@ -455,761 +112,11 @@ void * __init early_fdt_map(paddr_t fdt_paddr)
     return fdt_virt;
 }
 
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
-/* Clear a translation table and clean & invalidate the cache */
-static void clear_table(void *table)
-{
-    clear_page(table);
-    clean_and_invalidate_dcache_va_range(table, PAGE_SIZE);
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
-    /* Break up the Xen mapping into 4k pages and protect them separately. */
-    for ( i = 0; i < XEN_PT_LPAE_ENTRIES; i++ )
-    {
-        vaddr_t va = XEN_VIRT_START + (i << PAGE_SHIFT);
-
-        if ( !is_kernel(va) )
-            break;
-        pte = pte_of_xenaddr(va);
-        pte.pt.table = 1; /* 4k mappings always have this bit set */
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
-
-    pte = pte_of_xenaddr((vaddr_t)xen_xenmap);
-    pte.pt.table = 1;
-    xen_second[second_table_offset(XEN_VIRT_START)] = pte;
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
-static void clear_boot_pagetables(void)
-{
-    /*
-     * Clear the copy of the boot pagetables. Each secondary CPU
-     * rebuilds these itself (see head.S).
-     */
-    clear_table(boot_pgtable);
-#ifdef CONFIG_ARM_64
-    clear_table(boot_first);
-    clear_table(boot_first_id);
-#endif
-    clear_table(boot_second);
-    clear_table(boot_third);
-}
-
-#ifdef CONFIG_ARM_64
-int init_secondary_pagetables(int cpu)
-{
-    clear_boot_pagetables();
-
-    /* Set init_ttbr for this CPU coming up. All CPus share a single setof
-     * pagetables, but rewrite it each time for consistency with 32 bit. */
-    init_ttbr = (uintptr_t) xen_pgtable + phys_offset;
-    clean_dcache(init_ttbr);
-    return 0;
-}
-#else
-int init_secondary_pagetables(int cpu)
-{
-    lpae_t *first;
-
-    first = alloc_xenheap_page(); /* root == first level on 32-bit 3-level trie */
-
-    if ( !first )
-    {
-        printk("CPU%u: Unable to allocate the first page-table\n", cpu);
-        return -ENOMEM;
-    }
-
-    /* Initialise root pagetable from root of boot tables */
-    memcpy(first, cpu0_pgtable, PAGE_SIZE);
-    per_cpu(xen_pgtable, cpu) = first;
-
-    if ( !init_domheap_mappings(cpu) )
-    {
-        printk("CPU%u: Unable to prepare the domheap page-tables\n", cpu);
-        per_cpu(xen_pgtable, cpu) = NULL;
-        free_xenheap_page(first);
-        return -ENOMEM;
-    }
-
-    clear_boot_pagetables();
-
-    /* Set init_ttbr for this CPU coming up */
-    init_ttbr = __pa(first);
-    clean_dcache(init_ttbr);
-
-    return 0;
-}
-#endif
-
-/* MMU setup for secondary CPUS (which already have paging enabled) */
-void mmu_init_secondary_cpu(void)
-{
-    xen_pt_enforce_wnx();
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
-/* Map a frame table to cover physical addresses ps through pe */
-void __init setup_frametable_mappings(paddr_t ps, paddr_t pe)
-{
-    unsigned long nr_pdxs = mfn_to_pdx(mfn_add(maddr_to_mfn(pe), -1)) -
-                            mfn_to_pdx(maddr_to_mfn(ps)) + 1;
-    unsigned long frametable_size = nr_pdxs * sizeof(struct page_info);
-    mfn_t base_mfn;
-    const unsigned long mapping_size = frametable_size < MB(32) ? MB(2) : MB(32);
-    int rc;
-
-    /*
-     * The size of paddr_t should be sufficient for the complete range of
-     * physical address.
-     */
-    BUILD_BUG_ON((sizeof(paddr_t) * BITS_PER_BYTE) < PADDR_BITS);
-    BUILD_BUG_ON(sizeof(struct page_info) != PAGE_INFO_SIZE);
-
-    if ( frametable_size > FRAMETABLE_SIZE )
-        panic("The frametable cannot cover the physical region %#"PRIpaddr" - %#"PRIpaddr"\n",
-              ps, pe);
-
-    frametable_base_pdx = mfn_to_pdx(maddr_to_mfn(ps));
-    /* Round up to 2M or 32M boundary, as appropriate. */
-    frametable_size = ROUNDUP(frametable_size, mapping_size);
-    base_mfn = alloc_boot_pages(frametable_size >> PAGE_SHIFT, 32<<(20-12));
-
-    rc = map_pages_to_xen(FRAMETABLE_VIRT_START, base_mfn,
-                          frametable_size >> PAGE_SHIFT,
-                          PAGE_HYPERVISOR_RW | _PAGE_BLOCK);
-    if ( rc )
-        panic("Unable to setup the frametable mappings.\n");
-
-    memset(&frame_table[0], 0, nr_pdxs * sizeof(struct page_info));
-    memset(&frame_table[nr_pdxs], -1,
-           frametable_size - (nr_pdxs * sizeof(struct page_info)));
-
-    frametable_virt_end = FRAMETABLE_VIRT_START + (nr_pdxs * sizeof(struct page_info));
-}
-
-void *__init arch_vmap_virt_end(void)
-{
-    return (void *)(VMAP_VIRT_START + VMAP_VIRT_SIZE);
-}
-
-/*
- * This function should only be used to remap device address ranges
- * TODO: add a check to verify this assumption
- */
-void *ioremap_attr(paddr_t pa, size_t len, unsigned int attributes)
-{
-    mfn_t mfn = _mfn(PFN_DOWN(pa));
-    unsigned int offs = pa & (PAGE_SIZE - 1);
-    unsigned int nr = PFN_UP(offs + len);
-    void *ptr = __vmap(&mfn, nr, 1, 1, attributes, VMAP_DEFAULT);
-
-    if ( ptr == NULL )
-        return NULL;
-
-    return ptr + offs;
-}
-
 void *ioremap(paddr_t pa, size_t len)
 {
     return ioremap_attr(pa, len, PAGE_HYPERVISOR_NOCACHE);
 }
 
-static int create_xen_table(lpae_t *entry)
-{
-    mfn_t mfn;
-    void *p;
-    lpae_t pte;
-
-    if ( system_state != SYS_STATE_early_boot )
-    {
-        struct page_info *pg = alloc_domheap_page(NULL, 0);
-
-        if ( pg == NULL )
-            return -ENOMEM;
-
-        mfn = page_to_mfn(pg);
-    }
-    else
-        mfn = alloc_boot_pages(1, 1);
-
-    p = xen_map_table(mfn);
-    clear_page(p);
-    xen_unmap_table(p);
-
-    pte = mfn_to_xen_entry(mfn, MT_NORMAL);
-    pte.pt.table = 1;
-    write_pte(entry, pte);
-
-    return 0;
-}
-
-#define XEN_TABLE_MAP_FAILED 0
-#define XEN_TABLE_SUPER_PAGE 1
-#define XEN_TABLE_NORMAL_PAGE 2
-
-/*
- * Take the currently mapped table, find the corresponding entry,
- * and map the next table, if available.
- *
- * The read_only parameters indicates whether intermediate tables should
- * be allocated when not present.
- *
- * Return values:
- *  XEN_TABLE_MAP_FAILED: Either read_only was set and the entry
- *  was empty, or allocating a new page failed.
- *  XEN_TABLE_NORMAL_PAGE: next level mapped normally
- *  XEN_TABLE_SUPER_PAGE: The next entry points to a superpage.
- */
-static int xen_pt_next_level(bool read_only, unsigned int level,
-                             lpae_t **table, unsigned int offset)
-{
-    lpae_t *entry;
-    int ret;
-    mfn_t mfn;
-
-    entry = *table + offset;
-
-    if ( !lpae_is_valid(*entry) )
-    {
-        if ( read_only )
-            return XEN_TABLE_MAP_FAILED;
-
-        ret = create_xen_table(entry);
-        if ( ret )
-            return XEN_TABLE_MAP_FAILED;
-    }
-
-    /* The function xen_pt_next_level is never called at the 3rd level */
-    if ( lpae_is_mapping(*entry, level) )
-        return XEN_TABLE_SUPER_PAGE;
-
-    mfn = lpae_get_mfn(*entry);
-
-    xen_unmap_table(*table);
-    *table = xen_map_table(mfn);
-
-    return XEN_TABLE_NORMAL_PAGE;
-}
-
-/* Sanity check of the entry */
-static bool xen_pt_check_entry(lpae_t entry, mfn_t mfn, unsigned int level,
-                               unsigned int flags)
-{
-    /* Sanity check when modifying an entry. */
-    if ( (flags & _PAGE_PRESENT) && mfn_eq(mfn, INVALID_MFN) )
-    {
-        /* We don't allow modifying an invalid entry. */
-        if ( !lpae_is_valid(entry) )
-        {
-            mm_printk("Modifying invalid entry is not allowed.\n");
-            return false;
-        }
-
-        /* We don't allow modifying a table entry */
-        if ( !lpae_is_mapping(entry, level) )
-        {
-            mm_printk("Modifying a table entry is not allowed.\n");
-            return false;
-        }
-
-        /* We don't allow changing memory attributes. */
-        if ( entry.pt.ai != PAGE_AI_MASK(flags) )
-        {
-            mm_printk("Modifying memory attributes is not allowed (0x%x -> 0x%x).\n",
-                      entry.pt.ai, PAGE_AI_MASK(flags));
-            return false;
-        }
-
-        /* We don't allow modifying entry with contiguous bit set. */
-        if ( entry.pt.contig )
-        {
-            mm_printk("Modifying entry with contiguous bit set is not allowed.\n");
-            return false;
-        }
-    }
-    /* Sanity check when inserting a mapping */
-    else if ( flags & _PAGE_PRESENT )
-    {
-        /* We should be here with a valid MFN. */
-        ASSERT(!mfn_eq(mfn, INVALID_MFN));
-
-        /*
-         * We don't allow replacing any valid entry.
-         *
-         * Note that the function xen_pt_update() relies on this
-         * assumption and will skip the TLB flush. The function will need
-         * to be updated if the check is relaxed.
-         */
-        if ( lpae_is_valid(entry) )
-        {
-            if ( lpae_is_mapping(entry, level) )
-                mm_printk("Changing MFN for a valid entry is not allowed (%#"PRI_mfn" -> %#"PRI_mfn").\n",
-                          mfn_x(lpae_get_mfn(entry)), mfn_x(mfn));
-            else
-                mm_printk("Trying to replace a table with a mapping.\n");
-            return false;
-        }
-    }
-    /* Sanity check when removing a mapping. */
-    else if ( (flags & (_PAGE_PRESENT|_PAGE_POPULATE)) == 0 )
-    {
-        /* We should be here with an invalid MFN. */
-        ASSERT(mfn_eq(mfn, INVALID_MFN));
-
-        /* We don't allow removing a table */
-        if ( lpae_is_table(entry, level) )
-        {
-            mm_printk("Removing a table is not allowed.\n");
-            return false;
-        }
-
-        /* We don't allow removing a mapping with contiguous bit set. */
-        if ( entry.pt.contig )
-        {
-            mm_printk("Removing entry with contiguous bit set is not allowed.\n");
-            return false;
-        }
-    }
-    /* Sanity check when populating the page-table. No check so far. */
-    else
-    {
-        ASSERT(flags & _PAGE_POPULATE);
-        /* We should be here with an invalid MFN */
-        ASSERT(mfn_eq(mfn, INVALID_MFN));
-    }
-
-    return true;
-}
-
-/* Update an entry at the level @target. */
-static int xen_pt_update_entry(mfn_t root, unsigned long virt,
-                               mfn_t mfn, unsigned int target,
-                               unsigned int flags)
-{
-    int rc;
-    unsigned int level;
-    lpae_t *table;
-    /*
-     * The intermediate page tables are read-only when the MFN is not valid
-     * and we are not populating page table.
-     * This means we either modify permissions or remove an entry.
-     */
-    bool read_only = mfn_eq(mfn, INVALID_MFN) && !(flags & _PAGE_POPULATE);
-    lpae_t pte, *entry;
-
-    /* convenience aliases */
-    DECLARE_OFFSETS(offsets, (paddr_t)virt);
-
-    /* _PAGE_POPULATE and _PAGE_PRESENT should never be set together. */
-    ASSERT((flags & (_PAGE_POPULATE|_PAGE_PRESENT)) != (_PAGE_POPULATE|_PAGE_PRESENT));
-
-    table = xen_map_table(root);
-    for ( level = HYP_PT_ROOT_LEVEL; level < target; level++ )
-    {
-        rc = xen_pt_next_level(read_only, level, &table, offsets[level]);
-        if ( rc == XEN_TABLE_MAP_FAILED )
-        {
-            /*
-             * We are here because xen_pt_next_level has failed to map
-             * the intermediate page table (e.g the table does not exist
-             * and the pt is read-only). It is a valid case when
-             * removing a mapping as it may not exist in the page table.
-             * In this case, just ignore it.
-             */
-            if ( flags & (_PAGE_PRESENT|_PAGE_POPULATE) )
-            {
-                mm_printk("%s: Unable to map level %u\n", __func__, level);
-                rc = -ENOENT;
-                goto out;
-            }
-            else
-            {
-                rc = 0;
-                goto out;
-            }
-        }
-        else if ( rc != XEN_TABLE_NORMAL_PAGE )
-            break;
-    }
-
-    if ( level != target )
-    {
-        mm_printk("%s: Shattering superpage is not supported\n", __func__);
-        rc = -EOPNOTSUPP;
-        goto out;
-    }
-
-    entry = table + offsets[level];
-
-    rc = -EINVAL;
-    if ( !xen_pt_check_entry(*entry, mfn, level, flags) )
-        goto out;
-
-    /* If we are only populating page-table, then we are done. */
-    rc = 0;
-    if ( flags & _PAGE_POPULATE )
-        goto out;
-
-    /* We are removing the page */
-    if ( !(flags & _PAGE_PRESENT) )
-        memset(&pte, 0x00, sizeof(pte));
-    else
-    {
-        /* We are inserting a mapping => Create new pte. */
-        if ( !mfn_eq(mfn, INVALID_MFN) )
-        {
-            pte = mfn_to_xen_entry(mfn, PAGE_AI_MASK(flags));
-
-            /*
-             * First and second level pages set pte.pt.table = 0, but
-             * third level entries set pte.pt.table = 1.
-             */
-            pte.pt.table = (level == 3);
-        }
-        else /* We are updating the permission => Copy the current pte. */
-            pte = *entry;
-
-        /* Set permission */
-        pte.pt.ro = PAGE_RO_MASK(flags);
-        pte.pt.xn = PAGE_XN_MASK(flags);
-        /* Set contiguous bit */
-        pte.pt.contig = !!(flags & _PAGE_CONTIG);
-    }
-
-    write_pte(entry, pte);
-
-    rc = 0;
-
-out:
-    xen_unmap_table(table);
-
-    return rc;
-}
-
-/* Return the level where mapping should be done */
-static int xen_pt_mapping_level(unsigned long vfn, mfn_t mfn, unsigned long nr,
-                                unsigned int flags)
-{
-    unsigned int level;
-    unsigned long mask;
-
-    /*
-      * Don't take into account the MFN when removing mapping (i.e
-      * MFN_INVALID) to calculate the correct target order.
-      *
-      * Per the Arm Arm, `vfn` and `mfn` must be both superpage aligned.
-      * They are or-ed together and then checked against the size of
-      * each level.
-      *
-      * `left` is not included and checked separately to allow
-      * superpage mapping even if it is not properly aligned (the
-      * user may have asked to map 2MB + 4k).
-      */
-     mask = !mfn_eq(mfn, INVALID_MFN) ? mfn_x(mfn) : 0;
-     mask |= vfn;
-
-     /*
-      * Always use level 3 mapping unless the caller request block
-      * mapping.
-      */
-     if ( likely(!(flags & _PAGE_BLOCK)) )
-         level = 3;
-     else if ( !(mask & (BIT(FIRST_ORDER, UL) - 1)) &&
-               (nr >= BIT(FIRST_ORDER, UL)) )
-         level = 1;
-     else if ( !(mask & (BIT(SECOND_ORDER, UL) - 1)) &&
-               (nr >= BIT(SECOND_ORDER, UL)) )
-         level = 2;
-     else
-         level = 3;
-
-     return level;
-}
-
-#define XEN_PT_4K_NR_CONTIG 16
-
-/*
- * Check whether the contiguous bit can be set. Return the number of
- * contiguous entry allowed. If not allowed, return 1.
- */
-static unsigned int xen_pt_check_contig(unsigned long vfn, mfn_t mfn,
-                                        unsigned int level, unsigned long left,
-                                        unsigned int flags)
-{
-    unsigned long nr_contig;
-
-    /*
-     * Allow the contiguous bit to set when the caller requests block
-     * mapping.
-     */
-    if ( !(flags & _PAGE_BLOCK) )
-        return 1;
-
-    /*
-     * We don't allow to remove mapping with the contiguous bit set.
-     * So shortcut the logic and directly return 1.
-     */
-    if ( mfn_eq(mfn, INVALID_MFN) )
-        return 1;
-
-    /*
-     * The number of contiguous entries varies depending on the page
-     * granularity used. The logic below assumes 4KB.
-     */
-    BUILD_BUG_ON(PAGE_SIZE != SZ_4K);
-
-    /*
-     * In order to enable the contiguous bit, we should have enough entries
-     * to map left and both the virtual and physical address should be
-     * aligned to the size of 16 translation tables entries.
-     */
-    nr_contig = BIT(XEN_PT_LEVEL_ORDER(level), UL) * XEN_PT_4K_NR_CONTIG;
-
-    if ( (left < nr_contig) || ((mfn_x(mfn) | vfn) & (nr_contig - 1)) )
-        return 1;
-
-    return XEN_PT_4K_NR_CONTIG;
-}
-
-static DEFINE_SPINLOCK(xen_pt_lock);
-
-static int xen_pt_update(unsigned long virt,
-                         mfn_t mfn,
-                         /* const on purpose as it is used for TLB flush */
-                         const unsigned long nr_mfns,
-                         unsigned int flags)
-{
-    int rc = 0;
-    unsigned long vfn = virt >> PAGE_SHIFT;
-    unsigned long left = nr_mfns;
-
-    /*
-     * For arm32, page-tables are different on each CPUs. Yet, they share
-     * some common mappings. It is assumed that only common mappings
-     * will be modified with this function.
-     *
-     * XXX: Add a check.
-     */
-    const mfn_t root = maddr_to_mfn(READ_SYSREG64(TTBR0_EL2));
-
-    /*
-     * The hardware was configured to forbid mapping both writeable and
-     * executable.
-     * When modifying/creating mapping (i.e _PAGE_PRESENT is set),
-     * prevent any update if this happen.
-     */
-    if ( (flags & _PAGE_PRESENT) && !PAGE_RO_MASK(flags) &&
-         !PAGE_XN_MASK(flags) )
-    {
-        mm_printk("Mappings should not be both Writeable and Executable.\n");
-        return -EINVAL;
-    }
-
-    if ( flags & _PAGE_CONTIG )
-    {
-        mm_printk("_PAGE_CONTIG is an internal only flag.\n");
-        return -EINVAL;
-    }
-
-    if ( !IS_ALIGNED(virt, PAGE_SIZE) )
-    {
-        mm_printk("The virtual address is not aligned to the page-size.\n");
-        return -EINVAL;
-    }
-
-    spin_lock(&xen_pt_lock);
-
-    while ( left )
-    {
-        unsigned int order, level, nr_contig, new_flags;
-
-        level = xen_pt_mapping_level(vfn, mfn, left, flags);
-        order = XEN_PT_LEVEL_ORDER(level);
-
-        ASSERT(left >= BIT(order, UL));
-
-        /*
-         * Check if we can set the contiguous mapping and update the
-         * flags accordingly.
-         */
-        nr_contig = xen_pt_check_contig(vfn, mfn, level, left, flags);
-        new_flags = flags | ((nr_contig > 1) ? _PAGE_CONTIG : 0);
-
-        for ( ; nr_contig > 0; nr_contig-- )
-        {
-            rc = xen_pt_update_entry(root, vfn << PAGE_SHIFT, mfn, level,
-                                     new_flags);
-            if ( rc )
-                break;
-
-            vfn += 1U << order;
-            if ( !mfn_eq(mfn, INVALID_MFN) )
-                mfn = mfn_add(mfn, 1U << order);
-
-            left -= (1U << order);
-        }
-
-        if ( rc )
-            break;
-    }
-
-    /*
-     * The TLBs flush can be safely skipped when a mapping is inserted
-     * as we don't allow mapping replacement (see xen_pt_check_entry()).
-     *
-     * For all the other cases, the TLBs will be flushed unconditionally
-     * even if the mapping has failed. This is because we may have
-     * partially modified the PT. This will prevent any unexpected
-     * behavior afterwards.
-     */
-    if ( !((flags & _PAGE_PRESENT) && !mfn_eq(mfn, INVALID_MFN)) )
-        flush_xen_tlb_range_va(virt, PAGE_SIZE * nr_mfns);
-
-    spin_unlock(&xen_pt_lock);
-
-    return rc;
-}
-
 int map_pages_to_xen(unsigned long virt,
                      mfn_t mfn,
                      unsigned long nr_mfns,
@@ -1218,11 +125,6 @@ int map_pages_to_xen(unsigned long virt,
     return xen_pt_update(virt, mfn, nr_mfns, flags);
 }
 
-int populate_pt_range(unsigned long virt, unsigned long nr_mfns)
-{
-    return xen_pt_update(virt, INVALID_MFN, nr_mfns, _PAGE_POPULATE);
-}
-
 int destroy_xen_mappings(unsigned long s, unsigned long e)
 {
     ASSERT(IS_ALIGNED(s, PAGE_SIZE));
diff --git a/xen/arch/arm/mmu/mm.c b/xen/arch/arm/mmu/mm.c
new file mode 100644
index 0000000000..43c19fa914
--- /dev/null
+++ b/xen/arch/arm/mmu/mm.c
@@ -0,0 +1,1125 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * xen/arch/arm/mm-mmu.c
+ *
+ * MMU code for an ARMv7-A with virt extensions.
+ *
+ * Tim Deegan <tim@xen.org>
+ * Copyright (c) 2011 Citrix Systems.
+ */
+
+#include <xen/domain_page.h>
+#include <xen/errno.h>
+#include <xen/init.h>
+#include <xen/mm.h>
+#include <xen/pmap.h>
+#include <xen/sched.h>
+#include <xen/sizes.h>
+#include <xen/types.h>
+#include <xen/vmap.h>
+
+#include <asm/fixmap.h>
+#include <asm/setup.h>
+
+#undef mfn_to_virt
+#define mfn_to_virt(mfn) __mfn_to_virt(mfn_x(mfn))
+
+#ifdef NDEBUG
+static inline void
+__attribute__ ((__format__ (__printf__, 1, 2)))
+mm_printk(const char *fmt, ...) {}
+#else
+#define mm_printk(fmt, args...)             \
+    do                                      \
+    {                                       \
+        dprintk(XENLOG_ERR, fmt, ## args);  \
+        WARN();                             \
+    } while (0)
+#endif
+
+/* Static start-of-day pagetables that we use before the allocators
+ * are up. These are used by all CPUs during bringup before switching
+ * to the CPUs own pagetables.
+ *
+ * These pagetables have a very simple structure. They include:
+ *  - 2MB worth of 4K mappings of xen at XEN_VIRT_START, boot_first and
+ *    boot_second are used to populate the tables down to boot_third
+ *    which contains the actual mapping.
+ *  - a 1:1 mapping of xen at its current physical address. This uses a
+ *    section mapping at whichever of boot_{pgtable,first,second}
+ *    covers that physical address.
+ *
+ * For the boot CPU these mappings point to the address where Xen was
+ * loaded by the bootloader. For secondary CPUs they point to the
+ * relocated copy of Xen for the benefit of secondary CPUs.
+ *
+ * In addition to the above for the boot CPU the device-tree is
+ * initially mapped in the boot misc slot. This mapping is not present
+ * for secondary CPUs.
+ *
+ * Finally, if EARLY_PRINTK is enabled then xen_fixmap will be mapped
+ * by the CPU once it has moved off the 1:1 mapping.
+ */
+DEFINE_BOOT_PAGE_TABLE(boot_pgtable);
+#ifdef CONFIG_ARM_64
+DEFINE_BOOT_PAGE_TABLE(boot_first);
+DEFINE_BOOT_PAGE_TABLE(boot_first_id);
+#endif
+DEFINE_BOOT_PAGE_TABLE(boot_second_id);
+DEFINE_BOOT_PAGE_TABLE(boot_third_id);
+DEFINE_BOOT_PAGE_TABLE(boot_second);
+DEFINE_BOOT_PAGE_TABLE(boot_third);
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
+#define HYP_PT_ROOT_LEVEL 0
+DEFINE_PAGE_TABLE(xen_pgtable);
+static DEFINE_PAGE_TABLE(xen_first);
+#define THIS_CPU_PGTABLE xen_pgtable
+#else
+#define HYP_PT_ROOT_LEVEL 1
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
+static DEFINE_PAGE_TABLE(xen_xenmap);
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
+static lpae_t *xen_map_table(mfn_t mfn)
+{
+    /*
+     * During early boot, map_domain_page() may be unusable. Use the
+     * PMAP to map temporarily a page-table.
+     */
+    if ( system_state == SYS_STATE_early_boot )
+        return pmap_map(mfn);
+
+    return map_domain_page(mfn);
+}
+
+static void xen_unmap_table(const lpae_t *table)
+{
+    /*
+     * During early boot, xen_map_table() will not use map_domain_page()
+     * but the PMAP.
+     */
+    if ( system_state == SYS_STATE_early_boot )
+        pmap_unmap(table);
+    else
+        unmap_domain_page(table);
+}
+
+void dump_pt_walk(paddr_t ttbr, paddr_t addr,
+                  unsigned int root_level,
+                  unsigned int nr_root_tables)
+{
+    static const char *level_strs[4] = { "0TH", "1ST", "2ND", "3RD" };
+    const mfn_t root_mfn = maddr_to_mfn(ttbr);
+    DECLARE_OFFSETS(offsets, addr);
+    lpae_t pte, *mapping;
+    unsigned int level, root_table;
+
+#ifdef CONFIG_ARM_32
+    BUG_ON(root_level < 1);
+#endif
+    BUG_ON(root_level > 3);
+
+    if ( nr_root_tables > 1 )
+    {
+        /*
+         * Concatenated root-level tables. The table number will be
+         * the offset at the previous level. It is not possible to
+         * concatenate a level-0 root.
+         */
+        BUG_ON(root_level == 0);
+        root_table = offsets[root_level - 1];
+        printk("Using concatenated root table %u\n", root_table);
+        if ( root_table >= nr_root_tables )
+        {
+            printk("Invalid root table offset\n");
+            return;
+        }
+    }
+    else
+        root_table = 0;
+
+    mapping = xen_map_table(mfn_add(root_mfn, root_table));
+
+    for ( level = root_level; ; level++ )
+    {
+        if ( offsets[level] > XEN_PT_LPAE_ENTRIES )
+            break;
+
+        pte = mapping[offsets[level]];
+
+        printk("%s[0x%03x] = 0x%"PRIx64"\n",
+               level_strs[level], offsets[level], pte.bits);
+
+        if ( level == 3 || !pte.walk.valid || !pte.walk.table )
+            break;
+
+        /* For next iteration */
+        xen_unmap_table(mapping);
+        mapping = xen_map_table(lpae_get_mfn(pte));
+    }
+
+    xen_unmap_table(mapping);
+}
+
+void dump_hyp_walk(vaddr_t addr)
+{
+    uint64_t ttbr = READ_SYSREG64(TTBR0_EL2);
+
+    printk("Walking Hypervisor VA 0x%"PRIvaddr" "
+           "on CPU%d via TTBR 0x%016"PRIx64"\n",
+           addr, smp_processor_id(), ttbr);
+
+    dump_pt_walk(ttbr, addr, HYP_PT_ROOT_LEVEL, 1);
+}
+
+lpae_t mfn_to_xen_entry(mfn_t mfn, unsigned int attr)
+{
+    lpae_t e = (lpae_t) {
+        .pt = {
+            .valid = 1,           /* Mappings are present */
+            .table = 0,           /* Set to 1 for links and 4k maps */
+            .ai = attr,
+            .ns = 1,              /* Hyp mode is in the non-secure world */
+            .up = 1,              /* See below */
+            .ro = 0,              /* Assume read-write */
+            .af = 1,              /* No need for access tracking */
+            .ng = 1,              /* Makes TLB flushes easier */
+            .contig = 0,          /* Assume non-contiguous */
+            .xn = 1,              /* No need to execute outside .text */
+            .avail = 0,           /* Reference count for domheap mapping */
+        }};
+    /*
+     * For EL2 stage-1 page table, up (aka AP[1]) is RES1 as the translation
+     * regime applies to only one exception level (see D4.4.4 and G4.6.1
+     * in ARM DDI 0487B.a). If this changes, remember to update the
+     * hard-coded values in head.S too.
+     */
+
+    switch ( attr )
+    {
+    case MT_NORMAL_NC:
+        /*
+         * ARM ARM: Overlaying the shareability attribute (DDI
+         * 0406C.b B3-1376 to 1377)
+         *
+         * A memory region with a resultant memory type attribute of Normal,
+         * and a resultant cacheability attribute of Inner Non-cacheable,
+         * Outer Non-cacheable, must have a resultant shareability attribute
+         * of Outer Shareable, otherwise shareability is UNPREDICTABLE.
+         *
+         * On ARMv8 sharability is ignored and explicitly treated as Outer
+         * Shareable for Normal Inner Non_cacheable, Outer Non-cacheable.
+         */
+        e.pt.sh = LPAE_SH_OUTER;
+        break;
+    case MT_DEVICE_nGnRnE:
+    case MT_DEVICE_nGnRE:
+        /*
+         * Shareability is ignored for non-Normal memory, Outer is as
+         * good as anything.
+         *
+         * On ARMv8 sharability is ignored and explicitly treated as Outer
+         * Shareable for any device memory type.
+         */
+        e.pt.sh = LPAE_SH_OUTER;
+        break;
+    default:
+        e.pt.sh = LPAE_SH_INNER;  /* Xen mappings are SMP coherent */
+        break;
+    }
+
+    ASSERT(!(mfn_to_maddr(mfn) & ~PADDR_MASK));
+
+    lpae_set_mfn(e, mfn);
+
+    return e;
+}
+
+/* Map a 4k page in a fixmap entry */
+void set_fixmap(unsigned int map, mfn_t mfn, unsigned int flags)
+{
+    int res;
+
+    res = map_pages_to_xen(FIXMAP_ADDR(map), mfn, 1, flags);
+    BUG_ON(res != 0);
+}
+
+/* Remove a mapping from a fixmap entry */
+void clear_fixmap(unsigned int map)
+{
+    int res;
+
+    res = destroy_xen_mappings(FIXMAP_ADDR(map), FIXMAP_ADDR(map) + PAGE_SIZE);
+    BUG_ON(res != 0);
+}
+
+lpae_t pte_of_xenaddr(vaddr_t va)
+{
+    paddr_t ma = va + phys_offset;
+
+    return mfn_to_xen_entry(maddr_to_mfn(ma), MT_NORMAL);
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
+/* Clear a translation table and clean & invalidate the cache */
+static void clear_table(void *table)
+{
+    clear_page(table);
+    clean_and_invalidate_dcache_va_range(table, PAGE_SIZE);
+}
+
+/* Boot-time pagetable setup.
+ * Changes here may need matching changes in head.S */
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
+    /* Break up the Xen mapping into 4k pages and protect them separately. */
+    for ( i = 0; i < XEN_PT_LPAE_ENTRIES; i++ )
+    {
+        vaddr_t va = XEN_VIRT_START + (i << PAGE_SHIFT);
+
+        if ( !is_kernel(va) )
+            break;
+        pte = pte_of_xenaddr(va);
+        pte.pt.table = 1; /* 4k mappings always have this bit set */
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
+
+    pte = pte_of_xenaddr((vaddr_t)xen_xenmap);
+    pte.pt.table = 1;
+    xen_second[second_table_offset(XEN_VIRT_START)] = pte;
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
+static void clear_boot_pagetables(void)
+{
+    /*
+     * Clear the copy of the boot pagetables. Each secondary CPU
+     * rebuilds these itself (see head.S).
+     */
+    clear_table(boot_pgtable);
+#ifdef CONFIG_ARM_64
+    clear_table(boot_first);
+    clear_table(boot_first_id);
+#endif
+    clear_table(boot_second);
+    clear_table(boot_third);
+}
+
+#ifdef CONFIG_ARM_64
+int init_secondary_mm(int cpu)
+{
+    clear_boot_pagetables();
+
+    /* Set init_mm for this CPU coming up. All CPus share a single setof
+     * pagetables, but rewrite it each time for consistency with 32 bit. */
+    init_mm = (uintptr_t) xen_pgtable + phys_offset;
+    clean_dcache(init_mm);
+    return 0;
+}
+#else
+int init_secondary_mm(int cpu)
+{
+    lpae_t *first;
+
+    first = alloc_xenheap_page(); /* root == first level on 32-bit 3-level trie */
+
+    if ( !first )
+    {
+        printk("CPU%u: Unable to allocate the first page-table\n", cpu);
+        return -ENOMEM;
+    }
+
+    /* Initialise root pagetable from root of boot tables */
+    memcpy(first, cpu0_pgtable, PAGE_SIZE);
+    per_cpu(xen_pgtable, cpu) = first;
+
+    if ( !init_domheap_mappings(cpu) )
+    {
+        printk("CPU%u: Unable to prepare the domheap page-tables\n", cpu);
+        per_cpu(xen_pgtable, cpu) = NULL;
+        free_xenheap_page(first);
+        return -ENOMEM;
+    }
+
+    clear_boot_pagetables();
+
+    /* Set init_mm for this CPU coming up */
+    init_mm = __pa(first);
+    clean_dcache(init_mm);
+
+    return 0;
+}
+#endif
+
+/* MMU setup for secondary CPUS (which already have paging enabled) */
+void mm_init_secondary_cpu(void)
+{
+    xen_pt_enforce_wnx();
+}
+
+#ifdef CONFIG_ARM_32
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
+#else /* CONFIG_ARM_64 */
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
+#endif
+
+/* Map a frame table to cover physical addresses ps through pe */
+void __init setup_frametable_mappings(paddr_t ps, paddr_t pe)
+{
+    unsigned long nr_pdxs = mfn_to_pdx(mfn_add(maddr_to_mfn(pe), -1)) -
+                            mfn_to_pdx(maddr_to_mfn(ps)) + 1;
+    unsigned long frametable_size = nr_pdxs * sizeof(struct page_info);
+    mfn_t base_mfn;
+    const unsigned long mapping_size = frametable_size < MB(32) ? MB(2) : MB(32);
+    int rc;
+
+    /*
+     * The size of paddr_t should be sufficient for the complete range of
+     * physical address.
+     */
+    BUILD_BUG_ON((sizeof(paddr_t) * BITS_PER_BYTE) < PADDR_BITS);
+    BUILD_BUG_ON(sizeof(struct page_info) != PAGE_INFO_SIZE);
+
+    if ( frametable_size > FRAMETABLE_SIZE )
+        panic("The frametable cannot cover the physical region %#"PRIpaddr" - %#"PRIpaddr"\n",
+              ps, pe);
+
+    frametable_base_pdx = mfn_to_pdx(maddr_to_mfn(ps));
+    /* Round up to 2M or 32M boundary, as appropriate. */
+    frametable_size = ROUNDUP(frametable_size, mapping_size);
+    base_mfn = alloc_boot_pages(frametable_size >> PAGE_SHIFT, 32<<(20-12));
+
+    rc = map_pages_to_xen(FRAMETABLE_VIRT_START, base_mfn,
+                          frametable_size >> PAGE_SHIFT,
+                          PAGE_HYPERVISOR_RW | _PAGE_BLOCK);
+    if ( rc )
+        panic("Unable to setup the frametable mappings.\n");
+
+    memset(&frame_table[0], 0, nr_pdxs * sizeof(struct page_info));
+    memset(&frame_table[nr_pdxs], -1,
+           frametable_size - (nr_pdxs * sizeof(struct page_info)));
+
+    frametable_virt_end = FRAMETABLE_VIRT_START + (nr_pdxs * sizeof(struct page_info));
+}
+
+void *__init arch_vmap_virt_end(void)
+{
+    return (void *)(VMAP_VIRT_START + VMAP_VIRT_SIZE);
+}
+
+/*
+ * This function should only be used to remap device address ranges
+ * TODO: add a check to verify this assumption
+ */
+void *ioremap_attr(paddr_t pa, size_t len, unsigned int attributes)
+{
+    mfn_t mfn = _mfn(PFN_DOWN(pa));
+    unsigned int offs = pa & (PAGE_SIZE - 1);
+    unsigned int nr = PFN_UP(offs + len);
+    void *ptr = __vmap(&mfn, nr, 1, 1, attributes, VMAP_DEFAULT);
+
+    if ( ptr == NULL )
+        return NULL;
+
+    return ptr + offs;
+}
+
+static int create_xen_table(lpae_t *entry)
+{
+    mfn_t mfn;
+    void *p;
+    lpae_t pte;
+
+    if ( system_state != SYS_STATE_early_boot )
+    {
+        struct page_info *pg = alloc_domheap_page(NULL, 0);
+
+        if ( pg == NULL )
+            return -ENOMEM;
+
+        mfn = page_to_mfn(pg);
+    }
+    else
+        mfn = alloc_boot_pages(1, 1);
+
+    p = xen_map_table(mfn);
+    clear_page(p);
+    xen_unmap_table(p);
+
+    pte = mfn_to_xen_entry(mfn, MT_NORMAL);
+    pte.pt.table = 1;
+    write_pte(entry, pte);
+
+    return 0;
+}
+
+#define XEN_TABLE_MAP_FAILED 0
+#define XEN_TABLE_SUPER_PAGE 1
+#define XEN_TABLE_NORMAL_PAGE 2
+
+/*
+ * Take the currently mapped table, find the corresponding entry,
+ * and map the next table, if available.
+ *
+ * The read_only parameters indicates whether intermediate tables should
+ * be allocated when not present.
+ *
+ * Return values:
+ *  XEN_TABLE_MAP_FAILED: Either read_only was set and the entry
+ *  was empty, or allocating a new page failed.
+ *  XEN_TABLE_NORMAL_PAGE: next level mapped normally
+ *  XEN_TABLE_SUPER_PAGE: The next entry points to a superpage.
+ */
+static int xen_pt_next_level(bool read_only, unsigned int level,
+                             lpae_t **table, unsigned int offset)
+{
+    lpae_t *entry;
+    int ret;
+    mfn_t mfn;
+
+    entry = *table + offset;
+
+    if ( !lpae_is_valid(*entry) )
+    {
+        if ( read_only )
+            return XEN_TABLE_MAP_FAILED;
+
+        ret = create_xen_table(entry);
+        if ( ret )
+            return XEN_TABLE_MAP_FAILED;
+    }
+
+    /* The function xen_pt_next_level is never called at the 3rd level */
+    if ( lpae_is_mapping(*entry, level) )
+        return XEN_TABLE_SUPER_PAGE;
+
+    mfn = lpae_get_mfn(*entry);
+
+    xen_unmap_table(*table);
+    *table = xen_map_table(mfn);
+
+    return XEN_TABLE_NORMAL_PAGE;
+}
+
+/* Sanity check of the entry */
+static bool xen_pt_check_entry(lpae_t entry, mfn_t mfn, unsigned int level,
+                               unsigned int flags)
+{
+    /* Sanity check when modifying an entry. */
+    if ( (flags & _PAGE_PRESENT) && mfn_eq(mfn, INVALID_MFN) )
+    {
+        /* We don't allow modifying an invalid entry. */
+        if ( !lpae_is_valid(entry) )
+        {
+            mm_printk("Modifying invalid entry is not allowed.\n");
+            return false;
+        }
+
+        /* We don't allow modifying a table entry */
+        if ( !lpae_is_mapping(entry, level) )
+        {
+            mm_printk("Modifying a table entry is not allowed.\n");
+            return false;
+        }
+
+        /* We don't allow changing memory attributes. */
+        if ( entry.pt.ai != PAGE_AI_MASK(flags) )
+        {
+            mm_printk("Modifying memory attributes is not allowed (0x%x -> 0x%x).\n",
+                      entry.pt.ai, PAGE_AI_MASK(flags));
+            return false;
+        }
+
+        /* We don't allow modifying entry with contiguous bit set. */
+        if ( entry.pt.contig )
+        {
+            mm_printk("Modifying entry with contiguous bit set is not allowed.\n");
+            return false;
+        }
+    }
+    /* Sanity check when inserting a mapping */
+    else if ( flags & _PAGE_PRESENT )
+    {
+        /* We should be here with a valid MFN. */
+        ASSERT(!mfn_eq(mfn, INVALID_MFN));
+
+        /*
+         * We don't allow replacing any valid entry.
+         *
+         * Note that the function xen_pt_update() relies on this
+         * assumption and will skip the TLB flush. The function will need
+         * to be updated if the check is relaxed.
+         */
+        if ( lpae_is_valid(entry) )
+        {
+            if ( lpae_is_mapping(entry, level) )
+                mm_printk("Changing MFN for a valid entry is not allowed (%#"PRI_mfn" -> %#"PRI_mfn").\n",
+                          mfn_x(lpae_get_mfn(entry)), mfn_x(mfn));
+            else
+                mm_printk("Trying to replace a table with a mapping.\n");
+            return false;
+        }
+    }
+    /* Sanity check when removing a mapping. */
+    else if ( (flags & (_PAGE_PRESENT|_PAGE_POPULATE)) == 0 )
+    {
+        /* We should be here with an invalid MFN. */
+        ASSERT(mfn_eq(mfn, INVALID_MFN));
+
+        /* We don't allow removing a table */
+        if ( lpae_is_table(entry, level) )
+        {
+            mm_printk("Removing a table is not allowed.\n");
+            return false;
+        }
+
+        /* We don't allow removing a mapping with contiguous bit set. */
+        if ( entry.pt.contig )
+        {
+            mm_printk("Removing entry with contiguous bit set is not allowed.\n");
+            return false;
+        }
+    }
+    /* Sanity check when populating the page-table. No check so far. */
+    else
+    {
+        ASSERT(flags & _PAGE_POPULATE);
+        /* We should be here with an invalid MFN */
+        ASSERT(mfn_eq(mfn, INVALID_MFN));
+    }
+
+    return true;
+}
+
+/* Update an entry at the level @target. */
+static int xen_pt_update_entry(mfn_t root, unsigned long virt,
+                               mfn_t mfn, unsigned int target,
+                               unsigned int flags)
+{
+    int rc;
+    unsigned int level;
+    lpae_t *table;
+    /*
+     * The intermediate page tables are read-only when the MFN is not valid
+     * and we are not populating page table.
+     * This means we either modify permissions or remove an entry.
+     */
+    bool read_only = mfn_eq(mfn, INVALID_MFN) && !(flags & _PAGE_POPULATE);
+    lpae_t pte, *entry;
+
+    /* convenience aliases */
+    DECLARE_OFFSETS(offsets, (paddr_t)virt);
+
+    /* _PAGE_POPULATE and _PAGE_PRESENT should never be set together. */
+    ASSERT((flags & (_PAGE_POPULATE|_PAGE_PRESENT)) != (_PAGE_POPULATE|_PAGE_PRESENT));
+
+    table = xen_map_table(root);
+    for ( level = HYP_PT_ROOT_LEVEL; level < target; level++ )
+    {
+        rc = xen_pt_next_level(read_only, level, &table, offsets[level]);
+        if ( rc == XEN_TABLE_MAP_FAILED )
+        {
+            /*
+             * We are here because xen_pt_next_level has failed to map
+             * the intermediate page table (e.g the table does not exist
+             * and the pt is read-only). It is a valid case when
+             * removing a mapping as it may not exist in the page table.
+             * In this case, just ignore it.
+             */
+            if ( flags & (_PAGE_PRESENT|_PAGE_POPULATE) )
+            {
+                mm_printk("%s: Unable to map level %u\n", __func__, level);
+                rc = -ENOENT;
+                goto out;
+            }
+            else
+            {
+                rc = 0;
+                goto out;
+            }
+        }
+        else if ( rc != XEN_TABLE_NORMAL_PAGE )
+            break;
+    }
+
+    if ( level != target )
+    {
+        mm_printk("%s: Shattering superpage is not supported\n", __func__);
+        rc = -EOPNOTSUPP;
+        goto out;
+    }
+
+    entry = table + offsets[level];
+
+    rc = -EINVAL;
+    if ( !xen_pt_check_entry(*entry, mfn, level, flags) )
+        goto out;
+
+    /* If we are only populating page-table, then we are done. */
+    rc = 0;
+    if ( flags & _PAGE_POPULATE )
+        goto out;
+
+    /* We are removing the page */
+    if ( !(flags & _PAGE_PRESENT) )
+        memset(&pte, 0x00, sizeof(pte));
+    else
+    {
+        /* We are inserting a mapping => Create new pte. */
+        if ( !mfn_eq(mfn, INVALID_MFN) )
+        {
+            pte = mfn_to_xen_entry(mfn, PAGE_AI_MASK(flags));
+
+            /*
+             * First and second level pages set pte.pt.table = 0, but
+             * third level entries set pte.pt.table = 1.
+             */
+            pte.pt.table = (level == 3);
+        }
+        else /* We are updating the permission => Copy the current pte. */
+            pte = *entry;
+
+        /* Set permission */
+        pte.pt.ro = PAGE_RO_MASK(flags);
+        pte.pt.xn = PAGE_XN_MASK(flags);
+        /* Set contiguous bit */
+        pte.pt.contig = !!(flags & _PAGE_CONTIG);
+    }
+
+    write_pte(entry, pte);
+
+    rc = 0;
+
+out:
+    xen_unmap_table(table);
+
+    return rc;
+}
+
+/* Return the level where mapping should be done */
+static int xen_pt_mapping_level(unsigned long vfn, mfn_t mfn, unsigned long nr,
+                                unsigned int flags)
+{
+    unsigned int level;
+    unsigned long mask;
+
+    /*
+      * Don't take into account the MFN when removing mapping (i.e
+      * MFN_INVALID) to calculate the correct target order.
+      *
+      * Per the Arm Arm, `vfn` and `mfn` must be both superpage aligned.
+      * They are or-ed together and then checked against the size of
+      * each level.
+      *
+      * `left` is not included and checked separately to allow
+      * superpage mapping even if it is not properly aligned (the
+      * user may have asked to map 2MB + 4k).
+      */
+     mask = !mfn_eq(mfn, INVALID_MFN) ? mfn_x(mfn) : 0;
+     mask |= vfn;
+
+     /*
+      * Always use level 3 mapping unless the caller request block
+      * mapping.
+      */
+     if ( likely(!(flags & _PAGE_BLOCK)) )
+         level = 3;
+     else if ( !(mask & (BIT(FIRST_ORDER, UL) - 1)) &&
+               (nr >= BIT(FIRST_ORDER, UL)) )
+         level = 1;
+     else if ( !(mask & (BIT(SECOND_ORDER, UL) - 1)) &&
+               (nr >= BIT(SECOND_ORDER, UL)) )
+         level = 2;
+     else
+         level = 3;
+
+     return level;
+}
+
+#define XEN_PT_4K_NR_CONTIG 16
+
+/*
+ * Check whether the contiguous bit can be set. Return the number of
+ * contiguous entry allowed. If not allowed, return 1.
+ */
+static unsigned int xen_pt_check_contig(unsigned long vfn, mfn_t mfn,
+                                        unsigned int level, unsigned long left,
+                                        unsigned int flags)
+{
+    unsigned long nr_contig;
+
+    /*
+     * Allow the contiguous bit to set when the caller requests block
+     * mapping.
+     */
+    if ( !(flags & _PAGE_BLOCK) )
+        return 1;
+
+    /*
+     * We don't allow to remove mapping with the contiguous bit set.
+     * So shortcut the logic and directly return 1.
+     */
+    if ( mfn_eq(mfn, INVALID_MFN) )
+        return 1;
+
+    /*
+     * The number of contiguous entries varies depending on the page
+     * granularity used. The logic below assumes 4KB.
+     */
+    BUILD_BUG_ON(PAGE_SIZE != SZ_4K);
+
+    /*
+     * In order to enable the contiguous bit, we should have enough entries
+     * to map left and both the virtual and physical address should be
+     * aligned to the size of 16 translation tables entries.
+     */
+    nr_contig = BIT(XEN_PT_LEVEL_ORDER(level), UL) * XEN_PT_4K_NR_CONTIG;
+
+    if ( (left < nr_contig) || ((mfn_x(mfn) | vfn) & (nr_contig - 1)) )
+        return 1;
+
+    return XEN_PT_4K_NR_CONTIG;
+}
+
+static DEFINE_SPINLOCK(xen_pt_lock);
+
+int xen_pt_update(unsigned long virt, mfn_t mfn,
+                  /* const on purpose as it is used for TLB flush */
+                  const unsigned long nr_mfns,
+                  unsigned int flags)
+{
+    int rc = 0;
+    unsigned long vfn = virt >> PAGE_SHIFT;
+    unsigned long left = nr_mfns;
+
+    /*
+     * For arm32, page-tables are different on each CPUs. Yet, they share
+     * some common mappings. It is assumed that only common mappings
+     * will be modified with this function.
+     *
+     * XXX: Add a check.
+     */
+    const mfn_t root = maddr_to_mfn(READ_SYSREG64(TTBR0_EL2));
+
+    /*
+     * The hardware was configured to forbid mapping both writeable and
+     * executable.
+     * When modifying/creating mapping (i.e _PAGE_PRESENT is set),
+     * prevent any update if this happen.
+     */
+    if ( (flags & _PAGE_PRESENT) && !PAGE_RO_MASK(flags) &&
+         !PAGE_XN_MASK(flags) )
+    {
+        mm_printk("Mappings should not be both Writeable and Executable.\n");
+        return -EINVAL;
+    }
+
+    if ( flags & _PAGE_CONTIG )
+    {
+        mm_printk("_PAGE_CONTIG is an internal only flag.\n");
+        return -EINVAL;
+    }
+
+    if ( !IS_ALIGNED(virt, PAGE_SIZE) )
+    {
+        mm_printk("The virtual address is not aligned to the page-size.\n");
+        return -EINVAL;
+    }
+
+    spin_lock(&xen_pt_lock);
+
+    while ( left )
+    {
+        unsigned int order, level, nr_contig, new_flags;
+
+        level = xen_pt_mapping_level(vfn, mfn, left, flags);
+        order = XEN_PT_LEVEL_ORDER(level);
+
+        ASSERT(left >= BIT(order, UL));
+
+        /*
+         * Check if we can set the contiguous mapping and update the
+         * flags accordingly.
+         */
+        nr_contig = xen_pt_check_contig(vfn, mfn, level, left, flags);
+        new_flags = flags | ((nr_contig > 1) ? _PAGE_CONTIG : 0);
+
+        for ( ; nr_contig > 0; nr_contig-- )
+        {
+            rc = xen_pt_update_entry(root, vfn << PAGE_SHIFT, mfn, level,
+                                     new_flags);
+            if ( rc )
+                break;
+
+            vfn += 1U << order;
+            if ( !mfn_eq(mfn, INVALID_MFN) )
+                mfn = mfn_add(mfn, 1U << order);
+
+            left -= (1U << order);
+        }
+
+        if ( rc )
+            break;
+    }
+
+    /*
+     * The TLBs flush can be safely skipped when a mapping is inserted
+     * as we don't allow mapping replacement (see xen_pt_check_entry()).
+     *
+     * For all the other cases, the TLBs will be flushed unconditionally
+     * even if the mapping has failed. This is because we may have
+     * partially modified the PT. This will prevent any unexpected
+     * behavior afterwards.
+     */
+    if ( !((flags & _PAGE_PRESENT) && !mfn_eq(mfn, INVALID_MFN)) )
+        flush_xen_tlb_range_va(virt, PAGE_SIZE * nr_mfns);
+
+    spin_unlock(&xen_pt_lock);
+
+    return rc;
+}
+
+int populate_pt_range(unsigned long virt, unsigned long nr_mfns)
+{
+    return xen_pt_update(virt, INVALID_MFN, nr_mfns, _PAGE_POPULATE);
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
diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index e107b86b7b..8bcdbea66c 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -359,7 +359,7 @@ void start_secondary(void)
      */
     update_system_features(&current_cpu_data);
 
-    mmu_init_secondary_cpu();
+    mm_init_secondary_cpu();
 
     gic_init_secondary_cpu();
 
@@ -448,7 +448,7 @@ int __cpu_up(unsigned int cpu)
 
     printk("Bringing up CPU%d\n", cpu);
 
-    rc = init_secondary_pagetables(cpu);
+    rc = init_secondary_mm(cpu);
     if ( rc < 0 )
         return rc;
 
-- 
2.25.1


