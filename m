Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D50CA3E8EBF
	for <lists+xen-devel@lfdr.de>; Wed, 11 Aug 2021 12:32:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165795.303035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlWc-0004bm-Dr; Wed, 11 Aug 2021 10:31:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165795.303035; Wed, 11 Aug 2021 10:31:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlWb-0004Fr-N4; Wed, 11 Aug 2021 10:31:53 +0000
Received: by outflank-mailman (input) for mailman id 165795;
 Wed, 11 Aug 2021 10:31:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9qiF=NC=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mDlTX-0000BQ-J8
 for xen-devel@lists.xenproject.org; Wed, 11 Aug 2021 10:28:43 +0000
Received: from EUR02-AM5-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe07::61c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 825788ea-0dba-443e-a549-6d2f87a3c23a;
 Wed, 11 Aug 2021 10:26:11 +0000 (UTC)
Received: from PR0P264CA0104.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:19::20)
 by PAXPR08MB6640.eurprd08.prod.outlook.com (2603:10a6:102:dd::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.22; Wed, 11 Aug
 2021 10:26:09 +0000
Received: from VE1EUR03FT008.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:100:19:cafe::dc) by PR0P264CA0104.outlook.office365.com
 (2603:10a6:100:19::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15 via Frontend
 Transport; Wed, 11 Aug 2021 10:26:09 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT008.mail.protection.outlook.com (10.152.18.75) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.16 via Frontend Transport; Wed, 11 Aug 2021 10:26:09 +0000
Received: ("Tessian outbound efa8a7456a86:v101");
 Wed, 11 Aug 2021 10:26:09 +0000
Received: from e85922422c5e.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 5B43F670-27D9-44B6-A926-FC01CB34D019.1; 
 Wed, 11 Aug 2021 10:26:02 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id e85922422c5e.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 11 Aug 2021 10:26:02 +0000
Received: from DB6PR0201CA0010.eurprd02.prod.outlook.com (2603:10a6:4:3f::20)
 by AM9PR08MB6916.eurprd08.prod.outlook.com (2603:10a6:20b:30c::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.17; Wed, 11 Aug
 2021 10:26:00 +0000
Received: from DB5EUR03FT036.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:3f:cafe::27) by DB6PR0201CA0010.outlook.office365.com
 (2603:10a6:4:3f::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16 via Frontend
 Transport; Wed, 11 Aug 2021 10:26:00 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT036.mail.protection.outlook.com (10.152.20.185) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4415.16 via Frontend Transport; Wed, 11 Aug 2021 10:26:00 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Wed, 11 Aug
 2021 10:25:49 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.87) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Wed, 11 Aug 2021 10:25:47 +0000
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
X-Inumbo-ID: 825788ea-0dba-443e-a549-6d2f87a3c23a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t/9Z30yQrnVeDNYbOYgNSbsnu664JdEj5BAT/JnizSg=;
 b=ykOvZIoDqxAN0bc6pw6EJ7FpcpVMLTGSnP5PVosztTjah2on64MPUXb7nlDcKOGYFf+d4R3cJ7e7Mmmrp0Hrq/9L/ysGKq8JNe+impg6r7QP23O5qTGgQkDwm+NljRrqRsvaV4OBRL2W84dEBVmLs/auoPs+o0lgACZ8uwSCibg=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: c04fb077d407ff8b
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LqDxmdIlMlNad36wj/HNgeinp+CO3m6DbBmuXYgprQx/PSQpJBN2GOhx0fDrL2s7u6tjfwQ3a8NpFMffmF6PsHECbA+bTMMsjoeZM0OrNJC2Os/Ggj0Y5aF2/ELrPZwgPmphHLJWfRBbuc6J+Jh8jld025yGvJJ1dNOS4Nk2j11fLkmxXVqnKY+MUNskllCcN2HazVzL9ufn5lJtAlIJ3B3A0GNrey72l5GvUGn6SibbbZ63PDB61gdaThPGSQ4LwDQDzWlusPCP7pQWvu0rMw1LSYDqGM1iSoj2jEo8HgNGpotTjN1qYIzNBsv860nw0LuFX+Di8l4dtNYj2kvKwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t/9Z30yQrnVeDNYbOYgNSbsnu664JdEj5BAT/JnizSg=;
 b=hC2yRKQJJivU4vTsYUSI6HE7lPs5dqosAyDlV4q1ZiqYk03cvkcWZS3wICpozplTFu+/Jt/Vs0fnCwjh2Bj00sbM0tiiA36ZARcVgCysEYLtBptd8rrvDasgVf6hvcjJIROcPB+7gHDump4hNcgyt9eEp5CeKDk8FdQfrZgiswVJ3onnyJEU2ppD7CU3+X63rlToxdt1cXywrag+lSJhy4UT7URVNDmrCTLm5qLZau9akv2JCNk14zSJ/ftL/3bkIVVpeShkkRRIi1Pj2+xzv7EV6NHKUWi0jf3OOfViFcwfq7KwzCBQccDoRElfFbBIK0ti9KIEITgr9lECNKpQ8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t/9Z30yQrnVeDNYbOYgNSbsnu664JdEj5BAT/JnizSg=;
 b=ykOvZIoDqxAN0bc6pw6EJ7FpcpVMLTGSnP5PVosztTjah2on64MPUXb7nlDcKOGYFf+d4R3cJ7e7Mmmrp0Hrq/9L/ysGKq8JNe+impg6r7QP23O5qTGgQkDwm+NljRrqRsvaV4OBRL2W84dEBVmLs/auoPs+o0lgACZ8uwSCibg=
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
Subject: [XEN RFC PATCH 32/40] xen/x86: make acpi_scan_nodes to be neutral
Date: Wed, 11 Aug 2021 18:24:15 +0800
Message-ID: <20210811102423.28908-33-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210811102423.28908-1-wei.chen@arm.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6cf62339-b5ee-4533-7fc2-08d95cb26f97
X-MS-TrafficTypeDiagnostic: AM9PR08MB6916:|PAXPR08MB6640:
X-Microsoft-Antispam-PRVS:
	<PAXPR08MB664034275840DB1D5248CB559EF89@PAXPR08MB6640.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 q86xrus2iSBNVRhC6K/hxmWwNhjT9LWm6Z5G/1ALFPuM+PmOyCjgLDSv05i33DZQhY8yV+kxmxWQOdga/MEI+Ncz1uA+7WDX/uKUASvZiP8DuWAVe+TKHbnpk1Tj09oKNYT17rn/5c4TVMM4Zgj/XHq1TBLp1FeJVHC33UmtqD0xdM7e2lAdXMTs4CBRK2PvfjGFFbVY9jnTEWxhICv9BBNZFBWc+h/TS/Ztm4kQi9HbItAkwdqPbUj1nX3G1CGkWlcnGRDIrmvY659SYWl9rTQUBJvaIV1fTeTmfPu3XCbVODQIWFniANIQTcxdrobL9ROUAGtkfFwnZdCBbS3zEV4kccr/E+ldWegF3etIdt6CXtS5S7IwVgn7uStCnyRtzttwX0j8vo8XNtsbVu9ABnP3pavwXFkTB/HjlTPeX3VZVzzdWt8O/slIz0W0+2GTb0zH4B0c7buWFgai1Ow4c+YqbHNFKJslR12DPjjoQ4gdRhnEaJxZOJQEb8OCVMmh0yH9Cur6Z6hwnJQZGoDbw7nTk8dsN4zVFieZSBKfm9UNgnQAVeVoFvBeor+Th1rsKSJTHqzztX9RMJuUtHi3X1HA54cHFZ0cUwEnTGXFPLh5728nUejWohXtQcBtLflXhcWxnghbgc+zCcIEiZwJwMsHF7BIcYxCzdZixizhPIX9JshrwzMmnuWc6DOs1rU92TEm1HO0zzwROKpyHTT4Vn5luAv/Qjk1EWQjKrC14796HJhgQUtTq1wbEP86zl5kTy6K4Ba5NPgbTlh4uu+K/SE6TrN01vy4MbyvDtVCdAI=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(376002)(136003)(396003)(39860400002)(346002)(36840700001)(46966006)(81166007)(1076003)(82740400003)(110136005)(426003)(47076005)(70206006)(7696005)(70586007)(36860700001)(5660300002)(2616005)(82310400003)(44832011)(356005)(4326008)(86362001)(316002)(336012)(36756003)(83380400001)(26005)(186003)(2906002)(8936002)(34070700002)(6666004)(8676002)(478600001)(2101003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB6916
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	7ab51a75-7a37-4b3d-416b-08d95cb26a3f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OEs5lv2+kLKykGB7qbXSZHyJcuw9vJ04A7CijnXMzwJThXPso4Y3cTp4VIslijG8Tz6O4QABAXg12aQ/ln/IHeeS+ddqgHShhLBhClbatV7l7DygXX2S0TQr7subuSAJePGYLtkN30h+3g+fQEoCz/zz1LJfyp8Yy5ZuzxhCwtvzGTYQuwRDv7/XCZf6yxBtVDuLcgDjXWIG8+nJ0yVcw4pSkVPkpSGqIZ9ClpRFQEJXLEW4/i9KuMaAsNFq2GJOFc0NE4OuelYs+pqJuEDhGPs686nnOXnXVPBE410Epo4xZVugc199Z0vn58vIb2uD19sZA6syjKRYW64Btu6U066//ppuLgb/70mY1tKMOmQ6VvlOxdRpyG7IdiS9tZqJmZuqjtag6cVOzlB2xUp5FUeZmBBREoR7UiZrdA7wW+u2ReBaNxyNuql3c1NoynquGF0NrE4DTNv1UT8cwBtFKxOOTiv93R9gT3CdHS/cyhcjlQXTOjJP7t2Vg0WNyreu8v4Rn4KaM5kyGKfQ9hQUg2OJ8xYMQvbj+L5BsFvplQGsbPJtRLgGDt0GBRFsyXmcrXudN8dECE7hCq97r4FQAk9nCrl5mhULW8gBDQJdeTvl3MgE79fg0YyqOb+uZiXv+MUAo6FXcg4N3Z/3ybd+yWFUkTUlkACT8TZsjo6FkFZizBNq34Ehn751bx//I6ndv4fjIoh7WYNfYxeoa96wWuIfXp0q+Mz7GKIrMcN1ikw=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(8936002)(426003)(70586007)(8676002)(82310400003)(6666004)(70206006)(26005)(508600001)(186003)(47076005)(1076003)(316002)(44832011)(4326008)(2616005)(83380400001)(36860700001)(36756003)(86362001)(2906002)(81166007)(7696005)(5660300002)(110136005)(336012)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2021 10:26:09.4570
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cf62339-b5ee-4533-7fc2-08d95cb26f97
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT008.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6640

The code in acpi_scan_nodes can be reused for device tree based
NUMA. So we rename acpi_scan_nodes to numa_scan_nodes for a neutral
function name. As acpi_numa variable is available in ACPU based NUMA
system only, we use CONFIG_ACPI_NUMA to protect it.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/arch/x86/srat.c        | 4 +++-
 xen/common/numa.c          | 2 +-
 xen/include/asm-x86/acpi.h | 2 +-
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/xen/arch/x86/srat.c b/xen/arch/x86/srat.c
index dcebc7adec..3d4d90a622 100644
--- a/xen/arch/x86/srat.c
+++ b/xen/arch/x86/srat.c
@@ -362,7 +362,7 @@ void __init srat_parse_regions(u64 addr)
 }
 
 /* Use the information discovered above to actually set up the nodes. */
-int __init acpi_scan_nodes(u64 start, u64 end)
+int __init numa_scan_nodes(u64 start, u64 end)
 {
 	int i;
 	nodemask_t all_nodes_parsed;
@@ -371,8 +371,10 @@ int __init acpi_scan_nodes(u64 start, u64 end)
 	for (i = 0; i < MAX_NUMNODES; i++)
 		cutoff_node(i, start, end);
 
+#ifdef CONFIG_ACPI_NUMA
 	if (acpi_numa <= 0)
 		return -1;
+#endif
 
 	if (!nodes_cover_memory()) {
 		bad_srat();
diff --git a/xen/common/numa.c b/xen/common/numa.c
index 74960885a6..4152bbe83b 100644
--- a/xen/common/numa.c
+++ b/xen/common/numa.c
@@ -330,7 +330,7 @@ void __init numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn)
 #endif
 
 #ifdef CONFIG_ACPI_NUMA
-    if ( !numa_off && !acpi_scan_nodes((u64)start_pfn << PAGE_SHIFT,
+    if ( !numa_off && !numa_scan_nodes((u64)start_pfn << PAGE_SHIFT,
          (u64)end_pfn << PAGE_SHIFT) )
         return;
 #endif
diff --git a/xen/include/asm-x86/acpi.h b/xen/include/asm-x86/acpi.h
index d347500a3c..33b71dfb3b 100644
--- a/xen/include/asm-x86/acpi.h
+++ b/xen/include/asm-x86/acpi.h
@@ -102,7 +102,7 @@ extern unsigned long acpi_wakeup_address;
 #define ARCH_HAS_POWER_INIT	1
 
 extern s8 acpi_numa;
-extern int acpi_scan_nodes(u64 start, u64 end);
+extern int numa_scan_nodes(u64 start, u64 end);
 
 extern struct acpi_sleep_info acpi_sinfo;
 #define acpi_video_flags bootsym(video_flags)
-- 
2.25.1


