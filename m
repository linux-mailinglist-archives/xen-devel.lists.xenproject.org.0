Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4C579A236
	for <lists+xen-devel@lfdr.de>; Mon, 11 Sep 2023 06:05:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.598905.934105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfYAy-0006N3-DA; Mon, 11 Sep 2023 04:05:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 598905.934105; Mon, 11 Sep 2023 04:05:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfYAy-0006JK-A0; Mon, 11 Sep 2023 04:05:28 +0000
Received: by outflank-mailman (input) for mailman id 598905;
 Mon, 11 Sep 2023 04:05:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ExPs=E3=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1qfYAx-0005n2-08
 for xen-devel@lists.xenproject.org; Mon, 11 Sep 2023 04:05:27 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 6ef891a7-5058-11ee-9b0d-b553b5be7939;
 Mon, 11 Sep 2023 06:05:24 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2C334D75;
 Sun, 10 Sep 2023 21:06:01 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B67A33F67D;
 Sun, 10 Sep 2023 21:05:20 -0700 (PDT)
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
X-Inumbo-ID: 6ef891a7-5058-11ee-9b0d-b553b5be7939
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: michal.orzel@amd.com,
	wei.chen@arm.com,
	Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH v4 02/10] xen/arm: re-define a set of data structures for static shared memory region
Date: Mon, 11 Sep 2023 12:04:34 +0800
Message-Id: <20230911040442.2541398-3-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230911040442.2541398-1-Penny.Zheng@arm.com>
References: <20230911040442.2541398-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit introduces a set of separate data structures to deal with
static shared memory at different stages.

In boot-time host device tree parsing, we introduce a new structure
"struct shm_node" and a new field "shm_info" in bootinfo to describe and
store parsed shm info.
only SHMID and "nr_borrowers", which describes the number of borrower domain,
are considered here for per shm node.
We also introduce a new local global data "shm_data" in bootfdt.c, in which,
reserved memory bank is recorded together with shm node, to assist doing
shm node verification.

In order to apply above changes in acquire_nr_borrower_domain, we now use SHMID
to iterate "shminfo" to find requested shm node, then acquiring the information
of "nr_borrowers".

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
 xen/arch/arm/bootfdt.c            | 57 ++++++++++++++++++------
 xen/arch/arm/domain_build.c       | 74 +++++++++++++++----------------
 xen/arch/arm/include/asm/kernel.h |  9 +++-
 xen/arch/arm/include/asm/setup.h  | 21 +++++++--
 4 files changed, 104 insertions(+), 57 deletions(-)

diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
index 2673ad17a1..66ad3ab3db 100644
--- a/xen/arch/arm/bootfdt.c
+++ b/xen/arch/arm/bootfdt.c
@@ -16,6 +16,16 @@
 #include <xsm/xsm.h>
 #include <asm/setup.h>
 
