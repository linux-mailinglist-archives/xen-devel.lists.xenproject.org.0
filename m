Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B94AABCA0
	for <lists+xen-devel@lfdr.de>; Tue,  6 May 2025 10:09:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.976719.1363865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCDLW-0007fz-UC; Tue, 06 May 2025 08:08:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 976719.1363865; Tue, 06 May 2025 08:08:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uCDLW-0007dl-RZ; Tue, 06 May 2025 08:08:10 +0000
Received: by outflank-mailman (input) for mailman id 976719;
 Tue, 06 May 2025 08:08:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bva9=XW=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1uCDLV-0007de-0R
 for xen-devel@lists.xenproject.org; Tue, 06 May 2025 08:08:09 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20624.outbound.protection.outlook.com
 [2a01:111:f403:2416::624])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3d54f7d8-2a51-11f0-9eb4-5ba50f476ded;
 Tue, 06 May 2025 10:08:07 +0200 (CEST)
Received: from BN6PR17CA0047.namprd17.prod.outlook.com (2603:10b6:405:75::36)
 by MW5PR12MB5649.namprd12.prod.outlook.com (2603:10b6:303:19d::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Tue, 6 May
 2025 08:07:56 +0000
Received: from BN2PEPF000044A4.namprd02.prod.outlook.com
 (2603:10b6:405:75:cafe::b9) by BN6PR17CA0047.outlook.office365.com
 (2603:10b6:405:75::36) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.29 via Frontend Transport; Tue,
 6 May 2025 08:07:56 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN2PEPF000044A4.mail.protection.outlook.com (10.167.243.155) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Tue, 6 May 2025 08:07:55 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 6 May
 2025 03:07:55 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 6 May
 2025 03:07:54 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39
 via Frontend Transport; Tue, 6 May 2025 03:07:53 -0500
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
X-Inumbo-ID: 3d54f7d8-2a51-11f0-9eb4-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q2M1IYxMoMwfeClqAboUuEFXf0mjFPU+nH6pkTz5Rd8OIggVQVXd6ycZCBAYCn3zG1V2ekcQqKPktV9dTtoa2wCmcN9ETie4M6cj/HuB41RxmMgrlBXRqGPEpRR1WveehPPHpNBfKtuUv2isFgRtmjdeqpGxxpF8NOQGXnEa58I9c9t1Lks1txwx+npwH0y9Mvy6oFjk8+7NU0u2OmLBSZ1QXMsIzkML/xn7R3NuIO/D69ZnXlWgG1dJndZKTf9yYa4pPYjdwxj+tPy1gF6bHypGF8jpMJ/FrkFXRaQoUWIFbSWX3X5GUrzpusUALzXedf7rPV3ArGvgVRJU28KLOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ILS/hC1n3y4E0velyOtlWSjEyWQphmIDe8wp9R6jOE=;
 b=kf0U6uHO2CyVstKelXW9V5/DThVrL+wwXC7EZAZndi/mi75XjJRp3zmYvJDFyPWBXn6BeXBV2D1gIavLUz3jAs33sjj/PNPVSucRMs8MnNKVTa3H1Ywh+e7JKjiHsKFjP/9xYjHMLkCsegPeGAOM+obijwYKDDq1RH24lTW8dOlkeZgBXgaX3EV7bdBvFFPBye5uqPdabFCpOZhcm72PTUNxdePpNN1Mul5cuNB28t7u24ed9tytWJ7Hrn+FtNI4voU6ioZRNNV7HMeC9zUX1wa4QZueOW0vWvAh5rHXM4yLEuaZfYL27wJ5SDw4422IzGTEek15xGWmMn0NWUJWYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ILS/hC1n3y4E0velyOtlWSjEyWQphmIDe8wp9R6jOE=;
 b=TuBG973LO0eZ2jY10X6unhpAgHZZe/hg+qMagZhkazEm/Kd036yefUAU3zDyf/OlkfCDzh/N75rUV91FXBoKpq0sTcyYnlkxPijLemAQW4+Ah2GfyiOHCDsRPeJeyn347NdGUy1yyjZXl5HyD68kolkpPDmnB6KztHM9PznLArk=
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
	<bertrand.marquis@arm.com>
Subject: [PATCH] device-tree: Add missing SPDX identifiers and EMACS comment blocks
Date: Tue, 6 May 2025 10:07:52 +0200
Message-ID: <20250506080752.23307-1-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: michal.orzel@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A4:EE_|MW5PR12MB5649:EE_
X-MS-Office365-Filtering-Correlation-Id: c6d9aeda-178a-4ea9-ff2a-08dd8c751b74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VqyR1kQrjuDsmWm55ZL9F4dxvsMf7tEY5iA6a3MASLJ6/+9nAsgdqILt1xon?=
 =?us-ascii?Q?acjSmycOBfugrKiViTQ2A3b+/JnIz5YvKHPEGUeCZW0Sj/oLB0KiJCQTD9iz?=
 =?us-ascii?Q?ZPZ8PASTm4oOeTZp0aCmHzCFyHtizuScbzq6mwbgl85qbC6rv9kyzDYmVIsw?=
 =?us-ascii?Q?spV+H8Atyr5vVhnnjrh/uw1gtLFBjtm/T9tzSybsSBzyDEBQx9xw7vlK4Ubk?=
 =?us-ascii?Q?O1j6rAAQV3Ti2QJKQ18S4sYD2kFEhQEEEGZnVtB7xzxOIh27Q7JqPqkwFHhi?=
 =?us-ascii?Q?iWid0UiNw4PsaeTOf6SIQZUhPSqJ9VxiNAJpjgmCYKrGIMzboPBapCgE4ujc?=
 =?us-ascii?Q?32UTj5i4U9VG8988E0O/w4EYBFfcIb9Z/7lMTJvc/jS1auIO78BT+4X5/pD/?=
 =?us-ascii?Q?31xCgT4Y6UogkSvxeFmMgF2RA3w7QjWVKYGzX0Jn164kDgR2hxPRp1Bgt5Yo?=
 =?us-ascii?Q?/TB3yBHvIk4LY2nSgz7BnVoXR1GkYT2/ZEpzMy5Cz3vvu6n1h+Z/hrKGMZdy?=
 =?us-ascii?Q?00DJg7hAnvWoDw7Pl8wwWOSKTbQ2f9DOeqm4xWlqJL02Av54TsbXKtMnqN8Y?=
 =?us-ascii?Q?l1AP4CK9PaNMii7REJKM06h2PozwpRjGvoDWKW8bKq21suJq9QwdEM1Am7PJ?=
 =?us-ascii?Q?nNDQV/jfUua6uE/glG2JPqD9ykbUTY55sV9wOWjfPC91eZsemz4bOGzYS3qb?=
 =?us-ascii?Q?mBPg6AoUqt1nJHLxZyRXfppX8jgj6pmbRRORg3YOi5DG2xoh2ds1AkLJE48K?=
 =?us-ascii?Q?PcGUWWrRuvlOlCscgONG1Mr1YqS4QSRgInH1A7ekgvwp61Y7tcVnACKyvBcH?=
 =?us-ascii?Q?VidzwPvz5IbDoO51Hj/txCO2RjvCucDu8MTD+lR9aFQqe3SfHDaNCcuVctvg?=
 =?us-ascii?Q?K0OAUUqPz0cF6m9SODpDyUFiwPkc5bPMCWibZoDW37OIJGJaHQhWUfKVJkzV?=
 =?us-ascii?Q?zwNwowxA5lhXjPvQ1NQ5F6lTfNNnbTv6fRca9osfIJ363q8zamP4oMsuaEa8?=
 =?us-ascii?Q?MM66Ms0zNGCD5ejJoVfpuL0g1VP31eqZd0diMi1XmIYgkuMUeePwSi0dYaUl?=
 =?us-ascii?Q?20wSenXyuBk1EhtdMfSwV2xE9CfomUnx+lm97Ac4TWFzo68eVyNE3OAB5uIZ?=
 =?us-ascii?Q?c17wATVmUXCmmBQe7MrgSP/cUnwoFaEpKEwBy6n4JitCobkD8i8j/N2LLTsE?=
 =?us-ascii?Q?Q8H1XKAxANiOG/QlQ/IsJV1MLH/J4XvhF/L/6LIz5IQj7IoJSRRYLeWQWu6q?=
 =?us-ascii?Q?ZNBm5Jci0guHS+LK3dmsmFsEbphzEb1EQ76qsFlimaPAH6mw4GQHcxTV0AfE?=
 =?us-ascii?Q?Y+Mk4xQG0NzsDg3CSDpJgXYhxTYuCFtcxeAm4DJFKHqhR0bZHlaq5d6/EFeE?=
 =?us-ascii?Q?uYD4UQsWlYPpDljqgLdcCiae0XMUJcH4k+oOEoo35hQB0fVhXI86yzZVafUd?=
 =?us-ascii?Q?lMHh0679PfwiPFFZA0qU9i1odCZvvFd6Mi17zpHhKKnPy0sJXVbNZcVJOlHh?=
 =?us-ascii?Q?6y0XBeZxp1i7Zm1P0V9SWNgwSa2bpJWo2x4P?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2025 08:07:55.5744
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6d9aeda-178a-4ea9-ff2a-08dd8c751b74
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5649

Use the same license as the files from which the code originated during
recent code movements. Take the opportunity to add SPDX identifier for
device-tree.c and remove the license text.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
This is mostly fixing files added recently by Oleksii.
---
 xen/common/device-tree/device-tree.c  |  5 +----
 xen/common/device-tree/domain-build.c | 11 +++++++++++
 xen/common/device-tree/kernel.c       | 11 +++++++++++
 3 files changed, 23 insertions(+), 4 deletions(-)

diff --git a/xen/common/device-tree/device-tree.c b/xen/common/device-tree/device-tree.c
index 90fee2ba0315..886e6c7712de 100644
--- a/xen/common/device-tree/device-tree.c
+++ b/xen/common/device-tree/device-tree.c
@@ -1,13 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * Device Tree
  *
  * Copyright (C) 2012 Citrix Systems, Inc.
  * Copyright 2009 Benjamin Herrenschmidt, IBM Corp
  * benh@kernel.crashing.org
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License version 2 as
- * published by the Free Software Foundation.
  */
 
 #include <xen/types.h>
diff --git a/xen/common/device-tree/domain-build.c b/xen/common/device-tree/domain-build.c
index 762b63e2b00a..3d7fc7a19ef6 100644
--- a/xen/common/device-tree/domain-build.c
+++ b/xen/common/device-tree/domain-build.c
@@ -1,3 +1,5 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
 #include <xen/bootfdt.h>
 #include <xen/fdt-domain-build.h>
 #include <xen/init.h>
@@ -393,3 +395,12 @@ void __init initrd_load(struct kernel_info *kinfo,
 
     iounmap(initrd);
 }
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
diff --git a/xen/common/device-tree/kernel.c b/xen/common/device-tree/kernel.c
index 1bf3bbf64eae..cb04cd9d5014 100644
--- a/xen/common/device-tree/kernel.c
+++ b/xen/common/device-tree/kernel.c
@@ -1,3 +1,5 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
 #include <xen/bootfdt.h>
 #include <xen/device_tree.h>
 #include <xen/fdt-kernel.h>
@@ -240,3 +242,12 @@ void __init kernel_load(struct kernel_info *info)
 
     info->load(info);
 }
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.25.1


