Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 677BF7EEF32
	for <lists+xen-devel@lfdr.de>; Fri, 17 Nov 2023 10:48:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.634965.990638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3vSV-0008Uc-UF; Fri, 17 Nov 2023 09:48:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 634965.990638; Fri, 17 Nov 2023 09:48:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r3vSV-0008Sb-P5; Fri, 17 Nov 2023 09:48:19 +0000
Received: by outflank-mailman (input) for mailman id 634965;
 Fri, 17 Nov 2023 09:48:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1e97=G6=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1r3vST-0007p0-KV
 for xen-devel@lists.xenproject.org; Fri, 17 Nov 2023 09:48:17 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6ea78262-852e-11ee-98dc-6d05b1d4d9a1;
 Fri, 17 Nov 2023 10:48:16 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-407c3adef8eso15443045e9.2
 for <xen-devel@lists.xenproject.org>; Fri, 17 Nov 2023 01:48:16 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 n27-20020a05600c3b9b00b00405959469afsm2140251wms.3.2023.11.17.01.48.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Nov 2023 01:48:14 -0800 (PST)
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
X-Inumbo-ID: 6ea78262-852e-11ee-98dc-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1700214495; x=1700819295; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G0uzIW7esXwONO7eMjXy6VgiWyzem2oujkU/WJcseRA=;
        b=aZAV/MgHtF7xWDL2lR2btRjyhKv2KsF4JBFeGu0QE9VohRRkA9N8lnR9048SiJ3R6V
         Wl+0DqvjOLZAZrSWhI9d4/gDKLs+BEqR/lL85m75TfFjiNA24HRIVtFIbrYKLRWNX5EL
         FIkmyloQ4719j8qd8UMcO9+WXz08p0MsrpNtA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700214495; x=1700819295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G0uzIW7esXwONO7eMjXy6VgiWyzem2oujkU/WJcseRA=;
        b=pF6UO0RlIhkhUkCgMrofZ0Y/iLbSvTscjXtDpcczs79CkYizI4IcETC+Iv1cB5A1wB
         A694padRA6t1LEtLAwfP+B/rZ86Elrf5px/lHyWOUnL0sv1HG3uXDMEYYqj+Aqc9TIXU
         TWViYY1XGuxnwB4w9gz+HYlQlk8fJ96JWpG8iWe0FLBc4TpFOdHvdIcumYdKb/Xwrm3s
         NA43Ps65ob+lkif48CArtDiqb+G53Aphb6i4JhwpKBKN759x5OGhnDzv+uDJZADcnpaq
         a8lhWHAG+Wqs1emHUWbMRMvQ8FV9s2KuCScB5It/taVp9Yqwu5YPGTfrqgWTghRJx/1W
         Q4fQ==
X-Gm-Message-State: AOJu0Yyo50WdMOc08AGlsdctZe8XrF2TKU1vY0XLN0vg+Pt8lBbZETFV
	vlbnV088H9NKfwc+SSSYrmQWAsOkH4dFkgB823s=
X-Google-Smtp-Source: AGHT+IGmR6cKgc8EYPAsakfgX5DVJKAwzRszpfSTMBYURWhaclALSaZzr17mYsFCANRIgUFfWHL4yQ==
X-Received: by 2002:a05:600c:4f13:b0:409:6e0e:e948 with SMTP id l19-20020a05600c4f1300b004096e0ee948mr14594620wmq.1.1700214495307;
        Fri, 17 Nov 2023 01:48:15 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 3/3] x86/iommu: use a rangeset for hwdom setup
Date: Fri, 17 Nov 2023 10:47:49 +0100
Message-ID: <20231117094749.81091-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231117094749.81091-1-roger.pau@citrix.com>
References: <20231117094749.81091-1-roger.pau@citrix.com>
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
 xen/arch/x86/hvm/io.c               |  15 +-
 xen/arch/x86/include/asm/hvm/io.h   |   4 +-
 xen/drivers/passthrough/x86/iommu.c | 355 +++++++++++++++++-----------
 3 files changed, 231 insertions(+), 143 deletions(-)

