Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3332696BCB0
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2024 14:44:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.790256.1200001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slpMg-0006CS-Qf; Wed, 04 Sep 2024 12:44:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 790256.1200001; Wed, 04 Sep 2024 12:44:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1slpMg-00069u-O2; Wed, 04 Sep 2024 12:44:02 +0000
Received: by outflank-mailman (input) for mailman id 790256;
 Wed, 04 Sep 2024 12:44:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LMDu=QC=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1slpMf-00069o-HY
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2024 12:44:01 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20611.outbound.protection.outlook.com
 [2a01:111:f403:2408::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5b38e0bd-6abb-11ef-99a1-01e77a169b0f;
 Wed, 04 Sep 2024 14:43:59 +0200 (CEST)
Received: from CH2PR20CA0010.namprd20.prod.outlook.com (2603:10b6:610:58::20)
 by DM6PR12MB4419.namprd12.prod.outlook.com (2603:10b6:5:2aa::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27; Wed, 4 Sep
 2024 12:43:55 +0000
Received: from CY4PEPF0000FCBF.namprd03.prod.outlook.com
 (2603:10b6:610:58:cafe::2) by CH2PR20CA0010.outlook.office365.com
 (2603:10b6:610:58::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.27 via Frontend
 Transport; Wed, 4 Sep 2024 12:43:55 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCBF.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Wed, 4 Sep 2024 12:43:54 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 4 Sep
 2024 07:43:53 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Wed, 4 Sep 2024 07:43:52 -0500
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
X-Inumbo-ID: 5b38e0bd-6abb-11ef-99a1-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wo8b01x2zTcBEkMyP0hHU3QnoKcJjtu1GfxQ13dTca+4hHM0iZbeua5J0SsKDLnZUhevLmtDYSHtZI4o/MXlP63l0ZDeF1rgZb9PvO8XiOziprzko/aD8rgi+W+RxL4aaa8fJz3pmKK6OCRbHSZFndjkguNTca4A6Gtxb8xAsGziLexemlfVdClCVBj7TRSCcRSqGC5OtX4m3ocxtYyJXMMVKk7vhZLz/fkIsW0jYrAHrT7PJpqS1TZ/pWCevvx/NhF+5bxUsGVOiUGN+vDC8gEwfiAqiW1+OYvSMceoCwOeeg7nG3wreqxzEPWOAej0Vz2+WgaR25e6yjO1Q0erCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t4aDycOgF3J4oZvhTiXzfFnja/EfK1sdRKYoPfoj2U4=;
 b=YrSbk0axl30XNbPpiBqlR088PKa3lU+uKWTsyfc/xguunrVCzOpsHS6S22My4hpj4jx+yZVc0mQ5FZt4yxQuoFCXOyIAIc3tBDOyepC5SkRF6Hor8nUUhjA3Kkl0tMbGX5Y4DBnBKlF45wQ5NUkg2CthCwjVTpB5IAO7QFQaXjJRXnIzU33z3dCi0HKRxbQQTtQIMmJVCqwOeg02kEruyN0PAyHhyU6MjG/wqPrNXYEBHu6Smqx5f3p6sPbTtj6gwD908uGIELF1Xg5C969BNohvERUT/HhWjjoAGhAoEc9bKZ1PNLhqL4sC90YDJj+iWxtBEahbftRXb42W128JGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t4aDycOgF3J4oZvhTiXzfFnja/EfK1sdRKYoPfoj2U4=;
 b=YSlrCg70DnV3xpgAC1TaQLU/ISJpXsqB+12pdF1VxJ8qzjBp0djNYxrVTi9t5fNKxxwEPaw02DAxCT2txpRLwCBXAu50ViBQY5JP+2rmmk2raXsTtW09orHC9ba1r7reSX9dGh9OTGy4JxZCLmLTyjexBcZdVd7BtVT8igjBuXI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, "Rahul
 Singh" <rahul.singh@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [PATCH] arm/smmu: Complete SMR masking support
Date: Wed, 4 Sep 2024 14:43:49 +0200
Message-ID: <20240904124349.2058947-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBF:EE_|DM6PR12MB4419:EE_
X-MS-Office365-Filtering-Correlation-Id: f60c44d1-7b84-44da-9aa7-08dcccdf3cd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gAnXf0ZL+xwHfby996n574RECTbEMFTqgy2wQzNLr91YEty+XKGZNUGN/1PF?=
 =?us-ascii?Q?kR2f0lQcDX6It6KbjZcQAfPzrkgbWOLaD/SoLXJAnejWJANgqkesCp7KXzeA?=
 =?us-ascii?Q?I8ryARsUw3IaHrJx9X+xnbdHYqb9/KBG1KI2AOgXa973SvdRx45Ent1Pc3Xd?=
 =?us-ascii?Q?PVt7YxOkdU95EJHKrFc3ZxrmDDDDZpSlFhv76mcPyGvN+VZrdLTOqmPwHoDm?=
 =?us-ascii?Q?kShb0xvzLaBqUstgj+wz+1y1ZT610ZH4Jxv4EGvNg2PEb1FDZpSaxGGcHkTe?=
 =?us-ascii?Q?+M2zlF+RYSvoGu8siKp65Gm7C9Z2c4JJq4DSmc9476HEhOwjD45U5kcdtdle?=
 =?us-ascii?Q?DULl1XUlpTWV33HhtkSnSHGI6qObDS9n+kPvPWKCe7NLNblfq72d/gAhw3qQ?=
 =?us-ascii?Q?/yEG3QVncK0hq3DlPPfcAKIDAyDlcutJT4O7Hsm1jWvQSCWwA9qh88J4yd+t?=
 =?us-ascii?Q?m4CGfPxZCiFjrrmFrq0Z1qUuvQI046tadvmXjmXqF/QybQcrcLmFxu93jeTi?=
 =?us-ascii?Q?bT9X6WpXr13DitIs12wChgkdOwbGT8HvAJxN+ozT1f17Kl1xRxHOp8wxcVHt?=
 =?us-ascii?Q?43pn01EYettSYU148/II4TjuoLlZVxAOgSl9FyMWEWIyv2835wQB/ImDBeiR?=
 =?us-ascii?Q?S25nWlkrqpefS78rqjKvnHyem8QU9fc/eDiGi6qs99CC96kZ6ceGZmsgvwvv?=
 =?us-ascii?Q?8Mh0mT9E+DV1xpiEvXu488BLW4WOh/lw+Rv5kreuI7f1VR41wRiWxjy6uJjd?=
 =?us-ascii?Q?pAHO0R3g5KYvthBFc9MrXlhV2MoBHDsUcivNTX+ab21J5cFoaieq8ZYdl+ll?=
 =?us-ascii?Q?WtWe/bYjOccQRxg/7VXFnWNauJhodFWUe7WJbykgqJglqc8qaV2/dCvs9DSi?=
 =?us-ascii?Q?oFDweBkVXJtaK3kGwTP5zA65a9QunygrXW9h+RWXT0mtfnx31B7zBpEYPN55?=
 =?us-ascii?Q?to3QDCG+vtZXU7M0wgY8uBWcXZBgPnzIlcCg+M7x/hGCKi7mxVpj3Km+C0hr?=
 =?us-ascii?Q?1Aib8UGfXrEIoaAxXULHR4UUP3qrxU6dtnKxRrwfkDAlIQZfWpLlEDNlFVXo?=
 =?us-ascii?Q?Vo88TubEYN8P80mAHvCf5t87M+ZxXheCs74lmIBwnYVSgYiHgl1TEObVTZHd?=
 =?us-ascii?Q?15QgQIQOu1ySD/EjxlJ2ltuXKq5g+Wv4a/qXrja9/N7rhUBhps1HY3yM0pLw?=
 =?us-ascii?Q?5mLFZrP1EYpyDd7T0y8oWpyljCDErUGa/lLmUhSM2JPrOHKULpZalNbiMuaF?=
 =?us-ascii?Q?njuNflCsI4/WhdfmMy7KEYNPp+npZyuNj4Jzodw5+AZhok+pdijH8XKvlSwM?=
 =?us-ascii?Q?/bLM1QTvWoc/nfPu98reaLDN9ohQmN0NP8wLm2wt2W2EW3SYL1HWkhbhOAfE?=
 =?us-ascii?Q?AeWMtguku4lUVkH/B4XadufZ/LshEjR5zAJ4oNHbyD9Xw3k+VJiXgrlTYGqi?=
 =?us-ascii?Q?zklYvIqEJrluYV31VISwGtJCyvuAEWbR?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2024 12:43:54.8635
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f60c44d1-7b84-44da-9aa7-08dcccdf3cd3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCBF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4419

SMR masking support allows deriving a mask either using a 2-cell iommu
specifier (per master) or stream-match-mask SMMU dt property (global
config). Even though the mask is stored in the fwid when adding a
device (in arm_smmu_dt_xlate_generic()), we still set it to 0 when
allocating SMEs (in arm_smmu_master_alloc_smes()). So at the end, we
always ignore the mask when programming SMRn registers. This leads to
SMMU failures. Fix it by completing the support.

A bit of history:
Linux support for SMR allocation was mainly done with:
588888a7399d ("iommu/arm-smmu: Intelligent SMR allocation")
021bb8420d44 ("iommu/arm-smmu: Wire up generic configuration support")

Taking the mask into account in arm_smmu_master_alloc_smes() was added
as part of the second commit, although quite hidden in the thicket of
other changes. We backported only the first patch with: 0435784cc75d
("xen/arm: smmuv1: Intelligent SMR allocation") but the changes to take
the mask into account were missed.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/drivers/passthrough/arm/smmu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu.c b/xen/drivers/passthrough/arm/smmu.c
index f2cee82f553a..4c8a446754cc 100644
--- a/xen/drivers/passthrough/arm/smmu.c
+++ b/xen/drivers/passthrough/arm/smmu.c
@@ -1619,19 +1619,21 @@ static int arm_smmu_master_alloc_smes(struct device *dev)
 	spin_lock(&smmu->stream_map_lock);
 	/* Figure out a viable stream map entry allocation */
 	for_each_cfg_sme(cfg, i, idx, fwspec->num_ids) {
+		uint16_t mask = (fwspec->ids[i] >> SMR_MASK_SHIFT) & SMR_MASK_MASK;
+
 		if (idx != INVALID_SMENDX) {
 			ret = -EEXIST;
 			goto out_err;
 		}
 
-		ret = arm_smmu_find_sme(smmu, fwspec->ids[i], 0);
+		ret = arm_smmu_find_sme(smmu, fwspec->ids[i], mask);
 		if (ret < 0)
 			goto out_err;
 
 		idx = ret;
 		if (smrs && smmu->s2crs[idx].count == 0) {
 			smrs[idx].id = fwspec->ids[i];
-			smrs[idx].mask = 0; /* We don't currently share SMRs */
+			smrs[idx].mask = mask;
 			smrs[idx].valid = true;
 		}
 		smmu->s2crs[idx].count++;
-- 
2.25.1


