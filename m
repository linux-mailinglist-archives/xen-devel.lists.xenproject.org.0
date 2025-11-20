Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5F1C73A29
	for <lists+xen-devel@lfdr.de>; Thu, 20 Nov 2025 12:10:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1166861.1493327 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM2Y2-0002gM-Nb; Thu, 20 Nov 2025 11:09:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1166861.1493327; Thu, 20 Nov 2025 11:09:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vM2Y2-0002bq-K1; Thu, 20 Nov 2025 11:09:58 +0000
Received: by outflank-mailman (input) for mailman id 1166861;
 Thu, 20 Nov 2025 11:09:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xes+=54=bounce.vates.tech=bounce-md_30504962.691ef703.v1-ebe588fab1704163be70331fd0c31b01@srs-se1.protection.inumbo.net>)
 id 1vM2Y0-0001PI-Ml
 for xen-devel@lists.xenproject.org; Thu, 20 Nov 2025 11:09:56 +0000
Received: from mail128-17.atl41.mandrillapp.com
 (mail128-17.atl41.mandrillapp.com [198.2.128.17])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 71dff962-c601-11f0-9d18-b5c5bf9af7f9;
 Thu, 20 Nov 2025 12:09:55 +0100 (CET)
Received: from pmta08.mandrill.prod.atl01.rsglab.com (localhost [127.0.0.1])
 by mail128-17.atl41.mandrillapp.com (Mailchimp) with ESMTP id
 4dBwc33WLyzCf9PNg
 for <xen-devel@lists.xenproject.org>; Thu, 20 Nov 2025 11:09:55 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 ebe588fab1704163be70331fd0c31b01; Thu, 20 Nov 2025 11:09:55 +0000
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
X-Inumbo-ID: 71dff962-c601-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1763636995; x=1763906995;
	bh=oEKbdG6ielNAks5NqJQuvhTJR35C9k/ERkSX1n4x528=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=cxwLwjTbVwH77lW2JfnPtavhYp+07kEeFqgk9yC44Y4cVXQdMsysciZRtrd5qvYD9
	 vmuMRimDZGnVx5gdbP0X9A5e/jnR+bKduzwSCRRPTbBLdOWFl9ASCe5Fl2N0lLYkPa
	 6hwG0nmZZRW7gxBomVnqUhU/OI5IAm4SZg9+gXdyIWDNCXccs5xVVXac7Z3s16UrCN
	 pOCAi+uvM07uYzTdqHlgp5lh0Iw3zRfsMWD+bWPK2CU2QmZ8GSa//FUF54z42TsaXe
	 +hw5BJ+rGCZ/U6rUCfzI0cwxUYPFJ9dQ91YkiJ5x9sM2iExhwxAesz7bampmrlco1J
	 MGinNuLEgvFQA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1763636995; x=1763897495; i=teddy.astie@vates.tech;
	bh=oEKbdG6ielNAks5NqJQuvhTJR35C9k/ERkSX1n4x528=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=Y3ou0ESd2vfAeiR5RkiP8R8ebsym6Tm7xsYXWcuqcU8YRaNCxTk+50klVXtbbsCLX
	 gwCPOEhQpWYKEDcP6nsr6PgefTvDe9VuUJ6iof0gibnifH1G+WtwQFGh+eE+8KY1lu
	 tpYUzKObGyGtnk8G4ilogBhl6G3Na5+cEViVvxMB7KvNC4/Ou/+InUvOpL5zJtgQd5
	 zXJgBK8ZwnjftZuxEnMN/XiJxujcJFlFmrDzV4PLcUAIghkkD7vAfhgNDr8aFZj3ti
	 HOdegz9qo4DBU2v0qnwqVInRB0lOuBSedYS2F8ztf1eyohoyTqbltStlXjwloHE8vP
	 xQ+Z39rjvepdw==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[RFC=20PATCH=20v7=2005/14]=20iommu:=20Simplify=20quarantine=20logic?=
