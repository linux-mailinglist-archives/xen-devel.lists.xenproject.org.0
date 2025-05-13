Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D11AB5AF7
	for <lists+xen-devel@lfdr.de>; Tue, 13 May 2025 19:18:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.983394.1369775 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEtGq-0001lk-5l; Tue, 13 May 2025 17:18:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 983394.1369775; Tue, 13 May 2025 17:18:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEtGq-0001jo-2U; Tue, 13 May 2025 17:18:24 +0000
Received: by outflank-mailman (input) for mailman id 983394;
 Tue, 13 May 2025 17:18:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FKf8=X5=amd.com=Stewart.Hildebrand@srs-se1.protection.inumbo.net>)
 id 1uEtGp-0000x3-8Q
 for xen-devel@lists.xenproject.org; Tue, 13 May 2025 17:18:23 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20611.outbound.protection.outlook.com
 [2a01:111:f403:2406::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 44f16e1d-301e-11f0-9eb6-5ba50f476ded;
 Tue, 13 May 2025 19:18:22 +0200 (CEST)
Received: from BL6PEPF00013E02.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1001:0:18) by SA1PR12MB8721.namprd12.prod.outlook.com
 (2603:10b6:806:38d::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Tue, 13 May
 2025 17:18:18 +0000
Received: from BN2PEPF0000449E.namprd02.prod.outlook.com
 (2a01:111:f403:c803::9) by BL6PEPF00013E02.outlook.office365.com
 (2603:1036:903:4::4) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.20 via Frontend Transport; Tue,
 13 May 2025 17:18:18 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN2PEPF0000449E.mail.protection.outlook.com (10.167.243.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Tue, 13 May 2025 17:18:18 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 13 May
 2025 12:18:17 -0500
Received: from ubuntu.mshome.net (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 13 May 2025 12:18:17 -0500
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
X-Inumbo-ID: 44f16e1d-301e-11f0-9eb6-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O0vvh4ebZPKLSYjrwQElVea06AG2pPtXt1fLQD8K57rVGKy6B7azKrhRVSRxJsl1nfkpuERkGNEYs7o3W9L7Qqogeu+GMx8arsN7w0Gr03PK/xPCIe7RSgZPrKy3GiCyzdVt9ocusvmkY9PWiCAQ18K4jYV4/iPpVk5+ScbEdhhqtt5LS51dSJgc093x7CySTGu7ys0lXqGyqJhdwo/s3deoP+TAp/1wl0a1yysX5EbYGHfZDsV4Zadl15ny0umJrfBzrPN7AyPlRtEkMD+nIodiFg8jOUPfK08RZmrEnR8o7p23MvzmvEHJ9yPfUt0G/SRYl1Fu15NATV+A+LwBIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5V85z1ViJnkkgRl4AbkpCsiTRJxEws892rNh16MnFJo=;
 b=ZOku2oYCiN7riseQjJMWrHryRbimcIAwY3NND4UIJtRt+ZjbQIElpDFG26fExCruS3DY4qXom37PdTPEci3ESsqbwz+3b5ce0zgJnxmkGrJNTW3dPLYA5+g5e2trwdBFrfrGrZGbU/wX+nM36snVTC13CWj4obDnrEbByFxa/HpK6OajmAGiXuWYbDiNFSx4jfTMYzbuFZmqB7nRFj3fiB6rW63/q51+5IDgww6urkeeqnX7Ge+VdBempRmc3vR7TRvPdJo0dCwXVuIwWa2LFziCYB2RzM5v/OeE8DyzZrzajl8lixUrWbSX0gdtt+k/15j/ZtMEmBQcWA+DhdUqwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5V85z1ViJnkkgRl4AbkpCsiTRJxEws892rNh16MnFJo=;
 b=McTLE7m1+eUakU3FlektKaiRjiypf4eQ2BNJz7kxleUzuDTpBSWuted3uCxK7y5f/wI+oL8hTn1qJHGGrHATtUwvkn6Hs3YNcDPBUYPrexYEzBi92m4YOomaZ19cKBSuxio8jXZV7rrSaJB/kRyEhQ+QJrcSU2ufngDBwEYvlpk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stewart Hildebrand <stewart.hildebrand@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Stewart Hildebrand <stewart.hildebrand@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>
Subject: [PATCH 2/2] xen: enforce __init in common/device-tree/*-build.c
Date: Tue, 13 May 2025 13:18:03 -0400
Message-ID: <20250513171810.668370-2-stewart.hildebrand@amd.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250513171810.668370-1-stewart.hildebrand@amd.com>
References: <20250513171810.668370-1-stewart.hildebrand@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: stewart.hildebrand@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449E:EE_|SA1PR12MB8721:EE_
X-MS-Office365-Filtering-Correlation-Id: d0c23c5f-4757-495b-9b45-08dd92422771
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OKlMpFbo3mpWqjgMGQ2ASqXURZpfhRFA34im/qmfJstxbvZsmViZ9jXe9ujm?=
 =?us-ascii?Q?Jw9cP7M6zCyevrrK1VqFVfKdak02Y8z0ZvKfwjvYpbueqKOMLu99ldnYxq+C?=
 =?us-ascii?Q?zP9CF32VQ6D9AzOBKtEyo7Z5VaW//Ab6IRZqm7OURqElb0mOJjPJIbx9AhNc?=
 =?us-ascii?Q?txA0aybc9beVSigcKGGNpQkCQ0JqaVw6tEtB9bRBae1n8hOgThB8F+0Is2M0?=
 =?us-ascii?Q?u1d0t5uPjg7w+yHg0o7oXw2qUkGL0Cds6A2s1u5irOUCn6VjtfFxgEmmgYA1?=
 =?us-ascii?Q?0Pz6nVXlZhdNnAtXhlGeWtZDxnL0iSruxz2cEORxeP4+B8edRKVg8jYM4z9r?=
 =?us-ascii?Q?Nch5RktyqSXnXwDcqhPZRh1oaSrAmIX5r2bWqJ9FDa4ChqslDQxjpLhHCT5Q?=
 =?us-ascii?Q?FDC1R6rMQD/W7HNM+j7zmrxp6wxWoD17cC4dsvsSzqfn8YJb3EXOnxzfZ6ho?=
 =?us-ascii?Q?iaevApvP4K2hG7+8IxkM8CQwU1MxAAlQFsOfzUxhBWaSbUA84Q0do8YYDaQg?=
 =?us-ascii?Q?kD7a3Gvz9QFBLalXoRSOEboXYRrjMjcTx4PKGZOeORj3+l4otEErIzgp5nLI?=
 =?us-ascii?Q?OGqVH5p9Hf3tHOXdtgFnF4gdaKgJUbZE6tWP1+1L+jtX/f897VEypPfGDgfM?=
 =?us-ascii?Q?cRM+6U9DGkWFpn4NKuPwicz4Ysh91L9s41b5H+WF5VeaayYukzcAXJj56pTH?=
 =?us-ascii?Q?8idip8P+ccFA92JvwR7v0PF93RDVwVHFI8L3K3RkDnZYPxxTUgTtmfeBH5Lc?=
 =?us-ascii?Q?dKB+dIXzJtZ7SFLvvhbPL35Oov0upMXcvHnCN0rEYefGPAXviBUGnjw7AVq4?=
 =?us-ascii?Q?N7Cex9E0gu8rqOvhKyNLcZOkHv1zHL0cKBmStsBgiyLGyqz88P5pGbzeoEc/?=
 =?us-ascii?Q?g2tR4v0BtHXxLOkU8nKMVPhxHWyw0DGojeFrsAk6VVAs+hTdMkuxiMnehHPf?=
 =?us-ascii?Q?u9gW/3X3TdeaZZORBW2WH7fpx9j8UCCf9Kwp3WzTeHf0hx0k/phQd+evvQ8J?=
 =?us-ascii?Q?na2lAHzlPHStzV61/foMScOye/z6UhKWVL+v3TtOron8Ojt3cgoul3v8PzRR?=
 =?us-ascii?Q?8pI7kz2+8ag9WEpLJ8LAcdul0kMxAyY9q9AxMv3adcyzYKX0GAhWthYjFj/f?=
 =?us-ascii?Q?ZmDW8BiInR4n7PgeLa5t0QYI5wqB2dyCPUZnBucARugV+uxBxNLVX8iuCiyB?=
 =?us-ascii?Q?5l+piU8bDjSpjN15uxzWjnECJqnaay1cBVtEeMIMS6U5Xf95YKQ238VeBgl3?=
 =?us-ascii?Q?P+aSgXzElCsMocddv3AklLkK8MVqTeUFfYI/Pujoo0uX3Ndhe2zPy7jaGdoT?=
 =?us-ascii?Q?9SRtp/5kedZ3HhNV/6byUa2TQxtw1KyJZUoOsgEPSdQcreh3n+WLjOp001gV?=
 =?us-ascii?Q?2j6sbFhWKfupDPkTYDOvyKf5P3nGBeo4ZHtDXtLEajbJ0rBySjUdBqDIPxJ4?=
 =?us-ascii?Q?gA3/n2bBHsoZEDUSQ6kzbzJey/03wxqHJbzXM8VshmWe3HxXfpATulH5YMB8?=
 =?us-ascii?Q?1m3j7//WioIDoiDdr7hkKQYUr2Qn7j5IKM/7?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 17:18:18.3311
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d0c23c5f-4757-495b-9b45-08dd92422771
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000449E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8721

Code in domain-build.c and dom0less-build.c was migrated from init-only
files. Thus, they contain only __init functions. Enforce this at build
time.

Fixes: ad03faa942b9 ("xen/common: dom0less: make some parts of Arm's CONFIG_DOM0LESS common")
Fixes: d07b7369aa65 ("xen/common: dom0less: introduce common domain-build.c")
Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
---
 xen/common/device-tree/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/common/device-tree/Makefile b/xen/common/device-tree/Makefile
index 831b91399b74..ff54a8ef2bee 100644
--- a/xen/common/device-tree/Makefile
+++ b/xen/common/device-tree/Makefile
@@ -1,8 +1,8 @@
 obj-y += bootfdt.init.o
 obj-y += bootinfo.init.o
 obj-y += device-tree.o
-obj-$(CONFIG_DOMAIN_BUILD_HELPERS) += domain-build.o
-obj-$(CONFIG_DOM0LESS_BOOT) += dom0less-build.o
+obj-$(CONFIG_DOMAIN_BUILD_HELPERS) += domain-build.init.o
+obj-$(CONFIG_DOM0LESS_BOOT) += dom0less-build.init.o
 obj-$(CONFIG_OVERLAY_DTB) += dt-overlay.o
 obj-y += intc.o
 obj-$(CONFIG_DOMAIN_BUILD_HELPERS) += kernel.o
-- 
2.49.0


