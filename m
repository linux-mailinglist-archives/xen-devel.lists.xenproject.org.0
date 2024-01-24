Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4121D83B042
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jan 2024 18:44:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671179.1044411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rShHt-00049T-Sn; Wed, 24 Jan 2024 17:43:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671179.1044411; Wed, 24 Jan 2024 17:43:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rShHt-00047n-Ox; Wed, 24 Jan 2024 17:43:45 +0000
Received: by outflank-mailman (input) for mailman id 671179;
 Wed, 24 Jan 2024 17:43:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V3ap=JC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rShHr-0003ef-Gl
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2024 17:43:43 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1ce3a92c-bae0-11ee-9b0f-b553b5be7939;
 Wed, 24 Jan 2024 18:43:41 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40eb0836f8dso31423565e9.2
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jan 2024 09:43:41 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 t3-20020a05600c450300b0040d5ae2906esm327184wmo.30.2024.01.24.09.43.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jan 2024 09:43:40 -0800 (PST)
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
X-Inumbo-ID: 1ce3a92c-bae0-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1706118221; x=1706723021; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zJJnNGbJJMDiPLfKGkoshyel4WrLYy7Bf15l7HNG1jU=;
        b=N5lqyTIycGwVSAIb3W7MA3JS3OWPKiHBtXd881KSATskCDEYraFWyctZnwvKew6mef
         Bv7A+uIrsIaCdjJp5qP5KL2Q7x9FmvwIhWUNcTtPtrDhe3PBY8OBrpVoN6ELH9JFEH4t
         RaZFaR5iXnwZZwLWLEaX91fZJEk8/dMUsaCrI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706118221; x=1706723021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zJJnNGbJJMDiPLfKGkoshyel4WrLYy7Bf15l7HNG1jU=;
        b=jQK8MjsbTlo1nwWm+cd/IXAItTeNTLim+HZHl4OrJs197j8MoSq+3fcWIM4v0HTVne
         RNZttSGw6XIwmKs1HGquycH5x0VJdxYRR0IT61H7JsLMyXMpCyu6LgfcvX9gD6nShwHr
         xqrkvVII+8+1V22Lskslrjsb7Hr/4IuWnsy/zSYTaD7flIT6F/Dzqm+B6tDxIzmzGACH
         LN3fKPs3KvhQUbwXMMsZ9PHJkpuZFzZ2c+5P536dElgzmIkTa6//fEcXw8zN7sTgSm4S
         pJOuP9L55a0leT1jTNS1PD00Ry4b7QOfJhxaIBJEEwWaB+aroEiDG7WMCVGw7nc2zA1i
         P8aw==
X-Gm-Message-State: AOJu0YyAbuMePNlk1lNEW4QWvMFHa66vJR2S6ATaJvb1wynXlNIpQJja
	3YufBKbrZ4Freu4lWbzJw2TlXNrrpC/TG3d006GeRahw+OrMLjnDaFAl7F5y+opD0dyNjNP6S6r
	F
X-Google-Smtp-Source: AGHT+IHw8o2+5Td5uIeu9JZ/ycI6dcz5hmMjUeBh/8s7ZUz6E1YbHcxF8gi6kT+opFj/AgCaiyaD2g==
X-Received: by 2002:a7b:cb96:0:b0:40e:7597:42bb with SMTP id m22-20020a7bcb96000000b0040e759742bbmr1312051wmi.181.1706118220923;
        Wed, 24 Jan 2024 09:43:40 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>,
	Community Manager <community.manager@xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Paul Durrant <paul@xen.org>
Subject: [PATCH v5 2/3] x86/iommu: switch hwdom IOMMU to use a rangeset
Date: Wed, 24 Jan 2024 18:29:52 +0100
Message-ID: <20240124172953.29814-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240124172953.29814-1-roger.pau@citrix.com>
References: <20240124172953.29814-1-roger.pau@citrix.com>
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
Changes since v4:
 - Add default case to handle ACPI and NVS regions (which are not mapped)
   unless in the low 4GB and when inclusive mode is set.
 - Add changelog entry.
 - Dropped Jans RB.

Changes since v3:
 - Remove unnecessary line wraps.

Changes since v2:
 - Simplify a bit the logic related to inclusive option, at the cost of making
   some no-op calls on some cases.

Changes since v1:
 - Split from bigger patch.
 - Remove unneeded default case.

x86/iommu: add CHANGELOG entry for hwdom setup time improvements

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
 CHANGELOG.md                        |   2 +
 xen/drivers/passthrough/x86/iommu.c | 149 ++++++----------------------
 2 files changed, 35 insertions(+), 116 deletions(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index 723d06425431..3e8b996e4718 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -9,6 +9,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
 ### Changed
  - Changed flexible array definitions in public I/O interface headers to not
    use "1" as the number of array elements.
+ - On x86:
+   - Reduce IOMMU setup time for hardware domain.
 
 ### Added
  - On x86:
diff --git a/xen/drivers/passthrough/x86/iommu.c b/xen/drivers/passthrough/x86/iommu.c
index fc5215a9dc40..c90755ff58fa 100644
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
-    unsigned int start_perms = 0;
+    unsigned int i;
     struct rangeset *map;
     struct map_data map_data = { .d = d };
     int rc;
@@ -487,58 +416,46 @@ void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
     if ( !map )
         panic("IOMMU init: unable to allocate rangeset\n");
 
-    max_pfn = (GB(4) >> PAGE_SHIFT) - 1;
-    top = max(max_pdx, pfn_to_pdx(max_pfn) + 1);
+    if ( iommu_hwdom_inclusive )
+    {
+        /* Add the whole range below 4GB, UNUSABLE regions will be removed. */
+        rc = rangeset_add_range(map, 0, PFN_DOWN(GB(4)) - 1);
+        if ( rc )
+            panic("IOMMU inclusive mappings can't be added: %d\n", rc);
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
+                panic("IOMMU failed to remove unusable memory: %d\n", rc);
+            continue;
 
-        commit:
-            while ( (rc = iommu_map(d, _dfn(start), _mfn(start), count,
-                                    start_perms | IOMMUF_preempt,
-                                    &map_data.flush_flags)) > 0 )
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
 
-        if ( i == top && count )
-            goto commit;
+        default:
+            continue;
+        }
+
+        rc = rangeset_add_range(map, PFN_DOWN(entry.addr),
+                                PFN_DOWN(entry.addr + entry.size - 1));
+        if ( rc )
+            panic("IOMMU failed to add identity range: %d\n", rc);
     }
 
     /* Remove any areas in-use by Xen. */
-- 
2.43.0


