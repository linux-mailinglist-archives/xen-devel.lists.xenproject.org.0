Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE8F64BBCF
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 19:19:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.461035.719063 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p59s2-00039G-Jd; Tue, 13 Dec 2022 18:19:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 461035.719063; Tue, 13 Dec 2022 18:19:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p59s2-00037G-GM; Tue, 13 Dec 2022 18:19:14 +0000
Received: by outflank-mailman (input) for mailman id 461035;
 Tue, 13 Dec 2022 18:19:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+6Gs=4L=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1p59s0-00036r-QX
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 18:19:13 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2079.outbound.protection.outlook.com [40.107.212.79])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a30f48ae-7b12-11ed-8fd2-01056ac49cbb;
 Tue, 13 Dec 2022 19:19:10 +0100 (CET)
Received: from DS7PR07CA0001.namprd07.prod.outlook.com (2603:10b6:5:3af::10)
 by DS7PR12MB6023.namprd12.prod.outlook.com (2603:10b6:8:85::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5880.19; Tue, 13 Dec 2022 18:19:08 +0000
Received: from DS1PEPF0000E64A.namprd02.prod.outlook.com
 (2603:10b6:5:3af:cafe::ac) by DS7PR07CA0001.outlook.office365.com
 (2603:10b6:5:3af::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19 via Frontend
 Transport; Tue, 13 Dec 2022 18:19:08 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E64A.mail.protection.outlook.com (10.167.18.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5924.8 via Frontend Transport; Tue, 13 Dec 2022 18:19:07 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 13 Dec
 2022 12:19:06 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 13 Dec
 2022 12:19:06 -0600
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 13 Dec 2022 12:19:04 -0600
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
X-Inumbo-ID: a30f48ae-7b12-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RI8VFlAqqHqimwKDuy1HuZmec6201RvgDJkMloCiuQtAq2XUR3BlPk+OARfPLcYPxbKiRuNga7H8VaWEmoUWD04myp8ot2fTNDgEXAGFM+f89GOq1XlUSp+GTqMHCCPwZKH1KMStzTvb0A3ldtXG2QBTQzYkSt0a6DyEbCWndGYVVhX9Hv4mQ1yZVTYAJGgLQ4Sf8sfNjsUZ/IFAp7hKIiZ3qaFcQVX890jjJ8ThT6V4DruotiaRO2AAaG+dxD7ItQPn+lnjcc8MI4NLvsusr0VoUyOhR3bunAEPG3VzbGnBEfy95UcmVUbbhuxf3LdQQ2ePBPhTuE5eCUe8LKw3qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LmPmK2+6Wu9pcJ1F0gBeU8LzctlkNxLzw3IfsluHrjk=;
 b=NU76HvOGwEh7b4ZGk/VSnZAJcfEErGfiw0Boiwe/mYq+RrHcLWMMWKVpEIpI0KToRfmpMFAbLnSD3gIg/LTiOacSMpvQi8As+BzKcRYIF0SX/SG4f37PusW7tTTk4xva1UdQzavk5hWBHQwP1HlQuWMjENn2D7muvhZ2Ed2iWeBqok2nxzH52MlEw07a+4XOBcUg2xCfAmULT3VTcGtE76/In/gKHMAAZuwbhBmArb07ZatDScVEUk6IQFJAb/LnXqh9tMYXQbd0kgu+00oD4H1TavUFNGzgSJa9FyhGXTGNzTcEEsEwjdhvJmQWuv3O3EVFSAPfsXPPR2L8L4029Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LmPmK2+6Wu9pcJ1F0gBeU8LzctlkNxLzw3IfsluHrjk=;
 b=11OrP9QUtpLV2jL8169LTqBylJTAPLkDrV7p1BV7Dd4il1mKiaaGErMQCjXi3aF2ggBsm/xWJT7JZDPRycm1L5QUySnTXrzJLw2zV5ZF+gsjfysphACn6RPtb5NsYLy/0uEfUwp88zN6Xh96YgNvWuyDX0gXlz3o8GMBtdRTBAg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Rahul Singh <rahul.singh@arm.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2] xen/arm: smmuv3: mark arm_smmu_disable_pasid __maybe_unused
Date: Tue, 13 Dec 2022 13:18:55 -0500
Message-ID: <20221213181855.81713-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E64A:EE_|DS7PR12MB6023:EE_
X-MS-Office365-Filtering-Correlation-Id: be150b85-11b3-45c1-3662-08dadd36861b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ZuRlFbK5U3twr3K6h+4BboDPrZLPrWa4PQnWI5SH0iM3mzjWnZlpcI90q7IgB3A6PIs4KxrRkSnqRaNl4l8AAv2HgOANgPN6COBBA0n2eySWSmc4MQmPNNs1CC6OR3zdc1+ChoyCKXp7ajsPfO9y6U4ejTZ+4FuujIe3dlsbEnYzKF29zCY+48vRS47cWcHIRvkTmfWCazn/YtqfXayhk8gmfMZhjgkjoKl3Vqr+nF92mljT1Ea8VUc6mzDXUGSWBKVsw0c/o8YOtdUzPUQZiEjX1L5/6RKSXkEPLNQw1R13GwKFSJB5miLlyDXQ+sghckT9yDuGk+fYd+2v27gtFG2pPo8Lepd7GNR/GI8cKQR8ClezCml0LWjpASTLiqeNi0fR8BYjp6R4U0wFgcGDu7BnB1JO6XG9dRMtDw0W0cr9dQVBIiJTT0JpzfgwARtuTF82iyHe/mQXi3pCD3eA2iorkuJWqCci34/8+LkEyYppF94ucBtTKo4ya+BJZbbtZUmiwH0sygxtKcixCw0vgSObTlhYF4ZTYLp9NUBuUJVZxx1bvIO42uSuQjtgIZaPSIE20DHXfRp5QA7cqGg8iPqYGil3u+Is3efJs7IgiaN+ectv3ql586FCFpcjfIYgUmg8oCcDS2yIvWqobQGIbptZDW/9u3Idsy8bn9OZLSRNKwcUlwU+J9sF3G6lii9h2n39J+/lpXs6TXS+9H0lkX8zV0v6GV5EuETEtsof8MY=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:CA;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(376002)(396003)(346002)(39860400002)(451199015)(36840700001)(46966006)(40470700004)(81166007)(82740400003)(356005)(36860700001)(41300700001)(40480700001)(86362001)(82310400005)(40460700003)(6666004)(8936002)(478600001)(4326008)(426003)(8676002)(70586007)(6916009)(186003)(70206006)(2906002)(47076005)(54906003)(26005)(316002)(1076003)(336012)(44832011)(2616005)(5660300002)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2022 18:19:07.3468
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be150b85-11b3-45c1-3662-08dadd36861b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0000E64A.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6023

When building with clang 12 and CONFIG_ARM_SMMU_V3=y, we observe the
following build error:

drivers/passthrough/arm/smmu-v3.c:1408:20: error: unused function 'arm_smmu_disable_pasid' [-Werror,-Wunused-function]
static inline void arm_smmu_disable_pasid(struct arm_smmu_master *master) { }
                   ^

arm_smmu_disable_pasid is not currently called from anywhere in Xen, but
it is inside a section of code guarded by CONFIG_PCI_ATS, which may be
helpful in the future if the PASID feature is to be implemented. Add the
attribute __maybe_unused to the function.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
v1->v2:
Add __maybe_unused attribute instead of removing
---
 xen/drivers/passthrough/arm/smmu-v3.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
index 9c9f4630090e..0cdc862f96d1 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -1376,6 +1376,7 @@ static int arm_smmu_enable_pasid(struct arm_smmu_master *master)
 	return 0;
 }
 
+__maybe_unused
 static void arm_smmu_disable_pasid(struct arm_smmu_master *master)
 {
 	struct pci_dev *pdev;
@@ -1405,6 +1406,7 @@ static inline int arm_smmu_enable_pasid(struct arm_smmu_master *master)
 	return 0;
 }
 
+__maybe_unused
 static inline void arm_smmu_disable_pasid(struct arm_smmu_master *master) { }
 #endif /* CONFIG_PCI_ATS */
 
-- 
2.39.0


