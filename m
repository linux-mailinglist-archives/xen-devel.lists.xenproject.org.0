Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1D1415DD0
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 14:04:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193834.345392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTNSh-0002m9-4T; Thu, 23 Sep 2021 12:04:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193834.345392; Thu, 23 Sep 2021 12:04:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTNSg-0002h9-UI; Thu, 23 Sep 2021 12:04:22 +0000
Received: by outflank-mailman (input) for mailman id 193834;
 Thu, 23 Sep 2021 12:04:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fewu=ON=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mTNSe-0006xV-OV
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 12:04:20 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.7.70]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 5583a53f-1c66-11ec-ba2e-12813bfff9fa;
 Thu, 23 Sep 2021 12:03:59 +0000 (UTC)
Received: from AS9PR06CA0065.eurprd06.prod.outlook.com (2603:10a6:20b:464::30)
 by AM0PR08MB3476.eurprd08.prod.outlook.com (2603:10a6:208:dd::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Thu, 23 Sep
 2021 12:03:54 +0000
Received: from VE1EUR03FT038.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:464:cafe::83) by AS9PR06CA0065.outlook.office365.com
 (2603:10a6:20b:464::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Thu, 23 Sep 2021 12:03:54 +0000
Received: from 64aa7808-outbound-2.mta.getcheckrecipient.com (63.33.187.114)
 by VE1EUR03FT038.mail.protection.outlook.com (10.152.19.112) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 12:03:54 +0000
Received: ("Tessian outbound 0e48c0de19a3:v103");
 Thu, 23 Sep 2021 12:03:53 +0000
Received: from 12313445366e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 3FCA74CE-884C-4689-80D6-F74825E26883.1; 
 Thu, 23 Sep 2021 12:03:45 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 12313445366e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 23 Sep 2021 12:03:45 +0000
Received: from AM6PR05CA0031.eurprd05.prod.outlook.com (2603:10a6:20b:2e::44)
 by DB9PR08MB6889.eurprd08.prod.outlook.com (2603:10a6:10:2a1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Thu, 23 Sep
 2021 12:03:44 +0000
Received: from AM5EUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2e:cafe::63) by AM6PR05CA0031.outlook.office365.com
 (2603:10a6:20b:2e::44) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Thu, 23 Sep 2021 12:03:44 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT055.mail.protection.outlook.com (10.152.17.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 12:03:43 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Thu, 23 Sep
 2021 12:03:41 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.87) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Thu, 23 Sep 2021 12:03:39 +0000
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
X-Inumbo-ID: 5583a53f-1c66-11ec-ba2e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bHB3OIRxraBI99dHCnbQBTwh5FbIOCKQZXZ1E5VSHqs=;
 b=iAT2nzsxmP6X58+jMrjioleryYdFbsMP9rbS0X+6K6yjYBs6CYuCOTbjjzUjqwbojD/1CMlU2d3IK9KwwlPHvK9XKglsra7zkiRT93h4vPKmA6N2vWnJch0QZrOhShYS2I/Yqb98WNFQWiISx6MXyFNX0Nguvj0ZpypfuO+AS/I=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.33.187.114)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.33.187.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.33.187.114; helo=64aa7808-outbound-2.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: d9f2c0d4b272f3ef
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f73aX07EY08DBRiQt9WhG5PBNrclcaCHk/aG6jHqvhqXEetNDVNVTRL2uQuzz0AJUuCD6djTC6Xi60SLMB4nMTbMDEi5I+5RO5VRi9c5486znTb4cC0F955FeNqXWpDD7wp2BrSYZbtn2x2HArHnnw7CM/GF65Zb18ta9sgWifDmvzh0el+YEyogFLmsmh0KPirTQbiZJFzZcaT0RkFdSIiydJljLQs9Nq7oOsj7hS7Qts9YvOSnuLYDC+DUL0AQeN9Ln9p2HlhyndwweFlIAKKviditU21WsGPCdx8Uxa/L0Km105EDL+5oA5IIMuigy3y+J1HIEYwkEkeTsIiY8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=bHB3OIRxraBI99dHCnbQBTwh5FbIOCKQZXZ1E5VSHqs=;
 b=IXr8/KOhipoXLnD4GOlPYbDCPIbbPodevluYN5i1me4KxYE432PlUmFEPL/E/sl+oYgfbTS2XshPdV6530M0MSJo32IWxiWBvcqtIltjwtCQ32L5oMXI7ee6miMXKU46t3P08e8+wdh5pt0lWQpkKtxbLaCv1WAepwrqyFdwSs2/72ZnvR+WpT1XRxYfWQ1km+Wjp0xRLCKxJY28kMiMyfoZU1A6ynRZ1eYZWTcHHo3LbhKXM4velYss30L19+kX1eaH2rbkiTCL8cLZvd83R1gCndgNcC4cG9Y4+NgjNGH76FQTU2jUB/dvsoBETrlWXF3oHnpsutasIR29G9FG8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bHB3OIRxraBI99dHCnbQBTwh5FbIOCKQZXZ1E5VSHqs=;
 b=iAT2nzsxmP6X58+jMrjioleryYdFbsMP9rbS0X+6K6yjYBs6CYuCOTbjjzUjqwbojD/1CMlU2d3IK9KwwlPHvK9XKglsra7zkiRT93h4vPKmA6N2vWnJch0QZrOhShYS2I/Yqb98WNFQWiISx6MXyFNX0Nguvj0ZpypfuO+AS/I=
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
Subject: [PATCH 15/37] xen/x86: rename acpi_scan_nodes to numa_scan_nodes
Date: Thu, 23 Sep 2021 20:02:14 +0800
Message-ID: <20210923120236.3692135-16-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210923120236.3692135-1-wei.chen@arm.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 197158ef-8198-40e7-3780-08d97e8a36f1
X-MS-TrafficTypeDiagnostic: DB9PR08MB6889:|AM0PR08MB3476:
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB34761ED70BCA144E7A83D3939EA39@AM0PR08MB3476.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 NzGNuz8Y1xXknlT+8r0RnU1UtHo1PdP5WGHYvhOEcKq0uhsl8JNQyOldKxHp+eoLISCB1G/Xt/UpyM2sQ7ro5/fFad6wdtOEnUCPT7hYrBfdp+I7Q22oss1ZcoNIO8yqMjC4EPwoQNvFJfHiYRoFmtPEMK/r2JfE1rmmwvAOiDSZbbi82xJ533wBDIedOo166741Cltr1JFdiIo3UPJor1Ttbfpwlymsx8VG67Rj9+KZXp9OqO3B/pKBgCpm7idGISchC7tSMa+6vYvBGkMfIPDEdbKHzgK7g5/rHDKzC+L8Ro6TPDx7YeIDTz3gupE8B929Yijm5uT8nWa+wtMH2ExU4deroiesooYLGjbSV5bfQYy6GJTi3TO69zjuU2Dk9bTKaFVu5dQTvHgsKaNRryE6QbjoADyBHudJF5eIzW+JWW1wtTPcJLamC12NAyfgMP4nkh93wd8PTeL1UvFAqq4oLZAzfkUri6bY+GuYEQWf+pIQJlLDz/bGV3RV0pcl60fJrNWFSSUr7E2MhYjk1cXZ9QNPjK8uxW/31vgv/h6FD7uA1ZmELdgxTnu2TGOWmkPHl+oWWaDuVRUkaG4OVYNiurngQE0O3Em/I+Kmcbsqu5qCB3kSqCPnVL51M+ycem8Jh8BPtAzSXI3hrQ7AD55iDpnJFuG3VWSmQ1oHCHFwSGiAoeVhPrN8VFaygbA7YsanGGFpJSsA1qQgog5UZRSYBErF11FdXSk/Mxbhy0Q=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(5660300002)(8936002)(110136005)(1076003)(186003)(2906002)(336012)(82310400003)(426003)(26005)(47076005)(4326008)(316002)(7696005)(36860700001)(508600001)(36756003)(6666004)(356005)(44832011)(83380400001)(86362001)(81166007)(2616005)(70206006)(70586007)(8676002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6889
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	8faa9ec5-04b5-4c8e-65bc-08d97e8a30dd
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Cp3kYtAT3YABE2yJbPpKSixL52n4S1hRk5RWPzDmW+rPmpm4B7uTRM3kYvs0oTDlyZUPXG3BPQ5zG9iUuxIc9kASOqfpktLHfmK/AGfypHVVn8Z7s53KfPFWkGsEMImvG9KLCc6BkUzo1CxNSW+QgZwDMeeRBZRt6EpSkDmwzc3Nxsjsj7Pw8oCVcbx4TjH4X7YEpCA2Dv++mZSPzNtNpAWeHmSWno5InQDjdLQTLQOeg6BodnDFRkeNSCsGB5tukuzJiaB+F5JJqLLLsRL07UGroAKOgjXOAGBpbqkOP7I13XmFPT7ws4OflLE6hc55kx29H1CdgN6eidrLVKktdkt9ITjccZwqkJiIFZa6aZV5BYPpLo+rnTzP3cnaykSxGGmezdMEPR/x6hPw2jEgZ1X1mSASdUX8A3oqpYUC/vR1K50Ez76/y9fdt7uMmG4opadfUmpz57daz/NSVGgtyDCZ7Dt4EpkSZhnXjep8aQjxuBWQh7YCZLBxsp1Vb3oOEqsdzxp+RKR7ZxLYv1OjyuCSyHUODeI5toW/AmbhVuD1cvcIJcLSdGvxOUf9QG8BMtfcUK6P3er9PCBS+ZIDyIY3ZXmdboBUPzUltFmczbUWijPDiOR9HJ5xl1ieg2OXk9Pw82RfFgy1709DkYsJN30xMVnVNJIOjABGAWVlF6Z8WR1/CMVQQEK0r0Jjyhd/3dBxXPXT+oiPrV4TLMIjPQ==
X-Forefront-Antispam-Report:
	CIP:63.33.187.114;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-2.mta.getcheckrecipient.com;PTR:ec2-63-33-187-114.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(83380400001)(36756003)(70206006)(6666004)(426003)(82310400003)(7696005)(81166007)(8676002)(2906002)(1076003)(508600001)(44832011)(86362001)(36860700001)(4326008)(26005)(47076005)(336012)(2616005)(5660300002)(316002)(110136005)(186003)(70586007)(8936002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 12:03:54.0941
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 197158ef-8198-40e7-3780-08d97e8a36f1
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.33.187.114];Helo=[64aa7808-outbound-2.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT038.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3476

The most code in acpi_scan_nodes can be reused by other NUMA
implementation. Rename acpi_scan_nodes to a more generic name
numa_scan_nodes, and replace BIOS to Firmware in print message,
as BIOS is x86 specific name.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/arch/x86/numa.c        | 2 +-
 xen/arch/x86/srat.c        | 4 ++--
 xen/include/asm-x86/acpi.h | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/numa.c b/xen/arch/x86/numa.c
index 2ef385ae3f..8a4710df39 100644
--- a/xen/arch/x86/numa.c
+++ b/xen/arch/x86/numa.c
@@ -261,7 +261,7 @@ void __init numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn)
     end = pfn_to_paddr(end_pfn);
 
 #ifdef CONFIG_ACPI_NUMA
-    if ( !numa_off && !acpi_scan_nodes(start, end) )
+    if ( !numa_off && !numa_scan_nodes(start, end) )
         return;
 #endif
 
diff --git a/xen/arch/x86/srat.c b/xen/arch/x86/srat.c
index 4921830f94..0b8b0b0c95 100644
--- a/xen/arch/x86/srat.c
+++ b/xen/arch/x86/srat.c
@@ -512,7 +512,7 @@ void __init srat_parse_regions(paddr_t addr)
 }
 
 /* Use the information discovered above to actually set up the nodes. */
