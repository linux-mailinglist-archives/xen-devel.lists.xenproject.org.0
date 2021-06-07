Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F24039D318
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jun 2021 04:44:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.137560.254947 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lq5Fn-0007sl-M5; Mon, 07 Jun 2021 02:44:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 137560.254947; Mon, 07 Jun 2021 02:44:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lq5Fn-0007pB-Ic; Mon, 07 Jun 2021 02:44:39 +0000
Received: by outflank-mailman (input) for mailman id 137560;
 Mon, 07 Jun 2021 02:44:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MAL7=LB=arm.com=penny.zheng@srs-us1.protection.inumbo.net>)
 id 1lq5Fl-0003W9-Kw
 for xen-devel@lists.xenproject.org; Mon, 07 Jun 2021 02:44:37 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe05::61b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2c8abd4d-335f-4e8a-919d-b0ed7e002ae2;
 Mon, 07 Jun 2021 02:44:22 +0000 (UTC)
Received: from AM6P194CA0004.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::17)
 by AM0PR08MB4100.eurprd08.prod.outlook.com (2603:10a6:208:130::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20; Mon, 7 Jun
 2021 02:44:15 +0000
Received: from VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:90:cafe::7a) by AM6P194CA0004.outlook.office365.com
 (2603:10a6:209:90::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.15 via Frontend
 Transport; Mon, 7 Jun 2021 02:44:15 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT010.mail.protection.outlook.com (10.152.18.113) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.21 via Frontend Transport; Mon, 7 Jun 2021 02:44:15 +0000
Received: ("Tessian outbound 836922dda4f1:v93");
 Mon, 07 Jun 2021 02:44:14 +0000
Received: from d51c310d07aa.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1679F000-86AC-4362-BAD0-20E79C3A7969.1; 
 Mon, 07 Jun 2021 02:44:09 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d51c310d07aa.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 07 Jun 2021 02:44:09 +0000
Received: from DB6PR1001CA0019.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:4:b7::29)
 by DB8PR08MB5035.eurprd08.prod.outlook.com (2603:10a6:10:eb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Mon, 7 Jun
 2021 02:44:08 +0000
Received: from DB5EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:b7:cafe::4) by DB6PR1001CA0019.outlook.office365.com
 (2603:10a6:4:b7::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.15 via Frontend
 Transport; Mon, 7 Jun 2021 02:44:08 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT012.mail.protection.outlook.com (10.152.20.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4195.21 via Frontend Transport; Mon, 7 Jun 2021 02:44:07 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Mon, 7 Jun
 2021 02:44:06 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2176.14 via Frontend
 Transport; Mon, 7 Jun 2021 02:44:04 +0000
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
X-Inumbo-ID: 2c8abd4d-335f-4e8a-919d-b0ed7e002ae2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kHSMQ1sGOPQDhU5EE4xS8cKC3DuRiiQSJWMUP5Duxbg=;
 b=CKyIXG3MK+C6ysHsALDE0Fb1C8sjrnLWyXRMlrlmGNahxqUy6My85Ms0I0PlYpTCnnbHhYjJA66eC/lCeZxh0OPjk5Q3rGlkAs/tNrV6Q15y7iyG6owQ8rw7B4FYeQIkoIA7HqU4gPhHITJG1JhXgao9tBLb/Tqc0FBdJKaaTOU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5f5a7362ab08dbbd
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QZrRCX1v/4OBiq7aUEU4MxpdBKUEZP9YE16raGUxd9lqRF6ZnBk+ifaUz0VpHz0wQxp9jLykl/CojtZOx17lX7rJeIKrBnRZ7OTysvaJg+EboTbU1YzJMwVB2pluhJPNrmBNCkEnifzzWqhWcf/MUkQNdMjY0eq//3sLLlN54Ub0JpRzmPogGmY2QDdgHDVHTUcoB2jzkkPaEJzCVrWiT7koC1mJbuJBRGjEz2Cq06TCfEzuM1UtgfJXvNGr6jN13ypHuysiuXqyF75SQuBKJR+YAljm+nUKpM1H3RpDFufdO6i3E2XsZWNX74xQiKE4RhXnCnjM2otZiSXac9ppgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kHSMQ1sGOPQDhU5EE4xS8cKC3DuRiiQSJWMUP5Duxbg=;
 b=JdraQ7X7dlfVkARB04jF9OnNmEp2QG51BOo2BUv1dDxeSkpyvcT9ewIB+OwUgy1DYUW9BVohw0XvN2Lyuu39UbTSf1WQcqUm/Qj3PP4IYULRMDqcQT1dd8rPLmT4OP21DCkzxaJLUvC7n9HzmUDBObJf8UU4HXanX6uBHDVcv43H/qtlRZCsO7np7SJaZi+3/9A4BKq7/nXQqyyKsKNTqI88UfZcYG+dOUF8RSXITQFe5QUce91CtmeOFBvle+wxDynHXe1QQFEm5wUpe0VwFy84Kfnoa6FCwU9IfgclxKpZJ9Fj5lyWd+HUuIF1vY/PoJJeL/DP4lgeRPvXXOjFxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kHSMQ1sGOPQDhU5EE4xS8cKC3DuRiiQSJWMUP5Duxbg=;
 b=CKyIXG3MK+C6ysHsALDE0Fb1C8sjrnLWyXRMlrlmGNahxqUy6My85Ms0I0PlYpTCnnbHhYjJA66eC/lCeZxh0OPjk5Q3rGlkAs/tNrV6Q15y7iyG6owQ8rw7B4FYeQIkoIA7HqU4gPhHITJG1JhXgao9tBLb/Tqc0FBdJKaaTOU=
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
Subject: [PATCH 9/9] xen/arm: introduce allocate_static_memory
Date: Mon, 7 Jun 2021 02:43:18 +0000
Message-ID: <20210607024318.3988467-10-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210607024318.3988467-1-penny.zheng@arm.com>
References: <20210607024318.3988467-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fe858219-dd68-4cc9-0d49-08d9295e23d7
X-MS-TrafficTypeDiagnostic: DB8PR08MB5035:|AM0PR08MB4100:
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB4100440690B2076943CE912BF7389@AM0PR08MB4100.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 0CwGaWSGThSq0G6eAKCK5bA01pOR6d/+lW8mFNINli8q8onPjsR/mQfejX5SFgExklTnF5PrFy9V+B5WDgJOzzS1/aXc0fWxtj16VNvXwhOlhpyxIFuyADnndzBVxzK5B5MP0a5zmGZxpOwVcz8KKGqflqEQCbi5cRz0XAucLKoTvc1qC5kBtX9EK0Yuy48mMHfZtgniBbr7mqGx6A7Pij/uLxRcQSbPCYUR1/t9VRGC7+Tv2mCnFNYkbKyY0soSdK5u0loY4pbM+CS0MsyzPSXuz1YOi1RNolwABQBvYo4FOqNNQoeyp29m6jTWQkmqYGgprJNqlYhuslYlscNe1dfjD8nj7fVGydNB0ZrQr2amjWb0N67dunsMDll6gCMQfgloGNQPAg8ClF2VCfEUMP3ZnYhhRly+UqrTQQbUVZL9tGuy7EeuRBcgIIya+G8yMp0r5f+eCMQlHlhivZoSh4jnKbo5v04FU0axMbxyr9KYALvdkc6P00Vrfj+Z7UBeufZmCaMnT3lvvmvz3A9Zm9EVKS7DlfHnjXT88tYPr7tp6YKFN71yyTjAC8IHI2FYKcszUjctJxidYsh4MuctL24iat/FwfRsWx+TKPobJS/5GLjq/P1hlQyGXYjK22tv09RhCGSEVAArx34nCo3I9gaSZftFBuj29DojqZPjZs2VN4x+bz5PEsPGSojnX0ySH8Q4qgztVTJ6B8Rei4L2Pg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(136003)(376002)(39860400002)(346002)(396003)(36840700001)(46966006)(8676002)(8936002)(70586007)(70206006)(4326008)(54906003)(110136005)(2906002)(1076003)(316002)(36860700001)(336012)(47076005)(2616005)(186003)(86362001)(44832011)(26005)(82310400003)(5660300002)(83380400001)(81166007)(6666004)(36756003)(356005)(426003)(82740400003)(7696005)(478600001)(2101003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5035
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8065edcc-42e8-494d-cbee-08d9295e1f4d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	6tSXe5J57PWNXai3JQpZINVadA2TCbCMitw5wILDcqcx5VRwctI+uYk237BBbxIvaUEbJV4y1G90GLqV0fIHAwc2uAqCk2NW/urpDyHycNynrXk/UeCDFTqwS1NoRa2rA5x1viCik/Xx5NRsFHOhqbPcP3wryNaA9ELZ+lzFM7RqsQVHLPcE1bzfiZAymfb1sR/hl79gJU8Yg4qpydWnu4rM+9fdE3NIBH1AvxDU2HZ2daBeyyxaBnoRjKkZG/Zpxo3rf8y3arbgwGLGjG88Tkplt3PoQ+OrKuRhjjvoeSC04TRN5WeQEa5V4x0z/aQSz6iSkN0+h2a5t7eg2Q3LP7ElrUXa5LAkZRAS97opj/eUPmvklf5RdLuzo4gjUVRYK0Okk5LWuKwaMXBYVPMSP7WcWPyGwFa5RIweRxUIckkLH7qLOtcmo3S4QZy6zOQBCv8q6j3H0xYWN82/hV49PER2q7sVsxSB6a874nw06vxeFEgbSw0Z+IXXHhWWGGtORTBBwyZxzNe9rYbsTx1qtvVZFmv7dSyqOQLy6DooYMpaNOMIuNosageqwYvN5NYyiuehLTEqNop8P01S8rsMv75Rh8jTwTQKEKiqOEJmFiF23QM5kMK89keIidgDF54b+HxmZkK4e0d02K4l/tjw7peeJpNNvS/ZbWmMModxWvpYL03jxDj6qoi5bfTGPabc
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(396003)(39860400002)(46966006)(36840700001)(26005)(186003)(36756003)(82740400003)(86362001)(83380400001)(82310400003)(81166007)(54906003)(7696005)(316002)(6666004)(36860700001)(47076005)(5660300002)(336012)(2906002)(478600001)(4326008)(2616005)(8676002)(70586007)(426003)(70206006)(8936002)(1076003)(44832011)(110136005)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2021 02:44:15.3217
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe858219-dd68-4cc9-0d49-08d9295e23d7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4100

This commit introduces allocate_static_memory to allocate static memory as
guest RAM for Domain on Static Allocation.

It uses alloc_domstatic_pages to allocate pre-configured static memory banks
for this domain, and uses guest_physmap_add_page to set up P2M table.
These pre-defiend static memory ranges shall be firstly mapped to the
fixed guest RAM address `GUEST_RAM0_BASE`. And until it exhausts the
`GUEST_RAM0_SIZE`, it will seek to `GUEST_RAM1_BASE`.
`GUEST_RAM0` may take up several pre-defined physical RAM regions.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
changes v2:
- rename the values, like prefix it g/p
- fix the scalability issue
- allocate when parse
---
 xen/arch/arm/domain_build.c | 155 +++++++++++++++++++++++++++++++++++-
 1 file changed, 153 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 4166d7993c..63b6a97b2c 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -437,6 +437,48 @@ static bool __init allocate_bank_memory(struct domain *d,
     return true;
 }
 
+/*
+ * Static memory bank at #smfn of #gsize shall be mapped to #sgfn of #gsize,
+ * and #sgfn will be next guest address to map when returning.
+ */
+static bool __init allocate_static_bank_memory(struct domain *d,
+                                               struct kernel_info *kinfo,
+                                               int gbank,
+                                               gfn_t* sgfn,
+                                               mfn_t smfn,
+                                               paddr_t gsize)
+{
+    int res;
+    paddr_t tot_size = gsize;
+    const uint64_t rambase[] = GUEST_RAM_BANK_BASES;
+
+    while ( tot_size > 0 )
+    {
+        unsigned int order = get_allocation_size(tot_size);
+
+        res = guest_physmap_add_page(d, *sgfn, smfn, order);
+        if ( res )
+        {
+            dprintk(XENLOG_ERR, "Failed map pages to DOMU: %d", res);
+            return false;
+        }
+
+        *sgfn = gfn_add(*sgfn, 1UL << order);
+        smfn = mfn_add(smfn, 1UL << order);
+        tot_size -= (1ULL << (PAGE_SHIFT + order));
+    }
+
+    /* Guest RAM bank in kinfo hasn't been initialized. */
+    if ( gbank == kinfo->mem.nr_banks )
+    {
+        kinfo->mem.bank[gbank].start = rambase[gbank];
+        kinfo->mem.nr_banks++;
+    }
+    kinfo->mem.bank[gbank].size += gsize;
+
+    return true;
+}
+
 static void __init allocate_memory(struct domain *d, struct kernel_info *kinfo)
 {
     unsigned int i;
@@ -480,6 +522,116 @@ fail:
           (unsigned long)kinfo->unassigned_mem >> 10);
 }
 
+/* Allocate memory from static memory as RAM for one specific domain d. */
+static u64 __init allocate_static_memory(struct domain *d,
+                                          struct kernel_info *kinfo,
+                                          const struct dt_device_node *node)
+{
+    int nr_banks, bank = 0, gbank = 0;
+    const uint64_t rambase[] = GUEST_RAM_BANK_BASES;
+    const uint64_t ramsize[] = GUEST_RAM_BANK_SIZES;
+    const __be32 *cell;
+    const struct dt_property *prop;
+    struct dt_device_node *static_mem_node;
+    const struct dt_device_node *parent = dt_find_node_by_path("/reserved-memory");
+    u32 addr_cells = 2, size_cells = 2, reg_cells;
+    u64 tot_size;
+
+    paddr_t pbase, psize, gsize;
+    gfn_t sgfn;
+    mfn_t smfn;
+
+    kinfo->mem.nr_banks = 0;
+    /* Start with GUEST_RAM0. */
+    gsize = ramsize[gbank];
+    sgfn = gaddr_to_gfn(rambase[gbank]);
+
+    /* Parse phandle in `xen,static-mem`. */
+    static_mem_node = dt_parse_phandle(node, "xen,static-mem", 0);
+    if ( !static_mem_node )
+        goto fail;
+
+    /*
+     * #address-cells and #size-cells must be consistent with the parent node,
+     * "reserved-memory".
+     */
+    dt_property_read_u32(parent, "#address-cells", &addr_cells);
+    dt_property_read_u32(parent, "#size-cells", &size_cells);
+    BUG_ON(size_cells > 2 || addr_cells > 2);
+    reg_cells = addr_cells + size_cells;
+
+    prop = dt_find_property(static_mem_node, "reg", NULL);
+    if ( !prop )
+        goto fail;
+    cell = (const __be32 *)prop->value;
+    nr_banks = (prop->length) / (reg_cells * sizeof (u32));
+    BUG_ON(nr_banks > NR_MEM_BANKS);
+
+    while ( bank < nr_banks )
+    {
+        device_tree_get_reg(&cell, addr_cells, size_cells, &pbase, &psize);
+        tot_size += (u64)psize;
+        smfn = maddr_to_mfn(pbase);
+
+        if ( !alloc_domstatic_pages(d, psize >> PAGE_SHIFT, smfn, 0) )
+        {
+            printk(XENLOG_ERR
+                    "%pd: cannot allocate static memory"
+                    "(0x%"PRIpaddr" - 0x%"PRIpaddr")",
+                    d, pbase, pbase + psize);
+            goto fail;
+        }
+
+        printk(XENLOG_INFO "%pd STATIC BANK[%d] %#"PRIpaddr"-%#"PRIpaddr"\n",
+               d, bank, pbase, pbase + psize);
+
+        /*
+         * It shall be mapped to the fixed guest RAM address rambase[i],
+         * And until it exhausts the ramsize[i], it will seek to the next
+         * rambase[i+1].
+         */
+        while ( 1 )
+        {
+            if ( gsize >= psize )
+            {
+                if ( !allocate_static_bank_memory(d, kinfo, gbank,
+                                                  &sgfn, smfn, psize) )
+                    goto fail;
+
+                gsize = gsize - psize;
+                bank++;
+                break;
+            }
+            else
+            {
+                if ( !allocate_static_bank_memory(d, kinfo, gbank,
+                                                  &sgfn, smfn, gsize) )
+                    goto fail;
+
+                /*
+                 * Physical bank hasn't been totally mapped,
+                 * seeking to the next guest RAM i+1, if exist.
+                 */
+                if ( ++gbank < GUEST_RAM_BANKS )
+                {
+                    psize = psize - gsize;
+                    smfn = mfn_add(smfn, gsize >> PAGE_SHIFT);
+                    gsize = ramsize[gbank];
+                    sgfn = gaddr_to_gfn(rambase[gbank]);
+                }
+                else
+                    goto fail;
+            }
+        }
+    }
+    return tot_size;
+
+fail:
+    panic("Failed to allocate requested static memory for domain %pd."
+          "Fix the VMs configurations.\n",
+          d);
+}
+
 static int __init write_properties(struct domain *d, struct kernel_info *kinfo,
                                    const struct dt_device_node *node)
 {
@@ -2437,8 +2589,7 @@ static int __init construct_domU(struct domain *d,
     if ( prop )
     {
         static_mem = true;
-        /* static_mem_size = allocate_static_memory(...); */
-        BUG();
+        static_mem_size = allocate_static_memory(d, &kinfo, node);
     }
 
     rc = dt_property_read_u64(node, "memory", &mem);
-- 
2.25.1


