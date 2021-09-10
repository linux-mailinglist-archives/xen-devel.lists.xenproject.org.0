Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B584065D5
	for <lists+xen-devel@lfdr.de>; Fri, 10 Sep 2021 04:53:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.183858.332272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOWf3-0005go-Qe; Fri, 10 Sep 2021 02:53:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 183858.332272; Fri, 10 Sep 2021 02:53:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOWf3-0005dY-Jv; Fri, 10 Sep 2021 02:53:05 +0000
Received: by outflank-mailman (input) for mailman id 183858;
 Fri, 10 Sep 2021 02:53:03 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I6Hc=OA=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1mOWf1-0005Hy-36
 for xen-devel@lists.xenproject.org; Fri, 10 Sep 2021 02:53:03 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.84]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 364fa0b6-11e2-11ec-b209-12813bfff9fa;
 Fri, 10 Sep 2021 02:53:01 +0000 (UTC)
Received: from AM5PR04CA0011.eurprd04.prod.outlook.com (2603:10a6:206:1::24)
 by DBAPR08MB5768.eurprd08.prod.outlook.com (2603:10a6:10:1b1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Fri, 10 Sep
 2021 02:52:59 +0000
Received: from VE1EUR03FT053.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:1:cafe::d2) by AM5PR04CA0011.outlook.office365.com
 (2603:10a6:206:1::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Fri, 10 Sep 2021 02:52:59 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT053.mail.protection.outlook.com (10.152.19.198) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Fri, 10 Sep 2021 02:52:58 +0000
Received: ("Tessian outbound d5def7722ff7:v103");
 Fri, 10 Sep 2021 02:52:58 +0000
Received: from b326055b7f74.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 8D64FAC2-F47D-4F5A-80BE-9FD6D2FC3941.1; 
 Fri, 10 Sep 2021 02:52:52 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b326055b7f74.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 10 Sep 2021 02:52:52 +0000
Received: from AS8PR04CA0079.eurprd04.prod.outlook.com (2603:10a6:20b:313::24)
 by HE1PR0802MB2585.eurprd08.prod.outlook.com (2603:10a6:3:d4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.21; Fri, 10 Sep
 2021 02:52:50 +0000
Received: from AM5EUR03FT024.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:313:cafe::39) by AS8PR04CA0079.outlook.office365.com
 (2603:10a6:20b:313::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.14 via Frontend
 Transport; Fri, 10 Sep 2021 02:52:50 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT024.mail.protection.outlook.com (10.152.16.175) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4478.19 via Frontend Transport; Fri, 10 Sep 2021 02:52:49 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Fri, 10 Sep
 2021 02:52:53 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Fri, 10 Sep 2021 02:52:51 +0000
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
X-Inumbo-ID: 364fa0b6-11e2-11ec-b209-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hGwFKYY5V6TMXu7tjZlS3TFGVb7eOMQrJfMUNLSc/DY=;
 b=4CEwSqaztcXIYoi435uzhaDzyqi/pZBUgaj+QKh0G5xGKehylQTnknaPQwuzOpKCGC5lfmum3zjrZyUdCvUiwh43JN2IW3SI/tf5/mcDo6yElRwZprWai26VjHg9C3IkMODeVR46HVuscIOfGKKgMM9VJsXFP2GceH3/ui8INXo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 703c4f62234778a0
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sp/1nHV5tgMLNZF/mVW5m/BvqZoL3/KjHFRz38FlkeBk88s12C6ryq92ZIPCSR9/VaaMIgjaZo/jymiCPXioT0gfKt+xnhGfnyO3Vxw1l7wyuCuKZ4ROA/fhTux+S+r3/1i9lMxFcInh2ocEJVECTmcwZI1zg75mC9j6FCEUWdk4w7Y/hYW0mjCm25JwBTf/+T//1D3ohSG86ZgRyHGifWZqAmuV48pqT8Ll3uufHQbMMsacR79niGizcCGM70G5A1Lu4b/qrlrd1KtfhQWxvrEQmEq0RwbaZwni8NNoHDuMHEVxIenGUgc6jc4nebzwTADH6SOtmZ6IUTKASs2ssg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=hGwFKYY5V6TMXu7tjZlS3TFGVb7eOMQrJfMUNLSc/DY=;
 b=il0AROm0oKYVcDlQ924c9bQCWKQ87gZwqTOzycq/CQnJH3EfZDOASke9ewntmFURMaC3biFmMqdM/kg+sQ9cAuKdsR3vDeB+vbg33VOeeCuQ63xc4Q6JjeFOky7gzu8iGQMPPcxR6jTGMwB58QKc5sOGE6uazoWyCaIyrc8Onler7JrIUA3ZpTohA/2zIlxpPyrg271k6SA9ae0IiWQZCurTdII8hZ2aal/SWh82Y+y+8sEHuOdSdMOse4feH9pIFzTm6MdJkqORvj/WXgFebdtFNKXXbL26VcnGLFVVUDigIv8/AEHxH/b6F+A/i7zQn48z9NnBOxLrtQHknOCEzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hGwFKYY5V6TMXu7tjZlS3TFGVb7eOMQrJfMUNLSc/DY=;
 b=4CEwSqaztcXIYoi435uzhaDzyqi/pZBUgaj+QKh0G5xGKehylQTnknaPQwuzOpKCGC5lfmum3zjrZyUdCvUiwh43JN2IW3SI/tf5/mcDo6yElRwZprWai26VjHg9C3IkMODeVR46HVuscIOfGKKgMM9VJsXFP2GceH3/ui8INXo=
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
Subject: [PATCH v7 6/7] xen/arm: introduce acquire_staticmem_pages and acquire_domstatic_pages
Date: Fri, 10 Sep 2021 02:52:14 +0000
Message-ID: <20210910025215.1671073-7-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210910025215.1671073-1-penny.zheng@arm.com>
References: <20210910025215.1671073-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 789e4663-c80f-4918-ea94-08d974061902
X-MS-TrafficTypeDiagnostic: HE1PR0802MB2585:|DBAPR08MB5768:
X-Microsoft-Antispam-PRVS:
	<DBAPR08MB576884CA06D2ABA9DD61724FF7D69@DBAPR08MB5768.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 B69ufQAkoo4x7JS2n/eCI1CIMVScJzIvR2cTvZ5tfp9rJbr0OnWVmRY7ucjGHV1BfyZKNjHHpWUrnwR6bMD3crXPiAN9g9cu1309g/qpp87z8yuWvKb+DTxHWPaknUWk7aqV3Z6NpPomXQNfoo4h/mXBPcEmISuXSsb9zVW/hXPnx3isH8C/jLLCcIlxpMlQ4XMCHcJsOozJRtGAKNujmwPj1/lP5jKd9HDEccODXzpw7K8SeYtkQM/1CMYtH53On6hAo10MkpEXrVgyHUCT+LzHpFznSxjziVmhbs6tq4sv1IluPBnFVa99WYq8wF2/CTLXzdp/FWs6XuEg7UJL/axI6hw87+FDGsg/2R3aut6X4JL0BK9yEUuybWbB+duXfatNwCTATVwZhmii6TRGKDHVtdeTIygVcgXAsfltKQNd9YB0FYXlXSnbe/PdgaKpkzSzYeo1rfDaKQkBKS8/Rh5T8k1ta/7TGf3IQ4Nm/KIDg+IFho+ZAr7CLYCc6UTV1UN4H4l2JyAuq3QJjRJYBYSUauad/8Oxpm7G1JBuUURa0492WN/nS4UxNx+YTnUKT2k9op4ZxvThyc+NnduYke2UEFfnVc8FqDkDxWSr4w50EgYQDDgvGqqJrLeQTOg7nN4nunpXokvN1LBLTkaRgGHwOrwrKvlDc6PO7UtSVPth2W1tUzSqmngWwnfr6LzOHLmQOifDPuxtGgW26Hdk3/oQbPxOr+v5r7hzLU40Krc=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(376002)(396003)(136003)(39860400002)(346002)(36840700001)(46966006)(36756003)(356005)(8936002)(4326008)(82740400003)(2906002)(70586007)(316002)(83380400001)(5660300002)(478600001)(70206006)(82310400003)(81166007)(47076005)(7696005)(336012)(186003)(1076003)(2616005)(44832011)(426003)(6666004)(26005)(54906003)(86362001)(110136005)(8676002)(36860700001)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR0802MB2585
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	f77242cb-d175-4fb6-d253-08d9740613c4
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	0J7Mrz8oQmoemMFwEMjm/LvD/WDiu+YTTLEkrBKzKzrvBE4mLJt9dBH8E7WWdcZUphEkN9JF2xCe92xYNq5DPN4TT7nz+Bzz8h4ncyY5ALP97vbySJ1qr/fczoAVU9NVyRHOt4ne11pwVoYmdaXO85l76XIgZMMxCkts9hxbOWBKcPmUIgo3HOziyLDW4ycytROzf9tfmeC695ACbIWaoPjKumh6qyzPDPyY82MTW+64rX/Fhv0S6SJxiP+BGtTCh5n5je/tttMGoe0p/PmH5aa+Ym/J7udGpuTlVUSMsInl0WXFtYRt11jvMitoAVz+ImMJ8/8K3RYW9zgoRq25kBM7qDZ2RhdbCG8AA9K1+7kEHCkCPNnbw7xdQnH+sBAvHt1Kp4d1+jE2pUbn7wvf9/1Tru5ujHsIAsE3YWYV8+6pFi8oU6JkUxvVLQUfuxw5JbVxGIi62iiOjLl2KMlrAJ5JTFdNN0QOHZ6TeVWBYPbPR9QCPz/Ap9kVXMc4Zucsu0cPfxfE7E+EfpJpSI+V+PkWawePuI7lqkIOTqJrxKvyjdFzYB+/+BRYuZTerC5uRwZcYnOCjxjrOERzOa/C8NVp+D9zWbl06vrLKh4792dXN4cvZ+SsxP8T+3LrlxkE8MJFVXvBrqyGpSztISUlWKH3MreTKcAVghIG46Rg11gJh5JGFus+C6fFoFxtAHKZvX9hgtuapOAKt1wWSIuBMQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(36756003)(2616005)(8936002)(508600001)(81166007)(316002)(2906002)(110136005)(4326008)(54906003)(336012)(47076005)(83380400001)(6666004)(107886003)(426003)(86362001)(1076003)(5660300002)(82310400003)(186003)(26005)(36860700001)(44832011)(8676002)(70586007)(7696005)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2021 02:52:58.6819
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 789e4663-c80f-4918-ea94-08d974061902
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT053.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5768

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
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 xen/common/page_alloc.c  | 118 ++++++++++++++++++++++++++++++++++++++-
 xen/include/asm-arm/mm.h |   3 +
 xen/include/xen/mm.h     |   2 +
 3 files changed, 121 insertions(+), 2 deletions(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 2aa8edac8c..5eb87b51c8 100644
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
+    if ( assign_pages(pg, nr_mfns, d, memflags) )
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
index 9d6a45174e..f8500f04d4 100644
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


