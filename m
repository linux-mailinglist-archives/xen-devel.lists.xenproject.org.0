Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A70CA7758
	for <lists+xen-devel@lfdr.de>; Fri, 05 Dec 2025 12:52:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1178805.1502526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRULR-0005Uv-D9; Fri, 05 Dec 2025 11:51:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1178805.1502526; Fri, 05 Dec 2025 11:51:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vRULR-0005TO-AI; Fri, 05 Dec 2025 11:51:29 +0000
Received: by outflank-mailman (input) for mailman id 1178805;
 Fri, 05 Dec 2025 11:51:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=itKe=6L=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1vRULP-00050w-Ca
 for xen-devel@lists.xenproject.org; Fri, 05 Dec 2025 11:51:27 +0000
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazlp170110009.outbound.protection.outlook.com
 [2a01:111:f403:c111::9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b2cf3960-d1d0-11f0-980a-7dc792cee155;
 Fri, 05 Dec 2025 12:51:14 +0100 (CET)
Received: from BLAPR05CA0019.namprd05.prod.outlook.com (2603:10b6:208:36e::24)
 by PH7PR12MB5782.namprd12.prod.outlook.com (2603:10b6:510:1d1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.11; Fri, 5 Dec
 2025 11:51:09 +0000
Received: from BL6PEPF0001AB52.namprd02.prod.outlook.com
 (2603:10b6:208:36e:cafe::c0) by BLAPR05CA0019.outlook.office365.com
 (2603:10b6:208:36e::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.4 via Frontend Transport; Fri, 5
 Dec 2025 11:51:04 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL6PEPF0001AB52.mail.protection.outlook.com (10.167.241.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Fri, 5 Dec 2025 11:51:07 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 5 Dec
 2025 05:51:06 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 satlexmb08.amd.com (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17
 via Frontend Transport; Fri, 5 Dec 2025 03:51:04 -0800
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
X-Inumbo-ID: b2cf3960-d1d0-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PovNNL7ENOxNMhLshTQp1mBZ49yD3LTR1PV4Wfs64ddfwuYneUwOFX2HQd9uCUzAw/83vle8eGiYdC6tL9IE3geKKDJe9Unyg4AGOYVh7kBPAOYwx26miYmMdcvGzuBawg0aBNDSuZWVpCKOfO1+qtbvC2AoxURHailhoVKFgitUXUIo6pXBSyA/5PWGiOu1QRws7zEhSl12vYhXkclQhPICkURNURRLlUAh5nBCVTDXWJbmWPqkQGFbi1TGWt27Y6kIV2xguH968NMr8FMzKI3/HQb7BQwum4qk24GcNG5PZwx3ayai1ayJkTuQ2AO0dC87Qtzc3ursislm5y3yMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SrWcFpcOodMhnL9R9IbJ7Knxkk4oOZA6UEWGOpHo8O4=;
 b=jzyoOmtDs78fAsPc2ikF26q0Vmk0UPMO1UMF6tVJ3NTL8nNoMMsmZA2AoetvWhaPv3k4dG+DyGHB9lOkKdp2vuijGL3OS7sHAmP5QgE1i5o7hYcPbhvRH+mLrTdWM9yIlFiLnsBlLg0sM8g4OwdWLsX7uDxqNL8lEO7domOn+6v6AmG4yicUYzFHNGqbyHgr9z44Sy6Sjl6cT+UQ1yUPc2m9HtjfPP+BxzFVBlbQz0tY2o841ZXEjSQVtcVlrBuJoXU4B5PAo/9B1+y1a5JOKPwJBb2AK3GHxfDFufH2HhTEegFOCfh9wniGb8iusm5PAB6e896o5SsQlo8Po5fFJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SrWcFpcOodMhnL9R9IbJ7Knxkk4oOZA6UEWGOpHo8O4=;
 b=a/nz8FTzXSdJa6EDjngkKnPcKShJJ9AqLigkIGnNYMq1o++xx9L4uXsHEtSHUJgNJLbzvba++jYEB1J4CRoi+2TTGjBrU6Zeb1NXYu8uojwnDUkjHJEIcRy8t4fj1ci+mW8KBeRrUKUMA/sy6B75/NDmLvirhsSTQHG71gy+VVM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, Juergen Gross <jgross@suse.com>
Subject: [PATCH 0/3] Fix MISRA regressions for new ARM64 configurations
Date: Fri, 5 Dec 2025 12:49:57 +0100
Message-ID: <20251205115000.49568-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB52:EE_|PH7PR12MB5782:EE_
X-MS-Office365-Filtering-Correlation-Id: 6075b5d8-8d00-46e8-7acb-08de33f49396
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?RvSMrzx/Kvq4Kt0ybD2pD3r/o0kwQON+Dn5Tc6ETcWtc2BrEIiWEuVDa5EHU?=
 =?us-ascii?Q?vMsb9pizQRBlpqa7JxfF/1vMg6EgROXZmHC9SGf/Co/NVnG1VELDGoJtM61A?=
 =?us-ascii?Q?v/Fh6FQrsoqNqjHLldLCURmIJW6aRJmBBpGouzfk+5CfRchpVBIXk4WwhKZH?=
 =?us-ascii?Q?qajcrqtKVXixt5YrYyBJq+N9NNaEaKiv0Vo/51euyRt6y1gkbsrrt1DgBxKq?=
 =?us-ascii?Q?jK1kFtEepSzYbMTmjCeQTk0PXVbMEQTZ1RpY9TgxjPLlzbYN6pG+ApC92TvJ?=
 =?us-ascii?Q?v2qwNr6Zprs/fPSLCuznxbb88hNjy8q/5XgN36R9RnHGquveiEJ+2kOz7ySG?=
 =?us-ascii?Q?tDa2jXO00iYkcBppBLxcl9shp1PzTpJxhy+lAam633MdKQ3vuynFsPTnlKVn?=
 =?us-ascii?Q?LVJTP+/XE5nhtsGpw+3mius/qi1Zj9d0uRHMGdOmYoPi0orsYYGhhQwEzx8I?=
 =?us-ascii?Q?vnYc0VOFWIkGZxyi8tPULRjmT/yN0Q2JiJV5RSRb9lyhgqhlnHRZf3A8KhZW?=
 =?us-ascii?Q?LerIvdxUaX76oNkmddDvk2Sz6tiK685CUu6ThKjPzc7yop1dU92qqyaR0iS4?=
 =?us-ascii?Q?meyj8MvszaAlBLp/gnLygMDtIFDoT/cTmTtb4KbpsFJIVzpYuTmZ7v9K1wcl?=
 =?us-ascii?Q?IszW1BJi0lY0CAng8lVep5Bgtiws9XWiCVtWoztvfKODYsC5IZEj0drNVXfH?=
 =?us-ascii?Q?/LiFX6SqA8xW/QIBKrvBtNOt7oRGr1MtgYxgK1VlJfbeZ6VnVMFJ1QTHaeJZ?=
 =?us-ascii?Q?H2wSzRUaEmvGGVTnt/ZR5KzkTomE0rNm307RpbfQEZ4WIhGIsGxdA41iJYs5?=
 =?us-ascii?Q?uZ7BpG6gBsrICgskKAJWvMQzqYrdyeAqw6l3IBeKoeaMA5F5fLjG7E28UPVq?=
 =?us-ascii?Q?tviLwG6n4laIC0K2hFV1XSf9/bmOWw1NNQ4tprgaffx/kPppkDK6kLD7sjCV?=
 =?us-ascii?Q?TGlgcGqY7AfgYi7VO+QAZl3m6zAmxEyjcFiZYl88sOKFZumkZQ0wDPXYQ5s3?=
 =?us-ascii?Q?DBwWoIT/1BGQO8sR4E56FJMtVWVVdFSsTj7ccvC9aLFOsrjJLrgMDfo1Ktwj?=
 =?us-ascii?Q?DXB7ZkRuZntCFj1uWrXKRW0i8r0Oij8Y1V69Rtt/TaUercFnpDVs2YCsrrla?=
 =?us-ascii?Q?wR4CdpyIB+c1GAgNSUzJRcZml8ez2rNp73er2+iJcGHYogxeb2RzhCfDOPCo?=
 =?us-ascii?Q?kZuXaGhmdIAP0j1t0UkvrqICRc2sOf7YqvwmAxenaPc/HoexRpfMYeRYWdiS?=
 =?us-ascii?Q?y0W1ooS7aYWdxlSOyC/YrC6EIH/XeGFvjx/YUhUw1mfYRyI1CrdOLa1ryfX9?=
 =?us-ascii?Q?4RzsSKdMWlkD8im04fI3IVCovA+Tu8aHcxBBLiUYElDNp83/t+xG4LZ6hoOV?=
 =?us-ascii?Q?QBCq0F+yC/B0fDGdbWokJgKDUGM6uiivq4/qZn6XpGAPWxSE7WUa1jv6EO1F?=
 =?us-ascii?Q?bDotNbb4UZki95c8avfE1TZC/XZCXzij/EnV+rUchBCnDfbXlr4AcLHDnWxS?=
 =?us-ascii?Q?vEn+8PMFC6ChrLjLOH6BHaS2kVRqGmDuN4PROUw4k5mAzMAQLckTVeUj10rx?=
 =?us-ascii?Q?/u+OqhwnkpUcRMDBStA=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 11:51:07.3974
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6075b5d8-8d00-46e8-7acb-08de33f49396
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0001AB52.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5782

After addition of new eclair scans for other configurations like defconfig,
some regressions for clean rules were reported. This series focuses on report
generated for ARM64 and gets rid of all the regressions.

Diff:
eclair-ARM64{-testing}: was 22 regressions, now 0
eclair-x86_64{-testing}: was 359 regressions, now 337

https://gitlab.com/xen-project/people/morzel/xen/-/pipelines/2197932219

Michal Orzel (3):
  public/trace: Add U suffix to TRC_PV_HYPERCALL_V2_ARG_MASK
  common/kernel: Rename hypfs "params" variable
  xen/hypfs: Enclose HYPFS_DIR_INIT var parameter in parentheses

 xen/common/kernel.c        | 6 +++---
 xen/include/public/trace.h | 2 +-
 xen/include/xen/hypfs.h    | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

-- 
2.43.0


