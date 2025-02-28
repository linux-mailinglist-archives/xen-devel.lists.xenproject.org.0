Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD365A49858
	for <lists+xen-devel@lfdr.de>; Fri, 28 Feb 2025 12:33:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.898660.1307176 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnybz-0003TW-Vf; Fri, 28 Feb 2025 11:32:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 898660.1307176; Fri, 28 Feb 2025 11:32:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnybz-0003RO-Rv; Fri, 28 Feb 2025 11:32:59 +0000
Received: by outflank-mailman (input) for mailman id 898660;
 Fri, 28 Feb 2025 11:32:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zu1c=VT=cloud.com=roger.pau@srs-se1.protection.inumbo.net>)
 id 1tnybz-0003Ph-0Z
 for xen-devel@lists.xenproject.org; Fri, 28 Feb 2025 11:32:59 +0000
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [2607:f8b0:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bf67c9df-f5c7-11ef-9898-31a8f345e629;
 Fri, 28 Feb 2025 12:32:54 +0100 (CET)
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-221057b6ac4so31416205ad.2
 for <xen-devel@lists.xenproject.org>; Fri, 28 Feb 2025 03:32:53 -0800 (PST)
Received: from localhost ([84.78.159.3]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-223501d2691sm31038955ad.51.2025.02.28.03.32.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Feb 2025 03:32:51 -0800 (PST)
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
X-Inumbo-ID: bf67c9df-f5c7-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1740742372; x=1741347172; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gMKi6AnTBC/lru2KP8+XtpUfQczmot2ztLAnDcnk7Ic=;
        b=kZYMdXm7zrGmiT4pRxsr2VjTAOE8bMgkq+vuGuYqIKNBO2VY8Uf4ir7bRT35gwBbff
         buCt2N4L5CU0n1yL8Cipp2hV83erk5TMiOaj8X5zFA13B9D4URcYnAi0DnEr+k2faFkZ
         S0ZYqPIOVHqi2nrOX8p3qQu2H4pUMBhXCbMX8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740742372; x=1741347172;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gMKi6AnTBC/lru2KP8+XtpUfQczmot2ztLAnDcnk7Ic=;
        b=bLPB3GiVttvzKyxebIZLOVmbp/j6beoBpYPmJsoviOcryJhKdqrrV4ILi8qaATE3l7
         y2GdmjAZFGk0yguiO5+bdaymXZjx6uw39XuSGeR9LZwK3TKVs5+i3l817mYckWx7S5Yz
         GiMjwws8ANQ86tHglqNTawse72NY8l25qKv8TWORKEf3dt+dM7z4+eAanu2NFgrirCMy
         Uw9TwVHyYPlJ6gE96TrOgEgeNHxPWS/98wUwxmfKOU8D5WmMjJMyi5F7ZKMkisqeX34J
         HIDIaJY8Y2m0T1snpag+XFNkIUMnbMUrSxGkOuPQwfvHSrLsNuNC8qMCA9lggXHCfM9D
         lzUQ==
X-Gm-Message-State: AOJu0Yxlz/JIQgHdlFsviD8TqxMF35mxGx2Qobhdw3Q/EKNfPL1GjHI5
	O0Cs5EJNqC+NJbXrpYGjCF+IlwdbKI0BslwAhLdUc4WezTFna1kU/lylGmHIXLK3tJcEYgTAg3u
	H
X-Gm-Gg: ASbGncvAAqDIjINY9tfEDLxN1mlCSbwnoSZaRRUOR6Ijpl9/nMZb8s9lOTL4T7DHOlV
	FRD8VWJsQ1HuxSPikex2VB0eTxtTQGCATVQdSU82jf+wmiqfgpXoYN0RpC1RnEvAxK2BriRxuyw
	Ol3fTGOcn/imtuuc6373hT79rWqu+IzVUI8ojpN3Ay2sca9KnCjRNHrQON25lOxJ4BcNjIfC7vK
	qg4Cq8SXmi0QrXCxSht4RcYoWdnMoS0p0z9qAfQFqRWgGxnHR1+7KWFF6dQDViman8rCvmbWc+u
	bDaVIa3AIpCUBtEwbLobnovEMC51ZAGuQuh3
X-Google-Smtp-Source: AGHT+IEd7/aB1afMZSPglZRUhVwxfprgRmi3Y3x/CUgPnKdAMpddfiPDP8PBb0liqUKjgXDU4rqe9A==
X-Received: by 2002:a17:902:d507:b0:220:c4e8:3b9f with SMTP id d9443c01a7336-22368bc6ae3mr44975645ad.0.1740742371908;
        Fri, 28 Feb 2025 03:32:51 -0800 (PST)
From: Roger Pau Monne <roger.pau@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: [PATCH] x86/msi: prevent MSI entry re-writes of the same data
Date: Fri, 28 Feb 2025 12:32:37 +0100
Message-ID: <20250228113237.6116-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.46.0
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
 xen/arch/x86/include/asm/msi.h      |  5 +++-
 xen/arch/x86/msi.c                  | 38 ++++++++++++++++++-----------
 xen/drivers/passthrough/vtd/iommu.c |  2 +-
 3 files changed, 29 insertions(+), 16 deletions(-)

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
index bf5b71822ea9..1905832be317 100644
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
@@ -191,8 +193,6 @@ void msi_compose_msg(unsigned vector, const cpumask_t *cpu_mask, struct msi_msg
 
 static int write_msi_msg(struct msi_desc *entry, struct msi_msg *msg)
 {
-    entry->msg = *msg;
-
     if ( iommu_intremap != iommu_intremap_off )
     {
         int rc;
@@ -203,6 +203,20 @@ static int write_msi_msg(struct msi_desc *entry, struct msi_msg *msg)
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
@@ -248,21 +262,15 @@ static int write_msi_msg(struct msi_desc *entry, struct msi_msg *msg)
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
@@ -1407,7 +1415,9 @@ int pci_restore_msi_state(struct pci_dev *pdev)
         }
         type = entry->msi_attrib.type;
 
-        msg = entry->msg;
+        msg.dest32 = entry->msg.dest32;
+        msi_compose_msg(desc->arch.vector, NULL, &msg);
+        entry->msg = (typeof(entry->msg)){};
         write_msi_msg(entry, &msg);
 
         for ( i = 0; ; )
diff --git a/xen/drivers/passthrough/vtd/iommu.c b/xen/drivers/passthrough/vtd/iommu.c
index a1927d9f126d..aa00290e7f77 100644
--- a/xen/drivers/passthrough/vtd/iommu.c
+++ b/xen/drivers/passthrough/vtd/iommu.c
@@ -1182,7 +1182,7 @@ static void cf_check dma_msi_end(struct irq_desc *desc, u8 vector)
 static void cf_check dma_msi_set_affinity(
     struct irq_desc *desc, const cpumask_t *mask)
 {
-    struct msi_msg msg;
+    struct msi_msg msg = {};
     unsigned int dest;
     unsigned long flags;
     struct vtd_iommu *iommu = desc->action->dev_id;
-- 
2.46.0


