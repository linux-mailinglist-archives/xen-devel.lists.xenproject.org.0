Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5363A974EF5
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2024 11:45:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.796327.1205856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soJuP-0005MV-2s; Wed, 11 Sep 2024 09:45:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 796327.1205856; Wed, 11 Sep 2024 09:45:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soJuO-0005KY-V6; Wed, 11 Sep 2024 09:45:08 +0000
Received: by outflank-mailman (input) for mailman id 796327;
 Wed, 11 Sep 2024 09:45:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6AyE=QJ=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1soJuN-0005KS-MV
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2024 09:45:07 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20629.outbound.protection.outlook.com
 [2a01:111:f403:2414::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8560439b-7022-11ef-99a1-01e77a169b0f;
 Wed, 11 Sep 2024 11:45:04 +0200 (CEST)
Received: from BN0PR02CA0025.namprd02.prod.outlook.com (2603:10b6:408:e4::30)
 by IA1PR12MB8493.namprd12.prod.outlook.com (2603:10b6:208:447::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Wed, 11 Sep
 2024 09:45:00 +0000
Received: from MN1PEPF0000ECDA.namprd02.prod.outlook.com
 (2603:10b6:408:e4:cafe::61) by BN0PR02CA0025.outlook.office365.com
 (2603:10b6:408:e4::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24 via Frontend
 Transport; Wed, 11 Sep 2024 09:45:00 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000ECDA.mail.protection.outlook.com (10.167.242.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Wed, 11 Sep 2024 09:44:59 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 11 Sep
 2024 04:44:59 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Wed, 11 Sep 2024 04:44:58 -0500
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
X-Inumbo-ID: 8560439b-7022-11ef-99a1-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f3RWe38lsCOJbzg2pO2Njo/+cg5xR7LnpaDffxBMec4EBj2OOfz0BmN9YU5DzAdtbMheKEdCXaHLYrOGtl0aNUuTnXMcLqt1Zxxr/wKgNIc8Gt4SrdBGfe0ib5tnN9E6JdVF5/cuB0+1xakVQUucwKZLYCB0+f7VvJB912SwygGKDLVzXJWqReFh36qVjq5wzyMxj5Na7t7G+lJoj9sj69X0I08zeDU5VhnmcPvl2yL+RvF4SY3tpIGKHqpRytUWjqfXt9ftC/n7HLs+1ESSe46zQ1jxB0GdI2uVYWGDDHnB+h7aklALgWk7Ej6eOQEipNH02k8RZnqgZ2vMWLTNsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LML8P+bgEeNgk7CDWn6yEmBnV9nLoaqMd2IDtwTDfc0=;
 b=H5cT2+Z2IS219fbvL62X0pqwDfkI9/c/B0iWgerhrApeEocH7kNdPNA4RZLkk0hcfcvEqKa2S9+Z0V3aNF2IZ4AyrevWdBW91e5MioLmpK6CLgoxSVzLrgYIoKfRdvBTpLMbeDzwnRAi24YwSFLTIwU7FEPeFJd/17LJwVJ38SKEAVE72n06Y3RsNfeRF+RhonDOmwP5oX376vSA/AWiQ6R+KiRbC5X7BUsrPEkzLwDPy9qSeMze2tIYu2M+NYWlz3NOKjHLXNpBdXIkVaDQKlZFCFroxXiSmVmOqGHTUWahHCZ6YSzhHRH5veEzVUKVL/9RVbyw5jJPpxNyyZhC0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LML8P+bgEeNgk7CDWn6yEmBnV9nLoaqMd2IDtwTDfc0=;
 b=K6qn1p4xW/DiHpLE57WpFaeLlMzVG4MRcExWMK9cylqK+gG42R9KuN3UFOL6wKo5QawvD2o91O2ndz5lQbzSermCqwBuGnhiOW49lww5Epo/PeL8eP1Y0qa0XTI7/gJZNIyXrNx/5XKXJ/a3yrwLHlwLNAUFVs+TeBAypwmyTH0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Ayan
 Kumar Halder" <ayan.kumar.halder@amd.com>, Artem Mygaiev
	<artem_mygaiev@epam.com>, Hisao Munakata <hisao.munakata.vt@renesas.com>,
	Julien Grall <julien@xen.org>
Subject: [PATCH v2] docs: fusa: Add Assumption of Use (AoU)
Date: Wed, 11 Sep 2024 10:44:56 +0100
Message-ID: <20240911094456.2156647-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECDA:EE_|IA1PR12MB8493:EE_
X-MS-Office365-Filtering-Correlation-Id: c2581e1c-16c7-4180-5c1e-08dcd2466705
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?nIsHZtG2C98KG5zmd9wjd1Pgo7ZbkP7EApNe7UBFn8KQ5qi82ue87qDsoKGr?=
 =?us-ascii?Q?FX5CDF7bcUONByeDYj3p7xDFBJrycZqJAOHCyJx/dmqae+QWlRDnFMLGmqvJ?=
 =?us-ascii?Q?xlOPU9zKmGEC47LXt/gliKqr4gzxLQn3fyyTWBc9txGO4HnI1/dOzmv5gECh?=
 =?us-ascii?Q?YOrsUviDTnyLZrlSfZ/8SoQquqh+75KDKBIKzy4A58Yob1QEYTSy+FDYY/kb?=
 =?us-ascii?Q?VHu83ZQcw18BKx+QANx+VJB/ARaGICDW9iAzLcBvZCPBzDDhkcIhqeu0JApP?=
 =?us-ascii?Q?ezvZ8WYB5TZt+wvycKHjTrzs5XF+4A8RqbJq4gbS95sKjX/Pf3GivHtbW5H1?=
 =?us-ascii?Q?WbaRI+U2ExALb9GHWVfljMR3uAEpDe5Ml0i7Rdxrh5cL7I2ylcNB8ka7ubQN?=
 =?us-ascii?Q?SZA/3lcU+ORKsGGsyRxDX6Hk651oK/wtr4BtobC8v8I3D+YdXK+NCSYCrTyW?=
 =?us-ascii?Q?zw2D0KABNVdHOL9kXHMQpDwOXN3IqxQAnIRfMl6uHJIloXP8rdrRfaPronxd?=
 =?us-ascii?Q?A7erJcSOopc6Qd18t4bXuNT+quBBiH5MND1Y4pA3/GrlNSZydkEZtF+XsaSt?=
 =?us-ascii?Q?iC8xI1KGpRf01h5bLiJ7U+d/3twn/ltrknuRKrrLIr05YZObedVTlK1XaOZD?=
 =?us-ascii?Q?9Oe/sUDIQMJq4cugxGQqwJz7sqNrwS/TPlOBxd+O4ozIIQi70mgnDlrn/qvb?=
 =?us-ascii?Q?CpHaSarSO7qiDRlAm0putLc7Ma++pY4lnoHcWsAvnAQE3eD2kMxHdPDa9+OY?=
 =?us-ascii?Q?Ov4YD/CeARg5ujoyHVca192BTzV/ygYaRjNUWSpJNbqL2OIP6/9WXm1Kf9m5?=
 =?us-ascii?Q?WdfdRdFQfOyemUY0QDrYXOJ6/V02+kYLnT8K362xm950OLk0OoFJgsp9/ivh?=
 =?us-ascii?Q?pDEEL7lq/VYO2S0NG+TSC6Nck1UcIpNVefBvAwAsrWP5qezGYOTaXl8BBnVr?=
 =?us-ascii?Q?ANnLV1VYVn/Rt1PRfJ/QlCIQ+mFj40Kkc03ORKe0D0XsIouMNwh4mLjB1Rc1?=
 =?us-ascii?Q?lpSP/utp7fIc+jWKnjst1DlyybuKC5s+4wOVGUnyW7y4c4NXBksDD1crsFbr?=
 =?us-ascii?Q?amtRni1OzTnHBIHcyMPG0vtuRPeLbJuewNKtbdh56RUM14vbqdKnlCIY/oRH?=
 =?us-ascii?Q?mXkid6tahiqWzdoMiuULVy2WdluHkjDiErrGNo36+JZ9W94auRNxoad7osQa?=
 =?us-ascii?Q?OfntCium29YI6ksUhHeAGjKuqOtloNqAaFYyD4BVFC4i5eM9+p5326nYyr8z?=
 =?us-ascii?Q?IOcqGwX7kTkiQUz1h+m8MxS0/DiA4VAXMjplKCmtfzipGOIKLxoEimJTZ8+a?=
 =?us-ascii?Q?MkCMXK0UxU7KtkUMgaSWUIb3HVClCXWN8/ilLjSXvMmLzYvdtYOJtgX72BaF?=
 =?us-ascii?Q?crT0gHDvFmIbmI+BUGLursA8G6dIrWN0LgMe9VQBnig0ID7Y0qfT1IRfdglP?=
 =?us-ascii?Q?X7Iprrnqdg5URkLcF/KA32kXI2gk1r8G?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 09:44:59.7090
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c2581e1c-16c7-4180-5c1e-08dcd2466705
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECDA.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8493

From: Michal Orzel <michal.orzel@amd.com>

AoU are the assumptions Xen relies on other components (eg platform, domains)
to fulfill its requirements. In our case, platform means a combination of
hardware, firmware and bootloader.

We have defined AoU in the intro.rst and added AoU for the generic timer.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
Changes from :-

v1 - 1. Removed the part of requirement which states that Xen exposes the
frequency of the system timer by reading the "clock-frequency" property.

2. Added a rationale for AoU.

3. Reworded the AoU.

 .../reqs/design-reqs/arm64/generic-timer.rst  | 24 ++++++++++++++++++-
 docs/fusa/reqs/intro.rst                      | 10 ++++++++
 2 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst b/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst
index f2a0cd7fb8..86d84a3c40 100644
--- a/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst
+++ b/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst
@@ -30,7 +30,7 @@ Read system counter frequency
 
 Description:
 Xen shall expose the frequency of the system counter to the domains in
-CNTFRQ_EL0 register and/or domain device tree's "clock-frequency" property.
+CNTFRQ_EL0 register.
 
 Rationale:
 
@@ -116,6 +116,28 @@ Rationale:
 
 Comments:
 
+Covers:
+ - `XenProd~emulated_timer~1`
+
+Assumption of Use on the Platform
+=================================
+
+Expose system timer frequency via register
+------------------------------------------
+
+`XenSwdgn~arm64_generic_timer_plat_program_cntfrq_el0~1`
+
+Description:
+Underlying platform shall program CNTFRQ_EL0 register with the value of system
+timer frequency.
+
+Rationale:
+Xen reads the CNTFRQ_EL0 register to get the value of system timer frequency.
+While there is a provision to get this value by reading the "clock-frequency"
+dt property [2], the use of this property is strongly discouraged.
+
+Comments:
+
 Covers:
  - `XenProd~emulated_timer~1`
 
diff --git a/docs/fusa/reqs/intro.rst b/docs/fusa/reqs/intro.rst
index 245a219ff2..aa85ff821c 100644
--- a/docs/fusa/reqs/intro.rst
+++ b/docs/fusa/reqs/intro.rst
@@ -38,6 +38,16 @@ The requirements are linked using OpenFastTrace
 OpenFastTrace parses through the requirements and generates a traceability
 report.
 
+Assumption of Use
+=================
+
+To fulfill one or more design requirements, there may be underlying assumptions
+on one or more components that Xen interacts with directly or indirectly. For
+eg, there may be assumptions on the underlying platform (hardware + firmware +
+bootloader) to set certain registers, etc. The important thing here is that
+anyone who validates these requirements, need to consider the assumption on the
+other components.
+
 The following is the skeleton for a requirement.
 
 Title of the requirement
-- 
2.25.1


