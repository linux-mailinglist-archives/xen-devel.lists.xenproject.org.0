Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE024A3C56C
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2025 17:49:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.893245.1302181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tknFk-0000jP-3x; Wed, 19 Feb 2025 16:48:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 893245.1302181; Wed, 19 Feb 2025 16:48:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tknFj-0000hE-Vo; Wed, 19 Feb 2025 16:48:51 +0000
Received: by outflank-mailman (input) for mailman id 893245;
 Wed, 19 Feb 2025 16:48:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bQLC=VK=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tknFi-0000PL-A9
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2025 16:48:50 +0000
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [2a00:1450:4864:20::635])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 63a87d46-eee1-11ef-9896-31a8f345e629;
 Wed, 19 Feb 2025 17:48:48 +0100 (CET)
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-abadccdfe5aso7621566b.0
 for <xen-devel@lists.xenproject.org>; Wed, 19 Feb 2025 08:48:48 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-abb8915db0dsm779901866b.145.2025.02.19.08.48.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 08:48:46 -0800 (PST)
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
X-Inumbo-ID: 63a87d46-eee1-11ef-9896-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739983727; x=1740588527; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PIcVCHNr5p+mIW/1mO/10d/AjhTI/+c0zIyZX/AmKhs=;
        b=muVylDycbm1qm+6jsUTe98hG7X/1L26y4/Yr1X7r9cmHagb/xiEZy7fHXcU7xCh1Aw
         27hikg5hfI0ddXISbkdCVigPbdP33ONjZg4ggXDe9NBlN84B2iUZlDxi7QS8FM1AXuH3
         2agFw90Fe9ksxOAHN0/PhFtDkeqtF2nC/VgvI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739983727; x=1740588527;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PIcVCHNr5p+mIW/1mO/10d/AjhTI/+c0zIyZX/AmKhs=;
        b=XWLIdG0ScBkT4pksrPUsU/OlxTKNnNpPwEQiwl5EYtbYq/HzU0tVAEGiy2bfRBvlNr
         bjKLpv1kpRWM54QWZz7UTWakck3UtjnwDheEqb1jPJkzu3npTlFEvadkRdIMdZXaePo8
         QPCBOqm+kAemlnqWxf7ylIE7xMFssc9RLOUI/QbNPI00LNumltqDZb1UZzdQk2RMfY/C
         iEu//FRXoSxRPTmheUusEbA4Hf2hCyclTcJEkkJNJ5d8cmMCfCfrE5S2xOSzbJXoRlBs
         MDMnOu85JqHo04CN6YMHkdSz+yg+kBPfh7xpZZoj6h+bGTg4ZipsJRws1wO8bEJ2W6m4
         8NGA==
X-Gm-Message-State: AOJu0YyXO5UG4NbXXOUolas+Ji+bdMiT52qW07M3eIk6RoYM81XtaGPZ
	ci+12wt6K06a1iW+Ea2svsdwG67F9gS+YkBcVWESP2Ey3/ZhZ30icfLf+nWRsSB5Iu3xjZb8KS0
	Q
X-Gm-Gg: ASbGnctu4tq+mBTauApY6iKlKc4Q2W4MME6RNKASyxRPLYd3hVA2XvgIhXnParixKYY
	Prl+e7agNn2wiy4GbluoFFOpWpEObafQOQvvSIbJu7XkN+WsSkQgDeKh45kbCOPwrP+67bqsihH
	dYWo9jg5XARuJcsep3ytJYi6YgBA6PmhU6ixUDV0Uh+qSjhppxuU+nVpOT08ijzGKGnnl3Pfqbn
	4zU0Hk9Px0XsiSjvSp51T/8JHW6qeTUJVsKO17XBbUwNbx11dDZDox2J1fLXVWdtFzLOTK30mlu
	kVC/3FUiI6VhmmIJ/hVdVAS3bQ==
X-Google-Smtp-Source: AGHT+IF7eHC8KUW3sQ8ASr/fkhpo6/VTZ9Le7O5onB5o7zUnW5r+MHOz2TR+0XL1tryCPrH5ECKfRQ==
X-Received: by 2002:a17:906:4794:b0:ab7:7cf7:9f7a with SMTP id a640c23a62f3a-abb70db8437mr2011960566b.53.1739983727132;
        Wed, 19 Feb 2025 08:48:47 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v3 2/3] x86/iommu: account for IOMEM caps when populating dom0 IOMMU page-tables
Date: Wed, 19 Feb 2025 17:48:39 +0100
Message-ID: <20250219164840.94803-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250219164840.94803-1-roger.pau@citrix.com>
References: <20250219164840.94803-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The current code in arch_iommu_hwdom_init() kind of open-codes the same
MMIO permission ranges that are added to the hardware domain ->iomem_caps.
Avoid this duplication and use ->iomem_caps in arch_iommu_hwdom_init() to
filter which memory regions should be added to the dom0 IOMMU page-tables.

Note the IO-APIC and MCFG page(s) must be set as not accessible for a PVH
dom0, otherwise the internal Xen emulation for those ranges won't work.
This requires adjustments in dom0_setup_permissions().

