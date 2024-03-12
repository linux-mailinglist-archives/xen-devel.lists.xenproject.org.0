Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8FA8794BD
	for <lists+xen-devel@lfdr.de>; Tue, 12 Mar 2024 14:04:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691812.1078231 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk1nS-0005IT-8g; Tue, 12 Mar 2024 13:03:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691812.1078231; Tue, 12 Mar 2024 13:03:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk1nS-0005Gj-42; Tue, 12 Mar 2024 13:03:58 +0000
Received: by outflank-mailman (input) for mailman id 691812;
 Tue, 12 Mar 2024 13:03:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=91vH=KS=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1rk1nP-0004Wa-QK
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2024 13:03:56 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id fa494afa-e070-11ee-afdd-a90da7624cb6;
 Tue, 12 Mar 2024 14:03:53 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 626761007;
 Tue, 12 Mar 2024 06:04:30 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B30EB3F762;
 Tue, 12 Mar 2024 06:03:51 -0700 (PDT)
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
X-Inumbo-ID: fa494afa-e070-11ee-afdd-a90da7624cb6
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 03/11] xen/arm: Introduce a generic way to access memory bank structures
Date: Tue, 12 Mar 2024 13:03:23 +0000
Message-Id: <20240312130331.78418-4-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240312130331.78418-1-luca.fancellu@arm.com>
References: <20240312130331.78418-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently the 'stuct meminfo' is defining a static defined array of
'struct membank' of NR_MEM_BANKS elements, some feature like
shared memory don't require such amount of memory allocation but
might want to reuse existing code to manipulate this kind of
structure that is just as 'struct meminfo' but less bulky.

For this reason introduce a generic way to access this kind of
structure using a new stucture 'struct membanks', which implements
all the fields needed by a structure related to memory banks
without the need to specify at build time the size of the
'struct membank' array.

Modify 'struct meminfo' to implement the field related to the new
introduced structure, given the change all usage of this structure
are updated in this way:
 - code accessing bootinfo.{mem,reserved_mem,acpi} field now uses
   3 new introduced static inline helpers to access the new field
   of 'struct meminfo' named 'common'.
 - code accessing 'struct kernel_info *' member 'mem' now use the
   new introduced macro 'kernel_info_get_mem(...)' to access the
   new field of 'struct meminfo' named 'common'.

Constify pointers where needed.

Suggested-by: Julien Grall <julien@xen.org>
Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 xen/arch/arm/acpi/domain_build.c        |   6 +-
 xen/arch/arm/arm32/mmu/mm.c             |  44 +++++-----
 xen/arch/arm/arm64/mmu/mm.c             |   2 +-
 xen/arch/arm/bootfdt.c                  |  27 +++---
 xen/arch/arm/dom0less-build.c           |  18 ++--
 xen/arch/arm/domain_build.c             | 106 +++++++++++++-----------
 xen/arch/arm/efi/efi-boot.h             |   8 +-
 xen/arch/arm/efi/efi-dom0.c             |  13 +--
 xen/arch/arm/include/asm/domain_build.h |   2 +-
 xen/arch/arm/include/asm/kernel.h       |   9 ++
 xen/arch/arm/include/asm/setup.h        |  40 ++++++++-
 xen/arch/arm/include/asm/static-shmem.h |   4 +-
 xen/arch/arm/kernel.c                   |  12 +--
 xen/arch/arm/setup.c                    |  58 +++++++------
 xen/arch/arm/static-memory.c            |  27 +++---
 xen/arch/arm/static-shmem.c             |  34 ++++----
 16 files changed, 243 insertions(+), 167 deletions(-)

