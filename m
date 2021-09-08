Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B3F40375B
	for <lists+xen-devel@lfdr.de>; Wed,  8 Sep 2021 11:54:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.181612.328826 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNuHk-0001IB-NA; Wed, 08 Sep 2021 09:54:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181612.328826; Wed, 08 Sep 2021 09:54:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNuHk-0001Eg-Io; Wed, 08 Sep 2021 09:54:28 +0000
Received: by outflank-mailman (input) for mailman id 181612;
 Wed, 08 Sep 2021 09:54:27 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SEYe=N6=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1mNuHj-0000bc-Gg
 for xen-devel@lists.xenproject.org; Wed, 08 Sep 2021 09:54:27 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.66]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 710e629f-b153-4d48-945e-6e5213475b1e;
 Wed, 08 Sep 2021 09:54:19 +0000 (UTC)
Received: from AM5PR0701CA0002.eurprd07.prod.outlook.com
 (2603:10a6:203:51::12) by AM6PR08MB4504.eurprd08.prod.outlook.com
 (2603:10a6:20b:bd::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20; Wed, 8 Sep
 2021 09:54:16 +0000
Received: from VE1EUR03FT052.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:51:cafe::80) by AM5PR0701CA0002.outlook.office365.com
 (2603:10a6:203:51::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.6 via Frontend
 Transport; Wed, 8 Sep 2021 09:54:16 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT052.mail.protection.outlook.com (10.152.19.173) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Wed, 8 Sep 2021 09:54:16 +0000
Received: ("Tessian outbound b48d04bf8afd:v105");
 Wed, 08 Sep 2021 09:54:15 +0000
Received: from c44f5e52554f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 51AD65E1-3B5B-43CE-846D-6B3460ACD56B.1; 
 Wed, 08 Sep 2021 09:54:09 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c44f5e52554f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 08 Sep 2021 09:54:09 +0000
Received: from AM6PR01CA0048.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::25) by AM8PR08MB6611.eurprd08.prod.outlook.com
 (2603:10a6:20b:36b::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.22; Wed, 8 Sep
 2021 09:54:08 +0000
Received: from VE1EUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:e0:cafe::32) by AM6PR01CA0048.outlook.office365.com
 (2603:10a6:20b:e0::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Wed, 8 Sep 2021 09:54:08 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT055.mail.protection.outlook.com (10.152.19.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4478.19 via Frontend Transport; Wed, 8 Sep 2021 09:54:08 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Wed, 8 Sep
 2021 09:54:12 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Wed, 8 Sep 2021 09:54:11 +0000
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
X-Inumbo-ID: 710e629f-b153-4d48-945e-6e5213475b1e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AMCW5xXNqkaV3p45gVg1gz98GeXvw0DWsgYQwmmZLho=;
 b=YapclBF9JHWSw1oLOXUWmwDXkDDlWaTR49bkTFpbeJwIZ1rBBqJNxXhnDAI/JAoo8p9yWtJd66enr4DcSMlOe/QFb5pEMqp33UshvsdOIhkkqTzO8ki0m//TZ7jD1rQjgWzo9TBbIQhYKEsI5/dYjTT9YzCtOmGXVnmamuSVO7g=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3fd3d9752e95c7b8
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AKK9ez2QUc/A0Qvnnjmi4Qm9SDSLvrtWPe+seb4l/zxrcXrG30OjJQ64i6vJYHeaC2iatcvOOJ3CDqaz0euepEl1TNfRh8h9Sx655n9qSm2Lh8dvfO6zVJ5nS6pp+/tgsBpL/qPjSVV/QPK83luX6+cwK2M5Jdx62//a4kzBodXult0+CVdsHrxaOZqIhOFdqRyWoNMmtJBei61npWbHIG03wyzriWoUS//pM/hmVUS93Do5ThJb0yKQBMOZqBWjacmanM04ojRf+kHpNGby75j64IeO9hVZkolOpee3sgsqcoMxNzLp7UpONC3xD+EHAu8DnW1ayQhBB1fC7s+nsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=AMCW5xXNqkaV3p45gVg1gz98GeXvw0DWsgYQwmmZLho=;
 b=jQetPhEu9LIt/pyh59/vFu+WVq1RQJpUb6ZN9XplNmNPv124XFLeAka7LjQjrye0q0bvB2wSufie64zreRzVaGGdPFlUCKTXrMowvssfCru2uJZd+ex0IaQXBE7FgamfsQC8XjiQFj4bqD5iBUAELP7UZ9i7fYZdu/9MFCPIdWTR4KSVgBnweH+n+oY9ehERfWoH4GYptXG/9sX3IqX+S+ArFsfvE2bfEoU/cMqH6+Pq1Z5CPeI4ctev072j9EZUY8DH95w8HN1fQjkNNWhZkqqyqeHGTlm0Is201fIvv+ZVD5cUBBkviuk172rufyZbKW8Ni4s0xFAX138pir+fXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AMCW5xXNqkaV3p45gVg1gz98GeXvw0DWsgYQwmmZLho=;
 b=YapclBF9JHWSw1oLOXUWmwDXkDDlWaTR49bkTFpbeJwIZ1rBBqJNxXhnDAI/JAoo8p9yWtJd66enr4DcSMlOe/QFb5pEMqp33UshvsdOIhkkqTzO8ki0m//TZ7jD1rQjgWzo9TBbIQhYKEsI5/dYjTT9YzCtOmGXVnmamuSVO7g=
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
Subject: [PATCH v6 3/7] xen: introduce mark_page_free
Date: Wed, 8 Sep 2021 09:52:44 +0000
Message-ID: <20210908095248.545981-4-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210908095248.545981-1-penny.zheng@arm.com>
References: <20210908095248.545981-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9ee270c3-d84b-46e8-5064-08d972ae9eda
X-MS-TrafficTypeDiagnostic: AM8PR08MB6611:|AM6PR08MB4504:
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB45041B7AF0D322F8B3508F8CF7D49@AM6PR08MB4504.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1051;OLM:1051;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Pj+BKWgtu/2rQ4dGzigUQfEgqbZ3it7nn01d8j16dP4g9B4AlucmsxNu1vKm0s2lXEk/gazxU3iY+lNYRgf2VrRwvl+5MRUjmnQuZ9+cLpddFf5scxs1xINxL9MF/YIv2kO3ApIElTz+yyVqWcan2kw3f7NU1t2REedGknDeCh/BL5B8ANkUiIro/wXyyuADOhmFjseYOTBkU8wOV51f1PEoouQyCHdSBIRUE+nAfcsBDCrWWxPKeh4PNJLYPL3WYkfQEBXkZ543wZEBKMMzpHCa6xqWpP510jVerubGYxbmnlaJSbPGBizoHtvALRsgflAhPlATYMso6R30dHddZQAwtXWQh6pvgcTiL89xfX+Q/bq83MW0QtCSoUnrJotPZ0E/r6X02HIjtHBP//5V9cREo6vZYXjP011aNPajxQ+M62iWh698aNs8l9o4dbINpXYzZZb+uEB4Ff4zrjVTuwLe5/B8GSv/swJs9vMu1E14hjbD5/vNO3oh/zQ+0CRhS9SBdEgJxJ+Hz4NR3gaBYZ0M+c5nZttQ3iirE/BuqqTAKKdpdQhN9EPECERIAH6MjMzodp8Zo5DUCaCsFg0aMmUM/mdRUw+GtXB4VwC0oiAlj6nEa6yXsk+xOcV2+meQ9wIsTJprIRXA1ez+vAhH1sMuCEIjEV2jx09Tv4KIJJ27o/trv1NLNgl1I7E+icJVA56jUx2PKa0T2cFJMXktzTm8sTatW75UbHCs1IMHgpU=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(2616005)(81166007)(8936002)(426003)(4326008)(316002)(5660300002)(336012)(1076003)(8676002)(47076005)(2906002)(356005)(70586007)(70206006)(83380400001)(36756003)(26005)(110136005)(186003)(86362001)(36860700001)(7696005)(44832011)(82310400003)(6666004)(54906003)(508600001)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6611
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e34ca84a-a1f7-46e3-1735-08d972ae99f2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Txja8jyXeoLQrPOBX1Lv9eB7y+rdXz+wonQN2hXo8IO68DniA/prBGZfUxZ7mkeaSdXOX4krcOhVNmJwIRcYO7u996eLlgrGasxbVOBc8mnYtgJAf+t0h8B+86TLi4iMXfq5BR7YBt4+s1Jmd9xPbtTiyxODkovfbwYBsp00FH+vSL0zndO4JUihmgR60dTNdThuj2qJpPjiMOQcizzYFd+YC1WOrDsoIJhzcyQRciZwlmBE1NeXfg8HBUd6YgcvzsVfq5M5jWjDUmz776NFN6Ga2nQnYUT4H7/9NidFMABnvHQ+aurF9smuBuztpHYRHUy/Vg47P7QSkIuP8fIsr0h6Rb3YcbHcimvmDOWh4iWfvRcxu0IJffhDP43sHtYvHTZBLeRDIfjs42pkFYEZAHgzjn4dflVY5S29Supew0cYBafgFSS5DyNRBF0xjVJe9haBDB3BAdHSOtpt96mEWzW9GYgD4xxZLOIjkaQx2P7pmXPaggoSyoptM7Mxu8QXqr4XoZAwc9yZQMnNXgD+P9+2xc6P3gCuD0zGPPLPe+9Ean4xxQc+MHa98F6yqqQL+RqzRHR27C9YKJfNxv/n5zWTHNC9wdLx7czrYvCbZl06t/1RJIUWMpXT3GdkUwOcBKAekuPPk3LAT/3XWscmxKufuno9G4Kchq/Doh83V50bbc9n7dSMWzkOZnSDkJuhw1veMW4nCSMXelqPcjSV5w==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(136003)(376002)(39860400002)(396003)(36840700001)(46966006)(186003)(5660300002)(2616005)(107886003)(83380400001)(86362001)(36860700001)(1076003)(82310400003)(47076005)(6666004)(36756003)(81166007)(478600001)(82740400003)(336012)(70586007)(426003)(8936002)(2906002)(4326008)(316002)(26005)(7696005)(44832011)(54906003)(70206006)(8676002)(110136005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2021 09:54:16.3489
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ee270c3-d84b-46e8-5064-08d972ae9eda
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT052.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4504

This commit defines a new helper mark_page_free to extract common code,
like following the same cache/TLB coherency policy, between free_heap_pages
and the new function free_staticmem_pages, which will be introduced later.

The PDX compression makes that conversion between the MFN and the page can
be potentially non-trivial. As the function is internal, pass the MFN and
the page. They are both expected to match.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
Reviewed-by: Julien Grall <jgrall@amazon.com>
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


