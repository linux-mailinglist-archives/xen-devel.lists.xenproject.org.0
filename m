Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 482C8A634F3
	for <lists+xen-devel@lfdr.de>; Sun, 16 Mar 2025 11:09:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.915997.1321201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ttkvY-0004qP-Qj; Sun, 16 Mar 2025 10:09:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 915997.1321201; Sun, 16 Mar 2025 10:09:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ttkvY-0004oj-Nc; Sun, 16 Mar 2025 10:09:04 +0000
Received: by outflank-mailman (input) for mailman id 915997;
 Sun, 16 Mar 2025 10:09:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tZWB=WD=gmail.com=sultanovandriy@srs-se1.protection.inumbo.net>)
 id 1ttkvX-0004ZD-Ne
 for xen-devel@lists.xenproject.org; Sun, 16 Mar 2025 10:09:03 +0000
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [2a00:1450:4864:20::329])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id af366910-024e-11f0-9899-31a8f345e629;
 Sun, 16 Mar 2025 11:09:02 +0100 (CET)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-43d0618746bso7988475e9.2
 for <xen-devel@lists.xenproject.org>; Sun, 16 Mar 2025 03:09:02 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92320-cmbg19-2-0-cust1786.5-4.cable.virginm.net. [82.13.70.251])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d1ffc4173sm73909045e9.20.2025.03.16.03.09.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Mar 2025 03:09:00 -0700 (PDT)
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
X-Inumbo-ID: af366910-024e-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742119741; x=1742724541; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lQudvlaOABMsiWuAfcQ9OoD9MZzMUxYD5xvQeBAhEEA=;
        b=jkgOACynDogfLk+G3DvAhltYAU3bMsJVobl6yeYERiSfesTlYkW3K3vvHxU/GIGPng
         QcwzG1K2XQzkjNzS6ACH5rf5yvLFC2YSVeWpfkKxbn6gNbO7jP1gySAnokokKr5TkQcp
         6+JHu7GZjOl7DJLemZLaSy022kABFdHGIkYPzVp7TfvjddQj6OlrWHf129z04TSIURZD
         zXhRRDfBrWK84mxHiODeR+T2Hsq152CVhX2l0S1bYLMt/5z8ChGaQ/EUfNv2TT1AWPvP
         0JolU341AL2Z5Ue7O04QTxIfzQaoKXcizXR4DWHKWQV3e2/Wq8tPFl4O1K3JPI2abGeH
         qx7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742119741; x=1742724541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lQudvlaOABMsiWuAfcQ9OoD9MZzMUxYD5xvQeBAhEEA=;
        b=ZY9/Q1UP3cLSujaYoMe8sno/YycVf9/ywYGknmcd8ONrzFTryXXx76rhA3n7EKUqUS
         xV+JQXxk890SlO3nJTX/Y6R24gN2tKyCZn+YDwiUN8/zJwpNlJPpjsFVFzN2X2cMDvYR
         n0LV1c58iyIowFf3J3nkNanxICV4jVF+BWqPGjObFAwh2E3RM3k/VIgBkbgEbP5axzKi
         ZuXucji19EXtTTB/gPkcB5hqbbng+tQhS4gyJUhb9mme1FYr9+OBdxA45bTGFQ8vdPmT
         gfGGdYoka06DdAq97h6pG/G4NVY9429dvrp9Xi63fav5C7uU2jnCiCEXAgNm6q7XGJRR
         k3VQ==
X-Gm-Message-State: AOJu0YzGM+ST0na28551j1T9KNk597GquoAiTMniEaO6jxQOboEB32JF
	ag2IAwbmDE3UlBjXn8kCjUDAzkSrZl0mcAUqAQvfx0tPZAO1fbtCD220EOK4
