Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A46EDB22F2D
	for <lists+xen-devel@lfdr.de>; Tue, 12 Aug 2025 19:34:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1078979.1439972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulst2-0007HD-C0; Tue, 12 Aug 2025 17:34:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1078979.1439972; Tue, 12 Aug 2025 17:34:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ulst2-0007ES-96; Tue, 12 Aug 2025 17:34:12 +0000
Received: by outflank-mailman (input) for mailman id 1078979;
 Tue, 12 Aug 2025 17:34:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2eVr=2Y=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1ulst1-0007E3-Cr
 for xen-devel@lists.xenproject.org; Tue, 12 Aug 2025 17:34:11 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20611.outbound.protection.outlook.com
 [2a01:111:f403:2416::611])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8a515657-77a2-11f0-b898-0df219b8e170;
 Tue, 12 Aug 2025 19:34:05 +0200 (CEST)
Received: from MN0PR02CA0008.namprd02.prod.outlook.com (2603:10b6:208:530::10)
 by IA1PR12MB8080.namprd12.prod.outlook.com (2603:10b6:208:3fd::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.22; Tue, 12 Aug
 2025 17:34:01 +0000
Received: from BL6PEPF00022574.namprd02.prod.outlook.com
 (2603:10b6:208:530:cafe::4a) by MN0PR02CA0008.outlook.office365.com
 (2603:10b6:208:530::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9031.15 via Frontend Transport; Tue,
 12 Aug 2025 17:34:01 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL6PEPF00022574.mail.protection.outlook.com (10.167.249.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9031.11 via Frontend Transport; Tue, 12 Aug 2025 17:34:00 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 12 Aug
 2025 12:34:00 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 12 Aug
 2025 12:33:59 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Tue, 12 Aug 2025 12:33:59 -0500
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
X-Inumbo-ID: 8a515657-77a2-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f6FSYr2v1A43zoC/GVccpTLejm0phoSB2/oxCPiVyLCgt02ZEpgeynYAt0B/UlbXUd7jKDTsq92ALAJOMZ/sIlBTyUP98LV4Zv1fWxSXTCYyTIb52aiIYrbZdE3cmfBaEB50tUwzqwmFiEiFZiyqRcveBbZLnaLRdpVkyrDSAQYLi4Syzx3hZUdz7vpSXLspL+9Y3tLV5wswKSOgZpaO+Hg11s5HpnXrmt/Lyita41LEO32e3GPNDW+3UtMChaparSswpRMX8sHO0eUzpPbZmLa7y7amWwFEUZcjfGD6iJ/27GAqRobHcMRTw1kxRPN4OuLGP4iT/vGuICcHnLU17g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JHkduoHjGrrLbmr5Rlfx5Axcfh82wYY/BjtQ5rAPZAM=;
 b=MUiEtkRT0Aan6SRDcxerPrjjHMimC7lkgCLLLhgyG8v4BD5iZyUiN3Db/KOtBaHBjl67kGHVYor4TqWDFpN+RNXLq4qcjBMhPo4FF4R5o/DoFMKYpewrFn2wf5t3Yzqy9ZbZ1PFph6Tns8yqFXk9CXPu9tO9bwsikAxc+BTmK9jMrE3OajYubnH6K4JeLzMQ2Sq6G9zoemh1pZXlOEz9YzCz90SpzZdwb/lTtQ0GqZfAWer/xd1sA68WXOLEBjK20zmnY6S58S2lZu+//TWTovPeWyazAuU+DABrFDEy3oUbExVuV99dqgBqQAzWmJb1/PYccuFWSWgpUTcv/MV0vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JHkduoHjGrrLbmr5Rlfx5Axcfh82wYY/BjtQ5rAPZAM=;
 b=eWdLYU3xq4NTm6toNonGOE/5vVBW+QOn0x2Z+p7SbTf9IhPmpFitNcKVAwnDhcHHwUdyNJC7KVpfdomdqbNpCuBi0eERYp9U5+Uu/77tfxr55DQy4sGhNL2sU3omGeXPym9GVbuUKHw9ptqFeP7YtIlxbGV3ig55afh90hizrE4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <sstabellini@kernel.org>, <michal.orzel@amd.com>,
	<andrei.cherechesu@nxp.com>, <dmukhin@ford.com>, Ayan Kumar Halder
	<ayan.kumar.halder@amd.com>
Subject: [ImageBuilder v2] Make DEVICE_TREE optional parameter
Date: Tue, 12 Aug 2025 18:33:50 +0100
Message-ID: <20250812173350.2612682-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00022574:EE_|IA1PR12MB8080:EE_
X-MS-Office365-Filtering-Correlation-Id: 87972465-b0ab-4813-3b9e-08ddd9c66c87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WEJsRXgzQ2hPNE9RRFhPb29TMWRnKzVKVXAwZWVTSjRwWitjdmx0VjVxM3cv?=
 =?utf-8?B?dHk3alpGano3d1M5YzBkaGtEQ0llbWNJM2lEc1E4TnMrQ2xhWnl0TmlLZE4y?=
 =?utf-8?B?Yi9sMjgrOVh2aW1oNnFsdDFsa3BobUxCY0NwNnZnUVhsQzI5SDYxNGpCVHFX?=
 =?utf-8?B?eWJvVmdhVmkrTjdna3I1SG1BQ21hRTZ2WXNoMExWdFVkRS9obVJHK2ViMk5O?=
 =?utf-8?B?REhyL0VPRzdhdVJpSjJWWjF5a0oyRlJsY1A5MmdQSWk4b1pLWWhYK253bHVn?=
 =?utf-8?B?RURYdDBrVUZKc2lpRFpMK3pHSzdKaU1ZZjNHOEdxVmU1RTluMmlIbGFuVmsw?=
 =?utf-8?B?YmZndWNKRzhqbWFYWkNPVXBrNDh3VmJaSER1S3ZDTjVqREZ4dTgrU3JjM2FW?=
 =?utf-8?B?TFZHc3JCVlQvZGxUK3ZtSEU1clpBR2p5dGhLMDRRUVlIQlBvZkowbU8rSnNB?=
 =?utf-8?B?bzl6TmdRa3cwZU1ZRmZlQVNPZ245T0VjTTRvUkFMSStmR2FmTTg5ZzQ3NUg1?=
 =?utf-8?B?dzRqajBRWnl1UWZ5d29PVkdPU0llaXZyVzU4RWZ4MXNUS3RvclZWUkhDODVR?=
 =?utf-8?B?Y2EwZ1JpWTFXN0IzWlNsOWVMZEN0dTRmOFFKZ0o5UEhGMm1Xb2cvdStuQTJJ?=
 =?utf-8?B?eVhEN293Z09Ud2Vaa1dhK2Y3UUtQNDA0bGE2NUo3NVdVcGFLd0RUblFNRE04?=
 =?utf-8?B?bmdOMGpraXhNZ3RvZXFpNkVpbmg2Sy9xT1IwZ29PZUpOaW9rN0tCWFRCcFp0?=
 =?utf-8?B?bGtjZGFmTm5wempMM3FIaG9DT3cwM2VxM3RkZ0NCNmk3SllMMG11dXpaRHI1?=
 =?utf-8?B?R205MHZtWThlSE5XeFd1WlZSWlR3T3ZJY0tiK3lmd2VkdzdWMnErbDZyL3Z0?=
 =?utf-8?B?MXdCVlRIQ0Z2S3RvM3RiM3RjMUtQc1Q5YXJrNlUrMk5yWGk3K2d3VzR1WjJL?=
 =?utf-8?B?U045L1lJQUg3U2l1QTAvY1Fva2pSOHBDQ3RBMjBIZ1VLdXp3am0yekxlaXpL?=
 =?utf-8?B?bmZWdXovRXlUdjNuS3dVdlpORi9lSjQvM3F2bm1Dc1pOcDVNQVZRWmlhWjUv?=
 =?utf-8?B?ayt2WlhPejR0eUdSdHVyRmlPUXVTYjFOVkpBSGdCZElTMk5aaCtkUi9qR2p4?=
 =?utf-8?B?RFlZK002bmVqMnQ3NTFFOFlIcHord0tOY2JZNThkdXEzYnFmQyszYThtM2Nl?=
 =?utf-8?B?b0I0SEhpSXVocloyc3JGRHFtWEpXYVlXZjl5ZmFFSHBZdjg5QlNoM2ZiTmlZ?=
 =?utf-8?B?WEttZDRKRnFxVmhXTVVsUkdmYXJWalVuMWd6cTMyOVg3MjhBcWtCZnhVK3lG?=
 =?utf-8?B?WEF1Q0EzWWZsLzA4aTRJS1NKemV3WVZQQ1VOT1NpT1RNcGlOdkV3bkx4ZURs?=
 =?utf-8?B?VmsyZVR0TWVUZVdpZjZHdE9yeU1hZjdQaE1zcDRLRm81V1lkc0M3cURweXIw?=
 =?utf-8?B?cE9ST1NOUXpoTDAydzM5YW9GYXNoUEZ6dmVRcC9TK0lZalB6Mlg3OUd1a0R5?=
 =?utf-8?B?RWloS0VwZ2trbm90UFRGcnVON0FLVm1Bd2lzZXNQZmlMMWdyY1FXYjZNeVNN?=
 =?utf-8?B?aFVkbzFnREVCOVRkNjlZbjZHdzhRNVV3cEQ5TUlMaVVlTHVlbFR4K2c5OVJ6?=
 =?utf-8?B?amY3Ty9TbldQK0xIYnpvRGhRRGg0bGZNMk4vaHVKM25PNTE5ZE9JR0ZXZnFO?=
 =?utf-8?B?bmU3QWZqby9uOHl0dnpFYUd5S3k2VHV1VThlU0JZWkpIdTd0RUM0Zzg4Tk1r?=
 =?utf-8?B?WG5lV3Nrb2VLS2VFQ3FLeEgrTnRrdmM0N3dlM3pDL0gyNzV2NmNFV2N0VWlY?=
 =?utf-8?B?OHJJeVBUUFlrWmNMRHBMUXNyR2NCRFFvaUNiM2Rsc3BUcGIzR2E4ZGdIODdq?=
 =?utf-8?B?R2RHQmhLeVdrOUpsRVI1ZlcrcnNrcmFQVUFDN0NkMFZzSmUzZW9nZVZPM05L?=
 =?utf-8?B?ZEtGK0pyYTRhMFZOcW1VeXhTWTBoWDU5VHRGK0o3VHFJczhYUHppRkRGTC9y?=
 =?utf-8?B?V25RVENiZzhQM1BLNjRnWFJUVEFMS0pNTWZMWXJXZVh2ZDhrbjlWcWxERFVU?=
 =?utf-8?Q?oa58V2?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 17:34:00.3594
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 87972465-b0ab-4813-3b9e-08ddd9c66c87
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00022574.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8080

There are systems where device tree binary is passed by the U-Boot as
$fdtcontroladdr. In such cases, no external device tree binary is provided
during uboot script generation.

This is an enhancement on top of the following commit:-
uboot-script-gen: Dynamically compute addr and size when loading bina…

When DEVICE_TREE is not present, user should provide '-s' as the addresses and
sizes should be computed dynamically from U-Boot.

Also, fixed uboot-script-gen to set host_kernel_addr when BOOT_CMD="none" and
'-s' is not used.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
This patch should be applied after the previous patch.
"[ImageBuilder v2] Add config option to use separate load commands for..."

Changes from :-

v1 :- 1. Check that user provides '-s' when DEVICE_TREE is not set, instead of
setting CALC silently.

2. Set 'host_fdt_addr' to '\${fdtcontroladdr}' when DEVICE_TREE is not set.

3. Add a fix for BOOT_CMD="none".
 
 README.md                |  5 ++++-
 scripts/uboot-script-gen | 29 +++++++++++++++++++++++------
 2 files changed, 27 insertions(+), 7 deletions(-)

diff --git a/README.md b/README.md
index 59919df..fc448e0 100644
--- a/README.md
+++ b/README.md
@@ -92,7 +92,10 @@ Where:
   DTB are stored in 'host_kernel_addr' and 'host_fdt_addr' u-boot
   env variables respectively, to be used manually when booting.
 
-- DEVICE_TREE specifies the DTB file to load.
+- DEVICE_TREE specifies the DTB file to load. If not set, then $fdtcontroladdr
+  is used as the address of the DTB loaded by u-boot. If user does not set this
+  option, then '-s' should be provided to ensure that addresses and sizes are
+  calculated dynamically by uboot.
 
 - XEN specifies the Xen hypervisor binary to load. Note that it has to
   be a regular Xen binary, not a u-boot binary.
diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
index 656de72..be61fc4 100755
--- a/scripts/uboot-script-gen
+++ b/scripts/uboot-script-gen
@@ -591,7 +591,7 @@ function device_tree_editing()
 
 function fill_reserved_spaces_from_dtb()
 {
-    if [ ! -f $DEVICE_TREE ]
+    if test ! -f $DEVICE_TREE || test -z "$DEVICE_TREE"
     then
         if test "$CALC"; then
             return
@@ -1674,6 +1674,16 @@ fi
 
 rm -f $UBOOT_SOURCE $UBOOT_SCRIPT
 
+if test -z "$DEVICE_TREE"
+then
+    if test -z "$CALC"
+    then
+       echo "DEVICE_TREE is unset and -s is not specified"
+       exit 1
+    fi
+    echo "setenv host_fdt_addr \${fdtcontroladdr}" >> $UBOOT_SOURCE
+fi
+
 if test "$FIT"
 then
     echo 'fit_addr=$fileaddr' >>  $UBOOT_SOURCE
@@ -1721,9 +1731,13 @@ then
     done
 fi
 
-check_file_type $DEVICE_TREE "Device Tree Blob"
-device_tree_addr=$memaddr
-load_file $DEVICE_TREE "host_fdt" "$XEN_LOAD"
+if test "$DEVICE_TREE"
+then
+    check_file_type $DEVICE_TREE "Device Tree Blob"
+    device_tree_addr=$memaddr
+    load_file $DEVICE_TREE "host_fdt" "$XEN_LOAD"
+fi
+
 bitstream_load_and_config  # bitstream is loaded last but used first
 device_tree_editing $device_tree_addr
 
@@ -1751,8 +1765,11 @@ then
     fi
 else
     # skip boot command but store load addresses to be used later
-    echo "setenv host_kernel_addr $kernel_addr" >> $UBOOT_SOURCE
-    echo "setenv host_fdt_addr $device_tree_addr" >> $UBOOT_SOURCE
+    if test -z "$CALC"
+    then
+        echo "setenv host_kernel_addr $kernel_addr" >> $UBOOT_SOURCE
+        echo "setenv host_fdt_addr $device_tree_addr" >> $UBOOT_SOURCE
+    fi
 fi
 
 if test "$FIT"
-- 
2.25.1


