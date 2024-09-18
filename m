Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4A097BFE0
	for <lists+xen-devel@lfdr.de>; Wed, 18 Sep 2024 19:52:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.800374.1210290 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqypm-0007te-Jc; Wed, 18 Sep 2024 17:51:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 800374.1210290; Wed, 18 Sep 2024 17:51:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqypm-0007s9-H1; Wed, 18 Sep 2024 17:51:22 +0000
Received: by outflank-mailman (input) for mailman id 800374;
 Wed, 18 Sep 2024 17:51:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=w3Wy=QQ=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1sqypk-0007s3-Ht
 for xen-devel@lists.xenproject.org; Wed, 18 Sep 2024 17:51:20 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20607.outbound.protection.outlook.com
 [2a01:111:f403:2414::607])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 99f25908-75e6-11ef-99a2-01e77a169b0f;
 Wed, 18 Sep 2024 19:51:16 +0200 (CEST)
Received: from CH2PR03CA0006.namprd03.prod.outlook.com (2603:10b6:610:59::16)
 by DS7PR12MB6024.namprd12.prod.outlook.com (2603:10b6:8:84::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Wed, 18 Sep
 2024 17:51:12 +0000
Received: from CH1PEPF0000AD7F.namprd04.prod.outlook.com
 (2603:10b6:610:59:cafe::74) by CH2PR03CA0006.outlook.office365.com
 (2603:10b6:610:59::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.26 via Frontend
 Transport; Wed, 18 Sep 2024 17:51:12 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000AD7F.mail.protection.outlook.com (10.167.244.88) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Wed, 18 Sep 2024 17:51:11 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 18 Sep
 2024 12:51:11 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 18 Sep
 2024 12:51:10 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Wed, 18 Sep 2024 12:51:09 -0500
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
X-Inumbo-ID: 99f25908-75e6-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mIozU6PnJttYqBigT5saAG0NyVsKXRtVsrhaiG99in6rpKMwmC/pMYJ9KljDblMatu3TiAAf0HcsmmFtIRvgLEIubcd1TmGT2tbRFvWP7jNkRVZ+hKqri4m02zPn8y81vGpKvFipD/sL3xIalfacfDj6lbdj1ghmEgG2UR0+GqtoPwafcKNP8AkfiXjfX8yuKVGMV0cWJJp2rhncI9CM3hGpYszd1lPJVYH/ogDQJHWDjGeasBgyHh129PK1Oo16crEgYxbQr/8QUeHK33E+xI+TKAoTcRl6KTFhgOkcPE3poU9Zq0Q1GXGEL4Yohy8CGhmhStKvHtSouKnfiMWAiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ybj/SrloTXpJT95KAO7Ns1qQ3a3X1Bbt2OfLu0xWWhg=;
 b=bwZtR0Ki3LzgiyC3aNZmv8vM/j0a88sEmL1CniqhXw6YlSD1ArrEQVX1gT3aAqYz44xH0ON59VdT33wnwyx2zI+5fPqSffRNjW4WDEX/mduuCDknBmL/PA8TWE0Ae/wKgffpiyoU7AHrvml/QxoJ/MHEuZJIWds7AITPcmZ8qFt4eBZjREUPjD9XHmNGUUnBZodReY1QzsH4KqtFYxTPSBJWys/me/wx7SMmDy5S9q3urWHo1fYrpgf30Z7z1aZVHyA8ABep22uTU0FERsTK/d3yr91nOZIkg8h/HuFvpTVLzCe8qTd87O6yMWLLf+TJ3Kk+dkkLJEhaYQgiCs5Ybg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ybj/SrloTXpJT95KAO7Ns1qQ3a3X1Bbt2OfLu0xWWhg=;
 b=IyFE65X1DKCXYWe0dImiUPDne6+xn0bAh1vZTUpZX3xPH0oZtBsx8oCw0nSKtbLALhP2Ik/5EZS48O1BrpXCvH78P9VhNu8RMJHpaXQA3SsEJuqxd5fjzxWsXAObSNFBr0/icecEuetthBxOfn3SreX8Ck0Iw/oObRKZp3CBobk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Ayan Kumar Halder <ayan.kumar.halder@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 0/4] Enable early bootup of AArch64 MPU systems
Date: Wed, 18 Sep 2024 18:50:58 +0100
Message-ID: <20240918175102.223076-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7F:EE_|DS7PR12MB6024:EE_
X-MS-Office365-Filtering-Correlation-Id: 03338e6f-f6bb-47fe-1e40-08dcd80a7bdb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?kyDQztf2CFD1f9ijOFGl3IFheRKORccwjWhyDxGcyAQPnkW0JfLiowTtP79k?=
 =?us-ascii?Q?mmybCtGBHGnUpB+yGzWIAtACQbhO+6b/neGefxrD5syALoCEJRhsuXq4jaFj?=
 =?us-ascii?Q?M3+ceTuesFPWS/AlTtOzJ2G81R7hgdX3xta9T3Zx8XfGayMWeJXdSR3GSwez?=
 =?us-ascii?Q?XJm3bMFD857h0KvKIyw6CLdVzuMHo/onNdJAk4AU/XnB+extDYVIyclNpnX3?=
 =?us-ascii?Q?JEmdWLvYHOgKak3DtrL65N1xFebRJVjLrlwkH2rWPnttLB+J1S08FJRHbRpW?=
 =?us-ascii?Q?1/3nSbFzMaFPvt2n6AE2Zg6iZJUHezvSchka1DLulHvwwB0qVjAJSQt0FkQb?=
 =?us-ascii?Q?H+mlokUTVPHzzB5DsmXzpbk19/kfYtu40wHvzowL9dShyZvwNrp2BDExK9pK?=
 =?us-ascii?Q?F6LDMtwiX7tLgZbkUCnW1Ms132hChVjk2H9tzJkD4XB3x07UXdK1N0GLm1Q8?=
 =?us-ascii?Q?PadlNuyk6QTo1F8uFt/RWrQtwze4TYAXi+QOB0JuRzgMXSzSp2qBF3Ka9oIJ?=
 =?us-ascii?Q?J8qp0kK/1JjY6945uTFCoNspLGLjnuDGsXneZ8TKpWTW0bOBFXepSiudZoSB?=
 =?us-ascii?Q?aHy3glrJtodtk1pphkWqQ6E6SDDDKRmXlGdx5aPwsONP32aBNipK8dMEg1hF?=
 =?us-ascii?Q?RkAMi86LF4SwfKh5ft4i1qgolDhRdhGYMIX9fYtfV+4SGW9CN+8shu/PsdBm?=
 =?us-ascii?Q?rkWjZch4Zprse+Ew9fGU2KOTjiRPv0OCL+8fpN5QXNh/GwOmwDQyfqXrmOvZ?=
 =?us-ascii?Q?nUjF/3vQxfJG0EYiID1SLpbTdA4AgPWFLDnc7GqvY281RJNVhPFnMRy+0tJf?=
 =?us-ascii?Q?ftTW3dtot3hyMm9FmZ+//qXwAy640lJfJ3hKuA/bUa8CgtTi+N9/2/SezjH9?=
 =?us-ascii?Q?Rxz5ngwf5zMbGvLnPmfmT/Xiz4n5N/Ngg+mYFu3Xp7i/kQMxnJdoRWk/GSY+?=
 =?us-ascii?Q?YjMmk8DGbptQNphlkhb6cfLTqqDHzIVtRvJfa/oZxHaRHgHXXFacdHUdalHL?=
 =?us-ascii?Q?rwVObVBP+2WVbsRVdmyL42t7w02JOgvMEHwFM6qM17WHlANBvI5HWdifl1M4?=
 =?us-ascii?Q?wXtK3USB88EU7+fWeo8SyMXX+eOHVYLYhtbj8rI2hBgLlGb7Ft6sCZBEoHWL?=
 =?us-ascii?Q?7t40Q6dYGO8tZ4q6sCJav4gLuN/aHnIu0XU73QoFJI0Any9DAwgJ1aP5WJIg?=
 =?us-ascii?Q?GU3mqSz5kBHjAFyeA+FOu+m8bBbDlvfYx5I2i1C1LpAxk3IMknVUe70zXcYu?=
 =?us-ascii?Q?8kFIKEk2OvQ+fCPnBvqmhCnFbP3TkgrE2DOeJeU9XAhLAxO+OLTFEtBUU9gz?=
 =?us-ascii?Q?nS9bjaj+c+Is9tsd6pDvJpRxxgCOXpahDLrWLbW8Xi1+K5EwOSOSSyaBR741?=
 =?us-ascii?Q?bpWI1V5WM39Lf3yguY9fCrW/q0BnBCE4ihH2fBEv5O+g290gpeLSj/4x4EnP?=
 =?us-ascii?Q?//taXFhuLIS16UrPQ02KN46nHxWG/8eu?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 17:51:11.8060
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03338e6f-f6bb-47fe-1e40-08dcd80a7bdb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6024

We have enabled early booting of R82.

Ayan Kumar Halder (4):
  xen/arm: mpu: Introduce choice between MMU and MPU
  xen/arm: mpu: Define Xen start address for MPU systems
  xen/arm: mpu: Create boot-time MPU protection regions
  xen/arm: mpu: Implement a dummy enable_secondary_cpu_mm

 SUPPORT.md                                   |   1 +
 xen/arch/Kconfig                             |   1 +
 xen/arch/arm/Kconfig                         |  26 ++-
 xen/arch/arm/Makefile                        |   1 +
 xen/arch/arm/arm64/mpu/Makefile              |   1 +
 xen/arch/arm/arm64/mpu/head.S                | 186 +++++++++++++++++++
 xen/arch/arm/include/asm/arm64/mpu/sysregs.h |  27 +++
 xen/arch/arm/include/asm/arm64/sysregs.h     |   3 +
 xen/arch/arm/include/asm/config.h            |   4 +-
 xen/arch/arm/include/asm/mm.h                |   2 +
 xen/arch/arm/include/asm/mpu/arm64/mm.h      |  22 +++
 xen/arch/arm/include/asm/mpu/layout.h        |  27 +++
 xen/arch/arm/include/asm/mpu/mm.h            |  20 ++
 xen/arch/arm/platforms/Kconfig               |   2 +-
 xen/arch/arm/xen.lds.S                       |   1 +
 15 files changed, 321 insertions(+), 3 deletions(-)
 create mode 100644 xen/arch/arm/arm64/mpu/Makefile
 create mode 100644 xen/arch/arm/arm64/mpu/head.S
 create mode 100644 xen/arch/arm/include/asm/arm64/mpu/sysregs.h
 create mode 100644 xen/arch/arm/include/asm/mpu/arm64/mm.h
 create mode 100644 xen/arch/arm/include/asm/mpu/layout.h
 create mode 100644 xen/arch/arm/include/asm/mpu/mm.h

-- 
2.25.1


