Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33664A385C2
	for <lists+xen-devel@lfdr.de>; Mon, 17 Feb 2025 15:17:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.890511.1299674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk1vM-0008HM-QQ; Mon, 17 Feb 2025 14:16:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 890511.1299674; Mon, 17 Feb 2025 14:16:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tk1vM-0008EN-Nb; Mon, 17 Feb 2025 14:16:40 +0000
Received: by outflank-mailman (input) for mailman id 890511;
 Mon, 17 Feb 2025 14:16:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=glRE=VI=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tk1vL-0007zu-K7
 for xen-devel@lists.xenproject.org; Mon, 17 Feb 2025 14:16:39 +0000
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [2607:f8b0:4864:20::102a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cce0917c-ed39-11ef-9aa6-95dc52dad729;
 Mon, 17 Feb 2025 15:16:38 +0100 (CET)
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-2fc6272259cso1695526a91.0
 for <xen-devel@lists.xenproject.org>; Mon, 17 Feb 2025 06:16:38 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2fc13ba61f1sm8064686a91.42.2025.02.17.06.16.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 06:16:35 -0800 (PST)
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
X-Inumbo-ID: cce0917c-ed39-11ef-9aa6-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1739801797; x=1740406597; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NgVZpL1IIHgOFeFyiAgEthF53qJAdwqkkBm0ueYgozU=;
        b=o3bmyjzCTUH8AifsInqmifZ07fenJHjlqj896+68dVUziTB+QKv7LVnXluh5EBOWiw
         kj5s9V92XREKR/9vXFzvd8tPOWmmlGmAgAGWw6hmEUbP3MdTMotQoDaLp2Rh8xVt2qKU
         wFj+NlMvmUd0/DBsytGrPy7CeFRxL7fKrXhvM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739801797; x=1740406597;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NgVZpL1IIHgOFeFyiAgEthF53qJAdwqkkBm0ueYgozU=;
        b=NzW2IpK264vwnbsIBEX+TarMvEyHqxKJS2ctAMzWwyK61e7yjJ234XeEP56PJdi8PN
         HpK73hyxmyzuUvWlrDz2dtINjXg4i2hFLgQiTqZEwjp9FzMFhfF03Ln8IBWalM6LrW5A
         LfY/QvLHFgjRhm73/x6/O8rh0+rREev5BUZ75dJdivcnMjNtbUDqtn3tj5Qg63QHdxO4
         iKD922k5/dMSaK5zfZy1xeeP6Ax/EsxY0fhs8Lgycu0c7wICmQwKkoWMt3g9D174cSON
         7grngySA7Q7V/jQEVTmQMCOVRDjpLPp/Fmv74xG82A0nC7JxmnMeQd7MJskdIwQZRvoy
         I6Iw==
X-Gm-Message-State: AOJu0Yy5/+Lmqp0x9DC1S9iGFiDwVH/zRWbTn31SLgOtIbVRUFPw5k94
	Aulecv4OK2+LX6d952HkQjsaz2McoDllu+c/yMb/WrqsIH2+7dWvZL3Ct6OFMPf9O0RfCzHI1vJ
	V
X-Gm-Gg: ASbGncsYRoDnm22RUvsy/v+ONyFi+YHzafFazED1tx0rdy9ouJlcbcRFf3KB3kepdym
	WUyJ9pwOGwOa0SvbaRHD9RZHeoa7y2atYc0szW4lQ+EglJyvwkw8S8MtMi5RZb3CfGOkIomPhnF
	+x6uUq9SVZogKDJMIeEJTA7q+NYh+oYlviy/9lL0K59/E847/wwSItjGyuxcTN55QtGzDIuEYG+
	mEgHtIm6gWm/jMzg2tlLHQ/8wwd8vJpimK02sNlErIahMl6pfCWhTWIobJxobeBcDXN1WZfvF7/
	UOQ7o/pb3YOiwtGe61mr
X-Google-Smtp-Source: AGHT+IE7Me8pB7QyV9z6f2oAJ7+JBE9OOhiEsaYtTLuBx81vps9U3VFoDRJCGvAOnK7vqW3oLI3gbg==
X-Received: by 2002:a17:90b:2d8d:b0:2f7:4cce:ae37 with SMTP id 98e67ed59e1d1-2fc40f22cd2mr18280582a91.18.1739801796215;
        Mon, 17 Feb 2025 06:16:36 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 1/2] x86/iommu: account for IOMEM caps when populating dom0 IOMMU page-tables
Date: Mon, 17 Feb 2025 15:16:01 +0100
Message-ID: <20250217141602.64014-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250217141602.64014-1-roger.pau@citrix.com>
References: <20250217141602.64014-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The current code in arch_iommu_hwdom_init() kind of open-codes the same
MMIO permission ranges that are added to the hardware domain ->iomem_caps.
Avoid this duplication and use ->iomem_caps in arch_iommu_hwdom_init() to
filter which memory regions should be added to the dom0 IOMMU page-tables.

This should result in no change in the memory regions that end up identity
mapped in the domain IOMMU page tables.

