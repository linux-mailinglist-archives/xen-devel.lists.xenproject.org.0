Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D885A3E8EB5
	for <lists+xen-devel@lfdr.de>; Wed, 11 Aug 2021 12:31:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165752.302959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlWK-0000Xw-P1; Wed, 11 Aug 2021 10:31:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165752.302959; Wed, 11 Aug 2021 10:31:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlWJ-0000Fm-Lu; Wed, 11 Aug 2021 10:31:35 +0000
Received: by outflank-mailman (input) for mailman id 165752;
 Wed, 11 Aug 2021 10:31:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9qiF=NC=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mDlU1-0000BQ-Ju
 for xen-devel@lists.xenproject.org; Wed, 11 Aug 2021 10:29:13 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.3.50]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6b0b17b2-90a2-4543-b23e-a562baaa68e8;
 Wed, 11 Aug 2021 10:26:15 +0000 (UTC)
Received: from AS8PR04CA0171.eurprd04.prod.outlook.com (2603:10a6:20b:331::26)
 by AM9PR08MB6835.eurprd08.prod.outlook.com (2603:10a6:20b:2ff::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16; Wed, 11 Aug
 2021 10:26:14 +0000
Received: from VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:331:cafe::15) by AS8PR04CA0171.outlook.office365.com
 (2603:10a6:20b:331::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.13 via Frontend
 Transport; Wed, 11 Aug 2021 10:26:14 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT045.mail.protection.outlook.com (10.152.19.51) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.16 via Frontend Transport; Wed, 11 Aug 2021 10:26:13 +0000
Received: ("Tessian outbound 312d863716bf:v101");
 Wed, 11 Aug 2021 10:26:13 +0000
Received: from 6d23c3fb136b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 23203EB5-D2B6-47A7-AA98-9D8360B2AACA.1; 
 Wed, 11 Aug 2021 10:26:07 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 6d23c3fb136b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 11 Aug 2021 10:26:07 +0000
Received: from DB6PR0201CA0022.eurprd02.prod.outlook.com (2603:10a6:4:3f::32)
 by AM9PR08MB7215.eurprd08.prod.outlook.com (2603:10a6:20b:3de::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.14; Wed, 11 Aug
 2021 10:26:00 +0000
Received: from DB5EUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:3f:cafe::70) by DB6PR0201CA0022.outlook.office365.com
 (2603:10a6:4:3f::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16 via Frontend
 Transport; Wed, 11 Aug 2021 10:26:00 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT036.mail.protection.outlook.com (10.152.20.185) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4415.16 via Frontend Transport; Wed, 11 Aug 2021 10:26:00 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Wed, 11 Aug
 2021 10:25:47 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.87) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Wed, 11 Aug 2021 10:25:45 +0000
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
X-Inumbo-ID: 6b0b17b2-90a2-4543-b23e-a562baaa68e8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HWJHCCjl1hbGXNltzp/ISaOFhGhC8ThEvX0V7WgmkKA=;
 b=2hBEneRsLkoAF0k0FYTM2mRHx+jE+wvJMXyxSNwUT/J+0MH1rpFjZxjbPxjZ3xlOn2RYexxToB1Sdp/18jvKgu7xPxD9KGpi1IPhxTkSsJ+Sq8mz5rtCRdueKMobLBASwXDw1zYgR+U4pWeQnoFJs1zqbM2m8jCD6LSfqic0Nwg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 9edb159b5d36f640
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jAs/WPMFYm763HR2sLlC88pr3/kT/1QLjwlLsg1eW8SxjQPoVu5EJSWmb0lK6dO9opO7ZiD51Bf6foOAiNzQ4VtSjePXh+Q/x/loGzK52J8VKpwo0nJGFpkv9aS0i+0/XftvicTmJ7U1xC/UoeTLA0WNT9dNC+KLmVj5fd9lCzEowfoPXFjsMuQiyw0ILWjgRTp1MRENSc0X4sdeHV8doQLGbvII6HgxtR6OVOJ4ESc6nWXtoPVckODHKoq7zsouwfwlTOVBWjWKQVno6BswYguyVJNX/1nrwTNXx61AFY7M6rG37YdaQa+PgdxSF9LWweYQq+PTjzlxi5nwRkFk1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HWJHCCjl1hbGXNltzp/ISaOFhGhC8ThEvX0V7WgmkKA=;
 b=aalgA2npBGO6S+2cC0FQL4tEY4uS537fMUU3IJAcyqizi3+b+YQOuEG/iY7vZnO/ntGfyQtO4HRyBjwGhN52oBW4I+Yo5W2UuLMSxXsErSlyTxvnXhOXjA+j0BVridPx4sBGIb0NG/FhjWA9ofYk1f/KXWKax3N8dNskjpWUuE53ZP5AThsJSiqLRHybMewGICu7bxtGujI6i+Os2RiRBGe412IUVFoX2rwfUUd3//ikZvx7yR7drfzfcnkXNZoTVnbr2hgfKiW+6UWbx4YbLEuyDoIX1l+1Erh8U8jEmGeMVc5gYBTkfT6hdyhcW+yxc903ihso6+NhDiGiymbdzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HWJHCCjl1hbGXNltzp/ISaOFhGhC8ThEvX0V7WgmkKA=;
 b=2hBEneRsLkoAF0k0FYTM2mRHx+jE+wvJMXyxSNwUT/J+0MH1rpFjZxjbPxjZ3xlOn2RYexxToB1Sdp/18jvKgu7xPxD9KGpi1IPhxTkSsJ+Sq8mz5rtCRdueKMobLBASwXDw1zYgR+U4pWeQnoFJs1zqbM2m8jCD6LSfqic0Nwg=
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
Subject: [XEN RFC PATCH 31/40] xen/x86: move nodes_cover_memory to common
Date: Wed, 11 Aug 2021 18:24:14 +0800
Message-ID: <20210811102423.28908-32-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210811102423.28908-1-wei.chen@arm.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7d2c7625-58b4-4a55-7df5-08d95cb27233
X-MS-TrafficTypeDiagnostic: AM9PR08MB7215:|AM9PR08MB6835:
X-Microsoft-Antispam-PRVS:
	<AM9PR08MB6835B55599A6D345CB4C8D539EF89@AM9PR08MB6835.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 uAgP5LOZT5isIlo7JvnvliKkkQvb7BGpvvrVIr8FCrNQsBV5tzxjCyRn8Ur1pw2bW2xxl/92v7TxIv7jitljIX3vMWOwDTID2yWYjwS6xkmTG/XYgxFu10omOVFN6v6SgHZkQpTnkvDDSihPmFozGgLPJitcrS2Ox+zoM+LwJWwbdyouf1Yu+yKiXhQpMuF/3dPvps9NtKhTiODzkO0jQUr9BvVLeb1lJGmDxap43GISejAzoMI9/UnHaq1tBffk05tjHdNagKSZOs7J7IQYl1NcWPB9/So4Gy+V7jGbiYl7cIgK+GBLCeRHOLfnBYk/EUj/HM78W4WTKGA48P0SZMhUyDS5GyHiObA3RkNioZmteS4LgCoWqQIGewBn4BX0aOpju3YwRfLtl3DESczB5o7UCnA0sXkYs4Rz2aB226J1qzFSDx8ahh1qghLPKJpl8t0PQYyJ3uzD6PUKTfJNKmeeDG37qvwWDbHiFSkqbpQWEBDuzfWM3moiHmFaJ1BhOzJrVGCMF5ODlb/qwflUYsTSpXuUw40Gaj/0U9hC8HCNsfzoGFfVsY0SvQqMApQRm0B5gGF1UbZF4UvsidVibrE/fREZncm9ZmSa2AG/GztKmFUbN6rmJnJBhNuvr/NjOOSSK51uAI7IQ3K1bar34SocuG/E799XqMt0sZSmW32SgbwraFCxW3c8RX1cq+lB4ZKRjsADRIjDYQNKfIOosRpQMzHEk6yAu+8ti/PnWM2Pj5+YfJUkZCibNILIJkR5mt14wilDqvFFPTS42r4ATzwwZGDAoF30asrRC+5d350=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(39860400002)(376002)(346002)(396003)(136003)(36840700001)(46966006)(4326008)(5660300002)(36756003)(36860700001)(8676002)(47076005)(70586007)(1076003)(336012)(70206006)(82310400003)(81166007)(426003)(110136005)(356005)(83380400001)(26005)(316002)(7696005)(82740400003)(2906002)(34070700002)(86362001)(6666004)(44832011)(8936002)(2616005)(186003)(478600001)(36900700001)(2101003);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB7215
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	be89c955-fd0a-48d0-6838-08d95cb269e7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uvT0E9oq4yz57du8k+s2LsCNOT/SDQEp88q5dF+PnOShUr06yLRuQgfzBq2d9wo5G6UWhmtQvHCQW1VrSt3m7VHgGHapTooBgkAO376lMotwAAFTJ8RUS3ijrj5/rdJQreBPfxG0MTzuqCJlIOzx2+NWTlfM26HHYa2+udt74QiAShw8LjOgE152PNMVSyHvngY26nLNG1CqARGj8ORc7U6ubtzThTZHOk83Hide14J1x66tBriuUYEzSwGHkpV93IYcwxURipJT8cG15UrmJj9+rlbmoPXQCWx36BpzNSj1v8y7HfNFDnqlLOwLeshXUtR1/1pNtPVsT8zOMfnKu+OQIm1aCCjdWGm3FNNjPt0tZNCQ/EpA1GCSOg62h0q09oNowWjtr0Z4QuhHxm9N4Huh+SBY1OyM79euJ1Ru+GM21RCZteY4tXwtkldM0rub+txefGPU2F6NI+/mIyKd33OERoujQjtyph8WFxzaSATfwsDEq5VDgykOKz1Cedx+j07alPFriH1nBr3RhnIz9O6Pa2yasvD93IMfyq/kL6y1nYZSs0DeyMoUUgOGUyrMCyrnzR6/nHEiWcdAgn0RaiETSceOvjGDNJDTsqMQ5msgD7okJ3MkdHCMMWNpTdUIC6J7SPKjSohv3aMSI9CvGgGMIpcsV2r2b1ei1dPw5eNf6Ep14Sq9hLB/VNt2pxKVI5qzw6CiFbdbY5+0CXFbtdxJMc66oCw4v+cPrOYqNQY=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(396003)(376002)(136003)(346002)(39850400004)(36840700001)(46966006)(86362001)(2906002)(7696005)(82740400003)(47076005)(5660300002)(316002)(4326008)(36860700001)(81166007)(83380400001)(70206006)(70586007)(26005)(2616005)(82310400003)(478600001)(1076003)(8676002)(6666004)(8936002)(44832011)(110136005)(336012)(186003)(426003)(36756003)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2021 10:26:13.8027
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7d2c7625-58b4-4a55-7df5-08d95cb27233
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT045.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6835

Not only ACPU NUMA, but also Arm device tree based NUMA
will use nodes_cover_memory to do sanity check. So we move
this function from arch/x86 to common.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/arch/x86/srat.c    | 40 ----------------------------------------
 xen/common/numa.c      | 40 ++++++++++++++++++++++++++++++++++++++++
 xen/include/xen/numa.h |  1 +
 3 files changed, 41 insertions(+), 40 deletions(-)

diff --git a/xen/arch/x86/srat.c b/xen/arch/x86/srat.c
index dd3aa30843..dcebc7adec 100644
--- a/xen/arch/x86/srat.c
+++ b/xen/arch/x86/srat.c
@@ -308,46 +308,6 @@ acpi_numa_memory_affinity_init(const struct acpi_srat_mem_affinity *ma)
 	num_node_memblks++;
 }
 
