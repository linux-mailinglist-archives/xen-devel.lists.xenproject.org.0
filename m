Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 601603E8E8E
	for <lists+xen-devel@lfdr.de>; Wed, 11 Aug 2021 12:25:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165636.302714 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlQO-000403-QS; Wed, 11 Aug 2021 10:25:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165636.302714; Wed, 11 Aug 2021 10:25:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlQO-0003u5-Jk; Wed, 11 Aug 2021 10:25:28 +0000
Received: by outflank-mailman (input) for mailman id 165636;
 Wed, 11 Aug 2021 10:25:26 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9qiF=NC=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mDlQM-0002Qj-Eq
 for xen-devel@lists.xenproject.org; Wed, 11 Aug 2021 10:25:26 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown
 [40.107.22.56]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6decab1a-fa8e-11eb-a052-12813bfff9fa;
 Wed, 11 Aug 2021 10:25:20 +0000 (UTC)
Received: from AM6P194CA0084.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:8f::25)
 by VI1PR08MB2926.eurprd08.prod.outlook.com (2603:10a6:802:1f::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.19; Wed, 11 Aug
 2021 10:25:17 +0000
Received: from VE1EUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:8f:cafe::87) by AM6P194CA0084.outlook.office365.com
 (2603:10a6:209:8f::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15 via Frontend
 Transport; Wed, 11 Aug 2021 10:25:17 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT007.mail.protection.outlook.com (10.152.18.114) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.16 via Frontend Transport; Wed, 11 Aug 2021 10:25:17 +0000
Received: ("Tessian outbound d9f41274f41a:v101");
 Wed, 11 Aug 2021 10:25:17 +0000
Received: from 624525df80f4.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 917ED75A-EEED-4471-BA86-41FC4B9EBF27.1; 
 Wed, 11 Aug 2021 10:25:10 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 624525df80f4.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 11 Aug 2021 10:25:10 +0000
Received: from DB9PR01CA0003.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:1d8::8) by DB7PR08MB3532.eurprd08.prod.outlook.com
 (2603:10a6:10:4f::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.19; Wed, 11 Aug
 2021 10:25:08 +0000
Received: from DB5EUR03FT045.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1d8:cafe::60) by DB9PR01CA0003.outlook.office365.com
 (2603:10a6:10:1d8::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.15 via Frontend
 Transport; Wed, 11 Aug 2021 10:25:08 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT045.mail.protection.outlook.com (10.152.21.164) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4415.16 via Frontend Transport; Wed, 11 Aug 2021 10:25:08 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.14; Wed, 11 Aug
 2021 10:25:01 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 11
 Aug 2021 10:25:01 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.87) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Wed, 11 Aug 2021 10:24:59 +0000
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
X-Inumbo-ID: 6decab1a-fa8e-11eb-a052-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/By6TFLKETxqpP5+PvBGPeS8Y880B33FwtMWH566dSA=;
 b=zAuVpOWu9jXqVQnjWG+9JD0a2FlLi2ojOOOi+giG1ytg+tGCaO1QbU8TVyoEeNKsK67Z9/r3rZ1O+Vr4xYaWC7UkxF815i2CmatjCLYkIayxSJ6Gq4pRCMXLQoyvcD0+iyMWGBKQ8uxMqZmmOH7OjfrDAqV5V+/pTMJzQoY5Ric=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5f374230a6a1f1ac
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UInEoIYnZNaj/GgjiTV8Xp24+XMf65wWmRzwY8+QveyVW0X7dzY1nBvIfuZ/dZDe5pKcFwOCCmPHYlXzBzDS7gZe0AkgdnnLuFiBh49n0F5e1v9A6AuV0tyB47sBO+glIedsBft9KLHHGnVcFQwr5PbeEEqPEgLqrPge7peSyIOVBDWXs5fGpdEvLhyflkSuuiF0G4t5pOypYlR3/ixBpiB/SjCV+gKJPqnFspHUcjBdBodFwvYe/o/GsOdKgwHAQlMpiVVwe0mOGajlI8TWXNMjQVFhq408zkK2CTlnr1HujrDf2Glj/giaNbArjfoq3x3+4j+JNeaF5r4z1J9+pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/By6TFLKETxqpP5+PvBGPeS8Y880B33FwtMWH566dSA=;
 b=fItnWJRs5HYKkdcZB7Y2e02h3p/Ia9moWliWT2YBR0OWnxC8D4wZsItkpBIG6lK+U7YBlAeVWvQLiGItOZFCTdq+NwRRJl/DIOpVL52Jam7Q9EXGZY8T4knaBYn/qXUgQD2tK1LJcRom07yuVIdyRkUQeFPn0Ctl8bwvNtFFAzIxGSwThiq2s4fG8/K6cq2nT0VrBBKmxTF3b3tIMlU9ytTVS++GRAnTZ9rp/X4Mzm3Rypx/phBCqGaDz7vCDoBKfRT00xsLv/Cs8G9OyyVweyMDcqGmGFmnb1doFvMZ2H0oGArTctnhsjOhpUaRp57qhDNlFtYhptTGBw01i/73Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/By6TFLKETxqpP5+PvBGPeS8Y880B33FwtMWH566dSA=;
 b=zAuVpOWu9jXqVQnjWG+9JD0a2FlLi2ojOOOi+giG1ytg+tGCaO1QbU8TVyoEeNKsK67Z9/r3rZ1O+Vr4xYaWC7UkxF815i2CmatjCLYkIayxSJ6Gq4pRCMXLQoyvcD0+iyMWGBKQ8uxMqZmmOH7OjfrDAqV5V+/pTMJzQoY5Ric=
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
Subject: [XEN RFC PATCH 12/40] xen/x86: Move numa_initmem_init to common
Date: Wed, 11 Aug 2021 18:23:55 +0800
Message-ID: <20210811102423.28908-13-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210811102423.28908-1-wei.chen@arm.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 18c7e52f-8f8f-4487-447f-08d95cb2507d
X-MS-TrafficTypeDiagnostic: DB7PR08MB3532:|VI1PR08MB2926:
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB292677FAF5013857936F74019EF89@VI1PR08MB2926.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:2958;OLM:2958;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 R9xbNYIBhO7mky218ALecJMWS54a8BLg7LFw+NSOcrlW8mEhPxCIOJVTasZu/QfnXWtEgmoMj/nzO5OkGkQCJRvv6wo9ni76FuuKL8mU3chVvO2a64xmiWHn0YuvOmAry3IvCbaZX3RUbmxWNscCqI3WVn69YeA11a2yJl3bRSUEFnUl/1shTfAhW40FoZM1rOAzKIj+Ba8DGWR9Dd5MDaDqGaAfq5NMw4CTJfNiGF1NKqjcMnkRT+xY0bhWUMa7RrhvFwco0PSPmJAf1u/g7sqH8AQ5B9kKaSTL2uHTTl2kZ3QJEtFEooYs8FLmWgIw2Pakc/onymvBGPHrAjlcgIY965e/tRLvnMPXhQeQBJSq2ijvoW8AEX39jyZm/ZU/65aBfADBYcd1XgShKyAohIkoZfhlWpLCt6LknQH96Wr8q5GtXH95Z0Dkd9nH7RNGbSbLmHMdcZZJaGYYPEJzSpdQ3nLjwSVtfjCbRN0QdF6GzBDW7U3jGnq8YiDM//WqJ9wPqUn67DyZngzYfh6jLotJn0SJUmtEQ3IrsFEM4ZLQbsbhUWjIvmvNAmQZlprffaqZ0bI6ou8CqMO9a9PpO5pcmnO5vETlDV+CGLUVWKB0xvB4b15qcXryIfOZvv9TChDwqFM5dzNlyiCDpsMLuwhkeDUekU7pxZgpP5oK9vv307FKgoG1PhPnOJXBkJXg/Ox0kVXW5BP3jycoPHizOQNgyaTvtWWzHb77FxB8kSYpgq6K8k3V6LO36v6MrJ0+roUy1QwY1ZkUOk3VsNxRx6znBiCIxauH34SnLCAYQ/Q=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(396003)(39860400002)(346002)(376002)(136003)(36840700001)(46966006)(1076003)(70206006)(70586007)(8936002)(36756003)(30864003)(6666004)(26005)(5660300002)(8676002)(36860700001)(478600001)(7696005)(186003)(336012)(44832011)(110136005)(81166007)(86362001)(2906002)(47076005)(83380400001)(426003)(356005)(34070700002)(82310400003)(4326008)(316002)(2616005)(82740400003)(2101003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3532
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	19502cd9-45f5-4588-a911-08d95cb24b40
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	YTf+EyQrRhxYGNgHB5VlWLzO01bPGkSQDqzTzt1AcOECeXf+yz+rjMBMMss2xBj2PSsJIDbGknor03s+TdPEraGro0BWWxlSG87smJF5JbynCgSEBVkBrrRWhFP8Tb88b2A8cPQDVnuCprWV0f1n3hjMWv0TSo/3+tINMHDC+vBbm5laa38lyZbT/rBy8uj2QfP9fjayc7E6H0iaWccdO3Yu5Zpf7Htbo1rXwQ/KG+HF7xuaudvnuj/jOiwXtAfo00N0+JJou6fHqWwkf/oXjP1j509A5u985hJ94va1A0o9LXYyVMeKNLzB+LMChRJKEvQ8dxa3kMd9+rEL8ol4mG2e8gtnkAbC5QH87IiJrsCvejaTnn4KaLL25Y/i9hNblMAW5J6i/Svrzzp8z0VrHIr4TOy1Lbn62QQQwQWUne2IlIWuQHTIEK1csZBkF01bev6BxjyknQcVnP1TGse7aAlfljo1n0KlWJksU2dnDYPBKP0O2LRRz4wTm8ohN+pAqnFWJTL0FrZo6w2X3Xzz51cYGZtPye5KmkVlANqQrqmeTo72mObnw1dl1R5D70viEYI+fLytA33j3LJ+Xspm4xUo0V0pfT+4lqcBrM8A2r53A3UawFe4K27a7FA++t7a8KhcwSkyLxO4qRjCwf08sQ1H/fqWa87llQ8MxrfvipOuusnDcOrXIhL1obZUUzIP+jK6Q3guV1X/ztA1te9sNBD7plp46pxe4bbUKJ9XdY0=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(346002)(39860400002)(136003)(396003)(36840700001)(46966006)(2906002)(70586007)(36756003)(70206006)(81166007)(82740400003)(8676002)(44832011)(336012)(82310400003)(26005)(1076003)(186003)(8936002)(7696005)(478600001)(83380400001)(4326008)(6666004)(5660300002)(316002)(110136005)(86362001)(426003)(36860700001)(2616005)(30864003)(47076005)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2021 10:25:17.2387
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 18c7e52f-8f8f-4487-447f-08d95cb2507d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT007.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB2926

