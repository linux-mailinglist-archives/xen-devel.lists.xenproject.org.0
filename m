Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A7C4B403D
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 04:21:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271077.465494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJRvh-0001x4-Or; Mon, 14 Feb 2022 03:21:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271077.465494; Mon, 14 Feb 2022 03:21:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJRvh-0001ib-Bq; Mon, 14 Feb 2022 03:21:33 +0000
Received: by outflank-mailman (input) for mailman id 271077;
 Mon, 14 Feb 2022 03:21:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aDlx=S5=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1nJRve-0007B4-HW
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 03:21:30 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0602.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 32e1864c-8d45-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 04:21:29 +0100 (CET)
Received: from AM6PR04CA0054.eurprd04.prod.outlook.com (2603:10a6:20b:f0::31)
 by VE1PR08MB5758.eurprd08.prod.outlook.com (2603:10a6:800:1a0::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.14; Mon, 14 Feb
 2022 03:21:26 +0000
Received: from AM5EUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:f0:cafe::ed) by AM6PR04CA0054.outlook.office365.com
 (2603:10a6:20b:f0::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.18 via Frontend
 Transport; Mon, 14 Feb 2022 03:21:26 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT060.mail.protection.outlook.com (10.152.16.160) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4975.17 via Frontend Transport; Mon, 14 Feb 2022 03:21:25 +0000
Received: ("Tessian outbound 18e50a6f0513:v113");
 Mon, 14 Feb 2022 03:21:25 +0000
Received: from a94bf39b6601.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0AD5F8ED-0BA1-4D6E-B331-2C86B46ECDC7.1; 
 Mon, 14 Feb 2022 03:21:20 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a94bf39b6601.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 14 Feb 2022 03:21:20 +0000
Received: from AS9PR06CA0346.eurprd06.prod.outlook.com (2603:10a6:20b:466::21)
 by DB7PR08MB3562.eurprd08.prod.outlook.com (2603:10a6:10:49::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.17; Mon, 14 Feb
 2022 03:21:16 +0000
Received: from AM5EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:466:cafe::d8) by AS9PR06CA0346.outlook.office365.com
 (2603:10a6:20b:466::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11 via Frontend
 Transport; Mon, 14 Feb 2022 03:21:16 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT025.mail.protection.outlook.com (10.152.16.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Mon, 14 Feb 2022 03:21:16 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Mon, 14 Feb
 2022 03:21:20 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.20; Mon, 14
 Feb 2022 03:21:13 +0000
Received: from penny.shanghai.arm.com (10.169.188.91) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.20 via Frontend
 Transport; Mon, 14 Feb 2022 03:21:17 +0000
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
X-Inumbo-ID: 32e1864c-8d45-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4kFUJ81gEGlN2jJY6+KgXNfmBvm2zTX0lMR9H45QEE0=;
 b=OMyfBVeJ4v0lLibhhiVg66fAdRLYWbtBU1bJJt4xOkxrNSRORYmBDDHZZniEIwdg91HfNd0rvwIhxV9dXz1l8dkQEgrbWiVGeTx7mKzGJZpvFclzn5wan64BdQEsgdpRZbJIUtopKquHi5FZjWRsKvBG94drv8RAvXohPW06VGI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 24731f0ab9f456f4
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WSKSTuDiA7WiywnMS9DKIQ1JhwGd0u3xN6ACqVX11Nabfq2wmRIKL7CiR3ydlHSr2a9hLnF4sce9tVDFGOTzANvwT5P36GW6hPZIQkcsaeb5Jx6Mb9q1M05/sfOhkQc8gPzGKiRHj9Edz6Sb4wcjMSUeY/lt5ZS3GAMwfdQObk5aAZF/z3j6NVMASzfE5NA155htreTZQTOh1gcE0uQyrq0BYEh/LnAt5KmpuQ+xqYvfcOzQgy4UF2ZrLlEpG1MRfFL+zbCgEX97O8ERD26DvIch/i9LsvqihpNcwkWgsWVrXfwIKERibbDn4gkMnLX6lNn5ond6jvOv9E+XKOVR3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4kFUJ81gEGlN2jJY6+KgXNfmBvm2zTX0lMR9H45QEE0=;
 b=Nqt05MXXkPXMK7MoPxPniucxKr8XxaOtYi5nWJxGjM1gr22HgGbzQ2SBzetAXslSQvnExsMpqnSF5lO0R89CfCB0wUaVUBP1eKzw2c1Vzpirj/R2TeBMzLkNPoGvzyjRzRVDk9/925eFxss3K/xKJ+EL+IO5nWXIDT3vE+sWtQkSd9rGKT182Cbv8N+M4lI04LfZayHs3Mqbo9AMHuRquxlf1Xs5pgkjpc6gl4hYM/UFy9qVLsGbKraZ1oxKVXv3WpV5C4GNNNgEOl3ojstwz6Yx3iy746ltEKs0bJaYpIlf3kTUdmKch4tybNqyjrNxgDuoq/efuq+P1Ty/IiiA8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4kFUJ81gEGlN2jJY6+KgXNfmBvm2zTX0lMR9H45QEE0=;
 b=OMyfBVeJ4v0lLibhhiVg66fAdRLYWbtBU1bJJt4xOkxrNSRORYmBDDHZZniEIwdg91HfNd0rvwIhxV9dXz1l8dkQEgrbWiVGeTx7mKzGJZpvFclzn5wan64BdQEsgdpRZbJIUtopKquHi5FZjWRsKvBG94drv8RAvXohPW06VGI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Penny Zheng <penny.zheng@arm.com>
To: <xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>,
	<julien@xen.org>
CC: <Bertrand.Marquis@arm.com>, <Wei.Chen@arm.com>
Subject: [PATCH v6 10/11] xen/arm: if direct-map domain use native UART address and IRQ number for vPL011
Date: Mon, 14 Feb 2022 03:19:55 +0000
Message-ID: <20220214031956.3726764-11-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220214031956.3726764-1-penny.zheng@arm.com>
References: <20220214031956.3726764-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 94b0662e-c6ea-42fc-1f8c-08d9ef69155d
X-MS-TrafficTypeDiagnostic:
	DB7PR08MB3562:EE_|AM5EUR03FT060:EE_|VE1PR08MB5758:EE_
X-Microsoft-Antispam-PRVS:
	<VE1PR08MB5758BEABFF0E9225CF258078F7339@VE1PR08MB5758.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 sBCdoNosfDED/Eg6m3/bqEFGqIyfnudxpRSwSBAmhQYT8Csy70df4B6boVHxEsCMrbX8jjxMEPm3VbheAD3QA1it9qECcEhkkCMt8mt5hrPKC9+mtdmF5KJBYbR/q2Xwc9swnFIdqvmSd/kWwjQmv2JrKNAfBqR7sc3tfSghNcr1M6YaRg5C0DVDP/StaKHHfM0efUnXY2KsUcSAAZP0OFpUKD92oZxBWmQ4FxkH51LZxH7DoRp0PeKBc+ql9CYiUZpw1j2Vyd49R7uS4MvJrZMswtKLliVXNZs5C17HeVMB+LLTFsLjNgUhCFeLYROdSmtmyDDwy4uKlOhEufPcbMcRI6byKQCn/AcJmwOGVasXQiyDsucfd9H7L0kJtOwVMH7v2EIR74Z+F/HDM2xGe9wMJqNsmIvO3atsaxkavzYBMddY8R1YNv8iu6dBbLAAsv7pvVNMpH1DURV9K41QWp2IvGg0CHZCpXC6kyFo/1Jq7ap+ffjSUnzp6x+7ZFkNdYxSZsp05oyKodlU9NT089FZ+umj7gM2t9vk2sRspkqEO9DmgiMGtat+WczfPphPPDtMq/bX3l7IzCSK+ncPPxdeFlM50RBp+sXkAoHJZ9FddhCsjg36C+KIEKjuCLVeRZbwf4MaUyIfGKsFcPCwnSg634lSRTDffWXIvxB974HeMQmWZ795NHak1WlPvyQF
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(54906003)(2616005)(44832011)(36860700001)(1076003)(82310400004)(186003)(36756003)(26005)(110136005)(47076005)(86362001)(316002)(2906002)(5660300002)(70206006)(8936002)(4326008)(8676002)(83380400001)(7696005)(336012)(508600001)(81166007)(70586007)(6666004)(426003)(356005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3562
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a5bcebf9-9b26-4cc6-244c-08d9ef690fd2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	kIPJV7+Eo0n9QfbJ0cJuwXTNW+K5hFM37aPbLo0eaWho8R+uDSABCf9fkCLlFSlQvQuvjoe3zpzemr6JU0LNB26Rd8kpkIg902+YnCTQL9VVBo9uzNRGoubg9sNzfIRqjwHAXNNnOw43s2sKgXotSi4O8lOqAog6fU2Q53X4vm8yLWYpXPVmhscJhNmGwZZKxv3osRE6SI2cE5HNQUjDpUmcfM03ZhOZr9gSavZzq5LaGeTFoo7nA+4LVns/cH0JNiBe3NKpEtl2ND88AJOQ543i/Hi4zKARlgICZW/byHr47SX+Zwbo4Pt7MDXx9Wnz30Ji+6X3DFk3ZDJLrak+jm+HMa6YQGHKeES4dpMhNbd24a78InQcMkL7LSpic62BOxRlMZejSFtK9YwwIxUrjZNnVYZ4qYdd6Q80QbC67qD3mq3AJtCbHtmM5JIiMXoBpqIqqxQ7SuPYoZig+BTgOjk0A7pH/yZ7Ig/tX0papKiuWfav61Y5yt31T+KcB7rkoKTuzppFQPzN0XFmkJ9jv5J3yYrbjGGXjRyhmOdl4H1VtILiG0JbIgnFAxy+HQUbX0gimt6rcFkbk114TXARUNqjh4f/jooL4w8G8TOyL6lNdTwg7QN1uKHhcXh0jyUo8xFAwuDlDl9p9C/ok3ZqG9SHUkBVKE3Gbp9YRio2YLveV5Xr31KJLRODjvCTHH3Q
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(70206006)(316002)(508600001)(70586007)(2906002)(82310400004)(54906003)(110136005)(4326008)(5660300002)(8676002)(86362001)(44832011)(8936002)(47076005)(81166007)(7696005)(1076003)(83380400001)(36756003)(186003)(426003)(6666004)(36860700001)(2616005)(26005)(336012)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 03:21:25.8039
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 94b0662e-c6ea-42fc-1f8c-08d9ef69155d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5758

From: Stefano Stabellini <sstabellini@kernel.org>

We always use a fix address to map the vPL011 to domains. The address
could be a problem for direct-map domains.

So, for domains that are directly mapped, reuse the address of the
physical UART on the platform to avoid potential clashes.

Do the same for the virtual IRQ number: instead of always using
GUEST_VPL011_SPI, try to reuse the physical SPI number if possible.

Signed-off-by: Stefano Stabellini <sstabellini@kernel.org>
Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
Tested-by: Stefano Stabellini <sstabellini@kernel.org>
---
v2 changes:
- explain why vpl011 initialization before creating its device tree node
- error out if the domain is direct-mapped and the IRQ is not found
- harden the code and add a check/comment when the hardware UART region
is smaller than GUEST_VPL011_SIZE.
---
v3 changes:
- explain how the '27' was found for 'buf'
- fix checking before dereferencing
- refine comment message
---
v4 changes:
- refine comment message
---
v5 changes:
- nothing changed
---
v6 changes:
- nothing changed
---
 xen/arch/arm/domain_build.c       | 44 +++++++++++++++++++----
 xen/arch/arm/include/asm/vpl011.h |  2 ++
 xen/arch/arm/vpl011.c             | 60 +++++++++++++++++++++++++++----
 3 files changed, 92 insertions(+), 14 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index cff2cb93cc..8be01678de 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -30,6 +30,7 @@
 
 #include <xen/irq.h>
 #include <xen/grant_table.h>
+#include <xen/serial.h>
 
 static unsigned int __initdata opt_dom0_max_vcpus;
 integer_param("dom0_max_vcpus", opt_dom0_max_vcpus);
@@ -2415,8 +2416,12 @@ static int __init make_vpl011_uart_node(struct kernel_info *kinfo)
     gic_interrupt_t intr;
     __be32 reg[GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS];
     __be32 *cells;
+    struct domain *d = kinfo->d;
+    /* Placeholder for sbsa-uart@ + a 64-bit number + \0 */
+    char buf[27];
 
-    res = fdt_begin_node(fdt, "sbsa-uart@"__stringify(GUEST_PL011_BASE));
+    snprintf(buf, sizeof(buf), "sbsa-uart@%"PRIx64, d->arch.vpl011.base_addr);
+    res = fdt_begin_node(fdt, buf);
     if ( res )
         return res;
 
@@ -2426,14 +2431,14 @@ static int __init make_vpl011_uart_node(struct kernel_info *kinfo)
 
     cells = &reg[0];
     dt_child_set_range(&cells, GUEST_ROOT_ADDRESS_CELLS,
-                       GUEST_ROOT_SIZE_CELLS, GUEST_PL011_BASE,
+                       GUEST_ROOT_SIZE_CELLS, d->arch.vpl011.base_addr,
                        GUEST_PL011_SIZE);
 
     res = fdt_property(fdt, "reg", reg, sizeof(reg));
     if ( res )
         return res;
 
-    set_interrupt(intr, GUEST_VPL011_SPI, 0xf, DT_IRQ_TYPE_LEVEL_HIGH);
+    set_interrupt(intr, d->arch.vpl011.virq, 0xf, DT_IRQ_TYPE_LEVEL_HIGH);
 
     res = fdt_property(fdt, "interrupts", intr, sizeof (intr));
     if ( res )
@@ -3145,6 +3150,14 @@ static int __init construct_domU(struct domain *d,
     else
         assign_static_memory_11(d, &kinfo, node);
 
+    /*
+     * Base address and irq number are needed when creating vpl011 device
+     * tree node in prepare_dtb_domU, so initialization on related variables
+     * shall be done first.
+     */
+    if ( kinfo.vpl011 )
+        rc = domain_vpl011_init(d, NULL);
+
     rc = prepare_dtb_domU(d, &kinfo);
     if ( rc < 0 )
         return rc;
@@ -3153,9 +3166,6 @@ static int __init construct_domU(struct domain *d,
     if ( rc < 0 )
         return rc;
 
-    if ( kinfo.vpl011 )
-        rc = domain_vpl011_init(d, NULL);
-
     return rc;
 }
 
@@ -3200,15 +3210,35 @@ void __init create_domUs(void)
 
         if ( !dt_property_read_u32(node, "nr_spis", &d_cfg.arch.nr_spis) )
         {
+            unsigned int vpl011_virq = GUEST_VPL011_SPI;
+
             d_cfg.arch.nr_spis = gic_number_lines() - 32;
 
+            /*
+             * The VPL011 virq is GUEST_VPL011_SPI, unless direct-map is
+             * set, in which case it'll match the hardware.
+             *
+             * Since the domain is not yet created, we can't use
+             * d->arch.vpl011.irq. So the logic to find the vIRQ has to
+             * be hardcoded.
+             * The logic here shall be consistent with the one in
+             * domain_vpl011_init().
+             */
+            if ( flags & CDF_directmap )
+            {
+                vpl011_virq = serial_irq(SERHND_DTUART);
+                if ( vpl011_virq < 0 )
+                    panic("Error getting IRQ number for this serial port %d\n",
+                          SERHND_DTUART);
+            }
+
             /*
              * vpl011 uses one emulated SPI. If vpl011 is requested, make
              * sure that we allocate enough SPIs for it.
              */
             if ( dt_property_read_bool(node, "vpl011") )
                 d_cfg.arch.nr_spis = MAX(d_cfg.arch.nr_spis,
-                                         GUEST_VPL011_SPI - 32 + 1);
+                                         vpl011_virq - 32 + 1);
         }
 
         /*
diff --git a/xen/arch/arm/include/asm/vpl011.h b/xen/arch/arm/include/asm/vpl011.h
index e6c7ab7381..c09abcd7a9 100644
--- a/xen/arch/arm/include/asm/vpl011.h
+++ b/xen/arch/arm/include/asm/vpl011.h
@@ -53,6 +53,8 @@ struct vpl011 {
     uint32_t    uarticr;        /* Interrupt clear register */
     uint32_t    uartris;        /* Raw interrupt status register */
     uint32_t    shadow_uartmis; /* shadow masked interrupt register */
+    paddr_t     base_addr;
+    unsigned int virq;
     spinlock_t  lock;
     evtchn_port_t evtchn;
 };
diff --git a/xen/arch/arm/vpl011.c b/xen/arch/arm/vpl011.c
index 895f436cc4..43522d48fd 100644
--- a/xen/arch/arm/vpl011.c
+++ b/xen/arch/arm/vpl011.c
@@ -29,6 +29,7 @@
 #include <xen/mm.h>
 #include <xen/sched.h>
 #include <xen/console.h>
+#include <xen/serial.h>
 #include <public/domctl.h>
 #include <public/io/console.h>
 #include <asm/pl011-uart.h>
@@ -71,11 +72,11 @@ static void vpl011_update_interrupt_status(struct domain *d)
      * status bit has been set since the last time.
      */
     if ( uartmis & ~vpl011->shadow_uartmis )
-        vgic_inject_irq(d, NULL, GUEST_VPL011_SPI, true);
+        vgic_inject_irq(d, NULL, vpl011->virq, true);
 
     vpl011->shadow_uartmis = uartmis;
 #else
-    vgic_inject_irq(d, NULL, GUEST_VPL011_SPI, uartmis);
+    vgic_inject_irq(d, NULL, vpl011->virq, uartmis);
 #endif
 }
 
@@ -347,7 +348,8 @@ static int vpl011_mmio_read(struct vcpu *v,
                             void *priv)
 {
     struct hsr_dabt dabt = info->dabt;
-    uint32_t vpl011_reg = (uint32_t)(info->gpa - GUEST_PL011_BASE);
+    uint32_t vpl011_reg = (uint32_t)(info->gpa -
+                                     v->domain->arch.vpl011.base_addr);
     struct vpl011 *vpl011 = &v->domain->arch.vpl011;
     struct domain *d = v->domain;
     unsigned long flags;
@@ -430,7 +432,8 @@ static int vpl011_mmio_write(struct vcpu *v,
                              void *priv)
 {
     struct hsr_dabt dabt = info->dabt;
-    uint32_t vpl011_reg = (uint32_t)(info->gpa - GUEST_PL011_BASE);
+    uint32_t vpl011_reg = (uint32_t)(info->gpa -
+                                     v->domain->arch.vpl011.base_addr);
     struct vpl011 *vpl011 = &v->domain->arch.vpl011;
     struct domain *d = v->domain;
     unsigned long flags;
@@ -626,6 +629,49 @@ int domain_vpl011_init(struct domain *d, struct vpl011_init_info *info)
     if ( vpl011->backend.dom.ring_buf )
         return -EINVAL;
 
+    /*
+     * The VPL011 virq is GUEST_VPL011_SPI, except for direct-map domains
+     * where the hardware value shall be used.
+     * The logic here should stay in sync with the one in
+     * create_domUs().
+     */
+    if ( is_domain_direct_mapped(d) )
+    {
+        const struct vuart_info *uart = serial_vuart_info(SERHND_DTUART);
+        int vpl011_irq = serial_irq(SERHND_DTUART);
+
+        if ( (uart != NULL) && (vpl011_irq > 0) )
+        {
+            vpl011->base_addr = uart->base_addr;
+            vpl011->virq = vpl011_irq;
+        }
+        else
+        {
+            printk(XENLOG_ERR
+                   "vpl011: Unable to re-use the Xen UART information.\n");
+            return -EINVAL;
+        }
+
+        /*
+         * Since the PL011 we emulate for the guest requires a 4KB region,
+         * and on some Hardware (e.g. on some sunxi SoC), the UART MMIO
+         * region is less than 4KB, in which case, there may exist multiple
+         * devices within the same 4KB region, here adds the following check to
+         * prevent potential known pitfalls
+         */
+        if ( uart->size < GUEST_PL011_SIZE )
+        {
+            printk(XENLOG_ERR
+                   "vpl011: Can't re-use the Xen UART MMIO region as it is too small.\n");
+            return -EINVAL;
+        }
+    }
+    else
+    {
+        vpl011->base_addr = GUEST_PL011_BASE;
+        vpl011->virq = GUEST_VPL011_SPI;
+    }
+
     /*
      * info is NULL when the backend is in Xen.
      * info is != NULL when the backend is in a domain.
@@ -661,7 +707,7 @@ int domain_vpl011_init(struct domain *d, struct vpl011_init_info *info)
         }
     }
 
-    rc = vgic_reserve_virq(d, GUEST_VPL011_SPI);
+    rc = vgic_reserve_virq(d, vpl011->virq);
     if ( !rc )
     {
         rc = -EINVAL;
@@ -673,12 +719,12 @@ int domain_vpl011_init(struct domain *d, struct vpl011_init_info *info)
     spin_lock_init(&vpl011->lock);
 
     register_mmio_handler(d, &vpl011_mmio_handler,
-                          GUEST_PL011_BASE, GUEST_PL011_SIZE, NULL);
+                          vpl011->base_addr, GUEST_PL011_SIZE, NULL);
 
     return 0;
 
 out2:
-    vgic_free_virq(d, GUEST_VPL011_SPI);
+    vgic_free_virq(d, vpl011->virq);
 
 out1:
     if ( vpl011->backend_in_domain )
-- 
2.25.1


