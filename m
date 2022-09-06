Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5325AF74F
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 23:50:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.400374.642080 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgSU-0001P1-6U; Tue, 06 Sep 2022 21:50:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 400374.642080; Tue, 06 Sep 2022 21:50:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVgSU-0001Ke-0S; Tue, 06 Sep 2022 21:50:14 +0000
Received: by outflank-mailman (input) for mailman id 400374;
 Tue, 06 Sep 2022 21:50:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YUvx=ZJ=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1oVgIA-0000Cs-F6
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 21:39:34 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id 476269f8-2dc2-11ed-af93-0125da4c0113;
 Tue, 06 Sep 2022 10:59:56 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 69E5B1756;
 Tue,  6 Sep 2022 02:00:06 -0700 (PDT)
Received: from a011292.shanghai.arm.com (a011292.shanghai.arm.com
 [10.169.190.94])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C70633F7B4;
 Tue,  6 Sep 2022 01:59:56 -0700 (PDT)
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
X-Inumbo-ID: 476269f8-2dc2-11ed-af93-0125da4c0113
From: Penny Zheng <Penny.Zheng@arm.com>
To: xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com,
	Penny Zheng <penny.zheng@arm.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v7 2/9] xen/arm: assign static shared memory to the default owner dom_io
Date: Tue,  6 Sep 2022 16:59:34 +0800
Message-Id: <20220906085941.944592-3-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220906085941.944592-1-Penny.Zheng@arm.com>
References: <20220906085941.944592-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Penny Zheng <penny.zheng@arm.com>

This commit introduces process_shm to cope with static shared memory in
domain construction.

DOMID_IO will be the default owner of memory pre-shared among multiple domains
at boot time, when no explicit owner is specified.
And DOMID_IO is a fake domain and is not described in the Device-Tree.
Therefore When the owner of the shared region is DOMID_IO, we will only
find the borrowers when parsing the Device-Tree.
When we found the first borrower of the region, we need to assign the region to
DOMID_IO

This commit only considers allocating static shared memory to dom_io
when owner domain is not explicitly defined in device tree, all the left,
including the "borrower" code path, the "explicit owner" code path, shall
be introduced later in the following patches.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
v7 changes:
- page_get_owner() can only be called for pages that are marked inuse,
so use page_get_owner_and_reference() instead
- reference shall be dropped using put_page()
- adjust "d->max_pages" when acquire_domstatic_pages() fails
- switch from assert to BUG_ON() because this is init code
- refine commit message and in-code comments
- rename allocate_shared_memory() to assign_shared_memory()
---
v6 change:
- use if-array to check psize, pbase and gbase are suitably aligned and
valid
- use mfn_valid to check (pbase, pbase + psize)
- check d->max_pages will not overflow
- refine acquire_shared_memory_bank to not reuse acquire_static_memory_bank,
then input pbase and psize do not need to be used as a pointer.
- use if-array to check if page owner is dom_io
- in-code comment refinement
---
v5 change:
- refine in-code comment
---
v4 change:
- no changes
---
v3 change:
- refine in-code comment
---
v2 change:
- instead of introducing a new system domain, reuse the existing dom_io
- make dom_io a non-auto-translated domain, then no need to create P2M
for it
- change dom_io definition and make it wider to support static shm here too
- introduce is_shm_allocated_to_domio to check whether static shm is
allocated yet, instead of using shm_mask bitmap
- add in-code comment
---
 xen/arch/arm/domain_build.c | 160 ++++++++++++++++++++++++++++++++++++
 xen/common/domain.c         |   3 +
 2 files changed, 163 insertions(+)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 3fd1186b53..be98ff83b1 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -759,6 +759,160 @@ static void __init assign_static_memory_11(struct domain *d,
     panic("Failed to assign requested static memory for direct-map domain %pd.",
           d);
 }