This function can be reused by Arm device tree based
NUMA support. So we move it from x86 to common, as well
as its related variables and functions:
setup_node_bootmem, numa_init_array and numa_emulation.

As numa_initmem_init has been moved to common, _memnodemap
is not used cross files. We can restore _memnodemap to
static.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/arch/x86/numa.c         | 118 ----------------------------------
 xen/common/numa.c           | 122 +++++++++++++++++++++++++++++++++++-
 xen/include/asm-x86/numa.h  |   5 --
 xen/include/asm-x86/setup.h |   1 -
 xen/include/xen/numa.h      |   8 ++-
 5 files changed, 128 insertions(+), 126 deletions(-)

diff --git a/xen/arch/x86/numa.c b/xen/arch/x86/numa.c
index f2626b3968..6908738305 100644
--- a/xen/arch/x86/numa.c
+++ b/xen/arch/x86/numa.c
@@ -38,7 +38,6 @@ nodeid_t apicid_to_node[MAX_LOCAL_APIC] = {
 
 nodemask_t __read_mostly node_online_map = { { [0] = 1UL } };
 
-bool numa_off;
 s8 acpi_numa = 0;
 
 int srat_disabled(void)
@@ -46,123 +45,6 @@ int srat_disabled(void)
     return numa_off || acpi_numa < 0;
 }
 
