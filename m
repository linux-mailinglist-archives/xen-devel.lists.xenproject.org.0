Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D9AF364A483
	for <lists+xen-devel@lfdr.de>; Mon, 12 Dec 2022 17:01:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.459770.717544 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4lEX-0000z7-RY; Mon, 12 Dec 2022 16:00:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 459770.717544; Mon, 12 Dec 2022 16:00:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4lEX-0000xB-OS; Mon, 12 Dec 2022 16:00:49 +0000
Received: by outflank-mailman (input) for mailman id 459770;
 Mon, 12 Dec 2022 16:00:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Sjdt=4K=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1p4lEW-0000x3-GT
 for xen-devel@lists.xenproject.org; Mon, 12 Dec 2022 16:00:48 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2078.outbound.protection.outlook.com [40.107.212.78])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 23745ced-7a36-11ed-91b6-6bf2151ebd3b;
 Mon, 12 Dec 2022 17:00:46 +0100 (CET)
Received: from DM6PR17CA0016.namprd17.prod.outlook.com (2603:10b6:5:1b3::29)
 by DM8PR12MB5462.namprd12.prod.outlook.com (2603:10b6:8:24::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Mon, 12 Dec
 2022 16:00:42 +0000
Received: from DM6NAM11FT071.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1b3:cafe::66) by DM6PR17CA0016.outlook.office365.com
 (2603:10b6:5:1b3::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.10 via Frontend
 Transport; Mon, 12 Dec 2022 16:00:42 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT071.mail.protection.outlook.com (10.13.173.48) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5901.21 via Frontend Transport; Mon, 12 Dec 2022 16:00:41 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 12 Dec
 2022 10:00:40 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 12 Dec
 2022 10:00:34 -0600
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Mon, 12 Dec 2022 10:00:33 -0600
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
X-Inumbo-ID: 23745ced-7a36-11ed-91b6-6bf2151ebd3b
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iHhKskPEFEnNNQiCKIOUjgNNN+tdHBEG2NIH4gtMZD3NxaTaeYnD3ojOAiTihu67oYYdctHPhV6nR9rpEknXkkLvtBFh7FyLAHtLde/NKqnADWSo5lnc2JluRes+ZczWz4BcAHZqzBsiW/y2g3fCXo9/Zq9TES9hQdWEkjd20ovaKU/4IFg8DnV0IwoTrv83wkNEn28ne1pmcbAbloJ5zU+QN/ffpGVBS/aC7JSqyX9DR//SoYZCfRq5l+qZcbBtcedoWFV4i/RvOndKLl2/0rsfUwk1JgU1WadrccXSy5ofEakprT0nS0OaUynXlI1Lwc9RbA33YkkmEtqqPDx6qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cwR3TvcwiCf5uSnerTtdKAUsWBq8IxQW7OLe1vZOurE=;
 b=AfEsFFt6Q+6TAHnH7Ex4wnmoZlWZU0wGs8UX5t8sQtPO2tyCyC9+D/ixzJJzywFqBGLuBM3+1saJ4m4NNOhrbvc4IfsWf58MG4+cxZ9PCPxC89AgO6ifaaUoDF+fNjqDuOt6/BoZ2OvVmCoONTTKg7P7ZRx0xzrFF9gTKJb/xORKRxtfyiSUFv8wNLgBI9i5gfQY1v/O+pjz83j1JUV1EtKihSPc3OfrERX2lTSvXpmlSa0rEAUQTudi55FW6V8anqMJvhEi/AcbYqGYyIScLJvueQGnAU2eiu4Ywehb2nXDGxKuIcjV+qEaFJhFfGhIZ07+w6ddn5nZMG/naheM0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cwR3TvcwiCf5uSnerTtdKAUsWBq8IxQW7OLe1vZOurE=;
 b=fIHN0DE9Bj4za66ap+cYQOwiM2xkDjMuI+83NZPi8gUKaiR30N3ygnxbSj4NGYxgXFl69Bw0i7sU2hIcclvFqV851iPu8iONn1MaHVAWPpZqCXbFlmAUbCtZGLpaZSoHdWFWBSBDZbJPnPTrkUmqq6AIvqgrlUpJWeZ0NRbKiuc=
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
Subject: [PATCH] xen/arm: smmuv3: remove unused function
Date: Mon, 12 Dec 2022 11:00:31 -0500
Message-ID: <20221212160031.31590-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.38.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT071:EE_|DM8PR12MB5462:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d88866c-feab-4cf0-a5c5-08dadc5a053a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ecBFuaoJdPs9jSuP4ZsD4Q+6dwDK90Uc7jdQv0khpbA/MoWc2k4dBmHs9w77Tn5TYoODiD2h2ALszOcuScjGdQATJOr6eWS2r+dDp7/I8l1hXRoWhAazVzAreOcduHynfbm859dkPm2jQ6zun4wf3aH8o1K77oLoq/y+59fi0kchGfT5Zapu+MpTG1ok16tj4BNajUkQ2tWrf9kKSSUuyQg5+VGL5rg6o0+cUDtcBjDDnjNR/MjgItU6zwoYU6Lu2wPH//eFpCh61aY6ZVCbwf1BYu9pia6aU42fM670w9LWcbYhZXQJDT0XaE6w+ytKjIcBF0AxZk7U3Xld88LYQu1tIXjm3Zqwe0kknFX/FSJHJnyAEZ1v5+8OTQaIuyMn4dlthHW+NxKcDBl9R91A9BE07dFcyQHvOHm24N5g875AE5xu8fkLsZ9qXIgpCjyP00IRwE3mzvSQFLxRQt5l/8fJfAy2/IP6/lWCakvvxICkIdvnlXOPoDmUYVsumJ8z7CB52SnHJ9+BVZYlsLgNLdkC0ffSZ9S0Z6G5s2hJ0neHG05Z31kBqxuOgL6SB4hri1EQUbSk2JG8ZfaMIewPhZV6s9+rNdIKGKi8pz1EQqZ2rKUF4v1swcgiSqZsYE0Tc6ripVLYF8Amhq+tyySgcvlw8funEwgIuQAm/Uwjccmw9tBHlnpvzG/05BNF0kEn6kNT5mdvI36w5h7kmb++M/dsnjBNCBMhKCF4RIfERvY=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:CA;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(376002)(136003)(346002)(451199015)(36840700001)(40470700004)(46966006)(2906002)(81166007)(82740400003)(44832011)(356005)(40480700001)(26005)(70586007)(8936002)(36756003)(36860700001)(41300700001)(8676002)(70206006)(82310400005)(86362001)(5660300002)(6916009)(54906003)(316002)(4326008)(336012)(478600001)(426003)(40460700003)(1076003)(186003)(83380400001)(47076005)(2616005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2022 16:00:41.8464
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d88866c-feab-4cf0-a5c5-08dadc5a053a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DM6NAM11FT071.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR12MB5462

When building with clang 12 and CONFIG_ARM_SMMU_V3=y, we observe the
following build error:

drivers/passthrough/arm/smmu-v3.c:1408:20: error: unused function 'arm_smmu_disable_pasid' [-Werror,-Wunused-function]
static inline void arm_smmu_disable_pasid(struct arm_smmu_master *master) { }
                   ^

Remove the function.

Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
There is also a definition of arm_smmu_disable_pasid() just above,
guarded by #ifdef CONFIG_PCI_ATS. Should this one be removed too? It
might be nice to keep this definition for ease of backporting patches
from Linux, but if we ever plan on supporting PCI_ATS in Xen this may
need to be re-visited.

This is a candidate for backport to 4.17, 4.16, and possibly 4.15,
although 4.15 has other issues with clang 12.
---
 xen/drivers/passthrough/arm/smmu-v3.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
index 9c9f4630090e..f54d85cb4b70 100644
--- a/xen/drivers/passthrough/arm/smmu-v3.c
+++ b/xen/drivers/passthrough/arm/smmu-v3.c
@@ -1404,8 +1404,6 @@ static inline int arm_smmu_enable_pasid(struct arm_smmu_master *master)
 {
 	return 0;
 }
-
-static inline void arm_smmu_disable_pasid(struct arm_smmu_master *master) { }
 #endif /* CONFIG_PCI_ATS */
 
 static void arm_smmu_detach_dev(struct arm_smmu_master *master)
-- 
2.38.2


