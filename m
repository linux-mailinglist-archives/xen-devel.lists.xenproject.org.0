Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2FB32619A
	for <lists+xen-devel@lfdr.de>; Fri, 26 Feb 2021 11:57:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.90210.170748 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFanj-0003MS-Nl; Fri, 26 Feb 2021 10:56:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 90210.170748; Fri, 26 Feb 2021 10:56:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lFanj-0003LX-J0; Fri, 26 Feb 2021 10:56:51 +0000
Received: by outflank-mailman (input) for mailman id 90210;
 Fri, 26 Feb 2021 10:56:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lFani-0003Jn-BS
 for xen-devel@lists.xenproject.org; Fri, 26 Feb 2021 10:56:50 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lFanf-0001QJ-LT; Fri, 26 Feb 2021 10:56:47 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lFanf-0007D9-Ce; Fri, 26 Feb 2021 10:56:47 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	 bh=s4DkygruQ2xwDok1FHnySjDI4sCgf/AFga36jF2Uz3Q=; b=mnSWdB0erv1LSk4cmCT9aMeve
	iWdXwBMUmbQ6f2j7ZZHI8gDcaZID0wCIPsKWv456MvyAcQ2J+FEfmPmpkum7qRc1OSx3VXMHUBke8
	HhBnm4qLxMENW5GyGPy6Qaaidave/PDnEOICFzCk2OgOJkHg3z+RNSWvHiOUSSwqY/okI=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: hongyxia@amazon.co.uk,
	iwj@xenproject.org,
	Julien Grall <jgrall@amazon.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH for-4.15 v5 3/3] xen/iommu: x86: Clear the root page-table before freeing the page-tables
Date: Fri, 26 Feb 2021 10:56:40 +0000
Message-Id: <20210226105640.12037-4-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210226105640.12037-1-julien@xen.org>
References: <20210226105640.12037-1-julien@xen.org>

From: Julien Grall <jgrall@amazon.com>

The new per-domain IOMMU page-table allocator will now free the
page-tables when domain's resources are relinquished. However, the
per-domain IOMMU structure will still contain a dangling pointer to
the root page-table.

Xen may access the IOMMU page-tables afterwards at least in the case of
PV domain:

(XEN) Xen call trace:
(XEN)    [<ffff82d04025b4b2>] R iommu.c#addr_to_dma_page_maddr+0x12e/0x1d8
(XEN)    [<ffff82d04025b695>] F iommu.c#intel_iommu_unmap_page+0x5d/0xf8
(XEN)    [<ffff82d0402695f3>] F iommu_unmap+0x9c/0x129
(XEN)    [<ffff82d0402696a6>] F iommu_legacy_unmap+0x26/0x63
(XEN)    [<ffff82d04033c5c7>] F mm.c#cleanup_page_mappings+0x139/0x144
(XEN)    [<ffff82d04033c61d>] F put_page+0x4b/0xb3
(XEN)    [<ffff82d04033c87f>] F put_page_from_l1e+0x136/0x13b
(XEN)    [<ffff82d04033cada>] F devalidate_page+0x256/0x8dc
(XEN)    [<ffff82d04033d396>] F mm.c#_put_page_type+0x236/0x47e
(XEN)    [<ffff82d04033d64d>] F mm.c#put_pt_page+0x6f/0x80
(XEN)    [<ffff82d04033d8d6>] F mm.c#put_page_from_l2e+0x8a/0xcf
(XEN)    [<ffff82d04033cc27>] F devalidate_page+0x3a3/0x8dc
(XEN)    [<ffff82d04033d396>] F mm.c#_put_page_type+0x236/0x47e
(XEN)    [<ffff82d04033d64d>] F mm.c#put_pt_page+0x6f/0x80
(XEN)    [<ffff82d04033d807>] F mm.c#put_page_from_l3e+0x8a/0xcf
(XEN)    [<ffff82d04033cdf0>] F devalidate_page+0x56c/0x8dc
(XEN)    [<ffff82d04033d396>] F mm.c#_put_page_type+0x236/0x47e
(XEN)    [<ffff82d04033d64d>] F mm.c#put_pt_page+0x6f/0x80
(XEN)    [<ffff82d04033d6c7>] F mm.c#put_page_from_l4e+0x69/0x6d
(XEN)    [<ffff82d04033cf24>] F devalidate_page+0x6a0/0x8dc
(XEN)    [<ffff82d04033d396>] F mm.c#_put_page_type+0x236/0x47e
(XEN)    [<ffff82d04033d92e>] F put_page_type_preemptible+0x13/0x15
(XEN)    [<ffff82d04032598a>] F domain.c#relinquish_memory+0x1ff/0x4e9
(XEN)    [<ffff82d0403295f2>] F domain_relinquish_resources+0x2b6/0x36a
(XEN)    [<ffff82d040205cdf>] F domain_kill+0xb8/0x141
(XEN)    [<ffff82d040236cac>] F do_domctl+0xb6f/0x18e5
(XEN)    [<ffff82d04031d098>] F pv_hypercall+0x2f0/0x55f
(XEN)    [<ffff82d04039b432>] F lstar_enter+0x112/0x120

This will result to a use after-free and possibly an host crash or
memory corruption.

It would not be possible to free the page-tables further down in
domain_relinquish_resources() because cleanup_page_mappings() will only
be called when the last reference on the page dropped. This may happen
much later if another domain still hold a reference.

After all the PCI devices have been de-assigned, nobody should use the
IOMMU page-tables and it is therefore pointless to try to modify them.

So we can simply clear any reference to the root page-table in the
per-domain IOMMU structure. This requires to introduce a new callback of
the method will depend on the IOMMU driver used.

Take the opportunity to add an ASSERT() in arch_iommu_domain_destroy()
to check if we freed all the IOMMU page tables.

