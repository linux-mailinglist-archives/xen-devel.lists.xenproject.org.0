Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E03A37FBD
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 11:18:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.890006.1299075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjyCp-00014H-Q6; Mon, 17 Feb 2025 10:18:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 890006.1299075; Mon, 17 Feb 2025 10:18:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tjyCp-0000xS-Gl; Mon, 17 Feb 2025 10:18:27 +0000
Received: by outflank-mailman (input) for mailman id 890006;
 Mon, 17 Feb 2025 10:18:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=b1gw=VI=bounce.vates.tech=bounce-md_30504962.67b30cee.v1-042407c48e3e4b35b078042d33e14209@srs-se1.protection.inumbo.net>)
 id 1tjyCn-0008Nl-LQ
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 10:18:25 +0000
Received: from mail178-27.suw51.mandrillapp.com
 (mail178-27.suw51.mandrillapp.com [198.2.178.27])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 84f67d9f-ed18-11ef-9aa6-95dc52dad729;
 Mon, 17 Feb 2025 11:18:24 +0100 (CET)
Received: from pmta13.mandrill.prod.suw01.rsglab.com (localhost [127.0.0.1])
 by mail178-27.suw51.mandrillapp.com (Mailchimp) with ESMTP id
 4YxJWy3Z94z6CPyQ6
 for <xen-devel@lists.xenproject.org>; Mon, 17 Feb 2025 10:18:22 +0000 (GMT)
Received: from [37.26.189.201] by mandrillapp.com id
 042407c48e3e4b35b078042d33e14209; Mon, 17 Feb 2025 10:18:22 +0000
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
X-Inumbo-ID: 84f67d9f-ed18-11ef-9aa6-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mandrillapp.com;
	s=mte1; t=1739787502; x=1740057502;
	bh=7v5xoQ3DFj0kUTvNDQbvt8cOPjYMlC78Cmix+Q2h9Q8=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=pP8tmNwoO9QjOGqQP6wLLkpW87FdWqXVPkIm0A6UKd/obodqtNBHc7kV1Rl1Xa+MJ
	 C4J/NqXWCiPzc2J8jyeW8CoMWM8T+dRwipjbi7xS6LDzZOhSWlCFGxIqYwHcqv5D0i
	 Tb0FlmIEmdASuk0Jd/uPJP2zIWqyAV00L3AqlLKIOjnQ2Qsm94JWqtvuhzHTPc7nCi
	 U5FvKSQxaoa1cdJbgQK2BTeq/4J7346JPlWeUoXtv6vWLZ4xutCCItAO+cwQ7DUuZ/
	 6w3gJG6nARHvmg91IcK8EdXGPaJim0bkVFlziBULZfDwsMKv701S03+QY8h1QBvXch
	 r/BI2xH15Ql+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech; s=mte1;
	t=1739787502; x=1740048002; i=teddy.astie@vates.tech;
	bh=7v5xoQ3DFj0kUTvNDQbvt8cOPjYMlC78Cmix+Q2h9Q8=;
	h=From:Subject:To:Cc:Message-Id:In-Reply-To:References:Feedback-ID:
	 Date:MIME-Version:Content-Type:Content-Transfer-Encoding:CC:Date:
	 Subject:From;
	b=CJSuY/ZaxyhhclGF/WSNTEP6Fm1cQP9sPtZf9c+OCQEe6LhxXL4lKrh+HrFwET3k3
	 o8ccIW88Khmy+l3Uhmhf+pLZot7HjxpQ7ZQXIkFBDNXfIBrnjufbIqLI81PAbodCQ1
	 aUcbziybd/x2Ed/D0On3AJpOCJZ3BY1ldr68Ivb1wynU4q3OE/fqwHuYIsCEpWCOJW
	 /J2+HXIxhAVJZPvqvXJQ6U4JUNqOZuknhosRZXV6mwkFYhu8QzCeIMmoYsaA8NWR2B
	 y73G7xW0mx4yaQ098yCf/VjmhCoYHi0ZKtW0r1FD6xn97wfTMIYubaSd9BXH0UtGKi
	 lKpC/C0VzMuQA==
