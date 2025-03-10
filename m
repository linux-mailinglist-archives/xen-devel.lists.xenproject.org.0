Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5B0A5907B
	for <lists+xen-devel@lfdr.de>; Mon, 10 Mar 2025 10:57:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.906361.1313813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trZtA-0001X7-CU; Mon, 10 Mar 2025 09:57:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 906361.1313813; Mon, 10 Mar 2025 09:57:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trZtA-0001Vd-9c; Mon, 10 Mar 2025 09:57:36 +0000
Received: by outflank-mailman (input) for mailman id 906361;
 Mon, 10 Mar 2025 09:57:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B6N5=V5=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1trZt8-0001Pa-Oj
 for xen-devel@lists.xenproject.org; Mon, 10 Mar 2025 09:57:34 +0000
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [2607:f8b0:4864:20::1033])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1591fb98-fd96-11ef-9898-31a8f345e629;
 Mon, 10 Mar 2025 10:57:32 +0100 (CET)
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-2fea8d8c322so7981905a91.2
 for <xen-devel@lists.xenproject.org>; Mon, 10 Mar 2025 02:57:32 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 98e67ed59e1d1-2ff69374942sm7544170a91.29.2025.03.10.02.57.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Mar 2025 02:57:30 -0700 (PDT)
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
X-Inumbo-ID: 1591fb98-fd96-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741600651; x=1742205451; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3vMmRQt2W0c82sFmb3uw//eAKUSioCEGn4rkW7R8oOE=;
        b=g9ucUPf+VQ9SgimjTF/1hFRwupAQW0nY8waGoQvgUbOFcKPQr2klrR3nmhdgjBR/ZW
         zQZ5cpuVMOWZY1lkasPP/SXu6Mc8xAlFgoDjm8N13BoDVxJxqQ1K2YBwlePwzxrvLKrp
         9d4y3UdhCL5bbBTBKNCqiavMyh+hzx4EpzL9g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741600651; x=1742205451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3vMmRQt2W0c82sFmb3uw//eAKUSioCEGn4rkW7R8oOE=;
        b=byfALLFQAUsZcG/y6YyQz8PKpCG9yWeIuYZ+A+1C5pyb0n78wu+rmVK+L9zIDmafO+
         X6lr6rqb8MKMKpQPmclCwbvDkT9IixpoAvRLVJo04qgSp1p8cY2RA0n4qrPIY3Ud0sd0
         qLhlms4H0u8BVnbRgFs/aXeAs/Vt5bZzZPjGCjED5BOwfBcZXSBsuaPiGi/pX5iMnIjW
         GSdaaGUP6O1Jf0AIIAo6AP26OlC4zNowuukkG78STdkcTsBWCz0a53kvfC0U26lnKtGJ
         p24UqVCa1V3PpA0hDtpTKG1tuPplPzPt/A7i/MbzRqyTiglc0XLhXITzUIvWhCIdCx8E
         TPww==
X-Gm-Message-State: AOJu0YxtdOKu0HqZ0yHmu4EJzZeZzngozC/saOVc/2G1dTpqDa54buCQ
	PLvGUXDWMaaBOe+s43xorQhyKRNHDanK9lrZomej7HWdJ2xQ5DwWvYw4I2Xj4MbbDy18nDFTIfb
	v
X-Gm-Gg: ASbGncvKCpuTNFvdBXEUgMyKYwOgrHHxwCZ7yydZCw3so9LhdLAuzcKMdlVxkC5V7ek
	vsQUb7ORP3Mr6JJ6yvBLhQWJioJqQ3L8YTeqWF49wZX77/SwY6hXOutjnHFb/mHciO3YY+dXN2h
	hnaU3d4xlZrYgAJPGMtnoLbWfQHEVHYnVjBO7hj7KMW/KkFi2daaiGmYA/xSOrSVHDRXlvk2aMd
	HTnG1XTDsI7WVuyJFSN0mXifH/medyZXb6aCkP7FhGc/I9ruD0HoqqXJj78SpKyPONrFPVhBUpz
	W1iZ6CzuGFdVL2TRIjY8CnqpmHOWir8zDDyMqu/pD+jLmSiV/PDy3/c=
