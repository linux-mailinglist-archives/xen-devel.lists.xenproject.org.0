Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 322C993B62C
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2024 19:52:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.764461.1174913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWgAF-0000Rk-LE; Wed, 24 Jul 2024 17:52:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 764461.1174913; Wed, 24 Jul 2024 17:52:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWgAF-0000PZ-IZ; Wed, 24 Jul 2024 17:52:35 +0000
Received: by outflank-mailman (input) for mailman id 764461;
 Wed, 24 Jul 2024 17:52:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a5wr=OY=amd.com=VictorM.Lira@srs-se1.protection.inumbo.net>)
 id 1sWgAE-0000PS-5h
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2024 17:52:34 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2061b.outbound.protection.outlook.com
 [2a01:111:f403:2414::61b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7fd0950b-49e5-11ef-8776-851b0ebba9a2;
 Wed, 24 Jul 2024 19:52:32 +0200 (CEST)
Received: from BL0PR1501CA0028.namprd15.prod.outlook.com
 (2603:10b6:207:17::41) by DM6PR12MB4060.namprd12.prod.outlook.com
 (2603:10b6:5:216::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.18; Wed, 24 Jul
 2024 17:52:28 +0000
Received: from BL6PEPF00022571.namprd02.prod.outlook.com
 (2603:10b6:207:17:cafe::f4) by BL0PR1501CA0028.outlook.office365.com
 (2603:10b6:207:17::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.25 via Frontend
 Transport; Wed, 24 Jul 2024 17:52:28 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF00022571.mail.protection.outlook.com (10.167.249.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.11 via Frontend Transport; Wed, 24 Jul 2024 17:52:28 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 24 Jul
 2024 12:52:27 -0500
Received: from xsjwoods50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Wed, 24 Jul 2024 12:52:27 -0500
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
X-Inumbo-ID: 7fd0950b-49e5-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E3qEj7ADIi3WXMC5aXGqCHYV7Uk5oY01kvVCDIuMWtW7cAZ6LStISe78Ti8U/RLkLNL2AC//nrwE2foRnQmsvzkFrntzZlour2OMrh9ETsaXGol9GBL8osfak60OpmWYtbeXoklUMt1gUr9HasHIPF0AcvzPvrzaVcRRQzPimE59/VTdxv9hBeTwmUBanM1n8ncmu22v9ElS+EnDiCr0IbGLWs/6ZBJ1Vf0fuskpXQXbDi+XtZ7qAZ2SADqVZSTeJr7psr3M779Xsk4fdtUEMdyvlbO6MzjPKNAfzvgRQwY/SDk90N5NXcuLPrtpwP2Lem0EZkid7/5KE0GaID/zIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QSG+4QXsyKI+tdBgDmtpUygqksz8xeQoqV4gwUkde9s=;
 b=tnYSxYx7Jmv8MyMkL6U5V1DOJzI042nd4/4RwwEg3pTU+cFjmloepNJsLHIeKykTmjBx/ZpMvPFlQq44lRyNObb7sfUYzRRbTEi+vdZZm8PNefIiJlL8wUCPF5/vKQ/77FD5HvplXFMz8kPJwrbhaeqglCfn53PAiyJMJs2FGnl+Pa6ugk5N4Qfn7fzu8TrRTIAk8Df4L7vGDQfjUXMcPAVrakz+p1vrg7exG1DdxRt8ypRsYifSBlfsxMClg+H/NiOSWxOfhWT/8uebXUUMkO7jO0S+1k6wfhSIyC9stAHE9iRk/iCIQ/2qdBvvArO3pxs7MPZjSoDXR3q6uB8byg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QSG+4QXsyKI+tdBgDmtpUygqksz8xeQoqV4gwUkde9s=;
 b=izrKgzmxT1SuPxMNxHvCpUtD+KeIRWl9lsqvnlO64vkunw98SKYvFu4aNE5cfDw8tOSirPejfkQwfKMU9vq3yzCmjVApP6yr/cH6f+aXDkOOUGFOUc27gdAzpRKz06nWaG/m9OiGBmJHdZneE2jxoxofD4JCyC9OJmeREkvhRMU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: <victorm.lira@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Victor Lira <victorm.lira@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, <roberto.bagnara@bugseng.com>,
	<consulting@bugseng.com>, <simone.ballarin@bugseng.com>
Subject: [RFC PATCH v2] automation: add linker symbol name script
Date: Wed, 24 Jul 2024 10:52:06 -0700
Message-ID: <5b2862d6d036248e8cdd76e9884f173c6b7ff325.1721842334.git.victorm.lira@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB03.amd.com: victorm.lira@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022571:EE_|DM6PR12MB4060:EE_
X-MS-Office365-Filtering-Correlation-Id: ec11ed7c-f491-4350-6aa6-08dcac096258
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?NWEcFUHV/PlOiKEqVbX2wx6yI8u4PqArGXSkajeDVT1s2f364RVgVnB1pC1G?=
 =?us-ascii?Q?SGJY5c/tHLYhxZGdU3dHMqtnt3zo4P/8FrPdel3/Osu+9bKXCu+UZjZknwPR?=
 =?us-ascii?Q?4le9ZES35nREjoJkBkLp53FDPKCtfrG3OamebqgjubRhLn/SLr63pfYQxzrU?=
 =?us-ascii?Q?4dWngZDlYL8finUw9oaV+8N4NQPJHLdoBU/B9tWKMlB3eCDb6g2kjDLJXzS9?=
 =?us-ascii?Q?B/9Y75A+izQ7HIUAC+9shDNos+8SxeYIUJTuk/X0eayqYXwIEwnQpa17WV5n?=
 =?us-ascii?Q?V/1uPIYouJyQqZtZsY4TRbq5conW1d4vmp3zOYQTrRCsIqhRiFE0uLn4g1no?=
 =?us-ascii?Q?BaSIvs47mS4dX9Q+4UbHcn/ybl0flaQlk2B8Y69YM0XoMGhkomkZL6DnKwoh?=
 =?us-ascii?Q?uVWsFJs/pBMOcYGRH9XnAeoHruBNe9VEp03k1NN7BPlO+VpBffdNSZgVd1EN?=
 =?us-ascii?Q?JhrEJrDtmR4Edta0y/qOMmmaxijOXZrKKgbbW5c0jpX26VwASm17Qkgf5PDx?=
 =?us-ascii?Q?ddBVLZK3VrvEg7B5aQ/ojqdjLtSlnhpMHiZrajodSdcS6C2X57qnURFwztB9?=
 =?us-ascii?Q?gkXx5k73ftvorvacglfOTKhKM3AgsjJQtfIlad6xefZaJ2wWhLDpuw4UwXtB?=
 =?us-ascii?Q?INdvGwYm6pDkXz8H6I9kfDu31FXMJhQu1O21Taw1RuOT3zcl6VTnBhuwUeiA?=
 =?us-ascii?Q?4p10LDdTMlqQzBJXkCyYzVvkqMKh7j3xs7TxLAX35bsoj88j3dr+VQEN+frB?=
 =?us-ascii?Q?GhzE5U7micgg/Fm+vN8/d5jq4TIae/uo/L51KuC2+mhJjgqBGbwcZ2SRom4O?=
 =?us-ascii?Q?zNv6l84DlEOmSzqhPmjfSojQ4Fl+ROJfHC1fDPwg+Epz/5yZYvxMvBbpC22L?=
 =?us-ascii?Q?D5YBtvhAU+uVPKUfeGFZ5pFDm86VY6CtUUkzZR0qrqkHb6cgeuKL9Ow5oNFJ?=
 =?us-ascii?Q?NVY3cVaAUq3s2FMP2zZJ6F3up46TgOb7aLlji8EV8XeuC0T+l5qxt6utPHda?=
 =?us-ascii?Q?y4kDdiHKhNlxbwJ45OzXObWhQkS2sDdASgcbxuWx39aepLKR4a5DqqpFWeSh?=
 =?us-ascii?Q?oTS48w2VZjCw3ecNzijQP13cjSinLhU8FTjzNrYEnOo5vBARfZBYm7NtUI3w?=
 =?us-ascii?Q?3t3+tPQqfhI753JSAeSonhEkhYWS/jLIZ4LOSByETHt1vSBVaBBKRxfNzlDc?=
 =?us-ascii?Q?1Z7fJsGKd+qtgQ4qzR+XtbCnp5DuEyyI5n9pLb6PzANl0xP+6BukIUFP3NZs?=
 =?us-ascii?Q?dGPwK5HAmBERqPgNI/+BjZqYuLTwlPitRdDRhu0mHVLkbnBMi+r5ybL39E7J?=
 =?us-ascii?Q?qrpQL77V6A3e3YkXubHybfNtAnfjiuZrjwl008RrMndgxXqc/XBHWEdGNQ1a?=
 =?us-ascii?Q?YEYBUtfuUN28lLsUcNdGpV/gp4uTjhYzfVxdacJyTT2e9wqdstXPNFa186tc?=
 =?us-ascii?Q?F/MxU4suELxg6j7pBoZdstE6YYr62EC1?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2024 17:52:28.3318
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ec11ed7c-f491-4350-6aa6-08dcac096258
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022571.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4060

From: Victor Lira <victorm.lira@amd.com>

Signed-off-by: Victor Lira <victorm.lira@amd.com>
Requested-by: Stefano Stabellini <sstabellini@kernel.org>
---
Notes:
This is a utilty script for help with the MISRA process.
This script matches all linker symbol names in linker script files for
arm and x86.
Not included are symbol names starting with "." or symbol names enclosed
in quotes since the files dont't use any. The regular expression also does
not match for "&=" and similar compound assignments.
---
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: roberto.bagnara@bugseng.com
Cc: consulting@bugseng.com
Cc: simone.ballarin@bugseng.com
---
Changes v2:
- address style comments
- updated script to use .lds instead of .lds.S
- remove sample output from patch
---
 automation/eclair_analysis/linker-symbols.sh | 34 ++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100755 automation/eclair_analysis/linker-symbols.sh

diff --git a/automation/eclair_analysis/linker-symbols.sh b/automation/eclair_analysis/linker-symbols.sh
new file mode 100755
index 0000000000..35ec97eb8e
--- /dev/null
+++ b/automation/eclair_analysis/linker-symbols.sh
@@ -0,0 +1,34 @@
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
+usage() {
+  echo "Usage: ${script_name} <arm|x86>"
+}
+
+if [ $# -ne 1 ]; then
+  usage
+  exit 1
+fi
+
+if [ "$1" != "arm" ] && [ "$1" != "x86" ]; then
+    usage
+    exit 1
+fi
+
+filepath="${src_dir}/xen/arch/${1}/xen.lds"
+
+if [ ! -f "$filepath" ]; then
+    echo "Must be run after build."
+    exit 2
+fi
+
+sed -n "s/^\s*\([a-zA-Z_][a-zA-Z_0-9.\-]*\)\s*=.*;.*$/\1/p" $filepath
--
2.25.1


