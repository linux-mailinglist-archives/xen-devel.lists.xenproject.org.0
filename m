Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 15DA0A4EA2B
	for <lists+xen-devel@lfdr.de>; Tue,  4 Mar 2025 18:57:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.901399.1309371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpWWJ-0002ea-N5; Tue, 04 Mar 2025 17:57:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 901399.1309371; Tue, 04 Mar 2025 17:57:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpWWJ-0002ci-Hw; Tue, 04 Mar 2025 17:57:31 +0000
Received: by outflank-mailman (input) for mailman id 901399;
 Tue, 04 Mar 2025 17:57:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6XUS=VX=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1tpWWH-0002bP-Ef
 for xen-devel@lists.xenproject.org; Tue, 04 Mar 2025 17:57:29 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061b.outbound.protection.outlook.com
 [2a01:111:f403:200a::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 22e7851c-f922-11ef-9ab4-95dc52dad729;
 Tue, 04 Mar 2025 18:57:28 +0100 (CET)
Received: from CH0PR03CA0005.namprd03.prod.outlook.com (2603:10b6:610:b0::10)
 by PH7PR12MB9076.namprd12.prod.outlook.com (2603:10b6:510:2f6::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.25; Tue, 4 Mar
 2025 17:57:22 +0000
Received: from CH1PEPF0000AD81.namprd04.prod.outlook.com
 (2603:10b6:610:b0:cafe::95) by CH0PR03CA0005.outlook.office365.com
 (2603:10b6:610:b0::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.26 via Frontend Transport; Tue,
 4 Mar 2025 17:57:22 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000AD81.mail.protection.outlook.com (10.167.244.89) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8511.15 via Frontend Transport; Tue, 4 Mar 2025 17:57:22 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 4 Mar
 2025 11:57:22 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 4 Mar
 2025 11:57:21 -0600
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Tue, 4 Mar 2025 11:57:21 -0600
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
X-Inumbo-ID: 22e7851c-f922-11ef-9ab4-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vJbSa7SsJdIyXzlL7mzYxSo5m999al7I8FVUQi/xRAtab1H0rxE2P097ZvaxZvapoRcYDAhMVvgkWDqKOibwO8d6NhWh53eHvMzVkAuIZ23a5uRlow3d7EfXOSgRs5agGxPvJ9B65TyrIU3m8ElAhTiTYCm5iNiSfsKqLU4abQZ1VnyIxI+i0xKfXS11nw98viQoqUBdCSyfFTlkF6MyRtcfuR4fj2tQoRISPJ/AHuOEWnpGmPQqCBo5JiLetPfAHXoDEmpc/YSh0lLb/91FqOa3QUilFI38IIUGFCSo+1aprZMtyQ8LsFk0iW6NC7ukMAwdLBwzqnPmQgaGPys4/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=74iqe/njp1ZHRrCH+t3KUD+MLgSw6RTgd/onIA8MIFY=;
 b=OgB/IN5TRXVX0jw/dXVcQlBfmgWGc6hXq5DGcxxx2Mu36JQL5XFiV0nZj06OTDfNEwiWrNpelY4jePfWnrEcar7nuQ7NYapECbkZUJscCsJRiAhEZBALur7FChW+xjs+GX1JqsIg/QVrfPzl7MIpi2eN+W14mL8kAZlVhmpB1QsUO5Frk0iKxHlc83I5DVoYU6NjoVzwPKxO4OpaCy0q4GPCGO/eF7a/hMp7AIB/gWhtW6bMKzv6C915FmnKf30mnOdncFbA1wlEbjln4S3MjrP+y0Hchb6OqSs5gypTzLfNTDw2T0q6in8lxDEQtb1HglhD/z5gDizH7znl/7jOsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=74iqe/njp1ZHRrCH+t3KUD+MLgSw6RTgd/onIA8MIFY=;
 b=n+6qrNANA8RzQbpkyWeKhs88FVMTQ7e5r3dahZ8tMhlJgXfPREptI6oy40pF9iCfllrYPDoDbTsL8tk5IttChfXOvN/kglMtSBw9bIKz8k6lkCBkQ7jfchrQE6NgWV5tCl41rX46Jxzi3SJMw/qIi35nnndvYnOhauU/LoIzmB0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Ayan Kumar Halder <ayan.kumar.halder@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 2/2] xen/arm: mpu: Ensure that the page size is 4KB
Date: Tue, 4 Mar 2025 17:57:08 +0000
Message-ID: <20250304175708.2434519-3-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250304175708.2434519-1-ayan.kumar.halder@amd.com>
References: <20250304175708.2434519-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD81:EE_|PH7PR12MB9076:EE_
X-MS-Office365-Filtering-Correlation-Id: 63eccace-5690-4806-1dd0-08dd5b4603cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?z2Wz8IJ+/8O89ZNlwveAw9TbZhGER2Hl2shzJc9eFf2foROYda1V8ILTbaS5?=
 =?us-ascii?Q?GlWREu5ZpkWd8r/8JAo0tsGV+ledYRHPCJTm5hY5CLCb1fBfTAcXHsz2p3aC?=
 =?us-ascii?Q?fJcgYxph+qLFoG9U39CQrmbJGitKg2ic0BPDuI7XEvdtHOlX1LSWCmXRpyIU?=
 =?us-ascii?Q?e4/na8FQhrrTa6zPFuzlXIoJTUWjrASsMkI3I7iGpMHIZPhzSTA2sdssxuaZ?=
 =?us-ascii?Q?G0HS96cNeHIWEyT+o+IHTkADM6J3GRJ44LYkDP+FDQJsrBXbFi5uEPuiKBjj?=
 =?us-ascii?Q?WmsvM/IYOE4X785FTWgwO+4dsAn/BUFLfJ0A6CDPNesp6UmEXwtut25LG8U8?=
 =?us-ascii?Q?8vZlZ6kaXPsmzy0mHB9H7WZHnwLWyLpm57xGHd2Rg5aVt9bXe3AWYMteAG8P?=
 =?us-ascii?Q?qJ2TPfxcOJH/cvMU3A2hJYRUu5HMzxPTJpcJPLNU8mt+ZNxFSqAsuqg+9imn?=
 =?us-ascii?Q?ob4tZrCML/vW4gr4L2TQcRsmYv1JcMgYAHEH9t3yMFHkUmbNZMlM7FzkM6r8?=
 =?us-ascii?Q?3xbySLqalsko9BvqeCaNOKCFzP+tdu3rEhZsdGm2qKFnFJlhKs5QguJvZWsg?=
 =?us-ascii?Q?wQVI6zxi4R08jxT1L6yhUJJ+TKBC9zzIz+gwN92AbL604VRIot8KD4C3uCnd?=
 =?us-ascii?Q?YbaZJiHOs44GhDGujdM2bhYhPt8XZKksl061Z2XFt1Yv4yPpnuhcYGW/LRlA?=
 =?us-ascii?Q?lu8B8EI0Q7FJPEwbENG/c5IBiWMt6hSKjQjgVERSDkHX1drS8zsX79piwcZI?=
 =?us-ascii?Q?ZZh/gYeQYgaowz9+9SJvORKcLf/kcVH8Iisbjgt56DHEkwet9DG6jKjTCP0E?=
 =?us-ascii?Q?75MrztcAFuOj8lc3DyMjQXk57P7uuSJMe+yepzyjMpC7u9olyuptbiy6ChU7?=
 =?us-ascii?Q?0fmmzp42TEHr8vrlDIst/xDlL2Ho59lvpU5rAqaECdrvW5a9BwdHbwh3DMZf?=
 =?us-ascii?Q?vEWZF9CknA9ylRbp3pZVL2W8wVQGJKfVC0aeBVq31/jngzdRKjjbKsRpUyqh?=
 =?us-ascii?Q?I4uSGPm/hXBrO8+Y+LvhsY7pAu7RwzYqD3oSpt9XuMlexaRiB9q0q8NKlAU6?=
 =?us-ascii?Q?dYdcevyhKo/Je5121P7B3oSTGW4XsLn7zqqC25F1KuDob+/URXmREsVAgj1r?=
 =?us-ascii?Q?NoPEh2U9/ifzG0V6MvPdweKzGBv41ufrhpKlDyQt7bXh8T6OL06Xtw29Swfx?=
 =?us-ascii?Q?ETvXXQyK3kqKvR+JrsfeD4iIeHYK+96qTjV4jKKnp/V4e0QV2YKh47L2IWy+?=
 =?us-ascii?Q?IUfaaGPaKc46CYPYkjhy6lUanZrIHrFF00SfmXs6z8OVPEYJx4EsZ6mX7j+z?=
 =?us-ascii?Q?iHewS0mLNZaFxS09o3aVj9tLt/pwZWKfCiCZMly5FMWJzyTCWa7CCwZ8W+M1?=
 =?us-ascii?Q?y3tag+zA4Kd36eoP8q+WeezyJmCMspAcQ1Z4yBNJRSuS7Mrz9FZ4gO8O1T2O?=
 =?us-ascii?Q?mJLVVa5Z6JaYwQrh9jWNqzVfN7zoN92jFjFxK5Kd3OAjP8VegSKsiA3OKuAr?=
 =?us-ascii?Q?a5PxRSjPEcSL1Mk=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2025 17:57:22.5178
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 63eccace-5690-4806-1dd0-08dd5b4603cb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD81.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9076

Similar to commit (d736b6eb451b, "xen/arm: mpu: Define Xen start address for
MPU systems"), one needs to add a build assertion to ensure that the page size
is 4KB on arm32 based systems as well.
The existing build assertion is moved under "xen/arch/arm/mpu" as it applies
for both arm64 and arm32 based systems.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
Changes from :-

v1 - 1. Extracted the changes to a common file.
(I have dropped Luca's R-b as there were code changes.)

 xen/arch/arm/Makefile             | 1 +
 xen/arch/arm/arm64/mpu/Makefile   | 1 -
 xen/arch/arm/mpu/Makefile         | 1 +
 xen/arch/arm/{arm64 => }/mpu/mm.c | 0
 4 files changed, 2 insertions(+), 1 deletion(-)
 create mode 100644 xen/arch/arm/mpu/Makefile
 rename xen/arch/arm/{arm64 => }/mpu/mm.c (100%)

diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 43ab5e8f25..fb0948f067 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -1,6 +1,7 @@
 obj-$(CONFIG_ARM_32) += arm32/
 obj-$(CONFIG_ARM_64) += arm64/
 obj-$(CONFIG_MMU) += mmu/
+obj-$(CONFIG_MPU) += mpu/
 obj-$(CONFIG_ACPI) += acpi/
 obj-$(CONFIG_HAS_PCI) += pci/
 ifneq ($(CONFIG_NO_PLAT),y)
diff --git a/xen/arch/arm/arm64/mpu/Makefile b/xen/arch/arm/arm64/mpu/Makefile
index a8a750a3d0..3340058c08 100644
--- a/xen/arch/arm/arm64/mpu/Makefile
+++ b/xen/arch/arm/arm64/mpu/Makefile
@@ -1,2 +1 @@
 obj-y += head.o
-obj-y += mm.o
diff --git a/xen/arch/arm/mpu/Makefile b/xen/arch/arm/mpu/Makefile
new file mode 100644
index 0000000000..b18cec4836
--- /dev/null
+++ b/xen/arch/arm/mpu/Makefile
@@ -0,0 +1 @@
+obj-y += mm.o
diff --git a/xen/arch/arm/arm64/mpu/mm.c b/xen/arch/arm/mpu/mm.c
similarity index 100%
rename from xen/arch/arm/arm64/mpu/mm.c
rename to xen/arch/arm/mpu/mm.c
-- 
2.25.1


