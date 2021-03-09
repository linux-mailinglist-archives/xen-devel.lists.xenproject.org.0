Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FBCC332E1E
	for <lists+xen-devel@lfdr.de>; Tue,  9 Mar 2021 19:21:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95659.180609 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJgyE-0000E0-MT; Tue, 09 Mar 2021 18:20:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95659.180609; Tue, 09 Mar 2021 18:20:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJgyE-0000DV-JB; Tue, 09 Mar 2021 18:20:38 +0000
Received: by outflank-mailman (input) for mailman id 95659;
 Tue, 09 Mar 2021 18:20:37 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w89V=IH=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1lJgyC-0000DD-VR
 for xen-devel@lists.xenproject.org; Tue, 09 Mar 2021 18:20:37 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id f7a98a9c-1524-4241-979b-9c94f2b600cd;
 Tue, 09 Mar 2021 18:20:36 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1369931B;
 Tue,  9 Mar 2021 10:20:36 -0800 (PST)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 297B23F73C;
 Tue,  9 Mar 2021 10:20:35 -0800 (PST)
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
X-Inumbo-ID: f7a98a9c-1524-4241-979b-9c94f2b600cd
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 1/5] xen/arm: smmuv1: Handle stream IDs more dynamically
Date: Tue,  9 Mar 2021 18:19:25 +0000
Message-Id: <7775719c50c56b801e69d952e4ce255b8da1481c.1615312254.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1615312254.git.rahul.singh@arm.com>
References: <cover.1615312254.git.rahul.singh@arm.com>
In-Reply-To: <cover.1615312254.git.rahul.singh@arm.com>
References: <cover.1615312254.git.rahul.singh@arm.com>

Backport commit 21174240e4f4439bb8ed6c116cdbdc03eba2126e
"iommu/arm-smmu: Handle stream IDs more dynamically" from the Linux
ernel.

This patch is the preparatory work to fix the stream match conflict
when two devices have the same stream-id.

Original commit message:

Rather than assuming fixed worst-case values for stream IDs and SMR
masks, keep track of whatever implemented bits the hardware actually
reports. This also obviates the slightly questionable validation of SMR
fields in isolation - rather than aborting the whole SMMU probe for a
hardware configuration which is still architecturally valid, we can
simply refuse masters later if they try to claim an unrepresentable ID
or mask (which almost certainly implies a DT error anyway).

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
 xen/drivers/passthrough/arm/smmu.c | 43 +++++++++++++++---------------
 1 file changed, 22 insertions(+), 21 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
index 3e8aa37866..adfab8ee84 100644
--- a/xen/drivers/passthrough/arm/smmu.c
+++ b/xen/drivers/passthrough/arm/smmu.c
@@ -440,9 +440,7 @@ static struct iommu_group *iommu_group_get(struct device *dev)
 #define ARM_SMMU_GR0_SMR(n)		(0x800 + ((n) << 2))
 #define SMR_VALID			(1U << 31)
 #define SMR_MASK_SHIFT			16
-#define SMR_MASK_MASK			0x7fff
 #define SMR_ID_SHIFT			0
-#define SMR_ID_MASK			0x7fff
 
 #define ARM_SMMU_GR0_S2CR(n)		(0xc00 + ((n) << 2))
 #define S2CR_CBNDX_SHIFT		0
@@ -632,6 +630,8 @@ struct arm_smmu_device {
 	atomic_t			irptndx;
 
 	u32				num_mapping_groups;
+	u16				streamid_mask;
+	u16				smr_mask_mask;
 	DECLARE_BITMAP(smr_map, ARM_SMMU_MAX_SMRS);
 
 	unsigned long			s1_input_size;
@@ -2140,39 +2140,40 @@ static int arm_smmu_device_cfg_probe(struct arm_smmu_device *smmu)
 		dev_notice(smmu->dev, "\tcoherent table walk\n");
 	}
 
+	/* Max. number of entries we have for stream matching/indexing */
+	size = 1 << ((id >> ID0_NUMSIDB_SHIFT) & ID0_NUMSIDB_MASK);
+	smmu->streamid_mask = size - 1;
 	if (id & ID0_SMS) {
-		u32 smr, sid, mask;
+		u32 smr;
 
 		smmu->features |= ARM_SMMU_FEAT_STREAM_MATCH;
-		smmu->num_mapping_groups = (id >> ID0_NUMSMRG_SHIFT) &
-					   ID0_NUMSMRG_MASK;
-		if (smmu->num_mapping_groups == 0) {
+		size = (id >> ID0_NUMSMRG_SHIFT) & ID0_NUMSMRG_MASK;
+		if (size == 0) {
 			dev_err(smmu->dev,
 				"stream-matching supported, but no SMRs present!\n");
 			return -ENODEV;
 		}
 
-		smr = SMR_MASK_MASK << SMR_MASK_SHIFT;
-		smr |= (SMR_ID_MASK << SMR_ID_SHIFT);
+		/*
+		 * SMR.ID bits may not be preserved if the corresponding MASK
+		 * bits are set, so check each one separately. We can reject
+		 * masters later if they try to claim IDs outside these masks.
+		 */
+		smr = smmu->streamid_mask << SMR_ID_SHIFT;
 		writel_relaxed(smr, gr0_base + ARM_SMMU_GR0_SMR(0));
 		smr = readl_relaxed(gr0_base + ARM_SMMU_GR0_SMR(0));
+		smmu->streamid_mask = smr >> SMR_ID_SHIFT;
 
-		mask = (smr >> SMR_MASK_SHIFT) & SMR_MASK_MASK;
-		sid = (smr >> SMR_ID_SHIFT) & SMR_ID_MASK;
-		if ((mask & sid) != sid) {
-			dev_err(smmu->dev,
-				"SMR mask bits (0x%x) insufficient for ID field (0x%x)\n",
-				mask, sid);
-			return -ENODEV;
-		}
+		smr = smmu->streamid_mask << SMR_MASK_SHIFT;
+		writel_relaxed(smr, gr0_base + ARM_SMMU_GR0_SMR(0));
+		smr = readl_relaxed(gr0_base + ARM_SMMU_GR0_SMR(0));
+		smmu->smr_mask_mask = smr >> SMR_MASK_SHIFT;
 
 		dev_notice(smmu->dev,
-			   "\tstream matching with %u register groups, mask 0x%x\n",
-			   smmu->num_mapping_groups, mask);
-	} else {
-		smmu->num_mapping_groups = (id >> ID0_NUMSIDB_SHIFT) &
-					   ID0_NUMSIDB_MASK;
+			   "\tstream matching with %lu register groups, mask 0x%x",
+			   size, smmu->smr_mask_mask);
 	}
+	smmu->num_mapping_groups = size;
 
 	/* ID1 */
 	id = readl_relaxed(gr0_base + ARM_SMMU_GR0_ID1);
-- 
2.17.1


