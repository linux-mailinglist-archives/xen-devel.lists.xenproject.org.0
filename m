Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA040A75BA9
	for <lists+xen-devel@lfdr.de>; Sun, 30 Mar 2025 20:04:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.931672.1333867 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyx0Q-0004ef-Q8; Sun, 30 Mar 2025 18:03:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 931672.1333867; Sun, 30 Mar 2025 18:03:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tyx0Q-0004c3-N6; Sun, 30 Mar 2025 18:03:34 +0000
Received: by outflank-mailman (input) for mailman id 931672;
 Sun, 30 Mar 2025 18:03:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bHYC=WR=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1tyx0P-0004bx-R0
 for xen-devel@lists.xenproject.org; Sun, 30 Mar 2025 18:03:33 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2062d.outbound.protection.outlook.com
 [2a01:111:f403:200a::62d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 43849fb9-0d91-11f0-9ffb-bf95429c2676;
 Sun, 30 Mar 2025 20:03:21 +0200 (CEST)
Received: from DS7PR05CA0090.namprd05.prod.outlook.com (2603:10b6:8:56::13) by
 PH0PR12MB7862.namprd12.prod.outlook.com (2603:10b6:510:26d::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8534.44; Sun, 30 Mar 2025 18:03:14 +0000
Received: from DS3PEPF000099E1.namprd04.prod.outlook.com
 (2603:10b6:8:56:cafe::b) by DS7PR05CA0090.outlook.office365.com
 (2603:10b6:8:56::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.20 via Frontend Transport; Sun,
 30 Mar 2025 18:03:14 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF000099E1.mail.protection.outlook.com (10.167.17.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Sun, 30 Mar 2025 18:03:14 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 30 Mar
 2025 13:03:13 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Sun, 30 Mar
 2025 13:03:13 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Sun, 30 Mar 2025 13:03:12 -0500
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
X-Inumbo-ID: 43849fb9-0d91-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aShHbr4e5KKf5+rOhWHjvNszg6uUqHYXBV7Q0z6DG4cfH8JfM4yuILfWA4xrDxrcd0hJ97r9K1qx1QnSkuMW+oClXCs4zhlMnVt7frFBthMzV+mnlQiEza1XwDrupKD34jFd1QoM3ndruLffbcUcxb8Tx56znho0PR/DJlYmv6jXOIz7BOxLjwNhhT6gcQJo9H/XWB/svk42coIsyQBOkZ2ZBNpnXJaO1cVHyirbtaWGMSm00V3QgaPtxjAi5J7X6PYb66qDPa0c7dylN/4m/IR0Ho98UNYa2HS9mWT2Z0pGrnIlMsnfLqQ6WXpHV3f0OzJ9wHBcIZBHmr1saD55Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HNJHXSQYG4md3b/O1n/6UnbwUqAXjZGAWMltXL7MyiY=;
 b=miPGLqVm2FU0LPEpCbrntL5LvIDQHqcs2Pmcvvz7a/VY0oHnimaI5r7yTTkpm8/YyxkIvhLqgCA+2IGaDTjyKTdgahYTDVvqnrqWZ1YsUyLEZKKBLBuw3eVNXU/y14bcd1wtY87+4/e5iYrxwRe3YxzulNi/lntqDYrZRI3MRkWTOYSi2AOB7iVwgtorJmsI16rXsnPPr2PO2ZbOzXBOF9hxqdjHJUDBC1dMxfg//A1WLdlLoft3AOXkzK7WWlA8my8oMUfk06ECLKDGfxkIObbLY7V4xJ9T+kF6UQ63LImFHeBXQ0A3zQkSqJiUqfVAuEAhJYlrD8TwzO9rAxB9sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HNJHXSQYG4md3b/O1n/6UnbwUqAXjZGAWMltXL7MyiY=;
 b=xV78VAx/iHdiWABqwXChOOf3vL+tMcm+kiwYGAbnt8SpEU/qijgZjDJq/jzOjFxP0C7+lzlWalweV3DM9PNrez8Ygz9/KY8ubeyrasTGKwP9Li1ttYOQJGGQCMHWZwmyXvbYWvsSB7J80u4Da9sv7RdjqEsSwWmHvlxIUf/XvE8=
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
Subject: [PATCH v3 0/5] Enable early bootup of Armv8-R AArch32 systems
Date: Sun, 30 Mar 2025 19:03:03 +0100
Message-ID: <20250330180308.2551195-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099E1:EE_|PH0PR12MB7862:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ed60c84-3b72-49db-d350-08dd6fb5240d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|34020700016|376014|1800799024|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?h72P0UcmzHPGkl2WeTTkscsI05yYzTMfgXnJ2ZcZFWLBTigAK8D680sZGCh0?=
 =?us-ascii?Q?OAuI2N38h5oxCLTwKqhS/2bSa3EubKRhsEdIUAPfmP5oyK75Dnoe1sh0ND9E?=
 =?us-ascii?Q?N3OmiNvE1eEsDCyIjZS0BrMERQZn4FXjEM1Ff8ixjGB32yJIMEjLaCZOIA3q?=
 =?us-ascii?Q?9FizB24KuXXWgThTAtow0lbjC52boGrJUVYZ/p4/XfIjpROv7NmgLvyQeABM?=
 =?us-ascii?Q?NN/00doQe8QBWM5fZjjXpWO5aPt9bm+XBbt1IF2iFRQ877fsIIu7E+Tgs+Tq?=
 =?us-ascii?Q?vzu4BHEsQ9frgmGmyG1WCyVkabKo8kaYzpyLZde9X1uJMqnwbTe5hxGDW6KI?=
 =?us-ascii?Q?iD3ZaofCe2cjI56Ap/OizPQ2LGWWFug+4Vyg/hUDEagrxwC3LeSw/fCUEm0R?=
 =?us-ascii?Q?8jgo1eqyhbntPzqu4L3mnDodfJD97Rx8mp+/f+HgO4iSdFEtAkxv8BLGA+z2?=
 =?us-ascii?Q?r8PiL/WV2sgGrB8i7qyvGyFqz/stvn70qZqL6W2pX4Pgbpda+QYPpiREXWTX?=
 =?us-ascii?Q?x9vNmg8beE3yPfbfrrvKdX2LLsOhboIkobfyjKqcNfHQqaP05PJq3hnTjTub?=
 =?us-ascii?Q?hENFfitKpqsYcWVgOq7bkn82MSHuHoKR0A1u+BXd0vlpj4SIlrBEoe5wL6B8?=
 =?us-ascii?Q?+nlKO12UuW/tLHqLYpf9sY+KGSTUWH6pJ8BPnwpxbhrojFCOYDCEF45aHFRy?=
 =?us-ascii?Q?D8UB/CvM6lcYHMmt2X9llPYIlCgLkWvamgTXN9/LTvviGK86S6ETrFMoRw54?=
 =?us-ascii?Q?PXdhwng0oCoWExMrXkwZRdY0/CN9hHMPaipMxgEdhyBM5Nb8HDbDyT75pvDP?=
 =?us-ascii?Q?u86N3JjM2IWOqIGR5iMrOfSoumpN/dp0cJ+JpPLgWhc02AjsQXrBMQRgkqEg?=
 =?us-ascii?Q?2+aegwLyZCHmYM20j44cqFGw21cjKjtvlpv5Bo7G3skbTy8PLBfgW6vvZkV6?=
 =?us-ascii?Q?1zPi1lywcPgSwYHWoqQp9SfOzqzG1KDCOeHCBnEhQlfGfMO6jry2hpl7sa2y?=
 =?us-ascii?Q?pLKC0xCE5/5/rjtzL+8yPhwVthyjOy5HHW9Q8+HX+6FYAaIdPceTgESTGmel?=
 =?us-ascii?Q?Db9M1jm47m8JuAAEWtQwkC3QyZY1dWHA8XTrkNM2/Yb/IlpCr8UMqBEJ8W8H?=
 =?us-ascii?Q?yJHWX6ORZUZhAH5ZG3PPp31xJmNQlq0LlLZqpfgSKOgxEN3gJgaTPIVRWssI?=
 =?us-ascii?Q?bK+Vaol1zlh82VdOd4mxZGpYcMYj9L7L0jDl+MfHu7xXdOpHmT6WwByIvr0F?=
 =?us-ascii?Q?V+vAMY3HG0EOv1AbNth6+u4d8sT4vkLiDbV1f1f8qOo+fk0cLsFM1N1NVN/J?=
 =?us-ascii?Q?8rMVsXShSOUfCJNLk9QeJ2vPxR+WbG9GC8Q5JA2MpfxY06nJrez1MSz74R1v?=
 =?us-ascii?Q?8S4bM9SOWeoCxE+Kn5iwxRx2T7qjqSukhGoVcrqEl03ycv6MMBhOvBpyhZ6m?=
 =?us-ascii?Q?yqF7ZRz4fyS8uC7ALgGWDyAh0Oj4oJQa06bfs2RzKsFt5X3zdoewDMw/8gDj?=
 =?us-ascii?Q?2BXCyraNnHvWPWc=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(34020700016)(376014)(1800799024)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2025 18:03:14.0190
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ed60c84-3b72-49db-d350-08dd6fb5240d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099E1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7862

Enabled early booting of Armv8-R AArch32 based systems.

This patch serie with
https://patchwork.kernel.org/project/xen-devel/cover/20250316192445.2376484-1-luca.fancellu@arm.com/
will enable build on Xen on Armv8-R AArch32 for MPU.

Patches 1-4 can be applied independently.
Patch 5 depends on Luca's series.

Changes from :-

V1, v2 - Added "xen/arm32: mpu: Stubs to build MPU for arm32" to build Xen for
Armv8-R AArch32 on top of Luca's series.

Ayan Kumar Halder (4):
  xen/arm32: Move MM specific registers to enable_mmu
  xen/arm: Move some of the functions to common file
  xen/arm32: Create the same boot-time MPU regions as arm64
  xen/arm32: mpu: Stubs to build MPU for arm32

Michal Orzel (1):
  xen/arm32: Allow ARM_PA_BITS_40 only if !MPU

 xen/arch/arm/Kconfig                          |   4 +-
 xen/arch/arm/arm32/Makefile                   |   1 +
 xen/arch/arm/arm32/head.S                     |  14 --
 xen/arch/arm/arm32/mmu/head.S                 |  15 ++
 xen/arch/arm/arm32/mpu/Makefile               |   3 +
 xen/arch/arm/arm32/mpu/head.S                 |  52 +++++++
 xen/arch/arm/arm32/mpu/p2m.c                  |  18 +++
 xen/arch/arm/arm32/mpu/smpboot.c              |  23 +++
 xen/arch/arm/arm64/mpu/head.S                 | 132 +-----------------
 xen/arch/arm/include/asm/arm32/sysregs.h      |  11 ++
 xen/arch/arm/include/asm/arm64/sysregs.h      |  15 ++
 xen/arch/arm/include/asm/cpregs.h             |   4 +
 xen/arch/arm/include/asm/mm.h                 |   5 +
 xen/arch/arm/include/asm/mpu/cpregs.h         |  23 +++
 .../include/asm/mpu/prepare_xen_region.inc    | 128 +++++++++++++++++
 15 files changed, 305 insertions(+), 143 deletions(-)
 create mode 100644 xen/arch/arm/arm32/mpu/Makefile
 create mode 100644 xen/arch/arm/arm32/mpu/head.S
 create mode 100644 xen/arch/arm/arm32/mpu/p2m.c
 create mode 100644 xen/arch/arm/arm32/mpu/smpboot.c
 create mode 100644 xen/arch/arm/include/asm/mpu/cpregs.h
 create mode 100644 xen/arch/arm/include/asm/mpu/prepare_xen_region.inc

-- 
2.25.1


