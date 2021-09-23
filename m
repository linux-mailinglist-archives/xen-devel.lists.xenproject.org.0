Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 476DA415DBC
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 14:03:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193815.345271 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTNS2-0005fF-4H; Thu, 23 Sep 2021 12:03:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193815.345271; Thu, 23 Sep 2021 12:03:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTNS1-0005bs-Vn; Thu, 23 Sep 2021 12:03:41 +0000
Received: by outflank-mailman (input) for mailman id 193815;
 Thu, 23 Sep 2021 12:03:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fewu=ON=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mTNS0-0005bO-O6
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 12:03:40 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.2.79]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4961292b-1c66-11ec-ba2e-12813bfff9fa;
 Thu, 23 Sep 2021 12:03:39 +0000 (UTC)
Received: from DU2PR04CA0163.eurprd04.prod.outlook.com (2603:10a6:10:2b0::18)
 by VI1PR08MB5440.eurprd08.prod.outlook.com (2603:10a6:803:134::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Thu, 23 Sep
 2021 12:03:37 +0000
Received: from DB5EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b0:cafe::ff) by DU2PR04CA0163.outlook.office365.com
 (2603:10a6:10:2b0::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14 via Frontend
 Transport; Thu, 23 Sep 2021 12:03:37 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT037.mail.protection.outlook.com (10.152.20.215) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 12:03:37 +0000
Received: ("Tessian outbound a492f2284909:v103");
 Thu, 23 Sep 2021 12:03:37 +0000
Received: from 19d892eff777.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B935D0E8-7C46-4B1E-960D-060BEDD1953C.1; 
 Thu, 23 Sep 2021 12:03:22 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 19d892eff777.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 23 Sep 2021 12:03:22 +0000
Received: from DB6P193CA0014.EURP193.PROD.OUTLOOK.COM (2603:10a6:6:29::24) by
 VI1PR08MB3837.eurprd08.prod.outlook.com (2603:10a6:803:ba::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13; Thu, 23 Sep 2021 12:03:20 +0000
Received: from DB5EUR03FT032.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:29:cafe::2a) by DB6P193CA0014.outlook.office365.com
 (2603:10a6:6:29::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Thu, 23 Sep 2021 12:03:20 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT032.mail.protection.outlook.com (10.152.20.162) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 12:03:20 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Thu, 23 Sep
 2021 12:03:14 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.87) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Thu, 23 Sep 2021 12:03:13 +0000
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
X-Inumbo-ID: 4961292b-1c66-11ec-ba2e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GITypNRUWivldCkDa8kIMuzSIJwemWwJe9dN6aK1m/A=;
 b=Bqi4g2rSfJJh7O7sF7hJH30m6VkoukrC8wtlB/nc/OESL/27P7tb4yua3NrA7h0RNriOrSeQ4DrH5P209lJYeUyVVYnqtzPDxy5WQOj1NLtqe7EqWEs6f62PsesMLYSZ5gV2Pz4cR4H6do1/vYuSjFapFCyXZ1RPuYTfuPqW4u4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 45cdde9f39e78528
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ex5eH6YsdkCyllM+8FYxI4cJTlxkKWGwBI6gubTjguBZNWCQnJJ+kZGEk3Js7DyCMiTkj6KQJUXIK/x6bztVGtp2mirab+wX9TOhXKZHyC9nXB2NqN++BZt/P0LyH14enK+aHx0Rf7xHJeSzsr9AOMnfjBPTjYc3WAR9ErhXoKRZTdWzdiX0VOpfRxtgD/T2FSwlL5ODpArVxRLIorj2ZMIeOsTpW51o8wNb+5he7/fPRPZqFKqVNLu/GL/EfID2plAqwvqpETs2cVJQ0tuKOnY5h98ePGR6AeY3J1EG3g3KyV8osvPr8KwQe0Ev3e4N7Z6PizPu0TsUYIDE5W5IdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=GITypNRUWivldCkDa8kIMuzSIJwemWwJe9dN6aK1m/A=;
 b=n7GWtL+gydl6NQEfDRnAeQ8IXjWJeiqf/lh4Q0Pc8kPs6l/9DmolJbFiQ60bY+pm4ehhm0Qu6GQ/PRNjquDz8fcJI5s9cBJ+lpLSwCIUytQGVT7PBc46jar6ARAl0cYbc4O8wwYLx0Ef0nSfrMB/7T0nv1BY0AnoneNrOCZiL6KnBATZEKG3hiBF0gF9nAsafzqLGoIV+YrLKq79G+f/zKBpI5HC7rrLA9Fh9fhVrSUZRYhmDFdHiDbFK8vl6r9kN3g19O71BCIyvqM9/GVaF+27urtsxAdEUkomcu1CMvii93pL5eSbmtnbTrwMFT+fHf1j5d5J+NgBVdUvH+Pw/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GITypNRUWivldCkDa8kIMuzSIJwemWwJe9dN6aK1m/A=;
 b=Bqi4g2rSfJJh7O7sF7hJH30m6VkoukrC8wtlB/nc/OESL/27P7tb4yua3NrA7h0RNriOrSeQ4DrH5P209lJYeUyVVYnqtzPDxy5WQOj1NLtqe7EqWEs6f62PsesMLYSZ5gV2Pz4cR4H6do1/vYuSjFapFCyXZ1RPuYTfuPqW4u4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Wei Chen <wei.chen@arm.com>
To: <wei.chen@arm.com>, <xen-devel@lists.xenproject.org>,
	<sstabellini@kernel.org>, <julien@xen.org>
CC: <Bertrand.Marquis@arm.com>
Subject: [PATCH 03/37] xen/x86: Initialize memnodemapsize while faking NUMA node
Date: Thu, 23 Sep 2021 20:02:02 +0800
Message-ID: <20210923120236.3692135-4-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210923120236.3692135-1-wei.chen@arm.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 18a390a7-0593-4635-5883-08d97e8a2cda
X-MS-TrafficTypeDiagnostic: VI1PR08MB3837:|VI1PR08MB5440:
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB544050C4CA11E24DDC4217369EA39@VI1PR08MB5440.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:4502;OLM:4502;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 /6Mt1pU3T1qMlhujo/qYgxQjM8btZjryc7/ZChhFF55NHYVYzQlrkAzY6V39iBC49GpJn/r4gJjrvGBmfsGPbGXglIchf0MRGwZzziaawlVKXCPJeVks0B+ZO+X9BaTsNuyPjJWrUBMVt5nSEplkDAMzzcsLQEt0lrP52wZQdqdBI/iEOddItU/JXE+37kHcsJ2xUiWYjU3wsGKQM3CZcHsGgLkeKWLd0wBQ08Bt3FWICeHIfq5Zcw4qNmcTryEoi7pit9QUuLIQA+9tAtVZ7HnfgHW8fFN/oLfRhRwGz7vUTHZjkb2JyG0Aj5rh3S50XhkCaR4NFxT07Ue4tE1taExq9WNBnB7EwcN/S3V7YUfUu+r/KW2JFXi3N8DjNCNFVO/ThnD33lXI+mKQJGZvI0m0diF/fliv7Xa4l+eXNHZY67WyDtpxCB2GrcgZv7EYadh6yMmTkQZpGpT1E4rVHvQAYuqyqfx5qSPZiTGFLc7H5XQAGMNKUCAMoalXjWZClxHOHZMLUs3JSx1LmAeVuaxVuSGZGP+gCoEj3vVbf+U4GesXJV/zSb0GH/S6fuPooLRyxtJgjFMpGwvXm5QCY1SoJZHdDtDEUFSezobqKvePPC9YFxdY2si3kUvQHkdIeQLRU+NVJ1nRYbfnduG4kNGcEkwnRpaPsiT3BXxZIikjFPpgrJFujGrngclRzdssZ4nx5zHIgooV2pQSHvrA25+PFHf8dGsnoPWr8SfstfA=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(44832011)(4326008)(8936002)(83380400001)(2906002)(70206006)(36860700001)(356005)(110136005)(426003)(2616005)(8676002)(47076005)(81166007)(5660300002)(508600001)(70586007)(82310400003)(86362001)(36756003)(316002)(186003)(336012)(6666004)(7696005)(1076003)(26005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3837
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	3b7e8088-a045-4af3-395a-08d97e8a22a2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	gNdGmT+AwqJxVwjxXhTrZjD0hq/hvQ9NcEMXvUn9yJfiE1NZYYMCVstERHUNIIF2SYR+qtu6SVRgutpU46h6+jUTmDJojz9WQ1ecAO7XLFkY9qBrHMYh/OjNXJE2TBPmD5gj6SHKBDjcjVQXrA6nZy7uz7fnIvW7ZYdZPydh2lRZ/1kvo9CC8rWFhsiba9IeFrMXrwH/wZ0rlNkgy+7iYjjIE3/e7Kd0i1KSBSnzL3UWsdsuxUO1tRYvCZK90g3Bj6VaxEFc6AwLkLmIhBB6tcw2iUBgq9vOlLFrofpCxVoYM+7mwkEUEeRNtBNGwrR8Yz0e8G9mWFPwJ48HnvyK9+lcLwPlOXOGKmB40KpPEPGAY4TcISjPBui32kiI7eRpJTGfeQyaUcn+bKmUFEB1TF7uT/x2vB2gny2Th8K3n9dIkHhkq228Z8J8pwGDpSTKs1DfgKshojD0TQYnRzz+gu4Q3Ohmicd3wcBzf92ipY3CT/V/lNP23PfOgNWIKRhdUQOH9bc1lAmsSvsL6Q/SHeKd3G3sLHHgAQHos2NAIJkPpHayFPEZgVoOrM21vGjER0YQAtOtBg0vzwx+/pMRi4foFlQ5AO/mdVKjHv+U8ySVwWWCwBDxm8QCizru/o6O//lLjYtd13CrjuW6bcE+q24z2clURpc+Pus6aoVVnRXJHvAueb8ygthYi/Bi5+0cv6y1UqqFdVvjPohKsCA5Ig==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(44832011)(8936002)(4326008)(508600001)(70206006)(2906002)(426003)(110136005)(36860700001)(81166007)(2616005)(8676002)(47076005)(5660300002)(70586007)(6666004)(86362001)(186003)(336012)(316002)(82310400003)(36756003)(7696005)(83380400001)(26005)(1076003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 12:03:37.2649
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 18a390a7-0593-4635-5883-08d97e8a2cda
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB5440

When system turns NUMA off or system lacks of NUMA support,
Xen will fake a NUMA node to make system works as a single
node NUMA system.

In this case the memory node map doesn't need to be allocated
from boot pages, it will use the _memnodemap directly. But
memnodemapsize hasn't been set. Xen should assert in phys_to_nid.
Because x86 was using an empty macro "VIRTUAL_BUG_ON" to replace
SSERT, this bug will not be triggered on x86.

Actually, Xen will only use 1 slot of memnodemap in this case.
So we set memnodemap[0] to 0 and memnodemapsize to 1 in this
patch to fix it.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/arch/x86/numa.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/xen/arch/x86/numa.c b/xen/arch/x86/numa.c
index f1066c59c7..ce79ee44ce 100644
--- a/xen/arch/x86/numa.c
+++ b/xen/arch/x86/numa.c
@@ -270,6 +270,10 @@ void __init numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn)
     /* setup dummy node covering all memory */
     memnode_shift = BITS_PER_LONG - 1;
     memnodemap = _memnodemap;
+    /* Dummy node only uses 1 slot in reality */
+    memnodemap[0] = 0;
+    memnodemapsize = 1;
+
     nodes_clear(node_online_map);
     node_set_online(0);
     for ( i = 0; i < nr_cpu_ids; i++ )
-- 
2.25.1


