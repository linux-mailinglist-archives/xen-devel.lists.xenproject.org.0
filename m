Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A404D5B64
	for <lists+xen-devel@lfdr.de>; Fri, 11 Mar 2022 07:13:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.288711.489687 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSYW0-0000aJ-FK; Fri, 11 Mar 2022 06:12:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 288711.489687; Fri, 11 Mar 2022 06:12:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSYW0-0000XP-Aj; Fri, 11 Mar 2022 06:12:40 +0000
Received: by outflank-mailman (input) for mailman id 288711;
 Fri, 11 Mar 2022 06:12:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p7td=TW=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1nSYVy-0000Fh-7Q
 for xen-devel@lists.xenproject.org; Fri, 11 Mar 2022 06:12:38 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0607.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::607])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3fa8371d-a102-11ec-8eba-a37418f5ba1a;
 Fri, 11 Mar 2022 07:12:37 +0100 (CET)
Received: from DB9PR06CA0014.eurprd06.prod.outlook.com (2603:10a6:10:1db::19)
 by AM8PR08MB6545.eurprd08.prod.outlook.com (2603:10a6:20b:368::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Fri, 11 Mar
 2022 06:12:35 +0000
Received: from DB5EUR03FT064.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1db:cafe::d) by DB9PR06CA0014.outlook.office365.com
 (2603:10a6:10:1db::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.22 via Frontend
 Transport; Fri, 11 Mar 2022 06:12:35 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT064.mail.protection.outlook.com (10.152.21.199) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5061.22 via Frontend Transport; Fri, 11 Mar 2022 06:12:34 +0000
Received: ("Tessian outbound 31aeb3346a45:v113");
 Fri, 11 Mar 2022 06:12:34 +0000
Received: from f51cbd4cabcd.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 451891ED-868A-47FA-B37C-DD139D17B140.1; 
 Fri, 11 Mar 2022 06:12:27 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id f51cbd4cabcd.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Fri, 11 Mar 2022 06:12:27 +0000
Received: from AM6P193CA0100.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:88::41)
 by VI1PR08MB3533.eurprd08.prod.outlook.com (2603:10a6:803:84::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.16; Fri, 11 Mar
 2022 06:12:25 +0000
Received: from AM5EUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:88:cafe::34) by AM6P193CA0100.outlook.office365.com
 (2603:10a6:209:88::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.20 via Frontend
 Transport; Fri, 11 Mar 2022 06:12:25 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT021.mail.protection.outlook.com (10.152.16.105) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5061.22 via Frontend Transport; Fri, 11 Mar 2022 06:12:25 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.27; Fri, 11 Mar
 2022 06:12:21 +0000
Received: from a011292.shanghai.arm.com (10.169.190.94) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.27 via Frontend
 Transport; Fri, 11 Mar 2022 06:12:19 +0000
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
X-Inumbo-ID: 3fa8371d-a102-11ec-8eba-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6aEzTY0gaHMjQiSKvKT0k3TGTcpG97yqj0yEvdhiK8g=;
 b=cKCTShhTjRm4L6NeW2sDcWp8QTAraL/IiRUWGeIWkiNBIQXllmkJ0w1OJQg6kEH4ZMQxu4s43zSyGYVVQJY+5oMU/b69c0693ITcEid0QHvwHcK1BmOANsrDFG6XnB8EWP1WUUsrFr8S4P9AG5kVLMctTwkO962dgNvi3vPXeGQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 315f15bcb692ff6d
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O0O/fDEOT+ohxNpGx+e9A4Ok9MonqvvjUxtDEYbEB4gMEz0rXKlZoDpCr3CT2qbDixsI8oC6eZWrzjM6imYkp/dWYf6wfX3l2UY78zGHT1kwMApESI5wI7SLfgv8HyRmGX4TzOXW4JGb7iI9BR1xl9I/f72VjnHXjfrRqEyVZ9CdDn1aO1Up70ZvDcMn7x54juMm6mz+rjUZ3rQ+4xnuho+G4aZF+LKnoYWTAT/Loi2Ei0FDN66dk1ZPSeutogC7y8CcGpcSuBfLB6VAeYSQ8gWO0ZbLp1WNcNZHUjkS54fV2Edat4hmwwduPJ7a63XyFVSMgP4J+xuSGg6eWVeTlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6aEzTY0gaHMjQiSKvKT0k3TGTcpG97yqj0yEvdhiK8g=;
 b=HIQWdE76JSyEuz974EBLEy0YR6SEmcCZbuze2cjEMHAqDTPb8qO0s6Za/Lq5NgqJUnvPjQ2f2oeuDc6CQYHZwGV8zReRswxQ5WBDqnm3FTtrKlmgNIi8Ig6FEWfIGEE7ejh/awzxVFDI4LlmV82YqJ6C6fFmVNbBuoYTOMZwlyWewkalyWzOofFFjHRqY00qtzBuYNlVYydchIY5BTiipsqSloS5esgAwl6vPesZTQgXcFlGcMAW4qT2nLhcuSVm3bCkusaWPmfvXDKzrcbfjAJN9ZeO11z3Mabm14qoLZnTdZ7kgS0YTS9w+NT5CqZp0MjFGlnWdnAjjsCDpe81Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6aEzTY0gaHMjQiSKvKT0k3TGTcpG97yqj0yEvdhiK8g=;
 b=cKCTShhTjRm4L6NeW2sDcWp8QTAraL/IiRUWGeIWkiNBIQXllmkJ0w1OJQg6kEH4ZMQxu4s43zSyGYVVQJY+5oMU/b69c0693ITcEid0QHvwHcK1BmOANsrDFG6XnB8EWP1WUUsrFr8S4P9AG5kVLMctTwkO962dgNvi3vPXeGQ=
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
Subject: [PATCH v1 04/13] xen/arm: add P2M type parameter in guest_physmap_add_pages
Date: Fri, 11 Mar 2022 14:11:14 +0800
Message-ID: <20220311061123.1883189-5-Penny.Zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220311061123.1883189-1-Penny.Zheng@arm.com>
References: <20220311061123.1883189-1-Penny.Zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 9f78ee7a-cd3b-403e-bb11-08da0326226c
X-MS-TrafficTypeDiagnostic:
	VI1PR08MB3533:EE_|DB5EUR03FT064:EE_|AM8PR08MB6545:EE_
X-Microsoft-Antispam-PRVS:
	<AM8PR08MB6545669552C5C8FE18ED3027F70C9@AM8PR08MB6545.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 vFMZkg8duRlCN/nAZqSeeN4hD1KwoOPcf91HUb6YDarLEYwVgKoV/DFluh6QGndX9HH3RCQ5l3Ca1rVWGvM1AIBiXkym/jIGWv5soZsOu5DWUG+Ga+3eVxuyg69Sa2N1E1NpiErbn2aggMSTV5NSm8SBVFYvqwD893X3mLDQdJf7cChM8PpACFR/I1T/1ZD592FfSud+jn+CHdBp5eKu98NmhIDLGMqx41gqVw3zQYCZmXU6v1RLkRf1bi3QCqhFCvNOOpBvyvVAwbYhE7IOIaLv3M55q17qfUFB246aunHKMyHXUKlIPF5j9hoIFESHN2WAWMkIS3Cf7TwCT1hdZXYQhfwFPb4TcckfjWZoRu7Ofa7RqK/RflRasU3p20RFJ91wBFVg+bK1LhfdkUZZ5gWN55uCWZ7vQgmp0Tii3YOPTD8bvNbCzcbbWlRl80/vg4HbjebE05N0ZizPS/+SG8Pi8PlwCG2MLcq+2di+UJZOhIYFod6TB3xaH+USS2TYJcMu/FoF6vWEtnba/K2qCSaEsKMOVnveDzGdMSCCkRPKmU5JVP0iEQglSEr74MjWPCc3+Kug4pR7UTQe6CSvlBWo6Pz1q/Ir9KuI2ZPo5RkEkuQ9VMLy6aSYAlk+jq1lI/giFQn5q0aVIKMTpewisB6hQ4SEwE357X1vwEDp259tbvMraoIRU/TSkzhhBvuMngoiPh2xVMIrT/xy2mL66g==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(508600001)(336012)(186003)(426003)(1076003)(26005)(2616005)(86362001)(82310400004)(7696005)(6666004)(5660300002)(54906003)(316002)(6916009)(4326008)(70206006)(70586007)(40460700003)(8676002)(81166007)(83380400001)(36756003)(356005)(8936002)(2906002)(36860700001)(47076005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3533
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7f5cbd13-1e96-4283-5542-08da03261cea
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rY7nI8NIP764s0bItiGCSIveTj/p23vh81wfv9On73eTCkUvsZ6zdD64oWDI2nEj7xXAVauQy2ff7CAXBxf9Z+TfA7RK5Lc2zxC80fnNp1CpRbYMoE8ZlAEBEob3hLP7Y1FHmhxbcSVBGh2jBRGR+pAkMkHDnWabbs9kYDrSrU6YkcKr9HD1BTeZYpgc0hkVO29NsdF/L3Eu5TQDK7xP66ti2PdbdIvH8bHdslVaTxarNOdPcq5PUBCzcsmNHNqZVgTWvOVncX5pRcEohh+Povi4df0jMTvVW6nu55ZhokwWW5lKfbzkq6PFwnLsmUIcKsoOZJ8LfzJh08RcepSVi4bwWkpyUE+SKin/Xaysc+chr1Mu4fjp4//PBRlNxP4v76JQX5sNXutPQm53ckb0U+69zZ/scWu7WSA43ytxvSy/y42e0ZZDKdfEaBxrFJmNgTz5EXdIqC/wS015AfUe7zeVqIAuoFi2rK5+sndSQ6XLyhyAwAg7Wti53WLfeNTUyJbVhHyNt5wMp0W9Z5e3NiYzblMaCMh5aRI/BImlFFf9shIVtb1ek6G8z4tRUiqEpBSkHrvx6aUR+T60H4VDKGH5ChcZxbgNFyn1fPELei4ktfx3wL1KE6ZIxyN0Y9vyFZRZuK6Bs9ufddT4lrMmNlmkyUvzR1NKCWx0AOFYEihEuzDfb4VGnmhStM+y3Vej
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(336012)(426003)(508600001)(83380400001)(40460700003)(186003)(1076003)(26005)(2906002)(2616005)(107886003)(36756003)(36860700001)(47076005)(7696005)(82310400004)(6666004)(81166007)(5660300002)(70586007)(70206006)(8936002)(316002)(54906003)(4326008)(86362001)(8676002)(6916009);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2022 06:12:34.7381
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f78ee7a-cd3b-403e-bb11-08da0326226c
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT064.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR08MB6545

From: Penny Zheng <penny.zheng@arm.com>

In order to cover the scenario where users intend to set up guest
p2m foreign mapping with nr_pages, this commit adds a new P2M type
parameter in guest_physmap_add_pages.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
 xen/arch/arm/domain_build.c    | 5 +++--
 xen/arch/arm/include/asm/p2m.h | 5 +++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 6e6349caac..984e70e5fc 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -507,7 +507,7 @@ static bool __init append_static_memory_to_bank(struct domain *d,
     else
         sgfn = gaddr_to_gfn(mfn_to_maddr(smfn));
 
-    res = guest_physmap_add_pages(d, sgfn, smfn, nr_pages);
+    res = guest_physmap_add_pages(d, sgfn, smfn, nr_pages, p2m_ram_rw);
     if ( res )
     {
         dprintk(XENLOG_ERR, "Failed to map pages to DOMU: %d", res);
@@ -787,7 +787,8 @@ static int __init allocate_shared_memory(struct domain *d,
     if ( mfn_eq(smfn, INVALID_MFN) )
         return -EINVAL;
 
-    ret = guest_physmap_add_pages(d, gaddr_to_gfn(gbase), smfn, PFN_DOWN(psize));
+    ret = guest_physmap_add_pages(d, gaddr_to_gfn(gbase), smfn, PFN_DOWN(psize),
+                                  p2m_ram_rw);
     if ( ret )
     {
         dprintk(XENLOG_ERR, "Failed to map shared memory to %pd.\n", d);
diff --git a/xen/arch/arm/include/asm/p2m.h b/xen/arch/arm/include/asm/p2m.h
index 8cce459b67..58590145b0 100644
--- a/xen/arch/arm/include/asm/p2m.h
+++ b/xen/arch/arm/include/asm/p2m.h
@@ -317,9 +317,10 @@ guest_physmap_add_page(struct domain *d, gfn_t gfn, mfn_t mfn,
 static inline int guest_physmap_add_pages(struct domain *d,
                                           gfn_t gfn,
                                           mfn_t mfn,
-                                          unsigned int nr_pages)
+                                          unsigned int nr_pages,
+                                          p2m_type_t t)
 {
-    return p2m_insert_mapping(d, gfn, nr_pages, mfn, p2m_ram_rw);
+    return p2m_insert_mapping(d, gfn, nr_pages, mfn, t);
 }
 
 mfn_t gfn_to_mfn(struct domain *d, gfn_t gfn);
-- 
2.25.1


