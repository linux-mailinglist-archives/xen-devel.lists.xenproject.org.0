Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A385A4828A
	for <lists+xen-devel@lfdr.de>; Thu, 27 Feb 2025 16:11:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.898228.1306812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnfXQ-0001F0-UP; Thu, 27 Feb 2025 15:11:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 898228.1306812; Thu, 27 Feb 2025 15:11:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tnfXQ-0001D9-RZ; Thu, 27 Feb 2025 15:11:00 +0000
Received: by outflank-mailman (input) for mailman id 898228;
 Thu, 27 Feb 2025 15:10:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=X082=VS=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1tnfXP-0007UI-3q
 for xen-devel@lists.xenproject.org; Thu, 27 Feb 2025 15:10:59 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20623.outbound.protection.outlook.com
 [2a01:111:f403:2416::623])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0a8aa307-f51d-11ef-9898-31a8f345e629;
 Thu, 27 Feb 2025 16:10:57 +0100 (CET)
Received: from BN0PR07CA0029.namprd07.prod.outlook.com (2603:10b6:408:141::11)
 by MN6PR12MB8591.namprd12.prod.outlook.com (2603:10b6:208:471::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Thu, 27 Feb
 2025 15:10:52 +0000
Received: from BN2PEPF00004FBE.namprd04.prod.outlook.com
 (2603:10b6:408:141:cafe::76) by BN0PR07CA0029.outlook.office365.com
 (2603:10b6:408:141::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8489.19 via Frontend Transport; Thu,
 27 Feb 2025 15:10:52 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF00004FBE.mail.protection.outlook.com (10.167.243.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8489.16 via Frontend Transport; Thu, 27 Feb 2025 15:10:51 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 27 Feb
 2025 09:10:10 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 27 Feb
 2025 09:09:29 -0600
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Thu, 27 Feb 2025 09:09:28 -0600
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
X-Inumbo-ID: 0a8aa307-f51d-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NZ4dnX7ArSR5E9Oc/AJuPMjkZvVuDcQDEA9/t+e7ERvwmjDp3UtSM1zyn+u7FhYE3A+bh+BEaQ/7vphW4I6ecS1e+1LnhFVNzJDF/sbc98Lc1aE3M1PRobh+MMg13uPpv44mIlvVlInRpYBoXnrRawRLR6RzZ+XIG5suz6RC3ynXfbx5NSf6rpv1oSHTNwbrVq5htshel/fyVvoU3ZlI1LXW6Dc9z9Og+Qri6w3qt0T8cnhEHsEPumPmlWc9zkwBBV8/3HeZQk9Eb66zncOYYJ4dh8B2v9qmMnx4NCkAqsp/gW/WFBNIjASiM9sYMwHnvDb9TFvaUtBmy9OCEnBTpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=650B3ReDrw/HMm/FNuUQzjOth5xTPT8LN8hLk9iKhKg=;
 b=IEPKkyBULLuzZZRvhr7Ahik+YGeoECXaj88tD/KGeuA7+7wpbR/K0gy7UWIYiuPa9MI6V+ppjAM4LqQOAKviUDjD8+9g3BYRgGOaFqJIDXHH+hYTKyYP0ZC81ABmcRfVS8L0OMyYXXoZo5DChpr+zzCssNHVLurIobFuYGSK/SoL3ZrZwcFMCIE8t9zPbtmVm8D2zwG/Nw9rEe0YYt3HUtWUFpWRvPvmbN+CMVJfE+jPNXaVg/UYd4OnhgHazve9e7wZ9Xeoxfl85xySOqxDClM3z29+TQFAT0MHr/TsGsl9ieT39ZGL5MsN2gydOOMbFnv3sjr35ZDwLbLWVczGOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=650B3ReDrw/HMm/FNuUQzjOth5xTPT8LN8hLk9iKhKg=;
 b=SUUYc3x+0SkKBTPcy2eOVGK8/ZI6H1xMDimLhx0OeIYu5IYWA9nQGB9mwsEUtcUFfqxZg+LLGYYs3DCrhgzwGZ1xH8ZGw6Lzvu5iBcuxwVK2VXV2kor2cnBWLL8tbZTTaySVUKFaz1+PotZzLRjtXjvz1EN/Vtv4u16O3C+Yzas=
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
Subject: [PATCH v2 2/2] docs: fusa: Add the requirements for some of the commands of XEN_VERSION
Date: Thu, 27 Feb 2025 15:09:22 +0000
Message-ID: <20250227150922.3965010-2-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250227150922.3965010-1-ayan.kumar.halder@amd.com>
References: <20250227150922.3965010-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBE:EE_|MN6PR12MB8591:EE_
X-MS-Office365-Filtering-Correlation-Id: 99ebe27a-233c-415c-a958-08dd5740ecdb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?i5aHEnt7al351/qcybxOo4qCzaVejsmdE1VyVTCL1DGqkFZCqYQBoqC/GEl/?=
 =?us-ascii?Q?/mwa6kACK+BNGPeJBbNAKwvh7tpDoJTdJXXQTjlYjjvdJnSr/pPudS09adyc?=
 =?us-ascii?Q?8BSBnohCMuleB2HTkzJyuQ94J0uxK0TqsVBmMpeyqvW9J3uDbLrJ4/R2Kz1x?=
 =?us-ascii?Q?51wdMJvdW0xnSChFEGRpzDZob8zOJHR/BGr1z/1GJHr7QdckvyCvfnqpgdOd?=
 =?us-ascii?Q?kNEXCLa3Hd06KKOw4R2Y3WPEGiwfcMbkW0ge5setY7rOECiY5S8Eb//iCfxJ?=
 =?us-ascii?Q?YAuMaRzRyQOCoGcWMmB6aSjpbbE0vMp3/TZ3HzcIkNorxqYxjDpoIUtlOu97?=
 =?us-ascii?Q?ROqjmFbSE79tEoF+Embp+zgs7w9l6EpqdXWjlh3gr3h6DfJAeBn30932fAQv?=
 =?us-ascii?Q?fDJ6/f7jYCs7Btc0RqslZUfnVan06XAiDoAb5J3o3Unh16FMGfM2I4Bl7+KY?=
 =?us-ascii?Q?bQz7aME9Qj4xEBcuhbGNqVn7x7B0UJnKwrRDzPGXyD6taJJD1Z85PV7QQhyP?=
 =?us-ascii?Q?Qf75a47lq2xhaB5bZiufN6ChJ/hk7c1aUQxwT1+LEcV7q6VhTzviQ8Y2QP8q?=
 =?us-ascii?Q?1SswFe+2BmlLyApmML6Li/vVOSCt8Peg8BwSKG8qwbkkXrVS4bPtjekOOfpm?=
 =?us-ascii?Q?WQM/0hoqoU+Q7Jffie8hhvNkbv4qjetGgzV3hqNmt5mB8QwwAZSIYq964w6B?=
 =?us-ascii?Q?qQW0hOB7w1PD4dRDdrInJCNCAPDD4XaZ+uybkcTWNlPQgujo1u57cBeMJW9S?=
 =?us-ascii?Q?UURfF/5wtcNwDd1yYfL7PKgEQBCt6Of6BH30rKeXWzC4Fq2ZrJK0zVs3L8/w?=
 =?us-ascii?Q?1yVdaxCNWBFB+qIX/ZKN/K1or155AOWaWd6+q6F9KSb4b5w0VMCqg/v9TSA4?=
 =?us-ascii?Q?MK4nES10zlJ4CfkrBafm1fXZpvy1cq4ph4LeY/DQBkyoql58RRnD0lxABn+G?=
 =?us-ascii?Q?ZIZlYWNxFMDxJTM/b+hoH+iTjQtsgxUKhSuVFq9nMWh7/npn4d7NieGV3U12?=
 =?us-ascii?Q?0bZZ22kJ1k3I6A4yvDtREvgo6x9x/Q5y0//HSmx3xFkmvq7wA3fIZsqNoVLj?=
 =?us-ascii?Q?2myphsHaoOgdBA1jTzOq63GeKULhT4mquWDSqnxT+bLwCkTqZT6y38aLAo1r?=
 =?us-ascii?Q?iAhBnI4u3pBq8ollNU3EtfaBuXoboUtY5iy+lrS4YlzChiWmUWY0PLoqVwHn?=
 =?us-ascii?Q?Ltp42qcVOhnDYB+1gk9NEZlqWV+5uhj6yNZdRvE5IBOOvXUIUP6QRaZ19DQG?=
 =?us-ascii?Q?FMu9OVkrOoEDW/Ae4rCqLDFRmlEGIclXHegGHtkSgPuGZJptaY6cJN43D2dC?=
 =?us-ascii?Q?1zZ7wJKerx7T11DhyQfvQ1T+aHqF3g31a7qM7aNUA1v++dXfbqSKfn1M5iYH?=
 =?us-ascii?Q?NkR/30KUAInDmI+Cv3OylNgvknGLPjfew9+EAwXkQ4ctJepjED9Gc3MLc2B8?=
 =?us-ascii?Q?zLlXfDto0jG5NWE+frDHcC5cLypNBRnk6q1DLLmJt5juwNNrxl5sYlv4NgH+?=
 =?us-ascii?Q?uPEB+eFhOm0UIEQ=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2025 15:10:51.9351
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 99ebe27a-233c-415c-a958-08dd5740ecdb
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF00004FBE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8591

We have written the requirements for some of the commands of the XEN_VERSION
hypercall.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
Changes from -

v1 - 1. Reworded the requirement so as to avoid mentioining variable names
or hardcoded strings. Otherwise, one would need to change the requirement
each time the code changes.

 .../fusa/reqs/design-reqs/arm64/hypercall.rst |  6 +-
 .../design-reqs/arm64/version_hypercall.rst   | 34 ++++++++
 .../reqs/design-reqs/version_hypercall.rst    | 65 +++++++++++++++
 docs/fusa/reqs/index.rst                      |  2 +
 .../reqs/product-reqs/version_hypercall.rst   | 83 +++++++++++++++++++
 5 files changed, 187 insertions(+), 3 deletions(-)
 create mode 100644 docs/fusa/reqs/design-reqs/arm64/version_hypercall.rst
 create mode 100644 docs/fusa/reqs/design-reqs/version_hypercall.rst

diff --git a/docs/fusa/reqs/design-reqs/arm64/hypercall.rst b/docs/fusa/reqs/design-reqs/arm64/hypercall.rst
index ffd883260c..b6f99af023 100644
--- a/docs/fusa/reqs/design-reqs/arm64/hypercall.rst
+++ b/docs/fusa/reqs/design-reqs/arm64/hypercall.rst
@@ -28,8 +28,8 @@ Parameters
 `XenSwdgn~arm64_hyp_param~1`
 
 Description:
-Xen shall use x0 to read the first parameter, x1 for second parameter and so
-on, for domain hypercall requests.
+Xen shall use the first register to read the first parameter, second register
+for second parameter and so on, for domain hypercall requests.
 
 Rationale:
 
@@ -45,7 +45,7 @@ Return value
 `XenSwdgn~arm64_ret_val~1`
 
 Description:
-Xen shall store the return value in x0 register.
+Xen shall store the return value in first register.
 
 Rationale:
 
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
index 0000000000..edc5672e83
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
index 03221f70c3..ae72b22556 100644
--- a/docs/fusa/reqs/product-reqs/version_hypercall.rst
+++ b/docs/fusa/reqs/product-reqs/version_hypercall.rst
@@ -54,6 +54,89 @@ Rationale:
 
 Comments:
 
+Covers:
+ - `XenMkt~version_hypercall~1`
+
+Needs:
+ - XenSwdgn
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
 Covers:
  - `XenMkt~version_hypercall~1`
 
-- 
2.25.1


