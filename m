Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FAF83F5B5F
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 11:52:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.170781.311726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIT5l-0002e0-Rb; Tue, 24 Aug 2021 09:51:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 170781.311726; Tue, 24 Aug 2021 09:51:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIT5l-0002Yf-Hj; Tue, 24 Aug 2021 09:51:37 +0000
Received: by outflank-mailman (input) for mailman id 170781;
 Tue, 24 Aug 2021 09:51:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jFgo=NP=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1mIT5j-0001jx-IR
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 09:51:35 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.4.84]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d863c26d-04c0-11ec-a8bd-12813bfff9fa;
 Tue, 24 Aug 2021 09:51:27 +0000 (UTC)
Received: from AM6PR04CA0071.eurprd04.prod.outlook.com (2603:10a6:20b:f0::48)
 by VI1PR08MB3312.eurprd08.prod.outlook.com (2603:10a6:803:46::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Tue, 24 Aug
 2021 09:51:25 +0000
Received: from AM5EUR03FT019.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:f0:cafe::68) by AM6PR04CA0071.outlook.office365.com
 (2603:10a6:20b:f0::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Tue, 24 Aug 2021 09:51:25 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT019.mail.protection.outlook.com (10.152.16.104) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 09:51:24 +0000
Received: ("Tessian outbound 1a0c40aa17d8:v103");
 Tue, 24 Aug 2021 09:51:24 +0000
Received: from 18d40905e8f9.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 4D58BF8A-4FE5-4505-AAFF-1BEBA3EA22FE.1; 
 Tue, 24 Aug 2021 09:51:17 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 18d40905e8f9.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 24 Aug 2021 09:51:17 +0000
Received: from AM5PR0201CA0003.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::13) by AM7PR08MB5445.eurprd08.prod.outlook.com
 (2603:10a6:20b:10d::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Tue, 24 Aug
 2021 09:51:16 +0000
Received: from VE1EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:3d:cafe::18) by AM5PR0201CA0003.outlook.office365.com
 (2603:10a6:203:3d::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend
 Transport; Tue, 24 Aug 2021 09:51:16 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT044.mail.protection.outlook.com (10.152.19.106) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 09:51:16 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Tue, 24 Aug
 2021 09:51:12 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Tue, 24 Aug 2021 09:51:10 +0000
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
X-Inumbo-ID: d863c26d-04c0-11ec-a8bd-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AMCW5xXNqkaV3p45gVg1gz98GeXvw0DWsgYQwmmZLho=;
 b=5ZRAdd6cAXgBwK/nXdk+hMT/o2xm0O5gJ2dgHPaHTKkyi+OjNEt5Sym5ehlP8A2PKBAC9oUZCgoOvMIEJF783yvoAchpKTfM7z4eNpsVThtx7Z4Ty2TtE+HeHa89Fd6schNKOpIb6CBBntn3eFeJLUxk5TG2cgb8PgXhkbhBu+4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 63a0de5792350791
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L0CANS+3Am7tSyU1YmB3Ge8ooBZfY9OUIZnvseDvN50zkmxoQKJhxHfMgufDGLyZG2RORklgALxnKt5lYLDESM0vUTWBpJ/fIfnsPNf/1Px/j57EaJCC7NDWsah6ZSWqd6LUIlOhZK5Nifc+xclSPntROpw7pl3Rx7VYRF1sWu9GJa/LFomPmkRW4isvhdqVUjI0qafCKuMCSAsnxs2oH+2bmqlImToZQcxnmzksQtwc5u6psEyQ+2ONouHj6IcEb1kqwBbO/7+8qKAMUVHVBh3KDsWkrv3zGSLoAqJqzvNa/TV7um6rVA+Sb+x0HT74H3iakqZCt1WwrtkKu+I64w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AMCW5xXNqkaV3p45gVg1gz98GeXvw0DWsgYQwmmZLho=;
 b=XL0yM/S9QBUjyjblxFs64l1gFXj+iLIy6qDcSsgdj9XQ3lClMQirCfe0cxM9wENodT9pGljYdKmp2S0zOS4TOhKbvOJsgh7jqIhLzjzNM8YvGuzURSYobsAFJpDJBizFVmgFXylC1kJcnf138H1h8Tzaq76RlciPPRewPZAoCap7gR+EuKRBUym0TzhmM64rdU7Ham507BkLEq3j/6t5dqRRRlKsXbPJglAXb4jaKQbGiNH+eCh40hNjwZiGKYuFfDj5rCjWSEeDSFHA7Q8Ra6k6FBxDE6XF0852Mr6NMkId+jNBMYMSZeNyksDnmfKuXcAaiMeDnqbbBV5ibLNTSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AMCW5xXNqkaV3p45gVg1gz98GeXvw0DWsgYQwmmZLho=;
 b=5ZRAdd6cAXgBwK/nXdk+hMT/o2xm0O5gJ2dgHPaHTKkyi+OjNEt5Sym5ehlP8A2PKBAC9oUZCgoOvMIEJF783yvoAchpKTfM7z4eNpsVThtx7Z4Ty2TtE+HeHa89Fd6schNKOpIb6CBBntn3eFeJLUxk5TG2cgb8PgXhkbhBu+4=
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
Subject: [PATCH v5 3/7] xen: introduce mark_page_free
Date: Tue, 24 Aug 2021 09:50:41 +0000
Message-ID: <20210824095045.2281500-4-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210824095045.2281500-1-penny.zheng@arm.com>
References: <20210824095045.2281500-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 696ecbd7-dcb3-4257-7004-08d966e4bc3c
X-MS-TrafficTypeDiagnostic: AM7PR08MB5445:|VI1PR08MB3312:
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB3312FCA0FC346E8066545720F7C59@VI1PR08MB3312.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1051;OLM:1051;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 QcX7D+JbneCSXtwTIyLOQla7fMrnaytAJj+ZCw4VnU46V54AiBk/9HlAdZLkIAKt3Dx3B8dRkeitirVj2EJxHkQ/MW9V9b+Z101Vr1ksWW2lPw++va0o+dLnUZosCv7+lygkHZdGDbPHbdGKzCEENwKlMq3Fc8/1CAcS8Yactee5GSqRUrm2vdYFzxAyiGelwRiVvf01iXC3ZeGweb6qTpMq2C5OuEcGNU6jq6e1Upn1SnvH/iqkq2v18C7bNTUzXpULmuDLahtfiMKZfRUE6bKhmPd3YIW98SML6ssCxFEIc4G9sfqSarvIp2FruXk3zfMUMObkDygY6UmhuWXflF7v2NlNMtp2XDjD0w6jY2hCApvd1xXEs2oAyD1+2uXLHEhhCOls+WKe6ZeJDOuicvHwmw0qRyNp/yfBLSff+Km6jcqFKUkN3ePZy9cENcf63mX4kyzwuzcRSaUzKXlKudNdiGpBKboWyzfe7HX/gGpvHcFQTj8iQLLZMqXDPWzjHPclqC8Q/dcQh9qX16SrZcEeW6J/3M3s945mgVa9p2w2EeUxTDcPiyfNnj/ikc9Db2PFmo7b2IZ4BOJTa0rmn9vo0hCr/rXNd+6GuNoVvAlhD/7u7f0raMgM5dzXUb+s+AInM11FJxeaK6WeEUh4PyI/78oI7wwcPBihiBaoUZTiYY17tzy7XbV7ghKTWs7RJKKZ0JpJglMHX9/qyJFV8r/0hyZ4spdW/2LetvxAcyM=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(39860400002)(346002)(376002)(396003)(136003)(36840700001)(46966006)(2906002)(2616005)(44832011)(36860700001)(82740400003)(81166007)(356005)(36756003)(7696005)(86362001)(5660300002)(186003)(70206006)(26005)(70586007)(110136005)(1076003)(316002)(478600001)(54906003)(336012)(82310400003)(426003)(83380400001)(8676002)(47076005)(6666004)(8936002)(4326008)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR08MB5445
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3dc5b45b-910c-4b24-72d0-08d966e4b78c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	J7rGBK5BCA+uVVFjqjW8klJm0ezvawODyTwVioZMawknNCHk35jFdxG3173RtuqLrdsL+g23zNl2UHmJ6GNEnyN2W6Dbmn7pnsp7pVkM2Pje+XWbGs41d1IKDCL2ULkKSc9G0xw8bh5shQyaeFi0RiPc9j/sauRV7AwLnYXaT+7IcoEJSp0vkU8siYFgfdwSJNHw43MVDQ31IFpF0dTWQP8bXRSmnvxTl1t+etMi6uFj93+pwCcBOWZDpjLzOFxkPz6Y8AQdSTbdD0EIo7u0rZUk/yzQoBFP0NCcTC0OWfUNgmqEsk+c60kF/cPwzT5mVEZcBHOjU7wy0S7QZ0sUOxTG2AXLppxeSpv23hN8MP8hyxg7jzToB+4OcXwyXgyM/vLVLp19ePsetftw4DPd+5DUWyyUhfAtVG6DxZGuGCJ68674OdvT1kOqcnfuTT0HF1vNGEiLS02aJfG2e/mqE+VwFtTd+4F6bJx3K/NptiifFpbRcjJ80h1a4AXBqHKjPgC9AqaUgNF9q6aeJA8sTG2UKf69eybP/2IUVfvVx9e8bh6Y6Mc3gxTt4X+4le0MPbf7NwqN6bAAXiGZMArR/c4BSlsXBclMi8KdlN7Vbg0GV/iXJmt0xpj8N5YEk3ZCWJp0N5HixUb1Fj2Dm2IYcv2vu4NiayvYJzXzJUCiNZ4W/HhebSr0JXcH+irpYeaSrNSCR5bXrjfsZ8PCdK2hYQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(136003)(396003)(376002)(346002)(36840700001)(46966006)(6666004)(336012)(26005)(81166007)(110136005)(7696005)(8936002)(1076003)(186003)(70586007)(2906002)(70206006)(5660300002)(316002)(426003)(54906003)(2616005)(36756003)(47076005)(4326008)(82310400003)(36860700001)(82740400003)(8676002)(44832011)(478600001)(83380400001)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 09:51:24.5520
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 696ecbd7-dcb3-4257-7004-08d966e4bc3c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT019.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3312

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


