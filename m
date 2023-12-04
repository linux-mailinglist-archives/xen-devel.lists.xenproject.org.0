Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D020802EFD
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 10:43:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.646680.1009230 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA5Tx-0004MV-Uz; Mon, 04 Dec 2023 09:43:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 646680.1009230; Mon, 04 Dec 2023 09:43:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA5Tx-0004BU-Pu; Mon, 04 Dec 2023 09:43:17 +0000
Received: by outflank-mailman (input) for mailman id 646680;
 Mon, 04 Dec 2023 09:43:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uft2=HP=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rA5Tv-0003Ag-SR
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 09:43:15 +0000
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [2a00:1450:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8be4d92e-9289-11ee-98e5-6d05b1d4d9a1;
 Mon, 04 Dec 2023 10:43:15 +0100 (CET)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3334254cfa3so586336f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 04 Dec 2023 01:43:15 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 w7-20020a5d6087000000b0033340937da6sm4467635wrt.95.2023.12.04.01.43.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Dec 2023 01:43:14 -0800 (PST)
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
X-Inumbo-ID: 8be4d92e-9289-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701682994; x=1702287794; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nBxUOp4k8iF04PfE5JQxxLRa/lZUdCotTQUWqLt7x1U=;
        b=Xk+lcZdR3Ef5O4GHZdTFrQXcY0ELxOIPoaeOovburPx8YQg1pXhlPrG91WhrHqa8tn
         WP64db2NAJ2ZRb9WeruXhzl13FksA3BFT6P1eLrsHJNjTVvvM1b2VT/Rgc487xn41yOR
         g1/qliUEFjfS+x7RV8G2UPzza10r2qIyifa+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701682994; x=1702287794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nBxUOp4k8iF04PfE5JQxxLRa/lZUdCotTQUWqLt7x1U=;
        b=h8iKT/D6zgpEUkQIEp4jkONg5uHPNo37I7ZAtbSVviL0hZBjE+n+V+3/1uyRV2Cn6f
         kYj0yzRIsBazbTBjeSHfttWsGSwXgMQK4/6ZTOjAebd+Hsjl3xNI+LkAEgkUAyfBS6CR
         36iqD2fcUaeItsx3Gi/zeRumWy9Sf2XaRQox2HUE3w+GuvrzQAhupKrtSwihQrC70XpJ
         x7fgEMahGeC+h6JrixzZT0P5gdTNGIxBOFiAE4fVA3EO7kMfm7kSRrOwOx30gA/cuAzg
         PI6Go0J9yDtxB6m1hDCW4RYaXI16gglLbzI/LCRkc8neHI4lCdT4LP7dbhhaZiqguZcZ
         PT6g==
X-Gm-Message-State: AOJu0YwV/cYmONVQK7s//XsFA0ZaYT9fjr6RrYA4iFkY5khF6hsnYXke
	VmM/Wql6h9byqHbH5wYJHAekuRLDoMGj3fkuABw=
X-Google-Smtp-Source: AGHT+IGt10H1vLQ1ypcgx44pGrMANAyATfBxCWQXY+1f41YKPzKnWdOsUgoBXmadZnPVGkXFL0B5Xg==
X-Received: by 2002:a5d:44c9:0:b0:332:eae9:1db1 with SMTP id z9-20020a5d44c9000000b00332eae91db1mr2409608wrr.4.1701682994342;
        Mon, 04 Dec 2023 01:43:14 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH v2 5/6] x86/iommu: switch hwdom IOMMU to use a rangeset
Date: Mon,  4 Dec 2023 10:43:04 +0100
Message-ID: <20231204094305.59267-6-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231204094305.59267-1-roger.pau@citrix.com>
References: <20231204094305.59267-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The current loop that iterates from 0 to the maximum RAM address in order to
setup the IOMMU mappings is highly inefficient, and it will get worse as the
amount of RAM increases.  It's also not accounting for any reserved regions
past the last RAM address.

Instead of iterating over memory addresses, iterate over the memory map regions
and use a rangeset in order to keep track of which ranges need to be identity
mapped in the hardware domain physical address space.

On an AMD EPYC 7452 with 512GiB of RAM, the time to execute
arch_iommu_hwdom_init() in nanoseconds is:

x old
+ new
    N           Min           Max        Median           Avg        Stddev