diff --git a/xen/arch/x86/hvm/io.c b/xen/arch/x86/hvm/io.c
index d75af83ad01f..7c4b7317b13a 100644
--- a/xen/arch/x86/hvm/io.c
+++ b/xen/arch/x86/hvm/io.c
@@ -364,9 +364,20 @@ static const struct hvm_mmcfg *vpci_mmcfg_find(const struct domain *d,
     return NULL;
 }
 
-bool vpci_is_mmcfg_address(const struct domain *d, paddr_t addr)
+int vpci_subtract_mmcfg(const struct domain *d, struct rangeset *r)
 {
-    return vpci_mmcfg_find(d, addr);
+    const struct hvm_mmcfg *mmcfg;
+
+    list_for_each_entry ( mmcfg, &d->arch.hvm.mmcfg_regions, next )
+    {
+        int rc = rangeset_remove_range(r, PFN_DOWN(mmcfg->addr),
+                                       PFN_DOWN(mmcfg->addr + mmcfg->size - 1));
+
+        if ( rc )
+            return rc;
+    }
+
+    return 0;
 }
 
 static unsigned int vpci_mmcfg_decode_addr(const struct hvm_mmcfg *mmcfg,
diff --git a/xen/arch/x86/include/asm/hvm/io.h b/xen/arch/x86/include/asm/hvm/io.h
index e5225e75ef26..c9d058fd5695 100644
--- a/xen/arch/x86/include/asm/hvm/io.h
+++ b/xen/arch/x86/include/asm/hvm/io.h
@@ -153,8 +153,8 @@ int register_vpci_mmcfg_handler(struct domain *d, paddr_t addr,
 /* Destroy tracked MMCFG areas. */
 void destroy_vpci_mmcfg(struct domain *d);
 
-/* Check if an address is between a MMCFG region for a domain. */
-bool vpci_is_mmcfg_address(const struct domain *d, paddr_t addr);
+/* Remove MMCFG regions from a given rangeset. */
+int vpci_subtract_mmcfg(const struct domain *d, struct rangeset *r);
 
 #endif /* __ASM_X86_HVM_IO_H__ */
 
diff --git a/xen/drivers/passthrough/x86/iommu.c b/xen/drivers/passthrough/x86/iommu.c
index d70cee9fea77..be2c909f61d8 100644
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -301,129 +301,133 @@ void iommu_identity_map_teardown(struct domain *d)
     }
 }
 
