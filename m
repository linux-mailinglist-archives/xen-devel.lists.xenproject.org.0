Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D947CA54E6D
	for <lists+xen-devel@lfdr.de>; Thu,  6 Mar 2025 15:58:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.903671.1311664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqCfb-000459-E4; Thu, 06 Mar 2025 14:57:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 903671.1311664; Thu, 06 Mar 2025 14:57:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tqCfb-00042D-9Q; Thu, 06 Mar 2025 14:57:55 +0000
Received: by outflank-mailman (input) for mailman id 903671;
 Thu, 06 Mar 2025 14:57:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bSAR=VZ=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tqCfZ-0003Ye-U6
 for xen-devel@lists.xenproject.org; Thu, 06 Mar 2025 14:57:53 +0000
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [2a00:1450:4864:20::632])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 60ae5c41-fa9b-11ef-9898-31a8f345e629;
 Thu, 06 Mar 2025 15:57:52 +0100 (CET)
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-abf615d5f31so149569966b.2
 for <xen-devel@lists.xenproject.org>; Thu, 06 Mar 2025 06:57:52 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with UTF8SMTPSA id
 a640c23a62f3a-ac2399d7da1sm108296266b.174.2025.03.06.06.57.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Mar 2025 06:57:50 -0800 (PST)
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
X-Inumbo-ID: 60ae5c41-fa9b-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1741273071; x=1741877871; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B0ajY6/Y8/keQc8NjGLWYTwjQvi4qUcVQxavVZsdDtc=;
        b=OSKIIfMV3Se6Dj1GgHVLdxoPO8T9oLTTV6PFQFMVEzBh5dkd2JAeLY7bVvLI4pmnfk
         5V0RNZSk2B43ZASSIpZswAooAQws10lRZ6RU7Aqp3sgxqhfYOsm9pphIhU0+JDGbk+uU
         xCPIY3W6+nUjsDKaYndU+MCUrOY+yBuRkl8Rk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741273071; x=1741877871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B0ajY6/Y8/keQc8NjGLWYTwjQvi4qUcVQxavVZsdDtc=;
        b=UrfD86Op3FzO4P5q3vn+W6vKIEIDzMUBb7FVjb021UvFgEMBZldm/M3SCTpHEw+Ofp
         RsxL2sj6SJiqxyk3+sg3UE6ry1sWxmCXg2qxJ38L4UCLyuuB14rF6wSNr2/P6gAJs7gA
         86sxCfRH6+mPwYvqMk6O/rUDOwq+xPHG3whgYODdtw2zcOwWot4MCkHXqHggWNBpC4j3
         3UVG3YB7YyXVkbGar622LgOIgpmA/mjkmmrkg7slJgCmcfGxyjWOQ+3xnynzC/kdkqJm
         +k3wB7OCY+j5kPqhk19sjhjgHDemUNFm1C8ASbXiorLFN3c8qYnw/+5BGtgZnKklwMdY
         4Efg==
X-Gm-Message-State: AOJu0YyKIzkN3Fhhxd8R+UE0E8VXaJbMIdqQb8tcy/0cmDq4PC/HbdUj
	baRaMmDlYWCOx8NeZDBbohEKjCdR0svbg4A/Jc5vA4jh6LLo05Ev0l8ahDKt4Q8zSLDuv65EtaQ
	V
X-Gm-Gg: ASbGncsPxaVMYcbEk+PCSgSIR14h+oziq24tnf0fvlCCN1rFa1PzzbEPvBpZTl5pXeT
	cmXVv5xRQCd3+LM8HSf3Aj81FRCTC6bOCDMDRDsSqfNDWHmnqe7hNCCUWRvb7Hk/FjbySrgGvKw
	F+UuJNAScDWkimUk1LyQ1wCJaO+k/gjsE/pAlQVhmFqXjOlW/oSXflPivctfbhj3pqMG0rT5VRv
	RV8wXqrZaPfhi2G1e1TCfdnoIHhHSrGOtJlzYBmiW3EyHfGYXz4jEgEtdn8tFxqvjOJtYYscZcd
	sAMVRsqp5pFDG2SqJrg9UXvrc7kmVrhFCUjx8ZSWLIxCU6smiw==
