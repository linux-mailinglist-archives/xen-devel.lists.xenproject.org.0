Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 022E03D8BB6
	for <lists+xen-devel@lfdr.de>; Wed, 28 Jul 2021 12:29:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.161424.296418 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8go0-0004w5-R4; Wed, 28 Jul 2021 10:28:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 161424.296418; Wed, 28 Jul 2021 10:28:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m8go0-0004sI-MD; Wed, 28 Jul 2021 10:28:52 +0000
Received: by outflank-mailman (input) for mailman id 161424;
 Wed, 28 Jul 2021 10:28:51 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UQNy=MU=arm.com=Penny.Zheng@srs-us1.protection.inumbo.net>)
 id 1m8gnz-0004GY-D1
 for xen-devel@lists.xenproject.org; Wed, 28 Jul 2021 10:28:51 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [40.107.20.43]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 97b57ffe-ef8e-11eb-9786-12813bfff9fa;
 Wed, 28 Jul 2021 10:28:47 +0000 (UTC)
Received: from DB6P195CA0019.EURP195.PROD.OUTLOOK.COM (2603:10a6:4:cb::29) by
 VI1PR0801MB2078.eurprd08.prod.outlook.com (2603:10a6:800:83::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.30; Wed, 28 Jul
 2021 10:28:46 +0000
Received: from DB5EUR03FT046.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:4:cb:cafe::a8) by DB6P195CA0019.outlook.office365.com
 (2603:10a6:4:cb::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.20 via Frontend
 Transport; Wed, 28 Jul 2021 10:28:46 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT046.mail.protection.outlook.com (10.152.21.230) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.24 via Frontend Transport; Wed, 28 Jul 2021 10:28:46 +0000
Received: ("Tessian outbound 69e1fde53269:v100");
 Wed, 28 Jul 2021 10:28:45 +0000
Received: from 54344488be41.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 99962709-FABF-43C0-8283-00E9E1CBF429.1; 
 Wed, 28 Jul 2021 10:28:38 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 54344488be41.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 28 Jul 2021 10:28:38 +0000
Received: from AM6P194CA0008.EURP194.PROD.OUTLOOK.COM (2603:10a6:209:90::21)
 by AM6PR08MB4231.eurprd08.prod.outlook.com (2603:10a6:20b:73::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.29; Wed, 28 Jul
 2021 10:28:27 +0000
Received: from VE1EUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:209:90:cafe::30) by AM6P194CA0008.outlook.office365.com
 (2603:10a6:209:90::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.20 via Frontend
 Transport; Wed, 28 Jul 2021 10:28:27 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT055.mail.protection.outlook.com (10.152.19.158) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4352.24 via Frontend Transport; Wed, 28 Jul 2021 10:28:27 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14; Wed, 28 Jul
 2021 10:28:24 +0000
Received: from penny.shanghai.arm.com (10.169.190.66) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2176.14 via Frontend
 Transport; Wed, 28 Jul 2021 10:28:22 +0000
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
X-Inumbo-ID: 97b57ffe-ef8e-11eb-9786-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wYEBoopV1YlRD0XXxn0aEpPvzx8no2mTrWFdMcSB8LE=;
 b=Y9BtjPl/FkA2tS+Dh6Gk4CLfyy/bgKDs5VqNb0sYQOmQhi95ji2coXEMVmphHpwBZHiiBj41VWZS6pxplxZngv8WE5qXFlyDKarFdDx04HzSIrmR7iS4CkL96gM4uoomyqWaYHqR5LTGb1Vl9wvLnqd/eWEKU6oIeNRgmiY7QCE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 68053127126dae03
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=exhxDZQ4YzvSFENyaGxWjUYJt2siptm9+uZTSFZI8rdum/UZHvMJHzM+WOvJMQWgaxZi/ekVBJFlzhHS8Xjhl9SZnIHgWTRSd33dJrJVTE445XBXxVgi4rOXZt1lymDic/nEaQxnJtqJyEScRB20Q7Hv4aq8o/3ay/iYfIFR3xhezWQrAqc7Ij2VH0nbX7dNBZRE4H/hdNvlORo61owTQSD6jM4f9/RSLjva5RKw2ZNhQQo8de7Rx3yXu1yFH5PeNduDCwqtWLS9p+zhF34aUBuDmO8RP9NRpxy1I8KliloVz8poFRbuc8Lq7dvWA3c0ZtFLCgx+J5hVBSkcogainQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wYEBoopV1YlRD0XXxn0aEpPvzx8no2mTrWFdMcSB8LE=;
 b=dXqqzAkcyS+wzzCARZUhpl5fyeJ1BSD+skf6UbvEQqFgE8Av3x73QLEqedk52WbnZiPCF2o5QUpL17NfqggFwZTVwOr2if/i375pCeAeL8JxHUXLt9mDCPLAQziyP/TMHcoXCPo9dMRWwb8AhM+n5JYOM63uZBflD1z9dpaS81bBQRgJcv4ewrweZSShocJEBQETLwdZpbzri/u0onY3+7ABY31qmU3MT4HSNCdhEjzsZPJOBQVrvmvZ/rfu+KT2osQILeOYl/BbWRX6s0H+uOXkjNBpje7WNXmoZZEyi4tV6YC4FPFvKYwqSC486QjWea02wjMCgRy7nHIw71Ma9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wYEBoopV1YlRD0XXxn0aEpPvzx8no2mTrWFdMcSB8LE=;
 b=Y9BtjPl/FkA2tS+Dh6Gk4CLfyy/bgKDs5VqNb0sYQOmQhi95ji2coXEMVmphHpwBZHiiBj41VWZS6pxplxZngv8WE5qXFlyDKarFdDx04HzSIrmR7iS4CkL96gM4uoomyqWaYHqR5LTGb1Vl9wvLnqd/eWEKU6oIeNRgmiY7QCE=
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
Subject: [PATCH V4 01/10] xen/arm: introduce domain on Static Allocation
Date: Wed, 28 Jul 2021 10:27:48 +0000
Message-ID: <20210728102758.3269446-2-penny.zheng@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210728102758.3269446-1-penny.zheng@arm.com>
References: <20210728102758.3269446-1-penny.zheng@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a5a95fab-0673-4843-21b4-08d951b27b0d
X-MS-TrafficTypeDiagnostic: AM6PR08MB4231:|VI1PR0801MB2078:
X-Microsoft-Antispam-PRVS:
	<VI1PR0801MB2078F33399F40A513FAC8241F7EA9@VI1PR0801MB2078.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 50P1UrHuS14tDk4UIoBjbptLM5+wdyd3pVd0wbanx6cdMSnUbSd4KemLNH0go7i131U5acFwDFFWoEMiDM4BRAfHOuUMLnRciEG9kJKt+yoi2Q9koks/ynsz7H5sHLWMS1UZ46MHMcQsa1f8HwaTxmgDLjTUAeMyJAxoA+rnFI+7skLpbr0tJYXkh+McXOLIb9hvsDCQdh5oBRwS/SFVA6arnA5NiPvRI5XIM8rysojmQRkWTZjdoInqogSO8ppcknnIYj7UFa7Z/ejilxW13JBSMoc1QtiNcfJmE5N6w9T0fYl9iZgwwDo3MxfF8exIJhLQ0trHqZd3Nqy4iybkftGe1BFgZOKhlTSX9KOo1rT3PIbufEQCtRMLu1ePZFqOwZqzncXsjDpW2P9aWrVMBcoF0o7YrMU4Bq4LQH2U9YU4nyMu9M+IaD8tmMU/eapzcUaij+s126zC5ofep6Fs9021m40D28KSIF2mC0iICf3S2pKaAGv9QwfPWdJaZCGQUS07ipqv6ANMOsdhR6sLMztIAaTOrmELt44IIbHBg5kOeJ4K+FKFw9G8ltV7H3IvVEjbuSSaTUjOvPZHXNGkaxyxFxy89ych3PrmSQj7ZpH2wAoHtL3zR1d/LEdX9IluoaPmMNsBl+7+JrFKdYFYRRqrqt6SX5TdVyxW6DHit8ce6lTBuFwGkMB40jQm0x3BtVRXIArVQ4qHBTnKLZ8KW1NYpvlk6NgKWQt2W8NN98g=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(396003)(346002)(376002)(39850400004)(136003)(36840700001)(46966006)(478600001)(4326008)(8676002)(8936002)(54906003)(356005)(82740400003)(81166007)(44832011)(47076005)(426003)(1076003)(26005)(336012)(2906002)(316002)(70586007)(70206006)(2616005)(86362001)(82310400003)(36756003)(186003)(7696005)(110136005)(83380400001)(36860700001)(6666004)(5660300002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4231
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	c86e4c30-d395-47a6-9915-08d951b27008
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GEMhiwZ8/cuiRpWH0Yq20IHSH2bL8gh1Cust1bKxzjzjkgiiv12pUetlTSY0ACjyOZ/rqKswclwOfPyG4hePnyavBKBF91C7SIaYdxypv3V2KNzp1gtWo9nGHXtkxg62wjQgWtRl6gjyWNRveMF4eWkVNOlxFuuwqCszEHCmoonXQqpLpj+ZxDHnUycX53EliELRIUf+RbiToARhGgNxv1Nrq4uVtPH+sQPT/oRCJVq1JvAhJ+CYWZfc8ug3DohUQQ7tQqXgtnLc1JASZw6AJMFgeoiQAy3aGmyy4iL/y8dJsIgyHT90bGdh6dDJVnHNTrGUyHCXFBTU0rVvEVyOXbClyBIQNprDVxT6Wnvfbn1ZtnJyOUstWm/mT4yUU9j+kT9a2yrgEQiAzyR8lPBwBEcrM22IDyXI7Ag1b6A7FTCYoxQH7v+68Jb/hrSrUqTLRTzBq2hBQwf4qizX3nrA2OF1Fz5Sr9mZ7BwmYJk/vHxWjYxAfsoTkFlW7pIjI/SnAEayhThxO2Yf3ZXi2CFEC/6aQBZ3DEi2C6XmYJWVWcL3GU3nt9RX9hgUGraL/ZvJb9dNgFgz3oNkkUOfz4wsSuk4Cq4FSugn3liKwzjD820jAjg0EByYM3uuRPN4Qeqjqj9axDeJtdih2qssHJnUz0ZCOHBn0rFgzUr63Mzilt8AlltJriitw9qJ0+JgGngWVJc/TMbur6irudTQLd26wg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(376002)(136003)(396003)(346002)(39850400004)(46966006)(36840700001)(82740400003)(70586007)(83380400001)(70206006)(82310400003)(186003)(7696005)(110136005)(86362001)(54906003)(426003)(2616005)(26005)(44832011)(5660300002)(316002)(8676002)(8936002)(336012)(2906002)(81166007)(4326008)(6666004)(36860700001)(47076005)(1076003)(478600001)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2021 10:28:46.0042
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5a95fab-0673-4843-21b4-08d951b27b0d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT046.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0801MB2078

Static Allocation refers to system or sub-system(domains) for which memory
areas are pre-defined by configuration using physical address ranges.
Those pre-defined memory, -- Static Memory, as parts of RAM reserved in the
beginning, shall never go to heap allocator or boot allocator for any use.

Domains on Static Allocation is supported through device tree property
`xen,static-mem` specifying reserved RAM banks as this domain's guest RAM.
By default, they shall be mapped to the fixed guest RAM address
`GUEST_RAM0_BASE`, `GUEST_RAM1_BASE`.

This patch introduces this new `xen,static-mem` feature, and also documents
and parses this new attribute at boot time and stores related info in
static_mem for later initialization.

Signed-off-by: Penny Zheng <penny.zheng@arm.com>
---
 docs/misc/arm/device-tree/booting.txt | 40 +++++++++++++++++++++
 xen/arch/arm/bootfdt.c                | 51 +++++++++++++++++++++++++++
 xen/include/asm-arm/setup.h           |  2 ++
 3 files changed, 93 insertions(+)

diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
index 5243bc7fd3..2a1ddca29b 100644
--- a/docs/misc/arm/device-tree/booting.txt
+++ b/docs/misc/arm/device-tree/booting.txt
@@ -268,3 +268,43 @@ The DTB fragment is loaded at 0xc000000 in the example above. It should
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
+Those pre-defined memory, -- Static Memory, as parts of RAM reserved in the
+beginning, shall never go to heap allocator or boot allocator for any use.
+
+Domains on Static Allocation is supported through static memory property,
+defined under according /domUx in the name of "xen,static-mem", which are
+specifying physical RAM as this domain's guest RAM.
+The size of address-cells/size-cells must be defined in
+"#xen,static-mem-address-cells" and "#xen,static-mem-size-cells".
+
+On memory allocation, these pre-defined static memory ranges shall be
+firstly mapped to the fixed guest bank "GUEST_RAM0". Until it exhausts the
+`GUEST_RAM0_SIZE`, then it will seek to `GUEST_RAM1_BASE`, and so on.
+`GUEST_RAM0` may take up several pre-defined physical RAM regions.
+
+The dtb property should look like as follows:
+
+    / {
+        chosen {
+            domU1 {
+                compatible = "xen,domain";
+                #address-cells = <0x2>;
+                #size-cells = <0x2>;
+                cpus = <2>;
+                #xen,static-mem-address-cells = <0x1>;
+                #xen,static-mem-size-cells = <0x1>;
+                xen,static-mem = <0x30000000 0x20000000>;
+                ...
+            };
+        };
+    };
+
+DomU1 will have a static memory of 512MB reserved from the physical address
+0x30000000 to 0x50000000.
diff --git a/xen/arch/arm/bootfdt.c b/xen/arch/arm/bootfdt.c
index 476e32e0f5..d2714446e1 100644
--- a/xen/arch/arm/bootfdt.c
+++ b/xen/arch/arm/bootfdt.c
@@ -193,6 +193,55 @@ static int __init process_reserved_memory_node(const void *fdt, int node,
     return 0;
 }
 
+static int __init process_static_memory(const void *fdt, int node, void *data)
+{
+    int i = 0, banks;
+    const __be32 *cell;
+    paddr_t start, size;
+    u32 address_cells, size_cells, reg_cells;
+    struct meminfo *mem = data;
+    const struct fdt_property *prop;
+
+
+    address_cells = device_tree_get_u32(fdt, node,
+                                        "#xen,static-mem-address-cells", 0);
+    size_cells = device_tree_get_u32(fdt, node,
+                                     "#xen,static-mem-size-cells", 0);
+    if ( (address_cells == 0) || (size_cells == 0) )
+    {
+         printk("Missing \"#xen,static-mem-address-cell\" or "
+                 "\"#xen,static-mem-address-cell\".\n");
+         return -EINVAL;
+    }
+    reg_cells = address_cells + size_cells;
+
+    prop = fdt_get_property(fdt, node, "xen,static-mem", NULL);
+    /*
+     * Static memory shall belong to a specific domain, that is,
+     * its node `domUx` has compatible string "xen,domain".
+     */
+    if ( fdt_node_check_compatible(fdt, node, "xen,domain") != 0 )
+    {
+        printk("xen,static-mem property can only be located under /domUx node.\n");
+        return -EINVAL;
+    }
+
+    cell = (const __be32 *)prop->data;
+    banks = fdt32_to_cpu(prop->len) / (reg_cells * sizeof (u32));
+
+    for ( ; i < banks && mem->nr_banks < NR_MEM_BANKS; i++ )
+    {
+        device_tree_get_reg(&cell, address_cells, size_cells, &start, &size);
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
 static int __init process_reserved_memory(const void *fdt, int node,
                                           const char *name, int depth,
                                           u32 address_cells, u32 size_cells)
@@ -346,6 +395,8 @@ static int __init early_scan_node(const void *fdt,
         process_multiboot_node(fdt, node, name, address_cells, size_cells);
     else if ( depth == 1 && device_tree_node_matches(fdt, node, "chosen") )
         process_chosen_node(fdt, node, name, address_cells, size_cells);
+    else if ( depth == 2 && fdt_get_property(fdt, node, "xen,static-mem", NULL) )
+        process_static_memory(fdt, node, &bootinfo.static_mem);
 
     if ( rc < 0 )
         printk("fdt: node `%s': parsing failed\n", name);
diff --git a/xen/include/asm-arm/setup.h b/xen/include/asm-arm/setup.h
index c4b6af6029..e076329fc4 100644
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


