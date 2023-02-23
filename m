Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F4A76A0274
	for <lists+xen-devel@lfdr.de>; Thu, 23 Feb 2023 06:42:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.499865.771185 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pV4ML-0001ZB-0p; Thu, 23 Feb 2023 05:41:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 499865.771185; Thu, 23 Feb 2023 05:41:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pV4MK-0001X4-T6; Thu, 23 Feb 2023 05:41:36 +0000
Received: by outflank-mailman (input) for mailman id 499865;
 Thu, 23 Feb 2023 05:41:35 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z4j0=6T=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1pV4MJ-0001BN-JS
 for xen-devel@lists.xenproject.org; Thu, 23 Feb 2023 05:41:35 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id bb627dc7-b33c-11ed-88bb-e56d68cac8db;
 Thu, 23 Feb 2023 06:41:34 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CB7A71FB;
 Wed, 22 Feb 2023 21:42:16 -0800 (PST)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CE5843F587;
 Wed, 22 Feb 2023 21:41:30 -0800 (PST)
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
X-Inumbo-ID: bb627dc7-b33c-11ed-88bb-e56d68cac8db
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH v2 4/8] xen/arm: use paddr_assigned to indicate whether host address is provided
Date: Thu, 23 Feb 2023 13:41:01 +0800
Message-Id: <20230223054105.2357217-5-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230223054105.2357217-1-Penny.Zheng@arm.com>
References: <20230223054105.2357217-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We use paddr_assigned to indicate whether host address is provided, by
checking the length of "xen,shared-mem" property.

The shm matching criteria shall also be adapt to cover the new scenario, by
adding when host address is not provided, if SHMID matches, the region size
must exactly match too.

During domain creation, right now, a static shared memory node could be
banked with a statically configured host memory bank, or a set of arbitrary
host memory banks allocated from heap. To cover both scenarios, we create
a new structure shm_meminfo. It is very alike meminfo, but with the maximum
array size being a smaller number NR_SHM_BANKS(16).
As "shm_meminfo" is also a new member of "enum meminfo_type", we shall implement
its own callback "retrieve_shm_meminfo" to have access to all MACRO
helpers, e.g. GET_MEMBANK(...).

Also, to make codes tidy and clear, we extract codes about parsing
"xen,shared-mem" property from function "process_shm" and move them into
a new helper "parse_shm_property".

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
v1 -> v2
- In order to get allocated banked host memory info during domain creation,
we create a new structure shm_meminfo. It is very alike meminfo, with
the maximum array size being NR_SHM_BANKS. As shm_meminfo is a new
member of type meminfo_type, we shall implement its own callback
retrieve_shm_meminfo to have access to all MACRO helpers, e.g.
GET_MEMBANK(...)
- rename "acquire_shm_memnode" to "find_shm_memnode"
---
 xen/arch/arm/bootfdt.c           | 100 ++++++++++-----
 xen/arch/arm/domain_build.c      | 207 +++++++++++++++++++++++++------
 xen/arch/arm/include/asm/setup.h |   3 +
 3 files changed, 243 insertions(+), 67 deletions(-)

diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
index dc32d1b9b3..98cf6b89f6 100644
--- a/xen/arch/arm/bootfdt.c
+++ b/xen/arch/arm/bootfdt.c
@@ -21,7 +21,15 @@ static __initdata struct {
     unsigned int nr_nodes;
     struct {
         const struct shm_node *node;
-        const struct membank *membank;
+        /*
+         * For a static shared memory node, it is either banked with a reserved
+         * host memory bank, or arbitrary host memory which shall
+         * be allocated by Xen with a specified total size(tot_size).
+         */
+        union {
+            const struct membank *membank;
+            paddr_t tot_size;
+        };
     } shm_nodes[NR_MEM_BANKS];
 } shm_data;
 #endif
