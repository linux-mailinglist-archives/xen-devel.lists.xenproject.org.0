Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 18DFB1F6754
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jun 2020 13:59:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjLrn-0000iH-64; Thu, 11 Jun 2020 11:59:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=muN5=7Y=arm.com=bertrand.marquis@srs-us1.protection.inumbo.net>)
 id 1jjLrl-0000i2-Sl
 for xen-devel@lists.xenproject.org; Thu, 11 Jun 2020 11:59:29 +0000
X-Inumbo-ID: 00d024b0-abdb-11ea-b50b-12813bfff9fa
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.76]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 00d024b0-abdb-11ea-b50b-12813bfff9fa;
 Thu, 11 Jun 2020 11:59:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NoAS9Dfi5sevNBmACNeNCJiBuMEo0Y1qOGnIY23Styk=;
 b=F84VXtaHUrId5N+9NDk9WqqLTS5f3J92YhF9dgEJrYOHzO3ZV98srgmrK5wnBJdzuHuwI9i8Wrup32hOf55OHjv38cR4S9NEg6IRmklJP9PYZ9pvPWC7/E0sKXfMLhpy/vHoDG2XHSwAlLl1E+6P+FILulh/BLdfwFBziv3oGvs=
Received: from AM5PR0101CA0020.eurprd01.prod.exchangelabs.com
 (2603:10a6:206:16::33) by AM0PR08MB3122.eurprd08.prod.outlook.com
 (2603:10a6:208:5d::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.22; Thu, 11 Jun
 2020 11:59:26 +0000
Received: from AM5EUR03FT039.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:16:cafe::ca) by AM5PR0101CA0020.outlook.office365.com
 (2603:10a6:206:16::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3088.20 via Frontend
 Transport; Thu, 11 Jun 2020 11:59:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org;
 dmarc=bestguesspass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT039.mail.protection.outlook.com (10.152.17.185) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3088.18 via Frontend Transport; Thu, 11 Jun 2020 11:59:25 +0000
Received: ("Tessian outbound 4f5776643448:v59");
 Thu, 11 Jun 2020 11:59:25 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: afd211188bb5d748
X-CR-MTA-TID: 64aa7808
Received: from 2789c5b74de9.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 6AC60FA3-C563-4599-9E17-FCF50E9B6D31.1; 
 Thu, 11 Jun 2020 11:59:20 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 2789c5b74de9.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 11 Jun 2020 11:59:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qsq89Fm1tFfAruQKlsAJrncXOFNuIlKuMzKxlDRCTYY0LR3Ma9nDnc130RZV3kVAj5SDy/V9A2obkKigxwzIQ8Vi4y4lwVNTI2HWl7zCHev5uscTuyU/qnIxh1R7N0S1sKEsAwT0JHIx22fOsH5YFtgILf+2n6K7qg8uWigbGNZygT+YynLx2Koizd685SUGxcf63pvUH206raid6j1B+V7Il6AoNG1hrgDjQtx7PPZWAXDKT/nrDSmhjGvvPaJIJTZT7xkOMsWdp453K9OR/EclNyLMkCWHX8si2hW3m8mtkTijDIm2ZY//sGC0e2nG29bx6w0c45aotr3Gxdp+NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NoAS9Dfi5sevNBmACNeNCJiBuMEo0Y1qOGnIY23Styk=;
 b=j55kCcTP4X4yspKYhWduN4UnjTzebVvceWO2tCS15ug1RHw+BNMBEshtWhZw0e0EyfiNN+7Wgu/ff3yEGpkycuba7yAcmIOrO/EKb0/a6AoQ6VqpbmFzTSJ5HEs/+l+laV/EC/80Mhz9Z4gD1ncQH07NBo4Wk1V+pQ8P04YFO3y1SK/vSQb7tBrPCNiPy2Wp1Q2OSqCTyKM6id4o1lBTjypc+KUYYKseKLgmlEPOssL3V9Sp2v7FyFrFJ2G1EYtocGwsrFrJKwOdAUXat2JpsngM6uHdDC18PjQJog/jOzpS698AbKCvJq2tTDfDf8DhyIHx1NP9DTPKvz/PgmYUdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NoAS9Dfi5sevNBmACNeNCJiBuMEo0Y1qOGnIY23Styk=;
 b=F84VXtaHUrId5N+9NDk9WqqLTS5f3J92YhF9dgEJrYOHzO3ZV98srgmrK5wnBJdzuHuwI9i8Wrup32hOf55OHjv38cR4S9NEg6IRmklJP9PYZ9pvPWC7/E0sKXfMLhpy/vHoDG2XHSwAlLl1E+6P+FILulh/BLdfwFBziv3oGvs=
Authentication-Results-Original: lists.xenproject.org; dkim=none (message not
 signed) header.d=none; lists.xenproject.org;
 dmarc=none action=none header.from=arm.com;
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com (2603:10a6:10:79::16)
 by DB7PR08MB3387.eurprd08.prod.outlook.com (2603:10a6:10:45::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3066.18; Thu, 11 Jun
 2020 11:59:18 +0000
Received: from DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8]) by DB7PR08MB3689.eurprd08.prod.outlook.com
 ([fe80::4001:43ad:d113:46a8%5]) with mapi id 15.20.3088.021; Thu, 11 Jun 2020
 11:59:18 +0000
