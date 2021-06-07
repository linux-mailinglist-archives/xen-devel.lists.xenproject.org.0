Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C7FB39D30F
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jun 2021 04:44:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.137540.254893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lq5FH-0004QK-9I; Mon, 07 Jun 2021 02:44:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 137540.254893; Mon, 07 Jun 2021 02:44:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lq5FH-0004NV-4w; Mon, 07 Jun 2021 02:44:07 +0000
Received: by outflank-mailman (input) for mailman id 137540;
 Mon, 07 Jun 2021 02:44:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MAL7=LB=arm.com=penny.zheng@srs-us1.protection.inumbo.net>)
 id 1lq5FG-0003IQ-1c
 for xen-devel@lists.xenproject.org; Mon, 07 Jun 2021 02:44:06 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.71]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1b257ead-462c-4549-b0c5-e09e4d61eec7;
 Mon, 07 Jun 2021 02:44:02 +0000 (UTC)
Received: from PR2P264CA0045.FRAP264.PROD.OUTLOOK.COM (2603:10a6:101:1::33) by
 AM9PR08MB6211.eurprd08.prod.outlook.com (2603:10a6:20b:2de::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22; Mon, 7 Jun
 2021 02:43:56 +0000
Received: from VE1EUR03FT056.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:101:1:cafe::69) by PR2P264CA0045.outlook.office365.com
 (2603:10a6:101:1::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.15 via Frontend
 Transport; Mon, 7 Jun 2021 02:43:56 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT056.mail.protection.outlook.com (10.152.19.28) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.21 via Frontend Transport; Mon, 7 Jun 2021 02:43:56 +0000
Received: ("Tessian outbound bf434e582664:v93");
 Mon, 07 Jun 2021 02:43:56 +0000
Received: from 99d96216c950.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 12EA9111-7FA4-470D-94E8-3C8E040EBF66.1; 
 Mon, 07 Jun 2021 02:43:50 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 99d96216c950.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 07 Jun 2021 02:43:50 +0000
Received: from DB6PR07CA0157.eurprd07.prod.outlook.com (2603:10a6:6:43::11) by
 PA4PR08MB6255.eurprd08.prod.outlook.com (2603:10a6:102:f1::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.22; Mon, 7 Jun 2021 02:43:49 +0000
Received: from DB5EUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:43:cafe::9) by DB6PR07CA0157.outlook.office365.com
 (2603:10a6:6:43::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.11 via Frontend
 Transport; Mon, 7 Jun 2021 02:43:49 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT042.mail.protection.outlook.com (10.152.21.123) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4195.21 via Frontend Transport; Mon, 7 Jun 2021 02:43:49 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Mon, 7 Jun
 2021 02:43:47 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2176.14 via Frontend
 Transport; Mon, 7 Jun 2021 02:43:45 +0000
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
X-Inumbo-ID: 1b257ead-462c-4549-b0c5-e09e4d61eec7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1pQ5ZYSIi8AeHiMoc+JqHBOk6Ajg45oD8n/vlgw9XyM=;
 b=wPpwC0p1EDoBhTPIPznNVFrBMR3CwEE1sy7kSnYsHMt6smxb4yxzHriPGaav0rjw+gIv8mKtkY9A9xSmjLWXd5wpGlReo8UgdhduW90LZAbNBUfVJjJKVascbgJfLktgDUVNcjasEneALaNSSuurjqyBMv2r0dGvuKMCIAUuV6o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: eca746ad0a4f5db5
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=auQr5+Hw8bVa50IMqI76MdGxrxH7fBhq5+mqE6MP8hhFXIzs71vGdIm4yas3v40DEw1zdAdlca7lbTrTLpc6ZI/6DpNzcgiHBr2xfDRaLMoSfuh8jUBJXWrtCyyrsO9bOpeSQMGZFFL7R4KlriVeHMn6IWPDtAGIpo2z4rGPa1VILH9NOkxP3ykaRQZUtBwrQWQvBLOvdIObBmvBIktU6WNKgdlBbH7KBRiLG+QqBh6g0X/p0tirnP5pxC4M56kXJm46zi/qw4qVYgdisrR//lu9bG5Y1bwQturXJgYlzBvQl2apuKxjCGkrrWHobagWHB5E9Ypg/WhfJ51vWb40kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1pQ5ZYSIi8AeHiMoc+JqHBOk6Ajg45oD8n/vlgw9XyM=;
 b=XUMNC1gDAdLNBmsvr6PjXFeKV4S1I9YBMl1oiHTN1B7BD8gBdzCUtR05cwb4J1IGHDxk6mt/xgFdxDIuVBNu8VlJk3gqYkWpHfJrfCOSL40FheaFEpGxnrUj74z4/lqHmdkQDiiKYy1i8hX3179azDJqKE6bD2CXmYlxkLKQLlGeHGnfNBhtD8BZqE13CRvdBS5DYPs+agGcmX3EhDFlKibZ/jlfOZSe9yYv3DHI7vy+NwPovjpICFbkGa9gzocYfoq2pZuIxeP8x8WpnnXJJh8AdmrKgheKMRm8+VZ1L6sCte9aLtogtARyoB4Rlwc9lJ6XY5Ue5WtPFpv0/T8OSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1pQ5ZYSIi8AeHiMoc+JqHBOk6Ajg45oD8n/vlgw9XyM=;
 b=wPpwC0p1EDoBhTPIPznNVFrBMR3CwEE1sy7kSnYsHMt6smxb4yxzHriPGaav0rjw+gIv8mKtkY9A9xSmjLWXd5wpGlReo8UgdhduW90LZAbNBUfVJjJKVascbgJfLktgDUVNcjasEneALaNSSuurjqyBMv2r0dGvuKMCIAUuV6o=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Penny Zheng <penny.zheng@arm.com>
To: <xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>,
	<julien@xen.org>, <jbeulich@suse.com>
CC: <Bertrand.Marquis@arm.com>, <Penny.Zheng@arm.com>, <Wei.Chen@arm.com>
Subject: [PATCH 4/9] xen/arm: static memory initialization
Date: Mon, 7 Jun 2021 02:43:13 +0000
Message-ID: <20210607024318.3988467-5-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210607024318.3988467-1-penny.zheng@arm.com>
References: <20210607024318.3988467-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e7659ad6-78e9-4fb7-b9c9-08d9295e1896
X-MS-TrafficTypeDiagnostic: PA4PR08MB6255:|AM9PR08MB6211:
X-Microsoft-Antispam-PRVS:
	<AM9PR08MB621131DBC25F3B66867BFE29F7389@AM9PR08MB6211.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:409;OLM:409;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ConVpp4M6/fpTn6TFFXfhR5JCHasFD5yOr7RBESrZoNx/Hy/a7hW/HeDYzMWBkiBI3yZzWOHkPpD2noFvPnhnrAvM+t6u1VhuM6RXUhZJhx2NDqC7sd1yY29moWCtq7Z8KG+9mjwffmW9rUHoo25nv/QU5CUTEOrIx78NfX+MQxiNVo9hU25eHuc6VX9V4RhpLmewuUQMU7Z9uKC5m0MNHGllLAAkV7BQujAcgVhLNtJXfLdWTtOGFAlZnq0YjLxyTkHw/bUQUGBh6YxKCJNBmrEBVC9o0yLgYfMQPEwBIZnmfHuJSBAomiVHd9ay86uPayRVPU/UKEYKJEMeJvK+xsEg5i1I1swe7PnGRhQ8qGzdZ6bwkaEqAYOjQWWqsttNqNVU9be9/571OaXn3u4xEDRkkXJ+XQC6im+vKy+Sz4MivggClVIhUT4wmu+/2UTmhUtVBQhZob2ai/6nSm0UPaLp0OiUGt9N7/s8etEs4G1QDhtJbMtKFSwR8il5aa/hgiU9IGkmQLkkvVhW5TF3IAcY874vlp5nKg1uhDrwxyhBGwCxXYP52/WiyGkYd3lJu7bVF8MW6KXqmljthzfuY+KJpmsjz/6pFt2y18VcAgEJHgTzygM4AliVfgg2/QqhK81WVHarZ9n/JwZFiee/DJSyODJF7mtwJNubSC0hTgEGsD/hGqbS0TVhMfniBMRYkrclrMCSyAJfeuGJLwGnA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(39860400002)(136003)(46966006)(36840700001)(44832011)(7696005)(70206006)(5660300002)(83380400001)(426003)(82310400003)(81166007)(70586007)(26005)(356005)(36756003)(47076005)(2616005)(82740400003)(1076003)(110136005)(54906003)(8676002)(478600001)(6666004)(36860700001)(8936002)(2906002)(316002)(336012)(86362001)(4326008)(186003)(36900700001)(2101003);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6255
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d95f0018-13fa-43d6-8618-08d9295e1414
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	zXeFbB4BmLfvcf67Q/bizRPdn0b38fuO5dKqg5v4BmNJonun0t+/kBILcG2yZkEz+WXvFqxVAXd5lYdlyzr7kW7UWGLACOuXxtqRNoKeDjsYxl8dNFH9IrSnJMvKzT2BaohNfSeQiG/tONUE8nyLG5soeozd5uwXsSzpVoORASvYcFlSr9suR1etmlpmmh8zjlqxwhkKbhPooRyjpN78ArUQfiQagtyWsGgwjhFXZDZPLexfiA5BLM0VctFMJxLuxKy6S8WXHuvJOUttz0gkQnHoMOT30mtGwQaufFeui3NZcnMAQUNPIpwGrhNn7v/sMJ2/PnhbzMq/7+rDYmzQGlBJ04o6L/tH72ruw2Ym7oIVXp1hMzDmyBK7THTwImk6Fh59csA6Pp5acj+RPUqycOuqqZYR8aMA0lYZCo9LKv99dT8wRxZKWgY/ZsQptGUOFYHXoaUMWphNlCXuV4HSF1KAfZRy2PLXomliIlkSYWGCz7A31woxFNuQ2svY9QNuDLjXCATwkFGv5D5ZxTZCdM3nqYUTCWIZktzkuKUmWHSNg8og7At88rhCKHBRYJiFWvjOzY0jUHKwxuaUR7Ra7SsL5UwJTDYYnFIYHgHeipmcQ8AQk0igGrGh0LS+LvWUDqpFz9xSQiXFjoY2Sf04T5OmVBan+pYAYDht2JK/DYcxwPXIgNs8Swjn87Z07ozY
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(346002)(39860400002)(376002)(136003)(36840700001)(46966006)(44832011)(7696005)(70206006)(5660300002)(83380400001)(426003)(1076003)(70586007)(26005)(36756003)(47076005)(186003)(2616005)(82310400003)(81166007)(82740400003)(110136005)(54906003)(316002)(336012)(8676002)(478600001)(6666004)(36860700001)(8936002)(2906002)(86362001)(4326008)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2021 02:43:56.4512
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7659ad6-78e9-4fb7-b9c9-08d9295e1896
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6211

This patch introduces static memory initialization, during system RAM boot up.

New func init_staticmem_pages is responsible for static memory initialization.

Helper free_staticmem_pages is the equivalent of free_heap_pages, to free
nr_mfns pages of static memory.

This commit defines a new helper free_page to extract common code between
free_heap_pages and free_staticmem_pages, like following the same cache/TLB
coherency policy.

For each page, free_staticmem_pages includes the following extra steps to
initialize:
1. change page state from inuse to free state and grant PGC_reserved.
2. scrub the page in need synchronously.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
changes v2:
- rename to nr_mfns
- extract common code from free_heap_pages and free_staticmem_pages
- remove dead codes in other archs, including move some to arm-specific file,
and put some under CONFIG_ARM
- mark free_staticmem_pages __init
---
 xen/arch/arm/setup.c    | 27 ++++++++++++++
 xen/common/page_alloc.c | 78 +++++++++++++++++++++++++++++++++--------
 xen/include/xen/mm.h    |  6 ++++
 3 files changed, 97 insertions(+), 14 deletions(-)

diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 00aad1c194..daafea0abb 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -611,6 +611,30 @@ static void __init init_pdx(void)
     }
 }
 