The call to pvh_setup_mmcfg() in dom0_construct_pvh() must now strictly be
done ahead of setting up dom0 permissions, so take the opportunity to also
put it inside the existing is_hardware_domain() region.

Also the special casing of E820_UNUSABLE regions no longer needs to be done
in arch_iommu_hwdom_init(), as those regions are already blocked in
->iomem_caps and thus would be removed from the rangeset as part of
->iomem_caps processing in arch_iommu_hwdom_init().  The E820_UNUSABLE
regions below 1Mb are not removed from ->iomem_caps, that's a slight
difference for the IOMMU created page-tables, but the aim is to allow
access to the same memory either from the CPU or the IOMMU page-tables.

Since ->iomem_caps already takes into account the domain max paddr, there's
no need to remove any regions past the last address addressable by the
domain, as applying ->iomem_caps would have already taken care of that.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v2:
 - Expand commit message re E820_UNUSABLE.
 - Use vpci_mmcfg_deny_access().
 - Remove max() from map_subtract_iomemcap().
 - Use has_vioapic() instead of is_hvm_domain().

Changes since v1:
 - New in this version.
---
 xen/arch/x86/dom0_build.c           | 11 ++++-
 xen/arch/x86/hvm/dom0_build.c       | 14 +++---
 xen/arch/x86/hvm/io.c               |  6 +--
 xen/arch/x86/include/asm/hvm/io.h   |  4 +-
 xen/drivers/passthrough/x86/iommu.c | 67 ++++++++++++-----------------
 5 files changed, 49 insertions(+), 53 deletions(-)

diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
index aec596997d5d..a735e3650c28 100644
--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -558,7 +558,9 @@ int __init dom0_setup_permissions(struct domain *d)
     for ( i = 0; i < nr_ioapics; i++ )
     {
         mfn = paddr_to_pfn(mp_ioapics[i].mpc_apicaddr);
-        if ( !rangeset_contains_singleton(mmio_ro_ranges, mfn) )
+        /* If emulating IO-APIC(s) make sure the base address is unmapped. */
+        if ( has_vioapic(d) ||
+             !rangeset_contains_singleton(mmio_ro_ranges, mfn) )
             rc |= iomem_deny_access(d, mfn, mfn);
     }
     /* MSI range. */
@@ -599,6 +601,13 @@ int __init dom0_setup_permissions(struct domain *d)
             rc |= rangeset_add_singleton(mmio_ro_ranges, mfn);
     }
 
+    if ( has_vpci(d) )
+        /*
+         * TODO: runtime added MMCFG regions are not checked to make sure they
+         * don't overlap with already mapped regions, thus preventing trapping.
+         */
+        rc |= vpci_mmcfg_deny_access(d);
+
     return rc;
 }
 
