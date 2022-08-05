Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D1958AD4B
	for <lists+xen-devel@lfdr.de>; Fri,  5 Aug 2022 17:45:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.381367.616018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJzW9-0000sU-9c; Fri, 05 Aug 2022 15:45:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 381367.616018; Fri, 05 Aug 2022 15:45:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJzW9-0000pW-69; Fri, 05 Aug 2022 15:45:41 +0000
Received: by outflank-mailman (input) for mailman id 381367;
 Fri, 05 Aug 2022 15:45:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=fcVI=YJ=arm.com=rahul.singh@srs-se1.protection.inumbo.net>)
 id 1oJzW8-0000pQ-0e
 for xen-devel@lists.xenproject.org; Fri, 05 Aug 2022 15:45:40 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id a74a60fc-14d5-11ed-924f-1f966e50362f;
 Fri, 05 Aug 2022 17:45:38 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CF849106F;
 Fri,  5 Aug 2022 08:45:38 -0700 (PDT)
Received: from e109506.cambridge.arm.com (e109506.cambridge.arm.com
 [10.1.199.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3FC1F3F73B;
 Fri,  5 Aug 2022 08:45:37 -0700 (PDT)
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
X-Inumbo-ID: a74a60fc-14d5-11ed-924f-1f966e50362f
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: smmuv1: Set s2cr to type fault when the devices are deassigned
Date: Fri,  5 Aug 2022 16:43:44 +0100
Message-Id: <e6a8807af0832db752d735e4f9ebddaa6bbd7c12.1659713886.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <5650ddce1de4fd5471823bde44a12a03f157bc11.1659713913.git.rahul.singh@arm.com>
References: <5650ddce1de4fd5471823bde44a12a03f157bc11.1659713913.git.rahul.singh@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When devices are deassigned/assigned, SMMU global fault is observed
because SMEs are freed in detach function and not allocated again when
the device is assigned back to the guest.

Don't free the SMEs when devices are deassigned, set the s2cr to type
fault. This way the SMMU will generate a fault if a DMA access is done
by a device not assigned to a guest

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
 xen/drivers/passthrough/arm/smmu.c | 32 +++++++++++++++---------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
index 69511683b4..141948decd 100644
--- a/xen/drivers/passthrough/arm/smmu.c
+++ b/xen/drivers/passthrough/arm/smmu.c
@@ -1598,21 +1598,6 @@ out_err:
 	return ret;
 }
 
-static void arm_smmu_master_free_smes(struct arm_smmu_master_cfg *cfg)
-{
-    struct arm_smmu_device *smmu = cfg->smmu;
-	int i, idx;
-	struct iommu_fwspec *fwspec = arm_smmu_get_fwspec(cfg);
-
-	spin_lock(&smmu->stream_map_lock);
-	for_each_cfg_sme(cfg, i, idx, fwspec->num_ids) {
-		if (arm_smmu_free_sme(smmu, idx))
-			arm_smmu_write_sme(smmu, idx);
-		cfg->smendx[i] = INVALID_SMENDX;
-	}
-	spin_unlock(&smmu->stream_map_lock);
-}
-
 static int arm_smmu_domain_add_master(struct arm_smmu_domain *smmu_domain,
 				      struct arm_smmu_master_cfg *cfg)
 {
@@ -1635,6 +1620,20 @@ static int arm_smmu_domain_add_master(struct arm_smmu_domain *smmu_domain,
 	return 0;
 }
 
+static void arm_smmu_domain_remove_master(struct arm_smmu_domain *smmu_domain,
+				      struct arm_smmu_master_cfg *cfg)
+{
+	int i, idx;
+	struct arm_smmu_device *smmu = smmu_domain->smmu;
+	struct arm_smmu_s2cr *s2cr = smmu->s2crs;
+	struct iommu_fwspec *fwspec = arm_smmu_get_fwspec(cfg);
+
+	for_each_cfg_sme(cfg, i, idx, fwspec->num_ids) {
+		s2cr[idx] = s2cr_init_val;
+		arm_smmu_write_s2cr(smmu, idx);
+	}
+}
+
 static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
 {
 	int ret;
@@ -1684,10 +1683,11 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
 
 static void arm_smmu_detach_dev(struct iommu_domain *domain, struct device *dev)
 {
+	struct arm_smmu_domain *smmu_domain = domain->priv;
 	struct arm_smmu_master_cfg *cfg = find_smmu_master_cfg(dev);
 
 	if (cfg)
-		arm_smmu_master_free_smes(cfg);
+		return arm_smmu_domain_remove_master(smmu_domain, cfg);
 
 }
 
-- 
2.25.1


