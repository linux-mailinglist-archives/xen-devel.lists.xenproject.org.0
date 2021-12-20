Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B7847A449
	for <lists+xen-devel@lfdr.de>; Mon, 20 Dec 2021 06:22:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.249403.429814 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzB7X-0007xY-6X; Mon, 20 Dec 2021 05:21:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 249403.429814; Mon, 20 Dec 2021 05:21:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzB7X-0007uO-2V; Mon, 20 Dec 2021 05:21:59 +0000
Received: by outflank-mailman (input) for mailman id 249403;
 Mon, 20 Dec 2021 05:21:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ajqg=RF=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1mzB7V-0007eH-Ck
 for xen-devel@lists.xenproject.org; Mon, 20 Dec 2021 05:21:57 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2061a.outbound.protection.outlook.com
 [2a01:111:f400:7e1a::61a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id be5153e2-6154-11ec-85d3-df6b77346a89;
 Mon, 20 Dec 2021 06:21:54 +0100 (CET)
Received: from AM0PR03CA0072.eurprd03.prod.outlook.com (2603:10a6:208::49) by
 AM0PR08MB3556.eurprd08.prod.outlook.com (2603:10a6:208:e0::28) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4801.20; Mon, 20 Dec 2021 05:21:51 +0000
Received: from VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:208::4) by AM0PR03CA0072.outlook.office365.com (2603:10a6:208::49)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.15 via Frontend
 Transport; Mon, 20 Dec 2021 05:21:51 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT010.mail.protection.outlook.com (10.152.18.113) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4801.14 via Frontend Transport; Mon, 20 Dec 2021 05:21:50 +0000
Received: ("Tessian outbound a33f292be81b:v110");
 Mon, 20 Dec 2021 05:21:50 +0000
Received: from 7e834618be2a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 C3D74A82-786C-41D0-BFD4-9F027FA1875D.1; 
 Mon, 20 Dec 2021 05:21:43 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7e834618be2a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 20 Dec 2021 05:21:43 +0000