X-Gm-Gg: ASbGnctcs1sXFrRXA8sRFAivnsjr14SZN8hnh0Mr6HAHqfomZPwr6/Y3Zy5b1uKCtUG
	TK7d3Zdbb5is4T1BHHBSPd8RToAjAG5sxi0l0U+uuG86seMlZLgqqMbS30YOfZNpSInQKsXor0U
	ECgYA6krt+o8aC+aHhz4N3+heHbsv55ewLatMJQJl3sbohJuIzMefRixdTqyTxAuM2CZEk4UJw3
	4COPpkgpw8zpV/4I9745JZki1H+w97CXUTgwb+Sr0KynGysiTi7aLdesVwrD7INUXaJmWMOGs4x
	wG1QAcD8m/Fy8bbkX9Msm7FxCt50qyizzA4Mha4rN2WnT1xOYLSTx2S2Y2e2YHMOOaqru+yCm+M
	MT2oklpaDxxfYE2dEnlXebIXcEFRRoW5JNwfIUJJM2+Gx
X-Google-Smtp-Source: AGHT+IHkW/6TrpUfMvZ1LErZEuwopuMIMHU18H4KR9Hz7Czjgyrevt40WMvWdBZBst04G+3oo+WoPw==
X-Received: by 2002:a05:600c:4692:b0:43c:ef13:7e5e with SMTP id 5b1f17b1804b1-43d1ed0e53bmr87113225e9.26.1742119740923;
        Sun, 16 Mar 2025 03:09:00 -0700 (PDT)
From: Andrii Sultanov <sultanovandriy@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Andrii Sultanov <sultanovandriy@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 2/3] drivers: Change find_iommu_for_device function to take pci_sbdf_t, simplify code
Date: Sun, 16 Mar 2025 10:08:50 +0000
Message-ID: <47e9f0a75a8bce85af0e53c06c95c25b0a061e3e.1742063500.git.sultanovandriy@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1742063500.git.sultanovandriy@gmail.com>
References: <cover.1742063500.git.sultanovandriy@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Following a similar change to amd_iommu struct, change the
find_iommu_for_device function to take pci_sbdf_t as a single parameter.
This avoids splitting a single argument into two registers in the majority
of cases.

Bloat-o-meter reports (on top of the first patch in the series):
add/remove: 0/0 grow/shrink: 11/13 up/down: 90/-154 (-64)
Function                                     old     new   delta
amd_iommu_get_supported_ivhd_type             54      86     +32
parse_ivrs_table                            3955    3966     +11
amd_iommu_assign_device                      271     282     +11
__mon_lengths                               2928    2936      +8
update_intremap_entry_from_msi_msg           859     864      +5
iov_supports_xt                              270     275      +5
amd_setup_hpet_msi                           232     237      +5
amd_iommu_domain_destroy                      43      48      +5
find_iommu_for_device                        242     246      +4
amd_iommu_ioapic_update_ire                  572     575      +3
allocate_domain_resources                     82      83      +1
amd_iommu_read_ioapic_from_ire               347     344      -3
reassign_device                              843     838      -5
amd_iommu_remove_device                      352     347      -5
amd_iommu_get_reserved_device_memory         524     519      -5
amd_iommu_flush_iotlb                        359     354      -5
amd_iommu_add_device                         844     839      -5
amd_iommu_setup_domain_device               1478    1472      -6
build_info                                   752     744      -8
amd_iommu_detect_one_acpi                    886     876     -10
register_range_for_device                    297     281     -16
amd_iommu_msi_msg_update_ire                 472     448     -24
parse_ivmd_block                            1339    1312     -27
_hvm_dpci_msi_eoi                            168     133     -35

Signed-off-by: Andrii Sultanov <sultanovandriy@gmail.com>

---
> This avoids splitting a single argument into two registers
And adds a few conversions into a pci_sbdf_t... these are addressed further
in the series. - not part of the commit message in case said commit isn't taken.

Changes in V2:
* Split single commit into several patches
* Dropped brackets around &(iommu->sbdf) and &(sbdf)
* Dropped most of the hunk in _invalidate_all_devices - it was
  bloat-equivalent to the existing code - just convert with PCI_SBDF
  instead
* Dropped the hunk in get_intremap_requestor_id (iommu_intr.c) and
  amd_iommu_get_reserved_device_memory (iommu_map.c) as they were only
  increasing the code size.
