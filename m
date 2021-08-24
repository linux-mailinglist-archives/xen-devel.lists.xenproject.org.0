Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C203F5B5D
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 11:52:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.170780.311719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIT5l-0002Z1-Br; Tue, 24 Aug 2021 09:51:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 170780.311719; Tue, 24 Aug 2021 09:51:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIT5l-0002WA-6n; Tue, 24 Aug 2021 09:51:37 +0000
Received: by outflank-mailman (input) for mailman id 170780;
 Tue, 24 Aug 2021 09:51:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jFgo=NP=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1mIT5i-0002Tu-UE
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 09:51:34 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.85]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 84e98b07-5ae5-4789-b99a-3304ca552e00;
 Tue, 24 Aug 2021 09:51:32 +0000 (UTC)
Received: from AM6PR01CA0071.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::48) by AM9PR08MB6084.eurprd08.prod.outlook.com
 (2603:10a6:20b:287::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Tue, 24 Aug
 2021 09:51:30 +0000
Received: from AM5EUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:e0:cafe::28) by AM6PR01CA0071.outlook.office365.com
 (2603:10a6:20b:e0::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Tue, 24 Aug 2021 09:51:30 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT009.mail.protection.outlook.com (10.152.16.110) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 09:51:29 +0000
Received: ("Tessian outbound 6ba9ec11d42b:v103");
 Tue, 24 Aug 2021 09:51:29 +0000
Received: from ae5e3912cea3.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 76EB30BB-DB75-4075-9B5C-21EACB5D0EB5.1; 
 Tue, 24 Aug 2021 09:51:23 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ae5e3912cea3.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 24 Aug 2021 09:51:23 +0000
Received: from AM5PR0502CA0004.eurprd05.prod.outlook.com
 (2603:10a6:203:91::14) by AM0PR08MB4100.eurprd08.prod.outlook.com
 (2603:10a6:208:130::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.22; Tue, 24 Aug
 2021 09:51:21 +0000
Received: from VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:91:cafe::d3) by AM5PR0502CA0004.outlook.office365.com
 (2603:10a6:203:91::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Tue, 24 Aug 2021 09:51:21 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT045.mail.protection.outlook.com (10.152.19.51) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 09:51:21 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Tue, 24 Aug
 2021 09:51:20 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Tue, 24 Aug 2021 09:51:18 +0000
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
X-Inumbo-ID: 84e98b07-5ae5-4789-b99a-3304ca552e00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5tPaEnjZ8duvQGcHfvIm9iQd7eKfK7t1x8y/bf8dPDM=;
 b=neH5ZxEAlrPgjrWBPKsxX8fgE6fYz+X2byIiM4i02gRQ+JP2ctXg3T81K6clhXNvfuX7EG0ydFptJaLHuTsgXXyQxdK6MC0+GOEFO/tu2W4/0hkJe0vhp69fad+Q6P74QrouBNezy+TCTB6RmKwGbXBn2JRQtTFmDSowLEzuqhk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: c1c509608f450f34
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M4aAitWHamHigfugvBqAzFNe1rruW2Z+rXmbcJpEmFLx9HQayjmGuD9A8atJsfvUC17QmA/v+nEa4EK8M3/RorgyMrgGWO+ONhwJ8oyEarPm+hh3TrPR8QQjv+DcqG2wl/0OwsqTQwMaY6mjGQuIVHxvTja9OkvxJH5dLYBJHEshlOlj8qs9g+MNL+HwkNNZJ3IEoKToa9kMjjQuit1qj5BFmqPm7R69O+BHuL0vdeIXTj875ENSpDQqHv91M095dyVIgAl9/hnn1BWCO/19edVDYjy+hykE6zyw4wT3lBiGwtY5UFKqvretngTP+kEIJG2KbraWDPY5fqGPe51QUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5tPaEnjZ8duvQGcHfvIm9iQd7eKfK7t1x8y/bf8dPDM=;
 b=lZo7BSP+VzqaQwoYOPTQBdQE6dNDhz+qghL1ZYKdaKL+W1R8ZBo/DAYskBYin1r7VfgvJc7y1nC2pJkqTXu0s9SYI6ShkZZDRJ6K/De+Ai6HXgf9+8KMfU4KG3HpeCdHItb4mEcmBbsqPYJaT0AKgm3gd9VOa/+Zmg+96Tg0BoQI/2HWBgOEBgtGAjcWEp1r+XXfSqH8a/d1aEE09BRZGpdhxK/03bGbv1RzENVFy376pFjYgmPts2b73P+VoxneAE1OfF0kF3AyfXuSFANO0XUkE3+VLK3xmU2QP2FivDQx4wBLtMraXJJZ3kFAawQ5UiXbVrSJJcaBgRbYCIMgXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5tPaEnjZ8duvQGcHfvIm9iQd7eKfK7t1x8y/bf8dPDM=;
 b=neH5ZxEAlrPgjrWBPKsxX8fgE6fYz+X2byIiM4i02gRQ+JP2ctXg3T81K6clhXNvfuX7EG0ydFptJaLHuTsgXXyQxdK6MC0+GOEFO/tu2W4/0hkJe0vhp69fad+Q6P74QrouBNezy+TCTB6RmKwGbXBn2JRQtTFmDSowLEzuqhk=
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
Subject: [PATCH v5 6/7] xen/arm: introduce acquire_staticmem_pages and acquire_domstatic_pages
Date: Tue, 24 Aug 2021 09:50:44 +0000
Message-ID: <20210824095045.2281500-7-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210824095045.2281500-1-penny.zheng@arm.com>
References: <20210824095045.2281500-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 39683ef3-ba77-4b49-071d-08d966e4bf5c
X-MS-TrafficTypeDiagnostic: AM0PR08MB4100:|AM9PR08MB6084:
X-Microsoft-Antispam-PRVS:
	<AM9PR08MB6084C3FA96C944210C5B3B2EF7C59@AM9PR08MB6084.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:655;OLM:655;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 a0aSYMKOnVupwcwSsODyeDk+NBE9MwtsGoZ8RVEuZ0vB/1Gb1iKnfmXAfvJm5NI2PYRRG8oF8YPTOj2ImkRhvwFsSnIFquQMtxbx/6WLYsmQCv3mYOqGNgicpK7EMq8Twb9foG/pUxuf8Jd/ImyxsBdqjO0UlX9rBlnoc/NFqi8Din3dwjkTa79p3PB+cm/c51FL5ICgICOIIFC1nEoiQlIo7OLX8VuFIyySiTBlKJ4zBPn+uLkRfX3HSEG19wM8kIgp45GC2ibNC222nlbRpEP7XlsBvmawY53FuD5Xhr+mLmT0vET6p81AM8iTyFoLialygjD3SOLLfZZvBnxajkyRMW4m55rJgiMBqVtO/MVetYbNQPvgfyHh06phsz+M9fNRW76tTiKFQbk7HZw0rV/eWFeap3RitCR5QfD7nKsJ7O2v+3j5Rn/N52vSZylEsonbE+Fr2YI0i83MqdlZWP9yKULfzXBHdoqPvaTdsDWu0vt2ffZghXZCglhHNy/lf1hjPc2hYJMGJJJOPVSxy8EGfwesS16pbaJIpWHkqvMrh5GG/LFq5C7+HtK5FGBDa94oaghMDb5bohXKCgyqQsOjUvh6dAFxSSRpXvzOZx5U1iqpOKs2koB5O80QEq5UWNdelrWxOJCyiwkB5S9lAlGRglMe5YR6mDtcOspLg0uh7iI8Fc8U1nu+3l6sM7uomhac6P00pAgxge2s4Kf+Hg6Uq80ThKb7Z8QBZy6ZSdE=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(376002)(136003)(396003)(39860400002)(346002)(46966006)(36840700001)(36860700001)(186003)(5660300002)(7696005)(70206006)(70586007)(2906002)(8936002)(2616005)(26005)(82740400003)(44832011)(82310400003)(86362001)(83380400001)(478600001)(36756003)(316002)(6666004)(47076005)(54906003)(110136005)(81166007)(336012)(1076003)(356005)(4326008)(426003)(8676002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4100
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d79a5212-9a33-40dd-6252-08d966e4ba3f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	WVi8kR3Z7tZe08nKZXo8X1UdsmUZagHM9kq8CGWWP58Mc5AQSoLAvNUqvk12G6zIORvU5YcOzY/tfK/LxPRa3cQKYHa69FpjsrnuYshyx0duFY7E0nUGlW0OoYJ6nGL4jM1TjthoONCbv8cR8lja68xUrK8A8kjnAJdpjJ+St5dSxVSsUSk5gX9FE0De/91fNwJieGVoLq+FKeSn/+LJQZY/r9kb+BIziySsyeu8KTu+M2QfMWjPNnrkFlQLHZr02ms4sgH2yVc3y01+AdWTsN+LCkO0w0IO24nFFwb7EfEEdt64V/PjImi5UOgRhBHrA+Y1Lx5PXlhosf8iUGctnvyYXpouw0sGxbqsvuG83T9YEB2DkN22EZioh6mviU+p0hJV5GlFpJOEgEHvVT9RO3n8Fqk7CRF9azhFCocweMBZj4gyBo/NDZsF4Q8/PAuC0gXZVS7Q5xWbd9GRGaNCX++ndfc2nFn18iFZKUhvadNapVeplei5U9HWdN6tSQ5v/8uR3WWE9BZrggkaLaSbA0sCwBQmgTViJHjrKxRVGHFpT6Ry47thsOw31fKH5LDxkY7j3+MlUXoT/wr9FD/FdsDfwE/VaEoL3z9OtRzSGG90PRx0jgr9naPiGct7rukB3cs1MIwU38GgEKwLZPWhXnMKD8bb5YFnLOYMtbx+F866Ta5Bw/pMlaq97ZxVuI93EYQC34NnOxOdyuKykE+pcw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(376002)(136003)(346002)(396003)(36840700001)(46966006)(8676002)(70206006)(6666004)(8936002)(5660300002)(36756003)(70586007)(82740400003)(81166007)(316002)(110136005)(54906003)(478600001)(426003)(7696005)(82310400003)(26005)(86362001)(336012)(186003)(36860700001)(44832011)(2906002)(2616005)(4326008)(47076005)(1076003)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 09:51:29.7952
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 39683ef3-ba77-4b49-071d-08d966e4bf5c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT009.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6084

acquire_staticmem_pages aims to acquire nr_mfns contiguous pages of
static memory, starting at smfn. And it is the equivalent of alloc_heap_pages
for static memory.

For each page, it shall check if the page is reserved(PGC_reserved)
and free. It shall also do a set of necessary initialization, which are
mostly the same ones in alloc_heap_pages, like, following the same
cache-coherency policy and turning page status into PGC_state_inuse, etc.

acquire_domstatic_pages is the equivalent of alloc_domheap_pages for
static memory, and it is to acquire nr_mfns contiguous pages of static memory
and assign them to one specific domain.

It uses acquire_staticmem_pages to acquire nr_mfns pages of static memory,
then on success, it will use assign_pages to assign those pages
to one specific domain.

In order to differentiate pages of static memory from those allocated from
heap, this patch introduces a new page flag PGC_reserved, then mark pages of
static memory PGC_reserved when initializing them.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
v5 changes
- bundle all the functions for static allocation in a single place
- return an error and revert the changes, when the page is not free
and reserved.
- check the MFN is valid for every page and also add a comment to warn
that this function needs to be reworked if used outside of boot.
- use less of mfn_to_page/page_to_mfn
- use ASSERT_UNREACHABLE() to also check that the two flags are clear
- pass the start MFN first and then the number of pages in both
acquire_staticmem_pages and acquire_domstatic_pages
- make acquire_domstatic_pages() to return an errno
- combine the commit of "xen/arm: introduce PGC_reserved"
---
 xen/common/page_alloc.c  | 118 ++++++++++++++++++++++++++++++++++++++-
 xen/include/asm-arm/mm.h |   3 +
 xen/include/xen/mm.h     |   2 +
 3 files changed, 121 insertions(+), 2 deletions(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 05c9834dc2..c0a8898502 100644
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
@@ -2282,7 +2286,7 @@ int assign_pages(
 
         for ( i = 0; i < nr; i++ )
         {
-            ASSERT(!(pg[i].count_info & ~PGC_extra));
+            ASSERT(!(pg[i].count_info & ~(PGC_extra | PGC_reserved)));
             if ( pg[i].count_info & PGC_extra )
                 extra_pages++;
         }
@@ -2321,7 +2325,8 @@ int assign_pages(
         page_set_owner(&pg[i], d);
         smp_wmb(); /* Domain pointer must be visible before updating refcnt. */
         pg[i].count_info =
-            (pg[i].count_info & PGC_extra) | PGC_allocated | 1;
+            (pg[i].count_info & (PGC_extra | PGC_reserved)) | PGC_allocated | 1;
+
         page_list_add_tail(&pg[i], page_to_list(d, &pg[i]));
     }
 
@@ -2625,7 +2630,116 @@ void __init free_staticmem_pages(struct page_info *pg, unsigned long nr_mfns,
             /* TODO: asynchronous scrubbing for pages of static memory. */
             scrub_one_page(pg);
         }
+
+        /* In case initializing page of static memory, mark it PGC_reserved. */
+        pg[i].count_info |= PGC_reserved;
+    }
+}
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
+    for ( unsigned long i = 0; i < nr_mfns; i++ )
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
     }
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
+out_err:
+    for ( unsigned long j = 0; j < i; j++ )
+        pg[j].count_info = PGC_reserved | PGC_state_free;
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
 }
 #endif
 
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
index f243ff88d7..6d83b7894b 100644
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