+
+#ifdef CONFIG_STATIC_SHM
+/*
+ * This function checks whether the static shared memory region is
+ * already allocated to dom_io.
+ */
+static bool __init is_shm_allocated_to_domio(paddr_t pbase)
+{
+    struct page_info *page;
+    struct domain *d;
+
+    page = maddr_to_page(pbase);
+    d = page_get_owner_and_reference(page);
+    if ( d == NULL )
+        return false;
+    put_page(page);
+
+    if ( d != dom_io )
+    {
+        printk(XENLOG_ERR
+               "shm memory node has already been allocated to a specific owner %pd, Please check your configuration\n",
+               d);
+        return false;
+    }
+
+    return true;
+}
+
+static mfn_t __init acquire_shared_memory_bank(struct domain *d,
+                                               paddr_t pbase, paddr_t psize)
+{
+    mfn_t smfn;
+    unsigned long nr_pfns;
+    int res;
+
+    /*
+     * Pages of statically shared memory shall be included
+     * into domain_tot_pages().
+     */
+    nr_pfns = PFN_DOWN(psize);
+    if ( (UINT_MAX - d->max_pages) < nr_pfns )
+    {
+        printk(XENLOG_ERR "%pd: Over-allocation for d->max_pages: %lu.\n",
+               d, nr_pfns);
+        return INVALID_MFN;
+    }
+    d->max_pages += nr_pfns;
+
+    smfn = maddr_to_mfn(pbase);
+    res = acquire_domstatic_pages(d, smfn, nr_pfns, 0);
+    if ( res )
+    {
+        printk(XENLOG_ERR
+               "%pd: failed to acquire static memory: %d.\n", d, res);
+        d->max_pages -= nr_pfns;
+        return INVALID_MFN;
+    }
+
+    return smfn;
+}
+
+static int __init assign_shared_memory(struct domain *d,
+                                       uint32_t addr_cells, uint32_t size_cells,
+                                       paddr_t pbase, paddr_t psize)
+{
+    mfn_t smfn;
+
+    dprintk(XENLOG_INFO,
+            "%pd: allocate static shared memory BANK %#"PRIpaddr"-%#"PRIpaddr".\n",
+            d, pbase, pbase + psize);
+
+    smfn = acquire_shared_memory_bank(d, pbase, psize);
+    if ( mfn_eq(smfn, INVALID_MFN) )
+        return -EINVAL;
+
+    /*
+     * DOMID_IO is auto-translated (i.e. it seems RAM 1:1). So we do not need
+     * to create mapping in the P2M.
+     */
+    ASSERT(d == dom_io);
+    return 0;
+}
+
+static int __init process_shm(struct domain *d,
+                              const struct dt_device_node *node)
+{
+    struct dt_device_node *shm_node;
+
+    dt_for_each_child_node(node, shm_node)
+    {
+        const struct dt_property *prop;
+        const __be32 *cells;
+        uint32_t addr_cells, size_cells;
+        paddr_t gbase, pbase, psize;
+        int ret = 0;
+        unsigned int i;
+
+        if ( !dt_device_is_compatible(shm_node, "xen,domain-shared-memory-v1") )
+            continue;
+
+        /*
+         * xen,shared-mem = <pbase, gbase, size>;
+         * TODO: pbase is optional.
+         */
+        addr_cells = dt_n_addr_cells(shm_node);
+        size_cells = dt_n_size_cells(shm_node);
+        prop = dt_find_property(shm_node, "xen,shared-mem", NULL);
+        BUG_ON(!prop);
+        cells = (const __be32 *)prop->value;
+        device_tree_get_reg(&cells, addr_cells, addr_cells, &pbase, &gbase);
+        psize = dt_read_number(cells, size_cells);
+        if ( !IS_ALIGNED(pbase, PAGE_SIZE) || !IS_ALIGNED(gbase, PAGE_SIZE) )
+        {
+            printk("%pd: physical address 0x%"PRIpaddr", or guest address 0x%"PRIpaddr" is not suitably aligned.\n",
+                   d, pbase, gbase);
+            return -EINVAL;
+        }
+        if ( !IS_ALIGNED(psize, PAGE_SIZE) )
+        {
+            printk("%pd: size 0x%"PRIpaddr" is not suitably aligned\n",
+                   d, psize);
+            return -EINVAL;
+        }
+
+        for ( i = 0; i < PFN_DOWN(psize); i++ )
+            if ( !mfn_valid(mfn_add(maddr_to_mfn(pbase), i)) )
+            {
+                printk("%pd: invalid physical address 0x%"PRI_mfn"\n",
+                       d, mfn_x(mfn_add(maddr_to_mfn(pbase), i)));
+                return -EINVAL;
+            }
+
+        /* TODO: Consider owner domain is not the default dom_io. */
+        /*
+         * DOMID_IO is a fake domain and is not described in the Device-Tree.
+         * Therefore when the owner of the shared region is DOMID_IO, we will
+         * only find the borrowers.
+         */
+        if ( !is_shm_allocated_to_domio(pbase) )
+        {
+            /*
+             * We found the first borrower of the region, the owner was not
+             * specified, so they should be assigned to dom_io.
+             */
+            ret = assign_shared_memory(dom_io, addr_cells, size_cells,
+                                       pbase, psize);
+            if ( ret )
+                return ret;
+        }
+    }
+
+    return 0;
+}
+#endif /* CONFIG_STATIC_SHM */
 #else
 static void __init allocate_static_memory(struct domain *d,
                                           struct kernel_info *kinfo,
@@ -3236,6 +3390,12 @@ static int __init construct_domU(struct domain *d,
     else
         assign_static_memory_11(d, &kinfo, node);
 
+#ifdef CONFIG_STATIC_SHM
+    rc = process_shm(d, node);
+    if ( rc < 0 )
+        return rc;
+#endif
+
     /*
      * Base address and irq number are needed when creating vpl011 device
      * tree node in prepare_dtb_domU, so initialization on related variables
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 7062393e37..fbd290ece7 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -783,6 +783,9 @@ void __init setup_system_domains(void)
      * This domain owns I/O pages that are within the range of the page_info
      * array. Mappings occur at the priv of the caller.
      * Quarantined PCI devices will be associated with this domain.
+     *
+     * DOMID_IO is also the default owner of memory pre-shared among multiple
+     * domains at boot time.
      */
     dom_io = domain_create(DOMID_IO, NULL, 0);
     if ( IS_ERR(dom_io) )
-- 
2.25.1


