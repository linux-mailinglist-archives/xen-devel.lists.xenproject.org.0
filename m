Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E47CFA634F6
	for <lists+xen-devel@lfdr.de>; Sun, 16 Mar 2025 11:09:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.915998.1321213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ttkvb-000570-8s; Sun, 16 Mar 2025 10:09:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 915998.1321213; Sun, 16 Mar 2025 10:09:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ttkvb-00054Y-47; Sun, 16 Mar 2025 10:09:07 +0000
Received: by outflank-mailman (input) for mailman id 915998;
 Sun, 16 Mar 2025 10:09:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tZWB=WD=gmail.com=sultanovandriy@srs-se1.protection.inumbo.net>)
 id 1ttkvZ-0004LN-62
 for xen-devel@lists.xenproject.org; Sun, 16 Mar 2025 10:09:05 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b0b49b71-024e-11f0-9aba-95dc52dad729;
 Sun, 16 Mar 2025 11:09:04 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-43cf680d351so5798415e9.0
 for <xen-devel@lists.xenproject.org>; Sun, 16 Mar 2025 03:09:04 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92320-cmbg19-2-0-cust1786.5-4.cable.virginm.net. [82.13.70.251])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d1ffc4173sm73909045e9.20.2025.03.16.03.09.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Mar 2025 03:09:03 -0700 (PDT)
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
X-Inumbo-ID: b0b49b71-024e-11f0-9aba-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742119744; x=1742724544; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mEVyYuoMYyc0LPAkEpFNbjkJvih0jmG/eGzoOUR4EB0=;
        b=PHVTCBsqx9qF7q+3kljMwdmb1oFx9a8Neibi48TPOkdGh4kpzrPcbNq6yIIpZXHQrG
         Qwwutmm1LzO+Si5EkVxokWRAUcqh2v5J/BQ9UtMFx1Dyi8f29FIpr7nPu40QJZeN4e4o
         I4BxT05ePWpf2Gpcv53McJvMhbFqRiZJglJS1nFL812NBMD+hkOvsDDb4nBI8Wcp/K6H
         VRUiavjLodOQUwQehTF9hmW9ebeqEJc2JVjFcYrfZcElkb04fOr9pkLtUsSDnRSnBzNL
         u7gjeqbtd6oXUEOQUPQ0G4mjfC8KwkEUa7nWTITjq5zmg7bzE5joTnoCPtsn+u3MVB5R
         ECOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742119744; x=1742724544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mEVyYuoMYyc0LPAkEpFNbjkJvih0jmG/eGzoOUR4EB0=;
        b=Xh6RuggRkMVWaLvyk7VqBq+VRKSZnEg2Ys1+yFOZvRhOH6lTE4nmdmjbIbZHIPMICU
         5RKO4F3CXREET49ACQjj1xYfBQkT5HnFpZfaGnZ1BlUnzg7g8fkfwQGCn0/VGSlFWxZA
         yzvxiAtseXUkRghVrc89pIe6M69zXgqAOa1I9O3+WH//9/CZvDX6neZQ1Sw5NEM3I9a1
         0tdks8aH1FGk9w2CWOZ7HigwdS4ermVHngK82Edliz0XUEH9KVjvpkg17iDEF+b1SarJ
         R8U0qVaFAM7ejZ158oG4cLIIsi3tIcTi5FBPWs85kJmyTspjxHVNknAa+R3mVG/Ek+ub
         Hd1w==
X-Gm-Message-State: AOJu0YxM4Gd/4hYF210CixH76HUM/vDnbb36t0eXNP11tpEDeW2QPaBi
	Loz0gNhXpREXQwK4QozYOhNgkYuGePPHCa6lUkRcGIfv4EwJ8P+talRW8Tk2
