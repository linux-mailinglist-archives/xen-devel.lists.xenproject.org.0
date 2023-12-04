Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 66867802EFC
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 10:43:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.646678.1009215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA5Tw-000419-Tr; Mon, 04 Dec 2023 09:43:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 646678.1009215; Mon, 04 Dec 2023 09:43:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rA5Tw-0003yV-PB; Mon, 04 Dec 2023 09:43:16 +0000
Received: by outflank-mailman (input) for mailman id 646678;
 Mon, 04 Dec 2023 09:43:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uft2=HP=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rA5Tu-0003Ag-NN
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 09:43:14 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8b3da560-9289-11ee-98e5-6d05b1d4d9a1;
 Mon, 04 Dec 2023 10:43:14 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-40bda47c489so21569455e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 04 Dec 2023 01:43:14 -0800 (PST)
Received: from localhost ([213.195.113.99]) by smtp.gmail.com with ESMTPSA id
 fb13-20020a05600c520d00b0040b3e7569fcsm17876713wmb.11.2023.12.04.01.43.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Dec 2023 01:43:12 -0800 (PST)
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
X-Inumbo-ID: 8b3da560-9289-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1701682993; x=1702287793; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9CBBn/nfJfW5I5gQfew3uGEClXixqREpb7mxes5nWVE=;
        b=io+DVSp4WpQd8qFDFNJq6dqRHw+1NqSHgdCK3EN9mytl4JnlNEldcK9r1O0VqzrRo2
         uf8MCqJ8a8yKPRxPszbrO+tZjpu3elX4ChC9MWcGesaecnlDn+YbC4uIjuGNz7ENuJp5
         dgTuKkX1Pa1mwLez9ExxJ3AdzOyi7rQ0Vpt0E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701682993; x=1702287793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9CBBn/nfJfW5I5gQfew3uGEClXixqREpb7mxes5nWVE=;
        b=EZfgt6/zaLn5XX58EKF1h3qESnVTG36LJu6f6QEWRIystSohsewlf9sl4Mb+N2Xf16
         KhqeYBhBhJZDz8G7Z6tb0oZF2XVQyDSMMwsWN6ZLsIOMeZcSOrnnShTDQ5T+Zunal2Wn
         yt4w9d8clmjwUGYabNwb4Q7ig5/ud8TykJBOtQtgJc3QXA5S059Qp/X+S2LdBazXrPmu
         7nrYvtvDf4H1Czkh/mpSlRyajFsMtq+ZbQyoffIOo4VfQnQkkO3VQIuMCHZo4oIN6QMt
         h01aqpL1qp4oPHBLzhrYRg33NMScLVEnoLpTAGN3Lwp9HcKp4kx/hQQDDDKxxPlypoAW
         N92g==
X-Gm-Message-State: AOJu0YyOw/1xi0WC1YEXyaBcMumdvmb4iuXJRXoLAeKygzWlxTNU/JLA
	OufmGKo0+I7n2eA6843HOgwbHTvAgLN8Ddf1ggw=
X-Google-Smtp-Source: AGHT+IGOQdlSMXC0XrmskVGzoU5BsJXwCuzOpMBMeVb88PJfiULLufbdNiH+rPUje5K1xKKA4OPjHQ==
X-Received: by 2002:a05:600c:46ca:b0:40b:5e1e:cf6 with SMTP id q10-20020a05600c46ca00b0040b5e1e0cf6mr2360700wmo.49.1701682993282;
        Mon, 04 Dec 2023 01:43:13 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 4/6] x86/iommu: remove regions not to be mapped
Date: Mon,  4 Dec 2023 10:43:03 +0100
Message-ID: <20231204094305.59267-5-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231204094305.59267-1-roger.pau@citrix.com>
References: <20231204094305.59267-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Introduce the code to remove regions not to be mapped from the rangeset
that will be used to setup the IOMMU page tables for the hardware domain.

This change also introduces two new functions: remove_xen_ranges() and
vpci_subtract_mmcfg() that copy the logic in xen_in_range() and
vpci_is_mmcfg_address() respectively and remove the ranges that would otherwise
be intercepted by the original functions.

Note that the rangeset is still not populated.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Split from bigger patch.
---
 xen/arch/x86/hvm/io.c               | 16 ++++++++
 xen/arch/x86/include/asm/hvm/io.h   |  3 ++
 xen/arch/x86/include/asm/setup.h    |  1 +
 xen/arch/x86/setup.c                | 48 ++++++++++++++++++++++
 xen/drivers/passthrough/x86/iommu.c | 64 +++++++++++++++++++++++++++++
 5 files changed, 132 insertions(+)