Fixes: 3eef6d07d722 ("x86/iommu: convert VT-d code to use new page table allocator")
Signed-off-by: Julien Grall <jgrall@amazon.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>

---
    Changes in v5:
        - Add Jan's reviewed-by
        - Fix typo
        - Use ! rather than == NULL

    Changes in v4:
        - Move the patch later in the series as we need to prevent
        iommu_map() to allocate memory first.
        - Add an ASSERT() in arch_iommu_domain_destroy().

    Changes in v3:
        - Move the patch earlier in the series
        - Reword the commit message

    Changes in v2:
        - Introduce clear_root_pgtable()
        - Move the patch later in the series
---
 xen/drivers/passthrough/amd/pci_amd_iommu.c | 12 +++++++++++-
 xen/drivers/passthrough/vtd/iommu.c         | 12 +++++++++++-
 xen/drivers/passthrough/x86/iommu.c         | 13 +++++++++++++
 xen/include/xen/iommu.h                     |  1 +
 4 files changed, 36 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/passthrough/amd/pci_amd_iommu.c b/xen/drivers/passthrough/amd/pci_amd_iommu.c
index 42b5a5a9bec4..085fe2f5771e 100644
--- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
+++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
@@ -381,9 +381,18 @@ static int amd_iommu_assign_device(struct domain *d, u8 devfn,
     return reassign_device(pdev->domain, d, devfn, pdev);
 }
 
+static void amd_iommu_clear_root_pgtable(struct domain *d)
+{
+    struct domain_iommu *hd = dom_iommu(d);
+
+    spin_lock(&hd->arch.mapping_lock);
+    hd->arch.amd.root_table = NULL;
+    spin_unlock(&hd->arch.mapping_lock);
+}
+
 static void amd_iommu_domain_destroy(struct domain *d)
 {
-    dom_iommu(d)->arch.amd.root_table = NULL;
+    ASSERT(!dom_iommu(d)->arch.amd.root_table);
 }
 
 static int amd_iommu_add_device(u8 devfn, struct pci_dev *pdev)
@@ -565,6 +574,7 @@ static const struct iommu_ops __initconstrel _iommu_ops = {
     .remove_device = amd_iommu_remove_device,
     .assign_device  = amd_iommu_assign_device,
     .teardown = amd_iommu_domain_destroy,
+    .clear_root_pgtable = amd_iommu_clear_root_pgtable,
     .map_page = amd_iommu_map_page,
     .unmap_page = amd_iommu_unmap_page,
     .iotlb_flush = amd_iommu_flush_iotlb_pages,
diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
index b549a71530d5..475efb3be3bd 100644
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -1726,6 +1726,15 @@ out:
     return ret;
 }
 
+static void iommu_clear_root_pgtable(struct domain *d)
+{
+    struct domain_iommu *hd = dom_iommu(d);
+
+    spin_lock(&hd->arch.mapping_lock);
+    hd->arch.vtd.pgd_maddr = 0;
+    spin_unlock(&hd->arch.mapping_lock);
+}
+
 static void iommu_domain_teardown(struct domain *d)
 {
     struct domain_iommu *hd = dom_iommu(d);
@@ -1740,7 +1749,7 @@ static void iommu_domain_teardown(struct domain *d)
         xfree(mrmrr);
     }
 
-    hd->arch.vtd.pgd_maddr = 0;
+    ASSERT(!hd->arch.vtd.pgd_maddr);
 }
 
 static int __must_check intel_iommu_map_page(struct domain *d, dfn_t dfn,
@@ -2731,6 +2740,7 @@ static struct iommu_ops __initdata vtd_ops = {
     .remove_device = intel_iommu_remove_device,
     .assign_device  = intel_iommu_assign_device,
     .teardown = iommu_domain_teardown,
+    .clear_root_pgtable = iommu_clear_root_pgtable,
     .map_page = intel_iommu_map_page,
     .unmap_page = intel_iommu_unmap_page,
     .lookup_page = intel_iommu_lookup_page,
diff --git a/xen/drivers/passthrough/x86/iommu.c b/xen/drivers/passthrough/x86/iommu.c
index ad19b7dd461c..b90bb31bfeea 100644
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -149,6 +149,13 @@ int arch_iommu_domain_init(struct domain *d)
 
 void arch_iommu_domain_destroy(struct domain *d)
 {
+    /*
+     * There should be not page-tables left allocated by the time the
+     * domain is destroyed. Note that arch_iommu_domain_destroy() is
+     * called unconditionally, so pgtables may be uninitialized.
+     */
+    ASSERT(!dom_iommu(d)->platform_ops ||
+           page_list_empty(&dom_iommu(d)->arch.pgtables.list));
 }
 
 static bool __hwdom_init hwdom_iommu_map(const struct domain *d,
@@ -273,6 +280,12 @@ int iommu_free_pgtables(struct domain *d)
     /* After this barrier, no new IOMMU mappings can be inserted. */
     spin_barrier(&hd->arch.mapping_lock);
 
+    /*
+     * Pages will be moved to the free list below. So we want to
+     * clear the root page-table to avoid any potential use after-free.
+     */
+    hd->platform_ops->clear_root_pgtable(d);
+
     while ( (pg = page_list_remove_head(&hd->arch.pgtables.list)) )
     {
         free_domheap_page(pg);
diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index 863a68fe1622..d59ed7cbad43 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -272,6 +272,7 @@ struct iommu_ops {
 
     int (*adjust_irq_affinities)(void);
     void (*sync_cache)(const void *addr, unsigned int size);
+    void (*clear_root_pgtable)(struct domain *d);
 #endif /* CONFIG_X86 */
 
     int __must_check (*suspend)(void);
-- 
2.17.1


