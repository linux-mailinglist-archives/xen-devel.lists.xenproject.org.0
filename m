Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E1879E173C
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2024 10:22:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.847531.1262641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIP6v-00052S-8m; Tue, 03 Dec 2024 09:22:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 847531.1262641; Tue, 03 Dec 2024 09:22:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIP6v-00050Q-4G; Tue, 03 Dec 2024 09:22:25 +0000
Received: by outflank-mailman (input) for mailman id 847531;
 Tue, 03 Dec 2024 09:22:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BRE5=S4=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tIP6t-0003Be-A2
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2024 09:22:23 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20615.outbound.protection.outlook.com
 [2a01:111:f403:2418::615])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 195ce481-b158-11ef-a0d3-8be0dac302b0;
 Tue, 03 Dec 2024 10:22:22 +0100 (CET)
Received: from PH7P221CA0012.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:32a::29)
 by SJ2PR12MB9138.namprd12.prod.outlook.com (2603:10b6:a03:565::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Tue, 3 Dec
 2024 09:22:18 +0000
Received: from SN1PEPF0002BA4F.namprd03.prod.outlook.com
 (2603:10b6:510:32a:cafe::a9) by PH7P221CA0012.outlook.office365.com
 (2603:10b6:510:32a::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8207.19 via Frontend Transport; Tue,
 3 Dec 2024 09:22:18 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002BA4F.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.7 via Frontend Transport; Tue, 3 Dec 2024 09:22:17 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 3 Dec
 2024 03:22:17 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Tue, 3 Dec 2024 03:22:16 -0600
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
X-Inumbo-ID: 195ce481-b158-11ef-a0d3-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cBgZLFfpYaLzX/yXbxdPY/UI0b5NbIyRwBDgQFRinFEC72f0muCOUZ5nGSvb8bLyxGTxhp8plV9r+bDXAbbBqa08Al29zE0HSbp3Z2GCvboOX4wxr589DLoh+xnAk6eN0XP24R7dBzZ9VIW3I8piZCMfbrpaaPG3ATNQmBTsenMroIMigsUqsy2ZR3s/CBsS2J0WPQ8wizEZocEv1K9hhfwPlotnZ80FkyaDDi/Zj48XkzbBzETqPdEj17Tb9pI5yTKoJOaePz2QyzwA7cyrlT1wYu5gfOKU3c7r1uT0BIpkpddZNws1Mjy9LA/guBB82rVH2aEqQcHOt7kQitKLUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d8Ct+reimjzemVFaJskhM5hwM6oYG5iOA7cDYiFPT+0=;
 b=anWwzURrizqnCABPcVVr1djt87hNBHtW+9GtFmKAF8lRS38Nf0S5U7BkLuaqx4pWjEMhHi9fTqtbKMMc0I1ORFK169y45Um/qrtCTJn9f806bg3FwstvE7wNemPlMyeypBSoRyR3Q4XJLHosDgk2ZaskayBzp3/viMwB/sD0TsVrwbaK3hJEuKN+jGs2fp5nZknRm5vv4OwrGMJgurYtAK+wcnT4Ul0SjXNkCX7fOMUMhffYsURtSPYa56qqW+0/nsXcDk1M9FDZTyLhrw9rvonIXO5q1REEefMW0eJpX+RLWtZMwVSXWundkPIPIqkU2cUt2XUhqsyfiO2rWH7a5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d8Ct+reimjzemVFaJskhM5hwM6oYG5iOA7cDYiFPT+0=;
 b=NAsHdnERL7twTQibDbV8x9PzWI7KDvOLBEGbj7VZ46H4OUiE3MVPkR9XECtHEcjEMU3YV3hYoQVy3fzVIREYotNyNmCY+q6vN9FoTT6EpfjQWW9NGBAsDHW7c4ftbi60d5/BuVYSspxvzEPaCqHxtioBvlkKf0Vmo/HmaAej/QQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>
Subject: [PATCH] bootfdt: Add missing trailing commas in BOOTINFO_{ACPI,SHMEM}_INIT
Date: Tue, 3 Dec 2024 10:22:14 +0100
Message-ID: <20241203092214.276453-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002BA4F:EE_|SJ2PR12MB9138:EE_
X-MS-Office365-Filtering-Correlation-Id: 1348204b-83ec-458e-4911-08dd137bfb83
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5k49ED2teQTjiUBgqewajBjPsN/L1cieqHs0BUm06VZMLEwA7J0801ItolXn?=
 =?us-ascii?Q?sVJjrvBol6R0D6wBvT4GehdK2OGbl3GRY9mU9tw7LJIa9S4PwyPwECdXwUX7?=
 =?us-ascii?Q?qu6HA5z7KizMEGEIANJrvJoCsvwmfGffjFuwC3dClcMncqnybTjJaGxbBdrF?=
 =?us-ascii?Q?15mEpxxWHN4AE2WgaYfzi4NlSSGAxFbvr5LwJ5o3goX53VsmIdHRsPqZIub6?=
 =?us-ascii?Q?2e3IpQjfglDMRqUjKcZ889YKO65FITsrNY9TN8WqschdihGXUwgfZ4GBx/nA?=
 =?us-ascii?Q?kHC8FQEPi4kLt4WhoGcjbOZgOcKmOrTbrBBUNp8+RkCc979qLyTspmQ56hHM?=
 =?us-ascii?Q?np0tUUbvwcJOfnpaKN9iXZiEy+ZxzjPKufs2kU/DSwLz1dTnzgzoFpxh7PkP?=
 =?us-ascii?Q?r332sSsifCmH0CcLHHL3o2ClTIobntAVnw2ohj+gF4VR6V5ADpkoGpYVg0eJ?=
 =?us-ascii?Q?AVTM2LI/A3uDp8ZGiCXNzusGNEpdVAZtEl6hWrQlatvTAe36t0SM0WYd3D3l?=
 =?us-ascii?Q?93NbPDPoCVVhts0x2TYykM4IF8RM+P3Q2b5KzZ40gWozLzETcfTN8ytTpR4I?=
 =?us-ascii?Q?VPAIMc202icXzvmI6L+Zz92wXXsVhSfmSR9ZYNKEN1HrXyV3Gsyrgzj4YIyc?=
 =?us-ascii?Q?ARJHmtFQGMNf7bHiGIVkh3wsELSbtMqoZ8JUGEW06XHlJYznayl4Ud89gUP/?=
 =?us-ascii?Q?XgJN/4sCeqyMkANEhq33Fn6uZErmZ5zq1YQcZtKZ7c5EBmAz9r3i4x8SyHLg?=
 =?us-ascii?Q?Ysch2CAK4iaRu6btWyHiIpzMv0jRSKpsTgwu5ZI4HpfcliO6gQmJdcTHTPVi?=
 =?us-ascii?Q?OR3lLDuzs1121ioqg0veCByH/LGgla1vgBkEZt89WgucJ8a4yKUW1Vnk+F6w?=
 =?us-ascii?Q?sSGaVAhlx8ZKfYolXfWJCpB1LiP6y0eV+RscWw8YLMJs23kA61zKMw62cCvY?=
 =?us-ascii?Q?T5AZE8XWgHUjkjGElqQus6WH8njS2U5eI+wwq/2n1eTziAbLOceoiI4Xz+w0?=
 =?us-ascii?Q?MRk87zN4As5As/cEdEC6EaNWMNbs9UFRduBDd/TcqJBRYcwV7XkD+6xCt+Tw?=
 =?us-ascii?Q?WuZF2FtoQmk+YDmXoYaJNBPw++3rwR9ltYCdS+yhlM4fW6/8YAPGg8zf6wNm?=
 =?us-ascii?Q?WoM7DWRiH9Epb2TzCNA4tINrEIlNs5+qbkzGu5YMLeXojQdX2jcnI0TxInZO?=
 =?us-ascii?Q?eIha79yPa4T9RSBxPe0tHzDfU7zUOu5ry1uvsoeWNNGaEnlUkr+1xA2ed0Wo?=
 =?us-ascii?Q?VFZSrLUcu3YZWU29hnS+VwNTI5/EqDfWY/pEPsVAEiMmmhm+P6XYGu1yJii+?=
 =?us-ascii?Q?V7RQEyjsLGpyVJWQdb8ug6WZ0TrggKXIZNNSljnoaW6C69rHj5Be2wnhMJ8g?=
 =?us-ascii?Q?lvv6y1pHaxTcbBEsg0KmNJHM7BY4BXJsJnbxE2SOTLDErIPXsgpg69hhbvpz?=
 =?us-ascii?Q?xQygr/JFnYiaf/1E17pUT+duKV7zutO6?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 09:22:17.7287
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1348204b-83ec-458e-4911-08dd137bfb83
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002BA4F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9138

Commit a14593e3995a extended BOOTINFO_{ACPI,SHMEM}_INIT initializers
list with a new 'type' member but forgot to add trailing commas (they
were present before). This results in a build failure when building
with CONFIG_ACPI=y and CONFIG_STATIC_SHM=y:
./include/xen/bootfdt.h:155:5: error: request for member 'shmem' in something not a structure or union
  155 |     .shmem.common.max_banks = NR_SHMEM_BANKS,       \
      |     ^
./include/xen/bootfdt.h:168:5: note: in expansion of macro 'BOOTINFO_SHMEM_INIT'
  168 |     BOOTINFO_SHMEM_INIT                             \
      |     ^~~~~~~~~~~~~~~~~~~
common/device-tree/bootinfo.c:22:39: note: in expansion of macro 'BOOTINFO_INIT'
   22 | struct bootinfo __initdata bootinfo = BOOTINFO_INIT;

Fixes: a14593e3995a ("xen/device-tree: Allow region overlapping with /memreserve/ ranges")
Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/include/xen/bootfdt.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/include/xen/bootfdt.h b/xen/include/xen/bootfdt.h
index cea40ee11706..343c48b73d2c 100644
--- a/xen/include/xen/bootfdt.h
+++ b/xen/include/xen/bootfdt.h
@@ -145,7 +145,7 @@ struct bootinfo {
 #ifdef CONFIG_ACPI
 #define BOOTINFO_ACPI_INIT                          \
     .acpi.common.max_banks = NR_MEM_BANKS,          \
-    .acpi.common.type = MEMORY
+    .acpi.common.type = MEMORY,
 #else
 #define BOOTINFO_ACPI_INIT
 #endif
@@ -153,7 +153,7 @@ struct bootinfo {
 #ifdef CONFIG_STATIC_SHM
 #define BOOTINFO_SHMEM_INIT                         \
     .shmem.common.max_banks = NR_SHMEM_BANKS,       \
-    .shmem.common.type = STATIC_SHARED_MEMORY
+    .shmem.common.type = STATIC_SHARED_MEMORY,
 #else
 #define BOOTINFO_SHMEM_INIT
 #endif
-- 
2.25.1


