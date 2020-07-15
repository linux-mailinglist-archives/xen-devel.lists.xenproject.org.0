Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5318C220964
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jul 2020 12:04:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jveGd-00061f-3D; Wed, 15 Jul 2020 10:03:59 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9G22=A2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jveGc-00061W-3r
 for xen-devel@lists.xenproject.org; Wed, 15 Jul 2020 10:03:58 +0000
X-Inumbo-ID: 7f21ce56-c682-11ea-93a9-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7f21ce56-c682-11ea-93a9-12813bfff9fa;
 Wed, 15 Jul 2020 10:03:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BEB99AF99;
 Wed, 15 Jul 2020 10:03:59 +0000 (UTC)
Subject: [PATCH 1/2] VT-d: install sync_cache hook on demand
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <2ad1607d-0909-f1cc-83bf-2546b28a9128@suse.com>
Message-ID: <0036b69f-0d56-9ac4-1afa-06640c9007de@suse.com>
Date: Wed, 15 Jul 2020 12:03:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <2ad1607d-0909-f1cc-83bf-2546b28a9128@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Kevin Tian <kevin.tian@intel.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Instead of checking inside the hook whether any non-coherent IOMMUs are
present, simply install the hook only when this is the case.

To prove that there are no other references to the now dynamically
updated ops structure (and hence that its updating happens early
enough), make it static and rename it at the same time.

Note that this change implies that sync_cache() shouldn't be called
directly unless there are unusual circumstances, like is the case in
alloc_pgtable_maddr(), which gets invoked too early for iommu_ops to
be set already (and therefore we also need to be careful there to
avoid accessing vtd_ops later on, as it lives in .init).

Signed-off-by: Jan Beulich <jbeulich@suse.com>

--- a/xen/drivers/passthrough/vtd/extern.h
+++ b/xen/drivers/passthrough/vtd/extern.h
@@ -28,7 +28,6 @@
 struct pci_ats_dev;
 extern bool_t rwbf_quirk;
 extern const struct iommu_init_ops intel_iommu_init_ops;
-extern const struct iommu_ops intel_iommu_ops;
 
 void print_iommu_regs(struct acpi_drhd_unit *drhd);
 void print_vtd_entries(struct vtd_iommu *iommu, int bus, int devfn, u64 gmfn);
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -59,6 +59,7 @@ bool __read_mostly iommu_snoop = true;
 
 int nr_iommus;
 
+static struct iommu_ops vtd_ops;
 static struct tasklet vtd_fault_tasklet;
 
 static int setup_hwdom_device(u8 devfn, struct pci_dev *);
@@ -146,16 +147,11 @@ static int context_get_domain_id(struct
     return domid;
 }
 
-static int iommus_incoherent;
-
 static void sync_cache(const void *addr, unsigned int size)
 {
     static unsigned long clflush_size = 0;
     const void *end = addr + size;
 
-    if ( !iommus_incoherent )
-        return;
-
     if ( clflush_size == 0 )
         clflush_size = get_cache_line_size();
 
@@ -217,7 +213,8 @@ uint64_t alloc_pgtable_maddr(unsigned lo
         vaddr = __map_domain_page(cur_pg);
         memset(vaddr, 0, PAGE_SIZE);
 
-        sync_cache(vaddr, PAGE_SIZE);
+        if ( (iommu_ops.init ? &iommu_ops : &vtd_ops)->sync_cache )
+            sync_cache(vaddr, PAGE_SIZE);
         unmap_domain_page(vaddr);
         cur_pg++;
     }
@@ -1227,7 +1224,7 @@ int __init iommu_alloc(struct acpi_drhd_
     iommu->nr_pt_levels = agaw_to_level(agaw);
 
     if ( !ecap_coherent(iommu->ecap) )
-        iommus_incoherent = 1;
+        vtd_ops.sync_cache = sync_cache;
 
     /* allocate domain id bitmap */
     nr_dom = cap_ndoms(iommu->cap);
@@ -2737,7 +2734,7 @@ static int __init intel_iommu_quarantine
     return level ? -ENOMEM : rc;
 }
 
-const struct iommu_ops __initconstrel intel_iommu_ops = {
+static struct iommu_ops __initdata vtd_ops = {
     .init = intel_iommu_domain_init,
     .hwdom_init = intel_iommu_hwdom_init,
     .quarantine_init = intel_iommu_quarantine_init,
@@ -2768,11 +2765,10 @@ const struct iommu_ops __initconstrel in
     .iotlb_flush_all = iommu_flush_iotlb_all,
     .get_reserved_device_memory = intel_iommu_get_reserved_device_memory,
     .dump_p2m_table = vtd_dump_p2m_table,
-    .sync_cache = sync_cache,
 };
 
 const struct iommu_init_ops __initconstrel intel_iommu_init_ops = {
-    .ops = &intel_iommu_ops,
+    .ops = &vtd_ops,
     .setup = vtd_setup,
     .supports_x2apic = intel_iommu_supports_eim,
 };