From: Bertrand Marquis <bertrand.marquis@arm.com>
To: xen-devel@lists.xenproject.org
Subject: [PATCH 2/2] xen/arm: Support runstate crossing pages
Date: Thu, 11 Jun 2020 12:58:21 +0100
Message-Id: <b4843bd234d4ece4f843bc636071106746abb3b5.1591806713.git.bertrand.marquis@arm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1591806713.git.bertrand.marquis@arm.com>
References: <cover.1591806713.git.bertrand.marquis@arm.com>
Content-Type: text/plain
X-ClientProxiedBy: SN6PR2101CA0008.namprd21.prod.outlook.com
 (2603:10b6:805:106::18) To DB7PR08MB3689.eurprd08.prod.outlook.com
 (2603:10a6:10:79::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from e109506-lin.cambridge.arm.com (217.140.106.51) by
 SN6PR2101CA0008.namprd21.prod.outlook.com (2603:10b6:805:106::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3109.0 via Frontend
 Transport; Thu, 11 Jun 2020 11:59:17 +0000
X-Mailer: git-send-email 2.17.1
X-Originating-IP: [217.140.106.51]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: a11b1002-dc99-4ac2-15ee-08d80dfee345
X-MS-TrafficTypeDiagnostic: DB7PR08MB3387:|AM0PR08MB3122:
X-Microsoft-Antispam-PRVS: <AM0PR08MB31224C87418D3D690578B7DD9D800@AM0PR08MB3122.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:8882;
X-Forefront-PRVS: 0431F981D8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: lnDWdIFSvikpOOtPSK/bn5iC2aT6G8reEAcseoCLs0PczU0o/b4U8/zZdeGUD+7J5Y3g194Uh1x5iJcj7ub1RjwKOIK3eRkd42NBvFK3wKc+eKXc6unJ1SDNCPCjw2gj370lV+NzKdhzAMH827DtRtSoj6V+7YrLj7fLi8zbOLvxRsg1R4BryApNnHQDMbUGBcWYMJX/7UZbDCy3r21P1oHl6ngv14dfHz4Fgxd/O2zpOSMN5FKu9FkKcqIuuGgPyQvyx4H08OtDYFk3pM/XFCu+QwHZ/NLZ5usbjYGbQMDZITrK7tPkTHiDGGLKgwPLZVCOWDj1j0rPSy/AsVpwkC8cTN8/B2PnhiA0hPXA3u4/z/iIPpEzKjDNDvkQL2ll
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:DB7PR08MB3689.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE; SFTY:;
 SFS:(4636009)(39860400002)(366004)(396003)(136003)(376002)(346002)(66476007)(6486002)(66946007)(86362001)(5660300002)(16526019)(36756003)(6666004)(186003)(4326008)(2906002)(26005)(83380400001)(66556008)(8676002)(956004)(6916009)(54906003)(8936002)(52116002)(2616005)(7696005)(316002)(44832011)(478600001)(136400200001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: BHS72odaQD/wSjd8dvGeF2rTCCwLsNcXNhCgk6GzzTSN1QmEfID0U6eLJ+fJfznSEovaf+8poWRlmgV5lNnjuAqxneR4Iq+KKej/31tGNM6yLwsEbzGw5mcNMDmB4BdoyY7emJwkxFT9VhtyIql4flIhINdvuD6FJIyY+Dnajngz3YvmtSzh4UatkhSIEjo2/8yj4BKR+ihvjo40yjFhR+/7TyOZddZtKAyZCORGtLJ0Z8A3t2g3VuOO8LEP26amGsz8tSF9rrHf1wO+pWlAT2UNJDuUE4B97yAKXk15yHYV7Y6hcpDHJeIvuv4vu1/42su4aa2OaSjN8fzlrBlReXwhShrbezXhPkfy0UPzrPAiVXflPqiFoEc0XT11VjkhNY0OGLmXlsf4oHUbs86L9TB8ZPuwXCqcCDdhMntVdYjVt8N1FTHFlv0aU1FyWeIQKXAjTgWjxg32hKlGMSuWfryBOl5oTD/jFLWPPSeHfn8=
X-MS-Exchange-Transport-Forked: True
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3387
Original-Authentication-Results: lists.xenproject.org;
 dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=none action=none
 header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: AM5EUR03FT039.eop-EUR03.prod.protection.outlook.com
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE; SFTY:;
 SFS:(4636009)(376002)(346002)(39860400002)(396003)(136003)(46966005)(86362001)(8936002)(8676002)(107886003)(4326008)(16526019)(7696005)(6666004)(70586007)(70206006)(82310400002)(6916009)(26005)(356005)(44832011)(81166007)(36906005)(36756003)(2906002)(5660300002)(186003)(316002)(54906003)(336012)(82740400003)(6486002)(83380400001)(47076004)(2616005)(478600001)(956004)(136400200001);
 DIR:OUT; SFP:1101; 
X-MS-Office365-Filtering-Correlation-Id-Prvs: 096f14cb-9a56-4cf8-c7f2-08d80dfedef2
X-Forefront-PRVS: 0431F981D8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Dw8L6Vvn7MfpYSlC4kqS4V5LcwFM5s7Z65Vo2BZhH/dREhwLPHW7HNWo4jobTI+YEd4wtjBrRATp9d1gnvXzhGUpY9DAQZViR+2llfm8HHzsEeQaPoeuNJYfoRxYFTp2udyaW/0leu7woQgQ22KWne6escuvxhxteNhFdwxJL0C7lH74oDz6/w81/hZkRtm0FfXFSJGiCs4buIgKVSpvhzE+swxTnz24tT7MCNV6NKgxPB9qUuY2EJ3p6X4MuQxEhoJ/usO8ObKIYWHRoOs0PGklGGBCcgN7mzaM9FTOwmorLX3JTMw1Ug22dMmD33TTUWvD38venqI9TKCGySDImyJqDfJgyAhqW29N/4vd+tpYij8vC9xe83n/QzOQ9gjgR0OBtbx5ykjTChpiLdxV5OCI/QB9HwmNOsAHBspXl/0=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2020 11:59:25.8165 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a11b1002-dc99-4ac2-15ee-08d80dfee345
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3122
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, nd@arm.com,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Add support for runstate area register with the structure crossing pages
The code is storing up to 2 pages reference during the hypercall.
During a context switch, the code is computing where the
state_entry_time is and is breaking the memcpy in 2 parts when it is
required.

Signed-off-by: Bertrand Marquis <bertrand.marquis@arm.com>
---
 xen/arch/arm/domain.c        | 101 +++++++++++++++++++++++++----------
 xen/include/asm-arm/domain.h |   5 +-
 2 files changed, 76 insertions(+), 30 deletions(-)

diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 739059234f..d847cb00f2 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -280,11 +280,16 @@ void arch_cleanup_runstate_guest(struct vcpu *v)
 {
     spin_lock(&v->arch.runstate_guest.lock);
 
-    /* cleanup previous page if any */
-    if ( v->arch.runstate_guest.page )
+    /* cleanup previous pages if any */
+    if ( v->arch.runstate_guest.page[0] )
     {
-        put_page_and_type(v->arch.runstate_guest.page);
-        v->arch.runstate_guest.page = NULL;
+        put_page_and_type(v->arch.runstate_guest.page[0]);
+        v->arch.runstate_guest.page[0] = NULL;
+        if ( v->arch.runstate_guest.page[1] )
+        {
+            put_page_and_type(v->arch.runstate_guest.page[1]);
+            v->arch.runstate_guest.page[1] = NULL;
+        }
         v->arch.runstate_guest.offset = 0;
     }
 
@@ -294,26 +299,25 @@ void arch_cleanup_runstate_guest(struct vcpu *v)
 int arch_setup_runstate_guest(struct vcpu *v,
                             struct vcpu_register_runstate_memory_area area)
 {
-    struct page_info *page;
+    struct page_info *page[2] = {NULL,NULL};
     unsigned offset;
 
     spin_lock(&v->arch.runstate_guest.lock);
 
-    /* cleanup previous page if any */
-    if ( v->arch.runstate_guest.page )
+    /* cleanup previous pages if any */
+    if ( v->arch.runstate_guest.page[0] )
     {
-        put_page_and_type(v->arch.runstate_guest.page);
-        v->arch.runstate_guest.page = NULL;
+        put_page_and_type(v->arch.runstate_guest.page[0]);
+        v->arch.runstate_guest.page[0] = NULL;
+        if ( v->arch.runstate_guest.page[1] )
+        {
+            put_page_and_type(v->arch.runstate_guest.page[1]);
+            v->arch.runstate_guest.page[1] = NULL;
+        }
         v->arch.runstate_guest.offset = 0;
     }
 
     offset = ((vaddr_t)area.addr.v) & ~PAGE_MASK;
-    if ( offset > (PAGE_SIZE - sizeof(struct vcpu_runstate_info)) )
-    {
-        spin_unlock(&v->arch.runstate_guest.lock);
-        gprintk(XENLOG_DEBUG, "Runstate is crossing pages\n");
-        return -EINVAL;
-    }
 
     /* provided address must be aligned to a 64bit */
     if ( offset % alignof(struct vcpu_runstate_info) )
@@ -323,15 +327,30 @@ int arch_setup_runstate_guest(struct vcpu *v,
         return -EINVAL;
     }
 
-    page = get_page_from_gva(v, (vaddr_t)area.addr.v, GV2M_WRITE);
-    if ( !page )
+    page[0] = get_page_from_gva(v, (vaddr_t)area.addr.v, GV2M_WRITE);
+    if ( !page[0] )
     {
         spin_unlock(&v->arch.runstate_guest.lock);
         gprintk(XENLOG_DEBUG, "Runstate pointer is not mapped\n");
         return -EINVAL;
     }
 
-    v->arch.runstate_guest.page = page;
+    if ( offset > (PAGE_SIZE - sizeof(struct vcpu_runstate_info)) )
+    {
+        /* guest area is crossing pages */
+        page[1] = get_page_from_gva(v, (vaddr_t)area.addr.v + PAGE_SIZE,
+                                        GV2M_WRITE);
+        if ( !page[1] )
+        {
+            put_page_and_type(v->arch.runstate_guest.page[0]);
+            spin_unlock(&v->arch.runstate_guest.lock);
+            gprintk(XENLOG_DEBUG, "Runstate pointer is not fully mapped\n");
+            return -EINVAL;
+        }
+    }
+
+    v->arch.runstate_guest.page[0] = page[0];
+    v->arch.runstate_guest.page[1] = page[1];
     v->arch.runstate_guest.offset = offset;
 
     spin_unlock(&v->arch.runstate_guest.lock);
@@ -343,34 +362,60 @@ int arch_setup_runstate_guest(struct vcpu *v,
 /* Update per-VCPU guest runstate shared memory area (if registered). */
 static void update_runstate_area(struct vcpu *v)
 {
-    struct vcpu_runstate_info *guest_runstate;
-    void *p;
+    void *p[2];
+    unsigned offset, time_offset;
+    uint64_t *state_entry_time;
 
     spin_lock(&v->arch.runstate_guest.lock);
 
-    if ( v->arch.runstate_guest.page )
+    if ( v->arch.runstate_guest.page[0] )
     {
-        p = __map_domain_page(v->arch.runstate_guest.page);
-        guest_runstate = p + v->arch.runstate_guest.offset;
+        p[0] = __map_domain_page(v->arch.runstate_guest.page[0]);
+        if ( v->arch.runstate_guest.page[1] )
+            p[1] = __map_domain_page(v->arch.runstate_guest.page[1]);
+        else
+            p[1] = NULL;
+        offset = v->arch.runstate_guest.offset;
 
         if ( VM_ASSIST(v->domain, runstate_update_flag) )
         {
+            time_offset = offset +
+                    offsetof(struct vcpu_runstate_info, state_entry_time);
+
+            if ( time_offset < PAGE_SIZE )
+                state_entry_time = p[0] + time_offset;
+            else
+                state_entry_time = p[1] + (time_offset - PAGE_SIZE);
+
             v->runstate.state_entry_time |= XEN_RUNSTATE_UPDATE;
-            guest_runstate->state_entry_time |= XEN_RUNSTATE_UPDATE;
+            *state_entry_time |= XEN_RUNSTATE_UPDATE;
             smp_wmb();
         }
+        else
+            state_entry_time = NULL;
+
+        if ( p[1] )
+        {
+            memcpy(p[0] + offset, &v->runstate, PAGE_SIZE - offset);
+            memcpy(p[1], &v->runstate + (PAGE_SIZE - offset),
+                    sizeof(v->runstate) - (PAGE_SIZE - offset));
+        }
+        else
+            memcpy(p[0] + offset, &v->runstate, sizeof(v->runstate));
 
-        memcpy(guest_runstate, &v->runstate, sizeof(v->runstate));
+        /* copy must be done before switching the bit */
         smp_wmb();
 
-        if ( VM_ASSIST(v->domain, runstate_update_flag) )
+        if ( state_entry_time )
         {
             v->runstate.state_entry_time &= ~XEN_RUNSTATE_UPDATE;
-            guest_runstate->state_entry_time &= ~XEN_RUNSTATE_UPDATE;
+            *state_entry_time &= ~XEN_RUNSTATE_UPDATE;
             smp_wmb();
         }
 
-        unmap_domain_page(p);
+        unmap_domain_page(p[0]);
+        if ( p[1] )
+            unmap_domain_page(p[1]);
     }
 
     spin_unlock(&v->arch.runstate_guest.lock);
diff --git a/xen/include/asm-arm/domain.h b/xen/include/asm-arm/domain.h
index 3a7f53e13d..61e32f1ed5 100644
--- a/xen/include/asm-arm/domain.h
+++ b/xen/include/asm-arm/domain.h
@@ -209,8 +209,9 @@ struct arch_vcpu
 
     /* runstate guest info */
     struct {
-        struct page_info *page;  /* guest page */
-        unsigned         offset; /* offset in page */
+        /* we need 2 pages in case the guest area is crossing pages */
+        struct page_info *page[2];  /* guest pages */
+        unsigned         offset; /* offset in first page */
         spinlock_t       lock;   /* lock to access page */
     } runstate_guest;
 
-- 
2.17.1


