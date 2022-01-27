Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1F049DBEA
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jan 2022 08:51:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.261214.452039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCzYK-0000E3-JZ; Thu, 27 Jan 2022 07:50:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 261214.452039; Thu, 27 Jan 2022 07:50:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nCzYK-0000C7-GN; Thu, 27 Jan 2022 07:50:44 +0000
Received: by outflank-mailman (input) for mailman id 261214;
 Thu, 27 Jan 2022 07:50:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h4dm=SL=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1nCzYI-0008Mi-Th
 for xen-devel@lists.xenproject.org; Thu, 27 Jan 2022 07:50:43 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on060d.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::60d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d3197f61-7f45-11ec-8f75-fffcc8bd4f1a;
 Thu, 27 Jan 2022 08:50:42 +0100 (CET)
Received: from DB6P18901CA0013.EURP189.PROD.OUTLOOK.COM (2603:10a6:4:16::23)
 by DB8PR08MB5130.eurprd08.prod.outlook.com (2603:10a6:10:e9::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.17; Thu, 27 Jan
 2022 07:50:39 +0000
Received: from DB5EUR03FT044.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:16:cafe::f0) by DB6P18901CA0013.outlook.office365.com
 (2603:10a6:4:16::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15 via Frontend
 Transport; Thu, 27 Jan 2022 07:50:39 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT044.mail.protection.outlook.com (10.152.21.167) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4930.15 via Frontend Transport; Thu, 27 Jan 2022 07:50:38 +0000
Received: ("Tessian outbound 63bb5eb69ee8:v113");
 Thu, 27 Jan 2022 07:50:38 +0000
Received: from c780f9168eb1.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 CB5BDB13-C668-40B6-A27A-DEF6F3187B7E.1; 
 Thu, 27 Jan 2022 07:50:30 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c780f9168eb1.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 27 Jan 2022 07:50:30 +0000
Received: from AS9PR06CA0210.eurprd06.prod.outlook.com (2603:10a6:20b:45d::28)
 by VE1PR08MB4877.eurprd08.prod.outlook.com (2603:10a6:802:a4::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15; Thu, 27 Jan
 2022 07:50:28 +0000
Received: from AM5EUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45d:cafe::ca) by AS9PR06CA0210.outlook.office365.com
 (2603:10a6:20b:45d::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.15 via Frontend
 Transport; Thu, 27 Jan 2022 07:50:28 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT046.mail.protection.outlook.com (10.152.16.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Thu, 27 Jan 2022 07:50:28 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Thu, 27 Jan
 2022 07:50:27 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.20; Thu, 27
 Jan 2022 07:50:26 +0000
Received: from penny.shanghai.arm.com (10.169.188.91) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.20 via Frontend
 Transport; Thu, 27 Jan 2022 07:50:25 +0000
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
X-Inumbo-ID: d3197f61-7f45-11ec-8f75-fffcc8bd4f1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rSh3L/AFX1kwUWbUN803XD5qISN//S+9dF22OnqF/Ss=;
 b=lPPyoz94FwlEGHmUOII9wMO8lhVidDeQOajv7kcMUtK9QPNsX8EnMarfB9mnxQiLrWPoRuvHpapr9yW0aLDnUTJgrMflzcCyQiknO2FkPHxatDpGI5bZ5AUc9EhMeaEePc/GqXAtxnHm6+lJxVlZfxwNS0N7llTuEJU0BwLrYiw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: a0e7a4546c4c73d0
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AQ6eHOKhVvbZrMVMNTxbEEBiC2J8Sw+Bas6vEk9Sqs0LSV4tanBU0KJQ6bPHLbRJQiWUsQWFKGU7lGklbNE1963zmsBQypRql1KRiuwETVqZOo9WtIZmJjmjvSq+y90e6NolHKe0iL3j2cSbZr0rATRhp4W5RxcLLcmgKBH0W38CbBoOsdQg4OvcsFXKcKveL6KGBfbZvTUdrmAjeFBdrBw0s+wD1hJapw5eTYIVU5N5kyxobFZyTHna8m0n5T6EvdBFk49o4NObTxpL2+njTO2lv0DPgceJSgC6O1p6fUuKIUaiJVnkJS8AnWDwPGLcRl01JUuvN2MH4tzTNChSzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rSh3L/AFX1kwUWbUN803XD5qISN//S+9dF22OnqF/Ss=;
 b=Z/UqlXJ5LpH2G/yL+BQlvggij6/yxlD6hoHyRxagsEiZKAcraH00ldXJ7rbpJYGmBh+Kijw3nKxBggUlrCkvB82HqpbT3VuijcWNE9hjAiflN9UsGym6ZZhaKhs6h4sOtNDxaogXWwdKoaU/B+gGvvaKuJq3fwfhAjtfI1EwLlcrdLVXPMEREOmDO18cFaPRyQ1wnV2OhiyOAl56gLwliF77TDbBfXBx+SZnvjEHgE3g9Jfz5CKAet/BEwb+y94egEzTdG9/o2Uwk+D5jYTt5LRaRBr4bZHzgfa+uu4Wg7QrbogAWekgjbRQeepplAOj7xCwEB/UdHnlsc0nsyZqtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rSh3L/AFX1kwUWbUN803XD5qISN//S+9dF22OnqF/Ss=;
 b=lPPyoz94FwlEGHmUOII9wMO8lhVidDeQOajv7kcMUtK9QPNsX8EnMarfB9mnxQiLrWPoRuvHpapr9yW0aLDnUTJgrMflzcCyQiknO2FkPHxatDpGI5bZ5AUc9EhMeaEePc/GqXAtxnHm6+lJxVlZfxwNS0N7llTuEJU0BwLrYiw=
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
Subject: [PATCH v5 01/11] xen: introduce internal CDF_xxx flags for domain creation
Date: Thu, 27 Jan 2022 07:49:19 +0000
Message-ID: <20220127074929.502885-2-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220127074929.502885-1-penny.zheng@arm.com>
References: <20220127074929.502885-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 297eebb0-cc8e-41cd-ce0f-08d9e169b5f3
X-MS-TrafficTypeDiagnostic:
	VE1PR08MB4877:EE_|DB5EUR03FT044:EE_|DB8PR08MB5130:EE_
X-Microsoft-Antispam-PRVS:
	<DB8PR08MB513049D72B46A2BE64701815F7219@DB8PR08MB5130.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1051;OLM:1051;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 KSGpiICiUrydWxOKs8WR34Rt4t6PUOE2R7pix5PnOADzVLDAAL2BJwV+9AKMNR6EfuChvAp1MK/Uqu8RS2qhz/KDpEbXVzifsMFdpnRSxj/84HeZR/TeTR/r8CjJKmMmWVeDzibTQlJnHu8/B15rp9krE68QX82PDTNrPWOqhOoT36t050QGYuNq1QNUQrmOMTAyTePoShVvQVABBo+ofFhcaKIVgZxiBoScRl1SV6MLifwIOoZBchOC9lQYrT40wmMosM3Phjg3u6QE2JIP2fgz5xox+BPDyON8ljlA0jwioexAfZQmmzJZOAg48aDX9DKM1x/py3oKkW8E22n2J0FQuUFCTqVK1oqBJytHzl8/6Ergy9Sp1/qo2wbVaNeFn3k9pK3MrrASf9zOS9mfUlHKTiDeI++S6ObFbY/r0Du6XVKK6Crvk0W8CwT5TYF209mrIGg7k/D1V2yv6E++uNakCUHgs0zPucE4dTeZ/xrnWwwHbM7tS5HguBDgHaSSCap42+Q9cGQZyes33J15oYuEC4V/oI7mzZLMHAhDEcmr8b81WV3nSlY0yg9HzCoVR8RVPWkr+mM+m3ooUVXsolOBisvxGYCtxQ92DGdz4H1I99WZaSwfA05EKGhl3aPlC6uigx6ckeEtSbZdeYOq48xC4mCLT3BSMeikrwRLHdjdXgLKtzeVJ9xsUbGGj9Bzl8xKcUjzkxRPSG4U+HyYY9qQCzCKHgVgNC9KZIgm0cU=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(186003)(36756003)(1076003)(81166007)(36860700001)(26005)(40460700003)(356005)(47076005)(7696005)(44832011)(2616005)(6666004)(2906002)(82310400004)(83380400001)(336012)(70206006)(70586007)(4326008)(508600001)(8676002)(426003)(8936002)(54906003)(110136005)(5660300002)(86362001)(316002)(21314003)(36900700001)(20210929001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB4877
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	1fc58dbc-a7ff-42b5-0f87-08d9e169afa8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	8qp8svwKDWe3TRJosiRBO34prpAV/MqZqxKgAvDJHXyU1qOPrwLoOkoPeMXaT2zgTO1YE4+IxLqzb/BIvkq4rYAH1UrPCfTdtzBXmFuyvgz4JQRdV9r5rSeMmjfjaZN6EuBPWWiKgoh3qwYHf8ljuDhHCBVtSeT8e/6kbYq0E3ZLSdP6VjU5P/WeOewQUVtzO0oE0tnCj0juLgrLrNBd4/VYEgkyGyfJGXcnsL7eaYAR3Dmkdtg+1ZpT2Tucp0//cbKqd7hmy+FAyS9avksaax5b5oWbwNLfQ/OEhFho2QS0GjH2GOtpStyjpLDCNgD7ELaliIHGXXbauj/KHQqtsMC7uLLNSvhiha/AggW9i7sO3VsSmAnupJwNPYxrAuMopSXm5I3wMraumZUkDoKo9lVRsoIZ0QZTY1P6eQG9y94bzOvD6GJKY9nb783pFTHUm7fWty87TvyivngAbIBK6et+gIhvY3I2svH5RS5kVM7cgwomfP0HYsQOZJq9IGVqaT6mB/uubiqNTE3l0OaGYWacELEW8ZG/SxtS/K6hwzFWQnnPaGTxnkjBBFFZPfHD9cx1cUvSbsFQO5mTLVFHph+YJ91G86BAL4M0IMlCBOJIwhuEVONzQDmruz/h2MUMxjLg5mGI0NvEcCBdwYw0Kl3+Se7bNmesfkBlkUaYJA295AjCz9QjIObtq1NxxBhG2WfRFIw6CefKn1Pa9LBucg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(2616005)(44832011)(81166007)(2906002)(36860700001)(83380400001)(1076003)(47076005)(82310400004)(186003)(26005)(70586007)(5660300002)(508600001)(426003)(336012)(4326008)(8936002)(8676002)(6666004)(36756003)(70206006)(316002)(86362001)(40460700003)(54906003)(7696005)(110136005)(21314003)(20210929001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2022 07:50:38.9949
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 297eebb0-cc8e-41cd-ce0f-08d9e169b5f3
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT044.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5130

From: Stefano Stabellini <sstabellini@kernel.org>

We are passing an internal-only boolean flag at domain creation to
specify whether we want the domain to be privileged (i.e. dom0) or
not. Another flag will be introduced later in this series.

This commit extends original "boolean" to an "unsigned int" covering both
the existing "is_priv" and our new "directmap", which will be introduced later.

To make visible the relationship, we name the respective constants CDF_xxx
(with no XEN_DOMCTL_ prefix) to represent the difference with the public
constants XEN_DOMCTL_CDF_xxx.

Allocate bit 0 as CDF_privileged: whether a domain is privileged or not.

Signed-off-by: Stefano Stabellini <sstabellini@kernel.org>
Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
Tested-by: Stefano Stabellini <sstabellini@kernel.org>
---
v4 changes:
- new commit
---
v5 changes
- remove const constraint
---
 xen/arch/arm/domain_build.c |  4 ++--
 xen/arch/x86/setup.c        |  2 +-
 xen/common/domain.c         | 10 +++++-----
 xen/common/sched/core.c     |  2 +-
 xen/include/xen/domain.h    |  4 ++++
 xen/include/xen/sched.h     |  2 +-
 6 files changed, 14 insertions(+), 10 deletions(-)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 6931c022a2..0fab8604de 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -3058,7 +3058,7 @@ void __init create_domUs(void)
          * very important to use the pre-increment operator to call
          * domain_create() with a domid > 0. (domid == 0 is reserved for Dom0)
          */
-        d = domain_create(++max_init_domid, &d_cfg, false);
+        d = domain_create(++max_init_domid, &d_cfg, 0);
         if ( IS_ERR(d) )
             panic("Error creating domain %s\n", dt_node_name(node));
 
@@ -3160,7 +3160,7 @@ void __init create_dom0(void)
     if ( iommu_enabled )
         dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
 
-    dom0 = domain_create(0, &dom0_cfg, true);
+    dom0 = domain_create(0, &dom0_cfg, CDF_privileged);
     if ( IS_ERR(dom0) || (alloc_dom0_vcpu0(dom0) == NULL) )
         panic("Error creating domain 0\n");
 
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index e716005145..a14271488c 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -789,7 +789,7 @@ static struct domain *__init create_dom0(const module_t *image,
 
     /* Create initial domain.  Not d0 for pvshim. */
     domid = get_initial_domain_id();
-    d = domain_create(domid, &dom0_cfg, !pv_shim);
+    d = domain_create(domid, &dom0_cfg, pv_shim ? 0 : CDF_privileged);
     if ( IS_ERR(d) )
         panic("Error creating d%u: %ld\n", domid, PTR_ERR(d));
 
diff --git a/xen/common/domain.c b/xen/common/domain.c
index 2048ebad86..a79103e04a 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -552,7 +552,7 @@ static int sanitise_domain_config(struct xen_domctl_createdomain *config)
 
 struct domain *domain_create(domid_t domid,
                              struct xen_domctl_createdomain *config,
-                             bool is_priv)
+                             unsigned int flags)
 {
     struct domain *d, **pd, *old_hwdom = NULL;
     enum { INIT_watchdog = 1u<<1,
@@ -578,7 +578,7 @@ struct domain *domain_create(domid_t domid,
     }
 
     /* Sort out our idea of is_control_domain(). */
-    d->is_privileged = is_priv;
+    d->is_privileged = flags & CDF_privileged;
 
     /* Sort out our idea of is_hardware_domain(). */
     if ( domid == 0 || domid == hardware_domid )
@@ -772,7 +772,7 @@ void __init setup_system_domains(void)
      * Hidden PCI devices will also be associated with this domain
      * (but be [partly] controlled by Dom0 nevertheless).
      */
-    dom_xen = domain_create(DOMID_XEN, NULL, false);
+    dom_xen = domain_create(DOMID_XEN, NULL, 0);
     if ( IS_ERR(dom_xen) )
         panic("Failed to create d[XEN]: %ld\n", PTR_ERR(dom_xen));
 
@@ -782,7 +782,7 @@ void __init setup_system_domains(void)
      * array. Mappings occur at the priv of the caller.
      * Quarantined PCI devices will be associated with this domain.
      */
-    dom_io = domain_create(DOMID_IO, NULL, false);
+    dom_io = domain_create(DOMID_IO, NULL, 0);
     if ( IS_ERR(dom_io) )
         panic("Failed to create d[IO]: %ld\n", PTR_ERR(dom_io));
 
@@ -791,7 +791,7 @@ void __init setup_system_domains(void)
      * Initialise our COW domain.
      * This domain owns sharable pages.
      */
-    dom_cow = domain_create(DOMID_COW, NULL, false);
+    dom_cow = domain_create(DOMID_COW, NULL, 0);
     if ( IS_ERR(dom_cow) )
         panic("Failed to create d[COW]: %ld\n", PTR_ERR(dom_cow));
 #endif
diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
index 8f4b1ca10d..f5c819349b 100644
--- a/xen/common/sched/core.c
+++ b/xen/common/sched/core.c
@@ -3021,7 +3021,7 @@ void __init scheduler_init(void)
         sched_ratelimit_us = SCHED_DEFAULT_RATELIMIT_US;
     }
 
-    idle_domain = domain_create(DOMID_IDLE, NULL, false);
+    idle_domain = domain_create(DOMID_IDLE, NULL, 0);
     BUG_ON(IS_ERR(idle_domain));
     BUG_ON(nr_cpu_ids > ARRAY_SIZE(idle_vcpu));
     idle_domain->vcpu = idle_vcpu;
diff --git a/xen/include/xen/domain.h b/xen/include/xen/domain.h
index 160c8dbdab..cfb0b47f13 100644
--- a/xen/include/xen/domain.h
+++ b/xen/include/xen/domain.h
@@ -28,6 +28,10 @@ void getdomaininfo(struct domain *d, struct xen_domctl_getdomaininfo *info);
 void arch_get_domain_info(const struct domain *d,
                           struct xen_domctl_getdomaininfo *info);
 
+/* CDF_* constant. Internal flags for domain creation. */
+/* Is this a privileged domain? */
+#define CDF_privileged           (1U << 0)
+
 /*
  * Arch-specifics.
  */
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 37f78cc4c4..24a9a87f83 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -665,7 +665,7 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config);
  */
 struct domain *domain_create(domid_t domid,
                              struct xen_domctl_createdomain *config,
-                             bool is_priv);
+                             unsigned int flags);
 
 /*
  * rcu_lock_domain_by_id() is more efficient than get_domain_by_id().
-- 
2.25.1


