Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41448A677E3
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 16:32:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.919332.1323837 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuYv9-00030D-Pm; Tue, 18 Mar 2025 15:31:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 919332.1323837; Tue, 18 Mar 2025 15:31:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuYv9-0002yC-M2; Tue, 18 Mar 2025 15:31:59 +0000
Received: by outflank-mailman (input) for mailman id 919332;
 Tue, 18 Mar 2025 15:31:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Po+=WF=gmail.com=sultanovandriy@srs-se1.protection.inumbo.net>)
 id 1tuYv8-0001q5-A9
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 15:31:58 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 203a72a3-040e-11f0-9abb-95dc52dad729;
 Tue, 18 Mar 2025 16:31:56 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4394345e4d5so25231345e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Mar 2025 08:31:56 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92320-cmbg19-2-0-cust1786.5-4.cable.virginm.net. [82.13.70.251])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d1ffbcf12sm135384415e9.12.2025.03.18.08.31.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Mar 2025 08:31:54 -0700 (PDT)
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
X-Inumbo-ID: 203a72a3-040e-11f0-9abb-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742311915; x=1742916715; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eT8CP/qhMWkEmW+NuFuwZ5+end+wYTik2LbAEHOmNAc=;
        b=gQjHFaUkPDTdlGdAnjJpBL4exyHlN/74EVOLBg8y4C+2wGuEj1rgCRRY9aPv+9Vsd2
         p0IXayQGw4MvAE7cgiPDBeP6HEzHCVy2zO0u6m3jOZtANfR6FqRCQ2ZdgHLwmIasLH3n
         MYZo6ChaDDZzEEjyF3wTZ1vmMRxwgjkxMXgsd7sv3OBxBep4fnrT5d8toYHDJNKjoX5O
         gGRrwAdea19QmowLMoqJE/STan+J0LlV2yprl2CA8BrJXb9F+zpfQAs6ZKHhjK/XO/eW
         xRjNeBpX/NAfT1oQR/MztYePZ5F0Od5OEop5Qr7gJBB3xg52RQt8SvlvVspvqn+342YM
         1qfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742311915; x=1742916715;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eT8CP/qhMWkEmW+NuFuwZ5+end+wYTik2LbAEHOmNAc=;
        b=H5zMD02QqYvQqy9zALICHuZTq5lW+4p8Ft843/DmzvPcJoSXr7DuJoSPdv+15MqK2N
         LDWebOS+/BI4XdKe149OPoyB29jwutMxFgpTmcXc5g8cUoPqdemdwcCV8z1/ZPK49GKn
         yOG/L9LbwBXlIlFsset798jczpt+oANMtT9RURMXCxeuKkJRUt8YaIms1Cira2DMJXrh
         kpSW18maPKd43fFeF6KIdj7m5Wg0nLRnHnTgaXVcFoAtdAD1ACqVGsGFalIlz6WUmKBP
         CZns6vtj1mecFpdI/DUinZucWCa2EbivqNLoKe/wls6FAthr9kooY0rOdzVd9zpTAdgd
         qjUw==
X-Gm-Message-State: AOJu0YzCv5bvd7Avs1s6ez34bq7QqmboUCJqVM2Iusizcan1rtm03QJj
	HFh5g4UQAbBQSFgmA7VTM/nU3MCrKdbCQ+FJbQObTRuMlgddTl+9fg5FxmYu
X-Gm-Gg: ASbGncunPMK9FmfVT3QGxqYDBcuVUMtiow7dq9Ttc/X4JSSsu/hWuIQS+G21iDvrigR
	ZAAEi7BTRqcJ3qBZ9R+b62O8fbItjZByx4LOLbOGlO1ByAVrD6r1uG8Sd0O6UPxiiyvPbJUwRud
	2AOFLWJdGoqmSEc6ueWV1jEXb+6P+zAL7jWsMsGhCTJC6kIr5Q1EEzQ2FHRgKzqLWAdVVhdu9hu
	U3HqnMV0WVhJMauLb22CABHX331/qDPb8y/TO9OIe28hIpjLLTaAFKGDYGeKaAg1fwDchKIEmr9
	5GF8RDIN1PHhQ8Y6Xb6vHlWRS/Ja3ed+OfwKw6DJVgss5grD+u6pgdrc3Gnm9X7N0MnrLJ3ycX3
	lvJH6lpl8gU+uEqYNRLUW5LsU6xXlsctzcfxdi/I6K13EpbzXKozb/48=
