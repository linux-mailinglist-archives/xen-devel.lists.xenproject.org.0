Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDD9B16D26
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 10:06:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1064963.1430292 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhOIJ-0004Kg-Co; Thu, 31 Jul 2025 08:05:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1064963.1430292; Thu, 31 Jul 2025 08:05:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhOIJ-0004IU-9t; Thu, 31 Jul 2025 08:05:43 +0000
Received: by outflank-mailman (input) for mailman id 1064963;
 Thu, 31 Jul 2025 08:05:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HAjF=2M=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uhOIH-0004IO-Ju
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 08:05:41 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060e.outbound.protection.outlook.com
 [2a01:111:f403:2415::60e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2529f67f-6de5-11f0-a320-13f23c93f187;
 Thu, 31 Jul 2025 10:05:39 +0200 (CEST)
Received: from CH2PR18CA0033.namprd18.prod.outlook.com (2603:10b6:610:55::13)
 by SN7PR12MB7228.namprd12.prod.outlook.com (2603:10b6:806:2ab::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Thu, 31 Jul
 2025 08:05:35 +0000
Received: from DS2PEPF00003439.namprd02.prod.outlook.com
 (2603:10b6:610:55:cafe::8a) by CH2PR18CA0033.outlook.office365.com
 (2603:10b6:610:55::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.13 via Frontend Transport; Thu,
 31 Jul 2025 08:05:35 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS2PEPF00003439.mail.protection.outlook.com (10.167.18.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8989.10 via Frontend Transport; Thu, 31 Jul 2025 08:05:34 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 31 Jul
 2025 03:05:33 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 31 Jul 2025 03:05:31 -0500
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
X-Inumbo-ID: 2529f67f-6de5-11f0-a320-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g9BgAaAlM49gIQ6d9WdmhEA814/Rr0xs6j1D2Ku2cvedxrhYYdf635CFl/PwkxDEwRpLV7ZxzLJGR3PPKymY1rByqPQ8oGciX4EFyHou9B93tsuzaywL3mVkxE9MKUsVPc2smPNs6fgPViNgcOb6eI3UdD9sF7fO5PurCAUyfvGAxPKrvD9RM4lkYT8EW6kpB3VnRj5vFQkW7Fg5zbk8fh/x0lvLWlb1r5LW1VoQJNN/OrFA8JOQEAOqMivdvPfpUcI3hxKRCrqjHuuKwyOKDtzjxeHIj5lItitZulE4C7ZbpkFv0+eIk/jGDynFamr0qx5SI/EUHfSPsLJHNq1CfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7deUiRA9ev+z+KuluRH1dBudotHJe5NdMKpP6PIVBYc=;
 b=L+2rOwt/gvU8BWWMx7r0m3rmzSQBg8tzolNo4559gQ8PncRcdy/uHvP9B2jU7Ow8mX5GOsPrnVjA1XSA6+Enl2f3s+iDVNST8jaW7mcb+iaH2VZvwnPwMMVSwtN674bvnfpBFRJibVeEVB5fOME8DZuNXH7KsEgjY/iFCzO7HI91dKwBvpyD9bZxvzcVpaOKu/Y3oBPoZwDpWqTkfxMX3Z1JS4bez2xYP0rRYr5B8/OvoHAXXksjzhXp0Vl33Z2iZ/0dqydZPWsPSsR9e1463W8mILCRaY+hZ6nNmO3fz8wTI6dYfms0H8snxegrm02sLA6Yuf6/nTmu9nZiS+padw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7deUiRA9ev+z+KuluRH1dBudotHJe5NdMKpP6PIVBYc=;
 b=UKqDrSUSkwtE3LLd/dj/9Ss/iPzirHvdbJXmESSbiJEzuQ1rKBDTWgKcLJZWmgMMRHP4iXgKziV2RjMWIL+7Z1jNjKjhtO9CJpdw7ORr/94Chb/i6Dm0h4Lq6pefUCInx6Jav+XzjyH6LlfBFWuVFTn7MUgiDEC+xTVAwxfKbP0=
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
	Andrew Cooper <andrew.cooper3@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 0/2] Kconfig misc fixes
Date: Thu, 31 Jul 2025 10:05:20 +0200
Message-ID: <20250731080522.810468-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003439:EE_|SN7PR12MB7228:EE_
X-MS-Office365-Filtering-Correlation-Id: f4fe62bd-f431-4ff0-8b14-08ddd0090727
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?B8/hvvMch5fgEkEM43BxjdfM6+y7iCx9i2uymY1O8pXapFr22LXIS04YOASn?=
 =?us-ascii?Q?sDhrj8c9U555p0KS0NsXbt4syJFfasmBWQx7jmHf6wnjInbQWksoAh5qIBEW?=
 =?us-ascii?Q?/0urUBsIedqTcsBzmOZJOcxcoUMGipOhwQ5Nj6BWWgiHCIwCAqNbA6YK2zbH?=
 =?us-ascii?Q?qA2/2OcCZNNbbXYqgOsu167lMIo9++lOyWM1pHtTri5dqbfHYBsHBGYoFhGa?=
 =?us-ascii?Q?D4gJ5weo+qTLeLMwergnbEmJhTNq6XywMwna/uZcpz8+x/jOmZZPrLf4mIP7?=
 =?us-ascii?Q?i/Tcb8gH0hWGOI53hsH03TrLL+iyyV3eKwqyP0phusAV1gqE3YS6faZjXJXr?=
 =?us-ascii?Q?Jbfb91e7WVuYsilRANEkfKqcFRMh9RP1sCYPZavQgYvT+eFNzhkjzwXHOHax?=
 =?us-ascii?Q?XtzjwHclTZozZxw38Bzb3yiE05s1DUJ2mEIOK3Xjnm8HQ5pl3c0eV59HkcxE?=
 =?us-ascii?Q?jOQFca9HQ3df0aE3wnVIa0DnftOxShuP7gJ3JG1GXW34FpVxkenSXbRq3cMZ?=
 =?us-ascii?Q?WUgw5VDEZpma0BVe7lWBaAb7SY+eIKXnjWU9yIojlvLo4+Uud9uCk8mNCHab?=
 =?us-ascii?Q?qF+xLYYT2qneSgf82CvuoQjUB4l17cq8xbYAkazizLq0QjIvrY9aFgk0UDSk?=
 =?us-ascii?Q?ck4naGeozKXLwsL16XvK4qJnPrvfxVftEgw/A/YxTLi0+27nW2VIbUj2AzUF?=
 =?us-ascii?Q?beAisWOUfb/INCXbmv7rYR0veiOq2d4OW/h6LgMkbBqRcsJCox4RuSWW+NBc?=
 =?us-ascii?Q?CnK4OlKFGgBJTyRIrXXuChbyCvUECTUFVHPopc5CXcH0YW5wQ7GIKTlpEI79?=
 =?us-ascii?Q?5lzhoqvRP2Oy/Aw/3f6gd2rrRY+XR29z2sJvwpFz4w4i4QLELeBcFKtHW4Lp?=
 =?us-ascii?Q?9beyIhgz7oczDzTeCqdyhzqPTJ0WxT3HuCpPH8ywLGEZsrFczVD9dHfUK8I1?=
 =?us-ascii?Q?x3qNiHoQHNpRHt88xAT3nvWdlo61B/sti9ZTJ6GbsRD03gbfvIxl2hwx6fYl?=
 =?us-ascii?Q?MMjQEL/NU9qjDEKenfZ0pKY94UuQGkn+MtYRAHKcUynZjottopQbx+Krk9sw?=
 =?us-ascii?Q?NMETBZACOiljrkhh57HGwM/QTRE21Sg2kqMzqrOH0nBmFgbeKnY9DW5Lqw/s?=
 =?us-ascii?Q?VpPxtlhwRw/B2l3fWOH4PH/Cp0AamgkPjc/Xy3UyVjiTDXZ5GVLcdvjnngHt?=
 =?us-ascii?Q?8nH1oDi6f7ZoP/zknv+RgMmlLBopMlNAkGFmVU+UQ6TQvF7THmVURySoQmJ6?=
 =?us-ascii?Q?C19LbzsayT3jn5ZcKLgnbS4dAAWhedtGB4/yGuSGhaTFGuLZeiq2Y6P2cb08?=
 =?us-ascii?Q?2iOAWwyZ/sS5EsHe7tC5mciJLo1aRuWMPKnGc6p6KQodCm8r1DeTV4tVs9HV?=
 =?us-ascii?Q?wlP0Mx+K79td81VX25ndC4yU+9kuzb6QEwllYt15S/hjvBEto9VaffviZ2x5?=
 =?us-ascii?Q?16OPlxaZVkeoxFqQyukupsbWRAfM5nYZd71l0MEJEMB+Z1hsNkA+dv6S41it?=
 =?us-ascii?Q?HI+vRC6kY3jrE78EFsqkNHCxXuTtxbOi0um9?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2025 08:05:34.8992
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f4fe62bd-f431-4ff0-8b14-08ddd0090727
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003439.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7228

Some Kconfig misc fixes found while building different configs for MPU.

Michal Orzel (2):
  xen/arm: Fix HAS_PASSTHROUGH selection
  common: Make livepatch dependent on HAS_VMAP

 xen/arch/arm/Kconfig | 3 +--
 xen/common/Kconfig   | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

-- 
2.43.0


