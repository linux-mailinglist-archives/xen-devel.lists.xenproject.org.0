Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F19CB2C05A
	for <lists+xen-devel@lfdr.de>; Tue, 19 Aug 2025 13:28:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1086465.1444659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoKUy-00013O-Cg; Tue, 19 Aug 2025 11:27:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1086465.1444659; Tue, 19 Aug 2025 11:27:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uoKUy-00010V-9W; Tue, 19 Aug 2025 11:27:28 +0000
Received: by outflank-mailman (input) for mailman id 1086465;
 Tue, 19 Aug 2025 11:27:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TlMz=27=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1uoKUx-0000mv-63
 for xen-devel@lists.xenproject.org; Tue, 19 Aug 2025 11:27:27 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20618.outbound.protection.outlook.com
 [2a01:111:f403:2009::618])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7a064945-7cef-11f0-a32a-13f23c93f187;
 Tue, 19 Aug 2025 13:27:24 +0200 (CEST)
Received: from SA1P222CA0137.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c2::6)
 by CY8PR12MB8410.namprd12.prod.outlook.com (2603:10b6:930:6d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.13; Tue, 19 Aug
 2025 11:27:18 +0000
Received: from SN1PEPF000252A2.namprd05.prod.outlook.com
 (2603:10b6:806:3c2:cafe::4b) by SA1P222CA0137.outlook.office365.com
 (2603:10b6:806:3c2::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.22 via Frontend Transport; Tue,
 19 Aug 2025 11:27:18 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF000252A2.mail.protection.outlook.com (10.167.242.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Tue, 19 Aug 2025 11:27:17 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 19 Aug
 2025 06:27:17 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Tue, 19 Aug
 2025 04:27:16 -0700
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Tue, 19 Aug 2025 06:27:16 -0500
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
X-Inumbo-ID: 7a064945-7cef-11f0-a32a-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pBfHafKBHaytvxcBOE1tBnB6eCypyZaZ6y1Hj4FTpe2FK6u+uwDrHmQnonIz9Q8pmtcxssgYrMu9H6773gKHN2dHApiI8p4btRkwlbLBhD7ngPSIvqmnP1yDi5l4Z1GjF4L5vXazyWfVDKaGEnwUseH1Yn87+xpRoaxjrwRMeQ/oiFrs8jfErt2MOVg9RlaVTXmzcEcp0iimmGzW6SQOoPjVLFBg6lJEAn3vqUHXKP9uNoGwgSeKud2uk7KK8wJ9jkGXRuNKBw3ocmlQtN8KdxUJLSyE4a1Acm/LK+iAGsJf1+xz/ABUl4Zf/v04X/+yY7+WNYzMSGfSr1hrpU3WJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GJgJarZIeRsjWlu15tp5dyGEaJNG+66jaT7NoB+Le90=;
 b=TaxZzaK2ITNEMJOmNCJttinm6kHmYAIiyjDqG0qVRZGsPLky6EYV5VfHEKW6kCevY3Tv+AmmvVNyBVN4YhhNr8jHAFyhTEHImfQlFYZmZhZE0SGBjYzaLKUttCz8T5w7CykRhGOdzUT2Y0aivVyO01qLgbKQkQAFiCcIi0Ekhn9IrRoC6rtoAh/LjAiuR/vx5T8Xjp+epFshK3wynWtR58HFaC5hBRoWNxhKT9i69qSZQ5+8cgOx3ngWcqdnmbRdTNdwPRIaCxe2gOrB5Pr6bcYp751jddyym8jhoyXnNphG1FxbZjVFPqlVN9VFBEXVDpvepIu1anLmX3LaSyKF+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GJgJarZIeRsjWlu15tp5dyGEaJNG+66jaT7NoB+Le90=;
 b=VyBo6bTXiqWK7NyR/rEY+EY7EmS6s9d7kdsUDxXEpWmVKV2rSc1PIvl5p6OghUCDbLkm40crlb8VrKcjjPuZcDPSdsCniNNYCDvGgzHT75chDzoQPnU6leeYEuANxoloivhhO68FIOgf1wYD+S9FmSDBXmMIPH8WwFOxmsF1QEc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Ayan Kumar Halder <ayan.kumar.halder@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, Michal
 Orzel <michal.orzel@amd.com>, Artem Mygaiev <artem_mygaiev@epam.com>
Subject: [PATCH v4 2/2] docs: fusa: Add the requirements for some of the commands of XEN_VERSION
Date: Tue, 19 Aug 2025 12:27:09 +0100
Message-ID: <20250819112709.3789987-2-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250819112709.3789987-1-ayan.kumar.halder@amd.com>
References: <20250819112709.3789987-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A2:EE_|CY8PR12MB8410:EE_
X-MS-Office365-Filtering-Correlation-Id: 54977446-ac67-40b8-7677-08dddf135ab3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6VU3eZGwlbeSoGA1rs57qwfi10ghfpCeL7hNhFMWPpIdd7i4zWCRdTA/IGx7?=
 =?us-ascii?Q?aJHRzEYYfNWeQxF4oFLZKCHggZKj0k0Y5zwhf9VmuLVHH2GkA4NP+U58vTmM?=
 =?us-ascii?Q?UImT1158WhRo8gjyXp6GvEBoiAQkerxcbWYwzGmHvgAfWvbp0cQrY2XuqWtQ?=
 =?us-ascii?Q?RFU6SzUh5aIqIEBv3z2NP7f3ibA8mflLCXw2XVdVtMsUBRRAe8SbkQrT0rie?=
 =?us-ascii?Q?1Z+PNpSKdDlJ16mxfFvF0pFApbZEOymmZkte+6bPGm1GQ0bkhr4tp1mFPe0g?=
 =?us-ascii?Q?/NJzqVTs1CJ1hkg1Vy0BUlPNs8y605SNiUyqa/BSkvwFoesvl3b+11L68lNO?=
 =?us-ascii?Q?/MEZf5wXMXl8V9qLHS/LMqbYllAgQLudRzeymyIwa+7YkNN9RLIIgreXpFW9?=
 =?us-ascii?Q?MgdjoVRiJUeNSqBRvPUbRtBNSy45AGXgLlVgAP5PQxxB1+qny/Z1iEW/4v3Z?=
 =?us-ascii?Q?17PcG9BkWZOObKz/5zQMD/5uw920acWhk2W4GYRb+CSs/TmETQSefiIS0kBA?=
 =?us-ascii?Q?o5u1M34T3p8a/hJd2eOvhU/3kraynPBwrq7/by3xhpaUnTe9d7t7qFwUnT+E?=
 =?us-ascii?Q?YLwxej5G8wtM/6ey4/+XUByi5HYY/dAFdkDEEQVbSVw4d0VjrPTco5+uxndr?=
 =?us-ascii?Q?nukpt1xAPqR4zWlOl7ttlJgt1C7oa8Xf8AgeZ8biNT+0of+c9DNrIva2M6Sq?=
 =?us-ascii?Q?hxId3zTf4JOKhRFPw/qWi2eRpVYMhCelTXWcy7+t6bXXjTTyvjG89oNB1t4c?=
 =?us-ascii?Q?6d8Oo/pD3y4j/aVOK2/mCgiz5EGhDyf6i6UYcz1b1rt5qY306kWNgnITbKhI?=
 =?us-ascii?Q?Mr4ZqroYCtpzBeBge1vfy/qEpvXpKxayyVBVtS74e0dkbpUOcJcFnG/4s/LN?=
 =?us-ascii?Q?KyvQIi/3unBjCzMPZ37pVAxgBbUmwPSEh2vVzL4KP/iC9rUFe5AYuYV1kWHZ?=
 =?us-ascii?Q?DewSgbQ1GaomYPpD+1LWUiufIvqTwLlLI6rFmwk5oaq0b1mFF/rybXR3GnAX?=
 =?us-ascii?Q?JacEa4jkA6NT8T3Fkbs1f8ZfXJ1YaoNZPKVw3byDwikCLRT1RfXK+6d5DVFi?=
 =?us-ascii?Q?b/zzjYeKTCtPaYz8C3J32meLeOMHavIloRRlXG9DRclfUT1ejoCSp3zfa9AU?=
 =?us-ascii?Q?UJ6Vw3tXaPijuY81ZwcyQc6ztzoTfTyGDB46qKq016qnJ/9xFQnmC6DRo5lI?=
 =?us-ascii?Q?oD+b7QUhgiR2JhzGaox8Jvm3BlGu0gGDULp40dvHWmp6sPDTPsF2ZpSVWLzo?=
 =?us-ascii?Q?MiWnDDHihbksYdUggg/BJ+YLDDP63vy4amIIzby424gF7C6LHhNHnnx5rjDc?=
 =?us-ascii?Q?Sc1wmIwC2+XShX+mxsUgM09m1GQzheRfZStY/1+pokqrR/9PC78iT18s3lFY?=
 =?us-ascii?Q?kaoZtETlqZBtdGZ1uzE3SrB9XET3Z99kmENoVsZ/vogTsB+M/9ySCTcE6HPy?=
 =?us-ascii?Q?60TLxOmt9oGGlfZzOl9huOqGYeyijj4HEBDkp3iU5dPFB02TIolYsQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 11:27:17.4920
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54977446-ac67-40b8-7677-08dddf135ab3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A2.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8410

We have written the requirements for some of the commands of the XEN_VERSION
hypercall.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
Changes from -

v1 - 1. Reworded the requirement so as to avoid mentioining variable names
or hardcoded strings. Otherwise, one would need to change the requirement
each time the code changes.

v2 - 1. Moved few changes to previous patch.

v3 - 1. Removed the internal implementation details from the design requirements
so that they can be verified by black box tests.

 .../fusa/reqs/design-reqs/arm64/hypercall.rst | 15 ++++
 .../design-reqs/arm64/version_hypercall.rst   | 32 +++++++
 .../reqs/design-reqs/version_hypercall.rst    | 63 ++++++++++++++
 docs/fusa/reqs/index.rst                      |  3 +
 docs/fusa/reqs/product-reqs/hypercall.rst     | 20 +++++
 .../reqs/product-reqs/version_hypercall.rst   | 85 +++++++++++++++++++
 6 files changed, 218 insertions(+)
 create mode 100644 docs/fusa/reqs/design-reqs/arm64/version_hypercall.rst
 create mode 100644 docs/fusa/reqs/design-reqs/version_hypercall.rst
 create mode 100644 docs/fusa/reqs/product-reqs/hypercall.rst

diff --git a/docs/fusa/reqs/design-reqs/arm64/hypercall.rst b/docs/fusa/reqs/design-reqs/arm64/hypercall.rst
index 82ecf690a3..3b4af18323 100644
--- a/docs/fusa/reqs/design-reqs/arm64/hypercall.rst
+++ b/docs/fusa/reqs/design-reqs/arm64/hypercall.rst
@@ -58,3 +58,18 @@ Comments:
 Covers:
  - `XenProd~version_hyp_first_param~1`
  - `XenProd~version_hyp_second_param~1`
+
+Return value
+------------
+
+`XenSwdgn~arm64_ret_val~1`
+
+Description:
+Xen shall store the return value in x0.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~hyp_err_ret_val~1`
diff --git a/docs/fusa/reqs/design-reqs/arm64/version_hypercall.rst b/docs/fusa/reqs/design-reqs/arm64/version_hypercall.rst
new file mode 100644
index 0000000000..ccfcb35a7a
--- /dev/null
+++ b/docs/fusa/reqs/design-reqs/arm64/version_hypercall.rst
@@ -0,0 +1,32 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+Capabilities
+------------
+
+`XenSwdgn~arm64_capabilities~1`
+
+Description:
+Xen shall return xen-3.0-aarch64 to denote that the cpu is running in arm64 mode.
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
+Xen shall return xen-3.0-armv7l to denote that the cpu is running in arm32 mode.
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
index 0000000000..b05481b9dc
--- /dev/null
+++ b/docs/fusa/reqs/design-reqs/version_hypercall.rst
@@ -0,0 +1,63 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+Version
+-------
+
+`XenSwdgn~version~1`
+
+Description:
+Xen shall return its version when XENVER_version command is invoked.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~version_hyp_version_cmd~1`
+
+Error copying buffer
+--------------------
+
+`XenSwdgn~error_copy_buffer~1`
+
+Description:
+Xen shall return -EFAULT if it is not able to copy data to domain's buffer.
+
+Rationale:
+-EFAULT is one of the error code defined in
+http://xenbits.xen.org/gitweb/?p=xen.git;a=blob;f=xen/include/public/errno.h.
+
+Comments:
+
+Covers:
+ - `XenProd~hyp_err_ret_val~1`
+
+Extraversion
+------------
+
+`XenSwdgn~extraversion~1`
+
+Description:
+Xen shall return its extraversion when XENVER_extraversion command is invoked.
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
+Xen shall return its changeset when XENVER_changeset command is invoked.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~version_hyp_changeset_cmd~1`
diff --git a/docs/fusa/reqs/index.rst b/docs/fusa/reqs/index.rst
index d8683edce7..de19b0cda2 100644
--- a/docs/fusa/reqs/index.rst
+++ b/docs/fusa/reqs/index.rst
@@ -11,6 +11,9 @@ Requirements documentation
    product-reqs/reqs
    product-reqs/arm64/reqs
    product-reqs/version_hypercall
+   product-reqs/hypercall
    design-reqs/arm64/generic-timer
    design-reqs/arm64/sbsa-uart
    design-reqs/arm64/hypercall
+   design-reqs/arm64/version_hypercall
+   design-reqs/version_hypercall
diff --git a/docs/fusa/reqs/product-reqs/hypercall.rst b/docs/fusa/reqs/product-reqs/hypercall.rst
new file mode 100644
index 0000000000..9fb46cf451
--- /dev/null
+++ b/docs/fusa/reqs/product-reqs/hypercall.rst
@@ -0,0 +1,20 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+Error Return Value
+------------------
+
+`XenProd~hyp_err_ret_val~1`
+
+Description:
+In case any hypercall fails, Xen shall return one of the error codes defined
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
diff --git a/docs/fusa/reqs/product-reqs/version_hypercall.rst b/docs/fusa/reqs/product-reqs/version_hypercall.rst
index b824c539b0..466eb4108b 100644
--- a/docs/fusa/reqs/product-reqs/version_hypercall.rst
+++ b/docs/fusa/reqs/product-reqs/version_hypercall.rst
@@ -40,3 +40,88 @@ Covers:
 
 Needs:
  - XenSwdgn
+
+Version command
+---------------
+
+`XenProd~version_hyp_version_cmd~1`
+
+Description:
+Xen shall provide a command (num 0) for  hypercall (num 17) to retrieve Xen's
+version in the domain's register 0.
+
+Rationale:
+
+Comments:
+Xen version is composed of major (ie version) and minor (ie subversion) number.
+The minor number is encoded in the 16 least significant bits and the major number
+is encoded in the top remaining bits.
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


