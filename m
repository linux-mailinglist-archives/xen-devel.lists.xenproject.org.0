Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C09CE9988BC
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2024 16:05:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.816166.1230367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sytn1-0006NU-MA; Thu, 10 Oct 2024 14:05:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 816166.1230367; Thu, 10 Oct 2024 14:05:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sytn1-0006Kc-IL; Thu, 10 Oct 2024 14:05:15 +0000
Received: by outflank-mailman (input) for mailman id 816166;
 Thu, 10 Oct 2024 14:05:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rwpE=RG=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1sytn0-00063w-9O
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2024 14:05:14 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20628.outbound.protection.outlook.com
 [2a01:111:f403:2009::628])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa12c5e6-8710-11ef-99a2-01e77a169b0f;
 Thu, 10 Oct 2024 16:05:12 +0200 (CEST)
Received: from CH2PR07CA0043.namprd07.prod.outlook.com (2603:10b6:610:5b::17)
 by SN7PR12MB7371.namprd12.prod.outlook.com (2603:10b6:806:29a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Thu, 10 Oct
 2024 14:05:06 +0000
Received: from CH1PEPF0000AD7D.namprd04.prod.outlook.com
 (2603:10b6:610:5b:cafe::7b) by CH2PR07CA0043.outlook.office365.com
 (2603:10b6:610:5b::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18 via Frontend
 Transport; Thu, 10 Oct 2024 14:05:06 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000AD7D.mail.protection.outlook.com (10.167.244.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Thu, 10 Oct 2024 14:05:06 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 10 Oct
 2024 09:05:05 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Thu, 10 Oct 2024 09:05:04 -0500
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
X-Inumbo-ID: aa12c5e6-8710-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xekvhpd7lwq5yH23yGZktZOdxGbnQ7MrqJfB4kdXhXZyJ+yhUYWaz17gbjBoLELJv9ab9EyGDuyC/Dq2ddSX+rHOpYUrP6BLwlrQL+eOQ7wYRYh/1m1dCKaMrNMlu7fl2s+ZIPriBdDHLXJZRbhNUzZlqPw+Tw6JZko64NvnpJHqbz6b6rqxpmLGF5d+2Xi+/8fd6lN0vMhZWOTvNJlhLZFPhc3GhSRlN+V53qf9FN0Bq5sso4rcXf7lweyJ1xBo/63mZLcozuc7q71OQqBN6c6I2QCrH1oa1myuAGqOmlvfSEpvhXeVH4phY59HenLwq/kq8ds4Ey5gOGgSnZgtEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h8Bq//NZ4qXsynzh+qjTiZ5t/d9zK4Vri+C1Mc3rvDw=;
 b=oc9DPCMMkDM3gaLMiM/PpYnIkYPSMCkcBklTj7PgSsLmN1pTZZYOn3coQdH6KnT7ScNxM7sZKv290/6RfJUOI1CtSsu6GofcD6C579b2nfkfxmUuQGDZMtTFCu9qDjetX/iHmuqyIZOHC4h3+N4ecmvBEq6YL9BSmF2CyFc4acTU9hsYcAm9SCfh0BtSWPZ85pIe5+nkRa8X9PemLf3OeiOVFsR16eioYkuh1AVTNiK7TTnzMDYeB/YnB0+vwConehjdCRPn08t6q0EqeKQyJQTwCE0SJdT3oEE+sKJbXbl9picp58IrSokbOHyU4ys9tXaME3SfiThsKEy2zmlSwQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h8Bq//NZ4qXsynzh+qjTiZ5t/d9zK4Vri+C1Mc3rvDw=;
 b=tBecdr2AIAyliFsoKsu4+h4/9m1XSIl8VDOy6HhL2FD4nOrQat6JVWaIluuKo97exSeNtbu4GLM0iEEhUZnhx/PsOLGziyIeT7sHcyF3lHAOmE+6SmCS3je5Thr7wLOA8mYLDsEo8KvfzNPhaareo7nZAShxYK7k+CyIiazsmr8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Ayan Kumar Halder <ayan.kumar.halder@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 2/6] xen/arm: mpu: Introduce choice between MMU and MPU
Date: Thu, 10 Oct 2024 15:03:47 +0100
Message-ID: <20241010140351.309922-3-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241010140351.309922-1-ayan.kumar.halder@amd.com>
References: <20241010140351.309922-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7D:EE_|SN7PR12MB7371:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ba66ff0-fd03-4bbc-85f3-08dce9348b6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?CEXySuepL7ELKM+T4XL1zP6UtnbBYFoaJwTAESN2hovTleLIm4bRZzNhAf9R?=
 =?us-ascii?Q?6/9lL4cjjv+V+wu0uUQdk0kF2q7anSkaqEvK/JmIf40ELH2KKV8VqHqRu5df?=
 =?us-ascii?Q?LVtNdGq3wj2SqBLb3OzMOmDFKY0ql66Xgm5a0jyrOFGJcsl5dV1Rh8IhwXia?=
 =?us-ascii?Q?+3S1RLVktnZs4MgqBEBpMf17g9GzMWeku1RN7ugIuqzicz9CGSWl0FdkNnlc?=
 =?us-ascii?Q?FsMEblUD94sEgnOfNzjNOyN8XC3GYasYW04Uv39QqKEy2140Iho8hsYBUm/V?=
 =?us-ascii?Q?6lU9dEI12Xgyi0VHkkAbMEMKTtIS2Qa/BNXWR1+4IMWvwDUTke/Y1dVHOxHv?=
 =?us-ascii?Q?KUiNUooodJ/+MoV3J4opsOav4Rzhpn4WmhWiHYvfzU/05AwZBpdVxM4UZ7n0?=
 =?us-ascii?Q?qDnaFRJSboqG+crfyqZDw1+L8jUMqk2MQfTASHIGqFtMnPAGCwYGvvj7BaEL?=
 =?us-ascii?Q?lGJTqMF2LSPHVSrqkh7FSB6YPGUuuQGBMtOB6fkl9G4rJmsKRfZAGn8z+c7m?=
 =?us-ascii?Q?DFpsVkMIkQvZxXJBsf2WlkEOcnUW5qX00iOLRLMKHfLv/C5CiD54ujabBPG8?=
 =?us-ascii?Q?4TMX7O3N1+GZUUry1SoI21ei3kfpmJMBRdoRAP3atNwCaIwPG5jFF1+IW8Fb?=
 =?us-ascii?Q?nAwWJqyxeZ28wpWkt94BkxRNSuP/1KQNajsuOx6xGC4AyEMss0zcJl6D3pm3?=
 =?us-ascii?Q?vopAmeoiNd090MCpaP5fEMHWwusVwYybL+TDyiM8Dv6s2GWEokvvlGHF1QrP?=
 =?us-ascii?Q?ZEJ0EA3pulEZO1ueGkhiCKSChZy7bc/o0S9FzAHsd4PWpPV1W1pRyjF9UQcr?=
 =?us-ascii?Q?4EYuJPpPzqQKK/O4KkNsMRvU0e5tWo2Rdrt1IBaJ2CffdYrE2w4nd+d/blqe?=
 =?us-ascii?Q?yQ4zZDrHdhia6mO63K2h6kpcxRVODp9YQpDYEnXSAcSBPAW260PUc2DVIQoA?=
 =?us-ascii?Q?Dr75AvDEcKvl8D4/F6Nrli5qekdEKeWGu6D/DnQwzk0BDmdMAbw3aqapF9Np?=
 =?us-ascii?Q?kusRHnd1k+l/wOIB6Gt7fw1lvVOI/4fgtDjpsgWP/nKIUVC4aRcryjnoCmkP?=
 =?us-ascii?Q?s/HTRS0Qw0DN12MLSbv83YQXtiuaWkftkhtsufzEFTDy/kdp/7oyMwl3ZH0j?=
 =?us-ascii?Q?Ow4SiakSFGnk+asyYO16ZTjie9NrqgfbRlI0bqKPDOW+JEUZ3RFMzxZqRYaa?=
 =?us-ascii?Q?su3UJYfpBzKPfZfDvgSh6q8BcJHmbjd/0fJTwovNTA6Hh7rfvxtm/977ZMmw?=
 =?us-ascii?Q?H7VKh1MokOIqsc+Fwtblx00DYY+uAIpSOHrIcUTnJ0SSgW6DcpPSYu04B2ep?=
 =?us-ascii?Q?2G44vGPM3uvM9TuernBXF07ykg4X4TBYgUTtnJEqKlsJZ2/5wxF0gEu7Pjf0?=
 =?us-ascii?Q?ovbaNnSiGzUcCXroQqA1wI9x7Zu5?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 14:05:06.5743
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ba66ff0-fd03-4bbc-85f3-08dce9348b6f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7D.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7371

There are features in the forthcoming patches which are dependent on
MPU. For eg fixed start address.
Also, some of the Xen features (eg STATIC_MEMORY) will be selected
by the MPU configuration.

Thus, this patch introduces a choice between MMU and MPU for the type
of memory management system. By default, MMU is selected.
MPU is now gated by UNSUPPORTED.

Update SUPPORT.md to state that the support for MPU is experimental.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
Changes from :-

v1 - 1. Reworded the help messages.
2. Updated Support.md.

v2 - 1. Reworded the help message.

 SUPPORT.md                     |  1 +
 xen/arch/arm/Kconfig           | 17 ++++++++++++++++-
 xen/arch/arm/platforms/Kconfig |  2 +-
 3 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/SUPPORT.md b/SUPPORT.md
index 23dd7e6424..3f6d788a43 100644
--- a/SUPPORT.md
+++ b/SUPPORT.md
@@ -40,6 +40,7 @@ supported in this document.
 
     Status, Xen in AArch64 mode: Supported
     Status, Xen in AArch32 mode: Tech Preview
+    Status, Xen with MPU: Experimental
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


