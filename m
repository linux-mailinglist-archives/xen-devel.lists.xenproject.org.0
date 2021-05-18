Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F29B7387134
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 07:22:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.128617.241462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lisB9-0001Wt-Me; Tue, 18 May 2021 05:22:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128617.241462; Tue, 18 May 2021 05:22:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lisB9-0001Mc-Hj; Tue, 18 May 2021 05:22:03 +0000
Received: by outflank-mailman (input) for mailman id 128617;
 Tue, 18 May 2021 05:22:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2je3=KN=arm.com=penny.zheng@srs-us1.protection.inumbo.net>)
 id 1lisB7-00019F-Ot
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 05:22:01 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.56]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 22c98885-b59f-492a-a86c-5ea2549982ed;
 Tue, 18 May 2021 05:21:59 +0000 (UTC)
Received: from AM6P193CA0064.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:8e::41)
 by DB8PR08MB5290.eurprd08.prod.outlook.com (2603:10a6:10:a5::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.31; Tue, 18 May
 2021 05:21:57 +0000
Received: from AM5EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8e:cafe::ee) by AM6P193CA0064.outlook.office365.com
 (2603:10a6:209:8e::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend
 Transport; Tue, 18 May 2021 05:21:57 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT043.mail.protection.outlook.com (10.152.17.43) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.25 via Frontend Transport; Tue, 18 May 2021 05:21:56 +0000
Received: ("Tessian outbound 504317ef584c:v92");
 Tue, 18 May 2021 05:21:56 +0000
Received: from e49ec5f258b2.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 44D1C212-83AF-41CD-A324-6BDCCE7C1ADB.1; 
 Tue, 18 May 2021 05:21:50 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e49ec5f258b2.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 18 May 2021 05:21:50 +0000
Received: from AM6P194CA0017.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::30)
 by AM0PR08MB3474.eurprd08.prod.outlook.com (2603:10a6:208:e1::32) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Tue, 18 May
 2021 05:21:49 +0000
