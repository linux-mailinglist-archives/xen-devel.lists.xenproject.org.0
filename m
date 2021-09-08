Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DE0C40375E
	for <lists+xen-devel@lfdr.de>; Wed,  8 Sep 2021 11:54:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.181616.328859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNuHu-0002VQ-Pz; Wed, 08 Sep 2021 09:54:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 181616.328859; Wed, 08 Sep 2021 09:54:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mNuHu-0002SN-KQ; Wed, 08 Sep 2021 09:54:38 +0000
Received: by outflank-mailman (input) for mailman id 181616;
 Wed, 08 Sep 2021 09:54:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SEYe=N6=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1mNuHt-0000bc-H8
 for xen-devel@lists.xenproject.org; Wed, 08 Sep 2021 09:54:37 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.63]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eece8e26-0e47-4435-b533-0948220731fa;
 Wed, 08 Sep 2021 09:54:28 +0000 (UTC)
Received: from AM5PR0602CA0007.eurprd06.prod.outlook.com
 (2603:10a6:203:a3::17) by DB9PR08MB6762.eurprd08.prod.outlook.com
 (2603:10a6:10:2a8::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.22; Wed, 8 Sep
 2021 09:54:26 +0000
Received: from AM5EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:a3:cafe::f9) by AM5PR0602CA0007.outlook.office365.com
 (2603:10a6:203:a3::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Wed, 8 Sep 2021 09:54:26 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT037.mail.protection.outlook.com (10.152.17.241) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19 via Frontend Transport; Wed, 8 Sep 2021 09:54:26 +0000
Received: ("Tessian outbound b9872a30149f:v105");
 Wed, 08 Sep 2021 09:54:25 +0000
Received: from f70b2a647f00.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 75238AC5-D489-4D20-9685-0146AADA106F.1; 
 Wed, 08 Sep 2021 09:54:20 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f70b2a647f00.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 08 Sep 2021 09:54:20 +0000
Received: from PR0P264CA0191.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1c::35)
 by AM6PR08MB3623.eurprd08.prod.outlook.com (2603:10a6:20b:48::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.24; Wed, 8 Sep
 2021 09:54:18 +0000
Received: from VE1EUR03FT041.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:100:1c:cafe::f) by PR0P264CA0191.outlook.office365.com
 (2603:10a6:100:1c::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Wed, 8 Sep 2021 09:54:18 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT041.mail.protection.outlook.com (10.152.19.163) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4478.19 via Frontend Transport; Wed, 8 Sep 2021 09:54:18 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Wed, 8 Sep
 2021 09:54:20 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Wed, 8 Sep 2021 09:54:18 +0000
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
X-Inumbo-ID: eece8e26-0e47-4435-b533-0948220731fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ulrPrQnKNKHeTjBqMvFiBcaLOSg+pt3ZsckmpTE4xGg=;
 b=NhfkiD374f1cloiY9O5ZepaoDxfL6UQl6/Cc71E02QObnBD9V2Eud+a9vo394hrzw9y1mjjMK+/87UDILLF3KNy+EmfSTNDbgXBKds8IQyK2xz9/oLpD2PqZ+QSbvygGs1eRnPjOtDEZIgftBJIW8IH+CPrIOpe26AreZZrAbdU=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 23d4e0f8689de261
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HjW+45NasmLGFrCPkiko7oX/Z2tpz6BEGB4dIph9QbnzcK08vthBamEcvApL2p6IommH16cBY71+TNrvIBRfaUbFyoc5BmH94NGUKr9yBvttnkBRz7+UPEDjy3+nw3dHAhg3kl3ZNv27gA3KX8Kz0fzompH8PDcXxdxa2duEnd20VBA8od9J++PHAdhFFM6qCvNQ5D38w1pVtSuMLllMEBcS5KfHRqIDV6tpFpWYRZAUkYccUC9RzLB0XVNLX8h/o/76EDowAuFA/kFVx+9ecadpd/TA3YA4AkE2KpYTRa1ueLfevT8+Yoc78nRWyGMPMXMswLOlGhdP0c7iT2l3MA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=ulrPrQnKNKHeTjBqMvFiBcaLOSg+pt3ZsckmpTE4xGg=;
 b=goRlHzMSp/PDdpVqfzCXTO5VSoUCXPWfS2tdz+Cyb3IKzkSkwIF3c5p1eTqUVpglY9EkHBgMjqK0fisXUq2j5StfC2wcfTQAKulVZSkhus0Tso5oInPVs042ESnZ4qZVrKPYl9E4hAV9MyXgyXe7xsC+A1qKGJwZPrby+F9gr2g6xmSYN4giKawfGWn7sL0wCZnToZCChsHUKWbcXUJg2esM8s383+puoHho2xXH/TOt3kcTP8xj07SUIJ9UYVPKYaC4C8gJmyQKfI/MuAEQyqIGVDUmzzqyFzuq13jg6+lR/Rex2RpCTYIJk/lsuHFO0lOvH7aUuG2yJc8OtKD37w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ulrPrQnKNKHeTjBqMvFiBcaLOSg+pt3ZsckmpTE4xGg=;
 b=NhfkiD374f1cloiY9O5ZepaoDxfL6UQl6/Cc71E02QObnBD9V2Eud+a9vo394hrzw9y1mjjMK+/87UDILLF3KNy+EmfSTNDbgXBKds8IQyK2xz9/oLpD2PqZ+QSbvygGs1eRnPjOtDEZIgftBJIW8IH+CPrIOpe26AreZZrAbdU=
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
Subject: [PATCH v6 6/7] xen/arm: introduce acquire_staticmem_pages and acquire_domstatic_pages
Date: Wed, 8 Sep 2021 09:52:47 +0000
Message-ID: <20210908095248.545981-7-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210908095248.545981-1-penny.zheng@arm.com>
References: <20210908095248.545981-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ce590b9e-63d8-459c-867d-08d972aea4a7
X-MS-TrafficTypeDiagnostic: AM6PR08MB3623:|DB9PR08MB6762:
X-Microsoft-Antispam-PRVS:
	<DB9PR08MB67629BF90E7DEE5B7827FB56F7D49@DB9PR08MB6762.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 nl8jk9LRhIMcN6l2ckGpEixtbCGp8JTWoblfBW+orT5kCMwhRPKY2Rv2p+FIhdNObOFK19X+99rgk8ntJ9Tj1YwVuVwBOzVo98HnEjvMueevO7+jofecUZHcpAxRerkHUkRrOotJIHHODe+RxkJ8HVNI5DTpZifHBgbkHw3lqu2IXO15Z9xPqG4ijWUStS02dIKCNA7c8BNNHYnUBG2iS98CVtvCKZopYORRXH1OWhKbPS1lD2zysEs0xN4ncYvf8xCuy3QmxDGehoPH7zf4Fd0yRVb8KJOUe+8So6Heh/EdpYmvcG7OdRR15wtLnHZwzszX6cF6Kqtk23hMtZHnFvW5EfinQlyNYO63bRuMikS64gZgXzXeu4f83rzrBZC9Lmu/zsL2bY+23cg4vTUGHkd67GstNeDYPYoNsn+b6kqi0Qz3HGfzf1sHV5fFZmToIB/z+vcXDhOxKjCTdxxkna8tzbL0QelSTfNeQ/jbyCgT1r2VkMxIbfDOIvgTZoxCRFqhd4Z2/1vkBfLflYiD3w3/s/E7NrMebORUjsqq+Rzq9jQdNAmgLaO2jARzAt5ZjrdyXm8+GOgEbzuBXvI6Zt6eGUKRp8pwkgimjnBBght92fiYHou9+P8DosWgWFm2Ak7/lOTBoN+Yha/upgE5urHDMPSP2PVg+V732U64M34Ma7aJ1MLo+j/+g4sEYkd7JAEZDx5GuDSKKDHQ0i2mVbWmXwxEmtKQ3MkT3XNrdgE=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(110136005)(316002)(81166007)(356005)(54906003)(7696005)(6666004)(70586007)(2616005)(1076003)(508600001)(336012)(426003)(70206006)(186003)(4326008)(8936002)(2906002)(26005)(5660300002)(8676002)(36860700001)(86362001)(36756003)(44832011)(47076005)(82310400003)(83380400001)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3623
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d56d9f29-9e71-4677-8119-08d972ae9fe7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Nv23PaB9KOLZkqXBH6qg7uco6r2/L5UmqnXw9D6ODSpa+0csl+0MpfWUz0nqvVfdNrd6qJ7RidszSiEgTd4CVUApqz0bPdoLzc54LK3jvTpic9iKd45Wiq1gv/ZO9HuiJXYmXyK5MO6hJgBvKHcgwcyhfsCWWVmQkcLUDG7SkLjeAZ009jiEIzDkZB7uHncY5Zy2Y2TpXbNe6JlinNekQQj8tFmThfLoMfYlMmIXN5OqPvOaoS6HQYzXaZVRwtoG6yGmp2UW7UyiHXgMNGRgORBnbugjUCqkQP7CjAvKMgm+3u5ELKopZmFnMc46P4GZ1fSgyr+TM0kaD3RVmiuddsUICRtHcCVgpY1oQJ08t+92quvBDqxjGZZ597k9mnVMeO7yMf4rqj36HBKtAMC2Tk6WFPKSuROlQE51IdWYkBOtme9CK0JLkNBcroAGBeOEh9d7vwD3BksolJBUfV7yYxlmBguwvirLGC7uh21R8Pg2NKD87WqffIuYA4RN1LQVeknz7o/OXs0MBePYer4bHp9z1Tgr+xaWz/2BvJQzFxcUDYEj94iWL6t3uw01wcAjPrJmzcC08ostH/3mk+MWpO1ADgovKn7U1eI6Tc5D58A/+3aXRNRnACcGY2b9X64mO9g+UoWXO2s3BhBjjn2WfIvXL7Z7ctxPEut2SJVhDHDUo4CPxQ9f/FmqiEBLOME1DCnLfLvlzDU3FAExh9VSxw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(136003)(346002)(39860400002)(376002)(396003)(46966006)(36840700001)(81166007)(8936002)(8676002)(70206006)(70586007)(2616005)(7696005)(36756003)(26005)(336012)(426003)(316002)(2906002)(4326008)(47076005)(54906003)(5660300002)(36860700001)(82740400003)(6666004)(110136005)(478600001)(186003)(86362001)(1076003)(83380400001)(44832011)(107886003)(82310400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2021 09:54:26.1435
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce590b9e-63d8-459c-867d-08d972aea4a7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6762

New function acquire_staticmem_pages aims to acquire nr_mfns contiguous pages
of static memory, starting at #smfn. And it is the equivalent of
alloc_heap_pages for static memory.

For each page, it shall check if the page is reserved(PGC_reserved)
and free. It shall also do a set of necessary initialization, which are
mostly the same ones in alloc_heap_pages, like, following the same
cache-coherency policy and turning page status into PGC_state_inuse, etc.

New function acquire_domstatic_pages is the equivalent of alloc_domheap_pages
for static memory, and it is to acquire nr_mfns contiguous pages of
static memory and assign them to one specific domain.

It uses acquire_staticmem_pages to acquire nr_mfns pages of static memory.
Then on success, it will use assign_pages to assign those pages to one
specific domain.

In order to differentiate pages of static memory from those allocated from
heap, this patch introduces a new page flag PGC_reserved, then mark pages of
static memory PGC_reserved when initializing them.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
 xen/common/page_alloc.c  | 118 ++++++++++++++++++++++++++++++++++++++-
 xen/include/asm-arm/mm.h |   3 +
 xen/include/xen/mm.h     |   2 +
 3 files changed, 121 insertions(+), 2 deletions(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index bb19bb10ff..59dffcfa1d 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -151,6 +151,10 @@
 #define p2m_pod_offline_or_broken_replace(pg) BUG_ON(pg != NULL)
 #endif
 
+#ifndef PGC_reserved
+#define PGC_reserved 0
+#endif
+
 /*
  * Comma-separated list of hexadecimal page numbers containing bad bytes.
  * e.g. 'badpage=0x3f45,0x8a321'.
@@ -2283,7 +2287,7 @@ int assign_pages(
 
         for ( i = 0; i < nr; i++ )
         {
-            ASSERT(!(pg[i].count_info & ~PGC_extra));
+            ASSERT(!(pg[i].count_info & ~(PGC_extra | PGC_reserved)));
             if ( pg[i].count_info & PGC_extra )
                 extra_pages++;
         }
@@ -2322,7 +2326,8 @@ int assign_pages(
         page_set_owner(&pg[i], d);
         smp_wmb(); /* Domain pointer must be visible before updating refcnt. */
         pg[i].count_info =
-            (pg[i].count_info & PGC_extra) | PGC_allocated | 1;
+            (pg[i].count_info & (PGC_extra | PGC_reserved)) | PGC_allocated | 1;
+
         page_list_add_tail(&pg[i], page_to_list(d, &pg[i]));
     }
 
@@ -2626,8 +2631,117 @@ void __init free_staticmem_pages(struct page_info *pg, unsigned long nr_mfns,
             /* TODO: asynchronous scrubbing for pages of static memory. */
             scrub_one_page(pg);
         }
+
+        /* In case initializing page of static memory, mark it PGC_reserved. */
+        pg[i].count_info |= PGC_reserved;
     }
 }
