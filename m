Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBEFD3C9843
	for <lists+xen-devel@lfdr.de>; Thu, 15 Jul 2021 07:19:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.156306.288462 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3tmF-0002Mi-E7; Thu, 15 Jul 2021 05:19:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 156306.288462; Thu, 15 Jul 2021 05:19:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m3tmF-0002IN-AN; Thu, 15 Jul 2021 05:19:15 +0000
Received: by outflank-mailman (input) for mailman id 156306;
 Thu, 15 Jul 2021 05:19:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6KMV=MH=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1m3tmD-0000d1-8P
 for xen-devel@lists.xenproject.org; Thu, 15 Jul 2021 05:19:13 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.67]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 2b421506-e52c-11eb-8891-12813bfff9fa;
 Thu, 15 Jul 2021 05:19:03 +0000 (UTC)
Received: from AM5PR0402CA0006.eurprd04.prod.outlook.com
 (2603:10a6:203:90::16) by AM8PR08MB5841.eurprd08.prod.outlook.com
 (2603:10a6:20b:1db::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.24; Thu, 15 Jul
 2021 05:18:57 +0000
Received: from AM5EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:90:cafe::bb) by AM5PR0402CA0006.outlook.office365.com
 (2603:10a6:203:90::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.23 via Frontend
 Transport; Thu, 15 Jul 2021 05:18:57 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT023.mail.protection.outlook.com (10.152.16.169) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Thu, 15 Jul 2021 05:18:56 +0000
Received: ("Tessian outbound 664b93226e0b:v99");
 Thu, 15 Jul 2021 05:18:55 +0000
Received: from a1ba4e926fae.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FD5AF517-0840-4626-A15A-374C238A8F74.1; 
 Thu, 15 Jul 2021 05:18:50 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a1ba4e926fae.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 15 Jul 2021 05:18:50 +0000
Received: from DB9PR02CA0029.eurprd02.prod.outlook.com (2603:10a6:10:1d9::34)
 by PAXPR08MB6955.eurprd08.prod.outlook.com (2603:10a6:102:1da::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.21; Thu, 15 Jul
 2021 05:18:48 +0000
Received: from DB5EUR03FT051.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1d9:cafe::cf) by DB9PR02CA0029.outlook.office365.com
 (2603:10a6:10:1d9::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Thu, 15 Jul 2021 05:18:48 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT051.mail.protection.outlook.com (10.152.21.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4331.21 via Frontend Transport; Thu, 15 Jul 2021 05:18:48 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Thu, 15 Jul
 2021 05:18:47 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2176.14 via Frontend
 Transport; Thu, 15 Jul 2021 05:18:44 +0000
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
X-Inumbo-ID: 2b421506-e52c-11eb-8891-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fRL005ZOzyUYob7GB42ihy+z8eRo0qovo722B7cMwsQ=;
 b=kQep5TAN5tC5JTbbHxBLsPQ4jDg/ieqgx0ESNx8M2w4mCVidLIzFJY2Ty9XmliTjT01VyV7WCxnpYxGc481ngPtA+Je48dx2ZJapWgXWcrN7ohzydKjo5ifoCjVfH2ACt+tfo2CbIPW9aYDfnYRolo/erFoBVXrSwu+86MWf0k4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: c255fa28a77e015d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fl6u5QvhFhkKhpshCA24zksRd/BW9LrFSkq74S6i9qS+OgE1ARTDUBaa673CEwez21e5CE76jLHGahWH7GJqtxOO/uEvtTD8ezwtJoqQjapVx4dcQgAbUhlCNNxPHPV46I2KYyLg0zXFvb9UAzxo9CjBfxCf8aDn810PEuH9wD+81f7apT3S3fTH8EMSOyyIHaFgCWbHsS7UzYIGes7iuielvAhJF9BsXTSyRSWqkqCiLOdkV4W1r4t1qLl5YNZJPKTRk2mfE6yaAm52fOEv4XImWyoqf6PA+MUvSR2T+wkBDeOFjEGKg9WKO8Tpq7zpYH6AemuDmH5EVtpoB49u4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fRL005ZOzyUYob7GB42ihy+z8eRo0qovo722B7cMwsQ=;
 b=QeGKdxEPoTxxEpOTp+77EKkua7BWEArxNiTPrtF8L6qgo5SVqQXjIB3SUnZmg8op70mOPu40OsvwXSZYDQnX+PAZKXfTNwVDR0rl+3iHHvLvBihd/tx/WWu2IwIi4f7DBQekyvM2GfFPWa98eJfJ7wDSRiEP4ZTMRy5ri1wuVY/puKxe++K9GM68ErW4Tg4b780pavggjFiSPVw2IKX4qQqZN6oJGWiPAI/XH2QXn8WbgQgApEA+ouHpYFScVSb6Xtbs8gngQcRwE1xyjRad5BD7WHPizSTg5tSoj12tjOhmCEVC02whGcTzDKdlYEM4Ky0nDXUwUouQCeCavi8TMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fRL005ZOzyUYob7GB42ihy+z8eRo0qovo722B7cMwsQ=;
 b=kQep5TAN5tC5JTbbHxBLsPQ4jDg/ieqgx0ESNx8M2w4mCVidLIzFJY2Ty9XmliTjT01VyV7WCxnpYxGc481ngPtA+Je48dx2ZJapWgXWcrN7ohzydKjo5ifoCjVfH2ACt+tfo2CbIPW9aYDfnYRolo/erFoBVXrSwu+86MWf0k4=
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
Subject: [PATCH V3 08/10] xen/arm: introduce acquire_staticmem_pages and acquire_domstatic_pages
Date: Thu, 15 Jul 2021 05:18:17 +0000
Message-ID: <20210715051819.3073628-9-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210715051819.3073628-1-penny.zheng@arm.com>
References: <20210715051819.3073628-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 529b03ff-b151-47d0-3ebb-08d947500b83
X-MS-TrafficTypeDiagnostic: PAXPR08MB6955:|AM8PR08MB5841:
X-Microsoft-Antispam-PRVS:
	<AM8PR08MB5841A7331F6EA37398C79E66F7129@AM8PR08MB5841.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:372;OLM:372;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 lw6E0lza0AIft+/iP88Ob9++4lZFOaArxPenzcw96ksOM1b/HhJIK5bx0AKSg6Y4yrzRmFx6VJ8RTX444ubOlRJMFE40KY77TULdTY65zCCfvtTLXSf+RszXMfabtdyDvK/gVPKtjca4xsAnmDYNaZs+Cb2jarEGxSenmgEWhCu1vIoKXwHRu0B86tq4ei+Se1nmpVjOj3b9NWMCft8ARolkUDG1ux9U4wVMuKj5ZhmZPB5F59Zg6iPR10lrz9XD0IMunq+Mqo9KxfLOzoADqSt0WnRsI0TSFQnICHj+jgYilX/nZqO4LyC6nqeKd30rDsjJcndppfyl4G8DE4uUdFt+BCcLZ6JuIxd6ZoXLAd4XeT+GRtkFPgCpDaIjigCrJ/HRewryj0PHVV3JQOkuEZg41b+tnMSk2mmgxxt8rYX5kuCAzIXmmqSDlMLQ3kZYwxA+2FhZjwdiogYjnSuBClB2xPJibDzBfl9YmSSwTuTKG1OGRM+5n7hMwuj3i7E8SU2+gUWNjkZHVxVGaEmBEmBQV9FqpimiziUsnQaTTkryExD9g3DBBe3bhNdmNG6CnzqWeV8rF4hTJ9YobIJpabl1rR7jSzvGiVh9tQg0NoJMQc9Z39YxAuRA0r+jbwSo0GmtTB/ve/mm4jERZVV0ybZLr1z0tm2bWN8zo2EH/PjXQ6Mihm28CsHebtNIYkjr9yE8ldTmoPg11p/YTkwCaxg+zEgOPnNtr6ZGGm15eMk=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(86362001)(110136005)(83380400001)(6666004)(2616005)(70586007)(36860700001)(4326008)(70206006)(82310400003)(336012)(2906002)(426003)(54906003)(44832011)(1076003)(478600001)(81166007)(8936002)(7696005)(5660300002)(36756003)(8676002)(47076005)(316002)(186003)(26005)(356005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6955
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	916338f5-50d2-4b80-bfb5-08d9475006c0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bJhryEudsBPP4pPAxxvlf2qWF7sVSWGieSwi3zf5f/LpNK+pVKbUMzu6tmmghr6MTEmSDl/VUUwcrRkc8oja/sPaQZVvewphdCK0TCP6bGlvayxtiwsLzOW2pOZSfKNdx5NdWo/WWInnPbJGD+klPfip119wU6ZEGYabt8WhRKZHK0X0go1zBRNiTskU5twkGauLQlJjLTcc1q2JHx6qfH4K+6Wz7tJ1G+aiRreUeekHUCvUMiS9g9q8NRwUz0QU7FDYP0A4rCQn29xsb9lsSl64FjjY86g91dvobnoh2DrMJr7jhwivUy5g6IeBNrfXmo9fkshzsdKwByJnNaln3SqjKnKeELA7ouyKHm9mbP+hMv7BD/H2EEbtcFmqsMpzeFy6/KidZTlod6oKzW2lBHaEoctPpnYs16nYhFHohXA5mL/nIfYGjCPtFfdb2+mPNN5fs8BGnb6OMn7hACvJB+7gH4BT4yAV8zFJVmDnMrWSmKW1ryz5iFgZEOIVOUDMq+Oes4eYLujSdzXyz3whj2kb6Oab3f6xpqrusOph1ErFrpXUivc6a760weCGEdUCzcvtMYaHS2mFkfis+G5j9QUlWP+ejaR8/OD+Z9TokEy6k7Nzt4Dq6gn+IDmsqVFwE709e/ieCm8+J++hKCRhKb14WxlKXY2N2NVSxTW+Ihyh1KZtwZ4FODr/TNE+Q2Z7lHJTZGFn7O1hWWEWOZJ9rQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(396003)(39850400004)(46966006)(36840700001)(81166007)(186003)(316002)(426003)(7696005)(5660300002)(110136005)(36756003)(36860700001)(26005)(4326008)(336012)(8676002)(54906003)(2616005)(44832011)(86362001)(6666004)(8936002)(1076003)(478600001)(82740400003)(70586007)(82310400003)(2906002)(83380400001)(47076005)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2021 05:18:56.5162
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 529b03ff-b151-47d0-3ebb-08d947500b83
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB5841

acquire_staticmem_pages aims to acquire nr_mfns contiguous pages of
static memory. And it is the equivalent of alloc_heap_pages for static
memory. Here only covers acquiring pre-configured static memory.

For each page, it shall check if the page is reserved(PGC_reserved)
and free. It shall also do a set of necessary initialization, which are
mostly the same ones in alloc_heap_pages, like, following the same
cache-coherency policy and turning page status into PGC_state_inuse, etc.

acquire_domstatic_pages is the equivalent of alloc_domheap_pages for
static memory, and it is to acquire nr_mfns contiguous pages of static memory
and assign them to one specific domain.

It uses acquire_staticmem_pages to acquire nr_mfns pre-configured pages of
static memory, then on success, it will use assign_pages to assign those pages
to one specific domain.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
v3 change:
- Assuming caller knows the static memory range is reserved (and free),
change name from alloc_staticmem_pages/alloc_domstatic_pages to
acquire_staticmem_pages and acquire_domstatic_pages.
- proper locking moved from the next commit to here.
- remove and refine extra verbosity log
- remove hunks' #ifdef-ary by introducing PGC_reserved = 0
- remove DMA restriction
---
 xen/common/page_alloc.c | 112 +++++++++++++++++++++++++++++++++++++++-
 xen/include/xen/mm.h    |   3 ++
 2 files changed, 113 insertions(+), 2 deletions(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 3414873679..c9702533f4 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -151,6 +151,10 @@
 #define p2m_pod_offline_or_broken_replace(pg) BUG_ON(pg != NULL)
 #endif
 
+#ifndef CONFIG_STATIC_MEMORY
+#define PGC_reserved 0
+#endif
+
 /*
  * Comma-separated list of hexadecimal page numbers containing bad bytes.
  * e.g. 'badpage=0x3f45,0x8a321'.
@@ -1065,6 +1069,73 @@ static struct page_info *alloc_heap_pages(
     return pg;
 }
 
+#ifdef CONFIG_STATIC_MEMORY
+/*
+ * Acquire nr_mfns contiguous reserved pages, starting at #smfn, of
+ * static memory.
+ */
+static struct page_info *acquire_staticmem_pages(unsigned long nr_mfns,
+                                                 mfn_t smfn,
+                                                 unsigned int memflags)
+{
+    bool need_tlbflush = false;
+    uint32_t tlbflush_timestamp = 0;
+    unsigned long i;
+    struct page_info *pg;
+
+    /* For now, it only supports pre-configured static memory. */
+    if ( !mfn_valid(smfn) || !nr_mfns )
+        return NULL;
+
+    spin_lock(&heap_lock);
+
+    pg = mfn_to_page(smfn);
+
+    for ( i = 0; i < nr_mfns; i++ )
+    {
+        /*
+         * Reference count must continuously be zero for free pages
+         * of static memory(PGC_reserved).
+         */
+        if ( pg[i].count_info != (PGC_state_free | PGC_reserved) )
+        {
+            printk(XENLOG_ERR
+                   "pg[%lu] Static MFN %"PRI_mfn" c=%#lx t=%#x\n",
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
+        pg[i].count_info = (PGC_reserved | PGC_state_inuse);
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
+    spin_unlock(&heap_lock);
+
+    return pg;
+}
+#endif
+
 /* Remove any offlined page in the buddy pointed to by head. */
 static int reserve_offlined_page(struct page_info *head)
 {
@@ -2306,7 +2377,7 @@ int assign_pages(
 
         for ( i = 0; i < nr; i++ )
         {
-            ASSERT(!(pg[i].count_info & ~PGC_extra));
+            ASSERT(!(pg[i].count_info & ~(PGC_extra | PGC_reserved)));
             if ( pg[i].count_info & PGC_extra )
                 extra_pages++;
         }
@@ -2345,7 +2416,8 @@ int assign_pages(
         page_set_owner(&pg[i], d);
         smp_wmb(); /* Domain pointer must be visible before updating refcnt. */
         pg[i].count_info =
-            (pg[i].count_info & PGC_extra) | PGC_allocated | 1;
+            (pg[i].count_info & (PGC_extra | PGC_reserved)) | PGC_allocated | 1;
+
         page_list_add_tail(&pg[i], page_to_list(d, &pg[i]));
     }
 
@@ -2411,6 +2483,42 @@ struct page_info *alloc_domheap_pages(
     return pg;
 }
 
+#ifdef CONFIG_STATIC_MEMORY
+/*
+ * Acquire nr_mfns contiguous pages, starting at #smfn, of static memory,
+ * then assign them to one specific domain #d.
+ */
+struct page_info *acquire_domstatic_pages(
+        struct domain *d, unsigned long nr_mfns, mfn_t smfn,
+        unsigned int memflags)
+{
+    struct page_info *pg = NULL;
+
+    ASSERT(!in_irq());
+
+    pg = acquire_staticmem_pages(nr_mfns, smfn, memflags);
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
+    if ( assign_pages(d, nr_mfns, pg, memflags) )
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
index 65ba1587ad..69e3586d8a 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -89,6 +89,9 @@ bool scrub_free_pages(void);
 /* These functions are for static memory */
 void free_staticmem_pages(struct page_info *pg, unsigned long nr_mfns,
                           bool need_scrub);
+struct page_info *acquire_domstatic_pages(struct domain *d,
+                                          unsigned long nr_mfns, mfn_t smfn,
+                                          unsigned int memflags);
 #endif
 
 /* Map machine page range in Xen virtual address space. */
-- 
2.25.1


