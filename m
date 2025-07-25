Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 244D4B12180
	for <lists+xen-devel@lfdr.de>; Fri, 25 Jul 2025 18:13:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1058208.1425887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufL2z-0001Gx-TE; Fri, 25 Jul 2025 16:13:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1058208.1425887; Fri, 25 Jul 2025 16:13:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ufL2z-0001Dm-PX; Fri, 25 Jul 2025 16:13:25 +0000
Received: by outflank-mailman (input) for mailman id 1058208;
 Fri, 25 Jul 2025 16:13:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=22Yz=2G=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1ufL2x-0001Dg-Q4
 for xen-devel@lists.xenproject.org; Fri, 25 Jul 2025 16:13:23 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20630.outbound.protection.outlook.com
 [2a01:111:f403:2418::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 45b0d1bc-6972-11f0-a31e-13f23c93f187;
 Fri, 25 Jul 2025 18:13:17 +0200 (CEST)
Received: from BL1PR13CA0329.namprd13.prod.outlook.com (2603:10b6:208:2c1::34)
 by SJ2PR12MB8650.namprd12.prod.outlook.com (2603:10b6:a03:544::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.40; Fri, 25 Jul
 2025 16:13:13 +0000
Received: from BL6PEPF0001AB52.namprd02.prod.outlook.com
 (2603:10b6:208:2c1:cafe::70) by BL1PR13CA0329.outlook.office365.com
 (2603:10b6:208:2c1::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.6 via Frontend Transport; Fri,
 25 Jul 2025 16:13:12 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB52.mail.protection.outlook.com (10.167.241.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Fri, 25 Jul 2025 16:13:11 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 25 Jul
 2025 11:13:11 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 25 Jul 2025 11:13:10 -0500
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
X-Inumbo-ID: 45b0d1bc-6972-11f0-a31e-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yjYTKI1a+tfMCc3GhAtz6vQlII+3PvsxcaBNyp5hGEnQGIbAtq7flFAVqVBcZa/mvWAfMzCr/Gcy7WngpVz3WxubGzvnXR6CTz8ru9puFUMg4ovQoJsRTAu4GV7/SiSNYrdLg0QJ4pCShSUjlRn45UFT0AYptxmyzedcpX7z/rJdoGMlsmcyEyAmB/DFl+ubNHlDz0iQQYz3LVQ8s92d9LaKCH8jvQtYlU4HVzVwAI8z+0tBJwkicR5GeUFEVLi8n2uBqp/QtsjBuex10AqKAOKGq8abacrwxA0pIQ6QOSLF6KBdmLLQ8QeZejpdIf7xTNaxYel67l8woWCNqn2dNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oQFT6kNxhRFiKy2zRosGrScIJ1a1OzkNWXsXAS5yuBQ=;
 b=p5NiG9W2ssfabL72OJg5XEF+x7dMqKA49oS2qLRUnrwKPaR6MKKDrvqQNomuSfIT0kFyDLVBtavkzu3U+Gu5IbkrG1msdpVLYU97BQgQUf1rG86AhFAhZ6VO0/BUmaa1bwBvJKQNawzAlE1zzZ1ugra9OqUsJJWFfxqOByAgKzT3kg8dSzFlYLAhVKq7XYgoiqlkY5IqsDeGlZaGV7uRgqRSPHJtMyOmg70P/3cYks/ER4nWQ29STafEqGvQsxypqcg5+p2TKGRbijATq8pDiasfqa1NFuHQXVoz7KELNJuZ9vgslyDVO8L0NHlNsFlHs08OdNqR0DprMQRx02pjEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oQFT6kNxhRFiKy2zRosGrScIJ1a1OzkNWXsXAS5yuBQ=;
 b=K5BcSKJtLgMnglXhQ8YhQRxvl5JgaIiZ5eGX8TN2l7WtVq5/r+9TLIpw6VeHcKEPhFgrbuENUheJOhFWrsVIKoqfQN7MLJpZiiKd5JF6/jn/rfZSrgNBcTZCuaIaBafHwJP1hOjkScuz6Icj10eIt7ImqOc0gXtTPUxJ+u4e1EA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>
Subject: [PATCH] iommu: restrict stratch page quarantining to specific iommu drivers
Date: Fri, 25 Jul 2025 12:13:03 -0400
Message-ID: <20250725161304.6723-1-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB52:EE_|SJ2PR12MB8650:EE_
X-MS-Office365-Filtering-Correlation-Id: 12d9b551-af4f-4422-7d58-08ddcb962702
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?IK8Sgm4cGG2fyhe1kTqRYSLiFFfgF6kGdwDeAwlyRutjcBqLozFx5fTdsGRf?=
 =?us-ascii?Q?BpasrAZ2J+137dLe5tgj2/fFcCEJTkEdC4CF4NRqItCjwr6VodYo85dvbU7g?=
 =?us-ascii?Q?TNkFc9hYfMzkBwGTSm+cGwXQW9g4ZJl4UkndYM2yalr1LSV/BZ3BBW7K+eX2?=
 =?us-ascii?Q?cNV3NkK9Y6CrxTpJclecoJAjVwwcUqazQV0Je8BjwMvhTcWSAIxtDQcyZn3W?=
 =?us-ascii?Q?DSz5Z+sD3XdCg7CpBDT3Gds30l1cBLJyoY/fLfEZHofJ96qIbfa5fPtQu8On?=
 =?us-ascii?Q?GY+yEK24hDC892hAXxQ8rfDqjeKJN927F0ht8imeFknBj/rWqoAqDkpEqiWf?=
 =?us-ascii?Q?miNkAJFpSOY1sb0q86UuRiiW14NzGBOwbFEYiU6e+hKTGgZqci/qHk/k+8F4?=
 =?us-ascii?Q?aOjTfX0cSZzUPKNByzNvp16MzNW0iNo0QJXpgCDatWaMCFDaEA6BzB4S6ZKV?=
 =?us-ascii?Q?GT/BwJHcVKftndwEioKIAQf8blflYfRoG6UZsb1IVA3zOOMrcgM9hsFPHi8P?=
 =?us-ascii?Q?l4cM7VGt6qx5/UOSagCLCwgsxBvQvtQqZ+b8cbbltLGkF0aZ5zH//78dNELW?=
 =?us-ascii?Q?MTnvp2p6cmMHsHMkaAZbs8CEp5FPyatKJq7ms2TUlkcp2i5tQ6Zu/Cw07M7U?=
 =?us-ascii?Q?B52lHQ2UslaicZP1qo6Cb5iFiStRygDhiKJ7YSVfFg/ljgbixIIVCS6BEW2p?=
 =?us-ascii?Q?FHNDHjZ+vwY7qpYPkoCLvT4FHfFvGFp9B/sn2S7agq96ZDtIveV4UiaJDmnM?=
 =?us-ascii?Q?DqXMSl6lWqoszKsEJcbwbTBWpRA/440lS181RxQd6+oEAX/OFuE6G+CKqwg0?=
 =?us-ascii?Q?CsqBy37sNdpWxYsZ2EvGdVFH0KYhhCShp+EGrnbEg/P8NbF41yJi8YlwfUpF?=
 =?us-ascii?Q?GweNM+/sZRzhHL5ML1gEbqaROT1z7zob4MRNCKyctWO9XQ3JTQvgNYhOsSeb?=
 =?us-ascii?Q?ZxQMh68fbE3VPmK+hCaaZhOT+cMp0E3WO6kNydGzzABgD/Y2nP7bOMFcUyhb?=
 =?us-ascii?Q?fZUmNzkhekuDNVMY7i9ZoQvMcNOoPtq9z9Ck2yxFtVYyZ+73nM8SHhzg++DS?=
 =?us-ascii?Q?OHKayNpbWE6n3VYvIrYB1cojcvJpb4x2x9bQLtFJZOPdTqYNR47GIf/FfwjR?=
 =?us-ascii?Q?X2XT9BFbrqUTlfyuv8eSBw/RMU/EvF9yxREqY+leB3FSoWsUP0yBs8efKBkY?=
 =?us-ascii?Q?9xkcDYWSBajGwx7Ww3oyI6LCxCVeeIPdysOyMGRFXC0Kp8U6WLj3tbX3F3or?=
 =?us-ascii?Q?eFT1yNF/PLg6yzJZSbE8FbMBwj3el6JTxAI6zkDWdSRKfGsQfxw2Ik5Pjzg9?=
 =?us-ascii?Q?qoxkKU2oocooQncj9lSn2OEXoluUsgD4ZPPJNcTqLgAMKFKtUOVeeMPTdx3W?=
 =?us-ascii?Q?NkN0TswpcAwYiRrmfEOsndupuprf769OCNqrm6mjLKKE3ly93yEy/er31KyA?=
 =?us-ascii?Q?8n48rdRxZdhKoOMGSqjM+hufX5Ya5zCDQTReSNG3zM8IQyb9l04VLBvwU71Q?=
 =?us-ascii?Q?TbgMTObantbPdCarOh5rVUbnmAjL9vzKSsGJ?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2025 16:13:11.6043
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 12d9b551-af4f-4422-7d58-08ddcb962702
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB52.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8650

Scratch page quarantining is tied to specific IOMMU implementations, not
architectures, so tie it to AMD_IOMMU and INTEL_IOMMU instead of X86.

Fixes: dd7e55a8848c ("iommu: restrict scratch page quarantining to x86")
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
 xen/drivers/passthrough/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/drivers/passthrough/Kconfig b/xen/drivers/passthrough/Kconfig
index 11aece5f7bda..b413c33a4c7a 100644
--- a/xen/drivers/passthrough/Kconfig
+++ b/xen/drivers/passthrough/Kconfig
@@ -90,5 +90,5 @@ choice
 		bool "basic"
 	config IOMMU_QUARANTINE_SCRATCH_PAGE
 		bool "scratch page"
-		depends on X86
+		depends on AMD_IOMMU || INTEL_IOMMU
 endchoice

base-commit: 6cd9b9226c65c962b0f0e040e7d3d5c4053f8e06
-- 
2.50.1