* Kept "/* XXX */" where appropriate
* Fixed a slip-up in register_range_for_iommu_devices where iommu->sbdf
  replaced the usage of *different* seg and bdf.
---
 xen/drivers/passthrough/amd/iommu.h         |  2 +-
 xen/drivers/passthrough/amd/iommu_acpi.c    | 14 ++++-----
 xen/drivers/passthrough/amd/iommu_cmd.c     |  2 +-
 xen/drivers/passthrough/amd/iommu_init.c    |  4 +--
 xen/drivers/passthrough/amd/iommu_intr.c    | 20 ++++++-------
 xen/drivers/passthrough/amd/iommu_map.c     |  2 +-
 xen/drivers/passthrough/amd/pci_amd_iommu.c | 32 ++++++++++-----------
 7 files changed, 38 insertions(+), 38 deletions(-)

diff --git a/xen/drivers/passthrough/amd/iommu.h b/xen/drivers/passthrough/amd/iommu.h
index a30c8c97ea..a9e64b8304 100644
--- a/xen/drivers/passthrough/amd/iommu.h
+++ b/xen/drivers/passthrough/amd/iommu.h
@@ -246,7 +246,7 @@ void amd_iommu_flush_intremap(struct amd_iommu *iommu, uint16_t bdf);
 void amd_iommu_flush_all_caches(struct amd_iommu *iommu);
 
 /* find iommu for bdf */
-struct amd_iommu *find_iommu_for_device(int seg, int bdf);
+struct amd_iommu *find_iommu_for_device(pci_sbdf_t sbdf);
 
 /* interrupt remapping */
 bool cf_check iov_supports_xt(void);
diff --git a/xen/drivers/passthrough/amd/iommu_acpi.c b/xen/drivers/passthrough/amd/iommu_acpi.c
index 5bdbfb5ba8..ed5a3700c0 100644
--- a/xen/drivers/passthrough/amd/iommu_acpi.c
+++ b/xen/drivers/passthrough/amd/iommu_acpi.c
@@ -239,17 +239,17 @@ static int __init register_range_for_device(
     unsigned int bdf, paddr_t base, paddr_t limit,
     bool iw, bool ir, bool exclusion)
 {
-    int seg = 0; /* XXX */
-    struct ivrs_mappings *ivrs_mappings = get_ivrs_mappings(seg);
+    pci_sbdf_t sbdf = { .seg = 0 /* XXX */, .bdf = bdf };
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
+                       &sbdf);
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
+        if ( iommu != find_iommu_for_device(PCI_SBDF(iommu->seg, bdf)) )
             continue;
 
         req = get_ivrs_mappings(iommu->seg)[bdf].dte_requestor_id;