X-Google-Smtp-Source: AGHT+IGHZnZOng9a6hrpb9KDyeYY85ETRk4xD2Q2Cy2VUO6LRimy5CPZUaNacvgjRjaKT73MbMPOpQ==
X-Received: by 2002:a17:90b:2fc5:b0:2ee:fa0c:cebc with SMTP id 98e67ed59e1d1-2ff7ce949d2mr21089443a91.20.1741600651066;
        Mon, 10 Mar 2025 02:57:31 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH v3 2/2] x86/iommu: avoid MSI address and data writes if IRT index hasn't changed
Date: Mon, 10 Mar 2025 10:55:35 +0100
Message-ID: <20250310095535.46033-3-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250310095535.46033-1-roger.pau@citrix.com>
References: <20250310095535.46033-1-roger.pau@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Attempt to reduce the MSI entry writes, and the associated checking whether
memory decoding and MSI-X is enabled for the PCI device, when the MSI data
hasn't changed.

When using Interrupt Remapping the MSI entry will contain an index into
the remapping table, and it's in such remapping table where the MSI vector
and destination CPU is stored.  As such, when using interrupt remapping,
changes to the interrupt affinity shouldn't result in changes to the MSI
entry, and the MSI entry update can be avoided.

Signal from the IOMMU update_ire_from_msi hook whether the MSI data or
address fields have changed, and thus need writing to the device registers.
Such signaling is done by returning 1 from the function.  Otherwise
returning 0 means no update of the MSI fields, and thus no write
required.

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>
---
Changes since v2:
 - New approach.

Changes since v1:
 - Add more comments.
 - Simplify dma_msi_set_affinity().
---
 xen/arch/x86/hpet.c                      |  6 +++++-
 xen/arch/x86/hvm/vmx/vmx.c               |  4 +++-
 xen/arch/x86/msi.c                       | 11 ++++++-----
 xen/drivers/passthrough/amd/iommu_intr.c |  4 ++--
 xen/drivers/passthrough/vtd/intremap.c   |  4 +++-
 xen/include/xen/iommu.h                  |  6 ++++++
 6 files changed, 25 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/hpet.c b/xen/arch/x86/hpet.c
index 51ff7f12f5c0..1bca8c8b670d 100644
--- a/xen/arch/x86/hpet.c
+++ b/xen/arch/x86/hpet.c
@@ -283,8 +283,12 @@ static int hpet_msi_write(struct hpet_event_channel *ch, struct msi_msg *msg)
     {
         int rc = iommu_update_ire_from_msi(&ch->msi, msg);
 
-        if ( rc )
+        if ( rc < 0 )
             return rc;
+        /*
+         * Always propagate writes, to avoid having to pass a flag for handling
+         * a forceful write in the resume from suspension case.
+         */
     }
 
     hpet_write32(msg->data, HPET_Tn_ROUTE(ch->idx));
diff --git a/xen/arch/x86/hvm/vmx/vmx.c b/xen/arch/x86/hvm/vmx/vmx.c
index 0241303b4bf4..764d2ff9517a 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -415,7 +415,9 @@ static int cf_check vmx_pi_update_irte(const struct vcpu *v,
 
     ASSERT_PDEV_LIST_IS_READ_LOCKED(msi_desc->dev->domain);
 
-    return iommu_update_ire_from_msi(msi_desc, &msi_desc->msg);
+    rc = iommu_update_ire_from_msi(msi_desc, &msi_desc->msg);
+
+    return rc < 0 ? rc : 0;
 
  unlock_out:
     spin_unlock_irq(&desc->lock);
diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
index 6c11d76015fb..163ccf874720 100644
--- a/xen/arch/x86/msi.c
+++ b/xen/arch/x86/msi.c
@@ -184,7 +184,8 @@ void msi_compose_msg(unsigned vector, const cpumask_t *cpu_mask, struct msi_msg
                 MSI_DATA_VECTOR(vector);
 }
 
-static int write_msi_msg(struct msi_desc *entry, struct msi_msg *msg)
+static int write_msi_msg(struct msi_desc *entry, struct msi_msg *msg,
+                         bool force)
 {
     entry->msg = *msg;
 
@@ -194,7 +195,7 @@ static int write_msi_msg(struct msi_desc *entry, struct msi_msg *msg)
 
         ASSERT(msg != &entry->msg);
         rc = iommu_update_ire_from_msi(entry, msg);
-        if ( rc )
+        if ( rc < 0 || (rc == 0 && !force) )
             return rc;
     }
 
@@ -259,7 +260,7 @@ void cf_check set_msi_affinity(struct irq_desc *desc, const cpumask_t *mask)
     msg.address_lo |= MSI_ADDR_DEST_ID(dest);
     msg.dest32 = dest;
 
-    write_msi_msg(msi_desc, &msg);
+    write_msi_msg(msi_desc, &msg, false);
 }
 
 void __msi_set_enable(pci_sbdf_t sbdf, int pos, int enable)