X-Google-Smtp-Source: AGHT+IE2B7p5OoJyNXIoaN0PqeztgJP7eTf3Cgh/ZrhNPresO+mqR0S9cIopnm16cGFXVTLk4TB4bA==
X-Received: by 2002:a17:907:971c:b0:ac1:e881:89aa with SMTP id a640c23a62f3a-ac20d849e84mr720030066b.5.1741273071290;
        Thu, 06 Mar 2025 06:57:51 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH v2 3/3] x86/msi: prevent MSI entry re-writes of the same data
Date: Thu,  6 Mar 2025 15:57:33 +0100
Message-ID: <20250306145733.99927-4-roger.pau@citrix.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250306145733.99927-1-roger.pau@citrix.com>
References: <20250306145733.99927-1-roger.pau@citrix.com>
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

Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Cc: Ross Lagerwall <ross.lagerwall@citrix.com>
---
Changes since v1:
 - Add more comments.
 - Simplify dma_msi_set_affinity().
---
 xen/arch/x86/include/asm/msi.h      |  5 +++-
 xen/arch/x86/msi.c                  | 45 ++++++++++++++++++++---------
 xen/drivers/passthrough/vtd/iommu.c | 11 +++----
 3 files changed, 39 insertions(+), 22 deletions(-)

diff --git a/xen/arch/x86/include/asm/msi.h b/xen/arch/x86/include/asm/msi.h
index 378b85ee947b..4301c58c7c4d 100644
--- a/xen/arch/x86/include/asm/msi.h
+++ b/xen/arch/x86/include/asm/msi.h
@@ -124,7 +124,8 @@ struct msi_desc {
     int irq;
     int remap_index;         /* index in interrupt remapping table */
 
-    struct msi_msg msg;      /* Last set MSI message */
+    /* Last set MSI message in remappable format if applicable */
+    struct msi_msg msg;
 };
 
 /*
@@ -236,6 +237,8 @@ struct arch_msix {
 };
 
 void early_msi_init(void);
+
+/* If cpu_mask is NULL msg->dest32 is used as the destination APIC ID. */
 void msi_compose_msg(unsigned vector, const cpumask_t *cpu_mask,
                      struct msi_msg *msg);
 void __msi_set_enable(pci_sbdf_t sbdf, int pos, int enable);