From: "Teddy Astie" <teddy.astie@vates.tech>
Subject: =?utf-8?Q?[XEN=20RFC=20PATCH=20v6=2007/11]=20iommu:=20Simplify=20hardware=20did=20management?=
X-Mailer: git-send-email 2.47.2
X-Bm-Disclaimer: Yes
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1739787501248
To: xen-devel@lists.xenproject.org
Cc: "Teddy Astie" <teddy.astie@vates.tech>, "Jan Beulich" <jbeulich@suse.com>, "Andrew Cooper" <andrew.cooper3@citrix.com>, "=?utf-8?Q?Roger=20Pau=20Monn=C3=A9?=" <roger.pau@citrix.com>
Message-Id: <56ac13967ba7dfbb229c65450c79f6838a3aee9f.1739785339.git.teddy.astie@vates.tech>
In-Reply-To: <cover.1739785339.git.teddy.astie@vates.tech>
References: <cover.1739785339.git.teddy.astie@vates.tech>
X-Native-Encoded: 1
X-Report-Abuse: =?UTF-8?Q?Please=20forward=20a=20copy=20of=20this=20message,=20including=20all=20headers,=20to=20abuse@mandrill.com.=20You=20can=20also=20report=20abuse=20here:=20https://mandrillapp.com/contact/abuse=3Fid=3D30504962.042407c48e3e4b35b078042d33e14209?=
X-Mandrill-User: md_30504962
Feedback-ID: 30504962:30504962.20250217:md
Date: Mon, 17 Feb 2025 10:18:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Simplify the hardware DID management by allocating a DID
per IOMMU context (currently Xen domain) instead of trying
to reuse Xen domain DID (which may not be possible depending
on hardware constraints like did limits).

Signed-off-by: Teddy Astie <teddy.astie@vates.tech>
---
 xen/arch/x86/include/asm/iommu.h         |   5 +-
 xen/drivers/passthrough/amd/iommu.h      |   3 +
 xen/drivers/passthrough/amd/iommu_cmd.c  |   4 +-
 xen/drivers/passthrough/amd/iommu_init.c |   3 +-
 xen/drivers/passthrough/vtd/extern.h     |   2 -
 xen/drivers/passthrough/vtd/iommu.c      | 335 +++++------------------
 xen/drivers/passthrough/vtd/iommu.h      |   2 -
 xen/drivers/passthrough/vtd/qinval.c     |   2 +-
 xen/drivers/passthrough/x86/iommu.c      |  27 +-
 9 files changed, 89 insertions(+), 294 deletions(-)

diff --git a/xen/arch/x86/include/asm/iommu.h b/xen/arch/x86/include/asm/iommu.h
index 94513ba9dc..d20c3cda59 100644
--- a/xen/arch/x86/include/asm/iommu.h
+++ b/xen/arch/x86/include/asm/iommu.h
@@ -45,12 +45,15 @@ struct arch_iommu_context
         /* Intel VT-d */
         struct {
             uint64_t pgd_maddr; /* io page directory machine address */
-            unsigned long *iommu_bitmap; /* bitmap of iommu(s) that the context uses */
+            domid_t *didmap; /* per-iommu DID (valid only if related iommu_dev_cnt > 0) */
+            unsigned long *iommu_dev_cnt; /* counter of devices per iommu */
         } vtd;
         /* AMD IOMMU */
         struct {
             unsigned int paging_mode;
             struct page_info *root_table;
+            domid_t *didmap; /* per-iommu DID (valid only if related iommu_dev_cnt > 0) */
+            unsigned long *iommu_dev_cnt; /* counter of devices per iommu */
         } amd;
     };
 };
diff --git a/xen/drivers/passthrough/amd/iommu.h b/xen/drivers/passthrough/amd/iommu.h
index 6095bc6a21..dbe427ed27 100644
--- a/xen/drivers/passthrough/amd/iommu.h
+++ b/xen/drivers/passthrough/amd/iommu.h
@@ -35,6 +35,7 @@
 
 #define iommu_found()           (!list_empty(&amd_iommu_head))
 
+extern unsigned int nr_amd_iommus;
 extern struct list_head amd_iommu_head;
 
 typedef struct event_entry
@@ -106,6 +107,8 @@ struct amd_iommu {
 
     int enabled;
 
+    unsigned int index;
+
     struct list_head ats_devices;
 };
 
