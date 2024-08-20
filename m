Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E212E9584CA
	for <lists+xen-devel@lfdr.de>; Tue, 20 Aug 2024 12:39:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.780283.1189911 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgMFz-0001Ic-RT; Tue, 20 Aug 2024 10:38:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 780283.1189911; Tue, 20 Aug 2024 10:38:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sgMFz-0001Gd-OM; Tue, 20 Aug 2024 10:38:31 +0000
Received: by outflank-mailman (input) for mailman id 780283;
 Tue, 20 Aug 2024 10:38:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WGdy=PT=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1sgMFy-0001GX-Rh
 for xen-devel@lists.xenproject.org; Tue, 20 Aug 2024 10:38:31 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20613.outbound.protection.outlook.com
 [2a01:111:f403:2418::613])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 560b86cb-5ee0-11ef-a507-bb4a2ccca743;
 Tue, 20 Aug 2024 12:38:29 +0200 (CEST)
Received: from BN9P222CA0004.NAMP222.PROD.OUTLOOK.COM (2603:10b6:408:10c::9)
 by MN0PR12MB6245.namprd12.prod.outlook.com (2603:10b6:208:3c3::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.21; Tue, 20 Aug
 2024 10:38:23 +0000
Received: from BN3PEPF0000B070.namprd21.prod.outlook.com
 (2603:10b6:408:10c:cafe::1b) by BN9P222CA0004.outlook.office365.com
 (2603:10b6:408:10c::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7875.19 via Frontend
 Transport; Tue, 20 Aug 2024 10:38:23 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN3PEPF0000B070.mail.protection.outlook.com (10.167.243.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7897.4 via Frontend Transport; Tue, 20 Aug 2024 10:38:22 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 20 Aug
 2024 05:38:22 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 20 Aug
 2024 05:38:22 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Tue, 20 Aug 2024 05:38:21 -0500
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
X-Inumbo-ID: 560b86cb-5ee0-11ef-a507-bb4a2ccca743
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gwoAwAByHiH8XACmWSxrBU52tqtquujeZS29n7HzRHLBHL+uSjw8AFmv8DPjxPDbJz8tVbHSOF1cdkxaB9y+JNSgyYVuWnlQKae8wlbehQq3pPPELbhT9+/66/j1BCox6MfjWEQ4AytD/75LZbCt1/TKMDiCsRUzXE+uqsM/VgW2WrnP+Jqb0BoXKo0js2uVAWBqXDmFmRJGCd6rv4qAc3fr0tC5ptLCjOYVrWJOMCa2dbYK5EfgsPSX6CdNvnluHL7fvrOKQZUUswKcHvGQZoyOmSNZlKCkxk/ayQiViABfc8QgLhBQpksBSvHGxI3/WLe73me/lRnTRiHMKkwJpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Az5G/4Bfjv9tQ7mrCOkdrHnDcMCAXorKTD8BS6sc21s=;
 b=p3cGzoLz/SPM9x2oyrXAiy4/I/DUJVYVAZo6mpJ0psJebULqv5tzuppbhr1vzgkm8xUKe6IbwIUzU22tv7jejefSmBPSxE8aI0HouuGw5h31w9EguxMiBPXMXe5oBxR9B3H2avo8fc6NOvpZJGKxiC69iNc2mWeS7XVWg9e80+g1PGiaJRVM5W0BWVgDTCVTWc5eyRQ9JiGPq9qVOhZPvgQqSXDV3xnAG5nvYm/39JBbxKTm8h6y2B/2fmqn4nIU4z03+V+fijzEIz2Nhs7fzV6sYGSJVAp8DuqpicsDRv0UAG5Y26D/LkIpHc5Z9bswn0OPJz7WioMfN8BbEkKsGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Az5G/4Bfjv9tQ7mrCOkdrHnDcMCAXorKTD8BS6sc21s=;
 b=5m8KvnNWxulwwUZsH1xi2hnRfgJ31uLl3skI7jxfdW6uV9F4Wj1nmQnccGIFRKeF0+NQsTq7Rw/dcduzMyZSGqfAVrVPjXZ+ZdrIun6vJwMdfKPycva/yhDeCnGdZruyzOtNCHbyL9M29UpqaXI3GtYgtEt74HZNFeq+HtFoNHI=
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
	<artem_mygaiev@epam.com>
Subject: [PATCH] docs: fusa: Add requirements for generic timer
Date: Tue, 20 Aug 2024 11:38:16 +0100
Message-ID: <20240820103816.1661102-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B070:EE_|MN0PR12MB6245:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ba6f399-22f7-42be-d28a-08dcc1043731
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?giZTA79JBom3efIiT3o5xNiSvAMiEcm78hj3AeolxUZwP1ES43TyNukqMWyx?=
 =?us-ascii?Q?ZEpjKGdDakvhDtIY215OoINSKvkmJlJeduhc8UCtVkJ8UN29mCphLuTJDAFt?=
 =?us-ascii?Q?19wJPtQgih2pF80RU166E3jVk2Kxmyk/of2TngkZZ0K05lcmhFCu9HSnr1ZD?=
 =?us-ascii?Q?DEfGcTZUEnfVIIbr1IfZ2hmfOmWwJ/eOnbswnoMsMRfllcxiqgwXi3OhXeng?=
 =?us-ascii?Q?2Ur8lJ79GnPlM2M+Pp0RDUr9O8EApss8z23Yc7bWdYOYBdTFcDdiOmdXr13G?=
 =?us-ascii?Q?FD1j6hK60MkH5VCDMnEizaJBJTO9GsFJQDZaYN6x3knzXnCrgSu+xBLAePMB?=
 =?us-ascii?Q?ZR0pL3AZB1U9XBsg7azzX8ljekDFhHTLsREKB2irP2CHUICoj7yoXgTEAI0S?=
 =?us-ascii?Q?I4m4T1SN4L8HyqjcArFPQVzmsnN7treo+xQWW0nE6eXE1JZCUlEo0b6B2Vv0?=
 =?us-ascii?Q?Xifsxy3fO7ycCkfJDZZvHeD0+MHNWhv60cr6RlKV25ryRMxh1BRLUTcHFTcD?=
 =?us-ascii?Q?MdZTq3ndMdajKbuMlgEmjcI3b/VRy4jAeRhmE5cpnnfKHstRKvtIJ/RFKe6G?=
 =?us-ascii?Q?bQHnC1JkQXE3+XtD64GUFFMqemaKcE+5BhDwwq4maj1nr3QsprSfqMrc+0/R?=
 =?us-ascii?Q?aQU5vNeujtMY0MQ6ir4J+9Vl2xlNRDU87l9n4C9+DCiVMA+nnkHhnUyAaxQ/?=
 =?us-ascii?Q?o3Y9sT9M0QF3b0NT0DSMhL9RHPkmlfiGvMW32FIGJp0/C8GLRfTYTt7V3qdB?=
 =?us-ascii?Q?AzFlBfyEp6L91ZCldfvgOxrgdAI9zxe86gyDTzhNwIzTxGRlO3Z3YYq9h7tF?=
 =?us-ascii?Q?mkr9ehDA4fwz2qg1iKQgGSq2W38JUcEQKxV/RKlxx2GcEZjZAMFl9TmECdzZ?=
 =?us-ascii?Q?CpQ7rr8bIWGCNfBoZixUoUvJeIvQcSN9shU8g5ILTqeRo5u8MwQd0fVD4o/5?=
 =?us-ascii?Q?M5pc8UlMLv3iOS9rizTRbeaEZTtR4rkUIfoBY+d6yZhN2UnhKlmPur7sLOtt?=
 =?us-ascii?Q?jf8CekgtGvBTqghZdPOLTRotYFHme6bn/TGwM9IwMuHxanAdzP33FiWLrUGh?=
 =?us-ascii?Q?Kp66a7zVcgykwis6yH6Ty4J9n0aYGZKglf6DO88n8LNCUlZFrb/mYTGRM1ur?=
 =?us-ascii?Q?uHjUrPLQHxzuCZ6AW0wFNCz0i/RcG77VUu8Ub/cnEHQqdnCv7nFTj75dUhqJ?=
 =?us-ascii?Q?2Noi0iaDhmlEfGHkoSgIv3VoMQziRHzkdd817Xy4cfduPxyVetARUAOuIiSo?=
 =?us-ascii?Q?rP6RBROXMOvx4MLe0ucf5dWsOTIgRSkRwNBBYv8z36wbi3u3fOZriDg9CbF6?=
 =?us-ascii?Q?I46XqGFKwUv+BH7e4Qy5/D/YLu4hyoonX77bpuVdwG4OJyT7TYaHMoo4EImQ?=
 =?us-ascii?Q?GCbU0/56WLCaUHBEbt+fAAn2pKX8YxqF0ERO2JnBYnyxtc80rfafctFy83zd?=
 =?us-ascii?Q?rjHm8i5DW+A3K9F/qv+fA1oBnmJ/b680?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2024 10:38:22.9028
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ba6f399-22f7-42be-d28a-08dcc1043731
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B070.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6245

From: Michal Orzel <michal.orzel@amd.com>

Add the requirements for the use of generic timer by a domain

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
 .../reqs/design-reqs/arm64/generic-timer.rst  | 139 ++++++++++++++++++
 docs/fusa/reqs/index.rst                      |   3 +
 docs/fusa/reqs/intro.rst                      |   3 +-
 docs/fusa/reqs/market-reqs/reqs.rst           |  34 +++++
 docs/fusa/reqs/product-reqs/arm64/reqs.rst    |  24 +++
 5 files changed, 202 insertions(+), 1 deletion(-)
 create mode 100644 docs/fusa/reqs/design-reqs/arm64/generic-timer.rst
 create mode 100644 docs/fusa/reqs/market-reqs/reqs.rst
 create mode 100644 docs/fusa/reqs/product-reqs/arm64/reqs.rst

diff --git a/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst b/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst
new file mode 100644
index 0000000000..bdd4fbf696
--- /dev/null
+++ b/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst
@@ -0,0 +1,139 @@
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
+ARM architected timer device tree binding [2]).
+
+Rationale:
+
+Comments:
+Domains shall probe the Generic Timer device tree node.
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
+Xen shall expose the frequency of the system counter to the domains.
+
+Rationale:
+
+Comments:
+Domains shall read it via CNTFRQ_EL0 register or "clock-frequency" device tree
+property.
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
+Xen shall expose counter-timer kernel control register to the domains.
+
+Rationale:
+
+Comments:
+Domains shall access the counter-timer kernel control register to allow
+controlling the access to the timer from userspace (EL0).
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
+Xen shall expose the virtual timer registers to the domains.
+
+Rationale:
+
+Comments:
+Domains shall access and make use of the virtual timer by accessing the
+following system registers:
+CNTVCT_EL0,
+CNTV_CTL_EL0,
+CNTV_CVAL_EL0,
+CNTV_TVAL_EL0.
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
+Xen shall expose physical timer registers to the domains.
+
+Rationale:
+
+Comments:
+Domains shall access and make use of the physical timer by accessing the
+following system registers:
+CNTPCT_EL0,
+CNTP_CTL_EL0,
+CNTP_CVAL_EL0,
+CNTP_TVAL_EL0.
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
+Xen shall enable the domains to program the virtual timer to generate the
+interrupt. 
+
+Rationale:
+
+Comments:
+Domains shall program the virtual timer to generate the interrupt when the
+asserted condition is met.
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
+Xen shall enable the domains to program the physical timer to generate the
+interrupt
+
+Rationale:
+
+Comments:
+Domains shall program the physical timer to generate the interrupt when the
+asserted condition is met.
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
index 0000000000..9b579cc606
--- /dev/null
+++ b/docs/fusa/reqs/product-reqs/arm64/reqs.rst
@@ -0,0 +1,24 @@
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
+Xen shall emulate Arm Generic Timer timer on behalf of domains.
+
+Rationale:
+
+Comments:
+Domains shall use it for scheduling and other needs.
+
+Covers:
+ - `XenMkt~run_arm64_vms~1`
+ - `XenMkt~provide_timer_vms~1`
+
+Needs:
+ - XenSwdgn
-- 
2.25.1


