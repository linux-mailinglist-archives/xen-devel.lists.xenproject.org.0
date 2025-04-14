Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C6EA88C24
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 21:19:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.951280.1347387 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4PLF-0007al-7R; Mon, 14 Apr 2025 19:19:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 951280.1347387; Mon, 14 Apr 2025 19:19:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4PLF-0007VU-2n; Mon, 14 Apr 2025 19:19:37 +0000
Received: by outflank-mailman (input) for mailman id 951280;
 Mon, 14 Apr 2025 19:19:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Cm6X=XA=gmail.com=sultanovandriy@srs-se1.protection.inumbo.net>)
 id 1u4PLE-0007CT-1m
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 19:19:36 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 65d23c50-1965-11f0-9ffb-bf95429c2676;
 Mon, 14 Apr 2025 21:19:34 +0200 (CEST)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-39c1ef4ae3aso2900468f8f.1
 for <xen-devel@lists.xenproject.org>; Mon, 14 Apr 2025 12:19:34 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92320-cmbg19-2-0-cust1786.5-4.cable.virginm.net. [82.13.70.251])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f2338d7d8sm191595335e9.4.2025.04.14.12.19.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Apr 2025 12:19:32 -0700 (PDT)
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
X-Inumbo-ID: 65d23c50-1965-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744658373; x=1745263173; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U8fAlN7MedeJyXYROFCeGDxxaxouXin+yB8wL9eRK1Y=;
        b=l7ADo9j6C/1Nq/sv7ckGK4j1EA9BoNqh7MIZlmsxWnrTf8cbvsxIQ7e0CVNSx1W9Lh
         zfzqyQCARxBYB4z3X3E7h3L7EiSf7k3YuyvuAgkBESbfdrn5VVFKgaDDWkY6R9Rwe4gO
         wcXge4Bltv9zx1J0eTJbRUNmrN9FraNL6ciNeTZdxZlgieAclQMJu4beIZsQSUiiiOnA
         7cXUL01e4aDtREUO/2d4h7R2M6CPaaxKqeTf6wuHmP/S+85by3fkQqxQntTNrlu/NIhk
         X0onwTKmQFkFzMTpxqJkULTIxdnlscle1NBmMzQY7mExDl1d6awrO2gzeKX6LdJqA+Bd
         qU8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744658373; x=1745263173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U8fAlN7MedeJyXYROFCeGDxxaxouXin+yB8wL9eRK1Y=;
        b=J0W0QjN6fCKGXKWmBlV876sIpQabYE+e1uWvyxXDPGkJXEd/A6Q2Vrwwds2uHwPzjO
         VcohYwQ1bxZ3ZKI1fAxotRjpvaPQzgta4C705eNMk2Vm2apyxt1qCmMYMByL6mpRSj97
         /hTOI3/sMpr/41B2POWz0uUDCeiyA4wFmzxGC12ODauChUT/5SRidPLAkr/wd4rnLSCz
         jNnbY+vqASns7o+dCokb879+0JzB3tsXJsuSYH2q8OdUE0U2Mde0Bg9iNBedi3wCHvcO
         ADJkGjOhusxw8IZA0Gv1LnHq5psgHRayv8PAQVA0V85/MkN43+eVOiFbVg2BNm+CGo6H
         jXcg==
X-Gm-Message-State: AOJu0Yx/240EY/BcxDZLX+A5STBHJsnq+hd5tgWFrXNuMSGsjnXCiijo
	2VlzpQA0kxWEn5RMjgTawonvkBaMdK90YqzeoouO3oq4tbqSaCSs1uYgpRoIvTc=
X-Gm-Gg: ASbGncuDr1uWCxco1fB8W5A+eTo4Y81C0FasYGmwPUHkyrM8oPHVzDCA48Roli8bqWS
	dXhJ98rwtqGX7pqLqDFKM29SNffmIhYWaWiryBoufZT7Eaampp9/a/JKoqhuT+w4Iz3V8BUKMFk
	zGR7GNz2aZh15xjuKOzNNnSLv5QJm6HL5jMGARTDSInf9Vmnnp7yPyxyHtYNGK3cVe+MysE1qHq
	wrv8aSMVD9X7JcybMKxtsfi5vdcVWUtc6IAIUfwErYFged0MGsmzEHoUQYRqxzNTWpyM9TS/G70
	iHBOcEB+ktF+XuHK8zysCq223FevzXrd6oYkzGKC/fPXM/YY8xdaWIUR41MWPwS7angOgQkCuht
	PbqaFVxpl7mMS73KkYVsG3h9sAQXpwNgc36yaWrG8yJg=
X-Google-Smtp-Source: AGHT+IHgU/EFmtScILyYMFknO2qDxs0tw2UuG6kK1Duk9VV3AKU0mpJ0HnYJM3mdpB8UmiYTsrRpaA==
X-Received: by 2002:a5d:64e7:0:b0:39b:3c96:80df with SMTP id ffacd0b85a97d-39edc3057ddmr447971f8f.11.1744658372446;
        Mon, 14 Apr 2025 12:19:32 -0700 (PDT)
From: Andrii Sultanov <sultanovandriy@gmail.com>
X-Google-Original-From: Andrii Sultanov <andriy.sultanov@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Andrii Sultanov <sultanovandriy@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v4 2/3] drivers: Change find_iommu_for_device function to take pci_sbdf_t, simplify code
Date: Mon, 14 Apr 2025 20:19:17 +0100
Message-ID: <34125ae23ff54f55637f25afb7972374c87172cd.1744657012.git.andriy.sultanov@vates.tech>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1744657012.git.andriy.sultanov@vates.tech>
References: <cover.1744657012.git.andriy.sultanov@vates.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Andrii Sultanov <sultanovandriy@gmail.com>

