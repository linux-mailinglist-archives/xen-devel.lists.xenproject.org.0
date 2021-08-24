Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A30303F5B5C
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 11:52:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.170782.311741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIT5p-0003EO-AD; Tue, 24 Aug 2021 09:51:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 170782.311741; Tue, 24 Aug 2021 09:51:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIT5p-0003BV-4Q; Tue, 24 Aug 2021 09:51:41 +0000
Received: by outflank-mailman (input) for mailman id 170782;
 Tue, 24 Aug 2021 09:51:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jFgo=NP=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1mIT5n-0002Tu-RN
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 09:51:39 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.47]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 418e4ad9-99d2-4efc-868e-5257f7469a34;
 Tue, 24 Aug 2021 09:51:37 +0000 (UTC)
Received: from AM5PR0601CA0045.eurprd06.prod.outlook.com
 (2603:10a6:203:68::31) by AM5PR0801MB1923.eurprd08.prod.outlook.com
 (2603:10a6:203:4c::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Tue, 24 Aug
 2021 09:51:25 +0000
Received: from AM5EUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:68:cafe::6d) by AM5PR0601CA0045.outlook.office365.com
 (2603:10a6:203:68::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Tue, 24 Aug 2021 09:51:25 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT027.mail.protection.outlook.com (10.152.16.138) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 09:51:25 +0000
Received: ("Tessian outbound 19a632698c93:v103");
 Tue, 24 Aug 2021 09:51:25 +0000
Received: from e619e60a2b94.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 25436489-2F15-4110-B2B4-DE307DDF86E3.1; 
 Tue, 24 Aug 2021 09:51:19 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e619e60a2b94.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 24 Aug 2021 09:51:19 +0000
Received: from AM5PR0201CA0016.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::26) by AS8PR08MB6198.eurprd08.prod.outlook.com
 (2603:10a6:20b:29f::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Tue, 24 Aug
 2021 09:51:17 +0000
Received: from VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:3d:cafe::b3) by AM5PR0201CA0016.outlook.office365.com
 (2603:10a6:203:3d::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend
 Transport; Tue, 24 Aug 2021 09:51:17 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT044.mail.protection.outlook.com (10.152.19.106) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 09:51:17 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.14; Tue, 24 Aug
 2021 09:51:16 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 24
 Aug 2021 09:51:13 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Tue, 24 Aug 2021 09:51:13 +0000
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
X-Inumbo-ID: 418e4ad9-99d2-4efc-868e-5257f7469a34
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zA8vK69jWi9elV7ywSF5xfDQGg45S54vXFg9HWwKfbA=;
 b=nMYTi8fUExyK2GA8yIgPAKUMvhLjkHU8li+A3+yoWD7ifg+MkPLwgotbS+YilJ1+STNR5xq93ZEA6QDfvxLmUO9sQiCvqMHJwZkX/RtYcpmpAan80UFSbOGxP2rBmsxXMzh3Y7qKIy8gtBBgKBxdHNOYeMjzump6vG3FyWk4VLc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7d9a61e54c426259
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q8ktLPRGGRW4fQ6Aa7S7NNSWoWs1VEK2p2hfcf0lRi3z8fdG2gpUGgFE9hQv3NVbdp1zS/KDCo+fijqyst8/QINmhrhoMqVZJdYnHXX/B8jM8tOjx7xRXy7WyBrj4Bmszy2xYhYnUx/yXx0FKF36Pf2RP4uCuqsK6OsxBDS7JuKQBFrVvpzcBn3G6G5aFmIfG7/4Ute+BYOQ3gMlMRKLgtFmA7y6IY/j9tj79qbAws9libcrQ/5jwQMMkSMMkUi3YNMp0j0DUZrupbXFvGIMb38mViAUIkS6RfszEIVxieyJPu2uHV3dcqQxlOMOF5AsJlvbbllzbfQDAAZ7OB5Jkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zA8vK69jWi9elV7ywSF5xfDQGg45S54vXFg9HWwKfbA=;
 b=YaDuTvjDpZ5y25XMDrBsRcxRsKouJAn6E6FRd3hUjqqcUr/Bw1/YahP4BGcPme5dN68Ne2dUi4QJzT+++dsRTFNZYsRMsBNehhkdRl/qaWdLHGHOFVZDNWLFeFec+ZKTmw63myZStlI7yUaI3Jbzo0Cbj5zAaiA+GNvu6mw1GOjzkLkAGgtTGF8r35YxLo4fn25mTRr2Pgm29zZboIKjLuZm4Gz/R/uOTmr+YWdHGHb1XH3JMWugUADSArWWmRr7OcSoFw3qsub2w5LFyOarGSzTndSipn3J2cBQbhIG2WYGp3C8d8ft/lQHov25pLEUhBmvOPtq5zjtDLbzCYBetA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zA8vK69jWi9elV7ywSF5xfDQGg45S54vXFg9HWwKfbA=;
 b=nMYTi8fUExyK2GA8yIgPAKUMvhLjkHU8li+A3+yoWD7ifg+MkPLwgotbS+YilJ1+STNR5xq93ZEA6QDfvxLmUO9sQiCvqMHJwZkX/RtYcpmpAan80UFSbOGxP2rBmsxXMzh3Y7qKIy8gtBBgKBxdHNOYeMjzump6vG3FyWk4VLc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Penny Zheng <penny.zheng@arm.com>
To: <xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>,
	<julien@xen.org>
CC: <Bertrand.Marquis@arm.com>, <Penny.Zheng@arm.com>, <Wei.Chen@arm.com>,
	<nd@arm.com>
Subject: [PATCH v5 4/7] xen/arm: static memory initialization
Date: Tue, 24 Aug 2021 09:50:42 +0000
Message-ID: <20210824095045.2281500-5-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210824095045.2281500-1-penny.zheng@arm.com>
References: <20210824095045.2281500-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b8b67c96-e7b6-42cf-5dab-08d966e4bcb2
X-MS-TrafficTypeDiagnostic: AS8PR08MB6198:|AM5PR0801MB1923:
X-Microsoft-Antispam-PRVS:
	<AM5PR0801MB192307B6A388470DB261700EF7C59@AM5PR0801MB1923.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:277;OLM:277;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ijPQoXv5naNyvinRjfwQt8mVYP65oSCUwp61hhsaTBrpUPrIq42lpqkX7zhupf9WdeNrQlLTLopN2Hb/X9obkTqL1RdZ0y1yTxNKMTOaxgzrSD8swQ8hVPLAIMiA6Ylv+8U66rdsBrhK3YnJKoOVTNoaxrpPSR8BjsmI8UfZgstNAHLD91GMbr44wMcCsp0zPfi/VI5KclTbpEpRq83yinoUTlKL35gyJJb86AloJ7QzhpkZ4pozYY9DHemZIyQ3Ew8BLIRlWk378++uh8kwBU4QxfU1GfPPT/gh7OlG1SY56SU48WduEp5//hSHSOUAUKBPUrmyl7ad2x141e4byQebZ6A6moc/o+n1RgPE+CVrXqhYC18w2ZAL0AkjhoxsbWRkDFvOXxJVsP6GWw9qj6RUK9EprgINt3nTISlU/QbY/TC3w+6GsW+sT2avnB+pynCXyV0CUeQ4I2HcNA783DyIEZh4/IER4p3kXdJaXT5pmFe+Sxcg54GPvx+R5VJoyTP5RVV73xGUqpNb5tU8LSM7cs2vfeMg6SZFRRx0xuSXcIFlXnc0ExMGjq00Z3x4de2qPKROuuye4/C1O/dAGuRtwiBVmNxej2OsaG6k1WszX+CYrP7y6u4XdFBxlQgivNnD9GpKzfmCKalPbIwdURL/qtq3phNRvuuWOzIqh4h0+cwXG56//EBzdnFF8YtVvhYEZF0EpG0mrNQVkJ8vB7jl/g3zGUKpbCEagF7Y5ow=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(136003)(376002)(39860400002)(396003)(346002)(36840700001)(46966006)(47076005)(316002)(83380400001)(82740400003)(110136005)(86362001)(4326008)(6666004)(1076003)(54906003)(36860700001)(7696005)(2906002)(336012)(426003)(70206006)(36756003)(26005)(8676002)(478600001)(2616005)(5660300002)(8936002)(81166007)(82310400003)(44832011)(186003)(356005)(70586007)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6198
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ddcf9125-94d3-44dd-2dfa-08d966e4b82f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	iczQqjcXB3iu09BsSP9rpRJtoa6TVUgENmZgZi6b3j6fuwO6OIRuCZWJ6N+0mJdK5AULk8bdQjS5HtA+Wy/K3BhYHJab7HkkplaepztN4CTdWaGxObwBf1KJcB9hYw8UOU4MI1lHXYyW4u3wt6UZI/cW4nn9MhXQc0/DyQZ6qz/7UNkuUjsIPQh8TAE8euWE1Nxhjf3QIC4DI2S52sZ+I4+Y+DiyJ7YmbKrIKSx+Bsy8gMyPl61sP4uCxs8Hts1QvZG8reBOurLJaw0XX6UUoKW+JUn0qNS2U5U3OgzFpb3izFbZxfk2O7H4ZnYETE6mBKbmj8Igv6y6obtu/TihJjVmEuqvZhECM75yj4XTeSHbP1vZKg+Mme6pMugtzYawM+AuJfsvvBnIOOrCXQuWQt90tLEzFGEinQmZcx/r4HLEyrllFk9GcLXxOhK8x9FPVkwWGZD0sn0bgDqmQLYjbgoCzpa3bs2uLDA9IhZwW4jH/rgxq07HIatGTqlVIsZ04RtGeUvBsIwmDcNOnX9w7YwqNi/CXZW2M+5aDH5CbvLTXkSA54bRbRYTUqSXe1TqjlnVczlWQKsoDaJiLpIGRod18w60cG1Lbuj19D/jc/PsVsaVSS5C4ebrnjalQaPaWjIwfWwzeOeLlAd2oTh7zeRL9QuJgseC18VJka8F9k7BYskesepzBFxJ284E8ixZB0bH3Tz8X0pr+AGpUbETBQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(396003)(39860400002)(376002)(136003)(46966006)(36840700001)(7696005)(6666004)(5660300002)(86362001)(478600001)(2906002)(44832011)(36860700001)(316002)(1076003)(54906003)(36756003)(110136005)(2616005)(426003)(4326008)(83380400001)(336012)(26005)(82310400003)(47076005)(70206006)(82740400003)(186003)(70586007)(8936002)(81166007)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 09:51:25.3458
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8b67c96-e7b6-42cf-5dab-08d966e4bcb2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT027.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB1923

This patch introduces static memory initialization, during system boot up.

The new function init_staticmem_pages is responsible for static memory
initialization.

Helper free_staticmem_pages is the equivalent of free_heap_pages, to free
nr_mfns pages of static memory.

This commit also introduces new CONFIG_STATIC_MEMORY to wrap all
static-allocation-related codes.

Put asynchronous scrubbing for pages of static memory in TODO list.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
v5 change:
- make CONFIG_STATIC_MEMORY user selectable and gated by UNSUPPORTED.
- wrap all static-allocation-related codes with CONFIG_STATIC_MEMORY
even in arm-specific file.
- make bank_start/bank_end type of mfn_t, and rename bank_size to
bank_pages.
---
 xen/arch/arm/setup.c    | 31 +++++++++++++++++++++++++++++++
 xen/common/Kconfig      | 17 +++++++++++++++++
 xen/common/page_alloc.c | 22 +++++++++++++++++++++-
 xen/include/xen/mm.h    |  6 ++++++
 4 files changed, 75 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 63a908e325..44aca9f1b9 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -609,6 +609,29 @@ static void __init init_pdx(void)
     }
 }
 