-/* initialize NODE_DATA given nodeid and start/end */
-void __init setup_node_bootmem(nodeid_t nodeid, u64 start, u64 end)
-{ 
-    unsigned long start_pfn, end_pfn;
-
-    start_pfn = start >> PAGE_SHIFT;
-    end_pfn = end >> PAGE_SHIFT;
-
-    NODE_DATA(nodeid)->node_start_pfn = start_pfn;
-    NODE_DATA(nodeid)->node_spanned_pages = end_pfn - start_pfn;
-
-    node_set_online(nodeid);
-} 
-
-void __init numa_init_array(void)
-{
-    int rr, i;
-
-    /* There are unfortunately some poorly designed mainboards around
-       that only connect memory to a single CPU. This breaks the 1:1 cpu->node
-       mapping. To avoid this fill in the mapping for all possible
-       CPUs, as the number of CPUs is not known yet.
-       We round robin the existing nodes. */
-    rr = first_node(node_online_map);
-    for ( i = 0; i < nr_cpu_ids; i++ )
-    {
-        if ( cpu_to_node[i] != NUMA_NO_NODE )
-            continue;
-        numa_set_node(i, rr);
-        rr = cycle_node(rr, node_online_map);
-    }
-}
-
-#ifdef CONFIG_NUMA_EMU
-static int numa_fake __initdata = 0;
-
-/* Numa emulation */
-static int __init numa_emulation(u64 start_pfn, u64 end_pfn)
-{
-    int i;
-    struct node nodes[MAX_NUMNODES];
-    u64 sz = ((end_pfn - start_pfn)<<PAGE_SHIFT) / numa_fake;
-
-    /* Kludge needed for the hash function */
-    if ( hweight64(sz) > 1 )
-    {
-        u64 x = 1;
-        while ( (x << 1) < sz )
-            x <<= 1;
-        if ( x < sz/2 )
-            printk(KERN_ERR "Numa emulation unbalanced. Complain to maintainer\n");
-        sz = x;
-    }
-
-    memset(&nodes,0,sizeof(nodes));
-    for ( i = 0; i < numa_fake; i++ )
-    {
-        nodes[i].start = (start_pfn<<PAGE_SHIFT) + i*sz;
-        if ( i == numa_fake - 1 )
-            sz = (end_pfn<<PAGE_SHIFT) - nodes[i].start;
-        nodes[i].end = nodes[i].start + sz;
-        printk(KERN_INFO "Faking node %d at %"PRIx64"-%"PRIx64" (%"PRIu64"MB)\n",
-               i,
-               nodes[i].start, nodes[i].end,
-               (nodes[i].end - nodes[i].start) >> 20);
-        node_set_online(i);
-    }
-    memnode_shift = compute_hash_shift(nodes, numa_fake, NULL);
-    if ( memnode_shift < 0 )
-    {
-        memnode_shift = 0;
-        printk(KERN_ERR "No NUMA hash function found. Emulation disabled.\n");
-        return -1;
-    }
-    for_each_online_node ( i )
-        setup_node_bootmem(i, nodes[i].start, nodes[i].end);
-    numa_init_array();
-
-    return 0;
-}
-#endif
-
-void __init numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn)
-{ 
-    int i;
-
-#ifdef CONFIG_NUMA_EMU
-    if ( numa_fake && !numa_emulation(start_pfn, end_pfn) )
-        return;
-#endif
-
-#ifdef CONFIG_ACPI_NUMA
-    if ( !numa_off && !acpi_scan_nodes((u64)start_pfn << PAGE_SHIFT,
-         (u64)end_pfn << PAGE_SHIFT) )
-        return;
-#endif
-
-    printk(KERN_INFO "%s\n",
-           numa_off ? "NUMA turned off" : "No NUMA configuration found");
-
-    printk(KERN_INFO "Faking a node at %016"PRIx64"-%016"PRIx64"\n",
-           (u64)start_pfn << PAGE_SHIFT,
-           (u64)end_pfn << PAGE_SHIFT);
-    /* setup dummy node covering all memory */
-    memnode_shift = BITS_PER_LONG - 1;
-    memnodemap = _memnodemap;
-    memnodemapsize = ARRAY_SIZE(_memnodemap);
-
-    nodes_clear(node_online_map);
-    node_set_online(0);
-    for ( i = 0; i < nr_cpu_ids; i++ )
-        numa_set_node(i, 0);
-    cpumask_copy(&node_to_cpumask[0], cpumask_of(0));
-    setup_node_bootmem(0, (u64)start_pfn << PAGE_SHIFT,
-                    (u64)end_pfn << PAGE_SHIFT);
-}
-
 void numa_set_node(int cpu, nodeid_t node)
 {
     cpu_to_node[cpu] = node;
diff --git a/xen/common/numa.c b/xen/common/numa.c
index 1facc8fe2b..26c0006d04 100644
--- a/xen/common/numa.c
+++ b/xen/common/numa.c
@@ -14,12 +14,13 @@
 #include <xen/smp.h>
 #include <xen/pfn.h>
 #include <xen/sched.h>
+#include <asm/acpi.h>
 
 struct node_data node_data[MAX_NUMNODES];
 
 /* Mapping from pdx to node id */
 int memnode_shift;
-typeof(*memnodemap) _memnodemap[64];
+static typeof(*memnodemap) _memnodemap[64];
 unsigned long memnodemapsize;
 u8 *memnodemap;
 
@@ -34,6 +35,8 @@ int num_node_memblks;
 struct node node_memblk_range[NR_NODE_MEMBLKS];
 nodeid_t memblk_nodeid[NR_NODE_MEMBLKS];
 
+bool numa_off;
+
 /*
  * Given a shift value, try to populate memnodemap[]
  * Returns :
@@ -191,3 +194,120 @@ void numa_add_cpu(int cpu)
 {
     cpumask_set_cpu(cpu, &node_to_cpumask[cpu_to_node(cpu)]);
 }
+
+/* initialize NODE_DATA given nodeid and start/end */
+void __init setup_node_bootmem(nodeid_t nodeid, u64 start, u64 end)
+{
+    unsigned long start_pfn, end_pfn;
+
+    start_pfn = start >> PAGE_SHIFT;
+    end_pfn = end >> PAGE_SHIFT;
+
+    NODE_DATA(nodeid)->node_start_pfn = start_pfn;
+    NODE_DATA(nodeid)->node_spanned_pages = end_pfn - start_pfn;
+
+    node_set_online(nodeid);
+}
+
+void __init numa_init_array(void)
+{
+    int rr, i;
+
+    /* There are unfortunately some poorly designed mainboards around
+       that only connect memory to a single CPU. This breaks the 1:1 cpu->node
+       mapping. To avoid this fill in the mapping for all possible
+       CPUs, as the number of CPUs is not known yet.
+       We round robin the existing nodes. */
+    rr = first_node(node_online_map);
+    for ( i = 0; i < nr_cpu_ids; i++ )
+    {
+        if ( cpu_to_node[i] != NUMA_NO_NODE )
+            continue;
+        numa_set_node(i, rr);
+        rr = cycle_node(rr, node_online_map);
+    }
+}
+
+#ifdef CONFIG_NUMA_EMU
+int numa_fake __initdata = 0;
+
+/* Numa emulation */
+static int __init numa_emulation(u64 start_pfn, u64 end_pfn)
+{
+    int i;
+    struct node nodes[MAX_NUMNODES];
+    u64 sz = ((end_pfn - start_pfn)<<PAGE_SHIFT) / numa_fake;
+
+    /* Kludge needed for the hash function */
+    if ( hweight64(sz) > 1 )
+    {
+        u64 x = 1;
+        while ( (x << 1) < sz )
+            x <<= 1;
+        if ( x < sz/2 )
+            printk(KERN_ERR "Numa emulation unbalanced. Complain to maintainer\n");
+        sz = x;
+    }
+
+    memset(&nodes,0,sizeof(nodes));
+    for ( i = 0; i < numa_fake; i++ )
+    {
+        nodes[i].start = (start_pfn<<PAGE_SHIFT) + i*sz;
+        if ( i == numa_fake - 1 )
+            sz = (end_pfn<<PAGE_SHIFT) - nodes[i].start;
+        nodes[i].end = nodes[i].start + sz;
+        printk(KERN_INFO "Faking node %d at %"PRIx64"-%"PRIx64" (%"PRIu64"MB)\n",
+               i,
+               nodes[i].start, nodes[i].end,
+               (nodes[i].end - nodes[i].start) >> 20);
+        node_set_online(i);
+    }
+    memnode_shift = compute_hash_shift(nodes, numa_fake, NULL);
+    if ( memnode_shift < 0 )
+    {
+        memnode_shift = 0;
+        printk(KERN_ERR "No NUMA hash function found. Emulation disabled.\n");
+        return -1;
+    }
+    for_each_online_node ( i )
+        setup_node_bootmem(i, nodes[i].start, nodes[i].end);
+    numa_init_array();
+
+    return 0;
+}
+#endif
+
+void __init numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn)
+{
+    int i;
+
+#ifdef CONFIG_NUMA_EMU
+    if ( numa_fake && !numa_emulation(start_pfn, end_pfn) )
+        return;
+#endif
+
+#ifdef CONFIG_ACPI_NUMA
+    if ( !numa_off && !acpi_scan_nodes((u64)start_pfn << PAGE_SHIFT,
+         (u64)end_pfn << PAGE_SHIFT) )
+        return;
+#endif
+
+    printk(KERN_INFO "%s\n",
+           numa_off ? "NUMA turned off" : "No NUMA configuration found");
+
+    printk(KERN_INFO "Faking a node at %016"PRIx64"-%016"PRIx64"\n",
+           (u64)start_pfn << PAGE_SHIFT,
+           (u64)end_pfn << PAGE_SHIFT);
+    /* setup dummy node covering all memory */
+    memnode_shift = BITS_PER_LONG - 1;
+    memnodemap = _memnodemap;
+    memnodemapsize = ARRAY_SIZE(_memnodemap);
+
+    nodes_clear(node_online_map);
+    node_set_online(0);
+    for ( i = 0; i < nr_cpu_ids; i++ )
+        numa_set_node(i, 0);
+    cpumask_copy(&node_to_cpumask[0], cpumask_of(0));
+    setup_node_bootmem(0, (u64)start_pfn << PAGE_SHIFT,
+                    (u64)end_pfn << PAGE_SHIFT);
+}
diff --git a/xen/include/asm-x86/numa.h b/xen/include/asm-x86/numa.h
index e8a92ad9df..f8e4e15586 100644
--- a/xen/include/asm-x86/numa.h
+++ b/xen/include/asm-x86/numa.h
@@ -21,16 +21,11 @@ extern nodeid_t pxm_to_node(unsigned int pxm);
 
 #define ZONE_ALIGN (1UL << (MAX_ORDER+PAGE_SHIFT))
 
