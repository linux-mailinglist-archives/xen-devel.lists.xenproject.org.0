Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7677D504E3A
	for <lists+xen-devel@lfdr.de>; Mon, 18 Apr 2022 11:09:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.307063.522358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngNO3-0000aN-By; Mon, 18 Apr 2022 09:09:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 307063.522358; Mon, 18 Apr 2022 09:09:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngNO3-0000X7-87; Mon, 18 Apr 2022 09:09:35 +0000
Received: by outflank-mailman (input) for mailman id 307063;
 Mon, 18 Apr 2022 09:09:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mice=U4=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1ngNO1-0006ub-Dz
 for xen-devel@lists.xenproject.org; Mon, 18 Apr 2022 09:09:33 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on0609.outbound.protection.outlook.com
 [2a01:111:f400:fe02::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4241f919-bef7-11ec-8fbe-03012f2f19d4;
 Mon, 18 Apr 2022 11:09:32 +0200 (CEST)
Received: from DB7PR03CA0095.eurprd03.prod.outlook.com (2603:10a6:10:72::36)
 by AS8PR08MB6919.eurprd08.prod.outlook.com (2603:10a6:20b:39e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Mon, 18 Apr
 2022 09:09:18 +0000
Received: from DB5EUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:72:cafe::ba) by DB7PR03CA0095.outlook.office365.com
 (2603:10a6:10:72::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20 via Frontend
 Transport; Mon, 18 Apr 2022 09:09:18 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT010.mail.protection.outlook.com (10.152.20.96) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5164.19 via Frontend Transport; Mon, 18 Apr 2022 09:09:17 +0000
Received: ("Tessian outbound 78191104f1b7:v118");
 Mon, 18 Apr 2022 09:09:17 +0000
Received: from f51aa0450e9c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A2B559B8-7646-46D0-8CE1-D20079B0863E.1; 
 Mon, 18 Apr 2022 09:09:11 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f51aa0450e9c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 18 Apr 2022 09:09:11 +0000
Received: from AM7PR04CA0025.eurprd04.prod.outlook.com (2603:10a6:20b:110::35)
 by AM0PR08MB4577.eurprd08.prod.outlook.com (2603:10a6:208:fe::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Mon, 18 Apr
 2022 09:09:10 +0000
Received: from VE1EUR03FT041.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:110:cafe::6a) by AM7PR04CA0025.outlook.office365.com
 (2603:10a6:20b:110::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20 via Frontend
 Transport; Mon, 18 Apr 2022 09:09:10 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT041.mail.protection.outlook.com (10.152.19.163) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5164.19 via Frontend Transport; Mon, 18 Apr 2022 09:09:09 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.27; Mon, 18 Apr
 2022 09:09:08 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.27 via Frontend
 Transport; Mon, 18 Apr 2022 09:09:05 +0000
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
X-Inumbo-ID: 4241f919-bef7-11ec-8fbe-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b+kkvGS3/fA3Z6skbovMJfBC0zHGpIPcShHjvP25cAE=;
 b=l27uyZZ9/Y7WzwOt6kXyxm2MfJYNG8NBjX56R7Igc7yz+yIMR8UiKbJO1Pa5D3w5CXDIQjJXBZzYc3r7GRjv6UmTL+GRM2dQqbMGhrbxg5Bw00B/i4kqnfknROwGWgyTY/GDIk7bt/PKAHjfhvf53r9VCTOpBxZrJKpHZCLrVl8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 95b13141f1f39154
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jJhIAr5eQlspRDJp8E93yhTHxeWgfZYDdopNGYSXsNbHxvWeTsQ5KB4HMBQeH/rp1e4tj8LNm8ThdB/ZRLgysBPitPiNJGPzMz0scLwGFU4dS5F2nX4EalTFIm2Y3sbfsAR+acmF4umhgPwvKBF8D1nxJebOijtE8G1FU2PCFa3cnjgP45AZG59BJ/KaNImsrQkAhwKuKRXh45d4Q0cVtv6nU1K3UMUYiPqv4HA9fQUSCnE59OxkLLqAZsn7XRRWQFlvXPANLto04NytLp6JjIlslJzzBUjl/LJIABOkmS3CTPMTLLApV/g2iX8vOrNc4PBBL1DWLFulkSdLuuygLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b+kkvGS3/fA3Z6skbovMJfBC0zHGpIPcShHjvP25cAE=;
 b=lbnnQmm7c0hl1wBmhZt8sRrujxSqaXGIeiPUzu/DB62WJ1VXUtSlkhlCfmstt7okhzl2RMH/C4p1C7WpjtnmisAYtT5/DE7yYUBFZv/H6WB85WvPnwYcEeW2ab5K8uEqTeDwpTRvIFWERDc5QfAMim4VFM2JxI/sDrg3EGTKi6Pj1vDl5LttPjHinvqfcu8cl3xvVtcv2ncd6tHC08BKdHRkGvg53I/Itp7vCmiY9jbyk4VV0VuaibQvh6uJGOPRp5r5JwSIzt7hdDCiwsqs/gwg97iV1ZlFY5mBsQf3bWooy8GJaHt79HlqsB1dQCQkXI74CX68AZhiLqxVRFWwoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b+kkvGS3/fA3Z6skbovMJfBC0zHGpIPcShHjvP25cAE=;
 b=l27uyZZ9/Y7WzwOt6kXyxm2MfJYNG8NBjX56R7Igc7yz+yIMR8UiKbJO1Pa5D3w5CXDIQjJXBZzYc3r7GRjv6UmTL+GRM2dQqbMGhrbxg5Bw00B/i4kqnfknROwGWgyTY/GDIk7bt/PKAHjfhvf53r9VCTOpBxZrJKpHZCLrVl8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Wei Chen <wei.chen@arm.com>
To: <--to=xen-devel@lists.xenproject.org>, <xen-devel@lists.xenproject.org>
CC: <nd@arm.com>, Wei Chen <wei.chen@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 04/10] xen/arm: Keep memory nodes in device tree when Xen boots from EFI
Date: Mon, 18 Apr 2022 17:07:29 +0800
Message-ID: <20220418090735.3940393-5-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220418090735.3940393-1-wei.chen@arm.com>
References: <20220418090735.3940393-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 281da175-eb93-4564-b5d5-08da211b1e02
X-MS-TrafficTypeDiagnostic:
	AM0PR08MB4577:EE_|DB5EUR03FT010:EE_|AS8PR08MB6919:EE_
X-Microsoft-Antispam-PRVS:
	<AS8PR08MB6919C39C059C9D65398B054A9EF39@AS8PR08MB6919.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 B7eFzo2nCsVI+2O9YuQQ30xoceR2qZ/mdcc2jeaQFkpCIwAC3ZHKSTfiEY28FgJci0xRrFm9pz2MJQvBCftuhMYzT6/0ql2KmAUA71iu8NKiR8T6vvxFO0BOw30IMdrv3NkNDeQHkAoPbNRXgmMHFl6e1PvJSyljX7JT98ORET2n/gwQA3uBWgKWW0EXLTxhqeBbcDqffTDWbQQ3vos8UNyKNvxpBxJLWY0XP6a4SRjP6xEM3I7kXYVwFkmEW6w5VEAm8jcFQySohqUKvAYBrJ1/eMFmUBkEZuF8XSDji6YYazcNutzHlh5KwBENXS+xTBsamgrlivVJOCr1xrNaRTVexmPZxyTxbkV3dinJ3K6Bka150aWe8tIr58DCODneG7F2Cb7Xlv3r+aRfP0JOllxmIexggHZHMmSyuZs6G6KW0/TBT0+LPPp3cXp2G2/Aph4Vg3rhDxstqaNWodgBkxDd3fRh/Ukpc9sUsH5FRQp+qJduV8Lu0m4saFvdOXWG93RdXMQp33m4H8mi5nKJESl7AxDOT9KBV2e/m6yGOilhwNzEKi0D2hmdnR0uvPrWOcOcv4Hg6HYDugLPjtMYdqtbR738igcjB40yiCMWQ+3eJwjWUnDu3yBeIugXkUOLbrh7EFcOOq/vfIcmMdJ7X+ufmXru3ZvZ4YTlvWkIrf2NxRQImeWkX6HVdZireDVtbBO8BofjCpUNb3Xje+HBnw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(82310400005)(26005)(508600001)(8676002)(4326008)(47076005)(110136005)(54906003)(36756003)(86362001)(6666004)(7696005)(40460700003)(316002)(70586007)(186003)(2616005)(83380400001)(2906002)(70206006)(1076003)(426003)(336012)(81166007)(356005)(36860700001)(5660300002)(8936002)(44832011)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4577
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	dca60300-23c2-4b04-23d8-08da211b192d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	IvcVQkdpgv1Emytnp1hjEzD7ZTRBp8ATPOyd1TM8AEMu4m96hzphwBjdlSgrDjEeSMllW+YeTn3uyfsrcbo3CuXHvCZfavOB4N5B0CKlt+B6l6qJC/Fk4IJ3vTqOy5dNyZivRTEfPeViEEIPFhCpV1Cu67ZMl6wLmnnLX9v4NipQCE7x/mlgZTPC8rwPcgC5ZKBOeQGLbo8x14PF6092f0yGWlrosYvkChHE9FzaRZ/uzMSlhExxpuSATdzoxrfKmF80jH9zUB/9Ar4JeorlCs8+xSOzes5yvrXnFlyxVKzLvBDMfM2rToz8f851tTM8YMt4EpXoBGc4UWJywwHO3UcKbTptdOVVM+4IsaPaOCvgVEdlhuWxeBKsKtBiJ83kMdXeYupMvgA8XA2wN65RHqArPgV19w1L6/CCo5xYGhUT7bK+srMgoyBo/5vLBp4xzSzFgDNme4rtrgWqHRxhADiGe6iO7z4ls0uhpKNagbWkVg0yEx8ripkYOmXomTn3vnIvpY1xZllGxDK4R/IUbHfRfXOdmyWx29+bSJlOjI+LLvg7oW0B+qaWAGIwWdcqj51w4OSjmcx1TZhiF+xWzOHKPBJXHgmzoyGSJIkyhFMuzZDlqYdsLXGctWDLgLcHXufMe7jyhHUCqQsSchUnSyBKyszgd1VYx9rlCCS9h4NWtIy5cQ6f5Z0KmOhuVdQv
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(8936002)(40460700003)(54906003)(508600001)(6666004)(5660300002)(81166007)(316002)(83380400001)(86362001)(36756003)(110136005)(2906002)(7696005)(44832011)(8676002)(4326008)(26005)(82310400005)(36860700001)(70586007)(70206006)(450100002)(2616005)(1076003)(47076005)(426003)(107886003)(336012)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2022 09:09:17.7674
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 281da175-eb93-4564-b5d5-08da211b1e02
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6919

In current code, when Xen is booting from EFI, it will delete
all memory nodes in device tree. This would work well in current
stage, because Xen can get memory map from EFI system table.
However, EFI system table cannot completely replace memory nodes
of device tree. EFI system table doesn't contain memory NUMA
information. Xen depends on ACPI SRAT or device tree memory nodes
to parse memory blocks' NUMA mapping. So in EFI + DTB boot, Xen
doesn't have any method to get numa-node-id for memory blocks any
more. This makes device tree based NUMA support become impossible
for Xen in EFI + DTB boot.

So in this patch, we will keep memory nodes in device tree for
NUMA code to parse memory numa-node-id later.

As a side effect, if we still parse boot memory information in
early_scan_node, bootmem.info will calculate memory ranges in
memory nodes twice. So we have to prevent early_scan_node to
parse memory nodes in EFI boot.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
v1 -> v2:
1. Move this patch from later to early of this series.
2. Refine commit message.
---
 xen/arch/arm/bootfdt.c      |  8 +++++++-
 xen/arch/arm/efi/efi-boot.h | 25 -------------------------
 2 files changed, 7 insertions(+), 26 deletions(-)

diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
index e318ef9603..78e10c6ebc 100644
--- a/xen/arch/arm/bootfdt.c
+++ b/xen/arch/arm/bootfdt.c
@@ -11,6 +11,7 @@
 #include <xen/lib.h>
 #include <xen/kernel.h>
 #include <xen/init.h>
+#include <xen/efi.h>
 #include <xen/device_tree.h>
 #include <xen/libfdt/libfdt.h>
 #include <xen/sort.h>
@@ -370,7 +371,12 @@ static int __init early_scan_node(const void *fdt,
 {
     int rc = 0;
 
-    if ( device_tree_node_matches(fdt, node, "memory") )
+    /*
+     * If Xen has been booted via UEFI, the memory banks are
+     * populated. So we should skip the parsing.
+     */
+    if ( !efi_enabled(EFI_BOOT) &&
+         device_tree_node_matches(fdt, node, "memory") )
         rc = process_memory_node(fdt, node, name, depth,
                                  address_cells, size_cells, &bootinfo.mem);
     else if ( depth == 1 && !dt_node_cmp(name, "reserved-memory") )
diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
index e452b687d8..59d93c24a1 100644
--- a/xen/arch/arm/efi/efi-boot.h
+++ b/xen/arch/arm/efi/efi-boot.h
@@ -231,33 +231,8 @@ EFI_STATUS __init fdt_add_uefi_nodes(EFI_SYSTEM_TABLE *sys_table,
     int status;
     u32 fdt_val32;
     u64 fdt_val64;
-    int prev;
     int num_rsv;
 
-    /*
-     * Delete any memory nodes present.  The EFI memory map is the only
-     * memory description provided to Xen.
-     */
-    prev = 0;
-    for (;;)
-    {
-        const char *type;
-        int len;
-
-        node = fdt_next_node(fdt, prev, NULL);
-        if ( node < 0 )
-            break;
-
-        type = fdt_getprop(fdt, node, "device_type", &len);
-        if ( type && strncmp(type, "memory", len) == 0 )
-        {
-            fdt_del_node(fdt, node);
-            continue;
-        }
-
-        prev = node;
-    }
-
    /*
     * Delete all memory reserve map entries. When booting via UEFI,
     * kernel will use the UEFI memory map to find reserved regions.
-- 
2.25.1


