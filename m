Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25050415DCD
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 14:04:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193828.345359 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTNSW-0001En-K6; Thu, 23 Sep 2021 12:04:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193828.345359; Thu, 23 Sep 2021 12:04:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTNSW-0001Aq-Fv; Thu, 23 Sep 2021 12:04:12 +0000
Received: by outflank-mailman (input) for mailman id 193828;
 Thu, 23 Sep 2021 12:04:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fewu=ON=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mTNSU-0006xV-O6
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 12:04:10 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.2.78]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 52d26e10-1c66-11ec-ba2e-12813bfff9fa;
 Thu, 23 Sep 2021 12:03:54 +0000 (UTC)
Received: from DB6PR0501CA0042.eurprd05.prod.outlook.com (2603:10a6:4:67::28)
 by AS8PR08MB7063.eurprd08.prod.outlook.com (2603:10a6:20b:34b::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Thu, 23 Sep
 2021 12:03:50 +0000
Received: from DB5EUR03FT060.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:67:cafe::7f) by DB6PR0501CA0042.outlook.office365.com
 (2603:10a6:4:67::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Thu, 23 Sep 2021 12:03:50 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT060.mail.protection.outlook.com (10.152.21.231) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 12:03:50 +0000
Received: ("Tessian outbound 78bf72cc015a:v103");
 Thu, 23 Sep 2021 12:03:49 +0000
Received: from efa9648030a2.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 1D931F74-A602-4166-9477-DCDECB6C177E.1; 
 Thu, 23 Sep 2021 12:03:39 +0000
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id efa9648030a2.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 23 Sep 2021 12:03:39 +0000
Received: from AM5PR0602CA0002.eurprd06.prod.outlook.com
 (2603:10a6:203:a3::12) by AS8PR08MB6056.eurprd08.prod.outlook.com
 (2603:10a6:20b:299::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Thu, 23 Sep
 2021 12:03:37 +0000
Received: from AM5EUR03FT042.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:203:a3:cafe::2e) by AM5PR0602CA0002.outlook.office365.com
 (2603:10a6:203:a3::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Thu, 23 Sep 2021 12:03:37 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT042.mail.protection.outlook.com (10.152.17.168) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 12:03:36 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Thu, 23 Sep
 2021 12:03:30 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.87) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Thu, 23 Sep 2021 12:03:28 +0000
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
X-Inumbo-ID: 52d26e10-1c66-11ec-ba2e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R3iJbN9Z/D/BKsINPG8vU2TydxYMORgZ/IZECSVdK5M=;
 b=Ggp0q+0NQWfK5pP+hhB//iP7G7iXZPfX1DGS9RMH/wtqHgoV4DaqFVbqFH2TnHPJBXDMCqFt4X3k5RofMo49hcwz703ZrH2x8QX5QcaYXcNQSlAYvPjfhmzYCAwD4oPmxdpM/X7DkdtSlJV7OhHyGIdo9G6N809Gw8tgxPY4Xyw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 83fdd838382d77e9
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DX++omQpgcZwp+kr6tHlHTcpyAB+Vvy8DJGSREttDOQk6NE+8iBhIOiS4BowpabmLtc61cC6IuuCInIHKekfli7HziZVb9L0Mej2volYkKVUPcYK1jARPf8s6PALywczjmLshesI8q1ktBBO7xSFGvkME/jDP+qLUdpTSurUOWlHZfBmziaIyTp5DcrgwugISlenUsWM72DBBS/wWvJRccX6wYvU8OR5cV3F+FhMXAcmCgE6a1SBSwPa1dEui3lGq3KHwQMT3wdqqz5KF3SxpxKpa4kPaZJYc1IBE09KOW953LmPRN/wxFWLc2F+QcMKkpxWLRiOwpYfj4+UZnHJxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=R3iJbN9Z/D/BKsINPG8vU2TydxYMORgZ/IZECSVdK5M=;
 b=oOE3geR1EzoEqzzhmxhA9fj2MJ0BhJrv8c9LbCSw2WvOdfpye2b8+pBF3rLP2uLLXBiUQaBUp5pc5wnJw5x2a06Vn4PEEUWBniB+vT1p9YN+1InL+T14zy5QPNvMTlNhxYZ7Np/e0GUhPRjDZ0TJ4XXzqDMl0p1UcjrNk00WFEym7+wjahWYPTRpIpeTPdRtmj10sD5gOPsPHDOw/BsodzYliOnJ9tM8MHP9uMSss9/OI+dm6vIBzs6ieUou8VWKcSjMSM+FXgDEWbXOUqzgY1M8cI3N8qdrseS6D2PepI/qnz8ICMAF9VRYwotajqyoeQrLysLulZjSX5Hf/HtSdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R3iJbN9Z/D/BKsINPG8vU2TydxYMORgZ/IZECSVdK5M=;
 b=Ggp0q+0NQWfK5pP+hhB//iP7G7iXZPfX1DGS9RMH/wtqHgoV4DaqFVbqFH2TnHPJBXDMCqFt4X3k5RofMo49hcwz703ZrH2x8QX5QcaYXcNQSlAYvPjfhmzYCAwD4oPmxdpM/X7DkdtSlJV7OhHyGIdo9G6N809Gw8tgxPY4Xyw=
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
Subject: [PATCH 10/37] xen/x86: use helpers to access/update mem_hotplug
Date: Thu, 23 Sep 2021 20:02:09 +0800
Message-ID: <20210923120236.3692135-11-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210923120236.3692135-1-wei.chen@arm.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7b2db7cb-3fd0-4c98-015a-08d97e8a34a7
X-MS-TrafficTypeDiagnostic: AS8PR08MB6056:|AS8PR08MB7063:
X-Microsoft-Antispam-PRVS:
	<AS8PR08MB70639749A0D05D07A11FF28E9EA39@AS8PR08MB7063.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1201;OLM:1201;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 vrNke+rC7Y4uRjIOePPoBbp0K10EFlfOAa1JteBra5a220WkdIVq2PDEmG1rSqpPJrhuaek0f2saxSDPVm3isW3nc7GbGWICj12hO5OQhINKl8z4w8bgq+5et0dIE6yNkuuPfo2gCsVlt34kQDgf+ninOfUI95aGZ4VHOIIPM0rsVwLfD2vtxNbnU3cL14zOg4PvmXxOC/I4vA2aX76guSRdNPORVGAP4ai2lqGkrFpu0O6gM2qy+31AsqVz0A8V8UxOKIUEhz+mCWbIiTAl/2vkaGaaIJuWzxTqIzzBEnavZZ1LC1j3SG3byBfnxQxsJ8wyOOdKCo7Q6U063J7pFgoPNEXHPzllFqkuBFc258BO2TFjDwTuh/5rMvT+wXTzS8mOX7bvgL3JXQk66ituSM/A7ZEq/RDzoFWioNUPY7U4feKuWnx8uZijgoOQes+FnVpKNHPlMM5LRy2lOJmat5ecAsni9VNqLUaDk4v0Udhrm9dg/jYpscVUGUteUga4PmKjA6Yy6myxnTngR5r3e0ueRNX0vhS3ZIJfJBM2pkFgzPYdGxxmXoKS7qJBD765NBrDhVM5yWBCPpgELLKRgPyrsGrMpezk619H71iJQ3zH+hj2pIOIiF3ktnoSb8diMiecw/KDXzvxnWTu+GvFWS6uQMBSwtxuzFL+a/YPm6YRbKc1hAe35auEK1v0PL4gHBLn7jaLDTDmnJwA+WSuASn6gNkl9gawd5g3PQ40bdI=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(8936002)(2616005)(4326008)(36756003)(316002)(186003)(356005)(86362001)(82310400003)(8676002)(6666004)(110136005)(426003)(336012)(44832011)(7696005)(2906002)(4744005)(508600001)(47076005)(5660300002)(36860700001)(70586007)(81166007)(26005)(70206006)(83380400001)(1076003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6056
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	db419007-5be9-4e60-97a2-08d97e8a2ca3
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ddIXjuWvIR4rJulL5ser2ASyFimea4KxEVUk3CRnfdjJGL78aSdPMGA9H/4uTm/d1nZcE3PjaCMCSTyHmWs3Q3OO0RNYMRncHvy+Mkayyz/L4g574MFHCfy5WYoKe2VagK+i0w2sZNMHCGrSJTjuTru510HV/ue1uhijIQ5LxFRSQA56QY1R5JQx0crunJYMr2EnlrjC2ZpIRBXmwB20DC9ULeguw1rPZq3aYOjhRf9s5HbxD10U7V8W2CFxFy7NPhnCUXUcNUZOxm/vjjSjAV2pfnQ0kQU5AGNYl9usyvCdliWkyHN994iL4IWzEDjIXNniXnbaFmgIZ3o4O3hyrKXnRTUjcqRue6QNimq/zxME63Tz11SGU4ix3C2CSF2fGs9GlSvFMV7qhKcUd7Xk5LcpbtjySwvxAPT7LonYBRPWfofIKuA2cqm2EP5KWO1eDRvKhaL3kxl559M5/5z/nTvkkeLY3CqfU7d0EPwnXzHAkKfX0Bpy3cf/29p9oXNJij3wk8lDQDqfom/aOY5EogumrL7euvhL3+ZrEG4gykSjDXwEmI2UBnFcxthhzU0OuNYCVoJckPKUa/1Fbjv8nnhlkMC92/fSJ21tKaBLwGeJA0gcvviMOyVnjiWUTp8pBD4TeGZvYpNlPMM5Trt92b43li2JA5kMGSj179kOrjJTAQb5Ca9cL+yarz9D29sd/v5/xmz7SO66gR+7ohxnWg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(82310400003)(1076003)(36860700001)(4744005)(508600001)(70586007)(7696005)(70206006)(426003)(316002)(5660300002)(8936002)(86362001)(110136005)(4326008)(6666004)(336012)(2616005)(81166007)(2906002)(44832011)(26005)(186003)(83380400001)(8676002)(36756003)(47076005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 12:03:50.3502
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b2db7cb-3fd0-4c98-015a-08d97e8a34a7
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT060.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7063

We want to abstract code from acpi_numa_memory_affinity_init.
But mem_hotplug is coupled with x86. In this patch, we use
helpers to repace mem_hotplug direct accessing. This will
allow most code can be common.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/arch/x86/srat.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/xen/arch/x86/srat.c b/xen/arch/x86/srat.c
index 2f08fa4660..3334ede7a5 100644
--- a/xen/arch/x86/srat.c
+++ b/xen/arch/x86/srat.c
@@ -391,8 +391,8 @@ acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
 	memblk_nodeid[num_node_memblks] = node;
 	if (ma->flags & ACPI_SRAT_MEM_HOT_PLUGGABLE) {
 		__set_bit(num_node_memblks, memblk_hotplug);
-		if (end > mem_hotplug)
-			mem_hotplug = end;
+		if (end > mem_hotplug_boundary())
+			mem_hotplug_update_boundary(end);
 	}
 	num_node_memblks++;
 }
-- 
2.25.1


