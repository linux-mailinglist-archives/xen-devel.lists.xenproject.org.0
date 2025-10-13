Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3E8BD654D
	for <lists+xen-devel@lfdr.de>; Mon, 13 Oct 2025 23:12:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1142504.1476650 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8Ppg-0000yk-0X; Mon, 13 Oct 2025 21:11:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1142504.1476650; Mon, 13 Oct 2025 21:11:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v8Ppf-0000wW-U0; Mon, 13 Oct 2025 21:11:51 +0000
Received: by outflank-mailman (input) for mailman id 1142504;
 Mon, 13 Oct 2025 21:11:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VK7X=4W=amd.com=Jason.Andryuk@srs-se1.protection.inumbo.net>)
 id 1v8Ppe-0000Zw-Gm
 for xen-devel@lists.xenproject.org; Mon, 13 Oct 2025 21:11:50 +0000
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azlp170120001.outbound.protection.outlook.com
 [2a01:111:f403:c107::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3a60d4b6-a879-11f0-980a-7dc792cee155;
 Mon, 13 Oct 2025 23:11:48 +0200 (CEST)
Received: from SJ0PR13CA0096.namprd13.prod.outlook.com (2603:10b6:a03:2c5::11)
 by IA1PR12MB6307.namprd12.prod.outlook.com (2603:10b6:208:3e5::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 21:11:43 +0000
Received: from SJ1PEPF000023D8.namprd21.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::31) by SJ0PR13CA0096.outlook.office365.com
 (2603:10b6:a03:2c5::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9228.9 via Frontend Transport; Mon,
 13 Oct 2025 21:11:42 +0000
Received: from satlexmb08.amd.com (165.204.84.17) by
 SJ1PEPF000023D8.mail.protection.outlook.com (10.167.244.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9253.0 via Frontend Transport; Mon, 13 Oct 2025 21:11:41 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 13 Oct
 2025 14:11:41 -0700
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 13 Oct
 2025 14:11:41 -0700
Received: from fedora.mshome.net (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 13 Oct 2025 14:11:40 -0700
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
X-Inumbo-ID: 3a60d4b6-a879-11f0-980a-7dc792cee155
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s+Ll1+vSCg40be+YwDkbLp5QWG919yR0/H4iigNMIO552kz1WW8YkYi6n7iQgSGeV2ln4tnkLxJeB8R+ZRGhjFf4OK8/bous7P8VkHLblLbz+xEn/UHS9VLe8bGSgdyK2u4Mojwf1iH3wae2gJIgvPk+Mm8n8/Fj/Zc0R+I08wNCL/WEUHVP34+s3bQwTDfuHukMbQ3sIBJiuiq7DI10ALFAjj24pXn7migwzYiJgi0lDwgl6cS73CmaTPYCCyJjL8kugN39vzIwe1W6qLRtm62gceyD+4ug4gomhnKHuITY78AQITDp0bo386CTSY+JEEW4ukZc2rb86n6H9hdl0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XXe8zTKYF8x6DO9Gyq6hh+L+Uww1AxrCS0EUCz3I5Sg=;
 b=abUEi8sTyO1uohYrXxgWYX3cUTTtaUQXjMrW8hXf8swpXQAuEuAnJCmUvmx4q/7rwQpTu4P2vd92a/uN9f7JEz/QQAHPqsqc5Y+tkmRegJyCvPRLFhaOmIH0QMAhI0Ai/vF560+9P3DawogDOffFI/RybLzrWI429og7OC9GkdnloYzfs7n0/VyVGvIEqDyqZ8GJcwNUYsoV7y6WWT38MH3wxLKEaMcbnZYcy+JeFUUjHIDpz1tOhTt31hpBcxGSjo+lYmFDALIEJK8dL3s/M3muZ2JBv83jwY/F8o+0IvfkS3wMkY9r8eRvrHpfGXJD0DD9fg+kUeQ80sQmzyZ4Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XXe8zTKYF8x6DO9Gyq6hh+L+Uww1AxrCS0EUCz3I5Sg=;
 b=4qNtyLyVhUCW+TuiNo0pxivwcTGPZBQlV2Qd+YTrdZbUAMPPxcGQXUcHvrvJGnTbqlJVT/t1lq++kofGlseEhYcVFZz/9hdjd6+rY/UJyMc68gS1o5QiQTikcd47bcYxOv67QWom7fhtBTSxtoEBhSmSkMVMCFC8LOCrxNsKouc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
From: Jason Andryuk <jason.andryuk@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Oleksii Kurochko <oleksii.kurochko@gmail.com>, Jason Andryuk
	<jason.andryuk@amd.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>
Subject: [PATCH] x86/boot: Fix edd=off to skip mbr
Date: Mon, 13 Oct 2025 17:11:39 -0400
Message-ID: <20251013211139.8750-1-jason.andryuk@amd.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D8:EE_|IA1PR12MB6307:EE_
X-MS-Office365-Filtering-Correlation-Id: 945fb084-8d70-47ed-8c03-08de0a9d1b81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6P+8k7B8QH3f39tI4cnjCwQFiYZpda/e7O/JRKJ3DEL17hKXkGCSlB2Z2s8N?=
 =?us-ascii?Q?9miRx8ctMKExnAE/V3Yv08jtdL6NJ5Fd3o9jKgnFz+PjN4Ekls+3paBjN2wO?=
 =?us-ascii?Q?ciNx9UmG7ZnPVkSizGGZL9kryxapXTfsrHlSPf//pxCBFsEpF81RtAuRVvfV?=
 =?us-ascii?Q?SMpZB15tdoQogLiAZiM/WggeJMA653zsjNutyG7QqQStGgnkgBUxrCE5WtM6?=
 =?us-ascii?Q?XrwC4yYwPtBuBhlFRz+3lJK9jKYDTPWz53yw9XJZR8rDavZlwllDmgETiY28?=
 =?us-ascii?Q?I4TTatJV2ZCYBPIfTer7S//DBWNfXU9s3B8Dunt1IDf0IZkh0FXzUkrWyC8H?=
 =?us-ascii?Q?nfMspAQDjqBLf+ELz+Li+cM+kLhcH0WCaTheyfiVem26m8kES2Vh4TX3UI1o?=
 =?us-ascii?Q?A6XrehHc4LMazwvnCDUPzpBDTlmjH4fKFC+C+pQ2mAc91RReHTQ2xFPz+MMB?=
 =?us-ascii?Q?xIiNRgpHUV3eGoDzbmP3JmM9dw0pt7R5bcYWbSt+UE64zXd7SZxVpNPviKm5?=
 =?us-ascii?Q?zcQ11VhYoFHMf9VZKRrwCOl3vJe/1McCHsO3oAtzv73vB1S+Zuh4dcSFUrt0?=
 =?us-ascii?Q?4sVfgy4Ux50peDfbwzwJZIqO7MNzjIvcEPLWD8Q5gTMA65j0qfd34GsytMEL?=
 =?us-ascii?Q?WEnTzXv/lwuNju50Maoac0b+dcQs0z1l+3Wp/shkb4EMqmWxm7XYZu5kYL85?=
 =?us-ascii?Q?hNmAwif8fkqg7iD3cFTj+xHP/UOl430Vw2yr08+EKkFYmEstyBaEbiyXuKtq?=
 =?us-ascii?Q?cTKocP/Wv3uIgavZLHJMxU5QODIbTa56GmnlJGlwt2yqwJuztHJ1DoDAB1vo?=
 =?us-ascii?Q?CD1K5rTLxLtXrrVYwTAmzqI1/nc3EtlMr1FM2XYgkwijZu5wd/rhX+2rUIqf?=
 =?us-ascii?Q?dDFSYBjC7A6n1oCbHC0TAR82mG6aMA2gz7yyhfenhhe7FAbBvFAXJem/ixDO?=
 =?us-ascii?Q?mNWHvA8hlFWuNve4oxaRqHflmKqJqaYVgYoWaujdFOeUi+MPCMPwqbKh26In?=
 =?us-ascii?Q?lb1/4NKf2W9c6cxZf2ZRUvH4lOuwyx2c/uxZUfGZDeC8kXtx7ZMKlgujS9a3?=
 =?us-ascii?Q?gF+E+HrDLiCJyrtg3IlkwYodJMJy2ofdooSRvWWFvBuWvc1ZkrYUSCFMR2ZI?=
 =?us-ascii?Q?9+bMGK+l/dvNrmxv4STqJ0bWT37wGmDBrLI5OUyOT4+IUuKwCkbMMhu21It2?=
 =?us-ascii?Q?j8duXVm7rGnZbTflLvGhtXWPvWOHMCS2bjVbk7zmeeKdXDi6B9JPiJZkbHUN?=
 =?us-ascii?Q?H8v/RTu1OH4oz1VfCqwoTfUt2/bVXlYCDTM2O4Dc72TtiHXntSnM+6G9HN+O?=
 =?us-ascii?Q?I0mG2u8zTcYesUuJmvlkO0FfNe28nNlJzmVR4lnSjwWv3HCPCtPYnQ14ihlX?=
 =?us-ascii?Q?PCv0Gbr+Jec+pXvFK0csHwZwFs5MFooEZPhffzLmpg/Npblm2K7u7epgp0u/?=
 =?us-ascii?Q?dIp0xNFffyfZG0twdnqxqfKx7qdKgXhPMJnftLRy+7RdjKA3+qoRnT1ubJOF?=
 =?us-ascii?Q?q9FaTPUCHZjI6uMWkCaJLfdbQFRhs2/8ll1khh7fWiVAKkUYRMe+5dSHPCYK?=
 =?us-ascii?Q?fjpIktUHHr7NH/WcPUE=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb08.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 21:11:41.9548
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 945fb084-8d70-47ed-8c03-08de0a9d1b81
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D8.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6307

When the fixes commit re-arranged the code, it made edd=off jump to the
mbr code instead of returning from the function.  Previously edd_done
was immediately before ret and skipped the MBR check.

Replace edd_done with .Ledd_mbr_sig for the start of the MBR checking,
and replace .Ledd_mbr_sig_skip with .Ledd_done to exit from the function.

edd=off jumps to .Ledd_done to return from the function, and internal
jumps go to .Ledd_mbr_sig to check edd=skipmbr.

Fixes: 5ec164fd61bd ("x86/boot: re-arrange how/when we do disk I/O")
Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
 xen/arch/x86/boot/edd.S | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/xen/arch/x86/boot/edd.S b/xen/arch/x86/boot/edd.S
index 3df712bce1..02437511b2 100644
--- a/xen/arch/x86/boot/edd.S
+++ b/xen/arch/x86/boot/edd.S
@@ -25,7 +25,7 @@
 
 get_edd:
         cmpb    $2, bootsym(opt_edd)            # edd=off ?
-        je      edd_done
+        je      .Ledd_done
 
 # Do the BIOS Enhanced Disk Drive calls
 # This consists of two calls:
@@ -48,7 +48,7 @@ edd_check_ext:
         movb    $0x41, %ah                      # 0x41 Check Extensions Present
         movw    $0x55AA, %bx                    # magic
         int     $0x13                           # make the call
-        jc      edd_done                        # no more BIOS devices
+        jc      .Ledd_mbr_sig                   # no more BIOS devices
 
         cmpw    $0xAA55, %bx                    # is magic right?
         jne     edd_next                        # nope, next...
@@ -96,13 +96,13 @@ edd_legacy_done:
 
 edd_next:
         incb    %dl                             # increment to next device
-        jz      edd_done
+        jz      .Ledd_mbr_sig
         cmpb    $EDD_INFO_MAX,bootsym(boot_edd_info_nr)
         jb      edd_check_ext
 
-edd_done:
+.Ledd_mbr_sig:
         cmpb    $1, bootsym(opt_edd)            # edd=skipmbr ?
-        je      .Ledd_mbr_sig_skip
+        je      .Ledd_done
 
 # Read the first sector of each BIOS disk device and store the 4-byte signature
 .Ledd_mbr_sig_start:
@@ -160,7 +160,7 @@ edd_done:
         jb      .Ledd_mbr_sig_read
 .Ledd_mbr_sig_done:
         popw    %es
-.Ledd_mbr_sig_skip:
+.Ledd_done:
         ret
 
 GLOBAL(boot_edd_info_nr)
-- 
2.51.0