-static int __hwdom_init xen_in_range(unsigned long mfn)
+static int __hwdom_init remove_xen_ranges(struct rangeset *r)
 {
     paddr_t start, end;
-    int i;
-
-    enum { region_s3, region_ro, region_rw, region_bss, nr_regions };
-    static struct {
-        paddr_t s, e;
-    } xen_regions[nr_regions] __hwdom_initdata;
+    int rc;
 
-    /* initialize first time */
-    if ( !xen_regions[0].s )
-    {
-        /* S3 resume code (and other real mode trampoline code) */
-        xen_regions[region_s3].s = bootsym_phys(trampoline_start);
-        xen_regions[region_s3].e = bootsym_phys(trampoline_end);
+    /* S3 resume code (and other real mode trampoline code) */
+    rc = rangeset_remove_range(r, PFN_DOWN(bootsym_phys(trampoline_start)),
+                               PFN_DOWN(bootsym_phys(trampoline_end)));
+    if ( rc )
+        return rc;
 
-        /*
-         * This needs to remain in sync with the uses of the same symbols in
-         * - __start_xen()
-         * - is_xen_fixed_mfn()
-         * - tboot_shutdown()
-         */
+    /*
+     * This needs to remain in sync with the uses of the same symbols in
+     * - __start_xen()
+     * - is_xen_fixed_mfn()
+     * - tboot_shutdown()
+     */
+    /* hypervisor .text + .rodata */
+    rc = rangeset_remove_range(r, PFN_DOWN(__pa(&_stext)),
+                               PFN_DOWN(__pa(&__2M_rodata_end)));
+    if ( rc )
+        return rc;
 
-        /* hypervisor .text + .rodata */
-        xen_regions[region_ro].s = __pa(&_stext);
-        xen_regions[region_ro].e = __pa(&__2M_rodata_end);
-        /* hypervisor .data + .bss */
-        xen_regions[region_rw].s = __pa(&__2M_rwdata_start);
-        xen_regions[region_rw].e = __pa(&__2M_rwdata_end);
-        if ( efi_boot_mem_unused(&start, &end) )
-        {
-            ASSERT(__pa(start) >= xen_regions[region_rw].s);
-            ASSERT(__pa(end) <= xen_regions[region_rw].e);
-            xen_regions[region_rw].e = __pa(start);
-            xen_regions[region_bss].s = __pa(end);
-            xen_regions[region_bss].e = __pa(&__2M_rwdata_end);
-        }
+    /* hypervisor .data + .bss */
+    if ( efi_boot_mem_unused(&start, &end) )
+    {
+        ASSERT(__pa(start) >= __pa(&__2M_rwdata_start));
+        rc = rangeset_remove_range(r, PFN_DOWN(__pa(&__2M_rwdata_start)),
+                                   PFN_DOWN(__pa(start)));
+        if ( rc )
+            return rc;
+        ASSERT(__pa(end) <= __pa(&__2M_rwdata_end));
+        rc = rangeset_remove_range(r, PFN_DOWN(__pa(end)),
+                                   PFN_DOWN(__pa(&__2M_rwdata_end)));
+        if ( rc )
+            return rc;
+    }
+    else
+    {
+        rc = rangeset_remove_range(r, PFN_DOWN(__pa(&__2M_rwdata_start)),
+                                   PFN_DOWN(__pa(&__2M_rwdata_end)));
+        if ( rc )
+            return rc;
     }
-
-    start = (paddr_t)mfn << PAGE_SHIFT;
-    end = start + PAGE_SIZE;
-    for ( i = 0; i < nr_regions; i++ )
-        if ( (start < xen_regions[i].e) && (end > xen_regions[i].s) )
-            return 1;
 
     return 0;
 }
 
-static unsigned int __hwdom_init hwdom_iommu_map(const struct domain *d,
-                                                 unsigned long pfn,
-                                                 unsigned long max_pfn)
+static int __hwdom_init map_subtract(unsigned long s, unsigned long e,
+                                     void *data)
 {
-    mfn_t mfn = _mfn(pfn);
-    unsigned int i, type, perms = IOMMUF_readable | IOMMUF_writable;
+    struct rangeset *map = data;
 
-    /*
-     * Set up 1:1 mapping for dom0. Default to include only conventional RAM
-     * areas and let RMRRs include needed reserved regions. When set, the
-     * inclusive mapping additionally maps in every pfn up to 4GB except those
-     * that fall in unusable ranges for PV Dom0.
-     */
-    if ( (pfn > max_pfn && !mfn_valid(mfn)) || xen_in_range(pfn) )
-        return 0;
+    return rangeset_remove_range(map, s, e);
+}
 
-    switch ( type = page_get_ram_type(mfn) )
-    {
-    case RAM_TYPE_UNUSABLE:
-        return 0;
+struct map_data {
+    struct domain *d;
+    unsigned int flush_flags;
+    bool ro;
+};
 
-    case RAM_TYPE_CONVENTIONAL:
-        if ( iommu_hwdom_strict )
-            return 0;
-        break;
+static int __hwdom_init identity_map(unsigned long s, unsigned long e,
+                                     void *data)
+{
+    struct map_data *info = data;
+    struct domain *d = info->d;
+    long rc;
 
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
+    if ( iommu_verbose )
+        printk(XENLOG_INFO " [%010lx, %010lx] R%c\n",
+               s, e, info->ro ? 'O' : 'W');
 
-    /* Check that it doesn't overlap with the Interrupt Address Range. */
-    if ( pfn >= 0xfee00 && pfn <= 0xfeeff )
-        return 0;
-    /* ... or the IO-APIC */
-    if ( has_vioapic(d) )
+    if ( paging_mode_translate(d) )
     {
-        for ( i = 0; i < d->arch.hvm.nr_vioapics; i++ )
-            if ( pfn == PFN_DOWN(domain_vioapic(d, i)->base_address) )
-                return 0;
+        if ( info->ro )
+        {
+            ASSERT_UNREACHABLE();
+            return 0;
+        }
+        while ( (rc = map_mmio_regions(d, _gfn(s), e - s + 1, _mfn(s))) > 0 )
+        {
+            s += rc;
+            process_pending_softirqs();
+        }
     }
-    else if ( is_pv_domain(d) )
+    else
     {
-        /*
-         * Be consistent with CPU mappings: Dom0 is permitted to establish r/o
-         * ones there (also for e.g. HPET in certain cases), so it should also
-         * have such established for IOMMUs.
-         */
-        if ( iomem_access_permitted(d, pfn, pfn) &&
-             rangeset_contains_singleton(mmio_ro_ranges, pfn) )
-            perms = IOMMUF_readable;
+        const unsigned int perms = IOMMUF_readable | IOMMUF_preempt |
+                                   (info->ro ? 0 : IOMMUF_writable);
+
+        if ( info->ro && !iomem_access_permitted(d, s, e) )
+        {
+            /*
+             * Should be more fine grained in order to not map the forbidden
+             * frame instead of rejecting the region as a whole, but it's only
+             * for read-only MMIO regions, which are very limited.
+             */
+            printk(XENLOG_DEBUG
+                   "IOMMU read-only mapping of region [%lx, %lx] forbidden\n",
+                   s, e);
+            return 0;
+        }
+        while ( (rc = iommu_map(d, _dfn(s), _mfn(s), e - s + 1,
+                                perms, &info->flush_flags)) > 0 )
+        {
+            s += rc;
+            process_pending_softirqs();
+        }
     }
-    /*
-     * ... or the PCIe MCFG regions.
-     * TODO: runtime added MMCFG regions are not checked to make sure they
-     * don't overlap with already mapped regions, thus preventing trapping.
-     */
-    if ( has_vpci(d) && vpci_is_mmcfg_address(d, pfn_to_paddr(pfn)) )
-        return 0;
+    ASSERT(rc <= 0);
+    if ( rc )
+        printk(XENLOG_WARNING
+               "IOMMU identity mapping of [%lx, %lx] failed: %ld\n",
+               s, e, rc);
 
-    return perms;
+    /* Ignore errors and attempt to map the remaining regions. */
+    return 0;
 }
 
 void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
 {
-    unsigned long i, top, max_pfn, start, count;
-    unsigned int flush_flags = 0, start_perms = 0;
+    const unsigned long max_pfn = PFN_DOWN(GB(4)) - 1;
+    unsigned int i;
+    struct rangeset *map;
+    struct map_data map_data = { .d = d };
+    int rc;
 
     BUG_ON(!is_hardware_domain(d));
 
@@ -447,62 +451,135 @@ void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
     if ( iommu_hwdom_passthrough )
         return;
 
-    max_pfn = (GB(4) >> PAGE_SHIFT) - 1;
-    top = max(max_pdx, pfn_to_pdx(max_pfn) + 1);
+    map = rangeset_new(NULL, NULL, 0);
+    if ( !map )
+        panic("IOMMU initialization failed unable to allocate rangeset\n");
+
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
+                panic("IOMMU failed to remove unusable memory: %d\n",
+                      rc);
+            continue;
+
+        case E820_RESERVED:
+            if ( !iommu_hwdom_inclusive && !iommu_hwdom_reserved )
+                continue;
+            break;
+
+        case E820_RAM:
+            if ( iommu_hwdom_strict )
+                continue;
+            break;
+
+        default:
+            if ( !iommu_hwdom_inclusive || PFN_DOWN(entry.addr) >= max_pfn )
+                continue;
+            entry.size = pfn_to_paddr(max_pfn) - 1 - entry.addr;
+            break;
         }
-        else if ( pfn != start + count || perms != start_perms )
-        {
-            long rc;
 
-        commit:
-            while ( (rc = iommu_map(d, _dfn(start), _mfn(start), count,
-                                    start_perms | IOMMUF_preempt,
-                                    &flush_flags)) > 0 )
-            {
-                start += rc;
-                count -= rc;
-                process_pending_softirqs();
-            }
+        if ( iommu_hwdom_inclusive &&
+             PFN_DOWN(entry.addr + entry.size - 1) <= max_pfn )
+            /*
+             * Any range below 4GB is already in the rangeset if using inclusive
+             * mode.
+             */
+            continue;
+
+        rc = rangeset_add_range(map, PFN_DOWN(entry.addr),
+                                PFN_DOWN(entry.addr + entry.size - 1));
+        if ( rc )
+            panic("IOMMU failed to add identity range: %d\n", rc);
+    }
+
+    /* Remove any areas in-use by Xen. */
+    rc = remove_xen_ranges(map);
+    if ( rc )
+        panic("IOMMU failed to remove Xen ranges: %d\n", rc);
+
+    /* Remove any overlap with the Interrupt Address Range. */
+    rc = rangeset_remove_range(map, 0xfee00, 0xfeeff);
+    if ( rc )
+        panic("IOMMU failed to remove Interrupt Address Range: %d\n",
+              rc);
+
+    /* If emulating IO-APIC(s) make sure the base address is unmapped. */
+    if ( has_vioapic(d) )
+    {
+        for ( i = 0; i < d->arch.hvm.nr_vioapics; i++ )
+        {
+            rc = rangeset_remove_singleton(map,
+                PFN_DOWN(domain_vioapic(d, i)->base_address));
             if ( rc )
-                printk(XENLOG_WARNING
-                       "%pd: IOMMU identity mapping of [%lx,%lx) failed: %ld\n",
-                       d, start, start + count, rc);
-            start = pfn;
-            count = 1;
-            start_perms = perms;
+                panic("IOMMU failed to remove IO-APIC: %d\n",
+                      rc);
         }
-        else
-            ++count;
+    }
 
-        if ( !(++i & 0xfffff) )
-            process_pending_softirqs();
+    if ( is_pv_domain(d) )
+    {
+        /*
+         * Be consistent with CPU mappings: Dom0 is permitted to establish r/o
+         * ones there (also for e.g. HPET in certain cases), so it should also
+         * have such established for IOMMUs.
+         */
+        rc = rangeset_report_ranges(mmio_ro_ranges, 0, ~0UL, map_subtract, map);
+        if ( rc )
+            panic("IOMMU failed to remove read-only regions: %d\n",
+                  rc);
+    }
+
+    if ( has_vpci(d) )
+    {
+        /*
+         * TODO: runtime added MMCFG regions are not checked to make sure they
+         * don't overlap with already mapped regions, thus preventing trapping.
+         */
+        rc = vpci_subtract_mmcfg(d, map);
+        if ( rc )
+            panic("IOMMU unable to remove MMCFG areas: %d\n", rc);
+    }
 
-        if ( i == top && count )
-            goto commit;
+    if ( iommu_verbose )
+        printk(XENLOG_INFO "d%u: identity mappings for IOMMU:\n",
+               d->domain_id);
+
+    rc = rangeset_report_ranges(map, 0, ~0UL, identity_map, &map_data);
+    if ( rc )
+        panic("IOMMU unable to create mappings: %d\n", rc);
+    if ( is_pv_domain(d) )
+    {
+        map_data.ro = true;
+        rc = rangeset_report_ranges(mmio_ro_ranges, 0, ~0UL, identity_map,
+                                    &map_data);
+        if ( rc )
+            panic("IOMMU unable to create read-only mappings: %d\n", rc);
     }
 
+    rangeset_destroy(map);
+
     /* Use if to avoid compiler warning */
-    if ( iommu_iotlb_flush_all(d, flush_flags) )
+    if ( iommu_iotlb_flush_all(d, map_data.flush_flags) )
         return;
 }
 
-- 
2.42.0