Received: from VE1EUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:90:cafe::5c) by AM6P194CA0017.outlook.office365.com
 (2603:10a6:209:90::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend
 Transport; Tue, 18 May 2021 05:21:49 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT005.mail.protection.outlook.com (10.152.18.172) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4129.25 via Frontend Transport; Tue, 18 May 2021 05:21:49 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Tue, 18 May
 2021 05:21:38 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2176.14 via Frontend
 Transport; Tue, 18 May 2021 05:21:36 +0000
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
X-Inumbo-ID: 22c98885-b59f-492a-a86c-5ea2549982ed
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5J8iLZFedAFmS+5HNJIXYA28hBbm27AI3WM5PMpmaN0=;
 b=x/GM7FDAFvwaDYzkBoyoH2VUTNak9wEY9n1pmmndAdQiLuX/OlmfqO+uxxJL7C8aUtDu73Xjqopo+/trgvc9ULO6yHcn8puL9e79O8/8PZnEnlw8Dbo/EjRVInR1RJy6RxvVjGVcYkODFrh3bSI1NDXmSVs3tRqnqf6HxSoqVio=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1936533a0e7f1746
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AYFQ8chCOUp825RgWfo00oWm/7pxUUD3VTpMLkX/ugTVvHvEwY1ol10k7xB6jEjZl9ml8DaKZQztCdK+J2BzqKVvQcyFwCPJbq95S1CqH/OnlYaZn00kCjTaqCVmilYmURpXzM8X/iLhYgNCcFbG7W6tlOuWP1mCEmuGIVIW+3i9fnxqdKIixuX8qhygoMi1N4IxJFcOsLI7DVIEn6iK8El2Pm2XIGd4EI9gzeD9Mp0C9XoGysjexHDT+Tg/Wl1aImWW6rJacauVkLWyUZUNyT8hNlWXbO/X9D1vH0nnw03BDObtBoF99ZAFcGUji6OSsi+wYcdKY3fE10iMPrrP7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5J8iLZFedAFmS+5HNJIXYA28hBbm27AI3WM5PMpmaN0=;
 b=CuRjXJqhjRQklzzSdIcUwefl5iFeEXgd2iWCTJoZZDnv97tMObotAD6S3ksm9tZsFGJlcgq78u7voAYsMHfokQXEiyiDDu4ZqJeXlIBZAgK82HCCxViNRUsZV8sivFHnTHwLNZtpkDLOyW/XwIMXA5C2PwG+hv7xmrNYoQImsd61hPYwjRdeMXZ/c+dIGqWyYOsRH1+KuLfJYLO44C0bVaaRI0MvpEg4PuOJySBWLQmCjf+iXYtYto2f/+a79C/AT3y0hdigfWyC647W/vEJpsAUnSTkhda6rxaaaqZxgFFnzqvdk+JtUaDAd6/+8l5fcJXoTrg0hi4c2z/4B8Unyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5J8iLZFedAFmS+5HNJIXYA28hBbm27AI3WM5PMpmaN0=;
 b=x/GM7FDAFvwaDYzkBoyoH2VUTNak9wEY9n1pmmndAdQiLuX/OlmfqO+uxxJL7C8aUtDu73Xjqopo+/trgvc9ULO6yHcn8puL9e79O8/8PZnEnlw8Dbo/EjRVInR1RJy6RxvVjGVcYkODFrh3bSI1NDXmSVs3tRqnqf6HxSoqVio=
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
Subject: [PATCH 03/10] xen/arm: introduce PGC_reserved
Date: Tue, 18 May 2021 05:21:06 +0000
Message-ID: <20210518052113.725808-4-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210518052113.725808-1-penny.zheng@arm.com>
References: <20210518052113.725808-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 17dbf392-8957-448f-c17e-08d919bcdb1a
X-MS-TrafficTypeDiagnostic: AM0PR08MB3474:|DB8PR08MB5290:
X-Microsoft-Antispam-PRVS:
	<DB8PR08MB529063D0C2A72AC513BB7E4CF72C9@DB8PR08MB5290.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:2733;OLM:2733;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 IOZYbxKdCQYup2rYlh5fjDhoVqa58RYI7xubtEg5OOX0KLU96wxhLLghb5MzADeNKQADqP4G06dS5hJTSLIfc5phB4/m8Tt0AQwjKUF8I5/g8aGGRIH7PFUSdvVnoIspJsRcq9+7ZfucR9hE0b/C+n/rIfFpGoOggzNasBU44JtiGDBIue3s8fxMo4GURX3C8uhmn5Kq4/MLZeX/YAx4ppDIHH0Bw6M4++vwJpqkIM/cW1kEbvdUPgbL0fwgo0LFoCNrzJI/gZ90RvpfqBOxHhQa/jwYvDDlxKJD04GGKWqr4jZXCypmXI8MxAqPF3JloTwJjvZF8Ta4XmRBn93YyQtpOyKTpnrXTcIVU3wgj4+h6cpY1yR7FTr5vLHYxNTOBBuZP0mIgGpvkc37B8DuNJn/V0cDYHBlH4x4Fc8RhEhZvcBIcXYMNYKQNSYLOkqlWhctqZJUVETK2aR/DFsRjTuhlaLSATa2qcNmbA18Wf0a9vubjDOtZbrXEnq6uTxBwYikMXiirtXqSW5FUCNGmQV9upCUyOes0F9t47w1SSQBIW4gzkIl0zGvpcv8GV6/KxMvVdDe20sEHH2dZV6BBw8lBHVF3Ze7FKNsLJ81k2G/Hxwb6KpVomcL9CJQ3FOwLuMlhC4jxm09pzPpjVOq17mkIZX5OpRghmlLp1806ABr42P7CUlJoYIXG7uFGh6X
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(39850400004)(396003)(46966006)(36840700001)(316002)(86362001)(81166007)(186003)(1076003)(8676002)(110136005)(82740400003)(478600001)(47076005)(8936002)(426003)(36756003)(70206006)(83380400001)(356005)(5660300002)(54906003)(2906002)(82310400003)(336012)(70586007)(4326008)(7696005)(6666004)(44832011)(26005)(2616005)(36860700001)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3474
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ea7cf5e5-212b-48a1-a2d4-08d919bcd677
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tMXJaSvyh+X49EXeU+Ko9a/5bIpUQNTDPZjWdefmLpouE++uFU5Wdt9qRgkqMuVlpFPM0vo/YIWL57p22Tr7WyoYPejBlHkjiYADHIsfFO+iVURIT8rd9QdQYuP8u6tRZiP/kjwKpd1FtuhQKbhAAH00F80bTXuOVKV47VccHzA0k8U+LfhIzvGb/D9V09laVSkNqcJUogcN0tHnhjx4N/ClXmLmgfldlxBWCGwlU2fz/zsp0qPjmQKUhIQ5KxjI0Co5Qv2Aj86LNY+0E17/73zqmHLZFXIhruI643mbCNBw55F1ixsfre1Ls5ESlO+NOgkLJURIVQeQK+pRKBMRU65bGlKAPMKPSST8pBhZZdW8kdzsInEt4C+s1mg9ra/4Y9tn10LWLORSTu2i9WU5T46nbuIQJRPzd9vblOta2qf7bdSlBY86IERrD/yhua/YD06h54ozia2dIsNT3isYw0hXIbf60tX7ljE+rLJLlqx3P3DvCDx6c33R0rc0EujQoOADr6evIn2860DGUKqD1TwEMZoUDc5qxuY+gNLpgmcDhBi+EgwTNmRkaQ4aV1Lnp2/Ry0xYoWEnEBe1VoEDfXKQjZKlcUJk/BE25XN5O91PDuEoOZ8kS5lGEG2OA0luUJIbl/JTixX8RqYLR9NLc6CWMNtc83yR0ab+gGFqbqA=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(396003)(136003)(39850400004)(376002)(46966006)(36840700001)(110136005)(26005)(81166007)(7696005)(82310400003)(478600001)(83380400001)(70586007)(316002)(70206006)(4326008)(36860700001)(47076005)(186003)(82740400003)(2616005)(1076003)(426003)(5660300002)(336012)(8676002)(44832011)(6666004)(86362001)(2906002)(36756003)(8936002)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2021 05:21:56.9625
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17dbf392-8957-448f-c17e-08d919bcdb1a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT043.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5290

In order to differentiate pages of static memory, from those allocated from
heap, this patch introduces a new page flag PGC_reserved to tell.

New struct reserved in struct page_info is to describe reserved page info,
that is, which specific domain this page is reserved to.

Helper page_get_reserved_owner and page_set_reserved_owner are
designated to get/set reserved page's owner.

Struct domain is enlarged to more than PAGE_SIZE, due to newly-imported
struct reserved in struct page_info.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
 xen/include/asm-arm/mm.h | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/xen/include/asm-arm/mm.h b/xen/include/asm-arm/mm.h
index 0b7de3102e..d8922fd5db 100644
--- a/xen/include/asm-arm/mm.h
+++ b/xen/include/asm-arm/mm.h
@@ -88,7 +88,15 @@ struct page_info
          */
         u32 tlbflush_timestamp;
     };
