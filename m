Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3676B2A9D
	for <lists+xen-devel@lfdr.de>; Thu,  9 Mar 2023 17:20:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.508329.782934 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paJ00-0005xu-WB; Thu, 09 Mar 2023 16:20:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 508329.782934; Thu, 09 Mar 2023 16:20:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1paJ00-0005uQ-Qx; Thu, 09 Mar 2023 16:20:12 +0000
Received: by outflank-mailman (input) for mailman id 508329;
 Thu, 09 Mar 2023 16:20:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xaV7=7B=oss.nxp.com=andrei.cherechesu@srs-se1.protection.inumbo.net>)
 id 1paIzy-0005sx-TI
 for xen-devel@lists.xenproject.org; Thu, 09 Mar 2023 16:20:10 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on20609.outbound.protection.outlook.com
 [2a01:111:f400:7d00::609])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 41b99e2a-be96-11ed-956e-85ef70e17bfa;
 Thu, 09 Mar 2023 17:20:08 +0100 (CET)
Received: from VI1PR04MB5056.eurprd04.prod.outlook.com (2603:10a6:803:5a::13)
 by PA4PR04MB7870.eurprd04.prod.outlook.com (2603:10a6:102:b8::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.18; Thu, 9 Mar
 2023 16:20:05 +0000
Received: from VI1PR04MB5056.eurprd04.prod.outlook.com
 ([fe80::f883:bd6d:18d4:c487]) by VI1PR04MB5056.eurprd04.prod.outlook.com
 ([fe80::f883:bd6d:18d4:c487%4]) with mapi id 15.20.6178.019; Thu, 9 Mar 2023
 16:20:05 +0000
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
X-Inumbo-ID: 41b99e2a-be96-11ed-956e-85ef70e17bfa
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HrZOoXEUpeadc+MxdpPX4i0S2VlCzv1WaC0ehIXykYrlRXMqNtiN6A7PAHXSc5Kj5Zjfxjpk3IcU48DpaoT4Rh/WIm7KL5649ezEGfH2ljZhPP/Sh+ilHflVpLvYpdzZGHz8wahz5qgj5s2Qt6njMkHiuYXYbCTg9bICcznLiXrRc2j2viSiKrftsKPGJ5K0IAQ3J17f7DpRSizc1v3aTDlLGYQ8pB/JN5r9uFF5Ccj+gmoPEHNfXjE9mzQSbNxRFPDFNN3SKyTnoHdy8XPGlBVFSzbtpMLQMosAXGnKkHUkEDskE9YcKHLTb1IZM4us0gK2ErgQc9u1csG7O9fTaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=33kYFep1zFWkBTd1y0DHwVF7+6Ut2vL8LuyGt2ggwL0=;
 b=nq9eWlQcnrti/AlvRsuYOZj3qfroZwE7Jc03Z9UMPDQeJxgwEGjTVnXVF7X72nbPNcOUIpKhn3M3LA3w9T54Ed7behGUa4pgDkMATZTxthrD6AZEi7lameCKvIl0iQVjtPoJdrzaEFjxGG62mxuVqROyq47YQjKk6U7cfWRdxxYA9LQzoEmuQ1DtReThYo1321VSs65XjZvozR7Elm/Wr38C/rz9M/mjVODDT9dOxg1Tn3mbfeR2g7VMiiYpVYuv/kKmbSFQ0omPj1qZf5Z8Rc5lJW7JQOZz7rQUxqEqO/RyhG/n3aEevxkkban9AfiVr3XGeqHRSjmMrfSFZ+mOXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=33kYFep1zFWkBTd1y0DHwVF7+6Ut2vL8LuyGt2ggwL0=;
 b=BXGh9WPqMwF4EQCZ3avYRg6UeI1fpkwaWdG35VKFmgY5rsrhsp18C7mbHWg3qDVGqmFvZVrecTXuo21uzKN0V2wsMm4+FtJ8SeeQp7O6mnFtG60/G6C4uBCMKdpgMSOI1abwjUXhsXa/YpHbW33vv7zvfuMSS3laZlC/0MTEAuQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
From: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>
To: xen-devel@lists.xenproject.org
Cc: Bertrand.Marquis@arm.com,
	sstabellini@kernel.org,
	julien@xen.org,
	Volodymyr_Babchuk@epam.com,
	rahul.singh@arm.com,
	Andrei Cherechesu <andrei.cherechesu@nxp.com>
Subject: [PATCH v2 2/2] arch/arm: time: Add support for parsing interrupts by names
Date: Thu,  9 Mar 2023 18:19:33 +0200
Message-Id: <20230309161933.1336367-3-andrei.cherechesu@oss.nxp.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230309161933.1336367-1-andrei.cherechesu@oss.nxp.com>
References: <20230309161933.1336367-1-andrei.cherechesu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR02CA0138.eurprd02.prod.outlook.com
 (2603:10a6:20b:28c::35) To VI1PR04MB5056.eurprd04.prod.outlook.com
 (2603:10a6:803:5a::13)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB5056:EE_|PA4PR04MB7870:EE_
X-MS-Office365-Filtering-Correlation-Id: 633a262b-1374-4a29-6788-08db20ba2486
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	i8qal8hsbQTb1ri1eDCbhOrjpVfjqd7pY8YEow8lUywo2uUNpOR3GON67UwycPHCvM7DlLovc3GfEmcB4iC6Mh0q3OxxYw+JOExOt2oINjgmDDUj5n0O9zu3ZSYWL7SqzVj2dYP8M7NWDQA0j4/hka6IXx9ZxRpTChDdt5glnIxC4qhEVXRfnLY2gzcifH1vkCvFgGA3ennnYJ/+k8X02V9XIVVwOxaYb26wCXYo6O4UwNK9BQv/Q1EToX540sWr8GxIXDB01z+CoKP1MgYyhcJVo4DUl3YR8VMhWx7sbWEHxOqEI+y5vtALJOAsSjyBxPjztLY2QzmkKLXaAsa2h7jAs6Xp8QyZpMcXfY/EYiRi+owqBPt2bAI/fXdlMPzCyNrNQl799eus6ArBN3iTjDIek2g1CegMbmLhJKRa52STAMXqRp8pho5jEY6Befwe3lXZe0rrx11cGkWgkPl9CUsumqnDKVvqRPhfPKOwbQftJNbYrBHDT73EhEfh9xNptcFyPkM4h/8eBVF1eTPuGcHqWHQbx/p+999nRRSmdYQg1obkvsdmh9C019zt1SfAVUegjBD1UZaFw6SZRgccAr/+a/jot1AEJCp52zi41ckqj0vgIr+rbM3U6bc0YVotnBb2qp7jWdTH/5E1BM9EKLr7GiJNu6hdvaqkFy8OWUSqLAf3v9kRBFGjDD2fK55P
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB5056.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(366004)(376002)(136003)(346002)(39860400002)(451199018)(8936002)(5660300002)(26005)(1076003)(6506007)(38350700002)(6666004)(38100700002)(83380400001)(186003)(2616005)(66476007)(86362001)(41300700001)(316002)(6916009)(4326008)(66556008)(66946007)(6486002)(6512007)(478600001)(52116002)(8676002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VLTehb24milUjHAjuohJWcwntfwxVHTp6RffmP4/UPAEJ5imhXHuDLkVaCBp?=
 =?us-ascii?Q?1t5Yp0rdLl1bUBQFbGlrj+tpqzy7QMUs5tXmP0lmDqiklxon6zHdH6i/T8ky?=
 =?us-ascii?Q?9iRnSJ6pVG9BocCT3kpbxWrKoXnpfOapxL8f3AWt/diaCIeHVwzbb6oqS2+C?=
 =?us-ascii?Q?xRsPi8Sm61ODU1EvLu0yke0/cy921aeQOHfWp6/iDc05LS8s52Fv3Tf08r7i?=
 =?us-ascii?Q?bB1Dsv+6k1SL2S5UriRQDWltTrR/lkR29Pmx+tVcMZ7ArZVoQFq+ucG8/cui?=
 =?us-ascii?Q?DqqYzsIqcKBgEizOO5fH/yKerflKLjqOfcV/q6mwGYEq3YUAZEDZhfbk58/s?=
 =?us-ascii?Q?50dI41SuHh6m/ieyAedXWLBwilAW+HsN2nsA2R/VurmZSPkWPNoczVAD86Hp?=
 =?us-ascii?Q?cbMEIU4MqcDDbIHDgKlksLI+xz+eM7CYJ4e/DbFNbqgJeKpKVYxonvFMii8V?=
 =?us-ascii?Q?bZai6DqUMoTr7HKr2Yo10nvaZ4fQrYhfZ1m0TV7thxRZs6pqu3EtELGJpVjg?=
 =?us-ascii?Q?+hpEJ5m7VU7GrzzeA7rbW8F4CvSxL52vk5/DrxKU86L7IDtIq009FndbcWoV?=
 =?us-ascii?Q?eqSY2roTbW11onzDxn8iS9EHYPMUPgwAio7M9t/A2O8861RnBp7g/06k5oLG?=
 =?us-ascii?Q?W8VEaYhc64Pq+YdjgEWXBTkChwWWooQzQ4/b1WSuM1ziQuu4/SbvOtRCRpWa?=
 =?us-ascii?Q?/Gz+6k7ltxyWVnJ3vE3hl/BOB9SDJxb3w15pwGM9uDCoesVg1oCbkUYwVtNe?=
 =?us-ascii?Q?HOcV6X0v8yV5Qn0uyYQbVtdu24oY3SQSVAhX2aqnPpXTze3Pq4AQXNEQatkj?=
 =?us-ascii?Q?lyLtTrDdcmPqE6YIoYsamk2b2/jysdu8t380rOrY+0+3s/gl57bPVCJHzDmS?=
 =?us-ascii?Q?ME1O1Jun2RL6fgKBYujF65VBmMxHhiYL+X4cBRLvOmI7u/tNCkRPJR3KbVYD?=
 =?us-ascii?Q?jgz+21u1UuL/TC0muEZu21RI9+EjCxgbrebg0lbYlJ6rGe4pjaPyIzpl++M0?=
 =?us-ascii?Q?10Na2QeTE+tSzzmrQOrDAdaDZFq/gBtM3udQHAZ5HDl1DpsewTMESCgIAQqM?=
 =?us-ascii?Q?a49iHuYwQq3UjUGKSweDmdYcgBWf85WXmhn1XpChSE1VZ7XWYtdTx2eCczkw?=
 =?us-ascii?Q?DE3dnLrKTAr1Ws4BKak6b051upGVdJGN0QlfBp7YXWJuPDx2IVzzV3GR8p48?=
 =?us-ascii?Q?oFeKEYPbHSdkx0mdyzJYkNy7JPVukJZW4Q7Q2D1mATCQFJxl/I+NI0cfOlLo?=
 =?us-ascii?Q?hPFw+T/ucobLvnC3nFQZOmJW2BmFFhcMQtZhA6Oave5qTMsBVxdg6zV8Tkxh?=
 =?us-ascii?Q?GoOT5tSXKLqRDP+S5SVDuflbU+rR7OguaRnQonWOmji8yUA3DpN/roM8qDNu?=
 =?us-ascii?Q?qB84YhIMy3GsXU8RNLwSY7pPOFG8CqhQhcZlscrw1LfxedPPK+fQ0KwywK8x?=
 =?us-ascii?Q?JUQzG+h6r3x7yuZPQHvnG8DlluGgDBvGi08zZ1E15xaUkoehLif46MPZRwtD?=
 =?us-ascii?Q?6s9b6odY5odj7xFAivg89I5iA1RQxsGU0EhyG8auiIA/lSYVmi7TJD8QFYtP?=
 =?us-ascii?Q?QDLs/EJ/EChpEpOBJlNlisvpE0CQJePmP7wtztJ6tyMmDWXLnN45fz46/8JJ?=
 =?us-ascii?Q?Zg=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 633a262b-1374-4a29-6788-08db20ba2486
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB5056.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2023 16:20:05.3257
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +rh7lOoQndVzbgpYOnQqUM1lcpM3YcRKhujF7pPha1SzRJheRKKl72wpjTGgfkzOjysyhANeVY0q2g6xUCqrDRgYaKgz8gPxoVy0LsLMosg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7870

From: Andrei Cherechesu <andrei.cherechesu@nxp.com>

Added support for parsing the ARM generic timer interrupts DT
node by the "interrupt-names" property, if it is available.

If not available, the usual parsing based on the expected
IRQ order is performed.

Also changed to treating returning 0 as an error case for the
platform_get_irq() calls, since it is not a valid PPI ID and
treating it as a valid case would only cause Xen to BUG() later,
during vgic_reserve_virq().

Added the "hyp-virt" PPI to the timer PPI list, even
though it's currently not in use. If the "hyp-virt" PPI is
not found, the hypervisor won't panic.

Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>
---
 xen/arch/arm/include/asm/time.h |  3 ++-
 xen/arch/arm/time.c             | 27 +++++++++++++++++++++++----
 2 files changed, 25 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/include/asm/time.h b/xen/arch/arm/include/asm/time.h
index 4b401c1110..49ad8c1a6d 100644
--- a/xen/arch/arm/include/asm/time.h
+++ b/xen/arch/arm/include/asm/time.h
@@ -82,7 +82,8 @@ enum timer_ppi
     TIMER_PHYS_NONSECURE_PPI = 1,
     TIMER_VIRT_PPI = 2,
     TIMER_HYP_PPI = 3,
-    MAX_TIMER_PPI = 4,
+    TIMER_HYP_VIRT_PPI = 4,
+    MAX_TIMER_PPI = 5,
 };
 
 /*
diff --git a/xen/arch/arm/time.c b/xen/arch/arm/time.c
index 433d7be909..868e03ecf6 100644
--- a/xen/arch/arm/time.c
+++ b/xen/arch/arm/time.c
@@ -38,6 +38,14 @@ uint32_t __read_mostly timer_dt_clock_frequency;
 
 static unsigned int timer_irq[MAX_TIMER_PPI];
 
+static const char *timer_irq_names[MAX_TIMER_PPI] = {
+    [TIMER_PHYS_SECURE_PPI] = "sec-phys",
+    [TIMER_PHYS_NONSECURE_PPI] = "phys",
+    [TIMER_VIRT_PPI] = "virt",
+    [TIMER_HYP_PPI] = "hyp-phys",
+    [TIMER_HYP_VIRT_PPI] = "hyp-virt",
+};
+
 unsigned int timer_get_irq(enum timer_ppi ppi)
 {
     ASSERT(ppi >= TIMER_PHYS_SECURE_PPI && ppi < MAX_TIMER_PPI);
@@ -149,15 +157,26 @@ static void __init init_dt_xen_time(void)
 {
     int res;
     unsigned int i;
+    bool has_names;
+
+    has_names = dt_property_read_bool(timer, "interrupt-names");
 
     /* Retrieve all IRQs for the timer */
     for ( i = TIMER_PHYS_SECURE_PPI; i < MAX_TIMER_PPI; i++ )
     {
-        res = platform_get_irq(timer, i);
-
-        if ( res < 0 )
+        if ( has_names )
+            res = platform_get_irq_byname(timer, timer_irq_names[i]);
+        else
+            res = platform_get_irq(timer, i);
+
+        if ( res > 0 )
+            timer_irq[i] = res;
+        /*
+         * Do not panic if "hyp-virt" PPI is not found, since it's not
+         * currently used.
+         */
+        else if ( i != TIMER_HYP_VIRT_PPI )
             panic("Timer: Unable to retrieve IRQ %u from the device tree\n", i);
-        timer_irq[i] = res;
     }
 }
 
-- 
2.35.1


