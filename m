Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3567AAF8A28
	for <lists+xen-devel@lfdr.de>; Fri,  4 Jul 2025 09:54:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1032942.1406374 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXbFr-0002Km-8A; Fri, 04 Jul 2025 07:54:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1032942.1406374; Fri, 04 Jul 2025 07:54:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uXbFr-0002HB-0o; Fri, 04 Jul 2025 07:54:43 +0000
Received: by outflank-mailman (input) for mailman id 1032942;
 Fri, 04 Jul 2025 07:54:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aOXq=ZR=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uXbFp-0002Dk-Tl
 for xen-devel@lists.xenproject.org; Fri, 04 Jul 2025 07:54:41 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2062e.outbound.protection.outlook.com
 [2a01:111:f403:2406::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 22cb9119-58ac-11f0-b894-0df219b8e170;
 Fri, 04 Jul 2025 09:54:40 +0200 (CEST)
Received: from CH0PR08CA0021.namprd08.prod.outlook.com (2603:10b6:610:33::26)
 by IA1PR12MB6067.namprd12.prod.outlook.com (2603:10b6:208:3ed::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.21; Fri, 4 Jul
 2025 07:54:33 +0000
Received: from CH3PEPF0000000F.namprd04.prod.outlook.com
 (2603:10b6:610:33:cafe::eb) by CH0PR08CA0021.outlook.office365.com
 (2603:10b6:610:33::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8901.22 via Frontend Transport; Fri,
 4 Jul 2025 07:54:33 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH3PEPF0000000F.mail.protection.outlook.com (10.167.244.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Fri, 4 Jul 2025 07:54:32 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 4 Jul
 2025 02:54:31 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Fri, 4 Jul 2025 02:54:30 -0500
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
X-Inumbo-ID: 22cb9119-58ac-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wiFDaqI0yhJLFKTX5rxUPoThFgxivwbRrZQliTesWCgClYdmzK4QVfPbbmHAy6K3F8GqiiPpXGuWRXRM9blBYBlLa5DCZ9ylgqFuN7fBJ+eap/RGRa4QqZw3E3ylOBCUAXM4WZIaPKSCieoNp8wzfeMSCPgo6kmviiolDDmedNGVnegf0cHP0w5ilOEJgwiaj7niZMtL58cYz5G2CI74/CGuN14rWOZnu1DYRVfzjt12TMv/9/z2NWWLQMXMYP8lYjcIKmHaBKV18L2jCzrlerOZSdP3qwo6NPFgW8QCSyRKn0WNRavy1g2/e5fNZcRMLPOTUt+A5pEr2rMfXlCTUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QO1K1SUFHeJhQF0hZwkgunRajVafDqzXzPqi/osgpZk=;
 b=sWOHEQbNWkKH5tpLufasXFh6Z9hBj4ybS1XrE1Z6r75dpjMH+80alH6qtWXWWkjf68r5vX8PNFEt/n4Aw60f1cnV3LXuNVdHaVskJXguHSa+z2chGgdo6JsMDzvqylCmCvSTHZSa/86yXAT+F6MBz8+L9GgWX8YI/OdmjFdj+45Acq+/ia3Bb1RxUejw53yP4oMEOhfH48xYY+MPm6Un/IsYU3QdwYKT6tZga8w0yUaigTd9DSQkaXm2TbMgm2SbVn8IPchvOAJgWJp1AcGiG4wZtBgsqnvAmNzqpel36qoIQGrf6fz1J4NVPb0UGMorvEVcK5Kz4WJNDaOo+Uir5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QO1K1SUFHeJhQF0hZwkgunRajVafDqzXzPqi/osgpZk=;
 b=455KoNCTJfduzsSvwgziVlrvZjOMh9YS0r+fOxo69IUk9iI9El1IQSRkAuZK5n33PasEPE9q9fjWhWnklzT14gPxUIvPhQSUGsmus+RdPNzE0JGKxjhSYK+1BT1xU4Q3uelrzAsrEN/5vhr4vW+d1n0tMbeWwcURMEmz+Isjmk4=
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
Subject: [PATCH 0/2] xen/arm: Creating base for future PDX changes
Date: Fri, 4 Jul 2025 09:54:26 +0200
Message-ID: <20250704075428.33485-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000F:EE_|IA1PR12MB6067:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b3c9013-eb3c-4339-e9ea-08ddbad00324
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?w136MDtBMkTVvNSe8DDrugaU7TBiDtO240j42o1YgCoGWVlimUHfjIJQeMP2?=
 =?us-ascii?Q?OAoTEunREy4m+aXlTyaSa2YArCj3k0rwWhuwGI7O7iilVU8KGoAaotl3n/jo?=
 =?us-ascii?Q?WbSacJBMdO4SAbyRceCydsASyCo6MTToVU8GUz+nnF9uTE9aYhXZw6gSbH4Z?=
 =?us-ascii?Q?NG9IvRZ6qS01FSfdh3H+OnS5qx4XGJ6DqWai0ZigFVmYw9zWakiszGRKcim8?=
 =?us-ascii?Q?snyAc5kdIw/xJRz3vDDVOd9YwVkFiBxSDotdBcCWgSnBz+wbiI7dNMCrEU+h?=
 =?us-ascii?Q?guIFOrS0uL2XM9qpPiD9PKIOkdWNVGp31WJVD+K983cYb82RSTs+QOQiQVHC?=
 =?us-ascii?Q?k4buaSBS90S8ikYrw9bNfqvbLFKxHCH68aYrChUnfRMVdzmoKBWd5mq4FtnB?=
 =?us-ascii?Q?GDzkKV7T/MYrrK7DDWetwTB0uRIrHJNsKYu/tj3BbUsrBfzV2BkZg43mqfTA?=
 =?us-ascii?Q?ChEGkUJ82YHqJqrT75Q2Uy/+1h6I/MpFeTeyWOMwSE2A1ccLW2xXLticBFCV?=
 =?us-ascii?Q?JDEfb9jkP96AQcUNcLv5mhAJMJ1HYXiQvgGAXGX6hWYPOVVKTDd/AV+rn4ot?=
 =?us-ascii?Q?YeUF5tvpdJOktwVlTtRCGvZS99J5VOYsaLEyl811H2zdehBkfNhA2MlNV1Vi?=
 =?us-ascii?Q?AadVGTaY0JU4k5Ra1tSTGe+M5AAjW4aEFnMrPsV6W1KxfakmcAaf6uCkF2LI?=
 =?us-ascii?Q?R5M0uQpo9Fal+xXvQA3r9La3ImqUWgphU/Mn1w6ksrJA5gqb0Jsunb0t91OE?=
 =?us-ascii?Q?viTZmp6roOrsnf3Tg7pb4m+GtmAV/pBhDZ6PAqJQOAlWCCdlpf0guka0p4Y0?=
 =?us-ascii?Q?G48mSogB/mkxA0h6xqgGZhMHus0KJGYxLi1ENedPoddOgH2ceq4+vaiS/Yxo?=
 =?us-ascii?Q?CGwlLw267KvpyKq8zGIqLu4wlYNOyO6z6sVgyX/S8StU4nVL4KzzjbDceDi3?=
 =?us-ascii?Q?ESsQ8Jv+B7Jc5AUiP2MJnf5hDpEFimbkz/Z0Keh09mmKvZ4+M5REen4BW8hf?=
 =?us-ascii?Q?aw20pMkPb9OYpDqUIoLbgRU85WRbsGjBKWfLnHq3z+WV6WTdOx7bpFiU9csH?=
 =?us-ascii?Q?KipQn6vHPOSto4hQ5Rj2Dz0eSBU7Tvh0RXWZaHf1m5Ve2xzkOHMdr8cB4xKO?=
 =?us-ascii?Q?AmPsyv29BBKYLBWqkViTKTida4BHnCUhn87C5C+ag/dyU0GSRaoqdocgWoFt?=
 =?us-ascii?Q?zJgR+E6NsHYIBRt7d8jV7FRQa+FKg8rA60oiQ9A7Fh736hntBO7fb1JbAd8q?=
 =?us-ascii?Q?7p8s5yfCUk33qerMxaQzLNK+ISchlx82gH2dEw3DaVLouOVebQaDh2QcxEp4?=
 =?us-ascii?Q?KhzvlocFN8N/CbQWijPUGPzb8eMUWPYG7Aat9HT6qTR7Zgr0cJ+vPkKqD8u5?=
 =?us-ascii?Q?fLpCMbQUOe97p5pH8mg6EsaxhiKLhGEuf+1L6Ejfx5Ju/MJVjwvZXKSfGmUk?=
 =?us-ascii?Q?vXogQkeYggOyjtg5K6lH5r9sW8eKw59ecDTpauXjS03JGgqV2+XHplBdqWhu?=
 =?us-ascii?Q?BwzGWZXcYXoZu7g=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 07:54:32.4675
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b3c9013-eb3c-4339-e9ea-08ddbad00324
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6067

Two small patches laying a base for future PDX changes. See discussion here:
https://lore.kernel.org/xen-devel/alpine.DEB.2.22.394.2507031103360.605088@ubuntu-linux-20-04-desktop/T/#m157f07f957bdad3d807ff53d05e75688a8ae6837

Michal Orzel (2):
  xen/arm64: Panic if direct map is too small
  xen/arm: Skip loops in init_pdx() when no PDX compression is used

 xen/arch/arm/arm32/mmu/mm.c |  1 -
 xen/arch/arm/arm64/mmu/mm.c |  4 +++-
 xen/arch/arm/setup.c        | 10 ++++++++--
 3 files changed, 11 insertions(+), 4 deletions(-)

-- 
2.25.1


