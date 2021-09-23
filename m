Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B98415DE3
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 14:07:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193867.345430 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTNVj-0006CL-Kt; Thu, 23 Sep 2021 12:07:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193867.345430; Thu, 23 Sep 2021 12:07:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTNVj-000669-DI; Thu, 23 Sep 2021 12:07:31 +0000
Received: by outflank-mailman (input) for mailman id 193867;
 Thu, 23 Sep 2021 12:07:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fewu=ON=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mTNSk-0005KP-W2
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 12:04:27 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7e1a::620])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8e392c35-b95e-4c30-8195-80009b707bb9;
 Thu, 23 Sep 2021 12:03:54 +0000 (UTC)
Received: from PR0P264CA0184.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1c::28)
 by HE1PR08MB2873.eurprd08.prod.outlook.com (2603:10a6:7:30::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Thu, 23 Sep
 2021 12:03:44 +0000
Received: from VE1EUR03FT011.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:100:1c:cafe::e5) by PR0P264CA0184.outlook.office365.com
 (2603:10a6:100:1c::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend
 Transport; Thu, 23 Sep 2021 12:03:44 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT011.mail.protection.outlook.com (10.152.18.134) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 12:03:44 +0000
Received: ("Tessian outbound a77cafe56b47:v103");
 Thu, 23 Sep 2021 12:03:42 +0000
Received: from 9c69dda446e7.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B77D722B-197B-4BEF-98E4-0803B71C25E7.1; 
 Thu, 23 Sep 2021 12:03:26 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9c69dda446e7.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 23 Sep 2021 12:03:26 +0000
Received: from DB6P193CA0002.EURP193.PROD.OUTLOOK.COM (2603:10a6:6:29::12) by
 DB6PR0801MB1926.eurprd08.prod.outlook.com (2603:10a6:4:6c::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4523.16; Thu, 23 Sep 2021 12:03:24 +0000
Received: from DB5EUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:29:cafe::67) by DB6P193CA0002.outlook.office365.com
 (2603:10a6:6:29::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Thu, 23 Sep 2021 12:03:24 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT032.mail.protection.outlook.com (10.152.20.162) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 12:03:24 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.14; Thu, 23 Sep
 2021 12:03:24 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 23
 Sep 2021 12:03:22 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.87) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Thu, 23 Sep 2021 12:03:21 +0000
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
X-Inumbo-ID: 8e392c35-b95e-4c30-8195-80009b707bb9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hKGWyOZlxxh43KHp7ZOxfxEZJMhlD15ad4VHvSvtHzE=;
 b=bc4CJPDNJeBqmaNVOzPGFxoBH34QB5MFYuLELOKkalfMzHKJranlDRzX0bdvODm2Cqwhkd6C+BtDhC5mXnlBdfTR28J/y2HRhX6GpSRkUwpgBqPpGft97/yJcDsXKH+O8aNhTClmHb2JqwKtAR97GhNZ29gbXLvcxQ5s7EX3DJs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: bfeb19c4adcec2df
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HfX+etrn9Uey+4KzLB96tj0eHEBNpInNru9o6XbSGLQ3jy1KuJRXbchW8AnkBav7m3yGUdxqkYXHsIFExSKxhoNUudRh7dBaHDvIGPceoijbxImTxI4yVyAGWxrUM7oTy9QDry/QTqDCV/2kzNH4UWlYsrvR7W0wU0mXERx/2o6gJdDWTVCy8PYglBc0mygdXkXeKOezwQssjf13rvB9mDwWVHp6MUHoiWITLV+H+caYaVMCYJi9VKmZmv/ExQmVDJAnAIfkSF51GQ8/U0pijzvVENIRz8cZoKvz4usV71RfJilqL5GDqZrXdF6lrrAbdoyLJqlav6T7996UM/aspA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=hKGWyOZlxxh43KHp7ZOxfxEZJMhlD15ad4VHvSvtHzE=;
 b=dwLHbxyTLgfSdq9MnnactGv8eO/9dCt6W/ee5BVhgGghjCZjSXJU5UtEwPsNdlJnJoI20brbirH08mqxUUax9v1pcL1E2JG4eckuCDTIkik/jyx2pKi0YuPxvBTLgTCoVjW7UgU3Xf2wPVzH2Qa+9pMnST0/1wMNxJ9UfFFgRQOfDqgJhinpWUYuB77ebcgA5PjqDXlZUwpjpLJtYfSz3GP/lIbpVKTmE7mwAwxCDMOLEYcR+FDa0L1Lt0PT3OxT9VKkMnfnD8mAeOaYXmJc4ehM03nI9SHJEjmjNmUhUaeIHho+9riWGvZTay9mCxajs8KsBxj/GMFFjKkkZnuCOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hKGWyOZlxxh43KHp7ZOxfxEZJMhlD15ad4VHvSvtHzE=;
 b=bc4CJPDNJeBqmaNVOzPGFxoBH34QB5MFYuLELOKkalfMzHKJranlDRzX0bdvODm2Cqwhkd6C+BtDhC5mXnlBdfTR28J/y2HRhX6GpSRkUwpgBqPpGft97/yJcDsXKH+O8aNhTClmHb2JqwKtAR97GhNZ29gbXLvcxQ5s7EX3DJs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Wei Chen <wei.chen@arm.com>
To: <wei.chen@arm.com>, <xen-devel@lists.xenproject.org>,
	<sstabellini@kernel.org>, <julien@xen.org>
CC: <Bertrand.Marquis@arm.com>
Subject: [PATCH 07/37] xen/x86: use paddr_t for addresses in NUMA node structure
Date: Thu, 23 Sep 2021 20:02:06 +0800
Message-ID: <20210923120236.3692135-8-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210923120236.3692135-1-wei.chen@arm.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5ab2834c-4178-4f9b-5bb7-08d97e8a3124
X-MS-TrafficTypeDiagnostic: DB6PR0801MB1926:|HE1PR08MB2873:
X-Microsoft-Antispam-PRVS:
	<HE1PR08MB2873F0BD54D0A53FB98E8EAE9EA39@HE1PR08MB2873.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:935;OLM:935;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Nnf+ibO55AWQQfBEFFAOvG+NflpSS8wWS7KOIrJmFExDxAFPE6TGxPzSk4wlb9pLY/j09CPafUFbfZbcfKqtWsEmDArxH0d0ULpukbifbz9i3Ev/OwenSWV/LCbC9nMRGnk46kzOGcp4X3TBwWMh4Y4E5zCbnF7Wg4JOoIpx7ct8xk8yeCMJ7OWH4+ivy78LBx4MpI7hbore9EFD3DVOQDpHaUF6lGleJZ9Wyopy34Ix51kVAA77xQZzxfEyM7Fo0eeYGYPUkAOZDdOzJ9Yax4k7ZDk2+Ip+BfyXDN0B400Dg999fBN550iKJdGGCXg7QQQzgk0H8RdYLAZ+QqIed7bWBGLWfXP2itLvSPjF8buk7A/oa5Y+7J8ji0nMnFaUR4seEUB/ITCTXaLsXYbmITcAQDEEFhKsKcYW3Zk0XM5f/YpVw1Q31ZzbYxVWDwdzA4IqsWSspFP5a3qNtCDmEnqdHwGLi7+2dWUNSSo8/ABTh0m11+ZoOh6W6jb2BNIs1DQ8m3Sps8zcFn8soCf5RdnyeMkJHPkfOL/2weO1rL6CjkS8vYdSScAQzfEsfjNbTGeggq7TeMP5cDCJidUL4+MQvP8alsosdAiA9TL1Pfk9kwEkMLr7WVS2rK661Xy6ZRklQQnXc2NhF3xZnT+yB9bvshgNFOmqWJL7eG9+bNMB2aG2zTU1evJ4I4VeZiIp0P23anvB+jTZNskg0387NgJqBCTV6Kxm71YdihpvPU8=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(83380400001)(508600001)(426003)(336012)(186003)(86362001)(82310400003)(70206006)(36860700001)(110136005)(7696005)(5660300002)(36756003)(81166007)(356005)(44832011)(316002)(70586007)(2906002)(8936002)(4326008)(47076005)(6666004)(2616005)(1076003)(26005)(8676002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB1926
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	e30fb11a-b275-4250-4e12-08d97e8a255d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	bVxWPuK1X2fgvk3Mu093LbsVC5OSkzfzl2vXnaJ4v67rED2pzcGZBnu9SyqnoTO8UnW4L+v1bYHg0g5o5hd9lsMcm/uIMdJIU9rfHxjCJm+HiQlf/7NzeeGaPpaJOo4mr5EmJ0yjdet/B4/wnzbjg/fY1MA+pUyyRAFKbpmoSCUIcoS9WMT8VhAJu4frZ+JjATpq16K68NnhVUSuQsMIvL6cjtoat66QhwXwBtog4gKsKWiI/IGOkL1YZirNhngQOjFA5k/nxq8pt6ce+2/nRQWUcGYr0zpV1T8Qhviaq3SevSJ84CT4wnEMOcl24zsBTIQ1HbPvVJL4pA3OWwBuogoDS1+i/AUVinOBVnC//NGNUsmlkj0WDLAR9lEAQexnp6MO/uuLSdsRmmOmyR2JPrbTIpB8oo/EXVpfM90IzF+DkPp83NLxGgQ+EGWvN9MDB40fEVlpq/KzPNFfeGZYXPNWoG++UIid6rdHUYYBRD67H4oICOPdGHjo+XYu1D2YLsP8VCiTgyo2KY1+/kjLnxRBK1JLDLiIPHZmzB+OlmjRQGFXFWY96eD/gWQ+OHPXA6bLOnshFLaokCt/nAHFLFRWtYuMV51uZ39pio4ShuxFM2gPPn5xv2ckFMYxKXVlN0Dz/KErmb7X5vOItxce/CNx4PN25AS5tN1rkpGG/uG+D6Sc15621yrHmb7vebMlHG91ogWKXuTLeq//P3ermA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(186003)(81166007)(316002)(82310400003)(110136005)(83380400001)(508600001)(44832011)(86362001)(7696005)(70586007)(4326008)(336012)(36860700001)(1076003)(5660300002)(426003)(2616005)(47076005)(8676002)(26005)(36756003)(6666004)(2906002)(8936002)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 12:03:44.3269
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ab2834c-4178-4f9b-5bb7-08d97e8a3124
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HE1PR08MB2873

NUMA node structure "struct node" is using u64 as node memory
range. In order to make other architectures can reuse this
NUMA node relative code, we replace the u64 to paddr_t. And
use pfn_to_paddr and paddr_to_pfn to replace explicit shift
operations. The relate PRIx64 in print messages have been
replaced by PRIpaddr at the same time.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/arch/x86/numa.c        | 32 +++++++++++++++++---------------
 xen/arch/x86/srat.c        | 26 +++++++++++++-------------
 xen/include/asm-x86/numa.h |  8 ++++----
 3 files changed, 34 insertions(+), 32 deletions(-)

diff --git a/xen/arch/x86/numa.c b/xen/arch/x86/numa.c
index 1fabbe8281..6337bbdf31 100644
--- a/xen/arch/x86/numa.c
+++ b/xen/arch/x86/numa.c
@@ -165,12 +165,12 @@ int __init compute_hash_shift(struct node *nodes, int numnodes,
     return shift;
 }
 /* initialize NODE_DATA given nodeid and start/end */
-void __init setup_node_bootmem(nodeid_t nodeid, u64 start, u64 end)
-{ 
+void __init setup_node_bootmem(nodeid_t nodeid, paddr_t start, paddr_t end)
+{
     unsigned long start_pfn, end_pfn;
 
-    start_pfn = start >> PAGE_SHIFT;
-    end_pfn = end >> PAGE_SHIFT;
+    start_pfn = paddr_to_pfn(start);
+    end_pfn = paddr_to_pfn(end);
 
     NODE_DATA(nodeid)->node_start_pfn = start_pfn;
     NODE_DATA(nodeid)->node_spanned_pages = end_pfn - start_pfn;
@@ -201,11 +201,12 @@ void __init numa_init_array(void)
 static int numa_fake __initdata = 0;
 
 /* Numa emulation */
-static int __init numa_emulation(u64 start_pfn, u64 end_pfn)
+static int __init numa_emulation(unsigned long start_pfn,
+                                 unsigned long end_pfn)
 {
     int i;
     struct node nodes[MAX_NUMNODES];
-    u64 sz = ((end_pfn - start_pfn)<<PAGE_SHIFT) / numa_fake;
+    u64 sz = pfn_to_paddr(end_pfn - start_pfn) / numa_fake;
 
     /* Kludge needed for the hash function */
     if ( hweight64(sz) > 1 )
@@ -221,9 +222,9 @@ static int __init numa_emulation(u64 start_pfn, u64 end_pfn)
     memset(&nodes,0,sizeof(nodes));
     for ( i = 0; i < numa_fake; i++ )
     {
-        nodes[i].start = (start_pfn<<PAGE_SHIFT) + i*sz;
+        nodes[i].start = pfn_to_paddr(start_pfn) + i*sz;
         if ( i == numa_fake - 1 )
-            sz = (end_pfn<<PAGE_SHIFT) - nodes[i].start;
+            sz = pfn_to_paddr(end_pfn) - nodes[i].start;
         nodes[i].end = nodes[i].start + sz;
         printk(KERN_INFO "Faking node %d at %"PRIx64"-%"PRIx64" (%"PRIu64"MB)\n",
                i,
@@ -249,24 +250,26 @@ static int __init numa_emulation(u64 start_pfn, u64 end_pfn)
 void __init numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn)
 { 
     int i;
+    paddr_t start, end;
 
 #ifdef CONFIG_NUMA_EMU
     if ( numa_fake && !numa_emulation(start_pfn, end_pfn) )
         return;
 #endif
 
+    start = pfn_to_paddr(start_pfn);
+    end = pfn_to_paddr(end_pfn);
+
 #ifdef CONFIG_ACPI_NUMA
-    if ( !numa_off && !acpi_scan_nodes((u64)start_pfn << PAGE_SHIFT,
-         (u64)end_pfn << PAGE_SHIFT) )
+    if ( !numa_off && !acpi_scan_nodes(start, end) )
         return;
 #endif
 
     printk(KERN_INFO "%s\n",
            numa_off ? "NUMA turned off" : "No NUMA configuration found");
 
-    printk(KERN_INFO "Faking a node at %016"PRIx64"-%016"PRIx64"\n",
-           (u64)start_pfn << PAGE_SHIFT,
-           (u64)end_pfn << PAGE_SHIFT);
+    printk(KERN_INFO "Faking a node at %016"PRIpaddr"-%016"PRIpaddr"\n",
+           start, end);
     /* setup dummy node covering all memory */
     memnode_shift = BITS_PER_LONG - 1;
     memnodemap = _memnodemap;
@@ -279,8 +282,7 @@ void __init numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn)
     for ( i = 0; i < nr_cpu_ids; i++ )
         numa_set_node(i, 0);
     cpumask_copy(&node_to_cpumask[0], cpumask_of(0));
-    setup_node_bootmem(0, (u64)start_pfn << PAGE_SHIFT,
-                    (u64)end_pfn << PAGE_SHIFT);
+    setup_node_bootmem(0, start, end);
 }
 
 void numa_add_cpu(int cpu)
diff --git a/xen/arch/x86/srat.c b/xen/arch/x86/srat.c
index 6b77b98201..7d20d7f222 100644
--- a/xen/arch/x86/srat.c
+++ b/xen/arch/x86/srat.c
@@ -104,7 +104,7 @@ nodeid_t setup_node(unsigned pxm)
 	return node;
 }
 
-int valid_numa_range(u64 start, u64 end, nodeid_t node)
+int valid_numa_range(paddr_t start, paddr_t end, nodeid_t node)
 {
 	int i;
 
@@ -119,7 +119,7 @@ int valid_numa_range(u64 start, u64 end, nodeid_t node)
 	return 0;
 }
 
-static __init int conflicting_memblks(u64 start, u64 end)
+static __init int conflicting_memblks(paddr_t start, paddr_t end)
 {
 	int i;
 
@@ -135,7 +135,7 @@ static __init int conflicting_memblks(u64 start, u64 end)
 	return -1;
 }
 
-static __init void cutoff_node(int i, u64 start, u64 end)
+static __init void cutoff_node(int i, paddr_t start, paddr_t end)
 {
 	struct node *nd = &nodes[i];
 	if (nd->start < start) {
@@ -275,7 +275,7 @@ acpi_numa_processor_affinity_init(const struct acpi_srat_cpu_affinity *pa)
 void __init
 acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
 {
-	u64 start, end;
+	paddr_t start, end;
 	unsigned pxm;
 	nodeid_t node;
 	int i;
@@ -318,7 +318,7 @@ acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
 		bool mismatch = !(ma->flags & ACPI_SRAT_MEM_HOT_PLUGGABLE) !=
 		                !test_bit(i, memblk_hotplug);
 
-		printk("%sSRAT: PXM %u (%"PRIx64"-%"PRIx64") overlaps with itself (%"PRIx64"-%"PRIx64")\n",
+		printk("%sSRAT: PXM %u (%"PRIpaddr"-%"PRIpaddr") overlaps with itself (%"PRIpaddr"-%"PRIpaddr")\n",
 		       mismatch ? KERN_ERR : KERN_WARNING, pxm, start, end,
 		       node_memblk_range[i].start, node_memblk_range[i].end);
 		if (mismatch) {
@@ -327,7 +327,7 @@ acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
 		}
 	} else {
 		printk(KERN_ERR
-		       "SRAT: PXM %u (%"PRIx64"-%"PRIx64") overlaps with PXM %u (%"PRIx64"-%"PRIx64")\n",
+		       "SRAT: PXM %u (%"PRIpaddr"-%"PRIpaddr") overlaps with PXM %u (%"PRIpaddr"-%"PRIpaddr")\n",
 		       pxm, start, end, node_to_pxm(memblk_nodeid[i]),
 		       node_memblk_range[i].start, node_memblk_range[i].end);
 		bad_srat();
@@ -346,7 +346,7 @@ acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
 				nd->end = end;
 		}
 	}
-	printk(KERN_INFO "SRAT: Node %u PXM %u %"PRIx64"-%"PRIx64"%s\n",
+	printk(KERN_INFO "SRAT: Node %u PXM %u %"PRIpaddr"-%"PRIpaddr"%s\n",
 	       node, pxm, start, end,
 	       ma->flags & ACPI_SRAT_MEM_HOT_PLUGGABLE ? " (hotplug)" : "");
 
@@ -369,7 +369,7 @@ static int __init nodes_cover_memory(void)
 
 	for (i = 0; i < e820.nr_map; i++) {
 		int j, found;
-		unsigned long long start, end;
+		paddr_t start, end;
 
 		if (e820.map[i].type != E820_RAM) {
 			continue;
@@ -396,7 +396,7 @@ static int __init nodes_cover_memory(void)
 
 		if (start < end) {
 			printk(KERN_ERR "SRAT: No PXM for e820 range: "
-				"%016Lx - %016Lx\n", start, end);
+				"%"PRIpaddr" - %"PRIpaddr"\n", start, end);
 			return 0;
 		}
 	}
@@ -432,7 +432,7 @@ static int __init srat_parse_region(struct acpi_subtable_header *header,
 	return 0;
 }
 
-void __init srat_parse_regions(u64 addr)
+void __init srat_parse_regions(paddr_t addr)
 {
 	u64 mask;
 	unsigned int i;
@@ -441,7 +441,7 @@ void __init srat_parse_regions(u64 addr)
 	    acpi_table_parse(ACPI_SIG_SRAT, acpi_parse_srat))
 		return;
 
-	srat_region_mask = pdx_init_mask(addr);
+	srat_region_mask = pdx_init_mask((u64)addr);
 	acpi_table_parse_srat(ACPI_SRAT_TYPE_MEMORY_AFFINITY,
 			      srat_parse_region, 0);
 
@@ -457,7 +457,7 @@ void __init srat_parse_regions(u64 addr)
 }
 
 /* Use the information discovered above to actually set up the nodes. */
-int __init acpi_scan_nodes(u64 start, u64 end)
+int __init acpi_scan_nodes(paddr_t start, paddr_t end)
 {
 	int i;
 	nodemask_t all_nodes_parsed;
@@ -489,7 +489,7 @@ int __init acpi_scan_nodes(u64 start, u64 end)
 	/* Finally register nodes */
 	for_each_node_mask(i, all_nodes_parsed)
 	{
-		u64 size = nodes[i].end - nodes[i].start;
+		paddr_t size = nodes[i].end - nodes[i].start;
 		if ( size == 0 )
 			printk(KERN_WARNING "SRAT: Node %u has no memory. "
 			       "BIOS Bug or mis-configured hardware?\n", i);
diff --git a/xen/include/asm-x86/numa.h b/xen/include/asm-x86/numa.h
index 8060cbf3f4..50cfd8e7ef 100644
--- a/xen/include/asm-x86/numa.h
+++ b/xen/include/asm-x86/numa.h
@@ -16,7 +16,7 @@ extern cpumask_t     node_to_cpumask[];
 #define node_to_cpumask(node)    (node_to_cpumask[node])
 
 struct node { 
-	u64 start,end; 
+	paddr_t start,end;
 };
 
 extern int compute_hash_shift(struct node *nodes, int numnodes,
@@ -36,7 +36,7 @@ extern void numa_set_node(int cpu, nodeid_t node);
 extern nodeid_t setup_node(unsigned int pxm);
 extern void srat_detect_node(int cpu);
 
-extern void setup_node_bootmem(nodeid_t nodeid, u64 start, u64 end);
+extern void setup_node_bootmem(nodeid_t nodeid, paddr_t start, paddr_t end);
 extern nodeid_t apicid_to_node[];
 extern void init_cpu_to_node(void);
 
@@ -73,9 +73,9 @@ static inline __attribute__((pure)) nodeid_t phys_to_nid(paddr_t addr)
 #define node_end_pfn(nid)       (NODE_DATA(nid)->node_start_pfn + \
 				 NODE_DATA(nid)->node_spanned_pages)
 
-extern int valid_numa_range(u64 start, u64 end, nodeid_t node);
+extern int valid_numa_range(paddr_t start, paddr_t end, nodeid_t node);
 
-void srat_parse_regions(u64 addr);
+void srat_parse_regions(paddr_t addr);
 extern u8 __node_distance(nodeid_t a, nodeid_t b);
 unsigned int arch_get_dma_bitsize(void);
 unsigned int arch_have_default_dmazone(void);
-- 
2.25.1


