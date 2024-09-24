Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64923984080
	for <lists+xen-devel@lfdr.de>; Tue, 24 Sep 2024 10:29:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.802471.1212713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st0vS-0001LT-C1; Tue, 24 Sep 2024 08:29:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 802471.1212713; Tue, 24 Sep 2024 08:29:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1st0vS-0001Is-93; Tue, 24 Sep 2024 08:29:38 +0000
Received: by outflank-mailman (input) for mailman id 802471;
 Tue, 24 Sep 2024 08:29:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Xj2=QW=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1st0vR-0001Im-Ci
 for xen-devel@lists.xenproject.org; Tue, 24 Sep 2024 08:29:37 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20602.outbound.protection.outlook.com
 [2a01:111:f403:2415::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 20b95895-7a4f-11ef-99a2-01e77a169b0f;
 Tue, 24 Sep 2024 10:29:35 +0200 (CEST)
Received: from BN8PR07CA0006.namprd07.prod.outlook.com (2603:10b6:408:ac::19)
 by DM4PR12MB6280.namprd12.prod.outlook.com (2603:10b6:8:a2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.27; Tue, 24 Sep
 2024 08:29:30 +0000
Received: from MN1PEPF0000F0DE.namprd04.prod.outlook.com (2603:10b6:408:ac::4)
 by BN8PR07CA0006.outlook.office365.com (2603:10b6:408:ac::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7962.25 via Frontend Transport; Tue, 24 Sep 2024 08:29:30 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MN1PEPF0000F0DE.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8005.15 via Frontend Transport; Tue, 24 Sep 2024 08:29:30 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 24 Sep
 2024 03:29:29 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 24 Sep
 2024 03:29:29 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Tue, 24 Sep 2024 03:29:28 -0500
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
X-Inumbo-ID: 20b95895-7a4f-11ef-99a2-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r9KJDMmmWGtgEqodCs2W03DXlAHWH393OGrELxZvVixDGdnwlyw04vEPDO9lpga/lhp4vptVNuIFD/1KtKeUY023rlLhlxcH0WvMiFc6Y1kH27Re0gwfsJbkQPMrr2fyeOFRAYx2/+yedR1pMZeGjrP77zFScgq490vY0sC6+evqO1gfp3pzZLI0rDxOwsa0T1yDRxa1+LQF3Kt1N8auI7+aWt6kcNG4b5ioolk7qtVFqxAS10g7qIMARqvGl/R37LIFmorAeM1I0XANUMUvMQKgh1JqSN9kUCA2RZYdjE+dpmcJz8nSMVABjZBkWy/Gdtd0qpOz8pLbOyXhHyTCjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SpOLUaNzGFCTaVTTwD6i3Axw0ar9IW+hLBSqeIRCplo=;
 b=id9mlw+lSYvRAZrKy3G6YJzMhQdD/BizQ5o/tcoXlKPQeA5/2e80F5SMRC+X2e1V33XRZvYoIWswtQlIAYIVH+RKyPqsdA7ZC+Pj6R8vhs9drXpEaq+/tKRpZfyG7wXK1YA+OU853a2x3o/80aOqqmmUPlJJ3SQOcQMxJDqwiB1nb7sxBRO0kCTP+OdH9W+x56i9fHzx33A7MCIE3fuJl1ZyAUnfYOIo0fKAsqpXSPeIw6/8Q6Xc0XdlbDb+xWC8qX+baslvPJOQxH/ALganKJ9ArzzrZDbhIsSqbQ1bAZqKLn9FJn8tFE5p97J03RIdDJmgQSkZ4lgZozgOeMT3Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SpOLUaNzGFCTaVTTwD6i3Axw0ar9IW+hLBSqeIRCplo=;
 b=iYmB0r57kJXQ5XVRryWF5YjQicsxtFmpKKLqzR+Uqyxaf0/7Bt1Kdi6WbFQhMOrhpC6dDiiZoUIIuzs5TKtPZcNO8UdnW4IvgIYXs5l5FQzfN4bzCa8fYdVBAlgsLFN3GHBsP9BQQdJqXrf0Eoqp7aYlDaNSc6zC513Qts+WN1M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>, <michal.orzel@amd.com>,
	<ayan.kumar.halder@amd.com>
CC: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Artem Mygaiev <artem_mygaiev@epam.com>, "Hisao
 Munakata" <hisao.munakata.vt@renesas.com>, Julien Grall <jgrall@amazon.com>
Subject: [PATCH v4] docs: fusa: Add Assumption of Use (AOU)
Date: Tue, 24 Sep 2024 09:29:23 +0100
Message-ID: <20240924082923.1286023-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0DE:EE_|DM4PR12MB6280:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b530ed8-5800-49bb-c436-08dcdc73027e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PwqZjvu+DW6gt7PP4QwpIQIyMzeqfJVGfAXaPHIRmr7Vj8mOn9Hqh/2JEGB/?=
 =?us-ascii?Q?paQI7Ek4T2ICya+b2Xx8EU6K9/oOadQTZvA/aH9RSQ5g1d+dERZxLshqKPC8?=
 =?us-ascii?Q?E1jT6XAedIL6Dm5E60KmLtUyQzg6iQGaA+rfikiG5ITALeQyJxAq/Ef/B3q5?=
 =?us-ascii?Q?2lm0WA/VmQkXq+ar0qTcHL/fyjpALJwdXCgR8ATu0dP+3v41zD6ygpX4znpI?=
 =?us-ascii?Q?cx9Ffanyv9WJhPH6qaThAWoBscRANjDf5jpNaPqAe1/xwzWWOMXavpKwiW/7?=
 =?us-ascii?Q?ntYaUOrrvAYTcYtjZwayy2qYWTrpHyaYIBiNrjygfw/uAeiaLlkMB7mForts?=
 =?us-ascii?Q?+/YvaYp+iRa3TXcmPHAa6rGpQHft2EypDtbqPned2u6YcLuyNflSdLVwy/YX?=
 =?us-ascii?Q?PAc1W34vvXD1qdHGGc/H+Uf30jJvGrLuJX375quq726HKRJq0xl43HuVqCN+?=
 =?us-ascii?Q?4BhRM74zG199SXX4Ic+bSLsfqywrwmetIwl+65M0G7qiVO+Mtv1KZAT1oslz?=
 =?us-ascii?Q?cc68qN8BxbZrl457C8JdqC+hYYwSGbIXnBQMAlIJZ3JuSo/65igF4Fc5zS9z?=
 =?us-ascii?Q?k3xX5yB4IK7A7e09UM1sH02GLspVJWnFzuJwRmYHdJo57wWobQIRQtIkqnhV?=
 =?us-ascii?Q?tK6NNuuSgbhRQ5J1Hpje73uMObkH+vmB9LgHRF7ZoIxUXXX294mpjKE7P0fL?=
 =?us-ascii?Q?Mksy8xVbNS3lvQNIL1Fa+CuNlyvgOXU9Reb045qfcvAdiAigHT1iUb5MY6Ad?=
 =?us-ascii?Q?qOPxGuLbSCgdJayfxg/Nkaz7fa0eLJTuiuWj6HJ2nD4B9d1Vt+lvwf0+SiWd?=
 =?us-ascii?Q?zOra57utpFPC9tmWJ0avQSOtYZH8qx7vr+sM6z6l1AEpgFrxyAD3juDrNDyx?=
 =?us-ascii?Q?Aw8y7G8PfQGs+uumKx+ziUBX97RrbgBV2S5tZBsNgv19NkRjL9wa7ce5C4N5?=
 =?us-ascii?Q?DH7KO8bhdDhnVTxFI9ml6e413UL6DLyxHz0nYTJul5zQEGoM4YKy1W2PyMzk?=
 =?us-ascii?Q?OPpVKJxEIzWBZBUKrlQd5OSRwRQ8J2vwJ/rEagX4uZjjbnvvHdb3b+DWPPcd?=
 =?us-ascii?Q?VCI6tALt6Vz6uP2UqmAPr4Vd8z4+s/tnxh1rkd9R0Rl/dZrvQ5pmDlOgESlo?=
 =?us-ascii?Q?y1/Cm6fulyMrql9BkcXwON1PyhhHnu+iUcqoSiLQm42F5GeJL7zZS99zHN3C?=
 =?us-ascii?Q?Em0a9piMbOf55jq4DzpK2rzhA73JIdsAIszeKf3IfeNVyAwZLZNzESNFYbLT?=
 =?us-ascii?Q?S1kiLup5AGKvadcLb8DtgBkuWbbwm0BqR9UlYoRh3MvapS8uqNFj7HfmGe/R?=
 =?us-ascii?Q?vHxTDcq62rYQS3vl9kjE58Dv1kFhSmhUck5YJKe0zGjfBL13l7p77HLO3l9R?=
 =?us-ascii?Q?inksXpXirTBDCei5Kk9JJUt9fu2j?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2024 08:29:30.0042
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b530ed8-5800-49bb-c436-08dcdc73027e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000F0DE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6280

From: Michal Orzel <michal.orzel@amd.com>

AoU are the assumptions that Xen relies on other components (eg platform
platform, domains) to fulfill its requirements. In our case, platform means
a combination of hardware, firmware and bootloader.

We have defined AoU in the intro.rst and added AoU for the generic
timer.

Also, fixed a requirement to denote that Xen shall **not** expose the
system counter frequency via the "clock-frequency" device tree property.
The reason being the device tree documentation strongly discourages the
use of this peoperty. Further if the "clock-frequency" is exposed, then
it overrides the value programmed in the CNTFRQ_EL0 register.

So, the frequency shall be exposed via the CNTFRQ_EL0 register only and
consequently there is an assumption on the platform to program the
register correctly.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
---
Changes from :-

v1 - 1. Removed the part of requirement which states that Xen exposes the
frequency of the system timer by reading the "clock-frequency" property.

2. Added a rationale for AoU.

3. Reworded the AoU.

v2 - 1. Reworded the commit message. Added R-b.

v3 - 1. Fixed the definition of AoU.

2. Simplified the description of "Expose system timer frequency via register"
AoU.

 .../reqs/design-reqs/arm64/generic-timer.rst  | 24 ++++++++++++++++++-
 docs/fusa/reqs/intro.rst                      | 10 ++++++++
 2 files changed, 33 insertions(+), 1 deletion(-)

diff --git a/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst b/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst
index f2a0cd7fb8..9d2a5a8085 100644
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
+CNTFRQ_EL0 register shall be programmed with the value of the system timer
+frequency.
+
+Rationale:
+Xen reads the CNTFRQ_EL0 register to get the value of system timer frequency.
+
+Comments:
+While there is a provision to get this value by reading the "clock-frequency"
+dt property [2], the use of this property is strongly discouraged.
+
 Covers:
  - `XenProd~emulated_timer~1`
 
diff --git a/docs/fusa/reqs/intro.rst b/docs/fusa/reqs/intro.rst
index 245a219ff2..48f70edab5 100644
--- a/docs/fusa/reqs/intro.rst
+++ b/docs/fusa/reqs/intro.rst
@@ -38,6 +38,16 @@ The requirements are linked using OpenFastTrace
 OpenFastTrace parses through the requirements and generates a traceability
 report.
 
+Assumption of Use
+=================
+
+Xen is making several assumptions on the status of the platform or on some
+functions being present and functional. For example, Xen might assume that
+some registers are set.
+Anybody who wants to use Xen must validate that the platform it is used on
+(meaning the hardware and any software running before Xen like the firmware)
+fulfils all the AoU described by Xen.
+
 The following is the skeleton for a requirement.
 
 Title of the requirement
-- 
2.25.1


