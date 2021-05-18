Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A04DD387131
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 07:22:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.128614.241436 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lisB3-0000r5-2a; Tue, 18 May 2021 05:21:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128614.241436; Tue, 18 May 2021 05:21:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lisB2-0000ov-V0; Tue, 18 May 2021 05:21:56 +0000
Received: by outflank-mailman (input) for mailman id 128614;
 Tue, 18 May 2021 05:21:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2je3=KN=arm.com=penny.zheng@srs-us1.protection.inumbo.net>)
 id 1lisB2-0000oV-7N
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 05:21:56 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.1.83]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c87f45e4-de27-4076-a08c-d183282498bb;
 Tue, 18 May 2021 05:21:54 +0000 (UTC)
Received: from DB7PR05CA0038.eurprd05.prod.outlook.com (2603:10a6:10:2e::15)
 by AS8PR08MB6085.eurprd08.prod.outlook.com (2603:10a6:20b:294::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Tue, 18 May
 2021 05:21:50 +0000
Received: from DB5EUR03FT031.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2e:cafe::15) by DB7PR05CA0038.outlook.office365.com
 (2603:10a6:10:2e::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.32 via Frontend
 Transport; Tue, 18 May 2021 05:21:50 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT031.mail.protection.outlook.com (10.152.20.142) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.25 via Frontend Transport; Tue, 18 May 2021 05:21:50 +0000
Received: ("Tessian outbound 3050e7a5b95d:v92");
 Tue, 18 May 2021 05:21:50 +0000
Received: from b27086a73afc.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 0594D1CA-7287-4677-9637-438FA4D7785C.1; 
 Tue, 18 May 2021 05:21:44 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b27086a73afc.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 18 May 2021 05:21:44 +0000
Received: from AM6PR01CA0056.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::33) by AM6PR08MB4375.eurprd08.prod.outlook.com
 (2603:10a6:20b:b8::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Tue, 18 May
 2021 05:21:43 +0000
Received: from AM5EUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:e0:cafe::3d) by AM6PR01CA0056.outlook.office365.com
 (2603:10a6:20b:e0::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend
 Transport; Tue, 18 May 2021 05:21:43 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT032.mail.protection.outlook.com (10.152.16.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4129.25 via Frontend Transport; Tue, 18 May 2021 05:21:42 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Tue, 18 May
 2021 05:21:41 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2176.14 via Frontend
 Transport; Tue, 18 May 2021 05:21:39 +0000
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
X-Inumbo-ID: c87f45e4-de27-4076-a08c-d183282498bb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2KQQ4ZqD+jOLvYXqT3cXJP1kPDbk4rROsPwkwbO9YKo=;
 b=JDxdlW6xBOBhuFREHdVyEtA595DeKXvfGAFemmyD6FMPYnhp0UhVhYTVDbof/OqnzfUbdW6OJUI/rF8vAFUxP3L8zAyO3AEoWGQs7k7mDczENsqHas6lTW85XEd6JcM0lr/jkLzd2QICTUX0r8VufLsZQ8APz/cbN/N34ryzRtw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: c2b47eb8e8d018e7
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HIoFZcaTw40XFy6IMbUwZU+b6LayTkxP6PqLFXnLsiM7qiG7FWiC1Kd2J/ERk7vRPKOjIpZ/9R9tr8c3MclK9CGxc/4+oTjt9lNKo2I+LjKCAdBaMwa3TTTO4SUeMQNHgfMiVrnvD4SDSaFUxlUugk7PEaU1ZlR+yUblS7gpqO6/F3n0I7NE96K3AEQeT7NXs4s86W9n2w7ETZRYmiAiDpA1b27RLmzXpM001ZfGN8G7UHpk+KEkahSWbcWYJuc5NKnf5xhjW9N21tmHp7G8DpfQSAZ7ZpJpsY9NGmR6Uug3213g5SSNv+mmM+lTNi7kDOMt4HbIdWt5ZupJnAnkxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2KQQ4ZqD+jOLvYXqT3cXJP1kPDbk4rROsPwkwbO9YKo=;
 b=CTWbuMTF9penajP0yGvz2bkMJLud6CusF9oU+YDEXOswSv8quczqFaM4Z0eyqOYo7psmAq4YU5SiMfX0pkXJ5QwGrmAyjT5+TqCci1kD4vZWY/GTeD1Gkq2XwOEi+rbK+UsNSmoNk95fK8rzt8Mwa4cC97J9VBFdxEwyH33IvOlwCx64YQjp4zoK0OF0veV+N8nXXhjGJzAUJeHHgvOecdtGB84fo6lMkJPgjrhkdAew9gUz4AljsAI2ySSAaOTgC1EzeIlu0S3umM8CUrOhDAPuSmj61LPrDcxeIXtCDvuuIT5ZrZB1OazzkUsReHgb5Y3K1CI13weU/HfasyJ5wQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2KQQ4ZqD+jOLvYXqT3cXJP1kPDbk4rROsPwkwbO9YKo=;
 b=JDxdlW6xBOBhuFREHdVyEtA595DeKXvfGAFemmyD6FMPYnhp0UhVhYTVDbof/OqnzfUbdW6OJUI/rF8vAFUxP3L8zAyO3AEoWGQs7k7mDczENsqHas6lTW85XEd6JcM0lr/jkLzd2QICTUX0r8VufLsZQ8APz/cbN/N34ryzRtw=
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
Subject: [PATCH 04/10] xen/arm: static memory initialization
Date: Tue, 18 May 2021 05:21:07 +0000
Message-ID: <20210518052113.725808-5-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210518052113.725808-1-penny.zheng@arm.com>
References: <20210518052113.725808-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e33081cd-4603-415e-b2b6-08d919bcd740
X-MS-TrafficTypeDiagnostic: AM6PR08MB4375:|AS8PR08MB6085:
X-Microsoft-Antispam-PRVS:
	<AS8PR08MB6085815D8CFFAA4C9603117EF72C9@AS8PR08MB6085.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 64H980U++Cmpl4LANGBOruWixAxgFkMB+Cuk3e94o+bRlXf9gsCAmZ2xUYWcSzn3MQli481yWiTYFF1nMGrXH8qv8PvtjL+wE7mc5hzzRg0agpbLvX0EDfV4JyzFy3/+cPdi8OXoIpgrlglzZE4y57DcOGdczb5bdVWKbcLmEzRzJmvHRx7FGlA0QLG0HMjtM5oodFaIvE+2m+d+3oqidwCp8kyj1SX7wx2OHlrUZIcSpTjsSyD4ZZwxH8BIKKL0SDG4eBf5Kaln6/sQsiaZAs/ibHPYfM9FhadsP8rjb89JHrFt+wgp501rOmbqvBTafjdKY7QS505iIwWznb9cWVSEbw+BLn+uMn6lMSpmBNIYF2czhLgogB5DGPeTdyI65ru8wuT1XQdEPKhFG4uwcoyCZxRpyBJWuCv2aGhPRHU4mhprhZPCW7MY8I7Ynjzw86DF6GnrnorgbE+MDJ2Zq6qb/E88xCaea8IK10DLgIlFryVsy+QFcOwnuzUfJ3f/SphSZQDBL9YkkQGXm8Q1nq+WvYKp0cIK+zjGUD+OCpa4IlEA6XtYGJPTcfY8V9qhWSWpo6/GfHDmlp4wFavvna3NbfoRZBJzXA1yS1ga8ugcdkybet9XsI/y+gw16O9AG/pwjAe2FoYArf+hERkq02k0o0WzyiSG5zRuUEzxfVwMj1A4w+0ajVNWD8dduiBl
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(136003)(39850400004)(36840700001)(46966006)(2906002)(6666004)(5660300002)(81166007)(82310400003)(36860700001)(36756003)(83380400001)(1076003)(70586007)(336012)(478600001)(4326008)(54906003)(426003)(7696005)(110136005)(44832011)(86362001)(316002)(356005)(186003)(8676002)(82740400003)(70206006)(8936002)(47076005)(26005)(2616005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4375
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	218a7176-d02e-4c49-bdc1-08d919bcd2b8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bCU5qWrBGZ0UCNeOC3pBXr/Nic6zWzCU9YSFdZGp4tlpF/8oVDW0T4d22KcOkNJko7/2HC3dejpTO4rhBFMY3FERG8Rk2ZMJxSp+ess3JmiPwcyBTvemvrXN/zMpaWVFFeXDoGQzfvJB23r/OjoeACZiigogl1vrORr0+yaxl09Pwb8o/eKKFzNLJvKITCV7Dj9TVPHqu7GLB9PX4h/wvdasPpSpY/uxg666zkunVs+mriVwvia2u3sQ4UwjS6cusV8HDVq5YcH9KRE4SjaT+ACVeb8Mu5tqdp11ceaRf6811kiuu8xTxD9/+V4ZFIIuWI3Pyt4aDHKQOspD0nB7JLRe8JpbmYUzwdmaIjO4SzPZrCddVr1YDeI/f7tLSXQEjrzDkNog289PGGcZOh657/iMVZ3wU/YF4oZ40dclbuFyId70yirk0JLZ6uavlvlEY+PzY3wv4+KU+i/OZi2wCpHhwJUVgBj6jjathmVWKJ9SinsJvi/8iZvIIc8aw5LSNjx3v0e1K23XjoLtFH8Jqzb3aHo6lVuVCXdgVoyI8Oeoy/Z1wkdrD+d0cJD4NE8RaiH5XMQI1MJXVWQfYScFE29jIW/jdCJdMy43HE1+Anzw2imKkak29Mh5VaiSNdM7xruudtP2eo5amhomNgLEnE5VastPE7ofeQpSzEARasg=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(39850400004)(346002)(136003)(376002)(36840700001)(46966006)(86362001)(4326008)(36860700001)(6666004)(2906002)(2616005)(70206006)(478600001)(70586007)(8676002)(5660300002)(8936002)(82740400003)(36756003)(316002)(110136005)(426003)(186003)(1076003)(44832011)(81166007)(82310400003)(26005)(47076005)(83380400001)(7696005)(336012)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2021 05:21:50.5453
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e33081cd-4603-415e-b2b6-08d919bcd740
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT031.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6085

This patch introduces static memory initialization, during system RAM boot up.

New func init_staticmem_pages is the equivalent of init_heap_pages, responsible
for static memory initialization.

Helper func free_staticmem_pages is the equivalent of free_heap_pages, to free
nr_pfns pages of static memory.
For each page, it includes the following steps:
1. change page state from in-use(also initialization state) to free state and
grant PGC_reserved.
2. set its owner NULL and make sure this page is not a guest frame any more
3. follow the same cache coherency policy in free_heap_pages
4. scrub the page in need

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
 xen/arch/arm/setup.c    |  2 ++
 xen/common/page_alloc.c | 70 +++++++++++++++++++++++++++++++++++++++++
 xen/include/xen/mm.h    |  3 ++
 3 files changed, 75 insertions(+)

diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 444dbbd676..f80162c478 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -818,6 +818,8 @@ static void __init setup_mm(void)
 
     setup_frametable_mappings(ram_start, ram_end);
     max_page = PFN_DOWN(ram_end);
+
+    init_staticmem_pages();
 }
 #endif
 
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index ace6333c18..58b53c6ac2 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -150,6 +150,9 @@
 #define p2m_pod_offline_or_broken_hit(pg) 0
 #define p2m_pod_offline_or_broken_replace(pg) BUG_ON(pg != NULL)
 #endif
+#ifdef CONFIG_ARM_64
+#include <asm/setup.h>
+#endif
 
 /*
  * Comma-separated list of hexadecimal page numbers containing bad bytes.
@@ -1512,6 +1515,49 @@ static void free_heap_pages(
     spin_unlock(&heap_lock);
 }
 
+/* Equivalent of free_heap_pages to free nr_pfns pages of static memory. */
+static void free_staticmem_pages(struct page_info *pg, unsigned long nr_pfns,
+                                 bool need_scrub)
+{
+    mfn_t mfn = page_to_mfn(pg);
+    int i;
+
+    for ( i = 0; i < nr_pfns; i++ )
+    {
+        switch ( pg[i].count_info & PGC_state )
+        {
+        case PGC_state_inuse:
+            BUG_ON(pg[i].count_info & PGC_broken);
+            /* Make it free and reserved. */
+            pg[i].count_info = PGC_state_free | PGC_reserved;
+            break;
+
+        default:
+            printk(XENLOG_ERR
+                   "Page state shall be only in PGC_state_inuse. "
+                   "pg[%u] MFN %"PRI_mfn" count_info=%#lx tlbflush_timestamp=%#x.\n",
+                   i, mfn_x(mfn) + i,
+                   pg[i].count_info,
+                   pg[i].tlbflush_timestamp);
+            BUG();
+        }
+
+        /*
+         * Follow the same cache coherence scheme in free_heap_pages.
+         * If a page has no owner it will need no safety TLB flush.
+         */
+        pg[i].u.free.need_tlbflush = (page_get_owner(&pg[i]) != NULL);
+        if ( pg[i].u.free.need_tlbflush )
+            page_set_tlbflush_timestamp(&pg[i]);
+
+        /* This page is not a guest frame any more. */
+        page_set_owner(&pg[i], NULL);
+        set_gpfn_from_mfn(mfn_x(mfn) + i, INVALID_M2P_ENTRY);
+
+        if ( need_scrub )
+            scrub_one_page(&pg[i]);
+    }
+}
 
 /*
  * Following rules applied for page offline:
@@ -1828,6 +1874,30 @@ static void init_heap_pages(
     }
 }
 
+/* Equivalent of init_heap_pages to do static memory initialization */
+void __init init_staticmem_pages(void)
+{
+    int bank;
+
+    /*
+     * TODO: Considering NUMA-support scenario.
+     */
+    for ( bank = 0 ; bank < bootinfo.static_mem.nr_banks; bank++ )
+    {
+        paddr_t bank_start = bootinfo.static_mem.bank[bank].start;
+        paddr_t bank_size = bootinfo.static_mem.bank[bank].size;
+        paddr_t bank_end = bank_start + bank_size;
+
+        bank_start = round_pgup(bank_start);
+        bank_end = round_pgdown(bank_end);
+        if ( bank_end <= bank_start )
+            return;
+
+        free_staticmem_pages(maddr_to_page(bank_start),
+                            (bank_end - bank_start) >> PAGE_SHIFT, false);
+    }
+}
+
 static unsigned long avail_heap_pages(
     unsigned int zone_lo, unsigned int zone_hi, unsigned int node)
 {
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index 667f9dac83..8b1a2207b2 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -85,6 +85,9 @@ bool scrub_free_pages(void);
 } while ( false )
 #define FREE_XENHEAP_PAGE(p) FREE_XENHEAP_PAGES(p, 0)
 
+/* Static Memory */
+void init_staticmem_pages(void);
+
 /* Map machine page range in Xen virtual address space. */
 int map_pages_to_xen(
     unsigned long virt,
-- 
2.25.1


