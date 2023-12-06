Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C9E806A53
	for <lists+xen-devel@lfdr.de>; Wed,  6 Dec 2023 10:06:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649009.1013255 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAnrm-0003iR-BR; Wed, 06 Dec 2023 09:06:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649009.1013255; Wed, 06 Dec 2023 09:06:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAnrm-0003dh-7X; Wed, 06 Dec 2023 09:06:50 +0000
Received: by outflank-mailman (input) for mailman id 649009;
 Wed, 06 Dec 2023 09:06:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B4rn=HR=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1rAnrk-00022d-SQ
 for xen-devel@lists.xenproject.org; Wed, 06 Dec 2023 09:06:48 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id c82bf66b-9416-11ee-9b0f-b553b5be7939;
 Wed, 06 Dec 2023 10:06:46 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 29DB5139F;
 Wed,  6 Dec 2023 01:07:32 -0800 (PST)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DB32B3F762;
 Wed,  6 Dec 2023 01:06:42 -0800 (PST)
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
X-Inumbo-ID: c82bf66b-9416-11ee-9b0f-b553b5be7939
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org,
	michal.orzel@amd.com
Cc: wei.chen@arm.com,
	Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH v5 03/11] xen/arm: re-define a set of data structures for static shared memory region
Date: Wed,  6 Dec 2023 17:06:15 +0800
Message-Id: <20231206090623.1932275-4-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231206090623.1932275-1-Penny.Zheng@arm.com>
References: <20231206090623.1932275-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit introduces a set of separate data structures to deal with
static shared memory at different stages.

In boot-time host device tree parsing, we introduce a new structure
"struct shm_node" and a new field "shminfo" in bootinfo to describe and
store parsed shm info.

In acquire_nr_borrower_domain, it is better to use SHMID as unique identifier
to iterate "shminfo", other than address and size.

In the last, a new anonymized structure "shminfo", which is a array of
compound structure that contains SHMID and a "struct membank membank"
describing shared memory regions in guest address space, is created in "kinfo"
when dealing with domain information.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
v1 -> v2:
- As the original "struct shm_membank" was making reserving memory more
complex and actually memory information could be still got from host Device\
Tree when dealing with domain construction, we introduce a new simple structure
"struct shm_node" in bootinfo to only store SHMID and "nr_borrowers"
- Further restrict the scope of the local variable
"struct meminfo *mem = &bootinfo.reserved_mem"
- Introduce a new local global data "shm_data" in bootfdt.c. In which, reserved
memory bank is recorded together with the shm node, to assist doing shm node
verification.
- Define a set of local variables that point to
"shm_data.shm_nodes[i].membank->start", etc, to make the code more readable.
- Use SHMID to iterate "shminfo" to find requested shm node, as we no
longer store host memory bank info in shm node.
- A new anonymized structure, which is a array of compound structure that
contains SHMID and a "struct membank membank", describing shared memory region
in guest, is introduced in "kinfo".
---
v2 -> v3:
- rebase and no changes
---
v3 -> v4:
rebase and no change
---
v4 -> v5:
- With all shm-related functions classified into static-shmem.c, there
is no need to import local global data "shm_data".
---
 xen/arch/arm/dom0less-build.c           |   3 +-
 xen/arch/arm/domain_build.c             |   3 +-
 xen/arch/arm/include/asm/kernel.h       |   9 +-
 xen/arch/arm/include/asm/setup.h        |  24 +++++-
 xen/arch/arm/include/asm/static-shmem.h |   4 +-
 xen/arch/arm/static-shmem.c             | 104 ++++++++++++++----------
 6 files changed, 92 insertions(+), 55 deletions(-)

diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index fb63ec6fd1..ac096fa3fa 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -645,8 +645,7 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
     if ( ret )
         goto err;
 
-    ret = make_resv_memory_node(d, kinfo->fdt, addrcells, sizecells,
-                                &kinfo->shm_mem);
+    ret = make_resv_memory_node(d, kinfo->fdt, addrcells, sizecells, kinfo);
     if ( ret )
         goto err;
 
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 613b2885ce..64ae944431 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1767,8 +1767,7 @@ static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
                 return res;
         }
 
-        res = make_resv_memory_node(d, kinfo->fdt, addrcells, sizecells,
-                                    &kinfo->shm_mem);
+        res = make_resv_memory_node(d, kinfo->fdt, addrcells, sizecells, kinfo);
         if ( res )
             return res;
     }