diff --git a/xen/arch/x86/hvm/dom0_build.c b/xen/arch/x86/hvm/dom0_build.c
index ce5b5c31b318..6a4453103a9a 100644
--- a/xen/arch/x86/hvm/dom0_build.c
+++ b/xen/arch/x86/hvm/dom0_build.c
@@ -1323,6 +1323,13 @@ int __init dom0_construct_pvh(struct boot_info *bi, struct domain *d)
 
     if ( is_hardware_domain(d) )
     {
+        /*
+         * MMCFG initialization must be performed before setting domain
+         * permissions, as the MCFG areas must not be part of the domain IOMEM
+         * accessible regions.
+         */
+        pvh_setup_mmcfg(d);
+
         /*
          * Setup permissions early so that calls to add MMIO regions to the
          * p2m as part of vPCI setup don't fail due to permission checks.
@@ -1335,13 +1342,6 @@ int __init dom0_construct_pvh(struct boot_info *bi, struct domain *d)
         }
     }
 
-    /*
-     * NB: MMCFG initialization needs to be performed before iommu
-     * initialization so the iommu code can fetch the MMCFG regions used by the
-     * domain.
-     */
-    pvh_setup_mmcfg(d);
-
     /*
      * Craft dom0 physical memory map and set the paging allocation. This must
      * be done before the iommu initializion, since iommu initialization code
diff --git a/xen/arch/x86/hvm/io.c b/xen/arch/x86/hvm/io.c
index db726b38177b..de6ee6c4dd4d 100644
--- a/xen/arch/x86/hvm/io.c
+++ b/xen/arch/x86/hvm/io.c
@@ -363,14 +363,14 @@ static const struct hvm_mmcfg *vpci_mmcfg_find(const struct domain *d,
     return NULL;
 }
 
-int __hwdom_init vpci_subtract_mmcfg(const struct domain *d, struct rangeset *r)
+int __hwdom_init vpci_mmcfg_deny_access(struct domain *d)
 {
     const struct hvm_mmcfg *mmcfg;
 
     list_for_each_entry ( mmcfg, &d->arch.hvm.mmcfg_regions, next )
     {
-        int rc = rangeset_remove_range(r, PFN_DOWN(mmcfg->addr),
-                                       PFN_DOWN(mmcfg->addr + mmcfg->size - 1));
+        int rc = iomem_deny_access(d, PFN_DOWN(mmcfg->addr),
+                                   PFN_DOWN(mmcfg->addr + mmcfg->size - 1));
 
         if ( rc )
             return rc;
diff --git a/xen/arch/x86/include/asm/hvm/io.h b/xen/arch/x86/include/asm/hvm/io.h
index f2b8431facb0..565bad300d20 100644
--- a/xen/arch/x86/include/asm/hvm/io.h
+++ b/xen/arch/x86/include/asm/hvm/io.h
@@ -132,8 +132,8 @@ int register_vpci_mmcfg_handler(struct domain *d, paddr_t addr,
 /* Destroy tracked MMCFG areas. */
 void destroy_vpci_mmcfg(struct domain *d);
 
-/* Remove MMCFG regions from a given rangeset. */
-int vpci_subtract_mmcfg(const struct domain *d, struct rangeset *r);
+/* Remove MMCFG regions from a domain ->iomem_caps. */
+int vpci_mmcfg_deny_access(struct domain *d);
 
 #endif /* __ASM_X86_HVM_IO_H__ */
 
diff --git a/xen/drivers/passthrough/x86/iommu.c b/xen/drivers/passthrough/x86/iommu.c
index 8b1e0596b84a..67f025c1ec6a 100644
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -320,6 +320,26 @@ static int __hwdom_init cf_check map_subtract(unsigned long s, unsigned long e,
     return rangeset_remove_range(map, s, e);
 }
 
+struct handle_iomemcap {
+    struct rangeset *r;
+    unsigned long last;
+};
+static int __hwdom_init cf_check map_subtract_iomemcap(unsigned long s,
+                                                       unsigned long e,
+                                                       void *data)
+{
+    struct handle_iomemcap *h = data;
+    int rc = 0;
+
+    if ( h->last != s )
+        rc = rangeset_remove_range(h->r, h->last, s - 1);
+
+    ASSERT(e < ~0UL);
+    h->last = e + 1;
+
+    return rc;
+}
+
 struct map_data {
     struct domain *d;
     unsigned int flush_flags;
@@ -400,6 +420,7 @@ void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
     unsigned int i;
     struct rangeset *map;
     struct map_data map_data = { .d = d };
+    struct handle_iomemcap iomem = {};
     int rc;
 
     BUG_ON(!is_hardware_domain(d));
@@ -442,14 +463,6 @@ void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
 
         switch ( entry.type )
         {
-        case E820_UNUSABLE:
-            /* Only relevant for inclusive mode, otherwise this is a no-op. */
-            rc = rangeset_remove_range(map, PFN_DOWN(entry.addr),
-                                       PFN_DOWN(entry.addr + entry.size - 1));
-            if ( rc )
-                panic("IOMMU failed to remove unusable memory: %d\n", rc);
-            continue;
-
         case E820_RESERVED:
             if ( !iommu_hwdom_inclusive && !iommu_hwdom_reserved )
                 continue;
@@ -475,22 +488,13 @@ void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
     if ( rc )
         panic("IOMMU failed to remove Xen ranges: %d\n", rc);
 
-    /* Remove any overlap with the Interrupt Address Range. */
-    rc = rangeset_remove_range(map, 0xfee00, 0xfeeff);
+    iomem.r = map;
+    rc = rangeset_report_ranges(d->iomem_caps, 0, ~0UL, map_subtract_iomemcap,
+                                &iomem);
+    if ( !rc && iomem.last < ~0UL )
+        rc = rangeset_remove_range(map, iomem.last, ~0UL);
     if ( rc )
-        panic("IOMMU failed to remove Interrupt Address Range: %d\n", rc);
-
-    /* If emulating IO-APIC(s) make sure the base address is unmapped. */
-    if ( has_vioapic(d) )
-    {
-        for ( i = 0; i < d->arch.hvm.nr_vioapics; i++ )
-        {
-            rc = rangeset_remove_singleton(map,
-                PFN_DOWN(domain_vioapic(d, i)->base_address));
-            if ( rc )
-                panic("IOMMU failed to remove IO-APIC: %d\n", rc);
-        }
-    }
+        panic("IOMMU failed to remove forbidden regions: %d\n", rc);
 
     if ( is_pv_domain(d) )
     {
@@ -506,23 +510,6 @@ void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
             panic("IOMMU failed to remove read-only regions: %d\n", rc);
     }
 
-    if ( has_vpci(d) )
-    {
-        /*
-         * TODO: runtime added MMCFG regions are not checked to make sure they
-         * don't overlap with already mapped regions, thus preventing trapping.
-         */
-        rc = vpci_subtract_mmcfg(d, map);
-        if ( rc )
-            panic("IOMMU unable to remove MMCFG areas: %d\n", rc);
-    }
-
-    /* Remove any regions past the last address addressable by the domain. */
-    rc = rangeset_remove_range(map, PFN_DOWN(1UL << domain_max_paddr_bits(d)),
-                               ~0UL);
-    if ( rc )
-        panic("IOMMU unable to remove unaddressable ranges: %d\n", rc);
-
     if ( iommu_verbose )
         printk(XENLOG_INFO "%pd: identity mappings for IOMMU:\n", d);
 
-- 
2.46.0