+
+/*
+ * Acquire nr_mfns contiguous reserved pages, starting at #smfn, of
+ * static memory.
+ * This function needs to be reworked if used outside of boot.
+ */
+static struct page_info * __init acquire_staticmem_pages(mfn_t smfn,
+                                                         unsigned long nr_mfns,
+                                                         unsigned int memflags)
+{
+    bool need_tlbflush = false;
+    uint32_t tlbflush_timestamp = 0;
+    unsigned long i;
+    struct page_info *pg;
+
+    ASSERT(nr_mfns);
+    for ( i = 0; i < nr_mfns; i++ )
+        if ( !mfn_valid(mfn_add(smfn, i)) )
+            return NULL;
+
+    pg = mfn_to_page(smfn);
+
+    spin_lock(&heap_lock);
+
+    for ( i = 0; i < nr_mfns; i++ )
+    {
+        /* The page should be reserved and not yet allocated. */
+        if ( pg[i].count_info != (PGC_state_free | PGC_reserved) )
+        {
+            printk(XENLOG_ERR
+                   "pg[%lu] Static MFN %"PRI_mfn" c=%#lx t=%#x\n",
+                   i, mfn_x(smfn) + i,
+                   pg[i].count_info, pg[i].tlbflush_timestamp);
+            goto out_err;
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
+        pg[i].count_info = PGC_reserved | PGC_state_inuse;
+        /* Initialise fields which have other uses for free pages. */
+        pg[i].u.inuse.type_info = 0;
+        page_set_owner(&pg[i], NULL);
+    }
+
+    spin_unlock(&heap_lock);
+
+    if ( need_tlbflush )
+        filtered_flush_tlb_mask(tlbflush_timestamp);
+
+    /*
+     * Ensure cache and RAM are consistent for platforms where the guest
+     * can control its own visibility of/through the cache.
+     */
+    for ( i = 0; i < nr_mfns; i++ )
+        flush_page_to_ram(mfn_x(smfn) + i, !(memflags & MEMF_no_icache_flush));
+
+    return pg;
+
+ out_err:
+    while ( i-- )
+        pg[i].count_info = PGC_reserved | PGC_state_free;
+
+    spin_unlock(&heap_lock);
+
+    return NULL;
+}
+
+/*
+ * Acquire nr_mfns contiguous pages, starting at #smfn, of static memory,
+ * then assign them to one specific domain #d.
+ */
+int __init acquire_domstatic_pages(struct domain *d, mfn_t smfn,
+                                   unsigned long nr_mfns, unsigned int memflags)
+{
+    struct page_info *pg;
+
+    ASSERT(!in_irq());
+
+    pg = acquire_staticmem_pages(smfn, nr_mfns, memflags);
+    if ( !pg )
+        return -ENOENT;
+
+    if ( !d || (memflags & (MEMF_no_owner | MEMF_no_refcount)) )
+    {
+        /*
+         * Respective handling omitted here because right now
+         * acquired static memory is only for guest RAM.
+         */
+        ASSERT_UNREACHABLE();
+        return -EINVAL;
+    }
+
+    if ( assign_pages(d, pg, nr_mfns, memflags) )
+    {
+        free_staticmem_pages(pg, nr_mfns, memflags & MEMF_no_scrub);
+        return -EINVAL;
+    }
+
+    return 0;
+}
 #endif
 
 /*
diff --git a/xen/include/asm-arm/mm.h b/xen/include/asm-arm/mm.h
index ded74d29da..7b5e7b7f69 100644
--- a/xen/include/asm-arm/mm.h
+++ b/xen/include/asm-arm/mm.h
@@ -108,6 +108,9 @@ struct page_info
   /* Page is Xen heap? */
 #define _PGC_xen_heap     PG_shift(2)
 #define PGC_xen_heap      PG_mask(1, 2)
+  /* Page is reserved */
+#define _PGC_reserved     PG_shift(3)
+#define PGC_reserved      PG_mask(1, 3)
 /* ... */
 /* Page is broken? */
 #define _PGC_broken       PG_shift(7)
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index a74e93eba8..da1b158693 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -89,6 +89,8 @@ bool scrub_free_pages(void);
 /* These functions are for static memory */
 void free_staticmem_pages(struct page_info *pg, unsigned long nr_mfns,
                           bool need_scrub);
+int acquire_domstatic_pages(struct domain *d, mfn_t smfn, unsigned long nr_mfns,
+                            unsigned int memflags);
 #endif
 
 /* Map machine page range in Xen virtual address space. */
-- 
2.25.1


