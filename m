Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3EA4A88C27
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 21:19:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.951281.1347400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4PLH-0007yX-GT; Mon, 14 Apr 2025 19:19:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 951281.1347400; Mon, 14 Apr 2025 19:19:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4PLH-0007wH-Ak; Mon, 14 Apr 2025 19:19:39 +0000
Received: by outflank-mailman (input) for mailman id 951281;
 Mon, 14 Apr 2025 19:19:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Cm6X=XA=gmail.com=sultanovandriy@srs-se1.protection.inumbo.net>)
 id 1u4PLF-0007CT-Ji
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 19:19:37 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 66c15be7-1965-11f0-9ffb-bf95429c2676;
 Mon, 14 Apr 2025 21:19:35 +0200 (CEST)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43cf628cb14so40434975e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 14 Apr 2025 12:19:35 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92320-cmbg19-2-0-cust1786.5-4.cable.virginm.net. [82.13.70.251])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f2338d7d8sm191595335e9.4.2025.04.14.12.19.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Apr 2025 12:19:33 -0700 (PDT)
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
X-Inumbo-ID: 66c15be7-1965-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744658374; x=1745263174; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eOZLBmLdDNNQBE1g2oN3Ah/Zn4iigA5H0Wb1R8V4BP4=;
        b=OKTkGaIq6UeD7wHlEFc1iKGLNZq/gVP0lAcVdPCzW/ebjgeNQ1rU/LKynjLkI1NT7E
         LBLsD9BpM0MeWEg8MIJTS+ZOJd7t74jRqno0oc9I6uk30682oHTR6AlETGauO3MFYQuo
         XFAqCrims0ivYhoFX0WePGCOdQAR09khlKidwP2nbKCDAG1YrfqJZ/d4qT/baFXCAtTr
         FCjuf71cTrURjIt1jyT+kLz6Cj8bUUmZ/cWGLSoDhkIbZEQy2Jr9DXTrythlrF0p41XF
         X8Hu5OEQWVUZpg7T83AckazO/8C+WATWT1BJ3T0+bFyeALbPuPXejc5Ajp8mChcoZBoT
         3fxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744658374; x=1745263174;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eOZLBmLdDNNQBE1g2oN3Ah/Zn4iigA5H0Wb1R8V4BP4=;
        b=Jjz3gFBiuGMhVMa+HSBDqGj0Sv4w3awvlYed+ZCkuyE01C8nCXhqEZCBxBD9WIzX2F
         Ta+yIHKBSlZXrWS/5D8erALQ+zl0kL3P7YPzkJVYFcAwdoWmPPJjE2+hsFh1TfYDQkKz
         uKYV0QUZIQgE5hO0LqvxFE9k5d/051T7a7DhK6Q492Ltz//3pyXIseLYCXu0lT7I07JR
         ZaiJNCKz2yBedFhM0I6MzJp8Q+qBbNPO9BEaIlC1QB4BevT46DWgjgTttYr05aaeZhSc
         4mJ6EmFY7te4YkXVgn/Uw5+Lod2cdFLsRd/La18GJNY9COxnrZvdlRE6VfiJyt65X7LB
         Bj2g==
X-Gm-Message-State: AOJu0YyziRG5luC7wYZMZBbB+bCij5RG9BUcIDnKzA/tlkBumYY1I1jt
	2E+Rbo/+1He1bzp/Py4xroDjXSi/zsuh0S5OjyX7S4XLkhgBtxobo5T9/PsInRM=
X-Gm-Gg: ASbGncto8CzDSeQyHtUNe3v3iimzxsrXq98xaO4T8jpUGdXYge/GS/msdU77mP1+CQw
	jP27V4w1xAD0X5xTWPs5EJpGLtXZPOjeDcN8yiqUXu4xT9xjVEWjfHBuzplTzRYAe2LE60rREHB
	aY8ENtQATFmMYOnBoIgXpTw4SoyDylXfs0AExTulUgZU3tUTM1oAqZxPmTAfvDgYERLUufDMdVe
	aztQXC6DzmJr+odW9nwkUt8lZL9DGLfVVDAN76gS+HzNIqlc+cr5roa8TyJqouu+lbPWF3ZlUCl
	OrxgTmGmf+zV0OThZtfyggIfv5z6d1fJvU4cD+2/XUSXMjN6RWrqAMxSIwWhHe/xBh1dvInkYkm
	iDtIyjjh+LNViLHbpdXRLmVc4OvamBNm2VYiTYcoPeCA=