X-Google-Smtp-Source: AGHT+IGUg21f2AvL8GMRPBAHmPN0QHUhXcrhkVol8zbFUxLayeoyuuEQKaCgOz1jSrjp3f9UHru9Ng==
X-Received: by 2002:a05:600c:1da4:b0:43c:f16a:641e with SMTP id 5b1f17b1804b1-43d3b950117mr27128775e9.6.1742311914721;
        Tue, 18 Mar 2025 08:31:54 -0700 (PDT)
From: Andrii Sultanov <sultanovandriy@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Andrii Sultanov <sultanovandriy@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 2/3] drivers: Change find_iommu_for_device function to take pci_sbdf_t, simplify code
Date: Tue, 18 Mar 2025 15:30:22 +0000
Message-ID: <3a9690d545547a1b39b20e256613308a814e2c27.1742311401.git.sultanovandriy@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1742311401.git.sultanovandriy@gmail.com>
References: <cover.1742311401.git.sultanovandriy@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Following a similar change to amd_iommu struct, change the
find_iommu_for_device function to take pci_sbdf_t as a single parameter.
This removes conversions in the majority of cases,

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

Acked-by: Jan Beulich <jbeulich@suse.com>

---
Changes in V3:
* Amended commit message
* As the previous patch dropped the aliasing of seg and bdf, renamed users of
  amd_iommu as appropriate.

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
index ba541f7943..2599800e6a 100644
--- a/xen/drivers/passthrough/amd/iommu.h
+++ b/xen/drivers/passthrough/amd/iommu.h
@@ -240,7 +240,7 @@ void amd_iommu_flush_intremap(struct amd_iommu *iommu, uint16_t bdf);
 void amd_iommu_flush_all_caches(struct amd_iommu *iommu);
 
 /* find iommu for bdf */
-struct amd_iommu *find_iommu_for_device(int seg, int bdf);
+struct amd_iommu *find_iommu_for_device(pci_sbdf_t sbdf);
 
 /* interrupt remapping */
 bool cf_check iov_supports_xt(void);
diff --git a/xen/drivers/passthrough/amd/iommu_acpi.c b/xen/drivers/passthrough/amd/iommu_acpi.c
index 025d9be40f..9e4fbee953 100644
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
-        if ( iommu != find_iommu_for_device(iommu->sbdf.seg, bdf) )
+        if ( iommu != find_iommu_for_device(PCI_SBDF(iommu->sbdf.seg, bdf)) )
             continue;
 
         req = get_ivrs_mappings(iommu->sbdf.seg)[bdf].dte_requestor_id;
diff --git a/xen/drivers/passthrough/amd/iommu_cmd.c b/xen/drivers/passthrough/amd/iommu_cmd.c
index 4defa0a44d..e007a4caca 100644
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
index 58d657060a..3f6d2f5db5 100644
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
index 754e9051dc..b894851ebf 100644
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
-        if ( iommu->sbdf.seg == seg && iommu->sbdf.bdf == bdf )
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
index 78bde0aeb6..8463c98abf 100644
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
index 55218d9a1d..3a14770855 100644
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
 
-        if ( ivrs_mappings[bd0].iommu && ivrs_mappings[bd0].iommu->sbdf.bdf != bdf )
+        if ( ivrs_mappings[bd0].iommu && ivrs_mappings[bd0].iommu->sbdf.bdf != sbdf.bdf )
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
-        if ( pdev->seg == iommu->sbdf.seg && pdev->sbdf.bdf == iommu->sbdf.bdf )
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
2.49.0