+#ifdef CONFIG_STATIC_MEMORY
+/* Static memory initialization */
+static void __init init_staticmem_pages(void)
+{
+    unsigned int bank;
+
+    for ( bank = 0 ; bank < bootinfo.reserved_mem.nr_banks; bank++ )
+    {
+        if ( bootinfo.reserved_mem.bank[bank].xen_domain )
+        {
+            mfn_t bank_start = _mfn(PFN_UP(bootinfo.reserved_mem.bank[bank].start));
+            unsigned long bank_pages = PFN_DOWN(bootinfo.reserved_mem.bank[bank].size);
+            mfn_t bank_end = mfn_add(bank_start, bank_pages);
+
+            if ( mfn_x(bank_end) <= mfn_x(bank_start) )
+                return;
+
+            free_staticmem_pages(mfn_to_page(bank_start), bank_pages, false);
+        }
+    }
+}
+#endif
+
 #ifdef CONFIG_ARM_32
 static void __init setup_mm(void)
 {
@@ -736,6 +759,10 @@ static void __init setup_mm(void)
     /* Add xenheap memory that was not already added to the boot allocator. */
     init_xenheap_pages(mfn_to_maddr(xenheap_mfn_start),
                        mfn_to_maddr(xenheap_mfn_end));
+
+#ifdef CONFIG_STATIC_MEMORY
+    init_staticmem_pages();
+#endif
 }
 #else /* CONFIG_ARM_64 */
 static void __init setup_mm(void)
