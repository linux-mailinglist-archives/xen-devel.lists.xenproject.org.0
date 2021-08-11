Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 342883E8EB4
	for <lists+xen-devel@lfdr.de>; Wed, 11 Aug 2021 12:31:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165751.302953 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlWJ-0000Fx-73; Wed, 11 Aug 2021 10:31:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165751.302953; Wed, 11 Aug 2021 10:31:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlWI-0008Tf-Hz; Wed, 11 Aug 2021 10:31:34 +0000
Received: by outflank-mailman (input) for mailman id 165751;
 Wed, 11 Aug 2021 10:31:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9qiF=NC=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mDlSj-0000BQ-Gs
 for xen-devel@lists.xenproject.org; Wed, 11 Aug 2021 10:27:53 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (unknown
 [40.107.6.59]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c37d5588-c6f8-481f-b70e-563582809505;
 Wed, 11 Aug 2021 10:25:59 +0000 (UTC)
Received: from DU2PR04CA0015.eurprd04.prod.outlook.com (2603:10a6:10:3b::20)
 by AM5PR0801MB2116.eurprd08.prod.outlook.com (2603:10a6:203:31::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Wed, 11 Aug
 2021 10:25:57 +0000
Received: from DB5EUR03FT050.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:3b:cafe::ac) by DU2PR04CA0015.outlook.office365.com
 (2603:10a6:10:3b::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15 via Frontend
 Transport; Wed, 11 Aug 2021 10:25:57 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT050.mail.protection.outlook.com (10.152.21.128) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.16 via Frontend Transport; Wed, 11 Aug 2021 10:25:57 +0000
Received: ("Tessian outbound d9f41274f41a:v101");
 Wed, 11 Aug 2021 10:25:57 +0000
Received: from 1713049aedfc.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 7B0767EE-A0DF-450A-B4F1-3D2F12245A70.1; 
 Wed, 11 Aug 2021 10:25:50 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 1713049aedfc.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 11 Aug 2021 10:25:50 +0000
Received: from DB6PR0301CA0077.eurprd03.prod.outlook.com (2603:10a6:6:30::24)
 by AM6PR08MB3751.eurprd08.prod.outlook.com (2603:10a6:20b:84::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.19; Wed, 11 Aug
 2021 10:25:49 +0000
Received: from DB5EUR03FT058.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:30:cafe::75) by DB6PR0301CA0077.outlook.office365.com
 (2603:10a6:6:30::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.13 via Frontend
 Transport; Wed, 11 Aug 2021 10:25:49 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT058.mail.protection.outlook.com (10.152.20.255) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4415.14 via Frontend Transport; Wed, 11 Aug 2021 10:25:49 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Wed, 11 Aug
 2021 10:25:40 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.87) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Wed, 11 Aug 2021 10:25:38 +0000
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
X-Inumbo-ID: c37d5588-c6f8-481f-b70e-563582809505
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xkva09jfasVoqqDl8pVZ4uwtTmz6YH26qMVoCVfWrk0=;
 b=tdqaV23KQSxe/JMubWYsa3nvkdzZipu4natVed9xYrdEocnQJVwrLBEaxvQInyCx461YC9Oc/CesPTWgu0n4LaftClNpvtSXPhCwxkfgWCdkJPLLKdIholrLscxo5wRmB0i265u3FqxcEeHBiGLurieiE0Usie+iudYEbCZVnpE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: b17d4125fc988081
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QbGOcVPnF+p6Uth0yJ7plyUqlnwMBWCfvFlHmhvCVwEbTxDlgL5EE2BFe2RdEKyrtw6mnhDMAEFW/fYPl9m3tiXxQkHYpKWlcS3nrepJBJLj7B9EdGm1uRgGGxibKIwROgiLR/t37hFJdKL6kQ0dYVPICfmjxsQAtimd3ESQTsX1V30wQHQstB2QaUWIe+7ZoGbs6svZ9ftmIIU8fCaoGXsKu3ygZ6HYHLo7Z98EQB/2IUqsLGYr1HNXfMWJtw27xb7+gNJEePpgaOfXdPDzL9DzRN3SFzJRJpu1M7TI5PTVSKaFVaWCbVKEgCJFCUfBl/EUy74tVrIZEsSfyTahDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xkva09jfasVoqqDl8pVZ4uwtTmz6YH26qMVoCVfWrk0=;
 b=jmIYUOI3YD7pthEC+ZCIvzr07CC0IDdpjDqvkVBXqgU/jlVNWB3FN9/5awedRM3JKczYflI7fjTtRJwOZrhg/0rNrZD5VcLrPqzsrKf74AoecUSaD6KF5K6eHpcLFV9BxY7I0v+FwRHi/brptY/rbUDCcfsblrG4Wes5SLsiAiSQcppmeVNW6X0kj/dqRJKNIHzgWy/XzaCWz+2iUy1jSuRBzUJE/vy+zmNT0Co2/Iymrhz4aWQQfHxKtCV40LA5xtrwEklsq56aWbZKmKxLfSyN5XnqNVbMLdRTY9Eh5+YPwcxnVH/V6emt+6NK5AScqK0Nw+HP4XYB4aihHcrFLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xkva09jfasVoqqDl8pVZ4uwtTmz6YH26qMVoCVfWrk0=;
 b=tdqaV23KQSxe/JMubWYsa3nvkdzZipu4natVed9xYrdEocnQJVwrLBEaxvQInyCx461YC9Oc/CesPTWgu0n4LaftClNpvtSXPhCwxkfgWCdkJPLLKdIholrLscxo5wRmB0i265u3FqxcEeHBiGLurieiE0Usie+iudYEbCZVnpE=
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
Subject: [XEN RFC PATCH 28/40] xen/x86: decouple nodes_cover_memory with E820 map
Date: Wed, 11 Aug 2021 18:24:11 +0800
Message-ID: <20210811102423.28908-29-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210811102423.28908-1-wei.chen@arm.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 99ae0171-5dd0-4bae-3ee5-08d95cb2687b
X-MS-TrafficTypeDiagnostic: AM6PR08MB3751:|AM5PR0801MB2116:
X-Microsoft-Antispam-PRVS:
	<AM5PR0801MB2116B20794FBFFDA9097B0B99EF89@AM5PR0801MB2116.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:1923;OLM:1923;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 +w49qkgSUHnWqNAfPmd/96ZFwkAS6o0285jLGpTX4lX4Wv/5ckhjJLwDc9904a6JAfPZb14sxAS/SrwBesPaTtqcHnHXtrdSa/FJXa9GVKtgtENx7l6YSu9/PifXFP4Iu1Jjv/5/gblYGhngqevWrzVUhfqBznKhBkARZoI7PvkuUj6lXFEScNNvbeQkK73qt6YqiF7zQvZ8OVAkdziLzCpJwIBPCd13DqxHtbt/UnIdNs6Z6SV6AORdqTk/PhdDGEyruhF8BC0HmoosCSeaE+97mD3sQl9WNNtvk+uo9R9DwvTG9hvp22YLZ9JWoZz0vigQ3r1OP/uA7TZRo3ohiQYwKnZ6nzeXAXl/O09nM9P5ofL74FFWiRrGaPorcLQGuFCCGfTn7+bvto1dCPP+vEB6QWNZwPHuXWd3wAVze/xeiBK1n35e1dwHYjZOm9Sl5VFMV4h91K9qEUHbbP72AVJCXrs5lVrNvnZYB9q5MoN9QMxa+9ryr5b4Zdbcc6wffy7t0ON3d7mvYXqvxAhuTtiWzVXfeVohigyHidr8u23cBlFZYpLSGTy1ZQxuOvv2X5BZYshQSM2S0vZ2A4Jm7pggnA7R8NCDL3h00+MLRX1rkJ2pTeONPfRMgyCfq/YNkxOXIXfbvnwvzYHna26UW10DAnTxSRCSvJRtEItDGZ6A3WjgiyJZ/VGDTaWEGFjpuczIKW5qofRTXQ0bk0Uqo0Zor9yKG8L9lXq+tHti9s72ptUI6FA1ri2/NGnn6p/9Er9mhifMBJZgDbhQFii9wEfDIlF9PDEusA6HBybRB+U=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(36860700001)(6666004)(70206006)(70586007)(316002)(2906002)(110136005)(336012)(36756003)(81166007)(82310400003)(83380400001)(47076005)(4326008)(426003)(508600001)(8676002)(34070700002)(186003)(86362001)(44832011)(5660300002)(26005)(2616005)(8936002)(356005)(7696005)(1076003)(36900700001)(2101003);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3751
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	02280acd-b8b1-4893-e707-08d95cb26388
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	ay8DxX/HOL5qk1wwEN5dnLZLCpM1fmd9xIoWN9XCYIu3ws94O8zv5cpKO1HDl5eM3BYDxpuJ53ws3gfHbx39LSj5NqYrnKmGWAIx+zd839u087JSBEfIlo2W2JqaRnE1ESlxQxXQ9nrd6mHWwuHQtDuBtqbeSbvIGG21TRsd6DibCWEGQzqTMii0i/PboNWuHA6pImk58p246mfvoFo+b8c57+pXhzrcEYf+B0MjxxhhIpiFG/lKFNYiHGuZ1Z9JerXyhd+Vk/+v5xEZK3PBwa7bpfZZl+/QDoToCAXhCEXfuvaouNfInfOB002n52nnluD8C3ERKUBq2QP9poo21IUG18XD2OhBjNe6Hypg+NQRmt8+mpal3sPnWzTjnE5MYpH8Jw7X0QE2sPaF09FW/MwxBht+uPuahSHGu/VOXg0Z6+ICZ5q52UWl1vkmjxN6ddE22F1Pk70tWvRpDHCSbYetzqRs8ycQGsIg+/+yHSsD/LJErT73F7jyL9ko3bN19TufJZaS6UQY1Q5eJbbK8UVnM9num2kGXjFOLbuk8wZ/p/dNxIc9Ou057B7S33ZwDBUEiSqeuhz6af/vanVwePTggYxthb8Gp6/FUp4MPN28hVaaV+x6C/a6Q9ZZpPxOwTOOBbTVfPKB1dwS8NkmeDwFHvKH9UxIhklfnnMM0OHEuZXKUnvLOeGWk2+c+bzdIfd6ExykvtLaPD6cTAqnixZH8rdCurLF7ENPboJGj6Q=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(396003)(346002)(39850400004)(136003)(46966006)(36840700001)(86362001)(36860700001)(2616005)(47076005)(36756003)(8676002)(44832011)(426003)(336012)(186003)(4326008)(2906002)(1076003)(7696005)(26005)(70206006)(70586007)(478600001)(82740400003)(8936002)(82310400003)(81166007)(6666004)(110136005)(5660300002)(83380400001)(316002)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2021 10:25:57.6407
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 99ae0171-5dd0-4bae-3ee5-08d95cb2687b
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT050.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0801MB2116

We will reuse nodes_cover_memory for Arm to check its bootmem
info. So we introduce two arch helpers to get memory map's
entry number and specified entry's range:
    arch_get_memory_bank_number
    arch_get_memory_bank_range

Depends above two helpers, we make nodes_cover_memory become
architecture independent.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/arch/x86/numa.c    | 18 ++++++++++++++++++
 xen/arch/x86/srat.c    |  8 +++-----
 xen/include/xen/numa.h |  4 ++++
 3 files changed, 25 insertions(+), 5 deletions(-)

diff --git a/xen/arch/x86/numa.c b/xen/arch/x86/numa.c
index 6908738305..8b43be4aa7 100644
--- a/xen/arch/x86/numa.c
+++ b/xen/arch/x86/numa.c
@@ -128,6 +128,24 @@ unsigned int __init arch_get_dma_bitsize(void)
                  + PAGE_SHIFT, 32);
 }
 
+uint32_t __init arch_meminfo_get_nr_bank(void)
+{
+	return e820.nr_map;
+}
+
+int __init arch_meminfo_get_ram_bank_range(int bank,
+	unsigned long long *start, unsigned long long *end)
+{
+	if (e820.map[bank].type != E820_RAM || !start || !end) {
+		return -1;
+	}
+
+	*start = e820.map[bank].addr;
+	*end = e820.map[bank].addr + e820.map[bank].size;
+
+	return 0;
+}
+
 static void dump_numa(unsigned char key)
 {
     s_time_t now = NOW();
diff --git a/xen/arch/x86/srat.c b/xen/arch/x86/srat.c
index 6d68b8a614..2298353846 100644
--- a/xen/arch/x86/srat.c
+++ b/xen/arch/x86/srat.c
@@ -316,18 +316,16 @@ acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
 static int __init nodes_cover_memory(void)
 {
 	int i;
+	uint32_t nr_banks = arch_meminfo_get_nr_bank();
 
-	for (i = 0; i < e820.nr_map; i++) {
+	for (i = 0; i < nr_banks; i++) {
 		int j, found;
 		unsigned long long start, end;
 
-		if (e820.map[i].type != E820_RAM) {
+		if (arch_meminfo_get_ram_bank_range(i, &start, &end)) {
 			continue;
 		}
 
-		start = e820.map[i].addr;
-		end = e820.map[i].addr + e820.map[i].size;
-
 		do {
 			found = 0;
 			for_each_node_mask(j, memory_nodes_parsed)
diff --git a/xen/include/xen/numa.h b/xen/include/xen/numa.h
index 0475823b13..6d18059bcd 100644
--- a/xen/include/xen/numa.h
+++ b/xen/include/xen/numa.h
@@ -89,6 +89,10 @@ static inline void clear_node_cpumask(int cpu)
 	cpumask_clear_cpu(cpu, &node_to_cpumask[cpu_to_node(cpu)]);
 }
 
+extern uint32_t arch_meminfo_get_nr_bank(void);
+extern int arch_meminfo_get_ram_bank_range(int bank,
+    unsigned long long *start, unsigned long long *end);
+
 #endif /* CONFIG_NUMA */
 
 #endif /* _XEN_NUMA_H */
-- 
2.25.1