X-Google-Smtp-Source: AGHT+IFIOytdl3oFMHljn4el0w9uBIeWdnXY9fe6fJQL82iVB/9uohqTnsLwC1Py0h3dh9fK4+mvLg==
X-Received: by 2002:a05:600c:4f03:b0:43d:186d:a4bf with SMTP id 5b1f17b1804b1-43f94c8a866mr5688945e9.0.1744658374064;
        Mon, 14 Apr 2025 12:19:34 -0700 (PDT)
From: Andrii Sultanov <sultanovandriy@gmail.com>
X-Google-Original-From: Andrii Sultanov <andriy.sultanov@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Andrii Sultanov <sultanovandriy@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 3/3] drivers: Make ioapic_sbdf and hpet_sbdf contain pci_sbdf_t
Date: Mon, 14 Apr 2025 20:19:18 +0100
Message-ID: <af7536c3234bc7a9d048b4cb1d45f084b4343bdb.1744657012.git.andriy.sultanov@vates.tech>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1744657012.git.andriy.sultanov@vates.tech>
References: <cover.1744657012.git.andriy.sultanov@vates.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andrii Sultanov <sultanovandriy@gmail.com>

Following a similar change to amd_iommu struct, make two more structs
take pci_sbdf_t directly instead of seg and bdf separately. This lets us
drop several conversions from the latter to the former and simplifies
several comparisons and assignments.

Bloat-o-meter reports:
add/remove: 0/0 grow/shrink: 1/10 up/down: 256/-320 (-64)
Function                                     old     new   delta
_einittext                                 22092   22348    +256
parse_ivrs_hpet                              248     245      -3
amd_iommu_detect_one_acpi                    876     868      -8
iov_supports_xt                              275     264     -11
amd_iommu_read_ioapic_from_ire               344     332     -12
amd_setup_hpet_msi                           237     224     -13
amd_iommu_ioapic_update_ire                  575     555     -20
reserve_unity_map_for_device                 453     424     -29
_hvm_dpci_msi_eoi                            160     128     -32
amd_iommu_get_supported_ivhd_type             86      30     -56
parse_ivrs_table                            3966    3830    -136

Signed-off-by: Andrii Sultanov <sultanovandriy@gmail.com>

---
Changes in V4:
* Folded several separate seg+bdf comparisons and assignments into one
  with sbdf_t
* With reshuffling in the prior commits, this commit is no longer
  neutral in terms of code size

Changes in V3:
* Dropped aliasing of seg and bdf, renamed users.

Changes in V2:
* Split single commit into several patches
* Change the format specifier to %pp in amd_iommu_ioapic_update_ire
---
 xen/drivers/passthrough/amd/iommu.h      |  5 +--
 xen/drivers/passthrough/amd/iommu_acpi.c | 30 +++++++---------
 xen/drivers/passthrough/amd/iommu_intr.c | 44 +++++++++++-------------
 3 files changed, 37 insertions(+), 42 deletions(-)