@@ -789,6 +816,10 @@ static void __init setup_mm(void)
 
     setup_frametable_mappings(ram_start, ram_end);
     max_page = PFN_DOWN(ram_end);
+
+#ifdef CONFIG_STATIC_MEMORY
+    init_staticmem_pages();
+#endif
 }
 #endif
 
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 0ddd18e11a..514a2c9022 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -67,6 +67,23 @@ config MEM_ACCESS
 config NEEDS_LIBELF
 	bool
 
+config STATIC_MEMORY
+        bool "Static Allocation Support (UNSUPPORTED)" if UNSUPPORTED
+	depends on ARM
+	---help---
+	  Static Allocation refers to system or sub-system(domains) for
+	  which memory areas are pre-defined by configuration using physical
+          address ranges.
+
+	  Those pre-defined memory, -- Static Memory, as parts of RAM reserved
+	  during system boot-up, shall never go to heap allocator or boot
+	  allocator for any use.
+
+	  When enabled, memory can be statically allocated to a domain using
+	  the property "xen,static-mem" defined in the domain configuration.
+
+	  If unsure, say Y.
+
 menu "Speculative hardening"
 
 config SPECULATIVE_HARDEN_ARRAY
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index a3ee5eca9e..2b4591bc56 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -1519,7 +1519,6 @@ static void free_heap_pages(
     spin_unlock(&heap_lock);
 }
 
