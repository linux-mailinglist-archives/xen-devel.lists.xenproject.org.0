Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0238B998448
	for <lists+xen-devel@lfdr.de>; Thu, 10 Oct 2024 12:58:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.816002.1230181 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syqrr-0005iC-Iv; Thu, 10 Oct 2024 10:58:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 816002.1230181; Thu, 10 Oct 2024 10:58:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1syqrr-0005gY-Ee; Thu, 10 Oct 2024 10:58:03 +0000
Received: by outflank-mailman (input) for mailman id 816002;
 Thu, 10 Oct 2024 10:58:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Iugc=RG=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1syqrq-0005gQ-FZ
 for xen-devel@lists.xenproject.org; Thu, 10 Oct 2024 10:58:02 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on20612.outbound.protection.outlook.com
 [2a01:111:f403:2412::612])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 82f6a604-86f6-11ef-a0bd-8be0dac302b0;
 Thu, 10 Oct 2024 12:58:00 +0200 (CEST)
Received: from BN0PR03CA0050.namprd03.prod.outlook.com (2603:10b6:408:e7::25)
 by BL3PR12MB6473.namprd12.prod.outlook.com (2603:10b6:208:3b9::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18; Thu, 10 Oct
 2024 10:57:53 +0000
Received: from BL6PEPF00022573.namprd02.prod.outlook.com
 (2603:10b6:408:e7:cafe::c2) by BN0PR03CA0050.outlook.office365.com
 (2603:10b6:408:e7::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.18 via Frontend
 Transport; Thu, 10 Oct 2024 10:57:53 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF00022573.mail.protection.outlook.com (10.167.249.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8048.13 via Frontend Transport; Thu, 10 Oct 2024 10:57:52 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 10 Oct
 2024 05:57:52 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Thu, 10 Oct 2024 05:57:50 -0500
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
X-Inumbo-ID: 82f6a604-86f6-11ef-a0bd-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wjtiPnQLp7/3gMGlfhrbEAiax5QfdPAhe8Gpa0bwtgMMviJIAfkaIwSIw3zaf2tLqWEHSuud5YQVTLxDP4UBRlrSFOkiiFNsmYloF04r0XCzryoRLkE/UD1lWp5iY/HElyrhqxtZOTk6K5oIR4Q4REOzOaoEYLJPE5H9RchOYgxzjrguBCh0ZOcJtqiDLcRAX0mBxR9Pfb3gYrEoA4rE5DF2xQiyGB8O2hWa/D6VO9+TGL5c9pBOaPSii/2+/i07FPMnb85OevruqkQH6bPGZRHo7a7USGOzxwRz5syJJ+erkl90WYugtciX78dgUDPEQufj11t4k/myTvOaoCol9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OrlbRhj83Wr7IchgVfjRcw3TzeB81zfOCVGOsiy7A1k=;
 b=sb8dV0RlvtntiyJssdktFNIVW8o0XJatHuxArfYxHEcTlDJknC5hOVVwKCizufVfJRwTLuCkk3+xdcxlbk/KGvJkDMMOkPvhv62iVaLKCHP2VMhLI1+YIiIB2WfhkWE8vAgn8kShscD2AxNDtwge659Av+QhAMDdm/rs/CAwJEA42v7sWGvJVF9AfU4uAUn7MJn/iy5QUVygM/ADnp/lo2nVFK7YBcF673pV3o14njzyx/lWcy1H8baDQfS3BrNRjIYs6s5y7xtHeNsG6LPMbvsfPUVc2EKsp0Rekl19gTN0lTJtn9t5Ivi9XhjWDI0gfDxX3YsQxTojlOIi+qMtfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OrlbRhj83Wr7IchgVfjRcw3TzeB81zfOCVGOsiy7A1k=;
 b=R9xYdFuq3lwws9fOt7eDLe2raeoJvt/oYsyuhsApsfM8UrjouPPThCgB+qu796iQPSNd9KxOw5JD4igVDyrRcUMn2QMQilhVXzpLovDlO0fAVdO/kbQ8jddXlkAlEYzNVhPFoukBNRjaDN/gbW1856D1ytc3xf47pZpnSM2KmIc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, "Bertrand
 Marquis" <bertrand.marquis@arm.com>
Subject: [PATCH] device-tree: Move dt-overlay.c to common/device-tree/
Date: Thu, 10 Oct 2024 12:57:46 +0200
Message-ID: <20241010105746.140921-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022573:EE_|BL3PR12MB6473:EE_
X-MS-Office365-Filtering-Correlation-Id: 266a9484-e698-4951-8d47-08dce91a63b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rpzS59wogGkTFhBLrLJh7iObfWEIOiS6oSq4AUNQKCyPog6KR1Sc/ZCM05T0?=
 =?us-ascii?Q?pbkBm3MftYJCledPIHndG+GoTz8PRv4ruhMTBMtKDFZntEw3b/RjUY//HzyP?=
 =?us-ascii?Q?IWuLXMgW3+Y9a0Exnx/hrcG/lt1rFi2DqWzQwK3QY3jS3GVgEbLE3x1JBfID?=
 =?us-ascii?Q?QwjerTqO+KrKR2/iZS7pOOibT20Wn2H9djCk8dAkc+5OKJczQAJsTDOsJbvR?=
 =?us-ascii?Q?yTd3M7YumfJgEfvtWeKq2ykbnM/DOhv2dk1q6S5eM07II7w7qkC0iOz+bvAr?=
 =?us-ascii?Q?Oov7a8M3mSroo0wHWZowc2iv09EMkPBcdHJy9/xQCs/xR5ooQlwp2LvstKyi?=
 =?us-ascii?Q?fXdLTrrex1gUuxYgDEf2B2DY8tt4R03wbFsvM6FtOzXK3T86lpnSmudU6iZo?=
 =?us-ascii?Q?ZvOgxp0KIonzzdlyzs8Xb7T+b+y8A1udjZCre8rZXpt3K/HkfWentjm93yxK?=
 =?us-ascii?Q?OmPqjav6YL0cGANdC7MifbXyd5fRkwRTAPFGqqVcGuBcvqMNYiwEFK5dd3RV?=
 =?us-ascii?Q?uIT1zQuMxylAuc804JvGLA6iYy5ig4NENB4othvoq0kQsAI6OxH46WoJYfXv?=
 =?us-ascii?Q?FirB9txdfCZ2gRKm9EXZj1Got0c8zTynD/F2LzqDMFxCw44fWWNwOa3a+OdD?=
 =?us-ascii?Q?a5kHDk9W61NxrmxflG7St6lOul8IF9oAY74maBSUUQfg3S90znT7V7T6tQfI?=
 =?us-ascii?Q?ZpkOi+1ZUk/Oq7mXB2E+eIZx2YcUM8v6QhNVLLhpVAjO6nFWLyYSvrvnPrFh?=
 =?us-ascii?Q?fwKiu5WmeDErfp7ZIClSN/2xBIJOh84e/kFLqhgdExEkk3RDSoJGFduTUe8s?=
 =?us-ascii?Q?iBw0L/mv7kWlsvV+iL1NSbF3uQoDzAAtMq95rgcqR64zRwkiqTfWmEdE7G6s?=
 =?us-ascii?Q?3AFjSShiCPrpoRLRzFiWlpKbyC3+xce9BwwT0DYh+X922FI9qU4KDSIaVE3L?=
 =?us-ascii?Q?HgWFzV7H5/tNVoeDZkCaC85i2CFtDL85mr1CYAE+azP7LGW/GC4QcJ1dsMLc?=
 =?us-ascii?Q?DaNZ/oijXKPyLFRJchF8atKwc9R4ISzUjsu9dcwGdhvHg3z0ueg9p8HR/F1x?=
 =?us-ascii?Q?ItKSHu41R0YpVrhEIu2rpEO3XvPf8QJ1iQgAe+swtIKi+PGHQOFXYyoIytwG?=
 =?us-ascii?Q?to6vGvcorFS5m045hBjb9aP0Qxzigxf96qafVpgXh6bpW/nfn012Ntu9w96y?=
 =?us-ascii?Q?MKgNGzpoaS0dIzQA+9YzmgGq4MHE79hm9+jq27mrWEjAR4FqzauLoP+6Popb?=
 =?us-ascii?Q?sEVCvTPgZXiN+vIRGLP7wgRZvumI5girQ2r4XMfFUuKR61Wme5LfZbGNkxhL?=
 =?us-ascii?Q?wnB0iV29R1Rr1YGcHJHMuAFCRcRDVMXsv39hcetO9Jvl0/pQLWwAbz/p73Kk?=
 =?us-ascii?Q?khxAp6jCgiCye7UDwTcQvKqGfYnK?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2024 10:57:52.9141
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 266a9484-e698-4951-8d47-08dce91a63b0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022573.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6473

The code is DT specific and as such should be placed under common
directory for DT related files. Update MAINTAINERS file accordingly
and drop the line with a path from a top-level comment in dt-overlay.c.
It serves no purpose and requires being updated on every code movement.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
This patch is based on the already acked series (waiting to be committed):
https://lore.kernel.org/xen-devel/20241004122220.234817-1-michal.orzel@amd.com/T/
---
 MAINTAINERS                               | 1 -
 xen/common/Makefile                       | 1 -
 xen/common/device-tree/Makefile           | 1 +
 xen/common/{ => device-tree}/dt-overlay.c | 2 --
 4 files changed, 1 insertion(+), 4 deletions(-)
 rename xen/common/{ => device-tree}/dt-overlay.c (99%)

diff --git a/MAINTAINERS b/MAINTAINERS
index f68ddd7f84a5..3bba2c8c31ad 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -292,7 +292,6 @@ M:	Michal Orzel <michal.orzel@amd.com>
 S:	Supported
 F:	xen/common/libfdt/
 F:	xen/common/device-tree/
-F:	xen/common/dt-overlay.c
 F:	xen/include/xen/libfdt/
 F:	xen/include/xen/bootfdt.h
 F:	xen/include/xen/device_tree.h
diff --git a/xen/common/Makefile b/xen/common/Makefile
index f90bb00d23e5..8dec11544e35 100644
--- a/xen/common/Makefile
+++ b/xen/common/Makefile
@@ -9,7 +9,6 @@ obj-$(CONFIG_DEBUG_TRACE) += debugtrace.o
 obj-$(CONFIG_HAS_DEVICE_TREE) += device-tree/
 obj-$(CONFIG_IOREQ_SERVER) += dm.o
 obj-y += domain.o
-obj-$(CONFIG_OVERLAY_DTB) += dt-overlay.o
 obj-y += event_2l.o
 obj-y += event_channel.o
 obj-y += event_fifo.o
diff --git a/xen/common/device-tree/Makefile b/xen/common/device-tree/Makefile
index 990abd571acf..58052d074e62 100644
--- a/xen/common/device-tree/Makefile
+++ b/xen/common/device-tree/Makefile
@@ -1,3 +1,4 @@
 obj-y += bootfdt.init.o
 obj-y += bootinfo.init.o
 obj-y += device-tree.o
+obj-$(CONFIG_OVERLAY_DTB) += dt-overlay.o
diff --git a/xen/common/dt-overlay.c b/xen/common/device-tree/dt-overlay.c
similarity index 99%
rename from xen/common/dt-overlay.c
rename to xen/common/device-tree/dt-overlay.c
index 5ce00514ef14..97fb99eaaaf7 100644
--- a/xen/common/dt-overlay.c
+++ b/xen/common/device-tree/dt-overlay.c
@@ -1,7 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * xen/common/dt-overlay.c
- *
  * Device tree overlay support in Xen.
  *
  * Copyright (C) 2023, Advanced Micro Devices, Inc. All Rights Reserved.
-- 
2.25.1


