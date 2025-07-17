Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B8C4B086BA
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 09:32:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1046274.1416600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucJ5v-0004R3-Hc; Thu, 17 Jul 2025 07:31:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1046274.1416600; Thu, 17 Jul 2025 07:31:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucJ5v-0004Oh-DM; Thu, 17 Jul 2025 07:31:55 +0000
Received: by outflank-mailman (input) for mailman id 1046274;
 Thu, 17 Jul 2025 07:31:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Yum=Z6=gmail.com=sultanovandriy@srs-se1.protection.inumbo.net>)
 id 1ucJ5t-0004NF-PZ
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 07:31:53 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1afde8ba-62e0-11f0-b894-0df219b8e170;
 Thu, 17 Jul 2025 09:31:51 +0200 (CEST)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-45619d70c72so14397205e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 17 Jul 2025 00:31:51 -0700 (PDT)
Received: from pc (cpc92320-cmbg19-2-0-cust1786.5-4.cable.virginm.net.
 [82.13.70.251]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b5e8dc201asm19792460f8f.22.2025.07.17.00.31.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jul 2025 00:31:49 -0700 (PDT)
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
X-Inumbo-ID: 1afde8ba-62e0-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752737511; x=1753342311; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fcfoiUYIVjl/D0Ywq9KbeNKGyLzp30Ote+u9ohhrmSU=;
        b=E+vA807oRtyFKU834ZuPIe+suj7w935NdWOSFresbm9secVe0E+KB4xawElTsIbn6g
         FRGHrU5YBCbSbUdZpONG16P+9BZLO1Ly5OWrMu7Uc+sCwDgrXh7Wk8tqX3rXvyGKIeIK
         hAukzdQxoEQMNLvQGbCZc5W6nEHE4l+/ScbahH7Z9sFSOL9KCI+qXQhHOTXbbQFWpTrd
         +Oy42rk5IWkXY1z5L/TQMw+vHrEbwgrva/CYGM7sjSS7zMQbd33gXrcQtIKE5bBRPaIX
         0LXXy6ztrSCRWie64Nm3Y1T+O+ytV45NFScoUIfKCvNGs4ugO/JUUKxnHNmeppWNTaaC
         LWYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752737511; x=1753342311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fcfoiUYIVjl/D0Ywq9KbeNKGyLzp30Ote+u9ohhrmSU=;
        b=l4I0g5fGfJa/AjrwIeTyJ/aLDlMonC3+Xu80Y78bULdT0B7j2zg9gCGMhyGc7ioIqg
         wQM4mYciQ/SjDxS+G79L/ImX/oJFTOZGCVRCOJ37GPQFVNNKHLw/Y76DPrT/mQ05hm78
         IcXCnPqFhTAYvQStIhGImGXDdlL711dUnMfFEMI1IBJgkpfLAXl1GPa8Zo/7qT2lURg7
         CxItnF41HaMMEjkOWgDUsdFFXHeQyn11w6GmiohZnP3lw8hyFCH+nRA5+H+uykRTXUND
         XfAHGsCHsaT2gERY6X3UBIaXSJhUIyd1pkfmol59Q+KkBYihYXumWxVU9efVcHpZD/H1
         NBTg==
X-Gm-Message-State: AOJu0YxbpU6XWUYmYXvoKZboHkq8hdpCUyO/568UmlbKdjTAWo3hZniv
	oEb8mSb1VRdd83vMYBqmXwEDzoIRw1VZ2rZTLSC0VOrsUWsYsKgRjGxPSKaHdkgk
X-Gm-Gg: ASbGnctuMH2xSNZI3oG9bXIuuIKzWuCjZTTatHkf+E/GrvJ4EuP/7Gq/cZVBAYpIttI
	dZzlZFZ4/tR3Ugh01lQ9YdmilNm+1GS/Ap7o8NfxxmWTQpl7Ph79vp/QKXnm6yYELMskJXW4OX3
	lSJObp7M1ed1dOZ/6s/i67mz7VM9ry4Wz3TBMDakK8wEDEo4q9Kul3CZCKQDPGW1v8nilyrK8w0
	2yLNCE0R3akZNUpPZ+QbuiDNdrY0vfAchPAj2Ujj0NTiO7Ih9NA87SReDI1E3czDgN23oyKuGg+
	7MUOyRy/GXHE0aeEpsxyREon5fw+PaALQsnDcheD1nK3+j2c7iMfAoX7+XQMeNmgjdj35C+eKDb
	khDqRuGucURDtodUnZAsQv/wdH9he1H9IRk9a4omp1XjDbVjx0q1kehCSbn19dgbEbyLr0dIk
X-Google-Smtp-Source: AGHT+IF3hlqeQXuWHBqiWGN3+xcZxUMYETb8myDtKsSXMDI+JdEAQVruwFYaqQ1uPpLUkAW1uMBpEw==
X-Received: by 2002:a5d:64c4:0:b0:3a4:e231:8632 with SMTP id ffacd0b85a97d-3b613abe2c2mr1896604f8f.12.1752737510249;
        Thu, 17 Jul 2025 00:31:50 -0700 (PDT)
From: Andrii Sultanov <sultanovandriy@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Andrii Sultanov <sultanovandriy@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Denis Mukhin <dmukhin@ford.com>
Subject: [PATCH v5 2/3] drivers: Change find_iommu_for_device function to take pci_sbdf_t, simplify code
Date: Thu, 17 Jul 2025 08:31:26 +0100
Message-ID: <cb7096cc774f8288d26e3ddb51eed4b9046ad1bd.1752736989.git.andriy.sultanov@vates.tech>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1752736989.git.andriy.sultanov@vates.tech>
References: <cover.1752736989.git.andriy.sultanov@vates.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
Reviewed-by: Denis Mukhin <dmukhin@ford.com>

---
Changes in V5:
* Added a Reviewed-by tag

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
index 04d6e365cb..a9c5432e86 100644
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
index 7ac07ba77e..25bf25904e 100644
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