diff --git a/xen/arch/arm/acpi/domain_build.c b/xen/arch/arm/acpi/domain_build.c
index b58389ce9e9f..ed895dd8f926 100644
--- a/xen/arch/arm/acpi/domain_build.c
+++ b/xen/arch/arm/acpi/domain_build.c
@@ -444,14 +444,14 @@ static int __init acpi_create_fadt(struct domain *d, struct membank tbl_add[])
 }
 
 static int __init estimate_acpi_efi_size(struct domain *d,
-                                         struct kernel_info *kinfo)
+                                         const struct kernel_info *kinfo)
 {
     size_t efi_size, acpi_size, madt_size;
     u64 addr;
     struct acpi_table_rsdp *rsdp_tbl;
     struct acpi_table_header *table;
 
-    efi_size = estimate_efi_size(kinfo->mem.nr_banks);
+    efi_size = estimate_efi_size(kernel_info_get_mem(kinfo)->nr_banks);
 
     acpi_size = ROUNDUP(sizeof(struct acpi_table_fadt), 8);
     acpi_size += ROUNDUP(sizeof(struct acpi_table_stao), 8);
@@ -546,7 +546,7 @@ int __init prepare_acpi(struct domain *d, struct kernel_info *kinfo)
 
     acpi_map_other_tables(d);
     acpi_create_efi_system_table(d, tbl_add);
-    acpi_create_efi_mmap_table(d, &kinfo->mem, tbl_add);
+    acpi_create_efi_mmap_table(d, kernel_info_get_mem(kinfo), tbl_add);
 
     /* Map the EFI and ACPI tables to Dom0 */
     rc = map_regions_p2mt(d,
diff --git a/xen/arch/arm/arm32/mmu/mm.c b/xen/arch/arm/arm32/mmu/mm.c
index cb441ca87c0d..e6bb5d934c16 100644
--- a/xen/arch/arm/arm32/mmu/mm.c
+++ b/xen/arch/arm/arm32/mmu/mm.c
@@ -41,6 +41,7 @@ static paddr_t __init consider_modules(paddr_t s, paddr_t e,
                                        uint32_t size, paddr_t align,
                                        int first_mod)
 {
+    const struct membanks *reserved_mem = bootinfo_get_reserved_mem();
     const struct bootmodules *mi = &bootinfo.modules;
     int i;
     int nr;
@@ -99,15 +100,14 @@ static paddr_t __init consider_modules(paddr_t s, paddr_t e,
      * possible kinds of bootmodules.
      *
      * When retrieving the corresponding reserved-memory addresses, we
-     * need to index the bootinfo.reserved_mem bank starting from 0, and
-     * only counting the reserved-memory modules. Hence, we need to use
-     * i - nr.
+     * need to index the reserved_mem bank starting from 0, and only counting
+     * the reserved-memory modules. Hence, we need to use i - nr.
      */
     nr += mi->nr_mods;
-    for ( ; i - nr < bootinfo.reserved_mem.nr_banks; i++ )
+    for ( ; i - nr < reserved_mem->nr_banks; i++ )
     {
-        paddr_t r_s = bootinfo.reserved_mem.bank[i - nr].start;
-        paddr_t r_e = r_s + bootinfo.reserved_mem.bank[i - nr].size;
+        paddr_t r_s = reserved_mem->bank[i - nr].start;
+        paddr_t r_e = r_s + reserved_mem->bank[i - nr].size;
 
         if ( s < r_e && r_s < e )
         {
@@ -128,17 +128,18 @@ static paddr_t __init consider_modules(paddr_t s, paddr_t e,
  */
 static paddr_t __init fit_xenheap_in_static_heap(uint32_t size, paddr_t align)
 {
+    const struct membanks *reserved_mem = bootinfo_get_reserved_mem();
     unsigned int i;
     paddr_t end = 0, aligned_start, aligned_end;
     paddr_t bank_start, bank_size, bank_end;
 
-    for ( i = 0 ; i < bootinfo.reserved_mem.nr_banks; i++ )
+    for ( i = 0 ; i < reserved_mem->nr_banks; i++ )
     {
-        if ( bootinfo.reserved_mem.bank[i].type != MEMBANK_STATIC_HEAP )
+        if ( reserved_mem->bank[i].type != MEMBANK_STATIC_HEAP )
             continue;
 
-        bank_start = bootinfo.reserved_mem.bank[i].start;
-        bank_size = bootinfo.reserved_mem.bank[i].size;
+        bank_start = reserved_mem->bank[i].start;
+        bank_size = reserved_mem->bank[i].size;
         bank_end = bank_start + bank_size;
 
         if ( bank_size < size )
@@ -161,13 +162,14 @@ static paddr_t __init fit_xenheap_in_static_heap(uint32_t size, paddr_t align)
 
 void __init setup_mm(void)
 {
+    const struct membanks *mem = bootinfo_get_mem();
     paddr_t ram_start, ram_end, ram_size, e, bank_start, bank_end, bank_size;
     paddr_t static_heap_end = 0, static_heap_size = 0;
     unsigned long heap_pages, xenheap_pages, domheap_pages;
     unsigned int i;
     const uint32_t ctr = READ_CP32(CTR);
 
-    if ( !bootinfo.mem.nr_banks )
+    if ( !mem->nr_banks )
         panic("No memory bank\n");
 
     /* We only supports instruction caches implementing the IVIPT extension. */
@@ -176,14 +178,14 @@ void __init setup_mm(void)
 
     init_pdx();
 
-    ram_start = bootinfo.mem.bank[0].start;
-    ram_size  = bootinfo.mem.bank[0].size;
+    ram_start = mem->bank[0].start;
+    ram_size  = mem->bank[0].size;
     ram_end   = ram_start + ram_size;
 
-    for ( i = 1; i < bootinfo.mem.nr_banks; i++ )
+    for ( i = 1; i < mem->nr_banks; i++ )
     {
-        bank_start = bootinfo.mem.bank[i].start;
-        bank_size = bootinfo.mem.bank[i].size;
+        bank_start = mem->bank[i].start;
+        bank_size = mem->bank[i].size;
         bank_end = bank_start + bank_size;
 
         ram_size  = ram_size + bank_size;
@@ -195,13 +197,15 @@ void __init setup_mm(void)
 
     if ( bootinfo.static_heap )
     {
-        for ( i = 0 ; i < bootinfo.reserved_mem.nr_banks; i++ )
+        const struct membanks *reserved_mem = bootinfo_get_reserved_mem();
+
+        for ( i = 0 ; i < reserved_mem->nr_banks; i++ )
         {
-            if ( bootinfo.reserved_mem.bank[i].type != MEMBANK_STATIC_HEAP )
+            if ( reserved_mem->bank[i].type != MEMBANK_STATIC_HEAP )
                 continue;
 
-            bank_start = bootinfo.reserved_mem.bank[i].start;
-            bank_size = bootinfo.reserved_mem.bank[i].size;
+            bank_start = reserved_mem->bank[i].start;
+            bank_size = reserved_mem->bank[i].size;
             bank_end = bank_start + bank_size;
 
             static_heap_size += bank_size;
diff --git a/xen/arch/arm/arm64/mmu/mm.c b/xen/arch/arm/arm64/mmu/mm.c
index d2651c948698..f8aaf4ac18be 100644
--- a/xen/arch/arm/arm64/mmu/mm.c
+++ b/xen/arch/arm/arm64/mmu/mm.c
@@ -194,7 +194,7 @@ static void __init setup_directmap_mappings(unsigned long base_mfn,
 
 void __init setup_mm(void)
 {
-    const struct meminfo *banks = &bootinfo.mem;
+    const struct membanks *banks = bootinfo_get_mem();
     paddr_t ram_start = INVALID_PADDR;
     paddr_t ram_end = 0;
     paddr_t ram_size = 0;
diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
index 35dbdf3384cb..ecbc80d6a112 100644
--- a/xen/arch/arm/bootfdt.c
+++ b/xen/arch/arm/bootfdt.c
@@ -107,14 +107,14 @@ void __init device_tree_get_reg(const __be32 **cell, uint32_t address_cells,
 static int __init device_tree_get_meminfo(const void *fdt, int node,
                                           const char *prop_name,
                                           u32 address_cells, u32 size_cells,
-                                          void *data, enum membank_type type)
+                                          struct membanks *mem,
+                                          enum membank_type type)
 {
     const struct fdt_property *prop;
     unsigned int i, banks;
     const __be32 *cell;
     u32 reg_cells = address_cells + size_cells;
     paddr_t start, size;
-    struct meminfo *mem = data;
 
     if ( !device_tree_node_is_available(fdt, node) )
         return 0;
@@ -133,10 +133,10 @@ static int __init device_tree_get_meminfo(const void *fdt, int node,
     cell = (const __be32 *)prop->data;
     banks = fdt32_to_cpu(prop->len) / (reg_cells * sizeof (u32));
 
-    for ( i = 0; i < banks && mem->nr_banks < NR_MEM_BANKS; i++ )
+    for ( i = 0; i < banks && mem->nr_banks < mem->max_banks; i++ )
     {
         device_tree_get_reg(&cell, address_cells, size_cells, &start, &size);
-        if ( mem == &bootinfo.reserved_mem &&
+        if ( mem == bootinfo_get_reserved_mem() &&
              check_reserved_regions_overlap(start, size) )
             return -EINVAL;
         /* Some DT may describe empty bank, ignore them */
@@ -231,10 +231,10 @@ int __init device_tree_for_each_node(const void *fdt, int node,
 static int __init process_memory_node(const void *fdt, int node,
                                       const char *name, int depth,
                                       u32 address_cells, u32 size_cells,
-                                      void *data)
+                                      struct membanks *mem)
 {
     return device_tree_get_meminfo(fdt, node, "reg", address_cells, size_cells,
-                                   data, MEMBANK_DEFAULT);
+                                   mem, MEMBANK_DEFAULT);
 }
 
 static int __init process_reserved_memory_node(const void *fdt, int node,
@@ -259,7 +259,7 @@ static int __init process_reserved_memory(const void *fdt, int node,
 {
     return device_tree_for_each_node(fdt, node,
                                      process_reserved_memory_node,
-                                     &bootinfo.reserved_mem);
+                                     bootinfo_get_reserved_mem());
 }
 
 static void __init process_multiboot_node(const void *fdt, int node,
@@ -358,7 +358,7 @@ static int __init process_chosen_node(const void *fdt, int node,
 
         rc = device_tree_get_meminfo(fdt, node, "xen,static-heap",
                                      address_cells, size_cells,
-                                     &bootinfo.reserved_mem,
+                                     bootinfo_get_reserved_mem(),
                                      MEMBANK_STATIC_HEAP);
         if ( rc )
             return rc;
@@ -420,7 +420,7 @@ static int __init process_domain_node(const void *fdt, int node,
         return 0;
 
     return device_tree_get_meminfo(fdt, node, "xen,static-mem", address_cells,
-                                   size_cells, &bootinfo.reserved_mem,
+                                   size_cells, bootinfo_get_reserved_mem(),
                                    MEMBANK_STATIC_DOMAIN);
 }
 
@@ -438,7 +438,7 @@ static int __init early_scan_node(const void *fdt,
     if ( !efi_enabled(EFI_BOOT) &&
          device_tree_node_matches(fdt, node, "memory") )
         rc = process_memory_node(fdt, node, name, depth,
-                                 address_cells, size_cells, &bootinfo.mem);
+                                 address_cells, size_cells, bootinfo_get_mem());
     else if ( depth == 1 && !dt_node_cmp(name, "reserved-memory") )
         rc = process_reserved_memory(fdt, node, name, depth,
                                      address_cells, size_cells);
@@ -459,8 +459,8 @@ static int __init early_scan_node(const void *fdt,
 
 static void __init early_print_info(void)
 {
-    struct meminfo *mi = &bootinfo.mem;
-    struct meminfo *mem_resv = &bootinfo.reserved_mem;
+    const struct membanks *mi = bootinfo_get_mem();
+    const struct membanks *mem_resv = bootinfo_get_reserved_mem();
     struct bootmodules *mods = &bootinfo.modules;
     struct bootcmdlines *cmds = &bootinfo.cmdlines;
     unsigned int i, j;
@@ -537,6 +537,7 @@ static void __init swap_memory_node(void *_a, void *_b, size_t size)
  */
 size_t __init boot_fdt_info(const void *fdt, paddr_t paddr)
 {
+    struct membanks *mem = bootinfo_get_mem();
     int ret;
 
     ret = fdt_check_header(fdt);
@@ -554,7 +555,7 @@ size_t __init boot_fdt_info(const void *fdt, paddr_t paddr)
      * bank in memory first. There is no requirement that the DT will provide
      * the banks sorted in ascending order. So sort them through.
      */
-    sort(bootinfo.mem.bank, bootinfo.mem.nr_banks, sizeof(struct membank),
+    sort(mem->bank, mem->nr_banks, sizeof(struct membank),
          cmp_memory_node, swap_memory_node);
 
     early_print_info();
diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index fb63ec6fd111..0165da6f2986 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -50,6 +50,7 @@ bool __init is_dom0less_mode(void)
 
 static void __init allocate_memory(struct domain *d, struct kernel_info *kinfo)
 {
+    struct membanks *mem = kernel_info_get_mem(kinfo);
     unsigned int i;
     paddr_t bank_size;
 
@@ -57,7 +58,7 @@ static void __init allocate_memory(struct domain *d, struct kernel_info *kinfo)
            /* Don't want format this as PRIpaddr (16 digit hex) */
            (unsigned long)(kinfo->unassigned_mem >> 20), d);
 
-    kinfo->mem.nr_banks = 0;
+    mem->nr_banks = 0;
     bank_size = MIN(GUEST_RAM0_SIZE, kinfo->unassigned_mem);
     if ( !allocate_bank_memory(d, kinfo, gaddr_to_gfn(GUEST_RAM0_BASE),
                                bank_size) )
@@ -71,15 +72,15 @@ static void __init allocate_memory(struct domain *d, struct kernel_info *kinfo)
     if ( kinfo->unassigned_mem )
         goto fail;
 
-    for( i = 0; i < kinfo->mem.nr_banks; i++ )
+    for( i = 0; i < mem->nr_banks; i++ )
     {
         printk(XENLOG_INFO "%pd BANK[%d] %#"PRIpaddr"-%#"PRIpaddr" (%ldMB)\n",
                d,
                i,
-               kinfo->mem.bank[i].start,
-               kinfo->mem.bank[i].start + kinfo->mem.bank[i].size,
+               mem->bank[i].start,
+               mem->bank[i].start + mem->bank[i].size,
                /* Don't want format this as PRIpaddr (16 digit hex) */
-               (unsigned long)(kinfo->mem.bank[i].size >> 20));
+               (unsigned long)(mem->bank[i].size >> 20));
     }
 
     return;
@@ -641,12 +642,13 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
     if ( ret )
         goto err;
 
-    ret = make_memory_node(d, kinfo->fdt, addrcells, sizecells, &kinfo->mem);
+    ret = make_memory_node(d, kinfo->fdt, addrcells, sizecells,
+                           kernel_info_get_mem(kinfo));
     if ( ret )
         goto err;
 
     ret = make_resv_memory_node(d, kinfo->fdt, addrcells, sizecells,
-                                &kinfo->shm_mem);
+                                &kinfo->shm_mem.common);
     if ( ret )
         goto err;
 
@@ -741,7 +743,7 @@ static int __init alloc_xenstore_evtchn(struct domain *d)
 static int __init construct_domU(struct domain *d,
                                  const struct dt_device_node *node)
 {
-    struct kernel_info kinfo = {};
+    struct kernel_info kinfo = KERNEL_INFO_INIT;
     const char *dom0less_enhanced;
     int rc;
     u64 mem;
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 085d88671ebc..62fcdfbdaff2 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -142,6 +142,7 @@ static bool __init insert_11_bank(struct domain *d,
                                   struct page_info *pg,
                                   unsigned int order)
 {
+    struct membanks *mem = kernel_info_get_mem(kinfo);
     unsigned int i;
     int res;
     mfn_t smfn;
@@ -158,9 +159,9 @@ static bool __init insert_11_bank(struct domain *d,
              (unsigned long)(kinfo->unassigned_mem >> 20),
              order);
 
-    if ( kinfo->mem.nr_banks > 0 &&
+    if ( mem->nr_banks > 0 &&
          size < MB(128) &&
-         start + size < kinfo->mem.bank[0].start )
+         start + size < mem->bank[0].start )
     {
         D11PRINT("Allocation below bank 0 is too small, not using\n");
         goto fail;
@@ -172,17 +173,17 @@ static bool __init insert_11_bank(struct domain *d,
 
     kinfo->unassigned_mem -= size;
 
-    if ( kinfo->mem.nr_banks == 0 )
+    if ( mem->nr_banks == 0 )
     {
-        kinfo->mem.bank[0].start = start;
-        kinfo->mem.bank[0].size = size;
-        kinfo->mem.nr_banks = 1;
+        mem->bank[0].start = start;
+        mem->bank[0].size = size;
+        mem->nr_banks = 1;
         return true;
     }
 
-    for( i = 0; i < kinfo->mem.nr_banks; i++ )
+    for( i = 0; i < mem->nr_banks; i++ )
     {
-        struct membank *bank = &kinfo->mem.bank[i];
+        struct membank *bank = &mem->bank[i];
 
         /* If possible merge new memory into the start of the bank */
         if ( bank->start == start+size )
@@ -205,24 +206,24 @@ static bool __init insert_11_bank(struct domain *d,
          * could have inserted the memory into/before we would already
          * have done so, so this must be the right place.
          */
-        if ( start + size < bank->start && kinfo->mem.nr_banks < NR_MEM_BANKS )
+        if ( start + size < bank->start && mem->nr_banks < mem->max_banks )
         {
             memmove(bank + 1, bank,
-                    sizeof(*bank) * (kinfo->mem.nr_banks - i));
-            kinfo->mem.nr_banks++;
+                    sizeof(*bank) * (mem->nr_banks - i));
+            mem->nr_banks++;
             bank->start = start;
             bank->size = size;
             return true;
         }
     }
 
-    if ( i == kinfo->mem.nr_banks && kinfo->mem.nr_banks < NR_MEM_BANKS )
+    if ( i == mem->nr_banks && mem->nr_banks < mem->max_banks )
     {
-        struct membank *bank = &kinfo->mem.bank[kinfo->mem.nr_banks];
+        struct membank *bank = &mem->bank[mem->nr_banks];
 
         bank->start = start;
         bank->size = size;
-        kinfo->mem.nr_banks++;
+        mem->nr_banks++;
         return true;
     }
 
@@ -294,6 +295,7 @@ static void __init allocate_memory_11(struct domain *d,
     const unsigned int min_low_order =
         get_order_from_bytes(min_t(paddr_t, dom0_mem, MB(128)));
     const unsigned int min_order = get_order_from_bytes(MB(4));
+    struct membanks *mem = kernel_info_get_mem(kinfo);
     struct page_info *pg;
     unsigned int order = get_allocation_size(kinfo->unassigned_mem);
     unsigned int i;
@@ -312,7 +314,7 @@ static void __init allocate_memory_11(struct domain *d,
            /* Don't want format this as PRIpaddr (16 digit hex) */
            (unsigned long)(kinfo->unassigned_mem >> 20));
 
-    kinfo->mem.nr_banks = 0;
+    mem->nr_banks = 0;
 
     /*
      * First try and allocate the largest thing we can as low as
@@ -350,7 +352,7 @@ static void __init allocate_memory_11(struct domain *d,
      * continue allocating from above the lowmem and fill in banks.
      */
     order = get_allocation_size(kinfo->unassigned_mem);
-    while ( kinfo->unassigned_mem && kinfo->mem.nr_banks < NR_MEM_BANKS )
+    while ( kinfo->unassigned_mem && mem->nr_banks < mem->max_banks )
     {
         pg = alloc_domheap_pages(d, order,
                                  lowmem ? MEMF_bits(lowmem_bitsize) : 0);
@@ -374,7 +376,7 @@ static void __init allocate_memory_11(struct domain *d,
 
         if ( !insert_11_bank(d, kinfo, pg, order) )
         {
-            if ( kinfo->mem.nr_banks == NR_MEM_BANKS )
+            if ( mem->nr_banks == mem->max_banks )
                 /* Nothing more we can do. */
                 break;
 
@@ -404,14 +406,14 @@ static void __init allocate_memory_11(struct domain *d,
         panic("Failed to allocate requested dom0 memory. %ldMB unallocated\n",
               (unsigned long)kinfo->unassigned_mem >> 20);
 
-    for( i = 0; i < kinfo->mem.nr_banks; i++ )
+    for( i = 0; i < mem->nr_banks; i++ )
     {
         printk("BANK[%d] %#"PRIpaddr"-%#"PRIpaddr" (%ldMB)\n",
                i,
-               kinfo->mem.bank[i].start,
-               kinfo->mem.bank[i].start + kinfo->mem.bank[i].size,
+               mem->bank[i].start,
+               mem->bank[i].start + mem->bank[i].size,
                /* Don't want format this as PRIpaddr (16 digit hex) */
-               (unsigned long)(kinfo->mem.bank[i].size >> 20));
+               (unsigned long)(mem->bank[i].size >> 20));
     }
 }
 
@@ -419,6 +421,7 @@ static void __init allocate_memory_11(struct domain *d,
 bool __init allocate_bank_memory(struct domain *d, struct kernel_info *kinfo,
                                  gfn_t sgfn, paddr_t tot_size)
 {
+    struct membanks *mem = kernel_info_get_mem(kinfo);
     int res;
     struct page_info *pg;
     struct membank *bank;
@@ -432,7 +435,7 @@ bool __init allocate_bank_memory(struct domain *d, struct kernel_info *kinfo,
     if ( tot_size == 0 )
         return true;
 
-    bank = &kinfo->mem.bank[kinfo->mem.nr_banks];
+    bank = &mem->bank[mem->nr_banks];
     bank->start = gfn_to_gaddr(sgfn);
     bank->size = tot_size;
 
@@ -472,7 +475,7 @@ bool __init allocate_bank_memory(struct domain *d, struct kernel_info *kinfo,
         tot_size -= (1ULL << (PAGE_SHIFT + order));
     }
 
-    kinfo->mem.nr_banks++;
+    mem->nr_banks++;
     kinfo->unassigned_mem -= bank->size;
 
     return true;
@@ -757,7 +760,7 @@ int __init domain_fdt_begin_node(void *fdt, const char *name, uint64_t unit)
 int __init make_memory_node(const struct domain *d,
                             void *fdt,
                             int addrcells, int sizecells,
-                            struct meminfo *mem)
+                            const struct membanks *mem)
 {
     unsigned int i;
     int res, reg_size = addrcells + sizecells;
@@ -817,12 +820,12 @@ int __init make_memory_node(const struct domain *d,
 static int __init add_ext_regions(unsigned long s_gfn, unsigned long e_gfn,
                                   void *data)
 {
-    struct meminfo *ext_regions = data;
+    struct membanks *ext_regions = data;
     paddr_t start, size;
     paddr_t s = pfn_to_paddr(s_gfn);
     paddr_t e = pfn_to_paddr(e_gfn);
 
-    if ( ext_regions->nr_banks >= ARRAY_SIZE(ext_regions->bank) )
+    if ( ext_regions->nr_banks >= ext_regions->max_banks )
         return 0;
 
     /*
@@ -864,9 +867,11 @@ static int __init add_ext_regions(unsigned long s_gfn, unsigned long e_gfn,
  * - grant table space
  */
 static int __init find_unallocated_memory(const struct kernel_info *kinfo,
-                                          struct meminfo *ext_regions)
+                                          struct membanks *ext_regions)
 {
-    const struct meminfo *assign_mem = &kinfo->mem;
+    const struct membanks *kinfo_mem = kernel_info_get_mem(kinfo);
+    const struct membanks *mem = bootinfo_get_mem();
+    const struct membanks *reserved_mem = bootinfo_get_reserved_mem();
     struct rangeset *unalloc_mem;
     paddr_t start, end;
     unsigned int i;
@@ -879,10 +884,10 @@ static int __init find_unallocated_memory(const struct kernel_info *kinfo,
         return -ENOMEM;
 
     /* Start with all available RAM */
-    for ( i = 0; i < bootinfo.mem.nr_banks; i++ )
+    for ( i = 0; i < mem->nr_banks; i++ )
     {
-        start = bootinfo.mem.bank[i].start;
-        end = bootinfo.mem.bank[i].start + bootinfo.mem.bank[i].size;
+        start = mem->bank[i].start;
+        end = mem->bank[i].start + mem->bank[i].size;
         res = rangeset_add_range(unalloc_mem, PFN_DOWN(start),
                                  PFN_DOWN(end - 1));
         if ( res )
@@ -894,10 +899,10 @@ static int __init find_unallocated_memory(const struct kernel_info *kinfo,
     }
 
     /* Remove RAM assigned to Dom0 */
-    for ( i = 0; i < assign_mem->nr_banks; i++ )
+    for ( i = 0; i < kinfo_mem->nr_banks; i++ )
     {
-        start = assign_mem->bank[i].start;
-        end = assign_mem->bank[i].start + assign_mem->bank[i].size;
+        start = kinfo_mem->bank[i].start;
+        end = kinfo_mem->bank[i].start + kinfo_mem->bank[i].size;
         res = rangeset_remove_range(unalloc_mem, PFN_DOWN(start),
                                     PFN_DOWN(end - 1));
         if ( res )
@@ -909,11 +914,10 @@ static int __init find_unallocated_memory(const struct kernel_info *kinfo,
     }
 
     /* Remove reserved-memory regions */
-    for ( i = 0; i < bootinfo.reserved_mem.nr_banks; i++ )
+    for ( i = 0; i < reserved_mem->nr_banks; i++ )
     {
-        start = bootinfo.reserved_mem.bank[i].start;
-        end = bootinfo.reserved_mem.bank[i].start +
-            bootinfo.reserved_mem.bank[i].size;
+        start = reserved_mem->bank[i].start;
+        end = reserved_mem->bank[i].start + reserved_mem->bank[i].size;
         res = rangeset_remove_range(unalloc_mem, PFN_DOWN(start),
                                     PFN_DOWN(end - 1));
         if ( res )
@@ -991,7 +995,7 @@ static int __init handle_pci_range(const struct dt_device_node *dev,
  * - PCI aperture
  */
 static int __init find_memory_holes(const struct kernel_info *kinfo,
-                                    struct meminfo *ext_regions)
+                                    struct membanks *ext_regions)
 {
     struct dt_device_node *np;
     struct rangeset *mem_holes;
@@ -1081,7 +1085,7 @@ out:
 }
 
 static int __init find_domU_holes(const struct kernel_info *kinfo,
-                                  struct meminfo *ext_regions)
+                                  struct membanks *ext_regions)
 {
     unsigned int i;
     uint64_t bankend;
@@ -1093,7 +1097,9 @@ static int __init find_domU_holes(const struct kernel_info *kinfo,
     {
         struct membank *ext_bank = &(ext_regions->bank[ext_regions->nr_banks]);
 
-        ext_bank->start = ROUNDUP(bankbase[i] + kinfo->mem.bank[i].size, SZ_2M);
+        ext_bank->start = ROUNDUP(bankbase[i] +
+                                  kernel_info_get_mem(kinfo)->bank[i].size,
+                                  SZ_2M);
 
         bankend = ~0ULL >> (64 - p2m_ipa_bits);
         bankend = min(bankend, bankbase[i] + banksize[i] - 1);
@@ -1121,7 +1127,7 @@ int __init make_hypervisor_node(struct domain *d,
     gic_interrupt_t intr;
     int res;
     void *fdt = kinfo->fdt;
-    struct meminfo *ext_regions = NULL;
+    struct membanks *ext_regions = NULL;
     unsigned int i, nr_ext_regions;
 
     dt_dprintk("Create hypervisor node\n");
@@ -1157,10 +1163,12 @@ int __init make_hypervisor_node(struct domain *d,
     }
     else
     {
-        ext_regions = xzalloc(struct meminfo);
+        ext_regions = (struct membanks *)xzalloc(struct meminfo);
         if ( !ext_regions )
             return -ENOMEM;
 
+        ext_regions->max_banks = NR_MEM_BANKS;
+
         if ( is_domain_direct_mapped(d) )
         {
             if ( !is_iommu_enabled(d) )
@@ -1729,6 +1737,7 @@ static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
 
     if ( node == dt_host )
     {
+        const struct membanks *reserved_mem = bootinfo_get_reserved_mem();
         int addrcells = dt_child_n_addr_cells(node);
         int sizecells = dt_child_n_size_cells(node);
 
@@ -1754,7 +1763,8 @@ static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
         if ( res )
             return res;
 
-        res = make_memory_node(d, kinfo->fdt, addrcells, sizecells, &kinfo->mem);
+        res = make_memory_node(d, kinfo->fdt, addrcells, sizecells,
+                               kernel_info_get_mem(kinfo));
         if ( res )
             return res;
 
@@ -1762,16 +1772,16 @@ static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
          * Create a second memory node to store the ranges covering
          * reserved-memory regions.
          */
-        if ( bootinfo.reserved_mem.nr_banks > 0 )
+        if ( reserved_mem->nr_banks > 0 )
         {
             res = make_memory_node(d, kinfo->fdt, addrcells, sizecells,
-                                   &bootinfo.reserved_mem);
+                                   reserved_mem);
             if ( res )
                 return res;
         }
 
         res = make_resv_memory_node(d, kinfo->fdt, addrcells, sizecells,
-                                    &kinfo->shm_mem);
+                                    &kinfo->shm_mem.common);
         if ( res )
             return res;
     }
@@ -2040,7 +2050,7 @@ int __init construct_domain(struct domain *d, struct kernel_info *kinfo)
 
 static int __init construct_dom0(struct domain *d)
 {
-    struct kernel_info kinfo = {};
+    struct kernel_info kinfo = KERNEL_INFO_INIT;
     int rc;
 
     /* Sanity! */
diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
index 0cb29f90a066..199f5260229d 100644
--- a/xen/arch/arm/efi/efi-boot.h
+++ b/xen/arch/arm/efi/efi-boot.h
@@ -157,14 +157,14 @@ static void __init *lookup_fdt_config_table(EFI_SYSTEM_TABLE *sys_table)
     return fdt;
 }
 
-static bool __init meminfo_add_bank(struct meminfo *mem,
+static bool __init meminfo_add_bank(struct membanks *mem,
                                     EFI_MEMORY_DESCRIPTOR *desc)
 {
     struct membank *bank;
     paddr_t start = desc->PhysicalStart;
     paddr_t size = desc->NumberOfPages * EFI_PAGE_SIZE;
 
-    if ( mem->nr_banks >= NR_MEM_BANKS )
+    if ( mem->nr_banks >= mem->max_banks )
         return false;
 #ifdef CONFIG_ACPI
     if ( check_reserved_regions_overlap(start, size) )
@@ -198,7 +198,7 @@ static EFI_STATUS __init efi_process_memory_map_bootinfo(EFI_MEMORY_DESCRIPTOR *
                (desc_ptr->Type == EfiBootServicesCode ||
                 desc_ptr->Type == EfiBootServicesData))) )
         {
-            if ( !meminfo_add_bank(&bootinfo.mem, desc_ptr) )
+            if ( !meminfo_add_bank(bootinfo_get_mem(), desc_ptr) )
             {
                 PrintStr(L"Warning: All " __stringify(NR_MEM_BANKS)
                           " bootinfo mem banks exhausted.\r\n");
@@ -208,7 +208,7 @@ static EFI_STATUS __init efi_process_memory_map_bootinfo(EFI_MEMORY_DESCRIPTOR *
 #ifdef CONFIG_ACPI
         else if ( desc_ptr->Type == EfiACPIReclaimMemory )
         {
-            if ( !meminfo_add_bank(&bootinfo.acpi, desc_ptr) )
+            if ( !meminfo_add_bank(bootinfo_get_acpi(), desc_ptr) )
             {
                 PrintStr(L"Error: All " __stringify(NR_MEM_BANKS)
                           " acpi meminfo mem banks exhausted.\r\n");
diff --git a/xen/arch/arm/efi/efi-dom0.c b/xen/arch/arm/efi/efi-dom0.c
index aae0f979112a..baee8ab716cb 100644
--- a/xen/arch/arm/efi/efi-dom0.c
+++ b/xen/arch/arm/efi/efi-dom0.c
@@ -44,7 +44,7 @@ size_t __init estimate_efi_size(unsigned int mem_nr_banks)
     unsigned int acpi_mem_nr_banks = 0;
 
     if ( !acpi_disabled )
-        acpi_mem_nr_banks = bootinfo.acpi.nr_banks;
+        acpi_mem_nr_banks = bootinfo_get_acpi()->nr_banks;
 
     size = ROUNDUP(est_size + ect_size + fw_vendor_size, 8);
     /* plus 1 for new created tables */
@@ -107,9 +107,10 @@ static void __init fill_efi_memory_descriptor(EFI_MEMORY_DESCRIPTOR *desc,
 }
 
 void __init acpi_create_efi_mmap_table(struct domain *d,
-                                       const struct meminfo *mem,
+                                       const struct membanks *mem,
                                        struct membank tbl_add[])
 {
+    const struct membanks *acpi = bootinfo_get_acpi();
     EFI_MEMORY_DESCRIPTOR *desc;
     unsigned int i;
     u8 *base_ptr;
@@ -122,10 +123,10 @@ void __init acpi_create_efi_mmap_table(struct domain *d,
         fill_efi_memory_descriptor(desc, EfiConventionalMemory,
                                    mem->bank[i].start, mem->bank[i].size);
 
-    for ( i = 0; i < bootinfo.acpi.nr_banks; i++, desc++ )
+    for ( i = 0; i < acpi->nr_banks; i++, desc++ )
         fill_efi_memory_descriptor(desc, EfiACPIReclaimMemory,
-                                   bootinfo.acpi.bank[i].start,
-                                   bootinfo.acpi.bank[i].size);
+                                   acpi->bank[i].start,
+                                   acpi->bank[i].size);
 
     fill_efi_memory_descriptor(desc, EfiACPIReclaimMemory,
                                d->arch.efi_acpi_gpa, d->arch.efi_acpi_len);
@@ -133,7 +134,7 @@ void __init acpi_create_efi_mmap_table(struct domain *d,
     tbl_add[TBL_MMAP].start = d->arch.efi_acpi_gpa
                               + acpi_get_table_offset(tbl_add, TBL_MMAP);
     tbl_add[TBL_MMAP].size = sizeof(EFI_MEMORY_DESCRIPTOR)
-                             * (mem->nr_banks + bootinfo.acpi.nr_banks + 1);
+                             * (mem->nr_banks + acpi->nr_banks + 1);
 }
 
 /* Create /hypervisor/uefi node for efi properties. */
diff --git a/xen/arch/arm/include/asm/domain_build.h b/xen/arch/arm/include/asm/domain_build.h
index da9e6025f37c..a6f276cc4263 100644
--- a/xen/arch/arm/include/asm/domain_build.h
+++ b/xen/arch/arm/include/asm/domain_build.h
@@ -15,7 +15,7 @@ int make_cpus_node(const struct domain *d, void *fdt);
 int make_hypervisor_node(struct domain *d, const struct kernel_info *kinfo,
                          int addrcells, int sizecells);
 int make_memory_node(const struct domain *d, void *fdt, int addrcells,
-                     int sizecells, struct meminfo *mem);
+                     int sizecells, const struct membanks *mem);
 int make_psci_node(void *fdt);
 int make_timer_node(const struct kernel_info *kinfo);
 void evtchn_allocate(struct domain *d);
diff --git a/xen/arch/arm/include/asm/kernel.h b/xen/arch/arm/include/asm/kernel.h
index 0a23e86c2d37..d28b843c01a9 100644
--- a/xen/arch/arm/include/asm/kernel.h
+++ b/xen/arch/arm/include/asm/kernel.h
@@ -78,6 +78,15 @@ struct kernel_info {
     };
 };
 
+#define kernel_info_get_mem(kinfo) \
+    (&(kinfo)->mem.common)
+
+#define KERNEL_INFO_INIT \
+{ \
+    .mem.common.max_banks = NR_MEM_BANKS, \
+    .shm_mem.common.max_banks = NR_MEM_BANKS, \
+}
+
 /*
  * Probe the kernel to detemine its type and select a loader.
  *
diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
index d15a88d2e0d1..a3e1dc8fdb6c 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -56,8 +56,14 @@ struct membank {
 #endif
 };
 
-struct meminfo {
+struct membanks {
     unsigned int nr_banks;
+    unsigned int max_banks;
+    struct membank bank[];
+};
+
+struct meminfo {
+    struct membanks common;
     struct membank bank[NR_MEM_BANKS];
 };
 
@@ -107,6 +113,19 @@ struct bootinfo {
     bool static_heap;
 };
 
+#ifdef CONFIG_ACPI
+#define BOOTINFO_ACPI_INIT .acpi.common.max_banks = NR_MEM_BANKS,
+#else
+#define BOOTINFO_ACPI_INIT
+#endif
+
+#define BOOTINFO_INIT \
+{ \
+    .mem.common.max_banks = NR_MEM_BANKS, \
+    .reserved_mem.common.max_banks = NR_MEM_BANKS, \
+    BOOTINFO_ACPI_INIT \
+}
+
 struct map_range_data
 {
     struct domain *d;
@@ -122,6 +141,23 @@ extern struct bootinfo bootinfo;
 
 extern domid_t max_init_domid;
 
+static inline struct membanks *bootinfo_get_mem(void)
+{
+    return &bootinfo.mem.common;
+}
+
+static inline struct membanks *bootinfo_get_reserved_mem(void)
+{
+    return &bootinfo.reserved_mem.common;
+}
+
+#ifdef CONFIG_ACPI
+static inline struct membanks *bootinfo_get_acpi(void)
+{
+    return &bootinfo.acpi.common;
+}
+#endif
+
 void copy_from_paddr(void *dst, paddr_t paddr, unsigned long len);
 
 size_t estimate_efi_size(unsigned int mem_nr_banks);
@@ -130,7 +166,7 @@ void acpi_create_efi_system_table(struct domain *d,
                                   struct membank tbl_add[]);
 
 void acpi_create_efi_mmap_table(struct domain *d,
-                                const struct meminfo *mem,
+                                const struct membanks *mem,
                                 struct membank tbl_add[]);
 
 int acpi_make_efi_nodes(void *fdt, struct membank tbl_add[]);
diff --git a/xen/arch/arm/include/asm/static-shmem.h b/xen/arch/arm/include/asm/static-shmem.h
index 1536ff18b895..cc6b414ed79b 100644
--- a/xen/arch/arm/include/asm/static-shmem.h
+++ b/xen/arch/arm/include/asm/static-shmem.h
@@ -8,7 +8,7 @@
 #ifdef CONFIG_STATIC_SHM
 
 int make_resv_memory_node(const struct domain *d, void *fdt, int addrcells,
-                          int sizecells, const struct meminfo *mem);
+                          int sizecells, const struct membanks *mem);
 
 int process_shm(struct domain *d, struct kernel_info *kinfo,
                 const struct dt_device_node *node);
@@ -28,7 +28,7 @@ int process_shm_node(const void *fdt, int node, uint32_t address_cells,
 
 static inline int make_resv_memory_node(const struct domain *d, void *fdt,
                                         int addrcells, int sizecells,
-                                        const struct meminfo *mem)
+                                        const struct membanks *mem)
 {
     return 0;
 }
diff --git a/xen/arch/arm/kernel.c b/xen/arch/arm/kernel.c
index bc3e5bd6f940..674388fa11a2 100644
--- a/xen/arch/arm/kernel.c
+++ b/xen/arch/arm/kernel.c
@@ -45,13 +45,14 @@ static void __init place_modules(struct kernel_info *info,
 {
     /* Align DTB and initrd size to 2Mb. Linux only requires 4 byte alignment */
     const struct bootmodule *mod = info->initrd_bootmodule;
+    const struct membanks *mem = kernel_info_get_mem(info);
     const paddr_t initrd_len = ROUNDUP(mod ? mod->size : 0, MB(2));
     const paddr_t dtb_len = ROUNDUP(fdt_totalsize(info->fdt), MB(2));
     const paddr_t modsize = initrd_len + dtb_len;
 
     /* Convenient */
-    const paddr_t rambase = info->mem.bank[0].start;
-    const paddr_t ramsize = info->mem.bank[0].size;
+    const paddr_t rambase = mem->bank[0].start;
+    const paddr_t ramsize = mem->bank[0].size;
     const paddr_t ramend = rambase + ramsize;
     const paddr_t kernsize = ROUNDUP(kernend, MB(2)) - kernbase;
     const paddr_t ram128mb = rambase + MB(128);
@@ -96,11 +97,12 @@ static void __init place_modules(struct kernel_info *info,
 
 static paddr_t __init kernel_zimage_place(struct kernel_info *info)
 {
+    const struct membanks *mem = kernel_info_get_mem(info);
     paddr_t load_addr;
 
 #ifdef CONFIG_ARM_64
     if ( (info->type == DOMAIN_64BIT) && (info->zimage.start == 0) )
-        return info->mem.bank[0].start + info->zimage.text_offset;
+        return mem->bank[0].start + info->zimage.text_offset;
 #endif
 
     /*
@@ -113,8 +115,8 @@ static paddr_t __init kernel_zimage_place(struct kernel_info *info)
     {
         paddr_t load_end;
 
-        load_end = info->mem.bank[0].start + info->mem.bank[0].size;
-        load_end = MIN(info->mem.bank[0].start + MB(128), load_end);
+        load_end = mem->bank[0].start + mem->bank[0].size;
+        load_end = MIN(mem->bank[0].start + MB(128), load_end);
 
         load_addr = load_end - info->zimage.len;
         /* Align to 2MB */
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 424744ad5e1a..02bd27eb0c69 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -48,7 +48,7 @@
 #include <xsm/xsm.h>
 #include <asm/acpi.h>
 
-struct bootinfo __initdata bootinfo;
+struct bootinfo __initdata bootinfo = BOOTINFO_INIT;
 
 /*
  * Sanitized version of cpuinfo containing only features available on all
@@ -207,6 +207,7 @@ static void __init dt_unreserved_regions(paddr_t s, paddr_t e,
                                          void (*cb)(paddr_t ps, paddr_t pe),
                                          unsigned int first)
 {
+    const struct membanks *reserved_mem = bootinfo_get_reserved_mem();
     unsigned int i, nr;
     int rc;
 
@@ -240,14 +241,14 @@ static void __init dt_unreserved_regions(paddr_t s, paddr_t e,
      * kinds.
      *
      * When retrieving the corresponding reserved-memory addresses
-     * below, we need to index the bootinfo.reserved_mem bank starting
+     * below, we need to index the reserved_mem->bank starting
      * from 0, and only counting the reserved-memory modules. Hence,
      * we need to use i - nr.
      */
-    for ( ; i - nr < bootinfo.reserved_mem.nr_banks; i++ )
+    for ( ; i - nr < reserved_mem->nr_banks; i++ )
     {
-        paddr_t r_s = bootinfo.reserved_mem.bank[i - nr].start;
-        paddr_t r_e = r_s + bootinfo.reserved_mem.bank[i - nr].size;
+        paddr_t r_s = reserved_mem->bank[i - nr].start;
+        paddr_t r_e = r_s + reserved_mem->bank[i - nr].size;
 
         if ( s < r_e && r_s < e )
         {
@@ -264,18 +265,18 @@ static void __init dt_unreserved_regions(paddr_t s, paddr_t e,
  * TODO: '*_end' could be 0 if the bank/region is at the end of the physical
  * address space. This is for now not handled as it requires more rework.
  */
-static bool __init meminfo_overlap_check(struct meminfo *meminfo,
+static bool __init meminfo_overlap_check(const struct membanks *mem,
                                          paddr_t region_start,
                                          paddr_t region_size)
 {
     paddr_t bank_start = INVALID_PADDR, bank_end = 0;
     paddr_t region_end = region_start + region_size;
-    unsigned int i, bank_num = meminfo->nr_banks;
+    unsigned int i, bank_num = mem->nr_banks;
 
     for ( i = 0; i < bank_num; i++ )
     {
-        bank_start = meminfo->bank[i].start;
-        bank_end = bank_start + meminfo->bank[i].size;
+        bank_start = mem->bank[i].start;
+        bank_end = bank_start + mem->bank[i].size;
 
         if ( region_end <= bank_start || region_start >= bank_end )
             continue;
@@ -339,8 +340,11 @@ void __init fw_unreserved_regions(paddr_t s, paddr_t e,
 bool __init check_reserved_regions_overlap(paddr_t region_start,
                                            paddr_t region_size)
 {
-    /* Check if input region is overlapping with bootinfo.reserved_mem banks */
-    if ( meminfo_overlap_check(&bootinfo.reserved_mem,
+    /*
+     * Check if input region is overlapping with bootinfo_get_reserved_mem()
+     * banks
+     */
+    if ( meminfo_overlap_check(bootinfo_get_reserved_mem(),
                                region_start, region_size) )
         return true;
 
@@ -351,7 +355,7 @@ bool __init check_reserved_regions_overlap(paddr_t region_start,
 
 #ifdef CONFIG_ACPI
     /* Check if input region is overlapping with ACPI EfiACPIReclaimMemory */
-    if ( meminfo_overlap_check(&bootinfo.acpi, region_start, region_size) )
+    if ( meminfo_overlap_check(bootinfo_get_acpi(), region_start, region_size) )
         return true;
 #endif
 
@@ -580,6 +584,7 @@ static paddr_t __init next_module(paddr_t s, paddr_t *end)
 
 void __init init_pdx(void)
 {
+    const struct membanks *mem = bootinfo_get_mem();
     paddr_t bank_start, bank_size, bank_end;
 
     /*
@@ -592,18 +597,18 @@ void __init init_pdx(void)
     uint64_t mask = pdx_init_mask(0x0);
     int bank;
 
-    for ( bank = 0 ; bank < bootinfo.mem.nr_banks; bank++ )
+    for ( bank = 0 ; bank < mem->nr_banks; bank++ )
     {
-        bank_start = bootinfo.mem.bank[bank].start;
-        bank_size = bootinfo.mem.bank[bank].size;
+        bank_start = mem->bank[bank].start;
+        bank_size = mem->bank[bank].size;
 
         mask |= bank_start | pdx_region_mask(bank_start, bank_size);
     }
 
-    for ( bank = 0 ; bank < bootinfo.mem.nr_banks; bank++ )
+    for ( bank = 0 ; bank < mem->nr_banks; bank++ )
     {
-        bank_start = bootinfo.mem.bank[bank].start;
-        bank_size = bootinfo.mem.bank[bank].size;
+        bank_start = mem->bank[bank].start;
+        bank_size = mem->bank[bank].size;
 
         if (~mask & pdx_region_mask(bank_start, bank_size))
             mask = 0;
@@ -611,10 +616,10 @@ void __init init_pdx(void)
 
     pfn_pdx_hole_setup(mask >> PAGE_SHIFT);
 
-    for ( bank = 0 ; bank < bootinfo.mem.nr_banks; bank++ )
+    for ( bank = 0 ; bank < mem->nr_banks; bank++ )
     {
-        bank_start = bootinfo.mem.bank[bank].start;
-        bank_size = bootinfo.mem.bank[bank].size;
+        bank_start = mem->bank[bank].start;
+        bank_size = mem->bank[bank].size;
         bank_end = bank_start + bank_size;
 
         set_pdx_range(paddr_to_pfn(bank_start),
@@ -636,18 +641,19 @@ void __init init_pdx(void)
 void __init populate_boot_allocator(void)
 {
     unsigned int i;
-    const struct meminfo *banks = &bootinfo.mem;
+    const struct membanks *banks = bootinfo_get_mem();
+    const struct membanks *reserved_mem = bootinfo_get_reserved_mem();
     paddr_t s, e;
 
     if ( bootinfo.static_heap )
     {
-        for ( i = 0 ; i < bootinfo.reserved_mem.nr_banks; i++ )
+        for ( i = 0 ; i < reserved_mem->nr_banks; i++ )
         {
-            if ( bootinfo.reserved_mem.bank[i].type != MEMBANK_STATIC_HEAP )
+            if ( reserved_mem->bank[i].type != MEMBANK_STATIC_HEAP )
                 continue;
 
-            s = bootinfo.reserved_mem.bank[i].start;
-            e = s + bootinfo.reserved_mem.bank[i].size;
+            s = reserved_mem->bank[i].start;
+            e = s + reserved_mem->bank[i].size;
 #ifdef CONFIG_ARM_32
             /* Avoid the xenheap, note that the xenheap cannot across a bank */
             if ( s <= mfn_to_maddr(directmap_mfn_start) &&
diff --git a/xen/arch/arm/static-memory.c b/xen/arch/arm/static-memory.c
index cffbab7241b7..34bd12696a53 100644
--- a/xen/arch/arm/static-memory.c
+++ b/xen/arch/arm/static-memory.c
@@ -85,6 +85,7 @@ static int __init parse_static_mem_prop(const struct dt_device_node *node,
 void __init allocate_static_memory(struct domain *d, struct kernel_info *kinfo,
                                    const struct dt_device_node *node)
 {
+    struct membanks *mem = kernel_info_get_mem(kinfo);
     u32 addr_cells, size_cells, reg_cells;
     unsigned int nr_banks, gbank, bank = 0;
     const uint64_t rambase[] = GUEST_RAM_BANK_BASES;
@@ -106,7 +107,7 @@ void __init allocate_static_memory(struct domain *d, struct kernel_info *kinfo,
      */
     gbank = 0;
     gsize = ramsize[gbank];
-    kinfo->mem.bank[gbank].start = rambase[gbank];
+    mem->bank[gbank].start = rambase[gbank];
     nr_banks = length / (reg_cells * sizeof (u32));
 
     for ( ; bank < nr_banks; bank++ )
@@ -122,7 +123,7 @@ void __init allocate_static_memory(struct domain *d, struct kernel_info *kinfo,
         while ( 1 )
         {
             /* Map as much as possible the static range to the guest bank */
-            if ( !append_static_memory_to_bank(d, &kinfo->mem.bank[gbank], smfn,
+            if ( !append_static_memory_to_bank(d, &mem->bank[gbank], smfn,
                                                min(psize, gsize)) )
                 goto fail;
 
@@ -153,14 +154,14 @@ void __init allocate_static_memory(struct domain *d, struct kernel_info *kinfo,
                 /* Update to the next guest bank. */
                 gbank++;
                 gsize = ramsize[gbank];
-                kinfo->mem.bank[gbank].start = rambase[gbank];
+                mem->bank[gbank].start = rambase[gbank];
             }
         }
 
         tot_size += psize;
     }
 
-    kinfo->mem.nr_banks = ++gbank;
+    mem->nr_banks = ++gbank;
 
     kinfo->unassigned_mem -= tot_size;
     /*
@@ -190,6 +191,7 @@ void __init allocate_static_memory(struct domain *d, struct kernel_info *kinfo,
 void __init assign_static_memory_11(struct domain *d, struct kernel_info *kinfo,
                                     const struct dt_device_node *node)
 {
+    struct membanks *mem = kernel_info_get_mem(kinfo);
     u32 addr_cells, size_cells, reg_cells;
     unsigned int nr_banks, bank = 0;
     const __be32 *cell;
@@ -206,7 +208,7 @@ void __init assign_static_memory_11(struct domain *d, struct kernel_info *kinfo,
     reg_cells = addr_cells + size_cells;
     nr_banks = length / (reg_cells * sizeof(u32));
 
-    if ( nr_banks > NR_MEM_BANKS )
+    if ( nr_banks > mem->max_banks )
     {
         printk(XENLOG_ERR
                "%pd: exceed max number of supported guest memory banks.\n", d);
@@ -224,15 +226,15 @@ void __init assign_static_memory_11(struct domain *d, struct kernel_info *kinfo,
                d, bank, pbase, pbase + psize);
 
         /* One guest memory bank is matched with one physical memory bank. */
-        kinfo->mem.bank[bank].start = pbase;
-        if ( !append_static_memory_to_bank(d, &kinfo->mem.bank[bank],
+        mem->bank[bank].start = pbase;
+        if ( !append_static_memory_to_bank(d, &mem->bank[bank],
                                            smfn, psize) )
             goto fail;
 
         kinfo->unassigned_mem -= psize;
     }
 
-    kinfo->mem.nr_banks = nr_banks;
+    mem->nr_banks = nr_banks;
 
     /*
      * The property 'memory' should match the amount of memory given to
@@ -257,14 +259,15 @@ void __init assign_static_memory_11(struct domain *d, struct kernel_info *kinfo,
 /* Static memory initialization */
 void __init init_staticmem_pages(void)
 {
+    const struct membanks *reserved_mem = bootinfo_get_reserved_mem();
     unsigned int bank;
 
-    for ( bank = 0 ; bank < bootinfo.reserved_mem.nr_banks; bank++ )
+    for ( bank = 0 ; bank < reserved_mem->nr_banks; bank++ )
     {
-        if ( bootinfo.reserved_mem.bank[bank].type == MEMBANK_STATIC_DOMAIN )
+        if ( reserved_mem->bank[bank].type == MEMBANK_STATIC_DOMAIN )
         {
-            mfn_t bank_start = _mfn(PFN_UP(bootinfo.reserved_mem.bank[bank].start));
-            unsigned long bank_pages = PFN_DOWN(bootinfo.reserved_mem.bank[bank].size);
+            mfn_t bank_start = _mfn(PFN_UP(reserved_mem->bank[bank].start));
+            unsigned long bank_pages = PFN_DOWN(reserved_mem->bank[bank].size);
             mfn_t bank_end = mfn_add(bank_start, bank_pages);
 
             if ( mfn_x(bank_end) <= mfn_x(bank_start) )
diff --git a/xen/arch/arm/static-shmem.c b/xen/arch/arm/static-shmem.c
index 40a0e860c79d..fdc3bccde402 100644
--- a/xen/arch/arm/static-shmem.c
+++ b/xen/arch/arm/static-shmem.c
@@ -10,22 +10,23 @@ static int __init acquire_nr_borrower_domain(struct domain *d,
                                              paddr_t pbase, paddr_t psize,
                                              unsigned long *nr_borrowers)
 {
+    const struct membanks *reserved_mem = bootinfo_get_reserved_mem();
     unsigned int bank;
 
     /* Iterate reserved memory to find requested shm bank. */
-    for ( bank = 0 ; bank < bootinfo.reserved_mem.nr_banks; bank++ )
+    for ( bank = 0 ; bank < reserved_mem->nr_banks; bank++ )
     {
-        paddr_t bank_start = bootinfo.reserved_mem.bank[bank].start;
-        paddr_t bank_size = bootinfo.reserved_mem.bank[bank].size;
+        paddr_t bank_start = reserved_mem->bank[bank].start;
+        paddr_t bank_size = reserved_mem->bank[bank].size;
 
         if ( (pbase == bank_start) && (psize == bank_size) )
             break;
     }
 
-    if ( bank == bootinfo.reserved_mem.nr_banks )
+    if ( bank == reserved_mem->nr_banks )
         return -ENOENT;
 
-    *nr_borrowers = bootinfo.reserved_mem.bank[bank].nr_shm_borrowers;
+    *nr_borrowers = reserved_mem->bank[bank].nr_shm_borrowers;
 
     return 0;
 }
@@ -157,17 +158,17 @@ static int __init assign_shared_memory(struct domain *d,
     return ret;
 }
 
-static int __init append_shm_bank_to_domain(struct kernel_info *kinfo,
+static int __init append_shm_bank_to_domain(struct membanks *shm_mem,
                                             paddr_t start, paddr_t size,
                                             const char *shm_id)
 {
-    if ( kinfo->shm_mem.nr_banks >= NR_MEM_BANKS )
+    if ( shm_mem->nr_banks >= shm_mem->max_banks )
         return -ENOMEM;
 
-    kinfo->shm_mem.bank[kinfo->shm_mem.nr_banks].start = start;
-    kinfo->shm_mem.bank[kinfo->shm_mem.nr_banks].size = size;
-    safe_strcpy(kinfo->shm_mem.bank[kinfo->shm_mem.nr_banks].shm_id, shm_id);
-    kinfo->shm_mem.nr_banks++;
+    shm_mem->bank[shm_mem->nr_banks].start = start;
+    shm_mem->bank[shm_mem->nr_banks].size = size;
+    safe_strcpy(shm_mem->bank[shm_mem->nr_banks].shm_id, shm_id);
+    shm_mem->nr_banks++;
 
     return 0;
 }
@@ -269,7 +270,8 @@ int __init process_shm(struct domain *d, struct kernel_info *kinfo,
          * Record static shared memory region info for later setting
          * up shm-node in guest device tree.
          */
-        ret = append_shm_bank_to_domain(kinfo, gbase, psize, shm_id);
+        ret = append_shm_bank_to_domain(&kinfo->shm_mem.common, gbase, psize,
+                                        shm_id);
         if ( ret )
             return ret;
     }
@@ -279,7 +281,7 @@ int __init process_shm(struct domain *d, struct kernel_info *kinfo,
 
 static int __init make_shm_memory_node(const struct domain *d, void *fdt,
                                        int addrcells, int sizecells,
-                                       const struct meminfo *mem)
+                                       const struct membanks *mem)
 {
     unsigned int i = 0;
     int res = 0;
@@ -350,7 +352,7 @@ int __init process_shm_node(const void *fdt, int node, uint32_t address_cells,
     const struct fdt_property *prop, *prop_id, *prop_role;
     const __be32 *cell;
     paddr_t paddr, gaddr, size, end;
-    struct meminfo *mem = &bootinfo.reserved_mem;
+    struct membanks *mem = bootinfo_get_reserved_mem();
     unsigned int i;
     int len;
     bool owner = false;
@@ -460,7 +462,7 @@ int __init process_shm_node(const void *fdt, int node, uint32_t address_cells,
 
     if ( i == mem->nr_banks )
     {
-        if ( i < NR_MEM_BANKS )
+        if (i < mem->max_banks)
         {
             if ( check_reserved_regions_overlap(paddr, size) )
                 return -EINVAL;
@@ -490,7 +492,7 @@ int __init process_shm_node(const void *fdt, int node, uint32_t address_cells,
 
 int __init make_resv_memory_node(const struct domain *d, void *fdt,
                                  int addrcells, int sizecells,
-                                 const struct meminfo *mem)
+                                 const struct membanks *mem)
 {
     int res = 0;
     /* Placeholder for reserved-memory\0 */
-- 
2.34.1


