Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 056982C59ED
	for <lists+xen-devel@lfdr.de>; Thu, 26 Nov 2020 18:02:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.38862.71627 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kiKfM-0004SR-Dj; Thu, 26 Nov 2020 17:02:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 38862.71627; Thu, 26 Nov 2020 17:02:44 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kiKfM-0004Rr-9s; Thu, 26 Nov 2020 17:02:44 +0000
Received: by outflank-mailman (input) for mailman id 38862;
 Thu, 26 Nov 2020 17:02:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C6x3=FA=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
 id 1kiKfK-0004MJ-5B
 for xen-devel@lists.xenproject.org; Thu, 26 Nov 2020 17:02:42 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id e1df84c5-f26b-43d9-90eb-f7db39644c69;
 Thu, 26 Nov 2020 17:02:38 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 279E9153B;
 Thu, 26 Nov 2020 09:02:38 -0800 (PST)
Received: from scm-wfh-server-rahsin01.stack04.eu02.mi.arm.com (unknown
 [10.58.246.76])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 43A663F23F;
 Thu, 26 Nov 2020 09:02:37 -0800 (PST)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=C6x3=FA=arm.com=rahul.singh@srs-us1.protection.inumbo.net>)
	id 1kiKfK-0004MJ-5B
	for xen-devel@lists.xenproject.org; Thu, 26 Nov 2020 17:02:42 +0000
X-Inumbo-ID: e1df84c5-f26b-43d9-90eb-f7db39644c69
Received: from foss.arm.com (unknown [217.140.110.172])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
	id e1df84c5-f26b-43d9-90eb-f7db39644c69;
	Thu, 26 Nov 2020 17:02:38 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 279E9153B;
	Thu, 26 Nov 2020 09:02:38 -0800 (PST)
Received: from scm-wfh-server-rahsin01.stack04.eu02.mi.arm.com (unknown [10.58.246.76])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 43A663F23F;
	Thu, 26 Nov 2020 09:02:37 -0800 (PST)
From: Rahul Singh <rahul.singh@arm.com>
To: xen-devel@lists.xenproject.org
Cc: bertrand.marquis@arm.com,
	rahul.singh@arm.com,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 3/8] xen/arm: revert patch related to XArray
Date: Thu, 26 Nov 2020 17:02:02 +0000
Message-Id: <612c1adabc1c26a539abf0dc05ea20b51e66e85f.1606406359.git.rahul.singh@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1606406359.git.rahul.singh@arm.com>
References: <cover.1606406359.git.rahul.singh@arm.com>
In-Reply-To: <cover.1606406359.git.rahul.singh@arm.com>
References: <cover.1606406359.git.rahul.singh@arm.com>

XArray is not implemented in XEN revert the patch that introduce the
XArray code in SMMUv3 driver.

Once XArray is implemented in XEN this patch can be added in XEN.

Reverted the commit 0299a1a81ca056e79c1a7fb751f936ec0d5c7afe

Signed-off-by: Rahul Singh <rahul.singh@arm.com>
---
 xen/drivers/passthrough/arm/smmu-v3.c | 27 +++++++++------------------
 1 file changed, 9 insertions(+), 18 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
index 97eac61ea4..cec304e51a 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -638,6 +638,7 @@ struct arm_smmu_device {
 
 #define ARM_SMMU_MAX_ASIDS		(1 << 16)
 	unsigned int			asid_bits;
+	DECLARE_BITMAP(asid_map, ARM_SMMU_MAX_ASIDS);
 
 #define ARM_SMMU_MAX_VMIDS		(1 << 16)
 	unsigned int			vmid_bits;
@@ -703,8 +704,6 @@ struct arm_smmu_option_prop {
 	const char *prop;
 };
 
-static DEFINE_XARRAY_ALLOC1(asid_xa);
-
 static struct arm_smmu_option_prop arm_smmu_options[] = {
 	{ ARM_SMMU_OPT_SKIP_PREFETCH, "hisilicon,broken-prefetch-cmd" },
 	{ ARM_SMMU_OPT_PAGE0_REGS_ONLY, "cavium,cn9900-broken-page1-regspace"},
@@ -1366,14 +1365,6 @@ static void arm_smmu_free_cd_tables(struct arm_smmu_domain *smmu_domain)
 	cdcfg->cdtab = NULL;
 }
 
-static void arm_smmu_free_asid(struct arm_smmu_ctx_desc *cd)
-{
-	if (!cd->asid)
-		return;
-
-	xa_erase(&asid_xa, cd->asid);
-}
-
 /* Stream table manipulation functions */
 static void
 arm_smmu_write_strtab_l1_desc(__le64 *dst, struct arm_smmu_strtab_l1_desc *desc)
@@ -2006,9 +1997,10 @@ static void arm_smmu_domain_free(struct iommu_domain *domain)
 	if (smmu_domain->stage == ARM_SMMU_DOMAIN_S1) {
 		struct arm_smmu_s1_cfg *cfg = &smmu_domain->s1_cfg;
 
-		if (cfg->cdcfg.cdtab)
+		if (cfg->cdcfg.cdtab) {
 			arm_smmu_free_cd_tables(smmu_domain);
-		arm_smmu_free_asid(&cfg->cd);
+			arm_smmu_bitmap_free(smmu->asid_map, cfg->cd.asid);
+		}
 	} else {
 		struct arm_smmu_s2_cfg *cfg = &smmu_domain->s2_cfg;
 		if (cfg->vmid)
@@ -2023,15 +2015,14 @@ static int arm_smmu_domain_finalise_s1(struct arm_smmu_domain *smmu_domain,
 				       struct io_pgtable_cfg *pgtbl_cfg)
 {
 	int ret;
-	u32 asid;
+	int asid;
 	struct arm_smmu_device *smmu = smmu_domain->smmu;
 	struct arm_smmu_s1_cfg *cfg = &smmu_domain->s1_cfg;
 	typeof(&pgtbl_cfg->arm_lpae_s1_cfg.tcr) tcr = &pgtbl_cfg->arm_lpae_s1_cfg.tcr;
 
-	ret = xa_alloc(&asid_xa, &asid, &cfg->cd,
-		       XA_LIMIT(1, (1 << smmu->asid_bits) - 1), GFP_KERNEL);
-	if (ret)
-		return ret;
+	asid = arm_smmu_bitmap_alloc(smmu->asid_map, smmu->asid_bits);
+	if (asid < 0)
+		return asid;
 
 	cfg->s1cdmax = master->ssid_bits;
 
@@ -2064,7 +2055,7 @@ static int arm_smmu_domain_finalise_s1(struct arm_smmu_domain *smmu_domain,
 out_free_cd_tables:
 	arm_smmu_free_cd_tables(smmu_domain);
 out_free_asid:
-	arm_smmu_free_asid(&cfg->cd);
+	arm_smmu_bitmap_free(smmu->asid_map, asid);
 	return ret;
 }
 
-- 
2.17.1


