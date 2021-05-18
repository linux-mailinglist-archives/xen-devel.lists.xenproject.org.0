Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DA3F387135
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 07:22:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.128620.241493 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lisBI-0002mh-JR; Tue, 18 May 2021 05:22:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128620.241493; Tue, 18 May 2021 05:22:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lisBI-0002i4-AF; Tue, 18 May 2021 05:22:12 +0000
Received: by outflank-mailman (input) for mailman id 128620;
 Tue, 18 May 2021 05:22:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2je3=KN=arm.com=penny.zheng@srs-us1.protection.inumbo.net>)
 id 1lisBH-00019F-6x
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 05:22:11 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.82]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ffbe51d9-08e8-430c-b575-47a5bd832918;
 Tue, 18 May 2021 05:22:01 +0000 (UTC)
Received: from AM6PR05CA0032.eurprd05.prod.outlook.com (2603:10a6:20b:2e::45)
 by DBAPR08MB5830.eurprd08.prod.outlook.com (2603:10a6:10:1a7::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Tue, 18 May
 2021 05:21:57 +0000
Received: from VE1EUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2e:cafe::88) by AM6PR05CA0032.outlook.office365.com
 (2603:10a6:20b:2e::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend
 Transport; Tue, 18 May 2021 05:21:56 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT020.mail.protection.outlook.com (10.152.18.242) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.25 via Frontend Transport; Tue, 18 May 2021 05:21:56 +0000
Received: ("Tessian outbound ea2c9a942a09:v92");
 Tue, 18 May 2021 05:21:56 +0000
Received: from a5edd8368e23.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C1CEBFC5-4D84-47DC-8713-CC85463C7614.1; 
 Tue, 18 May 2021 05:21:50 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a5edd8368e23.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 18 May 2021 05:21:50 +0000
Received: from AM6PR01CA0047.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::24) by AM8PR08MB6546.eurprd08.prod.outlook.com
 (2603:10a6:20b:355::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Tue, 18 May
 2021 05:21:47 +0000
Received: from AM5EUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:e0:cafe::23) by AM6PR01CA0047.outlook.office365.com
 (2603:10a6:20b:e0::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25 via Frontend
 Transport; Tue, 18 May 2021 05:21:47 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT032.mail.protection.outlook.com (10.152.16.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4129.25 via Frontend Transport; Tue, 18 May 2021 05:21:46 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Tue, 18 May
 2021 05:21:43 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2176.14 via Frontend
 Transport; Tue, 18 May 2021 05:21:41 +0000
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
X-Inumbo-ID: ffbe51d9-08e8-430c-b575-47a5bd832918
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mWXR0/xvkg8fl1DOrhLwDN/UAdqmRXxJdB80UDoJgTw=;
 b=zRqFKgfhKUrXm0Zrx6A5JsqiASeNTzkjJxXJ4sGhNS3J2GDfriW223+WDbWrLN96Mk2v9vhwnm4Zz7dd1b+OubdicpgLKOAglqFF3j2JYY4HGS+p3LswDbtauY2m2jbDLqiHljGzg3izgZfh9Yh+kWiAm75P9Qi+HJ9QGs/gjL4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 0465a10a71ce3249
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iP3BGCR0fld0pDZE3tSsUgSe8073ZIiIzLijEvu1Ik9Fx4BjGBMUJdnFfNLIFR+tYffnRyWEFWrwZv3ymuiZdrGWmHPuawUt90XafcAnHVwAbC0TLknxWAOm1r6l+fbBB3ry8xa2Oss1pnSPL9z/rwNGeA1o/yLqNTG5olwyn792rIs8LTK6hfxEKHVZpdCM46curYQwk83bkKutDcsU8A0G9e0b5mvClvkWPOg9Ta0oXGqR/T8OTnsQQiWr846kV1CeKGKHUcOUO/IgLA5tcC4Z/XhoMefP3acip2JTx/rbI7fcFoaSLV9Wo7B1zLHWoaMEDeDbm6chWSEIdx97lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mWXR0/xvkg8fl1DOrhLwDN/UAdqmRXxJdB80UDoJgTw=;
 b=iquAEduFif0g/09hNY2aabYW+y+n95Q6Ja77IWClB5+KtU+6/QZHdhN6ArYCEVgBYwsCLpEFpZdSK442MBZtFTaD0j2tdD6E7rqmW+aCoxHfIZNMCcUYUwfYKN7EHDcSDVXxAjDyF2eOVSe0x5f9sLd34muLHMF8jee6edrFPRxiNmYEgCs8WF7gcaoAu81KFoNMYr5d7KYTNgva+T/9NadNBCBKDgfYdNtbpWiCQqFCXEDyqk09iDjWN/fwrj7jolwxZWe2R7p4a9StR696GrKcRcdOIzkgU2xxWa3hw4/WD+DXyP3RN5rzjGyEUcZQagRFo81kBsP8bgwMRNpMzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mWXR0/xvkg8fl1DOrhLwDN/UAdqmRXxJdB80UDoJgTw=;
 b=zRqFKgfhKUrXm0Zrx6A5JsqiASeNTzkjJxXJ4sGhNS3J2GDfriW223+WDbWrLN96Mk2v9vhwnm4Zz7dd1b+OubdicpgLKOAglqFF3j2JYY4HGS+p3LswDbtauY2m2jbDLqiHljGzg3izgZfh9Yh+kWiAm75P9Qi+HJ9QGs/gjL4=
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
Subject: [PATCH 05/10] xen/arm: introduce alloc_staticmem_pages
Date: Tue, 18 May 2021 05:21:08 +0000
Message-ID: <20210518052113.725808-6-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210518052113.725808-1-penny.zheng@arm.com>
References: <20210518052113.725808-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 367e8842-5f01-42d4-9d80-08d919bcdade
X-MS-TrafficTypeDiagnostic: AM8PR08MB6546:|DBAPR08MB5830:
X-Microsoft-Antispam-PRVS:
	<DBAPR08MB58304EB4D95A5958D31AEB3EF72C9@DBAPR08MB5830.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:64;OLM:64;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 pozjuBEdLJWPLQ2j9pjfaBPDvZUqeVcREMpRtm7y+CZHk5iokvwhVnvZisXUL6dfcXjnDfcwann0iTr8MP37hcWn2pqkE0j5P5euUg02bi3cLs+EXqkhvvpJK71dULaWxMVkRVaA1ZP1QQherNxP5mhzWUqQoDcLnWqwuwzAZ8A6sDtCiY7sx1qpFrFGL7a/6mwdbY6K/ZZVCWbmgltde9C7rp+j1NchVOxlb3lBEF4aSLC3FN8czNIfO7O8E7rFc7KwnMm5pmc7IapLAHfPTgrmtMLpXL4nfbFsmtKbt5uIxeU75AZJ5HFuE891UT4D65fojiKqpTYOXm7g1kWz/ksYh0GG8vN4+9x/2zPVIXQnaVmZyLrtd2E62nAfhCTpDfKn7lyyqupLXWU0Tuu89O+ArGk8KvtXd0rTwcZHWkUge04aJUgyfNuF9oH+MKOXxhzTgLrPAFYms0MS/bOq50aUr159QVmraqMRtLpt7RPDEwu0aVUUxuB8e9brlXdGL0QtgZMaLwpa7QsVRdGWA7G56XnEHErUoMDcTLivWdyNu/5NrO3fHjAmf9NW/snbecATPIFWRir5XYfQpNHIp5SvRDRoKdR1L13LwIekb1Pihg7gTb6e58dK3KoJrYbKg3d/SuQH1Z9TUw30b3W7znd6JGUw7pb9I4BpC7pnMiWKrWar6gQjeeJSzEudUaHP
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(346002)(136003)(376002)(39850400004)(396003)(36840700001)(46966006)(82740400003)(6666004)(86362001)(8936002)(70206006)(4326008)(1076003)(8676002)(47076005)(44832011)(110136005)(426003)(7696005)(36756003)(70586007)(26005)(82310400003)(478600001)(186003)(316002)(2906002)(5660300002)(2616005)(81166007)(54906003)(336012)(36860700001)(356005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6546
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1a1bd56a-c0ee-4be3-a05a-08d919bcd50a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Cx00cHDr2xGlzBf5u9DoopmiCjUE/x1kBXiXQcgUpQG0rHSrk2DcWZZoShvIcTZEFA0VVeX1jdbkdkwrQpLNNoKj2V0Kk5wFfVPRB4ovhsj27tu9ub788+AKQk1uyU5poUjLyGUTjcrG61BgvEu0W992PP/l+Zoru1XNLtOOgioMrful4dQWFuKoUu0TJYaX0FnMeWY8D0V0BsUt3Cbvezv6DmhELMpDmgPNvrhYmRRZPV8vO4/yydRDZA2vXhE56YhMtL7J530XVyWQc27PwbChDpNjGobAGlzu6SYo7bhKPTrfrnOXYsENpTSzVGMMKXgYBTizO/EYpJRdWfiKzlokmmDbdzXuTUtuwfOep1/ipdJx/COJ0Mcx81QtrnRtoDLr4Gs5n1E+ifsm/WYKtOLbVwllW0tMzw9rOINDBppH5myu8Yjdj1PQ9mn+4+vqd+O/OyUiRXkTFZKQAXfHF693awjVto5pacPyM5mfmgNHNKo4xCtr7DGm97SccypoqhpJRsPp6CUXm7CbjYHA3Gdx7QQX8lgctREq/cG9nolUcT3RBU9RbcTNOYtgycHe8rbPkXQmp4n7V9qkOETDqzhnKg43fVM+rsjgbkReCmZhM6kqp6szg+46J/l+mlFBOPgZLHq4LlYKOl0Pl2d72w==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39850400004)(396003)(136003)(346002)(376002)(36840700001)(46966006)(316002)(2616005)(426003)(8676002)(82310400003)(86362001)(47076005)(36860700001)(1076003)(70586007)(81166007)(478600001)(6666004)(8936002)(110136005)(7696005)(186003)(82740400003)(5660300002)(4326008)(2906002)(36756003)(54906003)(70206006)(26005)(336012)(44832011);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2021 05:21:56.4844
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 367e8842-5f01-42d4-9d80-08d919bcdade
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT020.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5830

alloc_staticmem_pages is designated to allocate nr_pfns contiguous
pages of static memory. And it is the equivalent of alloc_heap_pages
for static memory.
This commit only covers allocating at specified starting address.

For each page, it shall check if the page is reserved
(PGC_reserved) and free. It shall also do a set of necessary
initialization, which are mostly the same ones in alloc_heap_pages,
like, following the same cache-coherency policy and turning page
status into PGC_state_used, etc.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
 xen/common/page_alloc.c | 64 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 58b53c6ac2..adf2889e76 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -1068,6 +1068,70 @@ static struct page_info *alloc_heap_pages(
     return pg;
 }
 
+/*
+ * Allocate nr_pfns contiguous pages, starting at #start, of static memory.
+ * It is the equivalent of alloc_heap_pages for static memory
+ */
+static struct page_info *alloc_staticmem_pages(unsigned long nr_pfns,
+                                                paddr_t start,
+                                                unsigned int memflags)
+{
+    bool need_tlbflush = false;
+    uint32_t tlbflush_timestamp = 0;
+    unsigned int i;
+    struct page_info *pg;
+    mfn_t s_mfn;
+
+    /* For now, it only supports allocating at specified address. */
+    s_mfn = maddr_to_mfn(start);
+    pg = mfn_to_page(s_mfn);
+    if ( !pg )
+        return NULL;
+
+    for ( i = 0; i < nr_pfns; i++)
+    {
+        /*
+         * Reference count must continuously be zero for free pages
+         * of static memory(PGC_reserved).
+         */
+        ASSERT(pg[i].count_info & PGC_reserved);
+        if ( (pg[i].count_info & ~PGC_reserved) != PGC_state_free )
+        {
+            printk(XENLOG_ERR
+                    "Reference count must continuously be zero for free pages"
+                    "pg[%u] MFN %"PRI_mfn" c=%#lx t=%#x\n",
+                    i, mfn_x(page_to_mfn(pg + i)),
+                    pg[i].count_info, pg[i].tlbflush_timestamp);
+            BUG();
+        }
+
+        if ( !(memflags & MEMF_no_tlbflush) )
+            accumulate_tlbflush(&need_tlbflush, &pg[i],
+                                &tlbflush_timestamp);
+
+        /*
+         * Reserve flag PGC_reserved and change page state
+         * to PGC_state_inuse.
+         */
+        pg[i].count_info = (pg[i].count_info & PGC_reserved) | PGC_state_inuse;
+        /* Initialise fields which have other uses for free pages. */
+        pg[i].u.inuse.type_info = 0;
+        page_set_owner(&pg[i], NULL);
+
+        /*
+         * Ensure cache and RAM are consistent for platforms where the
+         * guest can control its own visibility of/through the cache.
+         */
+        flush_page_to_ram(mfn_x(page_to_mfn(&pg[i])),
+                            !(memflags & MEMF_no_icache_flush));
+    }
+
+    if ( need_tlbflush )
+        filtered_flush_tlb_mask(tlbflush_timestamp);
+
+    return pg;
+}
+
 /* Remove any offlined page in the buddy pointed to by head. */
 static int reserve_offlined_page(struct page_info *head)
 {
-- 
2.25.1


