Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E21B1DAFA
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 17:46:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1073242.1436146 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk2p5-0006Op-5P; Thu, 07 Aug 2025 15:46:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1073242.1436146; Thu, 07 Aug 2025 15:46:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uk2p5-0006MF-2G; Thu, 07 Aug 2025 15:46:31 +0000
Received: by outflank-mailman (input) for mailman id 1073242;
 Thu, 07 Aug 2025 15:46:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=V1Uc=2T=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1uk2p3-0006M8-QV
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 15:46:30 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2062c.outbound.protection.outlook.com
 [2a01:111:f403:2415::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ab6344d6-73a5-11f0-b898-0df219b8e170;
 Thu, 07 Aug 2025 17:46:24 +0200 (CEST)
Received: from CH2PR11CA0010.namprd11.prod.outlook.com (2603:10b6:610:54::20)
 by CH3PR12MB9219.namprd12.prod.outlook.com (2603:10b6:610:197::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.17; Thu, 7 Aug
 2025 15:46:18 +0000
Received: from CH1PEPF0000A349.namprd04.prod.outlook.com
 (2603:10b6:610:54:cafe::25) by CH2PR11CA0010.outlook.office365.com
 (2603:10b6:610:54::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9009.15 via Frontend Transport; Thu,
 7 Aug 2025 15:46:18 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH1PEPF0000A349.mail.protection.outlook.com (10.167.244.9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Thu, 7 Aug 2025 15:46:18 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 7 Aug
 2025 10:46:17 -0500
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Thu, 7 Aug 2025 10:46:17 -0500
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
X-Inumbo-ID: ab6344d6-73a5-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XnywDfJ0dsy+T66+K6LZC02TYMRbbQD5KlusqjC4ts45can3t3O98u3FtUJpTzhxhFoNmen2xYc+0Dvu10QiPzIW7/uaJTWwn8UWvWNKzK6ZfAg3/DhFKVQHSr7hZ5DRJfvzkLkQzBg4jQFKRbTU8CN9Lt/FDtVwuwzoRyNDGXFc9DjY1CXxA2dYOIssPFTCvZmC+6WXxA9yKDO6R6bQ9j0+94g955On3bbO5qwUH26Ndh+L4LsavsBYNlepaLrO2nG9ntvGA5u0P07bm0WC5OtMaWhavR09h6fBeHgGyWrrA4Ou1geUBS9F3M42/k0xY/YIeNjzSbd/M2V6197xIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5uxN93jMk7+Z4rEDJjTVZeidtGtjL4eNpluKhEjyj30=;
 b=ApjKnzVQmUjvPKIjDIPVocfM/IT/ZONBY9DhwYPSlbo6N2DzkIX5KIWuI88LQwbflSK0HU7jGFLW0lUmlHjAEax9g0fewBQS6+lPMDi6bZW9I7UJtSxLbIbsiV1TAtE54EsI/lYJ6IQeeaFtKg7d/8PGKy1Yyw07hUCVKbsW4YakQoJkjEhW2iRX4dOAwtztJrXpzE7Au3st+e8cF3eo0SZyAJWa7JwBEr3uvQDM+AtL5yB2GxErSAuIsqs8NkgR48j2WYk6K8c9ctdb++Kvglcm0Rat2/JM+T+uOdanTI90r40XApRYWdpywbg1xiDTfrakuCID1VHyhASta8fpdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5uxN93jMk7+Z4rEDJjTVZeidtGtjL4eNpluKhEjyj30=;
 b=gaGwpZ9kW1bTlA4+76bSEu/2eOyJLXPpLnNbgixmg2riKisz5iE792PDSrl8lxaUlnsR8LFUy9aaM+LaTg2e7+hJrUn8TdIbQtTyl66FbLkp4K2GNhuaTDa6CF1pAzF73C2dVcACNzksaENu/D9Cv0mTKyhXXEkCLYxEZLs/5F0=
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
Subject: [ImageBuilder] Make DEVICE_TREE optional parameter
Date: Thu, 7 Aug 2025 16:46:14 +0100
Message-ID: <20250807154614.456654-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A349:EE_|CH3PR12MB9219:EE_
X-MS-Office365-Filtering-Correlation-Id: 60111baa-fa5b-4b77-d7e0-08ddd5c98cca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SFA1QUhaYmdyMTlibVZiYXJJZ05qY0J4TUo3QzBmdjdURWl3VlRTZUxvS0Qr?=
 =?utf-8?B?RDl4T3hTYzB2Ym9mVmJjWWl5Tk1KaDVPMEtYZkd0cEs4bU81OVRoZFlZNWU3?=
 =?utf-8?B?MFNMYzRuVktRWUc1Tmsvc3FUdkZJMC9hUktEWXVOQU1oTjFPdjFoZWR3bWI1?=
 =?utf-8?B?K05vaUQxVitoM1UrbjFvTy9wcW9zVW8xSW5IOVhKdEhTQXRGTFdsNG11bnRN?=
 =?utf-8?B?UzNEb1NnM2EyZGd4aDdTdldaSVNReVBNdkxpdXNKeU5xR2VPdUNkSk00Mjh5?=
 =?utf-8?B?bWxTaGUzdDl2MjUwSnhDcFRjb1BvellyWHJDRjljZms5Skc3Ym1OMnpKcVB6?=
 =?utf-8?B?RnF6amlLNUgzYkpLcmh4akMvUjkxSXoyay80WUJKUkVBR255MmkvandLUDFE?=
 =?utf-8?B?SFYwUGtReXVKREpoRnZ3eVE4QjdaVDFnRlVrMUN5V2JTbWFiOFZVcWFGSEsy?=
 =?utf-8?B?L3RPRVM1Z3VkeDk5TjhzM082U3RjUUxSaWRqS1NGTU5QNHV2dHgvbU1UZVE0?=
 =?utf-8?B?UEJ6QjdMNFdrbHlIZzFJUlhFMzBWcVREeVhjWlJ4MkpKRnR3QU8ybXVrU21R?=
 =?utf-8?B?QmtLMlpKN1YrS0hoTEFwd0JhZ3JlTjYxcHZGK010RFNNMXI4NXVsY2RaRHpx?=
 =?utf-8?B?VU4weURzU3dMZ0ZvV3RhbGV6TUhLbkdBTnoxYzQ1STBqS2pQcnlEcHFVM0V6?=
 =?utf-8?B?OUlqTHN5am10bElaL3pIN2YvQUplS1hjdkhXcVM0MS9MaFgyZjdsZHl3S0Jh?=
 =?utf-8?B?MC9OQWJ3MnprNjcrM2w0enVEQW1vZjlNdjNGaUhJdXVBY0kzcXJ1REhTbHJV?=
 =?utf-8?B?ZGtvQzl2QldPeW10Z3EyLzU3R0psUlNFVU16NldNUG9XSmlSdTVacGJlZTlX?=
 =?utf-8?B?RXFYRXFsdWJJdHJxaDlRQzgzdXh5TW9SZmJvOUV6cTlwLytMaytLaUdPMkF4?=
 =?utf-8?B?WkJjZ2k1RXBzNko5VzJJdjZXVVVFUVFYb3VQNEIrSUxteWJ1RUNBSzJ0Tnlx?=
 =?utf-8?B?TFl6cUJBWUlYQml4bzVlSDUyVmdTR2Y4OW04N1ZTSnpKY0NubFRHdXJWYXJW?=
 =?utf-8?B?dFpRbWNPbVdLd2JraXJrWk5WSGl1bjhOdWJFbENaUGd6ZzNHRndMK2RzV2Zo?=
 =?utf-8?B?YWRsajZ0cGFVaFdwdHpkY0k0cWRMelVQK2M2dGRJK1MrUUFaOE1mU3N2ckpX?=
 =?utf-8?B?RE5QV0hwZVZtcUU3SWNSblVja0dQQlRsM3dreGg4blI1VXNMWThQMGc3R3Q1?=
 =?utf-8?B?aUpPWTQ1aW12REpXVnZhQjFMVXViZjZKVmRocGpFQUJObW1ZbDYyTmRpbHp0?=
 =?utf-8?B?dzRUWXQ5QzR1Mm9yZC8rM1pCVDV1eHJoeTd3UVZkam4zS3NlSmJEWjF1Myto?=
 =?utf-8?B?dmhDWXEra2dKMHVOSFJERXp4b2w1WlIxTVN6ZVROY0laNTFxSEZqOHZyN2N0?=
 =?utf-8?B?QldnU3ZUM0xIODkrQW1jUWprRk9XODJrTnB4blRLenpVN3A0WVg3NDE1OVor?=
 =?utf-8?B?UENKMmJuc0FWWTlOV0ZsV2hDZ093N00xb2NPaWhQeDN3NllFdUp3bmVnRlJC?=
 =?utf-8?B?eGJCdjdlL2l4dGJMT3psc1orVUR3S0I2b1ZPanZtV3J0cWxDdUJheXJGMUhl?=
 =?utf-8?B?TG0zbVJMREFvdU01cFQ0K2wzQ3lQNXVadEV3aENWdHRtT3dJdWtQQVVyVG5E?=
 =?utf-8?B?U200RnplaC9qNzJFQnZnZ01IbmkxYUY1S3RFVGFhWEx6UlpQcXJ6aG1OOGZM?=
 =?utf-8?B?dnlkbUMxaWZPZzF1ZVMrcXJBNUZ5YWJuMVRlK3NoRkY5c3FjUHNackdHOGVv?=
 =?utf-8?B?SmNMTmIwcUZLb0xZa21CYS9NcEZJNlpXN2xzSGhOSlNrQUd4TGl2Vm1vRElx?=
 =?utf-8?B?Q1BQVVNSbTlLa1ZCTzJ6VFUwN3kyT1pRTWFZc01KN1hyZmkwTlpmai9Cb3BR?=
 =?utf-8?B?ZU85cUJKdW5ROTNJdTFhNHd2MW1hNG9WTjFkMFZDODFrZXRnbmI0K1hBUmNN?=
 =?utf-8?B?NERoYjh3c0x2RTlaY2NpMm1vQmxFYjZZdGhwbUR5QVBDOVNpSkUxbzh1Q3FI?=
 =?utf-8?Q?WQaNS5?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2025 15:46:18.3185
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 60111baa-fa5b-4b77-d7e0-08ddd5c98cca
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH1PEPF0000A349.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9219

There are systems where device tree binary is passed by the U-Boot as
$fdtcontroladdr. In such cases, no external device tree binary is provided
during uboot script generation.

This is an enhancement on top of the following commit:-
uboot-script-gen: Dynamically compute addr and size when loading bina…

When DEVICE_TREE is not present, $CALC is set as the addresses and sizes should
be computed dynamically from U-Boot.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
 README.md                |  3 ++-
 scripts/uboot-script-gen | 26 +++++++++++++++++++-------
 2 files changed, 21 insertions(+), 8 deletions(-)

diff --git a/README.md b/README.md
index 4be6efb..d80bdc9 100644
--- a/README.md
+++ b/README.md
@@ -90,7 +90,8 @@ Where:
   DTB are stored in 'host_kernel_addr' and 'host_fdt_addr' u-boot
   env variables respectively, to be used manually when booting.
 
-- DEVICE_TREE specifies the DTB file to load.
+- DEVICE_TREE specifies the DTB file to load. If not set, then $fdtcontroladdr
+  is used as the address of the DTB loaded by u-boot.
 
 - XEN specifies the Xen hypervisor binary to load. Note that it has to
   be a regular Xen binary, not a u-boot binary.
diff --git a/scripts/uboot-script-gen b/scripts/uboot-script-gen
index fed53aa..9fe4a55 100755
--- a/scripts/uboot-script-gen
+++ b/scripts/uboot-script-gen
@@ -560,7 +560,7 @@ function device_tree_editing()
     if test $UBOOT_SOURCE
     then
         if test "$CALC"; then
-            echo "fdt addr \${host_fdt_addr}" >> $UBOOT_SOURCE
+            echo "fdt addr \${fdtcontroladdr}" >> $UBOOT_SOURCE
         else
             echo "fdt addr $device_tree_addr" >> $UBOOT_SOURCE
         fi
@@ -591,7 +591,7 @@ function device_tree_editing()
 
 function fill_reserved_spaces_from_dtb()
 {
-    if [ ! -f $DEVICE_TREE ]
+    if test ! -f $DEVICE_TREE || test -z ${DEVICE_TREE+x}
     then
         if test "$CALC"; then
             return
@@ -1502,6 +1502,11 @@ check_depends
 declare -A DOMU_VCPU_HARD_AFFINITY
 source "$cfg_file"
 
+if test -z ${DEVICE_TREE+x}
+then
+    CALC=y
+fi
+
 SCRIPT_PATH=$(dirname "$0")
 source "$SCRIPT_PATH/common"
 source "$SCRIPT_PATH/xen_dt_domu"
@@ -1703,9 +1708,13 @@ then
     done
 fi
 
-check_file_type $DEVICE_TREE "Device Tree Blob"
-device_tree_addr=$memaddr
-load_file $DEVICE_TREE "host_fdt" "$XEN_LOAD"
+if test ${DEVICE_TREE+x}
+then
+    check_file_type $DEVICE_TREE "Device Tree Blob"
+    device_tree_addr=$memaddr
+    load_file $DEVICE_TREE "host_fdt" "$XEN_LOAD"
+fi
+
 bitstream_load_and_config  # bitstream is loaded last but used first
 device_tree_editing $device_tree_addr
 
@@ -1727,14 +1736,17 @@ fi
 if [ "$BOOT_CMD" != "none" ]
 then
     if test "$CALC"; then
-        echo "$BOOT_CMD \${host_kernel_addr} $([ "$BOOT_CMD" = "bootefi" ] || echo '-') \${host_fdt_addr}" >> $UBOOT_SOURCE
+        echo "$BOOT_CMD \${host_kernel_addr} $([ "$BOOT_CMD" = "bootefi" ] || echo '-') \${fdtcontroladdr}" >> $UBOOT_SOURCE
     else
         echo "$BOOT_CMD $kernel_addr $([ "$BOOT_CMD" = "bootefi" ] || echo '-') $device_tree_addr" >> $UBOOT_SOURCE
     fi
 else
     # skip boot command but store load addresses to be used later
     echo "setenv host_kernel_addr $kernel_addr" >> $UBOOT_SOURCE
-    echo "setenv host_fdt_addr $device_tree_addr" >> $UBOOT_SOURCE
+    if test ${DEVICE_TREE+x}
+    then
+        echo "setenv host_fdt_addr $device_tree_addr" >> $UBOOT_SOURCE
+    fi
 fi
 
 if test "$FIT"
-- 
2.25.1


