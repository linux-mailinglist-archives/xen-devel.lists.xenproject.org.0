Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BDC96F121
	for <lists+xen-devel@lfdr.de>; Fri,  6 Sep 2024 12:14:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.791676.1201621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smVyB-0005fV-5J; Fri, 06 Sep 2024 10:13:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 791676.1201621; Fri, 06 Sep 2024 10:13:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1smVyB-0005dX-2E; Fri, 06 Sep 2024 10:13:35 +0000
Received: by outflank-mailman (input) for mailman id 791676;
 Fri, 06 Sep 2024 10:13:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MdYt=QE=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1smVy9-0005dR-O6
 for xen-devel@lists.xenproject.org; Fri, 06 Sep 2024 10:13:33 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20631.outbound.protection.outlook.com
 [2a01:111:f403:2416::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aa1c5e38-6c38-11ef-99a1-01e77a169b0f;
 Fri, 06 Sep 2024 12:13:31 +0200 (CEST)
Received: from PH7PR10CA0018.namprd10.prod.outlook.com (2603:10b6:510:23d::15)
 by SA1PR12MB8888.namprd12.prod.outlook.com (2603:10b6:806:38a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Fri, 6 Sep
 2024 10:13:25 +0000
Received: from CY4PEPF0000EDD6.namprd03.prod.outlook.com
 (2603:10b6:510:23d:cafe::2d) by PH7PR10CA0018.outlook.office365.com
 (2603:10b6:510:23d::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.18 via Frontend
 Transport; Fri, 6 Sep 2024 10:13:25 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EDD6.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Fri, 6 Sep 2024 10:13:24 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 6 Sep
 2024 05:13:23 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Fri, 6 Sep 2024 05:13:23 -0500
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
X-Inumbo-ID: aa1c5e38-6c38-11ef-99a1-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YHxh0GGtj89BWTC01FkrTzvK7bSo4l4wJiESfJgpTtsTt/gg/Cx1BB5HAQR8IEWfFl4AIcOxJQZCrTP87HlZLj3CG0Sfzl473bfZq2YfPpcsES2IUPT26vOkT2N8/mwX064rsaa3ZL6XIjjPy0CyfeqvpI+vgP2vSTLBCsgZu4emY6Yx+WHvNMCK66bjuHeBi8tPMrdKiTor9/M9dGld0TyYtOGSo4uZ9BGnSY8Xl8t0J5vVho5lUj0kQgp6ZRdM/OjRTJtdDFYbs1PcObOGJ/Bu60IzFJCXQlMhMjisp5MEEazZ2t+uMQxLubsmXuSzjR45fNk4ryLqE5kqq62+aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oG5vCAN2wpzafd+FPmGk4LRhs9L3qL3e+Xxkqwi64tY=;
 b=t2bqmsl1qm+BMuBhHgViiT3GZkOLd+SBCh4FDOmtNKYzifOVlHUsQ/lbic7yDcaPVax4d7f3Bh/0VwCNNoB8/aAIk3+VgeVeix5tRxdRM1xRUKZc/uCdkar3j7lmrxX/9HAKCf70/2kY39PmDwNEjtt+Mpe8K5y9K1PrZ0vF9ZkuCN96/iRHG4LXLAGN+dV4t/lIdZ6LGhGUkY4WRmBHtz8ZYj7EHIOmFnAYlTsClYISSOvG7Cb+1LJwzsuGeHhv96BXX8K08LPQeUGbxYG1WLQ5b6/Ps5u3LTrBr9DKmHq1dhavKvliWv6obkRjtOhstODOriwifKR2r3G4dY4Ijw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oG5vCAN2wpzafd+FPmGk4LRhs9L3qL3e+Xxkqwi64tY=;
 b=ek4PyQRWAjOlt/0ulEl/i6LryAavZrgZQ2k2BXwuUCQnMwY6DiMCBMBIiI0WDcYnHqCwRhZ13Usrm4Eg0DTxQDndsOyDKpUJsLd9aD8+XpJIp20t+4lus0VXMyTWwKvzdn2fQRe+qiQ3UizOvLjBTevjMicc/AZWHQRCMk25vjA=
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
	<artem_mygaiev@epam.com>
Subject: [PATCH] docs: fusa: Add Assumption of Use (AOU)
Date: Fri, 6 Sep 2024 11:13:18 +0100
Message-ID: <20240906101318.1419954-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD6:EE_|SA1PR12MB8888:EE_
X-MS-Office365-Filtering-Correlation-Id: ffb1466b-dfad-4c3c-b329-08dcce5c8b5f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?UWy5ol0qLiIxkD26+qNibAeyZUMB6AfRMhZ6nSOcTyUC36aDDP5e6y16Hae7?=
 =?us-ascii?Q?++/cQXZcb20+Q8uOUIntDYgxEc4OyusmqDR8q5G3N5gGVYOXDBnAEFF/Y/vj?=
 =?us-ascii?Q?Gg6IEJekLJLrqoU4nga8oMfD1OmgpSTYPHR9BRaT5mTgT1RcuSLi8oyN6gOV?=
 =?us-ascii?Q?G28keQfLStfpJ2P5Jol/PwAlK/VJu9RzzUdzY5uy84vsc4r4VDhLEWc587KC?=
 =?us-ascii?Q?xeD+1Av2pQtVXRO9NKRpesTdjDh7YMpOnNrny9mSgsQFqMD3IPPtftm/ZuJE?=
 =?us-ascii?Q?vx5bPrJHUYt0W3oWoMjZBN4wyByQP1UgU/KrnSnsRBvWZ5m8RmmmpvZM8/0c?=
 =?us-ascii?Q?REIOKvrk0H57n7ZGJJuz6II/MfFpoMKmSjNln2chJ2JTULJ1oxEfTjpoSsQe?=
 =?us-ascii?Q?rcL9OiXAULeS94bTuJyGQlHOsFtvEnDF1UgRLPzwhVWUVCP+Hv7NAjj06KtX?=
 =?us-ascii?Q?wiA7yx6WGceVCULsN/EFP9WtlTt4brra9v9IEf7iUxcNcajwn5i62dlQbwzX?=
 =?us-ascii?Q?ir8bLL0oZ2DWPQ+nms+fmRfvGtKk1NwoOVQ7bMMUQ6cbXUEGgYa6F6pu+Oj7?=
 =?us-ascii?Q?mDwVFjD1E6nTyS18INLRB2yVNflsJ1mh64rPMoI8CY63hXAmhpZjEV8tB6vU?=
 =?us-ascii?Q?EmP69gYpkaoGMgE8nZOwT2xqQBuKxO+zoVFh4WMmO6LCNPrJKnnEw5XeWIRM?=
 =?us-ascii?Q?qxPJVYvIJbwg7mKdUSMQYPcKKxcAzh2Bsuh8UeOXJKZxJE/xe12yy33CbLDc?=
 =?us-ascii?Q?uhfeUfvNUx9KkRSFhN+0HY+2eAXCNq5irEar277g4yY5EYQBzGa51dqBGgvw?=
 =?us-ascii?Q?9yN/62T/7Kujidxy0TZgKYu2EsEjjwK/t7/eQj8Vj0XjU7G483l4HblqjJaz?=
 =?us-ascii?Q?/VcawLGImqlc1O+Q93IVI8ljA11CGEJ3hAaW1ANWkxYWNntBiT4twy702fpZ?=
 =?us-ascii?Q?4xMNguPOvkbVLNx8BogaUgjpyV+EYr74gsvgwO9sU83AAKcgDcTUUCqzjFkD?=
 =?us-ascii?Q?FftmRVb+C4QDj1evC9v7RJjr3adtpU8KbnAVAKFQN29CFmzT8hnoUaC/V526?=
 =?us-ascii?Q?hD4xyF2mQIMHLkJfHAyL6vlPyrdBTKS8Cnf44If4fLa2MFz0GvHa9MM6L+JC?=
 =?us-ascii?Q?RDCSJpJL/CKGq4Fzd1I3TqbefECSmeh02+q7ri+2wKVxE5rq3Nr1ZRdUxbW8?=
 =?us-ascii?Q?v04LFPrZ1cXKzCnWsr9UIC1l749bC5foJteMREmphVj5t34gZzV7IsIdw8T9?=
 =?us-ascii?Q?JrrO9+Gp3LdTUUTjbghvCtq/wds0gtAMdBmIcXkph1c4G7ZZpOW3NXYQAjGq?=
 =?us-ascii?Q?iHNSxyohTrImCa5Pi1RMlp3jQDvLpp9tbsqLeYm8FLahZcjy7G9IkrTm333i?=
 =?us-ascii?Q?11K4Wtf5kNdHjUY0AkmBAr7kfTBtCqYf71D1l75iSKyVkKEi6fl9QRxYfoOB?=
 =?us-ascii?Q?tFYu8O5f3fGPsYpIHZyqp75PxQtJEh3z?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Sep 2024 10:13:24.8666
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ffb1466b-dfad-4c3c-b329-08dcce5c8b5f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EDD6.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8888

From: Michal Orzel <michal.orzel@amd.com>

AOU are the assumptions Xen relies on other components (eg platform, domains)
to fulfill its requirements. In our case, platform means a combination of
hardware, firmware and bootloader.

We have defined AOU in the intro.rst and added AOU for the generic timer.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
 .../reqs/design-reqs/arm64/generic-timer.rst  | 19 +++++++++++++++++++
 docs/fusa/reqs/intro.rst                      | 10 ++++++++++
 2 files changed, 29 insertions(+)

diff --git a/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst b/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst
index f2a0cd7fb8..9df87cf4e0 100644
--- a/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst
+++ b/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst
@@ -116,6 +116,25 @@ Rationale:
 
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
+`XenSwdgn~arm64_generic_timer_pf_program_cntfrq_el0~1`
+
+Description:
+Underlying platform shall ensure that CNTFRQ_EL0 register contains the system
+timer frequency.
+
+Rationale:
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


