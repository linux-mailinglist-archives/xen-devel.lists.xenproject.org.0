Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F4D344ACE
	for <lists+xen-devel@lfdr.de>; Mon, 22 Mar 2021 17:14:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.100340.191127 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lONCA-0002Tb-6C; Mon, 22 Mar 2021 16:14:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 100340.191127; Mon, 22 Mar 2021 16:14:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lONCA-0002TC-2B; Mon, 22 Mar 2021 16:14:22 +0000
Received: by outflank-mailman (input) for mailman id 100340;
 Mon, 22 Mar 2021 16:14:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0JfP=IU=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1lONC8-0002T0-OZ
 for xen-devel@lists.xenproject.org; Mon, 22 Mar 2021 16:14:20 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id 39779ff6-3add-4511-85a4-8d84bfeba642;
 Mon, 22 Mar 2021 16:14:19 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2168D1042;
 Mon, 22 Mar 2021 09:14:19 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3986D3F719;
 Mon, 22 Mar 2021 09:14:18 -0700 (PDT)
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
X-Inumbo-ID: 39779ff6-3add-4511-85a4-8d84bfeba642
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 4/5] xen/arm: smmuv1: Add a stream map entry iterator
Date: Mon, 22 Mar 2021 16:11:38 +0000
Message-Id: <662c4a4872e471df1d185002988700cd738080a0.1616428314.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1616428314.git.rahul.singh@arm.com>
References: <cover.1616428314.git.rahul.singh@arm.com>
In-Reply-To: <cover.1616428314.git.rahul.singh@arm.com>
References: <cover.1616428314.git.rahul.singh@arm.com>

Backport commit d3097e39302083d58922a3d1032d7d59a63d263d
"iommu/arm-smmu: Add a stream map entry iterator" from the Linux kernel.

This patch is the preparatory work to fix the stream match conflict
when two devices have the same stream-id.

Original commit message:
    iommu/arm-smmu: Add a stream map entry iterator

    We iterate over the SMEs associated with a master config quite a lot in
    various places, and are about to do so even more. Let's wrap the idiom
    in a handy iterator macro before the repetition gets out of hand.

    Tested-by: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
    Signed-off-by: Robin Murphy <robin.murphy@arm.com>
    Signed-off-by: Will Deacon <will.deacon@arm.com>

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
Acked-by: Stefano Stabellini <sstabellini@kernel.org>
Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/drivers/passthrough/arm/smmu.c | 26 ++++++++++++--------------
 1 file changed, 12 insertions(+), 14 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
index e1b937bd4b..2c1ea8e6ff 100644
--- a/xen/drivers/passthrough/arm/smmu.c
+++ b/xen/drivers/passthrough/arm/smmu.c
@@ -618,6 +618,8 @@ struct arm_smmu_master_cfg {
 	s16				smendx[MAX_MASTER_STREAMIDS];
 };
 #define INVALID_SMENDX			-1
+#define for_each_cfg_sme(cfg, i, idx) \
+	for (i = 0; idx = cfg->smendx[i], i < cfg->num_streamids; ++i)
 
 struct arm_smmu_master {
 	struct device_node		*of_node;
@@ -1457,8 +1459,8 @@ static int arm_smmu_master_alloc_smes(struct arm_smmu_device *smmu,
 	int i, idx;
 
 	/* Allocate the SMRs on the SMMU */
-	for (i = 0; i < cfg->num_streamids; ++i) {
-		if (cfg->smendx[i] != INVALID_SMENDX)
+	for_each_cfg_sme(cfg, i, idx) {
+		if (idx != INVALID_SMENDX)
 			return -EEXIST;
 
 		/* ...except on stream indexing hardware, of course */
@@ -1482,8 +1484,8 @@ static int arm_smmu_master_alloc_smes(struct arm_smmu_device *smmu,
 		return 0;
 
 	/* It worked! Now, poke the actual hardware */
-	for (i = 0; i < cfg->num_streamids; ++i)
-		arm_smmu_write_smr(smmu, cfg->smendx[i]);
+	for_each_cfg_sme(cfg, i, idx)
+		arm_smmu_write_smr(smmu, idx);
 
 	return 0;
 
@@ -1498,15 +1500,13 @@ err_free_smrs:
 static void arm_smmu_master_free_smes(struct arm_smmu_device *smmu,
 				      struct arm_smmu_master_cfg *cfg)
 {
-	int i;
+	int i, idx;
 
 	/*
 	 * We *must* clear the S2CR first, because freeing the SMR means
 	 * that it can be re-allocated immediately.
 	 */
-	for (i = 0; i < cfg->num_streamids; ++i) {
-		int idx = cfg->smendx[i];
-
+	for_each_cfg_sme(cfg, i, idx) {
 		/* An IOMMU group is torn down by the first device to be removed */
 		if (idx == INVALID_SMENDX)
 			return;
@@ -1518,9 +1518,9 @@ static void arm_smmu_master_free_smes(struct arm_smmu_device *smmu,
 	__iowmb();
 
 	/* Invalidate the SMRs before freeing back to the allocator */
-	for (i = 0; i < cfg->num_streamids; ++i) {
+	for_each_cfg_sme(cfg, i, idx) {
 		if (smmu->smrs)
-			arm_smmu_free_smr(smmu, cfg->smendx[i]);
+			arm_smmu_free_smr(smmu, idx);
 
 		cfg->smendx[i] = INVALID_SMENDX;
 	}
@@ -1529,7 +1529,7 @@ static void arm_smmu_master_free_smes(struct arm_smmu_device *smmu,
 static int arm_smmu_domain_add_master(struct arm_smmu_domain *smmu_domain,
 				      struct arm_smmu_master_cfg *cfg)
 {
-	int i, ret = 0;
+	int i, idx, ret = 0;
 	struct arm_smmu_device *smmu = smmu_domain->smmu;
 	struct arm_smmu_s2cr *s2cr = smmu->s2crs;
 	enum arm_smmu_s2cr_type type = S2CR_TYPE_TRANS;
@@ -1540,9 +1540,7 @@ static int arm_smmu_domain_add_master(struct arm_smmu_domain *smmu_domain,
 	if (ret)
 		return ret;
 
-	for (i = 0; i < cfg->num_streamids; ++i) {
-		int idx = cfg->smendx[i];
-
+	for_each_cfg_sme(cfg, i, idx) {
 		/* Devices in an IOMMU group may already be configured */
 		if (type == s2cr[idx].type && cbndx == s2cr[idx].cbndx)
 			break;
-- 
2.17.1


