Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B14AB122A
	for <lists+xen-devel@lfdr.de>; Fri,  9 May 2025 13:25:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.980065.1366547 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDLqi-0006w6-5H; Fri, 09 May 2025 11:25:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 980065.1366547; Fri, 09 May 2025 11:25:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uDLqi-0006tN-0R; Fri, 09 May 2025 11:25:04 +0000
Received: by outflank-mailman (input) for mailman id 980065;
 Fri, 09 May 2025 11:25:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EUpd=XZ=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1uDLqg-0006tC-1D
 for xen-devel@lists.xenproject.org; Fri, 09 May 2025 11:25:02 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on20611.outbound.protection.outlook.com
 [2a01:111:f403:240a::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3bdf88c1-2cc8-11f0-9ffb-bf95429c2676;
 Fri, 09 May 2025 13:24:57 +0200 (CEST)
Received: from DM6PR14CA0039.namprd14.prod.outlook.com (2603:10b6:5:18f::16)
 by PH0PR12MB7813.namprd12.prod.outlook.com (2603:10b6:510:286::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.24; Fri, 9 May
 2025 11:24:51 +0000
Received: from DS3PEPF000099D5.namprd04.prod.outlook.com
 (2603:10b6:5:18f:cafe::62) by DM6PR14CA0039.outlook.office365.com
 (2603:10b6:5:18f::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.31 via Frontend Transport; Fri,
 9 May 2025 11:24:51 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DS3PEPF000099D5.mail.protection.outlook.com (10.167.17.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8722.18 via Frontend Transport; Fri, 9 May 2025 11:24:50 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 9 May
 2025 06:24:50 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Fri, 9 May 2025 06:24:49 -0500
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
X-Inumbo-ID: 3bdf88c1-2cc8-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lyWvZSoNUoMHKijHcMhnfh6pF48IqNXKvXudn/wqdHloom3Qf42Yey1VUsH1sgBabfOGFSZ7XkYZMuEj9lNWtcwrpb4PCj3dwJBKgvk/T/Fr8nu0OAmu5dXq0+SqZwW0FnxxMT1LNF95A4b38ka78yUKa0v7BIgxROQzL1qcOCNJxkcdAlSZ6ugpDjpLvD1Gd0s/hFCVOJ6u3aJi31G4TIj4gjEoJ/98bLa52ILx5sTgGCMIJKKLO6++URAgDPhg35CRLy4SVZUm3HStr5AKaOKSDYG3QXymhbOX8VdJNUASlWEgLs/Tdr8O34cr7vdgNptzUNVOEI4OrTcU/gD8ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fZyp0GNbJksOPcIWZWqmgu1NYPhso8bddmHyo8chcVc=;
 b=ajEXH7STkKuxaI0ImID0AqFe7aCCa+nPMuJgOBwnHhn7kBaL0NA5zeGKcS70V3Yxo8fo0rGTxSbRU3oBOjR6hLkKjzVUR064WoTaG+SQEMpAqI3x74y566EnlrC7V48yrRVL2zZZFdtIPNuw3hatpftzoDRHLadDrJ6W5wGTSO0OX+y1gXMPdrSa7IEAVcc01RU2Lm0J9VG0ho6DYCGgHW9ZU4MHriuLm/IexxpUloTNkPY6Buq708TpV35a0kEkg2u9wGT1VWBUjvrxuRr0KDsTgRXdBl8K/fmYCtX+Mo9EgI4M86FRc4aG/cK+fQhRuU7nm3jOzA8LjV+w4045ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fZyp0GNbJksOPcIWZWqmgu1NYPhso8bddmHyo8chcVc=;
 b=CCOSC0JXarWFWwS6SRRlnSRQnyYlJDqaNGKKhbiuJFqJp/dW9gQXY4gJk8PT+Ozq4YUO44we+6nCMQgSmolgAxoehvf+BKquLV7ja9ZSLPHGj0zx06o/tIWc0YEIOQY15tu+mOAiWRUEHq/N4VnS4f3lska3FOk5eAUqRho4M3A=
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
Subject: [PATCH v3 1/2] docs: fusa: Define the requirements for XEN_VERSION hypercall.
Date: Fri, 9 May 2025 12:24:46 +0100
Message-ID: <20250509112447.2931909-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D5:EE_|PH0PR12MB7813:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cfaa00c-ae04-4366-594d-08dd8eec1d30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?LIwssxKMsxOlYLzl/8H3LJ3GCLVVGhEhuea47TodAIAipk1fLq2aSVjOMfKr?=
 =?us-ascii?Q?iQaK+73rlhXL460lJaWjIcRPzVIwAK8tnbz6GU9KBZnJi3MFr4UKpBKIMCDQ?=
 =?us-ascii?Q?vtgyYlWUNZYLQ+m4v76Y0mOq5GBpAfy95Fzpw46HVOXackm1awKkUghBm4V8?=
 =?us-ascii?Q?sxcy8G1bHC7SEm063iXWNaiWaBFcAAGiI/0+b+b06v33khOLOYMLgs2lMrvg?=
 =?us-ascii?Q?sTaEUuo8ofOjXf5pXylrnn8/4FA/xdzFMWgkMpPgBMsJfWRVld0VtiBA4pmr?=
 =?us-ascii?Q?bxRIGmpeo1OLL1Gv9aq265Kv2OMQkKW3lAlN21rUPx0sRnXrPbxwB3W8OeWR?=
 =?us-ascii?Q?/wabbS96AGiFPn95mg7PPuyWbT5VCg1Y55DH8BlHSCE4jlA2UXyWulq7h8oc?=
 =?us-ascii?Q?KIaSkhTg+GVpTXpYCvuOxJUk1++G/d8pug7KOf6YcqBwYHxBgc8XaLWzeYdG?=
 =?us-ascii?Q?mhWcQQ8cULSnzNUBCoT96FOIYz4gI4F0TynhkNlAozUkMEo60cuRe3/xdzYg?=
 =?us-ascii?Q?q2sPd4/9KJqVkhBO+sZm0M7lrk+QHFd0bvb+aHdGtjJAkP8LDjhX64UUfHIN?=
 =?us-ascii?Q?A/tZgUdPPKPlF8VyX/OgI/CvR2NbniiZOT+fRGhUFE2q8DuFDzCKqmiJU2DH?=
 =?us-ascii?Q?0zNhFCc2C2wnRsr8dd7ZXbuQJgHKj4L+jsqUDNoomCjK4JEiEkJ9HAw4SdKV?=
 =?us-ascii?Q?nO25mzzHcoUuxTCVZg3f0FODJp9YegmoePiH6sNpzXOJjRBN0CvITyGemBwM?=
 =?us-ascii?Q?6PVqm768I9bfP06NALO6VAQwYtEdoDTAZPS4wbujzNAUkAgVxeysbbFnfyu4?=
 =?us-ascii?Q?Vq1ZN8YdEGwppl4PusF5htZukNppRLsgIpvszxVCDTsJb9sxvU6MlBADWsfB?=
 =?us-ascii?Q?C5UDPKA7y4yG6CdIci8oulhkeUaX8W9EJTssweNkTuik8OSysG5si15BmEjS?=
 =?us-ascii?Q?2HO3TNGVhNPB0Y1fjAv8M4Lw9y5v0PWJ0w0pPGBEX7s4ksv1jYfW43U4jsN4?=
 =?us-ascii?Q?WR1nQpXr+bjgaxR+2rApPuUQmSOQ4ccqhelBrfXzMdKkfz8v3zBY1JkubrF6?=
 =?us-ascii?Q?wyM+EYDHOms4BaBgbUIhcXZHguWGrFxy5DJYEhELhJCfQpLMLOkrLK0fHbYP?=
 =?us-ascii?Q?dKUwKWSqCQsX1GYo+KtW8o2YptVXqvvwOuqsJYPdSh9W1ZyHzUGwyNl3BMPk?=
 =?us-ascii?Q?F21E+Y4Csq/a6n6ZZcohcrhdesmm5lwmqmlAYkAookIe6cMgDyaaAhUdV2Gk?=
 =?us-ascii?Q?NgeCJecuBuomfeHRXCDYcQRavb/IDbaTMPM0cRpej6Hz/ds85PxUxfWFhWCv?=
 =?us-ascii?Q?lX52+Ee99+iaOBrrxQPXtvI/Q4zKqiOqsfGsQfIWX2Ehnq7NLnn6K7EeTmQ7?=
 =?us-ascii?Q?GtEKFWaBCD4SaGmQZAMEDTE+3Rf4qf4nFkN89YkrPZhtKl434KHpuB5ews6k?=
 =?us-ascii?Q?bm86VRDnGGpOLRIx1rd4h2wZ4ZD8vQgfnPTaZHpj4AiK2xGp9pwwRYxi+2VG?=
 =?us-ascii?Q?gJwpzf7edl9Bppy5gqhGO3JFTF9QVYtAjdUe?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2025 11:24:50.8821
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cfaa00c-ae04-4366-594d-08dd8eec1d30
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS3PEPF000099D5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7813

Define the requirements which are common for all the commands for XEN_VERSION
hypercall.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
Changes from -

v1 - 1. Fixed `XenProd~version_hyp_ret_val~1` requirement as Xen does not return
0 for success in all the cases.
2. Reworded the requirements so as to write them from Xen's perspective (not
domain's perspective).

v2 - 1. Specified the register details.
2. Specified the type of buffer. 

 .../fusa/reqs/design-reqs/arm64/hypercall.rst | 58 +++++++++++++++++++
 docs/fusa/reqs/index.rst                      |  2 +
 docs/fusa/reqs/market-reqs/reqs.rst           | 16 +++++
 .../reqs/product-reqs/version_hypercall.rst   | 43 ++++++++++++++
 4 files changed, 119 insertions(+)
 create mode 100644 docs/fusa/reqs/design-reqs/arm64/hypercall.rst
 create mode 100644 docs/fusa/reqs/product-reqs/version_hypercall.rst

diff --git a/docs/fusa/reqs/design-reqs/arm64/hypercall.rst b/docs/fusa/reqs/design-reqs/arm64/hypercall.rst
new file mode 100644
index 0000000000..f00b0b00f9
--- /dev/null
+++ b/docs/fusa/reqs/design-reqs/arm64/hypercall.rst
@@ -0,0 +1,58 @@
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
+Domains use 'hvc #0xEA1' instruction to invoke hypercalls.
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
+Xen shall use the first five cpu core registers to obtain the arguments for
+domain hypercall requests.
+
+Rationale:
+
+Comments:
+Xen shall read the first register for the first argument, second register for
+the second argument and so on.
+
+Covers:
+ - `XenProd~version_hyp_first_param~1`
+ - `XenProd~version_hyp_second_param~1`
+
+Hypercall number
+----------------
+
+`XenSwdgn~arm64_hyp_num~1`
+
+Description:
+Xen shall read x16 to obtain the hypercall number.
+
+Rationale:
+
+Comments:
+
+Covers:
+ - `XenProd~version_hyp_first_param~1`
+ - `XenProd~version_hyp_second_param~1`
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
index 0000000000..400d51bbeb
--- /dev/null
+++ b/docs/fusa/reqs/product-reqs/version_hypercall.rst
@@ -0,0 +1,43 @@
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
+Xen shall treat the second argument as a virtual address (mapped as Normal
+Inner Write-Back Outer Write-Back Inner-Shareable) to buffer in domain's
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
-- 
2.25.1