Following a similar change to amd_iommu struct, change the
find_iommu_for_device function to take pci_sbdf_t as a single parameter.
This removes conversions in the majority of cases.

Bloat-o-meter reports (on top of the first patch in the series):
add/remove: 0/0 grow/shrink: 12/11 up/down: 95/-95 (0)
Function                                     old     new   delta
amd_iommu_get_supported_ivhd_type             54      86     +32
parse_ivrs_table                            3955    3966     +11
amd_iommu_assign_device                      271     282     +11
__mon_lengths                               2928    2936      +8
update_intremap_entry_from_msi_msg           859     864      +5
iov_supports_xt                              270     275      +5
amd_setup_hpet_msi                           232     237      +5
amd_iommu_domain_destroy                      46      51      +5
_hvm_dpci_msi_eoi                            155     160      +5
find_iommu_for_device                        242     246      +4
amd_iommu_ioapic_update_ire                  572     575      +3
allocate_domain_resources                     82      83      +1
amd_iommu_read_ioapic_from_ire               347     344      -3
reassign_device                              843     838      -5
amd_iommu_remove_device                      352     347      -5
amd_iommu_get_reserved_device_memory         521     516      -5
amd_iommu_flush_iotlb                        359     354      -5
amd_iommu_add_device                         844     839      -5
amd_iommu_setup_domain_device               1478    1472      -6
build_info                                   752     744      -8
amd_iommu_detect_one_acpi                    886     876     -10
register_range_for_device                    297     281     -16
parse_ivmd_block                            1339    1312     -27

Signed-off-by: Andrii Sultanov <sultanovandriy@gmail.com>

Acked-by: Jan Beulich <jbeulich@suse.com>

---
Changes in V4:
* After amendments to the previous commit which increased improvements
  there, this commit now does not improve code size anymore (but still
  simplifies code), so I've updated the bloat-o-meter report.

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
 xen/drivers/passthrough/amd/iommu_acpi.c    | 14 +++++-----
 xen/drivers/passthrough/amd/iommu_cmd.c     |  2 +-
 xen/drivers/passthrough/amd/iommu_init.c    |  4 +--
 xen/drivers/passthrough/amd/iommu_intr.c    | 17 ++++++------
 xen/drivers/passthrough/amd/iommu_map.c     |  2 +-
 xen/drivers/passthrough/amd/pci_amd_iommu.c | 30 ++++++++++-----------
 7 files changed, 35 insertions(+), 36 deletions(-)

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
index eefd626161..6b80c57f44 100644
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
index a7347fcbad..16075cd5a1 100644
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
@@ -495,16 +495,15 @@ static int update_intremap_entry_from_msi_msg(
     return fresh;
 }
 
-static struct amd_iommu *_find_iommu_for_device(int seg, int bdf)
+static struct amd_iommu *_find_iommu_for_device(pci_sbdf_t sbdf)
 {
     struct amd_iommu *iommu;
-    pci_sbdf_t sbdf = PCI_SBDF(seg, bdf);
 
     for_each_amd_iommu ( iommu )
         if ( iommu->sbdf.sbdf == sbdf.sbdf )
             return NULL;
 
-    iommu = find_iommu_for_device(seg, bdf);
+    iommu = find_iommu_for_device(sbdf);
     if ( iommu )
         return iommu;
 
@@ -524,7 +523,7 @@ int cf_check amd_iommu_msi_msg_update_ire(
     bdf = pdev ? pdev->sbdf.bdf : hpet_sbdf.bdf;
     seg = pdev ? pdev->seg : hpet_sbdf.seg;
 
-    iommu = _find_iommu_for_device(seg, bdf);
+    iommu = _find_iommu_for_device(PCI_SBDF(seg, bdf));
     if ( IS_ERR_OR_NULL(iommu) )
         return PTR_ERR(iommu);
 
@@ -661,8 +660,8 @@ bool __init cf_check iov_supports_xt(void)
         if ( idx == MAX_IO_APICS )
             return false;
 
-        if ( !find_iommu_for_device(ioapic_sbdf[idx].seg,
-                                    ioapic_sbdf[idx].bdf) )
+        if ( !find_iommu_for_device(PCI_SBDF(ioapic_sbdf[idx].seg,
+                                             ioapic_sbdf[idx].bdf)) )
         {
             AMD_IOMMU_WARN("no IOMMU for IO-APIC %#x (ID %x)\n",
                            apic, IO_APIC_ID(apic));
@@ -691,7 +690,7 @@ int __init cf_check amd_setup_hpet_msi(struct msi_desc *msi_desc)
         return -ENODEV;
     }
 
-    iommu = find_iommu_for_device(hpet_sbdf.seg, hpet_sbdf.bdf);
+    iommu = find_iommu_for_device(PCI_SBDF(hpet_sbdf.seg, hpet_sbdf.bdf));
     if ( !iommu )
         return -ENXIO;
 
diff --git a/xen/drivers/passthrough/amd/iommu_map.c b/xen/drivers/passthrough/amd/iommu_map.c
index d28c475650..320a2dc64c 100644
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
index 6b58e3380b..3a14770855 100644
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
@@ -581,7 +581,7 @@ static int cf_check amd_iommu_add_device(u8 devfn, struct pci_dev *pdev)
         if ( pdev->sbdf.sbdf == iommu->sbdf.sbdf )
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


