Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 69640ABA67B
	for <lists+xen-devel@lfdr.de>; Sat, 17 May 2025 01:22:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.987716.1372953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uG4NI-0006Yg-Vs; Fri, 16 May 2025 23:21:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 987716.1372953; Fri, 16 May 2025 23:21:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uG4NI-0006W9-Mh; Fri, 16 May 2025 23:21:56 +0000
Received: by outflank-mailman (input) for mailman id 987716;
 Fri, 16 May 2025 23:21:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iQOe=YA=amd.com=stefano.stabellini@srs-se1.protection.inumbo.net>)
 id 1uG4NH-0005s2-Lo
 for xen-devel@lists.xenproject.org; Fri, 16 May 2025 23:21:55 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2060f.outbound.protection.outlook.com
 [2a01:111:f403:2415::60f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8d5ad323-32ac-11f0-9eb6-5ba50f476ded;
 Sat, 17 May 2025 01:21:54 +0200 (CEST)
Received: from CH0PR03CA0257.namprd03.prod.outlook.com (2603:10b6:610:e5::22)
 by BL4PR12MB9722.namprd12.prod.outlook.com (2603:10b6:208:4ed::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Fri, 16 May
 2025 23:21:49 +0000
Received: from CH1PEPF0000A34A.namprd04.prod.outlook.com
 (2603:10b6:610:e5:cafe::2a) by CH0PR03CA0257.outlook.office365.com
 (2603:10b6:610:e5::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.20 via Frontend Transport; Fri,
 16 May 2025 23:21:49 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000A34A.mail.protection.outlook.com (10.167.244.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8746.27 via Frontend Transport; Fri, 16 May 2025 23:21:49 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 16 May
 2025 18:21:49 -0500
Received: from smtp.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 16 May 2025 18:21:48 -0500
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
X-Inumbo-ID: 8d5ad323-32ac-11f0-9eb6-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XKtZ8aW/IiRwTyZ/uaqz2fxpVZEXpFPF5KuSGIaAZdfsXEncC1DtyFeIXx5yR8quLC7bkso5t7y7XBWgbSRCoDiy+WJ/tCF+Rdl/B+bMhXOIJIiwoHUfGV2OzabSlcnzPXvu5GoDix8P7g42I+/jmy8+v0gBbt3utouL4t1h69cJBV6OFJhi+fe0xztZmplWWWNERth+1NPWdLst1uTO3WQsR+vCseKSpQmXavrDvgcv5RwTPGXcBxVVUqLBowusFm7r09go//2LZ0GBoWj8q7wyiI8w+ZJlwf9fVyCmIL4+bJOMycrtaqP1oiEnBveTPxBmf2sbrlhvawwrFGTkkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ibzV0RVz7ZzeEdOUX3J5YjlDrdqnL5X0dajYZtxmsP0=;
 b=qsqNsvK3UoFdwVwAtG07+1Glnd7poxQsU5eybvEc8WpwOUAOqfqek7xk+BYfkaW8PPf7Q3Ia/YDPUg6Ll5okXGbdqWDDmDNOJic0mFXsVe4yrUg3CY7XAJaRkOuy86n3UO7A1tkqcxnG1tYs9B/ygfNdzebVGrDejFFUhRLRyS+q1UwEmuYX0zTbnG7YK08WuorFuoCOBsGze7l+S4m3JR8gJIV6kd9VVZzNM1vTRWnXeyO0YbZWvdCzSZW8vT0S0gaJhWB/T4YmDaE9ELyQ1Qc+aM2WgVfCUFVb24sFdQGypLRJMJ5k4yvSx8DIKjiQ9DErETwkuDtyFfYh15vozA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ibzV0RVz7ZzeEdOUX3J5YjlDrdqnL5X0dajYZtxmsP0=;
 b=h0cpAAOTRiq9qzJStQIhz1QLaNjH/MxpR7mxAGcabPwUGnn36mhqTW45CCB35AgxsuT5uXT8xcCg50dGQ0Ezri6ZEpB1svl0AYOBOmR2z8y/hKcyRgEtCAH/qOgKac5kxzQn6zJK2Myj8ISn9g+1Bq/KKUlOhoEcG3Qe90Cvppc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Stefano Stabellini <stefano.stabellini@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <andrew.cooper3@citrix.com>, <michal.orzel@amd.com>, <jbeulich@suse.com>,
	<julien@xen.org>, <roger.pau@citrix.com>, <sstabellini@kernel.org>,
	<bertrand.marquis@arm.com>, Federico Serafini
	<federico.serafini@bugseng.com>, Stefano Stabellini
	<stefano.stabellini@amd.com>
Subject: [PATCH 6/6] automation/eclair: update configuration of D4.10
Date: Fri, 16 May 2025 16:21:30 -0700
Message-ID: <20250516232130.835779-6-stefano.stabellini@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <alpine.DEB.2.22.394.2505161618280.145034@ubuntu-linux-20-04-desktop>
References: <alpine.DEB.2.22.394.2505161618280.145034@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: stefano.stabellini@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A34A:EE_|BL4PR12MB9722:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d0098eb-b6ae-4ef0-8585-08dd94d06f4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mLAxsJ2cxqSOq0wJUPAnz2mOBw1ZTjLDZx4BVp8M3ugPp2B7IBqi7ZATimzP?=
 =?us-ascii?Q?z328Tsk2tt/wFHVVGR5VAUkvplRqtY3YHZiJi/e6+mJi/aZAHroMC+DKNENz?=
 =?us-ascii?Q?vhD7wszYwhgnu1tIc4Xp1fX/2MXyPBcZi+KejgzNGlE423RFjYeiwUf75iEC?=
 =?us-ascii?Q?pYluNh6TEXZiT7c0oaVFBYRGlRoQw6pU38H/1h3yld8r5sDuYEN2fUwZ3uhX?=
 =?us-ascii?Q?PAdn0cOlw2wQOYdFomWH8urhyreiK75XT8rP7jGiAW3kZ9yknGAxJiULWr5m?=
 =?us-ascii?Q?fmfGzqURHiFB13uWShagI5nX01+YgdzHeK3zxPQVty+zTB41h00TTs3KncGi?=
 =?us-ascii?Q?h460QB6B9zWYQDRE2cMhU6QdhWVC+T8lP7CVwywUJmBkYRqHGLetSeA0BM31?=
 =?us-ascii?Q?DZXNkWtlah5L3ExQgBIOnsyxD3N+/S/uboS8EVCkTHYjzJmtDmn85jbYR7xZ?=
 =?us-ascii?Q?XVhWdlzCh/Q/Bc5l8WHZvdcM5R6H5XQKpKYC89qByDb71tiM0+ADXmcC+EDa?=
 =?us-ascii?Q?edpqZ4MpEWUmlaE+jrUNhku2zJAvFyjEcfOwtLJWJP+Jd3p1zd4jG7DXdOzS?=
 =?us-ascii?Q?2LF1DYtVgChYyg/gh5yFROhwRtHCq4e+Gxrm7Z+gia9ee/gWKNlHrVUeTB+O?=
 =?us-ascii?Q?Xpnq1zCj9eQu+m6dmseLr1TQ0aWFDRgV6fi4aIP1v5ygl4aFvt0JZnEVH0mU?=
 =?us-ascii?Q?Q2HjvBh7QmEMtaF3EhNkvZdPmRu1nXmYwQ7ZyA2/9DgQvZchx0ynZ4bqFVNF?=
 =?us-ascii?Q?xOnw9Y6a+BmMk2D897ScWx/3VOXzRQANTyU2z7Cslw0T0B+pO3zQOTU1ZkpQ?=
 =?us-ascii?Q?0wBUfXATk3if3y76XTjKf7/IphRksHb9aJ4Lyi3ECoF8g0YsKSHypxe9S9BY?=
 =?us-ascii?Q?n1cmlQZVYxFE7ptfwOXB3pk4g1VD2lf5lDWjkNE65+ZaxkWCi3+NeP0TIj+Y?=
 =?us-ascii?Q?HuF17uWVbhiNWCvv5f+Rz8nd91/RY+rX6LfnCzSUgAsMRpNkgXwRS/EVDEpJ?=
 =?us-ascii?Q?g3IBqH8fU3IU8mhSRz2foxQ7H/rLquLTjtcZY5vXDswGXzRPAoMvHljRPnOJ?=
 =?us-ascii?Q?/LSEi5Icx8eVOYrYS3gFDfImbTqIkxQOdLfmGnLmghMGrvX8VZ8jrTXzXBys?=
 =?us-ascii?Q?MLTq3t5uisaXCf3qmcj8UpZUkI/iXpAXW4U9MwxqpHKUNXlx5LlgrFtwOiGr?=
 =?us-ascii?Q?R8J1Nv97jYfAvflyeJ/1EBU24k6eJ35NPovV8Ilxxd77wnGhftvCZchvQn+i?=
 =?us-ascii?Q?Xv2dqXlUBaEoPxuCo/xGwllvOy59l7kNgZdudqSvP69EvNvsUx8qtn9xMsuJ?=
 =?us-ascii?Q?eC1JOaRDSeXtH/FtDReomDkmTMXn8iAmbxXSiwK7D1+hrdZkJ49WCHbDgDbW?=
 =?us-ascii?Q?AmkqAtfnlkGF22d3oC6RHSpYysLBZYggwfjPTYMC+DuSUGf/UEMx5Qwl2nFI?=
 =?us-ascii?Q?/2lZdlGMhBlrJQgyJoFIEqBxsPucJ4Mw/r9ZQLJRo6zm9404/YRhBivvcbps?=
 =?us-ascii?Q?9BNYXQPCKR/j+viAp4OkoZaSC60qjHFf5VFV?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2025 23:21:49.7292
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d0098eb-b6ae-4ef0-8585-08dd94d06f4c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A34A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9722

From: Federico Serafini <federico.serafini@bugseng.com>

MISRA C Directive 4.10 states that "Precautions shall be taken in order
to prevent the contents of a header file being included more than
once".

Update ECLAIR configuration to:
- extend existing deviation to other comments explicitly saying a file
  is intended for multiple inclusion;
- extend existing deviation to other autogenerated files;
- tag the guidelines as clean.

Update deviations.rst accordingly.

Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
---
 automation/eclair_analysis/ECLAIR/deviations.ecl | 14 +++++++++++---
 automation/eclair_analysis/ECLAIR/tagging.ecl    |  1 +
 docs/misra/deviations.rst                        | 15 +++++++++++++++
 3 files changed, 27 insertions(+), 3 deletions(-)

diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
index 9c67358d46..3fb6d9f971 100644
--- a/automation/eclair_analysis/ECLAIR/deviations.ecl
+++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
@@ -72,11 +72,19 @@ they are not instances of commented-out code."
 -config=MC3A2.D4.3,reports+={deliberate, "any_area(any_loc(file(arm64_bitops))&&context(name(int_clear_mask16)))"}
 -doc_end
 
--doc_begin="Files that are intended to be included more than once do not need to
-conform to the directive."
+-doc_begin="Files that are intended to be included more than once (and have
+a comment that says this explicitly) do not need to conform to the directive."
 -config=MC3A2.D4.10,reports+={safe, "first_area(text(^/\\* This file is intended to be included multiple times\\. \\*/$, begin-4))"}
+-config=MC3A2.D4.10,reports+={safe, "first_area(text(^.*Explicitly intended for multiple inclusion.*$, begin-3))"}
+-config=MC3A2.D4.10,reports+={safe, "first_area(text(^/\\* Generated file, do not edit! \\*/$, begin-2))"}
 -config=MC3A2.D4.10,reports+={safe, "first_area(text(^/\\* Generated file, do not edit! \\*/$, begin-3))"}
--config=MC3A2.D4.10,reports+={safe, "all_area(all_loc(file(^xen/include/generated/autoconf.h$)))"}
+-doc_end
+
+-doc_begin="Autogenerated files that do not need to conform to the directive."
+-config=MC3A2.D4.10,reports+={safe, "all_area(all_loc(file(^xen/include/generated/autoconf\\.h$)))"}
+-config=MC3A2.D4.10,reports+={safe, "all_area(all_loc(file(^xen/include/xen/compile\\.h$)))"}
+-config=MC3A2.D4.10,reports+={safe, "all_area(all_loc(file(^xen/include/compat/xlat\\.h$)))"}
+-config=MC3A2.D4.10,reports+={safe, "all_area(all_loc(file(^xen/arch/(arm||x86)/include/generated/asm/.*$)))"}
 -doc_end
 
 -doc_begin="Including multiple times a .c file is safe because every function or data item
diff --git a/automation/eclair_analysis/ECLAIR/tagging.ecl b/automation/eclair_analysis/ECLAIR/tagging.ecl
index 5bc35db1fd..7e3095423b 100644
--- a/automation/eclair_analysis/ECLAIR/tagging.ecl
+++ b/automation/eclair_analysis/ECLAIR/tagging.ecl
@@ -23,6 +23,7 @@
 "MC3A2.D1.1||
 MC3A2.D2.1||
 MC3A2.D4.1||
+MC3A2.D4.10||
 MC3A2.D4.11||
 MC3A2.D4.14||
 MC3A2.R1.1||
diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
index fe0b1e10a2..87ed81c918 100644
--- a/docs/misra/deviations.rst
+++ b/docs/misra/deviations.rst
@@ -30,6 +30,21 @@ Deviations related to MISRA C:2012 Directives:
        not to add an additional encapsulation layer.
      - Tagged as `deliberate` for ECLAIR.
 
+   * - D4.10
+     - Files that are intended to be included more than once (and have
+       a comment that says this explicitly) do not need to conform to the
+       directive.
+     - Tagged as `safe` for ECLAIR.
+
+   * - D4.10
+     - There are autogenerated files that do not need to comply to the
+       directive.
+     - Tagged as `safe` for ECLAIR. Such files are:
+        - xen/include/generated/autoconf.h
+        - xen/include/compat/xlat.h
+        - xen/include/xen/compile.h
+        - xen/arch/{arm,x86}/include/generated/asm/\*
+
    * - D4.10
      - Including multiple times a .c file is safe because every function or data item
        it defines would in (the common case) be already defined.
-- 
2.25.1