diff --git a/xen/arch/x86/hvm/io.c b/xen/arch/x86/hvm/io.c
index d75af83ad01f..a42854c52b65 100644
--- a/xen/arch/x86/hvm/io.c
+++ b/xen/arch/x86/hvm/io.c
@@ -369,6 +369,22 @@ bool vpci_is_mmcfg_address(const struct domain *d, paddr_t addr)
     return vpci_mmcfg_find(d, addr);
 }
 
+int __hwdom_init vpci_subtract_mmcfg(const struct domain *d, struct rangeset *r)
+{
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
+}
+
 static unsigned int vpci_mmcfg_decode_addr(const struct hvm_mmcfg *mmcfg,
                                            paddr_t addr, pci_sbdf_t *sbdf)
 {
diff --git a/xen/arch/x86/include/asm/hvm/io.h b/xen/arch/x86/include/asm/hvm/io.h
index a97731657801..e1e5e6fe7491 100644
--- a/xen/arch/x86/include/asm/hvm/io.h
+++ b/xen/arch/x86/include/asm/hvm/io.h
@@ -156,6 +156,9 @@ void destroy_vpci_mmcfg(struct domain *d);
 /* Check if an address is between a MMCFG region for a domain. */
 bool vpci_is_mmcfg_address(const struct domain *d, paddr_t addr);
 
+/* Remove MMCFG regions from a given rangeset. */
+int vpci_subtract_mmcfg(const struct domain *d, struct rangeset *r);
+
 #endif /* __ASM_X86_HVM_IO_H__ */
 
 
diff --git a/xen/arch/x86/include/asm/setup.h b/xen/arch/x86/include/asm/setup.h
index 9a460e4db8f4..cd07d98101d8 100644
--- a/xen/arch/x86/include/asm/setup.h
+++ b/xen/arch/x86/include/asm/setup.h
@@ -37,6 +37,7 @@ void discard_initial_images(void);
 void *bootstrap_map(const module_t *mod);
 
 int xen_in_range(unsigned long mfn);
+int remove_xen_ranges(struct rangeset *r);
 
 extern uint8_t kbd_shift_flags;
 
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 3cba2be0af6c..71fa0b46f181 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -2136,6 +2136,54 @@ int __hwdom_init xen_in_range(unsigned long mfn)
     return 0;
 }
 
+int __hwdom_init remove_xen_ranges(struct rangeset *r)
+{
+    paddr_t start, end;
+    int rc;
+
+    /* S3 resume code (and other real mode trampoline code) */
+    rc = rangeset_remove_range(r, PFN_DOWN(bootsym_phys(trampoline_start)),
+                               PFN_DOWN(bootsym_phys(trampoline_end)));
+    if ( rc )
+        return rc;
+
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
+
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
+    }
+
+    return 0;
+}
+
 static int __hwdom_init cf_check io_bitmap_cb(
     unsigned long s, unsigned long e, void *ctx)
 {
diff --git a/xen/drivers/passthrough/x86/iommu.c b/xen/drivers/passthrough/x86/iommu.c
index 531a428f6496..7e97805fccec 100644
--- a/xen/drivers/passthrough/x86/iommu.c
+++ b/xen/drivers/passthrough/x86/iommu.c
@@ -370,6 +370,14 @@ static unsigned int __hwdom_init hwdom_iommu_map(const struct domain *d,
     return perms;
 }
 
+static int __hwdom_init cf_check map_subtract(unsigned long s, unsigned long e,
+                                              void *data)
+{
+    struct rangeset *map = data;
+
+    return rangeset_remove_range(map, s, e);
+}
+
 struct map_data {
     struct domain *d;
     unsigned int flush_flags;
@@ -522,6 +530,62 @@ void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
             goto commit;
     }
 
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
+            if ( rc )
+                panic("IOMMU failed to remove IO-APIC: %d\n",
+                      rc);
+        }
+    }
+
+    if ( is_pv_domain(d) )
+    {
+        /*
+         * Be consistent with CPU mappings: Dom0 is permitted to establish r/o
+         * ones there (also for e.g. HPET in certain cases), so it should also
+         * have such established for IOMMUs.  Remove any read-only ranges here,
+         * since ranges in mmio_ro_ranges are already explicitly mapped below
+         * in read-only mode.
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
+
+    /* Remove any regions past the last address addressable by the domain. */
+    rc = rangeset_remove_range(map, PFN_DOWN(1UL << paging_max_paddr_bits(d)),
+                               ~0UL);
+    if ( rc )
+        panic("IOMMU unable to remove unaddressable ranges: %d\n", rc);
+
     if ( iommu_verbose )
         printk(XENLOG_INFO "d%u: identity mappings for IOMMU:\n",
                d->domain_id);
-- 
2.43.0


