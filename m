Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6971D4D5B67
	for <lists+xen-devel@lfdr.de>; Fri, 11 Mar 2022 07:13:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288730.489771 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSYWJ-0003bE-Sf; Fri, 11 Mar 2022 06:12:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288730.489771; Fri, 11 Mar 2022 06:12:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSYWJ-0003Og-Kh; Fri, 11 Mar 2022 06:12:59 +0000
Received: by outflank-mailman (input) for mailman id 288730;
 Fri, 11 Mar 2022 06:12:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p7td=TW=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1nSYWI-0000Fh-2k
 for xen-devel@lists.xenproject.org; Fri, 11 Mar 2022 06:12:58 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on062b.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::62b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4b9893b1-a102-11ec-8eba-a37418f5ba1a;
 Fri, 11 Mar 2022 07:12:57 +0100 (CET)
Received: from AS9PR0301CA0029.eurprd03.prod.outlook.com
 (2603:10a6:20b:468::10) by AM9PR08MB7242.eurprd08.prod.outlook.com
 (2603:10a6:20b:431::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Fri, 11 Mar
 2022 06:12:55 +0000
Received: from VE1EUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:468:cafe::9c) by AS9PR0301CA0029.outlook.office365.com
 (2603:10a6:20b:468::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.23 via Frontend
 Transport; Fri, 11 Mar 2022 06:12:55 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT055.mail.protection.outlook.com (10.152.19.158) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5061.22 via Frontend Transport; Fri, 11 Mar 2022 06:12:54 +0000
Received: ("Tessian outbound 18e50a6f0513:v113");
 Fri, 11 Mar 2022 06:12:54 +0000
Received: from 94a5c30b510f.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 62079C2C-621B-4092-BC66-B8A5B84068C8.1; 
 Fri, 11 Mar 2022 06:12:48 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 94a5c30b510f.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 11 Mar 2022 06:12:48 +0000
Received: from AS9PR06CA0202.eurprd06.prod.outlook.com (2603:10a6:20b:45d::32)
 by AM0PR08MB3538.eurprd08.prod.outlook.com (2603:10a6:208:de::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.19; Fri, 11 Mar
 2022 06:12:45 +0000
Received: from VE1EUR03FT029.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45d:cafe::35) by AS9PR06CA0202.outlook.office365.com
 (2603:10a6:20b:45d::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.20 via Frontend
 Transport; Fri, 11 Mar 2022 06:12:45 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT029.mail.protection.outlook.com (10.152.18.107) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5061.22 via Frontend Transport; Fri, 11 Mar 2022 06:12:40 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.27; Fri, 11 Mar
 2022 06:12:37 +0000
Received: from a011292.shanghai.arm.com (10.169.190.94) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.27 via Frontend
 Transport; Fri, 11 Mar 2022 06:12:35 +0000
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
X-Inumbo-ID: 4b9893b1-a102-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QR0uJjdb78Gry1GYCYAG5IJdQ9AYTo5LJTpZNi0Eqhs=;
 b=FYgLgsUZUv+JJpq18/N0tth/RcX5GPbaGpcKI74v4AC5yJWrmuy3PH9/7FvPTiBo97d91FbqhuyJn5uaNx0SliX3BIyG66gUr+ozFJQm12dYjo/Wza0tbhcnQwaFj/hR+dw7RtGafNDbLz164L/QDPRG+m89NhoDDx0jy0i0/O8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4548e821d9660e39
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oHu5dKgOJ+pgs8bNfw/cSrIDupk6kfjdTGZDEyT/Wl9H7QUCSOZvzEPvy4KZ6djM90bskw67q3fuNIm/g2Q3Yi9zteaWZR2M02ryl8utJR40ooJoWoEW5wbnOFaC4F2XYQSh/ytqM1agPb1QSiZWPlU1QALOjkqMmeg9wLcwRvh18ajfs40ifSL8kXWWMkDgT4ZvcCFwDVZyKsHMqA4U1yOfGlPDzJRXiW4Q4tqFg4t9E74vK/GnFoX+0x+xn5m2yY0Ozooh0qo11GUAOKcL3nZQpQx9DAz1Ck+1FEuF45AnntY8xOx4z62IG8nAglLDVQXWwBMly2VBcyQdKc5ZCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QR0uJjdb78Gry1GYCYAG5IJdQ9AYTo5LJTpZNi0Eqhs=;
 b=XraXeDJXZ/zfLgwdOHGgrydQjBK7N2CXPqdy5XwAGnccLRNcaOWO/EkRSRzZM1VnB0E5Ui/1IZ8T+GrHkPi2zkXnybtw2wN1231xEgmYrfkv7zWgXoLAmJQyZKimMDtDYSidvK07DZvM1pXlNWrTpd6ro9GDh6ACtFVf/0HGv8lUPvb8ATguRaih7o0uqZIQvRlkBIDtDoEerL7TthysMqXXgLWXuRBOSBX6FFf4L9dslSAcYSM0w7Uu+AvQSVYmylXsuaNRh8XdCtiW8q1uPkGN/3PNHOFIF9I2Y6fP1q705quWnHNUeEwcoU/ErWKnZN8A2EdAbAaZRSYpO5gA3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QR0uJjdb78Gry1GYCYAG5IJdQ9AYTo5LJTpZNi0Eqhs=;
 b=FYgLgsUZUv+JJpq18/N0tth/RcX5GPbaGpcKI74v4AC5yJWrmuy3PH9/7FvPTiBo97d91FbqhuyJn5uaNx0SliX3BIyG66gUr+ozFJQm12dYjo/Wza0tbhcnQwaFj/hR+dw7RtGafNDbLz164L/QDPRG+m89NhoDDx0jy0i0/O8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Penny Zheng <Penny.Zheng@arm.com>
To: <xen-devel@lists.xenproject.org>
CC: <nd@arm.com>, Penny Zheng <penny.zheng@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v1 10/13] xen/arm: allocate static shared memory to a specific owner domain
Date: Fri, 11 Mar 2022 14:11:20 +0800
Message-ID: <20220311061123.1883189-11-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220311061123.1883189-1-Penny.Zheng@arm.com>
References: <20220311061123.1883189-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: b5f6e165-4fe1-48a7-322f-08da03262e71
X-MS-TrafficTypeDiagnostic:
	AM0PR08MB3538:EE_|VE1EUR03FT055:EE_|AM9PR08MB7242:EE_
X-Microsoft-Antispam-PRVS:
	<AM9PR08MB7242E63D458A4FEE88519FFDF70C9@AM9PR08MB7242.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Hwd/enHFjuwu92cp1BUG45IWh3ykmfgLmPkLJvxytDl4KiW1LL142jjZrrIoQ42oFAkDgAi4PTyDVkVqKMYzM6qNMH+S7hzSZNCkpExGFiAV7Omam61I20QgbuYcfPWF0JkUa0csnOvO45CiwTP1Tny+AroC5uUs0jvR/5Tqs2u1BBJ6JNEqZYRrwFXyfwfqQEVUg5VjgT1/kIpZthSlpKx24ec/aNMmA1XsaOp9pLWeEdBMJ2h+EWM9RLTjtUzrdIKPaV/kT8xVJLSbUm+AN73wGYy2PIdqY7+8clVsNDP+s+1U1emO744bptIAOVGp0KXUaKaJOYMlsKAfBGFhDqkqyutBjqVkadpGZ8YcMR2+trmraAViptdgLVwpLpui7TN9Oi+uetU7RkFvYpK84IAd3Ds6w/z4+28lQdsYvsIT8FKKXJdsaGWlMRu5ZIj8v2ELPgrMiQ9JCOkXxp9710DKSLmbIY07Ops09Y+/lJLPJAyYat1BWIE0aIX3zcjmLhdr4HzG6f/85FK0yYya6S8QDOm87wHi+hu5NrnGDTtrVrUH42lxsnTkCUPJbbqrvOvH602xUK4W4ny2hH65hnwU+Sfx+GCxJUbTUGKIFb9PUEucs+D1KgqS5HsF8c7ezlwJ9n5TeSpJ1zJyVKtW5bDetNCesotF2gounNqezkV3U8kCnrXcL6PpOC9RQEmLHogVIQt7rfAeqFXMUTctQw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(54906003)(1076003)(356005)(82310400004)(6916009)(316002)(2616005)(7696005)(5660300002)(81166007)(8676002)(83380400001)(8936002)(6666004)(336012)(426003)(508600001)(86362001)(47076005)(4326008)(36860700001)(36756003)(40460700003)(186003)(2906002)(70586007)(26005)(70206006)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3538
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3bd64e54-2636-42ae-3e63-08da032625a7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YGl2/V5IRFTiy03csL5xcXQg4/CMlY/fhdx2D23vRQD95Z7h4syvNiUsqA/oSqQnzRZdGrb+IUdjmVBLGSkH1cQZhr019IAFFS9Ayw4V3nHUnXuqV/UpM++1p+WP3F9jCaB77CtrxCeA8mjMlqsP81YfIrqk732wqorZokT7Kry1jRZvOwfMUsReJM6sCJySCyRgonxtnGMR3WFiMxndsUeQPD0f0Be+lm/k/5/zo3AcTzISF/24HdQS5QOJS89fdbYl3REFbNnCE88eiz8cg1KtGOE9PPItkI6CTY2+FjFq2U3ouXdQ5CuWObVkycciKx0Juu4BM+k7fRnYF1YMuTAbrsmk8FQleQyntvrFc6oaRu6ZxqH0EHInZ8Ki/s8TqmCt4R2MOnvuGb5axWnDqJLTEEODmfymyLaDIMMqYfGzNdtBfDOVlUd1rF7DhJn4n5MH9YkI2J6jooss9ad8ypzfInJW1OywiPko+RIodFD2kodtO99ykIzoTxN62Flot1WqbXefZ+OXnBfNqDIAF+Xm4Q5yui6S3O4A/4QECYK63uKT/h0hNo2Xdhd3Fn1esYf1d5Fcc6IRhbndeE5Zh/qZpjBiVUcryAfVvnEOXrzIVAi4Rxm4e3crdoWE41LI0AkhnSf1f9rUIuOVUXkjCbOKUtIVCdYp5BTxUVOZnS2u1mvykXYzvxe99gwhbjTuHVauZXBuF0JeQFHf8SdfAihKCDtlCrn5QGVubhQ2TFo=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(8936002)(70586007)(2906002)(508600001)(316002)(36756003)(186003)(82310400004)(426003)(6666004)(7696005)(2616005)(26005)(1076003)(107886003)(47076005)(40460700003)(83380400001)(336012)(8676002)(70206006)(54906003)(4326008)(6916009)(36860700001)(5660300002)(81166007)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2022 06:12:54.8063
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b5f6e165-4fe1-48a7-322f-08da03262e71
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB7242

From: Penny Zheng <penny.zheng@arm.com>

If owner property is defined, then owner domain of a static shared memory
region is not the default dom_shared anymore, but a specific domain.

This commit implements allocating static shared memory to a specific domain
when owner property is defined.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
 xen/arch/arm/domain_build.c | 63 ++++++++++++++++++++++++++++---------
 1 file changed, 48 insertions(+), 15 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index d35f98ff9c..7ee4d33e0b 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -872,6 +872,8 @@ static int __init process_shm(struct domain *d,
     u32 shm_id;
     u32 addr_cells, size_cells;
     paddr_t gbase, pbase, psize;
+    const char *role_str;
+    bool owner_dom_shared = true;
 
     dt_for_each_child_node(node, shm_node)
     {
@@ -899,6 +901,13 @@ static int __init process_shm(struct domain *d,
         gbase = dt_read_number(cells, addr_cells);
 
         /* TODO: Consider owner domain is not the default dom_shared. */
+        /*
+         * "role" property is optional and if it is defined explicitly,
+         * so the owner domain is not the default "dom_shared" domain.
+         */
+        if ( dt_property_read_string(shm_node, "role", &role_str) == 0 )
+            owner_dom_shared = false;
+
         /*
          * Per shared memory region could be shared between multiple domains.
          * In case re-allocating the same shared memory region, we use bitmask
@@ -907,17 +916,38 @@ static int __init process_shm(struct domain *d,
          */
         if ( !test_bit(shm_id, shm_mask) )
         {
-            /*
-             * Allocate statically shared pages to the default dom_shared.
-             * Set up P2M, and dom_shared is a direct-map domain,
-             * so GFN == PFN.
-             */
-            ret = allocate_shared_memory(dom_shared, addr_cells, size_cells,
-                                         pbase, psize, pbase);
-            if ( ret )
-                return ret;
-
-            set_bit(shm_id, shm_mask);
+            if ( !owner_dom_shared )
+            {
+                if ( strcmp(role_str, "owner") == 0 )
+                {
+                    /*
+                     * Allocate statically shared pages to a specific owner
+                     * domain.
+                     */
+                    ret = allocate_shared_memory(d, shm_id, addr_cells,
+                                                 size_cells, pbase, psize,
+                                                 gbase);
+                    if ( ret )
+                        return ret;
+
+                    set_bit(shm_id, shm_mask);
+                }
+            }
+            else
+            {
+                /*
+                 * Allocate statically shared pages to the default dom_shared.
+                 * Set up P2M, and dom_shared is a direct-map domain,
+                 * so GFN == PFN.
+                 */
+                ret = allocate_shared_memory(dom_shared, shm_id,
+                                             addr_cells, size_cells, pbase,
+                                             psize, pbase);
+                if ( ret )
+                    return ret;
+
+                set_bit(shm_id, shm_mask);
+            }
         }
 
         /*
@@ -925,10 +955,13 @@ static int __init process_shm(struct domain *d,
          * default dom_shared, so here we could just set up P2M foreign
          * mapping for borrower domain immediately.
          */
-        ret = guest_physmap_add_shm(dom_shared, d, PFN_DOWN(pbase),
-                                    PFN_DOWN(gbase), PFN_DOWN(psize));
-        if ( ret )
-            return ret;
+        if ( owner_dom_shared )
+        {
+            ret = guest_physmap_add_shm(dom_shared, d, PFN_DOWN(pbase),
+                                        PFN_DOWN(gbase), PFN_DOWN(psize));
+            if ( ret )
+                return ret;
+        }
 
         /*
          * Record static shared memory region info for later setting
-- 
2.25.1


