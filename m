Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C641E3E8EAB
	for <lists+xen-devel@lfdr.de>; Wed, 11 Aug 2021 12:31:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165704.302851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlVu-0003RX-Ca; Wed, 11 Aug 2021 10:31:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165704.302851; Wed, 11 Aug 2021 10:31:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlVt-0003EA-Tp; Wed, 11 Aug 2021 10:31:09 +0000
Received: by outflank-mailman (input) for mailman id 165704;
 Wed, 11 Aug 2021 10:31:07 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9qiF=NC=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mDlRt-0002Qj-Hd
 for xen-devel@lists.xenproject.org; Wed, 11 Aug 2021 10:27:01 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [40.107.21.54]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8e31e048-fa8e-11eb-a052-12813bfff9fa;
 Wed, 11 Aug 2021 10:26:14 +0000 (UTC)
Received: from AM6P193CA0073.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:88::14)
 by DBAPR08MB5671.eurprd08.prod.outlook.com (2603:10a6:10:1a1::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.21; Wed, 11 Aug
 2021 10:26:09 +0000
Received: from VE1EUR03FT063.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:88:cafe::8) by AM6P193CA0073.outlook.office365.com
 (2603:10a6:209:88::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14 via Frontend
 Transport; Wed, 11 Aug 2021 10:26:09 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT063.mail.protection.outlook.com (10.152.18.236) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.16 via Frontend Transport; Wed, 11 Aug 2021 10:26:08 +0000
Received: ("Tessian outbound 79bfeeb089c1:v101");
 Wed, 11 Aug 2021 10:26:08 +0000
Received: from 841568cdc80d.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5E7B3703-1965-488A-879D-3374F72C818D.1; 
 Wed, 11 Aug 2021 10:26:01 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 841568cdc80d.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 11 Aug 2021 10:26:01 +0000
Received: from DB6PR0201CA0012.eurprd02.prod.outlook.com (2603:10a6:4:3f::22)
 by AM5PR0802MB2547.eurprd08.prod.outlook.com (2603:10a6:203:a0::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.22; Wed, 11 Aug
 2021 10:25:57 +0000
Received: from DB5EUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:3f:cafe::30) by DB6PR0201CA0012.outlook.office365.com
 (2603:10a6:4:3f::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14 via Frontend
 Transport; Wed, 11 Aug 2021 10:25:57 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT036.mail.protection.outlook.com (10.152.20.185) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4415.16 via Frontend Transport; Wed, 11 Aug 2021 10:25:57 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Wed, 11 Aug
 2021 10:25:44 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.87) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Wed, 11 Aug 2021 10:25:43 +0000
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
X-Inumbo-ID: 8e31e048-fa8e-11eb-a052-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kAd68KnXsqd+C2bIAP1n0fHZQ7iABbF7AodWabl+rLs=;
 b=NN7SNcQ/0ftHViax+fgQ4xFeXDVMAMUqM/UOiBUCPtcvKY7Qqj4J1ubpLbC9A+7aBsjxWDB6T2Nd3ymW+kf7LuooZuK5ly121gaw9LTkEOMVpX3iPWzEb2DIKkYUFaN1doFXutCPhnPEFyTFE71B3RWgnk5a2ZH9GqMoOAa+ex4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 815451cf1eaab556
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kkj1y8eDd3DDs0xSTi4okAKXQyi+0jFKfvIsS/swjVS27HhKUYkQEbQVD+7XWwfbkEH5Q68+dFc3zKI9ouFl+MnFftPrIOa+vqKNUktd4M/SgoFPlsa0IBjSTA/G8SwwkC76SXgftOFl1eTva2kmXYNlEWQqv7tE/5Wbz0V4hWN/OknCSvc8Mm258WCVnSRJQk9CDQk/SJ2Xn8ouubq1qq++owBOTEeRtuOqs6hMLCwtSIiwOGXEklseIZytUk44OdohuX71MRanmhAoyQpbI0SIERDtkWjmbSPjZ94s1tOpvq5kspHGJWqoD0TBIBEwEkEBd0mcvaTKqSwfnJL9TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kAd68KnXsqd+C2bIAP1n0fHZQ7iABbF7AodWabl+rLs=;
 b=D3BEQnoT9yVmoXKY7Nou5+sjJzrq7rL9U5CLBk07ebjqRErWVIpdFbmZz3d00fSqxF8TjqnVZbeMtWUDQmkQqJPZFYXTDH3RjFxLFQfRXZgPySVtYF4NwNXVZEsv9Bw72gusvNGWLgxitJBTFePQYCP5pB+V72oyiXMSvZCelYxeYJqpg6Sl1H/YoQy8SrmhxR7XD4rqp8co9w/5xM50uxZdz3pb3TF0N9o4PrQXL7j7/bHpcfBRZlzkojhwbZUVQso/Hm9/PItbb2URW3geQn9okUHiKHLw3P9UgubNlQ7KRUXlv15htp8gk6ud5A9RepXxN0j/gqh+sn4tzK/DUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kAd68KnXsqd+C2bIAP1n0fHZQ7iABbF7AodWabl+rLs=;
 b=NN7SNcQ/0ftHViax+fgQ4xFeXDVMAMUqM/UOiBUCPtcvKY7Qqj4J1ubpLbC9A+7aBsjxWDB6T2Nd3ymW+kf7LuooZuK5ly121gaw9LTkEOMVpX3iPWzEb2DIKkYUFaN1doFXutCPhnPEFyTFE71B3RWgnk5a2ZH9GqMoOAa+ex4=
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
Subject: [XEN RFC PATCH 30/40] xen: move NUMA memory and CPU parsed nodemasks to common
Date: Wed, 11 Aug 2021 18:24:13 +0800
Message-ID: <20210811102423.28908-31-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210811102423.28908-1-wei.chen@arm.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 87e20043-0a15-49ac-3f8f-08d95cb26f30
X-MS-TrafficTypeDiagnostic: AM5PR0802MB2547:|DBAPR08MB5671:
X-Microsoft-Antispam-PRVS:
	<DBAPR08MB56716850C4BBDC212BB2F9989EF89@DBAPR08MB5671.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:198;OLM:198;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 M3+bHq77CXZOa0tvzZI8sTsVYtx+e37qqvEpqa+1y/03HKea4cDavKtzEOPatFE8zYIf8YLnDrPJulY8dndRyKshhOs7MmJ2nLpAbKCDe/zicwD8PAI2swVjfwNpxxU09KUB/CBKb9PuIqWPuPTsz4m+IRO5fnaQ0XBXfMloq9314+4lhOLHLURSSZZzjHsmT7RFDOCg6wnflqywcZQNN40+QFNp+7C1nPcp8zyJKN0aD3Ma6IS4/dEabKO/mkPagBa9p8ruLO2VCFIlcGHcX1HG5XefK9hApWiVuQciMCZ+LGCpWfEPTfr7M5ipchdJPNBlrzpIedG+s6iL3xKoAEzc1RrTi13TnKoWMW3p8EG6SS+Fxr4LVSFPxqgVvU/NIQmkzfOlxWssUL8Ky6Dr2dtgqKeavOBJd0RGMJWOmN10pkLCKiWJ9JXmUoPpGof5sKVGYU0vdwG0bG5z026nrDkBmd4/NDnZ8Nh9FA7INqDy1tXBf054SW3XYtuJLnaUKxuhZanxtcFMyYNsL7V6XQyjOLMzdeiAD6YWtzIHRbHtgZIfynszftam98qREOcHU/ZECyOZWC5TXBhEM+rQYaAPRfRS8DUcOybg8GUFxgOyTk5HsvOKOwjRSV50qrGFyGjlegQbdBwem48WcfP7Icsm0E89ylG+vnv1P9iPLzo5zbuH2hoFJcRc81EVRjS3zMaUAJnfkS+hbnSbtYaVZcy44PRKqrwf8o/UjQINR49znDiT8+7296m1iT7OCI3L5YouURRo/pP1u8O/7iWH+e4rnsrco7rnb7x5w1z77aE=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(6666004)(8676002)(508600001)(82310400003)(426003)(83380400001)(336012)(2616005)(110136005)(186003)(36860700001)(34070700002)(1076003)(7696005)(5660300002)(86362001)(316002)(8936002)(81166007)(4326008)(36756003)(70586007)(47076005)(44832011)(356005)(70206006)(26005)(2906002)(2101003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0802MB2547
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	d16a6a5d-02f9-4fc1-79da-08d95cb2686d
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	tXxAPvp3I+QKKNblGzJxYwxqJAH8hWiTxw2HHrssR+T4fM+69BGk3rUxm0nplvG8m9ZQsAOqT650h/lPzk31n/aBWmQcp+mQm9jiZvFRGMvY8aBkxyzIzeifzQmC9469qYiYPFT7ZiahtjvkELxNC/JssOC+ypjvkawJ3K+MwHWOsqzv+yGFGaB0QEkvWQ2Q0yzVtdkzzKupRAy63pqH0/TqmvUlJPj42N1fnEbJEBy4pE/S48pRiVqg4qyTcmp6mH0xXGu8KrJPdwlloY7SUTwcOHGaSFHbCN1fgiU6DwzHvwbrcr6tETiTxg+bN+tP98Bxk+zpJZhGXgrOB7wNsFSB+Q/ZVszBdM6jFa1P+RwUBm/ADydTvAbMVB9iBlF9amr25PU0KRviXDC7T04p0/gHK7WhQxOpWtfmMcztdUPjJOKRuDm/1emy53uo3t5XonIRz0RlbGLj3QBHEliQoZEdnoTIdsp/Q/W1kgiZSmMocfDXBn/EmPHEtK9HlOgFRU0GCuiOtxofx51i4E2iraR0aNBgO+3KdcqF+qBRyQHT+ywcZMAoIV3JlkXsu0cehF4yJuLiMPO9aVEjK2A0ekAoh+oHROAJxMcVrUTa2xnv4TrWUqJGMRmyEMd9rkAFWzqmknUXVcpvZhR80LizW4tWZQLRd4UHeQnSxnwiWpdjsBBGsdWFWo63E6I35GSyQlp+U/eWcSpKrETTe2IIVjemed79RIhyigtEYgK5dk4=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(81166007)(1076003)(5660300002)(47076005)(336012)(110136005)(86362001)(6666004)(508600001)(8936002)(83380400001)(4326008)(8676002)(7696005)(316002)(36756003)(44832011)(70206006)(26005)(186003)(70586007)(2616005)(36860700001)(2906002)(82310400003)(426003)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2021 10:26:08.7803
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 87e20043-0a15-49ac-3f8f-08d95cb26f30
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT063.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR08MB5671

Both memory_nodes_parsed and processor_nodes_parsed are using
for Arm and x86 to record parded NUMA memory and CPU. So we
move them to common.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/arch/arm/numa_device_tree.c | 2 --
 xen/arch/x86/srat.c             | 3 ---
 xen/common/numa.c               | 3 +++
 xen/include/xen/nodemask.h      | 2 ++
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/xen/arch/arm/numa_device_tree.c b/xen/arch/arm/numa_device_tree.c
index 27ffb72f7b..f74b7f6427 100644
--- a/xen/arch/arm/numa_device_tree.c
+++ b/xen/arch/arm/numa_device_tree.c
@@ -25,8 +25,6 @@
 #include <asm/setup.h>
 
 s8 device_tree_numa = 0;
-static nodemask_t processor_nodes_parsed __initdata;
-static nodemask_t memory_nodes_parsed __initdata;
 
 static int srat_disabled(void)
 {
diff --git a/xen/arch/x86/srat.c b/xen/arch/x86/srat.c
index 2298353846..dd3aa30843 100644
--- a/xen/arch/x86/srat.c
+++ b/xen/arch/x86/srat.c
@@ -24,9 +24,6 @@
 
 static struct acpi_table_slit *__read_mostly acpi_slit;
 
-static nodemask_t memory_nodes_parsed __initdata;
-static nodemask_t processor_nodes_parsed __initdata;
-
 struct pxm2node {
 	unsigned pxm;
 	nodeid_t node;
diff --git a/xen/common/numa.c b/xen/common/numa.c
index 26c0006d04..79ab250543 100644
--- a/xen/common/numa.c
+++ b/xen/common/numa.c
@@ -35,6 +35,9 @@ int num_node_memblks;
 struct node node_memblk_range[NR_NODE_MEMBLKS];
 nodeid_t memblk_nodeid[NR_NODE_MEMBLKS];
 
+nodemask_t memory_nodes_parsed __initdata;
+nodemask_t processor_nodes_parsed __initdata;
+
 bool numa_off;
 
 /*
diff --git a/xen/include/xen/nodemask.h b/xen/include/xen/nodemask.h
index 1dd6c7458e..29ce5e28e7 100644
--- a/xen/include/xen/nodemask.h
+++ b/xen/include/xen/nodemask.h
@@ -276,6 +276,8 @@ static inline int __cycle_node(int n, const nodemask_t *maskp, int nbits)
  */
 
 extern nodemask_t node_online_map;
+extern nodemask_t memory_nodes_parsed;
+extern nodemask_t processor_nodes_parsed;
 
 #if MAX_NUMNODES > 1
 #define num_online_nodes()	nodes_weight(node_online_map)
-- 
2.25.1


