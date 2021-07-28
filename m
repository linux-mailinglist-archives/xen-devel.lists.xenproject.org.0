Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94DF33D8BB8
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jul 2021 12:29:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.161426.296440 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8go6-0005eL-Lw; Wed, 28 Jul 2021 10:28:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 161426.296440; Wed, 28 Jul 2021 10:28:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8go6-0005aM-HR; Wed, 28 Jul 2021 10:28:58 +0000
Received: by outflank-mailman (input) for mailman id 161426;
 Wed, 28 Jul 2021 10:28:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UQNy=MU=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1m8go4-0004GY-D6
 for xen-devel@lists.xenproject.org; Wed, 28 Jul 2021 10:28:56 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.82]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 97bca0a4-ef8e-11eb-9786-12813bfff9fa;
 Wed, 28 Jul 2021 10:28:48 +0000 (UTC)
Received: from AM7PR04CA0005.eurprd04.prod.outlook.com (2603:10a6:20b:110::15)
 by DB7PR08MB4619.eurprd08.prod.outlook.com (2603:10a6:10:7d::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.28; Wed, 28 Jul
 2021 10:28:46 +0000
Received: from AM5EUR03FT056.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:110:cafe::28) by AM7PR04CA0005.outlook.office365.com
 (2603:10a6:20b:110::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.17 via Frontend
 Transport; Wed, 28 Jul 2021 10:28:45 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT056.mail.protection.outlook.com (10.152.17.224) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.24 via Frontend Transport; Wed, 28 Jul 2021 10:28:45 +0000
Received: ("Tessian outbound 69e1fde53269:v100");
 Wed, 28 Jul 2021 10:28:44 +0000
Received: from 039df29cc42c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B89B1D88-8B61-4AC3-BA55-DD72599D427F.1; 
 Wed, 28 Jul 2021 10:28:38 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 039df29cc42c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 28 Jul 2021 10:28:38 +0000
Received: from AM6P194CA0025.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::38)
 by AM0PR08MB5106.eurprd08.prod.outlook.com (2603:10a6:208:160::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.31; Wed, 28 Jul
 2021 10:28:36 +0000
Received: from VE1EUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:90:cafe::1f) by AM6P194CA0025.outlook.office365.com
 (2603:10a6:209:90::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18 via Frontend
 Transport; Wed, 28 Jul 2021 10:28:36 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT055.mail.protection.outlook.com (10.152.19.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4352.24 via Frontend Transport; Wed, 28 Jul 2021 10:28:36 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Wed, 28 Jul
 2021 10:28:32 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2176.14 via Frontend
 Transport; Wed, 28 Jul 2021 10:28:30 +0000
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
X-Inumbo-ID: 97bca0a4-ef8e-11eb-9786-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HF/qyGehAhKUdJPQWT1CPjsg2X/NGFj5Lk0x43C30TM=;
 b=cdPPUcV+1e8SXkIsZs1gg9C7NiEkbe9aVZY8iutpj+rMIt4VtYMaItEmsIo7HyoljpgVuOEa/pXxoHyrRrPDQGqv68uMv041RChQRUvN7oUHHXCd7bVmlXlfJsRTWazSP7sZAv7VA2+QTQS2UMjgJSZYISZ+AKO++IImP6j/Wiw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: bb1446495a968a1b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=U2IrLBCRJtYs2MOOM6mD3+8Eym8tzTSVtAYbT/RT/4tHrDxhKoGsV5D8vl07fe7UJRdHoY8AqseEMrouuW6giR+S70its4G+ComJPXWNN+wGNsiZjIpsLzmypXepftJlGZ9xzfe9/mw1lbD7QGb3YTTnXWsq5pY1Xlty/MioTu6BK8kSG/W0k3wKt7qsLN9gyYUoW/q2ECLRSel2zuxN0J/5ZM5usIjOp4WAdDRigmDidU2rNFbct/kp42KAesmB6OeQ0NP2w2unr89wjsBk6tlhhfxkDjkZtBzuKWDNojiztqDXQSLHWtGB8sua6FxYvWo9O0HaJCpOW2tjVecANQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HF/qyGehAhKUdJPQWT1CPjsg2X/NGFj5Lk0x43C30TM=;
 b=Df/IECZkkgsiOalG3lSABQTk3SKhBcw9GJ6AnxsmSSvftIg6Vg0UeE6zp+uBgNMqMjIthk9px3K1ozTMP6XEKVLjXJYDE0RKN4RuwPM1WQyWjbxAk9ogXY8n030FoE+8kOH6gnhT57334hajIOqEJPSj2fZQYCAWYXBOSP5u1G/SrL4Y9blPalrbAJ22N7qui3jf8LYRVBxml6sFWFPVmn1UWrK5ysM7Dm4ZIZFtwnGa0P2UDfbOnvfN1XmRzRNsTReZRthfvk6ShNW9aS3cJa4aUgKwp6MYPZsu0mW85ShfO4XvYb4z2gQRKd4xK/aaUQcbu7fg9OJu05gj/hKhOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HF/qyGehAhKUdJPQWT1CPjsg2X/NGFj5Lk0x43C30TM=;
 b=cdPPUcV+1e8SXkIsZs1gg9C7NiEkbe9aVZY8iutpj+rMIt4VtYMaItEmsIo7HyoljpgVuOEa/pXxoHyrRrPDQGqv68uMv041RChQRUvN7oUHHXCd7bVmlXlfJsRTWazSP7sZAv7VA2+QTQS2UMjgJSZYISZ+AKO++IImP6j/Wiw=
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
Subject: [PATCH V4 04/10] xen: introduce mark_page_free
Date: Wed, 28 Jul 2021 10:27:51 +0000
Message-ID: <20210728102758.3269446-5-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210728102758.3269446-1-penny.zheng@arm.com>
References: <20210728102758.3269446-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 73fa1d9c-c6b5-4bc3-ccba-08d951b27ab6
X-MS-TrafficTypeDiagnostic: AM0PR08MB5106:|DB7PR08MB4619:
X-Microsoft-Antispam-PRVS:
	<DB7PR08MB4619790E22FE8FF13B0A8C44F7EA9@DB7PR08MB4619.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1051;OLM:1051;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 hoAf5LoGX1TrVUiv7AtQIpFQ3fMluhc4gwdTlADnvKOk4+IITz4jMJREhO5DzKhNeEQDiQy4tT7BmVWZxNZrN3BQ/Kq2kUfBgoGFnWRuS41WftR6rr+ngHEjTlR2U8EBXmZx/uDT6kt7QoETpo1C0pU+k/VuY18FRoHkjDPRUk5WshcBL9wZfQ8uai+OMzirmxmUroFoWwlBsl/tI16423KOivnMhjCxuLLXK164QW2TjfSKIPc9jasASnsldZi/bpKq+ubVsi8rWHhrWK/d0vkbouJlV9ktPSq2fFRv9j/puWTBiUA0PhonUJ6fL5HATUTvwKWkpfUaYkzwXy1gsIyqah7K5zNLEMjOwuOEiR4KhY52FcnJ/ZndhP6MBVhVpV4DRw/rhILq40xvwgS5/GjCYT9kHU3DZZ6fYqe0Eiv3vuD+hIblcjfktVVP7li8LN90dQxLkq+cM8rZUL0XEWCQkA+KGb3tBxLjTXrh4Ax+c8ofWPAXKgWP9xe9EZ5sC0EUClW0qy3JVd22aZrf12yK4S+GSNhNHrO66XqxC/JjsSW3JZAWJAjNBL0y7kiUaQX5coqSgWyuyztQiN/63W9UhuVUA5wJm0ynFRBoLzZohvMnI7IJdM0dPRoQToHNXPSGz3QmaFtR6ErvWsyL/QtVvIff48k96srBcIE/S6RO6yYoZwiMy40TAtAZI8nJmMdzqWcvBCBPQYDcuJYO3kEVcy1F+WHAZurnxqn41eQ=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(136003)(39850400004)(396003)(346002)(376002)(36840700001)(46966006)(186003)(36756003)(426003)(44832011)(5660300002)(47076005)(336012)(356005)(81166007)(70206006)(8676002)(86362001)(26005)(2616005)(82740400003)(36860700001)(2906002)(8936002)(6666004)(70586007)(478600001)(1076003)(4326008)(82310400003)(316002)(83380400001)(54906003)(110136005)(7696005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5106
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	dc91a438-3771-4822-d54f-08d951b2753a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	E63TuJlGhhLEKfnysFnxKaHnXtvt1D8KchN/YiDaHyIBZPyT6IWKnWC0FIUFwXAavBeaX1aJ7uCncjz7Tl1Xqrw0cfZxsSdQZ/I1dAYXkmKxuFIgp+lrTTGKgP8oEU8DZhcr6QTY98ZC8uat5n9BATXZV99DZRydgN4ItW5oabAQ8q+Zwb9Fo/lqJ1ZzrjP55Z6mCx93mQQy4VUzXX86ump5mLOR8UnfjYLEB/p1XGBMHQ8GZV7F3V9q+JW+sSDgTKCVZtTkpAq702Yu/3YaPL1xgl9Byz+NxrlHagWTY6X91CAmtYZ1lcG40oLjAZMKhuM2zfGOfHBS6TVxATVHhcXCpFTaY25+JMPtxbtG6pCISVaVspXgUXpDL7lA/YmF9FXU0MODbenkSRDW8BfjyUbqPOwP0kk4QMWwlSxMH+Y6QXBEZ1Rfbyv/5+GR4KnsTTAFlfgrv2wUTurf3ES4GKZ4GTDgHvQTrGGy0Kd8gcWse5ZNX01LkPZPxjRYzzhRb7Z6t3a8EFnR8Ot4z3xMRlYbCJwSZipikirMDOSiTOAbPqvIpiRN9/+7ha3kPcWfJxJeURQ/G6PigkM/+JdbIHYKiLVHDFflU+AdolfxhdW5Xu+vtENnmDmVLm8Kx/6+AFIutXjS3UUMMAf0vAOjOzeLmb7JRlJTInm0fRUgqyISskYgIbCAJUrMD9EQjxxGbHN0t4dwVA+DxWHehKQHqw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39850400004)(376002)(346002)(396003)(136003)(46966006)(36840700001)(8676002)(82740400003)(36756003)(110136005)(5660300002)(8936002)(316002)(336012)(26005)(86362001)(186003)(82310400003)(44832011)(6666004)(70586007)(83380400001)(81166007)(47076005)(4326008)(7696005)(2906002)(36860700001)(2616005)(426003)(478600001)(70206006)(1076003)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2021 10:28:45.3934
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 73fa1d9c-c6b5-4bc3-ccba-08d951b27ab6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT056.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB4619

This commit defines a new helper mark_page_free to extract common code,
like following the same cache/TLB coherency policy, between free_heap_pages
and the new function free_staticmem_pages, which will be introduced later.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
---
 xen/common/page_alloc.c | 89 ++++++++++++++++++++++-------------------
 1 file changed, 48 insertions(+), 41 deletions(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 958ba0cd92..a3ee5eca9e 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -1376,6 +1376,53 @@ bool scrub_free_pages(void)
     return node_to_scrub(false) != NUMA_NO_NODE;
 }
 
+static void mark_page_free(struct page_info *pg, mfn_t mfn)
+{
+    ASSERT(mfn_x(mfn) == mfn_x(page_to_mfn(pg)));
+
+    /*
+     * Cannot assume that count_info == 0, as there are some corner cases
+     * where it isn't the case and yet it isn't a bug:
+     *  1. page_get_owner() is NULL
+     *  2. page_get_owner() is a domain that was never accessible by
+     *     its domid (e.g., failed to fully construct the domain).
+     *  3. page was never addressable by the guest (e.g., it's an
+     *     auto-translate-physmap guest and the page was never included
+     *     in its pseudophysical address space).
+     * In all the above cases there can be no guest mappings of this page.
+     */
+    switch ( pg->count_info & PGC_state )
+    {
+    case PGC_state_inuse:
+        BUG_ON(pg->count_info & PGC_broken);
+        pg->count_info = PGC_state_free;
+        break;
+
+    case PGC_state_offlining:
+        pg->count_info = (pg->count_info & PGC_broken) |
+                         PGC_state_offlined;
+        tainted = 1;
+        break;
+
+    default:
+        printk(XENLOG_ERR
+               "pg MFN %"PRI_mfn" c=%#lx o=%u v=%#lx t=%#x\n",
+               mfn_x(mfn),
+               pg->count_info, pg->v.free.order,
+               pg->u.free.val, pg->tlbflush_timestamp);
+        BUG();
+    }
+
+    /* If a page has no owner it will need no safety TLB flush. */
+    pg->u.free.need_tlbflush = (page_get_owner(pg) != NULL);
+    if ( pg->u.free.need_tlbflush )
+        page_set_tlbflush_timestamp(pg);
+
+    /* This page is not a guest frame any more. */
+    page_set_owner(pg, NULL); /* set_gpfn_from_mfn snoops pg owner */
+    set_gpfn_from_mfn(mfn_x(mfn), INVALID_M2P_ENTRY);
+}
+
 /* Free 2^@order set of pages. */
 static void free_heap_pages(
     struct page_info *pg, unsigned int order, bool need_scrub)
@@ -1392,47 +1439,7 @@ static void free_heap_pages(
 
     for ( i = 0; i < (1 << order); i++ )
     {
-        /*
-         * Cannot assume that count_info == 0, as there are some corner cases
-         * where it isn't the case and yet it isn't a bug:
-         *  1. page_get_owner() is NULL
-         *  2. page_get_owner() is a domain that was never accessible by
-         *     its domid (e.g., failed to fully construct the domain).
-         *  3. page was never addressable by the guest (e.g., it's an
-         *     auto-translate-physmap guest and the page was never included
-         *     in its pseudophysical address space).
-         * In all the above cases there can be no guest mappings of this page.
-         */
-        switch ( pg[i].count_info & PGC_state )
-        {
-        case PGC_state_inuse:
-            BUG_ON(pg[i].count_info & PGC_broken);
-            pg[i].count_info = PGC_state_free;
-            break;
-
-        case PGC_state_offlining:
-            pg[i].count_info = (pg[i].count_info & PGC_broken) |
-                               PGC_state_offlined;
-            tainted = 1;
-            break;
-
-        default:
-            printk(XENLOG_ERR
-                   "pg[%u] MFN %"PRI_mfn" c=%#lx o=%u v=%#lx t=%#x\n",
-                   i, mfn_x(mfn) + i,
-                   pg[i].count_info, pg[i].v.free.order,
-                   pg[i].u.free.val, pg[i].tlbflush_timestamp);
-            BUG();
-        }
-
-        /* If a page has no owner it will need no safety TLB flush. */
-        pg[i].u.free.need_tlbflush = (page_get_owner(&pg[i]) != NULL);
-        if ( pg[i].u.free.need_tlbflush )
-            page_set_tlbflush_timestamp(&pg[i]);
-
-        /* This page is not a guest frame any more. */
-        page_set_owner(&pg[i], NULL); /* set_gpfn_from_mfn snoops pg owner */
-        set_gpfn_from_mfn(mfn_x(mfn) + i, INVALID_M2P_ENTRY);
+        mark_page_free(&pg[i], mfn_add(mfn, i));
 
         if ( need_scrub )
         {
-- 
2.25.1


