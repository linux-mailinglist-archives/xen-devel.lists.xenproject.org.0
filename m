Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 750F3806A56
	for <lists+xen-devel@lfdr.de>; Wed,  6 Dec 2023 10:07:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.649013.1013276 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAnrt-0004eg-Vg; Wed, 06 Dec 2023 09:06:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 649013.1013276; Wed, 06 Dec 2023 09:06:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAnrt-0004bN-Qk; Wed, 06 Dec 2023 09:06:57 +0000
Received: by outflank-mailman (input) for mailman id 649013;
 Wed, 06 Dec 2023 09:06:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B4rn=HR=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1rAnrs-00022d-3b
 for xen-devel@lists.xenproject.org; Wed, 06 Dec 2023 09:06:56 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id cc690495-9416-11ee-9b0f-b553b5be7939;
 Wed, 06 Dec 2023 10:06:53 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2B7081474;
 Wed,  6 Dec 2023 01:07:39 -0800 (PST)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E69A53F762;
 Wed,  6 Dec 2023 01:06:49 -0800 (PST)
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
X-Inumbo-ID: cc690495-9416-11ee-9b0f-b553b5be7939
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
Subject: [PATCH v5 05/11] xen/arm: use paddr_assigned to indicate whether host address is provided
Date: Wed,  6 Dec 2023 17:06:17 +0800
Message-Id: <20231206090623.1932275-6-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231206090623.1932275-1-Penny.Zheng@arm.com>
References: <20231206090623.1932275-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We use paddr_assigned to indicate whether host address is provided, by
checking the length of "xen,shared-mem" property.

The shm matching criteria shall also be adapt to cover the new scenario, by
adding when host address is not provided, if SHMID matches, the region size
must exactly match too.

During domain creation, right now, a static shared memory node could be
banked with a statically configured host memory bank, or arbitrary
host memory of dedicated size, which will later be allocated from heap by Xen.
To cover both scenarios, we create a new structure shm_meminfo. It is very
alike meminfo, but with the maximum array size being a smaller number
NR_SHM_BANKS(16).
As "shm_meminfo" is also a new member of "enum meminfo_type", we shall implement
its own callback "retrieve_shm_meminfo" to have access to all MACRO
helpers, e.g. GET_MEMBANK(...).