+/* Static memory initialization */
+static void __init init_staticmem_pages(void)
+{
+    int bank;
+
+    /*
+     * TODO: Considering NUMA-support scenario.
+     */
+    for ( bank = 0 ; bank < bootinfo.static_mem.nr_banks; bank++ )
+    {
+        paddr_t bank_start = bootinfo.static_mem.bank[bank].start;
+        paddr_t bank_size = bootinfo.static_mem.bank[bank].size;
+        paddr_t bank_end = bank_start + bank_size;
+
+        bank_start = round_pgup(bank_start);
+        bank_end = round_pgdown(bank_end);
+        if ( bank_end <= bank_start )
+            return;
+
+        free_staticmem_pages(maddr_to_page(bank_start),
+                            (bank_end - bank_start) >> PAGE_SHIFT, false);
+    }
+}
+
 #ifdef CONFIG_ARM_32
 static void __init setup_mm(void)
 {
@@ -872,6 +896,9 @@ void __init start_xen(unsigned long boot_phys_offset,
     cmdline_parse(cmdline);
 
     setup_mm();
+    /* If exists, Static Memory Initialization. */
+    if ( bootinfo.static_mem.nr_banks > 0 )
+        init_staticmem_pages();
 
     /* Parse the ACPI tables for possible boot-time configuration */
     acpi_boot_table_init();
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 958ba0cd92..8c00262c04 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -1376,6 +1376,37 @@ bool scrub_free_pages(void)
     return node_to_scrub(false) != NUMA_NO_NODE;
 }
 
+static void free_page(struct page_info *pg, bool need_scrub)
+{
+    mfn_t mfn = page_to_mfn(pg);
+
+    /* If a page has no owner it will need no safety TLB flush. */
+    pg->u.free.need_tlbflush = (page_get_owner(pg) != NULL);
+    if ( pg->u.free.need_tlbflush )
+        page_set_tlbflush_timestamp(pg);
+
+    /* This page is not a guest frame any more. */
+    page_set_owner(pg, NULL); /* set_gpfn_from_mfn snoops pg owner */
+    set_gpfn_from_mfn(mfn_x(mfn), INVALID_M2P_ENTRY);
+
+#ifdef CONFIG_ARM
+    if ( pg->count_info & PGC_reserved )
+    {
+        /* TODO: asynchronous scrubbing. */
+        if ( need_scrub )
+            scrub_one_page(pg);
+        return;
+    }
+#endif
+    if ( need_scrub )
+    {
+        pg->count_info |= PGC_need_scrub;
+        poison_one_page(pg);
+    }
+
+    return;
+}
+
 /* Free 2^@order set of pages. */
 static void free_heap_pages(
     struct page_info *pg, unsigned int order, bool need_scrub)
@@ -1425,20 +1456,7 @@ static void free_heap_pages(
             BUG();
         }
 
-        /* If a page has no owner it will need no safety TLB flush. */
-        pg[i].u.free.need_tlbflush = (page_get_owner(&pg[i]) != NULL);
-        if ( pg[i].u.free.need_tlbflush )
-            page_set_tlbflush_timestamp(&pg[i]);
-
-        /* This page is not a guest frame any more. */
-        page_set_owner(&pg[i], NULL); /* set_gpfn_from_mfn snoops pg owner */
-        set_gpfn_from_mfn(mfn_x(mfn) + i, INVALID_M2P_ENTRY);
-
-        if ( need_scrub )
-        {
-            pg[i].count_info |= PGC_need_scrub;
-            poison_one_page(&pg[i]);
-        }
+        free_page(&pg[i], need_scrub);
     }
 
     avail[node][zone] += 1 << order;
