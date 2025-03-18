Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89DB2A677E1
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 16:32:06 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.919333.1323847 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuYvB-0003H5-2b; Tue, 18 Mar 2025 15:32:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 919333.1323847; Tue, 18 Mar 2025 15:32:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuYvA-0003Dv-UW; Tue, 18 Mar 2025 15:32:00 +0000
Received: by outflank-mailman (input) for mailman id 919333;
 Tue, 18 Mar 2025 15:31:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Po+=WF=gmail.com=sultanovandriy@srs-se1.protection.inumbo.net>)
 id 1tuYv9-0001ML-Hx
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 15:31:59 +0000
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [2a00:1450:4864:20::331])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 20fa0c3d-040e-11f0-9899-31a8f345e629;
 Tue, 18 Mar 2025 16:31:58 +0100 (CET)
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-43cf680d351so19404645e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Mar 2025 08:31:57 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92320-cmbg19-2-0-cust1786.5-4.cable.virginm.net. [82.13.70.251])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d1ffbcf12sm135384415e9.12.2025.03.18.08.31.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Mar 2025 08:31:55 -0700 (PDT)
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
X-Inumbo-ID: 20fa0c3d-040e-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742311917; x=1742916717; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4AbE1blNd+/whSggpKdr+EhB2N/B1VEMWE2Q8cWiM14=;
        b=bpoeTOGk6MU0qNs3BSMxCOHmVy8q76v/2qSEfQDYYvBq4HBeRb+WbSvFDh7V4ku90Q
         NKSp5AP7eH4mAGfgnT5oOTc8M7Ry3WpJog4/GrRqNs77LK0IDzSC9kisFK8K1EMZkopC
         c/zlevGFWsnoOjt2NOw8D/zaaV04NDl7McwQnNe7q63W7SJ1UWu+A2TEp7Vpd6qsLq/z
         SSLMM4fziR0VOmPTi5YXobNXj89HdJ6qsA942Mw6ZrPt3SPd4KjQHJ9zSkO0mdW3tB0P
         jZu7EtcuISY0/hOeVwE0p0rGCbS3lPQ5yTKS2S0WEMXw7+sADgjXB2qtnzXZwPWV5EAv
         7X6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742311917; x=1742916717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4AbE1blNd+/whSggpKdr+EhB2N/B1VEMWE2Q8cWiM14=;
        b=eW1bGLp7jusSWetpIc9cB2F118ET8drYC3nlY1WwAGAKZys4BBtKuf6D+Am6npe80j
         tbBGYaLCMP6cs31dm4CfwpySGy02cQ6Eoct7Ob2ex8IUvaWbJI0WNc5rEOW1Mx86QCj0
         b8yx3uaMfeyV64+mqxy67BWSy/Z9J5asNJ2jgbg78EQ27yNfDTgBpsHeUOW29GcPvCO+
         OTJAdsuxWXSkpW+Zb9yg9/mi9NOfU6GbsyfWrRJSr+eQjrw5xVSyTPx6Ndy+dCKqz+SN
         Z+v6Ich1V5mR1Fx+oLX3zipGU/iY5r67u8sexUtqCMoUgzyTnBkXvylI2MfpNtW13p2w
         T+gw==
X-Gm-Message-State: AOJu0YykDoSLpNvu07DR5eYx2Vjb7JI/8cd/CvntDWhkhkJrwvgyKYZm
	bxSqJNNpLWZk6DLpMw9WtdP5kOWWXMrwMlQIRc66/0yjcpWWVvTROhDJ4hF2
X-Gm-Gg: ASbGncuMFTBWGjGc1P+fWuNBuRLRqBA04SqYEzmXrU/7VTONP5cEEV6sjInSFKK2PuZ
	2pRdw217zm5YerXEqjxSENLCk95amK24W+6TCzsqelf0ZVNVgz8G9YWTSrQinf3JpMtxQQs61eU
	T7zDhsSgV/t1WzeIFy7nTBzKM8UOhxtbhpbAE3bQnuztAmEZel8Ho6qxqcl3qTNsneiqiDecsES
	L5QeBHV1pAUPVUsdMhIlv77XFuY0TxQnwsqcgWnSDscm0yzwRGgLyDzoIRg3k7EPJRaYRwTrVMt
	v2cl/bfjeJ8BZBlrrlAk9+/vhwZdE5+WV06EnQKMX9DrGSf46xBmh95rLVGzGsR9+wv8BE86qap
	/2Z6tPVYExi/4Kz5tv7N1OMCRYc/knozlaupFqalnUra9
X-Google-Smtp-Source: AGHT+IE32+Os7WytfIYeqSjyA3VVAbO1ykDTsOHE3RP5XQ3AQDSC+bYhSK6jQy9gNurWLWEx27VgYw==
X-Received: by 2002:a05:600c:4c29:b0:43d:174:2668 with SMTP id 5b1f17b1804b1-43d3b7ce106mr22493785e9.0.1742311916666;
        Tue, 18 Mar 2025 08:31:56 -0700 (PDT)
