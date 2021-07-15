Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 77ADC3C9841
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jul 2021 07:19:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.156308.288474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3tmH-0002k4-PF; Thu, 15 Jul 2021 05:19:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 156308.288474; Thu, 15 Jul 2021 05:19:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3tmH-0002hJ-K2; Thu, 15 Jul 2021 05:19:17 +0000
Received: by outflank-mailman (input) for mailman id 156308;
 Thu, 15 Jul 2021 05:19:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6KMV=MH=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1m3tmG-00009P-9Q
 for xen-devel@lists.xenproject.org; Thu, 15 Jul 2021 05:19:16 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.55]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c9bf7b7b-6f8c-4a95-b378-1e7ff86d5afc;
 Thu, 15 Jul 2021 05:18:53 +0000 (UTC)
Received: from DB9PR05CA0012.eurprd05.prod.outlook.com (2603:10a6:10:1da::17)
 by AM0PR08MB3492.eurprd08.prod.outlook.com (2603:10a6:208:da::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Thu, 15 Jul
 2021 05:18:51 +0000
Received: from DB5EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1da:cafe::9b) by DB9PR05CA0012.outlook.office365.com
 (2603:10a6:10:1da::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Thu, 15 Jul 2021 05:18:51 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT031.mail.protection.outlook.com (10.152.20.142) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Thu, 15 Jul 2021 05:18:51 +0000
Received: ("Tessian outbound 57330d0f8f60:v99");
 Thu, 15 Jul 2021 05:18:51 +0000
Received: from 9b657cef5389.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F6357AAD-1979-47AD-A6B1-A3BADF2F7401.1; 
 Thu, 15 Jul 2021 05:18:44 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9b657cef5389.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 15 Jul 2021 05:18:44 +0000
Received: from DB8PR06CA0058.eurprd06.prod.outlook.com (2603:10a6:10:120::32)
 by DB7PR08MB3436.eurprd08.prod.outlook.com (2603:10a6:10:44::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.23; Thu, 15 Jul
 2021 05:18:42 +0000
Received: from DB5EUR03FT027.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:120:cafe::69) by DB8PR06CA0058.outlook.office365.com
 (2603:10a6:10:120::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Thu, 15 Jul 2021 05:18:42 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT027.mail.protection.outlook.com (10.152.20.121) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4331.21 via Frontend Transport; Thu, 15 Jul 2021 05:18:42 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2176.14; Thu, 15 Jul
 2021 05:18:41 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.14; Thu, 15
 Jul 2021 05:18:41 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2176.14 via Frontend
 Transport; Thu, 15 Jul 2021 05:18:39 +0000
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
X-Inumbo-ID: c9bf7b7b-6f8c-4a95-b378-1e7ff86d5afc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FSUaZhIJ132fP5dvjR7UOX33VSmQ3hubM795HYhZnO8=;
 b=KnheMaRuNZ1IRNS2DFGcoqZXaDEOeF8COjEHF/xbeGeXlo2AR65vD0xs+z1zU/4FlJAZJXHzM8IqSURf1b4KXXrnwE7rm2OgQyssJSpaUmTcs8xZLK/raCxG7jKWc9QH3xEuWZ/KQvlCPAgOPz5Mdbqllh6GBmaE8pboceh+GGY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 483706ace2e951ec
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BFIAIjILSdi41Vv7YqWgpIM4cIm4Pmsl5oLtdjihxh523UeDEPHmgZxNQxhL0I4u+bHmYBfSRF9AFDHurgn0TTlZn1uXnbDFvtVxyy+ItiDKngjqU1dqmbwPUnZZRAQv8e3oM4l7bNWmv5EnnkGVfZM9NEeqjjcIro2HWXcyzUxp/Mzijs3ZfWMeLIT16VAe+TIlu4m6LRuuHFK41EWg6xxGbd+yAW43+UWihXUUA2cAPjgpOEuyDAQs8eo2zCCnZasRHIjh/tW8Y9DmLlNwd4J1Iut5CKgvhk4myFIEMe8KfKRJKcVHoAlaW/f3x+ZTb13uCwV5HY2Ot6QoJn4qrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FSUaZhIJ132fP5dvjR7UOX33VSmQ3hubM795HYhZnO8=;
 b=gCZMUUcuOkKxsNd676rEkkjppeD7WpDRNLT//woOK2VHeK+takVp89Ji1GUQU9j0S1OdDJgDSlw9xD7SE8N7M3WUMRrLKuSGFOh2jiatimt5UU6t3XpmQJzTKhcFgEHoixNLr93z+I0dRSLtPjbBOnjRlhl7DXp+Bmt8g1zCg9dvDt5CLLT4EviJ6dUWwrWlbxcRIAfl9YREq89BOyPW4JUcWGZ2PBnXTM0KNObJ2SKmv7+LruTDepeuqtT5vsHB6dSkqVBsPGMk7KJQYmy2xtrimNH9To6B86Tq5uqFaH/ghO2D239DHCuDANeZ3+bt+CmO5mXR5cPD0LDGN/bg9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FSUaZhIJ132fP5dvjR7UOX33VSmQ3hubM795HYhZnO8=;
 b=KnheMaRuNZ1IRNS2DFGcoqZXaDEOeF8COjEHF/xbeGeXlo2AR65vD0xs+z1zU/4FlJAZJXHzM8IqSURf1b4KXXrnwE7rm2OgQyssJSpaUmTcs8xZLK/raCxG7jKWc9QH3xEuWZ/KQvlCPAgOPz5Mdbqllh6GBmaE8pboceh+GGY=
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
	<jbeulich@suse.com>, <nd@arm.com>
Subject: [PATCH V3 06/10] xen/arm: introduce PGC_reserved
Date: Thu, 15 Jul 2021 05:18:15 +0000
Message-ID: <20210715051819.3073628-7-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210715051819.3073628-1-penny.zheng@arm.com>
References: <20210715051819.3073628-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 83dcba9c-c79d-4ba3-3ba0-08d947500832
X-MS-TrafficTypeDiagnostic: DB7PR08MB3436:|AM0PR08MB3492:
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB349221F2049DE9DDE8D05131F7129@AM0PR08MB3492.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:2276;OLM:2276;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 bUsFFh+gY+lxoHy2rXVi8sAs1bhAPaYBz8YaRahx3vSjFdEmRGbBuwc7UmcY6LmGEZwmW5xIoncU/8JBGAXCBOzmz8eEB3jTanxXScFlVBZqozbALHe6PCyq3b9zlGGVQ13aWAZSwq60KLpjb8CUSvdKcY50E3AY8SW5IBFbKISLrgv3jb//ks5HNSQpkENorBIZ+5DuQnexLsxgLVA1E7Z4Gc8F4yMzKDYrDbtsWo6ok+Y4TryJ7Dz7IcapPZ4bl4kijJaFhmEyH1WVFb3h6I/sSHjzCChLZ7aZMaRfiJe45tmU6ViHj+V9MULSAHcB/y1Uo/Im8eP5bJmLcm0+y0Ew/xPuTK9VBj4Hd6GTeaxi3es9i/I0QAto+EaVrENjV6y0c2bKXz7pY9O2KQenMyCcBp3trnNbBFmc8y65iJ7X2AR9+HA6+RfuYGSvDrYXK3ucoB1eVZs2aejVn6lDim9pZWMDYw/Ph0XYDvtsGSv561LxTEqAshcrmb0VaYltFJV2ya7+WAPOtsxJiDq7ZTD+jFqIMsfRnFjUxB3bhY9Brb1xBu2MvJzCsjf7kI3VkQzV+ICz6UKsvut/pqpMtb41SvPAGSdhSQEBcEw4VP3uA/pYv6j8KBFZ0/8c8nHP/wuGsNZGV8lfn/nBJ92gH9+xZgrzJznYAk38d+pcNu4ESraPEdbgFftmneASW+KrZIj/reVa3KpHhJG9kltLEUjadaJml5r5PDjlX9qshHI=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(39850400004)(346002)(376002)(136003)(396003)(36840700001)(46966006)(356005)(82740400003)(478600001)(36860700001)(5660300002)(8936002)(4326008)(7696005)(1076003)(54906003)(81166007)(186003)(82310400003)(6666004)(86362001)(110136005)(36756003)(2906002)(26005)(70206006)(70586007)(316002)(44832011)(336012)(426003)(2616005)(83380400001)(47076005)(8676002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3436
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	9599777b-5b73-4ec6-5548-08d947500365
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8YBZv2SsJSr1OvLCNsHwiRNacNRSBk4cziLRYKM6EDLyotQzdfmYMhYITnqKrc4SNc/IHbDydnUK3+Z/C8yGTxpktRU0pidyFcYwuJ/O9qhYpGMaaMfwVBHZ97MYmBQxeSg/CE1OxsqAxiy/iamNyYJaxYBOLFtaRkkeRxQTfyjWTLVXklcSqRC5KgeWG2x0BEkfErvkyukuNwCwcdhZQZTftrUS8Z0S1QUABf8KnTGErkzTw9jMh8FKJIiMegs6aHkR3uVDab6UhGUdBNqss9XVOkuJAgZF6M7Yb7vikjGv6SpRMsYo0thPyN8SQAoPDCnU5W2pDgN/VjE/Rii/YBM6v4qbGoM+9pOl0I4qYDGMd4q4KQCM09VY/Xt2LGSBBR+CSXo44NqQ5bGfaiSN50kqeNekgV+NY4rJt20qrqJ9xpWQuwTR3POIXNiOfDmhTU/vr54lq+KOMarCdQW/4irbczkPDGKz9aONiAGJC/01OwsH63eQbrhtwV0w1qAjYGWKoO5DEORsZjfYeWWwFjDv7VJB5JJFwx/3vnbO8mp6wiukevhWU1SU4LqduU5TrRNUCpXo7F8lIUVPjP+Xu2zE3CvxQDA6+MNT9V3wv/9txj1tM+uq0o4lRR1BMnV50OSR9aYDRw/Uqz4ZgQb8nmTSzA2BBOfOO+RCGfU+9k/v1i6OJqrNzkeReSEi0/x9s1zwAes1DtRVLkfoySm6eg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(186003)(316002)(2906002)(8676002)(36860700001)(82310400003)(5660300002)(8936002)(47076005)(6666004)(4326008)(26005)(83380400001)(81166007)(54906003)(110136005)(336012)(426003)(70206006)(2616005)(7696005)(36756003)(1076003)(70586007)(478600001)(44832011)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2021 05:18:51.0031
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 83dcba9c-c79d-4ba3-3ba0-08d947500832
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3492

This patch introduces a new page flag PGC_reserved in order to differentiate
pages of static memory from those allocated from heap.

Mark pages of static memory PGC_reserved when initializing them.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
v3 change:
- introduce PGC_reserved when it is firstly used.
---
 xen/common/page_alloc.c  | 3 +++
 xen/include/asm-arm/mm.h | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index f394d6627a..15edaca227 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -1536,6 +1536,9 @@ void __init free_staticmem_pages(struct page_info *pg, unsigned long nr_mfns,
             /* TODO: asynchronous scrubbing for pages of static memory. */
             scrub_one_page(pg);
         }
+
+        /* In case initializing page of static memory, mark it PGC_reserved. */
+        pg[i].count_info |= PGC_reserved;
     }
 }
 #endif
diff --git a/xen/include/asm-arm/mm.h b/xen/include/asm-arm/mm.h
index ded74d29da..7b5e7b7f69 100644
--- a/xen/include/asm-arm/mm.h
+++ b/xen/include/asm-arm/mm.h
@@ -108,6 +108,9 @@ struct page_info
   /* Page is Xen heap? */
 #define _PGC_xen_heap     PG_shift(2)
 #define PGC_xen_heap      PG_mask(1, 2)
+  /* Page is reserved */
+#define _PGC_reserved     PG_shift(3)
+#define PGC_reserved      PG_mask(1, 3)
 /* ... */
 /* Page is broken? */
 #define _PGC_broken       PG_shift(7)
-- 
2.25.1


