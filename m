Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90D1F6A0275
	for <lists+xen-devel@lfdr.de>; Thu, 23 Feb 2023 06:42:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.499866.771196 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pV4MO-0001sq-7x; Thu, 23 Feb 2023 05:41:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 499866.771196; Thu, 23 Feb 2023 05:41:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pV4MO-0001qQ-3u; Thu, 23 Feb 2023 05:41:40 +0000
Received: by outflank-mailman (input) for mailman id 499866;
 Thu, 23 Feb 2023 05:41:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z4j0=6T=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1pV4MM-0001BN-Q1
 for xen-devel@lists.xenproject.org; Thu, 23 Feb 2023 05:41:39 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id bd647e09-b33c-11ed-88bb-e56d68cac8db;
 Thu, 23 Feb 2023 06:41:37 +0100 (CET)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 13D3B1FB;
 Wed, 22 Feb 2023 21:42:20 -0800 (PST)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6075E3F587;
 Wed, 22 Feb 2023 21:41:34 -0800 (PST)
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
X-Inumbo-ID: bd647e09-b33c-11ed-88bb-e56d68cac8db
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Penny Zheng <Penny.Zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH v2 5/8] xen/arm: support static shared memory when host address not provided
Date: Thu, 23 Feb 2023 13:41:02 +0800
Message-Id: <20230223054105.2357217-6-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230223054105.2357217-1-Penny.Zheng@arm.com>
References: <20230223054105.2357217-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In order to support static shared memory when host address not provided,
we shall do the following modification:
- we shall let Xen allocate memory from heap for static shared memory
at first domain, no matter it is owner or borrower.
- In acquire_shared_memory_bank, as static shared memory has already
been allocated from heap, we shall assign them to the owner domain
using function "assign_pages".
- Function get_shm_pages_reference is created to add as many
additional reference as the number of borrowers.
- We implement a new helper "add_foreign_mapping_for_borrower" to set
up foreign memory mapping for borrower.

Instead of using multiple function parameters to deliver various shm-related
info, like host physical address, SHMID, etc, and with the introduction
of new struct "shm_memnode" to include banked host memory info, we switch to
use "shm_memnode" as function parameter to replace them all, to make codes more
clear and tidy.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
v1 -> v2:
- combine commits 4 - 6 in Serie 1
- Adapt to changes of introducing "struct shm_memnode"
---
 xen/arch/arm/domain_build.c | 222 +++++++++++++++++++++++++-----------
 1 file changed, 155 insertions(+), 67 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 91feb8f37c..9b4aabaf22 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -869,6 +869,11 @@ static void __init assign_static_memory_11(struct domain *d,
 }
 
 #ifdef CONFIG_STATIC_SHM
