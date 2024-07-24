Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE9893AA23
	for <lists+xen-devel@lfdr.de>; Wed, 24 Jul 2024 02:20:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.763648.1173932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWPiE-0002po-Q8; Wed, 24 Jul 2024 00:18:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 763648.1173932; Wed, 24 Jul 2024 00:18:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWPiE-0002nn-NG; Wed, 24 Jul 2024 00:18:34 +0000
Received: by outflank-mailman (input) for mailman id 763648;
 Wed, 24 Jul 2024 00:18:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a5wr=OY=amd.com=VictorM.Lira@srs-se1.protection.inumbo.net>)
 id 1sWPiD-0002nh-NI
 for xen-devel@lists.xenproject.org; Wed, 24 Jul 2024 00:18:33 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20613.outbound.protection.outlook.com
 [2a01:111:f403:2408::613])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3f94066e-4952-11ef-8776-851b0ebba9a2;
 Wed, 24 Jul 2024 02:18:28 +0200 (CEST)
Received: from DM6PR03CA0010.namprd03.prod.outlook.com (2603:10b6:5:40::23) by
 PH7PR12MB5903.namprd12.prod.outlook.com (2603:10b6:510:1d7::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20; Wed, 24 Jul
 2024 00:18:23 +0000
Received: from CY4PEPF0000EE38.namprd03.prod.outlook.com
 (2603:10b6:5:40:cafe::f4) by DM6PR03CA0010.outlook.office365.com
 (2603:10b6:5:40::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.16 via Frontend
 Transport; Wed, 24 Jul 2024 00:18:22 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000EE38.mail.protection.outlook.com (10.167.242.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7784.11 via Frontend Transport; Wed, 24 Jul 2024 00:18:21 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 23 Jul
 2024 19:18:20 -0500
Received: from xsjwoods50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39 via Frontend
 Transport; Tue, 23 Jul 2024 19:18:20 -0500
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
X-Inumbo-ID: 3f94066e-4952-11ef-8776-851b0ebba9a2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QIKxhtUA/vU+vBG7256ipJrxRzSbefDFd/r2qf/jyGS37nYcPJ46mGaIEkOWFjDQm0dMZnZ5YaVc0J0iOeXZSNSLAK3+TW8fRYLFkQ5i1NZNXuWUuGyi5OFZ0ufBe3obZi0WdOP4rBWSkZzCt6uabll9HViw6Kfyhe8o5mg38H7k0L+bORJFdl73mgoL6KBNkGIcPFbg936HHr9sFbu8d13cIyge4D5pwXKaIBWxUKw9rn81aonoZejuhMZf8bRPFr95pRFBN836CNlHRe1pm4zcqEdT6xIuZ8RZCljZlLsmP7sZ93Fq+NnB9ATKiM5L3JSZQOwLJShHKpgHnX1WLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pdmzGOZ01iKtzDRXJ5lnNKsk76Ks+qEliQuX5qEoB0I=;
 b=XuFRkWL4mmsySTk6eJw1SFhEFENem1AxWqWYs3U+j8F5UE96YVK+XG+qR73+X2ku2PlCBF6n2oP2kf7dJ7lRGnaCaLpse8CgeWZnKZk1igvOJ+d9s1OZqrvxVmAlb/DeCpcnELE26NvVmZTikTBMKr8lG6v8N+/7wpX/0ZOxKjLH0SW9smuJCRo3txc5rZu+C50WkGaf4k8E1IAmezLNzPwT9Zz3qApk4Wrl9DIAAszB2pHupE+x5H2AokhAjRXKa6Xjl5/EnzFfq9uSx15ZxBnDhi1kkyvYJ5xl/U+wUxJAeAP3NJ0SkuiA7cwVhL4zjDwBd/WGRVAQQ+gQZj7OnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pdmzGOZ01iKtzDRXJ5lnNKsk76Ks+qEliQuX5qEoB0I=;
 b=hZ7otTfcJjL8mPpwYike4ZZjOT8Dm0W3FuEqzR3/iwCGei9ft8YAA8F4rAMx91GgrWGstXZDUCzU10QlbNL1Bc/IObbZwa1mbDRmNVDpdOsxWe+mGYU2cNH2DS0yXRyp7Kjkct4WYV0fI7xekHRF6Kcrd4mDzIKe0gN/PVQKBss=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: <victorm.lira@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Victor Lira <victorm.lira@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, <roberto.bagnara@bugseng.com>,
	<consulting@bugseng.com>, <simone.ballarin@bugseng.com>
Subject: [RFC PATCH] automation: add linker symbol name script
Date: Tue, 23 Jul 2024 17:18:05 -0700
Message-ID: <06e4ad1126b8e9231bf6dcf88205857081968274.1721779872.git.victorm.lira@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: victorm.lira@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE38:EE_|PH7PR12MB5903:EE_
X-MS-Office365-Filtering-Correlation-Id: ab898da0-0da6-4115-50d2-08dcab762092
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZI9hi9tZTnmZGRgg6cob/cM108LutXw+YtkBmBD4N84BzVGgjEcfb8dGATL4?=
 =?us-ascii?Q?dNTRayzRpTkF1UYzvt7iHQtpLmc2Ay/lZ8IQC//EzWapMzC1EKoDrTnI9NGU?=
 =?us-ascii?Q?r3WgPYR/vobVYt1jAOJOZLe0jq8m+7dsmkMxhXEs1C9XTEWRhpBvIawU9yxX?=
 =?us-ascii?Q?DPZMJ9775I4DZe7wDxZY5QXPesZLZGe6tCrg/0iNfH43XPq03pMOGQ+iLjj7?=
 =?us-ascii?Q?PcVKs8Dv7PMC3FqV0b9ZpgkztDugSgEKD2WxclHIFKLje+hjq/NOSw+cHMRC?=
 =?us-ascii?Q?kVqz5+rzQsphNIWVjYihw5aPpmeLbXKTh1XvEb+sjFCwuAadUhQcQXYZ6Njm?=
 =?us-ascii?Q?MSZaRwRY0SGgrSiP3dHt2mUb4LlkDnSeX8C1eU+yaetR72a0tRfijm7VNXur?=
 =?us-ascii?Q?wUgkWQs+YF/pRiMAP/ODO/AVRuSdGtEbkEbPGx2qOLCilsuxyagL26uSCyO+?=
 =?us-ascii?Q?OVp4d4vUF0BVmj1Dwq0PClPGKPvB/PbdgYT98miXoB2ySnuY/IEL4nkbmIIE?=
 =?us-ascii?Q?A+Zq86TjtmpsiVFjMgCeptvbBBsKleamhUfdi9PJLoc9TzWKXC1xuXcUD9AZ?=
 =?us-ascii?Q?9kHisvfOhREVZg+LqVLHcgYQlfYpTK73eVySebN7PkLKDn6KapUZBwa0GWNu?=
 =?us-ascii?Q?cLl1A/dkWzLj7GaxjmLmyzj6t7mGxZGL6dD46GfnsM/5KpFWf7NR1t3goQxw?=
 =?us-ascii?Q?gULAz2TrHZwnaebyrNwE5NUvwuczV7OYFt0QlZMZlBLJTsgv0MEvDXo8NXV+?=
 =?us-ascii?Q?gpc9iTU6UJ7MZv1CmZQ15rgQxEdd0aeHmPYwUL2Xni0EYy4ULtIj5wBzNoss?=
 =?us-ascii?Q?ntVdxdcsP5pEjOateijPVr7rWZQAxL2uQtNHiTmCsio073nxvV1NZWoA/vZd?=
 =?us-ascii?Q?l5+FkBuE1JTXQRAonNNbFawXLRgn5z3RoaPyHrn2XMDbr+CacJ7ELSbWx8G6?=
 =?us-ascii?Q?1cTEz53ikX8/TcH7ss58/rJx0DRf9DaIOG7tY2xtwKrI2rQyfxlldjl9xstV?=
 =?us-ascii?Q?gjfZnN+9R88xyxlGH4//UEI+6w1gv+TBX+8uZYaL9NpsLTLzNOHrBqzWhTge?=
 =?us-ascii?Q?jbZpcYzaIwdpX6Q/4rlOfNSHZaaUAnt4ty3qLWVkXi6+pwp0J3IOvxJqW303?=
 =?us-ascii?Q?IYN7IjK9KACCkSomz3OzCoqyOTDrQJWUPpCnTGIEycu0SXlJ6GGt93ZDHhJ2?=
 =?us-ascii?Q?AMK8K+mg1H2Qw69O9b9sEW4GgAyTosvdzRqMqF4bXga4c5eeJNxSbVwpzEBO?=
 =?us-ascii?Q?PfAxQGWJm2nb5aonkO9Qf4HcsS+60npQBaNQ8oJcOZqyNk3JyCCYV1rAVkaj?=
 =?us-ascii?Q?N+YJ7SacWeS+jxHAE5KLiRgy9DQZ9xFHZsnGD17McHFUWXUJDEYasja7NJHK?=
 =?us-ascii?Q?hsaIWXLWX2F+QMzfeK/k0RzItTnq2E9FYn/682q+249BBmOj+m1kbvGYZMNc?=
 =?us-ascii?Q?WLedNRZ7VbPQrSoP8r5/MNrtaCLCVHoX?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2024 00:18:21.7749
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ab898da0-0da6-4115-50d2-08dcab762092
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE38.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5903

From: Victor Lira <victorm.lira@amd.com>

Add a script that extracts the names of symbols in linker scripts.

Signed-off-by: Victor Lira <victorm.lira@amd.com>
---
Note:
Not included are the "." location name or symbol names enclosed in quotes
since the files dont't use any.
---
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: roberto.bagnara@bugseng.com
Cc: consulting@bugseng.com
Cc: simone.ballarin@bugseng.com
---
 automation/eclair_analysis/linker_symbols.sh | 41 +++++++++++++++++++
 automation/eclair_analysis/stuff.txt         | 42 ++++++++++++++++++++
 2 files changed, 83 insertions(+)
 create mode 100755 automation/eclair_analysis/linker_symbols.sh
 create mode 100644 automation/eclair_analysis/stuff.txt

diff --git a/automation/eclair_analysis/linker_symbols.sh b/automation/eclair_analysis/linker_symbols.sh
new file mode 100755
index 0000000000..c8c44e235f
--- /dev/null
+++ b/automation/eclair_analysis/linker_symbols.sh
@@ -0,0 +1,41 @@
+#!/bin/bash
+# Stop immediately if any executed command has exit status different from 0.
+set -e
+
+# Extract linker symbol names (except those starting with ".") from assignments.
+
+script_name=`basename "$0"`
+script_dir="$(
+  cd "$(dirname "$0")"
+  echo "${PWD}"
+)"
+src_dir="${script_dir}/../.."
+
+usage() {
+  echo "Usage: ${script_name} <ARM64|X86_64>"
+}
+
+if [ $# -ne 1 ]; then
+  usage
+  exit 1
+fi
+
+if [ "$1" == "X86_64" ]; then
+    filepaths=(
+        "${src_dir}/xen/arch/x86/xen.lds.S"
+    )
+elif [ "$1" == "ARM64" ]; then
+    filepaths=(
+        "${src_dir}/xen/arch/arm/xen.lds.S"
+    )
+else
+    usage
+    exit 1
+fi
+
+(
+    for file in "${filepaths[@]}"
+    do
+        sed -n "s/^\s*\([a-zA-Z_][a-zA-Z_0-9.\-]*\)\s*=.*;\s*$/\1/p" $filepaths
+    done
+)
diff --git a/automation/eclair_analysis/stuff.txt b/automation/eclair_analysis/stuff.txt
new file mode 100644
index 0000000000..efc33e6a59
--- /dev/null
+++ b/automation/eclair_analysis/stuff.txt
@@ -0,0 +1,42 @@
+_start
+_idmap_start
+_idmap_end
+__proc_info_start
+__proc_info_end
+__note_gnu_build_id_start
+__note_gnu_build_id_end
+__ro_after_init_start
+__ro_after_init_end
+__start___ex_table
+__stop___ex_table
+__start___pre_ex_table
+__stop___pre_ex_table
+__start_schedulers_array
+__end_schedulers_array
+_splatform
+_eplatform
+_sdevice
+_edevice
+_asdevice
+_aedevice
+_steemediator
+_eteemediator
+__init_begin
+_sinittext
+_einittext
+__setup_start
+__setup_end
+__initcall_start
+__presmp_initcall_end
+__initcall_end
+__alt_instructions
+__alt_instructions_end
+__ctors_start
+__ctors_end
+__init_end_efi
+__init_end
+__bss_start
+__per_cpu_start
+__per_cpu_data_end
+__bss_end
+_end
--
2.37.6


