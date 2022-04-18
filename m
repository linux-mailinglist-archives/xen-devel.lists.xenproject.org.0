Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1AD150509E
	for <lists+xen-devel@lfdr.de>; Mon, 18 Apr 2022 14:24:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.307205.522535 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngQQL-0004hN-2t; Mon, 18 Apr 2022 12:24:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 307205.522535; Mon, 18 Apr 2022 12:24:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngQQK-0004d5-UN; Mon, 18 Apr 2022 12:24:08 +0000
Received: by outflank-mailman (input) for mailman id 307205;
 Mon, 18 Apr 2022 12:24:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UkN/=U4=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1ngQQJ-0002K3-Bb
 for xen-devel@lists.xenproject.org; Mon, 18 Apr 2022 12:24:07 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 (mail-am6eur05on20621.outbound.protection.outlook.com
 [2a01:111:f400:7e1b::621])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6e91ce18-bf12-11ec-8fbe-03012f2f19d4;
 Mon, 18 Apr 2022 14:24:03 +0200 (CEST)
Received: from AM6P193CA0060.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:8e::37)
 by VI1PR08MB4622.eurprd08.prod.outlook.com (2603:10a6:803:bc::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.25; Mon, 18 Apr
 2022 12:23:59 +0000
Received: from VE1EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8e:cafe::30) by AM6P193CA0060.outlook.office365.com
 (2603:10a6:209:8e::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20 via Frontend
 Transport; Mon, 18 Apr 2022 12:23:59 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT018.mail.protection.outlook.com (10.152.18.135) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5164.19 via Frontend Transport; Mon, 18 Apr 2022 12:23:58 +0000
Received: ("Tessian outbound facaf1373bbd:v118");
 Mon, 18 Apr 2022 12:23:58 +0000
Received: from c37794760062.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7BDC8C1E-EAB9-4136-86E0-ECA025413728.1; 
 Mon, 18 Apr 2022 12:23:51 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c37794760062.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 18 Apr 2022 12:23:51 +0000
Received: from AM7PR03CA0019.eurprd03.prod.outlook.com (2603:10a6:20b:130::29)
 by AS8PR08MB5896.eurprd08.prod.outlook.com (2603:10a6:20b:294::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Mon, 18 Apr
 2022 12:23:50 +0000
Received: from VE1EUR03FT043.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:130:cafe::f4) by AM7PR03CA0019.outlook.office365.com
 (2603:10a6:20b:130::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20 via Frontend
 Transport; Mon, 18 Apr 2022 12:23:50 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT043.mail.protection.outlook.com (10.152.19.122) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5164.19 via Frontend Transport; Mon, 18 Apr 2022 12:23:49 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.27; Mon, 18 Apr
 2022 12:23:47 +0000
Received: from a011292.shanghai.arm.com (10.169.190.94) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.27 via Frontend
 Transport; Mon, 18 Apr 2022 12:23:38 +0000
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
X-Inumbo-ID: 6e91ce18-bf12-11ec-8fbe-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rYZ7/21bXTduzlBPK071K+W97NWodHf7d5105P0sD+8=;
 b=2JdSqc/a/HH+0YeJVglTUEVJZ8GBNb7c0sUcnsJdzTPBDapohw7w4OsrF7JwKc1V4X8qtxxsNYDq8Uv1UtKmHb/a+ZE7hUStjh7c4WhnfpWbftnIPQwWQa0BGC64R3YXp7u0lsMjRf1pSZr7376qjwzcIg2b4XPH7/2FFC3gRow=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2fe4311b042f5cc7
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fi7naA2IVcQ6csHoeDpsrjgzM2CJ1KJ7f5msPQViNdXN3EcC6okm1zTRoBYfHG9kZlb2HwF0mh7yjJdKohf2ZUjXrImQvUBjXxuMBXRtmUQXW87E1TolNn/FDJld7jPMv8Bg6ZK23NOZThAIQPo0D/5bLILwaG6AzVY/7YmdUQ4mWQAMRwcMrYRyvddYFkvF2XeYTBs+p68+stPboUV9WUWHIkS2Iw6I1UhR4t1xEmSEoShX0V2WNoBCEXhiv3cWyKhuuXdPhEUSy7i1LdiV6eDhoAqxSqOML3673z0dVEFSojGEl/VuYBdTEVdzOhkf9XSRPtZSJIssHgOW8NoZsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rYZ7/21bXTduzlBPK071K+W97NWodHf7d5105P0sD+8=;
 b=M6shXsTSgJjqPVu43i5yYDUlD25Ar2lrCcFFhT7fcu1g7PGmRUf9o+dmCcUUySU9D3mSiaVdlRQD0ks3rHfgX+DsBTEb1egNegCqh5ndajYgOTbxVa1H6mc7LiUGE3icYX0ZxWqJXHsLhR4K+X7bOi6iPISfhczVUcADOwNdltwGQxPOrXG4rMjC/t83GdfgfWpSLT6HXoUjsDsH0YkuTGJIaT/4mI9A2UnuwpBFarVnQK4t+uRE6aVVlgs7oZqc8//khSWwVCiEcZfCyxiOIKTQresSltm853X3NiECjQlEgDrO/XsNY1B+Zy+kXh2mgW8veZE3JUA8cSI7dxIQKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rYZ7/21bXTduzlBPK071K+W97NWodHf7d5105P0sD+8=;
 b=2JdSqc/a/HH+0YeJVglTUEVJZ8GBNb7c0sUcnsJdzTPBDapohw7w4OsrF7JwKc1V4X8qtxxsNYDq8Uv1UtKmHb/a+ZE7hUStjh7c4WhnfpWbftnIPQwWQa0BGC64R3YXp7u0lsMjRf1pSZr7376qjwzcIg2b4XPH7/2FFC3gRow=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Penny Zheng <Penny.Zheng@arm.com>
To: <xen-devel@lists.xenproject.org>
CC: <wei.chen@arm.com>, Penny Zheng <Penny.Zheng@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>, Penny Zheng <penny.zheng@arm.com>
Subject: [PATCH v2 5/6] xen/arm: unpopulate memory when domain is static
Date: Mon, 18 Apr 2022 20:22:50 +0800
Message-ID: <20220418122251.3583049-6-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220418122251.3583049-1-Penny.Zheng@arm.com>
References: <20220418122251.3583049-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 4999d099-47ea-49ad-774f-08da2136508c
X-MS-TrafficTypeDiagnostic:
	AS8PR08MB5896:EE_|VE1EUR03FT018:EE_|VI1PR08MB4622:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB46222054ACB4BBE028995819F7F39@VI1PR08MB4622.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 heFRGt/zvBO88kv4uV5RbbLIEAze6cFninXGuepuAzUWODN8h4+Il3IJzxSrnyuRVRiL/FJbGyIXRIfc7l1kvkbskGVduj9x6RTDPg57Xoe478FpzwKTBam/WcI583DguEe77zisEpwNjLWIG5d2BAWuE/O+X+NpCKHPda+ILiGkO0QsfjV/GNnTrFBFVXBaD+lCLG6mKdqoWZrMw9XClmMdwOc8wF+iKom9tkbDiBtV4JPQeHwncEKiBa1U9kTVuv/Bao5Qj4EmoKHM/3TixWnNTMiGfK3cofaHYo8lDck4Qstk3uhbFB1dXhFP3hQy4YIVtXCxlc7mnk7A08omfrFG8n5ZUQkL7kNPTv5+c2Vv0edaCwuy3CIgBl5QQkhFsd+zwuZp1HTozQQFoDNOWRaxPgrJIa/KnFhdfB2Bl6+ca0NgJWwv12cOJic4ZuoOPulVeejBm7obK0lq3IIfUArLXakKKuB41ISORBj0wQkjWnoT4GRnVZ1rnd4/0/wxVN37zDMzMPE2xQ+PYOpvt3eVjrvGScpkOKQNOw1phwILSSUOyit/nuLeRW7/NlhG4Cg2gawBICw7gI04fyZ+PW7tSgv4enUWoh9Fiwz2Bdto4xI+wRMiDkT4xQ1/02HYoH8L14RpxgkQg6SAYbEGZNrcH8sW/U3V+azflKWleNgIaD0v/vgkz4T5P2t47LFTBNWQbEeP1koacciHB1ca/w==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(47076005)(4326008)(7696005)(81166007)(8676002)(1076003)(40460700003)(2906002)(6916009)(86362001)(2616005)(186003)(26005)(36756003)(82310400005)(70206006)(70586007)(426003)(8936002)(6666004)(356005)(508600001)(336012)(36860700001)(5660300002)(54906003)(316002)(83380400001)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB5896
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0c959f4a-48b3-4d0c-a3db-08da21364ab5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SKGn8JWLqKzecWzAYMG4ooNeXI7VoXzjq+j9J8SRUHqb500j1Dw3NYalF0Wr86vi3gvv+yc55A4zLydEzQlcGKQF5AgPOdEhZyWr52dpf+rcV6v0/awF1uwM0pKGKkkt2Oe93vnPOJmf+dePVUgaq+Qm+DpkY0EpaoWghHTQfAwajZSE45eR4HN4bvNzs2qHQVqOBFWEd7HiGvCUAosDGolUzJEGwELdfTcC9YjYWMlnO7vPt9IMF+/9W37+n7ZOQ7h/Fu+J9UZRdg0CH9tpPi024nFoPeSzO41ra66jJvOfyONMksKQ7WvOHfMPI1XLowRHLa4K/OUMrffL7FcYjnKHNm4ijtF92IBtIwDPLd/xfVfl113KbZKaI3Y4DFJuty7Sx+YkcMCz2BjJpGW/HICGLh8E8ePxNC0pZjIXLkJy8AVQIlHHS1VdBEenbCmwXgLE0eZ8q2c87KAy5MCLv55G6328PkhTPsYsIaP/OqM8RaVp9EqeXu+IqV6B6oYB20BZVYggvCW3OU1f0tgmIStkgJE1hRyCWqyKkJ8waoIecBweVgi9rwwNEzfe3T/I4b3hcU494gNki7WZxFXl7TQPstvClet498nnihWDQE4U4KfWZXPig2eKdTlRctJ5u6jUkD1ELUYvX2pFla20Zw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(83380400001)(82310400005)(2906002)(186003)(81166007)(7696005)(70206006)(70586007)(1076003)(2616005)(5660300002)(316002)(36756003)(26005)(6666004)(426003)(336012)(47076005)(508600001)(54906003)(6916009)(36860700001)(8936002)(8676002)(4326008)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2022 12:23:58.8586
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4999d099-47ea-49ad-774f-08da2136508c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT018.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4622

Today when a domain unpopulates the memory on runtime, they will always
hand the memory back to the heap allocator. And it will be a problem if domain
is static.

Pages as guest RAM for static domain shall be reserved to only this domain
and not be used for any other purposes, so they shall never go back to heap
allocator.

This commit puts reserved pages on the new list resv_page_list only after
having taken them off the "normal" list, when the last ref dropped.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
v2 changes:
- put reserved pages on resv_page_list after having taken them off
the "normal" list
---
 xen/arch/arm/include/asm/mm.h | 17 +++++++++++++++++
 xen/common/domain.c           |  4 ++++
 xen/include/xen/sched.h       |  6 ++++++
 3 files changed, 27 insertions(+)

diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
index 424aaf2823..a2dde01cfa 100644
--- a/xen/arch/arm/include/asm/mm.h
+++ b/xen/arch/arm/include/asm/mm.h
@@ -358,6 +358,23 @@ void clear_and_clean_page(struct page_info *page);
 
 unsigned int arch_get_dma_bitsize(void);
 
+/*
+ * Put free pages on the resv page list after having taken them
+ * off the "normal" page list, when pages from static memory
+ */
+#ifdef CONFIG_STATIC_MEMORY
+#define arch_free_heap_page(d, pg) {                    \
+    if ( (pg)->count_info & PGC_reserved )              \
+    {                                                   \
+        page_list_del(pg, page_to_list(d, pg));         \
+        page_list_add_tail(pg, &(d)->resv_page_list);   \
+        (d)->resv_pages++;                              \
+    }                                                   \
+    else                                                \
+        page_list_del(pg, page_to_list(d, pg));         \
+}
+#endif
+
 #endif /*  __ARCH_ARM_MM__ */
 /*
  * Local variables:
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 859cc13d3b..b499cf8d2c 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -605,6 +605,10 @@ struct domain *domain_create(domid_t domid,
     INIT_PAGE_LIST_HEAD(&d->page_list);
     INIT_PAGE_LIST_HEAD(&d->extra_page_list);
     INIT_PAGE_LIST_HEAD(&d->xenpage_list);
+#ifdef CONFIG_STATIC_MEMORY
+    INIT_PAGE_LIST_HEAD(&d->resv_page_list);
+#endif
+
 
     spin_lock_init(&d->node_affinity_lock);
     d->node_affinity = NODE_MASK_ALL;
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 68eb08058e..85ef378752 100644
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
@@ -395,6 +398,9 @@ struct domain
 #ifdef CONFIG_MEM_PAGING
     atomic_t         paged_pages;       /* paged-out pages */
 #endif
+#ifdef CONFIG_STATIC_MEMORY
+    unsigned int     resv_pages;        /* reserved pages from static region. */
+#endif
 
     /* Scheduling. */
     void            *sched_priv;    /* scheduler-specific data */
-- 
2.25.1


