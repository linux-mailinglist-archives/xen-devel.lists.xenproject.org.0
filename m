Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B84F39D30D
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jun 2021 04:44:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.137542.254915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lq5FO-0005Jm-DS; Mon, 07 Jun 2021 02:44:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 137542.254915; Mon, 07 Jun 2021 02:44:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lq5FO-0005GK-6n; Mon, 07 Jun 2021 02:44:14 +0000
Received: by outflank-mailman (input) for mailman id 137542;
 Mon, 07 Jun 2021 02:44:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MAL7=LB=arm.com=penny.zheng@srs-us1.protection.inumbo.net>)
 id 1lq5FM-0003W9-Jn
 for xen-devel@lists.xenproject.org; Mon, 07 Jun 2021 02:44:12 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe02::623])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ef5b5427-2c06-4ac0-87cc-8ddf888cac62;
 Mon, 07 Jun 2021 02:44:08 +0000 (UTC)
Received: from AS8PR04CA0054.eurprd04.prod.outlook.com (2603:10a6:20b:312::29)
 by DB6PR0801MB1719.eurprd08.prod.outlook.com (2603:10a6:4:3a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.20; Mon, 7 Jun
 2021 02:44:05 +0000
Received: from AM5EUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:312:cafe::c9) by AS8PR04CA0054.outlook.office365.com
 (2603:10a6:20b:312::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22 via Frontend
 Transport; Mon, 7 Jun 2021 02:44:05 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT006.mail.protection.outlook.com (10.152.16.122) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.21 via Frontend Transport; Mon, 7 Jun 2021 02:44:04 +0000
Received: ("Tessian outbound cce4cc55b7ee:v93");
 Mon, 07 Jun 2021 02:44:04 +0000
Received: from 2fe3bb3aaf7d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B6965954-0DF6-472B-A63E-164F0ADC7278.1; 
 Mon, 07 Jun 2021 02:43:57 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2fe3bb3aaf7d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 07 Jun 2021 02:43:57 +0000
Received: from DBBPR09CA0005.eurprd09.prod.outlook.com (2603:10a6:10:c0::17)
 by AM9PR08MB7013.eurprd08.prod.outlook.com (2603:10a6:20b:419::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.26; Mon, 7 Jun
 2021 02:43:56 +0000
Received: from DB5EUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:c0:cafe::a) by DBBPR09CA0005.outlook.office365.com
 (2603:10a6:10:c0::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.15 via Frontend
 Transport; Mon, 7 Jun 2021 02:43:56 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT049.mail.protection.outlook.com (10.152.20.191) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4195.21 via Frontend Transport; Mon, 7 Jun 2021 02:43:56 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2176.14; Mon, 7 Jun
 2021 02:43:56 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.14; Mon, 7
 Jun 2021 02:43:55 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2176.14 via Frontend
 Transport; Mon, 7 Jun 2021 02:43:53 +0000
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
X-Inumbo-ID: ef5b5427-2c06-4ac0-87cc-8ddf888cac62
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pGxfEEBgvfyzUcQmDtVFw6fyVeow+GfVG9WP8F/FLKo=;
 b=XfnJA6E0yAXuYVbO2Iefp05/6kw7vdmXK3Cd7+lZckqHN2o+sZqaf+wWikIKDT/esPHfbP0dQwnXUDuh8M5aisehijz/gBB+VcH3H5RzxPVfiALRmPKC1/zbMdASNHbbDqy4tUbyijqQa3vxZW7lqwVr6ydE4a3zXMADQbb/aMo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5ce1bddece8bc241
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gkKU40QEGQ7Y5k7LyIGVXnPPaJmLpF6vuP5RtGTrBIGdETEMF21StvwBdZfR52wdsjNgqnsSLcsXZ6X6uBDDk6AHgYEYCjE88XsqMHnnYG4Hw9o4FWQoeDuYSyOP0vuXWPU1ag5IjP6Q106zOn320tFeKDue7FuV9e9Do2XSK7P8UICADwqlidQm3JRsvNa+gvqjz98g/aR4D3TYl4hlrwFTVjHozN7+kT2f9CDzJ/F8JxWe55y39FtrRnfgdoA5jEXqlHoW+DTryEaGxaqEumSeOOnhUpkFpt+YxlfKViLreHDS0hLDzeI1YXO8shY+Z1q/BIkkZnfLg/ChIIZZWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pGxfEEBgvfyzUcQmDtVFw6fyVeow+GfVG9WP8F/FLKo=;
 b=Y1UOHINYILZP7T7FKZf7Npfd+eCRjeXHDXL9P0MEEAwL1jkifZu2CZclW/OIr8PcH7LvxD7PLd41gZLoJqV45RcR4XB1Z15PktEKOIATMAY7VLd+ud6xNw05iqz2YOBZpKqiFo5VOS1Am3bl7tgCoRyfSU1U2Zwoie3ZVeHBOng1NCA517seoWon2CBGj6OAhIfCY72GGd4CfhXNv+g5gFZc83TiowzMg4YWTptdHPxGjDwTVECleaQOxJoyP6ND2xj0oXBxOlaAOEKMdrmHiHGL4aUXppVeoEzZJ8RF8g4fAsnrYKcLza6fkvozUtAzaXLCd+7tFPm0g0cMBzU5gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pGxfEEBgvfyzUcQmDtVFw6fyVeow+GfVG9WP8F/FLKo=;
 b=XfnJA6E0yAXuYVbO2Iefp05/6kw7vdmXK3Cd7+lZckqHN2o+sZqaf+wWikIKDT/esPHfbP0dQwnXUDuh8M5aisehijz/gBB+VcH3H5RzxPVfiALRmPKC1/zbMdASNHbbDqy4tUbyijqQa3vxZW7lqwVr6ydE4a3zXMADQbb/aMo=
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
Subject: [PATCH 6/9] xen/arm: introduce alloc_staticmem_pages and alloc_domstatic_pages
Date: Mon, 7 Jun 2021 02:43:15 +0000
Message-ID: <20210607024318.3988467-7-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210607024318.3988467-1-penny.zheng@arm.com>
References: <20210607024318.3988467-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cbaf51ef-202e-4085-a234-08d9295e1d6e
X-MS-TrafficTypeDiagnostic: AM9PR08MB7013:|DB6PR0801MB1719:
X-Microsoft-Antispam-PRVS:
	<DB6PR0801MB17198D064C1FB36F4F254FA8F7389@DB6PR0801MB1719.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 dlXr1y4EkSnQOPH4QSg3nnPIJWK5k6gWcJfOUtcwtk7vCkKNLmAdQ2F0cjYGDSdYxazC2Pr7ZTwnVkSk1huAkAwo41HFm6kqsbUcXicMcMMUyrbb44PA4pZXc7MTCcUu67Jj0RoX389UEfWKlf5/zYMVKZW/3YS9xBpr0Nk+D486q7hAYxe8G9KHhWSrDJqBbRRJzl2x00zQ/AuZVqTq2jtReMuPZqIvokFqcmJwz8JErBWYGbLy0D0MWAQzc4tLibL04fg697GzQJltYoHxxqTfAffQBxAsxQgr/2qqjS2RLEE2jQgHYKjTx83mTF5IwgAnSFB1SMRSVU19oc3MFanPvYHDHFv4TCq04jJoou/qyCrNdRzB79sukW0IksEhET/OMq5HeXHywPo4kAo/+6ikz2Kw1JxFPJcWEQknPm8d4d5aCIc82oXkuewGQXrSTRDQqwKNWZjGx5jYuNXcjQzYqaEzZz7teukRHFRK9b/U/FsM4OYM7YybBME2SauEPAvTjremyWcDfV01/qGWoqXx7sThzLrq2KZon05fc7hciLW4qsDQ7wJIXUopsGOyTc9dsHiusv+WwXTljC6OCHPljgu8mw1j0dfFaolfJ4MT1sUregbcPgG4o432Yx1oqcWQDImy1ORFMPE4bcGoTApYyLK/jg7i1DIcI1JRD/d9Wz8gsnNoAi6fYERiev5e4pqaq3EIgrcSVulb1m9qwA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(39860400002)(396003)(136003)(376002)(346002)(36840700001)(46966006)(81166007)(336012)(2906002)(316002)(8676002)(110136005)(6666004)(47076005)(36860700001)(356005)(70586007)(186003)(26005)(7696005)(86362001)(70206006)(1076003)(83380400001)(8936002)(2616005)(478600001)(36756003)(426003)(82310400003)(4326008)(54906003)(44832011)(5660300002)(82740400003)(36900700001)(2101003);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB7013
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	61eb3d68-ee7b-466d-e165-08d9295e18bf
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	/FJDH1/9p6/JnoTTJhW+EXULbyxxetbeiWvM/1IJwa6+axI+3xYdrgffIqkLmrJ8AUbaYpallReYoFQeId3xYHHtztoNPQXdUyjGL69LhvAIHuj8tXewmbsG4Djlpm9Vfz2YLO+DvNPQE+fhO0e+QWTUxVgjt33B4RcivYsX0PxqXq04X7Ew9rly/YPdoITJNeie8ADop+zLYI6miv2JXP7KGJrdpismee1lg0ZJ+F7Uyq626QLgI5qbSHKSa0pbyCZ9zeL9MU/2VnI7UaUBqGpifRkFwQhVPRzLzsO2Il+ucgErDIg5gYB1u2Iiep+W47oPglFBPt6oFL0IyHDohz/NK498x6VhqWA8H19SLdAYYNgo4EfS+uJtrqytM9SagP/Fgh31vMQBO0yCxJIxaV/ulG2MHRDaIXjl0sFOIZcV/94T8+tayXW3HzZRAdzsftZqXAfpjhXdyJ8kqknyTpSm0mr8llT8jI8XKodNYmU28ihIZXtzUtWpzcrDV6iRiDNQjC8JhwNNLRPvs65mMtMuyHhammYTx/RmLOH9rbsDEJsMRo8YOaNKP+6/N5EKC1HMsW5M2z9Y7h9yqq0gjW24KC2XRNGBmkvgmiJ359d0LtQWPk8zvsGPmSdBTTe4lmgcfF20tpKSFr3GAIy67E0wfldjKOkfCF1s6tx2EeBHFzPcRnkT6aFgjJKOmzuU
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(346002)(396003)(39860400002)(376002)(36840700001)(46966006)(7696005)(44832011)(8676002)(82310400003)(8936002)(47076005)(478600001)(82740400003)(2906002)(26005)(81166007)(186003)(4326008)(110136005)(1076003)(6666004)(316002)(83380400001)(70586007)(36860700001)(2616005)(426003)(54906003)(36756003)(70206006)(5660300002)(336012)(86362001)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2021 02:44:04.6510
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cbaf51ef-202e-4085-a234-08d9295e1d6e
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1719

alloc_staticmem_pages aims to allocate nr_mfns contiguous pages of
static memory. And it is the equivalent of alloc_heap_pages for static
memory. Here only covers allocating at specified starting address.

For each page, it shall check if the page is reserved(PGC_reserved)
and free. It shall also do a set of necessary initialization, which are
mostly the same ones in alloc_heap_pages, like, following the same
cache-coherency policy and turning page status into PGC_state_inuse, etc.

alloc_domstatic_pages is the equivalent of alloc_domheap_pages for
static mmeory, and it is to allocate nr_mfns pages of static memory
and assign them to one specific domain.

It uses alloc_staticmen_pages to get nr_mfns pages of static memory,
then on success, it will use assign_pages_nr to assign those pages to
one specific domain.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
changes v2:
- use mfn_valid() to do validation
- change pfn-named to mfn-named
- put CONFIG_STATIC_ALLOCATION around to remove dead codes
- correct off-by-one indentation
- remove meaningless MEMF_no_owner case
- leave zone concept out of DMA limitation check
---
 xen/common/page_alloc.c | 129 ++++++++++++++++++++++++++++++++++++++++
 xen/include/xen/mm.h    |   2 +
 2 files changed, 131 insertions(+)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index e244d2e52e..a0eea5f1a4 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -1065,6 +1065,75 @@ static struct page_info *alloc_heap_pages(
     return pg;
 }
 
+#ifdef CONFIG_STATIC_ALLOCATION
+/*
+ * Allocate nr_mfns contiguous pages, starting at #smfn, of static memory.
+ * It is the equivalent of alloc_heap_pages for static memory
+ */
+static struct page_info *alloc_staticmem_pages(unsigned long nr_mfns,
+                                               mfn_t smfn,
+                                               unsigned int memflags)
+{
+    bool need_tlbflush = false;
+    uint32_t tlbflush_timestamp = 0;
+    unsigned long i;
+    struct page_info *pg;
+
+    /* For now, it only supports allocating at specified address. */
+    if ( !mfn_valid(smfn) || !nr_mfns )
+    {
+        printk(XENLOG_ERR
+               "Invalid %lu static memory starting at %"PRI_mfn"\n",
+               nr_mfns, mfn_x(smfn));
+        return NULL;
+    }
+    pg = mfn_to_page(smfn);
+
+    for ( i = 0; i < nr_mfns; i++ )
+    {
+        /*
+         * Reference count must continuously be zero for free pages
+         * of static memory(PGC_reserved).
+         */
+        ASSERT(pg[i].count_info & PGC_reserved);
+        if ( (pg[i].count_info & ~PGC_reserved) != PGC_state_free )
+        {
+            printk(XENLOG_ERR
+                   "Reference count must continuously be zero for free pages"
+                   "pg[%lu] MFN %"PRI_mfn" c=%#lx t=%#x\n",
+                   i, mfn_x(page_to_mfn(pg + i)),
+                   pg[i].count_info, pg[i].tlbflush_timestamp);
+            BUG();
+        }
+
+        if ( !(memflags & MEMF_no_tlbflush) )
+            accumulate_tlbflush(&need_tlbflush, &pg[i],
+                                &tlbflush_timestamp);
+
+        /*
+         * Preserve flag PGC_reserved and change page state
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
+#endif
+
 /* Remove any offlined page in the buddy pointed to by head. */
 static int reserve_offlined_page(struct page_info *head)
 {
@@ -2326,7 +2395,11 @@ int assign_pages_nr(
 
         for ( i = 0; i < nr_pfns; i++ )
         {
+#ifdef CONFIG_STATIC_ALLOCATION
+            ASSERT(!(pg[i].count_info & ~(PGC_extra | PGC_reserved)));
+#else
             ASSERT(!(pg[i].count_info & ~PGC_extra));
+#endif
             if ( pg[i].count_info & PGC_extra )
                 extra_pages++;
         }
@@ -2365,7 +2438,12 @@ int assign_pages_nr(
         page_set_owner(&pg[i], d);
         smp_wmb(); /* Domain pointer must be visible before updating refcnt. */
         pg[i].count_info =
+#ifdef CONFIG_STATIC_ALLOCATION
+            (pg[i].count_info & (PGC_extra | PGC_reserved)) | PGC_allocated | 1;
+#else
             (pg[i].count_info & PGC_extra) | PGC_allocated | 1;
+#endif
+
         page_list_add_tail(&pg[i], page_to_list(d, &pg[i]));
     }
 
@@ -2434,6 +2512,57 @@ struct page_info *alloc_domheap_pages(
     return pg;
 }
 
+#ifdef CONFIG_STATIC_ALLOCATION
+/*
+ * Allocate nr_mfns contiguous pages, starting at #smfn, of static memory,
+ * then assign them to one specific domain #d.
+ * It is the equivalent of alloc_domheap_pages for static memory.
+ */
+struct page_info *alloc_domstatic_pages(
+        struct domain *d, unsigned long nr_mfns, mfn_t smfn,
+        unsigned int memflags)
+{
+    struct page_info *pg = NULL;
+    unsigned long dma_size;
+
+    ASSERT(!in_irq());
+
+    if ( !dma_bitsize )
+        memflags &= ~MEMF_no_dma;
+    else
+    {
+        if ( (dma_bitsize - PAGE_SHIFT) > 0 )
+        {
+            dma_size = 1ul << (dma_bitsize - PAGE_SHIFT);
+            /* Starting address shall meet the DMA limitation. */
+            if ( mfn_x(smfn) < dma_size )
+                return NULL;
+        }
+    }
+
+    pg = alloc_staticmem_pages(nr_mfns, smfn, memflags);
+    if ( !pg )
+        return NULL;
+
+    /* Right now, MEMF_no_owner case is meaningless here. */
+    ASSERT(d);
+    if ( memflags & MEMF_no_refcount )
+    {
+        unsigned long i;
+
+        for ( i = 0; i < nr_mfns; i++ )
+            pg[i].count_info |= PGC_extra;
+    }
+    if ( assign_pages_nr(d, pg, nr_mfns, memflags) )
+    {
+        free_staticmem_pages(pg, nr_mfns, memflags & MEMF_no_scrub);
+        return NULL;
+    }
+
+    return pg;
+}
+#endif
+
 void free_domheap_pages(struct page_info *pg, unsigned int order)
 {
     struct domain *d = page_get_owner(pg);
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index 25d970e857..a07bd02923 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -89,6 +89,8 @@ bool scrub_free_pages(void);
 /* Static Allocation */
 void free_staticmem_pages(struct page_info *pg, unsigned long nr_mfns,
                           bool need_scrub);
+struct page_info *alloc_domstatic_pages(struct domain *d,
+        unsigned long nr_mfns, mfn_t smfn, unsigned int memflags);
 #endif
 
 /* Map machine page range in Xen virtual address space. */
-- 
2.25.1


