Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64FC140EFD1
	for <lists+xen-devel@lfdr.de>; Fri, 17 Sep 2021 04:50:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.188850.338197 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mR3wm-0001EN-3j; Fri, 17 Sep 2021 02:49:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 188850.338197; Fri, 17 Sep 2021 02:49:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mR3wl-0001C0-Ug; Fri, 17 Sep 2021 02:49:51 +0000
Received: by outflank-mailman (input) for mailman id 188850;
 Fri, 17 Sep 2021 02:49:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4o4g=OH=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1mR3wk-0001Bu-VG
 for xen-devel@lists.xenproject.org; Fri, 17 Sep 2021 02:49:51 +0000
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (unknown
 [40.107.12.44]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ec202d28-1761-11ec-b663-12813bfff9fa;
 Fri, 17 Sep 2021 02:49:48 +0000 (UTC)
Received: from DB3PR06CA0025.eurprd06.prod.outlook.com (2603:10a6:8:1::38) by
 PR2PR08MB5226.eurprd08.prod.outlook.com (2603:10a6:101:24::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.19; Fri, 17 Sep 2021 02:49:46 +0000
Received: from DB5EUR03FT062.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:8:1:cafe::4f) by DB3PR06CA0025.outlook.office365.com
 (2603:10a6:8:1::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16 via Frontend
 Transport; Fri, 17 Sep 2021 02:49:46 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT062.mail.protection.outlook.com (10.152.20.197) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.14 via Frontend Transport; Fri, 17 Sep 2021 02:49:46 +0000
Received: ("Tessian outbound e27daf245730:v103");
 Fri, 17 Sep 2021 02:49:46 +0000
Received: from bb74ca36c858.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B7142E55-3151-4BC2-B567-366281D58F74.1; 
 Fri, 17 Sep 2021 02:49:40 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id bb74ca36c858.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 17 Sep 2021 02:49:40 +0000
Received: from AS8PR04CA0207.eurprd04.prod.outlook.com (2603:10a6:20b:2f3::32)
 by VE1PR08MB4928.eurprd08.prod.outlook.com (2603:10a6:802:aa::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14; Fri, 17 Sep
 2021 02:49:28 +0000
Received: from AM5EUR03FT038.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2f3:cafe::53) by AS8PR04CA0207.outlook.office365.com
 (2603:10a6:20b:2f3::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16 via Frontend
 Transport; Fri, 17 Sep 2021 02:49:28 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT038.mail.protection.outlook.com (10.152.17.118) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4523.14 via Frontend Transport; Fri, 17 Sep 2021 02:49:28 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Fri, 17 Sep
 2021 02:49:35 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Fri, 17 Sep 2021 02:49:33 +0000
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
X-Inumbo-ID: ec202d28-1761-11ec-b663-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hy7+zIJZBtT6U8kppnGcIZcA+xQgczSoUdZnpK5RE5E=;
 b=DBuCp6AWIDbOmdHIIFWGSrx7vS6STeIie4vmX7YPH0sO/FMWGV28w1No8FEwdEmNfkFiHXRLMCux5J8xuOaTfUhcg0rdG5ZN4C6siZBUR+zwnnsjPyfB4eXB2yZaPBo55PLVezkkfFXHe+bYuH/W8+1pk2ynMz4GbV7Ikf+HF78=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: dc8ad1cd1d130b88
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MTOVuDGpuVMxJQchmT8PoHR1TpjAb3COK66Zqtdybsptzyv0Rm1tTUv5cE1a5WJdLmIK3Og98gnSM1AkhAXXgtcQD5lVq6B6JZ1vu/FfTCQ3fVF4utSyQESAwgetD0WjGyC5BSHoM27GznV498Z+ZAXXUWwwo2eQsYhCFY2KKeS3xTKQVumwvFCGBOic9t5Dc0MjIjeL+ap7uZG91YbxhYDCfTLlRVkOLuV++xlUevRs8bsQgx7WwawcbG0aqz/1hwtuawG0htmVeDyzMPNAo2KDGimL2ybqmDRgd1tqjJEwhRv1eNaqzUsxjo3FP6Cj+xgdAnrnEJ6ctd4upN48Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=Hy7+zIJZBtT6U8kppnGcIZcA+xQgczSoUdZnpK5RE5E=;
 b=KCa3A+zyRWOKifHEdSk2t6cte3L9AN2fxZnV1pIVDAScRROiHsPNOMnFWwDg2lrGEP87DSED9e36mKTGGyL0VoY/jz2l36FthTBZLfnCWbLHVApnIEjv+Qigie5BKPKvYUa+pOS3G75eAsthWvDI9cXYBML4xcawcaVV2hkD8zk57cnBI5w0LnNcplgtieT9oaUDIRP1equrOxPYPTzoBih4UAXBkDCZ/sVZIMlVP/CNjATNhjGZC9eml02Z3l448W/QhQWH0lzkAJrtEKR+RW7by61OCnHBy5xW33Cv8SW5+yRNYZJkgiKy6tgLU3mf4cQ2xcfJyL4sp3jO+aRkMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hy7+zIJZBtT6U8kppnGcIZcA+xQgczSoUdZnpK5RE5E=;
 b=DBuCp6AWIDbOmdHIIFWGSrx7vS6STeIie4vmX7YPH0sO/FMWGV28w1No8FEwdEmNfkFiHXRLMCux5J8xuOaTfUhcg0rdG5ZN4C6siZBUR+zwnnsjPyfB4eXB2yZaPBo55PLVezkkfFXHe+bYuH/W8+1pk2ynMz4GbV7Ikf+HF78=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Penny Zheng <penny.zheng@arm.com>
To: <xen-devel@lists.xenproject.org>, <jbeulich@suse.com>
CC: <Bertrand.Marquis@arm.com>, <Wei.Chen@arm.com>
Subject: [PATCH] xen: fix broken tainted value in mark_page_free
Date: Fri, 17 Sep 2021 02:48:55 +0000
Message-ID: <20210917024855.605551-1-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d9ebe49d-9ea1-40c2-31ef-08d97985cf64
X-MS-TrafficTypeDiagnostic: VE1PR08MB4928:|PR2PR08MB5226:
X-Microsoft-Antispam-PRVS:
	<PR2PR08MB522651EF8D6B814E0DBC4432F7DD9@PR2PR08MB5226.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;OLM:2089;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 MRtkX/UL+tAReUShFDYnckk0Zp8qRbzhbFF23rAkYLSMBrmtvuLbGkn0gIxprP3qJRv6MjPXHYM1Q4oFNr5oPxwVRG0dNa4M8dDdM3J9pZp2ZkVorTGy7j+1fUyjZqPcDAy14e4UHKch9u1YlouVJEl8KGQxC+Zmbz19jaDtr4DAN2vf9ZSuEpdB8UXsYdL8P7fuPK08kplASDtycPp7UXy/HgWpUQIHlHxnAQb2zGrlmJD0Qnadnv1sP4ThDWbomzWpOxYWMcClH8NAjisVr+ePX+SVSBIw9HDqyn+fY+ceciq0JkcXSQ9AC8BJaU9Ggsf1GP4DgzaYuSkRk463u6MKGKtOdrWgWi/JPAfUL8+82QiSNNEHQHiViel1wGa0cDQ99IAnkasqi9KGkj89nwCpHyL+A8ZLwwJ8f/dXNb4GEFAgFpPnYPnQ3jrK4D5gBz0Ui+U4TdV6UucVxAmrTBtgwFKKK7BPckKyezSEe5ddqlNp8jrqAhlr5IJVBdF4jIjyJLhau7dMGfPuyqbny72dC747PTzLrHYjqXrBY32LkNWCtwHsuKVUJIEQ+Nddwh1FNpd8RaaRypBQqi2dbrAz5eukzDLPwYoBORVOMzQuHeNmj4vTFTCbVmpooVJnlQZ11Uyv6xbZLImr7KUMzmUjFf7i8MSqAcP3fdqw4xRwp7ggcxZJkn2SUtqqZNAbno7m1tTHphnTpA1r1epXa/bLmpr94pl4qCIXjlSXmkU=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(81166007)(186003)(26005)(336012)(2616005)(2906002)(86362001)(70586007)(4326008)(316002)(426003)(47076005)(82310400003)(508600001)(36860700001)(8936002)(70206006)(6666004)(7696005)(54906003)(5660300002)(110136005)(44832011)(356005)(1076003)(8676002)(83380400001)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4928
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	887364c2-504b-4a4c-04f8-08d97985c45a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	cuH1guZvHFLSb9m93lcLdaxtSK4d+M/ZDkhcKd3pRUdthKCXbYk//SEq29HP3x8plwtxxjxkNY5kpPEp3cc3jFuUgPTlqHzv8XmaSMPE2qfteSGoLGlq5yfG23UUpNJ9zRX3vdMadRgG1uNcWuw1/Sl3zR3VTrzP6Ms9bOqkVMCVZAkctZeQIoy+Z9NivNa1yNRl+HlfvtEEBIJ+GCe6dCe9S+OIIJ58JOCf30xdztUh6pKJhRkF2vB8MbXO6SvdwSx/FIC6Gp25PWystgp5MOJS+TcPRVUxKjyCgCgCuFUgbVCqDpNWu74rTzdTPHazgkwLA+mhiC0npE+s3PXJADyA9+1WDJ4Bnky5Hkeb1OWsimL9htvFTf535IVEHWw3RL5VLq9ZSLSYTUAO9H9N3Yi0MOs6JcILl3M9Dnl024w3ZlG8aM4XBi9Cj1Ksq5oT8RbAtm0fRqNjWgjuuqxf1XCUuHUfmptidSnC1SIl9zOR+tYJ75rORjU3M1Pjf7LQTVCn3WMGHgb6FDFkDQGNed3eQI7eWtt+mDl8YqxEwdoOcjwNUK4I8jIV03mneGC7LmgIt6Ahy4cnX+zhVkXOou1l2qIbrxDcWdOvammdZmRXFEV4K+Yd8NXFcJ2Hkx338CZlN+oes1SFM/be5uw8cWN2Jf96rzXE/VLZkDP0ijaW8RW5/WLGVjwrnuppqtDF2YNlchhPGxNSRdJ5aHS2YA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(136003)(39860400002)(46966006)(36840700001)(36860700001)(82310400003)(8936002)(336012)(70206006)(54906003)(70586007)(86362001)(1076003)(110136005)(478600001)(316002)(4326008)(26005)(5660300002)(36756003)(44832011)(47076005)(81166007)(7696005)(6666004)(186003)(2616005)(82740400003)(426003)(2906002)(8676002)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2021 02:49:46.6627
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d9ebe49d-9ea1-40c2-31ef-08d97985cf64
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT062.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB5226

Commit 540a637c3410780b519fc055f432afe271f642f8 defines a new
helper mark_page_free to extract common codes, but it broke the
local variable "tainted", revealed by Coverity ID 1491872.

This patch let mark_page_free() return boolean value of variable
"tainted" and rename local variable "tainted" to "pg_tainted"
to tell the difference from the global variable of the same name.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
 xen/common/page_alloc.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index b9441cb06f..c6f48f7a97 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -1380,8 +1380,10 @@ bool scrub_free_pages(void)
     return node_to_scrub(false) != NUMA_NO_NODE;
 }
 
-static void mark_page_free(struct page_info *pg, mfn_t mfn)
+static bool mark_page_free(struct page_info *pg, mfn_t mfn)
 {
+    unsigned int pg_tainted = 0;
+
     ASSERT(mfn_x(mfn) == mfn_x(page_to_mfn(pg)));
 
     /*
@@ -1405,7 +1407,7 @@ static void mark_page_free(struct page_info *pg, mfn_t mfn)
     case PGC_state_offlining:
         pg->count_info = (pg->count_info & PGC_broken) |
                          PGC_state_offlined;
-        tainted = 1;
+        pg_tainted = 1;
         break;
 
     default:
@@ -1425,6 +1427,8 @@ static void mark_page_free(struct page_info *pg, mfn_t mfn)
     /* This page is not a guest frame any more. */
     page_set_owner(pg, NULL); /* set_gpfn_from_mfn snoops pg owner */
     set_gpfn_from_mfn(mfn_x(mfn), INVALID_M2P_ENTRY);
+
+    return pg_tainted;
 }
 
 /* Free 2^@order set of pages. */
@@ -1433,7 +1437,7 @@ static void free_heap_pages(
 {
     unsigned long mask;
     mfn_t mfn = page_to_mfn(pg);
-    unsigned int i, node = phys_to_nid(mfn_to_maddr(mfn)), tainted = 0;
+    unsigned int i, node = phys_to_nid(mfn_to_maddr(mfn)), pg_tainted = 0;
     unsigned int zone = page_to_zone(pg);
 
     ASSERT(order <= MAX_ORDER);
@@ -1443,7 +1447,8 @@ static void free_heap_pages(
 
     for ( i = 0; i < (1 << order); i++ )
     {
-        mark_page_free(&pg[i], mfn_add(mfn, i));
+        if ( mark_page_free(&pg[i], mfn_add(mfn, i)) )
+            pg_tainted = 1;
 
         if ( need_scrub )
         {
@@ -1517,7 +1522,7 @@ static void free_heap_pages(
 
     page_list_add_scrub(pg, node, zone, order, pg->u.free.first_dirty);
 
-    if ( tainted )
+    if ( pg_tainted )
         reserve_offlined_page(pg);
 
     spin_unlock(&heap_lock);
-- 
2.25.1


