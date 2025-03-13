Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 600ABA600F5
	for <lists+xen-devel@lfdr.de>; Thu, 13 Mar 2025 20:22:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.913384.1319446 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tso7r-000489-Qs; Thu, 13 Mar 2025 19:21:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 913384.1319446; Thu, 13 Mar 2025 19:21:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tso7r-00045U-NS; Thu, 13 Mar 2025 19:21:51 +0000
Received: by outflank-mailman (input) for mailman id 913384;
 Thu, 13 Mar 2025 18:57:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vl4a=WA=gmail.com=sultanovandriy@srs-se1.protection.inumbo.net>)
 id 1tsnkh-0004Fy-PO
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 18:57:55 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 112e9dc6-003d-11f0-9ab9-95dc52dad729;
 Thu, 13 Mar 2025 19:57:53 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43cfdc2c8c9so9108915e9.2
 for <xen-devel@lists.xenproject.org>; Thu, 13 Mar 2025 11:57:53 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92320-cmbg19-2-0-cust1786.5-4.cable.virginm.net. [82.13.70.251])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d0a7310f7sm62725705e9.3.2025.03.13.11.57.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Mar 2025 11:57:51 -0700 (PDT)
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
X-Inumbo-ID: 112e9dc6-003d-11f0-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741892272; x=1742497072; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gSJ11JrLpUSqlneO0TA/YS+paZDKlsELFIGydKzW5+c=;
        b=Ehvqfw51S6f0kSjNesVDM19EIYhf0ghvtruBerc5k23vG4KlcCmubHTKPvh5oSWI0A
         LJyqUB3hRuoDj8X1bM7rr+ypPlmnzRahZotYvKR9BPLK+3aGMRxybkKs8/G7cVvUaieX
         F/o49vvUET8LDjM4kcbMrEPudNKlgKFgim3XJUo4TRxQSVA+oKB/ziFlPBDTJsj602s5
         UM0w69wmXduXHu2za6NZ/DZrbsxgk4kwM4EtRCi/SrvBEKtu/Nx+lJtfp5t81H5ckUa9
         /IdYt7o4V4zcuDNCLBF9wXP39c+wpx42dc4nTgIoFkY7q8IV4nDUEjhd+i+j6qqh/3qB
         ytsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741892272; x=1742497072;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gSJ11JrLpUSqlneO0TA/YS+paZDKlsELFIGydKzW5+c=;
        b=s+w1XY24X+Gnqzeasef9DrYOjpIDhCxUhaEngsTfJmbKiT3+z7zUvN53YE5arIYX+T
         MK5NORB3Kg4ZNq6of5KKj04MmCTAESatDRZrl9dHpb1pRihzkWt5og5KBrdZbYDhXzq3
         s9z4gt7EssxlAesTQ19vOfOSbzeA118Eta4BHEaTLJb/BM1MCzJ8Ywod55Dv8oP34zuW
         Mx9TxhtlPCfsztbTkMaHz/bckWT9dYFd8FXnJ3g7tG5xut555T2b3ucTLgVLs2WApANf
         3o7mCcWgGLdiJO0BTfFarUoQMdiQGVMdIph5oH/2Hz9nMTLHDwRQekyvk9lD5gaQ2e/R
         zQCQ==
X-Gm-Message-State: AOJu0YzgN6uq3LE+iuP5OLVBUM0fyzW4DJubjrGDJlMcahQ6jdOvXOOX
	bGChmUJ9g0bGHFaFz6t39hC6pfJDbOTzNksnAItQ2wNq5feDvgYzFBx2kTeD
X-Gm-Gg: ASbGnct1ILwWi9r2OocbG5aw39Sn5IYLa5TyHGIF2u2v1+iGznOkTyApbOBR8HLWn/i
	m9yiWcJtM4SMpn2JcX/MjfmLU4UFmIIJHvK6Rm838v6/FwiDKLFY+bYoElOPMKipQs9Z4qjA2e2
	Vk6n7xRyZeU3pCQf4+GOLJ/zOAiyWdhp4U6nQ6LZR5td6+gW39syOvScxUC/5IObLlUUPXhj70P
	JnzNb6fre4w+dyTwHSO76TgUzosHYVhVx1JT2gqdN76m+yUQuE7KT1vmInnq/g/2TGhPx4+52S1
	PY/3Q2klzNPTw+emd0Ul6EmLH77WwkHbLMSr93GmdHugTxiCnIBIKt2erliGAc0KpTGJ8DW28ei
	3iuR4HQtgYtpCPEwu9CJ9NY3Ta8mVv6pFz1YulXhtrt0H
X-Google-Smtp-Source: AGHT+IEAiTxnxIuxbOI8MnaxelNJPaAsA84KL6MHdnuyEiZHkEi32QcSuA8y4wWj9gf2Lg1D74s/4Q==
X-Received: by 2002:a05:600c:4f41:b0:43d:24d:bbe2 with SMTP id 5b1f17b1804b1-43d1d8eb12emr6737415e9.28.1741892271700;
        Thu, 13 Mar 2025 11:57:51 -0700 (PDT)
