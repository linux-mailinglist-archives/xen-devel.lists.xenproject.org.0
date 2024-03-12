Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D47C68794C2
	for <lists+xen-devel@lfdr.de>; Tue, 12 Mar 2024 14:04:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.691817.1078281 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk1nY-0006gV-1X; Tue, 12 Mar 2024 13:04:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 691817.1078281; Tue, 12 Mar 2024 13:04:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rk1nX-0006cL-Qc; Tue, 12 Mar 2024 13:04:03 +0000
Received: by outflank-mailman (input) for mailman id 691817;
 Tue, 12 Mar 2024 13:04:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=91vH=KS=arm.com=luca.fancellu@srs-se1.protection.inumbo.net>)
 id 1rk1nW-0004WU-5c
 for xen-devel@lists.xenproject.org; Tue, 12 Mar 2024 13:04:02 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id fe100bcb-e070-11ee-a1ee-f123f15fe8a2;
 Tue, 12 Mar 2024 14:03:59 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DED511570;
 Tue, 12 Mar 2024 06:04:36 -0700 (PDT)
Received: from e125770.cambridge.arm.com (e125770.arm.com [10.1.199.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9A77D3F762;
 Tue, 12 Mar 2024 06:03:58 -0700 (PDT)
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
X-Inumbo-ID: fe100bcb-e070-11ee-a1ee-f123f15fe8a2
From: Luca Fancellu <luca.fancellu@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 08/11] xen/arm: Reduce struct membank size on static shared memory
Date: Tue, 12 Mar 2024 13:03:28 +0000
Message-Id: <20240312130331.78418-9-luca.fancellu@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240312130331.78418-1-luca.fancellu@arm.com>
References: <20240312130331.78418-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently the memory footprint of the static shared memory feature
is impacting all the struct meminfo instances with memory space
that is not going to be used.

To solve this issue, rework the static shared memory extra
information linked to the memory bank to another structure,
struct shmem_membank_extra, and exploit the struct membank
padding to host a pointer to that structure in a union with the
enum membank_type, with this trick the 'struct membank' has the
same size with or without the static shared memory, given that
the 'type' and 'shmem_extra' are never used at the same time.

Afterwards, create a new structure 'struct shared_meminfo' which
has the same interface of 'struct meminfo', but requires less
banks and hosts the extra information for the static shared memory.
The fields 'bank' and 'extra' of this structure are meant to be
linked by the index (e.g. extra[idx] will have the information for
the bank[idx], for i=0..NR_SHMEM_BANKS), the convinient pointer
'shmem_extra' of 'struct membank' is then linked to the related
'extra' bank to ease the fruition when a function has access only
to the 'struct membanks common' of 'struct shared_meminfo'.

The last part of this work is to move the allocation of the
static shared memory banks from the 'reserved_mem' to a new
'shmem' member of the 'struct bootinfo'.
Change also the 'shm_mem' member type to be 'struct shared_meminfo'
in order to match the above changes and allow a memory space
reduction also in 'struct kernel_info'.

Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
---
 xen/arch/arm/arm32/mmu/mm.c             | 24 +++++++++
 xen/arch/arm/arm64/mmu/mm.c             |  2 +
 xen/arch/arm/bootfdt.c                  |  1 +
 xen/arch/arm/domain_build.c             |  4 ++
 xen/arch/arm/include/asm/kernel.h       |  4 +-
 xen/arch/arm/include/asm/setup.h        | 41 +++++++++++++--
 xen/arch/arm/include/asm/static-shmem.h |  8 +++
 xen/arch/arm/setup.c                    | 25 ++++++++-
 xen/arch/arm/static-shmem.c             | 69 ++++++++++++++++++-------
 9 files changed, 154 insertions(+), 24 deletions(-)

diff --git a/xen/arch/arm/arm32/mmu/mm.c b/xen/arch/arm/arm32/mmu/mm.c
index e6bb5d934c16..45e42b307e20 100644
--- a/xen/arch/arm/arm32/mmu/mm.c
+++ b/xen/arch/arm/arm32/mmu/mm.c
@@ -7,6 +7,7 @@
 #include <xen/pfn.h>
 #include <asm/fixmap.h>
 #include <asm/static-memory.h>
+#include <asm/static-shmem.h>
 
 static unsigned long opt_xenheap_megabytes __initdata;
 integer_param("xenheap_megabytes", opt_xenheap_megabytes);
@@ -42,6 +43,9 @@ static paddr_t __init consider_modules(paddr_t s, paddr_t e,
                                        int first_mod)
 {
     const struct membanks *reserved_mem = bootinfo_get_reserved_mem();
+#ifdef CONFIG_STATIC_SHM
+    const struct membanks *shmem = bootinfo_get_shmem();
+#endif
     const struct bootmodules *mi = &bootinfo.modules;
     int i;
     int nr;
@@ -118,6 +122,25 @@ static paddr_t __init consider_modules(paddr_t s, paddr_t e,
             return consider_modules(s, r_s, size, align, i + 1);
         }
     }
+
+#ifdef CONFIG_STATIC_SHM
+    nr += reserved_mem->nr_banks;
+    for ( ; i - nr < shmem->nr_banks; i++ )
+    {
+        paddr_t r_s = shmem->bank[i - nr].start;
+        paddr_t r_e = r_s + shmem->bank[i - nr].size;
+
+        if ( s < r_e && r_s < e )
+        {
+            r_e = consider_modules(r_e, e, size, align, i + 1);
+            if ( r_e )
+                return r_e;
+
+            return consider_modules(s, r_s, size, align, i + 1);
+        }
+    }
+#endif
+
     return e;
 }
 