X-Mailer: git-send-email 2.51.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1763636994248
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>, "Jason Andryuk" <jason.andryuk@amd.com>
Message-Id: <31b2ede1eab92048b69fe4999a35eb7d4a4617ba.1763569135.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1763569135.git.teddy.astie@vates.tech>
References: <cover.1763569135.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.ebe588fab1704163be70331fd0c31b01?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20251120:md
Date: Thu, 20 Nov 2025 11:09:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Current quarantine code is very hard to change and is very
complicated, remove most bits of it and replace it with direct
reassignement to dom_io domain instead.

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
A idea would be to rework this feature using the new reworked
IOMMU subsystem.
---
 xen/arch/x86/include/asm/pci.h              |  17 --
 xen/drivers/passthrough/amd/iommu_map.c     | 129 +---------
 xen/drivers/passthrough/amd/pci_amd_iommu.c |  51 +---
 xen/drivers/passthrough/pci.c               |   7 +-
 xen/drivers/passthrough/vtd/iommu.c         | 253 ++------------------
 xen/drivers/passthrough/x86/iommu.c         |   1 -
 6 files changed, 29 insertions(+), 429 deletions(-)

diff --git a/xen/arch/x86/include/asm/pci.h b/xen/arch/x86/include/asm/pci.h
index 0b98081aea..c64dd13452 100644
--- a/xen/arch/x86/include/asm/pci.h
+++ b/xen/arch/x86/include/asm/pci.h
@@ -17,23 +17,6 @@ struct pci_dev;
 
 struct arch_pci_dev {
     vmask_t used_vectors;
-    /*
-     * These fields are (de)initialized under pcidevs-lock. Other uses of
-     * them don't race (de)initialization and hence don't strictly need any
-     * locking.
-     */
-    union {
-        /* Subset of struct arch_iommu's fields, to be used in dom_io. */
-        struct {
-            uint64_t pgd_maddr;
-        } vtd;
-        struct {
-            struct page_info *root_table;
-        } amd;
-    };
-    domid_t pseudo_domid;
-    mfn_t leaf_mfn;
-    struct page_list_head pgtables_list;
 };
 
 int pci_conf_write_intercept(unsigned int seg, unsigned int bdf,
diff --git a/xen/drivers/passthrough/amd/iommu_map.c b/xen/drivers/passthrough/amd/iommu_map.c
index 81a63cce8e..42827c7dc7 100644
--- a/xen/drivers/passthrough/amd/iommu_map.c
+++ b/xen/drivers/passthrough/amd/iommu_map.c
@@ -656,9 +656,6 @@ int amd_iommu_reserve_domain_unity_map(struct domain *d, struct iommu_context *c
 {
     int rc;
 
-    if ( d == dom_io )
-        return 0;
-
     for ( rc = 0; !rc && map; map = map->next )
     {
         p2m_access_t p2ma = p2m_access_n;
@@ -680,9 +677,6 @@ int amd_iommu_reserve_domain_unity_unmap(struct domain *d, struct iommu_context
 {
     int rc;
 
-    if ( d == dom_io )
-        return 0;
-
     for ( rc = 0; map; map = map->next )
     {
         int ret = iommu_identity_mapping(d, ctx, p2m_access_x, map->addr,
@@ -771,134 +765,15 @@ int cf_check amd_iommu_get_reserved_device_memory(
     return 0;
 }
 
-static int fill_qpt(union amd_iommu_pte *this, unsigned int level,
-                    struct page_info *pgs[IOMMU_MAX_PT_LEVELS])
-{
-    struct domain_iommu *hd = dom_iommu(dom_io);
-    struct iommu_context *ctx = iommu_default_context(dom_io);
-    unsigned int i;
-    int rc = 0;
-
-    for ( i = 0; !rc && i < PTE_PER_TABLE_SIZE; ++i )
-    {
-        union amd_iommu_pte *pte = &this[i], *next;
-
-        if ( !pte->pr )
-        {
-            if ( !pgs[level] )
-            {
-                /*
-                 * The pgtable allocator is fine for the leaf page, as well as
-                 * page table pages, and the resulting allocations are always
-                 * zeroed.
-                 */
-                pgs[level] = iommu_alloc_pgtable(hd, ctx, 0);
-                if ( !pgs[level] )
-                {
-                    rc = -ENOMEM;
-                    break;
-                }
-
-                if ( level )
-                {
-                    next = __map_domain_page(pgs[level]);
-                    rc = fill_qpt(next, level - 1, pgs);
-                    unmap_domain_page(next);
-                }
-            }
-
-            /*
-             * PDEs are essentially a subset of PTEs, so this function
-             * is fine to use even at the leaf.
-             */
-            set_iommu_pde_present(pte, mfn_x(page_to_mfn(pgs[level])), level,
-                                  true, true);
-        }
-        else if ( level && pte->next_level )
-        {
-            next = map_domain_page(_mfn(pte->mfn));
-            rc = fill_qpt(next, level - 1, pgs);
-            unmap_domain_page(next);
-        }
-    }
-
-    return rc;
-}
-
 int cf_check amd_iommu_quarantine_init(struct pci_dev *pdev, bool scratch_page)
 {
-    struct domain_iommu *hd = dom_iommu(dom_io);
-    struct iommu_context *ctx = iommu_default_context(dom_io);
-    unsigned int level = ctx->arch.amd.paging_mode;
-    unsigned int req_id = get_dma_requestor_id(pdev->seg, pdev->sbdf.bdf);
-    const struct ivrs_mappings *ivrs_mappings = get_ivrs_mappings(pdev->seg);
-    int rc;
+    amd_iommu_quarantine_teardown(pdev);
 
-    ASSERT(pcidevs_locked());
-    ASSERT(!ctx->arch.amd.root_table);
-    ASSERT(page_list_empty(&ctx->arch.pgtables));
-
-    if ( !scratch_page && !ivrs_mappings[req_id].unity_map )
-        return 0;
-
-    ASSERT(pdev->arch.pseudo_domid != DOMID_INVALID);
-
-    if ( pdev->arch.amd.root_table )
-    {
-        clear_domain_page(pdev->arch.leaf_mfn);
-        return 0;
-    }
-
-    pdev->arch.amd.root_table = iommu_alloc_pgtable(hd, ctx, 0);
-    if ( !pdev->arch.amd.root_table )
-        return -ENOMEM;
-
-    /* Transiently install the root into DomIO, for iommu_identity_mapping(). */
-    ctx->arch.amd.root_table = pdev->arch.amd.root_table;
-
-    rc = amd_iommu_reserve_domain_unity_map(dom_io, ctx,
-                                            ivrs_mappings[req_id].unity_map,
-                                            0);
-
-    iommu_identity_map_teardown(dom_io, ctx);
-    ctx->arch.amd.root_table = NULL;
-
-    if ( rc )
-        AMD_IOMMU_WARN("%pp: quarantine unity mapping failed\n", &pdev->sbdf);
-    else if ( scratch_page )
-    {
-        union amd_iommu_pte *root;
-        struct page_info *pgs[IOMMU_MAX_PT_LEVELS] = {};
-
-        root = __map_domain_page(pdev->arch.amd.root_table);
-        rc = fill_qpt(root, level - 1, pgs);
-        unmap_domain_page(root);
-
-        pdev->arch.leaf_mfn = page_to_mfn(pgs[0]);
-    }
-
-    page_list_move(&pdev->arch.pgtables_list, &ctx->arch.pgtables);
-
-    if ( rc )
-        amd_iommu_quarantine_teardown(pdev);
-
-    return rc;
+    return 0;
 }
 
 void amd_iommu_quarantine_teardown(struct pci_dev *pdev)
 {
-    struct iommu_context *ctx = iommu_default_context(dom_io);
-
-    ASSERT(pcidevs_locked());
-
-    if ( !pdev->arch.amd.root_table )
-        return;
-
-    ASSERT(page_list_empty(&ctx->arch.pgtables));
-    page_list_move(&ctx->arch.pgtables, &pdev->arch.pgtables_list);
-    while ( iommu_free_pgtables(dom_io, ctx) == -ERESTART )
-        /* nothing */;
-    pdev->arch.amd.root_table = NULL;
 }
 
 /*
diff --git a/xen/drivers/passthrough/amd/pci_amd_iommu.c b/xen/drivers/passthrough/amd/pci_amd_iommu.c
index 964f6b47db..c871660661 100644
--- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
+++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
@@ -138,9 +138,6 @@ static int __must_check amd_iommu_setup_domain_device(
     const struct page_info *root_pg;
     domid_t domid;
 
-    if ( QUARANTINE_SKIP(domain, pdev) )
-        return 0;
-
     BUG_ON(!ctx->arch.amd.paging_mode || !iommu->dev_table.buffer);
 
     rc = allocate_domain_resources(domain);
@@ -159,16 +156,8 @@ static int __must_check amd_iommu_setup_domain_device(
     dte = &table[req_id];
     ivrs_dev = &get_ivrs_mappings(iommu->sbdf.seg)[req_id];
 
-    if ( domain != dom_io )
-    {
-        root_pg = ctx->arch.amd.root_table;
-        domid = domain->domain_id;
-    }
-    else
-    {
-        root_pg = pdev->arch.amd.root_table;
-        domid = pdev->arch.pseudo_domid;
-    }
+    root_pg = ctx->arch.amd.root_table;
+    domid = domain->domain_id;
 
     spin_lock_irqsave(&iommu->lock, flags);
 
@@ -414,9 +403,6 @@ static void amd_iommu_disable_domain_device(const struct domain *domain,
     int req_id;
     u8 bus = pdev->bus;
 
-    if ( QUARANTINE_SKIP(domain, pdev) )
-        return;
-
     ASSERT(pcidevs_locked());
 
     if ( pci_ats_device(iommu->sbdf.seg, bus, pdev->devfn) &&
@@ -479,14 +465,9 @@ static int cf_check reassign_device(
         return -ENODEV;
     }
 
-    if ( !QUARANTINE_SKIP(target, pdev) )
-    {
-        rc = amd_iommu_setup_domain_device(target, target_ctx, iommu, devfn, pdev);
-        if ( rc )
-            return rc;
-    }
-    else
-        amd_iommu_disable_domain_device(source, iommu, devfn, pdev);
+    rc = amd_iommu_setup_domain_device(target, target_ctx, iommu, devfn, pdev);
+    if ( rc )
+        return rc;
 
     if ( devfn == pdev->devfn && pdev->domain != target )
     {
@@ -579,8 +560,6 @@ static int cf_check amd_iommu_add_device(u8 devfn, struct pci_dev *pdev)
     struct iommu_context *ctx;
     u16 bdf;
     struct ivrs_mappings *ivrs_mappings;
-    bool fresh_domid = false;
-    int ret;
 
     if ( !pdev->domain )
         return -EINVAL;
@@ -649,22 +628,7 @@ static int cf_check amd_iommu_add_device(u8 devfn, struct pci_dev *pdev)
         AMD_IOMMU_WARN("%pd: unity mapping failed for %pp\n",
                        pdev->domain, &PCI_SBDF(pdev->seg, bdf));
 
-    if ( iommu_quarantine && pdev->arch.pseudo_domid == DOMID_INVALID )
-    {
-        pdev->arch.pseudo_domid = iommu_alloc_domid(iommu->domid_map);
-        if ( pdev->arch.pseudo_domid == DOMID_INVALID )
-            return -ENOSPC;
-        fresh_domid = true;
-    }
-
-    ret = amd_iommu_setup_domain_device(pdev->domain, ctx, iommu, devfn, pdev);
-    if ( ret && fresh_domid )
-    {
-        iommu_free_domid(pdev->arch.pseudo_domid, iommu->domid_map);
-        pdev->arch.pseudo_domid = DOMID_INVALID;
-    }
-
-    return ret;
+    return amd_iommu_setup_domain_device(pdev->domain, ctx, iommu, devfn, pdev);
 }
 
 static int cf_check amd_iommu_remove_device(u8 devfn, struct pci_dev *pdev)
@@ -700,9 +664,6 @@ static int cf_check amd_iommu_remove_device(u8 devfn, struct pci_dev *pdev)
 
     amd_iommu_quarantine_teardown(pdev);
 
-    iommu_free_domid(pdev->arch.pseudo_domid, iommu->domid_map);
-    pdev->arch.pseudo_domid = DOMID_INVALID;
-
     if ( amd_iommu_perdev_intremap &&
          ivrs_mappings[bdf].dte_requestor_id == bdf &&
          ivrs_mappings[bdf].intremap_table )
diff --git a/xen/drivers/passthrough/pci.c b/xen/drivers/passthrough/pci.c
index 52c22fa50c..ee73d55740 100644
--- a/xen/drivers/passthrough/pci.c
+++ b/xen/drivers/passthrough/pci.c
@@ -1371,12 +1371,7 @@ static int cf_check _dump_pci_devices(struct pci_seg *pseg, void *arg)
     list_for_each_entry ( pdev, &pseg->alldevs_list, alldevs_list )
     {
         printk("%pp - ", &pdev->sbdf);
-#ifdef CONFIG_X86
-        if ( pdev->domain == dom_io )
-            printk("DomIO:%x", pdev->arch.pseudo_domid);
-        else
-#endif
-            printk("%pd", pdev->domain);
+        printk("%pd", pdev->domain);
         printk(" - node %-3d", (pdev->node != NUMA_NO_NODE) ? pdev->node : -1);
         pdev_dump_msi(pdev);
         printk("\n");
diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
index 9252c3e0f3..f269fca9bf 100644
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -49,14 +49,6 @@
 #define CONTIG_MASK DMA_PTE_CONTIG_MASK
 #include <asm/pt-contig-markers.h>
 
-/* dom_io is used as a sentinel for quarantined devices */
-#define QUARANTINE_SKIP(d, pgd_maddr) ((d) == dom_io && !(pgd_maddr))
-#define DEVICE_DOMID(d, pdev) ((d) != dom_io ? (d)->domain_id \
-                                             : (pdev)->arch.pseudo_domid)
-#define DEVICE_PGTABLE(d, pdev) ((d) != dom_io \
-                                 ? iommu_default_context(d)->arch.vtd.pgd_maddr \
-                                 : (pdev)->arch.vtd.pgd_maddr)
-
 bool __read_mostly iommu_igfx = true;
 bool __read_mostly iommu_qinval = true;
 #ifndef iommu_snoop
@@ -1495,8 +1487,6 @@ int domain_context_mapping_one(
     int rc, ret;
     bool flush_dev_iotlb;
 
-    if ( QUARANTINE_SKIP(domain, pgd_maddr) )
-        return 0;
 
     ASSERT(pcidevs_locked());
     spin_lock(&iommu->lock);
@@ -1518,8 +1508,6 @@ int domain_context_mapping_one(
         domid = did_to_domain_id(iommu, prev_did);
         if ( domid < DOMID_FIRST_RESERVED )
             prev_dom = rcu_lock_domain_by_id(domid);
-        else if ( pdev ? domid == pdev->arch.pseudo_domid : domid > DOMID_MASK )
-            prev_dom = rcu_lock_domain(dom_io);
         if ( !prev_dom )
         {
             spin_unlock(&iommu->lock);
@@ -1651,8 +1639,8 @@ int domain_context_mapping_one(
             ret = domain_context_unmap_one(domain, iommu, bus, devfn);
         else
             ret = domain_context_mapping_one(prev_dom, ctx, iommu, bus, devfn, pdev,
-                                             DEVICE_DOMID(prev_dom, pdev),
-                                             DEVICE_PGTABLE(prev_dom, pdev),
+                                             prev_dom->domain_id,
+                                             iommu_default_context(prev_dom)->arch.vtd.pgd_maddr,
                                              (mode & MAP_WITH_RMRR) |
                                              MAP_ERROR_RECOVERY) < 0;
 
@@ -1674,8 +1662,8 @@ static int domain_context_mapping(struct domain *domain, struct iommu_context *c
 {
     const struct acpi_drhd_unit *drhd = acpi_find_matched_drhd_unit(pdev);
     const struct acpi_rmrr_unit *rmrr;
-    paddr_t pgd_maddr = DEVICE_PGTABLE(domain, pdev);
-    domid_t orig_domid = pdev->arch.pseudo_domid;
+    paddr_t pgd_maddr = ctx->arch.vtd.pgd_maddr;
+    domid_t did = domain->domain_id;
     int ret = 0;
     unsigned int i, mode = 0;
     uint16_t seg = pdev->seg, bdf;
@@ -1728,20 +1716,11 @@ static int domain_context_mapping(struct domain *domain, struct iommu_context *c
         if ( !drhd )
             return -ENODEV;
 
-        if ( iommu_quarantine && orig_domid == DOMID_INVALID )
-        {
-            pdev->arch.pseudo_domid =
-                iommu_alloc_domid(drhd->iommu->pseudo_domid_map);
-            if ( pdev->arch.pseudo_domid == DOMID_INVALID )
-                return -ENOSPC;
-        }
-
         if ( iommu_debug )
             printk(VTDPREFIX "%pd:PCIe: map %pp\n",
                    domain, &PCI_SBDF(seg, bus, devfn));
         ret = domain_context_mapping_one(domain, ctx, drhd->iommu, bus, devfn, pdev,
-                                         DEVICE_DOMID(domain, pdev), pgd_maddr,
-                                         mode);
+                                         did, pgd_maddr, mode);
         if ( ret > 0 )
             ret = 0;
         if ( !ret && devfn == pdev->devfn && ats_device(pdev, drhd) > 0 )
@@ -1753,21 +1732,12 @@ static int domain_context_mapping(struct domain *domain, struct iommu_context *c
         if ( !drhd )
             return -ENODEV;
 
-        if ( iommu_quarantine && orig_domid == DOMID_INVALID )
-        {
-            pdev->arch.pseudo_domid =
-                iommu_alloc_domid(drhd->iommu->pseudo_domid_map);
-            if ( pdev->arch.pseudo_domid == DOMID_INVALID )
-                return -ENOSPC;
-        }
-
         if ( iommu_debug )
             printk(VTDPREFIX "%pd:PCI: map %pp\n",
                    domain, &PCI_SBDF(seg, bus, devfn));
 
         ret = domain_context_mapping_one(domain, ctx, drhd->iommu, bus, devfn,
-                                         pdev, DEVICE_DOMID(domain, pdev),
-                                         pgd_maddr, mode);
+                                         pdev, did, pgd_maddr, mode);
         if ( ret < 0 )
             break;
         prev_present = ret;
@@ -1797,8 +1767,7 @@ static int domain_context_mapping(struct domain *domain, struct iommu_context *c
          */
         if ( ret >= 0 )
             ret = domain_context_mapping_one(domain, ctx, drhd->iommu, bus, devfn,
-                                             NULL, DEVICE_DOMID(domain, pdev),
-                                             pgd_maddr, mode);
+                                             NULL, did, pgd_maddr, mode);
 
         /*
          * Devices behind PCIe-to-PCI/PCIx bridge may generate different
@@ -1813,8 +1782,7 @@ static int domain_context_mapping(struct domain *domain, struct iommu_context *c
         if ( !ret && pdev_type(seg, bus, devfn) == DEV_TYPE_PCIe2PCI_BRIDGE &&
              (secbus != pdev->bus || pdev->devfn != 0) )
             ret = domain_context_mapping_one(domain, ctx, drhd->iommu, secbus, 0,
-                                             NULL, DEVICE_DOMID(domain, pdev),
-                                             pgd_maddr, mode);
+                                             NULL, did, pgd_maddr, mode);
 
         if ( ret )
         {
@@ -1836,13 +1804,6 @@ static int domain_context_mapping(struct domain *domain, struct iommu_context *c
     if ( !ret && devfn == pdev->devfn )
         pci_vtd_quirk(pdev);
 
-    if ( ret && drhd && orig_domid == DOMID_INVALID )
-    {
-        iommu_free_domid(pdev->arch.pseudo_domid,
-                         drhd->iommu->pseudo_domid_map);
-        pdev->arch.pseudo_domid = DOMID_INVALID;
-    }
-
     return ret;
 }
 
@@ -2006,10 +1967,6 @@ static const struct acpi_drhd_unit *domain_context_unmap(
         return ERR_PTR(-EINVAL);
     }
 
-    if ( !ret && pdev->devfn == devfn &&
-         !QUARANTINE_SKIP(domain, pdev->arch.vtd.pgd_maddr) )
-        check_cleanup_domid_map(domain, pdev, iommu);
-
     return drhd;
 }
 
@@ -2043,21 +2000,6 @@ static void cf_check iommu_domain_teardown(struct domain *d)
 static void quarantine_teardown(struct pci_dev *pdev,
                                 const struct acpi_drhd_unit *drhd)
 {
-    struct iommu_context *ctx = iommu_default_context(dom_io);
-
-    ASSERT(pcidevs_locked());
-
-    if ( !pdev->arch.vtd.pgd_maddr )
-        return;
-
-    ASSERT(page_list_empty(&ctx->arch.pgtables));
-    page_list_move(&ctx->arch.pgtables, &pdev->arch.pgtables_list);
-    while ( iommu_free_pgtables(dom_io, ctx) == -ERESTART )
-        /* nothing */;
-    pdev->arch.vtd.pgd_maddr = 0;
-
-    if ( drhd )
-        cleanup_domid_map(pdev->arch.pseudo_domid, drhd->iommu);
 }
 
 static int __must_check cf_check intel_iommu_map_page(
@@ -2398,13 +2340,6 @@ static int cf_check intel_iommu_remove_device(u8 devfn, struct pci_dev *pdev)
 
     quarantine_teardown(pdev, drhd);
 
-    if ( drhd )
-    {
-        iommu_free_domid(pdev->arch.pseudo_domid,
-                         drhd->iommu->pseudo_domid_map);
-        pdev->arch.pseudo_domid = DOMID_INVALID;
-    }
-
     return 0;
 }
 
@@ -2762,42 +2697,22 @@ static int cf_check reassign_device_ownership(
 {
     int ret;
 
-    if ( !QUARANTINE_SKIP(target, pdev->arch.vtd.pgd_maddr) )
-    {
-        struct iommu_context *target_ctx = iommu_default_context(target);
-
-        if ( !has_arch_pdevs(target) )
-            vmx_pi_hooks_assign(target);
+    if ( !has_arch_pdevs(target) )
+        vmx_pi_hooks_assign(target);
 
 #ifdef CONFIG_PV
-        /*
-         * Devices assigned to untrusted domains (here assumed to be any domU)
-         * can attempt to send arbitrary LAPIC/MSI messages. We are unprotected
-         * by the root complex unless interrupt remapping is enabled.
-         */
-        if ( !iommu_intremap && !is_hardware_domain(target) &&
-             !is_system_domain(target) )
-            untrusted_msi = true;
+    /*
+        * Devices assigned to untrusted domains (here assumed to be any domU)
+        * can attempt to send arbitrary LAPIC/MSI messages. We are unprotected
+        * by the root complex unless interrupt remapping is enabled.
+        */
+    if ( !iommu_intremap && !is_hardware_domain(target) &&
+            !is_system_domain(target) )
+        untrusted_msi = true;
 #endif
 
-        ret = domain_context_mapping(target, target_ctx, devfn, pdev);
-
-        if ( !ret && pdev->devfn == devfn &&
-             !QUARANTINE_SKIP(source, pdev->arch.vtd.pgd_maddr) )
-        {
-            const struct acpi_drhd_unit *drhd = acpi_find_matched_drhd_unit(pdev);
+    ret = domain_context_mapping(target, iommu_default_context(target), devfn, pdev);
 
-            if ( drhd )
-                check_cleanup_domid_map(source, pdev, drhd->iommu);
-        }
-    }
-    else
-    {
-        const struct acpi_drhd_unit *drhd;
-
-        drhd = domain_context_unmap(source, devfn, pdev);
-        ret = IS_ERR(drhd) ? PTR_ERR(drhd) : 0;
-    }
     if ( ret )
     {
         if ( !has_arch_pdevs(target) )
@@ -2896,9 +2811,6 @@ static int cf_check intel_iommu_assign_device(
         }
     }
 
-    if ( d == dom_io )
-        return reassign_device_ownership(s, d, devfn, pdev);
-
     /* Setup rmrr identity mapping */
     for_each_rmrr_device( rmrr, bdf, i )
     {
@@ -3108,135 +3020,10 @@ static void cf_check vtd_dump_page_tables(struct domain *d)
                               agaw_to_level(hd->arch.vtd.agaw), 0, 0);
 }
 
-static int fill_qpt(struct dma_pte *this, unsigned int level,
-                    struct page_info *pgs[6])
-{
-    struct domain_iommu *hd = dom_iommu(dom_io);
-    struct iommu_context *ctx = iommu_default_context(dom_io);
-    unsigned int i;
-    int rc = 0;
-
-    for ( i = 0; !rc && i < PTE_NUM; ++i )
-    {
-        struct dma_pte *pte = &this[i], *next;
-
-        if ( !dma_pte_present(*pte) )
-        {
-            if ( !pgs[level] )
-            {
-                /*
-                 * The pgtable allocator is fine for the leaf page, as well as
-                 * page table pages, and the resulting allocations are always
-                 * zeroed.
-                 */
-                pgs[level] = iommu_alloc_pgtable(hd, ctx, 0);
-                if ( !pgs[level] )
-                {
-                    rc = -ENOMEM;
-                    break;
-                }
-
-                if ( level )
-                {
-                    next = map_vtd_domain_page(page_to_maddr(pgs[level]));
-                    rc = fill_qpt(next, level - 1, pgs);
-                    unmap_vtd_domain_page(next);
-                }
-            }
-
-            dma_set_pte_addr(*pte, page_to_maddr(pgs[level]));
-            dma_set_pte_readable(*pte);
-            dma_set_pte_writable(*pte);
-        }
-        else if ( level && !dma_pte_superpage(*pte) )
-        {
-            next = map_vtd_domain_page(dma_pte_addr(*pte));
-            rc = fill_qpt(next, level - 1, pgs);
-            unmap_vtd_domain_page(next);
-        }
-    }
-
-    return rc;
-}
-
 static int cf_check intel_iommu_quarantine_init(struct pci_dev *pdev,
                                                 bool scratch_page)
 {
-    struct domain_iommu *hd = dom_iommu(dom_io);
-    struct iommu_context *ctx = iommu_default_context(dom_io);
-    struct page_info *pg;
-    unsigned int agaw = hd->arch.vtd.agaw;
-    unsigned int level = agaw_to_level(agaw);
-    const struct acpi_drhd_unit *drhd;
-    const struct acpi_rmrr_unit *rmrr;
-    unsigned int i, bdf;
-    bool rmrr_found = false;
-    int rc;
-
-    ASSERT(pcidevs_locked());
-    ASSERT(!ctx->arch.vtd.pgd_maddr);
-    ASSERT(page_list_empty(&ctx->arch.pgtables));
-
-    if ( pdev->arch.vtd.pgd_maddr )
-    {
-        clear_domain_page(pdev->arch.leaf_mfn);
-        return 0;
-    }
-
-    drhd = acpi_find_matched_drhd_unit(pdev);
-    if ( !drhd )
-        return -ENODEV;
-
-    pg = iommu_alloc_pgtable(hd, ctx, 0);
-    if ( !pg )
-        return -ENOMEM;
-
-    rc = context_set_domain_id(NULL, pdev->arch.pseudo_domid, drhd->iommu);
-
-    /* Transiently install the root into DomIO, for iommu_identity_mapping(). */
-    ctx->arch.vtd.pgd_maddr = page_to_maddr(pg);
-
-    for_each_rmrr_device ( rmrr, bdf, i )
-    {
-        if ( rc )
-            break;
-
-        if ( rmrr->segment == pdev->seg && bdf == pdev->sbdf.bdf )
-        {
-            rmrr_found = true;
-
-            rc = iommu_identity_mapping(dom_io, ctx, p2m_access_rw,
-                                        rmrr->base_address, rmrr->end_address,
-                                        0);
-            if ( rc )
-                printk(XENLOG_ERR VTDPREFIX
-                       "%pp: RMRR quarantine mapping failed\n",
-                       &pdev->sbdf);
-        }
-    }
-
-    iommu_identity_map_teardown(dom_io, ctx);
-    ctx->arch.vtd.pgd_maddr = 0;
-    pdev->arch.vtd.pgd_maddr = page_to_maddr(pg);
-
-    if ( !rc && scratch_page )
-    {
-        struct dma_pte *root;
-        struct page_info *pgs[6] = {};
-
-        root = map_vtd_domain_page(pdev->arch.vtd.pgd_maddr);
-        rc = fill_qpt(root, level - 1, pgs);
-        unmap_vtd_domain_page(root);
-
-        pdev->arch.leaf_mfn = page_to_mfn(pgs[0]);
-    }
-
-    page_list_move(&pdev->arch.pgtables_list, &ctx->arch.pgtables);
-
-    if ( rc || (!scratch_page && !rmrr_found) )
-        quarantine_teardown(pdev, drhd);
-
-    return rc;
+    return 0;
 }
 
 static void cf_check vtd_quiesce(void)
diff --git a/xen/drivers/passthrough/x86/iommu.c b/xen/drivers/passthrough/x86/iommu.c
index 3bc8aa3e09..75c8752022 100644
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -528,7 +528,6 @@ void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
 
 void arch_pci_init_pdev(struct pci_dev *pdev)
 {
-    pdev->arch.pseudo_domid = DOMID_INVALID;
 }
 
 unsigned long *__init iommu_init_domid(domid_t reserve)
-- 
2.51.2



--
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech


