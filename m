Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2A4663BF1
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jan 2023 09:55:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.474478.735743 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFAPh-0003wt-F5; Tue, 10 Jan 2023 08:55:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 474478.735743; Tue, 10 Jan 2023 08:55:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFAPh-0003st-Bh; Tue, 10 Jan 2023 08:55:21 +0000
Received: by outflank-mailman (input) for mailman id 474478;
 Tue, 10 Jan 2023 08:55:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K1Mu=5H=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1pFAP0-0005oC-BY
 for xen-devel@lists.xenproject.org; Tue, 10 Jan 2023 08:54:38 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on2047.outbound.protection.outlook.com [40.107.7.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 682860ce-90c4-11ed-b8d0-410ff93cb8f0;
 Tue, 10 Jan 2023 09:54:35 +0100 (CET)
Received: from AM5PR0601CA0030.eurprd06.prod.outlook.com
 (2603:10a6:203:68::16) by DU0PR08MB7437.eurprd08.prod.outlook.com
 (2603:10a6:10:354::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 08:54:34 +0000
Received: from AM7EUR03FT006.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:68:cafe::b5) by AM5PR0601CA0030.outlook.office365.com
 (2603:10a6:203:68::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18 via Frontend
 Transport; Tue, 10 Jan 2023 08:54:33 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT006.mail.protection.outlook.com (100.127.141.21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.18 via Frontend Transport; Tue, 10 Jan 2023 08:54:33 +0000
Received: ("Tessian outbound baf1b7a96f25:v132");
 Tue, 10 Jan 2023 08:54:33 +0000
Received: from 43b39c5aa916.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5A10E8F6-007D-4BC4-A4BA-549E0BED9E3A.1; 
 Tue, 10 Jan 2023 08:54:26 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 43b39c5aa916.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 10 Jan 2023 08:54:26 +0000
Received: from AM6PR10CA0030.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:209:89::43)
 by PAVPR08MB9139.eurprd08.prod.outlook.com (2603:10a6:102:30c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 08:54:24 +0000
Received: from AM7EUR03FT035.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:89:cafe::e3) by AM6PR10CA0030.outlook.office365.com
 (2603:10a6:209:89::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18 via Frontend
 Transport; Tue, 10 Jan 2023 08:54:24 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM7EUR03FT035.mail.protection.outlook.com (100.127.141.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5986.18 via Frontend Transport; Tue, 10 Jan 2023 08:54:24 +0000
Received: from AZ-NEU-EX02.Emea.Arm.com (10.251.26.5) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Tue, 10 Jan
 2023 08:54:23 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX02.Emea.Arm.com
 (10.251.26.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Tue, 10 Jan
 2023 08:54:23 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2507.16 via Frontend
 Transport; Tue, 10 Jan 2023 08:54:20 +0000
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
X-Inumbo-ID: 682860ce-90c4-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OOWzVhGTnAA1jwh+NIzceBycXKs2uJrzXGAp2en5qCg=;
 b=ql6UJYSdbgZcWz8+l6VSXPK8eTaGaH0KPHn8TkWej7SiQQ8JTlaaYdkZ+9SxkLeSrGxxrowXNIyLy0GAkgC9BOPwhrehnbMgAvoMz0g3Pw6MxufzQVSPCn2kPsHGeYE8ulkfRvy1AmglSoWk+hxHw5Qet+b+sDCIziRfUUnxx08=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: f238819d235296e5
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gd7GKiDkGt9PFTjucYpmx4GyWQ3ML7j4he/JrXK4WgtoV1sgjMSOxLMl7MXYot9g+Dv+3Uq1/Z9JTgcPKqf3Sqi5sFtZ6wEdZ527Vsn6AklmcXqPHt/OZmg1IMck7X3PlkRWDqNCLPmH7mzE9n+XiJKUQGwPJ3u4VgXiGnbsfMB6tgqL/XQqiKmbqfM4gmem5Ym106HQm7Txlw9hwxJp2tjaP5NiuCjUY3qy8YGmhsvYuHRawjzZKmV4TOTSH4ifkOowalHzLG1biIbN26teZ3uP7RNFx9s8MU+E5xkSKJNq9zQbtcAgA/wSF1sb5BODpmGw9YD+xcnG9xNZYElf3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OOWzVhGTnAA1jwh+NIzceBycXKs2uJrzXGAp2en5qCg=;
 b=At+zLhsyvGZFQ4O3UhMi+eTK/YWeXLjnUQZrVxPZBqtBKyY38ImSGDFOBYtneWUvvZB8r4kUyulW571NAL8jsdM1JpelPO8nkATmg8ELekBK2KMnXHP5igqp7wb1W0dAcKeQZZEr4SfYx3kPd+Te8Ab3BSNlQw59DWtvZxnujsfWR3QEoOdoZuguGpVCa7dbiq3D+WsSvlSictCwBHhC9Ac5A4He+52Qu8IHYpF9YKf6tsCqVwaEtA8w16onO+t5pfSePTK8WP7LsRdsbrzo5b1wkmmHnmATfgeg/ejh52s1Qrj+I9mv5aFt9ovYFhR/xOBGv/XSSudbDwQEWUWykQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OOWzVhGTnAA1jwh+NIzceBycXKs2uJrzXGAp2en5qCg=;
 b=ql6UJYSdbgZcWz8+l6VSXPK8eTaGaH0KPHn8TkWej7SiQQ8JTlaaYdkZ+9SxkLeSrGxxrowXNIyLy0GAkgC9BOPwhrehnbMgAvoMz0g3Pw6MxufzQVSPCn2kPsHGeYE8ulkfRvy1AmglSoWk+hxHw5Qet+b+sDCIziRfUUnxx08=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
From: Wei Chen <wei.chen@arm.com>
To: <xen-devel@lists.xenproject.org>
CC: <nd@arm.com>, Wei Chen <wei.chen@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 14/17] xen/arm: use CONFIG_NUMA to gate node_online_map in smpboot
Date: Tue, 10 Jan 2023 16:49:27 +0800
Message-ID: <20230110084930.1095203-15-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230110084930.1095203-1-wei.chen@arm.com>
References: <20230110084930.1095203-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	AM7EUR03FT035:EE_|PAVPR08MB9139:EE_|AM7EUR03FT006:EE_|DU0PR08MB7437:EE_
X-MS-Office365-Filtering-Correlation-Id: 4411b4f5-03de-41d3-14b1-08daf2e84b7a
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 yzynJM8x5/DVIwBjxxTpsnQWlFGNjs6xlB4sbUSGq4TipO54VwCaiNPESxMAnowximu87EVKQ9KSighewqWb1h6CA8vzQN2OGqcEommpKw+pXaJcxhdUac8Ly1/Ye6Tf44cNl6/HrWRCFwh4hK8mgaGqdOEd8ibYUS/wBm5ao8r8XIsCYg65OWmCObl2btkvRHqgp8784WTHhIOR9be9f3GYWfvohYwbm3wVwUKmpx95vYzJGWMxj860dgSHxQTR8A2YTbyheddY6jyaor02WwRir91wMj+QQCzYf/+aWMUikCN8/6DHez3qBh+Y4JKjZANUiGh1U1dj2sVlpfaxgGLLKivxSzkcsgRVc+u+oCKobrEUltI+RBf+jwKmLksPMX+mo/XnIL6j9ss5xbqximchZI7DnnNbOqIMzDYA7UFVKVX7VYjngRKPvGktC+NtUgXavGs+RRv5S406S7CT3esqJX4lGOTVrI+pBPA+GrOSyKiDdC5gYN4kNDBXLikbWClOId1t6lhcfTzJmP1pHfyofDbKReUOLTjGUXQGeoYEN9v/cc6OCY/twQHft88/Nq/KacpEEIFfk4vFh2dlRmXSkJLEbzZFuulOspslr11XxxdlgfqZXznyl0BDeBYJHUo9qlosllmR6JD1bkfU2/A+vYSNPv7yHiKNQyFBJeXhNsp+u2CfyXkl5PwcGOCi2xVG3Gq7WbRbNxdJPrkDPg==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(376002)(396003)(136003)(451199015)(46966006)(36840700001)(356005)(81166007)(82740400003)(7696005)(86362001)(6916009)(478600001)(40480700001)(316002)(54906003)(4744005)(8676002)(2906002)(44832011)(70586007)(41300700001)(70206006)(4326008)(426003)(336012)(8936002)(36860700001)(47076005)(83380400001)(26005)(2616005)(186003)(82310400005)(1076003)(5660300002)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9139
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	ba758de7-8bd5-4a2e-969f-08daf2e845e1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NNfJFR1/W4tHDaJY+Lk9QP3yBA+yjex+vi7DT3afDPklW5c8LfUZtJDYWlcqJthoTJNdaq775ZB5g6q8wv8NZUCs7X4am5hTkkgxxWpHAA19/ju7sqd4AbjXslfmitJ44typlTJhBCqUx8TrPDoR1hN63ZloBeVfPgdMCuD9RFXlWFWNCwpOjaRWxeijDEAGwS7Wy494hZOm8l41pQY3LnAaQV3F52eqNLr8yd46iivG3Qvwq/RVSUnBoztN3lszgzZZU6NWEw2JPFWs3Z/GktmrQ0LZPXHccw0uRcxAbT5bPZThrhcqs4lH1UkdTqaMNz+/efXeKfXOqwY1K/hs+9NcjnVXy324AOL2+paTovM+kvxHtU/2mq5+0rX65FJAkarP1r+XTIZ3pIfj4/OHcuqb3QaFucfy4DnYBEbcPkmrziaJpRUdBEU0+n5HjkurQbojTnNF0xyFiOO4ds/AEc68vMC/9+1HcscGsAgfwqESgPGi8nBhRgkcv0xRlLqQT0Asg1AfZH8utZ43e4p3ErerglgDm/h9OlQjTUIb67jfn3H1G57QpqnvQr+Lh59xo4h8AUdxOOgM1dZef3uHTShp80wlGNpAw55ni4b33tIkIRVscnvBEYiCrJxLHl+y+HTxCP08/OhZc2rDqEfETvhAay0rfXJQaYnl6GU1qjBmscXt5xXGNIi1xEhJPet/VA7FJPmEbzDMyEn4oNXUtw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(346002)(396003)(376002)(39860400002)(451199015)(40470700004)(46966006)(36840700001)(82310400005)(6916009)(83380400001)(36860700001)(478600001)(5660300002)(44832011)(4744005)(86362001)(36756003)(2906002)(40460700003)(316002)(54906003)(4326008)(82740400003)(26005)(186003)(336012)(8936002)(2616005)(1076003)(7696005)(40480700001)(426003)(107886003)(70586007)(8676002)(70206006)(41300700001)(47076005)(81166007);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2023 08:54:33.8347
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4411b4f5-03de-41d3-14b1-08daf2e84b7a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT006.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB7437

node_online_map in smpboot still need for Arm when NUMA is turn
off by Kconfig.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
v1 -> v2:
1. No change.
---
 xen/arch/arm/smpboot.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/xen/arch/arm/smpboot.c b/xen/arch/arm/smpboot.c
index 5ee6ab11e9..3ae359bbeb 100644
--- a/xen/arch/arm/smpboot.c
+++ b/xen/arch/arm/smpboot.c
@@ -41,8 +41,10 @@ integer_param("maxcpus", max_cpus);
 /* CPU logical map: map xen cpuid to an MPIDR */
 register_t __cpu_logical_map[NR_CPUS] = { [0 ... NR_CPUS-1] = MPIDR_INVALID };
 
+#ifndef CONFIG_NUMA
 /* Fake one node for now. See also asm/numa.h */
 nodemask_t __read_mostly node_online_map = { { [0] = 1UL } };
+#endif
 
 /* Xen stack for bringing up the first CPU. */
 static unsigned char __initdata cpu0_boot_stack[STACK_SIZE]
-- 
2.25.1


