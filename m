Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FB34065D4
	for <lists+xen-devel@lfdr.de>; Fri, 10 Sep 2021 04:53:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.183857.332261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOWf1-0005Le-DI; Fri, 10 Sep 2021 02:53:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 183857.332261; Fri, 10 Sep 2021 02:53:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOWf1-0005GR-8H; Fri, 10 Sep 2021 02:53:03 +0000
Received: by outflank-mailman (input) for mailman id 183857;
 Fri, 10 Sep 2021 02:53:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I6Hc=OA=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1mOWez-0004S2-Rd
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 02:53:01 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7e1a::607])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 83267da6-c972-4f40-bdfc-62b4bd15b13e;
 Fri, 10 Sep 2021 02:52:53 +0000 (UTC)
Received: from AS8PR04CA0014.eurprd04.prod.outlook.com (2603:10a6:20b:310::19)
 by PAXPR08MB6605.eurprd08.prod.outlook.com (2603:10a6:102:153::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Fri, 10 Sep
 2021 02:52:51 +0000
Received: from AM5EUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:310:cafe::8f) by AS8PR04CA0014.outlook.office365.com
 (2603:10a6:20b:310::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Fri, 10 Sep 2021 02:52:51 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT049.mail.protection.outlook.com (10.152.17.130) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Fri, 10 Sep 2021 02:52:51 +0000
Received: ("Tessian outbound e27daf245730:v103");
 Fri, 10 Sep 2021 02:52:50 +0000
Received: from d1bc6d506f25.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 22C3B9A6-7B49-43B4-8982-4B95B4DD05A9.1; 
 Fri, 10 Sep 2021 02:52:44 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id d1bc6d506f25.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 10 Sep 2021 02:52:44 +0000
Received: from AS8PR04CA0070.eurprd04.prod.outlook.com (2603:10a6:20b:313::15)
 by AS8PR08MB6278.eurprd08.prod.outlook.com (2603:10a6:20b:29a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Fri, 10 Sep
 2021 02:52:42 +0000
Received: from AM5EUR03FT024.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:313:cafe::9b) by AS8PR04CA0070.outlook.office365.com
 (2603:10a6:20b:313::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Fri, 10 Sep 2021 02:52:42 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT024.mail.protection.outlook.com (10.152.16.175) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4478.19 via Frontend Transport; Fri, 10 Sep 2021 02:52:42 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Fri, 10 Sep
 2021 02:52:46 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Fri, 10 Sep 2021 02:52:44 +0000
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
X-Inumbo-ID: 83267da6-c972-4f40-bdfc-62b4bd15b13e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AMCW5xXNqkaV3p45gVg1gz98GeXvw0DWsgYQwmmZLho=;
 b=YA7xJNX+7lrO/F6Bubd9wbDUzGgnyZApHYJThO4/ceyFmBcW/frlQHUSRiR7Me2T6lx/e+21dk5o0+uaHPsB1jHcMoRLOja8vlp7AWghXhlLcSiEcmBwxmZtB7660c8LV3s9aBhg35+qBHhNjZFtbCrKfon89xdlRp9hM9piD4Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 1c4e958c66743e38
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a6APgFWMbDbJ7BIj3hOAHXH9gIRbcq5u9cX5EWRKoaIl1jDVEMOtOO4wHs1SG4RPV6tdk+E9coz58O4zC0Pvq6pX89H6IIAUVcP8mbze7TOG4pfLhT/7S4Y2iDw4u6UMSvDpbgxadxMwSD6MjnbS/4yU4iVIuotdPCvcFf+MG4+3Qc93yG4kfYYN9ugLbgzHl6BqGq/grUoTqNrGxj+jq0Enw5vo/WTRVeWO6CKIL9OGb8NEa0j+7UDXRpxoh164/D+/pIEdjSZAtDmlkGk6MWFN5mMEf95kgCesZWSm6ahFwum/Ye0rXafNF5ses14u2mYLXxETpJa+/v8RjOZlEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=AMCW5xXNqkaV3p45gVg1gz98GeXvw0DWsgYQwmmZLho=;
 b=Pv6hR7Hr8Rhx1i279//PJW8jzO8ortlchi7uNxAUf5uiUu2pV+7xARKX7RCgYujF+na5ay2Ct9tzoGCg7XnWATFqmx8Itmx3qYW8vDW65UTJLjZSGagYEM4LEBqMiUQVQ4GTuMxp5zDXhS8HXsDJU7p4YrGvZdte5/liar5C8gml9Q5suVxsPagTkr7I6gv9zPA4tXK2OVLOHUWN4dU2+KC0sC0G3j5vccC1mpr2vHnvbUw6FKa5Pm2Yy/RSi78uFI6r1mkrY9pQDsQuc9moEkJURcuxWb6XZfgwXWqVoXAfDPiVs2t6Zsak6bV6tAvkHT0KCVThgMO8kAsaPUyWvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AMCW5xXNqkaV3p45gVg1gz98GeXvw0DWsgYQwmmZLho=;
 b=YA7xJNX+7lrO/F6Bubd9wbDUzGgnyZApHYJThO4/ceyFmBcW/frlQHUSRiR7Me2T6lx/e+21dk5o0+uaHPsB1jHcMoRLOja8vlp7AWghXhlLcSiEcmBwxmZtB7660c8LV3s9aBhg35+qBHhNjZFtbCrKfon89xdlRp9hM9piD4Q=
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
Subject: [PATCH v7 3/7] xen: introduce mark_page_free
Date: Fri, 10 Sep 2021 02:52:11 +0000
Message-ID: <20210910025215.1671073-4-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210910025215.1671073-1-penny.zheng@arm.com>
References: <20210910025215.1671073-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4083b3d1-d504-44cd-96af-08d97406147d
X-MS-TrafficTypeDiagnostic: AS8PR08MB6278:|PAXPR08MB6605:
X-Microsoft-Antispam-PRVS:
	<PAXPR08MB66053B7A389454A78A63858EF7D69@PAXPR08MB6605.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1051;OLM:1051;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 OBmtivbTaE937o5rHRs0Vpi7zGRVV9j7gF4JAAkcwRM86hdVHySjqYcW813vmeULkKhGHK1Tik9tCdZS7XBL3J+38fINKsn1P7j6Qhz5JjeNSNBU+0KZ4N+n6c1GekxnzwqjSgXXpkwf7W7bU79C055/+OSLWfhMp4Pf8zu1c8Xne2nbOe2KnQurI9KV8YslvpPeYbG6Sr7VMBL6UwtvrAsihckAFZF+imMNXHNeCGLdQ9chKrMimtyB3I+BhQH3X4qQ1H53MSvcbtEywB+vsOKjl40phf64jj6aEqxDNB3JnsEW83YD0+u5qnA+eqzJkPGMhDU8Miw+BFuLpi8A9sVVO+k5iLr9xyVzt8IyWDhLJsCGBvzs16h3c87L07JTQGFpRJ16R0tC3QWxXKflhJv9nieuXUYEX603sIr9l8S241+Q/KB+qN+tFnh5YWah6NjZr9/ZmMDDc3j2jaq1t3Zj9T2PbQ00BGGg2cZRupG9NO+2UKK3dK0DBhfLV3e6XDoPIYAa50EfJ6fY3a7D2ys5vxbnU6RLvemoX9uLzZJz3IFKxbE0eiUgW0JxiyMVxJJ+WHZKDoRsEuuIqxPjL4bYz8vOnd/lgwn/udjkUxaeCM0OztvN/mas9k7coYXqp9QK7aiLQ1HhUvXL8Z1RyTUhTmQnF9weg6we1jR243qUpxPLJeLZmBaQum1A1Kucjuo7hYoSketfRCrG03jmBfc97ekRoY2baFHgiqL3Ib4=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(39860400002)(396003)(376002)(346002)(136003)(46966006)(36840700001)(47076005)(6666004)(70206006)(316002)(2906002)(110136005)(82740400003)(54906003)(86362001)(478600001)(70586007)(8676002)(426003)(186003)(8936002)(4326008)(26005)(1076003)(44832011)(36756003)(7696005)(81166007)(356005)(2616005)(36860700001)(336012)(83380400001)(82310400003)(5660300002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6278
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3d7e8852-6ece-4814-dc54-08d974060f4e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	5sXt+8QZxLQZbD3C4mkLkKlvAftYZaO9HHLW2xU0PPi074nnC/cjRGQllYkXdjlu/obOUKKy05lEd+q33//VaGdS4kWZ2HXijIZ1yE//VJScCOx5xnpDVTr+kslHOqY4EMLYxQhkD+OL3Xw6b4QH+By9+ZOpPkOVTdvCwd7rKFG20pKsuH0MCe8MHmFPTJOUkhDFiAHNsHYED8/J8+wxWJUFiLslXYn/qjmxKUmBoTlG7vrLW4KvlyOS/AsOwSxpr4H9Vek8vyynItFUL5xyal9SMfGs8q9zd/eaDMFhtDtlHlrGcQkj8jVRbEeRfjBJj7nCq+g6ZDxBHXhrYr0sLh2PdxeBkK35D2fk9JwaF7Jy1HfNwvjlG2i/+TSEq7jAtHO2DE5xsJx8G7997XTNvzOSYDLtLbNR327AyIYX89X4gF7bUHg4ULkoupNnNsX+q16Rh8TJgVqHuOUHTcVh/CEffGBg1F/h6ZLZjPmYpNpdua3h+xI7oEG/Xncdx44cZswdGrm4qKg9ga4QjZT1nYHSa5OjgP0OV6GHIxE9iI0AbrZ9BMCrLKC2wh7e3tDCjWAclDZyrRipq5fuWpCdnTpFOc/bi+d4YJX3HLYPr5M/Gp+FUvXoXmKBxp61zR+cPw61I/NBzE7LFaXcNCmz2G90CpzlUNybPOa3mqCj3oFWX6G57vag5VWihaaqdJjw9IZzB7DnC8n143Amof7Yxg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(346002)(39860400002)(396003)(136003)(46966006)(36840700001)(316002)(107886003)(36756003)(2616005)(4326008)(8676002)(70206006)(478600001)(5660300002)(70586007)(110136005)(336012)(81166007)(186003)(54906003)(426003)(82740400003)(36860700001)(82310400003)(1076003)(26005)(2906002)(83380400001)(86362001)(44832011)(47076005)(7696005)(8936002)(6666004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2021 02:52:51.1416
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4083b3d1-d504-44cd-96af-08d97406147d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6605

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


