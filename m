Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 157A94EBDC4
	for <lists+xen-devel@lfdr.de>; Wed, 30 Mar 2022 11:38:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296127.504055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZUm7-0001HY-MQ; Wed, 30 Mar 2022 09:37:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296127.504055; Wed, 30 Mar 2022 09:37:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZUm7-0001EU-IW; Wed, 30 Mar 2022 09:37:59 +0000
Received: by outflank-mailman (input) for mailman id 296127;
 Wed, 30 Mar 2022 09:37:58 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=u124=UJ=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1nZUm5-0000ky-RF
 for xen-devel@lists.xenproject.org; Wed, 30 Mar 2022 09:37:58 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on062a.outbound.protection.outlook.com
 [2a01:111:f400:fe02::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 14366c13-b00d-11ec-8fbc-03012f2f19d4;
 Wed, 30 Mar 2022 11:37:57 +0200 (CEST)
Received: from DU2PR04CA0024.eurprd04.prod.outlook.com (2603:10a6:10:3b::29)
 by PAXPR08MB6400.eurprd08.prod.outlook.com (2603:10a6:102:150::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.17; Wed, 30 Mar
 2022 09:37:54 +0000
Received: from DB5EUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:3b:cafe::51) by DU2PR04CA0024.outlook.office365.com
 (2603:10a6:10:3b::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.13 via Frontend
 Transport; Wed, 30 Mar 2022 09:37:54 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT042.mail.protection.outlook.com (10.152.21.123) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5102.18 via Frontend Transport; Wed, 30 Mar 2022 09:37:54 +0000
Received: ("Tessian outbound 341d209a0e52:v113");
 Wed, 30 Mar 2022 09:37:54 +0000
Received: from 539857bee079.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 AF0D191D-D72A-40A2-8C78-FAC784AF9DBC.1; 
 Wed, 30 Mar 2022 09:37:47 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 539857bee079.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 30 Mar 2022 09:37:47 +0000
Received: from DB6PR07CA0166.eurprd07.prod.outlook.com (2603:10a6:6:43::20) by
 AM9PR08MB6691.eurprd08.prod.outlook.com (2603:10a6:20b:303::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.16; Wed, 30 Mar
 2022 09:37:45 +0000
Received: from DB5EUR03FT020.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:43:cafe::81) by DB6PR07CA0166.outlook.office365.com
 (2603:10a6:6:43::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.12 via Frontend
 Transport; Wed, 30 Mar 2022 09:37:45 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT020.mail.protection.outlook.com (10.152.20.134) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5102.18 via Frontend Transport; Wed, 30 Mar 2022 09:37:44 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.27; Wed, 30 Mar
 2022 09:37:24 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.27; Wed, 30
 Mar 2022 09:37:19 +0000
Received: from a011292.shanghai.arm.com (10.169.190.94) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.27 via Frontend
 Transport; Wed, 30 Mar 2022 09:37:14 +0000
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
X-Inumbo-ID: 14366c13-b00d-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=csxfLE0x7VKw62ppqcl6atLmZHiQeVO09K5L2Np5/LY=;
 b=DWdv1J5MV/Aog1VTNYy1g1/XbQHjXvbGgAdBB0f/x/1isRsNL0GeSLQy5HlaGq+DCnrQ2aTbqoJW7A0PERpU6JeOFGhVS/9f6hpUUOc0/biTNImAbf3tpQYZXtf7lxcBxR/Ax15xu7v93gsdvtnn3WmD/H8zFZdlgzcMRB9DOa8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9516156d429fe3dc
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jbZbPE5LUTjr5AesxfhBYIllkvVTgD+kgEwBBzMo2q/3X2rWDArSYh5JMplIjeuIni2yn+jdiN7XZIpgW8gVtJ0S816W2vzVBLIhBB40UXg97ISdgXwFM7G98MV2EKu3EFuOarmFeXwRXKeIZ5Rvwpp02M+wsL8gdPeSWjfTTITVOv9nQBrx2QxwUqPLkftYAHIAVMjW6etJULHPcMBJedg8NW4LKYz05WjBP17SNIrtYTIgOLA3aAtovpBhmFOJVBeMtPmHVuCZf2g6Oo16ZbHLI3rhh/QRXooB40wDi5v4ScIZUVvb8HbzNNQLuPGUX/kmlMX/Tv2pWJUIR8DDGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=csxfLE0x7VKw62ppqcl6atLmZHiQeVO09K5L2Np5/LY=;
 b=YTYIsrFNhHI8mKBd+8BG0RmxHo4BUI1eV6WBEV3i49TtvDWDJYmo2OmcILBq8E3nLKPR2MAH5fQenB2ni7aikV7CPRvQP9CE6vkVNt4FjMMpXbw/NK5dJ8edoeYRhPfb0/SbQAQ3Zbt7UcQix7RxWI4yjkdQFr8K/Xo4H4aDSAlQorp18msudvRD/ggpBSXMYi4Dicgfgpxk1dxofqAjJzKiUdZvE7LWacohih1GEmPLkBWyo9LbyvwCZSTWNDTJ/gd2dcUW0abfV/EjYpsnrHe/pMYxC/947S20uk0SNhyG/hS+ZWxAwfwN0jqid7KI3ipv9eRiqSfsVEgJkuo6zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=csxfLE0x7VKw62ppqcl6atLmZHiQeVO09K5L2Np5/LY=;
 b=DWdv1J5MV/Aog1VTNYy1g1/XbQHjXvbGgAdBB0f/x/1isRsNL0GeSLQy5HlaGq+DCnrQ2aTbqoJW7A0PERpU6JeOFGhVS/9f6hpUUOc0/biTNImAbf3tpQYZXtf7lxcBxR/Ax15xu7v93gsdvtnn3WmD/H8zFZdlgzcMRB9DOa8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Penny Zheng <Penny.Zheng@arm.com>
To: <xen-devel@lists.xenproject.org>
CC: <wei.chen@arm.com>, <henry.wang@arm.com>, Penny Zheng
	<Penny.Zheng@arm.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "George
 Dunlap" <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH v1 3/5] xen/arm: unpopulate memory when domain on static allocation
Date: Wed, 30 Mar 2022 17:36:15 +0800
Message-ID: <20220330093617.3870589-4-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220330093617.3870589-1-Penny.Zheng@arm.com>
References: <20220330093617.3870589-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: daf6ab2a-af7c-4ecd-aeab-08da1230f76f
X-MS-TrafficTypeDiagnostic:
	AM9PR08MB6691:EE_|DB5EUR03FT042:EE_|PAXPR08MB6400:EE_
X-Microsoft-Antispam-PRVS:
	<PAXPR08MB6400DAB09293A27C4AD8936FF71F9@PAXPR08MB6400.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 m36Sd7pxcJrfzPfCDzrj6BN9I9dxkyrxlXqB5e2LAsSFmacENE2IhfUJYB3KQCP6FPDhQajqOUNC1nM7DVxC/pAIKcQim96fogt3gp9Ja5W4OuM9K/M3s1mKDHmzvJhqMjcEsFadWeRhMBXxOrNqfy9DtavI1eZNXxxDQUWR84CLrLnMj1jtyFzgGRclHJwz1TyPYM0I/AGUALDGzHWpuAiXKX1ot9VgMMbNnsYD8oDmiVFK2PDd2JpH5NRVviitSWXbGg8kTWSs+d+/Ig632IU/MlCzrih6rHga7QyOQrXBj0V+R8To2Cdyv2DWWUF3BGHgfQUpuH0Zn1mScNL58KsYwRKSFf9KjEVLPzAkRfAMo+YSycItJfyBPjNjZCWJJqxjuom3sxE3a47xXmILODW6ewbFc/Ov0+OVhhunOHt3H3P51MrsweTg39l2w0PUAdTiSA1dBZy2H+PTO6Za9/9T2MIjqeQjman8RBcp3Q467HBWEAEdYrqM0joVnSAhzyU9jaqjBt4sHH1p2jbt79j+7AjGMoYy0Ma93MtoYx1X1giqAJwvZL+vZNZRZjYbtAJdp6jwfF/75Fs/oQ7XeWWDV+9L3TNxG/EN9rcrNS+ChLXescNZAIMtU6EcJvpkS7SaKmCZ8oxMxofkWp4yzbIj7aLhohu1Yx+zKvl9IJCiuN/Q+w+E641foXumVhKEnYs5KrIp4tqQBV0ehA5rYA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(1076003)(186003)(6916009)(54906003)(8676002)(316002)(508600001)(81166007)(86362001)(40460700003)(82310400004)(26005)(2616005)(7696005)(356005)(36860700001)(4326008)(8936002)(5660300002)(426003)(70206006)(336012)(70586007)(2906002)(83380400001)(36756003)(47076005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6691
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	44810791-68b6-429e-9110-08da1230f1b6
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	hC0WOAp/lhYAVSMgdpFJpibW8GT9MtowUz1JnEFdknF/Vkb0HKYpkoB7HELK/WtfjuuS6veOyE1sBX9Mvs5R56jR4rhQT0v19WUzjV8JqDvdt2ffY2L9YftthhK3eS5IrGQ1PTANeyBA9CbzYCDFztPTVW3YF5UTOlrNR4aT+igHKRUAJTreN189RJ90Jzop+h0kQP8bjGmozpQAT/c0+B8Y4Phh2CZukDPMMzm/uHC0i3dYasV4vnazKyPCqufZCAZPWt07MVsTPEyLNqrR1XnsPMbeJat5Ry/+gkm8KEw+k0M7wQjHvey14jrqIz6/Iq4K0XRU4TQmAWgKYNy1HfUSNYvOTDabHk1ktY25LzCHrVhT8LgzXLqLjOnoEyDMv3Cr+ZxKy58tfJTIh+EHosanNX+JJ7G7VhC3AJZevVX49iK7NaObc+KdW1FliuUn/Tmromzy2BhIUc4IR+fmH2kI4zurGUPol8AiDj7qkmE71UjXFatsLAtKRWzsmSFh9SsgLJpCD5dpxr+CCO0ZEcBz1+36dvoPJJXsp5utghhBvQ8DVnSe4PyKLBScrJ+ZTuJTYxSWxo+9viApWJmwa7ogu1fsXFSEOJmxbfzsIWM8lqpYMXIBFpwyMgw5qdGM8AaDuBVEn+JKg0lGv2eZvGQw9NFZjzIppGs7LIxbC/i/1fHtcBKMbz800i3nouMf
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(5660300002)(508600001)(26005)(2616005)(316002)(7696005)(186003)(336012)(36860700001)(86362001)(82310400004)(1076003)(8936002)(40460700003)(70206006)(47076005)(426003)(81166007)(4326008)(83380400001)(70586007)(8676002)(54906003)(36756003)(2906002)(6916009);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2022 09:37:54.5368
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: daf6ab2a-af7c-4ecd-aeab-08da1230f76f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT042.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6400

Today when a domain unpopulates the memory on runtime, they will always
hand the memory over to the heap allocator. And it will be a problem if domain
on static allocation.

Guest RAM for domain on static allocation is static memory, which is reserved
to only this domain, so it shall never go back to heap.

For above purpose, this commit tries to keep page allocated and store it
in page list d->resv_page_list on guest_remove_page, when domain on
static allocation.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
 xen/common/domain.c     |  4 ++++
 xen/common/memory.c     | 22 +++++++++++++++++++++-
 xen/include/xen/sched.h |  6 ++++++
 3 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/xen/common/domain.c b/xen/common/domain.c
index 351029f8b2..e572f27fce 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -602,6 +602,10 @@ struct domain *domain_create(domid_t domid,
     INIT_PAGE_LIST_HEAD(&d->page_list);
     INIT_PAGE_LIST_HEAD(&d->extra_page_list);
     INIT_PAGE_LIST_HEAD(&d->xenpage_list);
+#ifdef CONFIG_STATIC_MEMORY
+    INIT_PAGE_LIST_HEAD(&d->resv_page_list);
+#endif
+
 
     spin_lock_init(&d->node_affinity_lock);
     d->node_affinity = NODE_MASK_ALL;
diff --git a/xen/common/memory.c b/xen/common/memory.c
index 69b0cd1e50..2afc3c6f10 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -35,6 +35,10 @@
 #include <asm/guest.h>
 #endif
 
+#ifndef is_domain_on_static_allocation
+#define is_domain_on_static_allocation(d) 0
+#endif
+
 struct memop_args {
     /* INPUT */
     struct domain *domain;     /* Domain to be affected. */
@@ -405,13 +409,29 @@ int guest_remove_page(struct domain *d, unsigned long gmfn)
      * device must retrieve the same pfn when the hypercall populate_physmap
      * is called.
      *
+     * When domain on static allocation, they should always get pages from the
+     * reserved static region when the hypercall populate_physmap is called.
+     *
      * For this purpose (and to match populate_physmap() behavior), the page
      * is kept allocated.
      */
-    if ( !rc && !is_domain_direct_mapped(d) )
+    if ( !rc && !(is_domain_direct_mapped(d) ||
+                  is_domain_on_static_allocation(d)) )
         put_page_alloc_ref(page);
 
     put_page(page);
+#ifdef CONFIG_STATIC_MEMORY
+    /*
+     * When domain on static allocation, we shall store pages to resv_page_list,
+     * so the hypercall populate_physmap could retrieve pages from it,
+     * rather than allocating from heap.
+     */
+    if ( is_domain_on_static_allocation(d) )
+    {
+        page_list_add_tail(page, &d->resv_page_list);
+        d->resv_pages++;
+    }
+#endif
 
 #ifdef CONFIG_X86
  out_put_gfn:
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 406d9bc610..d7e047bf36 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -376,6 +376,9 @@ struct domain
     struct page_list_head page_list;  /* linked list */
     struct page_list_head extra_page_list; /* linked list (size extra_pages) */
     struct page_list_head xenpage_list; /* linked list (size xenheap_pages) */
+#ifdef CONFIG_STATIC_MEMORY
+    struct page_list_head resv_page_list; /* linked list (size resv_pages) */
+#endif
 
     /*
      * This field should only be directly accessed by domain_adjust_tot_pages()
@@ -389,6 +392,9 @@ struct domain
     unsigned int     extra_pages;       /* pages not included in domain_tot_pages() */
     atomic_t         shr_pages;         /* shared pages */
     atomic_t         paged_pages;       /* paged-out pages */
+#ifdef CONFIG_STATIC_MEMORY
+    unsigned int     resv_pages;        /* reserved pages from static region. */
+#endif
 
     /* Scheduling. */
     void            *sched_priv;    /* scheduler-specific data */
-- 
2.25.1