@@ -392,7 +400,7 @@ static int __init process_shm_node(const void *fdt, int node,
     paddr_t paddr, gaddr, size;
     unsigned int i;
     int len;
-    bool owner = false;
+    bool owner = false, paddr_assigned = true;
     const char *shm_id;
 
     if ( address_cells < 1 || size_cells < 1 )
@@ -433,7 +441,7 @@ static int __init process_shm_node(const void *fdt, int node,
     }
 
     /*
-     * xen,shared-mem = <paddr, gaddr, size>;
+     * xen,shared-mem = <paddr, gaddr, size>, and paddr could be optional
      * Memory region starting from physical address #paddr of #size shall
      * be mapped to guest physical address #gaddr as static shared memory
      * region.
@@ -444,16 +452,24 @@ static int __init process_shm_node(const void *fdt, int node,
 
     if ( len != dt_cells_to_size(address_cells + size_cells + address_cells) )
     {
+        /* paddr is not provided in "xen,shared-mem" */
         if ( len == dt_cells_to_size(size_cells + address_cells) )
-            printk("fdt: host physical address must be chosen by users at the moment.\n");
-
-        printk("fdt: invalid `xen,shared-mem` property.\n");
-        return -EINVAL;
+            paddr_assigned = false;
+        else
+        {
+            printk("fdt: invalid `xen,shared-mem` property.\n");
+            return -EINVAL;
+        }
     }
 
     cell = (const __be32 *)prop->data;
