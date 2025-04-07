Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C9FA7EB06
	for <lists+xen-devel@lfdr.de>; Mon,  7 Apr 2025 20:45:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.940880.1340497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1rSs-0001uV-9C; Mon, 07 Apr 2025 18:44:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 940880.1340497; Mon, 07 Apr 2025 18:44:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u1rSs-0001sB-6Y; Mon, 07 Apr 2025 18:44:58 +0000
Received: by outflank-mailman (input) for mailman id 940880;
 Mon, 07 Apr 2025 18:44:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xyMQ=WZ=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1u1rSp-0001s5-Te
 for xen-devel@lists.xenproject.org; Mon, 07 Apr 2025 18:44:55 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20614.outbound.protection.outlook.com
 [2a01:111:f403:2409::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 640a18f8-13e0-11f0-9ffb-bf95429c2676;
 Mon, 07 Apr 2025 20:44:53 +0200 (CEST)
Received: from BLAPR05CA0047.namprd05.prod.outlook.com (2603:10b6:208:335::28)
 by CH3PR12MB8308.namprd12.prod.outlook.com (2603:10b6:610:131::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.29; Mon, 7 Apr
 2025 18:44:47 +0000
Received: from BL6PEPF0001AB59.namprd02.prod.outlook.com
 (2603:10b6:208:335:cafe::6a) by BLAPR05CA0047.outlook.office365.com
 (2603:10b6:208:335::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8632.11 via Frontend Transport; Mon,
 7 Apr 2025 18:44:47 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0001AB59.mail.protection.outlook.com (10.167.241.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Mon, 7 Apr 2025 18:44:46 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 7 Apr
 2025 13:44:46 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Mon, 7 Apr 2025 13:44:45 -0500
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
X-Inumbo-ID: 640a18f8-13e0-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d6IBFSfv6v0mBbA5Sbf04YtbHd28hFElW6WjBujFukneRCzDrLQUjQp+DLScIs6wc4cCBOlmbT1Uz/JbzL7ryxBORUruEiocRt8C05DyFUYV6kusQgAubldYlyEGdlkWOjECZ8Wk3ZuOJIf+eTOwoch5MOMTiH16fSQ6dpGLvGH5HpK81U/cnI0l1ZyvWSMbX2XZlh7WRgkKazLwJNXTZYosmCArP5eDBQyjoYAZhamX4q3DDpx0D+o9+Nu+pwN72BPwnH9EbgdQYJbftOi0QNfI/is1bd6Kd4qHkACelxXS21B81hBjGIouEIY4hrP0OAk4Kt7RLYVVBxj5Neg/ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O/Iqka0dcv9RhvfMjDP4w03bYWU+ZYL+FD1BKc/UdKc=;
 b=u0PWqBoZ2EqGRq56BB49eXrOeyh5MnhpLp7AWTR2mWqGpjk40FlaTHTWwxHUpSxhCm7ChfMNgXCMY0eOCjsVbWP4Vkkh6DdQNBf/0tGQANa3NhibTVzDZjfH4twVo2OkTnhxf5yFOZix5w5vsyXj2dTlVDbcmnMFLnU5iB2i+nnPYSoesBOhOnBmFGZ9XS6INIZQOOza4Ru3VDG7UhtdbhEfncnlCo/g4thd+ais/32eKYYiHNPgfWHpl7gFenFcOqxcs4uLZbl+QKRB+kPUcFexQdSXCLOa2A0A3I73nrtU+nvDNTzQlcPz8xa4BAp5xqqR8PbWGF/cqhi7ClBtuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O/Iqka0dcv9RhvfMjDP4w03bYWU+ZYL+FD1BKc/UdKc=;
 b=gVRloLOYtEaSEKA/b1/AddoTFZ36mlGZcxqGJGqLfwO4TqJ4kcxCvVmAyDAXGsXQ1P01UtH/6qzOtsncvJyY2ls9wGSeqclyseluKXafXR3HVVx9tMEt4EDAEdGpu32bR4NmGnISZBXU49zztniCRuXLVayThYJRF+lH2tVRUIY=
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
Subject: [PATCH v5 0/3] Enable early bootup of Armv8-R AArch32 systems
Date: Mon, 7 Apr 2025 19:44:40 +0100
Message-ID: <20250407184443.1790995-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB59:EE_|CH3PR12MB8308:EE_
X-MS-Office365-Filtering-Correlation-Id: cfedbdc7-5628-4f2f-83d4-08dd76044535
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Zt+psF446hRrffNDsVveVkD768Hk45mBWaIWp12zA/ys0h/rp/Z5jbg6GiPM?=
 =?us-ascii?Q?JnD5FJHWC/yMgctoMIg6w0fj7ipI+1lUnM5g3Ydc8DMUOESrS41RLsRnOo+f?=
 =?us-ascii?Q?xFcETo3Jye0z6Bk3baYHv3gxQoxuBj31DSxrWzTC86flCj272gwzU/w/t3zT?=
 =?us-ascii?Q?/xIFQTNyZYbeWvIdymgZsQg3Mg6WzkQGmU6IFXW1URT7Z+uRvSIKKoNyIPnm?=
 =?us-ascii?Q?bmqRg2rwFQEr1qF2odeUgFmJks1vzGUh4eS6p9qqbQJUdf35cCV1MTObYyrT?=
 =?us-ascii?Q?U8PFj3NFa+s09yQ7Ye7SiqAVVmTm+g4zf50b4pWVP3k95CL6pB5TdDHKCvOI?=
 =?us-ascii?Q?UmhTLVsTaB3q8dTgN6jr64YJUatIeqk+Xv7mRe3Nbv+oowMQ9UjfbQPkPH98?=
 =?us-ascii?Q?il0soxZmK1/fMG3iBRmseLZRx5MlV10j0dW1vfQrogIGT4gmn6Xx4rU3XpVK?=
 =?us-ascii?Q?3L1mVKd9wKeGQumLWOUo36L1nWn3HWrmlTbl3C1z50n9xV+WT+FR8gyfsI1a?=
 =?us-ascii?Q?bZFCdG/U1t/CkDaqS7JuzssZeQTrzIDIJdAlSmn+T/iLsl4ASCSmyMkzs4IF?=
 =?us-ascii?Q?YP84yqS0qaZ0AIcKk29m8zyqyxNacrf8nZJHFi9Qyf3oqylJun+IfUQmFaPw?=
 =?us-ascii?Q?bSJH/JizgSR/tHsM3AHG6vpFz4E5OT5uG3T2KMNBq8LWQDCDmsN5iJlLzHfw?=
 =?us-ascii?Q?7jn1NKc8SoXbz3kDiZuO9RUPtvfdon+tjBuO4SIkDrseN5OBkuvDxTAt0zGQ?=
 =?us-ascii?Q?4/8tFQly4tMGQSPKO5Pxa/PcROLmeetL80qc2SKmblGm3zKHY5QrEqE0Xm0o?=
 =?us-ascii?Q?+wkA1oS2sNK1NrHr1HHbezFgFFgSkl2xaq13387Gpv1J25iYgOartuc2RYKd?=
 =?us-ascii?Q?bT3oZY63cM8PiPCvJP8jnBVUBgEx7OUnoqUSn/qI537lqYQCYGZG1s7zg5+p?=
 =?us-ascii?Q?sb7kI2IA5DR+De7Ep50Aj6lhZV+U9CmbxCy+9/HpkLKeEIrOHcu8/bNhzay3?=
 =?us-ascii?Q?+mJcLsZbjAa66sXiFacZgpefQCGdUuO9j3TAWI7MmxEZxN7t/RI8IolrkIyM?=
 =?us-ascii?Q?kwqMKvC4AieuAptzCSCAo2T95mhoFl/NmrRIKIsgakUeIxq2pz68kkg4S0yv?=
 =?us-ascii?Q?w8tXpFAmBXZBrHuQZbU1BJn9Uo5OTmhwrO+WEnf8U4BucAnkWdSjdJJA9mEk?=
 =?us-ascii?Q?QYQmIH62SUvvcpB7WR1AW3YHaCl4nU8luzcDbXylgxYZ1uFJPr0EJyZk/pSg?=
 =?us-ascii?Q?ADGOYEztFUWB4zL00L5xufZS0RzDQaUTCrLENqe/03OVCuO+dBpLwAno73D+?=
 =?us-ascii?Q?AyDJ0iwSt0hgcQi8VSz+rCaXVAxaIx0y1wnR6rG1SnJcTL5LOyvEHjusfIyF?=
 =?us-ascii?Q?0uvuenehqSyx1GgMg1aCA4OCMHt4hUeGkSRQBfhUGrdHgyxGBQCyqAEANUbR?=
 =?us-ascii?Q?a4aD05N9CLOHUYPrzcxqAExqlgi9AVzyJN1BBbjzpuJM60P1I2S21r+G/0tb?=
 =?us-ascii?Q?QrtcobHUKnDqhUCYO8MEIKHLD0Kc7GywFyFQ?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2025 18:44:46.9247
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cfedbdc7-5628-4f2f-83d4-08dd76044535
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB59.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8308

Enable early booting of Armv8-R AArch32 based systems.

Ayan Kumar Halder (3):
  xen/arm: Move some of the functions to common file
  xen/arm32: Create the same boot-time MPU regions as arm64
  xen/arm32: mpu: Stubs to build MPU for arm32

 xen/arch/arm/arm32/Makefile              |   1 +
 xen/arch/arm/arm32/mpu/Makefile          |   3 +
 xen/arch/arm/arm32/mpu/head.S            | 101 +++++++++++++++++++++++
 xen/arch/arm/arm32/mpu/p2m.c             |  18 ++++
 xen/arch/arm/arm32/mpu/smpboot.c         |  23 ++++++
 xen/arch/arm/arm64/mpu/head.S            |  78 +----------------
 xen/arch/arm/include/asm/arm32/sysregs.h |   7 ++
 xen/arch/arm/include/asm/arm64/sysregs.h |  11 +++
 xen/arch/arm/include/asm/cpregs.h        |   4 +
 xen/arch/arm/include/asm/mm.h            |   9 +-
 xen/arch/arm/include/asm/mmu/mm.h        |   9 ++
 xen/arch/arm/include/asm/mpu/common.inc  |  79 ++++++++++++++++++
 xen/arch/arm/include/asm/mpu/cpregs.h    |  24 ++++++
 xen/arch/arm/include/asm/mpu/mm.h        |   5 ++
 xen/arch/arm/mpu/Makefile                |   1 +
 xen/arch/arm/mpu/domain_page.c           |  41 +++++++++
 16 files changed, 329 insertions(+), 85 deletions(-)
 create mode 100644 xen/arch/arm/arm32/mpu/Makefile
 create mode 100644 xen/arch/arm/arm32/mpu/head.S
 create mode 100644 xen/arch/arm/arm32/mpu/p2m.c
 create mode 100644 xen/arch/arm/arm32/mpu/smpboot.c
 create mode 100644 xen/arch/arm/include/asm/mpu/common.inc
 create mode 100644 xen/arch/arm/include/asm/mpu/cpregs.h
 create mode 100644 xen/arch/arm/mpu/domain_page.c

-- 
2.25.1


