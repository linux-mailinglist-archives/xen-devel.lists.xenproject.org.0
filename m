Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A7447A445
	for <lists+xen-devel@lfdr.de>; Mon, 20 Dec 2021 06:22:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.249408.429868 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzB7h-000112-9I; Mon, 20 Dec 2021 05:22:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 249408.429868; Mon, 20 Dec 2021 05:22:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mzB7h-0000x3-5t; Mon, 20 Dec 2021 05:22:09 +0000
Received: by outflank-mailman (input) for mailman id 249408;
 Mon, 20 Dec 2021 05:22:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ajqg=RF=arm.com=Penny.Zheng@srs-se1.protection.inumbo.net>)
 id 1mzB7f-0007eG-8g
 for xen-devel@lists.xenproject.org; Mon, 20 Dec 2021 05:22:07 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0630.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::630])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c5905775-6154-11ec-9e60-abaf8a552007;
 Mon, 20 Dec 2021 06:22:06 +0100 (CET)
Received: from AS9PR06CA0409.eurprd06.prod.outlook.com (2603:10a6:20b:461::18)
 by AM4PR08MB2641.eurprd08.prod.outlook.com (2603:10a6:205:b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.20; Mon, 20 Dec
 2021 05:22:03 +0000
Received: from AM5EUR03FT040.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:461:cafe::8) by AS9PR06CA0409.outlook.office365.com
 (2603:10a6:20b:461::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14 via Frontend
 Transport; Mon, 20 Dec 2021 05:22:03 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT040.mail.protection.outlook.com (10.152.17.148) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4801.14 via Frontend Transport; Mon, 20 Dec 2021 05:22:03 +0000
Received: ("Tessian outbound f493ab4f1fb8:v110");
 Mon, 20 Dec 2021 05:22:03 +0000
Received: from 7ecc23afb9a2.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 27C33F61-8E1D-4D7C-ABA5-597E9ED1D61C.1; 
 Mon, 20 Dec 2021 05:21:56 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7ecc23afb9a2.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 20 Dec 2021 05:21:56 +0000
Received: from DU2PR04CA0174.eurprd04.prod.outlook.com (2603:10a6:10:2b0::29)
 by DB9PR08MB7147.eurprd08.prod.outlook.com (2603:10a6:10:2cb::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Mon, 20 Dec
 2021 05:21:52 +0000
Received: from DB5EUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b0:cafe::d4) by DU2PR04CA0174.outlook.office365.com
 (2603:10a6:10:2b0::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.17 via Frontend
 Transport; Mon, 20 Dec 2021 05:21:52 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT055.mail.protection.outlook.com (10.152.21.30) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4801.14 via Frontend Transport; Mon, 20 Dec 2021 05:21:52 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Mon, 20 Dec
 2021 05:21:51 +0000
Received: from penny.shanghai.arm.com (10.169.188.91) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.20 via Frontend
 Transport; Mon, 20 Dec 2021 05:21:49 +0000
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
X-Inumbo-ID: c5905775-6154-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wuR6YNjrEFjB7To66TkH4pIiwei4ENNply2Pgid4MnQ=;
 b=v6DPc39QIXTwlMGd7SCvJl0Uo3Q7Zxokq2GxmMp7uHdeBWZAgJxuEjrL1tGZCXtY8pzk2s1NuaQfxXPwFi/316sNqu+yuJltgX/dCgvIqPcGOhZkCeCzlvksF1U+BVehB3YGDM6OKcfIwdJ//mvyYZCvyGj/5+pcwh5vEnuxa3Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: c1e044a67c50ebe5
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GF0w3iZ7zgT3EQONOqrLbL31XAjPDtieQnfBrfD2Ax3h80UuXQHK/uD29V/YSp5JSXMPU9vSLQo2PbUNkA49tE8LSYoTuroTr1odioTB0Tjy089tYXZ9+U/OmyB9GULrnp4q6ANyJUYcaD7lypsKf1dOAY0N8f2snaI1aLvCnh+Eqc7df6Y0N4060SBnvU3qTwpzYkTI/drKZvoEbXyqzVE+ckhXQpVPTWqDLSOBTPZp2jH6aO9nwSPAun2YCd8D5vhvzlTPpuGgk2SXKWk58bp+SaQP6P0IBx1rd5hUY91eVdPmTdVgenK5QTADUCwf53f/Hn5Oz3p0GNaAbZLOUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wuR6YNjrEFjB7To66TkH4pIiwei4ENNply2Pgid4MnQ=;
 b=AjpU0U/V+WsaroPq88wwQyRKJwYzZrIVaLqMeSKD9s94wDGvBiqfahH5KRWvg3ARy47TwZJDd2LlEy3VM1aJnc42b0do0qu+u/N+RJ+qSYr0ocKw+pv9g6RQLVmIYFps6aFvnrbawj/KaIKoFH1NIxqSI+nvpTFnI7kZs4Kk/a2RqTUE3RVJjyMGBoecn8XA0yBj1w16vgvoKQh5+33x3mBbrtfD23tMLO4y7Jw4YP2paQ0xO/CMUjnLJvAMd/RhTqgpXcotbvRUqgKA165jFe5fhS7kx8OlfzzvvpnjQEiV/f5oCH9MzQ4/r5grgO/e1Sc/FKciFUkWlxStoKIEtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wuR6YNjrEFjB7To66TkH4pIiwei4ENNply2Pgid4MnQ=;
 b=v6DPc39QIXTwlMGd7SCvJl0Uo3Q7Zxokq2GxmMp7uHdeBWZAgJxuEjrL1tGZCXtY8pzk2s1NuaQfxXPwFi/316sNqu+yuJltgX/dCgvIqPcGOhZkCeCzlvksF1U+BVehB3YGDM6OKcfIwdJ//mvyYZCvyGj/5+pcwh5vEnuxa3Q=
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
Subject: [PATCH v4 06/11] xen/arm: add ASSERT_UNREACHABLE in allocate_static_memory
Date: Mon, 20 Dec 2021 05:21:18 +0000
Message-ID: <20211220052123.969876-7-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211220052123.969876-1-penny.zheng@arm.com>
References: <20211220052123.969876-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: bd8877a3-9b4d-4e02-3189-08d9c378a7fa
X-MS-TrafficTypeDiagnostic:
	DB9PR08MB7147:EE_|AM5EUR03FT040:EE_|AM4PR08MB2641:EE_
X-Microsoft-Antispam-PRVS:
	<AM4PR08MB264184252976D154C98FD551F77B9@AM4PR08MB2641.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:326;OLM:326;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 0Zs4f0UwIqYxF88zbt4weHSwIDHtVqFlgU8QWkxXbXPSu7YqFTcg812DbuCWiLfwHPjCRJeLo9kOJ4i2SvFygj1TVX+RQVKr4Bha5Mi52czEYQiQPydrhQJmtrV7mxUk+VcM7/EgWvS4weQcuIemp567vo9KODpZF1kg48zIucgkN7vx+u/JldRn5ZarmN18eypetaF8Od5uDKjMvtaqEqDB/FYUK99mX0tpYPTluMjGR+r9tu89g/7PgJ6DVhR/ll6JUvj2M+uTGjZVMt+CnF3/eESOPkzZrDu+tRbt+Ln4X8Od0NI9eentx4458ec9QMw8acx/+vIh7VRzirmGTrOxy6VVXIjY2afIYZh5lRpuZmWghwdYq/Cj5xGPO2lyx4Dq1dIIvNI0ceSercNQZY5+97qIx5A9kgIg9ii8U5avoASTof7jdm0TPDieNNd3TiwyMmchm7awpIGBjdBateNCFBk7niXrfntLb+fzalAPToZIiHM5bDBHXN9LUfctNnK+hDrq5DAVoz8mmXPDteF2bP3oBAr+eWFBP2AvwGIMYlHhz2EOCRmrm7kjLWnV2tAkfuAFeenAZYyQr/KE9xQWOpls64mxlxDm7qXIQd1jy+doC020GShmCNBV9pPDd06Klx4Juyn3asQljdYNnDbE/RTeyn73wIHOLpqV4k6sU2+aftCd+vqLTsjbqnfJrE+kHQpQGbWquyh5wLKuV/59rqLad2j2jZ+OE19AJBaK+7KGhE7nIySIjft0VxAB3yZafBhMa6ZhLogMSkmvDykJe0kAEwImyOdJri9RGTQ=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(40470700001)(44832011)(8676002)(5660300002)(40460700001)(70206006)(1076003)(81166007)(2616005)(6666004)(186003)(4744005)(82310400004)(4326008)(26005)(426003)(356005)(336012)(70586007)(110136005)(54906003)(36860700001)(86362001)(47076005)(316002)(36756003)(508600001)(7696005)(2906002)(8936002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7147
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	57eac46d-9b56-4c7b-c7df-08d9c378a1b8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	SocTDhisUc6YxZXTKcqpo57snoUnlPcbTK0mTv0OuvvJr6ZUwzHva+w5ayhIpy8xJfOdOLy2AJuCw7wXlhybQM++nE9aW2aJyu2JHl0pBumAVEahKrFG39xr7SjlZxnICh+/ncMdgHp4VtV0AoiKAZ51mzDGjxLxsAOcUcQF6ZUJHsUFzPQ5qkPFexSXpMEk4TK7o5s018xh+lQobkfm0JXCuLeX9QkfoXePBy5awH14ofGeEsiShq6kh17A908wFzesC1enoa+hb0slaIpJ56H6dT/En3HCLDS0VFBFpJQD1LRHWfLzHTXYMrCS3QjRD03O7m4rbw6+vkITSPsn54Sm2MUI8f8KUpgna1ymnVxtoN7S942wQXgqjn78FvD8Ll1CilFp8CXSBVCqkp4ySSdnr6naNwEjOZ4ygWTliXKm42VmLo0lQDuapijll8FtOYWq55njuMvVm9m92qmfbBC09+XbKxMCQLcgHOxswrGUb62T49G4/5UMd3xdKUn9Rz1MQZqGn0PAeK/HiLNDhPIygoguuJt5QQQX+PYGtQ+beLjQB4GTJDcWecy8FO5jC2YcMMGhUISyKAU6Yi3d1d5XtLVIM9FeabfLmoy28Vt47Q+bbRMKLzkAZG/UwaC/CuIsUDTIyaOFe+UFsy3S9dJoCoBHCLNNc9kTXCK2+qJIgLDgxfKtCo+RA4jhW/4APYptFJwjNJT7epaCF4yhpw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(26005)(8936002)(47076005)(186003)(1076003)(336012)(426003)(4326008)(36860700001)(4744005)(82310400004)(2616005)(8676002)(316002)(86362001)(44832011)(6666004)(508600001)(54906003)(110136005)(81166007)(36756003)(70206006)(70586007)(2906002)(7696005)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2021 05:22:03.0694
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bd8877a3-9b4d-4e02-3189-08d9c378a7fa
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT040.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR08MB2641

Helper allocate_static_memory is not meant to be reachable when built with
!CONFIG_STATIC_MEMORY, so this commit adds ASSERT_UNREACHABLE in it to catch
potential misuse.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
v3 changes:
- new commit
---
 xen/arch/arm/domain_build.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index d74a3eb908..b706e674c9 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -755,6 +755,7 @@ static void __init allocate_static_memory(struct domain *d,
                                           struct kernel_info *kinfo,
                                           const struct dt_device_node *node)
 {
+    ASSERT_UNREACHABLE();
 }
 
 static void __init assign_static_memory_11(struct domain *d,
-- 
2.25.1


