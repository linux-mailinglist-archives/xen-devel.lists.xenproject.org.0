Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFBF0415DCE
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 14:04:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193829.345370 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTNSY-0001Zg-3E; Thu, 23 Sep 2021 12:04:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193829.345370; Thu, 23 Sep 2021 12:04:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTNSX-0001Sr-Tp; Thu, 23 Sep 2021 12:04:13 +0000
Received: by outflank-mailman (input) for mailman id 193829;
 Thu, 23 Sep 2021 12:04:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fewu=ON=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mTNSV-0005KP-VY
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 12:04:12 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7d00::612])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d394736b-4044-490a-81d9-6cb0a001eed6;
 Thu, 23 Sep 2021 12:03:50 +0000 (UTC)
Received: from DU2PR04CA0312.eurprd04.prod.outlook.com (2603:10a6:10:2b5::17)
 by DB9PR08MB6444.eurprd08.prod.outlook.com (2603:10a6:10:23c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.17; Thu, 23 Sep
 2021 12:03:46 +0000
Received: from DB5EUR03FT049.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:2b5:cafe::79) by DU2PR04CA0312.outlook.office365.com
 (2603:10a6:10:2b5::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.16 via Frontend
 Transport; Thu, 23 Sep 2021 12:03:46 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT049.mail.protection.outlook.com (10.152.20.191) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 12:03:46 +0000
Received: ("Tessian outbound ab2dc3678fa9:v103");
 Thu, 23 Sep 2021 12:03:45 +0000
Received: from b4c9112bdd82.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 2B438CB3-7A90-4A1A-8800-96D502AF91C5.1; 
 Thu, 23 Sep 2021 12:03:38 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b4c9112bdd82.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 23 Sep 2021 12:03:38 +0000
Received: from DB6P18901CA0018.EURP189.PROD.OUTLOOK.COM (2603:10a6:4:16::28)
 by PAXPR08MB7155.eurprd08.prod.outlook.com (2603:10a6:102:208::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Thu, 23 Sep
 2021 12:03:35 +0000
Received: from DB5EUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:16:cafe::b) by DB6P18901CA0018.outlook.office365.com
 (2603:10a6:4:16::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Thu, 23 Sep 2021 12:03:35 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT048.mail.protection.outlook.com (10.152.21.28) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 12:03:35 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.14; Thu, 23 Sep
 2021 12:03:35 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 23
 Sep 2021 12:03:33 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.87) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Thu, 23 Sep 2021 12:03:33 +0000
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
X-Inumbo-ID: d394736b-4044-490a-81d9-6cb0a001eed6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c+6OH5SULDNhvZukoMondUWr5/a4eP4oQVaqRYS7JR4=;
 b=fbTILkyCZL7qIulNFWBwMrxcGvVjZAIMRcmTcKRFTRtReussNbGbSsGm1JMUsTgOlXkeJr6dr792trAI65njeodFr7dnUOlZLHhCbL/zlvhAe56KLOxAjFNvHoWof24CVcTLO1Xto7QDqinfBppmB81CAr6SeBlObLMtsIx4hGw=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 285d174cee0d49fe
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XcZUeDkPntqMvBzx0dIDmC9IZ1qiRAyQCpQoOIWpLh8SWkSV4nZCsRKgyheWfdfHbsXiJwFi+8O1Jdy4Nrrx3kDSvDeFtgKrqCcFRcNOxxivQXoZoiFj67gO+XiGVDVescKY8n4Cm43AhJUwe9PCvMPDk8sILfPOK662gPsqDRshI60YtP4lx2FeC3jfP95HJr/XdAPtf33S17o920uP/LsaSTlqmb5TzPErOvHfTCKomL7BEQfOZyactmfAPCSClJBRYKoFqQC1D8kzfQiy2jdazvY2yVl6YKtBexPcbDk6UnRpLME2do7u4GaDyk3Sr68NSgX/xbuoG67Dv0kNxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=c+6OH5SULDNhvZukoMondUWr5/a4eP4oQVaqRYS7JR4=;
 b=iVhlRH7sIToqiLy9ZMX16nhC63sb5bbhR+N9N5xO39OnH1nOqkyv29hgGKrkxTQe8ZU4ntray/Jdpy3EAqpYK3/VwDm37zzfZquKPNDHtc9qimafG63ONF7NQgMnXTIntdOv00iG+iWTXdi3H0eCMm1gUj8sXFr9hunl741m55tnwpUeKVwG5rD7Xg4pjQ3xcFuwUd2Uf7FU7ww8FD3NEb1B2cZa/nFNEmsybndnfgApZ0HYdl1EgiKMGEjRjXs0ZR3Nb5lN/6456Pj1wkjmGDPLTX41K+kFMpbsWZ3RARDNA86fbvplXSa2WPKKEtRUXMQBrIagpGZu4dUnWw2YBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c+6OH5SULDNhvZukoMondUWr5/a4eP4oQVaqRYS7JR4=;
 b=fbTILkyCZL7qIulNFWBwMrxcGvVjZAIMRcmTcKRFTRtReussNbGbSsGm1JMUsTgOlXkeJr6dr792trAI65njeodFr7dnUOlZLHhCbL/zlvhAe56KLOxAjFNvHoWof24CVcTLO1Xto7QDqinfBppmB81CAr6SeBlObLMtsIx4hGw=
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
Subject: [PATCH 12/37] xen/x86: decouple nodes_cover_memory from E820 map
Date: Thu, 23 Sep 2021 20:02:11 +0800
Message-ID: <20210923120236.3692135-13-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210923120236.3692135-1-wei.chen@arm.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d901cae-12cb-4f5a-b7a4-08d97e8a3225
X-MS-TrafficTypeDiagnostic: PAXPR08MB7155:|DB9PR08MB6444:
X-Microsoft-Antispam-PRVS:
	<DB9PR08MB644490D90E3E65882AD216D39EA39@DB9PR08MB6444.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 Y/8E4fLFkv2vvubolkdZlZbupIXtLOZqH8jdRUw9zou9+e8KrxHLiY4maUMwvvlDHflLfW0rfFbi+5VIGYE0qOsTTKkdewxxYTeYOTHCM3pW7CHrAC0LoYSID5TAQNlW1kzMdOIugoLzYwfH0aCFqMAnj1LmGVVg0ogvJg9jd4PBoFvlBC9CQtW6NgROthYJJbmcydFIL/b/nhUpatuOq07eUmZhr0ffqBM78D4iQNhQzuxWxnmsh6MMwAPEKiQ+n0UzzBTY4sJyi39Vmqsr4RAdfONQCbIn+1PcajPj6tIxlM6fK0cLJ7end4oYwTy7x2IJp2KgbCEQq8oBn0ygtQG1U0tO87nqztTa2QYcXiWPjmEO7MtaH/aMS1t2OMU/quN0SYNUjd7tUTclvzIPVaBCwRlJHibWjA53f1GAOdubwlPPp8zGB5WCL1LbpsXVOdWZqbUqAhHVidtIIszrsQ4Di3t5zuRoiO3j6K3CQx7ZIWd7tpzuwPezobJCQJIm4iSQ7jDN12N5VB1hMqRhHck41OcCDDiHIXGCe2VcFXim6bXCLg7pe58iIpNsnhCKrYhRErNNgT1OGixLGx8mnhrydUHMcPyHe6byHDNBvOCAMHTGq1X60LJQehL8aalN4PFsDMLCD+5c3uJvA/QIFLlgd7bM+UZm5htEBxClgCdPkMOp4n95vXOV7dusfHLeYd1Jmb0B0UQ+3IxgWjcd6SdhJxMmy7GQ/3dy2xXhnIM=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(81166007)(36860700001)(356005)(8676002)(47076005)(316002)(5660300002)(8936002)(44832011)(86362001)(110136005)(6666004)(2616005)(4326008)(70206006)(336012)(426003)(82310400003)(1076003)(83380400001)(2906002)(186003)(70586007)(26005)(36756003)(7696005)(508600001)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB7155
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	6d3c7c15-4802-472f-917c-08d97e8a2ba8
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	c5Lu+AcCBJ8cKTEWK0C9eChhatlTtswOacl7oUAcJGHJtoeiHsm46SD6r20Jf5SQyEdqgzbbt43E7Fj9ZvaXc5T/pil16Pf8b4ohwUjNYO6KiKn6M1/6HGqZtQYC6b6H4Qk6vBHWkoG+8c6Uj542MgVsgKVfbyYi6JlHCZZ8TPqfeQR6/rR+K4f0lPVpURf+ljl85M6l7GtbcwM146uRWTXSGqPDoJ+fztjwzrGWo2Y0tcIRTdq8+seNdddQhbT8gQgG3wM4DazRDWNX6TaEKZHgsjOX3nqjQGrHk9xt1xWtaPzqmq8rM1jOrP6si6QEVlGe/AMQsiLRCXDBRGZgbjNHdRkcKsJRoyKAQcjV1/bh8N3yBtZ2dgPm6dsTfUM+qcjko5r/2zLDfG/0Xr4lrkQ2jiISqLeLmfkGfL0ewtIiJKoJjBNM6esvdj6UFLQRdRAqjqeZtjR5ihwXBDkPfJ7ajH7AMr4p6ZjphhPPuvNElRciTVpONiFdlpgBG078iSDYmfpKohhZKh2N9gPV97ITLxdXNub+y6LzmXCorUXRXK0FLVc0GG6tnbNmmQc5Gb5a8VtjBuQQgoQNoD2EmLMxQMMjtuLkHG2ktMPb03xPf7wwP2igDiWRcVPlDwltVSzU/NSFEiAY1eCNAzALbPXwlX5x5zT5C+OA+OtS4Ispd3GEU4udMZgFlMJjrhetvkKAR2yc8kdoIjPZ1kR5Xg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(2906002)(316002)(2616005)(44832011)(508600001)(8936002)(36860700001)(70206006)(47076005)(4326008)(7696005)(6666004)(336012)(426003)(5660300002)(186003)(36756003)(26005)(8676002)(70586007)(1076003)(81166007)(83380400001)(86362001)(82310400003)(110136005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 12:03:46.1480
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d901cae-12cb-4f5a-b7a4-08d97e8a3225
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT049.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6444

We will reuse nodes_cover_memory for Arm to check its bootmem
info. So we introduce two arch helpers to get memory map's
entry number and specified entry's range:
    arch_get_memory_bank_number
    arch_get_memory_bank_range

Depends above two helpers, we make nodes_cover_memory become
architecture independent. And the only change from an x86
perspective is the additional checks:
  !start || !end

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/arch/x86/numa.c        | 18 ++++++++++++++++++
 xen/arch/x86/srat.c        | 11 ++++-------
 xen/include/asm-x86/numa.h |  3 +++
 3 files changed, 25 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/numa.c b/xen/arch/x86/numa.c
index 6337bbdf31..6bc4ade411 100644
--- a/xen/arch/x86/numa.c
+++ b/xen/arch/x86/numa.c
@@ -378,6 +378,24 @@ unsigned int arch_have_default_dmazone(void)
     return ( num_online_nodes() > 1 ) ? 1 : 0;
 }
 
+uint32_t __init arch_meminfo_get_nr_bank(void)
+{
+	return e820.nr_map;
+}
+
+int __init arch_meminfo_get_ram_bank_range(uint32_t bank,
+	paddr_t *start, paddr_t *end)
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
index 18bc6b19bb..aa07a7e975 100644
--- a/xen/arch/x86/srat.c
+++ b/xen/arch/x86/srat.c
@@ -419,17 +419,14 @@ acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
 static int __init nodes_cover_memory(void)
 {
 	int i;
+	uint32_t nr_banks = arch_meminfo_get_nr_bank();
 
-	for (i = 0; i < e820.nr_map; i++) {
+	for (i = 0; i < nr_banks; i++) {
 		int j, found;
 		paddr_t start, end;
 
-		if (e820.map[i].type != E820_RAM) {
+		if (arch_meminfo_get_ram_bank_range(i, &start, &end))
 			continue;
-		}
-
-		start = e820.map[i].addr;
-		end = e820.map[i].addr + e820.map[i].size;
 
 		do {
 			found = 0;
@@ -448,7 +445,7 @@ static int __init nodes_cover_memory(void)
 		} while (found && start < end);
 
 		if (start < end) {
-			printk(KERN_ERR "SRAT: No PXM for e820 range: "
+			printk(KERN_ERR "SRAT: No NODE for memory map range: "
 				"%"PRIpaddr" - %"PRIpaddr"\n", start, end);
 			return 0;
 		}
diff --git a/xen/include/asm-x86/numa.h b/xen/include/asm-x86/numa.h
index 5772a70665..78e044a390 100644
--- a/xen/include/asm-x86/numa.h
+++ b/xen/include/asm-x86/numa.h
@@ -82,5 +82,8 @@ void srat_parse_regions(paddr_t addr);
 extern u8 __node_distance(nodeid_t a, nodeid_t b);
 unsigned int arch_get_dma_bitsize(void);
 unsigned int arch_have_default_dmazone(void);
+extern uint32_t arch_meminfo_get_nr_bank(void);
+extern int arch_meminfo_get_ram_bank_range(uint32_t bank,
+    paddr_t *start, paddr_t *end);
 
 #endif
-- 
2.25.1


