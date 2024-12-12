Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 545C59EFC01
	for <lists+xen-devel@lfdr.de>; Thu, 12 Dec 2024 20:04:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.856272.1268945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLoTQ-0002ri-MM; Thu, 12 Dec 2024 19:03:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 856272.1268945; Thu, 12 Dec 2024 19:03:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tLoTQ-0002p3-J8; Thu, 12 Dec 2024 19:03:44 +0000
Received: by outflank-mailman (input) for mailman id 856272;
 Thu, 12 Dec 2024 19:03:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zmqK=TF=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1tLoTP-0002ox-Hr
 for xen-devel@lists.xenproject.org; Thu, 12 Dec 2024 19:03:43 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on20622.outbound.protection.outlook.com
 [2a01:111:f403:2415::622])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cc7359ee-b8bb-11ef-a0d5-8be0dac302b0;
 Thu, 12 Dec 2024 20:03:41 +0100 (CET)
Received: from CH0PR13CA0034.namprd13.prod.outlook.com (2603:10b6:610:b2::9)
 by PH8PR12MB7136.namprd12.prod.outlook.com (2603:10b6:510:22b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Thu, 12 Dec
 2024 19:03:33 +0000
Received: from DS3PEPF000099DE.namprd04.prod.outlook.com
 (2603:10b6:610:b2:cafe::fc) by CH0PR13CA0034.outlook.office365.com
 (2603:10b6:610:b2::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8251.16 via Frontend Transport; Thu,
 12 Dec 2024 19:03:30 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF000099DE.mail.protection.outlook.com (10.167.17.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8251.15 via Frontend Transport; Thu, 12 Dec 2024 19:03:29 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 12 Dec
 2024 13:03:29 -0600
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Thu, 12 Dec 2024 13:03:28 -0600
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
X-Inumbo-ID: cc7359ee-b8bb-11ef-a0d5-8be0dac302b0
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ooa2XCg1/xu+r0tTHWN3IIkdLlfQW634HnWby1ZThshoaHNdqD0x8qY5zkjfrKh2LP2MQq77um0GqZCAli8aT9Ja1L6FBpU5A5hYZFnuPB/0i3Uy4tc4SDBkIvXOiZH/M8PsGMhg+JfP0aD8zQ1m+Mc2GSJDhBLWGLtdry6VCFc9NNvUpJOvNCn+Rh8/aTlNS+gNlQ4x+1LoB7wEJ5Zi+5m8xGJ1qjKxAJxOBCw/LpffsPPE3IJ1j2FyFLBVliD+vxWYtlz6oFTfhPE0E83H3EcHuihXOqhH3ZICaimKPMRttjvkn2xrN34cN5eY1elv2/MI5DcwTHY7c5bC+Bv2BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hE5i8yz04k/YaqHxjYahPmbZibPdXdt4siNvS6ou3qM=;
 b=wSGkHLKd4RENTJzfKKAieC4BCtVMvFwJtRqGwzFTCfqLFXRcp5taFAUk0IFe6msuYUsGrP53/WPkTErQOQxDUotvEwxxKKGQyiDWh9Q4tqJ7OxZTVhYoZDA+2Kaw6QBlSkDkdWk/QTTaD/mnnsKUYjeTAUj6S395grwmcMgNXnA2i0d6KmMuEMnQ/M/t5XfKJycXnZrTqrf5ngWiLaIOlXeAxIfJdh6HkH5tA4pGsizlCuZJ7ZrnftM5+1tHk5tPZrlbpJuwONxhqkR6QHvkT+J4qGjkVnllpi2/dpuwtwYn1Wz/nOYEJDxNwdmRvN5QL9Z13/0n9IN66Op09QEttw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hE5i8yz04k/YaqHxjYahPmbZibPdXdt4siNvS6ou3qM=;
 b=OCf0NjLnSiS8xI+6q/zC+y7YNKCDhyEYSffMNdLkWn59qA4bkAj1/Tw3Iuk/Kh2mxWjDRh8Wnz8vxJZiqIvgp/oJ+MBwi0gGpx0d/firJkB3aoI4IzRVtwOI8H6rOww5TOoFxfGavqfcwrl15ur8/dBb+h0AJcTMutGLOmgxHa4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, "Ayan
 Kumar Halder" <ayan.kumar.halder@amd.com>, Artem Mygaiev
	<artem_mygaiev@epam.com>
Subject: [PATCH v2] docs: fusa: Add dom0less domain configuration requirements
Date: Thu, 12 Dec 2024 19:03:25 +0000
Message-ID: <20241212190325.2130129-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099DE:EE_|PH8PR12MB7136:EE_
X-MS-Office365-Filtering-Correlation-Id: 9bd9b888-7cb7-417f-81b7-08dd1adfaa7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sftnQDGku6FnWNN+8hfY75AZ0FEyWJ7iqzsbGs64FIOWfs5rMonLSvRR/gl5?=
 =?us-ascii?Q?Wac2spSqIbz+De2lQv+FrPyurGrH+BURErCRWQyEOTF9Jxu2fQEhl8bWi0qE?=
 =?us-ascii?Q?RvUEYQLudcTXMyT+WUnsOJ6eGKjFDUFDdKxtxVNrV0HOaLRdXAjkA1kiFCZX?=
 =?us-ascii?Q?BrCvhpfaFicc3J6UbJC3yGVY7B/01cEtDSIlRXpKBesxLOzu5B2ZihXOpU7f?=
 =?us-ascii?Q?WHrbk5sci93Ce6Uikz2kTSHdLyaG/hncJjiGveAZeRFe+3fKUdWIISwSSD8F?=
 =?us-ascii?Q?hkPwt1TNbJredmJgbvAJIm6n7nUwFbErk8SiCfRzLpNQI76vNisYBUZqVa7q?=
 =?us-ascii?Q?2WV0tab281Y+ygbhQCU82JRjPuVovsVBvTj4zOF2VYRqpec6jqGyX78dhRm9?=
 =?us-ascii?Q?Hdgp4jCrvAMe742u2puXLZsCZrHr8Eq361W6b0UrgaC9bSN1tKmIf1tAt9xx?=
 =?us-ascii?Q?c/T7xBXPN1CFDO7Q1Bpu3nxlkHQQ5BLFxYD1PUwyplTDRGkib6THprUik2fA?=
 =?us-ascii?Q?QmyczFSSYzSieMb24eYKrolveL8RyL3At1BDd5wq4vi+xcsNh+qubzcS4Sts?=
 =?us-ascii?Q?s1f2Yl8uc4J29k+QPozjOWpe6bnjffSi1XOzcf+Zu84PEWjhF/se1GuuFMpj?=
 =?us-ascii?Q?gMTxWXLS317l0rOCMOIvs6/MxKdLEtqYMfYpmj3su1iNXIYhGXSbrF6hH25b?=
 =?us-ascii?Q?gNpeBDAoKe9UNkfoU4JrSU36VT1wdVTgCW1UfFRnBBX2GGGCPmDq4K6wl/Bb?=
 =?us-ascii?Q?C6H8xSBWXChYpErLZR7FgmrWLwcOtfy2+/uE3ExIrhJ80gBSCBOaCRk5mGSL?=
 =?us-ascii?Q?yaz1JMb40X5AoTHuFXnYmXUr0eik76HuXptO+q+RiJa3cVSjiHC3/QPQSctN?=
 =?us-ascii?Q?oa1vJo6ge75W3RNKKYIe03GWhtPseS2Tn29LsuiTJiw/6ulfSCgFkuC+WBSt?=
 =?us-ascii?Q?cqPtTWZNWTfNJtR/OfIt/xHQyLl/es21bQYmRwmXfE2699pfR/STxI/g3l7+?=
 =?us-ascii?Q?t0PgFi3SifZv0dG3Jmkvz2zDwsVlI0mRO1zVQg7VPNMcvtlrCRESoY1y8sFl?=
 =?us-ascii?Q?g2y1vYCTQWGIwtzwN/+qqzrdQpxc72ZxMJKcWJS/wcvCUw8pNAR8zB3ZLy2U?=
 =?us-ascii?Q?Ut4/PuEX7AboQsQXYHGKk0H+Z8blqyMzfCAfcPSVmait5IxE7HykDR3T6XjM?=
 =?us-ascii?Q?9lmLU1iO8czgL1u+Pdj/lh1HbgA7shzjxC/MvKHeA8lHp+qEIl2amB6jzkuR?=
 =?us-ascii?Q?qpCGuD9XNQ71hvcb792SRzBIf+scSCx805KbpZ46gLqgunmPSZauu3ydfe4+?=
 =?us-ascii?Q?k01m1ZVTB5QPc5kjIHBH3X88634RkzcKBErAaOexVoPYcbRdDt3UK79pQ7Ek?=
 =?us-ascii?Q?QpN4E3SdtybQ2hpSkuGDhETa4S2NR067YPPQqHuxLfG8X1xXRw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2024 19:03:29.5922
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9bd9b888-7cb7-417f-81b7-08dd1adfaa7d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099DE.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7136

From: Michal Orzel <michal.orzel@amd.com>

Add requirements for dom0less domain creation.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
Changes from v1 :-

1. As the dom0less domain creation requirements specifies the dt properties
for creating domains, it has been moved to product requirements. Product
requirements define the interface Xen exposes to other domains.

2. For the requirements which introduces new terms (like grant table, etc), I
have provided the definition as part of the comments.

3. Introduced new market requirements to specify that Xen can assign iomem and
irqs to domains.

4. The design requirements will be added later.

 docs/fusa/reqs/market-reqs/reqs.rst        |  16 ++
 docs/fusa/reqs/product-reqs/arm64/reqs.rst | 306 +++++++++++++++++++++
 2 files changed, 322 insertions(+)

diff --git a/docs/fusa/reqs/market-reqs/reqs.rst b/docs/fusa/reqs/market-reqs/reqs.rst
index f456788d96..47e1b6ad61 100644
--- a/docs/fusa/reqs/market-reqs/reqs.rst
+++ b/docs/fusa/reqs/market-reqs/reqs.rst
@@ -47,3 +47,19 @@ Comments:
 
 Needs:
  - XenProd
+
+Static VM definition
+--------------------
+
+`XenMkt~static_vm_definition~1`
+
+Description:
+Xen shall support assigning peripherals to various domains.
+
+Rationale:
+
+Comments:
+Peripheral implies an iomem (input output memory) and/or interrupts.
+
+Needs:
+ - XenProd
diff --git a/docs/fusa/reqs/product-reqs/arm64/reqs.rst b/docs/fusa/reqs/product-reqs/arm64/reqs.rst
index db91c47a02..66f2978733 100644
--- a/docs/fusa/reqs/product-reqs/arm64/reqs.rst
+++ b/docs/fusa/reqs/product-reqs/arm64/reqs.rst
@@ -40,3 +40,309 @@ Covers:
 
 Needs:
  - XenSwdgn
+
+Linux kernel image
+------------------
+
+`XenProd~linux_kernel_image~1`
+
+Description:
+Xen shall create a domain with a Arm64 Linux kernel image [1].
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenMkt~run_arm64_domains~1`
+
+Needs:
+ - XenSwdgn
+
+Gzip Linux kernel image
+-----------------------
+
+`XenProd~linux_kernel_gzip_image~1`
+
+Description:
+Xen shall create a domain with a Arm64 Gzip compressed Linux kernel image.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenMkt~run_arm64_domains~1`
+
+Needs:
+ - XenSwdgn
+
+Kernel with uImage header
+-------------------------
+
+`XenProd~kernel_uimage~1`
+
+Description:
+Xen shall create a domain with a kernel containing uImage header [2].
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenMkt~run_arm64_domains~1`
+
+Needs:
+ - XenSwdgn
+
+Gzip kernel with uImage header
+------------------------------
+
+`XenSwdgn~arm64_gzip_kernel_uimage~1`
+
+Description:
+Xen shall create a domain with a Gzip compressed kernel containing uImage
+header [2].
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenMkt~run_arm64_domains~1`
+
+Needs:
+ - XenSwdgn
+
+Kernel command line arguments
+-----------------------------
+
+`XenSwdgn~kernel_cmd_line_args~1`
+
+Description:
+Xen shall pass kernel command line arguments to a domain.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenMkt~run_arm64_domains~1`
+
+Needs:
+ - XenSwdgn
+
+Ramdisk
+-------
+
+`XenSwdgn~ramdisk~1`
+
+Description:
+Xen shall provide initial ramdisk to a domain.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenMkt~run_arm64_domains~1`
+
+Needs:
+ - XenSwdgn
+
+Memory
+------
+
+`XenSwdgn~memory~1`
+
+Description:
+Xen shall create a domain with specified amount of memory.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenMkt~run_arm64_domains~1`
+
+Needs:
+ - XenSwdgn
+
+vCPUs
+-----
+
+`XenSwdgn~vcpus~1`
+
+Description:
+Xen shall create a domain with a number of virtual CPUs.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenMkt~run_arm64_domains~1`
+
+Needs:
+ - XenSwdgn
+
+Credit2 CPU pool scheduler
+--------------------------
+
+`XenSwdgn~credit2_cpu_pool_scheduler~1`
+
+Description:
+Xen shall assign a Credit2 CPU pool scheduler [3] to a domain.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenMkt~run_arm64_domains~1`
+
+Needs:
+ - XenSwdgn
+
+NUL CPU pool scheduler
+----------------------
+
+`XenSwdgn~nul_cpu_pool_scheduler~1`
+
+Description:
+Xen shall assign a NUL CPU pool scheduler to a domain.
+
+Rationale:
+
+Comments:
+A NUL CPU pool scheduler maps a virtual cpu to a unique physical cpu.
+
+Covers:
+ - `XenMkt~run_arm64_domains~1`
+
+Needs:
+ - XenSwdgn
+
+SPIs
+----
+
+`XenSwdgn~spis~1`
+
+Description:
+Xen shall allocate a specified number of shared peripheral interrupts for a
+domain.
+
+Rationale:
+
+Comments:
+A shared peripheral interrupt is an interrupt generated by a peripheral that is
+accessible across all the cpu cores.
+
+Covers:
+ - `XenMkt~run_arm64_domains~1`
+ - `XenMkt~static_vm_definition~1`
+
+Needs:
+ - XenSwdgn
+
+Grant table frames
+------------------
+
+`XenSwdgn~grant_table_frames~1`
+
+Description:
+Xen shall create a domain with a specified number of grant table frames.
+
+Rationale:
+
+Comments:
+Grant tables are a mechanism for sharing and transferring frames (memory buffers)
+between domains.
+
+Covers:
+ - `XenMkt~run_arm64_domains~1`
+
+Needs:
+ - XenSwdgn
+
+Grant maptrack frames
+---------------------
+
+`XenSwdgn~grant_maptrack_frames~1`
+
+Description:
+Xen shall create a domain with a specified number of grant maptrack frames.
+
+Rationale:
+
+Comments:
+Maptrack frame is the metadata for tracking the memory mapped into a domain.
+
+Covers:
+ - `XenMkt~run_arm64_domains~1`
+
+Needs:
+ - XenSwdgn
+
+Virtual PL011
+-------------
+
+`XenProd~virtual_pl011~1`
+
+Description:
+Xen shall provide an "Arm PL011 UART" compliant device to the domains.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenMkt~run_arm64_domains~1`
+ - `XenMkt~provide_console_domains~1`
+
+Needs:
+ - XenSwdgn
+
+Assign iomem
+------------
+
+`XenProd~assign_iomem~1`
+
+Description:
+Xen shall support assigning iomem to a domain.
+
+Rationale:
+
+Comments:
+
+Rationale:
+
+Covers:
+ - `XenMkt~static_vm_definition~1`
+
+Needs:
+ - XenSwdgn
+
+Forward interrupts
+------------------
+
+`XenProd~forward_irqs~1`
+
+Description:
+Xen shall support forwarding interrupts to a domain.
+
+Rationale:
+
+Comments:
+
+Rationale:
+
+Covers:
+ - `XenMkt~static_vm_definition~1`
+
+Needs:
+ - XenSwdgn
+
+| [1] https://github.com/torvalds/linux/blob/master/Documentation/arch/arm64/booting.rst
+| [2] https://source.denx.de/u-boot/u-boot/-/blob/master/include/image.h#L315
+| [3] https://xenbits.xenproject.org/gitweb/?p=xen.git;a=blob;f=docs/features/sched_credit2.pandoc
-- 
2.25.1


