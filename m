Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 632B89B30C7
	for <lists+xen-devel@lfdr.de>; Mon, 28 Oct 2024 13:46:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.826444.1240708 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5P8c-00054r-S8; Mon, 28 Oct 2024 12:46:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 826444.1240708; Mon, 28 Oct 2024 12:46:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5P8c-00053F-Ol; Mon, 28 Oct 2024 12:46:26 +0000
Received: by outflank-mailman (input) for mailman id 826444;
 Mon, 28 Oct 2024 12:46:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TXyF=RY=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1t5P8a-00050g-Qg
 for xen-devel@lists.xenproject.org; Mon, 28 Oct 2024 12:46:24 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2062e.outbound.protection.outlook.com
 [2a01:111:f403:2408::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a2f82cb6-952a-11ef-a0c2-8be0dac302b0;
 Mon, 28 Oct 2024 13:46:23 +0100 (CET)
Received: from MW4PR04CA0263.namprd04.prod.outlook.com (2603:10b6:303:88::28)
 by CH3PR12MB8308.namprd12.prod.outlook.com (2603:10b6:610:131::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.20; Mon, 28 Oct
 2024 12:46:18 +0000
Received: from BL6PEPF00022574.namprd02.prod.outlook.com
 (2603:10b6:303:88:cafe::e8) by MW4PR04CA0263.outlook.office365.com
 (2603:10b6:303:88::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.21 via Frontend
 Transport; Mon, 28 Oct 2024 12:46:18 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF00022574.mail.protection.outlook.com (10.167.249.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8114.16 via Frontend Transport; Mon, 28 Oct 2024 12:46:17 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 28 Oct
 2024 07:46:16 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Mon, 28 Oct 2024 07:46:15 -0500
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
X-Inumbo-ID: a2f82cb6-952a-11ef-a0c2-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OmxHYJh9YA4OueVMzcJcEVtMKJVB84TGatuFhs0UbluAgUZGwBPXrMEXx6rrGTHEduiNe0kvFWI6GYdKHpl/UF3oflm7kL6eIYvewF7vzAD4kXg4K826dpLaG2pknz4XL+LOM34xBEVSJBN5Euk2M5nelCRJaTyguoFM04rn4eYt51so7+yCahjPml1gwFibnEL5mVa7w3czN3pSQB3QypKyTcGdaJRQ5f4iwEOPdNgLV4swQ8jW11eD2xsQoLogffW3lFMkx5eoc7Yr3DX4OXD1lep8PQADhb/2X8iciF7ua7/1+41fTfLxSiPkuOLQqls4mz6A3SxGSri/DKYfRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ptl+NdoV/c7naiFmhPcaykhIi3QSimLXcLj6cNBxMSU=;
 b=IhIIrgRXBo1/ZvDr806T9lXXNH6Jdy5WTJl27S1owkqV2mIM1QvcxOlZHX7OFMIXj07NoqgJ+3C/AEoOE7HQpEILShDr8ER43JdJ9oQFL4aZ8ngGpjdFgnwPEFjpqcMFurewH+qJE1PmpGVQT5VPEPQQ+dfFN2wH5YtI+InWeaRzvA5XCNZnjNdwwcLJg0xEmpInEJsGAq6EKXAj0WLWccnaiJ2jcAhnMOjCTrbJ4YA1sVHc9zQ5SczPN6tSV+OWP4Hu/ydCkJQHLJvkSEw18OLV3nyHhkdDSwa3ynu2Ex7Cgiu172nxxSo/p17/2uVpUIySMfvO8RP2U7OLR8dgFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ptl+NdoV/c7naiFmhPcaykhIi3QSimLXcLj6cNBxMSU=;
 b=fN7PdrU0I2yoqzGVtJdnE9aelqDxTL5HQMdtyTWzFHrB8viK45HS8p6zp9hn28fWiiM3gZrl0yHR6K414uIVf37umOFjGUzzx1rO85b9Ezp684T8EuONdVkOPvstuPcuf8X1/1ing7U1oLyA5I+l4GWQnzQWU8uKwrzWgpWTbD8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Ayan Kumar Halder <ayan.kumar.halder@amd.com>, Oleksii Kurochko
	<oleksii.kurochko@gmail.com>, Community Manager
	<community.manager@xenproject.org>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Luca Fancellu
	<luca.fancellu@arm.com>, Julien Grall <jgrall@amazon.com>
Subject: [PATCH v4 2/6] xen/arm: mpu: Introduce choice between MMU and MPU
Date: Mon, 28 Oct 2024 12:45:43 +0000
Message-ID: <20241028124547.1371867-3-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241028124547.1371867-1-ayan.kumar.halder@amd.com>
References: <20241028124547.1371867-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022574:EE_|CH3PR12MB8308:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a7282d1-38a6-458d-3b19-08dcf74e83f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?OZZ/qsC0xia9PAG661a1SSmFrWamhni3iyOiu8nRz7sChbTWCSK0YHPeQVvu?=
 =?us-ascii?Q?Wl0GjlUo8PueV1zi5/DRN23xg+GgRsW9exlPGBrT1881LYhME31sVJ7GK3dD?=
 =?us-ascii?Q?X0w4Hr1woe6FnX0QDHbpS56GqmiDaDG/K0hsFPsnWp80Eo5Ye2hnE0WEIlrt?=
 =?us-ascii?Q?NtKoWXghV4zunjcFF9N5Ged1vUvbHg+Tabj9EFTcF+wETutBw6gIZROpQY5+?=
 =?us-ascii?Q?iZALO0LcQhy7xyPBP4/q9ebUrsEP9NGlVdbH04N/iF3qBC2usVqq+3xSDC31?=
 =?us-ascii?Q?IUqBDzgMIGohwZtCoVVmV6/Ro52CsGay8/XCqOxZELn87BJ3fCdAHZj/J49f?=
 =?us-ascii?Q?wLu+A7326sqihJca1ZCw6cqy6fD9CIFiFun3oO7+NE5prIZqedLQZssfYXPf?=
 =?us-ascii?Q?arMVtJ0TQ6/4i0Upbh+nqfXXqho/ksftcFFM6oQtf/DTFeRelHN0v/QWpyzI?=
 =?us-ascii?Q?Q2DPYg/nCTxpVAFargwocyRfmGVceHYLAXiPeEi1q72xJPZWP425CWF0Dfej?=
 =?us-ascii?Q?wVOUJSIEF/YrBhBsk3qukmp71h8v1SWpgD5hzyXHjtWlPPKoFc9cB+Vwq6qR?=
 =?us-ascii?Q?WRKFuQq7vovnzKJdb0LrrM/jMTSb0abqJVUDGNKhmtvOr0Z2lk6amzgt8AeB?=
 =?us-ascii?Q?NK9naqWTFN0b/+z2Dx65aAw1MJpMq/1QnOBw7V71KpKcNWjgUkwGCgtd+gCo?=
 =?us-ascii?Q?LnTrRSuu/jUD+dwIi/2zgZzFuANTz3Wl0RkM30S+v1tW42HAHqB2KRDOSc97?=
 =?us-ascii?Q?RiTCsbyG5pqDbK//8etqUcOIgv9MK3Xe7mxDN/xPDH45H6GLe4lPLlSOnkeJ?=
 =?us-ascii?Q?vngL8jyUhtP9AQBE5lUhFYEzsTSR5pfDa0qqcbvc3v+ll5+5vatDELrx/+Ft?=
 =?us-ascii?Q?5TUmjaD+7GVBTf2eku2nOb/nPg21IXKpAOhDp49g7RnEqfWRfAMV6gbPWPEu?=
 =?us-ascii?Q?qw1wZl99p/NTUuI1KEmwQGhcv/SFzWgdxfjeo7mxgWV+FahTaNNcyk9y99s9?=
 =?us-ascii?Q?r1928vPl50mb26LL67mynl0JIyq1os+/4LPRQs+3xDBkekrhOskxTBfNjYrb?=
 =?us-ascii?Q?a7cmQpydQEd8hCSj804C5UZuZ17ZY9wCWhYnxwBlJacM983mC0oAMsvVKs36?=
 =?us-ascii?Q?EOb8Ek8KuuJGA6lVk2evnDUbh2x2pIIIp037OurQDvWz9xz/yg/AJlfgnq45?=
 =?us-ascii?Q?/TZjnBz3OOlT3XcOc89hzaGbpwbwGRfnGOG+wufAgNvLciEFtPhr5NaT1hSJ?=
 =?us-ascii?Q?91toIiPsJMBgzWDhN/ZbcsweG9Ps8GlQ2bjiIfOMSaXVOv/h6L2MgtOtQm+y?=
 =?us-ascii?Q?dU/lkZgjZ0HJ6WhdKPjAZw73oDrFqZR8qbEyoZZNQ9AVXbXHIwM6aZKdSlD1?=
 =?us-ascii?Q?EbFgsgE=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 12:46:17.2120
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a7282d1-38a6-458d-3b19-08dcf74e83f1
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022574.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8308

There are features in the forthcoming patches which are dependent on
MPU. For eg fixed start address.
Also, some of the Xen features (eg STATIC_MEMORY) will be selected
by the MPU configuration.

Thus, this patch introduces a choice between MMU and MPU for the type
of memory management system. By default, MMU is selected.
MPU is now gated by UNSUPPORTED.

Update SUPPORT.md to state that the support for MPU is experimental.
Also updated CHANGELOG.md as well.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---

Changes from :-

v1 - 1. Reword the help messages.
2. Update Support.md.

v2 - 1. Reword the help message.

v3 - 1. Update Changelog.
2. Add R-b and Ack.

 CHANGELOG.md                   |  2 ++
 SUPPORT.md                     |  1 +
 xen/arch/arm/Kconfig           | 17 ++++++++++++++++-
 xen/arch/arm/platforms/Kconfig |  2 +-
 4 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/CHANGELOG.md b/CHANGELOG.md
index c499d12dc4..79524cc15f 100644
--- a/CHANGELOG.md
+++ b/CHANGELOG.md
@@ -12,6 +12,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
    - Prefer ACPI reboot over UEFI ResetSystem() run time service call.
 
 ### Added
+ - On Arm:
+   - Support for earlyboot of Xen on Armv8-R (experimental).
 
 ### Removed
  - On x86:
diff --git a/SUPPORT.md b/SUPPORT.md
index 23dd7e6424..94610d3c91 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -40,6 +40,7 @@ supported in this document.
 
     Status, Xen in AArch64 mode: Supported
     Status, Xen in AArch32 mode: Tech Preview
+    Status, Xen in Armv8-R: Experimental
     Status, Cortex A57 r0p0-r1p1: Supported, not security supported
     Status, Cortex A77 r0p0-r1p0: Supported, not security supported
 
diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 323c967361..ed92eb67cb 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -58,10 +58,25 @@ config PADDR_BITS
 	default 40 if ARM_PA_BITS_40
 	default 48 if ARM_64
 
+choice
+	prompt "Memory management system"
+	default MMU
+	help
+	  User can choose between the different forms of memory management system.
+
 config MMU
-	def_bool y
+	bool "MMU"
 	select HAS_PMAP
 	select HAS_VMAP
+	help
+	  Select it if you plan to run Xen on A-profile Armv7+
+
+config MPU
+	bool "MPU" if UNSUPPORTED
+	help
+	  Memory Protection Unit (MPU). Select if you plan to run Xen on ARMv8-R
+	  systems supporting EL2. (UNSUPPORTED)
+endchoice
 
 source "arch/Kconfig"
 
diff --git a/xen/arch/arm/platforms/Kconfig b/xen/arch/arm/platforms/Kconfig
index 76f7e76b1b..02322c259c 100644
--- a/xen/arch/arm/platforms/Kconfig
+++ b/xen/arch/arm/platforms/Kconfig
@@ -1,5 +1,5 @@
 choice
-	prompt "Platform Support"
+	prompt "Platform Support" if MMU
 	default ALL_PLAT
 	help
 	Choose which hardware platform to enable in Xen.
-- 
2.25.1


