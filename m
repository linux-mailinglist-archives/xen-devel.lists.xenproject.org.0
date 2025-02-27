Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9926CA48281
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2025 16:09:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.898209.1306792 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnfW5-0007Yp-FG; Thu, 27 Feb 2025 15:09:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 898209.1306792; Thu, 27 Feb 2025 15:09:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnfW5-0007Ws-Bd; Thu, 27 Feb 2025 15:09:37 +0000
Received: by outflank-mailman (input) for mailman id 898209;
 Thu, 27 Feb 2025 15:09:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X082=VS=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1tnfW4-0007DN-Bs
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2025 15:09:36 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20623.outbound.protection.outlook.com
 [2a01:111:f403:2415::623])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id da65101e-f51c-11ef-9aaf-95dc52dad729;
 Thu, 27 Feb 2025 16:09:35 +0100 (CET)
Received: from CH5PR04CA0015.namprd04.prod.outlook.com (2603:10b6:610:1f4::16)
 by DS7PR12MB6262.namprd12.prod.outlook.com (2603:10b6:8:96::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8466.20; Thu, 27 Feb 2025 15:09:29 +0000
Received: from CH1PEPF0000AD74.namprd04.prod.outlook.com
 (2603:10b6:610:1f4:cafe::40) by CH5PR04CA0015.outlook.office365.com
 (2603:10b6:610:1f4::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.18 via Frontend Transport; Thu,
 27 Feb 2025 15:09:29 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 CH1PEPF0000AD74.mail.protection.outlook.com (10.167.244.52) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8489.16 via Frontend Transport; Thu, 27 Feb 2025 15:09:27 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 27 Feb
 2025 09:09:27 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 27 Feb
 2025 09:09:26 -0600
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Thu, 27 Feb 2025 09:09:26 -0600
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
X-Inumbo-ID: da65101e-f51c-11ef-9aaf-95dc52dad729
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mVagu+dokxMlY4TnwtGNtLNVEkWpcq1fzixE/IdUYZjfXUTjTmw3mtVapRQ8JvBIrau6LT93/ymtLop1Brx+BGUIHldUn0N2Uq+A0Sl46RoFIJu54rSx20/JbH1yrb+/bJAj/IV2iHbUaFsb5C1r2KeBm255YzM4LZVM6DQYikrM5SZEVnru1cccHcqF3RcSAaGACa5agQAC9MdaKn8Ib17zVpcUu8+B36aMyEUj5ZgdbN9CQ1oO2XX2uCNwscYM1vL2In/159+gMR86yUcrnS9bXlnlewisx+3B0NRktDt68rPFW2bvdS1eO7+4qG7/QW8oKYh5hUiAJy9r1WW74g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pi0/fe4dO83Oi5LFT7o5fOTze/E2+nqDOjqABYbYQY8=;
 b=DTXcwXApzDWGzh1D8Tkk0omYFzOK+qXPvHYQaBROJ6o4wKigIMSh/HHu/GMg+JueuMdvVk/te6JRuLGZJGSdOkY/yTmpcIMN6k57MhK7cFE7g2iY/NTozchB9uxXfMH3nyCkws4ahl8VpCiRgAePUA+qm7onjSoRuoU+seB/qF9CYp63AwRlKbMji95QlqQu6weddkudD3EKbT6c035BiK46FX+bl1ASyt7AqJZmcYiN49eUPmHF6/DhL1rVW3y/NeXkOc55j8Zl3vfWZGG14v+gLzH3gm8M3IKXLoWUZGbDoM0TtkFx3sysq3C2opxUR9whoKCNJxFtr295uTyEqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pi0/fe4dO83Oi5LFT7o5fOTze/E2+nqDOjqABYbYQY8=;
 b=0/qr5qXWzhfALOnZzl5UG0IYZ3lVapC3Ma+er/FDSlI6GaGFrjwqzoubDZcG847ElkpMifIRb6h71YPvjOec6/ca3yQ8z/SQfuU3198MCaiSuvSb9pOAZNV/iKvKVFzxwAAD6H45+I+Vqn4ks770Hn/JmDytMtS6h48jUF7QxA8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Ayan Kumar Halder <ayan.kumar.halder@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Artem Mygaiev <artem_mygaiev@epam.com>
Subject: [PATCH v2 1/2] docs: fusa: Define the requirements for XEN_VERSION hypercall.
Date: Thu, 27 Feb 2025 15:09:21 +0000
Message-ID: <20250227150922.3965010-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD74:EE_|DS7PR12MB6262:EE_
X-MS-Office365-Filtering-Correlation-Id: 380cdc07-7427-4a4c-d699-08dd5740baae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gHtnSnlvkTgKVW6jXBfCX4npWLXaU3MZEm+Y9rYK0G71PazLRKySX3nPOJ2B?=
 =?us-ascii?Q?hT+RqKz7PgFfqjQ2UX/t+nYM1nYpyEFueqDf2RQB5Fzy62sWHoe6Lioxe3zZ?=
 =?us-ascii?Q?A8Fnh2Ud5L7ggvu4iEGthRmDK6Ik0GhrQgRV09LXy+DkhzPtPnpvI1b/f5o5?=
 =?us-ascii?Q?DRkGCy5WvsMxKUdOSWNuZkyYZXTBbIgu+rnWSnsXmJxNovmpfJ5S3/4AEUta?=
 =?us-ascii?Q?JODat+kbWlpu/UOpaSFDv4l0DlsWnJLH9/P7P0eI0EBngbn1Un7Ctn4BHiV8?=
 =?us-ascii?Q?JWs9ocuD2Ijfp2oQBHTNFCkv1bsr/e1TugYISRkVMjJ8J8sOghqmcZ80zyJD?=
 =?us-ascii?Q?U+xoerAZuBw8PjwaDyIeFEVHR1m61n6lbk4zNdChGSc/TLBk7cguN4eEhg88?=
 =?us-ascii?Q?bq2OyrkZvJ02V1pidWFhK3upvJtG9EHTIdYnN+s+kkIZxCqNPK6BkO/qd/Km?=
 =?us-ascii?Q?sQ5pkiJn29WoHoHojU2KpbnnHpmDp13e3WzYmnxc4iUS5FILaQLpcuqo5RbL?=
 =?us-ascii?Q?f104c7ZLRpGmUW0MGWUifLpns2C8KJUPfwG9aqSJx0ZO/tdA41kjhUpXz/fr?=
 =?us-ascii?Q?ZEFS6YXFaXN85OwviScwGXSBREej5kbLX3DnuQjr5w848cDTEsL6Ni/sQGpI?=
 =?us-ascii?Q?Vs4WKv/OtK/77uTajQxE1vAUfDUkhdQ0hCB93HAKA5qSgqasmmuc/bD3/+dZ?=
 =?us-ascii?Q?pdNXqUPzAr4xWGhvIPWASrpYr6KmPPGbBlsIn8zs4aCzSw7EofaC2he0A2vg?=
 =?us-ascii?Q?MHxMuney3/k1njWDzQAd8YFew3IsjHohxY26ylmXmBNJFqd2dZBI5aU6fCSz?=
 =?us-ascii?Q?RCX7+eCfLXpMOjYMPP2QdmnFHwIS4io/o3RhUC5ttsGzcm99EzuzI4h31qIS?=
 =?us-ascii?Q?vPg1q0VIcmMGpMaTNcOcUibZIGWRPxOo8o0lQgc+xYYy5q2O/diS9H4ypvVu?=
 =?us-ascii?Q?Pu47lEpK8tFol0g5rGsRcmkw4r95I63WqKTricp1ksySl4YV8VYxaB/0BJ4r?=
 =?us-ascii?Q?IUFDwBBgWbDxP7EboNEpwIU7l55+5e23fQirU8Q/P1R5QuEzs4wPw4V2s0HZ?=
 =?us-ascii?Q?xs5bQJfHrnBv9Vd2+R7kLeW5Y+bNwREKhsoU7kUaSpN9riY3/7ZPb3mETw9B?=
 =?us-ascii?Q?5MQ8DJOoFVNzizioOcWC4hWpxz/iU/TiX+svefCyyPa2RU9PTWvuJlT/nqkL?=
 =?us-ascii?Q?y0SOf6n0UaKWwZFwQjlSnNqRvYG2dCuANQnkgRVNGEc0dPaQSVUnhj/Qucpo?=
 =?us-ascii?Q?vo5BQa+kRTfu/ewFt3kvokqOlSmoqN+5qn6LLz4vU6+fAbF9LdQFVbpPZ92I?=
 =?us-ascii?Q?J3GJDK7qX9ZNf1g1Hqy9LuR1wpMQyP4CJV2BHV0SJAcETpF2nNyUfqOmBFg0?=
 =?us-ascii?Q?koIsw1Ag3DLfS3r9T21jbPUNLxb/ZLO6Ff6YJOJ0eqKov37ppooS6lWKh5qn?=
 =?us-ascii?Q?VHsremLwjdk=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 15:09:27.6928
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 380cdc07-7427-4a4c-d699-08dd5740baae
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000AD74.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6262

In the current patch, we have defined the requirements which are common for
all the commands.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
Changes from -

v1 - 1. Fixed `XenProd~version_hyp_ret_val~1` requirement as Xen does not return
0 for success in all the cases.
2. Reworded the requirements so as to write them from Xen's perspective (not
domain's perspective).

 .../fusa/reqs/design-reqs/arm64/hypercall.rst | 55 +++++++++++++++++
 docs/fusa/reqs/index.rst                      |  2 +
 docs/fusa/reqs/market-reqs/reqs.rst           | 16 +++++
 .../reqs/product-reqs/version_hypercall.rst   | 61 +++++++++++++++++++
 4 files changed, 134 insertions(+)
 create mode 100644 docs/fusa/reqs/design-reqs/arm64/hypercall.rst
 create mode 100644 docs/fusa/reqs/product-reqs/version_hypercall.rst

diff --git a/docs/fusa/reqs/design-reqs/arm64/hypercall.rst b/docs/fusa/reqs/design-reqs/arm64/hypercall.rst
new file mode 100644
index 0000000000..ffd883260c
--- /dev/null
+++ b/docs/fusa/reqs/design-reqs/arm64/hypercall.rst
@@ -0,0 +1,55 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+Hypercall
+=========
+
+Instruction
+-----------
+
+`XenSwdgn~arm64_hyp_instr~1`
+
+Description:
+Xen shall treat domain hypercall exception as hypercall requests.
+
+Rationale:
+
+Comments:
+Hypercall is one of the communication mechanism between Xen and domains.
+Domains use hypercalls for various requests to Xen.
+Domains use 'hvc' instruction to invoke hypercalls.
+
+Covers:
+ - `XenProd~version_hyp_first_param~1`
+ - `XenProd~version_hyp_second_param~1`
+
+Parameters
+----------
+
+`XenSwdgn~arm64_hyp_param~1`
+
+Description:
+Xen shall use x0 to read the first parameter, x1 for second parameter and so
+on, for domain hypercall requests.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~version_hyp_first_param~1`
+ - `XenProd~version_hyp_second_param~1`
+
+Return value
+------------
+
+`XenSwdgn~arm64_ret_val~1`
+
+Description:
+Xen shall store the return value in x0 register.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~version_hyp_ret_val~1`
diff --git a/docs/fusa/reqs/index.rst b/docs/fusa/reqs/index.rst
index 1088a51d52..d8683edce7 100644
--- a/docs/fusa/reqs/index.rst
+++ b/docs/fusa/reqs/index.rst
@@ -10,5 +10,7 @@ Requirements documentation
    market-reqs/reqs
    product-reqs/reqs
    product-reqs/arm64/reqs
+   product-reqs/version_hypercall
    design-reqs/arm64/generic-timer
    design-reqs/arm64/sbsa-uart
+   design-reqs/arm64/hypercall
diff --git a/docs/fusa/reqs/market-reqs/reqs.rst b/docs/fusa/reqs/market-reqs/reqs.rst
index 2d297ecc13..0e29fe5362 100644
--- a/docs/fusa/reqs/market-reqs/reqs.rst
+++ b/docs/fusa/reqs/market-reqs/reqs.rst
@@ -79,3 +79,19 @@ Comments:
 
 Needs:
  - XenProd
+
+Version hypercall
+-----------------
+
+`XenMkt~version_hypercall~1`
+
+Description:
+Xen shall provide an interface for the domains to retrieve Xen's version, type
+and compilation information.
+
+Rationale:
+
+Comments:
+
+Needs:
+ - XenProd
diff --git a/docs/fusa/reqs/product-reqs/version_hypercall.rst b/docs/fusa/reqs/product-reqs/version_hypercall.rst
new file mode 100644
index 0000000000..03221f70c3
--- /dev/null
+++ b/docs/fusa/reqs/product-reqs/version_hypercall.rst
@@ -0,0 +1,61 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+Version hypercall
+=================
+
+First Parameter
+---------------
+
+`XenProd~version_hyp_first_param~1`
+
+Description:
+Xen shall treat the first argument (as an integer) to denote the command number
+for the hypercall.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenMkt~version_hypercall~1`
+
+Needs:
+ - XenSwdgn
+
+Second Parameter
+----------------
+
+`XenProd~version_hyp_second_param~1`
+
+Description:
+Xen shall treat the second argument as a virtual address to buffer in domain's
+memory.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenMkt~version_hypercall~1`
+
+Needs:
+ - XenSwdgn
+
+Return Value
+------------
+
+`XenProd~version_hyp_ret_val~1`
+
+Description:
+In case the hypercall fails, Xen shall return one of the error codes defined
+in http://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/include/public/errno.h.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenMkt~version_hypercall~1`
+
+Needs:
+ - XenSwdgn
\ No newline at end of file
-- 
2.25.1