-/* Sanity check to catch more bad SRATs (they are amazingly common).
-   Make sure the PXMs cover all memory. */
-static int __init nodes_cover_memory(void)
-{
-	int i;
-	uint32_t nr_banks = arch_meminfo_get_nr_bank();
-
-	for (i = 0; i < nr_banks; i++) {
-		int j, found;
-		unsigned long long start, end;
-
-		if (arch_meminfo_get_ram_bank_range(i, &start, &end)) {
-			continue;
-		}
-
-		do {
-			found = 0;
-			for_each_node_mask(j, memory_nodes_parsed)
-				if (start < nodes[j].end
-				    && end > nodes[j].start) {
-					if (start >= nodes[j].start) {
-						start = nodes[j].end;
-						found = 1;
-					}
-					if (end <= nodes[j].end) {
-						end = nodes[j].start;
-						found = 1;
-					}
-				}
-		} while (found && start < end);
-
-		if (start < end) {
-			printk(KERN_ERR "SRAT: No PXM for e820 range: "
-				"%016Lx - %016Lx\n", start, end);
-			return 0;
-		}
-	}
-	return 1;
-}
-
 void __init acpi_numa_arch_fixup(void) {}
 
 static uint64_t __initdata srat_region_mask;
diff --git a/xen/common/numa.c b/xen/common/numa.c
index 79ab250543..74960885a6 100644
--- a/xen/common/numa.c
+++ b/xen/common/numa.c
@@ -193,6 +193,46 @@ void __init cutoff_node(int i, u64 start, u64 end)
 	}
 }
 