-    device_tree_get_reg(&cell, address_cells, address_cells, &paddr, &gaddr);
-    size = dt_next_cell(size_cells, &cell);
+    if ( !paddr_assigned )
+        device_tree_get_reg(&cell, address_cells, size_cells, &gaddr, &size);
+    else
+    {
+        device_tree_get_reg(&cell, address_cells, address_cells, &paddr, &gaddr);
+        size = dt_next_cell(size_cells, &cell);
+    }
 
     if ( !size )
     {
@@ -466,23 +482,37 @@ static int __init process_shm_node(const void *fdt, int node,
         paddr_t bank_start = shm_data.shm_nodes[i].membank->start;
         paddr_t bank_size = shm_data.shm_nodes[i].membank->size;
         const char *bank_id = shm_data.shm_nodes[i].node->shm_id;
+        paddr_t tot_size = shm_data.shm_nodes[i].tot_size;
 
         /*
          * Meet the following check:
+         * when host address is provided:
          * 1) The shm ID matches and the region exactly match
          * 2) The shm ID doesn't match and the region doesn't overlap
          * with an existing one
+         * when host address is not provided:
+         * 1) The shm ID matches and the region size exactly match
          */
-        if ( paddr == bank_start && size == bank_size )
+        if ( !paddr_assigned || ((paddr == bank_start) && (size == bank_size)) )
         {
             if ( strncmp(shm_id, bank_id, MAX_SHM_ID_LENGTH) == 0 )
-                break;
-            else
+            {
+                if ( !paddr_assigned && (size != tot_size) )
+                {
+                    printk("fdt: when host address is not provided, if xen,shm-id matches, size must stay the same too(%"PRIpaddr" -> %"PRIpaddr")\n",
+                           size, tot_size);
+                    return -EINVAL;
+                }
+            }
+            else if ( paddr_assigned )
             {
                 printk("fdt: xen,shm-id %s does not match for all the nodes using the same region.\n",
                        shm_id);
                 return -EINVAL;
             }
+
+            /* host address is not provided, and with different SHMID. */
+            continue;
         }
         else
         {
@@ -517,37 +547,41 @@ static int __init process_shm_node(const void *fdt, int node,
 
     if ( (i == shm_data.nr_nodes) && (i == bootinfo.shminfo.nr_nodes) )
     {
-        struct meminfo *mem = &bootinfo.reserved_mem;
-
-        if ( (i < NR_MEM_BANKS) && (mem->nr_banks < NR_MEM_BANKS) )
+        if ( i < NR_MEM_BANKS )
         {
-            /* Static shared memory shall be reserved from any other use. */
-            struct membank *membank = &mem->bank[mem->nr_banks];
             struct shm_node *shm_node = &bootinfo.shminfo.node[i];
-
-            membank->start = paddr;
-            membank->size = size;
-            membank->type = MEMBANK_STATIC_DOMAIN;
-            mem->nr_banks++;
+            struct meminfo *mem = &bootinfo.reserved_mem;
 
             /* Record static shared memory node info in bootinfo.shminfo */
             safe_strcpy(shm_node->shm_id, shm_id);
             bootinfo.shminfo.nr_nodes++;
 
-            /*
-             * Reserved memory bank is recorded together with shm
-             * node info in shm_data, to assist doing shm node verification.
-             */
             shm_data.shm_nodes[i].node = shm_node;
-            shm_data.shm_nodes[i].membank = membank;
             shm_data.nr_nodes++;
+            if ( !paddr_assigned )
+                shm_data.shm_nodes[i].tot_size = size;
+            else if ( mem->nr_banks < NR_MEM_BANKS )
+            {
+                struct membank *membank = &mem->bank[mem->nr_banks];
+
+                membank->start = paddr;
+                membank->size = size;
+                membank->type = MEMBANK_STATIC_DOMAIN;
+                mem->nr_banks++;
+
+                /*
+                 * Reserved memory bank is recorded together with shm
+                 * node info in shm_data, to assist doing shm node verification.
+                 */
+                shm_data.shm_nodes[i].membank = membank;
+            }
+            else
+                goto fail;
         }
         else
-        {
-            printk("Warning: Max number of supported memory regions reached.\n");
-            return -ENOSPC;
-        }
+            goto fail;
     }
+
     /*
      * keep a count of the number of borrowers, which later may be used
      * to calculate the reference count.
@@ -556,6 +590,10 @@ static int __init process_shm_node(const void *fdt, int node,
         bootinfo.shminfo.node[i].nr_shm_borrowers++;
 
     return 0;
+
+ fail:
+    printk("Warning: Max number of supported memory regions reached\n");
+    return -ENOSPC;
 }
 #else
 static int __init process_shm_node(const void *fdt, int node,
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index a6ce22b423..91feb8f37c 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -49,6 +49,51 @@ boolean_param("ext_regions", opt_ext_regions);
 static u64 __initdata dom0_mem;
 static bool __initdata dom0_mem_set;
 
+#ifdef CONFIG_STATIC_SHM
+#define NR_SHM_BANKS 16
+
+/*
+ * A static shared memory node could be banked with a statically
+ * configured host memory bank, or a set of arbitrary host memory
+ * banks allocated from heap.
+ */
+struct shm_meminfo {
+    unsigned int nr_banks;
+    struct membank bank[NR_SHM_BANKS];
+    paddr_t tot_size;
+};
+
+/*
+ * struct shm_memnode holds banked host memory info for a static
+ * shared memory node
+ */
+struct shm_memnode {
+    char shm_id[MAX_SHM_ID_LENGTH];
+    struct shm_meminfo meminfo;
+};
+
+static __initdata struct {
+    unsigned int nr_nodes;
+    struct shm_memnode node[NR_MEM_BANKS];
+} shm_memdata;
+
+static void __init retrieve_shm_meminfo(void *mem, unsigned int *max_mem_banks,
+                                        struct membank **bank,
+                                        unsigned int **nr_banks)
+{
+    struct shm_meminfo *meminfo = (struct shm_meminfo *)mem;
+
+    if ( max_mem_banks )
+        *max_mem_banks = NR_SHM_BANKS;
+
+    if ( nr_banks )
+        *nr_banks = &(meminfo->nr_banks);
+
+    if ( bank )
+        *bank = meminfo->bank;
+}
+#endif
+
 static int __init parse_dom0_mem(const char *s)
 {
     dom0_mem_set = true;
@@ -95,6 +140,9 @@ static void __init retrieve_meminfo(void *mem, unsigned int *max_mem_banks,
 
 retrieve_fn __initdata retrievers[MAX_MEMINFO_TYPE] = {
     [NORMAL_MEMINFO] = retrieve_meminfo,
+#ifdef CONFIG_STATIC_SHM
+    [SHM_MEMINFO] = retrieve_shm_meminfo,
+#endif
 };
 
 unsigned int __init dom0_max_vcpus(void)
@@ -842,6 +890,24 @@ static int __init acquire_nr_borrower_domain(const char *shm_id,
     return -EINVAL;
 }
 
+static struct shm_memnode * __init find_shm_memnode(const char *shm_id)
+{
+    unsigned int i;
+    struct shm_memnode *shm_memnode;
+
+    for ( i = 0 ; i < shm_memdata.nr_nodes; i++ )
+    {
+        shm_memnode = &shm_memdata.node[i];
+
+        if ( strcmp(shm_id, shm_memnode->shm_id) == 0 )
+            return shm_memnode;
+    }
+
+    shm_memnode = &shm_memdata.node[i];
+    safe_strcpy(shm_memnode->shm_id, shm_id);
+    return shm_memnode;
+}
+
 /*
  * This function checks whether the static shared memory region is
  * already allocated to dom_io.
@@ -987,6 +1053,102 @@ static int __init append_shm_bank_to_domain(struct kernel_info *kinfo,
     return 0;
 }
 
+/* Parse "xen,shared-mem" property in static shared memory node */
+static struct shm_memnode * __init parse_shm_property(struct domain *d,
+                                    const struct dt_device_node *dt_node,
+                                    bool *paddr_assigned, paddr_t *gbase,
+                                    const char *shm_id)
+{
+    uint32_t addr_cells, size_cells;
+    const struct dt_property *prop;
+    const __be32 *cells;
+    uint32_t len;
+    unsigned int i;
+    paddr_t pbase, psize;
+    struct shm_memnode *shm_memnode;
+
+    /* xen,shared-mem = <pbase, gbase, size>; And pbase could be optional. */
+    prop = dt_find_property(dt_node, "xen,shared-mem", &len);
+    BUG_ON(!prop);
+    cells = (const __be32 *)prop->value;
+
+    addr_cells = dt_n_addr_cells(dt_node);
+    size_cells = dt_n_size_cells(dt_node);
+    if ( len != dt_cells_to_size(addr_cells + size_cells + addr_cells) )
+    {
+        /* pbase is not provided in "xen,shared-mem" */
+        if ( len == dt_cells_to_size(size_cells + addr_cells) )
+            *paddr_assigned = false;
+        else
+        {
+            printk("fdt: invalid `xen,shared-mem` property.\n");
+            return NULL;
+        }
+    }
+
+    /*
+     * If we firstly process the shared memory node with unique "xen,shm-id",
+     * we allocate a new member "shm_memnode" for it in shm_memdata.
+     */
+    shm_memnode = find_shm_memnode(shm_id);
+    BUG_ON(!shm_memnode);
+    if ( !(*paddr_assigned) )
+    {
+        device_tree_get_reg(&cells, addr_cells, size_cells, gbase, &psize);
+        if ( shm_memnode->meminfo.tot_size == 0 )
+            goto out_early1;
+        else
+            goto out_early2;
+    }
+    else
+    {
+        device_tree_get_reg(&cells, addr_cells, addr_cells, &pbase, gbase);
+        psize = dt_read_number(cells, size_cells);
+    }
+
+    /*
+     * The static shared memory node #dt_node is banked with a
+     * statically configured host memory bank.
+     */
+    shm_memnode->meminfo.bank[0].start = pbase;
+    shm_memnode->meminfo.bank[0].size = psize;
+    shm_memnode->meminfo.nr_banks = 1;
+
+    if ( !IS_ALIGNED(pbase, PAGE_SIZE) )
+    {
+        printk("%pd: physical address 0x%"PRIpaddr" is not suitably aligned.\n",
+               d, pbase);
+        return NULL;
+    }
+
+    for ( i = 0; i < PFN_DOWN(psize); i++ )
+        if ( !mfn_valid(mfn_add(maddr_to_mfn(pbase), i)) )
+        {
+            printk("%pd: invalid physical MFN 0x%"PRI_mfn"\n for static shared memory node\n",
+                   d, mfn_x(mfn_add(maddr_to_mfn(pbase), i)));
+            return NULL;
+        }
+
+ out_early1:
+    if ( !IS_ALIGNED(psize, PAGE_SIZE) )
+    {
+        printk("%pd: size 0x%"PRIpaddr" is not suitably aligned\n",
+               d, psize);
+        return NULL;
+    }
+    shm_memnode->meminfo.tot_size = psize;
+
+ out_early2:
+    if ( !IS_ALIGNED(*gbase, PAGE_SIZE) )
+    {
+        printk("%pd: guest address 0x%"PRIpaddr" is not suitably aligned.\n",
+               d, *gbase);
+        return NULL;
+    }
+
+    return shm_memnode;
+}
+
 static int __init process_shm(struct domain *d, struct kernel_info *kinfo,
                               const struct dt_device_node *node)
 {
@@ -994,51 +1156,17 @@ static int __init process_shm(struct domain *d, struct kernel_info *kinfo,
 
     dt_for_each_child_node(node, shm_node)
     {
-        const struct dt_property *prop;
-        const __be32 *cells;
-        uint32_t addr_cells, size_cells;
         paddr_t gbase, pbase, psize;
         int ret = 0;
-        unsigned int i;
         const char *role_str;
         const char *shm_id;
         bool owner_dom_io = true;
+        bool paddr_assigned = true;
+        struct shm_memnode *shm_memnode;
 
         if ( !dt_device_is_compatible(shm_node, "xen,domain-shared-memory-v1") )
             continue;
 
-        /*
-         * xen,shared-mem = <pbase, gbase, size>;
-         * TODO: pbase is optional.
-         */
-        addr_cells = dt_n_addr_cells(shm_node);
-        size_cells = dt_n_size_cells(shm_node);
-        prop = dt_find_property(shm_node, "xen,shared-mem", NULL);
-        BUG_ON(!prop);
-        cells = (const __be32 *)prop->value;
-        device_tree_get_reg(&cells, addr_cells, addr_cells, &pbase, &gbase);
-        psize = dt_read_number(cells, size_cells);
-        if ( !IS_ALIGNED(pbase, PAGE_SIZE) || !IS_ALIGNED(gbase, PAGE_SIZE) )
-        {
-            printk("%pd: physical address 0x%"PRIpaddr", or guest address 0x%"PRIpaddr" is not suitably aligned.\n",
-                   d, pbase, gbase);
-            return -EINVAL;
-        }
-        if ( !IS_ALIGNED(psize, PAGE_SIZE) )
-        {
-            printk("%pd: size 0x%"PRIpaddr" is not suitably aligned\n",
-                   d, psize);
-            return -EINVAL;
-        }
-
-        for ( i = 0; i < PFN_DOWN(psize); i++ )
-            if ( !mfn_valid(mfn_add(maddr_to_mfn(pbase), i)) )
-            {
-                printk("%pd: invalid physical address 0x%"PRI_mfn"\n",
-                       d, mfn_x(mfn_add(maddr_to_mfn(pbase), i)));
-                return -EINVAL;
-            }
-
         /*
          * "role" property is optional and if it is defined explicitly,
          * then the owner domain is not the default "dom_io" domain.
@@ -1053,6 +1181,13 @@ static int __init process_shm(struct domain *d, struct kernel_info *kinfo,
         }
         BUG_ON((strlen(shm_id) <= 0) || (strlen(shm_id) >= MAX_SHM_ID_LENGTH));
 
+        shm_memnode = parse_shm_property(d, shm_node, &paddr_assigned, &gbase,
+                                         shm_id);
+        if ( !shm_memnode )
+            return -EINVAL;
+        pbase = shm_memnode->meminfo.bank[0].start;
+        psize = shm_memnode->meminfo.bank[0].size;
+
         /*
          * DOMID_IO is a fake domain and is not described in the Device-Tree.
          * Therefore when the owner of the shared region is DOMID_IO, we will
diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
index c42fd83db2..fc5ca11e08 100644
--- a/xen/arch/arm/include/asm/setup.h
+++ b/xen/arch/arm/include/asm/setup.h
@@ -59,6 +59,9 @@ struct meminfo {
 
 enum meminfo_type {
     NORMAL_MEMINFO,
+#ifdef CONFIG_STATIC_SHM
+    SHM_MEMINFO,
+#endif
     MAX_MEMINFO_TYPE,
 };
 
-- 
2.25.1


