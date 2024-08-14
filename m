Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 286319517E8
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2024 11:43:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.777023.1187212 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seAXF-0003ck-7s; Wed, 14 Aug 2024 09:43:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 777023.1187212; Wed, 14 Aug 2024 09:43:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1seAXF-0003aS-4d; Wed, 14 Aug 2024 09:43:17 +0000
Received: by outflank-mailman (input) for mailman id 777023;
 Wed, 14 Aug 2024 09:43:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DSq6=PN=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1seAXE-0003aM-5R
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2024 09:43:16 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20609.outbound.protection.outlook.com
 [2a01:111:f403:2009::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f84727e-5a21-11ef-8776-851b0ebba9a2;
 Wed, 14 Aug 2024 11:43:13 +0200 (CEST)
Received: from CH0PR03CA0102.namprd03.prod.outlook.com (2603:10b6:610:cd::17)
 by MN2PR12MB4487.namprd12.prod.outlook.com (2603:10b6:208:264::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.24; Wed, 14 Aug
 2024 09:43:10 +0000
Received: from CH1PEPF0000AD7A.namprd04.prod.outlook.com
 (2603:10b6:610:cd:cafe::bd) by CH0PR03CA0102.outlook.office365.com
 (2603:10b6:610:cd::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.33 via Frontend
 Transport; Wed, 14 Aug 2024 09:43:10 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000AD7A.mail.protection.outlook.com (10.167.244.59) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7849.8 via Frontend Transport; Wed, 14 Aug 2024 09:43:09 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 14 Aug
 2024 04:43:09 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 14 Aug
 2024 04:43:08 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Wed, 14 Aug 2024 04:43:07 -0500
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
X-Inumbo-ID: 9f84727e-5a21-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZuodEWA1N1VBPHTM+lV6ixtdDXfPrcsSi6URCj+Cve8OV/5XznKbu5tBmd4ZCi2QjuB3nw8yo2HrLSdXM0Y6CvPtc1RYJlVDyEF8IXiyJ63utwgdtVUS2yBsXoNKMhd6Qu3TSut0RPVrwVHC6Kq6B1RgVdpKrM/ZoLCbmobKereo3ruylsLLc052QN/aJ6YFkwBE7BstIiS5Nm9g+0jAVlCLuhA7a6dh9DpXlM2OexzZDGZsgK9uZ4fZxQ7gIeeWDKHOhr+gAPm5KE2V0uOdOKTYqTu9F6uMi8NhdSD2G8/ZdXnbpAjDNzI8ZkhcQupTY0bArPBXfd40wT7W92x0nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uos8zMu1BmcwVbRQ0zFt1JSjeMAYJea2OU/jPcTq+Hs=;
 b=QM0p3EWyZxprH9UvhEEak0Rkwm/vbseMITzBnDtS7hN+H8atdlAWUI5IcnobWWBDJVApzEzsv0HlVgOkrJtofAFWerWC/8lmkxZWiSY69iSidxnY7b24FQ/VLZX9tA+mtFrCcWr+OZFk1wtoBBoHNekXp2j/9GDPTqlpfLnVLj+Uod7M0As4wcHw09QTBbyChiY/wLq/3q9wxX2Pgu/92BuqSRCrP6RiymytQ4n27aFN/pN9MiBqlURxDD/6UsSTR3SlKiq3KwS73niAAzpi6WJ2qcUToUgYDu1apeYSGwYHsslaR+5W036x8kpjHLLnPZqp33psFlwOrtMJQGLDiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uos8zMu1BmcwVbRQ0zFt1JSjeMAYJea2OU/jPcTq+Hs=;
 b=giFMDy+60DzTf1F7Ixs3+DUJnxQfsmlrnd5AzayW9F+nx+FiaW3LVxSiD7tP6AlERiZaDx7Xqg16yzHP2x6Rq0yGdLbHIA/n2AKTq3nCN5p1fBNQbEB/S2khNCbY4zjb0WXNy6qAgvKZPSbDrEPjlC7JHUK0LhdyWvt1xCbFKZ4=
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
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 0/2] xen/arm: drop {boot_}phys_offset
Date: Wed, 14 Aug 2024 11:43:01 +0200
Message-ID: <20240814094303.23611-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD7A:EE_|MN2PR12MB4487:EE_
X-MS-Office365-Filtering-Correlation-Id: 151a9787-73f7-4c2e-f33d-08dcbc4581f7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?abFsuiYVN//kwXBVUswm/oFGcvtr5ACZ5+N7M6l7GsaKaetPtGimFTkCrzKv?=
 =?us-ascii?Q?z9H74S5j2fHB857cGfT2jcDCX3f9OSLzBSRs0MTFqHYFYfJqZyZJnfxbmdj4?=
 =?us-ascii?Q?rHvrYIee/mDYpW88elaG8dtNgAoUSQsoYeS2+nDnA+WMDMK+/mbdIUoJiG9c?=
 =?us-ascii?Q?WFYRmSb5FLgeHJ5Emjx+FNOWwwevDsWtxeQXbT3RZ0VByxwtCJ9WNc2HQiPB?=
 =?us-ascii?Q?dfqJvj06Suw1ZboQGQ3muSZv1KKauGhsLU6CtKRHsKMP72M1gWEr5ucuuoSo?=
 =?us-ascii?Q?iSitNmE4PHuD9vw5Ywr+jGRWDzp1Rzs5iLmdN9h5sOqcO0AY4js3mcMwEmCN?=
 =?us-ascii?Q?8YVAYTVLIzjyeFQ9Vdcj75Pz8GeBwUkDghmdrmyOuj6e35m8LPf2EX2GXno6?=
 =?us-ascii?Q?gXhABFwIED6MtUSx5l+/zq4szmpBBkuzuB5TBPnSh8C1yF38Ov622H/uGgTJ?=
 =?us-ascii?Q?67bjY5ReDsNwyND0pGosVz6vMICkjRaPHaEpfIufgfSnFQQlCX7+kSsNReXn?=
 =?us-ascii?Q?ITSmm5RKk+YqOSlMrS9+WKlzQ3p4S6XvbOCGFBzkPq/NtOMob3HC1FMR3q6k?=
 =?us-ascii?Q?lYDQzlBfvrVS/z8yjjm3kt98yd//0cVI2svlM28TkE4qGUPREICSnjR9gvj7?=
 =?us-ascii?Q?FQVA6GAwhlZPMnLIEtLdQ4LL86eY5xk3/PY7m4XBvUt53Q2vM5nJH1yFX6dh?=
 =?us-ascii?Q?xXgnZjbG+oqJU9A9N76gjAXwAeNtpenaZKsGe2KO/k1uG1mt8QUv6z2jhtSE?=
 =?us-ascii?Q?OHeQ5IpAVdpL0GM+sxdfQOxU1unkKozgGsBFSp0rnFODgfEtuQ0u9ivIM1Dt?=
 =?us-ascii?Q?gsirG5IJSjr2xeKKDDc8iYMGaMOFGnAqcWBmuL6i+7jL3mGbclBNh1tkZLMY?=
 =?us-ascii?Q?OeuLURVzWoxeSPyWnXi7ldcmT41tn5o5kevNDFeJEd2vpYjkMVDkM9sZ0g1a?=
 =?us-ascii?Q?Ym8Dxxtw3AY3T1alASFzEzM5XsZiyOokdVOyUKdd4OCWgf20wxBZ8MmuauyW?=
 =?us-ascii?Q?u2dfVqjCc1GeSgD0Pka791yP2vXEAECTvSXPhcKLF+rwj6YyRnld16LmRVTN?=
 =?us-ascii?Q?EIu/Rz9mwDxEhNnQtXr7lKohOUo5WCfEB3nnDI2iAN4NqEqg9D5rWSRYV/y2?=
 =?us-ascii?Q?ZsFf4C4S/pJ++krhd9fAFezEGWNmg9nvpepyad4B75vwSNIOyzDfnhPniiCh?=
 =?us-ascii?Q?XzRVIF572/GjVoFfyXVnU0821q6XiIuKjnRu2vUbQpNcdqKGpWG825PvQnGX?=
 =?us-ascii?Q?wWp8entfQDzwO16NcnUiAWbjMkftrfFYDnxz3AlK0y27tFIwqLIzztSyZ0RS?=
 =?us-ascii?Q?NAq0xVXrUvpmTvLKH0xdVjz9/75twrFqRQ97dbKIYrCp9A2GPrSITN3JXG68?=
 =?us-ascii?Q?XJ6hbRFvJacHcCUxr+pPB7p28hX6WewjiaI1yjNGtmycRVH8hvntmx3o2z1s?=
 =?us-ascii?Q?TTYzLTuP12f/abfPfBDbaZ5ubLHXj+hb?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2024 09:43:09.8106
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 151a9787-73f7-4c2e-f33d-08dcbc4581f7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD7A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4487

This has been on a TODO list for quite some time now. There is no real need
for these variables since we can ask the MMU to do the virt->maddr translation.

Michal Orzel (2):
  xen/arm: Drop {boot_}phys_offset usage
  xen/arm: head: Do not pass physical offset to start_xen

 xen/arch/arm/arm32/head.S     | 12 +++++-------
 xen/arch/arm/arm64/head.S     | 12 +++++-------
 xen/arch/arm/include/asm/mm.h |  2 +-
 xen/arch/arm/mmu/setup.c      | 16 ++++++----------
 xen/arch/arm/setup.c          |  5 ++---
 5 files changed, 19 insertions(+), 28 deletions(-)

-- 
2.25.1