@@ -294,6 +317,7 @@ void __init setup_mm(void)
                        mfn_to_maddr(directmap_mfn_end));
 
     init_staticmem_pages();
+    init_sharedmem_pages();
 }
 
 /*
diff --git a/xen/arch/arm/arm64/mmu/mm.c b/xen/arch/arm/arm64/mmu/mm.c
index f8aaf4ac18be..293acb67e09c 100644
--- a/xen/arch/arm/arm64/mmu/mm.c
+++ b/xen/arch/arm/arm64/mmu/mm.c
@@ -6,6 +6,7 @@
 
 #include <asm/setup.h>
 #include <asm/static-memory.h>
+#include <asm/static-shmem.h>
 
 /* Override macros from asm/page.h to make them work with mfn_t */
 #undef virt_to_mfn
@@ -236,6 +237,7 @@ void __init setup_mm(void)
     max_page = PFN_DOWN(ram_end);
 
     init_staticmem_pages();
+    init_sharedmem_pages();
 }
 
 /*
diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
index ecbc80d6a112..f2344863062e 100644
--- a/xen/arch/arm/bootfdt.c
+++ b/xen/arch/arm/bootfdt.c
@@ -499,6 +499,7 @@ static void __init early_print_info(void)
                mem_resv->bank[j].start,
                mem_resv->bank[j].start + mem_resv->bank[j].size - 1);
     }
+    early_print_info_shmem();
     printk("\n");
     for ( i = 0 ; i < cmds->nr_mods; i++ )
         printk("CMDLINE[%"PRIpaddr"]:%s %s\n", cmds->cmdline[i].start,
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index d0f2ac6060eb..9fad9e8b2c40 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -864,6 +864,7 @@ static int __init add_ext_regions(unsigned long s_gfn, unsigned long e_gfn,
  * regions we exclude every region assigned to Dom0 from the Host RAM:
  * - domain RAM
  * - reserved-memory
+ * - static shared memory
  * - grant table space
  */
 static int __init find_unallocated_memory(const struct kernel_info *kinfo,
@@ -873,6 +874,9 @@ static int __init find_unallocated_memory(const struct kernel_info *kinfo,
         bootinfo_get_mem(),
         kernel_info_get_mem(kinfo),
         bootinfo_get_reserved_mem(),
+#ifdef CONFIG_STATIC_SHM
+        bootinfo_get_shmem(),
+#endif
     };
     struct rangeset *unalloc_mem;
     paddr_t start, end;
diff --git a/xen/arch/arm/include/asm/kernel.h b/xen/arch/arm/include/asm/kernel.h
index 5785da985ccf..937ffcefc73f 100644
--- a/xen/arch/arm/include/asm/kernel.h
+++ b/xen/arch/arm/include/asm/kernel.h
@@ -40,7 +40,7 @@ struct kernel_info {
     paddr_t unassigned_mem; /* RAM not (yet) assigned to a bank */
     struct meminfo mem;
 #ifdef CONFIG_STATIC_SHM
-    struct meminfo shm_mem;
+    struct shared_meminfo shm_mem;
 #endif
 
     /* kernel entry point */
@@ -84,7 +84,7 @@ struct kernel_info {
     (&(kinfo)->mem.common)
 
 #ifdef CONFIG_STATIC_SHM
-#define KERNEL_INFO_SHM_MEM_INIT .shm_mem.common.max_banks = NR_MEM_BANKS,
+#define KERNEL_INFO_SHM_MEM_INIT .shm_mem.common.max_banks = NR_SHMEM_BANKS,
 #else
 #define KERNEL_INFO_SHM_MEM_INIT
 #endif
diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
index a3e1dc8fdb6c..07011bd776da 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -9,6 +9,7 @@
 #define MAX_FDT_SIZE SZ_2M
 
 #define NR_MEM_BANKS 256
+#define NR_SHMEM_BANKS 32
 
 #define MAX_MODULES 32 /* Current maximum useful modules */
 
@@ -46,14 +47,20 @@ enum membank_type {
 /* Indicates the maximum number of characters(\0 included) for shm_id */
 #define MAX_SHM_ID_LENGTH 16
 
+struct shmem_membank_extra {
+    char shm_id[MAX_SHM_ID_LENGTH];
+    unsigned int nr_shm_borrowers;
+};
+
 struct membank {
     paddr_t start;
     paddr_t size;
-    enum membank_type type;
+    union {
+        enum membank_type type;
 #ifdef CONFIG_STATIC_SHM
-    char shm_id[MAX_SHM_ID_LENGTH];
-    unsigned int nr_shm_borrowers;
+        struct shmem_membank_extra *shmem_extra;
 #endif
+    };
 };
 
 struct membanks {
@@ -67,6 +74,12 @@ struct meminfo {
     struct membank bank[NR_MEM_BANKS];
 };
 
+struct shared_meminfo {
+    struct membanks common;
+    struct membank bank[NR_SHMEM_BANKS];
+    struct shmem_membank_extra extra[NR_SHMEM_BANKS];
+};
+
 /*
  * The domU flag is set for kernels and ramdisks of "xen,domain" nodes.
  * The purpose of the domU flag is to avoid getting confused in
@@ -109,6 +122,9 @@ struct bootinfo {
     struct bootcmdlines cmdlines;
 #ifdef CONFIG_ACPI
     struct meminfo acpi;
+#endif
+#ifdef CONFIG_STATIC_SHM
+    struct shared_meminfo shmem;
 #endif
     bool static_heap;
 };
@@ -119,11 +135,18 @@ struct bootinfo {
 #define BOOTINFO_ACPI_INIT
 #endif
 
+#ifdef CONFIG_STATIC_SHM
+#define BOOTINFO_SHMEM_INIT .shmem.common.max_banks = NR_SHMEM_BANKS,
+#else
+#define BOOTINFO_SHMEM_INIT
+#endif
+
 #define BOOTINFO_INIT \
 { \
     .mem.common.max_banks = NR_MEM_BANKS, \
     .reserved_mem.common.max_banks = NR_MEM_BANKS, \
     BOOTINFO_ACPI_INIT \
+    BOOTINFO_SHMEM_INIT \
 }
 
 struct map_range_data
@@ -158,6 +181,18 @@ static inline struct membanks *bootinfo_get_acpi(void)
 }
 #endif
 
+#ifdef CONFIG_STATIC_SHM
+static inline struct membanks *bootinfo_get_shmem(void)
+{
+    return &bootinfo.shmem.common;
+}
+
+static inline struct shmem_membank_extra *bootinfo_get_shmem_extra(void)
+{
+    return bootinfo.shmem.extra;
+}
+#endif
+
 void copy_from_paddr(void *dst, paddr_t paddr, unsigned long len);
 
 size_t estimate_efi_size(unsigned int mem_nr_banks);
diff --git a/xen/arch/arm/include/asm/static-shmem.h b/xen/arch/arm/include/asm/static-shmem.h
index 108cedb55a9f..c6fac9906656 100644
--- a/xen/arch/arm/include/asm/static-shmem.h
+++ b/xen/arch/arm/include/asm/static-shmem.h
@@ -25,6 +25,10 @@ static inline int process_shm_chosen(struct domain *d,
 int process_shm_node(const void *fdt, int node, uint32_t address_cells,
                      uint32_t size_cells);
 
+void early_print_info_shmem(void);
+
+void init_sharedmem_pages(void);
+
 #else /* !CONFIG_STATIC_SHM */
 
 static inline int make_resv_memory_node(const struct domain *d,
@@ -53,6 +57,10 @@ static inline int process_shm_node(const void *fdt, int node,
     return -EINVAL;
 }
 
+static inline void early_print_info_shmem(void) {};
+
+static inline void init_sharedmem_pages(void) {};
+
 #endif /* CONFIG_STATIC_SHM */
 
 #endif /* __ASM_STATIC_SHMEM_H_ */
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index cc719d508d63..111172a8c4b1 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -208,6 +208,9 @@ static void __init dt_unreserved_regions(paddr_t s, paddr_t e,
                                          unsigned int first)
 {
     const struct membanks *reserved_mem = bootinfo_get_reserved_mem();
+#ifdef CONFIG_STATIC_SHM
+    const struct membanks *shmem = bootinfo_get_shmem();
+#endif
     unsigned int i, nr;
     int rc;
 
@@ -258,6 +261,22 @@ static void __init dt_unreserved_regions(paddr_t s, paddr_t e,
         }
     }
 
+#ifdef CONFIG_STATIC_SHM
+    nr += reserved_mem->nr_banks;
+    for ( ; i - nr < shmem->nr_banks; i++ )
+    {
+        paddr_t r_s = shmem->bank[i - nr].start;
+        paddr_t r_e = r_s + shmem->bank[i - nr].size;
+
+        if ( s < r_e && r_s < e )
+        {
+            dt_unreserved_regions(r_e, e, cb, i + 1);
+            dt_unreserved_regions(s, r_s, cb, i + 1);
+            return;
+        }
+    }
+#endif
+
     cb(s, e);
 }
 
@@ -344,13 +363,17 @@ bool __init check_reserved_regions_overlap(paddr_t region_start,
         bootinfo_get_reserved_mem(),
 #ifdef CONFIG_ACPI
         bootinfo_get_acpi(),
+#endif
+#ifdef CONFIG_STATIC_SHM
+        bootinfo_get_shmem(),
 #endif
     };
     unsigned int i;
 
     /*
      * Check if input region is overlapping with reserved memory banks or
-     * ACPI EfiACPIReclaimMemory (when ACPI feature is enabled)
+     * ACPI EfiACPIReclaimMemory (when ACPI feature is enabled) or static
+     * shared memory banks (when static shared memory feature is enabled)
      */
     for ( i = 0; i < ARRAY_SIZE(mem_banks); i++ )
         if ( meminfo_overlap_check(mem_banks[i], region_start, region_size) )
diff --git a/xen/arch/arm/static-shmem.c b/xen/arch/arm/static-shmem.c
index 8b7da952be6e..6143f52cb991 100644
--- a/xen/arch/arm/static-shmem.c
+++ b/xen/arch/arm/static-shmem.c
@@ -4,29 +4,30 @@
 #include <xen/sched.h>
 
 #include <asm/domain_build.h>
+#include <asm/static-memory.h>
 #include <asm/static-shmem.h>
 
 static int __init acquire_nr_borrower_domain(struct domain *d,
                                              paddr_t pbase, paddr_t psize,
                                              unsigned long *nr_borrowers)
 {
-    const struct membanks *reserved_mem = bootinfo_get_reserved_mem();
+    const struct membanks *shmem = bootinfo_get_shmem();
     unsigned int bank;
 
     /* Iterate reserved memory to find requested shm bank. */
-    for ( bank = 0 ; bank < reserved_mem->nr_banks; bank++ )
+    for ( bank = 0 ; bank < shmem->nr_banks; bank++ )
     {
-        paddr_t bank_start = reserved_mem->bank[bank].start;
-        paddr_t bank_size = reserved_mem->bank[bank].size;
+        paddr_t bank_start = shmem->bank[bank].start;
+        paddr_t bank_size = shmem->bank[bank].size;
 
         if ( (pbase == bank_start) && (psize == bank_size) )
             break;
     }
 
-    if ( bank == reserved_mem->nr_banks )
+    if ( bank == shmem->nr_banks )
         return -ENOENT;
 
-    *nr_borrowers = reserved_mem->bank[bank].nr_shm_borrowers;
+    *nr_borrowers = shmem->bank[bank].shmem_extra->nr_shm_borrowers;
 
     return 0;
 }
@@ -158,16 +159,22 @@ static int __init assign_shared_memory(struct domain *d,
     return ret;
 }
 
-static int __init append_shm_bank_to_domain(struct membanks *shm_mem,
-                                            paddr_t start, paddr_t size,
-                                            const char *shm_id)
+static int __init
+append_shm_bank_to_domain(struct shared_meminfo *kinfo_shm_mem, paddr_t start,
+                          paddr_t size, const char *shm_id)
 {
+    struct membanks *shm_mem = &kinfo_shm_mem->common;
+    struct shmem_membank_extra *shm_mem_extra;
+
     if ( shm_mem->nr_banks >= shm_mem->max_banks )
         return -ENOMEM;
 
+    shm_mem_extra = &kinfo_shm_mem->extra[shm_mem->nr_banks];
+
     shm_mem->bank[shm_mem->nr_banks].start = start;
     shm_mem->bank[shm_mem->nr_banks].size = size;
-    safe_strcpy(shm_mem->bank[shm_mem->nr_banks].shm_id, shm_id);
+    safe_strcpy(shm_mem_extra->shm_id, shm_id);
+    shm_mem->bank[shm_mem->nr_banks].shmem_extra = shm_mem_extra;
     shm_mem->nr_banks++;
 
     return 0;
@@ -270,7 +277,7 @@ int __init process_shm(struct domain *d, struct kernel_info *kinfo,
          * Record static shared memory region info for later setting
          * up shm-node in guest device tree.
          */
-        ret = append_shm_bank_to_domain(&kinfo->shm_mem.common, gbase, psize,
+        ret = append_shm_bank_to_domain(&kinfo->shm_mem, gbase, psize,
                                         shm_id);
         if ( ret )
             return ret;
@@ -324,7 +331,8 @@ static int __init make_shm_memory_node(const struct domain *d, void *fdt,
         dt_dprintk("Shared memory bank %u: %#"PRIx64"->%#"PRIx64"\n",
                    i, start, start + size);
 
-        res = fdt_property_string(fdt, "xen,id", mem->bank[i].shm_id);
+        res = fdt_property_string(fdt, "xen,id",
+                                  mem->bank[i].shmem_extra->shm_id);
         if ( res )
             return res;
 
@@ -352,7 +360,8 @@ int __init process_shm_node(const void *fdt, int node, uint32_t address_cells,
     const struct fdt_property *prop, *prop_id, *prop_role;
     const __be32 *cell;
     paddr_t paddr, gaddr, size, end;
-    struct membanks *mem = bootinfo_get_reserved_mem();
+    struct membanks *mem = bootinfo_get_shmem();
+    struct shmem_membank_extra *shmem_extra = bootinfo_get_shmem_extra();
     unsigned int i;
     int len;
     bool owner = false;
@@ -441,7 +450,8 @@ int __init process_shm_node(const void *fdt, int node, uint32_t address_cells,
          */
         if ( paddr == mem->bank[i].start && size == mem->bank[i].size )
         {
-            if ( strncmp(shm_id, mem->bank[i].shm_id, MAX_SHM_ID_LENGTH) == 0 )
+            if ( strncmp(shm_id, shmem_extra[i].shm_id,
+                         MAX_SHM_ID_LENGTH) == 0  )
                 break;
             else
             {
@@ -450,7 +460,8 @@ int __init process_shm_node(const void *fdt, int node, uint32_t address_cells,
                 return -EINVAL;
             }
         }
-        else if ( strncmp(shm_id, mem->bank[i].shm_id, MAX_SHM_ID_LENGTH) != 0 )
+        else if ( strncmp(shm_id, shmem_extra[i].shm_id,
+                          MAX_SHM_ID_LENGTH) != 0 )
             continue;
         else
         {
@@ -468,10 +479,10 @@ int __init process_shm_node(const void *fdt, int node, uint32_t address_cells,
                 return -EINVAL;
 
             /* Static shared memory shall be reserved from any other use. */
-            safe_strcpy(mem->bank[mem->nr_banks].shm_id, shm_id);
+            safe_strcpy(shmem_extra[mem->nr_banks].shm_id, shm_id);
             mem->bank[mem->nr_banks].start = paddr;
             mem->bank[mem->nr_banks].size = size;
-            mem->bank[mem->nr_banks].type = MEMBANK_STATIC_DOMAIN;
+            mem->bank[mem->nr_banks].shmem_extra = &shmem_extra[mem->nr_banks];
             mem->nr_banks++;
         }
         else
@@ -485,7 +496,7 @@ int __init process_shm_node(const void *fdt, int node, uint32_t address_cells,
      * to calculate the reference count.
      */
     if ( !owner )
-        mem->bank[i].nr_shm_borrowers++;
+        shmem_extra[i].nr_shm_borrowers++;
 
     return 0;
 }
@@ -531,6 +542,28 @@ int __init make_resv_memory_node(const struct domain *d,
     return res;
 }
 
+void __init early_print_info_shmem(void)
+{
+    const struct membanks *shmem = bootinfo_get_shmem();
+    unsigned int bank;
+
+    for ( bank = 0; bank < shmem->nr_banks; bank++ )
+    {
+        printk(" SHMEM[%u]: %"PRIpaddr" - %"PRIpaddr"\n", bank,
+               shmem->bank[bank].start,
+               shmem->bank[bank].start + shmem->bank[bank].size - 1);
+    }
+}
+
+void __init init_sharedmem_pages(void)
+{
+    const struct membanks *shmem = bootinfo_get_shmem();
+    unsigned int bank;
+
+    for ( bank = 0 ; bank < shmem->nr_banks; bank++ )
+        init_staticmem_bank(&shmem->bank[bank]);
+}
+
 /*
  * Local variables:
  * mode: C
-- 
2.34.1