x   5 2.2364154e+10  2.338244e+10 2.2474685e+10 2.2622409e+10 4.2949869e+08
+   5       1025012       1033036       1026188     1028276.2     3623.1194
Difference at 95.0% confidence
        -2.26214e+10 +/- 4.42931e+08
        -99.9955% +/- 9.05152e-05%
        (Student's t, pooled s = 3.03701e+08)

Execution time of arch_iommu_hwdom_init() goes down from ~22s to ~0.001s.

Note there's a change for HVM domains (ie: PVH dom0) that get switched to
create the p2m mappings using map_mmio_regions() instead of
p2m_add_identity_entry(), so that ranges can be mapped with a single function
call if possible.  Note that the interface of map_mmio_regions() doesn't
allow creating read-only mappings, but so far there are no such mappings
created for PVH dom0 in arch_iommu_hwdom_init().

No change intended in the resulting mappings that a hardware domain gets.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Split from bigger patch.
 - Remove unneeded default case.
---
 xen/drivers/passthrough/x86/iommu.c | 157 ++++++++--------------------
 1 file changed, 42 insertions(+), 115 deletions(-)

diff --git a/xen/drivers/passthrough/x86/iommu.c b/xen/drivers/passthrough/x86/iommu.c
index 7e97805fccec..81d6129189d0 100644
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -300,76 +300,6 @@ void iommu_identity_map_teardown(struct domain *d)
     }
 }
 
