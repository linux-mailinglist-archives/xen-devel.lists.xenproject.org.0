Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A62FF3C9842
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jul 2021 07:19:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.156294.288430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3tls-0000IL-W3; Thu, 15 Jul 2021 05:18:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 156294.288430; Thu, 15 Jul 2021 05:18:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3tls-0000Eb-QA; Thu, 15 Jul 2021 05:18:52 +0000
Received: by outflank-mailman (input) for mailman id 156294;
 Thu, 15 Jul 2021 05:18:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6KMV=MH=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1m3tlr-00009P-I6
 for xen-devel@lists.xenproject.org; Thu, 15 Jul 2021 05:18:51 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.43]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0108b0aa-35d6-4d89-badc-dd42c6fd97e9;
 Thu, 15 Jul 2021 05:18:48 +0000 (UTC)
Received: from AM5PR0201CA0018.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::28) by VE1PR08MB5581.eurprd08.prod.outlook.com
 (2603:10a6:800:1a0::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.27; Thu, 15 Jul
 2021 05:18:45 +0000
Received: from VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:3d:cafe::49) by AM5PR0201CA0018.outlook.office365.com
 (2603:10a6:203:3d::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.21 via Frontend
 Transport; Thu, 15 Jul 2021 05:18:45 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT045.mail.protection.outlook.com (10.152.19.51) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Thu, 15 Jul 2021 05:18:44 +0000
Received: ("Tessian outbound 664b93226e0b:v99");
 Thu, 15 Jul 2021 05:18:44 +0000
Received: from 98af33798e9a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 148036FD-1276-4BA9-9756-4E3F6E672A3A.1; 
 Thu, 15 Jul 2021 05:18:38 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 98af33798e9a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 15 Jul 2021 05:18:38 +0000
Received: from DB9PR02CA0027.eurprd02.prod.outlook.com (2603:10a6:10:1d9::32)
 by DB6PR0801MB1911.eurprd08.prod.outlook.com (2603:10a6:4:74::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.24; Thu, 15 Jul
 2021 05:18:37 +0000
Received: from DB5EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1d9:cafe::17) by DB9PR02CA0027.outlook.office365.com
 (2603:10a6:10:1d9::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Thu, 15 Jul 2021 05:18:37 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT012.mail.protection.outlook.com (10.152.20.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4331.21 via Frontend Transport; Thu, 15 Jul 2021 05:18:36 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Thu, 15 Jul
 2021 05:18:35 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2176.14 via Frontend
 Transport; Thu, 15 Jul 2021 05:18:33 +0000
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
X-Inumbo-ID: 0108b0aa-35d6-4d89-badc-dd42c6fd97e9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OT7F8O9ZbaKYoXsj6+GA4KbW+uyHqlgT1xpJ1lW5eYs=;
 b=bRmkCCXHH+twu1TlJOocEkvnItDgMJ9cQ78SKTiQ+BE3nC8xq4pe/tSeTFbOd3dJNgLo/ktxnPP4yit7L8a1MJWV+/fNejm4FqFRy75VTouSWzrsA+XZ2iB9kauiHrUAFVMaiEbsEgCApbZefRzpK/TzC3RrAQrdY5moOqLf7QY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7de1e53f76b2142a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jCz5d00Y4n9N4+Bz1jjEuTLAUceKorvT1Js5N7JbmbSzgXAOQ7VOHODresB5u956IRmWC2T3MtmSzhcZVuyogX1gz9YR/F/OQehLUcmuO327jApkpWavCdE02e8zYhW6mjYO2Y434kC/TAtG2Dy8itIkn+/fw084GpGOa6sfEBk3pk5jrcoOLrk48n51Gq8HNK9CmQjhhPDR2tfokmu9Kt7YUwA3NmT0EMu1nLrPvoOVeuAWrf07yxyfXdQKZ5fAU03CcbvsWrg64v9IPjRozocXG796kKUK3zkNn+/QdDLVmBpM2bteeU6nNr0VCrIOeGudp9JukiLfAKcetAcXDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OT7F8O9ZbaKYoXsj6+GA4KbW+uyHqlgT1xpJ1lW5eYs=;
 b=TKgMX9m39v2MEak5vqcxpXTZHeR3uGefdxcEKHAjySFDcDkdb3CR3VXEEBeHoQDWoCeIZTR9XiHY9+Im2cQQ+RnAW4mTGjRA9qriJbODVqzvrE8U6C0OojHkxEMpw5vtMc110kUDF+8zELEnoXfAkbgThgsWEhHJ2xP6gaep4LchCeHFs3cJeHfRr8gUX9zE+Ya0qCO989nH1MgQc4sdb5lVV1Zm9qbkU2C9hjOXBuedLrWAGk3WUR3k82DNDBVsIA4IpS6bYQsI6REmqnTSwwnLO51ulGvmD7YaPiWFv0g1A2x1qnig5JhZYRN+XtPpsQJPvfiLeauhPsC3ZQO5bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OT7F8O9ZbaKYoXsj6+GA4KbW+uyHqlgT1xpJ1lW5eYs=;
 b=bRmkCCXHH+twu1TlJOocEkvnItDgMJ9cQ78SKTiQ+BE3nC8xq4pe/tSeTFbOd3dJNgLo/ktxnPP4yit7L8a1MJWV+/fNejm4FqFRy75VTouSWzrsA+XZ2iB9kauiHrUAFVMaiEbsEgCApbZefRzpK/TzC3RrAQrdY5moOqLf7QY=
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
	<jbeulich@suse.com>, <nd@arm.com>
Subject: [PATCH V3 04/10] xen: introduce mark_page_free
Date: Thu, 15 Jul 2021 05:18:13 +0000
Message-ID: <20210715051819.3073628-5-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210715051819.3073628-1-penny.zheng@arm.com>
References: <20210715051819.3073628-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ea83acbd-ccde-4e55-520a-08d9475004b2
X-MS-TrafficTypeDiagnostic: DB6PR0801MB1911:|VE1PR08MB5581:
X-Microsoft-Antispam-PRVS:
	<VE1PR08MB55818A19C45E28944B7F1EF7F7129@VE1PR08MB5581.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1051;OLM:1051;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 k/P7MCSDanzelEayVIMbXHgRcpYj00wP37r822vZMjs6cOFpa7f4hP3giuXxlThrFhQpQgUUVh9u4rqJD/L6+2ISXid/bBEZ6p5iznM1kwXu8Kclo7ewAPqZAFWsTr3/Y4FRHpHJhi9cXrNDJz9hlOXevRYpI2FV11rG0+rPyRgawurvkxKl10TeOteRcKkm0K3dDUJf76e/6H1YSzDT3cpNrJ3gqNtCb/MWEFtV609r/pYLbQaGweTpkbsrRKPgYssUEWxsHdr/Hs85w1Ua6Co0BYcyR0YjD4iAMWy1w3xyPetq7q7haEJ+ayZGNYRyPrB1phwazBAJ5RyWa4gY1ctai54Qj7CA3Rxe/Zab7Ba7YIrZ+tffXjG+wuDZ/IebBhoguTR6NJgOCbYAbmZh+ie8eihtYgH+AjCy9mOQV9isU/UQ7vl2IlPAilmN3BoucZsAVM6WIOU8p8l8iffUhiVcYiudll+noqNfgGSUQDTPJMpIBka3zFllzX26wb7bajaNs4YKPyeKlt0pU9JuTw7M2vEmgUOrx30v0mB6rs7Ujgv6FNXKjjQlPxHr8Uu/7iWRJ6Q1nT/DrZNifrLBJQ1xJO/82qtboYW21m+5Dp1q6XBLLD3zMJFS6ihnjnksMVIQPoGpbdL8lMUecLTFx1wunFngNCtx6NyU4rxrNFIULl3yXoCy1FNFPmwpXrxZb4QOQAIILSwZwGXXsMhB7ZTmwtZypp5V2JC/FgpyOmU=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(39850400004)(136003)(346002)(376002)(396003)(46966006)(36840700001)(81166007)(426003)(110136005)(7696005)(26005)(186003)(5660300002)(36860700001)(36756003)(316002)(4326008)(8936002)(82740400003)(336012)(47076005)(2906002)(6666004)(70586007)(478600001)(54906003)(86362001)(70206006)(1076003)(44832011)(8676002)(82310400003)(356005)(83380400001)(2616005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1911
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	67c1f5e6-2f45-442a-f245-08d9474fffc1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fYfIWsi0P7bdjIyqRboITLJ/Ejdyphh2Cpt+k3wgEYujZDAPDwXhWVKCViCHOr6Q5Tnu/VnTrSigKXhmSvkHmuPazwhI3qSaQHVZ/lPCYcfWTI7/cGaMBqjETe5Tx58zAppLGhVsCATrh1x0WvM4CGcGbvT0FvHVZimW6Q+MDesQtK37x80vTL4c3hP7H8qwJDbyHjEF+/4XRxXFIACe1oxgUZoXXOKdgawnT3bRaDm1ovy2nARuYT/VwE/oCO7U70YNbaw3qEc0fwIymNRkydG6nbZOy9+Dvrvkye17XspkgnZoUow9y304Pitz7okwkc2QvHSlDUtYYeHEmz2oFXN8P1a8dtnYDNQqdH3CANGsLkq9MIaD9AHk5pIxVkbJyU4YI2NAwG4hGWfWaXIFk83mQ2AryuC2CCgpJvfTHHd1fyyMAh5/kjaQUtoDFc2llZ9LVdbhmBiQNp9mVxG6jKtjCicBU7o379M7IEDH/UhhsERRm45taqRSYfzCASErdiDrZDt1vxkL4OzcY4OzS3flXZiJ0NfFvvbyWCtc9NjT+qTqSw/t/yNOPOYbVyRJk7byZCBg88PjIth7qs4E5fPtm+wRzgCF2ndgq9wZgBrjZrtAoKaSV62ScZuLyKRASKzh9ckh0YK6NCdNHcTzZ1xvmvIbwnkjLFH3NTbR4fGvkBVhT5SHFm4SrB3CqH1M6Af6mEaUztwfcVP0m7XTdQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(39850400004)(376002)(136003)(346002)(46966006)(36840700001)(70206006)(186003)(2616005)(82740400003)(44832011)(7696005)(8676002)(47076005)(8936002)(26005)(36860700001)(82310400003)(2906002)(478600001)(70586007)(336012)(6666004)(86362001)(54906003)(81166007)(110136005)(426003)(83380400001)(316002)(36756003)(4326008)(5660300002)(1076003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2021 05:18:44.9797
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea83acbd-ccde-4e55-520a-08d9475004b2
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5581

This commit defines a new helper mark_page_free to extract common code,
like following the same cache/TLB coherency policy, between free_heap_pages
and the new function free_staticmem_pages, which will be introduced later.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
v3 changes:
- rename from "free_page" to "mark_page_free"
- remove non-trivial page_to_mfn conversion due to pdx compression, and
let the MFN passed in
- add an ASSERT() to double check both passed-in pg and MFN match up.
- let all switch-cases shared
---
 xen/common/page_alloc.c | 89 ++++++++++++++++++++++-------------------
 1 file changed, 48 insertions(+), 41 deletions(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 958ba0cd92..95d9be169d 100644
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
+                           PGC_state_offlined;
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


