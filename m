Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CBEAA1D4B6
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2025 11:46:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.877643.1287788 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcMdA-0002Ut-40; Mon, 27 Jan 2025 10:46:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 877643.1287788; Mon, 27 Jan 2025 10:46:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcMd9-0002So-VK; Mon, 27 Jan 2025 10:46:11 +0000
Received: by outflank-mailman (input) for mailman id 877643;
 Mon, 27 Jan 2025 10:46:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rEBS=UT=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1tcMd7-0001ah-S8
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2025 10:46:10 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20605.outbound.protection.outlook.com
 [2a01:111:f403:2409::605])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e7cda445-dc9b-11ef-a0e6-8be0dac302b0;
 Mon, 27 Jan 2025 11:46:05 +0100 (CET)
Received: from MW3PR05CA0030.namprd05.prod.outlook.com (2603:10b6:303:2b::35)
 by SN7PR12MB7834.namprd12.prod.outlook.com (2603:10b6:806:34d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Mon, 27 Jan
 2025 10:46:01 +0000
Received: from MWH0EPF000971E9.namprd02.prod.outlook.com
 (2603:10b6:303:2b:cafe::69) by MW3PR05CA0030.outlook.office365.com
 (2603:10b6:303:2b::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.18 via Frontend Transport; Mon,
 27 Jan 2025 10:46:01 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000971E9.mail.protection.outlook.com (10.167.243.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Mon, 27 Jan 2025 10:46:00 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 27 Jan
 2025 04:45:59 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Mon, 27 Jan 2025 04:45:58 -0600
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
X-Inumbo-ID: e7cda445-dc9b-11ef-a0e6-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pAN0t58IPfWvQAFR4M25oDgKNHnzOva3L65Y6d++ZVPTGc6QRn7TSb6QWaaH/5r9+r+T+XVSGgptjjP/HsLNm5hiOO/YPuPxU/d22q9EDBEMUwaz2wNObXFhH9GR26somtY1OF56mt/d6i5Pw1zUjx2u3Hm2VDctRdXzL7bXh9Zr/Jabszp85ew4oFsq2DCbCq18VvtRPncrpo6JbzsTjMkJVByO4LpLgIv3ZuEb+ZWKOI3bk9eXEsRgzbLXGzCJ/5yJ53BI19UJXlCNZM8PWknWsQFfTQfZMayITrjT8ubYkaghmKqgDNttPtDMtuwMPKwNfVInYVas9V3hfRb+Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6w7NW5Tq9BQ4T5PXnzy3s3SW3uM9h9Kf76VWukGYyXA=;
 b=L4t2+Sz6SdqYGDqA6hFoYzw6yfPZdf5+f3sPtGzsvLPCk0dJlMRLmp6Gw0a+VA/smY9GEcFBaso4nwMFoxx4GW7KJiFKsJV+K2S7L52K7uIRFnvWXim5ChwGGTzogXytQKBJJ8H4y2vqFKrEdgqbFJrXx/k6lkLpTvMW+nTUjWpfOQyuKcJN2f8x8gfEqn1bBEmJH2DWTNqeH9KSAWdEV4aWOavPQ/1ql+vtX0xVhFAxmicr4SVV3sH/8aH18MxPgIGZ9HM6Ti5sMEEmGBXa4JNbLrEQfqHvsHq5MFydP1r22bDR22FO3i0vidMbJkUaxfLCV61jLBv23AjSh9qCfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6w7NW5Tq9BQ4T5PXnzy3s3SW3uM9h9Kf76VWukGYyXA=;
 b=qajKZmhqcLmrgoeoW2nm+hsHzljQaKla/07mXwgoccXpEM7sv6rfYEyaUE8ZOtLtQC4jaSM3hfERmCZJXxGQLWqUdRf4skhl2Pddssu2gvH7/MXLXbkgrl8wZ6cfiNDwIq4Ot/+phuRq3k2loZEl62bgeJ0Fb8O4sYh0Yn26DtU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	<oleksii.kurochko@gmail.com>
Subject: [for-4.20][PATCH 0/2] xen/arm CONFIG_PHYS_ADDR_T_32=y fixes
Date: Mon, 27 Jan 2025 11:45:54 +0100
Message-ID: <20250127104556.175641-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E9:EE_|SN7PR12MB7834:EE_
X-MS-Office365-Filtering-Correlation-Id: f4e542db-8fc1-49f9-399d-08dd3ebfca3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QtIBy4qMcf8wYuBtMD88bGdIkkTgcDiegWt9iKkPCsGjNbmcitsM+fxRHZoV?=
 =?us-ascii?Q?D/KHdF2YnWDTyZGe+SJlmJnUYCwkeDLkSreg+JMc4HlGN/57BupqneVMpaXc?=
 =?us-ascii?Q?u4CWOE1LPU/HUz3eDZX0WoWwCzzHLM4SK3SyQIR14pqPfD5XyR9mnBI6xc7H?=
 =?us-ascii?Q?hTAvqufzAMCgY3zZiDNdg5Wd2vu0KOEpNYR0hv3ZuFnefZfv16K3E+HwakQ0?=
 =?us-ascii?Q?9h+VFgINLpRm4/MYPDrkEig4xVE6yrH7naqd03VyuBggd3xdHBsw/FV2MzKu?=
 =?us-ascii?Q?zGvwxlKsY7cMO6XhPlu8oaRKER/nnLHVDKQ9b2WhZ6x48oQ5RIg5sAKOcYrk?=
 =?us-ascii?Q?BCjvVTIlcyNdc/D133WGGOum9oq3lV7nGB+N7jXxVQ7TxhdOBna8LIuL7RtJ?=
 =?us-ascii?Q?Qd/nIxKXVts3OOJlMfnltV7j2OWrIH65pdiHRnXdQPKdjSzkmJiBNcKkS7Ie?=
 =?us-ascii?Q?kNOl9FHGkBXwC6ZcK04KFI7SElIJMzEFuVX+1DXb/fZRLytwz2UMInmljkBt?=
 =?us-ascii?Q?lUeXCiRFJhQRkzADVImaHDh6NPaVqfRJC0grtIjHt5ty79yutTKiYqCKLtsA?=
 =?us-ascii?Q?RwLPfUuC7bdN1rlF3bx5/J67pioQ3x1erpD8ewkXeiUpNi185+pKd3L8TnZ5?=
 =?us-ascii?Q?I1tFz9UlFed++4sEdR3o3fX6s+uvJ7GvFfS3bqSiS/0TluTnxjyWAkTrOxKK?=
 =?us-ascii?Q?IxUGhfDNjD/Kc5GMPf37qMwQOXf4ez7vr+sDQdTKxL0FTXVVMCohVE5VOcEb?=
 =?us-ascii?Q?C0lI18bNHw54UYu1Zg47d157x2nQj9G2hYNGm0neJJgKgRIqkQnLSVg8Hqcp?=
 =?us-ascii?Q?xMvyU2t9/F3WUqy+ViRUz0N4UDH0FZQ01hx5B551AH0weoX6iswl2P2PGphJ?=
 =?us-ascii?Q?exLjptnCDd5WCbIrZOUhF0JwPdnFpX75GLbEqMCUt1AR/sX286o4xmyPeo41?=
 =?us-ascii?Q?t3nsXs+RprttsKs3ZOrb1Pg6KivsmFaedX7kYK4a20IfDOXa7EIWCX337bOk?=
 =?us-ascii?Q?pxBgGF+LxvkZ1rC5P0eKigrcN+IEmgY1GH7t4t2E7MpOG6KdpM0P8DGEgbVC?=
 =?us-ascii?Q?9kpjXKrmNqoWQ2HZsMvYu/F4PENs8JXwFT/r/2HODrLjGaX+pO95qemiURzb?=
 =?us-ascii?Q?IWlbSulrLjZ94LJEeWF6FVj/hiNVwCB+fTykyXDBZpcWYVdwEWFNMrEv193l?=
 =?us-ascii?Q?S6K/Vv411fkJQ8vEb2B7StzLl08LqvcxrU2xbIzSO9K2Iy4yT4IfSFGXavLm?=
 =?us-ascii?Q?HOJRxew4kV5QGL2QLIo64ijxIWHvyK1E6knp55CkVahxWdaFuqCtaMpXoTHd?=
 =?us-ascii?Q?wwe53CRjWs79u1UYefaxiaFqZNBXitToz/rulGR301sWVTPlO1Zk15ER6egc?=
 =?us-ascii?Q?CnLE3qJ9yqtbXskPWnTcqY4PgB1/owEFOL8fQ39JZUAhg1XUpCx9bB5z6MEE?=
 =?us-ascii?Q?dA3XobaiMi1XTMm7aWjMNZ8jYYUxoA//CelQdBTanTe6L0Jn8fBn+zLmXgYE?=
 =?us-ascii?Q?EsGV6wzgm5juBFY=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2025 10:46:00.7601
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f4e542db-8fc1-49f9-399d-08dd3ebfca3d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E9.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7834

This series contains build fixes when CONFIG_PHYS_ADDR_T_32=y.

@Oleksii:
This is a release blocker.

Michal Orzel (2):
  device-tree: bootfdt: Fix build issue when CONFIG_PHYS_ADDR_T_32=y
  xen/arm: Fix build issue when CONFIG_PHYS_ADDR_T_32=y

 xen/arch/arm/include/asm/mm.h    | 2 +-
 xen/common/device-tree/bootfdt.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.25.1


