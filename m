Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B3943A11178
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2025 20:51:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.872018.1282993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXmvm-0003RE-Ms; Tue, 14 Jan 2025 19:50:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 872018.1282993; Tue, 14 Jan 2025 19:50:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXmvm-0003Pq-I2; Tue, 14 Jan 2025 19:50:30 +0000
Received: by outflank-mailman (input) for mailman id 872018;
 Tue, 14 Jan 2025 19:50:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=dohy=UG=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1tXmvl-0003Ik-2m
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2025 19:50:29 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20608.outbound.protection.outlook.com
 [2a01:111:f403:2416::608])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cd46bc19-d2b0-11ef-a0e1-8be0dac302b0;
 Tue, 14 Jan 2025 20:50:27 +0100 (CET)
Received: from BL0PR05CA0017.namprd05.prod.outlook.com (2603:10b6:208:91::27)
 by CY8PR12MB7755.namprd12.prod.outlook.com (2603:10b6:930:87::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Tue, 14 Jan
 2025 19:50:20 +0000
Received: from BN3PEPF0000B36F.namprd21.prod.outlook.com
 (2603:10b6:208:91:cafe::84) by BL0PR05CA0017.outlook.office365.com
 (2603:10b6:208:91::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8356.12 via Frontend Transport; Tue,
 14 Jan 2025 19:50:20 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN3PEPF0000B36F.mail.protection.outlook.com (10.167.243.166) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8377.0 via Frontend Transport; Tue, 14 Jan 2025 19:50:20 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 14 Jan
 2025 13:50:19 -0600
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Tue, 14 Jan 2025 13:50:19 -0600
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
X-Inumbo-ID: cd46bc19-d2b0-11ef-a0e1-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JTRYrwAzstKmWNEDBnY4lMxqq/ln7Xazc+qnPnQM7aJXjupOmkz5Y0lQbWUnKbLOmiFI70P0ufOq33XHyQaduEFvDemmGc5K3ZSzIZgppVphZCJ/WngkgjrFgEDo/pdHXqA2q754u8k9KCvCIuBTeIG7ZdWGrt0BCvq/OXmFe9Oc/R49Vj8qbfFUgiAMpmIbF3dt02198s4Ku/dKmqrHn5WqzjZmXe/PpewnqbeTLUCft+eDe5wHKpRLj/kG182EE7IBnI0dCP8Bf2UWbALi/PqDAePY9x398o7qLgrvAWoaAM4FgZBx/xd/D7OioAb4Aiw4gy1ORt1uq+If73n4mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4YxDwFIkH0z2drf37uvGHzceTBs7Yq/7eJMrWxhBsB8=;
 b=ib8cAeL6QVWRBvdIIyQnAVlFw9gzlSeRFy2FqMu9SloyGmnQ5V55uCKxGaj8FaxmRd+7EOItwQYQVJ0GRDUI+0veyIMxPR4mgRzi2nNG0rp6JMlJlgR9Ph4lnyY4NvJiHvpqrX+EyNVHkprXOBGNfwF+MmDFhdRV5gBR9WX3Gp0/mqvA1oxlqMsaXAEAR+z/p8rQRdVeMkSwn6DnOnyrgloluLO9Jjat/3r5PVvXo++c0S5qBUHeME07vnQP7njD9z0rqx85iRZNX8TTryv4ReXUfYj+BAWvj6769wvL7HrF604eG9UEBGCj18fXTOoMU/eClx0Qt4xiTbC6VZPTRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4YxDwFIkH0z2drf37uvGHzceTBs7Yq/7eJMrWxhBsB8=;
 b=FmgLWZIxNb+yzvAR+rYJBo18MdFN3x1G8HdJ7gT/jl1xAdvFFJSL1sSlDHPt65IglKmnW5D2o723mntrdKRSCJKfdN3EKsSQBx6s4b7yuwFCb4dfwsC6ZnMEQX4caL40ef9bL758T0ejz7gsQfYjnnlaVpmCAGhJgi0n6uzZzV4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Ayan Kumar Halder <ayan.kumar.halder@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	"Michal Orzel" <michal.orzel@amd.com>, Artem Mygaiev <artem_mygaiev@epam.com>
Subject: [PATCH v1 2/2] docs: fusa: Add the requirements for some of the commands of XEN_VERSION
Date: Tue, 14 Jan 2025 19:50:10 +0000
Message-ID: <20250114195010.3409094-2-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250114195010.3409094-1-ayan.kumar.halder@amd.com>
References: <20250114195010.3409094-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B36F:EE_|CY8PR12MB7755:EE_
X-MS-Office365-Filtering-Correlation-Id: 3af46883-1f9d-4fad-cf38-08dd34d4ad5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SxfrybhYvG5AoSawq7ECrpwD35JIoXWcytXF0LzYhD1iF3t07QiBbFMyk5f5?=
 =?us-ascii?Q?70M9IEqP6Rcniih+ZVnmCNaKAQeklTmgRWmnePrZbm8bwSkYZdlHOAQadmKJ?=
 =?us-ascii?Q?c0Vjg1sLKAsCh5t2QF3ngUgQQ5B8L3QDXAcy12wjaAScIHRUazbFT4CwaUIP?=
 =?us-ascii?Q?3jvmwwEGLNhKdnZqkdvuRr/M1Cg9DAYFw8zuWy0EfMTjaq8YCvjQSbbj9Keh?=
 =?us-ascii?Q?4Nr80fvyQ2tqK62P/fse0dZ3MvPfxdbWI2f7/vYR4MnW7mIiYOufkKVeN6Ie?=
 =?us-ascii?Q?X7qHxwlSfWfHI1NB5ticAWgu8iG2lpRNNVZ/5qXMV/Vs2hvGQAs+1Gu6YUO1?=
 =?us-ascii?Q?QBVLqkuTUeBNcokL29KTfcFznlWkGnRzz9u2++8weo0VWmYahyUSnc7khUtD?=
 =?us-ascii?Q?geCi0ZTSMd3yRVD+zi8n51cb9prBVvU3r+Oc0+sqkEEI6VNOi0VHTOVVtKbV?=
 =?us-ascii?Q?9zz3nddYfdse4DPQVUk6Me3JkTC7Qxb5Waf9V+fhxDLoVZworYy1KJe2xcK3?=
 =?us-ascii?Q?E4a49b1Wbrc8ajgbehxv+NZmsahkjk5V8XUf3vZ5y6OVXofGFbZnOgR/QCpF?=
 =?us-ascii?Q?dkkGZoOTv4B4PQuoEDEzVj9bktgUGr9G9mduY+uzWk0Y/QwPmtCG+c/uqA42?=
 =?us-ascii?Q?27WoMLT9T1wNGn4wtKNlgEniQbD9k3X95NGvYQvmeizvB43t2Px1RikCtrDv?=
 =?us-ascii?Q?GNW1rLxQ8x4MUfqQoPQwKVFi5+mI+ppaitPesAb4I2re6fPZj1Ml3JJz9Sar?=
 =?us-ascii?Q?zGct226dcelXqM2rrnJf0uFBkqkV8YZ+lfzjdofoZV09psoWJbO/brvzoB+8?=
 =?us-ascii?Q?P3wu5QMtCktK05xOz4L/PKIbYLIAXxTuuoqYN6/K8KSSp737zXc8FG364k6Z?=
 =?us-ascii?Q?6p4usfuDlAJg521Win1XuFZsmVYObeuMdhpFcv7iYO3D7tby3RG70fnr6Fx4?=
 =?us-ascii?Q?zrmQPw8eoT1XyECmuLYDcBP2CzOWI8bOLYM+kgMur7a7rU0uCoTGicP9wNet?=
 =?us-ascii?Q?oynTneeI4ZnSHAMkyGZqpdXCNxJJlSek63ibzJJKT+/srplpG683MMnWbRI7?=
 =?us-ascii?Q?ukUyfgGbubB06P8FHRfCgFlo4TywRMI02VK8UFhLiIkYYTgldnbrpcN7zZYV?=
 =?us-ascii?Q?qN4j1GNeGoKbPsQfUKdAwSt/kcgZftz4sXtYRm6PFl4QcaRAtArU7jiqCPoY?=
 =?us-ascii?Q?uu0abNwMAQGkWPF1lvG7a3sMsUnQjcFdS9jKsstu6QtR28DJy5wyghpN12cB?=
 =?us-ascii?Q?zT0hINDXgUwGDHjzvhOiEUiNG/TX4PorrgB6WfLP/X7sBOGdwhqNYFvkWD1X?=
 =?us-ascii?Q?hDKeQYHIqhMQFeag6xr6QDExlc7JhjL7UJx9wJQWsEmI7sD5rDgpnasJ0MRl?=
 =?us-ascii?Q?QZKfDGrB5GS3sYi8r7XbUSY2bSz0h/Hqz5XhPFpwDoODBHJD67e76o+gGB8O?=
 =?us-ascii?Q?RRm5VqJSG1481yQe1mb2CdhZ9k50QTDIcqdOKH/Z4d+B7Gg8jtoQ8+VdXeA4?=
 =?us-ascii?Q?10i95lIEMa/phfg=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2025 19:50:20.1883
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3af46883-1f9d-4fad-cf38-08dd34d4ad5b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B36F.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7755

We have written the requirements for some of the commands of the XEN_VERSION
hypercall.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
 .../design-reqs/arm64/version_hypercall.rst   | 33 ++++++++
 .../reqs/design-reqs/version_hypercall.rst    | 65 +++++++++++++++
 docs/fusa/reqs/index.rst                      |  2 +
 .../reqs/product-reqs/version_hypercall.rst   | 82 +++++++++++++++++++
 4 files changed, 182 insertions(+)
 create mode 100644 docs/fusa/reqs/design-reqs/arm64/version_hypercall.rst
 create mode 100644 docs/fusa/reqs/design-reqs/version_hypercall.rst

diff --git a/docs/fusa/reqs/design-reqs/arm64/version_hypercall.rst b/docs/fusa/reqs/design-reqs/arm64/version_hypercall.rst
new file mode 100644
index 0000000000..1dad2b84c2
--- /dev/null
+++ b/docs/fusa/reqs/design-reqs/arm64/version_hypercall.rst
@@ -0,0 +1,33 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+Capabilities
+------------
+
+`XenSwdgn~arm64_capabilities~1`
+
+Description:
+Xen shall have a internal constant string storing "xen-3.0-aarch64".
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~version_hyp_capabilities_cmd~1`
+
+Capabilities AArch32
+--------------------
+
+`XenSwdgn~arm64_capabilities_aarch32~1`
+
+Description:
+Xen shall have a internal constant string storing "xen-3.0-armv7l" when it
+detects that the cpu is running in AArch32 mode.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~version_hyp_capabilities_cmd~1`
+
diff --git a/docs/fusa/reqs/design-reqs/version_hypercall.rst b/docs/fusa/reqs/design-reqs/version_hypercall.rst
new file mode 100644
index 0000000000..8bb7a66576
--- /dev/null
+++ b/docs/fusa/reqs/design-reqs/version_hypercall.rst
@@ -0,0 +1,65 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+Version
+-------
+
+`XenSwdgn~version~1`
+
+Description:
+Xen shall have a internal constant storing the version number coming from the
+Makefile.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~version_hyp_version_cmd~1`
+
+Subversion
+----------
+
+`XenSwdgn~subversion~1`
+
+Description:
+Xen shall have a internal constant storing the sub version number coming from
+the Makefile.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~version_hyp_version_cmd~1`
+
+Extraversion
+------------
+
+`XenSwdgn~extraversion~1`
+
+Description:
+Xen shall have a internal constant string storing the extraversion coming from
+the build environment.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~version_hyp_extraversion_cmd~1`
+
+Changeset
+---------
+
+`XenSwdgn~changeset~1`
+
+Description:
+Xen shall have a internal constant string storing the date, time and git hash
+of the last change made to Xen's codebase.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~version_hyp_changeset_cmd~1`
diff --git a/docs/fusa/reqs/index.rst b/docs/fusa/reqs/index.rst
index d8683edce7..b85af19d19 100644
--- a/docs/fusa/reqs/index.rst
+++ b/docs/fusa/reqs/index.rst
@@ -14,3 +14,5 @@ Requirements documentation
    design-reqs/arm64/generic-timer
    design-reqs/arm64/sbsa-uart
    design-reqs/arm64/hypercall
+   design-reqs/arm64/version_hypercall
+   design-reqs/version_hypercall
diff --git a/docs/fusa/reqs/product-reqs/version_hypercall.rst b/docs/fusa/reqs/product-reqs/version_hypercall.rst
index fdb8da04e1..10bc7b6e87 100644
--- a/docs/fusa/reqs/product-reqs/version_hypercall.rst
+++ b/docs/fusa/reqs/product-reqs/version_hypercall.rst
@@ -59,3 +59,85 @@ Covers:
 Needs:
  - XenSwdgn
 
+Version command
+---------------
+
+`XenProd~version_hyp_version_cmd~1`
+
+Description:
+Xen shall provide a command (num 0) for  hypercall (num 17) to retrieve Xen's
+version in the domain's x0 register.
+
+Rationale:
+
+Comments:
+Xen version is composed of major and minor number.
+
+Covers:
+ - `XenMkt~version_hypercall~1`
+
+Needs:
+ - XenSwdgn
+
+Extraversion command
+--------------------
+
+`XenProd~version_hyp_extraversion_cmd~1`
+
+Description:
+Xen shall provide a command (num 1) for hypercall (num 17) to copy its
+extraversion in the domain's buffer.
+
+Rationale:
+
+Comments:
+Xen's extra version consists of a string passed with 'XEN_VENDORVERSION' command
+line parameter while building Xen.
+
+Covers:
+ - `XenMkt~version_hypercall~1`
+
+Needs:
+ - XenSwdgn
+
+Capabilities command
+--------------------
+
+`XenProd~version_hyp_capabilities_cmd~1`
+
+Description:
+Xen shall provide a command (num 3) for hypercall (num 17) to copy its
+capabilities to the domain's buffer.
+
+Rationale:
+
+Comments:
+Capabilities related information is represented by char[1024].
+For Arm64, the capabilities should contain "xen-3.0-aarch64" string.
+
+Covers:
+ - `XenMkt~version_hypercall~1`
+
+Needs:
+ - XenSwdgn
+
+Changeset command
+-----------------
+
+`XenProd~version_hyp_changeset_cmd~1`
+
+Description:
+Xen shall provide a command (num 4) for hypercall (num 17) to copy changeset
+to the domain's buffer.
+
+Rationale:
+
+Comments:
+Changeset is string denoting the date, time and git hash of the last change
+made to Xen's codebase.
+
+Covers:
+ - `XenMkt~version_hypercall~1`
+
+Needs:
+ - XenSwdgn
-- 
2.25.1


