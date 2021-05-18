Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B87387136
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 07:22:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.128613.241426 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lisAx-0000aD-Pr; Tue, 18 May 2021 05:21:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 128613.241426; Tue, 18 May 2021 05:21:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lisAx-0000XY-MA; Tue, 18 May 2021 05:21:51 +0000
Received: by outflank-mailman (input) for mailman id 128613;
 Tue, 18 May 2021 05:21:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2je3=KN=arm.com=penny.zheng@srs-us1.protection.inumbo.net>)
 id 1lisAv-0000XS-FI
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 05:21:49 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com (unknown
 [40.107.3.64]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 78af3743-edf4-4978-a783-2edaca25601b;
 Tue, 18 May 2021 05:21:46 +0000 (UTC)
Received: from AM6PR08CA0007.eurprd08.prod.outlook.com (2603:10a6:20b:b2::19)
 by AM0PR08MB3330.eurprd08.prod.outlook.com (2603:10a6:208:5c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.28; Tue, 18 May
 2021 05:21:43 +0000
Received: from AM5EUR03FT024.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:b2:cafe::e2) by AM6PR08CA0007.outlook.office365.com
 (2603:10a6:20b:b2::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25 via Frontend
 Transport; Tue, 18 May 2021 05:21:43 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM5EUR03FT024.mail.protection.outlook.com (10.152.16.175) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4129.25 via Frontend Transport; Tue, 18 May 2021 05:21:43 +0000
Received: ("Tessian outbound 0f1e4509c199:v92");
 Tue, 18 May 2021 05:21:43 +0000
Received: from c6bec359284a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 72016849-DD8E-447A-AF69-C5D4479BD6E6.1; 
 Tue, 18 May 2021 05:21:36 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id c6bec359284a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 18 May 2021 05:21:36 +0000
Received: from AM6P192CA0065.EURP192.PROD.OUTLOOK.COM (2603:10a6:209:82::42)
 by DB8PR08MB5404.eurprd08.prod.outlook.com (2603:10a6:10:117::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Tue, 18 May
 2021 05:21:34 +0000
Received: from VE1EUR03FT018.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:82:cafe::bb) by AM6P192CA0065.outlook.office365.com
 (2603:10a6:209:82::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend
 Transport; Tue, 18 May 2021 05:21:34 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT018.mail.protection.outlook.com (10.152.18.135) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4129.25 via Frontend Transport; Tue, 18 May 2021 05:21:34 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2176.14; Tue, 18 May
 2021 05:21:33 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.14; Tue, 18
 May 2021 05:21:33 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2176.14 via Frontend
 Transport; Tue, 18 May 2021 05:21:30 +0000
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
X-Inumbo-ID: 78af3743-edf4-4978-a783-2edaca25601b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=du5OP3mWpKQtM/QoyT2ZsDEjLUVsC0mPKC4RWPNn37o=;
 b=tZjWizBbTesSpribmwEqGTbBsIOJMbGGEhrrtIeC+9Npwub6mARxvcjvgcDjkzas9iOo6fZc3Sv6RCOYmU2VBVAlyJBNw8nmKBd6TFCikBTf+ysRvgw3YMMa38Z14RaWAKrOcjkPO+xWbVp70+CNiWBjepgPPR7bWBjb7eurGI0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 82aa9357170c4fdc
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UpES8RNL1KPyWVL8RKVqVOzPurftiNp94elIgFVM0AUvLBH7cJfnQPrPaGlVWPlRxz0B7dBCq7kBKKZmvTYGtofk3PeKff9WIg9FxpFyB9X50c3Ukd6VtofuEVVGn4QyjLTwEhSCLoivv1vu+YnpX87o1eM5A8b+sFA1K7J6hClrsUJbVjIguCdz/oo5/ZK53NQiUH6rleclBpq6BJL94tFd69p6n8O3f2KIIi3BTrQB4HAnREHOEu/lHLdrxZS6OCPS1rdDd8MwblZZCg2LMOx0N6bh7n6UXCt6hqUPe4iOGprFVBk47IWpdc7K1oIzc1R5Ec5zFDYh/rxsYjDuWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=du5OP3mWpKQtM/QoyT2ZsDEjLUVsC0mPKC4RWPNn37o=;
 b=bv3vj4HuFRpRMePJBoMkzjXnOwjSMojsln3VQWQQKx0eSblTk0RbXNF3wKJeDRxPY3Sf3BoT5rByPQCgCcg/sXomjPIMEgM087TOqd5ku3RexINOaZgQyrz/7GSmHVmxqYfETKOv2kvf7PZ+ZI38CH1j38jJ7dBK8364wc+yJdWfYw68N4TUwFqJeQmupMp8hy44o27lTG+aH9u8q8qEXxR9XGWFlmUN6d/ziWniNYWXa1laVPLpihUiYGdjHofg162yaX+Vo8yuPFNuP+gZ13p8d+kQnRLC4mNzUOuTRb8zc4jgw1k1V/+C8xLysU7Je72EtuqwffZec3NWynFAOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=du5OP3mWpKQtM/QoyT2ZsDEjLUVsC0mPKC4RWPNn37o=;
 b=tZjWizBbTesSpribmwEqGTbBsIOJMbGGEhrrtIeC+9Npwub6mARxvcjvgcDjkzas9iOo6fZc3Sv6RCOYmU2VBVAlyJBNw8nmKBd6TFCikBTf+ysRvgw3YMMa38Z14RaWAKrOcjkPO+xWbVp70+CNiWBjepgPPR7bWBjb7eurGI0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=none (message not signed)
 header.d=none;lists.xenproject.org; dmarc=pass action=none
 header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Penny Zheng <penny.zheng@arm.com>
To: <xen-devel@lists.xenproject.org>, <sstabellini@kernel.org>,
	<julien@xen.org>
CC: <Bertrand.Marquis@arm.com>, <Penny.Zheng@arm.com>, <Wei.Chen@arm.com>,
	<nd@arm.com>
Subject: [PATCH 01/10] xen/arm: introduce domain on Static Allocation
Date: Tue, 18 May 2021 05:21:04 +0000
Message-ID: <20210518052113.725808-2-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210518052113.725808-1-penny.zheng@arm.com>
References: <20210518052113.725808-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 76e46bd6-cf87-43e2-95dd-08d919bcd2ed
X-MS-TrafficTypeDiagnostic: DB8PR08MB5404:|AM0PR08MB3330:
X-Microsoft-Antispam-PRVS:
	<AM0PR08MB3330A50662E33B29DD11887DF72C9@AM0PR08MB3330.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 F9SiYjmWZKYsM3s96cl/mX/fsp1oReI9T7a5wXs2Ny/cCmjDOr23X5otT6BGv7KVjnR+b2qBh0ibXgrPOd+eEijoazT5upDgCA+8LN6z0NqMn+YwiIRHMfcw6svNOBsksOC+Kyw04gqgQR2jhcL7sJXWWg9k6M3A9mJtXYgmHD8LD3VL3LZ60VH/9IjOHI3bzCfAbLpERbkx5/bW64m2ylBI4LKtdlnh5gbMYGt11RH12PmP+WypwtLGfjVqKfKI7jRJERexwzOhr3ArEkKVlOS5wDbPAR5GTwW53zuZF3idQWRquVQUCtM0VUvRxrXTcnKsrxaNddh2SK6Cnh8ZG0sfu1l09eRgdym8Q+bA4fl/+BIXstAqpVATJYHxhYU0BTHmmJ7X5cZoMlGwNTJgedVqzZ7OqkFETPUDrdQ6azArK//RtUFMMRcC55BDeKl/bhGa5E5BQCiF4/rzmv0SQWjTmpijDCCDZZDfAOtoVe0jTfRub1/b+bS7tOkGxPssHj+HGedLhZJPKHn8Yv5LpuoZQRHCS0hX6+sT3ovhLaUByrsh8/KcogvanxwzexjAFwEnn4b1EmZG/iWymD9UmpYno9CZrP4pTzWOR6iPQ4J5vp3WAasmRLInTpqZ+5QMbmsmm4sSPhdEGDleUjQtBYcoOlEtCrqc0Td4/dya//W3FNYd6sW1VbMWhynKiW70
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(376002)(136003)(346002)(396003)(39850400004)(36840700001)(46966006)(47076005)(36860700001)(5660300002)(186003)(26005)(2616005)(336012)(478600001)(81166007)(2906002)(82740400003)(70586007)(4326008)(54906003)(82310400003)(356005)(426003)(8676002)(1076003)(70206006)(36756003)(86362001)(44832011)(110136005)(83380400001)(316002)(8936002)(6666004)(7696005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5404
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM5EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b82fa1be-3500-4c41-9175-08d919bccda9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	PT/koVu75C1Fj/Dhw+UvdhPExqGstVbqnbDKZMTIY1SzGtRAbzmJQygrIAdVuLdukcREXfbwmeE5Rj92KB2Sy23/MoHjXl2SDTUP5HnvwQN8hB8NL5LM11BAf8lgduZp6Hkdu/DRt+90jTWoMxFJ7G9VJxV+qCGoowxaSJ7pxSAHK0e9/Pkz5cQspv3S37H/+s4dl82YPn8LsMFt7c3entl9LEa8s2dLhDSDPjj9DAYkyDm9HnBFxd5hUNl5BQWM37BlMppg3fCmhkk8SBTc8I1C01fYvaVFdupXXbYvPfQxq4+UBtUlMDlH4hFB8QE3FgCJVF4Uv1+Xq0e0nWlxwNbLFYcbEkB6MdHPOjIikeaQzo/87Qje84y8JO41UejYTA/MwWRfTduKZQVDzUyHxibyqmippv6cS5Z7qGxzK8Yboy1BsrDI8Zv8lfknQPKCb+6YxTuch02G7FzjXRj615lWENmPNvMdusM3THqkWxklL+SRZDZx9m0AbyAeWCZy52ZS2ctDOfHZ+re5941su2RT1immrX39genrj6gPE4rEfob3HtD/6xiWhrx0kaiYiJcnmV/RjY7LwLPnGBdWRlJ8ll6adQp6PscI8EgJcxDAU2hGhY+y8hma72EBpRqmAuuWDySEpH1rec8RxKOQ1lF3j2pEpSZ7u8zd7T4/7+Q=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(346002)(376002)(136003)(396003)(39850400004)(36840700001)(46966006)(7696005)(83380400001)(81166007)(54906003)(5660300002)(110136005)(36860700001)(47076005)(82740400003)(316002)(8676002)(8936002)(478600001)(44832011)(2616005)(36756003)(82310400003)(336012)(186003)(1076003)(2906002)(4326008)(70586007)(426003)(6666004)(26005)(86362001)(70206006);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2021 05:21:43.2208
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 76e46bd6-cf87-43e2-95dd-08d919bcd2ed
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM5EUR03FT024.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB3330

Static Allocation refers to system or sub-system(domains) for which memory
areas are pre-defined by configuration using physical address ranges.
Those pre-defined memory, -- Static Momery, as parts of RAM reserved in the
beginning, shall never go to heap allocator or boot allocator for any use.

Domains on Static Allocation is supported through device tree property
`xen,static-mem` specifying reserved RAM banks as this domain's guest RAM.
By default, they shall be mapped to the fixed guest RAM address
`GUEST_RAM0_BASE`, `GUEST_RAM1_BASE`.

This patch introduces this new `xen,static-mem` property to define static
memory nodes in device tree file.
This patch also documents and parses this new attribute at boot time and
stores related info in static_mem for later initialization.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
 docs/misc/arm/device-tree/booting.txt | 33 +++++++++++++++++
 xen/arch/arm/bootfdt.c                | 52 +++++++++++++++++++++++++++
 xen/include/asm-arm/setup.h           |  2 ++
 3 files changed, 87 insertions(+)

diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
index 5243bc7fd3..d209149d71 100644
--- a/docs/misc/arm/device-tree/booting.txt
+++ b/docs/misc/arm/device-tree/booting.txt
@@ -268,3 +268,36 @@ The DTB fragment is loaded at 0xc000000 in the example above. It should
 follow the convention explained in docs/misc/arm/passthrough.txt. The
 DTB fragment will be added to the guest device tree, so that the guest
 kernel will be able to discover the device.
+
+
+Static Allocation
+=============
+
+Static Allocation refers to system or sub-system(domains) for which memory
+areas are pre-defined by configuration using physical address ranges.
+Those pre-defined memory, -- Static Momery, as parts of RAM reserved in the
+beginning, shall never go to heap allocator or boot allocator for any use.
+
+Domains on Static Allocation is supported through device tree property
+`xen,static-mem` specifying reserved RAM banks as this domain's guest RAM.
+By default, they shall be mapped to the fixed guest RAM address
+`GUEST_RAM0_BASE`, `GUEST_RAM1_BASE`.
+
+Static Allocation is only supported on AArch64 for now.
+
+The dtb property should look like as follows:
+
+        chosen {
+            domU1 {
+                compatible = "xen,domain";
+                #address-cells = <0x2>;
+                #size-cells = <0x2>;
+                cpus = <2>;
+                xen,static-mem = <0x0 0x30000000 0x0 0x20000000>;
+
+                ...
+            };
+        };
+
+DOMU1 on Static Allocation has reserved RAM bank at 0x30000000 of 512MB size
+as guest RAM.
diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
index dcff512648..e9f14e6a44 100644
--- a/xen/arch/arm/bootfdt.c
+++ b/xen/arch/arm/bootfdt.c
@@ -327,6 +327,55 @@ static void __init process_chosen_node(const void *fdt, int node,
     add_boot_module(BOOTMOD_RAMDISK, start, end-start, false);
 }
 
+static int __init process_static_memory(const void *fdt, int node,
+                                        const char *name,
+                                        u32 address_cells, u32 size_cells,
+                                        void *data)
+{
+    int i;
+    int banks;
+    const __be32 *cell;
+    paddr_t start, size;
+    u32 reg_cells = address_cells + size_cells;
+    struct meminfo *mem = data;
+    const struct fdt_property *prop;
+
+    if ( address_cells < 1 || size_cells < 1 )
+    {
+        printk("fdt: invalid #address-cells or #size-cells for static memory");
+        return -EINVAL;
+    }
+
+    /*
+     * Check if static memory property belongs to a specific domain, that is,
+     * its node `domUx` has compatible string "xen,domain".
+     */
+    if ( fdt_node_check_compatible(fdt, node, "xen,domain") != 0 )
+        printk("xen,static-mem property can only locate under /domUx node.\n");
+
+    prop = fdt_get_property(fdt, node, name, NULL);
+    if ( !prop )
+        return -ENOENT;
+
+    cell = (const __be32 *)prop->data;
+    banks = fdt32_to_cpu(prop->len) / (reg_cells * sizeof (u32));
+
+    for ( i = 0; i < banks && mem->nr_banks < NR_MEM_BANKS; i++ )
+    {
+        device_tree_get_reg(&cell, address_cells, size_cells, &start, &size);
+        /* Some DT may describe empty bank, ignore them */
+        if ( !size )
+            continue;
+        mem->bank[mem->nr_banks].start = start;
+        mem->bank[mem->nr_banks].size = size;
+        mem->nr_banks++;
+    }
+
+    if ( i < banks )
+        return -ENOSPC;
+    return 0;
+}
+
 static int __init early_scan_node(const void *fdt,
                                   int node, const char *name, int depth,
                                   u32 address_cells, u32 size_cells,
@@ -345,6 +394,9 @@ static int __init early_scan_node(const void *fdt,
         process_multiboot_node(fdt, node, name, address_cells, size_cells);
     else if ( depth == 1 && device_tree_node_matches(fdt, node, "chosen") )
         process_chosen_node(fdt, node, name, address_cells, size_cells);
+    else if ( depth == 2 && fdt_get_property(fdt, node, "xen,static-mem", NULL) )
+        process_static_memory(fdt, node, "xen,static-mem", address_cells,
+                              size_cells, &bootinfo.static_mem);
 
     if ( rc < 0 )
         printk("fdt: node `%s': parsing failed\n", name);
diff --git a/xen/include/asm-arm/setup.h b/xen/include/asm-arm/setup.h
index 5283244015..5e9f296760 100644
--- a/xen/include/asm-arm/setup.h
+++ b/xen/include/asm-arm/setup.h
@@ -74,6 +74,8 @@ struct bootinfo {
 #ifdef CONFIG_ACPI
     struct meminfo acpi;
 #endif
+    /* Static Memory */
+    struct meminfo static_mem;
 };
 
 extern struct bootinfo bootinfo;
-- 
2.25.1


