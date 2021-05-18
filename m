Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99602387130
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 07:22:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.128616.241454 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lisB9-0001JQ-0i; Tue, 18 May 2021 05:22:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128616.241454; Tue, 18 May 2021 05:22:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lisB8-0001DC-NG; Tue, 18 May 2021 05:22:02 +0000
Received: by outflank-mailman (input) for mailman id 128616;
 Tue, 18 May 2021 05:22:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2je3=KN=arm.com=penny.zheng@srs-us1.protection.inumbo.net>)
 id 1lisB7-00019F-7s
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 05:22:01 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.54]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e7776fe5-c659-4fa9-bae3-6038b9f1d11b;
 Tue, 18 May 2021 05:21:59 +0000 (UTC)
Received: from AM6PR08CA0035.eurprd08.prod.outlook.com (2603:10a6:20b:c0::23)
 by DB7PR08MB3852.eurprd08.prod.outlook.com (2603:10a6:10:7f::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Tue, 18 May
 2021 05:21:57 +0000
Received: from AM5EUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:c0:cafe::cc) by AM6PR08CA0035.outlook.office365.com
 (2603:10a6:20b:c0::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend
 Transport; Tue, 18 May 2021 05:21:57 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT006.mail.protection.outlook.com (10.152.16.122) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.25 via Frontend Transport; Tue, 18 May 2021 05:21:57 +0000
Received: ("Tessian outbound 6c8a2be3c2e7:v92");
 Tue, 18 May 2021 05:21:57 +0000
Received: from 58d3c760b65e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8281B599-D76D-4C7B-907F-0008096FA724.1; 
 Tue, 18 May 2021 05:21:50 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 58d3c760b65e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 18 May 2021 05:21:50 +0000
Received: from AM6PR01CA0048.eurprd01.prod.exchangelabs.com
 (2603:10a6:20b:e0::25) by PAXPR08MB6986.eurprd08.prod.outlook.com
 (2603:10a6:102:1de::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Tue, 18 May
 2021 05:21:49 +0000
Received: from AM5EUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:e0:cafe::71) by AM6PR01CA0048.outlook.office365.com
 (2603:10a6:20b:e0::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend
 Transport; Tue, 18 May 2021 05:21:49 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT032.mail.protection.outlook.com (10.152.16.84) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4129.25 via Frontend Transport; Tue, 18 May 2021 05:21:49 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Tue, 18 May
 2021 05:21:46 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2176.14 via Frontend
 Transport; Tue, 18 May 2021 05:21:44 +0000
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
X-Inumbo-ID: e7776fe5-c659-4fa9-bae3-6038b9f1d11b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QirTiM5BMFqVEm2akRsnyKmv1ZPwRYUKo4oLM4omp7M=;
 b=6cv8kmt+/cThiBqyQqFikKTfM1ITBUInNckkOehGk2AmAjlkK37LdGGt7XaoAZZvnr/mZqQdyY3AuiOeB9L7zrnKlb9FHbXvPQXq5Mx/XqV/ohXhQ9BHasIDWS01nMplPBXOBctWv9Bqn/xCS8YvHCVs7s6zTui/iAWrP/kJmvk=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7b81643dc9652aef
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OldNX2vr0OfF/2CaQzl8FkQu0fxRpLNUJ5jq5NCrCnGCZAdox1GAL1jIp+NnHYeBT/+VrsgMiCcohUsMY7GG76ri15uJ/A1lQzTItr4OwsBJt8rqIROEGLnYOY1voY6eNAbfttUPAF/iTbB6wgWOwACeVHlQM+mrytAZhrbPJx+B9Wz2yqRGko1/XAu03x7bETOjsg/AEOZQ/TQj12F30u8OEUj8wfoeAajYeqwz6+WuldA4v8x9vjk8rjLRllBQCKU+NSWJmaTQ6OJWi7mdWVaDnONYrh7fwaRGISWAIrIcyJmVXph/A+ZVxHyIvgx7/9UDUCQmg3P7pnO00jpldA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QirTiM5BMFqVEm2akRsnyKmv1ZPwRYUKo4oLM4omp7M=;
 b=HMYz6EH1/lZGqkBIJszMxDiow+xGMT+9F/oNnJVIqH7SosT//jORLs/0bIV1x6PYYk9s3tIyAeRXV+NPCjJcMEi6PHkDL2lEVrSe6CkD+jRNaZDMubYm28JCrffx4NErGywXo9GLowv6RjyVeD0N7dxWsHQx7U8Sl3jMN1a6GiQmRCUQcSPEFAa4M2vtWYVtOheZ1xrCJx5V7vpQQX3HtchdklVBo1CSIpDb6pweV5Hrc1ffApbNqOgUkyZR2pQR9DbyYfcEAc5NYCZXckjpX9GRoa5xK/aVybudhMatJramP+nK7lKjdQm8b4eo0BEAvAJ6cPzzru/NWyq4l57Zyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QirTiM5BMFqVEm2akRsnyKmv1ZPwRYUKo4oLM4omp7M=;
 b=6cv8kmt+/cThiBqyQqFikKTfM1ITBUInNckkOehGk2AmAjlkK37LdGGt7XaoAZZvnr/mZqQdyY3AuiOeB9L7zrnKlb9FHbXvPQXq5Mx/XqV/ohXhQ9BHasIDWS01nMplPBXOBctWv9Bqn/xCS8YvHCVs7s6zTui/iAWrP/kJmvk=
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
Subject: [PATCH 06/10] xen: replace order with nr_pfns in assign_pages for better compatibility
Date: Tue, 18 May 2021 05:21:09 +0000
Message-ID: <20210518052113.725808-7-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210518052113.725808-1-penny.zheng@arm.com>
References: <20210518052113.725808-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9fd858e9-608b-4f28-e450-08d919bcdb74
X-MS-TrafficTypeDiagnostic: PAXPR08MB6986:|DB7PR08MB3852:
X-Microsoft-Antispam-PRVS:
	<DB7PR08MB38521AB5BDA8249C81BBE3EBF72C9@DB7PR08MB3852.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 QUNkkpUVMuE18FlZNUqu0BjVFNSUCeqE5btNzUBPQyzvBYuqHW7oJ8EFbzXmtQPlPr0JGYBQyN+rwu8XGCOKjbIhsXiScO2vA/rndoK77nAmwteNEiZY84Yq6xffZgPAFSu9zR1SQgsO+Kq0iGIf7xzTWU/fpmpaUzWUx7Xe0bAOeuIwd8m+pfKDovhZ4sFLm02WHxcpm+Z0ISWnfQRIztKq1ujK/2J/EoguviHcrBSjCsFJrLmEEoODImljH3tcldn48Y0/K3ZG66ikfeQAFCZ+aj8VfzvXX5O5iD0hbQZKHDTzthosps8Hwb8oSKiNTwVGAT6MmyUDGH0n1bc6Pebe4vDBaUzGjaLf9uWOX0S8N0uYcaAEkxDhO9eO32fldiNlYVHmcbcFC57ceYpenc+PCWAvZRrMAWjG1onuiqtp8bfZcv1mhCOnppVLnL5/AZPA4q61w4iS7izZzm2oTnwOGvAOq/w7A4shWWVE5INlc83m7gayUyFRr4FrA0NJ8bg6F742Cu9Y7COIEMoj51ju+8AkSd4uNyc/hOouxctN8zlAWbwXjkfzprzJZZsGt1Z9gbtc8Ow8/BXppLsMdOXeWtVFvlaqycD1FCfp8X6/8/5gWTZpB1/m4y+/OQQLigjUUU0QkGgb5iNW5TbI6483uIbUUoCnMPx1Y7101GL13sOkM524zvCR4MwAoXYs
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(376002)(346002)(396003)(39850400004)(136003)(36840700001)(46966006)(83380400001)(316002)(6666004)(36756003)(7696005)(70206006)(2616005)(70586007)(478600001)(86362001)(110136005)(5660300002)(8676002)(82740400003)(336012)(36860700001)(1076003)(44832011)(356005)(426003)(81166007)(47076005)(2906002)(26005)(8936002)(186003)(54906003)(82310400003)(4326008)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6986
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	2b07f62c-18f4-4de8-9caf-08d919bcd65a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	sxrucFlrFuBPBzDaZIveWaHc74CnV8uvzdEV1JZTfSttL05n584wrkyOEgrS/p0HLOR2whxXNMP9lDrqv71thBg7Fv+30YWxaa0Ia6uXhbT2FuUQKWGeMA+ILcyh85NY491Lkp5RsALji4TPZkfnMqiWVZADB6SBcu1G3NPSb24wJlRXdHgO5zRwc0cAvFHYdtBAUDQwwl3kFmxsjunNQ6Q0mAc5BnqDDvxnxWdRgsOq1NRz4mVSx2vp+dOYy7l/PsupIkJ9sQZFyQmHfVSMBJr5sC7VMASeGJNTp0Si6nqmNkuIAlO2E17r5GzuOrQhzD4YLadTysg8VbxSZ3+fTcDWsrC3J9WtKxMdPWVfoXb2/g7fRuT6k3JQK1LDgf2uf0kqPob+aZBnCJufS07c5hILFbiUS50WAWlXmD0qZbqnIOu0OJ8SW1Q9VH1qqLdbKLaj4M+5e1reO8D/9qb010YhOQG30LZVlTCtJtdZB83OLR2RhBH7jUZgDSruZlxrEdFq0th8NhtFS00YHmE0E714uWtWiLs2LSoStGmsKfSfrEW61L3xR9FYJN60hOq5/MZpHdJvJTjzTjTSEOZvMTDkMaBu72QFpiNffCRUiz08Wq99zQWNLYeHxVYLFDtODiQSAVQbKoSbx+ZxNaXSGw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(396003)(39850400004)(36840700001)(46966006)(1076003)(47076005)(86362001)(54906003)(26005)(2906002)(110136005)(36860700001)(7696005)(2616005)(8676002)(81166007)(316002)(478600001)(6666004)(4326008)(186003)(44832011)(70206006)(5660300002)(82310400003)(336012)(70586007)(8936002)(426003)(36756003)(82740400003)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2021 05:21:57.5323
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fd858e9-608b-4f28-e450-08d919bcdb74
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3852

Function parameter order in assign_pages is always used as 1ul << order,
referring to 2@order pages.

Now, for better compatibility with new static memory, order shall
be replaced with nr_pfns pointing to page count with no constraint,
like 250MB.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
 xen/arch/x86/pv/dom0_build.c |  2 +-
 xen/common/grant_table.c     |  2 +-
 xen/common/memory.c          |  4 ++--
 xen/common/page_alloc.c      | 16 ++++++++--------
 xen/include/xen/mm.h         |  2 +-
 5 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index e0801a9e6d..4e57836763 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -556,7 +556,7 @@ int __init dom0_construct_pv(struct domain *d,
         else
         {
             while ( count-- )
-                if ( assign_pages(d, mfn_to_page(_mfn(mfn++)), 0, 0) )
+                if ( assign_pages(d, mfn_to_page(_mfn(mfn++)), 1, 0) )
                     BUG();
         }
         initrd->mod_end = 0;
diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index ab30e2e8cf..925bf924bd 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -2354,7 +2354,7 @@ gnttab_transfer(
          * is respected and speculative execution is blocked accordingly
          */
         if ( unlikely(!evaluate_nospec(okay)) ||
-            unlikely(assign_pages(e, page, 0, MEMF_no_refcount)) )
+            unlikely(assign_pages(e, page, 1, MEMF_no_refcount)) )
         {
             bool drop_dom_ref;
 
diff --git a/xen/common/memory.c b/xen/common/memory.c
index b5c70c4b85..2dca23aa7f 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -722,7 +722,7 @@ static long memory_exchange(XEN_GUEST_HANDLE_PARAM(xen_memory_exchange_t) arg)
         /* Assign each output page to the domain. */
         for ( j = 0; (page = page_list_remove_head(&out_chunk_list)); ++j )
         {
-            if ( assign_pages(d, page, exch.out.extent_order,
+            if ( assign_pages(d, page, 1UL << exch.out.extent_order,
                               MEMF_no_refcount) )
             {
                 unsigned long dec_count;
@@ -791,7 +791,7 @@ static long memory_exchange(XEN_GUEST_HANDLE_PARAM(xen_memory_exchange_t) arg)
      * cleared PGC_allocated.
      */
     while ( (page = page_list_remove_head(&in_chunk_list)) )
-        if ( assign_pages(d, page, 0, MEMF_no_refcount) )
+        if ( assign_pages(d, page, 1, MEMF_no_refcount) )
         {
             BUG_ON(!d->is_dying);
             free_domheap_page(page);
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index adf2889e76..0eb9f22a00 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -2388,7 +2388,7 @@ void init_domheap_pages(paddr_t ps, paddr_t pe)
 int assign_pages(
     struct domain *d,
     struct page_info *pg,
-    unsigned int order,
+    unsigned long nr_pfns,
     unsigned int memflags)
 {
     int rc = 0;
@@ -2408,7 +2408,7 @@ int assign_pages(
     {
         unsigned int extra_pages = 0;
 
-        for ( i = 0; i < (1ul << order); i++ )
+        for ( i = 0; i < nr_pfns; i++ )
         {
             ASSERT(!(pg[i].count_info & ~PGC_extra));
             if ( pg[i].count_info & PGC_extra )
@@ -2417,18 +2417,18 @@ int assign_pages(
 
         ASSERT(!extra_pages ||
                ((memflags & MEMF_no_refcount) &&
-                extra_pages == 1u << order));
+                extra_pages == nr_pfns));
     }
 #endif
 
     if ( pg[0].count_info & PGC_extra )
     {
-        d->extra_pages += 1u << order;
+        d->extra_pages += nr_pfns;
         memflags &= ~MEMF_no_refcount;
     }
     else if ( !(memflags & MEMF_no_refcount) )
     {
-        unsigned int tot_pages = domain_tot_pages(d) + (1 << order);
+        unsigned int tot_pages = domain_tot_pages(d) + nr_pfns;
 
         if ( unlikely(tot_pages > d->max_pages) )
         {
@@ -2440,10 +2440,10 @@ int assign_pages(
     }
 
     if ( !(memflags & MEMF_no_refcount) &&
-         unlikely(domain_adjust_tot_pages(d, 1 << order) == (1 << order)) )
+         unlikely(domain_adjust_tot_pages(d, nr_pfns) == nr_pfns) )
         get_knownalive_domain(d);
 
-    for ( i = 0; i < (1 << order); i++ )
+    for ( i = 0; i < nr_pfns; i++ )
     {
         ASSERT(page_get_owner(&pg[i]) == NULL);
         page_set_owner(&pg[i], d);
@@ -2499,7 +2499,7 @@ struct page_info *alloc_domheap_pages(
                 pg[i].count_info = PGC_extra;
             }
         }
-        if ( assign_pages(d, pg, order, memflags) )
+        if ( assign_pages(d, pg, 1ul << order, memflags) )
         {
             free_heap_pages(pg, order, memflags & MEMF_no_scrub);
             return NULL;
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index 8b1a2207b2..dcf9daaa46 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -131,7 +131,7 @@ void heap_init_late(void);
 int assign_pages(
     struct domain *d,
     struct page_info *pg,
-    unsigned int order,
+    unsigned long nr_pfns,
     unsigned int memflags);
 
 /* Dump info to serial console */
-- 
2.25.1