+static bool __init is_shm_allocated_from_heap(struct shm_memnode *node)
+{
+    return (node->meminfo.nr_banks != 0);
+}
+
 static int __init acquire_nr_borrower_domain(const char *shm_id,
                                              unsigned long *nr_borrowers)
 {
@@ -912,12 +917,12 @@ static struct shm_memnode * __init find_shm_memnode(const char *shm_id)
  * This function checks whether the static shared memory region is
  * already allocated to dom_io.
  */
-static bool __init is_shm_allocated_to_domio(paddr_t pbase)
+static bool __init is_shm_allocated_to_domio(struct shm_memnode *node)
 {
     struct page_info *page;
     struct domain *d;
 
-    page = maddr_to_page(pbase);
+    page = maddr_to_page(node->meminfo.bank[0].start);
     d = page_get_owner_and_reference(page);
     if ( d == NULL )
         return false;
@@ -935,67 +940,129 @@ static bool __init is_shm_allocated_to_domio(paddr_t pbase)
 }
 
 static mfn_t __init acquire_shared_memory_bank(struct domain *d,
-                                               paddr_t pbase, paddr_t psize)
+                                               struct shm_meminfo *meminfo,
+                                               bool paddr_assigned)
 {
-    mfn_t smfn;
-    unsigned long nr_pfns;
     int res;
+    unsigned int i = 0;
 
-    /*
-     * Pages of statically shared memory shall be included
-     * into domain_tot_pages().
-     */
-    nr_pfns = PFN_DOWN(psize);
-    if ( (UINT_MAX - d->max_pages) < nr_pfns )
+    for ( ; i < meminfo->nr_banks; i++ )
     {
-        printk(XENLOG_ERR "%pd: Over-allocation for d->max_pages: %lu.\n",
-               d, nr_pfns);
+        paddr_t pbase = meminfo->bank[i].start, psize = meminfo->bank[i].size;
+        unsigned long nr_pfns;
+
+        /*
+         * Pages of statically shared memory shall be included
+         * into domain_tot_pages().
+         */
+        nr_pfns = PFN_DOWN(psize);
+        if ( (UINT_MAX - d->max_pages) < nr_pfns )
+        {
+            printk(XENLOG_ERR "%pd: Over-allocation for d->max_pages: %lu.\n",
+                   d, nr_pfns);
+            return INVALID_MFN;
+        }
+        d->max_pages += nr_pfns;
+
+        if ( paddr_assigned )
+        {
+            res = acquire_domstatic_pages(d, maddr_to_mfn(pbase), nr_pfns, 0);
+            if ( res )
+            {
+                printk(XENLOG_ERR
+                       "%pd: failed to acquire static memory: %d.\n", d, res);
+                goto fail;
+            }
+        }
+        else
+            /*
+             * When host address is not provided, static shared memory is
+             * allocated from heap and shall be assigned to owner domain.
+             */
+            if ( assign_pages(maddr_to_page(pbase), nr_pfns, d, 0) )
+                goto fail;
+    }
+
+    return maddr_to_mfn(meminfo->bank[0].start);
+
+ fail:
+        while( --i >= 0 )
+            d->max_pages -= PFN_DOWN(meminfo->bank[i].size);
         return INVALID_MFN;
+}
+
+static int __init get_shm_pages_reference(struct domain *d,
+                                          struct shm_meminfo *meminfo,
+                                          unsigned long count)
+{
+    struct page_info *page;
+    unsigned int i = 0, j;
+
+    for ( ; i < meminfo->nr_banks; i++ )
+    {
+        paddr_t pbase = meminfo->bank[i].start, psize = meminfo->bank[i].size;
+        unsigned long nr_pages = PFN_DOWN(psize);
+
+        page = maddr_to_page(pbase);
+        for ( j = 0; j < nr_pages; j++ )
+        {
+            if ( !get_page_nr(page + j, d, count) )
+            {
+                printk(XENLOG_ERR
+                       "Failed to add %lu references to page %"PRI_mfn".\n",
+                       count, mfn_x(page_to_mfn(page + j)));
+                goto fail;
+            }
+        }
     }
-    d->max_pages += nr_pfns;
 
-    smfn = maddr_to_mfn(pbase);
-    res = acquire_domstatic_pages(d, smfn, nr_pfns, 0);
-    if ( res )
+    return 0;
+
+ fail:
+    while ( --j >= 0 )
+        put_page_nr(page + j, count);
+    while ( --i >= 0 )
     {
-        printk(XENLOG_ERR
-               "%pd: failed to acquire static memory: %d.\n", d, res);
-        d->max_pages -= nr_pfns;
-        return INVALID_MFN;
+        page = maddr_to_page(meminfo->bank[i].start);
+        j = PFN_DOWN(meminfo->bank[i].size);
+        while ( --j >= 0 )
+            put_page_nr(page + j, count);
     }
+    return -EINVAL;
 
-    return smfn;
 }
