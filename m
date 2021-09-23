Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3120F415DE6
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 14:07:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193869.345458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTNVr-00078p-Fl; Thu, 23 Sep 2021 12:07:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193869.345458; Thu, 23 Sep 2021 12:07:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTNVr-00074w-AH; Thu, 23 Sep 2021 12:07:39 +0000
Received: by outflank-mailman (input) for mailman id 193869;
 Thu, 23 Sep 2021 12:07:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fewu=ON=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mTNTA-0005KP-0g
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 12:04:52 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:fe05::604])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bc4ca0cf-2426-441b-962a-1f49f29c75db;
 Thu, 23 Sep 2021 12:03:57 +0000 (UTC)
Received: from DB3PR08CA0003.eurprd08.prod.outlook.com (2603:10a6:8::16) by
 AM6PR08MB3783.eurprd08.prod.outlook.com (2603:10a6:20b:8a::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.14; Thu, 23 Sep 2021 12:03:55 +0000
Received: from DB5EUR03FT028.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:8:0:cafe::c7) by DB3PR08CA0003.outlook.office365.com
 (2603:10a6:8::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Thu, 23 Sep 2021 12:03:55 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT028.mail.protection.outlook.com (10.152.20.99) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 12:03:55 +0000
Received: ("Tessian outbound a77cafe56b47:v103");
 Thu, 23 Sep 2021 12:03:51 +0000
Received: from a0dd7d4ec432.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 391A3AAE-1392-41BE-8417-481DF8F46BA4.1; 
 Thu, 23 Sep 2021 12:03:44 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id a0dd7d4ec432.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 23 Sep 2021 12:03:44 +0000
Received: from AM6PR05CA0020.eurprd05.prod.outlook.com (2603:10a6:20b:2e::33)
 by AS8PR08MB6853.eurprd08.prod.outlook.com (2603:10a6:20b:39e::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Thu, 23 Sep
 2021 12:03:43 +0000
Received: from AM5EUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:2e:cafe::fb) by AM6PR05CA0020.outlook.office365.com
 (2603:10a6:20b:2e::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14 via Frontend
 Transport; Thu, 23 Sep 2021 12:03:43 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT055.mail.protection.outlook.com (10.152.17.214) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 12:03:42 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Thu, 23 Sep
 2021 12:03:39 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.87) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Thu, 23 Sep 2021 12:03:37 +0000
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
X-Inumbo-ID: bc4ca0cf-2426-441b-962a-1f49f29c75db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rxcQF/l2VBvSGxaJXCbidBt4Razr3FEN1UGpSS7VamU=;
 b=zJHNUwyB+8RXKpklFjxdwOuWnSsumjjycAfIW/1bJWf5VwowKZc1sre+OMSoW7tXPeB92hX+wgcuO6A4oW2PVL4FLOg1POsWIv08uYtADKXHkvn0Xsa1X5TdeKGTb6joTJu2fzvB+5hAp4y6MZjCxTtii0D7f7lgx2eOzYltT8s=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2d6f0d1f949a01f6
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=R9RgDAIkQY4uwu4MiZEoxHL3nE17jV4bpg6QJmhKG2HP6XLk+fsdF5hyReIXyyCXGfZTZ9Mr9VPaNcer1ohiWJF6hQ9CWbaHt9wqx019/hPsXKru/y3Vg1iQOVcarFnSiCqQ/X9h/qIth6o0L5DiFAOVqTzv1cTk8b+TOEOWBa3oq1zMptDQZ1Isu39M7cqlTWlMaAqE8EH4DPVqcpNkD7gRC4uWaF5lKe0QbV4QOo4MfoS69kknxK2QyFO5nB+XixiR9JJJpcUHwj41aHmDCOavsbEbo4YYuudQVSKz3X+7bXAviTI3/Vp3N6QfEd7tGXtgeXuPFIrq3x4ZRQLEPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=rxcQF/l2VBvSGxaJXCbidBt4Razr3FEN1UGpSS7VamU=;
 b=jPs4euhsdxfWL5cqUbaMlYFzM+SEoJajXJ458W+ZEw7/INY3XxNsbOaZYO/9QHcAWXaV/0G06al1bni/8XPoOXUUHslRakjeRZFsAMaUWTCExTXtKo6tI357OwaOSRez0cDn+dPtDgpxlU6CC2CbPCVsk5KTWkHydxEkcogC324VAZtuRIp+zlvGb2QtAEXG53PoXo6xOVc4lPBdACqkYMrwGLX2FMq0QtZDUKTHMD5BVG307SIgbQHbwjjubUSlra18sThIWFsXoYcENx9ElfNfQbsfQbRnEm/uyDKuTerM3hPbnEu0PthHL7Q8hhewvArBQbZ5gGdUOJr+8l7gAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rxcQF/l2VBvSGxaJXCbidBt4Razr3FEN1UGpSS7VamU=;
 b=zJHNUwyB+8RXKpklFjxdwOuWnSsumjjycAfIW/1bJWf5VwowKZc1sre+OMSoW7tXPeB92hX+wgcuO6A4oW2PVL4FLOg1POsWIv08uYtADKXHkvn0Xsa1X5TdeKGTb6joTJu2fzvB+5hAp4y6MZjCxTtii0D7f7lgx2eOzYltT8s=
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
Subject: [PATCH 14/37] xen/x86: use name fw_numa to replace acpi_numa
Date: Thu, 23 Sep 2021 20:02:13 +0800
Message-ID: <20210923120236.3692135-15-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210923120236.3692135-1-wei.chen@arm.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5389e76c-62cc-46b7-f6a9-08d97e8a37bd
X-MS-TrafficTypeDiagnostic: AS8PR08MB6853:|AM6PR08MB3783:
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB37839AAE5F777092F80EF60E9EA39@AM6PR08MB3783.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 rLUR4/pCjIS9x7cNthiiO3Ar48SawJFdwCNSpWTHq2p+P8k0ipVUWIQMyH77YgZtW/J1X0pcVu/y8zF10t5TKxnkEex3Twscy5Kw2RJ+65t+Fhh1NNQj+Q5JGXIZR0h3Z+YyzFTc+BlyeKqf9mOhFii09LIyrlTLIuxX9D/HfxDwoJVhy4mUcuJtnhF9COUE7TOZXrJTJHX0R003/JHL1rtu27oLExGAo9JMnvEdZ29rI/VLn6EKFgcgzB3ynrpXTp6Ef4KJNbhPLXTraYNeUs0XiiUHRkCZayg8W3wFzV0gTkkKKRG5gYs9yvb9bEZhSw2BsIns334WbMe//HK2B5awmijEKTZyGZfr4fGiYj1OoOmnb22mGA/LOvAqS9gNrK5F/zihUAUwU7lS+75JHdMXzJOiG5Ngd7DQ9HGVmfJYUXiv3PhltlUGuu8APYXzc9OG4xlQwjqjqIhBhLIJ2qbGoOk2RzIkhqvJ6FVkTyFuvi58FXX3RMN0yXDi3DEeVjZvyvzi5/K4RFwqKede2VsLnBpW2/XZ962UwLZMlK2BS5jEKHZwCGWNW9LI+CccrmJZuQkss8jtSSqyUSdR1JC+CIo5DA0CLg3vKPkOMV8Tb1u/c4NXeJ0dMPOS6hpPYZYhdLLBPu99IH1/cpwtA9gxDVFytZVhjnEGpoXjI8T07g8Z5/OI/GiNPFM02jfSNZYHH8k12KYqlbT12vMih4KTfIRWt+pIKbua9dF2pKI=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(508600001)(83380400001)(86362001)(8936002)(426003)(5660300002)(2906002)(186003)(8676002)(7696005)(6666004)(81166007)(47076005)(1076003)(36756003)(110136005)(2616005)(82310400003)(316002)(336012)(356005)(36860700001)(26005)(70586007)(44832011)(70206006)(4326008)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB6853
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	dc8688cf-ddaf-49b9-59ff-08d97e8a301a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	uATJXKJVpEIAFkO+YfGTAPPv1u+Lmz4zP3WUzFKDRs4W4ilVqwIB79Y3vEQ6CcVbwrKrfT6yemzj4pUJ6tQ4ZbWH4Vse6kctqjPaM/eP0aDv+dj+ywpSiNk4wR1GOnNBFn3qJamYf28kLQDA4MWi7a/0xq4pesDc9HxBTzjflN4KG7zbHXne/rwON13kG2lWmxcP7FeQ4RLn4r81ucj4eV2BeOIwKCK9EwpJAW0vEeQH1eLWkCc8pss0n72pWQjifCE+oAbbEcWZsfVqG/QFTHDysvufJrXhXxLkd7EH1iDllHzMyVOMfCXvSz5DSTF8cH+SibT8M1SFHPQScu8ZJZY3mJuw1wnjE1rgSpSTRTgCSo/LoZYpNtIzUYuk4dRbZ24kqKWbODe/WqanFZ/jJzx5srg4QhxbrTITGUIb+aaz3dc0/ntQtV3QvbbMmzzBYPyPQMdPlLMkC27vocw2zjngFBGpIEWYiyrDFIoBh3gT/VnZoW+Fg9q4SKyjcF6knyvUMk+gw7gKfmy2AqGSTNVurb6cXljfm53o1RdeGIguWymTN5P0T3OZsjcx+lO83dyv/f90Q1BrIR50ORdIXvBSa3PV5TZmaVq4J6JcpBum+Je0d7Ppy8LPpsQ8cdwts+GEKfEnhUUzEzGx45Q8n3RWUvpKLBPfX5HS64OmxKhRNgA0x5GkhGKdgDGGFFlbhc4MDyNP1d9Zv7SO4aL4ag==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(5660300002)(8936002)(110136005)(1076003)(2906002)(336012)(82310400003)(426003)(26005)(47076005)(4326008)(316002)(186003)(36860700001)(7696005)(508600001)(36756003)(6666004)(44832011)(83380400001)(86362001)(81166007)(2616005)(70206006)(70586007)(8676002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 12:03:55.5338
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5389e76c-62cc-46b7-f6a9-08d97e8a37bd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT028.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB3783

Xen is using acpi_numa as a switch for ACPI based NUMA. We want to
use this switch logic for other firmware based NUMA implementation,
like device tree based NUMA in follow-up patches. As Xen will never
use both ACPI and device tree based NUMA at runtime. So I rename
acpi_numa to a more generic name fw_name. This will also allow to
have the code mostly common.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/arch/x86/numa.c        |  6 +++---
 xen/arch/x86/setup.c       |  2 +-
 xen/arch/x86/srat.c        | 10 +++++-----
 xen/include/asm-x86/acpi.h |  2 +-
 4 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/xen/arch/x86/numa.c b/xen/arch/x86/numa.c
index 6bc4ade411..2ef385ae3f 100644
--- a/xen/arch/x86/numa.c
+++ b/xen/arch/x86/numa.c
@@ -51,11 +51,11 @@ cpumask_t node_to_cpumask[MAX_NUMNODES] __read_mostly;
 nodemask_t __read_mostly node_online_map = { { [0] = 1UL } };
 
 bool numa_off;
-s8 acpi_numa = 0;
+s8 fw_numa = 0;
 
 int srat_disabled(void)
 {
-    return numa_off || acpi_numa < 0;
+    return numa_off || fw_numa < 0;
 }
 
 /*
@@ -315,7 +315,7 @@ static __init int numa_setup(const char *opt)
     else if ( !strncmp(opt,"noacpi",6) )
     {
         numa_off = false;
-        acpi_numa = -1;
+        fw_numa = -1;
     }
 #endif
     else
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index b101565f14..1a2093b554 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -313,7 +313,7 @@ void srat_detect_node(int cpu)
     node_set_online(node);
     numa_set_node(cpu, node);
 
-    if ( opt_cpu_info && acpi_numa > 0 )
+    if ( opt_cpu_info && fw_numa > 0 )
         printk("CPU %d APIC %d -> Node %d\n", cpu, apicid, node);
 }
 
diff --git a/xen/arch/x86/srat.c b/xen/arch/x86/srat.c
index 9276a52138..4921830f94 100644
--- a/xen/arch/x86/srat.c
+++ b/xen/arch/x86/srat.c
@@ -167,7 +167,7 @@ static __init void bad_srat(void)
 {
 	int i;
 	printk(KERN_ERR "SRAT: SRAT not used.\n");
-	acpi_numa = -1;
+	fw_numa = -1;
 	for (i = 0; i < MAX_LOCAL_APIC; i++)
 		apicid_to_node[i] = NUMA_NO_NODE;
 	for (i = 0; i < ARRAY_SIZE(pxm2node); i++)
@@ -242,7 +242,7 @@ acpi_numa_x2apic_affinity_init(const struct acpi_srat_x2apic_cpu_affinity *pa)
 
 	apicid_to_node[pa->apic_id] = node;
 	numa_set_processor_nodes_parsed(node);
-	acpi_numa = 1;
+	fw_numa = 1;
 
 	if (opt_acpi_verbose)
 		printk(KERN_INFO "SRAT: PXM %u -> APIC %08x -> Node %u\n",
@@ -277,7 +277,7 @@ acpi_numa_processor_affinity_init(const struct acpi_srat_cpu_affinity *pa)
 	}
 	apicid_to_node[pa->apic_id] = node;
 	numa_set_processor_nodes_parsed(node);
-	acpi_numa = 1;
+	fw_numa = 1;
 
 	if (opt_acpi_verbose)
 		printk(KERN_INFO "SRAT: PXM %u -> APIC %02x -> Node %u\n",
@@ -492,7 +492,7 @@ void __init srat_parse_regions(paddr_t addr)
 	u64 mask;
 	unsigned int i;
 
-	if (acpi_disabled || acpi_numa < 0 ||
+	if (acpi_disabled || fw_numa < 0 ||
 	    acpi_table_parse(ACPI_SIG_SRAT, acpi_parse_srat))
 		return;
 
@@ -521,7 +521,7 @@ int __init acpi_scan_nodes(paddr_t start, paddr_t end)
 	for (i = 0; i < MAX_NUMNODES; i++)
 		cutoff_node(i, start, end);
 
-	if (acpi_numa <= 0)
+	if (fw_numa <= 0)
 		return -1;
 
 	if (!nodes_cover_memory()) {
diff --git a/xen/include/asm-x86/acpi.h b/xen/include/asm-x86/acpi.h
index 7032f3a001..83be71fec3 100644
--- a/xen/include/asm-x86/acpi.h
+++ b/xen/include/asm-x86/acpi.h
@@ -101,7 +101,7 @@ extern unsigned long acpi_wakeup_address;
 
 #define ARCH_HAS_POWER_INIT	1
 
-extern s8 acpi_numa;
+extern s8 fw_numa;
 extern int acpi_scan_nodes(u64 start, u64 end);
 #define NR_NODE_MEMBLKS (MAX_NUMNODES*2)
 
-- 
2.25.1


