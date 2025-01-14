Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB473A11177
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2025 20:51:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.872017.1282983 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXmvk-0003BV-Bt; Tue, 14 Jan 2025 19:50:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 872017.1282983; Tue, 14 Jan 2025 19:50:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXmvk-000392-8U; Tue, 14 Jan 2025 19:50:28 +0000
Received: by outflank-mailman (input) for mailman id 872017;
 Tue, 14 Jan 2025 19:50:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dohy=UG=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1tXmvi-00038w-Q8
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2025 19:50:26 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20607.outbound.protection.outlook.com
 [2a01:111:f403:2407::607])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cacb52ec-d2b0-11ef-99a4-01e77a169b0f;
 Tue, 14 Jan 2025 20:50:24 +0100 (CET)
Received: from BL0PR05CA0016.namprd05.prod.outlook.com (2603:10b6:208:91::26)
 by CY8PR12MB8244.namprd12.prod.outlook.com (2603:10b6:930:72::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Tue, 14 Jan
 2025 19:50:18 +0000
Received: from BN3PEPF0000B36F.namprd21.prod.outlook.com
 (2603:10b6:208:91:cafe::97) by BL0PR05CA0016.outlook.office365.com
 (2603:10b6:208:91::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.13 via Frontend Transport; Tue,
 14 Jan 2025 19:50:18 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B36F.mail.protection.outlook.com (10.167.243.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.0 via Frontend Transport; Tue, 14 Jan 2025 19:50:16 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 14 Jan
 2025 13:50:15 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 14 Jan
 2025 13:50:15 -0600
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Tue, 14 Jan 2025 13:50:14 -0600
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
X-Inumbo-ID: cacb52ec-d2b0-11ef-99a4-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d/d3zzxAjJ9UW6CfVzp2wm2rmFdyP2YSZSkxxi7myjWl8xP1c7ybo6ZlGx3wajEVq70Uv/Ryg6r/pUN6enEk86llOPLIiYHr55B+/Us9vXYqZO8KpU+Tg6anuRTN0zzN9b5zLPqmVjVXHA6+Cfdkb+dkAe7B2NxmMfj3a7WS8ki8vTOun8vNRICyPB7/A/3WPNwfBE385ZyrMA3Qs66Axa4wQ0zN2j2akn06QmV5aY5nP3saP8LLrgMe+FxWLfY/2BaUP4Igxe0T6Yc4Hbq+bvSMyTEewUZabU/mA1IbYUInpn8iOHNNhXxs5euPkxQp4Twgh0VYtg7dSqIn+fYMxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2/7ezLuGnWQStEHWeolIPlkR+XtMyUq4aP0dO47yG0w=;
 b=KMM721HISwLkKlXTdLf0kaAIszZ7CF9ArsCkcroaEOppLVWlhvpj4Rb4mPyMSrfSBmI/k08mcvyI6LG5hOE5e/LCXQouj7LNgXVThJXycbdJuHs2MztPoABVh3LRc8MkebzwLCn8YVSvsjAFP6x5hq3Ul2H8i7rct0C1s6cZCZhjsKKXcyaTk9QAf2c/D4caMJC75gLlpYUSYLKSc4QvGHs7StoDRArTlxWDg2hrWVD2rHWpLuOTTE4KOPcebijbLHij45IVAabS//GSTGUb6hpFJBMudUD4s18EDR4vDvFevEn+UBnelkJ5TCxTW3RiFbEinVhKi+mYHmMI+o5wnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2/7ezLuGnWQStEHWeolIPlkR+XtMyUq4aP0dO47yG0w=;
 b=vBN9KWJFb69PAIL2C4MVgujImd9HGKq01EoV2p7F5npqyDafzR6soLgPC05RBZJrVc8hsNRCJ3t1sVcfpiane502qe2gtywMELyK7bFa/xL7Oy8Vot7RAGTPss8S/nu6ycUidJ8WktV5pzaGZcIRI8xaApJ9TCgTQuEKM1log88=
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
Subject: [PATCH v1 1/2] docs: fusa: Define the requirements for XEN_VERSION hypercall.
Date: Tue, 14 Jan 2025 19:50:09 +0000
Message-ID: <20250114195010.3409094-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36F:EE_|CY8PR12MB8244:EE_
X-MS-Office365-Filtering-Correlation-Id: 979af28c-05ac-44d7-e768-08dd34d4ab4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?L/PnU4/BOd7XD689euvjLR8sD1xefta5ic17lCRAIfuDyfdpjIwJuxIqDx3p?=
 =?us-ascii?Q?9WvkuP3MI+EIsV+kjR/L7QjYkQizkKpaVHR4PuFztzeip+ggXbbrHLrzDWNV?=
 =?us-ascii?Q?kCcqWpEdlfC6XC7A4FdOVamnbaJeImbpaC2Y0qHn5JLciHdXYPJ09f8a5rHS?=
 =?us-ascii?Q?ZDk6wh20TDYpYzF2jmhpuQlG2GIg+hDtQSo9c14lbxcMhzG1niDXLjXHVX1F?=
 =?us-ascii?Q?jkmj800SUBJmwg+9knJVrAKI/xHo3lo9YgH2+kYaGN7eq0w9eD4Km/MdAIoj?=
 =?us-ascii?Q?6HxM/nvdK1//SrArNZ1mUwHDpjHe8EqfgPmf/+gmpnkMOvOApA4OGsCVxq81?=
 =?us-ascii?Q?U50OGwKzC7+OziTDlmLnEmpRkxiOSyGIVGOxoF6Xv1P1iUAlfOJJWCQv2d+A?=
 =?us-ascii?Q?mOW4SqtOLVHie9tTdwTRdEnDgu3STC9clZhFWv89XY9dmdpPwNM2i2TrKEKr?=
 =?us-ascii?Q?0ZAtRFAIAm1jg22DXtUJRwD5ecwEIdXlSA5r4Z43X/8xeZSbwu5BWsPn8Tf5?=
 =?us-ascii?Q?XWhcblDun+ZI0YzhIEknUhqb6hf2UdybPzH3gQjd+EWRLLsn4drJ/anid4gL?=
 =?us-ascii?Q?hI8QV0wD7sWlxC7wJUgnNzxKfbbff/IVG1towHbtqxyPrj1aQ47++1E+TN7A?=
 =?us-ascii?Q?jSUzFgXmu4OUzNog8G2YAMx01lwMSkDst3GazGaJsn2vecyBd3kOm1eYylXU?=
 =?us-ascii?Q?Rx4oOGQb/5jwnonTkXEmzXX45zAcUA+5syOYZfffPAMaA8yTi/JTr56qIV3G?=
 =?us-ascii?Q?LvmXvwsZ/9C+Vzm/dx9+evrMHrYta+KPNV2Ag6AcFuSvFXMUfJFGj3Pfo1dZ?=
 =?us-ascii?Q?qvgj68bAnAEjuH0aSI8G49lQds+woGcErcDLt6OUtAWhkHhJdaGe96Tu8SD+?=
 =?us-ascii?Q?TfweE2sVbYBH6nUW0ziyxpYio34uOB7RBrM4I0mEDOq1LsXBk0emVPauUurP?=
 =?us-ascii?Q?Y1VNSfBOtzW+aODEyJHVtC5oHaRJba2fQWsBQkoMGkpz7ofh6bJvROVBD0nV?=
 =?us-ascii?Q?eZmfAcGTPGNtgoHemkSi2ENwrWiIzs0AwS0Ccl+30XsWq/nRwQFV6/Yuf4lK?=
 =?us-ascii?Q?EJXKubQAdOl2XJfI3z5IJ1Ozq/1nETA3AFAsS9ncMWjKfo0LkZSeHn9Tx006?=
 =?us-ascii?Q?WRC4+3pAcsvOU6ym+1JzTm25THXCkbt6hO6EGiqx5AarbywceK5/NnmuZ/zP?=
 =?us-ascii?Q?bYfqLI1Y83ytubjvK/q/cIKp8EN/ixXP46bB8fGvlHObDKH8Ka4kjBtsJoeN?=
 =?us-ascii?Q?QxA72Enuw0lCwLYpUn7S7PI0QCtU/I+HSrjU7JdVWZKQAihyRnFEuWE75i8i?=
 =?us-ascii?Q?vZ4fKyDkNqzd7VorstTnawUJc39IF0D1wy6EAy+5k9HudGQBorYn/DLJCsn1?=
 =?us-ascii?Q?2QIPj4ZDGQ3gDMgvzw2VHrGDX82BvnvG4ymf5arVaY+/5uVmsIJufTQRR4If?=
 =?us-ascii?Q?hZuDkb6kjz0=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2025 19:50:16.6727
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 979af28c-05ac-44d7-e768-08dd34d4ab4c
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B36F.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8244

In the current patch, we have defined the requirements which are common for
all the commands.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
 .../fusa/reqs/design-reqs/arm64/hypercall.rst | 52 ++++++++++++++++
 docs/fusa/reqs/index.rst                      |  2 +
 docs/fusa/reqs/market-reqs/reqs.rst           | 16 +++++
 .../reqs/product-reqs/version_hypercall.rst   | 61 +++++++++++++++++++
 4 files changed, 131 insertions(+)
 create mode 100644 docs/fusa/reqs/design-reqs/arm64/hypercall.rst
 create mode 100644 docs/fusa/reqs/product-reqs/version_hypercall.rst

diff --git a/docs/fusa/reqs/design-reqs/arm64/hypercall.rst b/docs/fusa/reqs/design-reqs/arm64/hypercall.rst
new file mode 100644
index 0000000000..66dbcc3026
--- /dev/null
+++ b/docs/fusa/reqs/design-reqs/arm64/hypercall.rst
@@ -0,0 +1,52 @@
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
+Domains shall use the Arm instruction 'hvc' to interact with Xen.
+
+Rationale:
+
+Comments:
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
+Domains shall use register x0 to pass first parameter, x1 to pass second
+parameter and so on.
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
index 0000000000..fdb8da04e1
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
+Domain shall pass the first argument (as an integer) to denote the command
+number for the hypercall.
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
+Domain shall pass the second argument as a pointer to buffer in guest memory.
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
+Xen shall return 0 in case of success or one of the error codes as defined in
+https://man7.org/linux/man-pages/man3/errno.3.html.
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
-- 
2.25.1


