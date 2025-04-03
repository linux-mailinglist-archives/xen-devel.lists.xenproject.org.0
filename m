Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75ED4A7A870
	for <lists+xen-devel@lfdr.de>; Thu,  3 Apr 2025 19:13:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.936974.1338069 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0O7h-0005vV-JY; Thu, 03 Apr 2025 17:13:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 936974.1338069; Thu, 03 Apr 2025 17:13:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u0O7h-0005tf-GY; Thu, 03 Apr 2025 17:13:01 +0000
Received: by outflank-mailman (input) for mailman id 936974;
 Thu, 03 Apr 2025 17:12:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+EW4=WV=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1u0O7f-0005tR-QJ
 for xen-devel@lists.xenproject.org; Thu, 03 Apr 2025 17:12:59 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20628.outbound.protection.outlook.com
 [2a01:111:f403:2415::628])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e2fcd542-10ae-11f0-9eaa-5ba50f476ded;
 Thu, 03 Apr 2025 19:12:58 +0200 (CEST)
Received: from MW4PR03CA0221.namprd03.prod.outlook.com (2603:10b6:303:b9::16)
 by MW4PR12MB6999.namprd12.prod.outlook.com (2603:10b6:303:20a::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.42; Thu, 3 Apr
 2025 17:12:53 +0000
Received: from CO1PEPF000044EF.namprd05.prod.outlook.com
 (2603:10b6:303:b9:cafe::88) by MW4PR03CA0221.outlook.office365.com
 (2603:10b6:303:b9::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.54 via Frontend Transport; Thu,
 3 Apr 2025 17:12:53 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CO1PEPF000044EF.mail.protection.outlook.com (10.167.241.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Thu, 3 Apr 2025 17:12:52 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 3 Apr
 2025 12:12:51 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Thu, 3 Apr 2025 12:12:50 -0500
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
X-Inumbo-ID: e2fcd542-10ae-11f0-9eaa-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p5A5H67bz/Hqnvo8rNUHfGXAuQP7jYYBsuL4hDWV9YzoGxbX8mtx2i8hn0hO0f90DJeF1JduLPk+1gdT1BplqhWfgRWPWrCtnY/yjknWVNV59cP8IKVbPye1gJLSp0mLR26CVgV7F2RDVhQ1jE+qcVBmfW/RV4GwwXf/G2CFFT6vPbQu4vaYaht5bXFNMJY1F9QVWEFL2GsTSKrCfeVZDbjbYmjmmVS50MC/OxUXcfzvwalACDDdV4qfQrKylejyCCBEn0Po3Xiz0FL2OSgkwRtQgH2TkSw+Lbxi+1YeURdGYNM9VLv6JV6oS9QoreFmB/enJ/u3qkIzd/WFwUJUpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QPaVRhWJsDHWA1QUu0+5fTyeqQZX7UO2SCPi94wxtzQ=;
 b=fS9OE9fgbxtZ+nrb2UF+ZGLuEX6drnLVCTUih+gzNcLYps3aUUslKulMv5tx+b+1NA1V2mddHEmBzGQyL8M3gLK+IDb1/BNMHB9bH6w6NA1FLDx0BbMiFG4XsSoaC7Cu5FnBfuoHV813h5jDa5G/7LQoB/RxFXGVTbx0hfGUpNYEgFeywr5f+7Kaqz6ifUSnsOJO62z+zSt63mxMv81escD8UgqF2qiX6/ew2UIyUkEl10W64Gvrt9XutDU28MrSAq6KoMGgrVze3eihsVKF4HX5KxgdNh93tranwwA6U0xiNx+x3RhXW54EJGMlGfUs7hotzgc66uESBJn1f0FSVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QPaVRhWJsDHWA1QUu0+5fTyeqQZX7UO2SCPi94wxtzQ=;
 b=WScnSvuXPhK2lD3w4Gt17BphPUx6U6eOplXBGLJ1nkGNwcGTIrDvVCNuzb7ksDkbedRUPEMrEMHdH2nz4Mvp+AJBKWbN/Bh+9IQt0BJvjh2B+CRSfDVPOs+N62jKCkBlRtTiW6nDkD7OEu3KRMvDw10J/3CfbbipqSgbiwXB+Ks=
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
Subject: [PATCH v4 0/3] Enable early bootup of Armv8-R AArch32 systems
Date: Thu, 3 Apr 2025 18:12:38 +0100
Message-ID: <20250403171241.975377-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000044EF:EE_|MW4PR12MB6999:EE_
X-MS-Office365-Filtering-Correlation-Id: 7920e019-4a58-49e3-1d6b-08dd72d2c4d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SAHv5uQ363TBXgigGEjCKqvfU8N70sGEpssv/9IvAZUFs10m4Yefw/3rJh59?=
 =?us-ascii?Q?pLHq+fng+T23CkLqJLAkNax0Zsk3IDhUJqgt3gRAqgyWnT5gg1okFMMc4a4w?=
 =?us-ascii?Q?wmm/Ku78thBxYsPzKZuGVKnTlL/X+FrCL04EuddHW4iD0OZ+lrnFn4aqRCnv?=
 =?us-ascii?Q?YiXxkL+/GU4QEeJE/VDydE5ckexyK66m78XQOTaFnqN4HMvJDYCkekzqcJFh?=
 =?us-ascii?Q?Me+gK/c2sErKU/UWjpMp107G79wvuva2mJrA5qdKBuGy+NdLC3AJ5AIFQOWO?=
 =?us-ascii?Q?6+fkwIEPpia+7mPIZlel8OW/SeIpctAXL8ft3/6frLp5Wi/rqjZDkGKHWiVx?=
 =?us-ascii?Q?XfJXfITkI12mfqF9/wjVreU0ArucIXgCMWc7KxGleAfci7pRHZYVwOZuq9+X?=
 =?us-ascii?Q?hQ6+emanSooj/M/alAb18xrbbfcKCsb5CuTpNzWQl7QMQuUoHasUPQ7uPpGC?=
 =?us-ascii?Q?iy7byNDwxk/FSlbUKMENZubTTn9csCyvv0JW5YOo9NHjFxL2aQH94IoaGx1y?=
 =?us-ascii?Q?8CPJOiIjHw5xycF79EnDIc2m1FTZ+GmJR3xhS1SlzwqCnh/KcEnvSATmleae?=
 =?us-ascii?Q?e6FluR5RLdkDtsBETrJbRwlPruV8T7saHGRr1IxdL/wQkxq9E42YVxRJiWDc?=
 =?us-ascii?Q?TnrTq1xZ11YhunXGvtoQBMGxuIM7skoWfRVThoPq9OxpuHnY9ASgZRD+wfeN?=
 =?us-ascii?Q?YVvOR2tID7ltHwEE3axTmDt5fpu+yvCW9gyjwKsNy4WLv2q7i0R+W7rlHt7V?=
 =?us-ascii?Q?vvgpi4cZol4fSgiI4yMWa06Lw+UhqUXDwiMOmAC2aarR3iduTvFLkenkloD+?=
 =?us-ascii?Q?VNTgj9mlvNI55eF3un4BzNaPiJvOfj24Vn35yMaPGCZdcIisPn5Vg6D7fKZ8?=
 =?us-ascii?Q?mtHg4ccy7IzcVqrJE3Kyfxb+/BqAs7szKJZQZFe9R7aLlWLkzf3yCG+0DdNA?=
 =?us-ascii?Q?FdCZaFKZw3I9dTL8wTNdcHjEjXUgrG4vO1VzVUh4004nviS+YJ7kYZeTJ28j?=
 =?us-ascii?Q?1EIfWhZ2nFNPo0wLZUzgkxHPR2s14tcVz7N2MvXajqP0Paiu+Sj8Mbf6D9lu?=
 =?us-ascii?Q?AmrBQM9nU9jbdFoSqajjEKuwi6fFimKzNDF71P4mBTVmAomXbF0wPjCpqK/I?=
 =?us-ascii?Q?kZhe+d8QOaZ2fRMnw3wkwLQMJCxujWOCBDLVDGXAPfldQy2b6R0m+WUue62I?=
 =?us-ascii?Q?tidSQ3w2GFmGDF6zhBpnY7xh01wIyRK0vU8jqlYoOGFckktrCAftrer2k5RP?=
 =?us-ascii?Q?19OK//cjZAx1vKOI/5asW50MfOENkGmsAGlhoZG7lP8IRpaLy0pt0yrIRthZ?=
 =?us-ascii?Q?y9bRozGf07Kw/dYloWA+tw/XIMVwN53PxlGSei/rdlN/vTIVNKimGk4HbrGz?=
 =?us-ascii?Q?B1FB8ijsQ82X/q4xr/nv2OqtczS+MyrCM6At7lXj6ynT1S5i8SO6kfHlbjAt?=
 =?us-ascii?Q?VodwlMI37chQkb8+5zm5AOfKeRIxQXglicArXWZVCvvnR33Rbq9x+g9/gLfY?=
 =?us-ascii?Q?5Xv6XNDzah/Zerg=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 17:12:52.5981
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7920e019-4a58-49e3-1d6b-08dd72d2c4d6
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF000044EF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6999

Enable early booting of Armv8-R AArch32 based systems.

Ayan Kumar Halder (3):
  xen/arm: Move some of the functions to common file
  xen/arm32: Create the same boot-time MPU regions as arm64
  xen/arm32: mpu: Stubs to build MPU for arm32

 xen/arch/arm/arm32/Makefile                   |  1 +
 xen/arch/arm/arm32/mpu/Makefile               |  3 +
 xen/arch/arm/arm32/mpu/head.S                 | 91 +++++++++++++++++++
 xen/arch/arm/arm32/mpu/p2m.c                  | 18 ++++
 xen/arch/arm/arm32/mpu/smpboot.c              | 23 +++++
 xen/arch/arm/arm64/mpu/head.S                 | 88 +-----------------
 xen/arch/arm/include/asm/arm64/sysregs.h      | 11 +++
 xen/arch/arm/include/asm/cpregs.h             |  4 +
 xen/arch/arm/include/asm/mm.h                 |  5 +
 xen/arch/arm/include/asm/mpu/cpregs.h         | 30 ++++++
 .../include/asm/mpu/prepare_xen_region.inc    | 89 ++++++++++++++++++
 xen/arch/arm/mpu/Makefile                     |  1 +
 xen/arch/arm/mpu/domain_page.c                | 40 ++++++++
 13 files changed, 317 insertions(+), 87 deletions(-)
 create mode 100644 xen/arch/arm/arm32/mpu/Makefile
 create mode 100644 xen/arch/arm/arm32/mpu/head.S
 create mode 100644 xen/arch/arm/arm32/mpu/p2m.c
 create mode 100644 xen/arch/arm/arm32/mpu/smpboot.c
 create mode 100644 xen/arch/arm/include/asm/mpu/cpregs.h
 create mode 100644 xen/arch/arm/include/asm/mpu/prepare_xen_region.inc
 create mode 100644 xen/arch/arm/mpu/domain_page.c

-- 
2.25.1