From: Andrii Sultanov <sultanovandriy@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Andrii Sultanov <sultanovandriy@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v1] drivers: Change amd_iommu struct to contain pci_sbdf_t, simplify code
Date: Thu, 13 Mar 2025 18:57:38 +0000
Message-ID: <7e5a37e51303ba17dab8e6a92830257f670f3355.1741891599.git.sultanovandriy@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Following on from 250d87dc, struct amd_iommu has its seg and bdf fields
backwards with relation to pci_sbdf_t. Swap them around, and simplify the
expressions regenerating an sbdf_t from seg+bdf.

Simplify ioapic_sbdf and bpet_sbdf along the way. Adjust functions
taking seg and bdf fields of these structs to take pci_sbdf_t instead.
Simplify comparisons similarly.

Bloat-o-meter reports:

```
add/remove: 0/0 grow/shrink: 13/21 up/down: 352/-576 (-224)
Function                                     old     new   delta
_einittext                                 22028   22220    +192
amd_iommu_prepare                            853     897     +44
_invalidate_all_devices                      133     154     +21
amd_iommu_domain_destroy                      46      63     +17
disable_fmt                                12336   12352     +16
_acpi_module_name                            416     432     +16
amd_iommu_get_reserved_device_memory         521     536     +15
parse_ivrs_table                            3955    3966     +11
amd_iommu_assign_device                      271     282     +11
find_iommu_for_device                        242     246      +4
get_intremap_requestor_id                     49      52      +3
amd_iommu_free_intremap_table                360     361      +1
allocate_domain_resources                     82      83      +1
reassign_device                              843     838      -5
amd_iommu_remove_device                      352     347      -5
amd_iommu_flush_iotlb                        359     354      -5
iov_supports_xt                              270     264      -6
amd_iommu_setup_domain_device               1478    1472      -6
amd_setup_hpet_msi                           232     224      -8
amd_iommu_ioapic_update_ire                  572     564      -8
_hvm_dpci_msi_eoi                            157     149      -8
amd_iommu_msi_enable                          33      20     -13
register_range_for_device                    297     281     -16
amd_iommu_add_device                         856     839     -17
update_intremap_entry_from_msi_msg           879     861     -18
amd_iommu_read_ioapic_from_ire               347     323     -24
amd_iommu_msi_msg_update_ire                 472     431     -41
flush_command_buffer                         460     417     -43
set_iommu_interrupt_handler                  421     377     -44
amd_iommu_detect_one_acpi                    918     868     -50
amd_iommu_get_supported_ivhd_type             86      31     -55
iterate_ivrs_mappings                        169     113     -56
parse_ivmd_block                            1339    1271     -68
enable_iommu                                1745    1665     -80
```

Resolves: https://gitlab.com/xen-project/xen/-/issues/198

Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>
Signed-off-by: Andrii Sultanov <sultanovandriy@gmail.com>
---
 xen/drivers/passthrough/amd/iommu.h         | 29 +++++++++--
 xen/drivers/passthrough/amd/iommu_acpi.c    | 24 ++++-----
 xen/drivers/passthrough/amd/iommu_cmd.c     |  6 +--
 xen/drivers/passthrough/amd/iommu_detect.c  |  2 +-
 xen/drivers/passthrough/amd/iommu_init.c    | 31 +++++------
 xen/drivers/passthrough/amd/iommu_intr.c    | 57 ++++++++++-----------
 xen/drivers/passthrough/amd/iommu_map.c     | 21 ++++----
 xen/drivers/passthrough/amd/pci_amd_iommu.c | 32 ++++++------
 8 files changed, 108 insertions(+), 94 deletions(-)

