Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D47147A446
	for <lists+xen-devel@lfdr.de>; Mon, 20 Dec 2021 06:22:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.249412.429895 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzB7l-0001jN-9d; Mon, 20 Dec 2021 05:22:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 249412.429895; Mon, 20 Dec 2021 05:22:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzB7l-0001ex-2f; Mon, 20 Dec 2021 05:22:13 +0000
Received: by outflank-mailman (input) for mailman id 249412;
 Mon, 20 Dec 2021 05:22:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ajqg=RF=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1mzB7j-0007eG-38
 for xen-devel@lists.xenproject.org; Mon, 20 Dec 2021 05:22:11 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 (mail-ve1eur03on0625.outbound.protection.outlook.com
 [2a01:111:f400:fe09::625])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c78408e1-6154-11ec-9e60-abaf8a552007;
 Mon, 20 Dec 2021 06:22:10 +0100 (CET)
Received: from DB6PR0601CA0018.eurprd06.prod.outlook.com (2603:10a6:4:7b::28)
 by DBAPR08MB5831.eurprd08.prod.outlook.com (2603:10a6:10:1a8::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.20; Mon, 20 Dec
 2021 05:22:07 +0000
Received: from DB5EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:7b:cafe::44) by DB6PR0601CA0018.outlook.office365.com
 (2603:10a6:4:7b::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17 via Frontend
 Transport; Mon, 20 Dec 2021 05:22:07 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT013.mail.protection.outlook.com (10.152.20.105) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4801.14 via Frontend Transport; Mon, 20 Dec 2021 05:22:07 +0000
Received: ("Tessian outbound 9a8c656e7c94:v110");
 Mon, 20 Dec 2021 05:22:07 +0000
Received: from b30482bb96e9.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E845E1C8-1905-4984-88DF-C32639B7C62A.1; 
 Mon, 20 Dec 2021 05:22:01 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b30482bb96e9.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 20 Dec 2021 05:22:01 +0000
Received: from DB6P193CA0024.EURP193.PROD.OUTLOOK.COM (2603:10a6:6:29::34) by
 AM0PR08MB3201.eurprd08.prod.outlook.com (2603:10a6:208:59::27) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4801.17; Mon, 20 Dec 2021 05:21:59 +0000
Received: from DB5EUR03FT051.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:29:cafe::a1) by DB6P193CA0024.outlook.office365.com
 (2603:10a6:6:29::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14 via Frontend
 Transport; Mon, 20 Dec 2021 05:21:59 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT051.mail.protection.outlook.com (10.152.21.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4801.14 via Frontend Transport; Mon, 20 Dec 2021 05:21:59 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Mon, 20 Dec
 2021 05:21:58 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.20; Mon, 20
 Dec 2021 05:21:58 +0000
Received: from penny.shanghai.arm.com (10.169.188.91) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.20 via Frontend
 Transport; Mon, 20 Dec 2021 05:21:56 +0000
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
X-Inumbo-ID: c78408e1-6154-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yu1JL9lQaWyoBKQlyQJnoC/QTGNH9xLBeVUjcOwrfBE=;
 b=hRS/6WzX2PBVakxrUpxlSrHDO1D6zMjVRLm6/hTk+pEGSLBGazlNiQ3GKqSqIkX0TNhSLKTIcIOPj+GBhXZ5hn650DA5rkqdIXMlMDumqoWFgKceLtZINltmbx/MrsMKfKmwO9kkATEHE35+4lpjm5Pk+Mcb22QEA8zpAxSagzY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 7015131ac0f81868
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RrPIdh7AfTolG0Z9aTUHfMVXjwwQ2G+RrbxkKt9+qxYy8qD6VOTu5KYjq5o/BSob8s+HKFwHEignsAL2iyDWj4y65xMLKGztf5IajSQDwvER+1BkdYg81TPGV6hxfaOKDCVTVZcKEPJu8DnZuylK4d13ZlKJRMbPWQGkZEuCz+clLJbr0BMEDojwkP7XX/zNclZL/ElJ8Po0IT08Asuxl8SG3/6xWZeFTkgzHIx6Gjss9ZfPdMfnpYs0nVongIdqu3s4hHA2NgMJqU5xRCg9PiBC6rI9WcuxMR0siTOnvVfqUezCLeziTLc+pm4hPCBAg1jVjLsuIiLLFiZ+ylDH2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yu1JL9lQaWyoBKQlyQJnoC/QTGNH9xLBeVUjcOwrfBE=;
 b=iP4tKC3WD/86gG0DBPAeWftXgdJe4FGl7bwGDXVA5x7z0TcVkGJLtTg/sdGH/XribEF7lrczauvW+8KHEduRDRyISQOEQB79kQzpaqjEtLFwHE+BaCtfrlEjZipnnumfVcNklhkhYjJcSQ1anLMkUqK0oitUK/Odm9gJJA7p1Oqak8w14E5fH6ewYr6Kbgq5m0dt+uxvA6p97xa52a72izGq2+1x1aeh0sShWu1Mq6vilYu/q3ynEgvbjJgYlSL8B1fmbv2AMzbAl02HG2IajFcoB1Pqb9nn86bHnYWczsQNfsm8t5I4mN69ryjzUxfeu7DeaG2PwhmYjLLEfG7SkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yu1JL9lQaWyoBKQlyQJnoC/QTGNH9xLBeVUjcOwrfBE=;
 b=hRS/6WzX2PBVakxrUpxlSrHDO1D6zMjVRLm6/hTk+pEGSLBGazlNiQ3GKqSqIkX0TNhSLKTIcIOPj+GBhXZ5hn650DA5rkqdIXMlMDumqoWFgKceLtZINltmbx/MrsMKfKmwO9kkATEHE35+4lpjm5Pk+Mcb22QEA8zpAxSagzY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Penny Zheng <penny.zheng@arm.com>
To: <xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>,
	<julien@xen.org>
CC: <Bertrand.Marquis@arm.com>, <Wei.Chen@arm.com>
Subject: [PATCH v4 09/11] xen/arm: if direct-map domain use native addresses for GICv3
Date: Mon, 20 Dec 2021 05:21:21 +0000
Message-ID: <20211220052123.969876-10-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211220052123.969876-1-penny.zheng@arm.com>
References: <20211220052123.969876-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: fe50a42e-41a9-4512-52cd-08d9c378aacd
X-MS-TrafficTypeDiagnostic:
	AM0PR08MB3201:EE_|DB5EUR03FT013:EE_|DBAPR08MB5831:EE_
X-Microsoft-Antispam-PRVS:
	<DBAPR08MB583183246AF428A4C86A7304F77B9@DBAPR08MB5831.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 /+9Aj73JQ4bd5Uop/CVWYPd7Gbvp0bTJM+SvUIow1pwVDQLClxnboo/d2gtdLx9IBD+vELazK0SuhgvCVwHW8I4oB8Lvwd4dssmSpFhhmxancKQiyL72n8os5hrov2BlsOa/PK0VY/nSA2O15MycEWPOR/uxPmk9VIeibSY0jGI/tPvQpxugjA/brY886GEkCdRslCiz8FITsbNi7UYxrSctJQXBxtU9FRQTwMpaIduxY8wiJguiVtEB046AyIeHpZpT+7rXw+P9zv5GLz6vwRzxueu5VEqm7apkx4Pzma6HL4239dBq3kJBVwWVYkdNSpJMQ+NYTzDt6iy0gS2VQSF0HlXLbCMVZ6rvPHUE04J74Yy8/doCQjcqaYuolpw3zpEN+QDLCqRQbeZHW/ray+reKHMm7R5acEbenqYs+WW0vdWV4rrKzW3NxXcE5PLUpnKUfwgeckzU4Dbs7uTtymWnmiTb4vwgIY0uAqeQ8Ez5pEgl4toCkrMFouEcjfJBPXJVJtJBE3XJwsRkC6FobM8cUtjKw4ctdYQpmWJLdQDo9vUWwflgh0OFAAQKFirxwazYc9uA7H8TTnQCp/HrBa1d4naPGPmeNQYq6tRiTu2GoKIjNrC2JzJZgWfsq0rRFPQz9UGstr/RFtdd7B4bfU6keyu5oh0Znlf/MlfGLLK7WdFot2h/hTtw2YaB6yHG3b9IdINsTy0rbvj1CyEnSLn4xT8KD4w36SZ53xUxtgPec5xLs5ANyQD6hMlKcS+nKz50SWq8e3vx7N1fMafVi+JkgmY04oFqv4ZszET5n30=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(40470700001)(336012)(426003)(6666004)(70586007)(2616005)(1076003)(70206006)(44832011)(47076005)(36756003)(4326008)(36860700001)(5660300002)(356005)(81166007)(83380400001)(54906003)(82310400004)(8676002)(8936002)(40460700001)(86362001)(2906002)(110136005)(316002)(26005)(186003)(7696005)(508600001)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3201
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	dd95e688-21cc-4427-081d-08d9c378a5a3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	2e2Q2SuMNCZJLUl2Hjveyi3vdV98WD5fPV9ADelgq21FQ8rB8WDilwIlLNDsFuVCqhqwNdtSVI/7d6DQwDAB7aQqey76l4k4ucUyhwki/IygD9Cpv1G95RtP/OOYh5biC6E+ZUwVyVexe2NLGkGlh3c67k83CvbnQd9Iuo5yr5EYM4ZQ3nRYZBB5rLuiTWM5OyAKXr2rFlC6syzvkHSmD2yP/zhNZPFD8GK1b5z+HLyDDuYuHhq/CxYPksBEJ7zhPhRW4FgcfEQYfz+J/VjUMr6dYquif/16p8ZWWAU0MywQMYtN3cANPBD29Ip3qCrGZPHPjCWsPOyZNyecmw0hHExsJC3vLEKTNMtvCE6NrdOm64RqEp/DvVVQdjAUQRm7WdAHKL7ZcxKnOiC+VtTTJi7rHiL2EIUR26DdYHZcX7wdErEUkynGNcOJrsn58YvZ2MGv99pQ3GhAUjWd0n6EXWImxx0z+VVmeRSTPaqjFme+f5lGXAitFRL70b0ObUbsjE/Gl22r1Wjv1IAgX+ZzcY3/G6xtHwRZ8h+/nmsvOkWfQOdevqc2bF0DeYqpcYS1OlfpA8zf/SQelRx9ulTx19QSoDDmKM0yUlQReim8ZHFaIwNw0Ep5DoJ/6h7tRO2gW1Nf03GCKXEMPGFjRHhd5pIl1Y7W286MjoDMvLGD9fm2nmwoDVDx/snsmtkyuQgOTYmGpIrod4yaDi0ve6UzIQ==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(54906003)(83380400001)(86362001)(110136005)(81166007)(44832011)(82310400004)(8676002)(316002)(6666004)(70586007)(70206006)(508600001)(2906002)(186003)(36756003)(336012)(5660300002)(7696005)(26005)(47076005)(8936002)(2616005)(1076003)(36860700001)(4326008)(426003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2021 05:22:07.8554
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe50a42e-41a9-4512-52cd-08d9c378aacd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT013.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5831

From: Stefano Stabellini <stefano.stabellini@xilinx.com>

Today we use native addresses to map the GICv3 for Dom0 and fixed
addresses for DomUs.

This patch changes the behavior so that native addresses are used for
all domain which is using the host memory layout

Considering that DOM0 may not always be directly mapped in the future,
this patch introduces a new helper "domain_use_host_layout()" that
wraps both two check "is_domain_direct_mapped(d) || is_hardware_domain(d)"
for more flexible usage.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
v2 changes:
- remove redistributor accessor
- introduce new helper "is_domain_use_host_layout()"
- comment fix
---
v3 changes:
- the comment on top of 'buf' to explain how 38 was found
- fix res getting overwritten
- drop 'cells += (GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS)'
- free 'reg' right way
- fix comment
- rename 'is_domain_use_host_layout()' to 'domain_use_host_layout()'
---
v4 changes:
- refine comment
---
 xen/arch/arm/domain_build.c       | 34 +++++++++++++++++++++++--------
 xen/arch/arm/include/asm/domain.h | 14 +++++++++++++
 xen/arch/arm/vgic-v3.c            | 26 ++++++++++++-----------
 3 files changed, 54 insertions(+), 20 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 139d428524..9a7145b3ee 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2327,10 +2327,16 @@ static int __init make_gicv3_domU_node(struct kernel_info *kinfo)
 {
     void *fdt = kinfo->fdt;
     int res = 0;
-    __be32 reg[(GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS) * 2];
-    __be32 *cells;
+    __be32 *reg, *cells;
+    const struct domain *d = kinfo->d;
+    /* Placeholder for interrupt-controller@ + a 64-bit number + \0 */
+    char buf[38];
+    unsigned int i, len = 0;
+
+    snprintf(buf, sizeof(buf), "interrupt-controller@%"PRIx64,
+             vgic_dist_base(&d->arch.vgic));
 
-    res = fdt_begin_node(fdt, "interrupt-controller@"__stringify(GUEST_GICV3_GICD_BASE));
+    res = fdt_begin_node(fdt, buf);
     if ( res )
         return res;
 
@@ -2350,13 +2356,25 @@ static int __init make_gicv3_domU_node(struct kernel_info *kinfo)
     if ( res )
         return res;
 
-    cells = &reg[0];
-    dt_child_set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
-                       GUEST_GICV3_GICD_BASE, GUEST_GICV3_GICD_SIZE);
+    /* reg specifies all re-distributors and Distributor. */
+    len = (GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS) *
+          (d->arch.vgic.nr_regions + 1) * sizeof(__be32);
+    reg = xmalloc_bytes(len);
+    if ( reg == NULL )
+        return -ENOMEM;
+    cells = reg;
+
     dt_child_set_range(&cells, GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
-                       GUEST_GICV3_GICR0_BASE, GUEST_GICV3_GICR0_SIZE);
+                       vgic_dist_base(&d->arch.vgic), GUEST_GICV3_GICD_SIZE);
 
-    res = fdt_property(fdt, "reg", reg, sizeof(reg));
+    for ( i = 0; i < d->arch.vgic.nr_regions; i++)
+        dt_child_set_range(&cells,
+                           GUEST_ROOT_ADDRESS_CELLS, GUEST_ROOT_SIZE_CELLS,
+                           d->arch.vgic.rdist_regions[i].base,
+                           d->arch.vgic.rdist_regions[i].size);
+
+    res = fdt_property(fdt, "reg", reg, len);
+    xfree(reg);
     if (res)
         return res;
 
diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
index cb37ce89ec..848fec8a0f 100644
--- a/xen/arch/arm/include/asm/domain.h
+++ b/xen/arch/arm/include/asm/domain.h
@@ -31,6 +31,20 @@ enum domain_type {
 
 #define is_domain_direct_mapped(d) (d->arch.directmap)
 
+/*
+ * Is the domain using the host memory layout?
+ *
+ * Direct-mapped domain will always have the RAM mapped with GFN == MFN.
+ * To avoid any trouble finding space, it is easier to force using the
+ * host memory layout.
+ *
+ * The hardware domain will use the host layout regardless of
+ * direct-mapped because some OS may rely on a specific address ranges
+ * for the devices.
+ */
+#define domain_use_host_layout(d) (is_domain_direct_mapped(d) || \
+                                   is_hardware_domain(d))
+
 struct vtimer {
     struct vcpu *v;
     int irq;
diff --git a/xen/arch/arm/vgic-v3.c b/xen/arch/arm/vgic-v3.c
index 65bb7991a6..144089a7b6 100644
--- a/xen/arch/arm/vgic-v3.c
+++ b/xen/arch/arm/vgic-v3.c
@@ -1640,14 +1640,15 @@ static inline unsigned int vgic_v3_max_rdist_count(struct domain *d)
      * Normally there is only one GICv3 redistributor region.
      * The GICv3 DT binding provisions for multiple regions, since there are
      * platforms out there which need those (multi-socket systems).
-     * For Dom0 we have to live with the MMIO layout the hardware provides,
-     * so we have to copy the multiple regions - as the first region may not
-     * provide enough space to hold all redistributors we need.
+     * For domain using the host memory layout, we have to live with the MMIO
+     * layout the hardware provides, so we have to copy the multiple regions
+     * - as the first region may not provide enough space to hold all
+     * redistributors we need.
      * However DomU get a constructed memory map, so we can go with
      * the architected single redistributor region.
      */
-    return is_hardware_domain(d) ? vgic_v3_hw.nr_rdist_regions :
-               GUEST_GICV3_RDIST_REGIONS;
+    return domain_use_host_layout(d) ? vgic_v3_hw.nr_rdist_regions :
+                                       GUEST_GICV3_RDIST_REGIONS;
 }
 
 static int vgic_v3_domain_init(struct domain *d)
@@ -1669,10 +1670,11 @@ static int vgic_v3_domain_init(struct domain *d)
     radix_tree_init(&d->arch.vgic.pend_lpi_tree);
 
     /*
-     * Domain 0 gets the hardware address.
-     * Guests get the virtual platform layout.
+     * For domain using the host memory layout, it gets the hardware
+     * address.
+     * Other domains get the virtual platform layout.
      */
-    if ( is_hardware_domain(d) )
+    if ( domain_use_host_layout(d) )
     {
         unsigned int first_cpu = 0;
 
@@ -1695,10 +1697,10 @@ static int vgic_v3_domain_init(struct domain *d)
         }
 
         /*
-         * The hardware domain may not use all the re-distributors
-         * regions (e.g when the number of vCPUs does not match the
-         * number of pCPUs). Update the number of regions to avoid
-         * exposing unused region as they will not get emulated.
+         * For domain using the host memory layout, it may not use all
+         * the re-distributors regions (e.g when the number of vCPUs does
+         * not match the number of pCPUs). Update the number of regions to
+         * avoid exposing unused region as they will not get emulated.
          */
         d->arch.vgic.nr_regions = i + 1;
 
-- 
2.25.1