diff --git a/xen/drivers/passthrough/amd/iommu_cmd.c b/xen/drivers/passthrough/amd/iommu_cmd.c
index 83c525b84f..e1a252db93 100644
--- a/xen/drivers/passthrough/amd/iommu_cmd.c
+++ b/xen/drivers/passthrough/amd/iommu_cmd.c
@@ -331,11 +331,13 @@ static void _amd_iommu_flush_pages(struct domain *d,
                                    daddr_t daddr, unsigned int order)
 {
     struct amd_iommu *iommu;
-    unsigned int dom_id = d->domain_id;
+    struct iommu_context *ctx = iommu_default_context(d);
 
     /* send INVALIDATE_IOMMU_PAGES command */
     for_each_amd_iommu ( iommu )
     {
+        domid_t dom_id = ctx->arch.amd.didmap[iommu->index];
+
         invalidate_iommu_pages(iommu, daddr, dom_id, order);
         flush_command_buffer(iommu, 0);
     }
diff --git a/xen/drivers/passthrough/amd/iommu_init.c b/xen/drivers/passthrough/amd/iommu_init.c
index 41e241ccc8..333d5d5e39 100644
--- a/xen/drivers/passthrough/amd/iommu_init.c
+++ b/xen/drivers/passthrough/amd/iommu_init.c
@@ -23,7 +23,7 @@
 
 #include "iommu.h"
 
-static int __initdata nr_amd_iommus;
+unsigned int nr_amd_iommus = 0;
 static bool __initdata pci_init;
 
 static struct tasklet amd_iommu_irq_tasklet;
@@ -919,6 +919,7 @@ static void enable_iommu(struct amd_iommu *iommu)
     set_iommu_translation_control(iommu, IOMMU_CONTROL_ENABLED);
 
     iommu->enabled = 1;
+    iommu->index = nr_amd_iommus;
 
     spin_unlock_irqrestore(&iommu->lock, flags);
 
diff --git a/xen/drivers/passthrough/vtd/extern.h b/xen/drivers/passthrough/vtd/extern.h
index 3dcb77c711..82db8f9435 100644
--- a/xen/drivers/passthrough/vtd/extern.h
+++ b/xen/drivers/passthrough/vtd/extern.h
@@ -45,8 +45,6 @@ void disable_intremap(struct vtd_iommu *iommu);
 int iommu_alloc(struct acpi_drhd_unit *drhd);
 void iommu_free(struct acpi_drhd_unit *drhd);
 
-domid_t did_to_domain_id(const struct vtd_iommu *iommu, unsigned int did);
-
 int iommu_flush_iec_global(struct vtd_iommu *iommu);
 int iommu_flush_iec_index(struct vtd_iommu *iommu, u8 im, u16 iidx);
 void clear_fault_bits(struct vtd_iommu *iommu);
diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
index 852994cf97..34b2a287f7 100644
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -63,50 +63,6 @@ static struct tasklet vtd_fault_tasklet;
 static int cf_check setup_hwdom_device(u8 devfn, struct pci_dev *);
 static void setup_hwdom_rmrr(struct domain *d);
 
-static bool domid_mapping(const struct vtd_iommu *iommu)
-{
-    return (const void *)iommu->domid_bitmap != (const void *)iommu->domid_map;
-}
-
-static domid_t convert_domid(const struct vtd_iommu *iommu, domid_t domid)
-{
-    /*
-     * While we need to avoid DID 0 for caching-mode IOMMUs, maintain
-     * the property of the transformation being the same in either
-     * direction. By clipping to 16 bits we ensure that the resulting
-     * DID will fit in the respective context entry field.
-     */
-    BUILD_BUG_ON(DOMID_MASK >= 0xffff);
-
-    return !cap_caching_mode(iommu->cap) ? domid : ~domid;
-}
-
-static int get_iommu_did(domid_t domid, const struct vtd_iommu *iommu,
-                         bool warn)
-{
-    unsigned int nr_dom, i;
-
-    if ( !domid_mapping(iommu) )
-        return convert_domid(iommu, domid);
-
-    nr_dom = cap_ndoms(iommu->cap);
-    i = find_first_bit(iommu->domid_bitmap, nr_dom);
-    while ( i < nr_dom )
-    {
-        if ( iommu->domid_map[i] == domid )
-            return i;
-
-        i = find_next_bit(iommu->domid_bitmap, nr_dom, i + 1);
-    }
-
-    if ( warn )
-        dprintk(XENLOG_ERR VTDPREFIX,
-                "No valid iommu %u domid for Dom%d\n",
-                iommu->index, domid);
-
-    return -1;
-}
-
 #define DID_FIELD_WIDTH 16
 #define DID_HIGH_OFFSET 8
 
@@ -117,127 +73,17 @@ static int get_iommu_did(domid_t domid, const struct vtd_iommu *iommu,
 static int context_set_domain_id(struct context_entry *context,
                                  domid_t domid, struct vtd_iommu *iommu)
 {
-    unsigned int i;
-
     ASSERT(pcidevs_locked());
 
-    if ( domid_mapping(iommu) )
-    {
-        unsigned int nr_dom = cap_ndoms(iommu->cap);
-
-        i = find_first_bit(iommu->domid_bitmap, nr_dom);
-        while ( i < nr_dom && iommu->domid_map[i] != domid )
-            i = find_next_bit(iommu->domid_bitmap, nr_dom, i + 1);
-
-        if ( i >= nr_dom )
-        {
-            i = find_first_zero_bit(iommu->domid_bitmap, nr_dom);
-            if ( i >= nr_dom )
-            {
-                dprintk(XENLOG_ERR VTDPREFIX, "IOMMU: no free domain id\n");
-                return -EBUSY;
-            }
-            iommu->domid_map[i] = domid;
-            set_bit(i, iommu->domid_bitmap);
-        }
-    }
-    else
-        i = convert_domid(iommu, domid);
-
     if ( context )
     {
         context->hi &= ~(((1 << DID_FIELD_WIDTH) - 1) << DID_HIGH_OFFSET);
-        context->hi |= (i & ((1 << DID_FIELD_WIDTH) - 1)) << DID_HIGH_OFFSET;
+        context->hi |= (domid & ((1 << DID_FIELD_WIDTH) - 1)) << DID_HIGH_OFFSET;
     }
 
     return 0;
 }
 
-static void cleanup_domid_map(domid_t domid, struct vtd_iommu *iommu)
-{
-    int iommu_domid;
-
-    if ( !domid_mapping(iommu) )
-        return;
-
-    iommu_domid = get_iommu_did(domid, iommu, false);
-
-    if ( iommu_domid >= 0 )
-    {
-        /*
-         * Update domid_map[] /before/ domid_bitmap[] to avoid a race with
-         * context_set_domain_id(), setting the slot to DOMID_INVALID for
-         * did_to_domain_id() to return a suitable value while the bit is
-         * still set.
-         */
-        iommu->domid_map[iommu_domid] = DOMID_INVALID;
-        clear_bit(iommu_domid, iommu->domid_bitmap);
-    }
-}
-
-static bool any_pdev_behind_iommu(const struct domain *d,
-                                  const struct pci_dev *exclude,
-                                  const struct vtd_iommu *iommu)
-{
-    const struct pci_dev *pdev;
-
-    for_each_pdev ( d, pdev )
-    {
-        const struct acpi_drhd_unit *drhd;
-
-        if ( pdev == exclude )
-            continue;
-
-        drhd = acpi_find_matched_drhd_unit(pdev);
-        if ( drhd && drhd->iommu == iommu )
-            return true;
-    }
-
-    return false;
-}
-
-/*
- * If no other devices under the same iommu owned by this domain,
- * clear iommu in iommu_bitmap and clear domain_id in domid_bitmap.
- */
-static void check_cleanup_domid_map(const struct domain *d,
-                                    const struct pci_dev *exclude,
-                                    struct vtd_iommu *iommu)
-{
-    bool found;
-
-    if ( d == dom_io )
-        return;
-
-    found = any_pdev_behind_iommu(d, exclude, iommu);
-    /*
-     * Hidden devices are associated with DomXEN but usable by the hardware
-     * domain. Hence they need considering here as well.
-     */
-    if ( !found && is_hardware_domain(d) )
-        found = any_pdev_behind_iommu(dom_xen, exclude, iommu);
-
-    if ( !found )
-    {
-        clear_bit(iommu->index, iommu_default_context(d)->arch.vtd.iommu_bitmap);
-        cleanup_domid_map(d->domain_id, iommu);
-    }
-}
-
-domid_t did_to_domain_id(const struct vtd_iommu *iommu, unsigned int did)
-{
-    if ( did >= cap_ndoms(iommu->cap) )
-        return DOMID_INVALID;
-
-    if ( !domid_mapping(iommu) )
-        return convert_domid(iommu, did);
-
-    if ( !test_bit(did, iommu->domid_bitmap) )
-        return DOMID_INVALID;
-
-    return iommu->domid_map[did];
-}
-
 /* Allocate page table, return its machine address */
 uint64_t alloc_pgtable_maddr(unsigned long npages, nodeid_t node)
 {
@@ -754,13 +600,11 @@ static int __must_check cf_check iommu_flush_iotlb(struct domain *d, dfn_t dfn,
 
         iommu = drhd->iommu;
 
-        if ( !test_bit(iommu->index, ctx->arch.vtd.iommu_bitmap) )
+        if ( !ctx->arch.vtd.iommu_dev_cnt[iommu->index] )
             continue;
 
         flush_dev_iotlb = !!find_ats_dev_drhd(iommu);
-        iommu_domid = get_iommu_did(d->domain_id, iommu, !d->is_dying);
-        if ( iommu_domid == -1 )
-            continue;
+        iommu_domid = ctx->arch.vtd.didmap[iommu->index];
 
         if ( !page_count || (page_count & (page_count - 1)) ||
              dfn_eq(dfn, INVALID_DFN) || !IS_ALIGNED(dfn_x(dfn), page_count) )
@@ -1257,7 +1101,6 @@ int __init iommu_alloc(struct acpi_drhd_unit *drhd)
 {
     struct vtd_iommu *iommu;
     unsigned int sagaw, agaw = 0, nr_dom;
-    domid_t reserved_domid = DOMID_INVALID;
     int rc;
 
     iommu = xzalloc(struct vtd_iommu);
@@ -1346,43 +1189,16 @@ int __init iommu_alloc(struct acpi_drhd_unit *drhd)
     if ( !ecap_coherent(iommu->ecap) )
         iommu_non_coherent = true;
 
-    if ( nr_dom <= DOMID_MASK * 2 + cap_caching_mode(iommu->cap) )
-    {
-        /* Allocate domain id (bit) maps. */
-        iommu->domid_bitmap = xzalloc_array(unsigned long,
-                                            BITS_TO_LONGS(nr_dom));
-        iommu->domid_map = xzalloc_array(domid_t, nr_dom);
-        rc = -ENOMEM;
-        if ( !iommu->domid_bitmap || !iommu->domid_map )
-            goto free;
-
-        /*
-         * If Caching mode is set, then invalid translations are tagged
-         * with domain id 0. Hence reserve bit/slot 0.
-         */
-        if ( cap_caching_mode(iommu->cap) )
-        {
-            iommu->domid_map[0] = DOMID_INVALID;
-            __set_bit(0, iommu->domid_bitmap);
-        }
-    }
-    else
-    {
-        /* Don't leave dangling NULL pointers. */
-        iommu->domid_bitmap = ZERO_BLOCK_PTR;
-        iommu->domid_map = ZERO_BLOCK_PTR;
-
-        /*
-         * If Caching mode is set, then invalid translations are tagged
-         * with domain id 0. Hence reserve the ID taking up bit/slot 0.
-         */
-        reserved_domid = convert_domid(iommu, 0) ?: DOMID_INVALID;
-    }
+    /* Allocate domain id (bit) maps. */
+    iommu->domid_bitmap = xzalloc_array(unsigned long,
+                                        BITS_TO_LONGS(nr_dom));
 
-    iommu->pseudo_domid_map = iommu_init_domid(reserved_domid);
-    rc = -ENOMEM;
-    if ( !iommu->pseudo_domid_map )
-        goto free;
+    /*
+        * If Caching mode is set, then invalid translations are tagged
+        * with domain id 0. Hence reserve bit/slot 0.
+        */
+    if ( cap_caching_mode(iommu->cap) )
+        __set_bit(0, iommu->domid_bitmap);
 
     return 0;
 
@@ -1410,8 +1226,6 @@ void __init iommu_free(struct acpi_drhd_unit *drhd)
         iounmap(iommu->reg);
 
     xfree(iommu->domid_bitmap);
-    xfree(iommu->domid_map);
-    xfree(iommu->pseudo_domid_map);
 
     if ( iommu->msi.irq >= 0 )
         destroy_irq(iommu->msi.irq);
@@ -1425,19 +1239,39 @@ void __init iommu_free(struct acpi_drhd_unit *drhd)
         agaw = 64;                              \
     agaw; })
 
-static int cf_check intel_iommu_domain_init(struct domain *d)
+static int cf_check intel_iommu_context_init(struct domain *d, struct iommu_context *ctx)
 {
-    struct domain_iommu *hd = dom_iommu(d);
-    struct iommu_context *ctx = iommu_default_context(d);
+    struct acpi_drhd_unit *drhd;
 
-    ctx->arch.vtd.iommu_bitmap = xzalloc_array(unsigned long,
-                                              BITS_TO_LONGS(nr_iommus));
-    if ( !ctx->arch.vtd.iommu_bitmap )
+    ctx->arch.vtd.didmap = xzalloc_array(domid_t, nr_iommus);
+    if ( !ctx->arch.vtd.didmap )
         return -ENOMEM;
 
+    ctx->arch.vtd.iommu_dev_cnt = xzalloc_array(unsigned long, nr_iommus);
+    if ( !ctx->arch.vtd.iommu_dev_cnt )
+    {
+        xfree(ctx->arch.vtd.didmap);
+        return -ENOMEM;
+    }
+
+    // TODO: Allocate IOMMU domid only when attaching devices ?
+    /* Populate context DID map using pseudo DIDs */
+    for_each_drhd_unit(drhd)
+    {
+        ctx->arch.vtd.didmap[drhd->iommu->index] =
+            iommu_alloc_domid(drhd->iommu->domid_bitmap);
+    }
+
+    return arch_iommu_context_init(d, ctx, 0);
+}
+
+static int cf_check intel_iommu_domain_init(struct domain *d)
+{
+    struct domain_iommu *hd = dom_iommu(d);
+
     hd->arch.vtd.agaw = width_to_agaw(DEFAULT_DOMAIN_ADDRESS_WIDTH);
 
-    return 0;
+    return intel_iommu_context_init(d, iommu_default_context(d));
 }
 
 static void __hwdom_init cf_check intel_iommu_hwdom_init(struct domain *d)
@@ -1481,11 +1315,11 @@ int domain_context_mapping_one(
     struct context_entry *context, *context_entries, lctxt;
     __uint128_t res, old;
     uint64_t maddr;
-    uint16_t seg = iommu->drhd->segment, prev_did = 0;
-    struct domain *prev_dom = NULL;
+    uint16_t seg = iommu->drhd->segment, prev_did = 0, did;
     int rc, ret;
-    bool flush_dev_iotlb;
+    bool flush_dev_iotlb, overwrite_entry = false;
 
+    struct iommu_context *prev_ctx = pdev->domain ? iommu_default_context(pdev->domain) : NULL;
 
     ASSERT(pcidevs_locked());
     spin_lock(&iommu->lock);
@@ -1494,23 +1328,12 @@ int domain_context_mapping_one(
     context = &context_entries[devfn];
     old = (lctxt = *context).full;
 
+    did = ctx->arch.vtd.didmap[iommu->index];
+
     if ( context_present(lctxt) )
     {
-        domid_t domid;
-
         prev_did = context_domain_id(lctxt);
-        domid = did_to_domain_id(iommu, prev_did);
-        if ( domid < DOMID_FIRST_RESERVED )
-            prev_dom = rcu_lock_domain_by_id(domid);
-        if ( !prev_dom )
-        {
-            spin_unlock(&iommu->lock);
-            unmap_vtd_domain_page(context_entries);
-            dprintk(XENLOG_DEBUG VTDPREFIX,
-                    "no domain for did %u (nr_dom %u)\n",
-                    prev_did, cap_ndoms(iommu->cap));
-            return -ESRCH;
-        }
+        overwrite_entry = true;
     }
 
     if ( iommu_hwdom_passthrough && is_hardware_domain(domain) )
@@ -1526,11 +1349,7 @@ int domain_context_mapping_one(
         root = domain_pgd_maddr(domain, ctx, pgd_maddr, iommu->nr_pt_levels);
         if ( !root )
         {
-            spin_unlock(&ctx->arch.mapping_lock);
-            spin_unlock(&iommu->lock);
             unmap_vtd_domain_page(context_entries);
-            if ( prev_dom )
-                rcu_unlock_domain(prev_dom);
             return -ENOMEM;
         }
 
@@ -1543,35 +1362,13 @@ int domain_context_mapping_one(
         spin_unlock(&ctx->arch.mapping_lock);
     }
 
-    rc = context_set_domain_id(&lctxt, domid, iommu);
+    rc = context_set_domain_id(&lctxt, did, iommu);
     if ( rc )
-    {
-    unlock:
-        spin_unlock(&iommu->lock);
-        unmap_vtd_domain_page(context_entries);
-        if ( prev_dom )
-            rcu_unlock_domain(prev_dom);
-        return rc;
-    }
-
-    if ( !prev_dom )
-    {
-        context_set_address_width(lctxt, level_to_agaw(iommu->nr_pt_levels));
-        context_set_fault_enable(lctxt);
-        context_set_present(lctxt);
-    }
-    else if ( prev_dom == domain )
-    {
-        ASSERT(lctxt.full == context->full);
-        rc = !!pdev;
         goto unlock;
-    }
-    else
-    {
-        ASSERT(context_address_width(lctxt) ==
-               level_to_agaw(iommu->nr_pt_levels));
-        ASSERT(!context_fault_disable(lctxt));
-    }
+
+    context_set_address_width(lctxt, level_to_agaw(iommu->nr_pt_levels));
+    context_set_fault_enable(lctxt);
+    context_set_present(lctxt);
 
     res = cmpxchg16b(context, &old, &lctxt.full);
 
@@ -1581,8 +1378,6 @@ int domain_context_mapping_one(
      */
     if ( res != old )
     {
-        if ( pdev )
-            check_cleanup_domid_map(domain, pdev, iommu);
         printk(XENLOG_ERR
                 "%pp: unexpected context entry %016lx_%016lx (expected %016lx_%016lx)\n",
                 &PCI_SBDF(seg, bus, devfn),
@@ -1596,9 +1391,9 @@ int domain_context_mapping_one(
     spin_unlock(&iommu->lock);
 
     rc = iommu_flush_context_device(iommu, prev_did, PCI_BDF(bus, devfn),
-                                    DMA_CCMD_MASK_NOBIT, !prev_dom);
+                                    DMA_CCMD_MASK_NOBIT, !overwrite_entry);
     flush_dev_iotlb = !!find_ats_dev_drhd(iommu);
-    ret = iommu_flush_iotlb_dsi(iommu, prev_did, !prev_dom, flush_dev_iotlb);
+    ret = iommu_flush_iotlb_dsi(iommu, prev_did, !overwrite_entry, flush_dev_iotlb);
 
     /*
      * The current logic for returns:
@@ -1614,18 +1409,27 @@ int domain_context_mapping_one(
     if ( rc > 0 )
         rc = 0;
 
-    set_bit(iommu->index, ctx->arch.vtd.iommu_bitmap);
+    if ( prev_ctx )
+    {
+        /* Don't underflow the counter. */
+        BUG_ON(!prev_ctx->arch.vtd.iommu_dev_cnt[iommu->index]);
+        prev_ctx->arch.vtd.iommu_dev_cnt[iommu->index]--;
+    }
+
+    ctx->arch.vtd.iommu_dev_cnt[iommu->index]++;
 
     unmap_vtd_domain_page(context_entries);
+    spin_unlock(&iommu->lock);
 
     if ( !seg && !rc )
         rc = me_wifi_quirk(domain, bus, devfn, domid, pgd_maddr, mode);
 
+    return rc;
 
-    if ( prev_dom )
-        rcu_unlock_domain(prev_dom);
-
-    return rc ?: pdev && prev_dom;
+    unlock:
+        unmap_vtd_domain_page(context_entries);
+        spin_unlock(&iommu->lock);
+        return rc;
 }
 
 static const struct acpi_drhd_unit *domain_context_unmap(
@@ -1637,7 +1441,7 @@ static int domain_context_mapping(struct domain *domain, struct iommu_context *c
     const struct acpi_drhd_unit *drhd = acpi_find_matched_drhd_unit(pdev);
     const struct acpi_rmrr_unit *rmrr;
     paddr_t pgd_maddr = ctx->arch.vtd.pgd_maddr;
-    domid_t did = domain->domain_id;
+    domid_t did = ctx->arch.vtd.didmap[drhd->iommu->index];
     int ret = 0;
     unsigned int i, mode = 0;
     uint16_t seg = pdev->seg, bdf;
@@ -1960,9 +1764,10 @@ static void cf_check iommu_domain_teardown(struct domain *d)
     ASSERT(!ctx->arch.vtd.pgd_maddr);
 
     for_each_drhd_unit ( drhd )
-        cleanup_domid_map(d->domain_id, drhd->iommu);
+        iommu_free_domid(d->domain_id, drhd->iommu->domid_bitmap);
 
-    XFREE(ctx->arch.vtd.iommu_bitmap);
+    XFREE(ctx->arch.vtd.iommu_dev_cnt);
+    XFREE(ctx->arch.vtd.didmap);
 }
 
 static void quarantine_teardown(struct pci_dev *pdev,
diff --git a/xen/drivers/passthrough/vtd/iommu.h b/xen/drivers/passthrough/vtd/iommu.h
index 29d350b23d..77edfa3587 100644
--- a/xen/drivers/passthrough/vtd/iommu.h
+++ b/xen/drivers/passthrough/vtd/iommu.h
@@ -506,9 +506,7 @@ struct vtd_iommu {
     } flush;
 
     struct list_head ats_devices;
-    unsigned long *pseudo_domid_map; /* "pseudo" domain id bitmap */
     unsigned long *domid_bitmap;  /* domain id bitmap */
-    domid_t *domid_map;           /* domain id mapping array */
     uint32_t version;
 };
 
diff --git a/xen/drivers/passthrough/vtd/qinval.c b/xen/drivers/passthrough/vtd/qinval.c
index 036f3e8505..3f25b6a2e0 100644
--- a/xen/drivers/passthrough/vtd/qinval.c
+++ b/xen/drivers/passthrough/vtd/qinval.c
@@ -229,7 +229,7 @@ static int __must_check dev_invalidate_sync(struct vtd_iommu *iommu,
     rc = queue_invalidate_wait(iommu, 0, 1, 1, 1);
     if ( rc == -ETIMEDOUT && !pdev->broken )
     {
-        struct domain *d = rcu_lock_domain_by_id(did_to_domain_id(iommu, did));
+        struct domain *d = rcu_lock_domain(pdev->domain);
 
         /*
          * In case the domain has been freed or the IOMMU domid bitmap is
diff --git a/xen/drivers/passthrough/x86/iommu.c b/xen/drivers/passthrough/x86/iommu.c
index a444e5813e..730a75e628 100644
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -555,9 +555,6 @@ unsigned long *__init iommu_init_domid(domid_t reserve)
 {
     unsigned long *map;
 
-    if ( !iommu_quarantine )
-        return ZERO_BLOCK_PTR;
-
     BUILD_BUG_ON(DOMID_MASK * 2U >= UINT16_MAX);
 
     map = xzalloc_array(unsigned long, BITS_TO_LONGS(UINT16_MAX - DOMID_MASK));
@@ -572,36 +569,24 @@ unsigned long *__init iommu_init_domid(domid_t reserve)
 
 domid_t iommu_alloc_domid(unsigned long *map)
 {
-    /*
-     * This is used uniformly across all IOMMUs, such that on typical
-     * systems we wouldn't re-use the same ID very quickly (perhaps never).
-     */
-    static unsigned int start;
-    unsigned int idx = find_next_zero_bit(map, UINT16_MAX - DOMID_MASK, start);
+    /* TODO: Consider nr_doms ? */
+    unsigned int idx = find_next_zero_bit(map, UINT16_MAX, 0);
 
-    ASSERT(pcidevs_locked());
-
-    if ( idx >= UINT16_MAX - DOMID_MASK )
-        idx = find_first_zero_bit(map, UINT16_MAX - DOMID_MASK);
-    if ( idx >= UINT16_MAX - DOMID_MASK )
-        return DOMID_INVALID;
+    if ( idx >= UINT16_MAX )
+        return UINT16_MAX;
 
     __set_bit(idx, map);
 
-    start = idx + 1;
-
-    return idx | (DOMID_MASK + 1);
+    return idx;
 }
 
 void iommu_free_domid(domid_t domid, unsigned long *map)
 {
     ASSERT(pcidevs_locked());
 
-    if ( domid == DOMID_INVALID )
+    if ( domid == UINT16_MAX )
         return;
 
-    ASSERT(domid > DOMID_MASK);
-
     if ( !__test_and_clear_bit(domid & DOMID_MASK, map) )
         BUG();
 }
-- 
2.47.2



Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates solutions

web: https://vates.tech

