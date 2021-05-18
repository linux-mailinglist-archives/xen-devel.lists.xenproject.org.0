Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 011C3387137
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 07:22:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.128624.241503 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lisBO-0003Qi-3I; Tue, 18 May 2021 05:22:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128624.241503; Tue, 18 May 2021 05:22:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lisBN-0003Lm-Vu; Tue, 18 May 2021 05:22:17 +0000
Received: by outflank-mailman (input) for mailman id 128624;
 Tue, 18 May 2021 05:22:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2je3=KN=arm.com=penny.zheng@srs-us1.protection.inumbo.net>)
 id 1lisBM-00019F-73
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 05:22:16 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.15.48]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ffa3db3a-c3a6-4fde-b98f-8d43feb17dde;
 Tue, 18 May 2021 05:22:08 +0000 (UTC)
Received: from AM6P193CA0119.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:85::24)
 by HE1PR0801MB1850.eurprd08.prod.outlook.com (2603:10a6:3:86::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Tue, 18 May
 2021 05:22:05 +0000
Received: from AM5EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:85:cafe::88) by AM6P193CA0119.outlook.office365.com
 (2603:10a6:209:85::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.32 via Frontend
 Transport; Tue, 18 May 2021 05:22:05 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT004.mail.protection.outlook.com (10.152.16.163) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.25 via Frontend Transport; Tue, 18 May 2021 05:22:05 +0000
Received: ("Tessian outbound 3c287b285c95:v92");
 Tue, 18 May 2021 05:22:04 +0000
Received: from e6e41f494c34.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6002B449-B487-40A5-A21B-C21F9B34A70E.1; 
 Tue, 18 May 2021 05:21:58 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e6e41f494c34.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 18 May 2021 05:21:58 +0000
Received: from AM6P194CA0036.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::49)
 by DBBPR08MB6314.eurprd08.prod.outlook.com (2603:10a6:10:20f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Tue, 18 May
 2021 05:21:56 +0000
Received: from VE1EUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:90:cafe::10) by AM6P194CA0036.outlook.office365.com
 (2603:10a6:209:90::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend
 Transport; Tue, 18 May 2021 05:21:56 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT005.mail.protection.outlook.com (10.152.18.172) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4129.25 via Frontend Transport; Tue, 18 May 2021 05:21:56 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2176.14; Tue, 18 May
 2021 05:21:49 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.14; Tue, 18
 May 2021 05:21:49 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2176.14 via Frontend
 Transport; Tue, 18 May 2021 05:21:47 +0000
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
X-Inumbo-ID: ffa3db3a-c3a6-4fde-b98f-8d43feb17dde
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZE+hOEo1iLiVZbrYdwypFc9m8SMes4QkXJwoF5cLLCI=;
 b=A8z/3Jxdey1736gclVsCGXTKdwqJJz09tMR1UFWSSyjbSXE9MGOZINe24d7v0xafWulN8eenAOdGopUeDxZHby/yjaemWRjCwq3PCO3e+aCi1Nz3Lz56tBCKjKNOi6WVsXx3MyTMMTgZoHzzoIjQdmRrYTigRyXJxbjE4K0opBc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1d38469fbf5448af
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FCtIR/RVhesXgjkJHQGF9EjRi7lTkaz/TATKyOncArQXgMZ5K+8aHWA12A3MHcOJmel90Og6Nhasi8MWFTwoJAg6XY/gzGfYejKZAviC89TQeIx/i4qv7IL1YYjNqiA+aFN5aR6Z0pGjEpQ+NgKje0IcK1x0w5NpDs0VM7A//2UTlRFkWUO0+MTrkXFt9RF0e4PPnA5ye0oLow/Rq6v4QO4H2PaSuV5s9NLeHEo096CGFSSWtYIQi8eJJvsRgRYuChXuc7S5rYN0v8zANbsfVj1TESbGged3vbYvaomXJdcaZuChTi4ZNjFy0dA6TWJD3zOsJFmH/1AURpPGrfImyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZE+hOEo1iLiVZbrYdwypFc9m8SMes4QkXJwoF5cLLCI=;
 b=VjwXAY/5BMymAUmTnnGwMxb/gtiIeU+cji14rGREjDA+MP9rEKWnDGBl2yHpodrKvqFvF+cLmI/fN2J5xw6Mx1bykYi45PkUfCpUt/njKlztPU+BQN/XT0bAfxoVOXCSFTLc25ylU4hfSNzpPCIPeZtmvV2a7B1bFSybdA6F84N2HZSuSob0zVcEFji6WyHjF6e0KmI90eYK7gFERdzVu8k6wamFtHk6ICACE1pn/YpiOM2t8rgZyYrmheZRz7N5I1tu7PQK15l6IE+2joGehiZojd//cFJu8D8Hw8XcxLx9Q5BUiovuVsm2z3LJLe2ne0p1hIgwd/ZSgbyFKmoHTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZE+hOEo1iLiVZbrYdwypFc9m8SMes4QkXJwoF5cLLCI=;
 b=A8z/3Jxdey1736gclVsCGXTKdwqJJz09tMR1UFWSSyjbSXE9MGOZINe24d7v0xafWulN8eenAOdGopUeDxZHby/yjaemWRjCwq3PCO3e+aCi1Nz3Lz56tBCKjKNOi6WVsXx3MyTMMTgZoHzzoIjQdmRrYTigRyXJxbjE4K0opBc=
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
Subject: [PATCH 07/10] xen/arm: intruduce alloc_domstatic_pages
Date: Tue, 18 May 2021 05:21:10 +0000
Message-ID: <20210518052113.725808-8-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210518052113.725808-1-penny.zheng@arm.com>
References: <20210518052113.725808-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 337c6998-d82d-4726-f50e-08d919bce017
X-MS-TrafficTypeDiagnostic: DBBPR08MB6314:|HE1PR0801MB1850:
X-Microsoft-Antispam-PRVS:
	<HE1PR0801MB18507C21EB9421B437C15292F72C9@HE1PR0801MB1850.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 N0cvI42XJ3Wn/KwSal7wBIvhv5hDDhMQnllxpDKfddcNR2RaCEyLk44ft/YipEa7J7AAZ2DOVxNDYTK3VOJRhY5ya8nOPI07KBrMJ7BT/UtSyG9T3Xu+4GJPoOyX42ku7pPS9S4v8vL8MFrAzAV/AEgf7R3w/oTGNtVXLZbrMhuqTL0cHwdnoS9AkLd4hgALVhp7y2Jlf1GuTPjQSnXgeTwCTWQXo0I7qwFFtPVjvNgvaKaeMuLDksMPlphPsNM+Ac/xjnmucYQYAr91+ONERoKjpSEyCv0UYt+q48EN/gYHYOs0m2jpBGt1C/kV1jfO2mPESl1fV+mz1SVl8V4YjkCKx00mi9rxAooISlv2S2G+TLiq3b2P2bGSzMrovivyOs8Gkqcw6msUobLQD5349hXflMJFkvz7NuYEV6rao0BJgHIn8T6uNzHPeycj7//gZxXOfOzUrfxG2+TNw3WZlJhR2u462SXEDRixba0IMMMHJbfik5mFfALgk1Ey7n8hQ0ygkoDdGwqBFArZCdkfF1vUV2nkz29wIVoAC/7d0bFunHIo8kV5ZSt1dF1tR1DFP2yyZaR6PKSnALo5Vp6hwEe0bleVW0n/pJb38O0334ktvg8Ee9S226rfSr76BXFrEmYPfPc/SayEGw65yFkjtVNInbP0D3HZWbsCXonJ0ZZ7x2u0RAUfEuqv/LBjZUtg
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(39850400004)(396003)(46966006)(36840700001)(36756003)(2616005)(83380400001)(36860700001)(82310400003)(86362001)(6666004)(336012)(478600001)(8936002)(7696005)(2906002)(82740400003)(44832011)(426003)(70206006)(81166007)(70586007)(316002)(8676002)(5660300002)(186003)(1076003)(356005)(47076005)(54906003)(4326008)(26005)(110136005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB6314
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	a040dca4-7c1f-477c-dbd6-08d919bcda99
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	KzMZVs4BLGX2lhVgTBdihpq5Ma33oRbAAZ7AY+SwYq6MrNfLVAtkB3G2CFS43zUBnl24KqeYC3Zmm86pym1b0jcBM3M7UTYuLryjxeKOn1cL9lO4siNRnTprdiVy0MOai3oxkl1HM1QPETEOjoBCNW15+WbsMeVR2s2adevEewF/q/sZ4/flpjnOI9g9pgsq9t/pYHDYLTl0DrGr015IEzv3gpwz092l8s+Od7YMXlLO5DYs4FUZnuhbmndBmLe0Ekgh1wwRAIrQj1Q9m8Be68yEyDEbRvIR/C245GQvj9/Wzy78PbTxQj5qStLlNRzmzwiH2jM5BpypSV80a+oOAmxY9jKyBtuDf3y+bAvbf3uKZQOKVeP6yknM6UzAabQuUsldsyHu/zyk5A8R5lTjRBchUcMsINLB+8a8h6LG3DTlla9bl+PHAr7BJyB5dVB1DsiW4MkNjMmBTecjoF10ZfJKTmqo4HYI4dxWWdhBzg4XtuAP39uPDz6eOQ5cGcak5Lmb5JK8FYAjj/8kXpL6nVGhM87xcO/uRaMi0odLuL3nYz2WuTQXOiZujZdte2dXghmlC9v59IHS2Zc+01E6aXZRYkXRIRybxD5oQ3rTY8ppr9E6bXhprr20y1Eop6fi+WdsX8FUE/yRlCwOjQYLlQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(396003)(346002)(39850400004)(136003)(46966006)(36840700001)(26005)(36860700001)(54906003)(86362001)(47076005)(8676002)(2906002)(36756003)(478600001)(110136005)(186003)(81166007)(6666004)(336012)(2616005)(316002)(1076003)(70586007)(5660300002)(83380400001)(70206006)(44832011)(8936002)(82740400003)(7696005)(4326008)(426003)(82310400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2021 05:22:05.3279
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 337c6998-d82d-4726-f50e-08d919bce017
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0801MB1850

alloc_domstatic_pages is the equivalent of alloc_domheap_pages for
static mmeory, and it is to allocate nr_pfns pages of static memory
and assign them to one specific domain.

It uses alloc_staticmen_pages to get nr_pages pages of static memory,
then on success, it will use assign_pages to assign those pages to
one specific domain, including using page_set_reserved_owner to set its
reserved domain owner.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
 xen/common/page_alloc.c | 53 +++++++++++++++++++++++++++++++++++++++++
 xen/include/xen/mm.h    |  4 ++++
 2 files changed, 57 insertions(+)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 0eb9f22a00..f1f1296a61 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -2447,6 +2447,9 @@ int assign_pages(
     {
         ASSERT(page_get_owner(&pg[i]) == NULL);
         page_set_owner(&pg[i], d);
+        /* use page_set_reserved_owner to set its reserved domain owner. */
+        if ( (pg[i].count_info & PGC_reserved) )
+            page_set_reserved_owner(&pg[i], d);
         smp_wmb(); /* Domain pointer must be visible before updating refcnt. */
         pg[i].count_info =
             (pg[i].count_info & PGC_extra) | PGC_allocated | 1;
@@ -2509,6 +2512,56 @@ struct page_info *alloc_domheap_pages(
     return pg;
 }
 
+/*
+ * Allocate nr_pfns contiguous pages, starting at #start, of static memory,
+ * then assign them to one specific domain #d.
+ * It is the equivalent of alloc_domheap_pages for static memory.
+ */
+struct page_info *alloc_domstatic_pages(
+        struct domain *d, unsigned long nr_pfns, paddr_t start,
+        unsigned int memflags)
+{
+    struct page_info *pg = NULL;
+    unsigned long dma_size;
+
+    ASSERT(!in_irq());
+
+    if ( memflags & MEMF_no_owner )
+        memflags |= MEMF_no_refcount;
+
+    if ( !dma_bitsize )
+        memflags &= ~MEMF_no_dma;
+    else
+    {
+        dma_size = 1ul << bits_to_zone(dma_bitsize);
+        /* Starting address shall meet the DMA limitation. */
+        if ( dma_size && start < dma_size )
+            return NULL;
+    }
+
+    pg = alloc_staticmem_pages(nr_pfns, start, memflags);
+    if ( !pg )
+        return NULL;
+
+    if ( d && !(memflags & MEMF_no_owner) )
+    {
+        if ( memflags & MEMF_no_refcount )
+        {
+            unsigned long i;
+
+            for ( i = 0; i < nr_pfns; i++ )
+                pg[i].count_info = PGC_extra;
+        }
+        if ( assign_pages(d, pg, nr_pfns, memflags) )
+        {
+            free_staticmem_pages(pg, nr_pfns, memflags & MEMF_no_scrub);
+            return NULL;
+        }
+    }
+
+    return pg;
+}
+
 void free_domheap_pages(struct page_info *pg, unsigned int order)
 {
     struct domain *d = page_get_owner(pg);
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index dcf9daaa46..e45987f0ed 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -111,6 +111,10 @@ unsigned long __must_check domain_adjust_tot_pages(struct domain *d,
 int domain_set_outstanding_pages(struct domain *d, unsigned long pages);
 void get_outstanding_claims(uint64_t *free_pages, uint64_t *outstanding_pages);
 
+/* Static Memory */
+struct page_info *alloc_domstatic_pages(struct domain *d,
+        unsigned long nr_pfns, paddr_t start, unsigned int memflags);
+
 /* Domain suballocator. These functions are *not* interrupt-safe.*/
 void init_domheap_pages(paddr_t ps, paddr_t pe);
 struct page_info *alloc_domheap_pages(
-- 
2.25.1