X-Gm-Gg: ASbGnctjJSOwUjk2rPmHU4ThJi8B7tD/ziVnHCToAysye/vBJnsHTkxJ0D68OWE3ztR
	F7T7UeVZk6ps1CM+sJWkIUgYmtq2jjocEzLgt3DrcaCAj6huG+fhGB2BrxfFDewNrbCBOYW+eAK
	w+ZWonLCpAmlG11TCedxYYqVEEkqTK0qEn/aTFVmgAOZB1cJVGzNHYpB3s89+wZRV6gsqpnFfh5
	YzwyZ27WAUiB26bzdparC1dSvMMFKx+4FFLh2NSWt+6a0vhETVZ16Ud+NTxRtuXW42XKZo48mQD
	qmCB+em4dUj75U4DhQyrt6Lw/Fpic02hA1wIHGO2a4DqX8NVguBqgT0X4I6sYiVePZXGLRZY5r3
	CYLn9QJkDeK1bFaEG5gJtbXGC95HLhL49DT0lbecS3O8r
X-Google-Smtp-Source: AGHT+IHyOcmeSsZsAVwMVUQJfvSxbiBZNZbirfOYIi+P6G4xXpaB7sjruggr1LHhU+CHOdNTuw1SlA==
X-Received: by 2002:a05:600c:3151:b0:439:9434:4f3b with SMTP id 5b1f17b1804b1-43d1f1fc173mr88356915e9.8.1742119743366;
        Sun, 16 Mar 2025 03:09:03 -0700 (PDT)
From: Andrii Sultanov <sultanovandriy@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Andrii Sultanov <sultanovandriy@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 3/3] drivers: Make ioapic_sbdf and hpet_sbdf contain pci_sbdf_t
Date: Sun, 16 Mar 2025 10:08:51 +0000
Message-ID: <3dfb3e32d06f204f9eb2087ea0d570140c95feda.1742063500.git.sultanovandriy@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1742063500.git.sultanovandriy@gmail.com>
References: <cover.1742063500.git.sultanovandriy@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Following a similar change to amd_iommu struct, make two more structs
take pci_sbdf_t directly instead of seg and bdf separately. This lets us
drop several conversions from the latter to the former and simplifies
several comparisons and assignments.

Signed-off-by: Andrii Sultanov <sultanovandriy@gmail.com>

---

This particular commit does not have any effect on code size:
add/remove: 0/0 grow/shrink: 2/6 up/down: 96/-96 (0)
Function                                     old     new   delta
_einittext                                 22092   22156     +64
_hvm_dpci_msi_eoi                            133     165     +32
amd_iommu_detect_one_acpi                    876     868      -8
iov_supports_xt                              275     264     -11
amd_iommu_read_ioapic_from_ire               344     332     -12
amd_setup_hpet_msi                           237     224     -13
amd_iommu_ioapic_update_ire                  575     555     -20
amd_iommu_get_supported_ivhd_type             86      54     -32

So we don't have to take it - but imho it significantly simplifies
source code and makes it more readable.

Changes in V2:
* Split single commit into several patches
* Change the format specifier to %pp in amd_iommu_ioapic_update_ire
---
 xen/drivers/passthrough/amd/iommu.h      | 17 ++++++++--
 xen/drivers/passthrough/amd/iommu_intr.c | 40 +++++++++++-------------
 2 files changed, 34 insertions(+), 23 deletions(-)

diff --git a/xen/drivers/passthrough/amd/iommu.h b/xen/drivers/passthrough/amd/iommu.h
index a9e64b8304..6903b1bc5d 100644
--- a/xen/drivers/passthrough/amd/iommu.h
+++ b/xen/drivers/passthrough/amd/iommu.h
@@ -268,7 +268,13 @@ int cf_check amd_setup_hpet_msi(struct msi_desc *msi_desc);
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
@@ -279,7 +285,14 @@ unsigned int ioapic_id_to_index(unsigned int apic_id);
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
diff --git a/xen/drivers/passthrough/amd/iommu_intr.c b/xen/drivers/passthrough/amd/iommu_intr.c
index 4d7dc2fdb4..e31ab12b60 100644
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
@@ -690,7 +688,7 @@ int __init cf_check amd_setup_hpet_msi(struct msi_desc *msi_desc)
         return -ENODEV;
     }
 
-    iommu = find_iommu_for_device(PCI_SBDF(hpet_sbdf.seg, hpet_sbdf.bdf));
+    iommu = find_iommu_for_device(hpet_sbdf.sbdf);
     if ( !iommu )
         return -ENXIO;
 
-- 
2.48.1


