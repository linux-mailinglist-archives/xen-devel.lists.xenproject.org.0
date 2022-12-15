Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A4864E30E
	for <lists+xen-devel@lfdr.de>; Thu, 15 Dec 2022 22:27:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.463884.722169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5vkP-0008Ng-3r; Thu, 15 Dec 2022 21:26:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 463884.722169; Thu, 15 Dec 2022 21:26:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p5vkP-0008LP-0B; Thu, 15 Dec 2022 21:26:33 +0000
Received: by outflank-mailman (input) for mailman id 463884;
 Thu, 15 Dec 2022 21:26:31 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q86o=4N=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1p5vkM-0008LI-VQ
 for xen-devel@lists.xenproject.org; Thu, 15 Dec 2022 21:26:31 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2069.outbound.protection.outlook.com [40.107.94.69])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 22172d7d-7cbf-11ed-8fd3-01056ac49cbb;
 Thu, 15 Dec 2022 22:26:28 +0100 (CET)
Received: from DS7PR03CA0100.namprd03.prod.outlook.com (2603:10b6:5:3b7::15)
 by IA0PR12MB8325.namprd12.prod.outlook.com (2603:10b6:208:407::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.12; Thu, 15 Dec
 2022 21:26:24 +0000
Received: from DS1PEPF0000E642.namprd02.prod.outlook.com
 (2603:10b6:5:3b7:cafe::43) by DS7PR03CA0100.outlook.office365.com
 (2603:10b6:5:3b7::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.12 via Frontend
 Transport; Thu, 15 Dec 2022 21:26:24 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0000E642.mail.protection.outlook.com (10.167.17.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5924.8 via Frontend Transport; Thu, 15 Dec 2022 21:26:23 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 15 Dec
 2022 15:26:23 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Thu, 15 Dec
 2022 15:26:22 -0600
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Thu, 15 Dec 2022 15:26:20 -0600
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
X-Inumbo-ID: 22172d7d-7cbf-11ed-8fd3-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aiP6j3KmeuQBWChrnEtj1rWSN+G2gjyk5OV87vaRyRoGctXjrLqtoLAqmyprM2ijW0UHBTBqIUWWuftoovuY5CwR6FeA8cwDxg+/+1naGl8ACsYuoN5Ehm7HvAQMLJQbMSKt6P2hgcolVqmAM5VG7NFZ65UBzfCDyNmBDlAgQsVazivnkxN1ffj4SY9IoujRpqMYfQAu5utVUWYxassy2nLynNsuYGD4BMHyL9981L1duf7x0KRGYYwQX9Wt49z0PrjFH3fRcoFAMJtGPGCB9Zlx0dT1WULRAnLQB/CT10IK5zvVy+KYBAVqpv8efUXMI6OcD2Plisd493BudOVcoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ljuQWQEtTPReGihcK1oLWIA2nnJYgm6prEGP32L0Pmg=;
 b=J6ObvvrVJz2AxdpaTne+5Af5wv+gRbDG+Fx4CODnaE0gk5O6OgdBopGPf6yWRcKjRiCQrN65QnebVB4Z63e4VAUmVdZGhJP3HLzsAi1lbZbwZozSs5Kz1eYLVizHh+8r51GOVdt9SKUnvhqIN207PgxBZ7jXvsHvcbFnUf9rZRjxcdRE8sQODKG18hYi/9Y3c6OzINvazuossCICsz5NXi4cY4GZrIeemrGliumEPkGnImllc5RvQMcQ6efmyPZXBHm3UhA+Nb1OdVgO17+CdTq3mK9tPiD+MzN8Ru1LPSCzWC0inIkz0evrG1mKvaFUih1dezTQXzN1wFB/1TQUxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ljuQWQEtTPReGihcK1oLWIA2nnJYgm6prEGP32L0Pmg=;
 b=XZbR79SSjXxeQ+55ntkHTeStY8hI6s6X9aZ1LK+Uz+qtymwfzgbPbwY0zYy3yRM85MoRL+ZE/TggPRF2Aocy3zKGr8oRLr93N2aLcX9nYEhS0gK3vdpwuhpbY4gLRy9PSXutiMTz3kbZtPwMmYXl1dNWqTZbPGq6bOEhkdc9UoI=
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
Subject: [PATCH v3] xen/arm: smmuv3: mark arm_smmu_disable_pasid __maybe_unused
Date: Thu, 15 Dec 2022 16:26:19 -0500
Message-ID: <20221215212619.78686-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E642:EE_|IA0PR12MB8325:EE_
X-MS-Office365-Filtering-Correlation-Id: f5646c02-2b89-438e-3ff9-08dadee30449
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tjpdDUPO11BCjeKkfs9pvRLLsy4Jcd0C3A7kWr86kRoIsP5dCBhBGEUXlbAE8Cjjx4HM8XEOB7+wHqZubjUFJYXqlI80F+h7MhJheOwEa0CdJviHkGy6Josx1h8WWMp+QmM+Af0wU7QIA5QyNTIkiEljvbVdA84/bkEquuNspTU0/Wx0bi5xsln0POmmdiGjTUX2QR3fsNlFUG/rUEStk96HnPFPpi+D2/k+TgY5O4vPFHe24lNt9NTL/gheSXjbuBkI4h1OFvo98GRs3W9pw1VOqzt0pxYRTQJvWmiRgQnmLeNa8bWxhcimILu+0yagUfe6tYbqTbaTVW9mprzrqTd9JhvYlx7HVod/KG/A3FM6BH3DgSW1zmnmijEX6A3VpvgFXuR4P5E7FwLcG6k43hiOjSJesPiwzsyfZ1Lcw8ZAzVPYlfZJLTmGP2Q74DrGuL8V9uUPvVFycJrKtUQGDViir72hwiRkkOqbWQOSaATJaq0LvhkrTndu9fIQYEXBgpHLjH64GhdtHebuXmeSZfI9omU6PvoilJsBktfSvHe5qMNSTzjGSESnjRcpY/UzOi9Ek264pbqbEtQ8MUeIqw1nzJ2R6lMdfhjesEMPzN9kFBGxLrDQqexY+QtY8mI5+MPFb9pvZl7OgQsgco6A0qeU8HtM5OH4FAYwcdIM3FFrHFkyqUTkEP7e0bNBHJvG+FUoeyH8JbCW4o9bqsO3R7xmub+olClcKVJSQsTko6c=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:CA;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(396003)(346002)(39860400002)(136003)(451199015)(40470700004)(46966006)(36840700001)(8676002)(8936002)(4326008)(1076003)(2616005)(36860700001)(70586007)(2906002)(70206006)(36756003)(356005)(82310400005)(186003)(81166007)(26005)(6916009)(44832011)(54906003)(40460700003)(83380400001)(316002)(336012)(40480700001)(5660300002)(47076005)(478600001)(86362001)(82740400003)(41300700001)(426003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2022 21:26:23.6417
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f5646c02-2b89-438e-3ff9-08dadee30449
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0000E642.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8325

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
Reviewed-by: Rahul Singh <rahul.singh@arm.com>
---
v2->v3:
Place __maybe_unused after "void" and add newline after __maybe_unused
Add Rahul's R-b

v1->v2:
Add __maybe_unused attribute instead of removing
---
 xen/drivers/passthrough/arm/smmu-v3.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
index 9c9f4630090e..d58c5cd0bf77 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -1376,7 +1376,8 @@ static int arm_smmu_enable_pasid(struct arm_smmu_master *master)
 	return 0;
 }
 
-static void arm_smmu_disable_pasid(struct arm_smmu_master *master)
+static void __maybe_unused
+arm_smmu_disable_pasid(struct arm_smmu_master *master)
 {
 	struct pci_dev *pdev;
 
@@ -1405,7 +1406,8 @@ static inline int arm_smmu_enable_pasid(struct arm_smmu_master *master)
 	return 0;
 }
 
-static inline void arm_smmu_disable_pasid(struct arm_smmu_master *master) { }
+static inline void __maybe_unused
+arm_smmu_disable_pasid(struct arm_smmu_master *master) { }
 #endif /* CONFIG_PCI_ATS */
 
 static void arm_smmu_detach_dev(struct arm_smmu_master *master)
-- 
2.39.0


