Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 090EDA5C02C
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 13:07:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.908025.1315219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tryOI-0006TZ-Eu; Tue, 11 Mar 2025 12:07:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 908025.1315219; Tue, 11 Mar 2025 12:07:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tryOI-0006PN-Bk; Tue, 11 Mar 2025 12:07:22 +0000
Received: by outflank-mailman (input) for mailman id 908025;
 Tue, 11 Mar 2025 12:07:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=siat=V6=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tryOH-000646-JP
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 12:07:21 +0000
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [2607:f8b0:4864:20::62d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 61bc074c-fe71-11ef-9ab9-95dc52dad729;
 Tue, 11 Mar 2025 13:07:20 +0100 (CET)
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-22185cddbffso112221305ad.1
 for <xen-devel@lists.xenproject.org>; Tue, 11 Mar 2025 05:07:20 -0700 (PDT)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 d2e1a72fcca58-736d820ebacsm4147840b3a.11.2025.03.11.05.07.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Mar 2025 05:07:17 -0700 (PDT)
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
X-Inumbo-ID: 61bc074c-fe71-11ef-9ab9-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741694838; x=1742299638; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3hkZjl6qpKTXdMO/1TFak2yBcgGai4JUqjS2jVFe5tY=;
        b=a/2SL8ra5TaXmeRc9D3o8QutbgLpC28pnrSzeb8hX+tGzYPD39D2sqdfDBbqiQ14Hs
         S5tA5WNljA6wfOp15MR0Hj4cV3Xz3Xaseke4ylA1mUL/DvpC0EJOwPb32QqJ704YEM/1
         xqG/NJA0KquYw2U1LQ6st4F3kjaIdq58dBqK8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741694838; x=1742299638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3hkZjl6qpKTXdMO/1TFak2yBcgGai4JUqjS2jVFe5tY=;
        b=V3CdTdoBK5XVNYY3aheo6jrcmta2g9qCJmWWhee5gutO7U/zk3W1pMdUGQ0JT5mbcj
         1fDFr96XevEL5o1ofdkqvhH6QOSCpUgifzSUelKpnljAqJvDg/uTWKKfzL8YuHd6bLlK
         P8utS9kF5PvBEZwFB9A1LRgNljQX9jWiAZFma97oLCAFMADtDpCNzBbzRf3LF7DrdPSj
         Y8mJj1htBmofXc0FUgsBEZ9Fth/derhbLGHthOHQnE/tPsfMDp8eVjNvc126gmLhb38/
         k8Meb4iSCo7y7bl/DDZtinPGCtdGEU0v7vi0h5f3LEG/0+ccmhXEOSl4FyvCRYu5pjHr
         Do+Q==
X-Gm-Message-State: AOJu0YxOOFhAvGgO2jWm/kZk8V6RY38sngT5KatseNgU0s03l+n7iPQD
	tVS+qBpPk0M5D11rir8611tDegNfvqwA/A3Xl3H2BM5k62sS/gQUawpyS8+2egoZeZe5Y9Ub0qQ
	2
X-Gm-Gg: ASbGnctLQ7INgTs/lqR4m+U7wwzX5nKKHdxwMvhOsCcFp2/fidvK4atVDIWGmhlMhsI
	Cy8n6QuUqStWLidG3fFIRJJEuxJq8IKAyXxNYzgsz+8rM0fppn5qrf4yzw1zyXxD1sTi6hxAbva
	NmWPRSmPFyEfLLUpFDQO767JkjgjgbMv3u//9dCq8V4Kp0awjWeqX9GU8t4C+/ZbFcjJjuyUN32
	8Vwi98akJOC/7xib0JRHqNHdi1Izc8MW1jVZ9g/O46tsfJv5CYZTlmAor1OBC3ldS2BF2rUNkSP
	5XXGvWznS872PAWvVTPXcOKRTUzFVrKTJWToe89G3awVYEn5sqxsre4=
X-Google-Smtp-Source: AGHT+IHJyozDFB4akTMDg6U4ZbKYut75l7sukU0s1eBT9e9e47kM3oLA0KtXoGLSjNybQHh+EsRowA==
X-Received: by 2002:a05:6a00:1394:b0:736:5813:8c46 with SMTP id d2e1a72fcca58-736ec6b29b0mr4709594b3a.8.1741694838011;
        Tue, 11 Mar 2025 05:07:18 -0700 (PDT)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH v4 3/3] x86/iommu: avoid MSI address and data writes if IRT index hasn't changed
Date: Tue, 11 Mar 2025 13:06:52 +0100
Message-ID: <20250311120652.61366-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250311120652.61366-1-roger.pau@citrix.com>
References: <20250311120652.61366-1-roger.pau@citrix.com>
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
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>
---
Changes since v3:
 - Assert MSI fields are never updated in vmx_pi_update_irte().
 - Directly return booleans from msi_msg_to_remap_entry() and
   update_intremap_entry_from_msi_msg().

Changes since v2:
 - New approach.

Changes since v1:
 - Add more comments.
 - Simplify dma_msi_set_affinity().
---
 xen/arch/x86/hpet.c                      |  6 +++++-
 xen/arch/x86/hvm/vmx/vmx.c               | 13 ++++++++++++-
 xen/arch/x86/msi.c                       | 11 ++++++-----
 xen/drivers/passthrough/amd/iommu_intr.c |  4 ++--
 xen/drivers/passthrough/vtd/intremap.c   |  4 +++-
 xen/include/xen/iommu.h                  |  6 ++++++
 6 files changed, 34 insertions(+), 10 deletions(-)

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
index c407513af624..7535a45b31fc 100644
--- a/xen/arch/x86/hvm/vmx/vmx.c
+++ b/xen/arch/x86/hvm/vmx/vmx.c
@@ -422,7 +422,18 @@ static int cf_check vmx_pi_update_irte(const struct vcpu *v,
 
     ASSERT_PDEV_LIST_IS_READ_LOCKED(msi_desc->dev->domain);
 
-    return iommu_update_ire_from_msi(msi_desc, &msg);
+    rc = iommu_update_ire_from_msi(msi_desc, &msg);
+    if ( rc > 0 )
+    {
+        /*
+         * Callers of vmx_pi_update_irte() won't propagate the updated MSI
+         * fields to the hardware, must assert there are no changes.
+         */
+        ASSERT_UNREACHABLE();
+        rc = -EILSEQ;
+    }
+
+    return rc;
 
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
index c0273059cb1d..9abdc38053d7 100644
--- a/xen/drivers/passthrough/amd/iommu_intr.c
+++ b/xen/drivers/passthrough/amd/iommu_intr.c
@@ -492,7 +492,7 @@ static int update_intremap_entry_from_msi_msg(
                get_ivrs_mappings(iommu->seg)[alias_id].intremap_table);
     }
 
-    return 0;
+    return fresh;
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
index 1aeaeb5ec595..b3b53518e294 100644
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
+    return alloc;
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