-int __init acpi_scan_nodes(paddr_t start, paddr_t end)
+int __init numa_scan_nodes(paddr_t start, paddr_t end)
 {
 	int i;
 	nodemask_t all_nodes_parsed;
@@ -547,7 +547,7 @@ int __init acpi_scan_nodes(paddr_t start, paddr_t end)
 		paddr_t size = nodes[i].end - nodes[i].start;
 		if ( size == 0 )
 			printk(KERN_WARNING "SRAT: Node %u has no memory. "
-			       "BIOS Bug or mis-configured hardware?\n", i);
+			       "Firmware Bug or mis-configured hardware?\n", i);
 
 		setup_node_bootmem(i, nodes[i].start, nodes[i].end);
 	}
diff --git a/xen/include/asm-x86/acpi.h b/xen/include/asm-x86/acpi.h
index 83be71fec3..2add971072 100644
--- a/xen/include/asm-x86/acpi.h
+++ b/xen/include/asm-x86/acpi.h
@@ -102,7 +102,7 @@ extern unsigned long acpi_wakeup_address;
 #define ARCH_HAS_POWER_INIT	1
 
 extern s8 fw_numa;
-extern int acpi_scan_nodes(u64 start, u64 end);
+extern int numa_scan_nodes(u64 start, u64 end);
 #define NR_NODE_MEMBLKS (MAX_NUMNODES*2)
 
 extern struct acpi_sleep_info acpi_sinfo;
-- 
2.25.1


