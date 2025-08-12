Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30F34B22B89
	for <lists+xen-devel@lfdr.de>; Tue, 12 Aug 2025 17:20:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1078830.1439869 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulqn7-0000ie-T8; Tue, 12 Aug 2025 15:19:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1078830.1439869; Tue, 12 Aug 2025 15:19:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulqn7-0000gp-QV; Tue, 12 Aug 2025 15:19:57 +0000
Received: by outflank-mailman (input) for mailman id 1078830;
 Tue, 12 Aug 2025 15:19:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2eVr=2Y=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1ulqn6-0000gD-Ns
 for xen-devel@lists.xenproject.org; Tue, 12 Aug 2025 15:19:56 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20617.outbound.protection.outlook.com
 [2a01:111:f403:2409::617])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cbd70d97-778f-11f0-b898-0df219b8e170;
 Tue, 12 Aug 2025 17:19:54 +0200 (CEST)
Received: from BYAPR05CA0004.namprd05.prod.outlook.com (2603:10b6:a03:c0::17)
 by CYXPR12MB9320.namprd12.prod.outlook.com (2603:10b6:930:e6::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.14; Tue, 12 Aug
 2025 15:19:49 +0000
Received: from SJ1PEPF0000231F.namprd03.prod.outlook.com
 (2603:10b6:a03:c0:cafe::55) by BYAPR05CA0004.outlook.office365.com
 (2603:10b6:a03:c0::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.14 via Frontend Transport; Tue,
 12 Aug 2025 15:19:49 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF0000231F.mail.protection.outlook.com (10.167.242.235) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Tue, 12 Aug 2025 15:19:49 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 12 Aug
 2025 10:19:48 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Tue, 12 Aug 2025 10:19:47 -0500
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
X-Inumbo-ID: cbd70d97-778f-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BLDZ/VPxMJXn20QzVuoE2sOjrPz7QvyKf69MYkwShpkOaojaAarzLp7RrtGlpqwMvfJekElQpWVD7+hcXdzCXdPmQASQfVIvkMNGbxji9HYI4tToYv1zCy3laDwsakOR7QAZzzckK+uuh0LDveRHy/wici9ZY1LYGVKUl9TPk2ZtiCX3HnwZKOd01MQm++8eOTyeuxzZfMdENYdjwpjtY9jZRYu+feRZVqy+tMsfX+p/0WKT4kg55moGff0mm3SL5HGhproYoO3RRaKD8Vl+rQlDjef5mxmUuF+gkieivYe2fcWlofGxfZjT8a+kc4PYs0jO/fSDaD53atPi/8JfTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PrPIM8A4aIPQfjFr5jvz7XmcXaxbQs7GRRM2mw5Y0v8=;
 b=fJjiT831kNqChoyFesTg+6GLcDGf0SrZTniwLDhIzg+rRR2wRtJhRHDwdzNLjxO/IALcC90ZkBk0FhUuPzhfeFlJAH64E2y8gN7KJ/hNTP07M7SvsWwdUHF80WQlVhU9HidSVrVJWugdAzRd940kDWNfP+Z3qaE6Pe9c8T/WS6fXaDjL9fFjkqyuxVPA6TA57gsFtU7RMh2dKwTVgBV44UHXdUEkVkd3Z0Ho49LBpjPhiP7ej3Ft+MCKZAedmjq/50uV3VXCHuvA+N4M27/whsiChxLWIGN3h3NrTr5PvWEJtcOzpHV2AIsLhwcT5czsIwCZnS/+FOVJsd4tYzxngQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PrPIM8A4aIPQfjFr5jvz7XmcXaxbQs7GRRM2mw5Y0v8=;
 b=fiWSc+A2rrNZDBhOA7mdwlJWK95ukr5VrsNsOaEgtWPTua/xIZ98D8fDF6nV09jTr3uEIPjPjfHqEzeedjJlv1eYrZfl9s7vQMPy5U82I+a4f6Wkqm7jqt9gJS95BPtKPV4ynz5CrHdbs7Q/O5E9dg0SiYl4ehTBXraO13uv/w8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <michal.orzel@amd.com>,
	<andrei.cherechesu@nxp.com>, <dmukhin@ford.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>
Subject: [ImageBuilder v2] Add config option to use separate load commands for Xen, DOM0 and DOMU binaries
Date: Tue, 12 Aug 2025 16:19:45 +0100
Message-ID: <20250812151945.2430295-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB04.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231F:EE_|CYXPR12MB9320:EE_
X-MS-Office365-Filtering-Correlation-Id: 521a66a6-1e3e-4c9f-7d1d-08ddd9b3ade3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mcOItckCkaGaGtKqkgieg4rHYwhzUydZyZWOBgC3EIjkg3aYZKbEDNgKjCPf?=
 =?us-ascii?Q?P4jeyfCodMFJIDJeDeqc+o3UgurtuLfoTKF8orjA4TL0IOZr5B5pHsoazap7?=
 =?us-ascii?Q?y9YYr6b+Ir88F5L1k/lnklE9PXbvRHLpJmVoWvz93kudfTtIwi207f3DTSxB?=
 =?us-ascii?Q?xDSnxHXAcspoVlbT31wNj21phIbu9t83APWNIOxH0FvySALFUA5U/XvFcCI3?=
 =?us-ascii?Q?6imExCwNyHWOGUHb+Q9+7O763Z/hyVFMyR9dsVa49cJ7ZdZpmnORJo3ooYsY?=
 =?us-ascii?Q?fNskmKhizTU37OiRKsGCwohDk00gLsH1kWxvFgCjkW1IsNd77fPsCAlROE6i?=
 =?us-ascii?Q?tDbR6T8l0Xkzwhs2Ox++Wazvoo002yhILpkkdV5ZRypA7XBHRIlpgKYBSl+B?=
 =?us-ascii?Q?s0BY/5WHmO2eQkV8PMdnNvmeb7Az0BAI0Lt/3ldOIU+/4TuKjDalPKspddkU?=
 =?us-ascii?Q?N1GyW0ONB/crJ7qpooPcWXAEutY02iaHWiJKqL6vMnml/p/6MD6LGcLoIWoO?=
 =?us-ascii?Q?fEuMI/BtZYij1QO+dbekadLZkVIUkYV3gMwi4zZv99go4s8Q4uPRhZTmRi6L?=
 =?us-ascii?Q?/r6YoQ30WpkG+gE4aTPpR55Cfq8QHS6QEJ9keKncER1sBCzsOKGm4A2ffN78?=
 =?us-ascii?Q?rCK8pHBa4OU5PKKI3W5ThbzH7AnijBeEGqxeGTlmp5q1J/bVfMz9MpIBFb6+?=
 =?us-ascii?Q?cUSfNjWc9waGK3wkZ2oSKbsWE5rBVH7fvUode3+xEKC0gMQ/5wFXCDHLpMgv?=
 =?us-ascii?Q?7x6ookGhHupIN5X4FlqC1lkzt/PNuFVdK8lKk2MSNI4z2Pw2+1yXtouDnXzU?=
 =?us-ascii?Q?XQzjGZp/lBrUEbsdQ+oDtPOj33oltAFZoTI6XVLHn1y7w6ydd7y25+QrXWnq?=
 =?us-ascii?Q?rDx46tZYewl3Y3muL6FMITdMBkczUu3vuOPghGHFWQcksQ6N1qsZ7EgXj71U?=
 =?us-ascii?Q?EnHj0i3iwBvXm0EpXzFmm28UXsLGNuAS8DKopn4XJc93lo/HhLSGw//Kw271?=
 =?us-ascii?Q?/DRy3CJ+I1Vp4ptaqUxwRg5k9o8eSirMlpnobkv1OLtc58n78IPizOwL9BUe?=
 =?us-ascii?Q?b6g6vw54QDeDxInownKNnryXcY6ks2LQup+5Buqyk0O7EKfXd+ADwpMf+mbR?=
 =?us-ascii?Q?sbWI9Hm6LmX6htCPxvgYMr3ko4vebadZsxZpDOYR9wuMbVWP1hpfZCFxCwQt?=
 =?us-ascii?Q?spKuiB1Ezuft3Di68Jne5Nd+5gGAOT4Vvc2/RpYAAabJ0vX0cCnnTHV8ghmD?=
 =?us-ascii?Q?HxaXUBjr62VqWQ0ReoBLAw5GpMw2/MXl/oiXIUKnXwaY3PfpcHz9U+UWZCt/?=
 =?us-ascii?Q?dXxEyErRakq/08fLIStJZ7GK62rRhxPtXRo8iTORx9W+cv8OF2nltqDdhEgR?=
 =?us-ascii?Q?ClYABha03tXBYLgLI1q8xU7HjnX2PdQle2LuIV0nrmk9WiIzvYg0lRCU5hAF?=
 =?us-ascii?Q?PMliX8YE38TN7jxmkXgvQmVEfFenFHiaotpqkw82nCiZEbe64AUHFKtok38/?=
 =?us-ascii?Q?3ZNFZtfuq9Wea8eQzYMnB0Ou5YO+uc5ssh+T?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 15:19:49.4861
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 521a66a6-1e3e-4c9f-7d1d-08ddd9b3ade3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9320

Introduce the following options :-
1. XEN_LOAD - This specifies command to load xen hypervisor binary and device
tree.
2. DOM0_LOAD - This specifies command to load Dom0 binaries.
3. DOMU_LOAD[] - This specifies command to load DomU binaries.

There can be situations where Xen, Dom0 and DomU binaries are stored in
different partitions. Thus, imagebuilder should provide a way the binaries
using different commands.

If any of the above options are not specified, LOAD_CMD is used by default.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
This patch should be applied first.

Changes from :-

v1 - 1. Make LOAD_CMD optional when XEN is set
2. find_root_dev() should be invoked with either "$DOM0_CMD" or "$LOAD_CMD"
depending on if it is invoked from xen_config() or linux_config().
3. User needs to set either LOAD_CMD or XEN_LOAD. If neither is set, throw
an error. This is true for DOM0_LOAD and DOMU_LOAD[].

 README.md                | 18 +++++++++-
 scripts/uboot-script-gen | 76 ++++++++++++++++++++++++++++------------
 2 files changed, 71 insertions(+), 23 deletions(-)

diff --git a/README.md b/README.md
index b7be268..59919df 100644
--- a/README.md
+++ b/README.md
@@ -33,10 +33,12 @@ BOOT_CMD="booti"
 
 DEVICE_TREE="mpsoc.dtb"
 XEN="xen"
+XEN_LOAD="ext4load mmc 0:1"
 XEN_CMD="console=dtuart dtuart=serial0 dom0_mem=1G dom0_max_vcpus=1 bootscrub=0 vwfi=native sched=null"
 PASSTHROUGH_DTS_REPO="git@github.com:Xilinx/xen-passthrough-device-trees.git device-trees-2021.2/zcu102"
 DOM0_KERNEL="Image-dom0"
 DOM0_CMD="console=hvc0 earlycon=xen earlyprintk=xen clk_ignore_unused"
+DOM0_LOAD="ext4load mmc 2:1"
 DOM0_RAMDISK="dom0-ramdisk.cpio"
 DOM0_MEM=1024
 DOM0_VCPUS=1
@@ -46,11 +48,13 @@ DT_OVERLAY[0]="host_dt_overlay.dtbo"
 
 NUM_DOMUS=2
 DOMU_KERNEL[0]="zynqmp-dom1/Image-domU"
+DOMU_LOAD[0]="ext4load mmc 4:1"
 DOMU_PASSTHROUGH_PATHS[0]="/axi/ethernet@ff0e0000 /axi/serial@ff000000"
 DOMU_CMD[0]="console=ttyPS0 earlycon console=ttyPS0,115200 clk_ignore_unused rdinit=/sbin/init root=/dev/ram0 init=/bin/sh"
 DOMU_RAMDISK[0]="zynqmp-dom1/domU-ramdisk.cpio"
 DOMU_COLORS[0]="6-14"
 DOMU_KERNEL[1]="zynqmp-dom2/Image-domU"
+DOMU_LOAD[1]="ext4load mmc 5:1"
 DOMU_CMD[1]="console=ttyAMA0 clk_ignore_unused rdinit=/sbin/init root=/dev/ram0 init=/bin/sh"
 DOMU_RAMDISK[1]="zynqmp-dom2/domU-ramdisk.cpio"
 DOMU_MEM[1]=512
@@ -77,7 +81,9 @@ Where:
 - LOAD_CMD specifies the u-boot command used to load the binaries. This
   can be left out of the config and be (over)written by the -t CLI
   argument. It has to be set either in the config file or CLI argument
-  though.
+  though. This is optional when XEN is set as user can provide specific
+  options (ie XEN_LOAD, DOM0_LOAD, DOMU_LOAD) to load Xen, Dom0 and DomU
+  binaries.
 
 - BOOT_CMD specifies the u-boot command used to boot the binaries.
   By default, it is 'booti'. The acceptable values are 'booti', 'bootm',
@@ -99,6 +105,9 @@ Where:
 - XEN_CMD specifies the command line arguments used for Xen.  If not
   set, the default one will be used.
 
+- XEN_LOAD specifies the command to load XEN and DEVICE_TREE. If not set,
+  LOAD_CMD will be used.
+
 - XEN_STATIC_HEAP="baseaddr1 size1 ... baseaddrN sizeN"
   if specified, indicates the host physical address regions
   [baseaddr, baseaddr + size) to be reserved as Xen static heap.
@@ -109,6 +118,9 @@ Where:
   uboot-script-gen will compile the partial device trees which have
   been specified in DOMU_PASSTHROUGH_PATHS[number].
 
+- DOM0_LOAD specifies the command to load DOM0_KERNEL and DOM0_RAMDISK. If not
+  set, LOAD_CMD will be used.
+
 - DOM0_KERNEL specifies the Dom0 kernel file to load.
   For dom0less configurations, the parameter is optional.
 
@@ -159,6 +171,10 @@ Where:
   kernel. If not set and DOMU_VPL011[number] is not set to 0, then
   "console=ttyAMA0" is used.
 
+- DOMU_LOAD[number] specifies the command to load DOMU_KERNEL[number],
+  DOMU_RAMDISK[number] and DOMU_PASSTHROUGH_DTB[number]. If not set, then
+  LOAD_CMD is used.
+
 - DOMU_RAMDISK[number] specifies the DomU ramdisk to use.
 
 - DOMU_PASSTHROUGH_PATHS[number] specifies the passthrough devices (
diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
index b81e614..656de72 100755
--- a/scripts/uboot-script-gen
+++ b/scripts/uboot-script-gen
@@ -737,6 +737,7 @@ function load_file()
 {
     local filename=$1
     local fit_scr_name=$2
+    local load_cmd=$3
 
     local absolute_path="$(realpath --no-symlinks $filename)"
     local base="$(realpath $PWD)"/
@@ -748,10 +749,10 @@ function load_file()
         add_size_from_file $filename
     else
         if test "$CALC"; then
-            echo "$LOAD_CMD \${memaddr} ${prepend_path:+$prepend_path/}$relative_path" >> $UBOOT_SOURCE
+            echo "$load_cmd \${memaddr} ${prepend_path:+$prepend_path/}$relative_path" >> $UBOOT_SOURCE
             add_size_calculate $fit_scr_name
         else
-            echo "$LOAD_CMD $memaddr ${prepend_path:+$prepend_path/}$relative_path" >> $UBOOT_SOURCE
+            echo "$load_cmd $memaddr ${prepend_path:+$prepend_path/}$relative_path" >> $UBOOT_SOURCE
             add_size_from_file $filename
         fi
     fi
@@ -830,10 +831,10 @@ function check_compressed_file_type()
 
 function find_root_dev()
 {
-
-    local dev=${LOAD_CMD%:*}
+    local load_cmd="$1"
+    local dev=${load_cmd%:*}
     dev=${dev##* }
-    local par=${LOAD_CMD#*:}
+    local par=${load_cmd#*:}
 
     if [ -z "$dev" ] || [ -z "$par" ]
     then
@@ -844,10 +845,10 @@ function find_root_dev()
 
     par=$((par + 1))
 
-    if [[ $LOAD_CMD =~ mmc ]]
+    if [[ $load_cmd =~ mmc ]]
     then
         root_dev="/dev/mmcblk${dev}p${par}"
-    elif [[ $LOAD_CMD =~ scsi ]]
+    elif [[ $load_cmd =~ scsi ]]
     then
         # converts number to a scsi device character
         dev=$((dev + 97))
@@ -925,7 +926,7 @@ function xen_config()
         then
             DOM0_CMD="$DOM0_CMD root=/dev/ram0"
         else
-            find_root_dev
+            find_root_dev "$DOM0_LOAD"
             # $root_dev is set by find_root_dev
             DOM0_CMD="$DOM0_CMD root=$root_dev"
         fi
@@ -973,7 +974,7 @@ function linux_config()
         then
             LINUX_CMD="$LINUX_CMD root=/dev/ram0"
         else
-            find_root_dev
+            find_root_dev "$LOAD_CMD"
             # $root_dev is set by find_root_dev
             LINUX_CMD="$LINUX_CMD root=$root_dev"
         fi
@@ -1003,11 +1004,22 @@ generate_uboot_images()
 
 xen_file_loading()
 {
+    if test -z "$DOM0_LOAD"
+    then
+        if test "$LOAD_CMD"
+        then
+            DOM0_LOAD="$LOAD_CMD"
+        else
+            echo "Neither DOM0_LOAD nor LOAD_CMD is specified"
+            exit
+        fi
+    fi
+
     if test "$DOM0_KERNEL"
     then
         check_compressed_file_type $DOM0_KERNEL "executable\|uImage"
         dom0_kernel_addr=$memaddr
-        load_file $DOM0_KERNEL "dom0_linux"
+        load_file $DOM0_KERNEL "dom0_linux" "$DOM0_LOAD"
         dom0_kernel_size=$filesize
     fi
     if test "$DOM0_RAMDISK"
@@ -1015,7 +1027,7 @@ xen_file_loading()
         check_compressed_file_type $DOM0_RAMDISK "cpio archive"
         ramdisk_addr=$memaddr
         ramdisk_path=$DOM0_RAMDISK
-        load_file "$DOM0_RAMDISK" "dom0_ramdisk"
+        load_file "$DOM0_RAMDISK" "dom0_ramdisk" "$DOM0_LOAD"
         ramdisk_size=$filesize
     else
         ramdisk_addr="-"
@@ -1024,6 +1036,16 @@ xen_file_loading()
     i=0
     while test $i -lt $NUM_DOMUS
     do
+        if test -z "${DOMU_LOAD[$i]}"
+        then
+            if test "$LOAD_CMD"
+            then
+                DOMU_LOAD[$i]="$LOAD_CMD"
+            else
+                echo "Neither DOMU_LOAD[] nor LOAD_CMD is specified"
+                exit
+            fi
+        fi
         if test "${DOMU_ROOTFS[$i]}" || test "${DOMU_NOBOOT[$i]}"
         then
             if test -z "${DOMU_NOBOOT[$i]}"
@@ -1042,20 +1064,20 @@ xen_file_loading()
 
         check_compressed_file_type ${DOMU_KERNEL[$i]} "executable\|uImage"
         domU_kernel_addr[$i]=$memaddr
-        load_file ${DOMU_KERNEL[$i]} "domU${i}_kernel"
+        load_file ${DOMU_KERNEL[$i]} "domU${i}_kernel" "${DOMU_LOAD[$i]}"
         domU_kernel_size[$i]=$filesize
         if test "${DOMU_RAMDISK[$i]}"
         then
             check_compressed_file_type ${DOMU_RAMDISK[$i]} "cpio archive"
             domU_ramdisk_addr[$i]=$memaddr
-            load_file ${DOMU_RAMDISK[$i]} "domU${i}_ramdisk"
+            load_file ${DOMU_RAMDISK[$i]} "domU${i}_ramdisk" "${DOMU_LOAD[$i]}"
             domU_ramdisk_size[$i]=$filesize
         fi
         if test "${DOMU_PASSTHROUGH_DTB[$i]}"
         then
             check_compressed_file_type ${DOMU_PASSTHROUGH_DTB[$i]} "Device Tree Blob"
             domU_passthrough_dtb_addr[$i]=$memaddr
-            load_file ${DOMU_PASSTHROUGH_DTB[$i]} "domU${i}_fdt"
+            load_file ${DOMU_PASSTHROUGH_DTB[$i]} "domU${i}_fdt" "${DOMU_LOAD[$i]}"
             domU_passthrough_dtb_size[$i]=$filesize
         fi
         i=$(( $i + 1 ))
@@ -1070,9 +1092,20 @@ xen_file_loading()
         generate_uboot_images
     fi
 
+    if test -z "$XEN_LOAD"
+    then
+        if test "$LOAD_CMD"
+        then
+            XEN_LOAD="$LOAD_CMD"
+        else
+            echo "Neither XEN_LOAD nor LOAD_CMD is specified"
+            exit
+        fi
+    fi
+
     kernel_addr=$memaddr
     kernel_path=$XEN
-    load_file "$XEN" "host_kernel"
+    load_file "$XEN" "host_kernel" "$XEN_LOAD"
 
     xen_policy_addr="-"
     if test -n "$XEN_POLICY"
@@ -1518,12 +1551,6 @@ then
     FIT="${UBOOT_SOURCE%.source}.fit"
 fi
 
-if test ! "$LOAD_CMD"
-then
-    echo "LOAD_CMD not set, either specify it in the config or set it with the -t option"
-    exit 1
-fi
-
 if test ! "$BOOT_CMD"
 then
     BOOT_CMD="booti"
@@ -1543,6 +1570,11 @@ then
 elif test "$LINUX"
 then
     os="linux"
+    if test ! "$LOAD_CMD"
+    then
+        echo "LOAD_CMD not set, either specify it in the config or set it with the -t option"
+        exit 1
+    fi
     linux_config
 else
     echo "Neither a Xen or Linux kernel is specified, exiting"
@@ -1691,7 +1723,7 @@ fi
 
 check_file_type $DEVICE_TREE "Device Tree Blob"
 device_tree_addr=$memaddr
-load_file $DEVICE_TREE "host_fdt"
+load_file $DEVICE_TREE "host_fdt" "$XEN_LOAD"
 bitstream_load_and_config  # bitstream is loaded last but used first
 device_tree_editing $device_tree_addr
 
-- 
2.25.1


