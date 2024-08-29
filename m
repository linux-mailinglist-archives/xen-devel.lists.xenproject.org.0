Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97BDA96430A
	for <lists+xen-devel@lfdr.de>; Thu, 29 Aug 2024 13:32:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.785669.1195155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjdNF-0001P2-Fo; Thu, 29 Aug 2024 11:31:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 785669.1195155; Thu, 29 Aug 2024 11:31:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sjdNF-0001Lt-D6; Thu, 29 Aug 2024 11:31:33 +0000
Received: by outflank-mailman (input) for mailman id 785669;
 Thu, 29 Aug 2024 11:31:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=D0cO=P4=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1sjdNE-0001Lj-ML
 for xen-devel@lists.xenproject.org; Thu, 29 Aug 2024 11:31:32 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062e.outbound.protection.outlook.com
 [2a01:111:f403:2418::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3ba7db13-65fa-11ef-99a0-01e77a169b0f;
 Thu, 29 Aug 2024 13:31:30 +0200 (CEST)
Received: from DM6PR13CA0011.namprd13.prod.outlook.com (2603:10b6:5:bc::24) by
 PH7PR12MB9073.namprd12.prod.outlook.com (2603:10b6:510:2eb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.28; Thu, 29 Aug
 2024 11:31:25 +0000
Received: from CY4PEPF0000E9CD.namprd03.prod.outlook.com
 (2603:10b6:5:bc:cafe::b2) by DM6PR13CA0011.outlook.office365.com
 (2603:10b6:5:bc::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.14 via Frontend
 Transport; Thu, 29 Aug 2024 11:31:25 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9CD.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Thu, 29 Aug 2024 11:31:24 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 29 Aug
 2024 06:31:23 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 29 Aug
 2024 06:31:23 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Thu, 29 Aug 2024 06:31:22 -0500
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
X-Inumbo-ID: 3ba7db13-65fa-11ef-99a0-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kwou0QZukpW9/yeY/Nsv7JHn/yRwdHhOdDjruPmrEaAhKDytHil4H2+3yi9Mmx+S7a9mb1p72b9gALLG6B1u5EBTztxrOTxhYGNfO1bLihjFN4t+DTgcZNZF996GfIjUhsvI6A9NGOcV8m9hk1kLuD4K36y1VhKrE6J6vGiC4h2yKdAySGS22X58W+bMAWqlxZ2vtnDHHW/6KYWwdo1iJUWaD6S48peV443fcUR3zaMQRgrTzRRecuB6pRFgdkvtlC4CdT7lzkStljt6OtbSl/Jv008w4af0eMOq0GOsuFG3fyT0SjxDWtFBMJbVlNqUSVWIu0IkgPnmUemAmkyWrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gm2POMBECsGV7z8vdKZQvlwhA36fQr6aLBAeMcMvOw8=;
 b=atGIA5w3+z3PvRd8Oau1FSqjg1Z+ahCzOjJ3czvhMzA/GmuB/0jvg+KXdoLwikA+Nf4bhStyYS5CtMoJsmaV/J/33Fo/RaMftH8gXIsm0j2NS6v8Sj2ypvFuS4vnh/e/QaRsVSAWlJv2dDtqaccJ1vGS81Q+sMQDKp2JprGWrebQzCQvj+hZBeygLTVpSK9GlkJcRAqjIFF8wtc6MPQC67GI7SkqDBDAY7j/yfhrJvXHvP9Yu1AL4aulG6VanvkR3hO34OSQuHSt4kQ4f02jEcAVnjjHroCGWa6mPOLPB4mRU34grRwKR1nqnyIsp0mxg/kqxYRHqQGvYuD+NW97vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gm2POMBECsGV7z8vdKZQvlwhA36fQr6aLBAeMcMvOw8=;
 b=u9GUA2IHZwRzfD2fw5ptln6mAH0RiPRzzN9G9JuusuYLJIsR+0NOXcOgrXffj8Qco2NBRYFmoYylCYUG3/GDN6Uw6nDc4nMD2KhXBH4+Q6pJoV6MHANOfNJ8lHjpnXi5VpRfnKAevEmU1TpHK+RPIRVERTDRF3+g1vyIb6QaTms=
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
	<artem_mygaiev@epam.com>, Hisao Munakata <hisao.munakata.vt@renesas.com>
Subject: [PATCH v2] docs: fusa: Add requirements for generic timer
Date: Thu, 29 Aug 2024 12:31:20 +0100
Message-ID: <20240829113120.3980270-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9CD:EE_|PH7PR12MB9073:EE_
X-MS-Office365-Filtering-Correlation-Id: 62cc6915-9716-4bbc-8546-08dcc81e1d3e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?alh1WRuvGe58qx7RN8CRSG9uvjraUDTkAWAkwrO5ThgGqCGWheWbBPraUqBq?=
 =?us-ascii?Q?xNO+VO0PyBr36VDglCevlKDPLhmLHJCRe9pvJTiIfSibaUo4fAJYzh2wSYgq?=
 =?us-ascii?Q?Ww6lAlub6sFK5+psFoPbLAPsORrxNR8Dou2PBXluY8HwlnycBpVwoGBXue5n?=
 =?us-ascii?Q?1oSevtBPwBS3AbDAsblZsiAkcreEE9w10nZWYIE7zehK24f5CMjoTg8q/YS5?=
 =?us-ascii?Q?6juVflxMIvUjQrQJmQjAbx3ysk35SZUeNHp+r3fQGPSTamTw5cuNZjfo04Js?=
 =?us-ascii?Q?pBn9hLceOVkSDxfkaFj/ORJ1w09tl5R8P4tT/G0U1IagD5kfkMRJ70iO24KQ?=
 =?us-ascii?Q?sJ4dI4tcgxtwtlGbE3/7qu5jdp5RIW6KeJyLCdsl60KPgcUVwC8uuAYaJYtq?=
 =?us-ascii?Q?pEvYT1GAOTtOKuSnw4f1gRGwPmCClkr3843ZinCTVo7fOxVq1/K1AAUv/U7r?=
 =?us-ascii?Q?VqOSI8EBqnNuIlPK+dzmTsJGPyoD7ALop3sh/Nti7InoojSlW3tPmJ8B6UvF?=
 =?us-ascii?Q?leh8qLKKEZsm4x4+yBiY2Lwlkiyd5+BUCDqmnYNpoLpxHzOaxV8A7pjsbasx?=
 =?us-ascii?Q?cLv5b6Y1sfcl2zMtRYJId27gnkQUCtMH1nQTmM7ImEFB8PML1zaQiRsiMFEn?=
 =?us-ascii?Q?jFlpYK8DgJ+jp2aiWd53y5fPQbySYJ4edIL/lNKJ0OksiYEpiW7g7jFNd3H/?=
 =?us-ascii?Q?TwKjuQ1HaxRWNYhH0W8wA8PugnLxC4Wsa8KOukTq6Fm5QsV4Bpzxy7PWjxC4?=
 =?us-ascii?Q?yryngZTjUyJJwrzZw2Ln2BvCq1YVb90j1VBMqzuPNZm3RjSdJY928mL8TpbV?=
 =?us-ascii?Q?XltVYw2DljYLzbyXFBlt3cNXvTIqoI9qQXWvLLtfB2EItMOD+s279l5d728H?=
 =?us-ascii?Q?6Bl3Qt5EUd2gbjDkAw58NpYxeZnaKNbtwS6DDhXr/EA48xWwvCv6p+/o7JHi?=
 =?us-ascii?Q?M6mzYbgfITJ+IJ2bd9VsIj9rsp+YiCRviHpS6/7SwPaqtZsBsfOTQNVJ4zx3?=
 =?us-ascii?Q?XK7kP8xGsD7YeRcOVoDMWuIHJPjmyiyHRdu4C7XEdwwfpb81yUzCDkA6o3IE?=
 =?us-ascii?Q?+XfYp6heODhZ5nGZXPZmRJAzRY5da7JXEuu3PIwnSiam66QA6RbEMt/QmEIU?=
 =?us-ascii?Q?FZ6mwyMKhZFjNRfjYRFIpIvqxVu0ngA2gXSQ0WNSxD5QZ0qxj43cATbEHc3z?=
 =?us-ascii?Q?ZnCv7+LI8A5ZQRi1mO8z1XKY6sS6cPpu5CdAumcbNrridQBYdub8kJeAn6kn?=
 =?us-ascii?Q?z+PUT44PYFgAERsuiHS96xh3LFuMMe5CC02Y6Aqizsbu62phSeRrCVIprMVj?=
 =?us-ascii?Q?9pirL5TwkCRzSei1x1GSSaYNjZ+VdFlpkQWKaPTi+N1O6hrLldDzQwc/Tulu?=
 =?us-ascii?Q?LRDLR0FrczcGHA8OsbvYh5ojbn/RQe6k/ClBAgGMZKBcI7lvrhPLWTmNfuQZ?=
 =?us-ascii?Q?9jtVCzhwZOsPdijaBbwV8/yXfKdtQOKj?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 11:31:24.2947
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 62cc6915-9716-4bbc-8546-08dcc81e1d3e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9CD.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9073

From: Michal Orzel <michal.orzel@amd.com>

Add the requirements for the use of generic timer by a domain

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
Changes from -

v1 - 1. Fixed some wordings as suggested in v1.
2. Removed the comments which mentions Domain specific usage details.

 .../reqs/design-reqs/arm64/generic-timer.rst  | 123 ++++++++++++++++++
 docs/fusa/reqs/index.rst                      |   3 +
 docs/fusa/reqs/intro.rst                      |   3 +-
 docs/fusa/reqs/market-reqs/reqs.rst           |  34 +++++
 docs/fusa/reqs/product-reqs/arm64/reqs.rst    |  23 ++++
 5 files changed, 185 insertions(+), 1 deletion(-)
 create mode 100644 docs/fusa/reqs/design-reqs/arm64/generic-timer.rst
 create mode 100644 docs/fusa/reqs/market-reqs/reqs.rst
 create mode 100644 docs/fusa/reqs/product-reqs/arm64/reqs.rst

diff --git a/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst b/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst
new file mode 100644
index 0000000000..f2a0cd7fb8
--- /dev/null
+++ b/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst
@@ -0,0 +1,123 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+Generic Timer
+=============
+
+The following are the requirements related to ARM Generic Timer [1] interface
+exposed by Xen to Arm64 domains.
+
+Probe the Generic Timer device tree node from a domain
+------------------------------------------------------
+
+`XenSwdgn~arm64_generic_timer_probe_dt~1`
+
+Description:
+Xen shall generate a device tree node for the Generic Timer (in accordance to
+ARM architected timer device tree binding [2]) in the domain device tree.
+
+Rationale:
+
+Comments:
+Domains can detect the presence of the Generic Timer device tree node.
+
+Covers:
+ - `XenProd~emulated_timer~1`
+
+Read system counter frequency
+-----------------------------
+
+`XenSwdgn~arm64_generic_timer_read_freq~1`
+
+Description:
+Xen shall expose the frequency of the system counter to the domains in
+CNTFRQ_EL0 register and/or domain device tree's "clock-frequency" property.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~emulated_timer~1`
+
+Access CNTKCTL_EL1 system register from a domain
+------------------------------------------------
+
+`XenSwdgn~arm64_generic_timer_access_cntkctlel1~1`
+
+Description:
+Xen shall expose Counter-timer Kernel Control register (CNTKCTL_EL1) to the
+domains.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~emulated_timer~1`
+
+Access virtual timer from a domain
+----------------------------------
+
+`XenSwdgn~arm64_generic_timer_access_virtual_timer~1`
+
+Description:
+Xen shall expose the virtual timer registers (CNTVCT_EL0, CNTV_CTL_EL0,
+CNTV_CVAL_EL0, CNTV_TVAL_EL0) to the domains.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~emulated_timer~1`
+
+Access physical timer from a domain
+-----------------------------------
+
+`XenSwdgn~arm64_generic_timer_access_physical_timer~1`
+
+Description:
+Xen shall expose physical timer registers (CNTPCT_EL0, CNTP_CTL_EL0,
+CNTP_CVAL_EL0, CNTP_TVAL_EL0) to the domains.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~emulated_timer~1`
+
+Trigger the virtual timer interrupt from a domain
+-------------------------------------------------
+
+`XenSwdgn~arm64_generic_timer_trigger_virtual_interrupt~1`
+
+Description:
+Xen shall generate virtual timer interrupts to domains when the virtual timer
+condition is met.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~emulated_timer~1`
+
+Trigger the physical timer interrupt from a domain
+--------------------------------------------------
+
+`XenSwdgn~arm64_generic_timer_trigger_physical_interrupt~1`
+
+Description:
+Xen shall generate physical timer interrupts to domains when the physical timer
+condition is met.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~emulated_timer~1`
+
+[1] Arm Architecture Reference Manual for A-profile architecture, Chapter 11
+[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/timer/arm,arch_timer.yaml
diff --git a/docs/fusa/reqs/index.rst b/docs/fusa/reqs/index.rst
index 78c02b1d9b..183f183b1f 100644
--- a/docs/fusa/reqs/index.rst
+++ b/docs/fusa/reqs/index.rst
@@ -7,3 +7,6 @@ Requirements documentation
    :maxdepth: 2
 
    intro
+   market-reqs
+   product-reqs
+   design-reqs/arm64
diff --git a/docs/fusa/reqs/intro.rst b/docs/fusa/reqs/intro.rst
index d67b18dd9f..245a219ff2 100644
--- a/docs/fusa/reqs/intro.rst
+++ b/docs/fusa/reqs/intro.rst
@@ -55,7 +55,8 @@ Title of the requirement
   be 'XenMkt', 'XenProd' or 'XenSwdgn' to denote market, product or design
   requirement.
   name - This denotes name of the requirement. In case of architecture specific
-  requirements, this starts with the architecture type (ie x86_64, arm64).
+  requirements, this starts with the architecture type (eg x86_64, arm64)
+  followed by component name (eg generic_timer) and action (eg read_xxx).
   revision number - This gets incremented each time the requirement is modified.
 
 
diff --git a/docs/fusa/reqs/market-reqs/reqs.rst b/docs/fusa/reqs/market-reqs/reqs.rst
new file mode 100644
index 0000000000..9c98c84a9a
--- /dev/null
+++ b/docs/fusa/reqs/market-reqs/reqs.rst
@@ -0,0 +1,34 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+Functional Requirements
+=======================
+
+Run Arm64 VMs
+-------------
+
+`XenMkt~run_arm64_vms~1`
+
+Description:
+Xen shall run Arm64 VMs.
+
+Rationale:
+
+Comments:
+
+Needs:
+ - XenProd
+
+Provide timer to the VMs
+------------------------
+
+`XenMkt~provide_timer_vms~1`
+
+Description:
+Xen shall provide a timer to a VM.
+
+Rationale:
+
+Comments:
+
+Needs:
+ - XenProd
diff --git a/docs/fusa/reqs/product-reqs/arm64/reqs.rst b/docs/fusa/reqs/product-reqs/arm64/reqs.rst
new file mode 100644
index 0000000000..7aa3eeab6a
--- /dev/null
+++ b/docs/fusa/reqs/product-reqs/arm64/reqs.rst
@@ -0,0 +1,23 @@
+.. SPDX-License-Identifier: CC-BY-4.0
+
+Domain Creation And Runtime
+===========================
+
+Emulated Timer
+--------------
+
+`XenProd~emulated_timer~1`
+
+Description:
+Xen shall grant access to "Arm Generic Timer" for the domains.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenMkt~run_arm64_vms~1`
+ - `XenMkt~provide_timer_vms~1`
+
+Needs:
+ - XenSwdgn
-- 
2.25.1


