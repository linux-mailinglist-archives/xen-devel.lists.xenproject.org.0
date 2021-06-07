Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F30C39D313
	for <lists+xen-devel@lfdr.de>; Mon,  7 Jun 2021 04:44:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.137541.254904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lq5FJ-0004mw-PS; Mon, 07 Jun 2021 02:44:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 137541.254904; Mon, 07 Jun 2021 02:44:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lq5FJ-0004if-IV; Mon, 07 Jun 2021 02:44:09 +0000
Received: by outflank-mailman (input) for mailman id 137541;
 Mon, 07 Jun 2021 02:44:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MAL7=LB=arm.com=penny.zheng@srs-us1.protection.inumbo.net>)
 id 1lq5FH-0003W9-Jo
 for xen-devel@lists.xenproject.org; Mon, 07 Jun 2021 02:44:07 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.65]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 92589372-4352-47c5-8fff-33cf698ec7b6;
 Mon, 07 Jun 2021 02:44:04 +0000 (UTC)
Received: from AS8P251CA0018.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:2f2::25)
 by AM0PR08MB5091.eurprd08.prod.outlook.com (2603:10a6:208:15e::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Mon, 7 Jun
 2021 02:44:01 +0000
Received: from AM5EUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2f2:cafe::ee) by AS8P251CA0018.outlook.office365.com
 (2603:10a6:20b:2f2::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.22 via Frontend
 Transport; Mon, 7 Jun 2021 02:44:01 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT055.mail.protection.outlook.com (10.152.17.214) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4195.21 via Frontend Transport; Mon, 7 Jun 2021 02:44:01 +0000
Received: ("Tessian outbound 6d1d235c0b46:v93");
 Mon, 07 Jun 2021 02:44:00 +0000
Received: from dd53acc8070d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 84A0B27A-975F-4E20-9B50-7054C63CE008.1; 
 Mon, 07 Jun 2021 02:43:54 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id dd53acc8070d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 07 Jun 2021 02:43:54 +0000
Received: from DB3PR08CA0009.eurprd08.prod.outlook.com (2603:10a6:8::22) by
 VI1PR0801MB1854.eurprd08.prod.outlook.com (2603:10a6:800:5c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.25; Mon, 7 Jun
 2021 02:43:52 +0000
Received: from DB5EUR03FT026.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:8:0:cafe::9f) by DB3PR08CA0009.outlook.office365.com
 (2603:10a6:8::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.15 via Frontend
 Transport; Mon, 7 Jun 2021 02:43:52 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT026.mail.protection.outlook.com (10.152.20.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4195.21 via Frontend Transport; Mon, 7 Jun 2021 02:43:52 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Mon, 7 Jun
 2021 02:43:51 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2176.14 via Frontend
 Transport; Mon, 7 Jun 2021 02:43:49 +0000
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
X-Inumbo-ID: 92589372-4352-47c5-8fff-33cf698ec7b6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K0fOlzkmZo8NkZdZnpDOUw9db/Rylzfd7fdhb0LDRQo=;
 b=NcwTHjVfAJ+iZgFKXRSAKk/xplxOYrdho2V6xsfOfq7+/ZyClBdEew3BzvND3uKaXaW4BdCiHgK73P0hpIUEiFJYu+Vn31LB54rR2lQqPBB2dEfU9xRv7NvMu/r5kpD6hbc5ifEWEYFuyn6iIOHfuyac1Nyo/JW0EMePxnIodu8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 263d801f856ac61a
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rl1ylBfpsqgOxamCMH10uxipty3iprdODYqVDFeaTuDva+EXl+1Mf+nrReH3tewrA/KJ9pgGHzUaleIuf4yaI+roWiE4p2dXsXnxh6nXuC66skCcfWlamBm+sNoccULkWiKoZYH19uUlavnamr07yL78mNyl1sv2K1Shahrq22hoI4brd9l9+H1DRG3t6WpLlkU9IpzKGgqUsPuT/qUN1eZv0d/9zwUXWmpRk1iq4LzSCudQiQP4cQAr18YiL88S/fqxD1tuNKcFs+vZ4W54sgQz5eQPWyIwEZYxxiHGK2VEHUcqhmofXmdstu8/dHrkw/cdv9dFVuTqoZc/tzhhEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K0fOlzkmZo8NkZdZnpDOUw9db/Rylzfd7fdhb0LDRQo=;
 b=obXBO0BXvri9l0PxEjjghNQLeLBODpY65aLFiDBdza8iCruJ9fzUpy/NGSdNDDqY5s5M7H0/Z5eZ6cASWE/siP+Q1W37kTj7bpY5vTgyfV1WlVRvR0vFSHs0CNqrwlxztbhJKfQedLj2kmO5HbhaOtnlrxpsBaauPlWpur6OaApT6x3p4SlnOEU9oZrDCTvoIYpnc06efNtF6l2omjT9+KGPTEr+4BHZ0AGdCaSWdp7eu7uucUtVhddT2sIVAt9Lfwu8Leq2X8tS7EXSNwoQyMZYfYV/zFp1sIForzCzYlm8mK40UUexhFbsniSQR6aFtx7QzVjIylLHTCLaeZf4TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K0fOlzkmZo8NkZdZnpDOUw9db/Rylzfd7fdhb0LDRQo=;
 b=NcwTHjVfAJ+iZgFKXRSAKk/xplxOYrdho2V6xsfOfq7+/ZyClBdEew3BzvND3uKaXaW4BdCiHgK73P0hpIUEiFJYu+Vn31LB54rR2lQqPBB2dEfU9xRv7NvMu/r5kpD6hbc5ifEWEYFuyn6iIOHfuyac1Nyo/JW0EMePxnIodu8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Penny Zheng <penny.zheng@arm.com>
To: <xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>,
	<julien@xen.org>, <jbeulich@suse.com>
CC: <Bertrand.Marquis@arm.com>, <Penny.Zheng@arm.com>, <Wei.Chen@arm.com>
Subject: [PATCH 5/9] xen: introduce assign_pages_nr
Date: Mon, 7 Jun 2021 02:43:14 +0000
Message-ID: <20210607024318.3988467-6-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210607024318.3988467-1-penny.zheng@arm.com>
References: <20210607024318.3988467-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2a9d48f0-e967-45bc-0d4f-08d9295e1b7c
X-MS-TrafficTypeDiagnostic: VI1PR0801MB1854:|AM0PR08MB5091:
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB50910D29E84A16C99AB6BD77F7389@AM0PR08MB5091.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 ip0DfnUXDQx+26sRcl8H5XDeYFELaRGl6JXPvJfYizw6RY2wJ/VX29yzwzAqUKncaKGKNt8hCq4kRb69x6Ldzxi44arB4ql7fJKf66WbScu1OnuLXianeFqAl/H5N1gk3/ijuwlV0DH42p7eHhZWbXqOUALZsmhZk1mkpIrkhA1E9ofk1o399Z8olCUClsBqY1aiHvr7EhV/3AwL8L9ivr1bpAeJAg4hLtVacRS5DNvl7tlGWnKA2uOEiOrJf3Rk1PMDcPs+Hhr/lI6llUPBIxw/PKxnQALQgciBQLDDGyx8Vbla2bxQZRE0jx9oN5bBPpgbbtWS/KnlM4a4gdiyGnFhVD9GhxbT8b6xEdkpNS8YHf4UKX7LVL7/bR0+nCFYfXozn45Yhj8t2v6PXigVccc3AR5x3Mz4YY/J5kPOPSbf4PboiKGrVrHr7ySRUJHfrTgoTyKYYGWIHDnWVKAdC/1y2zWIDfhtyAmm0dCFNUE8s1Oh5HClMV3gTdX3pa99OYkaA7TLt5M5Zj2wzZqJ4gZfX6GV5ArbngwGes5nedSXaZr9GqHlmWFxqnMhPnGZZoAj74Z3J6xIQHUFcjb4r4ps0PwYPW8TG/OctKqnzr/smt0bjLI8l9R6Roc/Y1m4athuCLDoXBMMxvmT56aKb1xT0XUOy1y1LwE3HuBSK/hzVTOstJO2pStZSL3RMn2WkRVr5JFvBvFvgVgy9I9BNA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(39860400002)(136003)(376002)(346002)(396003)(46966006)(36840700001)(36860700001)(2616005)(426003)(2906002)(83380400001)(36756003)(1076003)(44832011)(82310400003)(336012)(6666004)(81166007)(8936002)(82740400003)(54906003)(110136005)(478600001)(4326008)(316002)(70586007)(47076005)(356005)(7696005)(186003)(26005)(70206006)(86362001)(8676002)(5660300002)(2101003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB1854
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	363fd8cf-9a61-4515-c7c1-08d9295e1633
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	jhibhITHFGAJOMP+jWEUFXl33TGqj868lI1NFvSLhcCDHkcHXB2Dnd4zYUnGk+PPXLiBjX6MHs7JK9VsPzBeDPhIOAniGewiaTDNPplK+7iqeWTTsCPqlbGOli5fBZR2P8OO4nAt0H6ZPJWq0ioTRM83GQ2+U+34vhpA0J0vtt27fEmPQO9Seqw36WIkzwE3ZRHsnjaBori2aewqpuzvyjYnw5BxRY74/epnUBj7b2Ddl+4xE0ekjv/Dc8sPXXRkfM+dPLoezW0a0U8bCkQsCPTw4q/5et58iZcX+FgGTnlMXJyvMrZb+r1EfuaGkbM4RP1BDFvHw4XDFtlIfzI/uQc4eEsLQcdgOLrm+xLp3+wWDs0Rk3jHINlvmIjj0LmDcIW0m0J8bplbFlkCMpamUiiNwZZJrmINlrCJ9HSdONhwQrgkHxCEfaqGXRP+O4wSZBGWUUEWM8cBm/Seiz7IDtlgDw8X9AMi31CYAmsxD3l1Cg/THpTpZ2WseZaYhtxDepdI4ufzrZOwpYYQfnGQwyuI5yDyzxG1+Q9zK5wc8ozlW/V6jS5UPbpIm0fJvLK3BTTADaDJFa64ciw+4WiSp+Emqv2REsIUUfALZuZy0beVZFBltx4Nk3mVPflSS3GrRan6IAJljwF2sEZmit92HyRt80MVMK0iWqO5ZN6SWkLDj+xfsLrAOvUYkJB1oDGs
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39860400002)(396003)(136003)(376002)(346002)(46966006)(36840700001)(186003)(82310400003)(86362001)(26005)(44832011)(47076005)(336012)(2616005)(82740400003)(426003)(478600001)(7696005)(81166007)(6666004)(5660300002)(83380400001)(36756003)(70586007)(70206006)(4326008)(8676002)(8936002)(316002)(1076003)(36860700001)(2906002)(54906003)(110136005)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2021 02:44:01.3845
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a9d48f0-e967-45bc-0d4f-08d9295e1b7c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5091

Introduce new interface assign_pages_nr to deal with when page number is
not in a power-of-two, which will save the trouble each time user needs
to split the size in a power of 2 to use assign_pages.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
changes v2:
- introduce new interface assign_pages_nr
---
 xen/common/page_alloc.c | 26 +++++++++++++++++---------
 xen/include/xen/mm.h    | 10 ++++++++--
 2 files changed, 25 insertions(+), 11 deletions(-)

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 8c00262c04..e244d2e52e 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -2301,14 +2301,14 @@ void init_domheap_pages(paddr_t ps, paddr_t pe)
 }
 
 
-int assign_pages(
+int assign_pages_nr(
     struct domain *d,
     struct page_info *pg,
-    unsigned int order,
+    unsigned int nr_pfns,
     unsigned int memflags)
 {
     int rc = 0;
-    unsigned long i;
+    unsigned int i;
 
     spin_lock(&d->page_alloc_lock);
 
@@ -2324,7 +2324,7 @@ int assign_pages(
     {
         unsigned int extra_pages = 0;
 
-        for ( i = 0; i < (1ul << order); i++ )
+        for ( i = 0; i < nr_pfns; i++ )
         {
             ASSERT(!(pg[i].count_info & ~PGC_extra));
             if ( pg[i].count_info & PGC_extra )
@@ -2333,18 +2333,18 @@ int assign_pages(
 
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
@@ -2356,10 +2356,10 @@ int assign_pages(
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
@@ -2374,6 +2374,14 @@ int assign_pages(
     return rc;
 }
 
+int assign_pages(
+    struct domain *d,
+    struct page_info *pg,
+    unsigned int order,
+    unsigned int memflags)
+{
+    return assign_pages_nr(d, pg, (1U << order), memflags);
+}
 
 struct page_info *alloc_domheap_pages(
     struct domain *d, unsigned int order, unsigned int memflags)
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index df25e55966..25d970e857 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -131,12 +131,18 @@ int query_page_offline(mfn_t mfn, uint32_t *status);
 
 void heap_init_late(void);
 
-int assign_pages(
+int assign_pages_nr(
     struct domain *d,
     struct page_info *pg,
-    unsigned int order,
+    unsigned int nr_pfns,
     unsigned int memflags);
 
+ int assign_pages(
+     struct domain *d,
+     struct page_info *pg,
+     unsigned int order,
+     unsigned int memflags);
+
 /* Dump info to serial console */
 void arch_dump_shared_mem_info(void);
 
-- 
2.25.1


