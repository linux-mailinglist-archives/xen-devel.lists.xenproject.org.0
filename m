Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6221AA888E0
	for <lists+xen-devel@lfdr.de>; Mon, 14 Apr 2025 18:46:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.950876.1347060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4MwD-0003o8-M7; Mon, 14 Apr 2025 16:45:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 950876.1347060; Mon, 14 Apr 2025 16:45:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u4MwD-0003lz-If; Mon, 14 Apr 2025 16:45:37 +0000
Received: by outflank-mailman (input) for mailman id 950876;
 Mon, 14 Apr 2025 16:45:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GQ8q=XA=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1u4MwB-0003ls-Vv
 for xen-devel@lists.xenproject.org; Mon, 14 Apr 2025 16:45:36 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20617.outbound.protection.outlook.com
 [2a01:111:f403:2413::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e15633f7-194f-11f0-9ffb-bf95429c2676;
 Mon, 14 Apr 2025 18:45:33 +0200 (CEST)
Received: from DS0PR17CA0006.namprd17.prod.outlook.com (2603:10b6:8:191::22)
 by DM4PR12MB5721.namprd12.prod.outlook.com (2603:10b6:8:5c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.33; Mon, 14 Apr
 2025 16:45:29 +0000
Received: from DS1PEPF00017092.namprd03.prod.outlook.com
 (2603:10b6:8:191:cafe::31) by DS0PR17CA0006.outlook.office365.com
 (2603:10b6:8:191::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.35 via Frontend Transport; Mon,
 14 Apr 2025 16:45:29 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017092.mail.protection.outlook.com (10.167.17.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Mon, 14 Apr 2025 16:45:28 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 14 Apr
 2025 11:45:28 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 14 Apr
 2025 11:45:27 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Mon, 14 Apr 2025 11:45:27 -0500
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
X-Inumbo-ID: e15633f7-194f-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xhlOTckHh2r13EZyMvmcQqUdpk6zf+aMLBot3cLV8vke22B1ZQrbkN0ISVEgC6PCEixyJ1S7AyBWZe2Zw8ehEblHzpFzmPjBfpnxZq7+/3dqMjXgAPPsHF/UJfpPE0rXl0QN3oUctRYzKho6XA4uUDDI43tz5z5blPVwzgJr9Z12v4iwPjKrWpRXNp1pqYnrhHdW10Lyut4BNuLHlEuYEdS/eQ6kBIwybzyn6d/tLa/6tFqXDvfV0S+NOs03OPuCblxyu+sVnXirKJfpwaXOCD9o5WfiH3eHtcG61iKEKcdzD/ma4r220Wxp4O8jV3cwNieT9Z6p8CqL4gl2elbwHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u9unBZdwjbbEUf+nFJKh5FsGSQRLBVuXBLaW4BB2FZk=;
 b=zWfOzRGIQMpRB992vO4pQ/yak/vw0zzDcM55h0NbUYsAIZ/k3Hu7lFvz7sPJdyhQpjiXD3HMwnqFKlhjOIMtJz7lnsTFQ2kEmS5AFScpzCogbdm7zOiNl46pz/4k8mvUqjYcTPDoOlDVRaNm8c+VXZik8H4D2niA+6qiU+EIf/mPEqhM1j8LF3gp+df4/w+bWutJ7rK4a/utwT6UcaTCD/gujGF632ZK7fS6zDqX09YCE/W0fNWKf1e7tv3s31C8ZLRxWDS5/vBuCK4+bP/JEfXddOmTAzicD4wQvhxfeCmmU54WDWlU8Qx3l/5Lq77Xe3HwliNnPKZRshxRAc6IWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u9unBZdwjbbEUf+nFJKh5FsGSQRLBVuXBLaW4BB2FZk=;
 b=foXRQBlZ6074ingXzseZb7qwByUEphET58b4NvZmRW+VK+AJlGkZ9W+zKZ1GenVqqvHmPVvmFEqowHUjmBMx+aoBXVAimunhu0YumJpditdKpTs5YZnKt90H1a8Yah9tLyzcCH8FUt2s44q021PKTbfKFBtf2261qD8vTV79fUg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Ayan Kumar Halder <ayan.kumar.halder@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v7 0/3] Enable early bootup of Armv8-R AArch32 systems
Date: Mon, 14 Apr 2025 17:45:11 +0100
Message-ID: <20250414164514.588373-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017092:EE_|DM4PR12MB5721:EE_
X-MS-Office365-Filtering-Correlation-Id: dd469ed1-0da0-496e-b1d7-08dd7b73c379
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RXTrHXHCgRLh7FZOSGxPmFXRl6AsGqMi/cuxrUNMoHF4zE+Ufv4V1088RrYD?=
 =?us-ascii?Q?xVs7Enwbr6I7CFd8/KzXKsUjK5hQe244mz6BAIzPijgEjI6CjPQmDkX1Zv8O?=
 =?us-ascii?Q?I2D1XKUGBzG+t03wFTOzqSR9mLD0l0OeWWvRtqTfpESsG0k0TzapDdFaZp6E?=
 =?us-ascii?Q?6uF+V+337eznX1NHI2N83JhroGKH6P1gG1/leDca67xKJGmQYv7t3C0N/h/a?=
 =?us-ascii?Q?zVtU6G6z37vGKsvDvq4IpanmF3iJtZ1au37mwXWpPYmYW+0g2C/qRQHCS8CX?=
 =?us-ascii?Q?9QEKVE+fkB7MsNKF26Vc/ui1PeCHRV86v5X0DEZka6qe4UwenS1gJyC25yXv?=
 =?us-ascii?Q?a+Jir/NT5UeyHr26j506ySR8qpYZNCWj7iYnAaTeGgTV+yWmkZfTY6h3QBB1?=
 =?us-ascii?Q?DCTf7+/lL0Jl+9m0ANZv6e8ZlPpABHQeVUYTy/LICdkRy8wsOV6gqF1yMwID?=
 =?us-ascii?Q?mpFyVY07VgLHPBeSgnBT1F87Oow+eoPJh0S7QSoP+jElzwDVfcz0FoW7ztYd?=
 =?us-ascii?Q?LWhpYpUhDRvCq2Tu+oR60V9aBvZvRTH/pq86BVenZ4/bk9kZBv6rn6qU8b1X?=
 =?us-ascii?Q?xQfzadqh7fg4Z9g0xAcdRrIu2cnExrO710HjGwag48eC+vrXN0b92WXwrZpZ?=
 =?us-ascii?Q?Y11qBtIKyrWoNTv3/fzYg1EcQ+fhbHWntcYF+AnuUXek8zCzu3tRQ7VIzfU5?=
 =?us-ascii?Q?IJZP45RZHEGC6Mq4KQCguruwb3bv8JP/gdyVwQQMwoPCsT/LnUpZP3KHP5XP?=
 =?us-ascii?Q?soLLKQ2bNKudW2LGJoQpPB3GwaNEqQyLcpYcxbWnEK1zzrURoqH6OrBQfiub?=
 =?us-ascii?Q?vQ/LcKVXJohDIZwuwxjVqy99jnBJ4YAoxdJdVTmk3WBr6slJsQMH186obcMe?=
 =?us-ascii?Q?8TNDQU34fQ41c+6fqM6Fr0uqMtvx7m0+WrvmhCfh7uD5dtOplBRf4ZYryQB8?=
 =?us-ascii?Q?oafiFYjSB7y8+RKFOdyLXxuVXxVQryPvxtvppyaIB4tzdpWVbHS26ScaSTTm?=
 =?us-ascii?Q?BgVCLT99VJVuPSCtElU6p6Axg3wVhSFXhoYEQSWuvIGOldLrH/Nwdk3ueqag?=
 =?us-ascii?Q?T6Va0GqtEyhB2dsGudPtOPF44OqqIa7Rp/FcrjZrLaSMTJ7bSCWp+WPQtCBZ?=
 =?us-ascii?Q?KUgkb1fBJFs8kQFlKkdxexknz0v0zUDgxHXcUX1lVlGbJ/Ib1MjZPxssNK7v?=
 =?us-ascii?Q?Pwv4jXBjzKuq9V2WmIuYs/oVcoBfNachhPsluyF4revKSVnqgbFkbAeJ/pG4?=
 =?us-ascii?Q?zK7fhWAouBnHkVUFu77b+kPSeAowjL2WQAa5ua+otI3MHxXFe7ZVCb6IIW7u?=
 =?us-ascii?Q?KDuX+cMJ7/NeYEbY6ImUloTkjRFe11nmKju/+NkEXa9jZQu+NRAPKNWMjdo5?=
 =?us-ascii?Q?XNODAHbYUmV4XHZS/b4esgE3k3styM3i9+AfE4KL0a4eRlHUwGF+E6dJ2MTE?=
 =?us-ascii?Q?DcT+/uXI4fIMCsuYbf7i2AyAE1Ob8kOKAJxNkMQwMNnV2cbLOhd3nmgPqyfk?=
 =?us-ascii?Q?HW2qSYPZcwAhpQplLa/+I+1safZQHM0eQxP7?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2025 16:45:28.6528
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dd469ed1-0da0-496e-b1d7-08dd7b73c379
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017092.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5721

Enable early booting of Armv8-R AArch32 based systems.

Added Luca's R-b in all the patches.
Added Michal's R-b in patch 1 and 3.

Ayan Kumar Halder (3):
  xen/arm: Move some of the functions to common file
  xen/arm32: Create the same boot-time MPU regions as arm64
  xen/arm32: mpu: Stubs to build MPU for arm32

 xen/arch/arm/arm32/Makefile              |   1 +
 xen/arch/arm/arm32/mpu/Makefile          |   3 +
 xen/arch/arm/arm32/mpu/head.S            | 104 +++++++++++++++++++++++
 xen/arch/arm/arm32/mpu/p2m.c             |  19 +++++
 xen/arch/arm/arm32/mpu/smpboot.c         |  26 ++++++
 xen/arch/arm/arm64/mpu/head.S            |  78 +----------------
 xen/arch/arm/include/asm/arm32/sysregs.h |  13 ++-
 xen/arch/arm/include/asm/arm64/sysregs.h |  13 +++
 xen/arch/arm/include/asm/cpregs.h        |   2 +
 xen/arch/arm/include/asm/mm.h            |   9 +-
 xen/arch/arm/include/asm/mmu/mm.h        |   7 ++
 xen/arch/arm/include/asm/mpu/cpregs.h    |  32 +++++++
 xen/arch/arm/include/asm/mpu/mm.h        |   5 ++
 xen/arch/arm/include/asm/mpu/regions.inc |  79 +++++++++++++++++
 xen/arch/arm/mpu/Makefile                |   1 +
 xen/arch/arm/mpu/domain_page.c           |  45 ++++++++++
 16 files changed, 350 insertions(+), 87 deletions(-)
 create mode 100644 xen/arch/arm/arm32/mpu/Makefile
 create mode 100644 xen/arch/arm/arm32/mpu/head.S
 create mode 100644 xen/arch/arm/arm32/mpu/p2m.c
 create mode 100644 xen/arch/arm/arm32/mpu/smpboot.c
 create mode 100644 xen/arch/arm/include/asm/mpu/cpregs.h
 create mode 100644 xen/arch/arm/include/asm/mpu/regions.inc
 create mode 100644 xen/arch/arm/mpu/domain_page.c

-- 
2.25.1