diff --git a/xen/drivers/passthrough/amd/iommu.h b/xen/drivers/passthrough/amd/iommu.h
index 00e81b4b2a..6903b1bc5d 100644
--- a/xen/drivers/passthrough/amd/iommu.h
+++ b/xen/drivers/passthrough/amd/iommu.h
@@ -77,8 +77,14 @@ struct amd_iommu {
     struct list_head list;
     spinlock_t lock; /* protect iommu */
 
-    u16 seg;
-    u16 bdf;
+    union {
+        struct {
+            uint16_t bdf;
+            uint16_t seg;
+        };
+        pci_sbdf_t sbdf;
+    };
+
     struct msi_desc msi;
 
     u16 cap_offset;
@@ -240,7 +246,7 @@ void amd_iommu_flush_intremap(struct amd_iommu *iommu, uint16_t bdf);
 void amd_iommu_flush_all_caches(struct amd_iommu *iommu);
 
 /* find iommu for bdf */
-struct amd_iommu *find_iommu_for_device(int seg, int bdf);
+struct amd_iommu *find_iommu_for_device(pci_sbdf_t sbdf);
 
 /* interrupt remapping */
 bool cf_check iov_supports_xt(void);
@@ -262,7 +268,13 @@ int cf_check amd_setup_hpet_msi(struct msi_desc *msi_desc);
 void cf_check amd_iommu_dump_intremap_tables(unsigned char key);
 
 extern struct ioapic_sbdf {
-    u16 bdf, seg;
+    union {
+        struct {
+            uint16_t bdf;
+            uint16_t seg;
+        };
+        pci_sbdf_t sbdf;
+    };
     u8 id;
     bool cmdline;
     u16 *pin_2_idx;
@@ -273,7 +285,14 @@ unsigned int ioapic_id_to_index(unsigned int apic_id);
 unsigned int get_next_ioapic_sbdf_index(void);
 
 extern struct hpet_sbdf {
-    u16 bdf, seg, id;
+    union {
+        struct {
+            uint16_t bdf;
+            uint16_t seg;
+        };
+        pci_sbdf_t sbdf;
+    };
+    uint16_t id;
     enum {
         HPET_NONE,
         HPET_CMDL,
diff --git a/xen/drivers/passthrough/amd/iommu_acpi.c b/xen/drivers/passthrough/amd/iommu_acpi.c
index 5bdbfb5ba8..57efb7ddda 100644
--- a/xen/drivers/passthrough/amd/iommu_acpi.c
+++ b/xen/drivers/passthrough/amd/iommu_acpi.c
@@ -107,12 +107,12 @@ static void __init add_ivrs_mapping_entry(
 }
 
 static struct amd_iommu * __init find_iommu_from_bdf_cap(
-    u16 seg, u16 bdf, u16 cap_offset)
+    pci_sbdf_t sbdf, u16 cap_offset)
 {
     struct amd_iommu *iommu;
 
     for_each_amd_iommu ( iommu )
-        if ( (iommu->seg == seg) && (iommu->bdf == bdf) &&
+        if ( (iommu->sbdf.sbdf == sbdf.sbdf) &&
              (iommu->cap_offset == cap_offset) )
             return iommu;
 
@@ -239,17 +239,17 @@ static int __init register_range_for_device(
     unsigned int bdf, paddr_t base, paddr_t limit,
     bool iw, bool ir, bool exclusion)
 {
-    int seg = 0; /* XXX */
-    struct ivrs_mappings *ivrs_mappings = get_ivrs_mappings(seg);
+    pci_sbdf_t sbdf = { .seg = 0, .bdf = bdf };
+    struct ivrs_mappings *ivrs_mappings = get_ivrs_mappings(sbdf.seg);
     struct amd_iommu *iommu;
     u16 req;
     int rc = 0;
 
-    iommu = find_iommu_for_device(seg, bdf);
+    iommu = find_iommu_for_device(sbdf);
     if ( !iommu )
     {
         AMD_IOMMU_WARN("IVMD: no IOMMU for device %pp - ignoring constrain\n",
-                       &PCI_SBDF(seg, bdf));
+                       &(sbdf));
         return 0;
     }
     req = ivrs_mappings[bdf].dte_requestor_id;
@@ -263,9 +263,9 @@ static int __init register_range_for_device(
         paddr_t length = limit + PAGE_SIZE - base;
 
         /* reserve unity-mapped page entries for device */
-        rc = reserve_unity_map_for_device(seg, bdf, base, length, iw, ir,
+        rc = reserve_unity_map_for_device(sbdf.seg, bdf, base, length, iw, ir,
                                           false) ?:
-             reserve_unity_map_for_device(seg, req, base, length, iw, ir,
+             reserve_unity_map_for_device(sbdf.seg, req, base, length, iw, ir,
                                           false);
     }
     else
@@ -297,7 +297,7 @@ static int __init register_range_for_iommu_devices(
     /* reserve unity-mapped page entries for devices */
     for ( bdf = rc = 0; !rc && bdf < ivrs_bdf_entries; bdf++ )
     {
-        if ( iommu != find_iommu_for_device(iommu->seg, bdf) )
+        if ( iommu != find_iommu_for_device(iommu->sbdf) )
             continue;
 
         req = get_ivrs_mappings(iommu->seg)[bdf].dte_requestor_id;
@@ -362,7 +362,7 @@ static int __init parse_ivmd_device_iommu(
     struct amd_iommu *iommu;
 
     /* find target IOMMU */
-    iommu = find_iommu_from_bdf_cap(seg, ivmd_block->header.device_id,
+    iommu = find_iommu_from_bdf_cap(PCI_SBDF(seg, ivmd_block->header.device_id),
                                     ivmd_block->aux_data);
     if ( !iommu )
     {
@@ -916,8 +916,8 @@ static int __init parse_ivhd_block(const struct acpi_ivrs_hardware *ivhd_block)
                     ivhd_block->pci_segment_group, ivhd_block->info,
                     ivhd_block->iommu_attr);
 
-    iommu = find_iommu_from_bdf_cap(ivhd_block->pci_segment_group,
-                                    ivhd_block->header.device_id,
+    iommu = find_iommu_from_bdf_cap(PCI_SBDF(ivhd_block->pci_segment_group,
+                                    ivhd_block->header.device_id),
                                     ivhd_block->capability_offset);
     if ( !iommu )
     {
diff --git a/xen/drivers/passthrough/amd/iommu_cmd.c b/xen/drivers/passthrough/amd/iommu_cmd.c
index 83c525b84f..dc3d2394a1 100644
--- a/xen/drivers/passthrough/amd/iommu_cmd.c
+++ b/xen/drivers/passthrough/amd/iommu_cmd.c
@@ -85,7 +85,7 @@ static void flush_command_buffer(struct amd_iommu *iommu,
             threshold |= threshold << 1;
             printk(XENLOG_WARNING
                    "AMD IOMMU %pp: %scompletion wait taking too long\n",
-                   &PCI_SBDF(iommu->seg, iommu->bdf),
+                   &(iommu->sbdf),
                    timeout_base ? "iotlb " : "");
             timeout = 0;
         }
@@ -95,7 +95,7 @@ static void flush_command_buffer(struct amd_iommu *iommu,
     if ( !timeout )
         printk(XENLOG_WARNING
                "AMD IOMMU %pp: %scompletion wait took %lums\n",
-               &PCI_SBDF(iommu->seg, iommu->bdf),
+               &(iommu->sbdf),
                timeout_base ? "iotlb " : "",
                (NOW() - start) / 10000000);
 }
@@ -288,7 +288,7 @@ void amd_iommu_flush_iotlb(u8 devfn, const struct pci_dev *pdev,
     if ( !pci_ats_enabled(pdev->seg, pdev->bus, pdev->devfn) )
         return;
 
-    iommu = find_iommu_for_device(pdev->seg, pdev->sbdf.bdf);
+    iommu = find_iommu_for_device(pdev->sbdf);
 
     if ( !iommu )
     {
diff --git a/xen/drivers/passthrough/amd/iommu_detect.c b/xen/drivers/passthrough/amd/iommu_detect.c
index cede44e651..7d60389500 100644
--- a/xen/drivers/passthrough/amd/iommu_detect.c
+++ b/xen/drivers/passthrough/amd/iommu_detect.c
@@ -231,7 +231,7 @@ int __init amd_iommu_detect_one_acpi(
     rt = pci_ro_device(iommu->seg, bus, PCI_DEVFN(dev, func));
     if ( rt )
         printk(XENLOG_ERR "Could not mark config space of %pp read-only (%d)\n",
-               &PCI_SBDF(iommu->seg, iommu->bdf), rt);
+               &(iommu->sbdf), rt);
 
     list_add_tail(&iommu->list, &amd_iommu_head);
     rt = 0;
diff --git a/xen/drivers/passthrough/amd/iommu_init.c b/xen/drivers/passthrough/amd/iommu_init.c
index bb25b55c85..e2c205a857 100644
--- a/xen/drivers/passthrough/amd/iommu_init.c
+++ b/xen/drivers/passthrough/amd/iommu_init.c
@@ -409,9 +409,7 @@ static void iommu_reset_log(struct amd_iommu *iommu,
 
 static void amd_iommu_msi_enable(struct amd_iommu *iommu, int flag)
 {
-    pci_sbdf_t sbdf = { .seg = iommu->seg, .bdf = iommu->bdf };
-
-    __msi_set_enable(sbdf, iommu->msi.msi_attrib.pos, flag);
+    __msi_set_enable(iommu->sbdf, iommu->msi.msi_attrib.pos, flag);
 }
 
 static void cf_check iommu_msi_unmask(struct irq_desc *desc)
@@ -752,12 +750,11 @@ static bool __init set_iommu_interrupt_handler(struct amd_iommu *iommu)
     }
 
     pcidevs_lock();
-    iommu->msi.dev = pci_get_pdev(NULL, PCI_SBDF(iommu->seg, iommu->bdf));
+    iommu->msi.dev = pci_get_pdev(NULL, iommu->sbdf);
     pcidevs_unlock();
     if ( !iommu->msi.dev )
     {
-        AMD_IOMMU_WARN("no pdev for %pp\n",
-                       &PCI_SBDF(iommu->seg, iommu->bdf));
+        AMD_IOMMU_WARN("no pdev for %pp\n", &(iommu->sbdf));
         return 0;
     }
 
@@ -779,7 +776,7 @@ static bool __init set_iommu_interrupt_handler(struct amd_iommu *iommu)
         hw_irq_controller *handler;
         u16 control;
 
-        control = pci_conf_read16(PCI_SBDF(iommu->seg, iommu->bdf),
+        control = pci_conf_read16(iommu->sbdf,
                                   iommu->msi.msi_attrib.pos + PCI_MSI_FLAGS);
 
         iommu->msi.msi.nvec = 1;
@@ -843,22 +840,22 @@ static void amd_iommu_erratum_746_workaround(struct amd_iommu *iommu)
          (boot_cpu_data.x86_model > 0x1f) )
         return;
 
-    pci_conf_write32(PCI_SBDF(iommu->seg, iommu->bdf), 0xf0, 0x90);
-    value = pci_conf_read32(PCI_SBDF(iommu->seg, iommu->bdf), 0xf4);
+    pci_conf_write32(iommu->sbdf, 0xf0, 0x90);
+    value = pci_conf_read32(iommu->sbdf, 0xf4);
 
     if ( value & (1 << 2) )
         return;
 
     /* Select NB indirect register 0x90 and enable writing */
-    pci_conf_write32(PCI_SBDF(iommu->seg, iommu->bdf), 0xf0, 0x90 | (1 << 8));
+    pci_conf_write32(iommu->sbdf, 0xf0, 0x90 | (1 << 8));
 
-    pci_conf_write32(PCI_SBDF(iommu->seg, iommu->bdf), 0xf4, value | (1 << 2));
+    pci_conf_write32(iommu->sbdf, 0xf4, value | (1 << 2));
     printk(XENLOG_INFO
            "AMD-Vi: Applying erratum 746 workaround for IOMMU at %pp\n",
-           &PCI_SBDF(iommu->seg, iommu->bdf));
+           &iommu->sbdf);
 
     /* Clear the enable writing bit */
-    pci_conf_write32(PCI_SBDF(iommu->seg, iommu->bdf), 0xf0, 0x90);
+    pci_conf_write32(iommu->sbdf, 0xf0, 0x90);
 }
 
 static void enable_iommu(struct amd_iommu *iommu)
@@ -1543,14 +1540,14 @@ static void invalidate_all_domain_pages(void)
 static int cf_check _invalidate_all_devices(
     u16 seg, struct ivrs_mappings *ivrs_mappings)
 {
-    unsigned int bdf; 
+    pci_sbdf_t sbdf = { .seg = seg, .bdf = 0 };
     u16 req_id;
     struct amd_iommu *iommu;
 
-    for ( bdf = 0; bdf < ivrs_bdf_entries; bdf++ )
+    for ( /* sbdf.bdf = 0 */ ; sbdf.bdf < ivrs_bdf_entries; sbdf.bdf++ )
     {
-        iommu = find_iommu_for_device(seg, bdf);
-        req_id = ivrs_mappings[bdf].dte_requestor_id;
+        iommu = find_iommu_for_device(sbdf);
+        req_id = ivrs_mappings[sbdf.bdf].dte_requestor_id;
         if ( iommu )
         {
             /*
diff --git a/xen/drivers/passthrough/amd/iommu_intr.c b/xen/drivers/passthrough/amd/iommu_intr.c
index 9abdc38053..0c91125ec0 100644
--- a/xen/drivers/passthrough/amd/iommu_intr.c
+++ b/xen/drivers/passthrough/amd/iommu_intr.c
@@ -123,10 +123,10 @@ static spinlock_t* get_intremap_lock(int seg, int req_id)
            &shared_intremap_lock);
 }
 
-static int get_intremap_requestor_id(int seg, int bdf)
+static int get_intremap_requestor_id(pci_sbdf_t sbdf)
 {
-    ASSERT( bdf < ivrs_bdf_entries );
-    return get_ivrs_mappings(seg)[bdf].dte_requestor_id;
+    ASSERT( sbdf.bdf < ivrs_bdf_entries );
+    return get_ivrs_mappings(sbdf.seg)[sbdf.bdf].dte_requestor_id;
 }
 
 static unsigned int alloc_intremap_entry(const struct amd_iommu *iommu,
@@ -281,7 +281,7 @@ static int update_intremap_entry_from_ioapic(
     unsigned int dest, offset;
     bool fresh = false;
 
-    req_id = get_intremap_requestor_id(iommu->seg, bdf);
+    req_id = get_intremap_requestor_id(PCI_SBDF(iommu->seg, bdf));
     lock = get_intremap_lock(iommu->seg, req_id);
 
     delivery_mode = rte->delivery_mode;
@@ -323,7 +323,8 @@ void cf_check amd_iommu_ioapic_update_ire(
     unsigned int apic, unsigned int pin, uint64_t rte)
 {
     struct IO_APIC_route_entry new_rte;
-    int seg, bdf, rc;
+    pci_sbdf_t sbdf;
+    int rc;
     struct amd_iommu *iommu;
     unsigned int idx;
 
@@ -335,20 +336,19 @@ void cf_check amd_iommu_ioapic_update_ire(
     new_rte.raw = rte;
 
     /* get device id of ioapic devices */
-    bdf = ioapic_sbdf[idx].bdf;
-    seg = ioapic_sbdf[idx].seg;
-    iommu = find_iommu_for_device(seg, bdf);
+    sbdf.sbdf = ioapic_sbdf[idx].sbdf.sbdf;
+    iommu = find_iommu_for_device(sbdf);
     if ( !iommu )
     {
         AMD_IOMMU_WARN("failed to find IOMMU for IO-APIC @ %04x:%04x\n",
-                       seg, bdf);
+                       sbdf.seg, sbdf.bdf);
         __ioapic_write_entry(apic, pin, true, new_rte);
         return;
     }
 
     /* Update interrupt remapping entry */
     rc = update_intremap_entry_from_ioapic(
-             bdf, iommu, &new_rte,
+             sbdf.bdf, iommu, &new_rte,
              &ioapic_sbdf[idx].pin_2_idx[pin]);
 
     if ( rc )
@@ -369,7 +369,8 @@ unsigned int cf_check amd_iommu_read_ioapic_from_ire(
     unsigned int offset;
     unsigned int val = __io_apic_read(apic, reg);
     unsigned int pin = (reg - 0x10) / 2;
-    uint16_t seg, bdf, req_id;
+    pci_sbdf_t sbdf;
+    uint16_t req_id;
     const struct amd_iommu *iommu;
     union irte_ptr entry;
 
@@ -381,12 +382,11 @@ unsigned int cf_check amd_iommu_read_ioapic_from_ire(
     if ( offset >= INTREMAP_MAX_ENTRIES )
         return val;
 
-    seg = ioapic_sbdf[idx].seg;
-    bdf = ioapic_sbdf[idx].bdf;
-    iommu = find_iommu_for_device(seg, bdf);
+    sbdf.sbdf = ioapic_sbdf[idx].sbdf.sbdf;
+    iommu = find_iommu_for_device(sbdf);
     if ( !iommu )
         return val;
-    req_id = get_intremap_requestor_id(seg, bdf);
+    req_id = get_intremap_requestor_id(sbdf);
     entry = get_intremap_entry(iommu, req_id, offset);
 
     if ( !(reg & 1) )
@@ -420,7 +420,7 @@ static int update_intremap_entry_from_msi_msg(
     bool fresh = false;
 
     req_id = get_dma_requestor_id(iommu->seg, bdf);
-    alias_id = get_intremap_requestor_id(iommu->seg, bdf);
+    alias_id = get_intremap_requestor_id(PCI_SBDF(iommu->seg, bdf));
 
     lock = get_intremap_lock(iommu->seg, req_id);
     spin_lock_irqsave(lock, flags);
@@ -495,19 +495,19 @@ static int update_intremap_entry_from_msi_msg(
     return fresh;
 }
 
-static struct amd_iommu *_find_iommu_for_device(int seg, int bdf)
+static struct amd_iommu *_find_iommu_for_device(pci_sbdf_t sbdf)
 {
     struct amd_iommu *iommu;
 
     for_each_amd_iommu ( iommu )
-        if ( iommu->seg == seg && iommu->bdf == bdf )
+        if ( iommu->sbdf.sbdf == sbdf.sbdf )
             return NULL;
 
-    iommu = find_iommu_for_device(seg, bdf);
+    iommu = find_iommu_for_device(sbdf);
     if ( iommu )
         return iommu;
 
-    AMD_IOMMU_DEBUG("No IOMMU for MSI dev = %pp\n", &PCI_SBDF(seg, bdf));
+    AMD_IOMMU_DEBUG("No IOMMU for MSI dev = %pp\n", &sbdf);
     return ERR_PTR(-EINVAL);
 }
 
@@ -515,15 +515,15 @@ int cf_check amd_iommu_msi_msg_update_ire(
     struct msi_desc *msi_desc, struct msi_msg *msg)
 {
     struct pci_dev *pdev = msi_desc->dev;
-    int bdf, seg, rc;
+    pci_sbdf_t sbdf;
+    int rc;
     struct amd_iommu *iommu;
     unsigned int i, nr = 1;
     u32 data;
 
-    bdf = pdev ? pdev->sbdf.bdf : hpet_sbdf.bdf;
-    seg = pdev ? pdev->seg : hpet_sbdf.seg;
+    sbdf.sbdf = pdev ? pdev->sbdf.sbdf : hpet_sbdf.sbdf.sbdf;
 
-    iommu = _find_iommu_for_device(seg, bdf);
+    iommu = _find_iommu_for_device(sbdf);
     if ( IS_ERR_OR_NULL(iommu) )
         return PTR_ERR(iommu);
 
@@ -532,7 +532,7 @@ int cf_check amd_iommu_msi_msg_update_ire(
 
     if ( msi_desc->remap_index >= 0 && !msg )
     {
-        update_intremap_entry_from_msi_msg(iommu, bdf, nr,
+        update_intremap_entry_from_msi_msg(iommu, sbdf.bdf, nr,
                                            &msi_desc->remap_index,
                                            NULL, NULL);
 
@@ -543,7 +543,7 @@ int cf_check amd_iommu_msi_msg_update_ire(
     if ( !msg )
         return 0;
 
-    rc = update_intremap_entry_from_msi_msg(iommu, bdf, nr,
+    rc = update_intremap_entry_from_msi_msg(iommu, sbdf.bdf, nr,
                                             &msi_desc->remap_index,
                                             msg, &data);
     if ( rc > 0 )
@@ -660,8 +660,7 @@ bool __init cf_check iov_supports_xt(void)
         if ( idx == MAX_IO_APICS )
             return false;
 
-        if ( !find_iommu_for_device(ioapic_sbdf[idx].seg,
-                                    ioapic_sbdf[idx].bdf) )
+        if ( !find_iommu_for_device(ioapic_sbdf[idx].sbdf) )
         {
             AMD_IOMMU_WARN("no IOMMU for IO-APIC %#x (ID %x)\n",
                            apic, IO_APIC_ID(apic));
@@ -690,7 +689,7 @@ int __init cf_check amd_setup_hpet_msi(struct msi_desc *msi_desc)
         return -ENODEV;
     }
 
-    iommu = find_iommu_for_device(hpet_sbdf.seg, hpet_sbdf.bdf);
+    iommu = find_iommu_for_device(hpet_sbdf.sbdf);
     if ( !iommu )
         return -ENXIO;
 
diff --git a/xen/drivers/passthrough/amd/iommu_map.c b/xen/drivers/passthrough/amd/iommu_map.c
index dde393645a..17070904fa 100644
--- a/xen/drivers/passthrough/amd/iommu_map.c
+++ b/xen/drivers/passthrough/amd/iommu_map.c
@@ -694,17 +694,16 @@ int amd_iommu_reserve_domain_unity_unmap(struct domain *d,
 int cf_check amd_iommu_get_reserved_device_memory(
     iommu_grdm_t *func, void *ctxt)
 {
-    unsigned int seg = 0 /* XXX */, bdf;
-    const struct ivrs_mappings *ivrs_mappings = get_ivrs_mappings(seg);
+    pci_sbdf_t sbdf = {0};
+    const struct ivrs_mappings *ivrs_mappings = get_ivrs_mappings(sbdf.seg);
     /* At least for global entries, avoid reporting them multiple times. */
     enum { pending, processing, done } global = pending;
 
-    for ( bdf = 0; bdf < ivrs_bdf_entries; ++bdf )
+    for ( /* sbdf.bdf = 0 */ ; sbdf.bdf < ivrs_bdf_entries; ++sbdf.bdf )
     {
-        pci_sbdf_t sbdf = PCI_SBDF(seg, bdf);
-        const struct ivrs_unity_map *um = ivrs_mappings[bdf].unity_map;
-        unsigned int req = ivrs_mappings[bdf].dte_requestor_id;
-        const struct amd_iommu *iommu = ivrs_mappings[bdf].iommu;
+        const struct ivrs_unity_map *um = ivrs_mappings[sbdf.bdf].unity_map;
+        unsigned int req = ivrs_mappings[sbdf.bdf].dte_requestor_id;
+        const struct amd_iommu *iommu = ivrs_mappings[sbdf.bdf].iommu;
         int rc;
 
         if ( !iommu )
@@ -717,7 +716,7 @@ int cf_check amd_iommu_get_reserved_device_memory(
             pcidevs_unlock();
 
             if ( pdev )
-                iommu = find_iommu_for_device(seg, bdf);
+                iommu = find_iommu_for_device(sbdf);
             if ( !iommu )
                 continue;
         }
@@ -729,8 +728,8 @@ int cf_check amd_iommu_get_reserved_device_memory(
              * multiple times the same range(s) for perhaps many devices with
              * the same alias ID.
              */
-            if ( bdf != req && ivrs_mappings[req].iommu &&
-                 func(0, 0, PCI_SBDF(seg, req).sbdf, ctxt) )
+            if ( sbdf.bdf != req && ivrs_mappings[req].iommu &&
+                 func(0, 0, sbdf.sbdf, ctxt) )
                 continue;
 
             if ( global == pending )
@@ -740,7 +739,7 @@ int cf_check amd_iommu_get_reserved_device_memory(
         if ( iommu->exclusion_enable &&
              (iommu->exclusion_allow_all ?
               global == processing :
-              ivrs_mappings[bdf].dte_allow_exclusion) )
+              ivrs_mappings[sbdf.bdf].dte_allow_exclusion) )
         {
             rc = func(PFN_DOWN(iommu->exclusion_base),
                       PFN_UP(iommu->exclusion_limit | 1) -
diff --git a/xen/drivers/passthrough/amd/pci_amd_iommu.c b/xen/drivers/passthrough/amd/pci_amd_iommu.c
index d00697edb3..16bab0f948 100644
--- a/xen/drivers/passthrough/amd/pci_amd_iommu.c
+++ b/xen/drivers/passthrough/amd/pci_amd_iommu.c
@@ -32,35 +32,35 @@ static bool __read_mostly init_done;
 
 static const struct iommu_init_ops _iommu_init_ops;
 
-struct amd_iommu *find_iommu_for_device(int seg, int bdf)
+struct amd_iommu *find_iommu_for_device(pci_sbdf_t sbdf)
 {
-    struct ivrs_mappings *ivrs_mappings = get_ivrs_mappings(seg);
+    struct ivrs_mappings *ivrs_mappings = get_ivrs_mappings(sbdf.seg);
 
-    if ( !ivrs_mappings || bdf >= ivrs_bdf_entries )
+    if ( !ivrs_mappings || sbdf.bdf >= ivrs_bdf_entries )
         return NULL;
 
-    if ( unlikely(!ivrs_mappings[bdf].iommu) && likely(init_done) )
+    if ( unlikely(!ivrs_mappings[sbdf.bdf].iommu) && likely(init_done) )
     {
-        unsigned int bd0 = bdf & ~PCI_FUNC(~0);
+        unsigned int bd0 = sbdf.bdf & ~PCI_FUNC(~0);
 
-        if ( ivrs_mappings[bd0].iommu && ivrs_mappings[bd0].iommu->bdf != bdf )
+        if ( ivrs_mappings[bd0].iommu && ivrs_mappings[bd0].iommu->bdf != sbdf.bdf )
         {
             struct ivrs_mappings tmp = ivrs_mappings[bd0];
 
             tmp.iommu = NULL;
             if ( tmp.dte_requestor_id == bd0 )
-                tmp.dte_requestor_id = bdf;
-            ivrs_mappings[bdf] = tmp;
+                tmp.dte_requestor_id = sbdf.bdf;
+            ivrs_mappings[sbdf.bdf] = tmp;
 
             printk(XENLOG_WARNING "%pp not found in ACPI tables;"
-                   " using same IOMMU as function 0\n", &PCI_SBDF(seg, bdf));
+                   " using same IOMMU as function 0\n", &sbdf);
 
             /* write iommu field last */
-            ivrs_mappings[bdf].iommu = ivrs_mappings[bd0].iommu;
+            ivrs_mappings[sbdf.bdf].iommu = ivrs_mappings[bd0].iommu;
         }
     }
 
-    return ivrs_mappings[bdf].iommu;
+    return ivrs_mappings[sbdf.bdf].iommu;
 }
 
 /*
@@ -107,7 +107,7 @@ static bool any_pdev_behind_iommu(const struct domain *d,
         if ( pdev == exclude )
             continue;
 
-        if ( find_iommu_for_device(pdev->seg, pdev->sbdf.bdf) == iommu )
+        if ( find_iommu_for_device(pdev->sbdf) == iommu )
             return true;
     }
 
@@ -468,7 +468,7 @@ static int cf_check reassign_device(
     struct amd_iommu *iommu;
     int rc;
 
-    iommu = find_iommu_for_device(pdev->seg, pdev->sbdf.bdf);
+    iommu = find_iommu_for_device(pdev->sbdf);
     if ( !iommu )
     {
         AMD_IOMMU_WARN("failed to find IOMMU: %pp cannot be assigned to %pd\n",
@@ -578,10 +578,10 @@ static int cf_check amd_iommu_add_device(u8 devfn, struct pci_dev *pdev)
         return -EINVAL;
 
     for_each_amd_iommu(iommu)
-        if ( pdev->seg == iommu->seg && pdev->sbdf.bdf == iommu->bdf )
+        if ( pdev->sbdf.sbdf == iommu->sbdf.sbdf )
             return is_hardware_domain(pdev->domain) ? 0 : -ENODEV;
 
-    iommu = find_iommu_for_device(pdev->seg, pdev->sbdf.bdf);
+    iommu = find_iommu_for_device(pdev->sbdf);
     if ( unlikely(!iommu) )
     {
         /* Filter bridge devices. */
@@ -666,7 +666,7 @@ static int cf_check amd_iommu_remove_device(u8 devfn, struct pci_dev *pdev)
     if ( !pdev->domain )
         return -EINVAL;
 
-    iommu = find_iommu_for_device(pdev->seg, pdev->sbdf.bdf);
+    iommu = find_iommu_for_device(pdev->sbdf);
     if ( !iommu )
     {
         AMD_IOMMU_WARN("failed to find IOMMU: %pp cannot be removed from %pd\n",
-- 
2.48.1