@@ -1512,6 +1530,38 @@ static void free_heap_pages(
     spin_unlock(&heap_lock);
 }
 
+#ifdef CONFIG_STATIC_ALLOCATION
+/* Equivalent of free_heap_pages to free nr_mfns pages of static memory. */
+void __init free_staticmem_pages(struct page_info *pg, unsigned long nr_mfns,
+                                 bool need_scrub)
+{
+    mfn_t mfn = page_to_mfn(pg);
+    unsigned long i;
+
+    for ( i = 0; i < nr_mfns; i++ )
+    {
+        switch ( pg[i].count_info & PGC_state )
+        {
+        case PGC_state_inuse:
+            BUG_ON(pg[i].count_info & PGC_broken);
+            /* Mark it free and reserved. */
+            pg[i].count_info = PGC_state_free | PGC_reserved;
+            break;
+
+        default:
+            printk(XENLOG_ERR
+                   "Page state shall be only in PGC_state_inuse. "
+                   "pg[%lu] MFN %"PRI_mfn" count_info=%#lx tlbflush_timestamp=%#x.\n",
+                   i, mfn_x(mfn) + i,
+                   pg[i].count_info,
+                   pg[i].tlbflush_timestamp);
+            BUG();
+        }
+
+        free_page(&pg[i], need_scrub);
+    }
+}
+#endif
 
 /*
  * Following rules applied for page offline:
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index 667f9dac83..df25e55966 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -85,6 +85,12 @@ bool scrub_free_pages(void);
 } while ( false )
 #define FREE_XENHEAP_PAGE(p) FREE_XENHEAP_PAGES(p, 0)
 
+#ifdef CONFIG_ARM
+/* Static Allocation */
+void free_staticmem_pages(struct page_info *pg, unsigned long nr_mfns,
+                          bool need_scrub);
+#endif
+
 /* Map machine page range in Xen virtual address space. */
 int map_pages_to_xen(
     unsigned long virt,
-- 
2.25.1


