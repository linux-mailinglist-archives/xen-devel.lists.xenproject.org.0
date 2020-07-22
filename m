Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B79BB228EDD
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jul 2020 06:01:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jy5wC-0001kO-0N; Wed, 22 Jul 2020 04:01:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=SEGq=BB=xilinx.com=woods@srs-us1.protection.inumbo.net>)
 id 1jy5wA-0001kB-Sv
 for xen-devel@lists.xenproject.org; Wed, 22 Jul 2020 04:00:58 +0000
X-Inumbo-ID: f23470a4-cbcf-11ea-8613-bc764e2007e4
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (unknown
 [40.107.94.67]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f23470a4-cbcf-11ea-8613-bc764e2007e4;
 Wed, 22 Jul 2020 04:00:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ce2MugMj5Gi+e++p25NcYhkNyz+cJiWkYQhiEJx8Wkw3JKYLCCvIIROAxGF6wuMbcJ66UmDEiaSzoDClw3M5WAgk8W/1r6w+MAfuof/43qayzw4M/aPn+pWdtqlNxIpfJsX9woXS1chU0lf208qJN4a3tm+hf722J9/T84mgNcOkXhDmjpIrwRwjhWuzoWWh97OwJfP2g9C9fXeOLtF0DdcVDGJts3Z/uHePfgKe2oIXSKHcZc7qFjpNWC8pB8bXHBqyWbajEXHjqfA8f5m/kzOwXBSTmdBPkjr0m14pYi/UNjnN4VgyuT5dJYjCMLZCGsyOy3Xoy/+6ptZxrjzpIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lu6/sGI2fQO/GKysq+3npebONed5SiclapckpPkFhvQ=;
 b=UGqr855hhUf8FB47Rlkuhwm6DRwGcWrlfTajdO9gB/8RtrnP64ENiVFpj3do2ITz5hQqSuxF000LQmI//x8Q7tGj1F7xqHW1zP0BLCWenHxF1UqeD+hy0E9HPAHBnbAvK9ZJbimk8yW5nRk1+qSbnvjtb8r84YYHYdoXs8q89fv0th7ORtQbkMn8fxEtItbi9AqPoeIccjiKs2J4/hFHmvBjuxZjBxBkeIe2JDhUNVqNUOufwo0wE+GkM/OFc7PhLDyBbLUvVAhaZxyJg0ROmbuwY4zE3DMN3+nrMdTBo3AmqbFWMy6LMmpUP0mnFVXPMaGqx06I4N13sLOPFuCjCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.60.83) smtp.rcpttodomain=epam.com smtp.mailfrom=xilinx.com;
 dmarc=bestguesspass action=none header.from=xilinx.com; dkim=none (message
 not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lu6/sGI2fQO/GKysq+3npebONed5SiclapckpPkFhvQ=;
 b=rCAXgyTpl084xUzdaV54SjN/pHqGBHb/s53ZRHMS3bgkt/lt7dG8NbfyI5KEvobO3aSQk03zxOkXU4cQLTuhWtVQOoGSkoSEmYplcay8uHqunthpZ4cXoO/xo9Y1PrT1r9VKm1PPNcV4h/4DheqsclmUCX+PXtMYRKokLa0Naks=
Received: from CY4PR03CA0023.namprd03.prod.outlook.com (2603:10b6:903:33::33)
 by BYAPR02MB5717.namprd02.prod.outlook.com (2603:10b6:a03:122::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3174.20; Wed, 22 Jul
 2020 04:00:54 +0000
Received: from CY1NAM02FT038.eop-nam02.prod.protection.outlook.com
 (2603:10b6:903:33:cafe::8a) by CY4PR03CA0023.outlook.office365.com
 (2603:10b6:903:33::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.22 via Frontend
 Transport; Wed, 22 Jul 2020 04:00:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.60.83)
 smtp.mailfrom=xilinx.com; epam.com; dkim=none (message not signed)
 header.d=none;epam.com; dmarc=bestguesspass action=none
 header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.60.83 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.60.83; helo=xsj-pvapsmtpgw01;
Received: from xsj-pvapsmtpgw01 (149.199.60.83) by
 CY1NAM02FT038.mail.protection.outlook.com (10.152.74.217) with Microsoft SMTP
 Server id 15.20.3216.10 via Frontend Transport; Wed, 22 Jul 2020 04:00:54
 +0000
Received: from [149.199.38.66] (port=50304 helo=smtp.xilinx.com)
 by xsj-pvapsmtpgw01 with esmtp (Exim 4.90)
 (envelope-from <brian.woods@xilinx.com>)
 id 1jy5uH-0007kk-Rs; Tue, 21 Jul 2020 20:59:01 -0700
Received: from [127.0.0.1] (helo=localhost)
 by xsj-pvapsmtp01 with smtp (Exim 4.63)
 (envelope-from <brian.woods@xilinx.com>)
 id 1jy5w5-0002zS-RT; Tue, 21 Jul 2020 21:00:53 -0700
Received: from xsj-pvapsmtp01 (mailhub.xilinx.com [149.199.38.66])
 by xsj-smtp-dlp1.xlnx.xilinx.com (8.13.8/8.13.1) with ESMTP id 06M40jFj012848; 
 Tue, 21 Jul 2020 21:00:45 -0700
Received: from [172.19.2.62] (helo=xsjwoods50.xilinx.com)
 by xsj-pvapsmtp01 with esmtp (Exim 4.63)
 (envelope-from <brian.woods@xilinx.com>)
 id 1jy5vx-0002u2-CN; Tue, 21 Jul 2020 21:00:45 -0700
From: Brian Woods <brian.woods@xilinx.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: [RFC v2 1/2] arm,smmu: switch to using iommu_fwspec functions
Date: Tue, 21 Jul 2020 21:00:30 -0700
Message-Id: <1595390431-24805-2-git-send-email-brian.woods@xilinx.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1595390431-24805-1-git-send-email-brian.woods@xilinx.com>
References: <1595390431-24805-1-git-send-email-brian.woods@xilinx.com>
X-RCIS-Action: ALLOW
X-TM-AS-Product-Ver: IMSS-7.1.0.1224-8.2.0.1013-23620.005
X-TM-AS-User-Approved-Sender: Yes;Yes
X-EOPAttributedMessage: 0
X-MS-Office365-Filtering-HT: Tenant
X-Forefront-Antispam-Report: CIP:149.199.60.83; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapsmtpgw01; PTR:unknown-60-83.xilinx.com; CAT:NONE;
 SFTY:;
 SFS:(376002)(39850400004)(136003)(346002)(396003)(46966005)(8936002)(83380400001)(356005)(336012)(9786002)(70206006)(81166007)(8676002)(86362001)(7696005)(70586007)(54906003)(186003)(2906002)(82740400003)(316002)(82310400002)(107886003)(44832011)(36756003)(5660300002)(426003)(47076004)(4326008)(6916009)(6666004)(26005)(2616005)(478600001)(142933001);
 DIR:OUT; SFP:1101; 
X-MS-PublicTrafficType: Email
MIME-Version: 1.0
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 8eb859d8-7d45-41d4-6a7a-08d82df3d4a4
X-MS-TrafficTypeDiagnostic: BYAPR02MB5717:
X-Microsoft-Antispam-PRVS: <BYAPR02MB57172D8E22BAD52F2CD08CC9D7790@BYAPR02MB5717.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:773;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UfJ+Z5jvDffqDkebW77K0D8lMwezIGgAwMF0Gf1X1vwe2qkGXqrxzFJOAsAhi5Unx+oR3f1tNLpDDkBO8ck8Tjn/6NNyPtuQeS4mB8lDRPEqeKM7XvjOWtoEBhvOP+rqak/UuBmxPbarF9B/5I+yrcKTPLMKXJh4BE+3Ls8gK/XCJxo73ELjgGtFTpGsAWRv8yIv3EJvwllqjqsUGXqu8yISO2GyytqyFbeqzUKNe2c8VIVxqbkU45JNcFtv+XpgkihHTasjBtRaHiRVhnTA/fZ+n+8PTrr2RqMYg9HPjgdUwfXPmcHw9DbwNIFiofTmO40doWi57MPsSvQ5nplFjqQi06RjeMcVKEoljB8FO6eb8JAwQGwEedXbJDrA3N84swoWxBUHJhJD/FbxQJR2CGnsxF0uiSbllUADOJOp+gc=
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2020 04:00:54.0703 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8eb859d8-7d45-41d4-6a7a-08d82df3d4a4
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.60.83];
 Helo=[xsj-pvapsmtpgw01]
X-MS-Exchange-CrossTenant-AuthSource: CY1NAM02FT038.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5717
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Brian Woods <brian.woods@xilinx.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Modify the smmu driver so that it uses the iommu_fwspec helper
functions.  This means both ARM IOMMU drivers will both use the
iommu_fwspec helper functions.

Signed-off-by: Brian Woods <brian.woods@xilinx.com>
---

Interested in if combining the legacy and generic bindings paths are
worth or if Xen plans to depreicate legacy bindings at some point.

v1 -> v2
    - removed MAX_MASTER_STREAMIDS
    - removed unneeded curly brackets

 xen/drivers/passthrough/arm/smmu.c    | 81 +++++++++++++++++++----------------
 xen/drivers/passthrough/device_tree.c |  3 ++
 2 files changed, 47 insertions(+), 37 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
index 94662a8..7a5c6cd 100644
--- a/xen/drivers/passthrough/arm/smmu.c
+++ b/xen/drivers/passthrough/arm/smmu.c
@@ -49,6 +49,7 @@
 #include <asm/atomic.h>
 #include <asm/device.h>
 #include <asm/io.h>
+#include <asm/iommu_fwspec.h>
 #include <asm/platform.h>
 
 /* Xen: The below defines are redefined within the file. Undef it */
@@ -302,9 +303,6 @@ static struct iommu_group *iommu_group_get(struct device *dev)
 
 /***** Start of Linux SMMU code *****/
 
-/* Maximum number of stream IDs assigned to a single device */
-#define MAX_MASTER_STREAMIDS		MAX_PHANDLE_ARGS
-
 /* Maximum number of context banks per SMMU */
 #define ARM_SMMU_MAX_CBS		128
 
@@ -597,8 +595,7 @@ struct arm_smmu_smr {
 };
 
 struct arm_smmu_master_cfg {
-	int				num_streamids;
-	u16				streamids[MAX_MASTER_STREAMIDS];
+	struct iommu_fwspec		*fwspec;
 	struct arm_smmu_smr		*smrs;
 };
 
@@ -779,7 +776,7 @@ static int register_smmu_master(struct arm_smmu_device *smmu,
 				struct device *dev,
 				struct of_phandle_args *masterspec)
 {
-	int i;
+	int i, ret = 0;
 	struct arm_smmu_master *master;
 
 	master = find_smmu_master(smmu, masterspec->np);
@@ -790,34 +787,37 @@ static int register_smmu_master(struct arm_smmu_device *smmu,
 		return -EBUSY;
 	}
 
-	if (masterspec->args_count > MAX_MASTER_STREAMIDS) {
-		dev_err(dev,
-			"reached maximum number (%d) of stream IDs for master device %s\n",
-			MAX_MASTER_STREAMIDS, masterspec->np->name);
-		return -ENOSPC;
-	}
-
 	master = devm_kzalloc(dev, sizeof(*master), GFP_KERNEL);
 	if (!master)
 		return -ENOMEM;
+	master->of_node = masterspec->np;
 
-	master->of_node			= masterspec->np;
-	master->cfg.num_streamids	= masterspec->args_count;
+	ret = iommu_fwspec_init(&master->of_node->dev, smmu->dev);
+	if (ret) {
+		kfree(master);
+		return ret;
+	}
+	master->cfg.fwspec = dev_iommu_fwspec_get(&master->of_node->dev);
+
+	/* adding the ids here */
+	ret = iommu_fwspec_add_ids(&masterspec->np->dev,
+				   masterspec->args,
+				   masterspec->args_count);
+	if (ret)
+		return ret;
 
 	/* Xen: Let Xen know that the device is protected by an SMMU */
 	dt_device_set_protected(masterspec->np);
 
-	for (i = 0; i < master->cfg.num_streamids; ++i) {
-		u16 streamid = masterspec->args[i];
-
-		if (!(smmu->features & ARM_SMMU_FEAT_STREAM_MATCH) &&
-		     (streamid >= smmu->num_mapping_groups)) {
-			dev_err(dev,
-				"stream ID for master device %s greater than maximum allowed (%d)\n",
-				masterspec->np->name, smmu->num_mapping_groups);
-			return -ERANGE;
+	if (!(smmu->features & ARM_SMMU_FEAT_STREAM_MATCH)) {
+		for (i = 0; i < master->cfg.fwspec->num_ids; ++i) {
+			if (masterspec->args[i] >= smmu->num_mapping_groups) {
+				dev_err(dev,
+					"stream ID for master device %s greater than maximum allowed (%d)\n",
+					masterspec->np->name, smmu->num_mapping_groups);
+				return -ERANGE;
+			}
 		}
-		master->cfg.streamids[i] = streamid;
 	}
 	return insert_smmu_master(smmu, master);
 }
@@ -1397,15 +1397,15 @@ static int arm_smmu_master_configure_smrs(struct arm_smmu_device *smmu,
 	if (cfg->smrs)
 		return -EEXIST;
 
-	smrs = kmalloc_array(cfg->num_streamids, sizeof(*smrs), GFP_KERNEL);
+	smrs = kmalloc_array(cfg->fwspec->num_ids, sizeof(*smrs), GFP_KERNEL);
 	if (!smrs) {
 		dev_err(smmu->dev, "failed to allocate %d SMRs\n",
-			cfg->num_streamids);
+			cfg->fwspec->num_ids);
 		return -ENOMEM;
 	}
 
 	/* Allocate the SMRs on the SMMU */
-	for (i = 0; i < cfg->num_streamids; ++i) {
+	for (i = 0; i < cfg->fwspec->num_ids; ++i) {
 		int idx = __arm_smmu_alloc_bitmap(smmu->smr_map, 0,
 						  smmu->num_mapping_groups);
 		if (IS_ERR_VALUE(idx)) {
@@ -1416,12 +1416,12 @@ static int arm_smmu_master_configure_smrs(struct arm_smmu_device *smmu,
 		smrs[i] = (struct arm_smmu_smr) {
 			.idx	= idx,
 			.mask	= 0, /* We don't currently share SMRs */
-			.id	= cfg->streamids[i],
+			.id	= cfg->fwspec->ids[i],
 		};
 	}
 
 	/* It worked! Now, poke the actual hardware */
-	for (i = 0; i < cfg->num_streamids; ++i) {
+	for (i = 0; i < cfg->fwspec->num_ids; ++i) {
 		u32 reg = SMR_VALID | smrs[i].id << SMR_ID_SHIFT |
 			  smrs[i].mask << SMR_MASK_SHIFT;
 		writel_relaxed(reg, gr0_base + ARM_SMMU_GR0_SMR(smrs[i].idx));
@@ -1448,7 +1448,7 @@ static void arm_smmu_master_free_smrs(struct arm_smmu_device *smmu,
 		return;
 
 	/* Invalidate the SMRs before freeing back to the allocator */
-	for (i = 0; i < cfg->num_streamids; ++i) {
+	for (i = 0; i < cfg->fwspec->num_ids; ++i) {
 		u8 idx = smrs[i].idx;
 
 		writel_relaxed(~SMR_VALID, gr0_base + ARM_SMMU_GR0_SMR(idx));
@@ -1471,10 +1471,10 @@ static int arm_smmu_domain_add_master(struct arm_smmu_domain *smmu_domain,
 	if (ret)
 		return ret == -EEXIST ? 0 : ret;
 
-	for (i = 0; i < cfg->num_streamids; ++i) {
+	for (i = 0; i < cfg->fwspec->num_ids; ++i) {
 		u32 idx, s2cr;
 
-		idx = cfg->smrs ? cfg->smrs[i].idx : cfg->streamids[i];
+		idx = cfg->smrs ? cfg->smrs[i].idx : cfg->fwspec->ids[i];
 		s2cr = S2CR_TYPE_TRANS |
 		       (smmu_domain->cfg.cbndx << S2CR_CBNDX_SHIFT);
 		writel_relaxed(s2cr, gr0_base + ARM_SMMU_GR0_S2CR(idx));
@@ -1499,8 +1499,8 @@ static void arm_smmu_domain_remove_master(struct arm_smmu_domain *smmu_domain,
 	 * that it can be re-allocated immediately.
 	 * Xen: Unlike Linux, any access to non-configured stream will fault.
 	 */
-	for (i = 0; i < cfg->num_streamids; ++i) {
-		u32 idx = cfg->smrs ? cfg->smrs[i].idx : cfg->streamids[i];
+	for (i = 0; i < cfg->fwspec->num_ids; ++i) {
+		u32 idx = cfg->smrs ? cfg->smrs[i].idx : cfg->fwspec->ids[i];
 
 		writel_relaxed(S2CR_TYPE_FAULT,
 			       gr0_base + ARM_SMMU_GR0_S2CR(idx));
@@ -1924,14 +1924,21 @@ static int arm_smmu_add_device(struct device *dev)
 			ret = -ENOMEM;
 			goto out_put_group;
 		}
+		cfg->fwspec = kzalloc(sizeof(struct iommu_fwspec), GFP_KERNEL);
+		if (!cfg->fwspec) {
+			kfree(cfg);
+			ret = -ENOMEM;
+			goto out_put_group;
+		}
+		iommu_fwspec_init(dev, smmu->dev);
 
-		cfg->num_streamids = 1;
+		cfg->fwspec->num_ids = 1;
 		/*
 		 * Assume Stream ID == Requester ID for now.
 		 * We need a way to describe the ID mappings in FDT.
 		 */
 		pci_for_each_dma_alias(pdev, __arm_smmu_get_pci_sid,
-				       &cfg->streamids[0]);
+				       &cfg->fwspec->ids[0]);
 		releasefn = __arm_smmu_release_pci_iommudata;
 	} else {
 		struct arm_smmu_master *master;
diff --git a/xen/drivers/passthrough/device_tree.c b/xen/drivers/passthrough/device_tree.c
index 999b831..acf6b62 100644
--- a/xen/drivers/passthrough/device_tree.c
+++ b/xen/drivers/passthrough/device_tree.c
@@ -140,6 +140,9 @@ int iommu_add_dt_device(struct dt_device_node *np)
     if ( !ops )
         return -EINVAL;
 
+    if ( dt_device_is_protected(np) )
+        return 0;
+
     if ( dev_iommu_fwspec_get(dev) )
         return -EEXIST;
 
-- 
2.7.4