+#ifdef CONFIG_STATIC_SHM
+static __initdata struct {
+    unsigned int nr_nodes;
+    struct {
+        const struct shm_node *node;
+        const struct membank *membank;
+    } shm_nodes[NR_MEM_BANKS];
+} shm_data;
+#endif
+
 static bool __init device_tree_node_matches(const void *fdt, int node,
                                             const char *match)
 {
@@ -409,7 +419,6 @@ static int __init process_shm_node(const void *fdt, int node,
     const struct fdt_property *prop, *prop_id, *prop_role;
     const __be32 *cell;
     paddr_t paddr, gaddr, size;
-    struct meminfo *mem = &bootinfo.reserved_mem;
     unsigned int i;
     int len;
     bool owner = false;
@@ -481,17 +490,21 @@ static int __init process_shm_node(const void *fdt, int node,
         return -EINVAL;
     }
 
-    for ( i = 0; i < mem->nr_banks; i++ )
+    for ( i = 0; i < shm_data.nr_nodes; i++ )
     {
+        paddr_t bank_start = shm_data.shm_nodes[i].membank->start;
+        paddr_t bank_size = shm_data.shm_nodes[i].membank->size;
+        const char *bank_id = shm_data.shm_nodes[i].node->shm_id;
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
@@ -503,9 +516,9 @@ static int __init process_shm_node(const void *fdt, int node,
         else
         {
             paddr_t end = paddr + size;
-            paddr_t bank_end = mem->bank[i].start + mem->bank[i].size;
+            paddr_t bank_end = bank_start + bank_size;
 
-            if ( (end <= paddr) || (bank_end <= mem->bank[i].start) )
+            if ( (end <= paddr) || (bank_end <= bank_start) )
             {
                 printk("fdt: static shared memory region %s overflow\n", shm_id);
                 return -EINVAL;
@@ -515,7 +528,7 @@ static int __init process_shm_node(const void *fdt, int node,
                 return -EINVAL;
             else
             {
-                if ( strcmp(shm_id, mem->bank[i].shm_id) != 0 )
+                if ( strcmp(shm_id, bank_id) != 0 )
                     continue;
                 else
                 {
@@ -527,16 +540,32 @@ static int __init process_shm_node(const void *fdt, int node,
         }
     }
 
-    if ( i == mem->nr_banks )
+    if ( (i == shm_data.nr_nodes) && (i == bootinfo.shminfo.nr_nodes) )
     {
-        if ( i < NR_MEM_BANKS )
+        struct meminfo *mem = &bootinfo.reserved_mem;
+
+        if ( (i < NR_MEM_BANKS) && (mem->nr_banks < NR_MEM_BANKS) )
         {
             /* Static shared memory shall be reserved from any other use. */
-            safe_strcpy(mem->bank[mem->nr_banks].shm_id, shm_id);
-            mem->bank[mem->nr_banks].start = paddr;
-            mem->bank[mem->nr_banks].size = size;
-            mem->bank[mem->nr_banks].type = MEMBANK_STATIC_DOMAIN;
+            struct membank *membank = &mem->bank[mem->nr_banks];
+            struct shm_node *shm_node = &bootinfo.shminfo.node[i];
+
+            membank->start = paddr;
+            membank->size = size;
+            membank->type = MEMBANK_STATIC_DOMAIN;
             mem->nr_banks++;
+
+            /* Record static shared memory node info in bootinfo.shminfo */
+            safe_strcpy(shm_node->shm_id, shm_id);
+            bootinfo.shminfo.nr_nodes++;
+
+            /*
+             * Reserved memory bank is recorded together with shm
+             * node info in shm_data, to assist doing shm node verification.
+             */
+            shm_data.shm_nodes[i].node = shm_node;
+            shm_data.shm_nodes[i].membank = membank;
+            shm_data.nr_nodes++;
         }
         else
         {
@@ -549,7 +578,7 @@ static int __init process_shm_node(const void *fdt, int node,
      * to calculate the reference count.
      */
     if ( !owner )
-        mem->bank[i].nr_shm_borrowers++;
+        bootinfo.shminfo.node[i].nr_shm_borrowers++;
 
     return 0;
 }
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index c532fa882c..4901664682 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -774,28 +774,25 @@ static void __init assign_static_memory_11(struct domain *d,
 }
 
 #ifdef CONFIG_STATIC_SHM
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
+        shm_node = &bootinfo.shminfo.node[i];
 
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
+    return -EINVAL;
 }
 
 /*
@@ -859,7 +856,7 @@ static mfn_t __init acquire_shared_memory_bank(struct domain *d,
 
 static int __init assign_shared_memory(struct domain *d,
                                        paddr_t pbase, paddr_t psize,
-                                       paddr_t gbase)
+                                       paddr_t gbase, const char *shm_id)
 {
     mfn_t smfn;
     int ret = 0;
@@ -893,7 +890,7 @@ static int __init assign_shared_memory(struct domain *d,
      * Get the right amount of references per page, which is the number of
      * borrower domains.
      */
-    ret = acquire_nr_borrower_domain(d, pbase, psize, &nr_borrowers);
+    ret = acquire_nr_borrower_domain(shm_id, &nr_borrowers);
     if ( ret )
         return ret;
 
@@ -929,13 +926,16 @@ static int __init append_shm_bank_to_domain(struct kernel_info *kinfo,
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
@@ -1019,7 +1019,7 @@ static int __init process_shm(struct domain *d, struct kernel_info *kinfo,
              * specified, so they should be assigned to dom_io.
              */
             ret = assign_shared_memory(owner_dom_io ? dom_io : d,
-                                       pbase, psize, gbase);
+                                       pbase, psize, gbase, shm_id);
             if ( ret )
                 return ret;
         }
@@ -1405,12 +1405,12 @@ static int __init make_memory_node(const struct domain *d,
 static int __init make_shm_memory_node(const struct domain *d,
                                        void *fdt,
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
@@ -1420,17 +1420,17 @@ static int __init make_shm_memory_node(const struct domain *d,
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
 
@@ -1448,7 +1448,7 @@ static int __init make_shm_memory_node(const struct domain *d,
         dt_dprintk("Shared memory bank %u: %#"PRIx64"->%#"PRIx64"\n",
                    i, start, start + size);
 
-        res = fdt_property_string(fdt, "xen,id", mem->bank[i].shm_id);
+        res = fdt_property_string(fdt, "xen,id", kinfo->shminfo.bank[i].shm_id);
         if ( res )
             return res;
 
@@ -1473,7 +1473,7 @@ static int __init make_shm_memory_node(const struct domain *d,
 static int __init make_shm_memory_node(const struct domain *d,
                                        void *fdt,
                                        int addrcells, int sizecells,
-                                       const struct meminfo *mem)
+                                       const struct kernel_info *kinfo)
 {
     ASSERT_UNREACHABLE();
     return -EOPNOTSUPP;
@@ -1483,13 +1483,13 @@ static int __init make_shm_memory_node(const struct domain *d,
 static int __init make_resv_memory_node(const struct domain *d,
                                         void *fdt,
                                         int addrcells, int sizecells,
-                                        const struct meminfo *mem)
+                                        const struct kernel_info *kinfo)
 {
     int res = 0;
     /* Placeholder for reserved-memory\0 */
     const char resvbuf[16] = "reserved-memory";
 
-    if ( mem->nr_banks == 0 )
+    if ( kinfo->shminfo.nr_banks == 0 )
         /* No shared memory provided. */
         return 0;
 
@@ -1511,7 +1511,7 @@ static int __init make_resv_memory_node(const struct domain *d,
     if ( res )
         return res;
 
-    res = make_shm_memory_node(d, fdt, addrcells, sizecells, mem);
+    res = make_shm_memory_node(d, fdt, addrcells, sizecells, kinfo);
     if ( res )
         return res;
 
@@ -2470,8 +2470,7 @@ static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
                 return res;
         }
 
-        res = make_resv_memory_node(d, kinfo->fdt, addrcells, sizecells,
-                                    &kinfo->shm_mem);
+        res = make_resv_memory_node(d, kinfo->fdt, addrcells, sizecells, kinfo);
         if ( res )
             return res;
     }
@@ -3027,8 +3026,7 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
     if ( ret )
         goto err;
 
-    ret = make_resv_memory_node(d, kinfo->fdt, addrcells, sizecells,
-                                &kinfo->shm_mem);
+    ret = make_resv_memory_node(d, kinfo->fdt, addrcells, sizecells, kinfo);
     if ( ret )
         goto err;
 
diff --git a/xen/arch/arm/include/asm/kernel.h b/xen/arch/arm/include/asm/kernel.h
index 4617cdc83b..590bc56f6c 100644
--- a/xen/arch/arm/include/asm/kernel.h
+++ b/xen/arch/arm/include/asm/kernel.h
@@ -38,7 +38,14 @@ struct kernel_info {
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
index b8866c20f4..3c5fc23eb1 100644
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
@@ -105,6 +112,12 @@ struct bootinfo {
     struct meminfo acpi;
 #endif
     bool static_heap;
+#ifdef CONFIG_STATIC_SHM
+    struct {
+        unsigned int nr_nodes;
+        struct shm_node node[NR_MEM_BANKS];
+    } shminfo;
+#endif
 };
 
 struct map_range_data
-- 
2.25.1