-    u64 pad;
+
+    /* Page is reserved. */
+    struct {
+        /*
+         * Reserved Owner of this page,
+         * if this page is reserved to a specific domain.
+         */
+        struct domain *domain;
+    } reserved;
 };
 
 #define PG_shift(idx)   (BITS_PER_LONG - (idx))
@@ -108,6 +116,9 @@ struct page_info
   /* Page is Xen heap? */
 #define _PGC_xen_heap     PG_shift(2)
 #define PGC_xen_heap      PG_mask(1, 2)
+  /* Page is reserved, referring static memory */
+#define _PGC_reserved     PG_shift(3)
+#define PGC_reserved      PG_mask(1, 3)
 /* ... */
 /* Page is broken? */
 #define _PGC_broken       PG_shift(7)
@@ -161,6 +172,9 @@ extern unsigned long xenheap_base_pdx;
 #define page_get_owner(_p)    (_p)->v.inuse.domain
 #define page_set_owner(_p,_d) ((_p)->v.inuse.domain = (_d))
 
+#define page_get_reserved_owner(_p)    (_p)->reserved.domain
+#define page_set_reserved_owner(_p,_d) ((_p)->reserved.domain = (_d))
+
 #define maddr_get_owner(ma)   (page_get_owner(maddr_to_page((ma))))
 
 #define frame_table ((struct page_info *)FRAMETABLE_VIRT_START)
-- 
2.25.1


