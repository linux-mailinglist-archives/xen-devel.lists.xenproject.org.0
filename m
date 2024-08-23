Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B3B595D38B
	for <lists+xen-devel@lfdr.de>; Fri, 23 Aug 2024 18:32:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.782450.1191950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shXCa-00040n-SN; Fri, 23 Aug 2024 16:31:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 782450.1191950; Fri, 23 Aug 2024 16:31:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1shXCa-0003xW-OL; Fri, 23 Aug 2024 16:31:52 +0000
Received: by outflank-mailman (input) for mailman id 782450;
 Fri, 23 Aug 2024 16:31:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4lC7=PW=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1shXCZ-0003wy-Cz
 for xen-devel@lists.xenproject.org; Fri, 23 Aug 2024 16:31:51 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20617.outbound.protection.outlook.com
 [2a01:111:f403:2416::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 320fd403-616d-11ef-8776-851b0ebba9a2;
 Fri, 23 Aug 2024 18:31:49 +0200 (CEST)
Received: from DS7PR03CA0005.namprd03.prod.outlook.com (2603:10b6:5:3b8::10)
 by CH0PR12MB8507.namprd12.prod.outlook.com (2603:10b6:610:189::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.19; Fri, 23 Aug
 2024 16:31:42 +0000
Received: from DS3PEPF0000C37A.namprd04.prod.outlook.com
 (2603:10b6:5:3b8:cafe::53) by DS7PR03CA0005.outlook.office365.com
 (2603:10b6:5:3b8::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21 via Frontend
 Transport; Fri, 23 Aug 2024 16:31:42 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF0000C37A.mail.protection.outlook.com (10.167.23.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.11 via Frontend Transport; Fri, 23 Aug 2024 16:31:42 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 23 Aug
 2024 11:31:41 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 23 Aug
 2024 11:31:41 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Fri, 23 Aug 2024 11:31:40 -0500
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
X-Inumbo-ID: 320fd403-616d-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lQ4k1SLFw4OR+hAEQv1VLlhoG38JSAWdEWDYMipMNMOl8pbqvZdmRjVW6f82is2QPvtm0aSM3xYmFgXHAhNiRVxEedRI6zhN8kxgpt0HmlpJnsA0pSt9RdA32qr5vqTyBflepRtmX0ghYZyUQSiEtLD6mVfvAnpX+OR3v9ucK9ifxtBNs+2T4CQEtdM+3x8u4eWz3FfYQ+Ot3EP4P2hnYAoAwWbHbTLPsf2sL7LQHSXIUqc7rqdWP54OdRSwzz4Wn/M+p58dsJsgtzvAPq/1UENd33rJH0WNVX31O15XuaNQkM+78k1QC1TF91QyvriKaCgzuyyz7FOwAIcZnOkLLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nx/VzbkSyae2KVO1umnmm7DGWwCikaMWrTbOm87/DJ8=;
 b=PYmUhQ+VnfEE/IsznSkowyTVxjQEDqLEqxKcUJ8yzLcJ/pZBqsYrJdJhH2R9n9pGf9YEAS3f+kuoEADMGB+NPihvoeJfy9jGegNdtFivCjuMfOWGJtZUqKOMfh2w48RIEDIq5XA76DhIkZNYF0cgIQuf5PMUcKpAupztKxFL3YofadCEtwFHUQuVDJ1bgiXR0CX9A4OlhnahbI9a49SxSxWNOBHrNt2c2aWTOAFNOBNjEdRr50fq25QsumUkIoyDewZvap7xjhMJwX64vivf6Sm9Ulf3A829UrbRuNWic3DozqfcqyZGBPohqh8MlVyHNE8Xbl1f5leNheRt/DtVAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nx/VzbkSyae2KVO1umnmm7DGWwCikaMWrTbOm87/DJ8=;
 b=TJWvUDy+OU297FwLEEx/+TkAaZHb0CDhrmsBZjqJZCO6J7WUYzpOyGiHJqa+TCEgyqQPjXEQm3YxKY8md3RzDIB36w1fsZJQNb/bei7zMPijUYdhKNxT3IkYaGcu096paNc3bD7Au9kUZKex6bJiXygbwdeMReetZ15gad3pwV4=
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
Subject: [PATCH v1 1/4] xen/arm: mpu: Introduce choice between MMU and MPU
Date: Fri, 23 Aug 2024 17:31:24 +0100
Message-ID: <20240823163127.3443404-2-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240823163127.3443404-1-ayan.kumar.halder@amd.com>
References: <20240823163127.3443404-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF0000C37A:EE_|CH0PR12MB8507:EE_
X-MS-Office365-Filtering-Correlation-Id: 9087873e-ac76-4140-ea5d-08dcc3911219
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UAGKY9as/WN1Hk7ZLEx2wGseKYrjp5r9iQWFJ9rxrWA32PqRNT6eFdV0j+Oc?=
 =?us-ascii?Q?rk9ebizPvSLWyMjdLI6kMjHcUz5S7MN+i9RQ+JDf3ykgaz+6/O73aB2OIGXh?=
 =?us-ascii?Q?j0dNkyG64py+WJOwdPJODkmi1g4klAosGtyr82cBdK4Dp6r1ntP3oV6AHKgL?=
 =?us-ascii?Q?NXmNx1EMjwIFdU0hDiCulJz4AOaC0qWLVeTtmTHt43zT/pY7PFazGZIsy+YZ?=
 =?us-ascii?Q?Sxk9vMasNdZZ060/k+xAi+O/SXXFt96Qw+MdFg9qNIYxysAWRK4mx8oTnn3R?=
 =?us-ascii?Q?xcwkoG0VNaZ1MPnMR92HHbr6P/osFjRGdhEaUfipbtKwid2Sl84j6jTKXCOj?=
 =?us-ascii?Q?yWVlNgLHaLh0YWPxUYURgDX5KSa9rIGywObPciNBKgEnac8Z/ssvjzD+bUBy?=
 =?us-ascii?Q?vuTvh+00bCVGpyaIS4eDKFzWU6RaWEq7r0iJKavh5uxhKzsVYHQvYyLuI0cf?=
 =?us-ascii?Q?81Q/b73ftPATKXdN1UliHC9LYohjr4TO9GEx5Al4GmW71YXeQu4BUNa1auvZ?=
 =?us-ascii?Q?gUbh5SzAolXMr7HX5rPu14H2IrIjvvZR+pugEHZyXb6/cAM6I5S+pGi/W/8w?=
 =?us-ascii?Q?oRwJtbUBrQLaa1Z/Wi+4vDzUJWUaYSAZazXP8xQTcitfpI4pf9IXBQhd1+Hg?=
 =?us-ascii?Q?ij3f/QKLMYpT5zioWg+WikOZLTPYlNQk3hQTqyyFTiEbiopakocAKS5+6Jkj?=
 =?us-ascii?Q?792qjciQErbUCwJgmQhwe1tw80WZ8hEhGa3JsWEIZ3i3v+n2h9E0raJEVtSj?=
 =?us-ascii?Q?SYzLhY+DdwtldHf+pg3AJBLSDGOdeRWNzyeaPj4QOukpKMhGT8gILoJPz2o4?=
 =?us-ascii?Q?z2ZNlfeCl6OGy/tv6nLK79CoyXvyjNmxNKgrD9f1k9/tns94O+Emp+m7zH6j?=
 =?us-ascii?Q?oKNTp4UOCIvlc+UGlURDL93atSpeo2TY7wmIopUIRNkL1tGuFMOfImyQiiNV?=
 =?us-ascii?Q?VqM923GyJThxOuLI6JainrDgMgfxIiEhCay/EuyBmKhCwl9nQ5RqLY0Z+IKG?=
 =?us-ascii?Q?Hg8AqhHgESJ82LLQ9zdCc8FCO1hq8foP7LpyrmIrhU5WhYujvX5eYmxzB/0S?=
 =?us-ascii?Q?NfY3wCz1Mq64fdiG/6zjyhJ02fiuVwWq2u5EQoYdPbT/uNx+B4kBO8NAiV0r?=
 =?us-ascii?Q?v/p6Rx6QJUum4zf/zdEYtWHEnuzxJhHGt/x8BnqaKf6aOPFBe8tTYzYhxCyu?=
 =?us-ascii?Q?DAYKRJ9mMHCxPOghu+thQlLdsBRcBotCCroVMKw3tYM90D5MJkGHgqajQXaa?=
 =?us-ascii?Q?ntKQfKpJghUmYilf81w0DQCrzGbrXaxsG8dz1PQtk5sWAtWsAvGliVhY1ESN?=
 =?us-ascii?Q?0fKQ4WsoIhe4fVb0PRvL0FX2F+oi+I61IE00qnoZkyW7cC+j+50WuqEczPvm?=
 =?us-ascii?Q?kbbtuee0bZAJ9INQvM12gJJUJbB0bDSVQbadEncgo6lhyravCeA5iV+4NBZO?=
 =?us-ascii?Q?IM83QP/nqwpvB17hbH1cQxzFp7eaCctK?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2024 16:31:42.0036
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9087873e-ac76-4140-ea5d-08dcc3911219
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF0000C37A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8507

There are features in the forthcoming patches which are dependent on
MPU. For eg fixed start address.
Also, some of the Xen features (eg STATIC_MEMORY) will be selected
by the MPU configuration.

Thus, this patch introduces a choice between MMU and MPU for the type
of memory management system. By default, MMU is selected.
All the current platforms are now made dependent on MMU.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
 xen/arch/arm/Kconfig           | 17 ++++++++++++++++-
 xen/arch/arm/platforms/Kconfig |  2 +-
 2 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 323c967361..686948cefd 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -58,10 +58,25 @@ config PADDR_BITS
 	default 40 if ARM_PA_BITS_40
 	default 48 if ARM_64
 
+choice
+	prompt "Memory management system"
+	default MMU if ARM
+	help
+	  User can choose between the different forms of memory management system.
+	  Most of the Arm based systems support MMU.
+
 config MMU
-	def_bool y
+	bool "MMU"
 	select HAS_PMAP
 	select HAS_VMAP
+	help
+	  Memory management unit is supported on most Arm based systems.
+
+config MPU
+	bool "MPU"
+	help
+	  Memory protection unit is supported on some Cortex-R systems.
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


