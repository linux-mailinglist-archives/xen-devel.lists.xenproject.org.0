Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 504FF415E19
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 14:17:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193942.345568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTNf8-0006GF-W2; Thu, 23 Sep 2021 12:17:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193942.345568; Thu, 23 Sep 2021 12:17:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTNf8-0006CZ-OQ; Thu, 23 Sep 2021 12:17:14 +0000
Received: by outflank-mailman (input) for mailman id 193942;
 Thu, 23 Sep 2021 12:17:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fewu=ON=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mTNVz-0005KP-6X
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 12:07:47 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.74]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 66900bfe-957e-47f2-97f4-2bcb54fed078;
 Thu, 23 Sep 2021 12:04:34 +0000 (UTC)
Received: from AM7PR04CA0024.eurprd04.prod.outlook.com (2603:10a6:20b:110::34)
 by AM0PR08MB5171.eurprd08.prod.outlook.com (2603:10a6:208:159::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16; Thu, 23 Sep
 2021 12:04:32 +0000
Received: from AM5EUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:110:cafe::2e) by AM7PR04CA0024.outlook.office365.com
 (2603:10a6:20b:110::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14 via Frontend
 Transport; Thu, 23 Sep 2021 12:04:32 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT020.mail.protection.outlook.com (10.152.16.116) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 12:04:32 +0000
Received: ("Tessian outbound 010023020eef:v103");
 Thu, 23 Sep 2021 12:04:31 +0000
Received: from 19d49da73a86.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8AF177E2-6968-4553-891E-0E442CC65920.1; 
 Thu, 23 Sep 2021 12:04:18 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 19d49da73a86.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 23 Sep 2021 12:04:18 +0000
Received: from AS9PR06CA0093.eurprd06.prod.outlook.com (2603:10a6:20b:465::22)
 by DB6PR0802MB2581.eurprd08.prod.outlook.com (2603:10a6:4:a1::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Thu, 23 Sep
 2021 12:04:15 +0000
Received: from AM5EUR03FT011.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:465:cafe::2c) by AS9PR06CA0093.outlook.office365.com
 (2603:10a6:20b:465::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15 via Frontend
 Transport; Thu, 23 Sep 2021 12:04:15 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT011.mail.protection.outlook.com (10.152.16.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 12:04:14 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.14; Thu, 23 Sep
 2021 12:03:55 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 23
 Sep 2021 12:03:54 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.87) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Thu, 23 Sep 2021 12:03:53 +0000
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
X-Inumbo-ID: 66900bfe-957e-47f2-97f4-2bcb54fed078
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gvySSU4kIt7pfh5/hl+s44OlyMdIG3eGKnyLNiYLQmk=;
 b=U4tFnxshcx9DiEH5p7IZTk8JiaTvEw++j5U1xylexRQ7vuZqv8qSvfMxG9aP451kCw0ZCqRP1YSZcna49AKsHwjQA8df/wrBnwzH9hEFN+hnfFzqUqHB6EdlkgPYow1uspvjSGLqwsGXG7MkHHDO0ue7nCSN20FZAuikI5YZXko=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: b1669256a1151d9b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VGXRIjy+dAMyO+wmLYAleLbc0RZZMY5JBTTdUU2HBiLBUmaDqIdU8gQtZPYQqQja/E8WDjPtUfPYmFdM+OBsgLspjtHZb0tYIwjqIczeb628BnkE4jnKxkXCMWHUrD1kR49anRryybyZlB9mPqe4HTeWLde5+W4j+P2MqOitUMBrPZGBcxe5GKd1ZYW0/BGwFCybXtqzQUs20J6dJafPjjT5tUmiR2w8IIpRBt7cGai30NvGPBSh9/zVgNYqFvq6DXuEC7RjyajhcHTPu+dodhXWfIXeWv68PV2rJU/jTMxGSwDvzCOolC1BM76OexTGBnY4vbj3Zx/8GvNot0yHVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=gvySSU4kIt7pfh5/hl+s44OlyMdIG3eGKnyLNiYLQmk=;
 b=WxFyGPY9U5PnjKc+W7AgpZ8OKEySi8lOWnjaY7Xze6Wjep7hw3K/As0/dL0YrBCR5fK6nE42P2k2g0BnBGr7H1gfpIdmLOH5aiJx9D+oW9258IyFALKGLPDSP70oG1pcIV5ymdlBKD+yHKi0C1Ea5h3NlbzrmeRf++e04qQ6zuNi12OGcU46Ki5C3P2LYODAOstEZuLqmeiLnw8cIKMxUUxLpXBoG3jGXNQd5j35priizbT2nIGSRjaDlrX7sfTDevIRD30pJgdsEmvdanSO8gkZ/oOdTcty6FqpPw3vpJbSPAIZOGBp9LLIu6bbKiMIEakjai51eJaGF45D+y3gdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gvySSU4kIt7pfh5/hl+s44OlyMdIG3eGKnyLNiYLQmk=;
 b=U4tFnxshcx9DiEH5p7IZTk8JiaTvEw++j5U1xylexRQ7vuZqv8qSvfMxG9aP451kCw0ZCqRP1YSZcna49AKsHwjQA8df/wrBnwzH9hEFN+hnfFzqUqHB6EdlkgPYow1uspvjSGLqwsGXG7MkHHDO0ue7nCSN20FZAuikI5YZXko=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Wei Chen <wei.chen@arm.com>
To: <wei.chen@arm.com>, <xen-devel@lists.xenproject.org>,
	<sstabellini@kernel.org>, <julien@xen.org>
CC: <Bertrand.Marquis@arm.com>
Subject: [PATCH 21/37] xen/arm: Keep memory nodes in dtb for NUMA when boot from EFI
Date: Thu, 23 Sep 2021 20:02:20 +0800
Message-ID: <20210923120236.3692135-22-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210923120236.3692135-1-wei.chen@arm.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1508f99f-b4a0-423e-0b75-08d97e8a4dc1
X-MS-TrafficTypeDiagnostic: DB6PR0802MB2581:|AM0PR08MB5171:
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB5171EE9F5900EB19C09464909EA39@AM0PR08MB5171.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 CJxiuM498ucDO34ghQdgHgKwtFmEQ1Abp0CumzVXo+SJgi1WNS2WUBHAZLncCQcv2LiasLAmR/IqJB9EwTwIYMUJCkvqhJr5qUtfFGD6cF6LfV+j51JsKHBFWuGQM9GwSW0HSqZhQpDObeSanQWhtAmWRg39ESCkAkZsZV7eXOUWZnHITwrwcbo9ilAN5EuCAjAH8SHnCI8gi0wjnJavgpsKRqSM2jY4jiFe1uLjJgyuqIiMSU2p6siRcXyrY7R2+inTv+M1ob0lcMsZhr8gNKUpzcif2NkoatgKgQQ+ZXOD3xw0KobMoSNv1je1X4ZWaSRcNkRRdYv0RMC4WsWuKSqCFZn1yNRqKJQQuB4jRkrcFw2DmNsj6BbFq9T0YS1MV9EnAh3hBr1D5wpffi3HZOQV8YTqwmfyMAr6F9ayiK546b0vEdBI8mOm60hX/6RwwA6pFQ7tgK4i2AdCp8inGlWL5vDp3SseHDebwxwG+TeIh3OOo6AXDHYOp0/JZSMBUkA3KgbnQHJG7CH6RsN3LaNmpDqZFSxUA9b+PkpYcPoLGxD4GjGnZ3Fbdf4kfW2iqgVpc1DMREjvIk865BGbDkPlOoHJeCzc8C34aCo4WtThmAeXVmGoYFKq+kxsYqF+gclqH1qIg5dz+SP16GWYzC1BQvleF4C8dDX97sVpHZZo9zUx4HQaB31e7CqHYscxwuBRaRdoxMAmG3/XgRKPbtfLLygcIjeqTR7P8Ylv8A0=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(7696005)(2906002)(508600001)(5660300002)(8936002)(81166007)(356005)(36756003)(2616005)(36860700001)(1076003)(47076005)(316002)(8676002)(26005)(83380400001)(336012)(82310400003)(6666004)(110136005)(4326008)(186003)(86362001)(44832011)(70586007)(70206006)(426003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2581
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a6e061a9-1254-48ef-188f-08d97e8a4355
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uZvkHcsXMCuHrxZVZnqr66DByS50wpa1AOs0b0r/ezMMWaturZJdpYEGoypyeSpoAEnxWDS4TonfEd54dt8GhbSmcBjU8ASm7P4dpDV2Z2KMVmctyzytq2520mSiE/jr88F4RiOUXJIRwbioxYHJfwAI3FesxnRX6juJnvJLWmMbqRjAf+usajYVZTiQtWmE9fZixkde0TU7HpVcqMRI9Bs5e7SKKx6g3+WU7Qcf75crVcyu+Gc+bCRJE4NXKbd+dyxt2d9odIhZHeA1owzdCsZ/vIhsjUUlAvnCcd3qeP2mKST++PGsfkMt1HPeV8lpxgBuEBRGAFIUXpr5ghL+PcMSphJAuE/tkUHl+FxNmkztPCoJie2utcGdXyzdkU9w1dfyGnQn9msHlRvzGey8r2TNpk9q6oAhgJzdxbncq+NOB233c90m/ktAhiB4WI+4kqaFza7OmwqkYBmwwd20nkVagRgwnuQ6FYIXeVhj1wkUIVCzZ8ooxdYwWbn01I+FcL1LGlmrY2RmkqR2PjG5SOQdJIg4S3GN4eT7762ok93I6iFPi192ymTYKm3mDiyzaR8nuMK+YrC08cevyIf3OmvRxF1CCSaJykWpBH3FBoDpcQ8cTOUUStzJ1bwNO/D/y74KQr3crx9ErZhoFCvMyNyhBPUtjt2su6qZn1xv+wDNenrCeG/a5taTGTARTd1LA9zhFBFTLV2OaXTExtZnuQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(70586007)(508600001)(81166007)(2906002)(426003)(70206006)(36756003)(110136005)(5660300002)(316002)(4326008)(83380400001)(82310400003)(7696005)(6666004)(1076003)(336012)(186003)(26005)(8936002)(8676002)(44832011)(47076005)(36860700001)(86362001)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 12:04:32.4119
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1508f99f-b4a0-423e-0b75-08d97e8a4dc1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5171

EFI can get memory map from EFI system table. But EFI system
table doesn't contain memory NUMA information, EFI depends on
ACPI SRAT or device tree memory node to parse memory blocks'
NUMA mapping.

But in current code, when Xen is booting from EFI, it will
delete all memory nodes in device tree. So in UEFI + DTB
boot, we don't have numa-node-id for memory blocks any more.

So in this patch, we will keep memory nodes in device tree for
NUMA code to parse memory numa-node-id later.

As a side effect, if we still parse boot memory information in
early_scan_node, bootmem.info will calculate memory ranges in
memory nodes twice. So we have to prevent early_scan_node to
parse memory nodes in EFI boot.

As EFI APIs only can be used in Arm64, so we introduced a stub
API for non-EFI supported Arm32. This will prevent

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/arch/arm/bootfdt.c      |  8 +++++++-
 xen/arch/arm/efi/efi-boot.h | 25 -------------------------
 xen/include/xen/efi.h       |  7 +++++++
 3 files changed, 14 insertions(+), 26 deletions(-)

diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
index afaa0e249b..6bc5a465ec 100644
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
+     * If Xen has been booted via UEFI, the memory banks will already
+     * be populated. So we should skip the parsing.
+     */
+    if ( !efi_enabled(EFI_BOOT) &&
+         device_tree_node_matches(fdt, node, "memory"))
         rc = process_memory_node(fdt, node, name, depth,
                                  address_cells, size_cells, &bootinfo.mem);
     else if ( depth == 1 && !dt_node_cmp(name, "reserved-memory") )
diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
index cf9c37153f..d0a9987fa4 100644
--- a/xen/arch/arm/efi/efi-boot.h
+++ b/xen/arch/arm/efi/efi-boot.h
@@ -197,33 +197,8 @@ EFI_STATUS __init fdt_add_uefi_nodes(EFI_SYSTEM_TABLE *sys_table,
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
diff --git a/xen/include/xen/efi.h b/xen/include/xen/efi.h
index 661a48286a..b52a4678e9 100644
--- a/xen/include/xen/efi.h
+++ b/xen/include/xen/efi.h
@@ -47,6 +47,13 @@ int efi_runtime_call(struct xenpf_efi_runtime_call *);
 int efi_compat_get_info(uint32_t idx, union compat_pf_efi_info *);
 int efi_compat_runtime_call(struct compat_pf_efi_runtime_call *);
 
+#else
+
+static inline bool efi_enabled(unsigned int feature)
+{
+    return false;
+}
+
 #endif /* CONFIG_EFI*/
 
 #endif /* !__ASSEMBLY__ */
-- 
2.25.1


