Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C31949599
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2024 18:32:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.772952.1183400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbN6e-0006AT-Nq; Tue, 06 Aug 2024 16:32:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 772952.1183400; Tue, 06 Aug 2024 16:32:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sbN6e-00067i-Kd; Tue, 06 Aug 2024 16:32:16 +0000
Received: by outflank-mailman (input) for mailman id 772952;
 Tue, 06 Aug 2024 16:32:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kzDu=PF=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1sbN6d-0005tQ-4i
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2024 16:32:15 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2416::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6eb5f844-5411-11ef-8776-851b0ebba9a2;
 Tue, 06 Aug 2024 18:32:13 +0200 (CEST)
Received: from SN7PR04CA0114.namprd04.prod.outlook.com (2603:10b6:806:122::29)
 by PH8PR12MB6940.namprd12.prod.outlook.com (2603:10b6:510:1bf::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7849.13; Tue, 6 Aug
 2024 16:32:08 +0000
Received: from SN1PEPF0002636D.namprd02.prod.outlook.com
 (2603:10b6:806:122:cafe::8e) by SN7PR04CA0114.outlook.office365.com
 (2603:10b6:806:122::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.23 via Frontend
 Transport; Tue, 6 Aug 2024 16:32:08 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SN1PEPF0002636D.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7828.19 via Frontend Transport; Tue, 6 Aug 2024 16:32:07 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 6 Aug
 2024 11:32:06 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Tue, 6 Aug 2024 11:32:06 -0500
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
X-Inumbo-ID: 6eb5f844-5411-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CUKCNick5EhAwmTXGGCiAUvG56sGGIbE/0jlDjrMENTfq0HpwciTNqH4BhKAEEOgA7Sud9VaTxOUEYp8U0CFxvZBwileaQUscG1IZwoHm2j31EyxyVXGgpM7KZSnasJa19V/UiaHm6kpHM6leKdMikdGpTf34DeifJlHXJ8Qvro6tJwT/Q5+t7Eb+Hm0rN5hq3YXtA20d1m83rkxPpZzuex+PliFR+NhFkSRppeu/yAU2boeVFNTqsfYNoVlGEZKLvYXwq+XCWRYIi1bECOjp1C7vOyy4do3kwne45NpVw+SaeFMDs9SI8xJO64NZlneMxsPbTh7Y1kOzbPQt+c/WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sjXHs0GS12gvovEpgz4SBPfUlhQQ5tb3kdEgFOzd9ik=;
 b=yQ8wsGhkCFKWxBhthWaf8NucgmpNyNUQc9xoFFbSxbehFojuy2jBmPrGi6C384fj6zymqrCa14iaWbrwb4J7rrA8nSwt90ZZGsNWfkbEyCEdirozt8rfvOHG/q2SpD5S3CRtAjirjKKHvrJwR+2x1M/htHdkqBBa3rOeinePKe6O+Eo88yPS2dkFI1iiTiOVewbaaia18u+9KPHyK9LrVivoSwmmR4VB9Y13QEc1XDg760Pj6Jx5YnMBT6I3VUzf2rlpuwlnNyLYv3IVTHYJMEIbL+KHyyGovYYenOUKEluCpwHslcdOwIP4rZi2H2Mrmqw/zeGcMG03eM3m56OSZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sjXHs0GS12gvovEpgz4SBPfUlhQQ5tb3kdEgFOzd9ik=;
 b=BDGCIU9pQoq3hqv5R4kBzTxP/PuwbV2CW5IZddbjWqkIHAzZubGAOroOH+nEFKbrqhnDuoO0Q4lf6v3PpUgkWRuRZTJCfQe1xhB2WNyE/5T5k8CpNCn0cK/aUiUPh7MeaSTCof/hSPfjP2JmzzbJDLRcqHQMr6t2GllSNa8DW2g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <sstabellini@kernel.org>, <bertrand.marquis@arm.com>,
	<michal.orzel@amd.com>, <ayan.kumar.halder@amd.com>,
	<artem_mygaiev@epam.com>, <julien@xen.org>
CC: <xen-devel@lists.xenproject.org>
Subject: [PATCH v3 1/3] docs: Introduce Fusa Requirement and define maintainers
Date: Tue, 6 Aug 2024 17:31:55 +0100
Message-ID: <20240806163157.2850636-2-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240806163157.2850636-1-ayan.kumar.halder@amd.com>
References: <20240806163157.2850636-1-ayan.kumar.halder@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636D:EE_|PH8PR12MB6940:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a9e3cb0-ac9d-4028-2bad-08dcb635507e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GcwRm+iTfn1qljqEvZS++wUDHHxSYUueDfjwfY8UvP1pNRQ71b/WmSfe1NaX?=
 =?us-ascii?Q?U3X3AjGOtYiwpS8A37iL2OVJ05IdXrKvJQaNDn1UqHuy5MZ1HTfx2xSiB63F?=
 =?us-ascii?Q?4bkUPuOdFh5dfRG/2uMRWvg5yUiHyqWtjIEd5gfAHi45r4c3Oih4dkcJ5IUs?=
 =?us-ascii?Q?yHEykcIIHUDkiCWo4g2O4Zxe7/YTDwuDks5s2oFINtSGsIFIdqCA1b9KdwB6?=
 =?us-ascii?Q?astNru4NiFg28M1qquCC6gnTKIr6N9djKWIiRP5ydNb37OylsreA4goKZKVv?=
 =?us-ascii?Q?E30KSgUsFnPP1g/79cMlmdB6LCly14R0VQFx6UvHW0b+kgkuN9kXTK9cwLDq?=
 =?us-ascii?Q?yWLIkAVOoVawTzOjr9rdP3i+ibYOX0zzCL6M83itMdHM6b+y/UcPodDWtebe?=
 =?us-ascii?Q?MGHAxNhI0/o7Hukbc7vjX/si1kAxfEpuefGp5RNHJ3FHDK56tgUVlOT2waeY?=
 =?us-ascii?Q?9nsUJz0f2JDf08iic5jo9wdheS399+deWfhbxnaIEPc6rOF2mmytX6Y2dmQB?=
 =?us-ascii?Q?ic7LHJ5y0nKtA6C+BDV2hWBvstH/0KNzvvR8qJ+cmL+51++I5HP3KblywQ9y?=
 =?us-ascii?Q?+kJnvqD7P8Jl6EFE0Vv5sl0VPfuZtuV87iNmQmAmPXOAAHOi2JyUcDqXSWU9?=
 =?us-ascii?Q?D0/85WH0MJzbneuZpq2tdwyvRD5/QbXPA/wOuuxLvMrIlINWs6mB/nkzcZAv?=
 =?us-ascii?Q?TBKowTCrX9/pQARg5Mwet2duV+w0Oz73MpP5IuN+EMycFch3GUpQQeKqJrYV?=
 =?us-ascii?Q?raZpp0a3SXDXYc53CHaMVrU3HlWp7bHBUTLX7gKk6uPh00oFJkmqmqBJ/p7O?=
 =?us-ascii?Q?zQgRnurNgKAPcfAsxQoILIpLKUCBYx/oaH361vz2PRVx/W5vwPM2bsL/CrzY?=
 =?us-ascii?Q?ffqtYMAIRxH68ZE+jHQj3lO3872EFZpjpyOx60v33uRyeHUpvgUjm8Be9e24?=
 =?us-ascii?Q?NkawWiy0XpRRbcNnmxdrJ7YUnigEIt2GWESy0qgeZzBVs4TdrbC34aLiWPp8?=
 =?us-ascii?Q?B2JZWXVV4M9AezASijeegy9j0Ef+sQVWtQyRdCMNzHGqe0MBYoSuY9CgOQQd?=
 =?us-ascii?Q?jDGcAc8VP/giKpE/ItC/bTON/Hqo+HvrPB0GT68O43f55EJaBssEqq6aaTBB?=
 =?us-ascii?Q?nF548sisCCaT/Qc0ZGFcRNW6Krc2/xgz3cHO+HsuWZ7KZ3hoXYy8/jC9ZacM?=
 =?us-ascii?Q?F4xk05588nTP2g83i3m0X3b3Ny4tFitMYitkEE0XJrfX/njGbjwNSap71mzD?=
 =?us-ascii?Q?sZ30DbCT0brUbNB2pSe8+jdUR84frfhs1HwhU7hd5lRgJ78anR85dD8q2srN?=
 =?us-ascii?Q?DQ9Ixf5/ZA35Y+AUr6PpJBCOfwAp16hlJ2kzyBQshfDDlfSE3GKXtyPNORNz?=
 =?us-ascii?Q?C9ikIUND1sNzx0ePYOaCzaU5gsN5LDmBeivlLuohvYA0bYL4fQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2024 16:32:07.8954
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a9e3cb0-ac9d-4028-2bad-08dcb635507e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002636D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6940

The FUSA folder is expected to contain requirements and other documents
to enable safety certification of Xen hypervisor.
Added a intro to explain how the requirements are categorized, written
and their supported status.
Also, added index.rst for inclusion in build docs.

Added maintainers for the same.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Acked-by: Bertrand Marquis <bertrand.marquis@arm.com>
Acked-by: Michal Orzel <michal.orzel@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
Changes from :-

v1 - 1. Added a comment from Stefano.
2. Added Ack.

v2 - 1. Renamed README to intro and changed the format from MD to RST
(as the majority of files are in RST format and it gets picked during
building of the docs).
However, the actual contents hasn't changed so I am keeping the acks.

2. Added SPDX license identifier to the intro file.

 MAINTAINERS              |  9 +++++
 docs/fusa/index.rst      |  9 +++++
 docs/fusa/reqs/index.rst |  9 +++++
 docs/fusa/reqs/intro.rst | 86 ++++++++++++++++++++++++++++++++++++++++
 4 files changed, 113 insertions(+)
 create mode 100644 docs/fusa/index.rst
 create mode 100644 docs/fusa/reqs/index.rst
 create mode 100644 docs/fusa/reqs/intro.rst

diff --git a/MAINTAINERS b/MAINTAINERS
index 7c524a8a93..0d328e065c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -314,6 +314,15 @@ F:	xen/arch/x86/include/asm/x86_*/efi*.h
 F:	xen/common/efi/
 F:	xen/include/efi/
 
+FUSA
+M:	Stefano Stabellini <sstabellini@kernel.org>
+M:	Bertrand Marquis <bertrand.marquis@arm.com>
+M:	Michal Orzel <michal.orzel@amd.com>
+M:	Ayan Kumar Halder <ayan.kumar.halder@amd.com>
+M:	Artem Mygaiev <artem_mygaiev@epam.com>
+S:	Supported
+F:	docs/fusa/
+
 GDBSX DEBUGGER
 M:	Elena Ufimtseva <elena.ufimtseva@oracle.com>
 S:	Supported
diff --git a/docs/fusa/index.rst b/docs/fusa/index.rst
new file mode 100644
index 0000000000..13bf4e8e23
--- /dev/null
+++ b/docs/fusa/index.rst
@@ -0,0 +1,9 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+Functional Safety documentation
+===============================
+
+.. toctree::
+   :maxdepth: 2
+
+   reqs
diff --git a/docs/fusa/reqs/index.rst b/docs/fusa/reqs/index.rst
new file mode 100644
index 0000000000..78c02b1d9b
--- /dev/null
+++ b/docs/fusa/reqs/index.rst
@@ -0,0 +1,9 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+Requirements documentation
+==========================
+
+.. toctree::
+   :maxdepth: 2
+
+   intro
diff --git a/docs/fusa/reqs/intro.rst b/docs/fusa/reqs/intro.rst
new file mode 100644
index 0000000000..d67b18dd9f
--- /dev/null
+++ b/docs/fusa/reqs/intro.rst
@@ -0,0 +1,86 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+##################################
+Requirements Introduction Document
+##################################
+
+This folder contains a set of requirements describing Xen and its implementation
+in a form suitable for a safety certification process.
+
+The status is experimental and it is maintained on a best effort basis. The
+requirements may get slightly out of sync with the code. We are actively working
+on a process to keep them updated, more details to follow.
+
+The requirements writing style is inspired from the ANSI/IEEE guide to Software
+Requirements Standard 830-1984.
+
+The requirements are categorized as follows :-
+
+1. Market requirements - They define the high level functionalities of the
+hypervisor without going into concepts specific to Xen. Those should allow a
+system architect to understand wether Xen is providing the functionalities it
+needs for its system. This is the top level of the requirements.
+
+2. Product requirements - They define the Xen specific concepts and interfaces
+provided by Xen without going into implementation details. One or several of
+those requirements are linked to each market requirement. An Architect can use
+them understand how Xen fulfils a market need and design how Xen should be used
+in his system.
+
+3. Design requirements - They describe what the software implementation is doing
+from a technical point of view. One or several design requirement together
+define how product requirements are fulfilled technically and are linked to
+them. An implementer can use them to know how to write or understand the Xen
+code.
+
+The requirements are linked using OpenFastTrace
+(https://github.com/itsallcode/openfasttrace/blob/main/doc/user_guide.md).
+OpenFastTrace parses through the requirements and generates a traceability
+report.
+
+The following is the skeleton for a requirement.
+
+Title of the requirement
+========================
+
+`unique_tag`
+
+..
+
+  Each requirement needs to have a unique tag associated. The format is
+  req_type~name~revision.
+
+  Thus, it consists of three components :-
+  requirement type - This denotes the category of requirement. Thus, it shall
+  be 'XenMkt', 'XenProd' or 'XenSwdgn' to denote market, product or design
+  requirement.
+  name - This denotes name of the requirement. In case of architecture specific
+  requirements, this starts with the architecture type (ie x86_64, arm64).
+  revision number - This gets incremented each time the requirement is modified.
+
+
+Description:
+This shall describe the requirement in a definitive tone. In other words,
+the requirement begins with 'Xen shall ...'. Further, the description is
+expected to be unambiguous and consistent.
+
+Rationale:
+This describes a rationale explaining the reason of the presence of the
+requirement when this can help the reader. This field can be left blank.
+
+Comments:
+This describes the use cases for the requirement when this can help the
+reader. This field can be left blank as well.
+
+Covers:
+This denotes the unique_tag of the parent. This field is non existent for the
+market requirement as it is the top level.
+
+Needs:
+This denotes the requirement type of its children. This field is non existent
+for the design requirements as there are no subsequent requirements linked to
+them.
+
+
+The requirements are expected to the technically correct and follow the above
+guidelines.
-- 
2.25.1


