Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C130683B043
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jan 2024 18:44:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.671178.1044402 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rShHs-0003uj-LZ; Wed, 24 Jan 2024 17:43:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 671178.1044402; Wed, 24 Jan 2024 17:43:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rShHs-0003t6-IH; Wed, 24 Jan 2024 17:43:44 +0000
Received: by outflank-mailman (input) for mailman id 671178;
 Wed, 24 Jan 2024 17:43:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V3ap=JC=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1rShHq-0003ef-KQ
 for xen-devel@lists.xenproject.org; Wed, 24 Jan 2024 17:43:42 +0000
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [2a00:1450:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1c73fa59-bae0-11ee-9b0f-b553b5be7939;
 Wed, 24 Jan 2024 18:43:40 +0100 (CET)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-3394b892691so774377f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 24 Jan 2024 09:43:40 -0800 (PST)
Received: from localhost ([213.195.118.74]) by smtp.gmail.com with ESMTPSA id
 k2-20020a5d6282000000b0033838c2c169sm14419901wru.108.2024.01.24.09.43.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jan 2024 09:43:39 -0800 (PST)
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
X-Inumbo-ID: 1c73fa59-bae0-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1706118220; x=1706723020; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PRRTVoMsffBaeCx7H0UZfS7Un0PKaRloiBABlVU/CRw=;
        b=lwbha7if0VIQZ69f6ardj89bG4ml+2dzseawo9iXDe2N4ln2mqEypb5zKQXmxgjVie
         Sv78gMHQHiBDZ+AzaDnXwct8GsmKiEG4m0iDkJzsmMOSIjQ5zStna5ekkcnkp6lhYbMB
         M1OY3uthjW8wJFcC3lUhX0GvVPfQQfEpKamtg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706118220; x=1706723020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PRRTVoMsffBaeCx7H0UZfS7Un0PKaRloiBABlVU/CRw=;
        b=wA+aRJBfPZOL20aj8YMMDvtPzCUhzIJmiVXm3ZpAYtZV5FkHvLfnbGh7MPZ/VGf4kr
         7KCOLw5PtqKpXguFpa+ZZDlZRSkBYQ8trzZfFQ6oY/M9z7z2Qx40wEo7R151cJTl+8Rx
         R32qopjgz4ZZCtI2CLrmehub/nnNbdrj0SRYLAuzB0/G1IWrFiATyOd32cwC8pMAl5Rg
         88aWL43So2xKUYiXWxBgC6N0RWe6ek+StaTM75yfuqZLCbl5Wg+ectELK0jOGwP2nHB4
         s1ZjZz5EBM1q5z+tVwdE+W0ukaLQzD+HmOKe32Liz7RsUl2p1mzmE5WyqWksT85sYF1N
         0H0Q==
X-Gm-Message-State: AOJu0Yxaq9DdFMaWKT1yPK4gmMkkiIyoRyiupdY5oFkmjbPqtmIO4Ot4
	oM6G62DT9VKEiV1sG1yrWxbdUqHzKJRfE5lxY1E1bvvtMwhe5BgSNxbtmMe2mYbwd4KxHp022V5
	o
X-Google-Smtp-Source: AGHT+IH6TMMY4cg2huxFvd8qdL8Ao0BquEAyYm67Y1uR33w8uMPyTRzFYILSedvn+lTN+7cJPzFDZQ==
X-Received: by 2002:a5d:4592:0:b0:337:7cda:f60f with SMTP id p18-20020a5d4592000000b003377cdaf60fmr695501wrq.26.1706118219684;
        Wed, 24 Jan 2024 09:43:39 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Paul Durrant <paul@xen.org>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v5 1/3] x86/iommu: remove regions not to be mapped
Date: Wed, 24 Jan 2024 18:29:51 +0100
Message-ID: <20240124172953.29814-2-roger.pau@citrix.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240124172953.29814-1-roger.pau@citrix.com>
References: <20240124172953.29814-1-roger.pau@citrix.com>
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
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Changes since v4:
 - Fix off-by-one when removing the Xen used ranges, as the rangesets are
   inclusive.

Changes since v3:
 - Remove unnecessary line wrapping.

Changes since v1:
 - Split from bigger patch.
---
 xen/arch/x86/hvm/io.c               | 16 ++++++++
 xen/arch/x86/include/asm/hvm/io.h   |  3 ++
 xen/arch/x86/include/asm/setup.h    |  1 +
 xen/arch/x86/setup.c                | 48 +++++++++++++++++++++++
 xen/drivers/passthrough/x86/iommu.c | 61 +++++++++++++++++++++++++++++
 5 files changed, 129 insertions(+)

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
index 897b7e92082e..c9f65c3a70b8 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -2138,6 +2138,54 @@ int __hwdom_init xen_in_range(unsigned long mfn)
     return 0;
 }
 
+int __hwdom_init remove_xen_ranges(struct rangeset *r)
+{
+    paddr_t start, end;
+    int rc;
+
+    /* S3 resume code (and other real mode trampoline code) */
+    rc = rangeset_remove_range(r, PFN_DOWN(bootsym_phys(trampoline_start)),
+                               PFN_DOWN(bootsym_phys(trampoline_end)) - 1);
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
+                               PFN_DOWN(__pa(&__2M_rodata_end)) - 1);
+    if ( rc )
+        return rc;
+
+    /* hypervisor .data + .bss */
+    if ( efi_boot_mem_unused(&start, &end) )
+    {
+        ASSERT(__pa(start) >= __pa(&__2M_rwdata_start));
+        rc = rangeset_remove_range(r, PFN_DOWN(__pa(&__2M_rwdata_start)),
+                                   PFN_DOWN(__pa(start)) - 1);
+        if ( rc )
+            return rc;
+        ASSERT(__pa(end) <= __pa(&__2M_rwdata_end));
+        rc = rangeset_remove_range(r, PFN_DOWN(__pa(end)),
+                                   PFN_DOWN(__pa(&__2M_rwdata_end)) - 1);
+        if ( rc )
+            return rc;
+    }
+    else
+    {
+        rc = rangeset_remove_range(r, PFN_DOWN(__pa(&__2M_rwdata_start)),
+                                   PFN_DOWN(__pa(&__2M_rwdata_end)) - 1);
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
index 59b0c7e980ca..fc5215a9dc40 100644
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
@@ -533,6 +541,59 @@ void __hwdom_init arch_iommu_hwdom_init(struct domain *d)
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
+        panic("IOMMU failed to remove Interrupt Address Range: %d\n", rc);
+
+    /* If emulating IO-APIC(s) make sure the base address is unmapped. */
+    if ( has_vioapic(d) )
+    {
+        for ( i = 0; i < d->arch.hvm.nr_vioapics; i++ )
+        {
+            rc = rangeset_remove_singleton(map,
+                PFN_DOWN(domain_vioapic(d, i)->base_address));
+            if ( rc )
+                panic("IOMMU failed to remove IO-APIC: %d\n", rc);
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
+            panic("IOMMU failed to remove read-only regions: %d\n", rc);
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
+    rc = rangeset_remove_range(map, PFN_DOWN(1UL << domain_max_paddr_bits(d)),
+                               ~0UL);
+    if ( rc )
+        panic("IOMMU unable to remove unaddressable ranges: %d\n", rc);
+
     if ( iommu_verbose )
         printk(XENLOG_INFO "%pd: identity mappings for IOMMU:\n", d);
 
-- 
2.43.0


