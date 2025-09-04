Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF335B432AD
	for <lists+xen-devel@lfdr.de>; Thu,  4 Sep 2025 08:41:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1109554.1459121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uu3eJ-0007f5-3O; Thu, 04 Sep 2025 06:40:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1109554.1459121; Thu, 04 Sep 2025 06:40:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uu3eJ-0007bc-0e; Thu, 04 Sep 2025 06:40:47 +0000
Received: by outflank-mailman (input) for mailman id 1109554;
 Thu, 04 Sep 2025 06:40:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UG7t=3P=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uu3Zl-0002iS-Df
 for xen-devel@lists.xenproject.org; Thu, 04 Sep 2025 06:36:05 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2062e.outbound.protection.outlook.com
 [2a01:111:f403:2414::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6e6a943c-8959-11f0-9d12-b5c5bf9af7f9;
 Thu, 04 Sep 2025 08:36:04 +0200 (CEST)
Received: from BN0PR04CA0141.namprd04.prod.outlook.com (2603:10b6:408:ed::26)
 by LV8PR12MB9641.namprd12.prod.outlook.com (2603:10b6:408:295::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Thu, 4 Sep
 2025 06:36:00 +0000
Received: from BN3PEPF0000B070.namprd21.prod.outlook.com
 (2603:10b6:408:ed:cafe::6b) by BN0PR04CA0141.outlook.office365.com
 (2603:10b6:408:ed::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.17 via Frontend Transport; Thu,
 4 Sep 2025 06:36:00 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B070.mail.protection.outlook.com (10.167.243.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9115.0 via Frontend Transport; Thu, 4 Sep 2025 06:35:59 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 4 Sep
 2025 01:35:57 -0500
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb09.amd.com (10.181.42.218) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1748.10; Wed, 3 Sep 2025 23:35:55 -0700
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
X-Inumbo-ID: 6e6a943c-8959-11f0-9d12-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I6jc/6hVx1FPDkJoY1aurwK256xeTZdKxkGStIFfP3b0OT9WTBChYd+r1/LbXC5YNkStSbk6gwh99CArD7DuOwnJAOGXzrA4/tPtIUYG4YJrUWzcij6lH8qqpMaE+h+JcfOZtDCE7GVjga88mB4eCSpOmSipXlvHnI+s4ErvoOxI+coMWUVDf1y8n1YrgB0Tgs3SV3iTTIFuGPbxa8HnmmEsJQsADgBT/ARwqYuwkwFqHgzUMlRyLffIUOtXSNounMEyk8FrocJAh8M0sfBGhvm2acBagBWH4FkNuLCFkIwnx4/KkMlQiIAhfjpuan7S1nkpy+o77ENErIKouKB3aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Cm8DWA4z57MSB+CARUOHbMjYe/yew/NRXMVbVkbi0A=;
 b=AkijPjEMAHVsXXdCF9nVjI/gYxn1x2xswqPviJT8MUtnIEhW7D6Jf4O6jGlAyWi+RyG4tSsJcigtMZNeobsv+FeE5Yj64ftbq8t8QHCfhebRSnB+N4mjPYAmpvqLVjlGTlz9ExsRlW5QZJuTVYhWLypNn+YRnOIo/7Yb0YyndIeD9gbotJn8+bpasbhKXXklJjESUrorJINfHPZAFtLLQ4VMuPwH/nUGLJ8pvIoj9cZ5liFnVmkuypC2s9FHU6n/AO2/7cdmPEkwNLKowD0hpduCCBngv7Y+KktMEfG/+F7P2dLJiJ9bgoV+ZqTDb458wP7a5ayX3M8qoZ2RAKIi0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Cm8DWA4z57MSB+CARUOHbMjYe/yew/NRXMVbVkbi0A=;
 b=sBzbug5VCeqLjbRMZg/xLwdSK2WBLJejdmdT4Wdyj1qPq+RDLPZBm0xKhZS/v1Vbdw5r8HoQUng8mfqJ+BNQhgO0R8jcolr6M4nf0fxHzFIBHSMTTLPRzjHRLdnpNYEpUmeBVxRdvp/SBFRfRxrqqvbIsZ2oD2K9z0jaKAiqaYE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Penny Zheng <Penny.Zheng@amd.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, Community Manager
	<community.manager@xenproject.org>
Subject: [PATCH v9 8/8] CHANGELOG.md: add amd-cppc/amd-cppc-epp cpufreq driver support
Date: Thu, 4 Sep 2025 14:35:18 +0800
Message-ID: <20250904063518.2097629-9-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250904063518.2097629-1-Penny.Zheng@amd.com>
References: <20250904063518.2097629-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To satlexmb09.amd.com
 (10.181.42.218)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B070:EE_|LV8PR12MB9641:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a07aca0-e458-4ae9-2846-08ddeb7d4fc1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qrp0oIrJ3VvCFfMe9aD0zepS6tx6Kt+oNbfh9a+O/cySg00J5Bh6e4OwRX0d?=
 =?us-ascii?Q?rxUMWPGcJbAu55sc+rjOS+CioJXKvQIqb7DdSROvomXhtvz8Ip/MbRE3yT0g?=
 =?us-ascii?Q?5d46/sJ7Iga1LCMfxXRG4hci1diH5BzDmEa3spt78z8Jz81NP19EsUEfeRyx?=
 =?us-ascii?Q?PCjqXONn2kI1lC+nxJqYJOCRg0f6g34wpkSjjW5qlo9pqfdPKy7d0UkphSeX?=
 =?us-ascii?Q?ZCYyJ3AB6WrmxhEUbJFvQL3MArv0zi06A6rZ5N66ePzoVfa+G/sdUpKn8q7V?=
 =?us-ascii?Q?PVGH3b1/4XODDrtsTUT0MEgKadQ1TiwPMcAl6xubVn1jR4GGg4rwa1TnGmXW?=
 =?us-ascii?Q?EUnWjkFSE7ywQPvlohuJvP0w5G7xA2c89E59z5MVtQomNYe8loHGpn4wfuGQ?=
 =?us-ascii?Q?lB5CMMah8EUjKMHY8Ed3thfDzHeRBCerhB0Mgmpq31Jpa6rSKSemz0CNPXBw?=
 =?us-ascii?Q?CEj0NKOnpaY2QbqNfpN9Z2EqMjV7OHw+Ys9IWxFR8MKZSUV04G3LlMaKczQ+?=
 =?us-ascii?Q?az1zPBx6GxXPSbd2e7PgS9SkAa0lPhSEk99ci7E+TPkEjSoyzhxkZ5ceRTQ/?=
 =?us-ascii?Q?292b0CYFoHQ6FDhY6okReT7TI75atSUYTCZ8lBs0fi1RhUhCoGjUC2plvRrC?=
 =?us-ascii?Q?4j4f3n6339U+nH5VsvefDeqKETTiYAztaEy1VBEbspHSjHjukqWR1SMA3yL9?=
 =?us-ascii?Q?Tp/Dgx1Bd+VFEPF5P689rEbQTCSsSmQ56iv69wGXlpOh3lGn/TmyuvesXKHD?=
 =?us-ascii?Q?nziW36SFZfi0rqLtUxLJNrrnRx3dn4Xb4BslgwLYp+K9+RYg7t+ysKPy+YF+?=
 =?us-ascii?Q?7pS4Fvek48U9YY0JR5qXMe1XERl7wSB5r+HlMcwVeO/9NPLil1AlzK2yvZ1O?=
 =?us-ascii?Q?+ij/OUe9SDbmuAvmBy568rHS0w0OrASHdLPcORFVifIOOoJXvn36RknZmVqu?=
 =?us-ascii?Q?5BVhti1Sslsx1VNNJFhi3w/ZsTpUGdNKISJy62JuqOqTwWUSdR69nDrd95TT?=
 =?us-ascii?Q?iB1P6RkgYbKRlErl5/ESwERIYD4t60zLJ0sIamyNlQHZfKr1Sqy9T1twtLkL?=
 =?us-ascii?Q?ADmMK055Bm0ABls2wk4weWNMUfDMo8NoHfuiLgNVnDB0ksO8w6VuwA3EFa4j?=
 =?us-ascii?Q?m75EiSgqXlDuLVyctg5CyfIksLPcBs5vU529d+asLaqUAsVxcKilWApgDiAt?=
 =?us-ascii?Q?S3Nh/FloHEa7D71QomnLDxCYmn3BjxGjYQ+8+eVL0whjaZS3N5vCjN8TetEV?=
 =?us-ascii?Q?hBt1DwxhD9Kibo3TKDiKuhxksaZlhkq0KynnUp4qn+ITwRIspTD/3PTv33Ev?=
 =?us-ascii?Q?pjVNGlf9RxtNohfgT++LMgNLL164p6n7xV0ktkUlENebLBa8Ts97FP7XlPDQ?=
 =?us-ascii?Q?QAR/3XqRBhvCklhiLv40+awoJiQFqOncczLVE/my9qeKSmu++4mBKNM9CV9f?=
 =?us-ascii?Q?12gePKhgtAfLVZIrjFpAdjYNxnJMlILqRXElT8fIeHo8rKEbKNMrZA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2025 06:35:59.7532
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a07aca0-e458-4ae9-2846-08ddeb7d4fc1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B070.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9641

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
 CHANGELOG.md | 1 +
 1 file changed, 1 insertion(+)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index cd34ea87b8..c1a57924f3 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -33,6 +33,7 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
    - Support in hvmloader for new SMBIOS tables: 7 (Cache Info), 8 (Port
      Connector), 9 (System Slots), 26 (Voltage Probe), 27 (Cooling Device),
      and 28 (Temperature Probe).
+   - Support amd-cppc/amd-cppc-epp cpufreq driver
 
  - On Arm:
     - Ability to enable stack protector
-- 
2.34.1


