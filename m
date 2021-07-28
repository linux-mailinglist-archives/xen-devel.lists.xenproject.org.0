Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2070E3D8BBE
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jul 2021 12:29:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.161434.296488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8goI-0007hF-EU; Wed, 28 Jul 2021 10:29:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 161434.296488; Wed, 28 Jul 2021 10:29:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8goI-0007Zy-8k; Wed, 28 Jul 2021 10:29:10 +0000
Received: by outflank-mailman (input) for mailman id 161434;
 Wed, 28 Jul 2021 10:29:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UQNy=MU=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1m8goG-00040B-JK
 for xen-devel@lists.xenproject.org; Wed, 28 Jul 2021 10:29:08 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.8.75]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eca45ce1-add8-4c99-9567-2b44813c8b0b;
 Wed, 28 Jul 2021 10:28:57 +0000 (UTC)
Received: from DB6PR0802CA0030.eurprd08.prod.outlook.com (2603:10a6:4:a3::16)
 by DBBPR08MB4377.eurprd08.prod.outlook.com (2603:10a6:10:c6::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.17; Wed, 28 Jul
 2021 10:28:55 +0000
Received: from DB5EUR03FT016.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:a3:cafe::83) by DB6PR0802CA0030.outlook.office365.com
 (2603:10a6:4:a3::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18 via Frontend
 Transport; Wed, 28 Jul 2021 10:28:55 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT016.mail.protection.outlook.com (10.152.20.141) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.24 via Frontend Transport; Wed, 28 Jul 2021 10:28:55 +0000
Received: ("Tessian outbound 31e6e3649d31:v100");
 Wed, 28 Jul 2021 10:28:55 +0000
Received: from 71695685e734.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A24285DF-53B7-4A19-A218-EB80FFDF70EF.1; 
 Wed, 28 Jul 2021 10:28:49 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 71695685e734.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 28 Jul 2021 10:28:49 +0000
Received: from AM5PR1001CA0026.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:206:2::39)
 by DB7PR08MB3659.eurprd08.prod.outlook.com (2603:10a6:10:4a::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.29; Wed, 28 Jul
 2021 10:28:46 +0000
Received: from VE1EUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:2:cafe::20) by AM5PR1001CA0026.outlook.office365.com
 (2603:10a6:206:2::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18 via Frontend
 Transport; Wed, 28 Jul 2021 10:28:46 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT049.mail.protection.outlook.com (10.152.19.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4352.24 via Frontend Transport; Wed, 28 Jul 2021 10:28:45 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Wed, 28 Jul
 2021 10:28:43 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2176.14 via Frontend
 Transport; Wed, 28 Jul 2021 10:28:41 +0000
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
X-Inumbo-ID: eca45ce1-add8-4c99-9567-2b44813c8b0b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eq4yUqDpYRGNFdQptknzn+SqgvCNRsk87GkopXgdUKw=;
 b=NltAFF4fPgdIEz+KPQ7DWmiOPTyuHpWsfQ7BE5ERbM80p/3TwL9NT/qXa3jh+7VwJuY0HnobWnXIGtaBm5Iqiqffn51bD0Qp30O5bRHTTy7zfjDDRbDvVrVnO6P6+BkRoVEZVb123uevzXsLGTFv5Ynz6EZb9JQC/NuQPEEsSGg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: d025559729ff1416
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DpPwcjSR74pzVBGK+qvAOm2OMxFWiH6N5Mfd5IzDjtFirJ5jTSK61mbjRoeyTT4P/o8xC0Iq0PR5Kxz9GFHMLXP0+oBpxrGGsDGjzPXu3LAsb3r7uLfIEqKiU1COpmZ2GCO6x/ZpzC1SPoWsoKsNhWR5PN+0PpTwnKjUFTSekfvJ1dBWQO6X5K9Kdr00DbEhOOBS4vRtfIRtN94Z3/kS6a1XpTs6aL/U9GHuVmdRXdrv6z1DeH+tiVrigA8jo1koV7MggkyNi6GdNzczMWDqauMnShS7h0P1SsrYrmJNFlG23bWcu5Xo7EYxErw3Kf2NXk8Wkh0UEtdQFmowZQNQAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eq4yUqDpYRGNFdQptknzn+SqgvCNRsk87GkopXgdUKw=;
 b=EgtLKCN2KA1Y04itZ7g709n0od9VYv4bqYCvYduU6z+r09LelWzHrYs9eKwVXqpGKaUZ2aHsQvQlnldfP56hrjEFJQa13Iv4ZyfiJDTVslX1YX/7xdMMFRvtJFYjSRWhth/OEbI1z6vzHwIovwzlkkBioJ/SUPKpiXMQDx0e20pp39Vq0+E/eGK8hye5r2iHZjjfGxdRleFtafAWwMkWMtMmulNvUIhmZcKnBwY/50WdaEzEbJhxkMzrFZKyAoCn09cE9KGObGiSwnsXxrhVZMZiIKgmMErVRXWCQrv36Q0UWrWwzOI7uuLIXN8sxmAmUxuNsZ9Q6NmAuxcB2xgL5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Eq4yUqDpYRGNFdQptknzn+SqgvCNRsk87GkopXgdUKw=;
 b=NltAFF4fPgdIEz+KPQ7DWmiOPTyuHpWsfQ7BE5ERbM80p/3TwL9NT/qXa3jh+7VwJuY0HnobWnXIGtaBm5Iqiqffn51bD0Qp30O5bRHTTy7zfjDDRbDvVrVnO6P6+BkRoVEZVb123uevzXsLGTFv5Ynz6EZb9JQC/NuQPEEsSGg=
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
Subject: [PATCH V4 08/10] xen/arm: introduce acquire_staticmem_pages and acquire_domstatic_pages
Date: Wed, 28 Jul 2021 10:27:55 +0000
Message-ID: <20210728102758.3269446-9-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210728102758.3269446-1-penny.zheng@arm.com>
References: <20210728102758.3269446-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4df38fb4-1115-4a00-c0a5-08d951b28082
X-MS-TrafficTypeDiagnostic: DB7PR08MB3659:|DBBPR08MB4377:
X-Microsoft-Antispam-PRVS:
	<DBBPR08MB43776620CDB51A43B8714808F7EA9@DBBPR08MB4377.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:3631;OLM:3631;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 h6K3KJjJmkLE7TSBa8B9M+1EqF9gcNyP0mYwqHz//S6KKtjEeutcMdprVWWXRZD/NU9eFDeTZbWnRzKnHsUDth8Ub2hNDrhFtrhiDUc9hSqjUaDoXg4LSf2+xDJyia1h/6e4pdDQ/7q9+C0dXIPTuXDIdtiGSIdxDioXJBAtfKkcnr5t39WUUn96QixpNX7OYX7XE+7vmvCA/4CYqB20rxE3IJX1JRC9JEQiePR1mxM7O2nbidnL1vVZg7yM3ytmy5zoWvn7Wc1pnAMqS2hq35JplNJTBKt55mpzyceE/4bZL7SKfTNVM0fam/ktv/6b7K6ZwIxn0rcmyTs9ryVdP2YRVsbi0jvXEOPNyO1j1xFHkcQLPobc9QX6fIMH8dD7QNnprSNTMVTAaS1pPWSv3YNNNPzJ6wSOp3bzcN+8HBm02d35nW9miLcArXphibqrEjm8x/+lig4SDKvDteh64Ui+qRT1WVHYJhTaPPlKTqThgm/t1NH4U8vyfxNPOEpxuMErlNZxNz82zQGtI4J+vrfW/JLGHcu2czAia7ZPULJXVl/cbcL31YNVFrefyyyXZDOCMr9MNVTSMqZphFABzDuZZ2pyDV8bN2GM8E9juCG4ATmYIrKsrVp+/CwU2wl8lcrOihQabPshxxTBnSdq/82SMYlrwb6n7zmfJahbxc3+hEjV2mrWv7EjuXYhNuNIOhdnUwjL4Y4gm4zEsrmeJSxOREs2cPKApvAYbWgcpn0=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(396003)(346002)(376002)(136003)(39860400002)(46966006)(36840700001)(8676002)(8936002)(2906002)(26005)(44832011)(86362001)(186003)(36756003)(7696005)(2616005)(47076005)(478600001)(1076003)(36860700001)(6666004)(82310400003)(336012)(5660300002)(356005)(83380400001)(70586007)(82740400003)(4326008)(70206006)(316002)(54906003)(110136005)(426003)(81166007)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3659
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b2b40b37-53a0-40e1-de1c-08d951b27b08
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rT+62bpNfyTFQqpmavFHkGCDkY4ZoDHdizmowgzeWnMlWcO7jzHvzacknOekB0NHniZLd5giBUFBWpzsVfO5+75+L+W35JqYZqhqv+vNXaDH++jRm5UUwbjldaFskERR/ip1uPl0mZpvHVJBJXvvyw/P8gyRT+FkL/HMyiRkS8vAixAWlCk0r+pIEWjauVo0fNrRnkaYPYvxN8EiyIcYVMqCoh8Jg/WQHIPL/u2yIsSv0KRv4fJkZuKHqORzXjy7D0N/C+w88gSZcWOaYgYvijqPoDEnZopDj+2vzx0HI46DtDj8gn9aw8oqysc/egJntLIbl4rHUvRHnvwKqP8eNTPmbRFKPxfzn0BN8G7594rBATNt4yb2ODGXpE7ZHJ4vyB3EAhHWsLDz4xWi15toUy+INJm3k85qSEMffWZeT3hCgW/onqT2iMQMdHjajEa+KTLNR3MC1qgr5AuE9UgqOFG6cGu8TphbzMofH6DTHDS6OuszRUlc155FPGTZALHGIJDMUdsg5UQJ8eXZrab+TI6Ax0pVMmxGFgk3oyYb87EBZo/shSn3pt/UwmMoe9sIA3YH/qL0iliVhQhvhSL06QjtQS+p0kx22dFeZSdW6nLtfIPIOBgpnhG6knOHb7nuFekViW53ugifsjTrLCGzpX4GVynBxPsJ2lO5nJyYR797J39DY5Jlo+qXgosF/OXicy11JR79zXY6MsRw8NtNxQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(5660300002)(70586007)(83380400001)(36756003)(54906003)(426003)(110136005)(316002)(86362001)(4326008)(8676002)(2616005)(70206006)(2906002)(44832011)(7696005)(82310400003)(508600001)(1076003)(6666004)(26005)(81166007)(36860700001)(186003)(8936002)(336012)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2021 10:28:55.1647
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4df38fb4-1115-4a00-c0a5-08d951b28082
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT016.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR08MB4377

alloc_staticmem_pages aims to acquire nr_mfns contiguous pages of
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
v4 change:
- moving tlb/cache flush outside of the locked region, considering XSA-364
and reducing the amount of work happening with the heap_lock held
- remove MEMF_no_refcount case
- make acquire_staticmem_pages/acquire_domstatic_pages being __init
---
 xen/common/page_alloc.c | 108 +++++++++++++++++++++++++++++++++++++++-
 xen/include/xen/mm.h    |   3 ++
 2 files changed, 109 insertions(+), 2 deletions(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index e279c6f713..b0edaf12b3 100644
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
+static struct page_info * __init acquire_staticmem_pages(unsigned long nr_mfns,
+                                                         mfn_t smfn,
+                                                         unsigned int memflags)
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
 
@@ -2411,6 +2483,38 @@ struct page_info *alloc_domheap_pages(
     return pg;
 }
 
+#ifdef CONFIG_STATIC_MEMORY
+/*
+ * Acquire nr_mfns contiguous pages, starting at #smfn, of static memory,
+ * then assign them to one specific domain #d.
+ */
+struct page_info * __init acquire_domstatic_pages(struct domain *d,
+                                                  unsigned long nr_mfns,
+                                                  mfn_t smfn, unsigned int memflags)
+{
+    struct page_info *pg = NULL;
+
+    ASSERT(!in_irq());
+
+    pg = acquire_staticmem_pages(nr_mfns, smfn, memflags);
+    if ( !pg )
+        return NULL;
+
+    /*
+     * MEMF_no_owner/MEMF_no_refcount cases are missing here because
+     * right now, acquired static memory is only for guest RAM.
+     */
+    ASSERT(d);
+    if ( assign_pages(pg, nr_mfns, d, memflags) )
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
index 2e75cdcbb7..62e8e2ad61 100644
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


