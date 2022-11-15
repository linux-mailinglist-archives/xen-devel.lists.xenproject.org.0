Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8916629013
	for <lists+xen-devel@lfdr.de>; Tue, 15 Nov 2022 03:53:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.443646.698386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oum4c-00035x-Ux; Tue, 15 Nov 2022 02:53:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 443646.698386; Tue, 15 Nov 2022 02:53:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oum4c-000324-PR; Tue, 15 Nov 2022 02:53:18 +0000
Received: by outflank-mailman (input) for mailman id 443646;
 Tue, 15 Nov 2022 02:53:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pkVF=3P=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1oum4b-0008Vs-5K
 for xen-devel@lists.xenproject.org; Tue, 15 Nov 2022 02:53:17 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id a6e108b4-6490-11ed-8fd2-01056ac49cbb;
 Tue, 15 Nov 2022 03:53:15 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 81CFD13D5;
 Mon, 14 Nov 2022 18:53:21 -0800 (PST)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A383D3F73B;
 Mon, 14 Nov 2022 18:53:12 -0800 (PST)
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
X-Inumbo-ID: a6e108b4-6490-11ed-8fd2-01056ac49cbb
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH v1 08/13] xen/arm: use paddr_assigned to indicate whether host address is provided
Date: Tue, 15 Nov 2022 10:52:30 +0800
Message-Id: <20221115025235.1378931-9-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221115025235.1378931-1-Penny.Zheng@arm.com>
References: <20221115025235.1378931-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We use paddr_assigned to indicate whether host address is provided, by
checking the length of "xen,shared-mem" property.

And the shm matching criteria shall also be adapt to the new scenario, by
adding when host address is not provided, if SHMID matches, the region size
must exactly match too.

Also, to make codes tidy and clear, we extract codes about parsing
"xen,shared-mem" property from function "process_shm" and move them into
a new helper "parse_shm_property".

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
 xen/arch/arm/bootfdt.c      |  87 +++++++++++++++++++--------
 xen/arch/arm/domain_build.c | 114 +++++++++++++++++++++++++-----------
 2 files changed, 141 insertions(+), 60 deletions(-)

diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
index 2f34a8ea83..efaf49fd56 100644
--- a/xen/arch/arm/bootfdt.c
+++ b/xen/arch/arm/bootfdt.c
@@ -387,7 +387,7 @@ static int __init process_shm_node(const void *fdt, int node,
     struct shm_meminfo *shm_mem = &bootinfo.shm_mem;
     unsigned int i;
     int len;
-    bool owner = false;
+    bool owner = false, paddr_assigned = true;
     const char *shm_id;
 
     if ( address_cells < 1 || size_cells < 1 )
@@ -428,7 +428,7 @@ static int __init process_shm_node(const void *fdt, int node,
     }
 
     /*
-     * xen,shared-mem = <paddr, gaddr, size>;
+     * xen,shared-mem = <paddr, gaddr, size>, and paddr could be optional
      * Memory region starting from physical address #paddr of #size shall
      * be mapped to guest physical address #gaddr as static shared memory
      * region.
@@ -439,16 +439,24 @@ static int __init process_shm_node(const void *fdt, int node,
 
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
@@ -458,29 +466,45 @@ static int __init process_shm_node(const void *fdt, int node,
 
     for ( i = 0; i < shm_mem->nr_banks; i++ )
     {
-        paddr_t bank_start = shm_mem->bank[i].mem.bank->start;
-        paddr_t bank_size = shm_mem->bank[i].mem.bank->size;
-
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
+        if ( !paddr_assigned || (paddr == shm_mem->bank[i].mem.bank->start &&
+                                 size == shm_mem->bank[i].mem.bank->size) )
         {
             if ( strncmp(shm_id,
                          shm_mem->bank[i].shm_id, MAX_SHM_ID_LENGTH) == 0 )
+            {
+                if ( !paddr_assigned &&
+                     (size != shm_mem->bank[i].mem.banks.total_size) )
+                {
+                    printk("fdt: when host address is not provided, if xen,shm-id %s matches, size must stay the same too.\n",
+                           shm_id);
+                    return -EINVAL;
+                }
+
                 break;
-            else
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
+            paddr_t bank_start = shm_mem->bank[i].mem.bank->start;
+            paddr_t bank_size = shm_mem->bank[i].mem.bank->size;
             paddr_t end = paddr + size;
             paddr_t bank_end = bank_start + bank_size;
 
@@ -512,26 +536,35 @@ static int __init process_shm_node(const void *fdt, int node,
 
     if ( i == shm_mem->nr_banks )
     {
-        if ( (i < NR_MEM_BANKS) && (mem->nr_banks < NR_MEM_BANKS) )
+        if ( i < NR_MEM_BANKS )
         {
-            /* Static shared memory shall be reserved from any other use. */
-            struct membank *membank = &mem->bank[mem->nr_banks];
+            if ( !paddr_assigned )
+            {
+                shm_mem->bank[i].mem.banks.total_size = size;
+                goto out;
+            }
+            else if ( mem->nr_banks < NR_MEM_BANKS )
+            {
+                /* Static shared memory shall be reserved from any other use. */
+                struct membank *membank = &mem->bank[mem->nr_banks];
 
-            membank->start = paddr;
-            membank->size = size;
-            membank->type = MEMBANK_STATIC_DOMAIN;
-            mem->nr_banks++;
+                membank->start = paddr;
+                membank->size = size;
+                membank->type = MEMBANK_STATIC_DOMAIN;
+                mem->nr_banks++;
 
+                shm_mem->bank[i].mem.bank = membank;
+            }
+            else
+                goto fail;
+ out:
             safe_strcpy(shm_mem->bank[i].shm_id, shm_id);
-            shm_mem->bank[i].mem.bank = membank;
             shm_mem->nr_banks++;
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
@@ -540,6 +573,10 @@ static int __init process_shm_node(const void *fdt, int node,
         shm_mem->bank[i].nr_shm_borrowers++;
 
     return 0;
+
+ fail:
+    printk("Warning: Max number of supported memory regions reached.\n");
+    return -ENOSPC;
 }
 #else
 static int __init process_shm_node(const void *fdt, int node,
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index d0f7fc8fd7..80d37245a8 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -1177,6 +1177,81 @@ static int __init append_shm_bank_to_domain(struct kernel_info *kinfo,
     return 0;
 }
 
+static int __init parse_shm_property(struct domain *d,
+                                     const struct dt_device_node *shm_node,
+                                     bool *paddr_assigned, paddr_t *pbase,
+                                     paddr_t *gbase, paddr_t *psize)
+{
+    const struct dt_property *prop;
+    const __be32 *cells;
+    uint32_t len;
+    unsigned int i;
+    uint32_t addr_cells, size_cells;
+
+    addr_cells = dt_n_addr_cells(shm_node);
+    size_cells = dt_n_size_cells(shm_node);
+
+    /* xen,shared-mem = <pbase, gbase, size>; And pbase could be optional. */
+    prop = dt_find_property(shm_node, "xen,shared-mem", &len);
+    BUG_ON(!prop);
+    cells = (const __be32 *)prop->value;
+
+    if ( len != dt_cells_to_size(addr_cells + size_cells + addr_cells) )
+    {
+        /* pbase is not provided in "xen,shared-mem" */
+        if ( len == dt_cells_to_size(size_cells + addr_cells) )
+            *paddr_assigned = false;
+        else
+        {
+            printk("fdt: invalid `xen,shared-mem` property.\n");
+            return -EINVAL;
+        }
+    }
+
+    if ( !*paddr_assigned )
+    {
+        device_tree_get_reg(&cells, addr_cells, size_cells, gbase, psize);
+        goto out;
+    }
+    else
+    {
+        device_tree_get_reg(&cells, addr_cells, addr_cells, pbase, gbase);
+        *psize = dt_read_number(cells, size_cells);
+    }
+
+    if ( !IS_ALIGNED(*pbase, PAGE_SIZE) )
+    {
+        printk("%pd: physical address 0x%"PRIpaddr" is not suitably aligned.\n",
+               d, *pbase);
+        return -EINVAL;
+    }
+
+    for ( i = 0; i < PFN_DOWN(*psize); i++ )
+        if ( !mfn_valid(mfn_add(maddr_to_mfn(*pbase), i)) )
+        {
+            printk("%pd: invalid physical address 0x%"PRI_mfn"\n",
+                   d, mfn_x(mfn_add(maddr_to_mfn(*pbase), i)));
+            return -EINVAL;
+        }
+
+ out:
+    if ( !IS_ALIGNED(*psize, PAGE_SIZE) )
+    {
+        printk("%pd: size 0x%"PRIpaddr" is not suitably aligned\n",
+               d, *psize);
+        return -EINVAL;
+    }
+
+    if ( !IS_ALIGNED(*gbase, PAGE_SIZE) )
+    {
+        printk("%pd: guest address 0x%"PRIpaddr" is not suitably aligned.\n",
+               d, *gbase);
+        return -EINVAL;
+    }
+
+    return 0;
+}
+
 static int __init process_shm(struct domain *d, struct kernel_info *kinfo,
                               const struct dt_device_node *node)
 {
@@ -1184,12 +1259,8 @@ static int __init process_shm(struct domain *d, struct kernel_info *kinfo,
 
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
         bool owner_dom_io = true, paddr_assigned = true;
@@ -1198,37 +1269,10 @@ static int __init process_shm(struct domain *d, struct kernel_info *kinfo,
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
+        ret = parse_shm_property(d, shm_node, &paddr_assigned,
+                                 &pbase, &gbase, &psize);
+        if ( ret )
+            return ret;
 
         /*
          * "role" property is optional and if it is defined explicitly,
-- 
2.25.1


