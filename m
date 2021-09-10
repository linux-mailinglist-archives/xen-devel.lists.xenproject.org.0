Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 917C64065D7
	for <lists+xen-devel@lfdr.de>; Fri, 10 Sep 2021 04:53:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.183878.332294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOWfQ-0007c8-Kk; Fri, 10 Sep 2021 02:53:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 183878.332294; Fri, 10 Sep 2021 02:53:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOWfQ-0007a0-GE; Fri, 10 Sep 2021 02:53:28 +0000
Received: by outflank-mailman (input) for mailman id 183878;
 Fri, 10 Sep 2021 02:53:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I6Hc=OA=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1mOWfO-0004S2-Sb
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 02:53:26 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.67]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ed32ae24-4cbf-446e-a3c5-fa9207010020;
 Fri, 10 Sep 2021 02:53:01 +0000 (UTC)
Received: from AM0PR10CA0067.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:15::20)
 by DU2PR08MB7325.eurprd08.prod.outlook.com (2603:10a6:10:2e4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Fri, 10 Sep
 2021 02:52:59 +0000
Received: from VE1EUR03FT008.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:15:cafe::ce) by AM0PR10CA0067.outlook.office365.com
 (2603:10a6:208:15::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Fri, 10 Sep 2021 02:52:59 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT008.mail.protection.outlook.com (10.152.18.75) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Fri, 10 Sep 2021 02:52:59 +0000
Received: ("Tessian outbound e27daf245730:v103");
 Fri, 10 Sep 2021 02:52:58 +0000
Received: from 34fcc7f94187.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 F7C93D37-C100-4FDC-8380-E3355918ACA6.1; 
 Fri, 10 Sep 2021 02:52:52 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 34fcc7f94187.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 10 Sep 2021 02:52:52 +0000
Received: from AS8PR04CA0074.eurprd04.prod.outlook.com (2603:10a6:20b:313::19)
 by VE1PR08MB5838.eurprd08.prod.outlook.com (2603:10a6:800:1a7::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17; Fri, 10 Sep
 2021 02:52:48 +0000
Received: from AM5EUR03FT024.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:313:cafe::2) by AS8PR04CA0074.outlook.office365.com
 (2603:10a6:20b:313::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Fri, 10 Sep 2021 02:52:48 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT024.mail.protection.outlook.com (10.152.16.175) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4478.19 via Frontend Transport; Fri, 10 Sep 2021 02:52:48 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Fri, 10 Sep
 2021 02:52:51 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Fri, 10 Sep 2021 02:52:49 +0000
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
X-Inumbo-ID: ed32ae24-4cbf-446e-a3c5-fa9207010020
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qka5FohwRchLmsQOFo9yjoRS80zQ82TnqHEM4A+5Y08=;
 b=6jMJB6WLgu5Jruu1Bq3Evw3lOvPlUOPorN4UB2DbybVwGSxHzrRaZ2bF96yYrXy7KW5HmC3bYI5zpQSno54u5voJ1p1myAenEBDlOvRnBIBDW3WKoAjjb2R7x5lkQaG0ogkXJU1l1gOynWWPGb274jz3PrFvSvKzmudB8ln6Tr4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: bee34eeaa078c05d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RuPjdp1LkdQs3N94bhUpqCKd2cRAGtBnjd6as9qImAd4WiIoNB1/+7HWhXanxE/BAYB/jXxfawmzr7N5m3QQGCS+2WoY424jFEHBr8adnfeIljxXzEjXblUtOg2mahGziCBI3EwqrJ4dTlw8wqaKkvcQXegpaPqmqqkDl5qw/RavHIgd94PBghN3PxUDlxEMt523PjsPM+mBh3NTyWCWsTS2EUyEw7k2TNGDn43gaZtck7Lp7gq3zJoJHQnVr2vUtveUEMwwIociMXwpBr2wdaYH9anECEojLaSxft3itBeYWajc2WSsm8sEHj8BesZ1vMyRZaRjXs5RKUrVljmjBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Qka5FohwRchLmsQOFo9yjoRS80zQ82TnqHEM4A+5Y08=;
 b=G0lqfNRDsaVnFOwwYgPLG+rDDLY5rBJpfk+CKmnHwDGazr16oFC1zurRNbUgaAC4MqGY6yraqE5VdsoepR6P+9k9EWoQ0Dw2p+5nChzdVfOXzGJ+hdkgkddftd1M5YoRR/hrbtin50VvLuWYa0aOkANrS6LFwrFNtvOVLzwqc/QK62GJOcGZDaKUIKQKWEMBZVrO6IKfhk7fg7NI0DI2eCbaXBJq4mge293xGO+J3WEx8ivt1VojuGjbpsWinbvf2cUfxXqJa2Q4sqrvCc1VEW93ubvx0gKlko+1mlWs+wSdOFCiW9IG3/YiEg9uzmFtYKDlB36hJ3/CAvAhvDFk2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qka5FohwRchLmsQOFo9yjoRS80zQ82TnqHEM4A+5Y08=;
 b=6jMJB6WLgu5Jruu1Bq3Evw3lOvPlUOPorN4UB2DbybVwGSxHzrRaZ2bF96yYrXy7KW5HmC3bYI5zpQSno54u5voJ1p1myAenEBDlOvRnBIBDW3WKoAjjb2R7x5lkQaG0ogkXJU1l1gOynWWPGb274jz3PrFvSvKzmudB8ln6Tr4=
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
CC: <Bertrand.Marquis@arm.com>, <Wei.Chen@arm.com>, <jbeulich@suse.com>
Subject: [PATCH v7 5/7] xen: re-define assign_pages and introduce a new function assign_page
Date: Fri, 10 Sep 2021 02:52:13 +0000
Message-ID: <20210910025215.1671073-6-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210910025215.1671073-1-penny.zheng@arm.com>
References: <20210910025215.1671073-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d82fe461-5d74-49e7-c1b5-08d974061950
X-MS-TrafficTypeDiagnostic: VE1PR08MB5838:|DU2PR08MB7325:
X-Microsoft-Antispam-PRVS:
	<DU2PR08MB73250D6C88353CE7B3D38964F7D69@DU2PR08MB7325.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Z+FRo+RfN5ZisZvPsYpoe2Cu+G9Qf/vHP9BH5spmL0ZDah5VzmXZZ1DicNSiDm6VbyRyiMAE/431/EDRisP9Jr75JFMGedJNDH3MIfyGBaQjCPJNrXolRqOsDvwNVlsBHvdubhA89b9tmxGP2KpWffSaFaTPpHuobUtQr+fwndIvjr09H1SgJVWssdGDWSCPLuA5hwTpz7j1S9V3FTcXnPc6k2fo5iTKAfhXagBkOu5Yc8C7gmCDDgZ79Xif2R2e2+Qwl7gdQgTEWYb3oy+T7JiYi29ojqABkO4y2vqYhTK5lbfkUIxAxO2FDXLY7ukBzE+G0kF7YxIhxp1oumSnZomyebX2RLwkDKbZYxd13Uori4hrtqFlFj3ZjS+BBJmwIr5W8OT7ikyU/j8C3HfLSTtZ5Y/AHZ2lQkqdj+zBYGs+FJlUG+mIbwhcgHkWcR/nSBd8bOAXUIOCk+38RMy1fX5m4pUSzbcvuoieSPNrJRV4OmFhHawDJC7VZg7Ehl5gSABTdp/nC6zp50DrhTSMcnGd7Xoa9cS3TM44xCZCvPk1QJd2fHVSnwserbb29aJYDqRblqsNaI3ImPbUHCJ47O3j/BbhyTMiybwDgHXmmc+SXhoWYiHkULweiuI98f/U1fVh2Gkb1x53qPOphZteWk1hcKtdFpfxyncIQPGV5F/GE9fPtCJw8GHzWP7Ft15swz2ZkO9HN8SHv5geIPeNhaO432jdqu3sSkjUrbOcgLU=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(39860400002)(136003)(36840700001)(46966006)(1076003)(83380400001)(426003)(8676002)(36756003)(478600001)(8936002)(2906002)(316002)(44832011)(82310400003)(47076005)(186003)(54906003)(70206006)(336012)(2616005)(86362001)(110136005)(36860700001)(70586007)(6666004)(26005)(356005)(4326008)(5660300002)(7696005)(81166007)(82740400003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5838
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	17b54f2f-5173-45f4-ba8f-08d9740612c8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	p9d9q0VWXuc7PauQJZRdcIZWexwBjmWhcPMqVQY2LkjQ9qFi6qwrRt1d03VI35biHsyd7FpfEKADBOnEbnZMJ4qPnV4KBpVOXpxzkhgRSVxX4XSfkdE8u34Oi1Iy1pqvBqgt5oIdmli/K5qPxOTtp7zPtei48RUM0tMITxDDNgm/O0fgiMBOF4X2Nr5zXgUiznzS3syQWSa3U/bMDUkxIPLvk6x5gH/AfQcpA44YIQSM68bcV0W/G7TMfjpI/Sk2eiGQR+3/eI+er+QUfDiT4U+iAdDVBYdEy+8XaijqiWgBlhI66t60BfybNumYct8xDAEpIfevWxE7yHlGu7PrcWq7Uwh5preNr37zUMhnEfLiberZQGSqPPxB0ndBg7GYTJsH0eikjPqhdIN3rLcoAjfD2gkDJM+hlI3qhBqDAZ2pVN/lLC+upwhG3FxdYou7KRsJurAGZ14cULZpO8LPJwF5BJTWZVej9g74e9Nxh1YK/QB3ZQ5kj6rd9AiD5jpD28ax0B9xNhizXFLdn80wKYqsFAwy7Fxupo6+pGAtjlcPqT0IjxyW9WAh4jfG8jG395gMiYngEkQxNTinK6xgn4kRvJoHuRSmNXgfaFVgA70AXdXRYYzgRNagUKBmyIMpnu0cDF24zxd13xVhGKz9WRVFt+FoRBS8DJd/LCOX6JjrS/WENABM1XCZFAQqaKvb
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(346002)(376002)(39860400002)(136003)(46966006)(36840700001)(7696005)(82310400003)(54906003)(186003)(70206006)(1076003)(70586007)(336012)(8676002)(82740400003)(47076005)(81166007)(4326008)(86362001)(36756003)(110136005)(316002)(2906002)(44832011)(107886003)(5660300002)(2616005)(6666004)(8936002)(426003)(36860700001)(478600001)(26005)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2021 02:52:59.1775
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d82fe461-5d74-49e7-c1b5-08d974061950
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR08MB7325

In order to deal with the trouble of count-to-order conversion when page number
is not in a power-of-two, this commit re-define assign_pages for nr pages and
assign_page for original page with a single order.

Backporting confusion could be helped by altering the order of assign_pages
parameters, such that the compiler would point out that adjustments at call
sites are needed.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
 xen/arch/x86/pv/dom0_build.c |  2 +-
 xen/common/grant_table.c     |  2 +-
 xen/common/memory.c          |  6 +++---
 xen/common/page_alloc.c      | 23 ++++++++++++++---------
 xen/include/xen/mm.h         |  6 ++++++
 5 files changed, 25 insertions(+), 14 deletions(-)

diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index d7f9e04b28..77efd3918c 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -568,7 +568,7 @@ int __init dom0_construct_pv(struct domain *d,
         else
         {
             while ( count-- )
-                if ( assign_pages(d, mfn_to_page(_mfn(mfn++)), 0, 0) )
+                if ( assign_pages(mfn_to_page(_mfn(mfn++)), 1, d, 0) )
                     BUG();
         }
         initrd->mod_end = 0;
diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index e80f8d044d..fe1fc11b22 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -2358,7 +2358,7 @@ gnttab_transfer(
          * is respected and speculative execution is blocked accordingly
          */
         if ( unlikely(!evaluate_nospec(okay)) ||
-            unlikely(assign_pages(e, page, 0, MEMF_no_refcount)) )
+            unlikely(assign_pages(page, 1, e, MEMF_no_refcount)) )
         {
             bool drop_dom_ref;
 
diff --git a/xen/common/memory.c b/xen/common/memory.c
index 74babb0bd7..63642278fd 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -728,8 +728,8 @@ static long memory_exchange(XEN_GUEST_HANDLE_PARAM(xen_memory_exchange_t) arg)
         /* Assign each output page to the domain. */
         for ( j = 0; (page = page_list_remove_head(&out_chunk_list)); ++j )
         {
-            if ( assign_pages(d, page, exch.out.extent_order,
-                              MEMF_no_refcount) )
+            if ( assign_page(page, exch.out.extent_order, d,
+                             MEMF_no_refcount) )
             {
                 unsigned long dec_count;
                 bool_t drop_dom_ref;
@@ -797,7 +797,7 @@ static long memory_exchange(XEN_GUEST_HANDLE_PARAM(xen_memory_exchange_t) arg)
      * cleared PGC_allocated.
      */
     while ( (page = page_list_remove_head(&in_chunk_list)) )
-        if ( assign_pages(d, page, 0, MEMF_no_refcount) )
+        if ( assign_pages(page, 1, d, MEMF_no_refcount) )
         {
             BUG_ON(!d->is_dying);
             free_domheap_page(page);
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index ba7adc80db..2aa8edac8c 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -2259,9 +2259,9 @@ void init_domheap_pages(paddr_t ps, paddr_t pe)
 
 
 int assign_pages(
-    struct domain *d,
     struct page_info *pg,
-    unsigned int order,
+    unsigned long nr,
+    struct domain *d,
     unsigned int memflags)
 {
     int rc = 0;
@@ -2281,7 +2281,7 @@ int assign_pages(
     {
         unsigned int extra_pages = 0;
 
-        for ( i = 0; i < (1ul << order); i++ )
+        for ( i = 0; i < nr; i++ )
         {
             ASSERT(!(pg[i].count_info & ~PGC_extra));
             if ( pg[i].count_info & PGC_extra )
@@ -2290,18 +2290,18 @@ int assign_pages(
 
         ASSERT(!extra_pages ||
                ((memflags & MEMF_no_refcount) &&
-                extra_pages == 1u << order));
+                extra_pages == nr));
     }
 #endif
 
     if ( pg[0].count_info & PGC_extra )
     {
-        d->extra_pages += 1u << order;
+        d->extra_pages += nr;
         memflags &= ~MEMF_no_refcount;
     }
     else if ( !(memflags & MEMF_no_refcount) )
     {
-        unsigned int tot_pages = domain_tot_pages(d) + (1 << order);
+        unsigned int tot_pages = domain_tot_pages(d) + nr;
 
         if ( unlikely(tot_pages > d->max_pages) )
         {
@@ -2313,10 +2313,10 @@ int assign_pages(
     }
 
     if ( !(memflags & MEMF_no_refcount) &&
-         unlikely(domain_adjust_tot_pages(d, 1 << order) == (1 << order)) )
+         unlikely(domain_adjust_tot_pages(d, nr) == nr) )
         get_knownalive_domain(d);
 
-    for ( i = 0; i < (1 << order); i++ )
+    for ( i = 0; i < nr; i++ )
     {
         ASSERT(page_get_owner(&pg[i]) == NULL);
         page_set_owner(&pg[i], d);
@@ -2331,6 +2331,11 @@ int assign_pages(
     return rc;
 }
 
+int assign_page(struct page_info *pg, unsigned int order, struct domain *d,
+                unsigned int memflags)
+{
+    return assign_pages(pg, 1UL << order, d, memflags);
+}
 
 struct page_info *alloc_domheap_pages(
     struct domain *d, unsigned int order, unsigned int memflags)
@@ -2373,7 +2378,7 @@ struct page_info *alloc_domheap_pages(
                 pg[i].count_info = PGC_extra;
             }
         }
-        if ( assign_pages(d, pg, order, memflags) )
+        if ( assign_page(pg, order, d, memflags) )
         {
             free_heap_pages(pg, order, memflags & MEMF_no_scrub);
             return NULL;
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index 8e8fb5a615..9d6a45174e 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -132,9 +132,15 @@ int query_page_offline(mfn_t mfn, uint32_t *status);
 void heap_init_late(void);
 
 int assign_pages(
+    struct page_info *pg,
+    unsigned long nr,
     struct domain *d,
+    unsigned int memflags);
+
+int assign_page(
     struct page_info *pg,
     unsigned int order,
+    struct domain *d,
     unsigned int memflags);
 
 /* Dump info to serial console */
-- 
2.25.1