-
 /*
  * Following rules applied for page offline:
  * Once a page is broken, it can't be assigned anymore
@@ -2604,6 +2603,27 @@ struct domain *get_pg_owner(domid_t domid)
     return pg_owner;
 }
 
+#ifdef CONFIG_STATIC_MEMORY
+/* Equivalent of free_heap_pages to free nr_mfns pages of static memory. */
+void __init free_staticmem_pages(struct page_info *pg, unsigned long nr_mfns,
+                                 bool need_scrub)
+{
+    mfn_t mfn = page_to_mfn(pg);
+    unsigned long i;
+
+    for ( i = 0; i < nr_mfns; i++ )
+    {
+        mark_page_free(&pg[i], mfn_add(mfn, i));
+
+        if ( need_scrub )
+        {
+            /* TODO: asynchronous scrubbing for pages of static memory. */
+            scrub_one_page(pg);
+        }
+    }
+}
+#endif
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index 667f9dac83..8e8fb5a615 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -85,6 +85,12 @@ bool scrub_free_pages(void);
 } while ( false )
 #define FREE_XENHEAP_PAGE(p) FREE_XENHEAP_PAGES(p, 0)
 
+#ifdef CONFIG_STATIC_MEMORY
+/* These functions are for static memory */
+void free_staticmem_pages(struct page_info *pg, unsigned long nr_mfns,
+                          bool need_scrub);
+#endif
+
 /* Map machine page range in Xen virtual address space. */
 int map_pages_to_xen(
     unsigned long virt,
-- 
2.25.1


