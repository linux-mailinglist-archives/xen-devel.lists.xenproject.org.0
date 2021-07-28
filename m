Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D751B3D8BF3
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jul 2021 12:36:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.161489.296507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8gvC-0002pf-J0; Wed, 28 Jul 2021 10:36:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 161489.296507; Wed, 28 Jul 2021 10:36:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8gvC-0002mp-B1; Wed, 28 Jul 2021 10:36:18 +0000
Received: by outflank-mailman (input) for mailman id 161489;
 Wed, 28 Jul 2021 10:36:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UQNy=MU=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1m8goz-00040B-Kj
 for xen-devel@lists.xenproject.org; Wed, 28 Jul 2021 10:29:53 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com (unknown
 [40.107.4.89]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d07ba7fc-98c5-4ffb-8abb-c0bd5a418f9c;
 Wed, 28 Jul 2021 10:29:17 +0000 (UTC)
Received: from DB6PR07CA0170.eurprd07.prod.outlook.com (2603:10a6:6:43::24) by
 VI1PR0802MB2239.eurprd08.prod.outlook.com (2603:10a6:800:a4::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Wed, 28 Jul
 2021 10:29:13 +0000
Received: from DB5EUR03FT030.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:43:cafe::f3) by DB6PR07CA0170.outlook.office365.com
 (2603:10a6:6:43::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.11 via Frontend
 Transport; Wed, 28 Jul 2021 10:29:13 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT030.mail.protection.outlook.com (10.152.20.144) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.24 via Frontend Transport; Wed, 28 Jul 2021 10:29:13 +0000
Received: ("Tessian outbound 5f693336bfca:v100");
 Wed, 28 Jul 2021 10:29:13 +0000
Received: from a755207bef08.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 81D406B7-94AE-4C7B-BBEC-DD5DBBE047D8.1; 
 Wed, 28 Jul 2021 10:28:59 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a755207bef08.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 28 Jul 2021 10:28:59 +0000
Received: from AM0PR01CA0167.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:aa::36) by AM9PR08MB6225.eurprd08.prod.outlook.com
 (2603:10a6:20b:2de::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Wed, 28 Jul
 2021 10:28:58 +0000
Received: from VE1EUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208:aa:cafe::14) by AM0PR01CA0167.outlook.office365.com
 (2603:10a6:208:aa::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18 via Frontend
 Transport; Wed, 28 Jul 2021 10:28:58 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT021.mail.protection.outlook.com (10.152.18.117) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4352.24 via Frontend Transport; Wed, 28 Jul 2021 10:28:58 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Wed, 28 Jul
 2021 10:28:51 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2176.14 via Frontend
 Transport; Wed, 28 Jul 2021 10:28:49 +0000
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
X-Inumbo-ID: d07ba7fc-98c5-4ffb-8abb-c0bd5a418f9c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HF/qyGehAhKUdJPQWT1CPjsg2X/NGFj5Lk0x43C30TM=;
 b=ZC1NG7cD/onzZyPeJXRA9C4OX7lvVdU3GFsB/s1ihM3v1WIAwgdR2qSp9Biis2lTIiD7YoxbbWqN98eg5qePZ9ZrW6G2c40e1RlSdSVyZUs65Vab3YjpOetMh4hfn5ISZXvPoIpiLUpS8pNPoOy7ES1lv/DVkcUisyVqFWISbQo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9ca811b0cc911400
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eHFcIAmYBxBGuikbwN2ZHEOhBGYnAy2Q4lq72bmKPmpIA/Q5ZG2fpcxK//YMInO6/5VTK3v6RUBv2JvxblyZto5rEsDMkSwfIVVozeL+hVWppHfzdOOLNuRlpTfsFZAbO4yOkTd0HgZaJdCYIjcrA+sWmGh9Lhf0cbiiMmNwsKeTmMwVb9/O0ncVJ3+qOVYtcIa+3sREHSKUldYvUf58Np/CyDgbm6nc3dqgKFAeMvUJL4OhTYK4umO0SdS6sF5u/fZjVhg/HuFUbrU7UCalW7aIovJrBQIXkBoKgb3lWFpmoAUVoY47qwLya13upDOY5sluCCK0fKcjTKu/5LWCqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HF/qyGehAhKUdJPQWT1CPjsg2X/NGFj5Lk0x43C30TM=;
 b=AmJilmMvAMT18MPxqNFTmAossKTkaCoK43Wg2IWDHDMPmSjlHU/LyrvY3snA4mSG5vClFXITufW2jAKTtY5DXKb1U7y2/IrJJxucjJLjl7ts56hmdFonpKu6ANm+IOuE9c864ffwikFyuf4oS39VRzRf4B7PHNyM0wO5hl1dQrULI4C+9UBdpheDU8hXBs93OKRTE9Nt4rbLQ1n3k2U3SOpd8GvAg/0d3PyQIAnnY+9mxcwJsg9RXzXlXgQlu8rQKeDAWY4a50WcQnBCSNbtnOgUN0lTwxjv0mDECITsVcJWS+OgxOC3zS2tfQdm4tOJ5WpNAaEiHGJlLLvDy3AGEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HF/qyGehAhKUdJPQWT1CPjsg2X/NGFj5Lk0x43C30TM=;
 b=ZC1NG7cD/onzZyPeJXRA9C4OX7lvVdU3GFsB/s1ihM3v1WIAwgdR2qSp9Biis2lTIiD7YoxbbWqN98eg5qePZ9ZrW6G2c40e1RlSdSVyZUs65Vab3YjpOetMh4hfn5ISZXvPoIpiLUpS8pNPoOy7ES1lv/DVkcUisyVqFWISbQo=
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
Date: Wed, 28 Jul 2021 10:27:58 +0000
Message-ID: <20210728102758.3269446-12-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210728102758.3269446-1-penny.zheng@arm.com>
References: <20210728102758.3269446-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 91950616-1321-4258-41c7-08d951b28b59
X-MS-TrafficTypeDiagnostic: AM9PR08MB6225:|VI1PR0802MB2239:
X-Microsoft-Antispam-PRVS:
	<VI1PR0802MB2239538BF47F1062F5CA9559F7EA9@VI1PR0802MB2239.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1051;OLM:1051;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 bVm9h5GgGH2Yji/QeBgZ0vwk0JhvGWM//Jv0Fm/9VsnMNxR6adC28fdEOrWE0oBrPJkH3obhI8sTF+9RLp5HzlmxUqHrmqgNE26PRAlH38j3acpBTat7Ywc40YCWzMKQ4Nr/LBm8lxHtThm/vROGFmrjWyOUA4SPCTpV31CUHCe3eL9LqU6vTZ00spJ5mF+XuhN9KV6sfbvvwWXt16PwUXGiCtXZWgn7lDfCHUS5xF9otldP18066QKn9gNy1SS1m8yH8uMxkYlLRIVRV7N3IBDi6QXyb7q2eFYaw9B4JEW6kNC7yXh/Ub1vw03kp5SjycDzv1OlaU4qGHlLm6XMaZXxAWFUnBLRj/mXKFzHhsabapI29AZByKBfNhXed3cS8+t0WuwqNxbiZW+HyThYNoriTqlZteB2Vqz/eVdhGr/f1o8EsScCGor1nPAx9ei5143LvF10ncy3flzVSQaF6B22YMdRhSsvJFn+xTHWM5ShiniW9e8rEp5BQTh6OWqsGDiq+ZJb9BKIB6B9LMMoAIG/U2iGwA6JX15Ndsh3YPIGaNXmCcLFGfq9A0EKpDk+BPpCcbJfAU3v6KAIw+CiUa9kbWxurHF5rSlnWRiQfX9QnkJ1/opmsGXbblyJXb0Y0+p5S/5hBwSayyVGARRCWT0IjaqYFWKHk/LoB1q4AgRPjpFUcDPnKOTz3qeYOe7/P+JC8lGI7h2IFNCuaH8t/95byrY3holw1nG1IKnG9PQ=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(376002)(346002)(39850400004)(136003)(396003)(46966006)(36840700001)(54906003)(316002)(70206006)(5660300002)(47076005)(7696005)(8936002)(478600001)(44832011)(6666004)(110136005)(356005)(26005)(186003)(83380400001)(70586007)(2906002)(82310400003)(86362001)(426003)(2616005)(1076003)(81166007)(4326008)(36860700001)(336012)(36756003)(82740400003)(8676002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6225
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d9e5f88a-3d3d-40c0-4ead-08d951b28290
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	CfkCNrm9jBeFzsAgZlmNFrc+BQRnZ69gfyjeXYTq636Qo0IzuP64n4h79o7i6mwCk6ihZmdW0dqR9r0df1JNw/jfaKBFBPwowyPmK7EWC0aWG3Wme4mMHuP4LjcAaPtv6AC7ZWvREej4QymiSw0d9TELXqRaNh25Gwv0r85D3o+KiMkn/8pCd8zEQGNo78LWULC2Pk6AX3GzS+4pCRE4PZo58vzMhCGewxdbzDgjJhA0ZjDz2xiTR7RsowMym2vqSI21svGItuoXE+EN3cvyLvxdt9fBJUwSJFaysKl5S3RTvz2t+/UEZu+iGiI8p6jByvNbLfcNLNnYdVKvUfhA1DQ3yuUrxjJQXHut5Zh4xU+mVhGfgY8qlx2vlO0MeUIwkZG9/HJkWB5EU1eUe+yMcKNR3hfjD089jI3EWDYgjmoD+dNap0g1l6KZZx2qaMy4w3U6rwYfYbu/PWSYHNdIkgwJAU8p7GUDepI5XaUvRHGc7GOJqSYHiXLKClPMDYQEafusk8QcORlPrJwhJRd/P40+GIFjQt7XEJJCZpxfbWxlNAJsP+W3dX7s+ExhXX0ylLQXu3cmymq4VAemvhbEBD94qvd1Zb9ftZ8KiOZU5ekCyHRrr0vp5rz/3hBI6OWeWwz+Lh8YkkNYJWmmb7IteUp0IblG5SF6lB435bbEKiO9URqkzgaD5Ues4rpfXju74YyQgBWLvboMlJuzC3ARiA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(426003)(36756003)(2906002)(36860700001)(86362001)(186003)(82310400003)(81166007)(2616005)(1076003)(4326008)(26005)(7696005)(336012)(6666004)(44832011)(47076005)(83380400001)(8936002)(8676002)(110136005)(5660300002)(316002)(70586007)(508600001)(70206006)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2021 10:29:13.3486
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91950616-1321-4258-41c7-08d951b28b59
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT030.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0802MB2239

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


