Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C6E4B4032
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 04:21:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271070.465411 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJRvQ-0007Rm-16; Mon, 14 Feb 2022 03:21:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271070.465411; Mon, 14 Feb 2022 03:21:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJRvP-0007KJ-OG; Mon, 14 Feb 2022 03:21:15 +0000
Received: by outflank-mailman (input) for mailman id 271070;
 Mon, 14 Feb 2022 03:21:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aDlx=S5=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1nJRvO-0007B4-4f
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 03:21:14 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur02on0630.outbound.protection.outlook.com
 [2a01:111:f400:fe05::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 26eb130a-8d45-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 04:21:10 +0100 (CET)
Received: from DB9PR02CA0024.eurprd02.prod.outlook.com (2603:10a6:10:1d9::29)
 by VE1PR08MB5614.eurprd08.prod.outlook.com (2603:10a6:800:1a8::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.15; Mon, 14 Feb
 2022 03:21:06 +0000
Received: from DB5EUR03FT004.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1d9:cafe::83) by DB9PR02CA0024.outlook.office365.com
 (2603:10a6:10:1d9::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19 via Frontend
 Transport; Mon, 14 Feb 2022 03:21:05 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT004.mail.protection.outlook.com (10.152.20.128) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4975.11 via Frontend Transport; Mon, 14 Feb 2022 03:21:05 +0000
Received: ("Tessian outbound 18e50a6f0513:v113");
 Mon, 14 Feb 2022 03:21:05 +0000
Received: from 1e3b77a573ee.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 9BD198F7-54EC-48D3-892A-28F6A9466F78.1; 
 Mon, 14 Feb 2022 03:20:59 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1e3b77a573ee.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 14 Feb 2022 03:20:59 +0000
Received: from AM5PR0502CA0008.eurprd05.prod.outlook.com
 (2603:10a6:203:91::18) by VI1PR08MB3181.eurprd08.prod.outlook.com
 (2603:10a6:803:3f::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.15; Mon, 14 Feb
 2022 03:20:56 +0000
Received: from AM5EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:91:cafe::2) by AM5PR0502CA0008.outlook.office365.com
 (2603:10a6:203:91::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4951.19 via Frontend
 Transport; Mon, 14 Feb 2022 03:20:55 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT034.mail.protection.outlook.com (10.152.16.81) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Mon, 14 Feb 2022 03:20:55 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.20; Mon, 14 Feb
 2022 03:21:00 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.20; Mon, 14
 Feb 2022 03:20:53 +0000
Received: from penny.shanghai.arm.com (10.169.188.91) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.20 via Frontend
 Transport; Mon, 14 Feb 2022 03:20:57 +0000
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
X-Inumbo-ID: 26eb130a-8d45-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KB1S60IihEv8VGYUXws5DWDnmLCtiZ1gCsStIIhUK5E=;
 b=sOoA07eoaC5uOlpPGVmeR2z5sgVr5iWqc6Tv5RyNiOR2nwfnHVlj/BjxKdXKz2zeIi6Jf27o9Oy6paEfSvXc3YOj/PZF6LL/lm3w7FLpEEBsPSRg3U7y9Le9lZqHy7OuMQKJL3RreGD/Na3I8E1agVZau7T5HZI0PIUY31K19Hc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: f5f60d10bf1e6aaa
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dkafOOd8VhO2QbtLdJrAULqWM+im+y1uDTqEokvYpTwHFVvJu5NiFrsLe9jGI0moHwYhn/EDcPI0fiuqtFnFHjviLOGpNp8VRmJO+02oU/PDKMXG4aGesmfZUafqUm/2H79QSEP15gNYQUktoaID2Gp77hiXdCjP4Ax9yXIF2p4ms9RUsVA0q8m30R67wS1zq8mzYhDqFHRUgfpDcqBlkqtTKcGJMS+YgFQW79YNxQHS+CYyLV6m13uI1yv+SoGW9dq0zbbgCSlPtCKbWuNRDOBUCFF06xH6ooOzwhtrpfQGIFTUgxMsk6640ZytT5pNu33b4cjtRtA9+McpnWt5kQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KB1S60IihEv8VGYUXws5DWDnmLCtiZ1gCsStIIhUK5E=;
 b=bDhwU+g9YSIU/VJb7DzeDmC8pywD0rEzlsBeiLWjvKknxzovgcv+40C9fglb1x6ZMpj2kd9Ph0F4F35f8ccpFggk6feSGUOyGKMtdVjCG6kimcuaSBzZBHaSaJ+MuYJAR9coC0NqkE+QUmrS2/x38JVO4c2xgWK4DLuMmNUdEyPTqYLa+K38w4DG0niOV8bBPn6W96Ker0oGws5oPOjknt9pyVfZtIv4r+7T5Du3jMZ1A+vweK+gakn2wxkhv8U7OU+Q1wBSPXuvnCqAi3mEKO7Su/0O/TZvdtVQG6k2tAQkIczJYHCbkfaevZakHInVka6XiuTEUW0j2o7OpnBktA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KB1S60IihEv8VGYUXws5DWDnmLCtiZ1gCsStIIhUK5E=;
 b=sOoA07eoaC5uOlpPGVmeR2z5sgVr5iWqc6Tv5RyNiOR2nwfnHVlj/BjxKdXKz2zeIi6Jf27o9Oy6paEfSvXc3YOj/PZF6LL/lm3w7FLpEEBsPSRg3U7y9Le9lZqHy7OuMQKJL3RreGD/Na3I8E1agVZau7T5HZI0PIUY31K19Hc=
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
Subject: [PATCH v6 01/11] xen: introduce internal CDF_xxx flags for domain creation
Date: Mon, 14 Feb 2022 03:19:46 +0000
Message-ID: <20220214031956.3726764-2-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220214031956.3726764-1-penny.zheng@arm.com>
References: <20220214031956.3726764-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 563f6192-236e-484c-9565-08d9ef690945
X-MS-TrafficTypeDiagnostic:
	VI1PR08MB3181:EE_|DB5EUR03FT004:EE_|VE1PR08MB5614:EE_
X-Microsoft-Antispam-PRVS:
	<VE1PR08MB5614D5E2F4EB2DB2576D52DCF7339@VE1PR08MB5614.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1051;OLM:1051;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 FxnqTkrpzjeRvOJmUOWcWxbskkmFYJnn70Hu+8YE+PaDNaYdc8DfSR6DgBDxmnP/393XD/y/pi3VuMYTPZxLSoSPhWZTtSm/pIzb2hryCkqvV/ookrLy45GpyL8D7yZw9FmEEbeB0bs+TESoXSuLfy5RiqZZQ77DIt+fxP0CO7dEbH/hyuxJceYjjquGBUWxAh/M7jVySs6+8QLSZKwbPAmaqJwq+ShJn4dU7TxQqDddo22K/YvT4cbDrsqeWoJFmErwTXodxgByrsUtQj7MpH/sxkZGgi+aX+05hE8sC6yF7wtNO/Yo4Em5bSWCPJ0TjnFx0xM5r60Sz06AxD0ODzH+w53VbVAopwwIiLY/iBSn5lNe+UJ8ci3a0yNnuXW0IUFdWlQX49F+ZuuyrB9Bc7HdSqDmSRrrFyWYUzqT4JZcF6vSvwxH2kdQ8uZbfamfcefArKMHWWgB/005Z4NqqUe2RVm70MiBTC2x/X02quMa3SBwyRv5NIJeTkp33J0u7bGce2gRLU3euoyLIKwBBYt6yHwY2uk4PirloqGE2+sb/G3IUuypoNuq/zhFsr6BPvfurSndKRqIUlW56so2FRC3eUranvhQqo4kkO6yBjccc52Sp7/wzGPPLDIRWJhZ+iqVAHyklgrDJVn4ztTdcZj4idrDc1rJn2z5C3Kep3i8gOzDHYHE62aCeIX5kJa9pTsc4aaSTKIh7uQ8sfyckg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(83380400001)(86362001)(70206006)(70586007)(47076005)(26005)(186003)(316002)(336012)(81166007)(356005)(36860700001)(82310400004)(4326008)(426003)(2616005)(508600001)(8676002)(7696005)(6666004)(1076003)(110136005)(2906002)(54906003)(36756003)(44832011)(5660300002)(8936002)(21314003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3181
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	db33df49-10bd-4325-1f62-08d9ef69033d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	wBF02sTg2RHE5EadfEpipcNu7EVR2ItR2hlP1wI10ZC+Olum/tlF8TEd1Lmt7y0jM4JovCB3JBBaaBcqq1GYRwafuTy8fbGiOqoV2Zz4gHY5tdTDrxWbXKxtUdqhW9wskk9w/jsJQxS3uBhMfZCjlwrnQvfttacAzxK99XQngvOJKMRz3EYdADwxP+03Jo1VugmgQrnQj8ZxeJ/2ahHNuDFaNgcHd/wTmBvB26yWW+wJToJeJJMyA3VLFAvzWPdU+0+ru9X4m2gQ932dwv8j6OpPduu3pDVWWMooFtA3XnqIns0MinLzerLckPZ0H4xb7dhv2NYYhdvB7d4Kal+i8gQ8A+64jr5ACzeUD85D2FjqfpdDSZmqSyU5w4TEnS/Ef62KEsZGJ459jQ2KO3qtSg/0iHq5iqWxhDIkSiG6izSd4KP9eQkd7yEBUCiEXmuwxTz0/kdR1jt8xNo26wYt/3v3RGOIet2igFsOWNM1CWp6gdYlgCY32siCKTuePH84qXZKe53vvMMnGa/tXsw4Sb9BoqSm9DQwW7g94uV12hj21Qzd+HeoZvQ/yA4acW7tt2rAu8YLxUMjJ+Rv2XLtaGakZvNVDPUMZLZs/eFBs+VE6BCmJ1O9ScAX1mYrAhAqucoxGcN5ujDuIfT54mvuAQVFspS/j0G1Vxdxcpj6IqE=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(186003)(26005)(1076003)(70586007)(2906002)(2616005)(70206006)(7696005)(44832011)(81166007)(4326008)(8936002)(8676002)(6666004)(82310400004)(47076005)(36756003)(336012)(508600001)(426003)(5660300002)(36860700001)(316002)(54906003)(110136005)(83380400001)(86362001)(21314003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2022 03:21:05.5639
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 563f6192-236e-484c-9565-08d9ef690945
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT004.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR08MB5614

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
Reviewed-by: Julien Grall <jgrall@amazon.com>
Tested-by: Stefano Stabellini <sstabellini@kernel.org>
---
v4 changes:
- new commit
---
v5 changes
- remove const constraint
---
v6 changes
- no changes
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
index 115f8f6517..624b53ded4 100644
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


