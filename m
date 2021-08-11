Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C96A23E8E8C
	for <lists+xen-devel@lfdr.de>; Wed, 11 Aug 2021 12:25:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165634.302702 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlQL-0003Vk-9L; Wed, 11 Aug 2021 10:25:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165634.302702; Wed, 11 Aug 2021 10:25:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlQL-0003R7-3o; Wed, 11 Aug 2021 10:25:25 +0000
Received: by outflank-mailman (input) for mailman id 165634;
 Wed, 11 Aug 2021 10:25:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9qiF=NC=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mDlQJ-0000BQ-C1
 for xen-devel@lists.xenproject.org; Wed, 11 Aug 2021 10:25:23 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.72]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5bb3f0cb-7f39-4dd8-a055-c25af50621cb;
 Wed, 11 Aug 2021 10:25:14 +0000 (UTC)
Received: from AM6P192CA0062.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:82::39)
 by AM4PR0802MB2129.eurprd08.prod.outlook.com (2603:10a6:200:5d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.21; Wed, 11 Aug
 2021 10:25:08 +0000
Received: from AM5EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:82:cafe::4b) by AM6P192CA0062.outlook.office365.com
 (2603:10a6:209:82::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14 via Frontend
 Transport; Wed, 11 Aug 2021 10:25:08 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT034.mail.protection.outlook.com (10.152.16.81) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.14 via Frontend Transport; Wed, 11 Aug 2021 10:25:07 +0000
Received: ("Tessian outbound 077ab11054bf:v101");
 Wed, 11 Aug 2021 10:25:07 +0000
Received: from a16bea742b4c.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 B64856EC-77FB-4548-917B-837E6E508F1C.1; 
 Wed, 11 Aug 2021 10:25:02 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a16bea742b4c.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 11 Aug 2021 10:25:02 +0000
Received: from DB9PR01CA0016.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::21) by AS8PR08MB6374.eurprd08.prod.outlook.com
 (2603:10a6:20b:338::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.13; Wed, 11 Aug
 2021 10:24:59 +0000
Received: from DB5EUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1d8:cafe::ae) by DB9PR01CA0016.outlook.office365.com
 (2603:10a6:10:1d8::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14 via Frontend
 Transport; Wed, 11 Aug 2021 10:24:59 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT045.mail.protection.outlook.com (10.152.21.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4415.16 via Frontend Transport; Wed, 11 Aug 2021 10:24:59 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Wed, 11 Aug
 2021 10:24:56 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.87) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Wed, 11 Aug 2021 10:24:54 +0000
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
X-Inumbo-ID: 5bb3f0cb-7f39-4dd8-a055-c25af50621cb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yC1y+9c87f0UwnCrstHNg1I3E3rdhAZoIxzbKmzwRo8=;
 b=iR0KxxiLWFg5mq2ieLeoh941OaA6hums/6tyNvOvVxRyGhv2K8Q7dhTgvcLtynV40Tt3fmSzAnpX/D0vw9O/giGEQDiQ8JRFV6A+/4sfK2nn20Y0prPseumD+pZzweVcn/0jbEmxq90T1x/WMWi1M142FP70v/7JpKri1GCQkj0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: ac0cb8f489a23c67
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S0nK7IOKYkG47WFN7au4Iy1q/pSuZ5TUAy82tNeUFVgASM8f5I3uIRDryLcXaPed1oswHzjOTXOjYvuinWPsb6gAKLLmMhT86apAgRANUg3YxzFNusS784qeXW0RnGz7ytneDAQXF7lwnHJW3C9RClniKmH31TLj6IUn5CTGjx9ZlLHDnUDmxB2bWjLLVI9A2tvJA95uwxilv+4o9Mxa83f4sDkvVx9Z7pvLpWH0HbJe0ViQcmegAbRRqNF/8YfkxCjFLd0k4SWitKX5fLVAKK/jBTGmwJbmHmKHXOT2dQqTa+Tkw+4CEDkT8b35U4M4w1do65AyPXsuersM9lDyBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yC1y+9c87f0UwnCrstHNg1I3E3rdhAZoIxzbKmzwRo8=;
 b=SuvoDjZICGqn/1qJXl6DogTFBzjmApNxBLB6Ls+tzajsY6wbo0DjdxsD5Eii9e1w88UB0N7XvlheQpFbstye99LnBfn/zTFg1mqwWlVbEjLqCUbUZvpwmDk7ZJT0aWeaBOl5jFnxu7M2wwgjOKBrJcRBC7h1MK7lKEDMpdPaCxIuc8PB7viBHJ728mQxMIa96HI+lQtEipcpTZIO1Ada/0UzynPO9Mno4TjdQhGFXKnqGi34QJeOiwKEW54hSzX7rVnPY8oRuPDxmQ/iKkmaz/XtJ1wOtqh8kJOg5BV9WzXFWzTO5/Md8D373FTlvfzosx8oXgkBck9Q5uXbPXe6eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yC1y+9c87f0UwnCrstHNg1I3E3rdhAZoIxzbKmzwRo8=;
 b=iR0KxxiLWFg5mq2ieLeoh941OaA6hums/6tyNvOvVxRyGhv2K8Q7dhTgvcLtynV40Tt3fmSzAnpX/D0vw9O/giGEQDiQ8JRFV6A+/4sfK2nn20Y0prPseumD+pZzweVcn/0jbEmxq90T1x/WMWi1M142FP70v/7JpKri1GCQkj0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Wei Chen <wei.chen@arm.com>
To: <wei.chen@arm.com>, <xen-devel@lists.xenproject.org>,
	<sstabellini@kernel.org>, <julien@xen.org>, <jbeulich@suse.com>
CC: <Bertrand.Marquis@arm.com>
Subject: [XEN RFC PATCH 10/40] xen/x86: Move NR_NODE_MEMBLKS macro to common
Date: Wed, 11 Aug 2021 18:23:53 +0800
Message-ID: <20210811102423.28908-11-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210811102423.28908-1-wei.chen@arm.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 539a3f84-f619-4bff-341a-08d95cb24aec
X-MS-TrafficTypeDiagnostic: AS8PR08MB6374:|AM4PR0802MB2129:
X-Microsoft-Antispam-PRVS:
	<AM4PR0802MB2129A17AC22A09771851B8079EF89@AM4PR0802MB2129.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:820;OLM:820;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 SViw6guEkDkhzEZtUF5EQnh4oyl7z3li6QoNBoBpR9/vEidq+TJKvTJALoSRtzKXGq7kVug62zek+sgNmCVB611oodiyFLE2815mg9p228vcf/RnlKT0PGxU48MqKKdjWkDujphJscUK6RHoVm6tSY1/RHnU5byOvg1C9HpAw4jVrLG+C9EbJMYM1v9atbFhJMk2EyFiaKc7deoyAhTgusk+1Ixje/FYFsGe8sfU4Gxv3APLJOGvLv2YKixodNaIWkis90zoNvUVH4hrgjzd7Nbmzu1e8HzYNUHIkwa1DeyW2IMW9EIt19IH8BBfwgg47Uf9WNK7SyNRAhkn0463P1bAZVaQQ6dU2dOoa+VW03O8c25c8KJuimjfqda3cK1NKkSxgEM08onpON/1CCDNtZjwP0tozMmhgwzZ4eQIyF+9SXz5j/a7rNUmS5ihb+ZzNTX1xyZxBn1hiBvmqeb8eMSm3OXghQ/7IKQKPppxs6hzX0R4OZGR9X9drValQkVSkIU0B0tFAd4/mYQLlcUIp2yqAoloJQrSDHE3FvlCycyKyKCSocchnkPavmHXr9pZ6lM7+UvK7vq32hmrJ/Xmde7BUSAA4ay26bCsVXGDvzD21iYSxbhSVuQRDKIv9I8nEgzE1AQJC01yhPfLBpakAkY3wW+6JycL1dfS9nsAd98a6kdW229A934UpsyB74oMnCvi4v8YRYPhyDlDLHfNwzQuKGCeqrz8/x6SjcNd07Gyp/PPn9NOOYmx2WbipkJLMUdbGrLjbIoBnIGaK2uO37wU3q++cEp9ehhHkBXu6Eo=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(396003)(376002)(346002)(39860400002)(136003)(36840700001)(46966006)(316002)(36756003)(86362001)(5660300002)(2616005)(47076005)(44832011)(336012)(110136005)(82310400003)(356005)(26005)(83380400001)(4326008)(8676002)(426003)(70586007)(34070700002)(186003)(81166007)(8936002)(1076003)(7696005)(478600001)(36860700001)(70206006)(2906002)(82740400003)(36900700001)(2101003);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6374
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6ea05fbb-1078-4a78-0879-08d95cb245d2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	EvzSVJBTnieBu/e3AF59eRqC6jeZHJSP1mEIJkjUDiCwMT1EbjIfaglli4xyPFnK3/UzzQhBKqM0G1twazJLGlutyZdcET8Dh3pNG0vnItxcWQpViSUTUHzteNcAvETHjywIfkqnudP09Y0popO1cJnAy9Qi/qft6BIOSnjCEROWS1DY8HYwbkicupzuTMUtZzr/UBYC4Va20vDE2g7gON8fLOz9g5NIFLqI/FkJZOQuNn/YzJKmAzSWFPe0Zegu3tVtmtfPGv0uUv79Xn6kT8rApvoMR87ENTFsDFQs6vGpRd6DQX7LVcZlK0qe+qehTXlj5VQp1OeSV2M2j9AxGbu8tyfrfDGNJSyYd9UxXxaKuJG8HEUN6gJanWpIfaKmpQgCGSPy13TAJUhtE8+kCsWIYwe33p5oco1Yc4F46nauHCG/U9Uf8kIswgzXLOxm6SSOeeRklr1457eQh17PfkXJlzYCkpbbqyroN5TZWsY1KcAqQgeOwu9xLz8dwFeCiRjJHuL0Ube5BbxpfUwW5U0XHzffSllGG7V6xJvaLUAmDqP/5S173ieGaF+kTHlFBHI1G+AF5Z60Bp5iIAK+KKb6Vsg3wMLuicCgpjz6J0EfLPfVbHrwT/QH2Pfgqp8HoApraLZMXaX2MGdM784LxB3nQsVvGqBTQxzCPqiDDx6FZLHa1dL2U+ZrS9kFvcBDp0PAas1NSyzcB6906BUF9HJkDveHQbXR0+cMb0mR3+o=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(396003)(136003)(39850400004)(346002)(36840700001)(46966006)(83380400001)(426003)(2616005)(7696005)(44832011)(8936002)(2906002)(70206006)(47076005)(478600001)(8676002)(1076003)(316002)(36756003)(186003)(82740400003)(4326008)(82310400003)(26005)(81166007)(110136005)(336012)(86362001)(36860700001)(70586007)(5660300002)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2021 10:25:07.9974
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 539a3f84-f619-4bff-341a-08d95cb24aec
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4PR0802MB2129

Not only x86 ACPI need this macro. Device tree based NUMA
also needs this macro to present max memory block number.
So we move it from x86 ACPI header file to common NUMA
header file.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/include/asm-x86/acpi.h | 1 -
 xen/include/xen/numa.h     | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/xen/include/asm-x86/acpi.h b/xen/include/asm-x86/acpi.h
index 7032f3a001..d347500a3c 100644
--- a/xen/include/asm-x86/acpi.h
+++ b/xen/include/asm-x86/acpi.h
@@ -103,7 +103,6 @@ extern unsigned long acpi_wakeup_address;
 
 extern s8 acpi_numa;
 extern int acpi_scan_nodes(u64 start, u64 end);
-#define NR_NODE_MEMBLKS (MAX_NUMNODES*2)
 
 extern struct acpi_sleep_info acpi_sinfo;
 #define acpi_video_flags bootsym(video_flags)
diff --git a/xen/include/xen/numa.h b/xen/include/xen/numa.h
index f9769cba4b..5af74b357f 100644
--- a/xen/include/xen/numa.h
+++ b/xen/include/xen/numa.h
@@ -11,6 +11,7 @@
 #define NUMA_NO_DISTANCE 0xFF
 
 #define MAX_NUMNODES    (1 << NODES_SHIFT)
+#define NR_NODE_MEMBLKS (MAX_NUMNODES*2)
 
 #define vcpu_to_node(v) (cpu_to_node((v)->processor))
 
-- 
2.25.1