From: Andrii Sultanov <sultanovandriy@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Andrii Sultanov <sultanovandriy@gmail.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v3 3/3] drivers: Make ioapic_sbdf and hpet_sbdf contain pci_sbdf_t
Date: Tue, 18 Mar 2025 15:30:23 +0000
Message-ID: <06e7126700f1bd8a0db5199209a275cf2b1e09f2.1742311401.git.sultanovandriy@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1742311401.git.sultanovandriy@gmail.com>
References: <cover.1742311401.git.sultanovandriy@gmail.com>
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

Changes in V3:
* Dropped aliasing of seg and bdf, renamed users.

Changes in V2:
* Split single commit into several patches
* Change the format specifier to %pp in amd_iommu_ioapic_update_ire
---
 xen/drivers/passthrough/amd/iommu.h      |  5 +--
 xen/drivers/passthrough/amd/iommu_acpi.c | 28 +++++++--------
 xen/drivers/passthrough/amd/iommu_intr.c | 44 +++++++++++-------------
 3 files changed, 38 insertions(+), 39 deletions(-)

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
index 9e4fbee953..bb1eba2aa7 100644
--- a/xen/drivers/passthrough/amd/iommu_acpi.c
+++ b/xen/drivers/passthrough/amd/iommu_acpi.c
@@ -707,8 +707,8 @@ static int __init cf_check parse_ivrs_ioapic(const char *str)
         }
     }
 
-    ioapic_sbdf[idx].bdf = PCI_BDF(bus, dev, func);
-    ioapic_sbdf[idx].seg = seg;
+    ioapic_sbdf[idx].sbdf.bdf = PCI_BDF(bus, dev, func);
+    ioapic_sbdf[idx].sbdf.seg = seg;
     ioapic_sbdf[idx].id = id;
     ioapic_sbdf[idx].cmdline = true;
 
@@ -734,8 +734,8 @@ static int __init cf_check parse_ivrs_hpet(const char *str)
         return -EINVAL;
 
     hpet_sbdf.id = id;
-    hpet_sbdf.bdf = PCI_BDF(bus, dev, func);
-    hpet_sbdf.seg = seg;
+    hpet_sbdf.sbdf.bdf = PCI_BDF(bus, dev, func);
+    hpet_sbdf.sbdf.seg = seg;
     hpet_sbdf.init = HPET_CMDL;
 
     return 0;
@@ -780,8 +780,8 @@ static u16 __init parse_ivhd_device_special(
          */
         for ( idx = 0; idx < nr_ioapic_sbdf; idx++ )
         {
-            if ( ioapic_sbdf[idx].bdf == bdf &&
-                 ioapic_sbdf[idx].seg == seg &&
+            if ( ioapic_sbdf[idx].sbdf.bdf == bdf &&
+                 ioapic_sbdf[idx].sbdf.seg == seg &&
                  ioapic_sbdf[idx].cmdline )
                 break;
         }
@@ -805,8 +805,8 @@ static u16 __init parse_ivhd_device_special(
                                 special->handle);
             else if ( idx != MAX_IO_APICS && ioapic_sbdf[idx].pin_2_idx )
             {
-                if ( ioapic_sbdf[idx].bdf == bdf &&
-                     ioapic_sbdf[idx].seg == seg )
+                if ( ioapic_sbdf[idx].sbdf.bdf == bdf &&
+                     ioapic_sbdf[idx].sbdf.seg == seg )
                     AMD_IOMMU_WARN("IVHD: duplicate IO-APIC %#x entries\n",
                                     special->handle);
                 else
@@ -827,8 +827,8 @@ static u16 __init parse_ivhd_device_special(
                 }
 
                 /* set device id of ioapic */
-                ioapic_sbdf[idx].bdf = bdf;
-                ioapic_sbdf[idx].seg = seg;
+                ioapic_sbdf[idx].sbdf.bdf = bdf;
+                ioapic_sbdf[idx].sbdf.seg = seg;
                 ioapic_sbdf[idx].id = special->handle;
 
                 ioapic_sbdf[idx].pin_2_idx = xmalloc_array(
@@ -867,8 +867,8 @@ static u16 __init parse_ivhd_device_special(
         case HPET_NONE:
             /* set device id of hpet */
             hpet_sbdf.id = special->handle;
-            hpet_sbdf.bdf = bdf;
-            hpet_sbdf.seg = seg;
+            hpet_sbdf.sbdf.bdf = bdf;
+            hpet_sbdf.sbdf.seg = seg;
             hpet_sbdf.init = HPET_IVHD;
             break;
         default:
@@ -1139,9 +1139,9 @@ static int __init cf_check parse_ivrs_table(struct acpi_table_header *table)
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
index b894851ebf..b788675be2 100644
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