-
 static int __init assign_shared_memory(struct domain *d,
-                                       paddr_t pbase, paddr_t psize,
-                                       paddr_t gbase, const char *shm_id)
+                                       struct shm_memnode *node, paddr_t gbase,
+                                       bool paddr_assigned)
 {
     mfn_t smfn;
-    int ret = 0;
-    unsigned long nr_pages, nr_borrowers, i;
-    struct page_info *page;
-
-    printk("%pd: allocate static shared memory BANK %#"PRIpaddr"-%#"PRIpaddr".\n",
-           d, pbase, pbase + psize);
+    int ret;
+    unsigned long nr_borrowers, i;
+    struct shm_meminfo *meminfo = &node->meminfo;
 
-    smfn = acquire_shared_memory_bank(d, pbase, psize);
+    smfn = acquire_shared_memory_bank(d, meminfo, paddr_assigned);
     if ( mfn_eq(smfn, INVALID_MFN) )
         return -EINVAL;
 
-    /*
-     * DOMID_IO is not auto-translated (i.e. it sees RAM 1:1). So we do not need
-     * to create mapping in the P2M.
-     */
-    nr_pages = PFN_DOWN(psize);
-    if ( d != dom_io )
+    for ( i = 0; i < meminfo->nr_banks; i++ )
     {
-        ret = guest_physmap_add_pages(d, gaddr_to_gfn(gbase), smfn,
-                                      PFN_DOWN(psize));
-        if ( ret )
+        paddr_t pbase = meminfo->bank[i].start, psize = meminfo->bank[i].size;
+
+        /*
+         * DOMID_IO is not auto-translated (i.e. it sees RAM 1:1). So we do
+         * not need to create mapping in the P2M.
+         */
+        if ( d != dom_io )
         {
-            printk(XENLOG_ERR "Failed to map shared memory to %pd.\n", d);
-            return ret;
+            ret = guest_physmap_add_pages(d, gaddr_to_gfn(gbase),
+                                          maddr_to_mfn(pbase),
+                                          PFN_DOWN(psize));
+            if ( ret )
+            {
+                printk(XENLOG_ERR "Failed to map shared memory to %pd.\n", d);
+                return ret;
+            }
+            gbase += psize;
         }
     }
 
@@ -1003,7 +1070,7 @@ static int __init assign_shared_memory(struct domain *d,
      * Get the right amount of references per page, which is the number of
      * borrower domains.
      */
-    ret = acquire_nr_borrower_domain(shm_id, &nr_borrowers);
+    ret = acquire_nr_borrower_domain(node->shm_id, &nr_borrowers);
     if ( ret )
         return ret;
 
@@ -1015,24 +1082,30 @@ static int __init assign_shared_memory(struct domain *d,
      * So if the borrower is created first, it will cause adding pages
      * in the P2M without reference.
      */
-    page = mfn_to_page(smfn);
-    for ( i = 0; i < nr_pages; i++ )
+    return get_shm_pages_reference(d, meminfo, nr_borrowers);
+}
+
+static int __init add_foreign_mapping_for_borrower(struct domain *d,
+                                                   struct shm_memnode *node,
+                                                   paddr_t gbase)
+{
+    unsigned int i = 0;
+    struct shm_meminfo *meminfo = &node->meminfo;
+
+    for ( ; i < meminfo->nr_banks; i++ )
     {
-        if ( !get_page_nr(page + i, d, nr_borrowers) )
-        {
-            printk(XENLOG_ERR
-                   "Failed to add %lu references to page %"PRI_mfn".\n",
-                   nr_borrowers, mfn_x(smfn) + i);
-            goto fail;
-        }
+        paddr_t pbase = meminfo->bank[i].start, psize = meminfo->bank[i].size;
+        int ret;
+
+        /* Set up P2M foreign mapping for borrower domain. */
+        ret = map_regions_p2mt(d, _gfn(PFN_UP(gbase)), PFN_DOWN(psize),
+                               _mfn(PFN_UP(pbase)), p2m_map_foreign_rw);
+        if ( ret )
+            return ret;
+        gbase += psize;
     }
 
     return 0;
-
- fail:
-    while ( --i >= 0 )
-        put_page_nr(page + i, nr_borrowers);
-    return ret;
 }
 
 static int __init append_shm_bank_to_domain(struct kernel_info *kinfo,
@@ -1156,7 +1229,7 @@ static int __init process_shm(struct domain *d, struct kernel_info *kinfo,
 
     dt_for_each_child_node(node, shm_node)
     {
-        paddr_t gbase, pbase, psize;
+        paddr_t gbase;
         int ret = 0;
         const char *role_str;
         const char *shm_id;
@@ -1185,15 +1258,30 @@ static int __init process_shm(struct domain *d, struct kernel_info *kinfo,
                                          shm_id);
         if ( !shm_memnode )
             return -EINVAL;
-        pbase = shm_memnode->meminfo.bank[0].start;
-        psize = shm_memnode->meminfo.bank[0].size;
+
+        /*
+         * When host address is not provided in "xen,shared-mem",
+         * we let Xen allocate memory from heap at first domain.
+         */
+        if ( !paddr_assigned && !is_shm_allocated_from_heap(shm_memnode) )
+        {
+            if ( !allocate_domheap_memory(NULL, shm_memnode->meminfo.tot_size,
+                                          (void *)&shm_memnode->meminfo,
+                                          SHM_MEMINFO) )
+            {
+                printk(XENLOG_ERR
+                       "Failed to allocate (%"PRIpaddr"MB) pages as static shared memory from heap\n",
+                       shm_memnode->meminfo.tot_size >> 20);
+                return -EINVAL;
+            }
+        }
 
         /*
          * DOMID_IO is a fake domain and is not described in the Device-Tree.
          * Therefore when the owner of the shared region is DOMID_IO, we will
          * only find the borrowers.
          */
-        if ( (owner_dom_io && !is_shm_allocated_to_domio(pbase)) ||
+        if ( (owner_dom_io && !is_shm_allocated_to_domio(shm_memnode)) ||
              (!owner_dom_io && strcmp(role_str, "owner") == 0) )
         {
             /*
@@ -1201,16 +1289,14 @@ static int __init process_shm(struct domain *d, struct kernel_info *kinfo,
              * specified, so they should be assigned to dom_io.
              */
             ret = assign_shared_memory(owner_dom_io ? dom_io : d,
-                                       pbase, psize, gbase, shm_id);
+                                       shm_memnode, gbase, paddr_assigned);
             if ( ret )
                 return ret;
         }
 
         if ( owner_dom_io || (strcmp(role_str, "borrower") == 0) )
         {
-            /* Set up P2M foreign mapping for borrower domain. */
-            ret = map_regions_p2mt(d, _gfn(PFN_UP(gbase)), PFN_DOWN(psize),
-                                   _mfn(PFN_UP(pbase)), p2m_map_foreign_rw);
+            ret = add_foreign_mapping_for_borrower(d, shm_memnode, gbase);
             if ( ret )
                 return ret;
         }
@@ -1219,7 +1305,9 @@ static int __init process_shm(struct domain *d, struct kernel_info *kinfo,
          * Record static shared memory region info for later setting
          * up shm-node in guest device tree.
          */
-        ret = append_shm_bank_to_domain(kinfo, gbase, psize, shm_id);
+        ret = append_shm_bank_to_domain(kinfo, gbase,
+                                        shm_memnode->meminfo.tot_size,
+                                        shm_memnode->shm_id);
         if ( ret )
             return ret;
     }
-- 
2.25.1