Note the IO-APIC and MCFG page(s) must be set as not accessible for a PVH
dom0, otherwise the internal Xen emulation for those ranges won't work.
This requires an adjustment in dom0_setup_permissions().

Also the special casing of E820_UNUSABLE regions no longer needs to be done
in arch_iommu_hwdom_init(), as those regions are already blocked in
->iomem_caps and thus would be removed from the rangeset as part of
->iomem_caps processing in arch_iommu_hwdom_init().

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - New in this version.
---
 xen/arch/x86/dom0_build.c           | 19 ++++++++-
 xen/arch/x86/hvm/io.c               | 16 --------
 xen/arch/x86/include/asm/hvm/io.h   |  3 --
 xen/drivers/passthrough/x86/iommu.c | 61 +++++++++++++----------------
 4 files changed, 45 insertions(+), 54 deletions(-)

diff --git a/xen/arch/x86/dom0_build.c b/xen/arch/x86/dom0_build.c
index e8f5bf5447bc..22da9ba5a362 100644
--- a/xen/arch/x86/dom0_build.c
+++ b/xen/arch/x86/dom0_build.c
@@ -552,7 +552,8 @@ int __init dom0_setup_permissions(struct domain *d)
     for ( i = 0; i < nr_ioapics; i++ )
     {
         mfn = paddr_to_pfn(mp_ioapics[i].mpc_apicaddr);
-        if ( !rangeset_contains_singleton(mmio_ro_ranges, mfn) )
+        if ( is_hvm_domain(d) ||
+             !rangeset_contains_singleton(mmio_ro_ranges, mfn) )
             rc |= iomem_deny_access(d, mfn, mfn);
     }
     /* MSI range. */
@@ -593,6 +594,22 @@ int __init dom0_setup_permissions(struct domain *d)
             rc |= rangeset_add_singleton(mmio_ro_ranges, mfn);
     }
 
+    /* For PVH dom0 prevent access to MCFG, it's emulated by Xen. */
+    if ( is_hvm_domain(d) )
+    {
+        for ( i = 0; i < pci_mmcfg_config_num; i++ )
+        {
+            const unsigned long s =
+                PFN_DOWN(pci_mmcfg_config[i].address) +
+                PCI_BDF(pci_mmcfg_config[i].start_bus_number, 0, 0);
+            const unsigned long e =
+                PFN_DOWN(pci_mmcfg_config[i].address) +
+                PCI_BDF(pci_mmcfg_config[i].end_bus_number, ~0, ~0);
+
+            rc |= iomem_deny_access(d, s, e);
+        }
+    }
+
     return rc;
 }
 
diff --git a/xen/arch/x86/hvm/io.c b/xen/arch/x86/hvm/io.c
index db726b38177b..174c3285a636 100644
--- a/xen/arch/x86/hvm/io.c
+++ b/xen/arch/x86/hvm/io.c
@@ -363,22 +363,6 @@ static const struct hvm_mmcfg *vpci_mmcfg_find(const struct domain *d,
     return NULL;
 }
 
-int __hwdom_init vpci_subtract_mmcfg(const struct domain *d, struct rangeset *r)
-{
-    const struct hvm_mmcfg *mmcfg;
-
-    list_for_each_entry ( mmcfg, &d->arch.hvm.mmcfg_regions, next )
-    {
-        int rc = rangeset_remove_range(r, PFN_DOWN(mmcfg->addr),
-                                       PFN_DOWN(mmcfg->addr + mmcfg->size - 1));
-
-        if ( rc )
-            return rc;
-    }
-
-    return 0;
-}
-
 static unsigned int vpci_mmcfg_decode_addr(const struct hvm_mmcfg *mmcfg,
                                            paddr_t addr, pci_sbdf_t *sbdf)
 {
diff --git a/xen/arch/x86/include/asm/hvm/io.h b/xen/arch/x86/include/asm/hvm/io.h
index f2b8431facb0..0881e9e9f72d 100644
--- a/xen/arch/x86/include/asm/hvm/io.h
+++ b/xen/arch/x86/include/asm/hvm/io.h
@@ -132,9 +132,6 @@ int register_vpci_mmcfg_handler(struct domain *d, paddr_t addr,
 /* Destroy tracked MMCFG areas. */
 void destroy_vpci_mmcfg(struct domain *d);
 
-/* Remove MMCFG regions from a given rangeset. */
-int vpci_subtract_mmcfg(const struct domain *d, struct rangeset *r);
-
 #endif /* __ASM_X86_HVM_IO_H__ */
 
 
diff --git a/xen/drivers/passthrough/x86/iommu.c b/xen/drivers/passthrough/x86/iommu.c
index 8b1e0596b84a..3b386eb19d13 100644
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
+    /* Be careful with overflows. */
+    h->last = max(e + 1, e);
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
@@ -506,17 +510,6 @@ void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
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
     /* Remove any regions past the last address addressable by the domain. */
     rc = rangeset_remove_range(map, PFN_DOWN(1UL << domain_max_paddr_bits(d)),
                                ~0UL);
-- 
2.46.0