Received: from AM6PR04CA0021.eurprd04.prod.outlook.com (2603:10a6:20b:92::34)
 by AM0PR08MB5171.eurprd08.prod.outlook.com (2603:10a6:208:159::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17; Mon, 20 Dec
 2021 05:21:42 +0000
Received: from VE1EUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:92:cafe::f2) by AM6PR04CA0021.outlook.office365.com
 (2603:10a6:20b:92::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.15 via Frontend
 Transport; Mon, 20 Dec 2021 05:21:42 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT005.mail.protection.outlook.com (10.152.18.172) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4801.14 via Frontend Transport; Mon, 20 Dec 2021 05:21:42 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Mon, 20 Dec
 2021 05:21:41 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.20; Mon, 20
 Dec 2021 05:21:40 +0000
Received: from penny.shanghai.arm.com (10.169.188.91) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.20 via Frontend
 Transport; Mon, 20 Dec 2021 05:21:38 +0000
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
X-Inumbo-ID: be5153e2-6154-11ec-85d3-df6b77346a89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9I2u4PJrCQRBxGQhxWYRRIb9q1SoLzaGmtVIyf4dcec=;
 b=GbgfPhHR1jasgDCqOs76S/SEPXsz8Vgi49O1OTa+knS87Kj/pm+Ih5J7knC31o+Zd33lUx0IWWfei9OzCBKg+8Di4B/o1CJdyXFg/7fE/AZNwVLg7KGyqKhY7tmM+jg2qOVplZBiVR/jsFqhDmbGIx2vhlMd44gC5PV3AZRjdIo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 143133e7f72db2b2
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aW4KUYathsaeIKrHvJiQtWXWn2BWKZBxz5N3OY3s595+jA4xGycOZTCpvQTEFM7nb8EznTeaFMkDcGT6xQzA6i0gty1MhOmgapZq2055kZPjYeHG09+QTk+3HSuFJr8urjGmLeM1JQyfSQJqwvGF37PadhhZknoGVW+MV4cAwHaDloxs18xpZa5B/mf8uNDLIoH6NHpmdVqEjBGN5QOZ6j+WcjIuXjT6fzo8+NFcHNypB8D69knb4IWhhjA/iTUBNKgJFu7vcHGIi1xmZoBHgm/Xo5KJVr0OJDmS5wSyAYVqHtzi6cRLxZ5ajUYRD01hXMrmKOkArCP3Ph9PI2nNbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9I2u4PJrCQRBxGQhxWYRRIb9q1SoLzaGmtVIyf4dcec=;
 b=kAKAUEelhb/c39PG4mAvdTyPJ71W96dW2yHIgXrwkR9t4GWGMVaBy4irZ2Yl+Ho2ivYjZvDVIGShg3UH5qi2VlQZt6xZ1OWSwkCl6F+hJp21IYdJlL6Q1UawfLpE5hvCSHkuni3+FeF9QWyc89dZHxb7wA/WZE4dqxNBsNeg4iFnxXLlpEnZkkTu+xxoam1T7yPLTUMZAz2U0pZV0k65lG+2AWc4FVOHEX77QTi+7TKu9B/feWsAImCAvqhaz1DaZfruiaCufXhd6LN2BdzSkMGfiirBcGkflLkBYw47ds317nr56vsloFbYvQpFF9npBnbGp9/dGXeGZFhzvkwavg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9I2u4PJrCQRBxGQhxWYRRIb9q1SoLzaGmtVIyf4dcec=;
 b=GbgfPhHR1jasgDCqOs76S/SEPXsz8Vgi49O1OTa+knS87Kj/pm+Ih5J7knC31o+Zd33lUx0IWWfei9OzCBKg+8Di4B/o1CJdyXFg/7fE/AZNwVLg7KGyqKhY7tmM+jg2qOVplZBiVR/jsFqhDmbGIx2vhlMd44gC5PV3AZRjdIo=
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
Subject: [PATCH v4 01/11] xen: introduce internal CDF_xxx flags for domain creation
Date: Mon, 20 Dec 2021 05:21:13 +0000
Message-ID: <20211220052123.969876-2-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211220052123.969876-1-penny.zheng@arm.com>
References: <20211220052123.969876-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 08bb28af-c0da-43d2-bf6b-08d9c378a0a5
X-MS-TrafficTypeDiagnostic:
	AM0PR08MB5171:EE_|VE1EUR03FT010:EE_|AM0PR08MB3556:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB3556201EA370BE0327624A16F77B9@AM0PR08MB3556.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1051;OLM:1051;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Rj+kn3NOwfWJBF/+eC3AcCvxedWz9G30IUXa6w3xkEPQ7I0ptTxdUWvjtXEu/qgzto29IGzVTiufuqANNRILHdycHd9eYKad7udSNqQ99hUI+i9LuMvnxjk6H8ybnoNJrKkRyznFR3gZJVIljqvUfr0o4cBJ2vjWqoksE9ONGD8tFO+hcWbg4j/Get92NJePNOkmeWH4ZEJFM1UaP9iLa4fXqYAsEmi4CCykP0hcrLnQm/3EbWVOyOSr/kZhzRItkMVIJmwkdCHyL9dxsuN3q4LUpBQsElZy82WHULB3zdzAp/UvtVa/BdnOAypq1Qu5kGPdB17j11rKCQhqwzRzSkGw5f+7EFjQlw1fC40cfR896vPylXcv4YiHWUYaGBjy4n08wUBWB/wBAs/r2gAMjTS0fohge0691sQMyjkCi1HdWJ2+rzygfGGl0e+65FhW3gO9ZPLXADfH1yx66ha3PnnVpgMTm/1L4Gn9s4RBO9qs4/14ZMKA1uoqPncfIudRpycsLsBRpkRWcAFpWh1JueNgaUIeivKpmnxoXeXlU/rRC0yiK9v7BuQPUZtdiECm404G8ucZj4LNtNp6dBEKHb0dYrbXbT6xgT5QEIHDcIh19PkOAoMZ3Qj7WUxcaL744dRTUxI0HYDDpqydch2Ly30UGeUhDsN8l+8Y2BJcktApNtDRe/fwHwDNvsEEvmLWQwojln+Rl5dWKuHIoi8ytUngc5w7JeikiGEXEeBZ2T4CHvu4vXzJ6zdHVRKvg25olsNNW1xNHTolrc+OAeWFgch2qvaGA7LF+aY7UObOyc+j8U4Jv7dC0zAwRlFEqvBm
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(40470700001)(36756003)(1076003)(36860700001)(2906002)(47076005)(81166007)(2616005)(44832011)(86362001)(83380400001)(356005)(5660300002)(54906003)(426003)(82310400004)(336012)(186003)(110136005)(4326008)(8676002)(8936002)(26005)(316002)(70586007)(7696005)(70206006)(40460700001)(6666004)(508600001)(21314003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB5171
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6c493641-511b-45b1-2662-08d9c3789b87
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	MCt4ZbktHrO3+qqvtRdpmRkJtr2rBtbdPLWQjWXzDG9hwxTRIy/A5Ps49E7/YkTakk+PScqiobY0aNr/62FzAhAogmLuMzKmmx1zwynBo2g+QebBwdUF4WXIQP2IbYCfUWrJ2HExvoGrSGIzV1i7DwklpeaNrW/QQUNWn2sy9fVZOT/K6UX6993l7Odr9mipx5bSyRw3/cQPbmU9TvgpuP8DgcZ1ZbLsM06pIuKudM37guzLKDQ5lMbiLkyUPEanDukI/vXywUE6uyyufJLYr0/UA6pWUo39q6ixKvVcLK9/4ZkuRn5BKaD6Mg0HR/WeEPYqFZAiTiKRlBDhGnFGh+in/tBA1xcbfqddVOvseLQcOz18eGNngamhlgvW/Cx0rp9Hwwa42fGM46NESaoBjl8fL3OsJwgC//v/O8WjeWe4nTd+ughNEt55mlU9nL/zDYYLFhO7QV73A34i6t0/QSTxEDm1/m8BYz4KWvYF1wyxnkCQcpeL+ScHVpPKN9jjWBtAygUJJF3vybnqvT0AK4rQkwsVKG4EchFdhZUc20qftsh3HuLdNEoQHX9w8VMu6lmQlqEPhoVqU/qNUiQYKWKzOavY/p9wx/35NocEwXY64lxFSM8b4CTcD0LrwVt4Vo+7BiNs4TKw3my51O1M+0HxpbbycQzyg9x/tr4bOE/EeIj0Yhcz0LtkS1rZZrbEqv/C1WWYvqzwtPaAP23iACYSnIOlL5FXUHPzMDOtVKk=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(54906003)(110136005)(508600001)(83380400001)(316002)(44832011)(86362001)(6666004)(7696005)(82310400004)(5660300002)(81166007)(70586007)(70206006)(2906002)(36756003)(1076003)(8936002)(336012)(26005)(47076005)(186003)(2616005)(8676002)(4326008)(426003)(36860700001)(21314003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2021 05:21:50.7266
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 08bb28af-c0da-43d2-bf6b-08d9c378a0a5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT010.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3556

From: Stefano Stabellini <stefano.stabellini@xilinx.com>

We are passing an internal-only boolean flag at domain creation to
specify whether we want the domain to be privileged (i.e. dom0) or
not. Another flag will be introduced later in this series.

This commit extends original "boolean" to an "unsigned int" covering both
the existing "is_priv" and our new "directmap", which will be introduced later.

To make visible the relationship, we name the respective constants CDF_xxx
(with no XEN_DOMCTL_ prefix) to represent the difference with the public
constants XEN_DOMCTL_CDF_xxx.

Allocate bit 0 as CDF_privileged: whether a domain is privileged or not.

Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
v4 changes:
- new commit
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
index 2048ebad86..023c89c0ea 100644
--- a/xen/common/domain.c
+++ b/xen/common/domain.c
@@ -552,7 +552,7 @@ static int sanitise_domain_config(struct xen_domctl_createdomain *config)
 
 struct domain *domain_create(domid_t domid,
                              struct xen_domctl_createdomain *config,
-                             bool is_priv)
+                             const unsigned int flags)
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
index 37f78cc4c4..972877bc28 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -665,7 +665,7 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config);
  */
 struct domain *domain_create(domid_t domid,
                              struct xen_domctl_createdomain *config,
-                             bool is_priv);
+                             const unsigned int flags);
 
 /*
  * rcu_lock_domain_by_id() is more efficient than get_domain_by_id().
-- 
2.25.1