diff --git a/xen/drivers/passthrough/amd/iommu_cmd.c b/xen/drivers/passthrough/amd/iommu_cmd.c
index d7162e36d6..facc9d2f6d 100644
--- a/xen/drivers/passthrough/amd/iommu_cmd.c
+++ b/xen/drivers/passthrough/amd/iommu_cmd.c
@@ -288,7 +288,7 @@ void amd_iommu_flush_iotlb(u8 devfn, const struct pci_dev *pdev,
     if ( !pci_ats_enabled(pdev->seg, pdev->bus, pdev->devfn) )
         return;
 
-    iommu = find_iommu_for_device(pdev->seg, pdev->sbdf.bdf);
+    iommu = find_iommu_for_device(pdev->sbdf);
 
     if ( !iommu )
     {
diff --git a/xen/drivers/passthrough/amd/iommu_init.c b/xen/drivers/passthrough/amd/iommu_init.c
index ea930426be..01beea1d29 100644
--- a/xen/drivers/passthrough/amd/iommu_init.c
+++ b/xen/drivers/passthrough/amd/iommu_init.c
@@ -1540,13 +1540,13 @@ static void invalidate_all_domain_pages(void)
 static int cf_check _invalidate_all_devices(
     u16 seg, struct ivrs_mappings *ivrs_mappings)
 {
-    unsigned int bdf; 
+    unsigned int bdf;
     u16 req_id;
     struct amd_iommu *iommu;
 
     for ( bdf = 0; bdf < ivrs_bdf_entries; bdf++ )
     {
-        iommu = find_iommu_for_device(seg, bdf);
+        iommu = find_iommu_for_device(PCI_SBDF(seg, bdf));
         req_id = ivrs_mappings[bdf].dte_requestor_id;
         if ( iommu )
         {
diff --git a/xen/drivers/passthrough/amd/iommu_intr.c b/xen/drivers/passthrough/amd/iommu_intr.c
index 9abdc38053..4d7dc2fdb4 100644
--- a/xen/drivers/passthrough/amd/iommu_intr.c
+++ b/xen/drivers/passthrough/amd/iommu_intr.c
@@ -337,7 +337,7 @@ void cf_check amd_iommu_ioapic_update_ire(
     /* get device id of ioapic devices */
     bdf = ioapic_sbdf[idx].bdf;
     seg = ioapic_sbdf[idx].seg;
-    iommu = find_iommu_for_device(seg, bdf);
+    iommu = find_iommu_for_device(PCI_SBDF(seg, bdf));
     if ( !iommu )
     {
         AMD_IOMMU_WARN("failed to find IOMMU for IO-APIC @ %04x:%04x\n",
@@ -383,7 +383,7 @@ unsigned int cf_check amd_iommu_read_ioapic_from_ire(
 
     seg = ioapic_sbdf[idx].seg;
     bdf = ioapic_sbdf[idx].bdf;
-    iommu = find_iommu_for_device(seg, bdf);
+    iommu = find_iommu_for_device(PCI_SBDF(seg, bdf));
     if ( !iommu )
         return val;
     req_id = get_intremap_requestor_id(seg, bdf);
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
 
@@ -523,7 +523,7 @@ int cf_check amd_iommu_msi_msg_update_ire(
     bdf = pdev ? pdev->sbdf.bdf : hpet_sbdf.bdf;
     seg = pdev ? pdev->seg : hpet_sbdf.seg;
 
-    iommu = _find_iommu_for_device(seg, bdf);
+    iommu = _find_iommu_for_device(PCI_SBDF(seg, bdf));
     if ( IS_ERR_OR_NULL(iommu) )
         return PTR_ERR(iommu);
 
@@ -660,8 +660,8 @@ bool __init cf_check iov_supports_xt(void)
         if ( idx == MAX_IO_APICS )
             return false;
 
-        if ( !find_iommu_for_device(ioapic_sbdf[idx].seg,
-                                    ioapic_sbdf[idx].bdf) )
+        if ( !find_iommu_for_device(PCI_SBDF(ioapic_sbdf[idx].seg,
+                                             ioapic_sbdf[idx].bdf)) )
         {
             AMD_IOMMU_WARN("no IOMMU for IO-APIC %#x (ID %x)\n",
                            apic, IO_APIC_ID(apic));
@@ -690,7 +690,7 @@ int __init cf_check amd_setup_hpet_msi(struct msi_desc *msi_desc)
         return -ENODEV;
     }
 
-    iommu = find_iommu_for_device(hpet_sbdf.seg, hpet_sbdf.bdf);
+    iommu = find_iommu_for_device(PCI_SBDF(hpet_sbdf.seg, hpet_sbdf.bdf));
     if ( !iommu )
         return -ENXIO;
 
diff --git a/xen/drivers/passthrough/amd/iommu_map.c b/xen/drivers/passthrough/amd/iommu_map.c
index ea68edc0f2..48d6498868 100644
--- a/xen/drivers/passthrough/amd/iommu_map.c
+++ b/xen/drivers/passthrough/amd/iommu_map.c
@@ -717,7 +717,7 @@ int cf_check amd_iommu_get_reserved_device_memory(
             pcidevs_unlock();
 
             if ( pdev )
-                iommu = find_iommu_for_device(seg, bdf);
+                iommu = find_iommu_for_device(sbdf);
             if ( !iommu )
                 continue;
         }
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