Also, to make codes tidy and clear, we extract codes about parsing
"xen,shared-mem" property from function "process_shm" and move them into
a new helper "parse_shm_property".

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
v1 -> v2
- In order to get allocated banked host memory info during domain creat    ion,
we create a new structure shm_meminfo. It is very alike meminfo, with
the maximum array size being NR_SHM_BANKS. As shm_meminfo is a new
member of type meminfo_type, we shall implement its own callback
retrieve_shm_meminfo to have access to all MACRO helpers, e.g.
GET_MEMBANK(...)
- rename "acquire_shm_memnode" to "find_shm_memnode"
---
v2 -> v3
- rebase and no changes
---
v3 -> v4:
- rebase and no change
---
v4 -> v5:
- fix bugs of that tot_size and membank shall not be member of union,
but struct, to differentiate two types of static shared memory node.
---
 xen/arch/arm/domain_build.c             |   3 +
 xen/arch/arm/include/asm/setup.h        |  14 +-
 xen/arch/arm/include/asm/static-shmem.h |   3 +
 xen/arch/arm/static-shmem.c             | 360 ++++++++++++++++++------
 4 files changed, 293 insertions(+), 87 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index a8bc78baa5..c69d481d34 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -70,6 +70,9 @@ static void __init retrieve_meminfo(void *mem, unsigned int *max_mem_banks,
 
 retrieve_fn __initdata retrievers[MAX_MEMINFO_TYPE] = {
     [NORMAL_MEMINFO] = retrieve_meminfo,
+#ifdef CONFIG_STATIC_SHM
+    [SHM_MEMINFO] = retrieve_shm_meminfo,
+#endif
 };
 #endif
 
diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
index bc5f08be97..043588cd2d 100644
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
 
@@ -150,7 +153,16 @@ struct bootinfo {
         unsigned int nr_nodes;
         struct {
             struct shm_node node;
-            const struct membank *membank;
+            /*
+             * For a static shared memory node, it is either banked with
+             * a statically configured host memory bank, or arbitrary host
+             * memory which will be allocated by Xen with a specified total
+             * size(tot_size).
+             */
+            struct {
+                const struct membank *membank;
+                paddr_t tot_size;
+            };
         } shm_nodes[NR_MEM_BANKS];
     } shminfo;
 #endif
diff --git a/xen/arch/arm/include/asm/static-shmem.h b/xen/arch/arm/include/asm/static-shmem.h
index 66a3f4c146..a67445cec8 100644
--- a/xen/arch/arm/include/asm/static-shmem.h
+++ b/xen/arch/arm/include/asm/static-shmem.h
@@ -24,6 +24,9 @@ static inline int process_shm_chosen(struct domain *d,
 int process_shm_node(const void *fdt, int node, uint32_t address_cells,
                      uint32_t size_cells);
 
+void retrieve_shm_meminfo(void *mem, unsigned int *max_mem_banks,
+                          struct membank **bank,
+                          unsigned int **nr_banks);
 #else /* !CONFIG_STATIC_SHM */
 
 static inline int make_resv_memory_node(const struct domain *d, void *fdt,
diff --git a/xen/arch/arm/static-shmem.c b/xen/arch/arm/static-shmem.c
index 6a3d8a54bd..a9eb26d543 100644
--- a/xen/arch/arm/static-shmem.c
+++ b/xen/arch/arm/static-shmem.c
@@ -6,6 +6,50 @@
 #include <asm/domain_build.h>
 #include <asm/static-shmem.h>
 
+#define NR_SHM_BANKS 16
+
+/*
+ * There are two types of static shared memory node:
+ * A static shared memory node could be banked with a statically
+ * configured host memory bank, or a set of arbitrary host memory
+ * banks allocated from heap by Xen on runtime.
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
+void __init retrieve_shm_meminfo(void *mem, unsigned int *max_mem_banks,
+                                 struct membank **bank,
+                                 unsigned int **nr_banks)
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
+
 static int __init acquire_nr_borrower_domain(const char *shm_id,
                                              unsigned long *nr_borrowers)
 {
@@ -172,6 +216,129 @@ static int __init append_shm_bank_to_domain(struct kernel_info *kinfo,
     return 0;
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
+    if ( i == NR_MEM_BANKS )
+        return NULL;
+
+    shm_memnode = &shm_memdata.node[i];
+    safe_strcpy(shm_memnode->shm_id, shm_id);
+    shm_memdata.nr_nodes++;
+    return shm_memnode;
+}
+
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
+        /* Whether it is a new shm node? */
+        if ( shm_memnode->meminfo.tot_size == 0 )
+            goto out_early1;
+        else
+            goto out_early2;
+    }
+    else
+    {
+        device_tree_get_reg(&cells, addr_cells, addr_cells, &pbase, gbase);
+        psize = dt_read_number(cells, size_cells);
+
+        /* Whether it is a new shm node? */
+        if ( shm_memnode->meminfo.nr_banks != 0 )
+            goto out_early2;
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
 int __init process_shm(struct domain *d, struct kernel_info *kinfo,
                        const struct dt_device_node *node)
 {
@@ -179,51 +346,17 @@ int __init process_shm(struct domain *d, struct kernel_info *kinfo,
 
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
-        psize = dt_read_paddr(cells, size_cells);
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
@@ -238,6 +371,13 @@ int __init process_shm(struct domain *d, struct kernel_info *kinfo,
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
@@ -349,10 +489,10 @@ int __init process_shm_node(const void *fdt, int node, uint32_t address_cells,
 {
     const struct fdt_property *prop, *prop_id, *prop_role;
     const __be32 *cell;
-    paddr_t paddr, gaddr, size, end;
+    paddr_t paddr, gaddr, size;
     unsigned int i;
     int len;
-    bool owner = false;
+    bool owner = false, paddr_assigned = true;
     const char *shm_id;
 
     if ( address_cells < 1 || size_cells < 1 )
@@ -404,96 +544,140 @@ int __init process_shm_node(const void *fdt, int node, uint32_t address_cells,
 
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
-
-    if ( !size )
+    if ( !paddr_assigned )
+        device_tree_get_reg(&cell, address_cells, size_cells, &gaddr, &size);
+    else
     {
-        printk("fdt: the size for static shared memory region can not be zero\n");
-        return -EINVAL;
-    }
+        paddr_t end;
+
+        device_tree_get_reg(&cell, address_cells, address_cells, &paddr, &gaddr);
+        size = dt_next_cell(size_cells, &cell);
+
+        if ( !size )
+        {
+            printk("fdt: the size for static shared memory region can not be zero\n");
+            return -EINVAL;
+        }
+
+        end = paddr + size;
+        if ( end <= paddr )
+        {
+            printk("fdt: static shared memory region %s overflow\n", shm_id);
+            return -EINVAL;
+        }
 
-    end = paddr + size;
-    if ( end <= paddr )
-    {
-        printk("fdt: static shared memory region %s overflow\n", shm_id);
-        return -EINVAL;
     }
 
     for ( i = 0; i < bootinfo.shminfo.nr_nodes; i++ )
     {
-        paddr_t bank_start = bootinfo.shminfo.shm_nodes[i].membank->start;
-        paddr_t bank_size = bootinfo.shminfo.shm_nodes[i].membank->size;
         const char *bank_id = bootinfo.shminfo.shm_nodes[i].node.shm_id;
+        bool is_shmid_equal = strncmp(shm_id, bank_id, MAX_SHM_ID_LENGTH) == 0 ?
+                              true : false;
 
         /*
          * Meet the following check:
+         * when host address is provided:
          * 1) The shm ID matches and the region exactly match
          * 2) The shm ID doesn't match and the region doesn't overlap
          * with an existing one
+         * when host address is not provided:
+         * 1) The shm ID matches and the region size exactly match
+         */
+        /*
+         * For a static shared memory node, it is either banked with
+         * a statically configured host memory bank(membank != NULL), or
+         * arbitrary host memory which will later be allocated by Xen(
+         * tot_size != 0).
          */
-        if ( paddr == bank_start && size == bank_size )
+        if ( bootinfo.shminfo.shm_nodes[i].membank != NULL )
         {
-            if ( strncmp(shm_id, bank_id, MAX_SHM_ID_LENGTH) == 0 )
+            paddr_t bank_start = bootinfo.shminfo.shm_nodes[i].membank->start;
+            paddr_t bank_size = bootinfo.shminfo.shm_nodes[i].membank->size;
+            bool is_same_region = (paddr == bank_start) && (size == bank_size) ?
+                                  true : false;
+
+            if ( is_same_region && is_shmid_equal )
                 break;
-            else
+            else if ( is_same_region || is_shmid_equal )
             {
                 printk("fdt: xen,shm-id %s does not match for all the nodes using the same region.\n",
                        shm_id);
                 return -EINVAL;
             }
         }
-        else if ( strcmp(shm_id, mem->bank[i].shm_id) != 0 )
-            continue;
         else
         {
-            printk("fdt: different shared memory region could not share the same shm ID %s\n",
-                   shm_id);
-            return -EINVAL;
+            paddr_t tot_size = bootinfo.shminfo.shm_nodes[i].tot_size;
+            bool is_same_region = tot_size == size ? true : false;
+
+            if ( !paddr_assigned && is_same_region && is_shmid_equal )
+                break;
+            else if ( is_shmid_equal )
+            {
+                if ( paddr_assigned )
+                {
+                    printk("fdt: two different types of static shared memory region could not share the same shm-id %s\n",
+                           shm_id);
+                    return -EINVAL;
+                }
+
+                printk("fdt: when host address is not provided, if xen,shm-id matches, size must stay the same too(%"PRIpaddr" -> %"PRIpaddr")\n",
+                       size, tot_size);
+                return -EINVAL;
+            }
         }
     }
 
     if ( i == bootinfo.shminfo.nr_nodes )
     {
-        struct meminfo *mem = &bootinfo.reserved_mem;
-
-        if ( (i < NR_MEM_BANKS) && (mem->nr_banks < NR_MEM_BANKS) )
+        if ( i < NR_MEM_BANKS )
         {
-            struct membank *membank = &mem->bank[mem->nr_banks];
             struct shm_node *shm_node = &bootinfo.shminfo.shm_nodes[i].node;
-
-            if ( check_reserved_regions_overlap(paddr, size) )
-                return -EINVAL;
-
-            /* Static shared memory shall be reserved from any other use. */
-            membank->start = paddr;
-            membank->size = size;
-            membank->type = MEMBANK_STATIC_DOMAIN;
-            mem->nr_banks++;
+            struct meminfo *mem = &bootinfo.reserved_mem;
 
             /* Record static shared memory node info in bootinfo.shminfo */
             safe_strcpy(shm_node->shm_id, shm_id);
-            /*
-             * Reserved memory bank is recorded together to assist
-             * doing shm node verification.
-             */
-            bootinfo.shminfo.shm_nodes[i].membank = membank;
             bootinfo.shminfo.nr_nodes++;
+
+            if ( !paddr_assigned )
+                bootinfo.shminfo.shm_nodes[i].tot_size = size;
+            else if ( mem->nr_banks < NR_MEM_BANKS )
+            {
+                struct membank *membank = &mem->bank[mem->nr_banks];
+
+                if ( check_reserved_regions_overlap(paddr, size) )
+                    return -EINVAL;
+
+                /* Static shared memory shall be reserved from any other use. */
+                membank->start = paddr;
+                membank->size = size;
+                membank->type = MEMBANK_STATIC_DOMAIN;
+                mem->nr_banks++;
+
+                /*
+                 * Reserved memory bank is recorded together to assist
+                 * doing shm node verification.
+                 */
+                bootinfo.shminfo.shm_nodes[i].membank = membank;
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
@@ -502,6 +686,10 @@ int __init process_shm_node(const void *fdt, int node, uint32_t address_cells,
         bootinfo.shminfo.shm_nodes[i].node.nr_shm_borrowers++;
 
     return 0;
+
+ fail:
+    printk("Warning: Max number of supported memory regions reached.\n");
+    return -ENOSPC;
 }
 
 int __init make_resv_memory_node(const struct domain *d, void *fdt,
-- 
2.25.1