diff --git a/xen/arch/x86/msi.c b/xen/arch/x86/msi.c
index 8efe41b1526c..3c9fdc9b7bf5 100644
--- a/xen/arch/x86/msi.c
+++ b/xen/arch/x86/msi.c
@@ -152,11 +152,13 @@ static bool msix_memory_decoded(const struct pci_dev *dev, unsigned int pos)
 }
 
 /*
- * MSI message composition
+ * MSI message composition.
+ * If cpu_mask is NULL msg->dest32 is used as the destination APIC ID.
  */
 void msi_compose_msg(unsigned vector, const cpumask_t *cpu_mask, struct msi_msg *msg)
 {
-    memset(msg, 0, sizeof(*msg));
+    msg->address = 0;
+    msg->data = 0;
 
     if ( vector < FIRST_DYNAMIC_VECTOR )
         return;
@@ -186,8 +188,6 @@ void msi_compose_msg(unsigned vector, const cpumask_t *cpu_mask, struct msi_msg
 
 static int write_msi_msg(struct msi_desc *entry, struct msi_msg *msg)
 {
-    entry->msg = *msg;
-
     if ( iommu_intremap != iommu_intremap_off )
     {
         int rc;
@@ -198,6 +198,20 @@ static int write_msi_msg(struct msi_desc *entry, struct msi_msg *msg)
             return rc;
     }
 
+    /*
+     * Avoid updating the MSI entry if the address and data fields haven't
+     * changed.  When using interrupt remapping changing the MSI affinity
+     * shouldn't change the interrupt remapping table index, and hence the MSI
+     * address and data fields should remain the same.
+     */
+    if ( entry->msg.address == msg->address && entry->msg.data == msg->data )
+    {
+        entry->msg.dest32 = msg->dest32;
+        return 0;
+    }
+
+    entry->msg = *msg;
+
     switch ( entry->msi_attrib.type )
     {
     case PCI_CAP_ID_MSI:
@@ -243,21 +257,15 @@ static int write_msi_msg(struct msi_desc *entry, struct msi_msg *msg)
 void cf_check set_msi_affinity(struct irq_desc *desc, const cpumask_t *mask)
 {
     struct msi_msg msg;
-    unsigned int dest;
     struct msi_desc *msi_desc = desc->msi_desc;
 
-    dest = set_desc_affinity(desc, mask);
-    if ( dest == BAD_APICID || !msi_desc )
+    msg.dest32 = set_desc_affinity(desc, mask);
+    if ( msg.dest32 == BAD_APICID || !msi_desc )
         return;
 
     ASSERT(spin_is_locked(&desc->lock));
 
-    msg = msi_desc->msg;
-    msg.data &= ~MSI_DATA_VECTOR_MASK;
-    msg.data |= MSI_DATA_VECTOR(desc->arch.vector);
-    msg.address_lo &= ~MSI_ADDR_DEST_ID_MASK;
-    msg.address_lo |= MSI_ADDR_DEST_ID(dest);
-    msg.dest32 = dest;
+    msi_compose_msg(desc->arch.vector, NULL, &msg);
 
     write_msi_msg(msi_desc, &msg);
 }
@@ -1402,7 +1410,16 @@ int pci_restore_msi_state(struct pci_dev *pdev)
         }
         type = entry->msi_attrib.type;
 
-        msg = entry->msg;
+        /*
+         * Instead of re-writing the current MSI message, regenerate it and
+         * force a write, as that's simpler than adding support for writing
+         * already translated messages.
+         */
+        msg.dest32 = entry->msg.dest32;
+        /* Pass NULL as the cpu mask to use the value in msg.dest32. */
+        msi_compose_msg(desc->arch.vector, NULL, &msg);
+        /* Zero the cached message to unconditionally trigger a re-write. */
+        entry->msg = (typeof(entry->msg)){};
         write_msi_msg(entry, &msg);
 
         for ( i = 0; ; )
diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
index a1927d9f126d..e03e9dfbc595 100644
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -1183,22 +1183,19 @@ static void cf_check dma_msi_set_affinity(
     struct irq_desc *desc, const cpumask_t *mask)
 {
     struct msi_msg msg;
-    unsigned int dest;
     unsigned long flags;
     struct vtd_iommu *iommu = desc->action->dev_id;
 
-    dest = set_desc_affinity(desc, mask);
-    if (dest == BAD_APICID){
+    msg.dest32 = set_desc_affinity(desc, mask);
+    if ( msg.dest32 == BAD_APICID )
+    {
         dprintk(XENLOG_ERR VTDPREFIX, "Set iommu interrupt affinity error!\n");
         return;
     }
 
     msi_compose_msg(desc->arch.vector, NULL, &msg);
-    msg.dest32 = dest;
     if (x2apic_enabled)
-        msg.address_hi = dest & 0xFFFFFF00;
-    ASSERT(!(msg.address_lo & MSI_ADDR_DEST_ID_MASK));
-    msg.address_lo |= MSI_ADDR_DEST_ID(dest);
+        msg.address_hi = msg.dest32 & 0xFFFFFF00;
     iommu->msi.msg = msg;
 
     spin_lock_irqsave(&iommu->register_lock, flags);
-- 
2.48.1