-static unsigned int __hwdom_init hwdom_iommu_map(const struct domain *d,
-                                                 unsigned long pfn,
-                                                 unsigned long max_pfn)
-{
-    mfn_t mfn = _mfn(pfn);
-    unsigned int i, type, perms = IOMMUF_readable | IOMMUF_writable;
-
-    /*
-     * Set up 1:1 mapping for dom0. Default to include only conventional RAM
-     * areas and let RMRRs include needed reserved regions. When set, the
-     * inclusive mapping additionally maps in every pfn up to 4GB except those
-     * that fall in unusable ranges for PV Dom0.
-     */
-    if ( (pfn > max_pfn && !mfn_valid(mfn)) || xen_in_range(pfn) )
-        return 0;
-
-    switch ( type = page_get_ram_type(mfn) )
-    {
-    case RAM_TYPE_UNUSABLE:
-        return 0;
-
-    case RAM_TYPE_CONVENTIONAL:
-        if ( iommu_hwdom_strict )
-            return 0;
-        break;
-
-    default:
-        if ( type & RAM_TYPE_RESERVED )
-        {
-            if ( !iommu_hwdom_inclusive && !iommu_hwdom_reserved )
-                perms = 0;
-        }
-        else if ( is_hvm_domain(d) )
-            return 0;
-        else if ( !iommu_hwdom_inclusive || pfn > max_pfn )
-            perms = 0;
-    }
-
-    /* Check that it doesn't overlap with the Interrupt Address Range. */
-    if ( pfn >= 0xfee00 && pfn <= 0xfeeff )
-        return 0;
-    /* ... or the IO-APIC */
-    if ( has_vioapic(d) )
-    {
-        for ( i = 0; i < d->arch.hvm.nr_vioapics; i++ )
-            if ( pfn == PFN_DOWN(domain_vioapic(d, i)->base_address) )
-                return 0;
-    }
-    else if ( is_pv_domain(d) )
-    {
-        /*
-         * Be consistent with CPU mappings: Dom0 is permitted to establish r/o
-         * ones there (also for e.g. HPET in certain cases), so it should also
-         * have such established for IOMMUs.
-         */
-        if ( iomem_access_permitted(d, pfn, pfn) &&
-             rangeset_contains_singleton(mmio_ro_ranges, pfn) )
-            perms = IOMMUF_readable;
-    }
-    /*
-     * ... or the PCIe MCFG regions.
-     * TODO: runtime added MMCFG regions are not checked to make sure they
-     * don't overlap with already mapped regions, thus preventing trapping.
-     */
-    if ( has_vpci(d) && vpci_is_mmcfg_address(d, pfn_to_paddr(pfn)) )
-        return 0;
-
-    return perms;
-}
-
 static int __hwdom_init cf_check map_subtract(unsigned long s, unsigned long e,
                                               void *data)
 {
@@ -444,8 +374,8 @@ static int __hwdom_init cf_check identity_map(unsigned long s, unsigned long e,
 
 void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
 {
-    unsigned long i, top, max_pfn, start, count;
-    unsigned int flush_flags = 0, start_perms = 0;
+    const unsigned long max_pfn = PFN_DOWN(GB(4)) - 1;
+    unsigned int i;
     struct rangeset *map;
     struct map_data map_data = { .d = d };
     int rc;
@@ -476,58 +406,55 @@ void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
     if ( !map )
         panic("IOMMU init: unable to allocate rangeset\n");
 
-    max_pfn = (GB(4) >> PAGE_SHIFT) - 1;
-    top = max(max_pdx, pfn_to_pdx(max_pfn) + 1);
+    if ( iommu_hwdom_inclusive )
+    {
+        /* Add the whole range below 4GB, UNUSABLE regions will be removed. */
+        rc = rangeset_add_range(map, 0, max_pfn);
+        if ( rc )
+            panic("IOMMU inclusive mappings can't be added: %d\n",
+                  rc);
+    }
 
-    for ( i = 0, start = 0, count = 0; i < top; )
+    for ( i = 0; i < e820.nr_map; i++ )
     {
-        unsigned long pfn = pdx_to_pfn(i);
-        unsigned int perms = hwdom_iommu_map(d, pfn, max_pfn);
+        struct e820entry entry = e820.map[i];
 
-        if ( !perms )
-            /* nothing */;
-        else if ( paging_mode_translate(d) )
+        switch ( entry.type )
         {
-            int rc;
+        case E820_UNUSABLE:
+            if ( !iommu_hwdom_inclusive || PFN_DOWN(entry.addr) > max_pfn )
+                continue;
 
-            rc = p2m_add_identity_entry(d, pfn,
-                                        perms & IOMMUF_writable ? p2m_access_rw
-                                                                : p2m_access_r,
-                                        0);
+            rc = rangeset_remove_range(map, PFN_DOWN(entry.addr),
+                                       PFN_DOWN(entry.addr + entry.size - 1));
             if ( rc )
-                printk(XENLOG_WARNING
-                       "%pd: identity mapping of %lx failed: %d\n",
-                       d, pfn, rc);
-        }
-        else if ( pfn != start + count || perms != start_perms )
-        {
-            long rc;
+                panic("IOMMU failed to remove unusable memory: %d\n",
+                      rc);
+            continue;
 
-        commit:
-            while ( (rc = iommu_map(d, _dfn(start), _mfn(start), count,
-                                    start_perms | IOMMUF_preempt,
-                                    &flush_flags)) > 0 )
-            {
-                start += rc;
-                count -= rc;
-                process_pending_softirqs();
-            }
-            if ( rc )
-                printk(XENLOG_WARNING
-                       "%pd: IOMMU identity mapping of [%lx,%lx) failed: %ld\n",
-                       d, start, start + count, rc);
-            start = pfn;
-            count = 1;
-            start_perms = perms;
+        case E820_RESERVED:
+            if ( !iommu_hwdom_inclusive && !iommu_hwdom_reserved )
+                continue;
+            break;
+
+        case E820_RAM:
+            if ( iommu_hwdom_strict )
+                continue;
+            break;
         }
-        else
-            ++count;
 
-        if ( !(++i & 0xfffff) )
-            process_pending_softirqs();
+        if ( iommu_hwdom_inclusive &&
+             PFN_DOWN(entry.addr + entry.size - 1) <= max_pfn )
+            /*
+             * Any range below 4GB is already in the rangeset if using inclusive
+             * mode.
+             */
+            continue;
 
-        if ( i == top && count )
-            goto commit;
+        rc = rangeset_add_range(map, PFN_DOWN(entry.addr),
+                                PFN_DOWN(entry.addr + entry.size - 1));
+        if ( rc )
+            panic("IOMMU failed to add identity range: %d\n", rc);
     }
 
     /* Remove any areas in-use by Xen. */
@@ -605,7 +532,7 @@ void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
     rangeset_destroy(map);
 
     /* Use if to avoid compiler warning */
-    if ( iommu_iotlb_flush_all(d, flush_flags) )
+    if ( iommu_iotlb_flush_all(d, map_data.flush_flags) )
         return;
 }
 
-- 
2.43.0


