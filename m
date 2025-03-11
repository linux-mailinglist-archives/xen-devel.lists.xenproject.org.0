Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F24FA5BB98
	for <lists+xen-devel@lfdr.de>; Tue, 11 Mar 2025 10:04:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.907436.1314676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trvXK-0000qm-8J; Tue, 11 Mar 2025 09:04:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 907436.1314676; Tue, 11 Mar 2025 09:04:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1trvXK-0000nf-4Y; Tue, 11 Mar 2025 09:04:30 +0000
Received: by outflank-mailman (input) for mailman id 907436;
 Tue, 11 Mar 2025 09:04:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5FZT=V6=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1trvXI-0000nU-Iy
 for xen-devel@lists.xenproject.org; Tue, 11 Mar 2025 09:04:28 +0000
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on20622.outbound.protection.outlook.com
 [2a01:111:f403:2405::622])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d2a3aa5f-fe57-11ef-9898-31a8f345e629;
 Tue, 11 Mar 2025 10:04:23 +0100 (CET)
Received: from SA1PR05CA0022.namprd05.prod.outlook.com (2603:10b6:806:2d2::28)
 by CY8PR12MB7220.namprd12.prod.outlook.com (2603:10b6:930:58::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Tue, 11 Mar
 2025 09:04:19 +0000
Received: from SA2PEPF000015C8.namprd03.prod.outlook.com
 (2603:10b6:806:2d2:cafe::6a) by SA1PR05CA0022.outlook.office365.com
 (2603:10b6:806:2d2::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.20 via Frontend Transport; Tue,
 11 Mar 2025 09:04:19 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SA2PEPF000015C8.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Tue, 11 Mar 2025 09:04:18 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 11 Mar
 2025 04:04:17 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Tue, 11 Mar 2025 04:04:15 -0500
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
X-Inumbo-ID: d2a3aa5f-fe57-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TpAYOLxJnME+yFX9hgxeIpvNWeB5lgLGk/QKvFa1mAe3TOmMKQDBw7z+ZVk0yHz0JqWS/95ZCEtkrqPsmpGxmEwNpzRKK5Pb3w8o10gNqJisPjjdcO2IRRQD9Ssss37pSR3tZZKIgsPtk8HxtjUOFFJu9uQR0FYO6D5jRx0Niwd/ViR62ZXQNPpVBHcd6HsNoMlAmrj/g4GDw/I9orJcDcM5lkUWEQPwVwFyle8pIyPWQgR5zFgYvebibHd5gLDf2WyS4dpaLPLlwrZZOrAgfscjWl9VKvf3TA7ZeIHZnLUqnTMVlWkIXvxRz+FYKICdhU71PtZKCJ6rzfPentPYBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d+wZE0XEfg9Z28rwBcHSeO2X4H4qtNEwOw8m8uv9TNw=;
 b=vm+dRL2pYpRHztAO55wvU2uKBpGMxEyouAU62whrgIrqGsmOzPv8jZ67/gEf8G9pLUzWP/vKTWavVL/0jK5qMKhYhjdhWI6F6N42gR/fOTYqRdxzdt8C3ojMniijC+doCA8zsOmGRSenYrww6foRH7pJOy7mih+5fU9RMeT+RyVYpDE+GRx5tDdtUjqsXtjjCT2fnP9t3FzEM8ll9v/o0MVO/qjYdFgqjiUjueNibFAJV/fe45MIDzvAeeNqi9J5CqJJC5piXC3iw8HBu/GsUyAXMMDAEOFteB3egY89PVzonu8NGlevKbqsileyEh7/tCVTDRjH1jRb5OWA6+6p7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d+wZE0XEfg9Z28rwBcHSeO2X4H4qtNEwOw8m8uv9TNw=;
 b=o7Es5FJLwJDxAxnx8ewx1zIi706wTtRcGQ3IIIIrHcPfTs+ciHqu+RZF3boXsm/uC1oWrqDbu1Zq7nlvd+9nFuvcwoScz+WApELv9aZJ6/pL7iGmG96KKHwHlfuYCmkEORo8xeHpHBjO1+eGwVx5hvRFdofisVjapN+iiNWOUVs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>
Subject: [PATCH 0/2] arm: better handling of nr_spis
Date: Tue, 11 Mar 2025 10:04:07 +0100
Message-ID: <20250311090409.122577-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C8:EE_|CY8PR12MB7220:EE_
X-MS-Office365-Filtering-Correlation-Id: f9b58a0c-acd7-468f-c2bb-08dd607bb4e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cAsF5AhKhHCrp99zwc/RWfZLNY/+t2FsPYy27IQ4mH63Ih88b8T4uy4UeUf6?=
 =?us-ascii?Q?/M7enz9BkUOFbKYNE2W/HKhoBZfVNgGz+TnXPpnweZKVrQfMTHBjl6qIIqlj?=
 =?us-ascii?Q?h8n+LNwBCYnq6f8znFayybYfEwvMwYgNYy4sz7y/koQ+q9XTuwGlfa9UuOYo?=
 =?us-ascii?Q?8Tu4OzI+LY+Swwv7k2pBY+PsJLjAfxZCzV5RxLeV3hlTBWzu565xLYiQLV/J?=
 =?us-ascii?Q?IqWUnl7SUiI8kGM3Bii+MCMWsQ34G+aMNtkArU9o0WC4oblbyE4qCSzV8TES?=
 =?us-ascii?Q?87Tv+l3mAdHQNcJt3kVB6dPCQaisDhWBILoJvnbFkjAUdl/CooN+y7+sK6rv?=
 =?us-ascii?Q?eGW25cftO0guemVJUCyf1ythea9wOqkBGERsQi3pZ7E45+nrjNGgnhkzmMwN?=
 =?us-ascii?Q?m2EwHQV10RKUW8GhlyaHmv2OwPGmTscNjga5hKeyMFbLIUeg6JJCRXzi61sl?=
 =?us-ascii?Q?9+i6szV5iDyUZJuhSxu8amj/xrKhLLgmDrbIMqBru5BXlGVTMDQJWB3x+0YO?=
 =?us-ascii?Q?M5YAwOPUyHzoqc11dj7vBH4Otw1BdA0rSdReAv7OCsP9sGElmFpM1IXq2/SW?=
 =?us-ascii?Q?Igj346zn7Mf5w9Di7kfRrLASTF+zyInfx/EBN/UfKlN0Z+egVlFajlklzrPm?=
 =?us-ascii?Q?S+OZwEQinvVE9mc7xYtuhTs/Eo9Kr1LaUvaMSc9PLQgMn7NVXPG/VayjxCMd?=
 =?us-ascii?Q?EqW3C48Nh7I1FNxm0ADiaziakJlDQw19bXYzheZVzXOEszpXGG58Egwzi28V?=
 =?us-ascii?Q?Xy5n6zgnov1dh9QyL8ti8jgaAzEfrSiJ1HUH7DsAdpYQzTEUQcT9WGahXJPN?=
 =?us-ascii?Q?fmVCYPukaYIePkIHrTRXJmCZDaBhDRgrwfkA5VLg8t1VAQAviKMaRYeohp/2?=
 =?us-ascii?Q?5S8LUPbyI2GpfPUDD58oljRNH3LGOzZYxJiHYV5KdwRUwCXH+8eSHAShBtfx?=
 =?us-ascii?Q?CHidcqn9Y/Hy2OwJwENETTnAjmegqmcdkSnYOfJHFLyurhTLSmNdB7d0xQED?=
 =?us-ascii?Q?zFtXfi6329FW5BIZ8Wb052uksLDJQuQB2wp2v3Dz3zjF25rkl9j2c8iyUgdN?=
 =?us-ascii?Q?Tit5l11IA3iq4LUYO3bcXeikR/xptx0UngT08bz8o8M9Y6dJqnbckeHfwSt/?=
 =?us-ascii?Q?ei7op3eyBXlsVdnZhHfO7SFlbtiW4Zi95iAZtP3Y28sq69w5Y3PcnLdvmF1X?=
 =?us-ascii?Q?jsIFQQmmH+1c2K09zHRL5zZEGzwxICH/BtJ4GqkxXHb1pet0Rc288E8jPrHl?=
 =?us-ascii?Q?LNcH6UMJ33CFeN98DHGd54VygCjkUWFnEXCe/l1OFGWhiC628yGCp46aoqX2?=
 =?us-ascii?Q?bdUebBDaT39/Yt2yR3JoeP6woKFXEo6UyDHxr1ymclmb6ERKcXtr8KSs+aRt?=
 =?us-ascii?Q?jaI73tsI2zQZeFUHUh8SR8AgjCvgrcnj9P/dOVQHM4g4CI99p0A+4jTI2Pgt?=
 =?us-ascii?Q?hAZKFao8qJ2WrQkromBH/Tx5Dozux/O+?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2025 09:04:18.8003
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f9b58a0c-acd7-468f-c2bb-08dd607bb4e9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015C8.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7220

Refer:
https://lore.kernel.org/xen-devel/20250306220343.203047-6-jason.andryuk@amd.com/T/#mc15ab00940d5964b18b3d6092869dae6f85af1dc

Michal Orzel (2):
  xen/arm: Improve handling of nr_spis
  tools/arm: Reject configuration with incorrect nr_spis value

 docs/man/xl.cfg.5.pod.in        | 13 +++++--------
 tools/libs/light/libxl_arm.c    |  6 ++++++
 xen/arch/arm/dom0less-build.c   |  2 +-
 xen/arch/arm/domain_build.c     |  9 ++-------
 xen/arch/arm/gic.c              |  3 +++
 xen/arch/arm/include/asm/vgic.h |  3 +++
 6 files changed, 20 insertions(+), 16 deletions(-)

-- 
2.25.1


