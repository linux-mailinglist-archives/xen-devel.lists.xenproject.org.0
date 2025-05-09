Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33BE8AB1229
	for <lists+xen-devel@lfdr.de>; Fri,  9 May 2025 13:25:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.980066.1366553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDLqi-00071J-DU; Fri, 09 May 2025 11:25:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 980066.1366553; Fri, 09 May 2025 11:25:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDLqi-0006vm-8U; Fri, 09 May 2025 11:25:04 +0000
Received: by outflank-mailman (input) for mailman id 980066;
 Fri, 09 May 2025 11:25:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EUpd=XZ=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1uDLqg-0006tC-DL
 for xen-devel@lists.xenproject.org; Fri, 09 May 2025 11:25:02 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062f.outbound.protection.outlook.com
 [2a01:111:f403:2413::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3bd4cf2f-2cc8-11f0-9ffb-bf95429c2676;
 Fri, 09 May 2025 13:24:57 +0200 (CEST)
Received: from BL1PR13CA0337.namprd13.prod.outlook.com (2603:10b6:208:2c6::12)
 by BL1PR12MB5875.namprd12.prod.outlook.com (2603:10b6:208:397::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.20; Fri, 9 May
 2025 11:24:53 +0000
Received: from BL6PEPF0002256F.namprd02.prod.outlook.com
 (2603:10b6:208:2c6:cafe::2) by BL1PR13CA0337.outlook.office365.com
 (2603:10b6:208:2c6::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.19 via Frontend Transport; Fri,
 9 May 2025 11:24:53 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF0002256F.mail.protection.outlook.com (10.167.249.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Fri, 9 May 2025 11:24:52 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 9 May
 2025 06:24:52 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 9 May
 2025 06:24:52 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Fri, 9 May 2025 06:24:51 -0500
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
X-Inumbo-ID: 3bd4cf2f-2cc8-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N/NME4193/5d7h3wMVrYSyoUtjN8PR6I4gCaGfBvTFO7+FFu+bMp8bTkd/5SGFKWqvphG7OiI+6FaQQIxYY0AopJli6Ak8L9XLicuwpMU1f/FgzCzfawkP6VD931REITpp5r6QRwl7jzMVJHvZ6zL9lriCulZv9NuEvBs/Wuh+uIQXDlh+Kzjq4W9Jt8vH3LFslX3cUrC9cqD8Bvd6Erx2QZEwDmHth1dTrbuIm0BihXUkCDkhPKDtQf8oHfPquLs34YwV8jRqdfXc4u8tWA30ZRnaRzqx16LumybeV9xP+HpPyoSH6wSFo6NPhclBa1bMIU2fBfOJyUCiz0+Rpfjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WVKkUdt3hcJ9rnBcdLqTXtvfvnvp3XTzvanHy9lyaYo=;
 b=HcrTDJqTd5KXfSRZjBEqvDKqBgr2lDTLbop8besQYinv+2qAG35AEomWv4kT3iFBP5b7xhsEjyT7guf5GrjA3HTYAlQHnumNF9aQtig5bYcNoAgpcu1LEuha5ocfFdJqpEy+RZupc8gTOz+8UwUoJCM0N+lEZ9C/SW9paqyXH2vW1MKhio/MEnkwFxS3QfLCy9PsKjDG8lVEwsHFEwzVXLhRGfnp5bvOyESGS3cmg5lYaKEZGRO/avEzE9Et7ZnvoVgfTjyWkqi1paWRAx3J0VypZlm3CcBX3ZWNp1Wa1gLxtVLx+SNVh0KPDYhuqPUeMHIXxhpj5LLRFQTlUJVvvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WVKkUdt3hcJ9rnBcdLqTXtvfvnvp3XTzvanHy9lyaYo=;
 b=ak3Hl/Q2uGHTqWQFfa5PMrf1hxAAyFBarFZRoVa7FH0c2Nv5vi1YdlrBk1pIxTx5qtnysQ6pW1YGOPlTYogOX6LHgzL9tn61K2XK31nrGo+bZpTAZ7xMeW7ecmj8R3iJP+Dj73mBjahQ/Emmz9jxpoSc4ELZZh7ctFD2mVQBo9w=
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
Subject: [PATCH v3 2/2] docs: fusa: Add the requirements for few commands of XEN_VERSION
Date: Fri, 9 May 2025 12:24:47 +0100
Message-ID: <20250509112447.2931909-2-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250509112447.2931909-1-ayan.kumar.halder@amd.com>
References: <20250509112447.2931909-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0002256F:EE_|BL1PR12MB5875:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b74b037-3dfb-4102-7cd8-08dd8eec1e59
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ejn6ht6DRUd//9e75Gg4tWuPhk/JYTRE5ejFNssW8HcBmw1m2QyVPdnhHPfe?=
 =?us-ascii?Q?b49I2bkEIftJEoRlAiCUiFhQplUo2Nc7Hw1IOe/DhgifcvqI970OWrz/L9+G?=
 =?us-ascii?Q?nQ3rQ0TAnmxirBCtp7lgWFwK1rmb0RzLH2NlQJEalCIOe8c024hNEE0gH1dc?=
 =?us-ascii?Q?bXGbBlOLw3BbwFjs+BqYFLtmidbEtwD+NmSqCPt13uoZ3iNynC70ei2Avo6w?=
 =?us-ascii?Q?zyhXMbVfX/NlP9Ts+NTk94Ot83/8hc0veTKyvskDj3Ef6nBIM37si4+/1D7Q?=
 =?us-ascii?Q?jgeMVgT4VbP+9y0V7ZLxFdPRlw5UT8wK16GgVUD6oZQwVdFSTe6o29BiwYEY?=
 =?us-ascii?Q?zwrF4Ve2h/B16tsDfXQ6NQ4EMlsKxIiQfehnM41vEELfwH+Zsx2fXVeVckTL?=
 =?us-ascii?Q?vq1KmFqWJCBGykRNXfyHSXmMQvKt+WXjugrK5rhASi88kMkSuIug+y+lG/QK?=
 =?us-ascii?Q?PvHxZVljamSnDWgDvfZjk4f7kpY2amy3hq2mEVKB2jAEHv9vPuw1OiT6q71b?=
 =?us-ascii?Q?nBwkBYO22bk2cuBQ2NRPxYSKuwEbl61r2gkMB3gvi7ticEFePX7q/s3e9U2R?=
 =?us-ascii?Q?pmv9eAgDQmNFKZkpQHGVRO0Tpc6J5/6CEuaTIqZ4jyan3Yu+9/wg5IX5OZQI?=
 =?us-ascii?Q?AdGlgdKm4U1KyHQo8PCK0Hg3ElIi7l8tJ6KHiOHa+0u7vAQGzJZKvtu3X7KI?=
 =?us-ascii?Q?YaFwovcAfA0R4GlgC7Aq4fn3M9pXqymVtA4iXBxIlt6o3XgddiXvrXCVFfpX?=
 =?us-ascii?Q?ZEc3LGtD+pHXSMNFgtnvmfB3ugvBc8h4DNf2IOwvqXIM+xiOBFK5YKWmVNqd?=
 =?us-ascii?Q?9rk7mR0Utt/Gkepjkh16+lzVGRbR19rA672IMl4wWn15Cb41o2WAjr3ZiD16?=
 =?us-ascii?Q?+ntGTWcyb4xEt2f06Z/v39+chNXrFJc/BV4Xo9l6TaC1cVBIcQmxdOK0W9D9?=
 =?us-ascii?Q?9YqCTPmldL+n9GHudJ7/FQtkcU7L1podrOakqILguFERhwynftHL3UZdZQQi?=
 =?us-ascii?Q?AJ9YqxEDpmD6/aNYLVEkwZ1AE9PQ7gtQqSGKgA9W1t2PPTmwyCLPZOnjudG+?=
 =?us-ascii?Q?2MTC8AjtOSoZ6S/583kthbJKX/htaTpmPMzn1vwzLYXhHlJGhSgnA/Y9LNEi?=
 =?us-ascii?Q?8QO3C3Q7t7wSs4f/W3PQOzAwHcpevpF9H6qa+RDQmL9V3EIGXYrJaANOV3Xq?=
 =?us-ascii?Q?ZqYcNDEpr4Ic2bQQ1hX/iz9lwCIPfAsJRVROE+zvACh346NpE7f5WHG8l0+Q?=
 =?us-ascii?Q?qx57E9hRvIqMi46P5Lin3cnJNPgkrOUQrs54oVfWURB56woafThbhssflwf0?=
 =?us-ascii?Q?xJN/FJs7bfUXvnWJMoR5SOTfVvnTHCLQ4BLCbHZhIyqB9JgZzhiSXNz8xG4v?=
 =?us-ascii?Q?BnPjShvTqwFKbntu0EVfjo3jDIpKsTxdh/NXy9+2nJreHnSiHug9F6dnvIa5?=
 =?us-ascii?Q?A6IiIMwg2XmeDWDfiwumHt7jucc84qEa2oeGGuwaZbdaomxkjI5yPw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(13003099007);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 11:24:52.8634
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b74b037-3dfb-4102-7cd8-08dd8eec1e59
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF0002256F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5875

Define requirements for specific commands.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
Changes from -

v1 - 1. Reworded the requirement so as to avoid mentioining variable names
or hardcoded strings. Otherwise, one would need to change the requirement
each time the code changes.

v2 - 1. Moved few changes to previous patch.

 .../fusa/reqs/design-reqs/arm64/hypercall.rst | 15 ++++
 .../design-reqs/arm64/version_hypercall.rst   | 34 ++++++++
 .../reqs/design-reqs/version_hypercall.rst    | 82 ++++++++++++++++++
 docs/fusa/reqs/index.rst                      |  3 +
 docs/fusa/reqs/product-reqs/hypercall.rst     | 20 +++++
 .../reqs/product-reqs/version_hypercall.rst   | 83 +++++++++++++++++++
 6 files changed, 237 insertions(+)
 create mode 100644 docs/fusa/reqs/design-reqs/arm64/version_hypercall.rst
 create mode 100644 docs/fusa/reqs/design-reqs/version_hypercall.rst
 create mode 100644 docs/fusa/reqs/product-reqs/hypercall.rst

diff --git a/docs/fusa/reqs/design-reqs/arm64/hypercall.rst b/docs/fusa/reqs/design-reqs/arm64/hypercall.rst
index f00b0b00f9..f58a9d50aa 100644
--- a/docs/fusa/reqs/design-reqs/arm64/hypercall.rst
+++ b/docs/fusa/reqs/design-reqs/arm64/hypercall.rst
@@ -56,3 +56,18 @@ Comments:
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
+Xen shall store the return value in first cpu core register.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~hyp_err_ret_val~1`
diff --git a/docs/fusa/reqs/design-reqs/arm64/version_hypercall.rst b/docs/fusa/reqs/design-reqs/arm64/version_hypercall.rst
new file mode 100644
index 0000000000..3aa12ea2c2
--- /dev/null
+++ b/docs/fusa/reqs/design-reqs/arm64/version_hypercall.rst
@@ -0,0 +1,34 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+Capabilities
+------------
+
+`XenSwdgn~arm64_capabilities~1`
+
+Description:
+Xen shall have an internal constant string to denote that the cpu is running
+in arm64 mode.
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
+Xen shall have a internal constant string to denote that the cpu is running in
+arm32 mode.
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
index 0000000000..aac5896965
--- /dev/null
+++ b/docs/fusa/reqs/design-reqs/version_hypercall.rst
@@ -0,0 +1,82 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+Version
+-------
+
+`XenSwdgn~version~1`
+
+Description:
+Xen shall have a internal constant (XEN_VERSION) storing the version number
+coming from the Makefile.
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
+Xen shall have a internal constant (XEN_SUBVERSION) storing the sub version
+number coming from the Makefile.
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
+Xen shall have a internal constant (XEN_EXTRAVERSION) storing the extraversion
+coming from the build environment.
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
+Xen shall have a internal constant string (XEN_CHANGESET) storing the date,
+time and git hash of the last change made to Xen's codebase.
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
index 0000000000..b57b9acde8
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
diff --git a/docs/fusa/reqs/product-reqs/version_hypercall.rst b/docs/fusa/reqs/product-reqs/version_hypercall.rst
index 400d51bbeb..2ef1c4f9ca 100644
--- a/docs/fusa/reqs/product-reqs/version_hypercall.rst
+++ b/docs/fusa/reqs/product-reqs/version_hypercall.rst
@@ -41,3 +41,86 @@ Covers:
 
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


