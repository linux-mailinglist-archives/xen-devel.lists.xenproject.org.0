Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7008E414818
	for <lists+xen-devel@lfdr.de>; Wed, 22 Sep 2021 13:45:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.192649.343194 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT0gh-0007cS-G7; Wed, 22 Sep 2021 11:45:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 192649.343194; Wed, 22 Sep 2021 11:45:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mT0gh-0007ZS-Ce; Wed, 22 Sep 2021 11:45:19 +0000
Received: by outflank-mailman (input) for mailman id 192649;
 Wed, 22 Sep 2021 11:45:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=NDiu=OM=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1mT0gg-0007ZM-2N
 for xen-devel@lists.xenproject.org; Wed, 22 Sep 2021 11:45:18 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.44]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e7b59fc0-f8a9-4eff-bee8-43bb60a7e4de;
 Wed, 22 Sep 2021 11:45:15 +0000 (UTC)
Received: from AS8PR04CA0183.eurprd04.prod.outlook.com (2603:10a6:20b:2f3::8)
 by AM4PR08MB2627.eurprd08.prod.outlook.com (2603:10a6:205:b::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Wed, 22 Sep
 2021 11:45:06 +0000
Received: from VE1EUR03FT022.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2f3:cafe::b9) by AS8PR04CA0183.outlook.office365.com
 (2603:10a6:20b:2f3::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Wed, 22 Sep 2021 11:45:06 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT022.mail.protection.outlook.com (10.152.18.64) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Wed, 22 Sep 2021 11:45:06 +0000
Received: ("Tessian outbound 78bf72cc015a:v103");
 Wed, 22 Sep 2021 11:45:05 +0000
Received: from f36b91041942.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E6810B6A-DEB2-40F7-8B45-E9F1BA860C95.1; 
 Wed, 22 Sep 2021 11:44:50 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f36b91041942.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 22 Sep 2021 11:44:50 +0000
Received: from DB6P18901CA0002.EURP189.PROD.OUTLOOK.COM (2603:10a6:4:16::12)
 by VI1PR08MB3311.eurprd08.prod.outlook.com (2603:10a6:803:3e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Wed, 22 Sep
 2021 11:44:39 +0000
Received: from DB5EUR03FT003.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:16:cafe::6a) by DB6P18901CA0002.outlook.office365.com
 (2603:10a6:4:16::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15 via Frontend
 Transport; Wed, 22 Sep 2021 11:44:38 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT003.mail.protection.outlook.com (10.152.20.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4544.13 via Frontend Transport; Wed, 22 Sep 2021 11:44:38 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Wed, 22 Sep
 2021 11:44:37 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Wed, 22 Sep 2021 11:44:35 +0000
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
X-Inumbo-ID: e7b59fc0-f8a9-4eff-bee8-43bb60a7e4de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lOVPuq3M+VKdkPUXWM5c9CrS27QS5LinUmI4Pl5ZKhw=;
 b=uNXjY5xIXF5QDQFErfQe4rN4/7XjiIQ/3j/AT/mNHWPgaddeHqcyGhyMrXXJzJMhIesaUDeJ4c/CbGXstMfOUYJDMXaYroP5ai0O9tixp/Zc+Bf34UDYpqwwUbgIQC8rUQhvgpk/yJazEsu+2XV7NfrU1menuL5GVWzq/ci3PuM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 16001ac9e78f6432
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=McIOSh/HJv1dPUE9Gia0VkU5oLfDo2qKfJZqQug8N0smaRkmM18BSykyfM4vSPsiy2Hjhxvq79oZYxkyW7OQAByeeA0Hr6kSdIAZxZJ5MJCC+iB5sbsYLd1Mg7ZLEdKu7mAn3n7g803zbj7PVZfls9POMqJSO+/jJ1coFE/qjSJxwt0K6du7l2fa2hnYyMzKG6i/+sU/bh/HmbpmiCvC1QGXm3mBapW4y1dfwpoKdJqfK4S3/tw4bLaOUI+rDBbOhdZu4HeCRIlbKQduQ84r84SPY+7RTcOOOEaAbX67o2w6NMAJ4PAt6bq8FQDgyvOpcM5TST9m42JKQUk1i2gyXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=lOVPuq3M+VKdkPUXWM5c9CrS27QS5LinUmI4Pl5ZKhw=;
 b=mgY7pRP4OXXqrVnv8BbOUENB26vfRNfk2eH12XlkpAVVOkW0hdH5RhC5ks3IaLSgTdh7YecwCRe+biM33rFcm0IukFT46g7pkzUgrwKd63B7CsDUuu54gE2K1ntPaLqdv5j7KmVgE/n1whtusCi1u249ifQuw5ZieaNovtVZcupeYmlsGdXIcd9hOiKCl+ZOkGKCioXIzxsiyBVPdqVEv7SZd5FLf4wQqT4tHqvQQyVxes92Omo4gACZD2MivwhOGy2fwWDAQRsV3h1iWURDtRwAv5tExqyJg0FoQ2BPRbZ+2SjFoHW/e9gRgk92Cv43ap59iAxRl7kfvh2SYJezpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lOVPuq3M+VKdkPUXWM5c9CrS27QS5LinUmI4Pl5ZKhw=;
 b=uNXjY5xIXF5QDQFErfQe4rN4/7XjiIQ/3j/AT/mNHWPgaddeHqcyGhyMrXXJzJMhIesaUDeJ4c/CbGXstMfOUYJDMXaYroP5ai0O9tixp/Zc+Bf34UDYpqwwUbgIQC8rUQhvgpk/yJazEsu+2XV7NfrU1menuL5GVWzq/ci3PuM=
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
CC: <Bertrand.Marquis@arm.com>, <Wei.Chen@arm.com>
Subject: [PATCH] xen: fix broken tainted value in mark_page_free
Date: Wed, 22 Sep 2021 11:44:32 +0000
Message-ID: <20210922114432.1093340-1-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 408fd37e-312f-4437-94f2-08d97dbe6c52
X-MS-TrafficTypeDiagnostic: VI1PR08MB3311:|AM4PR08MB2627:
X-Microsoft-Antispam-PRVS:
	<AM4PR08MB2627436C3FF8354B8960E587F7A29@AM4PR08MB2627.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1091;OLM:1091;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 C9BNsTFMlOqvUVF4CQMdB8VSbKpvyUnSjEzo3xtty2phvL41FXUGvA3Jlddj4GW0gbFvi64X2OPbeQiL72YStqM7ZPmSDIvbOfmZ5oStrnsHPDgV2o5xJkBACFufM2e5fz9XmWZ8cHZgMGh2ZhdDSXxGS/b3vZkXuz8rD7SpKcQvW4RuT4RSHL8NtXUlaOHB4Pa8Rw+H9UILjPXeov5luaJb2ylGIxsHDjv/Zqnr2Uo5LJ7KKpiiXw1ndsngpxuS58b0TnbIozI2fs5q2Xfz6HG5eIdqo8raIP/bfJWmyBUhXfLtCjVlNC/htDf8tWCkZF7X4yPbZZLIDXolJPJAhzanUG7axXV5ZE62Ysjpq2NIOXnI6/htFU4iPtw643nDc2iyxS3Z79MDQsCklkIunBa+AqjadSdWl75tMR2rfWtm5hn6Y2DT2XLBaUYcHuwmbNRcjJEkCnZFBrETUfZuQwpTjIqZOe2PLk+s1jyXprb6hV0DKdZuKg3FxYnflg0S29TFfnREpUy6E5fYlnJSFYXce3vB3KHN3NKkb6CfjpXBqB+WKvG8oSVG9xj2YWEjdO+P/mN20ACaJzm2Y0zGerKcxrzSn3EDmBIdOtQeMf2SePtik/9eAKcoeoP4HfnVEogO2nqPeYcM89XdaIYPUr9fyVzdGtpcUImbQV8yueNnWhsZgBNOQ8djkRYn8SAQZrdVQF/soo7UGx8+l0OoriiIWgAC00RqM8NnnCCXbVI7UuFyGhWtxIp2xUSovGsj
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(316002)(70206006)(82310400003)(356005)(36756003)(186003)(110136005)(8936002)(2906002)(26005)(6666004)(54906003)(70586007)(508600001)(86362001)(426003)(81166007)(5660300002)(1076003)(336012)(7696005)(4326008)(47076005)(8676002)(83380400001)(36860700001)(44832011)(2616005)(36900700001)(2101003);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3311
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7407ed3e-c8cc-4f6f-ba10-08d97dbe5bdb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8JpWw5tF4ENEEay0KAMJhb07puL6zdgpGwR+aDcHMvcHfwEKt/mXU85zQsR4nG2Q2/ET/5xR1+NgFQWgATRi7NQSKewI7doO74kFoT6WpjHOJ7xig0ZxKAlzarVnrU2gKMjLndyzIgvmuDt6Tx9QMmV6ogSqyt6ISTqiOr4hJVDE4wiqf0iboo++gFn5yk1ZpSZa0KSEaMp17G8TEO2ZTxb9/P3npkbvtQ+uQjFoFx/kTxHPGsQ5kVH6aecG5oDjNVwYtiQTx1+7xKGiMqxzvclEBGzhPO3/wIkHT+tPAZtZdzKxOWEi5F5v+S3m+oknxhYsrp0ha8nLXG6mMLvSRVkmrO2Yr1Qk0PJokqv/t9CnA2QMTdTI61uQx0orzglvFvWDwRd0Awlyhzruf84FlR3pW33Sv/dUS3dsIOHwjmxMSS3LR7+SECo715SkZHH6jwNi0S0TXdJ0i/FkPNKaVzGTbT5TSErJrPpYch5sxz789CqvcsGx8FcdAKMlXMQwH63NlDBR7OoPM4QiugjnxIFRllIVXr22z+XPPMTcjC2QzgmweW4X9vaMDgeS9yIvRQQT4Kh01QvaEUBpNVdIel5ymgAlduF1Z4XSZx04joWzbz8MnCGbi2y1LiL29Tk49rr0swhhfjQ8m6U0uCn9iZK+RvfKJhBhqlHJfbPaU55xP5m9FvqQBJflFMqZT8en4R0cIQttGaC6JJDFQwtDizCTpEsr/iea/s6HoNRl5L0=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(186003)(26005)(70586007)(316002)(44832011)(47076005)(81166007)(426003)(6666004)(70206006)(36860700001)(36756003)(336012)(2616005)(7696005)(1076003)(4326008)(83380400001)(2906002)(508600001)(8676002)(86362001)(8936002)(5660300002)(110136005)(54906003)(82310400003)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2021 11:45:06.3192
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 408fd37e-312f-4437-94f2-08d97dbe6c52
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT022.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2627

Commit 540a637c3410780b519fc055f432afe271f642f8 defines a new
helper mark_page_free to extract common codes, while it accidently
breaks the local variable "tainted".

This patch fix it by letting mark_page_free() return bool of whether the
page is offlined and rename local variable "tainted" to "pg_offlined".

Coverity ID: 1491872

Fixes: 540a637c3410780b519fc055f432afe271f642f8
Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
v2 changes:
- rename local variable "tainted" to "pg_offlined", and make it bool
---
 xen/common/page_alloc.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 6142c7bb6a..5801358b4b 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -1380,8 +1380,10 @@ bool scrub_free_pages(void)
     return node_to_scrub(false) != NUMA_NO_NODE;
 }
 
-static void mark_page_free(struct page_info *pg, mfn_t mfn)
+static bool mark_page_free(struct page_info *pg, mfn_t mfn)
 {
+    bool pg_offlined = false;
+
     ASSERT(mfn_x(mfn) == mfn_x(page_to_mfn(pg)));
 
     /*
@@ -1405,7 +1407,7 @@ static void mark_page_free(struct page_info *pg, mfn_t mfn)
     case PGC_state_offlining:
         pg->count_info = (pg->count_info & PGC_broken) |
                          PGC_state_offlined;
-        tainted = 1;
+        pg_offlined = true;
         break;
 
     default:
@@ -1425,6 +1427,8 @@ static void mark_page_free(struct page_info *pg, mfn_t mfn)
     /* This page is not a guest frame any more. */
     page_set_owner(pg, NULL); /* set_gpfn_from_mfn snoops pg owner */
     set_gpfn_from_mfn(mfn_x(mfn), INVALID_M2P_ENTRY);
+
+    return pg_offlined;
 }
 
 /* Free 2^@order set of pages. */
@@ -1433,7 +1437,7 @@ static void free_heap_pages(
 {
     unsigned long mask;
     mfn_t mfn = page_to_mfn(pg);
-    unsigned int i, node = phys_to_nid(mfn_to_maddr(mfn)), tainted = 0;
+    unsigned int i, node = phys_to_nid(mfn_to_maddr(mfn)), pg_offlined = 0;
     unsigned int zone = page_to_zone(pg);
 
     ASSERT(order <= MAX_ORDER);
@@ -1443,7 +1447,8 @@ static void free_heap_pages(
 
     for ( i = 0; i < (1 << order); i++ )
     {
-        mark_page_free(&pg[i], mfn_add(mfn, i));
+        if ( mark_page_free(&pg[i], mfn_add(mfn, i)) )
+            pg_offlined = 1;
 
         if ( need_scrub )
         {
@@ -1517,7 +1522,7 @@ static void free_heap_pages(
 
     page_list_add_scrub(pg, node, zone, order, pg->u.free.first_dirty);
 
-    if ( tainted )
+    if ( pg_offlined )
         reserve_offlined_page(pg);
 
     spin_unlock(&heap_lock);
-- 
2.25.1


