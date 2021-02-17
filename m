Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D394831DB6C
	for <lists+xen-devel@lfdr.de>; Wed, 17 Feb 2021 15:25:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86283.161872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCNlO-0005Ko-46; Wed, 17 Feb 2021 14:25:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86283.161872; Wed, 17 Feb 2021 14:25:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCNlN-0005K6-T5; Wed, 17 Feb 2021 14:25:09 +0000
Received: by outflank-mailman (input) for mailman id 86283;
 Wed, 17 Feb 2021 14:25:08 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lCNlM-0005JW-KY
 for xen-devel@lists.xenproject.org; Wed, 17 Feb 2021 14:25:08 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lCNlJ-0004eR-Rh; Wed, 17 Feb 2021 14:25:05 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=ufe34d9ed68d054.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lCNlJ-00057m-Fa; Wed, 17 Feb 2021 14:25:05 +0000
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
	 bh=E10KWobPtnAxShnfJroEM2NY8XPPcudrmSVydi6i4NA=; b=kMCv4+ftElp2JtZlu3sfOUMXe
	W4wdDP4OTTLeHmeSn+X/qNJwqRQlDtAyI4YE6aX64pUTNugb2TNnXjMUuGj6zQy3esu/i8juW89EL
	CEZ4iWtCGncr3Ie7CLnIDBBlyFyx2iXp6TPKpQNA2kSmawFCCQ7QqPN2s3af4kcQ7qp7Q=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: hongyxia@amazon.co.uk,
	iwj@xenproject.org,
	Julien Grall <jgrall@amazon.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Paul Durrant <paul@xen.org>
Subject: [for-4.15][PATCH v3 1/3] xen/iommu: x86: Clear the root page-table before freeing the page-tables
Date: Wed, 17 Feb 2021 14:24:56 +0000
Message-Id: <20210217142458.3769-2-julien@xen.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210217142458.3769-1-julien@xen.org>
References: <20210217142458.3769-1-julien@xen.org>

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

Fixes: 3eef6d07d722 ("x86/iommu: convert VT-d code to use new page table allocator")
Signed-off-by: Julien Grall <jgrall@amazon.com>

---
    Changes in v3:
        - Move the patch earlier in the series
        - Reword the commit message

    Changes in v2:
        - Introduce clear_root_pgtable()
        - Move the patch later in the series
---
 xen/drivers/passthrough/amd/pci_amd_iommu.c | 12 +++++++++++-
 xen/drivers/passthrough/vtd/iommu.c         | 12 +++++++++++-
 xen/drivers/passthrough/x86/iommu.c         |  9 +++++++++
 xen/include/xen/iommu.h                     |  1 +
 4 files changed, 32 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/passthrough/amd/pci_amd_iommu.c b/xen/drivers/passthrough/amd/pci_amd_iommu.c
index 42b5a5a9bec4..81add0ba26b4 100644
--- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
+++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
@@ -381,9 +381,18 @@ static int amd_iommu_assign_device(struct domain *d, u8 devfn,
     return reassign_device(pdev->domain, d, devfn, pdev);
 }
 
+static void iommu_clear_root_pgtable(struct domain *d)
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
+    .clear_root_pgtable = iommu_clear_root_pgtable,
     .map_page = amd_iommu_map_page,
     .unmap_page = amd_iommu_unmap_page,
     .iotlb_flush = amd_iommu_flush_iotlb_pages,
diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
index d136fe36883b..e1871f6c2bc1 100644
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
@@ -2719,6 +2728,7 @@ static struct iommu_ops __initdata vtd_ops = {
     .remove_device = intel_iommu_remove_device,
     .assign_device  = intel_iommu_assign_device,
     .teardown = iommu_domain_teardown,
+    .clear_root_pgtable = iommu_clear_root_pgtable,
     .map_page = intel_iommu_map_page,
     .unmap_page = intel_iommu_unmap_page,
     .lookup_page = intel_iommu_lookup_page,
diff --git a/xen/drivers/passthrough/x86/iommu.c b/xen/drivers/passthrough/x86/iommu.c
index cea1032b3d02..f54fc8093f18 100644
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -267,6 +267,15 @@ int iommu_free_pgtables(struct domain *d)
     struct page_info *pg;
     unsigned int done = 0;
 
+    if ( !is_iommu_enabled(d) )
+        return 0;
+
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