-extern void numa_init_array(void);
-extern bool numa_off;
-
-
 extern int srat_disabled(void);
 extern void numa_set_node(int cpu, nodeid_t node);
 extern nodeid_t setup_node(unsigned int pxm);
 extern void srat_detect_node(int cpu);
 
-extern void setup_node_bootmem(nodeid_t nodeid, u64 start, u64 end);
 extern nodeid_t apicid_to_node[];
 extern void init_cpu_to_node(void);
 
diff --git a/xen/include/asm-x86/setup.h b/xen/include/asm-x86/setup.h
index 24be46115d..63838ba2d1 100644
--- a/xen/include/asm-x86/setup.h
+++ b/xen/include/asm-x86/setup.h
@@ -17,7 +17,6 @@ void early_time_init(void);
 
 void set_nr_cpu_ids(unsigned int max_cpus);
 
-void numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn);
 void arch_init_memory(void);
 void subarch_init_memory(void);
 
diff --git a/xen/include/xen/numa.h b/xen/include/xen/numa.h
index 67b79a73a3..258a5cb3db 100644
--- a/xen/include/xen/numa.h
+++ b/xen/include/xen/numa.h
@@ -26,7 +26,6 @@
 extern int memnode_shift;
 extern unsigned long memnodemapsize;
 extern u8 *memnodemap;
-extern typeof(*memnodemap) _memnodemap[64];
 
 struct node_data {
     unsigned long node_start_pfn;
@@ -69,6 +68,13 @@ extern int conflicting_memblks(u64 start, u64 end);
 extern void cutoff_node(int i, u64 start, u64 end);
 extern int valid_numa_range(u64 start, u64 end, nodeid_t node);
 
+extern void numa_init_array(void);
+extern void numa_initmem_init(unsigned long start_pfn, unsigned long end_pfn);
+extern bool numa_off;
+extern int numa_fake;
+
+extern void setup_node_bootmem(nodeid_t nodeid, u64 start, u64 end);
+
 #endif /* CONFIG_NUMA */
 
 #endif /* _XEN_NUMA_H */
-- 
2.25.1


