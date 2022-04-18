Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DADF6504E40
	for <lists+xen-devel@lfdr.de>; Mon, 18 Apr 2022 11:12:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.307089.522386 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngNQG-0003ej-GE; Mon, 18 Apr 2022 09:11:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 307089.522386; Mon, 18 Apr 2022 09:11:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngNQG-0003Zt-8J; Mon, 18 Apr 2022 09:11:52 +0000
Received: by outflank-mailman (input) for mailman id 307089;
 Mon, 18 Apr 2022 09:11:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mice=U4=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1ngNOB-0006ub-Cx
 for xen-devel@lists.xenproject.org; Mon, 18 Apr 2022 09:09:43 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0620.outbound.protection.outlook.com
 [2a01:111:f400:fe0e::620])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 485455bc-bef7-11ec-8fbe-03012f2f19d4;
 Mon, 18 Apr 2022 11:09:42 +0200 (CEST)
Received: from AS8PR04CA0175.eurprd04.prod.outlook.com (2603:10a6:20b:331::30)
 by AM0PR08MB4402.eurprd08.prod.outlook.com (2603:10a6:208:147::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Mon, 18 Apr
 2022 09:09:39 +0000
Received: from VE1EUR03FT021.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:331:cafe::13) by AS8PR04CA0175.outlook.office365.com
 (2603:10a6:20b:331::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20 via Frontend
 Transport; Mon, 18 Apr 2022 09:09:39 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT021.mail.protection.outlook.com (10.152.18.117) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5164.19 via Frontend Transport; Mon, 18 Apr 2022 09:09:38 +0000
Received: ("Tessian outbound 62985e3c34b6:v118");
 Mon, 18 Apr 2022 09:09:38 +0000
Received: from ff45ff41fb00.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B65B4532-1C2E-4959-AB3A-F74E8031AACF.1; 
 Mon, 18 Apr 2022 09:09:32 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id ff45ff41fb00.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 18 Apr 2022 09:09:32 +0000
Received: from AS9PR06CA0544.eurprd06.prod.outlook.com (2603:10a6:20b:485::14)
 by AS8PR08MB7791.eurprd08.prod.outlook.com (2603:10a6:20b:52d::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 18 Apr
 2022 09:09:30 +0000
Received: from VE1EUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:485:cafe::e8) by AS9PR06CA0544.outlook.office365.com
 (2603:10a6:20b:485::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20 via Frontend
 Transport; Mon, 18 Apr 2022 09:09:30 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT055.mail.protection.outlook.com (10.152.19.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5164.19 via Frontend Transport; Mon, 18 Apr 2022 09:09:30 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.27; Mon, 18 Apr
 2022 09:09:28 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.27; Mon, 18
 Apr 2022 09:09:27 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.27 via Frontend
 Transport; Mon, 18 Apr 2022 09:09:26 +0000
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
X-Inumbo-ID: 485455bc-bef7-11ec-8fbe-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D2YTQR4kVi07mVUXoM7ogXNLlXVpGhLewzGsT6EnZHU=;
 b=JWOD7Em0KRj2/b2TGc2wmvTSRaoDrgOwJFbKZMvDrztf1Ewfn6npj2HPv+CwwfENTVlLTz86gF7g4K7EsXP2jFxpEqQMl51V2b2buaHrFKRahmEVZoZFK3iQemf9Fem1wDGYNfMnhby0xthq7Vk1hzWw0JhfjYOLUiiow/jSWqI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 4a4768c3d8d5e889
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MvMLb6QpuStdUhsJUHMdqf5n5N5A750ce+Nn1hP4hQCVok2rBbkH21A+23+cdUJMYFYsKw8zXyk2tWbqkgwjQG3S9B6COdHjqOt2wesqsM/KKmSl0PT308Sabk9rzpVUYZtESI2MzEQlgYSy2nhcZlJiMJzHxN9u6LUrQr7HJ8pt+t3MYgkcsWL1+G/hjseuPRo9KRp8jEVTweifcZJJBzWnopQJSKKGzHWpI5+GifcGYSQbIeD20WWtpBoIdzA1ZSoXg24Dj9ftUoGwx0y4HGSiOsRmzXPhBhbF0r66mqg4Rscy8+rwQ1ri6d/CEQKwwLO8wYXZ5NgzbSGtK3taMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D2YTQR4kVi07mVUXoM7ogXNLlXVpGhLewzGsT6EnZHU=;
 b=eXF4NlfHtEaY99c12+vK/3Zl/3X5GGv7v514hhhsu3/TObhkHxTIRGyDbaw6nV/5l7Whx8AjwcIoOdFjCY4psxeDpU/RTDoHF1+kGxJkqug0V5XzYI720EY6+0SN8XFBgOhXGNCfWg4IFQHOtYOuL2M75Nr6+fC6CMczmNT+adi6fRYe/2JlQNw3v7FJiFIi5n+x+nyhFIjLzbYjQvKwwWoF+Keaua5hQBD/XmP4nc56vZueD2BCe1b6TGrMRJpziGyh7d1l046AJrAxETV2mzCpTn+a55OLb9hm6v8YqS9d+nvtIFbTvVwmSJNVkB59PD4BkH0qFi3mnSvWT46pfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D2YTQR4kVi07mVUXoM7ogXNLlXVpGhLewzGsT6EnZHU=;
 b=JWOD7Em0KRj2/b2TGc2wmvTSRaoDrgOwJFbKZMvDrztf1Ewfn6npj2HPv+CwwfENTVlLTz86gF7g4K7EsXP2jFxpEqQMl51V2b2buaHrFKRahmEVZoZFK3iQemf9Fem1wDGYNfMnhby0xthq7Vk1hzWw0JhfjYOLUiiow/jSWqI=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Wei Chen <wei.chen@arm.com>
To: <--to=xen-devel@lists.xenproject.org>, <xen-devel@lists.xenproject.org>
CC: <nd@arm.com>, Wei Chen <wei.chen@arm.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>
Subject: [PATCH v2 10/10] xen/x86: add detection of memory interleaves for different nodes
Date: Mon, 18 Apr 2022 17:07:35 +0800
Message-ID: <20220418090735.3940393-11-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220418090735.3940393-1-wei.chen@arm.com>
References: <20220418090735.3940393-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: 8fe2667f-5c83-42ed-43f9-08da211b2a8f
X-MS-TrafficTypeDiagnostic:
	AS8PR08MB7791:EE_|VE1EUR03FT021:EE_|AM0PR08MB4402:EE_
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB4402701740F880166D0971C99EF39@AM0PR08MB4402.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 5vbjxV65qalRGNW5ycXmUv+w0iYAcmkTaStqPKnnMYYqR5Xzuab2REBMdjGyiGGEXxFDuEB83IZkl/+HM3EUGXVrs9wYDRWr3lKgedgA4t2CY4luQDmcLg6K0uP07QM+gB2RhNzhuc1cbNYm5SX78Dz0zcagN18/ymFNhFyXd4NuA3T+D2bHlv2Yr7DychNA83lEWnH8PJ5Zbp4YyS0xfpH4EssaV6TT+4hXCXJeHyQJo+ks7rmfQJS59sqiZnqkpUMFkOpuS8ZRYvbrroMoFY5jnzI7xnQvo1pzy3kTHuPugTbb+STF+8S7JO70Ah0OQaXhk9XMjwxXoaoG0cSCcW/mtlz4+IQZHo6/v35QD2MSKK1OjcPEFniJ68Eie934IMlQz9w7u7XN/4I6UZbOYyhredIVU01qKs2EwSbVL7+PGxQe99lQwdc44XzzWb+faPmDEsPZNZCjMpwXuXJEcU2kbuy8GJeT9CmkvboAB4dXGJVs1GaRBvmUnYhgcqHifwZdx3acqrusyliqlwZviCvycUpAC9unkHMUbZC2yjS49+9wmCV3MIozf5C4UVrbSZ9iPV1ljZsIeOls6LiWZQT57zlNOE56Qz1uzwr8hkQQyBdXeE0Nu8t7EDYahmHC5drbARKDZQWtdGummQO/97Fc/EDcWTCEOXrISS740SkdtIACsbKzM2LMjuEEj4Khz+5/5fpzHZtAN0iBR2/fQw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(8936002)(6666004)(7696005)(8676002)(316002)(356005)(26005)(1076003)(336012)(426003)(70586007)(4326008)(86362001)(36860700001)(5660300002)(44832011)(83380400001)(70206006)(2616005)(81166007)(47076005)(186003)(36756003)(2906002)(40460700003)(110136005)(508600001)(54906003)(82310400005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7791
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8cf1de3b-8cb8-4123-5504-08da211b2569
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	fNTokM2cT+IhKc36fE7XL8XYfarcIIcbNawRbwsPJW7WB2nn6gxgg0fawG4QfJKenpbd7N7H0BvcYlAbzOSlecRkYZwxnINx4Ws6Oz3f5tgu2At5v+y0qzmZQ+VaBogZUQxhBUEZeNrD7Q3X7ko7PtHZsDOymnTN5r2Ro2a/jaOvaIq/TRHonjg5XUHoUYdKdWejufiX+NjYGQbWy91KDMMbkzwLepl7imO4amQn6bhfd7axDsA2kKv35tfZUnTGORhA3EOYyvmgh/56TY8YQnPFeyJsvfS7ZZwbnGSeQY0lzuD/f4/zFz/MxAnsmC2B8kmrLsUHsB9aQrguHwAaQPAlBuYwuwGxkQr6qa4jhALQ1F43ZxLEAbmNuo6X58BjZGeRDPz2gmen5Ci37kHYrXtiOBriXqoHmQYTMWDJOVzQdE1d99Xt2btL49g+KLrB70hDj1MHjE+keCV4i3ef8tWnQem4Uq5dwcIQkE3nEWIFseoVx3Tt4zQgBNbF7r0zA8x6dVpJkZVlKNZNKgKglk/+2IaePDI9rgg6xHegeJqL1dZbEjC11Qc4BpE32v8Kpuf8S2Wb8cdWa8LQ66Eojxw6eWva1m1B1D/wj5qudHcAfGuflEIh8Vv47Q/wDEB6Dz+yZEWtpx5+2vu6haB60Izyz4alZf3GSmpB1yL3VmxDVVhyl6J5ITloWFpUxX8L
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(44832011)(186003)(450100002)(26005)(40460700003)(110136005)(36860700001)(7696005)(82310400005)(2906002)(54906003)(316002)(6666004)(336012)(70586007)(47076005)(426003)(70206006)(2616005)(81166007)(36756003)(4326008)(1076003)(508600001)(8936002)(83380400001)(86362001)(8676002)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2022 09:09:38.6829
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fe2667f-5c83-42ed-43f9-08da211b2a8f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT021.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4402

One NUMA node may contain several memory blocks. In current Xen
code, Xen will maintain a node memory range for each node to cover
all its memory blocks. But here comes the problem, in the gap of
one node's two memory blocks, if there are some memory blocks don't
belong to this node (remote memory blocks). This node's memory range
will be expanded to cover these remote memory blocks.

One node's memory range contains other nodes' memory, this is
obviously not very reasonable. This means current NUMA code only
can support node has no interleaved memory blocks. However, on a
physical machine, the addresses of multiple nodes can be interleaved.

So in this patch, we add code to detect memory interleaves of
different nodes. NUMA initialization will be failed and error
messages will be printed when Xen detect such hardware configuration.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
v1 ->v2:
1. Update the description to say we're after is no memory
   interleaves of different nodes.
2. Only update node range when it passes the interleave check.
3. Don't use full upper-case for "node".
---
 xen/arch/x86/srat.c | 49 +++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 45 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/srat.c b/xen/arch/x86/srat.c
index c3e13059e9..53968e4085 100644
--- a/xen/arch/x86/srat.c
+++ b/xen/arch/x86/srat.c
@@ -271,6 +271,35 @@ acpi_numa_processor_affinity_init(const struct acpi_srat_cpu_affinity *pa)
 		       pxm, pa->apic_id, node);
 }
 
+/*
+ * Check to see if there are other nodes within this node's range.
+ * We just need to check full contains situation. Because overlaps
+ * have been checked before by conflicting_memblks.
+ */
+static bool __init check_node_memory_interleave(nodeid_t nid,
+                                                paddr_t start, paddr_t end)
+{
+	nodeid_t i;
+	const struct node *nd = &nodes[nid];
+
+	for_each_node_mask(i, memory_nodes_parsed)
+	{
+		/* Skip itself */
+		if (i == nid)
+			continue;
+
+		nd = &nodes[i];
+		if (start < nd->start && nd->end < end) {
+			printk(KERN_ERR
+			       "Node %u: (%"PRIpaddr"-%"PRIpaddr") interleaves with node %u (%"PRIpaddr"-%"PRIpaddr")\n",
+			       nid, start, end, i, nd->start, nd->end);
+			return true;
+		}
+	}
+
+	return false;
+}
+
 /* Callback for parsing of the Proximity Domain <-> Memory Area mappings */
 void __init
 acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
@@ -340,10 +369,22 @@ acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
 			nd->start = start;
 			nd->end = end;
 		} else {
-			if (start < nd->start)
-				nd->start = start;
-			if (nd->end < end)
-				nd->end = end;
+			paddr_t new_start = nd->start;
+			paddr_t new_end = nd->end;
+
+			if (start < new_start)
+				new_start = start;
+			if (new_end < end)
+				new_end = end;
+
+			/* Check whether new range contains memory for other nodes */
+			if (check_node_memory_interleave(node, new_start, new_end)) {
+				bad_srat();
+				return;
+			}
+
+			nd->start = new_start;
+			nd->end = new_end;
 		}
 	}
 	printk(KERN_INFO "SRAT: Node %u PXM %u %"PRIpaddr"-%"PRIpaddr"%s\n",
-- 
2.25.1