diff --git a/xen/drivers/passthrough/amd/iommu.h b/xen/drivers/passthrough/amd/iommu.h
index 2599800e6a..52f748310b 100644
--- a/xen/drivers/passthrough/amd/iommu.h
+++ b/xen/drivers/passthrough/amd/iommu.h
@@ -262,7 +262,7 @@ int cf_check amd_setup_hpet_msi(struct msi_desc *msi_desc);
 void cf_check amd_iommu_dump_intremap_tables(unsigned char key);
 
 extern struct ioapic_sbdf {
-    u16 bdf, seg;
+    pci_sbdf_t sbdf;
     u8 id;
     bool cmdline;
     u16 *pin_2_idx;
@@ -273,7 +273,8 @@ unsigned int ioapic_id_to_index(unsigned int apic_id);
 unsigned int get_next_ioapic_sbdf_index(void);
 
 extern struct hpet_sbdf {
-    u16 bdf, seg, id;
+    pci_sbdf_t sbdf;
+    uint16_t id;
     enum {
         HPET_NONE,
         HPET_CMDL,
diff --git a/xen/drivers/passthrough/amd/iommu_acpi.c b/xen/drivers/passthrough/amd/iommu_acpi.c
index 9e4fbee953..14845766e6 100644
--- a/xen/drivers/passthrough/amd/iommu_acpi.c
+++ b/xen/drivers/passthrough/amd/iommu_acpi.c
@@ -707,8 +707,7 @@ static int __init cf_check parse_ivrs_ioapic(const char *str)
         }
     }
 
-    ioapic_sbdf[idx].bdf = PCI_BDF(bus, dev, func);
-    ioapic_sbdf[idx].seg = seg;
+    ioapic_sbdf[idx].sbdf = PCI_SBDF( seg, PCI_BDF(bus, dev, func) );
     ioapic_sbdf[idx].id = id;
     ioapic_sbdf[idx].cmdline = true;
 
@@ -734,8 +733,7 @@ static int __init cf_check parse_ivrs_hpet(const char *str)
         return -EINVAL;
 
     hpet_sbdf.id = id;
-    hpet_sbdf.bdf = PCI_BDF(bus, dev, func);
-    hpet_sbdf.seg = seg;
+    hpet_sbdf.sbdf = PCI_SBDF( seg, PCI_BDF(bus, dev, func) );
     hpet_sbdf.init = HPET_CMDL;
 
     return 0;
@@ -748,6 +746,7 @@ static u16 __init parse_ivhd_device_special(
 {
     u16 dev_length, bdf;
     unsigned int apic, idx;
+    pci_sbdf_t sbdf;
 
     dev_length = sizeof(*special);
     if ( header_length < (block_length + dev_length) )
@@ -757,6 +756,7 @@ static u16 __init parse_ivhd_device_special(
     }
 
     bdf = special->used_id;
+    sbdf = PCI_SBDF(seg, bdf);
     if ( bdf >= ivrs_bdf_entries )
     {
         AMD_IOMMU_ERROR("IVHD: invalid Device_Entry Dev_Id %#x\n", bdf);
@@ -764,7 +764,7 @@ static u16 __init parse_ivhd_device_special(
     }
 
     AMD_IOMMU_DEBUG("IVHD Special: %pp variety %#x handle %#x\n",
-                    &PCI_SBDF(seg, bdf), special->variety, special->handle);
+                    &sbdf, special->variety, special->handle);
     add_ivrs_mapping_entry(bdf, bdf, special->header.data_setting, 0, true,
                            iommu);
 
@@ -780,8 +780,7 @@ static u16 __init parse_ivhd_device_special(
          */
         for ( idx = 0; idx < nr_ioapic_sbdf; idx++ )
         {
-            if ( ioapic_sbdf[idx].bdf == bdf &&
-                 ioapic_sbdf[idx].seg == seg &&
+            if ( ioapic_sbdf[idx].sbdf.sbdf == sbdf.sbdf &&
                  ioapic_sbdf[idx].cmdline )
                 break;
         }
@@ -790,7 +789,7 @@ static u16 __init parse_ivhd_device_special(
             AMD_IOMMU_DEBUG("IVHD: Command line override present for IO-APIC %#x"
                             "(IVRS: %#x devID %pp)\n",
                             ioapic_sbdf[idx].id, special->handle,
-                            &PCI_SBDF(seg, bdf));
+                            &sbdf);
             break;
         }
 
@@ -805,8 +804,7 @@ static u16 __init parse_ivhd_device_special(
                                 special->handle);
             else if ( idx != MAX_IO_APICS && ioapic_sbdf[idx].pin_2_idx )
             {
-                if ( ioapic_sbdf[idx].bdf == bdf &&
-                     ioapic_sbdf[idx].seg == seg )
+                if ( ioapic_sbdf[idx].sbdf.sbdf == sbdf.sbdf )
                     AMD_IOMMU_WARN("IVHD: duplicate IO-APIC %#x entries\n",
                                     special->handle);
                 else
@@ -827,8 +825,7 @@ static u16 __init parse_ivhd_device_special(
                 }
 
                 /* set device id of ioapic */
-                ioapic_sbdf[idx].bdf = bdf;
-                ioapic_sbdf[idx].seg = seg;
+                ioapic_sbdf[idx].sbdf = sbdf;
                 ioapic_sbdf[idx].id = special->handle;
 
                 ioapic_sbdf[idx].pin_2_idx = xmalloc_array(
@@ -862,13 +859,12 @@ static u16 __init parse_ivhd_device_special(
             AMD_IOMMU_DEBUG("IVHD: Command line override present for HPET %#x "
                             "(IVRS: %#x devID %pp)\n",
                             hpet_sbdf.id, special->handle,
-                            &PCI_SBDF(seg, bdf));
+                            &sbdf);
             break;
         case HPET_NONE:
             /* set device id of hpet */
             hpet_sbdf.id = special->handle;
-            hpet_sbdf.bdf = bdf;
-            hpet_sbdf.seg = seg;
+            hpet_sbdf.sbdf = sbdf;
             hpet_sbdf.init = HPET_IVHD;
             break;
         default:
@@ -1139,9 +1135,9 @@ static int __init cf_check parse_ivrs_table(struct acpi_table_header *table)
                 return -ENXIO;
         }
 
-        if ( !ioapic_sbdf[idx].seg &&
+        if ( !ioapic_sbdf[idx].sbdf.seg &&
              /* SB IO-APIC is always on this device in AMD systems. */
-             ioapic_sbdf[idx].bdf == PCI_BDF(0, 0x14, 0) )
+             ioapic_sbdf[idx].sbdf.bdf == PCI_BDF(0, 0x14, 0) )
             sb_ioapic = 1;
 
         if ( ioapic_sbdf[idx].pin_2_idx )
diff --git a/xen/drivers/passthrough/amd/iommu_intr.c b/xen/drivers/passthrough/amd/iommu_intr.c
index 16075cd5a1..b788675be2 100644
--- a/xen/drivers/passthrough/amd/iommu_intr.c
+++ b/xen/drivers/passthrough/amd/iommu_intr.c
@@ -323,7 +323,8 @@ void cf_check amd_iommu_ioapic_update_ire(
     unsigned int apic, unsigned int pin, uint64_t rte)
 {
     struct IO_APIC_route_entry new_rte;
-    int seg, bdf, rc;
+    pci_sbdf_t sbdf;
+    int rc;
     struct amd_iommu *iommu;
     unsigned int idx;
 
@@ -335,20 +336,18 @@ void cf_check amd_iommu_ioapic_update_ire(
     new_rte.raw = rte;
 
     /* get device id of ioapic devices */
-    bdf = ioapic_sbdf[idx].bdf;
-    seg = ioapic_sbdf[idx].seg;
-    iommu = find_iommu_for_device(PCI_SBDF(seg, bdf));
+    sbdf = ioapic_sbdf[idx].sbdf;
+    iommu = find_iommu_for_device(sbdf);
     if ( !iommu )
     {
-        AMD_IOMMU_WARN("failed to find IOMMU for IO-APIC @ %04x:%04x\n",
-                       seg, bdf);
+        AMD_IOMMU_WARN("failed to find IOMMU for IO-APIC @ %pp\n", &sbdf);
         __ioapic_write_entry(apic, pin, true, new_rte);
         return;
     }
 
     /* Update interrupt remapping entry */
     rc = update_intremap_entry_from_ioapic(
-             bdf, iommu, &new_rte,
+             sbdf.bdf, iommu, &new_rte,
              &ioapic_sbdf[idx].pin_2_idx[pin]);
 
     if ( rc )
@@ -369,7 +368,8 @@ unsigned int cf_check amd_iommu_read_ioapic_from_ire(
     unsigned int offset;
     unsigned int val = __io_apic_read(apic, reg);
     unsigned int pin = (reg - 0x10) / 2;
-    uint16_t seg, bdf, req_id;
+    pci_sbdf_t sbdf;
+    uint16_t req_id;
     const struct amd_iommu *iommu;
     union irte_ptr entry;
 
@@ -381,12 +381,11 @@ unsigned int cf_check amd_iommu_read_ioapic_from_ire(
     if ( offset >= INTREMAP_MAX_ENTRIES )
         return val;
 
-    seg = ioapic_sbdf[idx].seg;
-    bdf = ioapic_sbdf[idx].bdf;
-    iommu = find_iommu_for_device(PCI_SBDF(seg, bdf));
+    sbdf = ioapic_sbdf[idx].sbdf;
+    iommu = find_iommu_for_device(sbdf);
     if ( !iommu )
         return val;
-    req_id = get_intremap_requestor_id(seg, bdf);
+    req_id = get_intremap_requestor_id(sbdf.seg, sbdf.bdf);
     entry = get_intremap_entry(iommu, req_id, offset);
 
     if ( !(reg & 1) )
@@ -515,15 +514,15 @@ int cf_check amd_iommu_msi_msg_update_ire(
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
+    sbdf = pdev ? pdev->sbdf : hpet_sbdf.sbdf;
 
-    iommu = _find_iommu_for_device(PCI_SBDF(seg, bdf));
+    iommu = _find_iommu_for_device(sbdf);
     if ( IS_ERR_OR_NULL(iommu) )
         return PTR_ERR(iommu);
 
@@ -532,7 +531,7 @@ int cf_check amd_iommu_msi_msg_update_ire(
 
     if ( msi_desc->remap_index >= 0 && !msg )
     {
-        update_intremap_entry_from_msi_msg(iommu, bdf, nr,
+        update_intremap_entry_from_msi_msg(iommu, sbdf.bdf, nr,
                                            &msi_desc->remap_index,
                                            NULL, NULL);
 
@@ -543,7 +542,7 @@ int cf_check amd_iommu_msi_msg_update_ire(
     if ( !msg )
         return 0;
 
-    rc = update_intremap_entry_from_msi_msg(iommu, bdf, nr,
+    rc = update_intremap_entry_from_msi_msg(iommu, sbdf.bdf, nr,
                                             &msi_desc->remap_index,
                                             msg, &data);
     if ( rc > 0 )
@@ -660,8 +659,7 @@ bool __init cf_check iov_supports_xt(void)
         if ( idx == MAX_IO_APICS )
             return false;
 
-        if ( !find_iommu_for_device(PCI_SBDF(ioapic_sbdf[idx].seg,
-                                             ioapic_sbdf[idx].bdf)) )
+        if ( !find_iommu_for_device(ioapic_sbdf[idx].sbdf) )
         {
             AMD_IOMMU_WARN("no IOMMU for IO-APIC %#x (ID %x)\n",
                            apic, IO_APIC_ID(apic));
@@ -690,14 +688,14 @@ int __init cf_check amd_setup_hpet_msi(struct msi_desc *msi_desc)
         return -ENODEV;
     }
 
-    iommu = find_iommu_for_device(PCI_SBDF(hpet_sbdf.seg, hpet_sbdf.bdf));
+    iommu = find_iommu_for_device(hpet_sbdf.sbdf);
     if ( !iommu )
         return -ENXIO;
 
-    lock = get_intremap_lock(hpet_sbdf.seg, hpet_sbdf.bdf);
+    lock = get_intremap_lock(hpet_sbdf.sbdf.seg, hpet_sbdf.sbdf.bdf);
     spin_lock_irqsave(lock, flags);
 
-    msi_desc->remap_index = alloc_intremap_entry(iommu, hpet_sbdf.bdf, 1);
+    msi_desc->remap_index = alloc_intremap_entry(iommu, hpet_sbdf.sbdf.bdf, 1);
     if ( msi_desc->remap_index >= INTREMAP_MAX_ENTRIES )
     {
         msi_desc->remap_index = -1;
-- 
2.49.0


