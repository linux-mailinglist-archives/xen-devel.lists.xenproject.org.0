Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C8076A7A8
	for <lists+xen-devel@lfdr.de>; Tue,  1 Aug 2023 05:49:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573593.898454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQgNW-0004Dy-4V; Tue, 01 Aug 2023 03:48:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573593.898454; Tue, 01 Aug 2023 03:48:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQgNW-0004By-0n; Tue, 01 Aug 2023 03:48:58 +0000
Received: by outflank-mailman (input) for mailman id 573593;
 Tue, 01 Aug 2023 03:48:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qUf/=DS=arm.com=Henry.Wang@srs-se1.protection.inumbo.net>)
 id 1qQgJs-00076X-PJ
 for xen-devel@lists.xenproject.org; Tue, 01 Aug 2023 03:45:12 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id d010a705-301d-11ee-8613-37d641c3527e;
 Tue, 01 Aug 2023 05:45:10 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C7FADD75;
 Mon, 31 Jul 2023 20:45:52 -0700 (PDT)
Received: from a015966.shanghai.arm.com (a015966.shanghai.arm.com
 [10.169.190.5])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 79AA93F59C;
 Mon, 31 Jul 2023 20:45:06 -0700 (PDT)
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
X-Inumbo-ID: d010a705-301d-11ee-8613-37d641c3527e
From: Henry Wang <Henry.Wang@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Penny Zheng <penny.zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Wei Chen <wei.chen@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Henry Wang <Henry.Wang@arm.com>
Subject: [PATCH v4 09/13] xen/arm: mm: Use generic variable/function names for extendability
Date: Tue,  1 Aug 2023 11:44:15 +0800
Message-Id: <20230801034419.2047541-10-Henry.Wang@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230801034419.2047541-1-Henry.Wang@arm.com>
References: <20230801034419.2047541-1-Henry.Wang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Penny Zheng <penny.zheng@arm.com>

As preparation for MPU support, which will use some variables/functions
for both MMU and MPU system, We rename the affected variable/function
to more generic names:
- init_ttbr -> init_mm,
- mmu_init_secondary_cpu() -> mm_init_secondary_cpu()
- init_secondary_pagetables() -> init_secondary_mm()
- Add a wrapper update_mm_mapping() for MMU system's
  update_identity_mapping()

Modify the related in-code comment to reflect above changes, take the
opportunity to fix the incorrect coding style of the in-code comments.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Signed-off-by: Henry Wang <Henry.Wang@arm.com>
---
v4:
- Extract the renaming part from the original patch:
  "[v3,13/52] xen/mmu: extract mmu-specific codes from mm.c/mm.h"
---
 xen/arch/arm/arm32/head.S           |  4 ++--
 xen/arch/arm/arm64/mmu/head.S       |  2 +-
 xen/arch/arm/arm64/mmu/mm.c         | 11 ++++++++---
 xen/arch/arm/arm64/smpboot.c        |  6 +++---
 xen/arch/arm/include/asm/arm64/mm.h |  7 ++++---
 xen/arch/arm/include/asm/mm.h       | 10 ++++++----
 xen/arch/arm/mmu/mm.c               | 20 ++++++++++----------
 xen/arch/arm/smpboot.c              |  4 ++--
 8 files changed, 36 insertions(+), 28 deletions(-)

diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
index 33b038e7e0..03ab68578a 100644
--- a/xen/arch/arm/arm32/head.S
+++ b/xen/arch/arm/arm32/head.S
@@ -238,11 +238,11 @@ GLOBAL(init_secondary)
 secondary_switched:
         /*
          * Non-boot CPUs need to move on to the proper pagetables, which were
-         * setup in init_secondary_pagetables.
+         * setup in init_secondary_mm.
          *
          * XXX: This is not compliant with the Arm Arm.
          */
-        mov_w r4, init_ttbr          /* VA of HTTBR value stashed by CPU 0 */
+        mov_w r4, init_mm            /* VA of HTTBR value stashed by CPU 0 */
         ldrd  r4, r5, [r4]           /* Actual value */
         dsb
         mcrr  CP64(r4, r5, HTTBR)
diff --git a/xen/arch/arm/arm64/mmu/head.S b/xen/arch/arm/arm64/mmu/head.S
index 6bd94c3a45..6e638ff082 100644
--- a/xen/arch/arm/arm64/mmu/head.S
+++ b/xen/arch/arm/arm64/mmu/head.S
@@ -303,7 +303,7 @@ ENDPROC(enable_mmu)
 ENTRY(enable_secondary_cpu_mm)
         mov   x5, lr
 
-        load_paddr x0, init_ttbr
+        load_paddr x0, init_mm
         ldr   x0, [x0]
 
         bl    enable_mmu
