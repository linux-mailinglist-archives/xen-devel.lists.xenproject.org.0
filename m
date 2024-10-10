Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B20E49988BB
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2024 16:05:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.816160.1230347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sytlw-0005dJ-1S; Thu, 10 Oct 2024 14:04:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 816160.1230347; Thu, 10 Oct 2024 14:04:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sytlv-0005bB-UE; Thu, 10 Oct 2024 14:04:07 +0000
Received: by outflank-mailman (input) for mailman id 816160;
 Thu, 10 Oct 2024 14:04:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rwpE=RG=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1sytlu-0005b5-MH
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2024 14:04:06 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20614.outbound.protection.outlook.com
 [2a01:111:f403:2418::614])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8152c895-8710-11ef-99a2-01e77a169b0f;
 Thu, 10 Oct 2024 16:04:04 +0200 (CEST)
Received: from BL1PR13CA0266.namprd13.prod.outlook.com (2603:10b6:208:2ba::31)
 by CYYPR12MB8870.namprd12.prod.outlook.com (2603:10b6:930:bb::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Thu, 10 Oct
 2024 14:04:00 +0000
Received: from BN1PEPF00006000.namprd05.prod.outlook.com
 (2603:10b6:208:2ba:cafe::85) by BL1PR13CA0266.outlook.office365.com
 (2603:10b6:208:2ba::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.7 via Frontend
 Transport; Thu, 10 Oct 2024 14:04:00 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN1PEPF00006000.mail.protection.outlook.com (10.167.243.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Thu, 10 Oct 2024 14:03:59 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 10 Oct
 2024 09:03:57 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 10 Oct
 2024 09:03:57 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Thu, 10 Oct 2024 09:03:56 -0500
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
X-Inumbo-ID: 8152c895-8710-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V3uhzs7T8sYRxj99HDwuO9cnz9R0jDvHwqXnkGkXLxsNhTK3cd5h+ZgDw8L27X7FZlVCS39jLDOjsjnbMjdvEVmGQP1h8hT6oTAa3FVnJl9jqkU5u1NYaak9HQLGQSLuqAS6dtwL2MXgJJEjxUFVexxzhZ6M5dVM7VFOD+1Uciq3JPTvCmOZzq/Ciec0tdeDwPxezeFLKXlWFsFvO7ZQ2UtJbyLGG75rXs5Y4OsP7p/TxxWPV08HB7WmdDf9njfuLxbS+oM6BI2Fuunb/HF+1yP1fLdz+UB7hZBAEvBlD1VH8W9/YMyoJJho+L9Ngx+CmuSRf+mAR3f0du3ymmhlbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VCvFWrFfzVYxS4zF7rcBjY1zan7BZ6VEWYnFIlCknl8=;
 b=SL996NMuR8a6z3DhcAnA42i5SHpx6sftyx6I0+m2U3Tidob63dQ3/aPbYMcQeISRCChVSeBPrzKPrnbGP8PLc3YjfbVS7ytMTgWpvxhQ2Gm3OsSFJ7BL7pug0xkg/ZMjAe6vPwDAnpZJ5wfOSi9OeMX/O7XjpPijSOg9y98lFe5lJkeC4aEK6WJSiO4dq5DSCpgZ1fpEb4j+HokK4RKR92+sBQvj7S3hQ2nI0fEojrAPY5kydvEzymDBFYIftiPLxOf0/oLlGGhA4MgYsCd5MYWJbCK30U2AyLy3cFYLeLDPPYUOvN8M8YTrBKWCYTYA7y9VBWySn+ScZpJlmDcYKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VCvFWrFfzVYxS4zF7rcBjY1zan7BZ6VEWYnFIlCknl8=;
 b=qSj1oKxuinlNDnGPgkMauFswlzq8sQC62SugbH1teYYWPBMjpPMYiCM0J0XcZFxBCstwmTrnR2KcfGhgHQSok+ZEbMbmSzIIFJDTso9yp2mz3gwqyQbHdEqET51OrxRdYKyTkcJNqLFrdp7WV6EdYQn9lZtcOqIW2CthiRRrlXk=
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
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>
Subject: [PATCH v3 0/6] Enable early bootup of AArch64 MPU systems
Date: Thu, 10 Oct 2024 15:03:45 +0100
Message-ID: <20241010140351.309922-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00006000:EE_|CYYPR12MB8870:EE_
X-MS-Office365-Filtering-Correlation-Id: 90393c44-21e0-4cdf-9378-08dce9346372
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?X9ifsgiR249ea92rfQ3F+omtzMLCIa9YccmjbUmnd84vKgKfeG5naFw8Krly?=
 =?us-ascii?Q?dFGZ1ZpN0BFY5Hohz0z2Y8TyU8+7ZBwZ5NFIX0G0z5tPDR2k9WNn8yMk4N+I?=
 =?us-ascii?Q?+1NdxmUfj30g/U+BZ8Qoe9WOs+rtKSHC7yJlnok7EMyWuT0Zx/H77lTjNNZ7?=
 =?us-ascii?Q?+bHPvD9ycRUwErdNdX73juAoqnvoCGqKc2Emf57E5gGy4HpMg0HTzwCuFiZP?=
 =?us-ascii?Q?2LJNexCCGEGdM96SLY7lUaC9TwwAUABm5roRglctJ+p0nQRVsSG/P3XQR+Bl?=
 =?us-ascii?Q?YepoLVb7frKPjzuMi3Kf8E+c3gaY278SqaLtDjgoEgWTSpiQXXS0It/kAJv5?=
 =?us-ascii?Q?dKAgU2xj/Qn462uPSt8usSX/PFoU5PX4uFYw7VkXpsckGt8vNke/H1a+hAHS?=
 =?us-ascii?Q?0RgJl4dZSgNHEjet2qgZrz3Z4xIFCvC9cAAOPY4DYB+wdtbFL7g3ZuVBVjEo?=
 =?us-ascii?Q?tG6zd6HTqdAKUvbmRdwBXXCKiyytBSTp2VO4NEVhcOwygewKyb3aByacss5X?=
 =?us-ascii?Q?Aoz8ZCKHPpUlTIzthb93h95qo3xF+a5rJ8yruyS6HMnorR6FLz+J0oTvWxvt?=
 =?us-ascii?Q?8dvzmn9kRQz0CBCziAk1dBB0fRPf/S+7LB2/4QEENH4QDXSIzqEQ7TuFrtl/?=
 =?us-ascii?Q?gKGsT8jgr9vgMrWxIjd6DSQH82N4+A04tnEcFmZir2o7f1rB5ppCrGbf2zhY?=
 =?us-ascii?Q?uD2j7fOrx11GLZg8ivSjKD+tzLbpVpczwD3E2vYhkulpk04R/T/BcxFIa9xm?=
 =?us-ascii?Q?OVRxZFPPkN0/U2LZyDuNsLc1NMo6j05s3Da86ujW2XQw4f/m/kCrqOatEc8L?=
 =?us-ascii?Q?ABR+kEoN77c1FLjv4VLDN3ky9ABsAttac2guhReUkXxVN34yBMz7c/J05edl?=
 =?us-ascii?Q?qXC7eIoqTE3pQe82DetyG4t1aehptZ/PBs9Ats7TXB765J7Q+fHCsj1ahtcM?=
 =?us-ascii?Q?1mskWeVqMNrTHFraTXAKNPT61DMszlqXxeRnAi3EbvgZJko5baeqkLlUFuDQ?=
 =?us-ascii?Q?XGneuH/dZiO14lVWUQuga3WVXpJYlMiOH+9HtIB5AcfdrWvJsp2Vo65BQnjL?=
 =?us-ascii?Q?PVD65THzj3PzFBptqV1Mkx/b4EdblxpOFMOUFtiADxo1/j3a0BxQW/h3SwI4?=
 =?us-ascii?Q?X5/brQUGpitm6DQFmEJnkvCS3UaM68f7sNA2lIYmSYqILrxnAn/+pKo49+tg?=
 =?us-ascii?Q?oDPsfoNgZmOGZdhG4Gep32Tq2jN2bGMgv/apEITgPrx4cRGAwCz5Q+k/0TWO?=
 =?us-ascii?Q?y1CxBVJfndlAlZ+5kEdQ8MPZ9FjyLhFsHaIDsTb5NvzKsg9nJeFSWASwM8fT?=
 =?us-ascii?Q?Hxrm1yzQUXjMeo/Bd1l4ePy1fVgbQsfgqUI9sWz91G/L79X8egk+WzZiZ+Nx?=
 =?us-ascii?Q?87+AT1hUHhB/fSRMbUzo/yLc8ju+?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 14:03:59.4542
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 90393c44-21e0-4cdf-9378-08dce9346372
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00006000.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8870

We have enabled early booting of R82.

Changes from v2 :-
1. Added a new patch "xen/arm: Skip initializing the BSS section when it is empty".
2. Split "xen/arm: mpu: Create boot-time MPU protection regions" into 2 patches.

Ayan Kumar Halder (6):
  xen/arm: Skip initializing the BSS section when it is empty
  xen/arm: mpu: Introduce choice between MMU and MPU
  xen/arm: mpu: Define Xen start address for MPU systems
  xen/arm: mpu: Create boot-time MPU protection regions
  xen/arm: mpu: Enable MPU
  xen/arm: mpu: Implement a dummy enable_secondary_cpu_mm

 SUPPORT.md                                   |   1 +
 xen/arch/Kconfig                             |   2 +
 xen/arch/arm/Kconfig                         |  27 ++-
 xen/arch/arm/Makefile                        |   1 +
 xen/arch/arm/arm64/head.S                    |   2 +
 xen/arch/arm/arm64/mpu/Makefile              |   1 +
 xen/arch/arm/arm64/mpu/head.S                | 165 +++++++++++++++++++
 xen/arch/arm/include/asm/arm64/mpu/sysregs.h |  30 ++++
 xen/arch/arm/include/asm/config.h            |   4 +-
 xen/arch/arm/include/asm/mm.h                |   2 +
 xen/arch/arm/include/asm/mpu/arm64/mm.h      |  22 +++
 xen/arch/arm/include/asm/mpu/layout.h        |  33 ++++
 xen/arch/arm/include/asm/mpu/mm.h            |  20 +++
 xen/arch/arm/platforms/Kconfig               |   2 +-
 xen/arch/arm/setup.c                         |  13 ++
 xen/arch/arm/xen.lds.S                       |   7 +
 16 files changed, 329 insertions(+), 3 deletions(-)
 create mode 100644 xen/arch/arm/arm64/mpu/Makefile
 create mode 100644 xen/arch/arm/arm64/mpu/head.S
 create mode 100644 xen/arch/arm/include/asm/arm64/mpu/sysregs.h
 create mode 100644 xen/arch/arm/include/asm/mpu/arm64/mm.h
 create mode 100644 xen/arch/arm/include/asm/mpu/layout.h
 create mode 100644 xen/arch/arm/include/asm/mpu/mm.h

-- 
2.25.1


