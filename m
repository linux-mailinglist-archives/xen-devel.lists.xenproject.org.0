Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA6FEAD58DF
	for <lists+xen-devel@lfdr.de>; Wed, 11 Jun 2025 16:36:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1011811.1390329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPMYX-0007LS-V9; Wed, 11 Jun 2025 14:35:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1011811.1390329; Wed, 11 Jun 2025 14:35:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uPMYX-0007IY-SP; Wed, 11 Jun 2025 14:35:57 +0000
Received: by outflank-mailman (input) for mailman id 1011811;
 Wed, 11 Jun 2025 14:35:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WBzX=Y2=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1uPMYW-0007IS-MC
 for xen-devel@lists.xenproject.org; Wed, 11 Jun 2025 14:35:56 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20605.outbound.protection.outlook.com
 [2a01:111:f403:2408::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 60cb9e4b-46d1-11f0-a307-13f23c93f187;
 Wed, 11 Jun 2025 16:35:54 +0200 (CEST)
Received: from MN2PR16CA0038.namprd16.prod.outlook.com (2603:10b6:208:234::7)
 by DS7PR12MB9043.namprd12.prod.outlook.com (2603:10b6:8:db::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8813.33; Wed, 11 Jun 2025 14:35:49 +0000
Received: from BL6PEPF0001AB74.namprd02.prod.outlook.com
 (2603:10b6:208:234:cafe::c3) by MN2PR16CA0038.outlook.office365.com
 (2603:10b6:208:234::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8769.18 via Frontend Transport; Wed,
 11 Jun 2025 14:35:49 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB74.mail.protection.outlook.com (10.167.242.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8835.15 via Frontend Transport; Wed, 11 Jun 2025 14:35:48 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Jun
 2025 09:35:48 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Jun
 2025 09:35:47 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Wed, 11 Jun 2025 09:35:47 -0500
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
X-Inumbo-ID: 60cb9e4b-46d1-11f0-a307-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kqBu1HLnp/S6vYQaPCoAsYETHDjlli3q+xGnypcPU6zq4NsZnwlGP9snpH//fsmPTd48Wikwhl4PLcYo8LVQ4Z7D+m5QReGdWYMq6WG8bMDa+NxVp7OL+IUD9U82JTh+///MUiRw2d4omd+NCPdWBzu5rmJ68So9a49Fky5DC8+gLTxEJUfVqmqHRmQQ1I2ppyh+8MUS51LuS8aS9EfC6iuFhr86gcAS1lH9LUW4LTt3K4xa8GE5U/06ZB5NYYxfaQaRTQ/y/xB2iAib4lcg5H2nb7dlD1v0rJkIW6x+/YNgHFpCD0UETgb+xQRsWjdmYP2WtZ9TooTXVSAdNVGFPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lZ53+t2/x3mii/RAnIdlbJCsZzMfjwSpIHYR7e9AEDw=;
 b=djGKdsi1SRD2opLjOUEnzymkmuvtIh2zEWM3Okokpl4Y0wcXIq4Ts6hTDftM5UL6jSv4tQ5pKyBuJ1q5WVJQvvdRDpEQkNY5MBozYBWviVSoEfpfa7paqFVKJSvTdw7c7JlnKRmK4sgLjzCPMAmJOV69TjPnH0ueBk3ujqmo5T/BEEEyowvkMSqiz8mdgDy15nc5r4/ffd/Sbhmku49Odd9HxryZah56WYDJhHEN+xOFK4RpR6uwuGs1POmfWRJXg/WJP9/DXbefXNMqbK6kbCajU0AuzFv/LWI/1WOvwFXSTj/wq2pri1KhGBCJ0y3h17sYuVCCTp7DRwjqIxt9kA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lZ53+t2/x3mii/RAnIdlbJCsZzMfjwSpIHYR7e9AEDw=;
 b=wXLCOIyEWctG/T4phNSi70/NUtI8OAVH2fBy9S6Xz8Y0r8rWn1/uZ66qeqX9s2yczXR5rLdkXSbyTrh1m+DEvbulbyE50Jh9m00PczmDHQ8z1KqcnP0mvVOyHXXKgMc9OrB/cjmX4OkK9vcRZzxVPbUMtXDrsU3Z57pSOM+2Euo=
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
Subject: [PATCH v3 0/6] Enable R52 support for the first chunk of MPU support
Date: Wed, 11 Jun 2025 15:35:38 +0100
Message-ID: <20250611143544.3453532-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB74:EE_|DS7PR12MB9043:EE_
X-MS-Office365-Filtering-Correlation-Id: b6ba3164-22d2-4294-eded-08dda8f54217
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lj60OroN+MaM0syxNBem06ddpkwaha06KPqFklv7x/pFJ5SL2e/41gInqD0R?=
 =?us-ascii?Q?i/fmBNalDjcqU204eU8UdoFQrqhXdvydtTO6e8Dn4UXPPCB9nbgyf0oWrFDc?=
 =?us-ascii?Q?8nXF9+L4h5wX3//u/l82Pghyc1xWG6dtJth6Pc7jK4BztmZNCqbt2HtYE3BY?=
 =?us-ascii?Q?IFRu3irMbeoF0NDSxmXJgYLEc+WSMHLgDl2Wv4GLpZ+kCMyMEUT8YNonHgqa?=
 =?us-ascii?Q?qwXyh3zRPPCaqTXbkN79ocZ7eHlXH6JSGPTiN83LCpj6bQ/JsPqNXiDip17J?=
 =?us-ascii?Q?kDgS2H6CEKMs83b8HIc2msv05oxvPQPVb/jyDPiVWFVUQNGPYAfEhVXjO6oh?=
 =?us-ascii?Q?bVzvNIF7DIm7pxKVciOrwA/yTj7JJYW5ZUTeQSKCpr5rpiJNPl3ZraWJ/qFg?=
 =?us-ascii?Q?UhzJXYakzck85Yw0Xy65LDRs8WG8hD393yvfsRm9Rgw5flGFadmbZvedzkfP?=
 =?us-ascii?Q?4PExawfgAKKCXFKVFKmnH+6vcIwvZopoYkzcPTJMFZ6K50wfWqPeTYQJ1Ub5?=
 =?us-ascii?Q?ht3x2bl3XfFM1oMy1zZBJl6RAwVfkNK44c0yfTVJMyB24G8cnnnNzCWIcSqr?=
 =?us-ascii?Q?32Cw+aGpGWGDeprIiJWDVIsg4oOTyoe2gjPPuMcsYrLluLcRwdAcgEYY++g5?=
 =?us-ascii?Q?CgYQFdCuxROUYb6hdmJ9UE+dBR0yxuR2e5yEgEwoaVeLlOj8sshsaUzV6K94?=
 =?us-ascii?Q?Hf6udTwi89NP6IPEchlOKdfQnGbpIS55hcqVDIrxIg+RuRw0jfpVVhSKrGOt?=
 =?us-ascii?Q?aoh+JiegwqScfEB656bGGSzO3hQ5X74dtrohnOddTf/vyA+LyNoCz+g0Z8eM?=
 =?us-ascii?Q?OHka0qdyEGUmxx/dUTwvTEp7DVOuWVQ2g54rdglRxlIfw1htXzM/HsnZmjXy?=
 =?us-ascii?Q?w4y3PpsbMuebAQGyQC3UEF3zTt+3+a/nFb5tsTTFX6KyOGooF7gLDGNdapPU?=
 =?us-ascii?Q?WVGDWb2x9pjgePjyRRQn5xvjVc/rJKxUA/pgbjlv+akZdZ0R26bJqyTdKMhM?=
 =?us-ascii?Q?Idf9BlQh0Tr9AeB0/3zguEBqOBjcMbRnDxAO0yaxz4bbWLIySfHa1Z15no6P?=
 =?us-ascii?Q?kCRv7pzHNNFYaC3Y71uaPA42IaqO4SVH2KkygvFEehpFAQu5drWAPrpdCxUT?=
 =?us-ascii?Q?EPdrID3dAsCsKtkteSOT+Ql/4GANzNBX/luI293V4MWS9Wa3KSMqAbO5E1i2?=
 =?us-ascii?Q?xd45u5SCQA58idAC7pC72fWuJ6/mI3SmzQ4vnIa5ekutddAEs6lqR+2PVoYg?=
 =?us-ascii?Q?B+A3+UEkO8pG+LvNSZUyFIm1t+9v5o5JSduDQLA071RKcUQjy5iPVKg5ipaI?=
 =?us-ascii?Q?Awybxrv1kLVfp+U5IvGVTbqBMZkC9AqOtOKdLMjVWDRdVonEU64NY5SxHJqE?=
 =?us-ascii?Q?ktZpRJJ5IaUF/XFl22rgEPp8ys/ulE2xcNKgub4fsZ/oulHaa3YgywlCYSva?=
 =?us-ascii?Q?Y6eGTnUGuborOeGrIse9cs6LRCKXWxTOKJVrckyXl5xz/s6yqorZ/NCt41yr?=
 =?us-ascii?Q?d/EczzR+yRbx7elLP8e7k1QFNiPJp1lhGkmj?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 14:35:48.5360
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6ba3164-22d2-4294-eded-08dda8f54217
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB74.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB9043

Hi all,

This patch serie enables R52 support based on Luca's series.
"[PATCH v6 0/6] First chunk for Arm R82 and MPU support".

Changes from :-

v1 .. v2 - Changes mentioned in individual patches

v3 - Split "arm/mpu: Provide access to the MPU region from the C code"
into 4 patches.

Ayan Kumar Halder (6):
  arm/mpu: Introduce MPU memory region map structure
  arm/mpu: Provide and populate MPU C data structures
  arm/mpu: Move domain-page.c to arm32 specific dir
  arm/mpu: Move the functions to arm64 specific files
  arm/mpu: Define arm32 system registers
  arm/mpu: Enable read/write to protection regions for arm32

 xen/arch/arm/arm32/Makefile                |   1 +
 xen/arch/arm/arm32/asm-offsets.c           |   6 +
 xen/arch/arm/arm32/cache.S                 |  43 ++++++
 xen/arch/arm/arm32/mpu/head.S              |  41 ++++-
 xen/arch/arm/include/asm/arm32/mpu.h       |  34 ++++-
 xen/arch/arm/include/asm/mpu.h             |   2 -
 xen/arch/arm/include/asm/mpu/cpregs.h      |  68 ++++++++-
 xen/arch/arm/include/asm/mpu/regions.inc   |   2 +-
 xen/arch/arm/mpu/Makefile                  |   3 +-
 xen/arch/arm/mpu/arm32/Makefile            |   2 +
 xen/arch/arm/mpu/{ => arm32}/domain-page.c |   0
 xen/arch/arm/mpu/arm32/mm.c                | 165 +++++++++++++++++++++
 xen/arch/arm/mpu/arm64/Makefile            |   1 +
 xen/arch/arm/mpu/arm64/mm.c                | 130 ++++++++++++++++
 xen/arch/arm/mpu/mm.c                      | 123 +--------------
 15 files changed, 487 insertions(+), 134 deletions(-)
 create mode 100644 xen/arch/arm/arm32/cache.S
 create mode 100644 xen/arch/arm/mpu/arm32/Makefile
 rename xen/arch/arm/mpu/{ => arm32}/domain-page.c (100%)
 create mode 100644 xen/arch/arm/mpu/arm32/mm.c
 create mode 100644 xen/arch/arm/mpu/arm64/Makefile
 create mode 100644 xen/arch/arm/mpu/arm64/mm.c

-- 
2.25.1


