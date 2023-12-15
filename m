Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECFAF814A52
	for <lists+xen-devel@lfdr.de>; Fri, 15 Dec 2023 15:19:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.655135.1022869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rE92a-0008C1-Qy; Fri, 15 Dec 2023 14:19:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 655135.1022869; Fri, 15 Dec 2023 14:19:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rE92a-00087W-K8; Fri, 15 Dec 2023 14:19:48 +0000
Received: by outflank-mailman (input) for mailman id 655135;
 Fri, 15 Dec 2023 14:19:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a4Sn=H2=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rE92Z-0007Jp-7Q
 for xen-devel@lists.xenproject.org; Fri, 15 Dec 2023 14:19:47 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e2cf4adf-9b54-11ee-9b0f-b553b5be7939;
 Fri, 15 Dec 2023 15:18:58 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-3365424df34so306128f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 15 Dec 2023 06:18:58 -0800 (PST)
Received: from localhost ([213.195.127.70]) by smtp.gmail.com with ESMTPSA id
 f6-20020adff446000000b0033657514fcfsm855835wrp.88.2023.12.15.06.18.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Dec 2023 06:18:56 -0800 (PST)
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
X-Inumbo-ID: e2cf4adf-9b54-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1702649937; x=1703254737; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5lykRqqEdrF/krYjCiZGA6WQAOyP6ulgqiaZTejSNGo=;
        b=cij/3YMP060wV+SXGsYd0P8ts7rBnTqZv38Ws3VJrq7HHquf5i9M3npzwuPg4vEcu+
         Nb926wNvu7HRjYqvPOijzqGanZzUIuaEOHfeOyRuEq7xkPohuLvsttarLfFDlKfw89R+
         2pMAqI0WE0OeyXMYQzGLhubxAg6Yh5SWy1WF4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702649937; x=1703254737;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5lykRqqEdrF/krYjCiZGA6WQAOyP6ulgqiaZTejSNGo=;
        b=xSY74aVqk3jRzC0Kolbu8WbXmO2VIQGm76nIVNCInfjCpuzH2bRAqnvE7KdlWw5qOE
         yojTSvNLfHyzJIjxV8XttejF7pgAYg7Db2ErGEV0KQUve0QYLmA84BFejfhWv7DKfKqE
         shYjzART0Q1aYcxMPdKyXBULZmDhBrzQ7VpglpdkhuYg4tzejN9BSyWH0XZPcuO/rUhP
         rFCzuyr31+23mgyATdOeAnTkMD/jOGqWq477UtONs8VizLoQeqsDdZ63Zr8f5HrkczcY
         pYaJ76ei7+PATedMpoQ/0lPOIWOzwTGIhZV7UDImKpJ9e6q4s4xzkc+Gsy6xPiAtxB8a
         JJBA==
X-Gm-Message-State: AOJu0YzP1RPjjA3AWmnlEEXnQZpfbl21VOeE0uKx1wB/z7r4Q9SjTvnP
	/t1TQdZqS2vChZFjlzt4nFiSsUDGCkHdMkaOkLs=
X-Google-Smtp-Source: AGHT+IGQGsI0lKB1NPkzVppEMIHv2TdUuGosUDtge/cbC0NcVsYiccA3HK76OV2Km7hq4OxXDv5IJw==
X-Received: by 2002:adf:e2cc:0:b0:334:b157:f155 with SMTP id d12-20020adfe2cc000000b00334b157f155mr5895378wrj.28.1702649936944;
        Fri, 15 Dec 2023 06:18:56 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH v3 6/7] x86/iommu: switch hwdom IOMMU to use a rangeset
Date: Fri, 15 Dec 2023 15:18:31 +0100
Message-ID: <20231215141832.9492-7-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231215141832.9492-1-roger.pau@citrix.com>
References: <20231215141832.9492-1-roger.pau@citrix.com>
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
Changes since v2:
 - Simplify a bit the logic related to inclusive option, at the cost of making
   some no-op calls on some cases.

Changes since v1:
 - Split from bigger patch.
 - Remove unneeded default case.
---
 xen/drivers/passthrough/x86/iommu.c | 149 ++++++----------------------
 1 file changed, 32 insertions(+), 117 deletions(-)

diff --git a/xen/drivers/passthrough/x86/iommu.c b/xen/drivers/passthrough/x86/iommu.c
index 3bc84d1bfb3e..67cf9bff1c29 100644
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
@@ -455,8 +385,7 @@ static int __hwdom_init cf_check identity_map(unsigned long s, unsigned long e,
 
 void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
 {
-    unsigned long i, top, max_pfn, start, count;
-    unsigned int flush_flags = 0, start_perms = 0;
+    unsigned int i;
     struct rangeset *map;
     struct map_data map_data = { .d = d };
     int rc;
@@ -487,58 +416,45 @@ void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
     if ( !map )
         panic("IOMMU init: unable to allocate rangeset\n");
 
-    max_pfn = (GB(4) >> PAGE_SHIFT) - 1;
-    top = max(max_pdx, pfn_to_pdx(max_pfn) + 1);
+    if ( iommu_hwdom_inclusive )
+    {
+        /* Add the whole range below 4GB, UNUSABLE regions will be removed. */
+        rc = rangeset_add_range(map, 0, PFN_DOWN(GB(4)) - 1);
+        if ( rc )
+            panic("IOMMU inclusive mappings can't be added: %d\n",
+                  rc);
+    }
 
-    for ( i = 0, start = 0, count = 0; i < top; )
+    for ( i = 0; i < e820.nr_map; i++ )
     {
-        unsigned long pfn = pdx_to_pfn(i);
-        unsigned int perms = hwdom_iommu_map(d, pfn, max_pfn);
+        const struct e820entry entry = e820.map[i];
 
-        if ( !perms )
-            /* nothing */;
-        else if ( paging_mode_translate(d) )
+        switch ( entry.type )
         {
-            int rc;
-
-            rc = p2m_add_identity_entry(d, pfn,
-                                        perms & IOMMUF_writable ? p2m_access_rw
-                                                                : p2m_access_r,
-                                        0);
+        case E820_UNUSABLE:
+            /* Only relevant for inclusive mode, otherwise this is a no-op. */
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
-        }
-        else
-            ++count;
+        case E820_RESERVED:
+            if ( !iommu_hwdom_inclusive && !iommu_hwdom_reserved )
+                continue;
+            break;
 
-        if ( !(++i & 0xfffff) )
-            process_pending_softirqs();
+        case E820_RAM:
+            if ( iommu_hwdom_strict )
+                continue;
+            break;
+        }
 
-        if ( i == top && count )
-            goto commit;
+        rc = rangeset_add_range(map, PFN_DOWN(entry.addr),
+                                PFN_DOWN(entry.addr + entry.size - 1));
+        if ( rc )
+            panic("IOMMU failed to add identity range: %d\n", rc);
     }
 
     /* Remove any areas in-use by Xen. */
@@ -614,7 +530,6 @@ void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
             panic("IOMMU unable to create read-only mappings: %d\n", rc);
     }
 
-    map_data.flush_flags |= flush_flags;
     /* Use if to avoid compiler warning */
     if ( iommu_iotlb_flush_all(d, map_data.flush_flags) )
         return;
-- 
2.43.0