@@ -522,7 +523,7 @@ int __setup_msi_irq(struct irq_desc *desc, struct msi_desc *msidesc,
     desc->msi_desc = msidesc;
     desc->handler = handler;
     msi_compose_msg(desc->arch.vector, desc->arch.cpu_mask, &msg);
-    ret = write_msi_msg(msidesc, &msg);
+    ret = write_msi_msg(msidesc, &msg, false);
     if ( unlikely(ret) )
     {
         desc->handler = &no_irq_type;
@@ -1403,7 +1404,7 @@ int pci_restore_msi_state(struct pci_dev *pdev)
         type = entry->msi_attrib.type;
 
         msg = entry->msg;
-        write_msi_msg(entry, &msg);
+        write_msi_msg(entry, &msg, true);
 
         for ( i = 0; ; )
         {
diff --git a/xen/drivers/passthrough/amd/iommu_intr.c b/xen/drivers/passthrough/amd/iommu_intr.c
index c0273059cb1d..07b21c6043ef 100644
--- a/xen/drivers/passthrough/amd/iommu_intr.c
+++ b/xen/drivers/passthrough/amd/iommu_intr.c
@@ -492,7 +492,7 @@ static int update_intremap_entry_from_msi_msg(
                get_ivrs_mappings(iommu->seg)[alias_id].intremap_table);
     }
 
-    return 0;
+    return !fresh ? 0 : 1;
 }
 
 static struct amd_iommu *_find_iommu_for_device(int seg, int bdf)
@@ -546,7 +546,7 @@ int cf_check amd_iommu_msi_msg_update_ire(
     rc = update_intremap_entry_from_msi_msg(iommu, bdf, nr,
                                             &msi_desc->remap_index,
                                             msg, &data);
-    if ( !rc )
+    if ( rc > 0 )
     {
         for ( i = 1; i < nr; ++i )
             msi_desc[i].remap_index = msi_desc->remap_index + i;
diff --git a/xen/drivers/passthrough/vtd/intremap.c b/xen/drivers/passthrough/vtd/intremap.c
index 1aeaeb5ec595..a9d96fcdbac8 100644
--- a/xen/drivers/passthrough/vtd/intremap.c
+++ b/xen/drivers/passthrough/vtd/intremap.c
@@ -506,6 +506,7 @@ static int msi_msg_to_remap_entry(
     unsigned int index, i, nr = 1;
     unsigned long flags;
     const struct pi_desc *pi_desc = msi_desc->pi_desc;
+    bool alloc = false;
 
     if ( msi_desc->msi_attrib.type == PCI_CAP_ID_MSI )
         nr = msi_desc->msi.nvec;
@@ -529,6 +530,7 @@ static int msi_msg_to_remap_entry(
         index = alloc_remap_entry(iommu, nr);
         for ( i = 0; i < nr; ++i )
             msi_desc[i].remap_index = index + i;
+        alloc = true;
     }
     else
         index = msi_desc->remap_index;
@@ -601,7 +603,7 @@ static int msi_msg_to_remap_entry(
     unmap_vtd_domain_page(iremap_entries);
     spin_unlock_irqrestore(&iommu->intremap.lock, flags);
 
-    return 0;
+    return alloc ? 1 : 0;
 }
 
 int cf_check msi_msg_write_remap_rte(
diff --git a/xen/include/xen/iommu.h b/xen/include/xen/iommu.h
index 77a514019cc6..984f0735d4a9 100644
--- a/xen/include/xen/iommu.h
+++ b/xen/include/xen/iommu.h
@@ -435,6 +435,12 @@ extern struct page_list_head iommu_pt_cleanup_list;
 bool arch_iommu_use_permitted(const struct domain *d);
 
 #ifdef CONFIG_X86
+/*
+ * Return values:
+ *  - < 0 on error.
+ *  - 0 on success and no need to write msi_msg to the hardware.
+ *  - 1 on success and msi_msg must be propagated to the hardware.
+ */
 static inline int iommu_update_ire_from_msi(
     struct msi_desc *msi_desc, struct msi_msg *msg)
 {
-- 
2.48.1