diff --git a/xen/arch/arm/arm64/mmu/mm.c b/xen/arch/arm/arm64/mmu/mm.c
index 78b7c7eb00..ed0fc5ff7b 100644
--- a/xen/arch/arm/arm64/mmu/mm.c
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
@@ -131,7 +136,7 @@ void __init switch_ttbr(uint64_t ttbr)
     lpae_t pte;
 
     /* Enable the identity mapping in the boot page tables */
-    update_identity_mapping(true);
+    update_mm_mapping(true);
 
     /* Enable the identity mapping in the runtime page tables */
     pte = pte_of_xenaddr((vaddr_t)switch_ttbr_id);
@@ -148,7 +153,7 @@ void __init switch_ttbr(uint64_t ttbr)
      * Note it is not necessary to disable it in the boot page tables
      * because they are not going to be used by this CPU anymore.
      */
-    update_identity_mapping(false);
+    update_mm_mapping(false);
 }
 
 /*
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
index e0bd23a6ed..7a389c4b21 100644
--- a/xen/arch/arm/include/asm/arm64/mm.h
+++ b/xen/arch/arm/include/asm/arm64/mm.h
@@ -15,13 +15,14 @@ static inline bool arch_mfns_in_directmap(unsigned long mfn, unsigned long nr)
 void arch_setup_page_tables(void);
 
 /*
- * Enable/disable the identity mapping in the live page-tables (i.e.
- * the one pointed by TTBR_EL2).
+ * In MMU system, enable/disable the identity mapping in the live
+ * page-tables (i.e. the one pointed by TTBR_EL2) through
+ * update_identity_mapping().
  *
  * Note that nested call (e.g. enable=true, enable=true) is not
  * supported.
  */
-void update_identity_mapping(bool enable);
+void update_mm_mapping(bool enable);
 
 #endif /* __ARM_ARM64_MM_H__ */
 
diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index e70ce4dc61..2b61a89b9f 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -205,11 +205,13 @@ extern void setup_pagetables(unsigned long boot_phys_offset);
 extern void *early_fdt_map(paddr_t fdt_paddr);
 /* Remove early mappings */
 extern void remove_early_mappings(void);
-/* Allocate and initialise pagetables for a secondary CPU. Sets init_ttbr to the
- * new page table */
-extern int init_secondary_pagetables(int cpu);
+/*
+ * Allocate and initialise pagetables for a secondary CPU. Sets init_mm to the
+ * new page table
+ */
+extern int init_secondary_mm(int cpu);
 /* Switch secondary CPUS to its own pagetables and finalise MMU setup */
-extern void mmu_init_secondary_cpu(void);
+extern void mm_init_secondary_cpu(void);
 /* Map a frame table to cover physical addresses ps through pe */
 extern void setup_frametable_mappings(paddr_t ps, paddr_t pe);
 /* map a physical range in virtual memory */
diff --git a/xen/arch/arm/mmu/mm.c b/xen/arch/arm/mmu/mm.c
index 1d6267e6c5..7486c35ec0 100644
--- a/xen/arch/arm/mmu/mm.c
+++ b/xen/arch/arm/mmu/mm.c
@@ -106,7 +106,7 @@ DEFINE_BOOT_PAGE_TABLE(xen_fixmap);
 static DEFINE_PAGE_TABLES(xen_xenmap, XEN_NR_ENTRIES(2));
 
 /* Non-boot CPUs use this to find the correct pagetables. */
-uint64_t init_ttbr;
+uint64_t init_mm;
 
 static paddr_t phys_offset;
 
@@ -492,18 +492,18 @@ static void clear_boot_pagetables(void)
 }
 
 #ifdef CONFIG_ARM_64
-int init_secondary_pagetables(int cpu)
+int init_secondary_mm(int cpu)
 {
     clear_boot_pagetables();
 
-    /* Set init_ttbr for this CPU coming up. All CPus share a single setof
+    /* Set init_mm for this CPU coming up. All CPus share a single setof
      * pagetables, but rewrite it each time for consistency with 32 bit. */
-    init_ttbr = (uintptr_t) xen_pgtable + phys_offset;
-    clean_dcache(init_ttbr);
+    init_mm = (uintptr_t) xen_pgtable + phys_offset;
+    clean_dcache(init_mm);
     return 0;
 }
 #else
-int init_secondary_pagetables(int cpu)
+int init_secondary_mm(int cpu)
 {
     lpae_t *first;
 
@@ -529,16 +529,16 @@ int init_secondary_pagetables(int cpu)
 
     clear_boot_pagetables();
 
-    /* Set init_ttbr for this CPU coming up */
-    init_ttbr = __pa(first);
-    clean_dcache(init_ttbr);
+    /* Set init_mm for this CPU coming up */
+    init_mm = __pa(first);
+    clean_dcache(init_mm);
 
     return 0;
 }
 #endif
 
 /* MMU setup for secondary CPUS (which already have paging enabled) */
-void mmu_init_secondary_cpu(void)
+void mm_init_secondary_cpu(void)
 {
     xen_pt_enforce_wnx();
 }
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


