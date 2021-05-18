Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F193387138
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 07:22:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.128629.241514 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lisBV-0004GO-GQ; Tue, 18 May 2021 05:22:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128629.241514; Tue, 18 May 2021 05:22:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lisBV-0004CH-Ax; Tue, 18 May 2021 05:22:25 +0000
Received: by outflank-mailman (input) for mailman id 128629;
 Tue, 18 May 2021 05:22:23 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2je3=KN=arm.com=penny.zheng@srs-us1.protection.inumbo.net>)
 id 1lisBT-00047I-M3
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 05:22:23 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.77]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8e1f321c-4bc0-4b0c-8634-350deec083ba;
 Tue, 18 May 2021 05:22:22 +0000 (UTC)
Received: from AM7PR02CA0009.eurprd02.prod.outlook.com (2603:10a6:20b:100::19)
 by DB6PR0802MB2199.eurprd08.prod.outlook.com (2603:10a6:4:82::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Tue, 18 May
 2021 05:22:20 +0000
Received: from AM5EUR03FT051.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:100:cafe::ae) by AM7PR02CA0009.outlook.office365.com
 (2603:10a6:20b:100::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25 via Frontend
 Transport; Tue, 18 May 2021 05:22:20 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT051.mail.protection.outlook.com (10.152.16.246) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.25 via Frontend Transport; Tue, 18 May 2021 05:22:20 +0000
Received: ("Tessian outbound 504317ef584c:v92");
 Tue, 18 May 2021 05:22:20 +0000
Received: from 4ca63d3bf940.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 87B07377-33EE-4E9D-828B-361404BDB204.1; 
 Tue, 18 May 2021 05:22:13 +0000
Received: from FRA01-PR2-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4ca63d3bf940.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 18 May 2021 05:22:13 +0000
Received: from AM6PR08CA0008.eurprd08.prod.outlook.com (2603:10a6:20b:b2::20)
 by PR2PR08MB4858.eurprd08.prod.outlook.com (2603:10a6:101:1f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Tue, 18 May
 2021 05:22:12 +0000
Received: from VE1EUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:b2:cafe::bd) by AM6PR08CA0008.outlook.office365.com
 (2603:10a6:20b:b2::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.24 via Frontend
 Transport; Tue, 18 May 2021 05:22:12 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT046.mail.protection.outlook.com (10.152.19.226) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4129.25 via Frontend Transport; Tue, 18 May 2021 05:22:12 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2176.14; Tue, 18 May
 2021 05:21:52 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.14; Tue, 18
 May 2021 05:21:52 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2176.14 via Frontend
 Transport; Tue, 18 May 2021 05:21:49 +0000
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
X-Inumbo-ID: 8e1f321c-4bc0-4b0c-8634-350deec083ba
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ZNC/nfkeDYicCmVJe5toeMnkfsndF5g/9+kkSrRk+M=;
 b=ogoyPpU9KTIuq7lcLHcOa/YvXOVxN63hmoRn/riXVZwmt7yGHohth7ynnprH9hUORhJQpUNfvEMqWL7T0cz/zKoi8xVKA9VXKF3P6KAtBK2TkgZOAJM1W9VjaQMEH2pprXYP4zwpWkH3vHcShAbDqEwF5kg+KtbDdDetK+cEJQ8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: a6f4acc816c8473b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aZyWU+3eFnzBFFCDhXJPb49pfhbkDhc4nP2Bs3gb2QRIaCPo4c8ZFDg6Zkt9HCzEGkU3ByOM8XVLDSTOFTRYlBz/0NCEMOEUg2+K/QAbKQxhTJPD0IKaYcRK+iVyoYVZsUHg2UEtEjNTme3+/gVciwlWjNy5LNeYWjdLJDSO2QhEU85vGkzw2pF2vj3TQzaFzuuCPtY2fYp4f56ybOW70odgHPjJ8ET9MM/mO3d4YhdYUN7qpXFGw8PfO1aKuNgrjDgVT456weO86lXqxPbZTOK1WCbIIRIQJPB54/gpbHe2tqPvu3Q8I4D3GRoUGSgMBF1VzeOANGxcmyDmufr1mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ZNC/nfkeDYicCmVJe5toeMnkfsndF5g/9+kkSrRk+M=;
 b=f3PJgjXFuxfeZ1WcNt/5uRXvtEjUrhh0H9RHj3S/1oEFyRHZZOkPwqB2ZPn0OEj/MmaDYXNGYSjYW6CLK9m+toqKmU+uZJ8jAje6DKYeidU68WdvEvfpOOk9cIMu9sgWr6aThJRyYQBEn35f2/QWV0buFdFI7Wc/gLt6LQ6DGR/9TqLdPJC5SGZNaUIaK5Y5JRm3drNgx6dwgJn5bBCOd8+o4PZRn4zCK2DyC7t/zlEKiDXQ5mVlHz++5PfiUPG+aMlFVA+4jjjrQz3nFK83gJ/dtMllfmsbcpnILpXTfF0ZFRXdf99E+Qn1tcuYppKaJEb2gBBpHG6eQANK/gn/8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9ZNC/nfkeDYicCmVJe5toeMnkfsndF5g/9+kkSrRk+M=;
 b=ogoyPpU9KTIuq7lcLHcOa/YvXOVxN63hmoRn/riXVZwmt7yGHohth7ynnprH9hUORhJQpUNfvEMqWL7T0cz/zKoi8xVKA9VXKF3P6KAtBK2TkgZOAJM1W9VjaQMEH2pprXYP4zwpWkH3vHcShAbDqEwF5kg+KtbDdDetK+cEJQ8=
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
Subject: [PATCH 08/10] xen/arm: introduce reserved_page_list
Date: Tue, 18 May 2021 05:21:11 +0000
Message-ID: <20210518052113.725808-9-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210518052113.725808-1-penny.zheng@arm.com>
References: <20210518052113.725808-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9770d729-03d4-46d6-dc47-08d919bce8f1
X-MS-TrafficTypeDiagnostic: PR2PR08MB4858:|DB6PR0802MB2199:
X-Microsoft-Antispam-PRVS:
	<DB6PR0802MB2199792B4E62AAB42D1D0DA8F72C9@DB6PR0802MB2199.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 gzOnoWMOgYntjcBJG0Et1nPQDFF9M/nB5sCOh8SprxxAAtaZH+NUFZsnS9vPLnpORLqAUtX6hBoBP4uBq6QcayoWsU1+/YxCA/A/a+MhEMFj99BHawEc874+VMjiKjjuIBhZFr8yL4viIPpkdaW3JbtOM/RwSYxTDx5a0/Ic6K2StSDugtIvtri+tMgVVoSiyX8F2aR0Rta+kpZVKhQW0lUHmBB1jVAMaJ6ClIxXLm7wY8srnCnSTQJs2+k5IUaGZTx++2+i5daFb1RQZoUcr0HoPjBivy0zmwjmkHY1zywt3aKGJ0GGwTokH1ir7tdzU9xu2nrTuYe2FOD2UMLRTksA2Q6hR+Jh54EU1YpiG2WcRDaOdTyUgeoN4ojTAAwLiqqr12ceg0mlZMzgYyDg8o2cjLiFckgxNZ8PE8+OiU2bABHkKedN1iHKkbpPrLrt1y4pcHTP4Xk0dMp1pHvNAIbibsGD92i+2buUGuQ4H5IZEVeub5/pNQw54MRSRtBM4Yk+vr9Dt6ICkD3JqWKVDwK1F9+IM5/74nWUWBrnzvG/8vaAKLuppb38TIgfagMw1LFpfOJ+DZdhBjXyTzyxSx7Nezre5c0alLDQN2Ailau8qoX2hTi303Y09Si7x5rLdxzqDh9kjdf3T2qmQDeT8DOD/hMEJHo9KuPpz/vFcbEUO9nyjdjltpPRbhEZxdwa
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(396003)(376002)(39850400004)(346002)(136003)(46966006)(36840700001)(1076003)(5660300002)(426003)(186003)(336012)(2616005)(82310400003)(47076005)(82740400003)(6666004)(70206006)(2906002)(70586007)(356005)(83380400001)(36756003)(86362001)(8936002)(478600001)(110136005)(4326008)(44832011)(316002)(54906003)(7696005)(8676002)(81166007)(36860700001)(26005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR2PR08MB4858
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	feca53fd-4922-449d-5d93-08d919bce41b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	S+kNN0rta+uUSFCEoGwCrJU8l8DrsFFlAp0DR+TABuk93hRdrvzCzRAcx1U1Ftq+zRrwM+eh675sLTVbEs7bdLKhdCT7UA4Qid71SKTTLU9jRWkrs8kUuQncah/K4AbEaZN9B0kTKClePnVrQVEblbUNHb8laEkeSTHzQVZZ8jkT35cIuM634fdoy+ayW7VfVdWcQf69zBDVbaLzF9UYkslZbYQKaGkLZXyHX9lSj5rAbpiNogr0AuVCwA6NblxNKvaWLaaxA9K1yGIEBQoMAt0qUTS9V+LqTHnn/nQQ0GwhQ4JKmc2stftvFztJvKO/lMJ8wsniNHAVt0N4yv8qvrA+SwSKs2MWYaVFpYrwscacPX2pXnmmbYqrX38foO2HFObUXx8OJff/u1uG71jC34OgZJb3/BrTJ34m5nwPL88tKWV4VMfs5hqq7P5eg6lBLy5/WfKIkccOKKcq85TjTs7Wvr9v3tW/uVi/wnhhI4FEJ1CKVz6jjt/SFTYPIdH3tZBRRDxZkgh3eYwtuShsBHdmtza3nwaGWE9CK5zCXNdgmo416P0Mmzy3mUN6lQaKv+bzBqoUXMjNQatg9AjSTleXw21DnPpZtDJpnbDchbQITVA6jfiufWRS92Rod/RIUceNQpshve+rptEwXLPb9R/yZhDSqjWuEAEJdqaunAM=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39850400004)(396003)(346002)(136003)(376002)(36840700001)(46966006)(82310400003)(7696005)(6666004)(47076005)(36860700001)(426003)(478600001)(4326008)(26005)(336012)(1076003)(5660300002)(2616005)(44832011)(36756003)(8676002)(8936002)(316002)(54906003)(186003)(110136005)(82740400003)(81166007)(83380400001)(70206006)(70586007)(2906002)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2021 05:22:20.1646
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9770d729-03d4-46d6-dc47-08d919bce8f1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT051.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0802MB2199

Since page_list under struct domain refers to linked pages as gueast RAM
allocated from heap, it should not include reserved pages of static memory.

The number of PGC_reserved pages assigned to a domain is tracked in
a new 'reserved_pages' counter. Also introduce a new reserved_page_list
to link pages of static memory. Let page_to_list return reserved_page_list,
when flag is PGC_reserved.

Later, when domain get destroyed or restarted, those new values will help
relinquish memory to proper place, not been given back to heap.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
 xen/common/domain.c     | 1 +
 xen/common/page_alloc.c | 7 +++++--
 xen/include/xen/sched.h | 5 +++++
 3 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index 6b71c6d6a9..c38afd2969 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -578,6 +578,7 @@ struct domain *domain_create(domid_t domid,
     INIT_PAGE_LIST_HEAD(&d->page_list);
     INIT_PAGE_LIST_HEAD(&d->extra_page_list);
     INIT_PAGE_LIST_HEAD(&d->xenpage_list);
+    INIT_PAGE_LIST_HEAD(&d->reserved_page_list);
 
     spin_lock_init(&d->node_affinity_lock);
     d->node_affinity = NODE_MASK_ALL;
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index f1f1296a61..e3f07ec6c5 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -2410,7 +2410,7 @@ int assign_pages(
 
         for ( i = 0; i < nr_pfns; i++ )
         {
-            ASSERT(!(pg[i].count_info & ~PGC_extra));
+            ASSERT(!(pg[i].count_info & ~(PGC_extra | PGC_reserved)));
             if ( pg[i].count_info & PGC_extra )
                 extra_pages++;
         }
@@ -2439,6 +2439,9 @@ int assign_pages(
         }
     }
 
+    if ( pg[0].count_info & PGC_reserved )
+        d->reserved_pages += nr_pfns;
+
     if ( !(memflags & MEMF_no_refcount) &&
          unlikely(domain_adjust_tot_pages(d, nr_pfns) == nr_pfns) )
         get_knownalive_domain(d);
@@ -2452,7 +2455,7 @@ int assign_pages(
             page_set_reserved_owner(&pg[i], d);
         smp_wmb(); /* Domain pointer must be visible before updating refcnt. */
         pg[i].count_info =
-            (pg[i].count_info & PGC_extra) | PGC_allocated | 1;
+            (pg[i].count_info & (PGC_extra | PGC_reserved)) | PGC_allocated | 1;
         page_list_add_tail(&pg[i], page_to_list(d, &pg[i]));
     }
 
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 3982167144..b6333ed8bb 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -368,6 +368,7 @@ struct domain
     struct page_list_head page_list;  /* linked list */
     struct page_list_head extra_page_list; /* linked list (size extra_pages) */
     struct page_list_head xenpage_list; /* linked list (size xenheap_pages) */
+    struct page_list_head reserved_page_list; /* linked list (size reserved pages) */
 
     /*
      * This field should only be directly accessed by domain_adjust_tot_pages()
@@ -379,6 +380,7 @@ struct domain
     unsigned int     outstanding_pages; /* pages claimed but not possessed */
     unsigned int     max_pages;         /* maximum value for domain_tot_pages() */
     unsigned int     extra_pages;       /* pages not included in domain_tot_pages() */
+    unsigned int     reserved_pages;    /* pages of static memory */
     atomic_t         shr_pages;         /* shared pages */
     atomic_t         paged_pages;       /* paged-out pages */
 
@@ -588,6 +590,9 @@ static inline struct page_list_head *page_to_list(
     if ( pg->count_info & PGC_extra )
         return &d->extra_page_list;
 
+    if ( pg->count_info & PGC_reserved )
+        return &d->reserved_page_list;
+
     return &d->page_list;
 }
 
-- 
2.25.1


