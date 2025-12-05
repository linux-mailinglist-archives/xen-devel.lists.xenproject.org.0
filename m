Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B963CA774F
	for <lists+xen-devel@lfdr.de>; Fri, 05 Dec 2025 12:52:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1178804.1502516 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRULQ-0005Hm-6m; Fri, 05 Dec 2025 11:51:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1178804.1502516; Fri, 05 Dec 2025 11:51:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRULQ-0005FO-3r; Fri, 05 Dec 2025 11:51:28 +0000
Received: by outflank-mailman (input) for mailman id 1178804;
 Fri, 05 Dec 2025 11:51:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=itKe=6L=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vRULO-00050w-CV
 for xen-devel@lists.xenproject.org; Fri, 05 Dec 2025 11:51:26 +0000
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c000::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b975dace-d1d0-11f0-980a-7dc792cee155;
 Fri, 05 Dec 2025 12:51:24 +0100 (CET)
Received: from BL1PR13CA0273.namprd13.prod.outlook.com (2603:10b6:208:2bc::8)
 by DM6PR12MB4403.namprd12.prod.outlook.com (2603:10b6:5:2ab::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.12; Fri, 5 Dec
 2025 11:51:16 +0000
Received: from BL6PEPF0001AB58.namprd02.prod.outlook.com
 (2603:10b6:208:2bc:cafe::c8) by BL1PR13CA0273.outlook.office365.com
 (2603:10b6:208:2bc::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.9 via Frontend Transport; Fri, 5
 Dec 2025 11:51:16 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB58.mail.protection.outlook.com (10.167.241.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Fri, 5 Dec 2025 11:51:16 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 5 Dec
 2025 05:51:14 -0600
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 5 Dec
 2025 03:51:14 -0800
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17
 via Frontend Transport; Fri, 5 Dec 2025 03:51:13 -0800
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
X-Inumbo-ID: b975dace-d1d0-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z1t3Geh+L839kzqRFSUyrIqHedE4opebru/U9YvUzVqB/ioTAWGotq4R2cIMncet/hn9Db44BgBtCmM30AeC6+zHwx7Pi+9RlE5Lawp9vVjXN8wnC3YNjVOgOMcc6aV5RnjIWAKrzlD+ZtgLGV++FwjlHI2QpM3+MiRM1I69fhdROPPwFyTbAk4oB0DGJY0U5RwWTZL4yLAYvQT6gmuX67B5p9kV2ETrJSEQlviEeyKOJDdzLUqflqHXcYq+NjpBSxgZiOcytn9APUczvO5UQEJe89jY3tZOePDnUkm92sHwx/c3vnMfbyjKdtk4Lxx70zOoizVc7G6CdnxC2JCc+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o778LlsegqXMw2XoBLskVR8L7ohCMBxfZZWEkxNmn0g=;
 b=YSN8mV/ZS4VwjjCSOhN99zka9hY8CiiVW/Fu2QtnM/qMvpPOP0y7kHB8tQwgdJBc1Qwtago2f/t7taJ7qfWhk6gB5N7Rx9P2e1O4loSQiDm0pt/qS2eMi+rmZd+1719afqkBRo0+ipRF7wVN51qSZvOzAwawc3vV3/QeH4qX1TktGC/mnPJ2agw+ucjjlKudao76AkAyccubI6dbao+oGf+m70RrHr1ct5Z32vFEyF60d39Y0t+DgtWdHc0qkrqlmbv9pAB9LqiilHq+f24IAsPoDjFVfecyMoWQNwPXHcqiEfT7OuZbVtq82var3k95AMFQe02VeLHd25UKP7Vo+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o778LlsegqXMw2XoBLskVR8L7ohCMBxfZZWEkxNmn0g=;
 b=kyyb+AC9dhNCC6B9PSIxcsBRoB3dTdJ5ZBDl0pKCDclFksFGZ1t+w3XGAmDaMDqn7T0S0Lilp9rhyp+Dv0l0WViVXbv/S/UHb2+rZi1uFqPDma6VCyoctORB0gdUjoDHn+x9RMm6oK+sfOzoZSEk4GpzzQ6t197LHNlzTChtKX4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Juergen Gross <jgross@suse.com>
Subject: [PATCH 3/3] xen/hypfs: Enclose HYPFS_DIR_INIT var parameter in parentheses
Date: Fri, 5 Dec 2025 12:50:00 +0100
Message-ID: <20251205115000.49568-4-michal.orzel@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251205115000.49568-1-michal.orzel@amd.com>
References: <20251205115000.49568-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB58:EE_|DM6PR12MB4403:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ee1c61c-01c2-4725-eb58-08de33f498e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?jxZvCm6X/0aalSzLW5p9thEIX2SpgPhyyiO5xBpLNMfnywhdRFbn0TCHj2v1?=
 =?us-ascii?Q?wdZhRRp+8etIJB4df8xqtcbTechJUv6IunxsBLI86j/wppNA+dYUnIghwHsa?=
 =?us-ascii?Q?dImnq00XZSaBsNc3WOWSU7N/BzZ0HuIG/WJ49+8luCCbyoSBuEyb/gK6SdPI?=
 =?us-ascii?Q?SRAcsiqlCzL3i5Qd0a6I2/psAd2CYassu2HJWY58HlIfUlrcBHuDC7+UCn63?=
 =?us-ascii?Q?Ii3prNwx4nNWgr5qakAP8MzFcen6W9jUPdk7VxE9+utpWMtJrbmtjj8dCjUS?=
 =?us-ascii?Q?L0x3WfwOnpXPoSTKCgx1v02N2F3fdSsfCZJwI6jZaHG3fnq66PVRn1UnI3hn?=
 =?us-ascii?Q?CF5iH/igzGrymBN3pcSZoI7iXkSHwQIV6I+ONFMFINdRm6DeWtdmrp8Xc+qU?=
 =?us-ascii?Q?Dg4raao+/wluI++73AWggMZPezM89L/0C7uqWDmWNjuiu4jEeR+eUtMIMib9?=
 =?us-ascii?Q?Dx9KbDNNCvCBKcQ0o0TGv9MTYBo7jIUmEeSFZqcqnCGED7BaLosF0CSkKsna?=
 =?us-ascii?Q?fhbbRW4rjoP6WPFqSjU0J0mvKREpXou5nP7Cl66sBDzxnIYY1Jf8Cpr6ekmf?=
 =?us-ascii?Q?bDA4ShY0TjVpoGd27b6OCgUg4ipyyHUaxmWWA2HMWO/H8i7vjUvhiqfWCBos?=
 =?us-ascii?Q?9vK3/rv6kDBeeY/PTbJlC7nqwYnB+gipuPu0KSXhK+WPc1WtgZKbGdj2lLvo?=
 =?us-ascii?Q?G8EU3iVNafzN39vHMqnpuF/pjWqNCAiAfp399npMEslr4DyShu6W62qvkSvT?=
 =?us-ascii?Q?4p5B5188g2jXQHqbsLbZYx6gNGckqRsalWTnm20yuphMXywaireTd22/Gcou?=
 =?us-ascii?Q?8P7KN8CpCHS7lLUcWs728APdzV9n8rr8psgKVXErPKutVwvglcHb8rSszouD?=
 =?us-ascii?Q?Rtav8wPcjUV7woHqffgS7Y0yhZ3nx0fGgOdEh+BgqMvF7NKSdfJhAKQeKW+4?=
 =?us-ascii?Q?qAinak1Mw+xlxy8RTsBWkKv0v0237EDBgnAoWrfBhk5B7LEJr44JJVLgIXZ4?=
 =?us-ascii?Q?zW+tmF04SdqnDeHZXODuIkYM7wP4PsOqalWk862qU8NmLPTzTWYPAxm+jivM?=
 =?us-ascii?Q?pUAenYIypLWs9jXU/3L0GqDqEe7pDazm/FxvpYKgsT1sHzU6zo9VgS48uPs8?=
 =?us-ascii?Q?DTuYrTsCcvpfcRie0ghNJXvClBri4Lrvk2KQPPq/mmGbOZvcj8bQPmZFVTq4?=
 =?us-ascii?Q?U8zEAuQN4snqmwcPoH8YgSGeDE5rWBScw3gauexXTcsbP3SlbeWNdP12Xn/C?=
 =?us-ascii?Q?tHHbzvRbLNGdATmMs1icXj/V+qI723EIqRrDlYQVRyzfG7I2l4KGkH5ocY3T?=
 =?us-ascii?Q?dznTBgZP+WK73Y2QKiO5Oe8Reuokeb+Do7MTDMyrGTlAcGQcsSc9L1yNu+Xo?=
 =?us-ascii?Q?/VyVa87lXgLUmjUOwhatDVN9GxRjK4tR++5xrqYuzDNk44zkPwTDrWPYrxp8?=
 =?us-ascii?Q?zYblbiW655JdlMzIqhebsHPMZzdp4m1sfhxh5wHz/BlzgOvZLTSxHzvacmoY?=
 =?us-ascii?Q?2+5mHKdCI8Y02KVNOWvIvaVWlMYoCiF63o5ngQYjYCbgcmEs0YNAq3MRKxvy?=
 =?us-ascii?Q?S9wChlKBVvkFrjlZDho=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 11:51:16.2984
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ee1c61c-01c2-4725-eb58-08de33f498e5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB58.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4403

The var parameter is later on expanded and referenced by LIST_HEAD_INIT
and shall be enclosed in parentheses. This resolves MISRA C R20.7
violation.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/include/xen/hypfs.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/include/xen/hypfs.h b/xen/include/xen/hypfs.h
index d8fcac23b46b..fef667298b21 100644
--- a/xen/include/xen/hypfs.h
+++ b/xen/include/xen/hypfs.h
@@ -95,9 +95,9 @@ struct hypfs_dyndir_id {
         .e.name = (nam),                          \
         .e.size = 0,                              \
         .e.max_size = 0,                          \
-        .e.list = LIST_HEAD_INIT(var.e.list),     \
+        .e.list = LIST_HEAD_INIT((var).e.list),   \
         .e.funcs = (fn),                          \
-        .dirlist = LIST_HEAD_INIT(var.dirlist),   \
+        .dirlist = LIST_HEAD_INIT((var).dirlist), \
     }
 
 #define HYPFS_DIR_INIT(var, nam)                  \
-- 
2.43.0


