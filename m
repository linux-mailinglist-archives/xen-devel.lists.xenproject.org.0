Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD6AB1C5EC
	for <lists+xen-devel@lfdr.de>; Wed,  6 Aug 2025 14:34:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1071741.1435136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujdLI-0007pn-Hf; Wed, 06 Aug 2025 12:34:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1071741.1435136; Wed, 06 Aug 2025 12:34:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujdLI-0007no-DN; Wed, 06 Aug 2025 12:34:04 +0000
Received: by outflank-mailman (input) for mailman id 1071741;
 Wed, 06 Aug 2025 12:34:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tgyg=2S=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1ujdLH-0007ni-9G
 for xen-devel@lists.xenproject.org; Wed, 06 Aug 2025 12:34:03 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062a.outbound.protection.outlook.com
 [2a01:111:f403:2418::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a0e93885-72c1-11f0-a322-13f23c93f187;
 Wed, 06 Aug 2025 14:34:01 +0200 (CEST)
Received: from BN0PR04CA0177.namprd04.prod.outlook.com (2603:10b6:408:eb::32)
 by CY8PR12MB9033.namprd12.prod.outlook.com (2603:10b6:930:71::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.13; Wed, 6 Aug
 2025 12:33:57 +0000
Received: from BN2PEPF000044A9.namprd04.prod.outlook.com
 (2603:10b6:408:eb:cafe::7c) by BN0PR04CA0177.outlook.office365.com
 (2603:10b6:408:eb::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.18 via Frontend Transport; Wed,
 6 Aug 2025 12:33:56 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN2PEPF000044A9.mail.protection.outlook.com (10.167.243.103) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Wed, 6 Aug 2025 12:33:55 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 6 Aug
 2025 07:33:55 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 6 Aug
 2025 07:33:55 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Wed, 6 Aug 2025 07:33:54 -0500
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
X-Inumbo-ID: a0e93885-72c1-11f0-a322-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=brjw9qbg2KTBPwWwB7p4D1Hd9tXWlAKOn9CkNd9SBvvhGMmpXLiXwo3yyMERssCQDpjS2L+Z4OD9OniqrJ1gEq8iMJ/hr8bRpqPWPoT5Caf9f4mweaCGWLXlSqLE7ty1PQqa2HBQTzEafCIsqPTGnlvisZXgAiNVGk6GpsYW7/W6Es5pfPXfaEoCo3xYQWtMphDWWekg81m5Np2zs7SKAsj8eAG3LLTVOgW4YzsXlKABIA+CqYBoTcaJHw8NzxUaIylNPvDvRr/0pfu94z4bLZn0UHk2SfWNuyaUVRItWy1MdfC5wlop/01+NP9OudIdRCz9acIqTPxPsMku6EhA5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+22nXgo23FGZcNmrLCzV5PnEyTCLAR7ptulfQrNfcqk=;
 b=Y+CrTe3/NdLxieHuMfZ7QdHwDcsh7oWMrlOAvuoD8MkOictS+ccEtHN01JaYiQiU+qk2iioTgN3h4lGnn45eS2KoazbnGdnucwaCLX36oi4vkG+eBrJ2siysE89CtIixs2RqzAb36noIe4sPFfK5BvkH04Pgwpgmd9NC7QiylGyvO7FX01uxqKkGe9ErqVPIGl3Cg1UvFb6FfAE9lE6OoQs9vGUfvCbkKvkOgrGFOoYaSwtp/vOleSmr+G32TxdoU1nDIpBLuC3XnQg6jad+jBLMojko2uTlUSbS2p7pEtorTxmNyng2kumVDdEuOZk7m/TFma3VbCYB74VAgxci8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+22nXgo23FGZcNmrLCzV5PnEyTCLAR7ptulfQrNfcqk=;
 b=yWhbWaUhUtX+02x9AErHmERvNommIYFmLyubVGa0Ledew/FmwOOAdEFxHEAr3H5u2hUhxY8/NRfzye71pI1mU7EwZXu5CfVHxxF9qhvd36+TnGyUIaFKd4sKb8RQ8q5eF9IAIB+5RA7PsFxwhX+K3lf4dhnw39ymaBhTvYZVCr4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <michal.orzel@amd.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>
Subject: [ImageBuilder] Add config option to use separate load commands for Xen, DOM0 and DOMU binaries
Date: Wed, 6 Aug 2025 13:33:52 +0100
Message-ID: <20250806123352.15852-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A9:EE_|CY8PR12MB9033:EE_
X-MS-Office365-Filtering-Correlation-Id: a6c7e721-5dc9-456e-faa7-08ddd4e58285
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?eLB51mH2+/pnFIT4Y0XtFsuYBz9laQYgHtCrw3lr5m+knwzUdLySfzJ2jvJg?=
 =?us-ascii?Q?EWAx6TQNaTSwE0y1nBophtOnfAIMhecfB+3svIyS/tLI8xIXCJ7W9PeTYBeU?=
 =?us-ascii?Q?mXRqhGT1arnYHfBqQGb3QU9RCAAeNhXahNAWSMLVmqbLVd4eQbsExUsa6QYh?=
 =?us-ascii?Q?f+XCbaItDNS9FPey+116KLeb9mOwqLJlQlIgKipuo5C/kKNNy6GTEOU/U4ed?=
 =?us-ascii?Q?n3BAN50t05PayYeZUkOMgz2KRSt5VKefd/DEIBYUG1ixhc4dES0vA/cJop+a?=
 =?us-ascii?Q?vXosh54PJXRPdDBP+JcJCqWzVE/TnJIKzVSYJkYsD51aDmuHA/fITToEsG3r?=
 =?us-ascii?Q?Sb6yhM2vpcdnraNCukAT7COpcE6mS+eGjzuG4lXq0mRlDEMqd2CNBd68u4wX?=
 =?us-ascii?Q?GbZMzKiMN42R9HRFYct2T1WtF15ULKcULJegy29oueputYS2zzAEG5p5j59h?=
 =?us-ascii?Q?NXxuf8lZNPdCRVISPq2MYkIQqpNeGenZWuOkhh/tGT3JLNeJrv9fpvNSgU8S?=
 =?us-ascii?Q?hr7qlPAGbudxXu+ZTgtVjTrsReb82YgkySS4GpdVc1Owb2cV5ogD3u/WqeEq?=
 =?us-ascii?Q?bpNmwX+FpCl0DIOHEgULr1IctPglaAekLOSrtU2mGfBrZYh5LuQBapdSyt9u?=
 =?us-ascii?Q?/FMfDkVrwTBeuPDN9y1Eu+y4PnAF18Uwi61c7qA8S0eExo8CdlX5oGAKc9jn?=
 =?us-ascii?Q?3MJSO8E9GL2FwaFizuBbEYl11U1/TGCpyJd9jrrO+U2/9ZtDN25tgWI2WxyM?=
 =?us-ascii?Q?dPBMjLbgXsejggnumOvPz8okVj3vkm11r+LiUE1kI/hpEhRhLG0rswy4AbyV?=
 =?us-ascii?Q?qrzHSIMgjna3VIra2uJ7yFeQSZe22sIuC/ampH0EfZYLJ0RyFOLf1by2mOjh?=
 =?us-ascii?Q?vF6PQjiDEa0kk4zz8cb/kkwqB/Hfy+U9p45MmuATZYS7hdSlxpcW0pAKpUM0?=
 =?us-ascii?Q?QcgGqaJHR/Vh51LVbhi222vf7WDw8J5FByksVu69lxcm0RYUnbCFO1swPpWA?=
 =?us-ascii?Q?2oPapLo9FnPUO0fbdt0OTO04RCCpa7yJSuCiSWZjYfGxZlKmjvM459llGEWD?=
 =?us-ascii?Q?Kw8DV5dOAkBeFuz+VRn0MKtJ0zNmMoK41nomLxfc2DJcw5wwAmW2xOBXSa8v?=
 =?us-ascii?Q?9/sRZETuCzcWAZTdgihweefh/8CLZrh78ei7Cdw+M+Q96e8h5tAoJkzAGwrA?=
 =?us-ascii?Q?Ns4n1KItfAoiM8zIbOqul3qwMJUp2rgwwgOleswW8XPDZfLgIJHKBcpfUd6v?=
 =?us-ascii?Q?TAddLYNaLird03D9IbeoBUES1q4v/CytNsdbmr+ETPAdhCk2CxAV5aOLn7Av?=
 =?us-ascii?Q?Uzv9fCfJyriPkkUsqVDM+MHRafYOhoM+sYa5Jz6z3aInDh7wmIGWWh8ddz1E?=
 =?us-ascii?Q?Bn6zS9hRvg0ZTQBb0WGY1nVZMVjREf02qmO/TNsVpMuvs0NWsOD1iOwCRlua?=
 =?us-ascii?Q?WdSHFbAYha/Khv9TbkSlvA48FbvW0eLO7o2LoXfi5/tddHTurmnSDj/VK+Il?=
 =?us-ascii?Q?s6Dat+JrJDCVNlOe//7ocphHXm30xctBoGqe?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 12:33:55.8463
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a6c7e721-5dc9-456e-faa7-08ddd4e58285
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB9033

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
 README.md                | 14 ++++++++++++++
 scripts/uboot-script-gen | 32 +++++++++++++++++++++++---------
 2 files changed, 37 insertions(+), 9 deletions(-)

diff --git a/README.md b/README.md
index b7be268..4be6efb 100644
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
@@ -99,6 +103,9 @@ Where:
 - XEN_CMD specifies the command line arguments used for Xen.  If not
   set, the default one will be used.
 
+- XEN_LOAD specifies the command to load XEN and DEVICE_TREE. If not set,
+  LOAD_CMD will be used.
+
 - XEN_STATIC_HEAP="baseaddr1 size1 ... baseaddrN sizeN"
   if specified, indicates the host physical address regions
   [baseaddr, baseaddr + size) to be reserved as Xen static heap.
@@ -109,6 +116,9 @@ Where:
   uboot-script-gen will compile the partial device trees which have
   been specified in DOMU_PASSTHROUGH_PATHS[number].
 
+- DOM0_LOAD specifies the command to load DOM0_KERNEL and DOM0_RAMDISK. If not
+  set, LOAD_CMD will be used.
+
 - DOM0_KERNEL specifies the Dom0 kernel file to load.
   For dom0less configurations, the parameter is optional.
 
@@ -159,6 +169,10 @@ Where:
   kernel. If not set and DOMU_VPL011[number] is not set to 0, then
   "console=ttyAMA0" is used.
 
+- DOMU_LOAD[number] specifies the command to load DOMU_KERNEL[number],
+  DOMU_RAMDISK[number] and DOMU_PASSTHROUGH_DTB[number]. If not set, then
+  LOAD_CMD is used.
+
 - DOMU_RAMDISK[number] specifies the DomU ramdisk to use.
 
 - DOMU_PASSTHROUGH_PATHS[number] specifies the passthrough devices (
diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
index b81e614..fed53aa 100755
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
@@ -1003,11 +1004,15 @@ generate_uboot_images()
 
 xen_file_loading()
 {
+    if test -z "$DOM0_LOAD"
+    then
+        DOM0_LOAD="$LOAD_CMD"
+    fi
     if test "$DOM0_KERNEL"
     then
         check_compressed_file_type $DOM0_KERNEL "executable\|uImage"
         dom0_kernel_addr=$memaddr
-        load_file $DOM0_KERNEL "dom0_linux"
+        load_file $DOM0_KERNEL "dom0_linux" "$DOM0_LOAD"
         dom0_kernel_size=$filesize
     fi
     if test "$DOM0_RAMDISK"
@@ -1015,7 +1020,7 @@ xen_file_loading()
         check_compressed_file_type $DOM0_RAMDISK "cpio archive"
         ramdisk_addr=$memaddr
         ramdisk_path=$DOM0_RAMDISK
-        load_file "$DOM0_RAMDISK" "dom0_ramdisk"
+        load_file "$DOM0_RAMDISK" "dom0_ramdisk" "$DOM0_LOAD"
         ramdisk_size=$filesize
     else
         ramdisk_addr="-"
@@ -1024,6 +1029,10 @@ xen_file_loading()
     i=0
     while test $i -lt $NUM_DOMUS
     do
+        if test -z "${DOMU_LOAD[$i]}"
+        then
+            DOMU_LOAD[$i]="$LOAD_CMD"
+        fi
         if test "${DOMU_ROOTFS[$i]}" || test "${DOMU_NOBOOT[$i]}"
         then
             if test -z "${DOMU_NOBOOT[$i]}"
@@ -1042,20 +1051,20 @@ xen_file_loading()
 
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
@@ -1070,9 +1079,14 @@ xen_file_loading()
         generate_uboot_images
     fi
 
+    if test -z "${XEN_LOAD}"
+    then
+        XEN_LOAD="$LOAD_CMD"
+    fi
+
     kernel_addr=$memaddr
     kernel_path=$XEN
-    load_file "$XEN" "host_kernel"
+    load_file "$XEN" "host_kernel" "$XEN_LOAD"
 
     xen_policy_addr="-"
     if test -n "$XEN_POLICY"
@@ -1691,7 +1705,7 @@ fi
 
 check_file_type $DEVICE_TREE "Device Tree Blob"
 device_tree_addr=$memaddr
-load_file $DEVICE_TREE "host_fdt"
+load_file $DEVICE_TREE "host_fdt" "$XEN_LOAD"
 bitstream_load_and_config  # bitstream is loaded last but used first
 device_tree_editing $device_tree_addr
 
-- 
2.25.1