diff --git a/xen/arch/arm/include/asm/kernel.h b/xen/arch/arm/include/asm/kernel.h
index 0a23e86c2d..db3d8232fa 100644
--- a/xen/arch/arm/include/asm/kernel.h
+++ b/xen/arch/arm/include/asm/kernel.h
@@ -39,7 +39,14 @@ struct kernel_info {
     void *fdt; /* flat device tree */
     paddr_t unassigned_mem; /* RAM not (yet) assigned to a bank */
     struct meminfo mem;
-    struct meminfo shm_mem;
+    /* Static shared memory banks */
+    struct {
+        unsigned int nr_banks;
+        struct {
+            char shm_id[MAX_SHM_ID_LENGTH];
+            struct membank membank;
+        } bank[NR_MEM_BANKS];
+    } shminfo;
 
     /* kernel entry point */
     paddr_t entry;
diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
index d15a88d2e0..3a2b35ea46 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -50,10 +50,6 @@ struct membank {
     paddr_t start;
     paddr_t size;
     enum membank_type type;
-#ifdef CONFIG_STATIC_SHM
-    char shm_id[MAX_SHM_ID_LENGTH];
-    unsigned int nr_shm_borrowers;
-#endif
 };
 
 struct meminfo {
@@ -95,6 +91,17 @@ struct bootcmdlines {
     struct bootcmdline cmdline[MAX_MODULES];
 };
 
+#ifdef CONFIG_STATIC_SHM
+/*
+ * struct shm_node represents a static shared memory node shared between
+ * multiple domains, identified by the unique SHMID("xen,shm-id").
+ */
+struct shm_node {
+    char shm_id[MAX_SHM_ID_LENGTH];
+    unsigned int nr_shm_borrowers;
+};
+#endif
+
 struct bootinfo {
     struct meminfo mem;
     /* The reserved regions are only used when booting using Device-Tree */
@@ -105,6 +112,15 @@ struct bootinfo {
     struct meminfo acpi;
 #endif
     bool static_heap;
+#ifdef CONFIG_STATIC_SHM
+    struct {
+        unsigned int nr_nodes;
+        struct {
+            struct shm_node node;
+            const struct membank *membank;
+        } shm_nodes[NR_MEM_BANKS];
+    } shminfo;
+#endif
 };
 
 struct map_range_data
diff --git a/xen/arch/arm/include/asm/static-shmem.h b/xen/arch/arm/include/asm/static-shmem.h
index 1536ff18b8..66a3f4c146 100644
--- a/xen/arch/arm/include/asm/static-shmem.h
+++ b/xen/arch/arm/include/asm/static-shmem.h
@@ -8,7 +8,7 @@
 #ifdef CONFIG_STATIC_SHM
 
 int make_resv_memory_node(const struct domain *d, void *fdt, int addrcells,
-                          int sizecells, const struct meminfo *mem);
+                          int sizecells, const struct kernel_info *kinfo);
 
 int process_shm(struct domain *d, struct kernel_info *kinfo,
                 const struct dt_device_node *node);
@@ -28,7 +28,7 @@ int process_shm_node(const void *fdt, int node, uint32_t address_cells,
 
 static inline int make_resv_memory_node(const struct domain *d, void *fdt,
                                         int addrcells, int sizecells,
-                                        const struct meminfo *mem)
+                                        const struct kernel_info *kinfo)
 {
     return 0;
 }
diff --git a/xen/arch/arm/static-shmem.c b/xen/arch/arm/static-shmem.c
index 1a1a9386e4..6a3d8a54bd 100644
--- a/xen/arch/arm/static-shmem.c
+++ b/xen/arch/arm/static-shmem.c
@@ -6,28 +6,25 @@
 #include <asm/domain_build.h>
 #include <asm/static-shmem.h>
 
-static int __init acquire_nr_borrower_domain(struct domain *d,
-                                             paddr_t pbase, paddr_t psize,
+static int __init acquire_nr_borrower_domain(const char *shm_id,
                                              unsigned long *nr_borrowers)
 {
-    unsigned int bank;
+    struct shm_node *shm_node;
+    unsigned int i;
 
-    /* Iterate reserved memory to find requested shm bank. */
-    for ( bank = 0 ; bank < bootinfo.reserved_mem.nr_banks; bank++ )
+    /* Iterate to find requested static shared memory node. */
+    for ( i = 0; i < bootinfo.shminfo.nr_nodes; i++ )
     {
-        paddr_t bank_start = bootinfo.reserved_mem.bank[bank].start;
-        paddr_t bank_size = bootinfo.reserved_mem.bank[bank].size;
+        shm_node = &bootinfo.shminfo.shm_nodes[i].node;
 
-        if ( (pbase == bank_start) && (psize == bank_size) )
-            break;
+        if ( strcmp(shm_id, shm_node->shm_id) == 0 )
+        {
+            *nr_borrowers = shm_node->nr_shm_borrowers;
+            return 0;
+        }
     }
 
-    if ( bank == bootinfo.reserved_mem.nr_banks )
-        return -ENOENT;
-
-    *nr_borrowers = bootinfo.reserved_mem.bank[bank].nr_shm_borrowers;
-
-    return 0;
+    return -ENOENT;
 }
 
 /*
@@ -91,7 +88,7 @@ static mfn_t __init acquire_shared_memory_bank(struct domain *d,
 
 static int __init assign_shared_memory(struct domain *d,
                                        paddr_t pbase, paddr_t psize,
-                                       paddr_t gbase)
+                                       paddr_t gbase, const char *shm_id)
 {
     mfn_t smfn;
     int ret = 0;
@@ -125,7 +122,7 @@ static int __init assign_shared_memory(struct domain *d,
      * Get the right amount of references per page, which is the number of
      * borrower domains.
      */
-    ret = acquire_nr_borrower_domain(d, pbase, psize, &nr_borrowers);
+    ret = acquire_nr_borrower_domain(shm_id, &nr_borrowers);
     if ( ret )
         return ret;
 
@@ -161,13 +158,16 @@ static int __init append_shm_bank_to_domain(struct kernel_info *kinfo,
                                             paddr_t start, paddr_t size,
                                             const char *shm_id)
 {
-    if ( kinfo->shm_mem.nr_banks >= NR_MEM_BANKS )
+    unsigned int nr_banks = kinfo->shminfo.nr_banks;
+    struct membank *membank = &kinfo->shminfo.bank[nr_banks].membank;
+
+    if ( nr_banks >= NR_MEM_BANKS )
         return -ENOMEM;
 
-    kinfo->shm_mem.bank[kinfo->shm_mem.nr_banks].start = start;
-    kinfo->shm_mem.bank[kinfo->shm_mem.nr_banks].size = size;
-    safe_strcpy(kinfo->shm_mem.bank[kinfo->shm_mem.nr_banks].shm_id, shm_id);
-    kinfo->shm_mem.nr_banks++;
+    membank->start = start;
+    membank->size = size;
+    safe_strcpy(kinfo->shminfo.bank[nr_banks].shm_id, shm_id);
+    kinfo->shminfo.nr_banks++;
 
     return 0;
 }
@@ -251,7 +251,7 @@ int __init process_shm(struct domain *d, struct kernel_info *kinfo,
              * specified, so they should be assigned to dom_io.
              */
             ret = assign_shared_memory(owner_dom_io ? dom_io : d,
-                                       pbase, psize, gbase);
+                                       pbase, psize, gbase, shm_id);
             if ( ret )
                 return ret;
         }
@@ -279,12 +279,12 @@ int __init process_shm(struct domain *d, struct kernel_info *kinfo,
 
 static int __init make_shm_memory_node(const struct domain *d, void *fdt,
                                        int addrcells, int sizecells,
-                                       const struct meminfo *mem)
+                                       const struct kernel_info *kinfo)
 {
     unsigned int i = 0;
     int res = 0;
 
-    if ( mem->nr_banks == 0 )
+    if ( kinfo->shminfo.nr_banks == 0 )
         return -ENOENT;
 
     /*
@@ -294,17 +294,17 @@ static int __init make_shm_memory_node(const struct domain *d, void *fdt,
      */
     dt_dprintk("Create xen-shmem node\n");
 
-    for ( ; i < mem->nr_banks; i++ )
+    for ( ; i < kinfo->shminfo.nr_banks; i++ )
     {
-        uint64_t start = mem->bank[i].start;
-        uint64_t size = mem->bank[i].size;
+        uint64_t start = kinfo->shminfo.bank[i].membank.start;
+        uint64_t size = kinfo->shminfo.bank[i].membank.size;
         const char compat[] = "xen,shared-memory-v1";
         /* Worst case addrcells + sizecells */
         __be32 reg[GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS];
         __be32 *cells;
         unsigned int len = (addrcells + sizecells) * sizeof(__be32);
 
-        res = domain_fdt_begin_node(fdt, "xen-shmem", mem->bank[i].start);
+        res = domain_fdt_begin_node(fdt, "xen-shmem", start);
         if ( res )
             return res;
 
@@ -322,7 +322,7 @@ static int __init make_shm_memory_node(const struct domain *d, void *fdt,
         dt_dprintk("Shared memory bank %u: %#"PRIx64"->%#"PRIx64"\n",
                    i, start, start + size);
 
-        res = fdt_property_string(fdt, "xen,id", mem->bank[i].shm_id);
+        res = fdt_property_string(fdt, "xen,id", kinfo->shminfo.bank[i].shm_id);
         if ( res )
             return res;
 
@@ -350,7 +350,6 @@ int __init process_shm_node(const void *fdt, int node, uint32_t address_cells,
     const struct fdt_property *prop, *prop_id, *prop_role;
     const __be32 *cell;
     paddr_t paddr, gaddr, size, end;
-    struct meminfo *mem = &bootinfo.reserved_mem;
     unsigned int i;
     int len;
     bool owner = false;
@@ -429,17 +428,21 @@ int __init process_shm_node(const void *fdt, int node, uint32_t address_cells,
         return -EINVAL;
     }
 
-    for ( i = 0; i < mem->nr_banks; i++ )
+    for ( i = 0; i < bootinfo.shminfo.nr_nodes; i++ )
     {
+        paddr_t bank_start = bootinfo.shminfo.shm_nodes[i].membank->start;
+        paddr_t bank_size = bootinfo.shminfo.shm_nodes[i].membank->size;
+        const char *bank_id = bootinfo.shminfo.shm_nodes[i].node.shm_id;
+
         /*
          * Meet the following check:
          * 1) The shm ID matches and the region exactly match
          * 2) The shm ID doesn't match and the region doesn't overlap
          * with an existing one
          */
-        if ( paddr == mem->bank[i].start && size == mem->bank[i].size )
+        if ( paddr == bank_start && size == bank_size )
         {
-            if ( strncmp(shm_id, mem->bank[i].shm_id, MAX_SHM_ID_LENGTH) == 0 )
+            if ( strncmp(shm_id, bank_id, MAX_SHM_ID_LENGTH) == 0 )
                 break;
             else
             {
@@ -458,19 +461,32 @@ int __init process_shm_node(const void *fdt, int node, uint32_t address_cells,
         }
     }
 
-    if ( i == mem->nr_banks )
+    if ( i == bootinfo.shminfo.nr_nodes )
     {
-        if ( i < NR_MEM_BANKS )
+        struct meminfo *mem = &bootinfo.reserved_mem;
+
+        if ( (i < NR_MEM_BANKS) && (mem->nr_banks < NR_MEM_BANKS) )
         {
+            struct membank *membank = &mem->bank[mem->nr_banks];
+            struct shm_node *shm_node = &bootinfo.shminfo.shm_nodes[i].node;
+
             if ( check_reserved_regions_overlap(paddr, size) )
                 return -EINVAL;
 
             /* Static shared memory shall be reserved from any other use. */
-            safe_strcpy(mem->bank[mem->nr_banks].shm_id, shm_id);
-            mem->bank[mem->nr_banks].start = paddr;
-            mem->bank[mem->nr_banks].size = size;
-            mem->bank[mem->nr_banks].type = MEMBANK_STATIC_DOMAIN;
+            membank->start = paddr;
+            membank->size = size;
+            membank->type = MEMBANK_STATIC_DOMAIN;
             mem->nr_banks++;
+
+            /* Record static shared memory node info in bootinfo.shminfo */
+            safe_strcpy(shm_node->shm_id, shm_id);
+            /*
+             * Reserved memory bank is recorded together to assist
+             * doing shm node verification.
+             */
+            bootinfo.shminfo.shm_nodes[i].membank = membank;
+            bootinfo.shminfo.nr_nodes++;
         }
         else
         {
@@ -483,20 +499,20 @@ int __init process_shm_node(const void *fdt, int node, uint32_t address_cells,
      * to calculate the reference count.
      */
     if ( !owner )
-        mem->bank[i].nr_shm_borrowers++;
+        bootinfo.shminfo.shm_nodes[i].node.nr_shm_borrowers++;
 
     return 0;
 }
 
 int __init make_resv_memory_node(const struct domain *d, void *fdt,
                                  int addrcells, int sizecells,
-                                 const struct meminfo *mem)
+                                 const struct kernel_info *kinfo)
 {
     int res = 0;
     /* Placeholder for reserved-memory\0 */
     const char resvbuf[16] = "reserved-memory";
 
-    if ( mem->nr_banks == 0 )
+    if ( kinfo->shminfo.nr_banks == 0 )
         /* No shared memory provided. */
         return 0;
 
@@ -518,7 +534,7 @@ int __init make_resv_memory_node(const struct domain *d, void *fdt,
     if ( res )
         return res;
 
-    res = make_shm_memory_node(d, fdt, addrcells, sizecells, mem);
+    res = make_shm_memory_node(d, fdt, addrcells, sizecells, kinfo);
     if ( res )
         return res;
 
-- 
2.25.1


