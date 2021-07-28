Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C146F3D8BBA
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jul 2021 12:29:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.161428.296465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8goB-0006Rl-2n; Wed, 28 Jul 2021 10:29:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 161428.296465; Wed, 28 Jul 2021 10:29:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8goA-0006N2-SY; Wed, 28 Jul 2021 10:29:02 +0000
Received: by outflank-mailman (input) for mailman id 161428;
 Wed, 28 Jul 2021 10:29:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UQNy=MU=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1m8go9-0004GY-Dn
 for xen-devel@lists.xenproject.org; Wed, 28 Jul 2021 10:29:01 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.3.48]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9c22ffc6-ef8e-11eb-9786-12813bfff9fa;
 Wed, 28 Jul 2021 10:28:55 +0000 (UTC)
Received: from AM6PR05CA0017.eurprd05.prod.outlook.com (2603:10a6:20b:2e::30)
 by AM6PR08MB3365.eurprd08.prod.outlook.com (2603:10a6:20b:42::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Wed, 28 Jul
 2021 10:28:53 +0000
Received: from VE1EUR03FT023.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2e:cafe::3e) by AM6PR05CA0017.outlook.office365.com
 (2603:10a6:20b:2e::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.17 via Frontend
 Transport; Wed, 28 Jul 2021 10:28:53 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT023.mail.protection.outlook.com (10.152.18.133) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.24 via Frontend Transport; Wed, 28 Jul 2021 10:28:52 +0000
Received: ("Tessian outbound 1e4fcc40c873:v100");
 Wed, 28 Jul 2021 10:28:52 +0000
Received: from 106622ec1638.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FEFFF744-99BD-4604-B864-1AB4B7C2BCCE.1; 
 Wed, 28 Jul 2021 10:28:45 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 106622ec1638.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 28 Jul 2021 10:28:45 +0000
Received: from AM5PR1001CA0011.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:206:2::24)
 by AS8PR08MB6758.eurprd08.prod.outlook.com (2603:10a6:20b:39a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18; Wed, 28 Jul
 2021 10:28:44 +0000
Received: from VE1EUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:206:2:cafe::2d) by AM5PR1001CA0011.outlook.office365.com
 (2603:10a6:206:2::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.18 via Frontend
 Transport; Wed, 28 Jul 2021 10:28:44 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT049.mail.protection.outlook.com (10.152.19.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4352.24 via Frontend Transport; Wed, 28 Jul 2021 10:28:44 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2176.14; Wed, 28 Jul
 2021 10:28:41 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.14; Wed, 28
 Jul 2021 10:28:41 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2176.14 via Frontend
 Transport; Wed, 28 Jul 2021 10:28:38 +0000
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
X-Inumbo-ID: 9c22ffc6-ef8e-11eb-9786-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hCUWQDaTiidx+E9zuPE9oXjMot3xhLFaC2iMm+uCkok=;
 b=reTN5WzrHSYeAo0SgqenD0XrQEax8sYwFoRT8Xf61jUagAbkxtRbGIe69b4KjzZ4gRhCOTBpQwPcieINRgs3/FErixaagYAt+wMHUX+ZkYWlMa+LP2tQMuqOpjb7jYnOC+VmCkPVcRFMlKPnCA0I/prDM/PtokhQHDnSQC6ZuOs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: daf66f73026ec041
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GhG7Xq4+PSnffvBofkvzVwXKkwEv7KdLeinscSL74kJPmC+2MX0A0/NKVESPzs4UOa7H8uVUWJuUmv33HUdht8IPsV2jnTGwp3O+uK6OvfXYVJgm55pDQ+GQr6epcPFZZrsxJAXOt9+/ntPzEpTO+aoa3sXk271RugYAi+iCkZxkwAxt1GEsAvNb+y5LQCg+rmO0tHtHUFJsjuszPqTv12v7ZuVRVxUTWtwFfWraZIBKt6+Fjbup8/iHX9mKBKQUsoBy8OPR1dxOspdKd1moqEXVLfF5hmg/tRJMlHlzD4TdrC8+LyAj4WjsRyvoj8Wsx7QW1l8iFUJCbHBebIMCLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hCUWQDaTiidx+E9zuPE9oXjMot3xhLFaC2iMm+uCkok=;
 b=ajI9bdMFtDJt+SxC4Y+BDq8Rvfag5iGl6yJ8g3hPDPThTjsw9D/kUA0AMC426SLhz55Fq/FbHVOLNs3Dm+7MgRKEQh9bKYVOXq0mx0TIkBdb4fPK1HJlI+BPBLYfn2Hn9k/j14XRaz1JvoyOzF7lYvwoPUIEcva5nggKiAOLQgGkJWpO3hZo7L2WrqqlFYfUfbQmQ/fiG2sa08/SiGa/xPpLdq4iCeavaXmj6nepr9xk1/lQyYy9Kz4RxYX2QOadEVoIfozmtmHjxsFIeUTEh2v9N0Vow0lSNAM1OaPf8CnYl4GI1Gky+/A5X2bcvORy13zWg7odvMs35R79NojPAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hCUWQDaTiidx+E9zuPE9oXjMot3xhLFaC2iMm+uCkok=;
 b=reTN5WzrHSYeAo0SgqenD0XrQEax8sYwFoRT8Xf61jUagAbkxtRbGIe69b4KjzZ4gRhCOTBpQwPcieINRgs3/FErixaagYAt+wMHUX+ZkYWlMa+LP2tQMuqOpjb7jYnOC+VmCkPVcRFMlKPnCA0I/prDM/PtokhQHDnSQC6ZuOs=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Penny Zheng <penny.zheng@arm.com>
To: <xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>,
	<julien@xen.org>
CC: <Bertrand.Marquis@arm.com>, <Penny.Zheng@arm.com>, <Wei.Chen@arm.com>,
	<nd@arm.com>
Subject: [PATCH V4 07/10] xen: re-define assign_pages and introduce assign_page
Date: Wed, 28 Jul 2021 10:27:54 +0000
Message-ID: <20210728102758.3269446-8-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210728102758.3269446-1-penny.zheng@arm.com>
References: <20210728102758.3269446-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3f0b5b4d-9f6c-4e40-f0cd-08d951b27f39
X-MS-TrafficTypeDiagnostic: AS8PR08MB6758:|AM6PR08MB3365:
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB336568AC2A52CEF72D60B56FF7EA9@AM6PR08MB3365.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 kbPVJo2aJjs+NXnUlOVKVwygUx2Ri4syXxnkASXC+LHwepNYl8Ei83oePqP+ge2WhoEIm1F8cxcHMd1uN8FKeI8Puu/f3zkXzOZVCAfc/vTn251wx3WUU1KCc665BvWv6DhlR1hPKAWowkC0694sS+9bklQZ5I35ZgbeLTUbKxokcRevxYfxrw82kX7+O6/xOpiZDoPeXqu1qSQSbiIsMkxfZ48qUqaZQso1YgpMOTFiFACdgzIjOFYsqDgmdBU7pj3w7wWzmX7idCgFBcuHzPCSuOB1pCalRmSBFqLI9vuiaMiACNsxJQaPq+FR+FlgekHUoioUjsaFK9xY7o9iiM0cq0+TzBmJkqQ5tt1A4d+YDWiOv05m4YuiHzuANo4pzNAO+PPvVCdb+LC49ztwh3QEN618GsMPKLgi2N0mwIf2h6Eb6aqDCrktj/yZmINvJKqOfXXZGMzRP7/RhdOa6GJS/ikpKSQFSTSc+XweIylaU1gbxaAam7TVzNG2dMASmV1PCniO2qv2DTmwYi3Or5tXwrb/WURUBN5qQnQ+1vTVmpQiXcI5ERrvfsSL4OFF3MobLjgwATUa3m5Z3Jfz7Dsqn7CIaT1EJToN17j872PoIB1u9cl1ZVF23LE5tNsIU7awJXc9WJXHkI5Wy9sdg4vPxkGD7Mb7DSh102wGJY1/mni6ooyGibaSsXj8xRpNw+iLK6fOzDcHL9Kf+Et7zCPbK0LVPz/LIHAGOs1u938=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(396003)(136003)(346002)(376002)(39850400004)(36840700001)(46966006)(7696005)(6666004)(1076003)(2616005)(86362001)(5660300002)(82310400003)(4326008)(36756003)(426003)(47076005)(2906002)(8676002)(54906003)(186003)(110136005)(8936002)(83380400001)(478600001)(356005)(26005)(82740400003)(36860700001)(44832011)(70586007)(316002)(70206006)(81166007)(336012)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6758
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	98f7b237-2d45-41f4-ed3b-08d951b27a1c
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pgvc8UBrjeWvBBptn4E/1rpTTvaeIS7w6LpuKYpdVbzEE4LvdJ3oCxlJDfzBFGdMD6Snfa+CR4GMInwFnl57ArKKCK1AY8sbBDwkSLQ5+XQL6uE9LCw5bNzYAJqd5ioDg3mRJiG+g8cj1DCnSVzeM957l+wt9viGRmDJTSxGppSryY/W4sMHZHiuR1mUuw0ZMgdOef5tTI+99E0mqSi33HgzDDovrqqqUmyTOdkrf11TXrBFu4ZOiL9FCF1+LyamTsMc4J/gQQYQ1q9wtBOaS0BY0cP9bs08ZVri1j7oOdWNrvoObLPn7gqTdVPSrdxpOIwgpnbRgWW+xhIWrzQn716TTMdSGPg6FmpMZwIkU1QgSs6VjTdge4nCG9NBqN+sk8cpv3kIaymF520a6TTDhKzz3pB0mLwS4aUeaAqcbA6NXwvYKwfpwCcAwEnHcLa2GUKAdusC5brmnkXLqhX8DmlXllEZcr1RbbAcX+EQ0/D3JKPoVNLBGmZYwTzYfzv5PsYKBOX/eG+UHwrwfPEnX5+YrSrC2WFqzysTDpq2wWm8v35+ZV2Gnb8SFR5KMQKuryIJgYQHvib5feokV4Fr5heJKrOi+l4dzSlVXD9ER/dQCYoIRPkjixNxAHbJm+kR93KXZnmFLkTjZVMBQc6LwkhVc/GOvG+yeemXyfIWFkDXM6WGGK68PI1Mq7VNtTXNdMJtCmjN1kWd6hhkJ/T9/Q==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(70206006)(81166007)(54906003)(6666004)(186003)(316002)(36756003)(47076005)(5660300002)(70586007)(82310400003)(26005)(426003)(110136005)(1076003)(2616005)(44832011)(2906002)(83380400001)(508600001)(8676002)(4326008)(7696005)(336012)(8936002)(86362001)(36860700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2021 10:28:52.9018
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f0b5b4d-9f6c-4e40-f0cd-08d951b27f39
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT023.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3365

In order to deal with the trouble of count-to-order conversion when page number
is not in a power-of-two, this commit re-define assign_pages for nr pages and
assign_page for original page with a single order.

Backporting confusion could be helped by altering the order of assign_page
parameters, such that the compiler would point out that adjustments at call
sites are needed.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
v4 change:
- in all cases where order-0 pages get passed, prefer using assign_pages
to pass literal 1
- reconstruct the order of assign_pages parameters
- remove the unnecessary parentheses
---
 xen/arch/x86/pv/dom0_build.c |  2 +-
 xen/common/grant_table.c     |  2 +-
 xen/common/memory.c          |  4 ++--
 xen/common/page_alloc.c      | 23 ++++++++++++++---------
 xen/include/xen/mm.h         |  6 ++++++
 5 files changed, 24 insertions(+), 13 deletions(-)

diff --git a/xen/arch/x86/pv/dom0_build.c b/xen/arch/x86/pv/dom0_build.c
index af47615b22..9142f359da 100644
--- a/xen/arch/x86/pv/dom0_build.c
+++ b/xen/arch/x86/pv/dom0_build.c
@@ -556,7 +556,7 @@ int __init dom0_construct_pv(struct domain *d,
         else
         {
             while ( count-- )
-                if ( assign_pages(d, mfn_to_page(_mfn(mfn++)), 0, 0) )
+                if ( assign_pages(mfn_to_page(_mfn(mfn++)), 1, d, 0) )
                     BUG();
         }
         initrd->mod_end = 0;
diff --git a/xen/common/grant_table.c b/xen/common/grant_table.c
index fab77ab9cc..1f6b89bff4 100644
--- a/xen/common/grant_table.c
+++ b/xen/common/grant_table.c
@@ -2342,7 +2342,7 @@ gnttab_transfer(
          * is respected and speculative execution is blocked accordingly
          */
         if ( unlikely(!evaluate_nospec(okay)) ||
-            unlikely(assign_pages(e, page, 0, MEMF_no_refcount)) )
+            unlikely(assign_pages(page, 1, e, MEMF_no_refcount)) )
         {
             bool drop_dom_ref;
 
diff --git a/xen/common/memory.c b/xen/common/memory.c
index e07bd9a5ea..083e14b84f 100644
--- a/xen/common/memory.c
+++ b/xen/common/memory.c
@@ -728,7 +728,7 @@ static long memory_exchange(XEN_GUEST_HANDLE_PARAM(xen_memory_exchange_t) arg)
         /* Assign each output page to the domain. */
         for ( j = 0; (page = page_list_remove_head(&out_chunk_list)); ++j )
         {
-            if ( assign_pages(d, page, exch.out.extent_order,
+            if ( assign_page(d, page, exch.out.extent_order,
                               MEMF_no_refcount) )
             {
                 unsigned long dec_count;
@@ -797,7 +797,7 @@ static long memory_exchange(XEN_GUEST_HANDLE_PARAM(xen_memory_exchange_t) arg)
      * cleared PGC_allocated.
      */
     while ( (page = page_list_remove_head(&in_chunk_list)) )
-        if ( assign_pages(d, page, 0, MEMF_no_refcount) )
+        if ( assign_pages(page, 1, d, MEMF_no_refcount) )
         {
             BUG_ON(!d->is_dying);
             free_domheap_page(page);
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index f51e406401..e279c6f713 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -2282,9 +2282,9 @@ void init_domheap_pages(paddr_t ps, paddr_t pe)
 
 
 int assign_pages(
-    struct domain *d,
     struct page_info *pg,
-    unsigned int order,
+    unsigned long nr,
+    struct domain *d,
     unsigned int memflags)
 {
     int rc = 0;
@@ -2304,7 +2304,7 @@ int assign_pages(
     {
         unsigned int extra_pages = 0;
 
-        for ( i = 0; i < (1ul << order); i++ )
+        for ( i = 0; i < nr; i++ )
         {
             ASSERT(!(pg[i].count_info & ~PGC_extra));
             if ( pg[i].count_info & PGC_extra )
@@ -2313,18 +2313,18 @@ int assign_pages(
 
         ASSERT(!extra_pages ||
                ((memflags & MEMF_no_refcount) &&
-                extra_pages == 1u << order));
+                extra_pages == nr));
     }
 #endif
 
     if ( pg[0].count_info & PGC_extra )
     {
-        d->extra_pages += 1u << order;
+        d->extra_pages += nr;
         memflags &= ~MEMF_no_refcount;
     }
     else if ( !(memflags & MEMF_no_refcount) )
     {
-        unsigned int tot_pages = domain_tot_pages(d) + (1 << order);
+        unsigned int tot_pages = domain_tot_pages(d) + nr;
 
         if ( unlikely(tot_pages > d->max_pages) )
         {
@@ -2336,10 +2336,10 @@ int assign_pages(
     }
 
     if ( !(memflags & MEMF_no_refcount) &&
-         unlikely(domain_adjust_tot_pages(d, 1 << order) == (1 << order)) )
+         unlikely(domain_adjust_tot_pages(d, nr) == nr) )
         get_knownalive_domain(d);
 
-    for ( i = 0; i < (1 << order); i++ )
+    for ( i = 0; i < nr; i++ )
     {
         ASSERT(page_get_owner(&pg[i]) == NULL);
         page_set_owner(&pg[i], d);
@@ -2354,6 +2354,11 @@ int assign_pages(
     return rc;
 }
 
+int assign_page(struct domain *d, struct page_info *pg, unsigned int order,
+                unsigned int memflags)
+{
+    return assign_pages(pg, 1UL << order, d, memflags);
+}
 
 struct page_info *alloc_domheap_pages(
     struct domain *d, unsigned int order, unsigned int memflags)
@@ -2396,7 +2401,7 @@ struct page_info *alloc_domheap_pages(
                 pg[i].count_info = PGC_extra;
             }
         }
-        if ( assign_pages(d, pg, order, memflags) )
+        if ( assign_page(d, pg, order, memflags) )
         {
             free_heap_pages(pg, order, memflags & MEMF_no_scrub);
             return NULL;
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index 8e8fb5a615..2e75cdcbb7 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -132,6 +132,12 @@ int query_page_offline(mfn_t mfn, uint32_t *status);
 void heap_init_late(void);
 
 int assign_pages(
+    struct page_info *pg,
+    unsigned long nr,
+    struct domain *d,
+    unsigned int memflags);
+
+int assign_page(
     struct domain *d,
     struct page_info *pg,
     unsigned int order,
-- 
2.25.1


