Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4022B93C895
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2024 21:02:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.765102.1175685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sX3jE-0005ob-NV; Thu, 25 Jul 2024 19:02:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 765102.1175685; Thu, 25 Jul 2024 19:02:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sX3jE-0005lt-Ko; Thu, 25 Jul 2024 19:02:16 +0000
Received: by outflank-mailman (input) for mailman id 765102;
 Thu, 25 Jul 2024 19:02:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4Kni=OZ=amd.com=VictorM.Lira@srs-se1.protection.inumbo.net>)
 id 1sX3jD-0005ln-Qf
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2024 19:02:15 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2061b.outbound.protection.outlook.com
 [2a01:111:f403:2412::61b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 669951b1-4ab8-11ef-bbff-fd08da9f4363;
 Thu, 25 Jul 2024 21:02:14 +0200 (CEST)
Received: from PH7P220CA0121.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:327::10)
 by CY8PR12MB7708.namprd12.prod.outlook.com (2603:10b6:930:87::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20; Thu, 25 Jul
 2024 19:02:09 +0000
Received: from SJ1PEPF0000231C.namprd03.prod.outlook.com
 (2603:10b6:510:327:cafe::19) by PH7P220CA0121.outlook.office365.com
 (2603:10b6:510:327::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.28 via Frontend
 Transport; Thu, 25 Jul 2024 19:02:09 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 SJ1PEPF0000231C.mail.protection.outlook.com (10.167.242.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.11 via Frontend Transport; Thu, 25 Jul 2024 19:02:08 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 25 Jul
 2024 14:02:07 -0500
Received: from xsjwoods50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Thu, 25 Jul 2024 14:02:07 -0500
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
X-Inumbo-ID: 669951b1-4ab8-11ef-bbff-fd08da9f4363
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mhIvIghJ8QBuWYsLcQLvqh8NerZ941yaZmnvz5V+AJXXKVHDKeI5D72Qi1CcHDVySJyR+dLsmFlokNuyolABnYbflczQIMvOhWiGGqC5Uime5cNja/xHvWn0PFWmXPO9teh2U1uU19QgiShs9n8W+uxa3JSh+7NZLBPH5a+o8srHkhnSYEYIPDrAdFG0MRfISyfhtrSMQJ522YAJEotL+pyPlPCGS3njsukoF8n6BOo7WkLarwYY/GGWKeUr3iQYP+T8uTRNbGcNqMSKj0UqMkRtay1sIsksMnOzqfHHzCGcmVGW2W/WqOboNdnD8YdY8GXXbBTtKskpI4nEqYuJJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IFmmQR3vnXMbekwltZbuh3LwRrigr6liLi100vVOUTU=;
 b=uCk3PwvSqkIv3m9r0IXNU99YzwJxahqWNtw2Iry3byHQfm1r6iMnXTJ3HUcm5FELJaFEqgUrKd2a1rbIWujBwI14i7r5PZe/E+sFEt1Flasb7m0Zay+6cVB8IXsgRRV3JHmC1qLjRdZ/6BlNrPgAQP+mB31vgRPMIgS3Q367J5Bi9Pf5Ey1PlGNDYFabSVQ1cjyK9tS8Aw9HxBxKrH/j/Cj2uBQy0xk18XWqvbCkEAkjsqQ7YJwLE6JUZAVk+uHtxN8fi9nPsELrv/WElSbcMcxZWOgsS5V8C1Q7pUMDg+cFeOXyRTT88Lu1FHYVAn4vHAQRWFT3OesXX6/oeBhKjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IFmmQR3vnXMbekwltZbuh3LwRrigr6liLi100vVOUTU=;
 b=KuwGFwP1RNRQYXtN6tPWhvH5at7Lz427SF5gFOkllir4zHeSBpT5sPKu/FVDODId5ZLuacEPcW2NwXIRAJrXfKoTz3YLo4W1DLzNSAAEN7/0ymDrvWeeHt9FvUngP3Qbi8vZ8bcT3i0p6tiouQNVpbdGbhNjr4NsdXXj8CRlqNg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: <victorm.lira@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Victor Lira <victorm.lira@amd.com>, Jan Beulich <jbeulich@suse.com>,
	Stefano Stabellini <sstabellini@kernel.org>, <roberto.bagnara@bugseng.com>,
	<consulting@bugseng.com>, <simone.ballarin@bugseng.com>
Subject: [RFC PATCH v3] automation: add linker symbol name script
Date: Thu, 25 Jul 2024 12:01:53 -0700
Message-ID: <29c7f6cd166d5d3c0e9f64dc937e29dc7ecf3f2d.1721933988.git.victorm.lira@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: victorm.lira@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231C:EE_|CY8PR12MB7708:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fc53d28-8ef3-48d4-611d-08dcacdc489a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xrU38c5t3ugPFMFYBHecvU9bnPeNSIYvhQ02OFGT4UvFzSgBvOaBZ+z0mdcG?=
 =?us-ascii?Q?UA8mttsJcgI0ewhQOuB5KsqSvZD/EueCefwB+7aEeEYi+bnkDNEqLfCO6BsE?=
 =?us-ascii?Q?jIRVGAmA8PDkRbT5oQICWhB+QhP75Aw5r1TzKxfBjVN5A3o3uDWb3zaqNkta?=
 =?us-ascii?Q?vXas5djxFbjbfSt0P9QtvohSV0rULiXRGUR73rjgm3ADOQPzHS7aG/31mW5L?=
 =?us-ascii?Q?nL7UXn3MmXJpYRwXRZ3tSgQIRu5AEhso5Q3+Ank+JhGVBv28HqlRvs5o7XnX?=
 =?us-ascii?Q?++Xlz6+Bqk8V81rfyK4m9nQq2jXNJ0kFE0cbiAZgpWugGVBmkpo+jfTgSGjh?=
 =?us-ascii?Q?4QjPPW6IUH61OX8Whbt6fg3MpjDOQIjJXtKe1eXi4qo8r4lDxlQrWWsn1bac?=
 =?us-ascii?Q?gCGu2mY8Vbcsnbt5/mru4AZev0oNy5BNtyDUHzKEbH438+J4x6c5qMf2XfIn?=
 =?us-ascii?Q?LuIdogRHHGps4fRdF6HbHCRKduIU0TESbjtBJt/1pOOsSXYEsRBtOTLAi38l?=
 =?us-ascii?Q?kKL/g2zTJ+rq3jo780yWuP6zX3yRqDomF9WmK4pQ+s0v/+m+EiSeZAEbf4kp?=
 =?us-ascii?Q?QX00Gw2A8qrVU9gM+oOktDdB/r0oquUI+baOcR9EIRNQ3ztnfXDsJTezAFyF?=
 =?us-ascii?Q?Afbj9vgiHREu3LF1l6kYSIyOLJpcdvxtrTXThTQKU+LYoREDdPPuOMABZVTk?=
 =?us-ascii?Q?yglvHKC/TSyZ8QrkRWEh0kgCfO2drqe1Asu5ps5iaaT+f2hC6U4k05kvmWH9?=
 =?us-ascii?Q?LwGJgXpjGikQagOxoDqFf1vQJEVXfLMLRTc12K4/wghZd/Hv0RjqjbAO7J+M?=
 =?us-ascii?Q?bKTavXpd+fArqEp+vJ+YwDNUbOrnzwLlWcK7xWHTMyo4DELxBWGBYXJsNDZz?=
 =?us-ascii?Q?b6axnheHwKXJUGyWlrmxYdR95wRaHtTb461VvXBkQVrcH24QRvJPaFP80gx5?=
 =?us-ascii?Q?TZaNQbrEogRQhEWkBvK5+XM+0kcJBWOzlI0+7XP3TZHegG46xsr7Y/+R4rwH?=
 =?us-ascii?Q?wuyvEHeXQEe999vO+cINr4HP2j1OV8U8lDLggrdhPJD93GKAftz4eDBUIRci?=
 =?us-ascii?Q?uMzKFxvpLvMcu6NW3Qms8w1eZ2SbZjtzLvfr0rLxvTen4x7vpuyrwbba8Sov?=
 =?us-ascii?Q?vY+kaBJ5FgK/MEjAlxQT50KRzZT/sOeM7R6mgQqE2Zgs2Fg1rrgnkn0cMCWr?=
 =?us-ascii?Q?Tdc//s12mExWenj9yHP96StxKMx3jLeFMUIjRJAxHz+CbEnTD7ptc23OR0jf?=
 =?us-ascii?Q?Dj6Nh6tU9CtroeGhtpCt7CxW+lC6eDx4p34XcmYUoGqnPHFw3c5RYiOvlFIp?=
 =?us-ascii?Q?s72ocL556/FnE3LrI+ior5siv+S13P/2qWLSF2V3q1Qur9VG3lqvMDW5zflp?=
 =?us-ascii?Q?zd/+ua1cRJOQjlFowPlW2DE6j08ksONAjlAmPJEHqRFOpq5cRAJLoY/LU3fg?=
 =?us-ascii?Q?eFX30hNlmo58THks2YeqdqZl9E+Y3+qf?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2024 19:02:08.7658
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fc53d28-8ef3-48d4-611d-08dcacdc489a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7708

From: Victor Lira <victorm.lira@amd.com>

Requested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Victor Lira <victorm.lira@amd.com>
---
Notes:
This is a utilty script for help with the MISRA process.
This script matches all linker symbol names in linker script files for
arm or x86.
Not included are symbol names starting with "." or symbol names enclosed
in quotes since the files dont't use any. The regular expression also does
not match for "&=" and similar compound assignments.
---
Cc: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: roberto.bagnara@bugseng.com
Cc: consulting@bugseng.com
Cc: simone.ballarin@bugseng.com
---
Changes v2:
- address style comments
- updated script to use .lds instead of .lds.S
- remove sample output from patch

Changes v3:
- use #!/bin/sh
- update error handling and message similar to ../build.sh
---
 automation/eclair_analysis/linker-symbols.sh | 34 ++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100755 automation/eclair_analysis/linker-symbols.sh

diff --git a/automation/eclair_analysis/linker-symbols.sh b/automation/eclair_analysis/linker-symbols.sh
new file mode 100755
index 0000000000..61790fb281
--- /dev/null
+++ b/automation/eclair_analysis/linker-symbols.sh
@@ -0,0 +1,34 @@
+#!/bin/sh
+
+# Stop immediately if any executed command has exit status different from 0.
+set -e
+
+# Extract linker symbol names (except those starting with ".") from assignments.
+
+script_name=$(basename "$0")
+script_dir="$(
+  cd "$(dirname "$0")"
+  echo "${PWD}"
+)"
+src_dir="${script_dir}/../.."
+
+fatal() {
+  echo "${script_name}: $*" >&2
+  exit 1
+}
+
+usage() {
+  fatal "Usage: ${script_name} <arm|x86>"
+}
+
+if [ $# -ne 1 ]; then
+  usage
+fi
+
+filepath="${src_dir}/xen/arch/${1}/xen.lds"
+
+if [ ! -f "$filepath" ]; then
+  fatal "Could not find ${1} linker script. Must be run after arm/x86 build."
+fi
+
+sed -n "s/^\s*\([a-zA-Z_][a-zA-Z_0-9.\-]*\)\s*=.*;.*$/\1/p" "$filepath"
--
2.25.1