+/* Sanity check to catch more bad SRATs (they are amazingly common).
+   Make sure the PXMs cover all memory. */
+int __init nodes_cover_memory(void)
+{
+	int i;
+	uint32_t nr_banks = arch_meminfo_get_nr_bank();
+
+	for (i = 0; i < nr_banks; i++) {
+		int j, found;
+		unsigned long long start, end;
+
+		if (arch_meminfo_get_ram_bank_range(i, &start, &end)) {
+			continue;
+		}
+
+		do {
+			found = 0;
+			for_each_node_mask(j, memory_nodes_parsed)
+				if (start < nodes[j].end
+				    && end > nodes[j].start) {
+					if (start >= nodes[j].start) {
+						start = nodes[j].end;
+						found = 1;
+					}
+					if (end <= nodes[j].end) {
+						end = nodes[j].start;
+						found = 1;
+					}
+				}
+		} while (found && start < end);
+
+		if (start < end) {
+			printk(KERN_ERR "SRAT: No PXM for e820 range: "
+				"%016Lx - %016Lx\n", start, end);
+			return 0;
+		}
+	}
+	return 1;
+}
+
 void numa_add_cpu(int cpu)
 {
     cpumask_set_cpu(cpu, &node_to_cpumask[cpu_to_node(cpu)]);
diff --git a/xen/include/xen/numa.h b/xen/include/xen/numa.h
index 6d18059bcd..094ab904c9 100644
--- a/xen/include/xen/numa.h
+++ b/xen/include/xen/numa.h
@@ -92,6 +92,7 @@ static inline void clear_node_cpumask(int cpu)
 extern uint32_t arch_meminfo_get_nr_bank(void);
 extern int arch_meminfo_get_ram_bank_range(int bank,
     unsigned long long *start, unsigned long long *end);
+extern int nodes_cover_memory(void);
 
 #endif /* CONFIG_NUMA */
 
-- 
2.25.1


