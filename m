Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA6C3E8EB3
	for <lists+xen-devel@lfdr.de>; Wed, 11 Aug 2021 12:31:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165726.302935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlWE-0007bn-IP; Wed, 11 Aug 2021 10:31:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165726.302935; Wed, 11 Aug 2021 10:31:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlWD-00079t-N1; Wed, 11 Aug 2021 10:31:29 +0000
Received: by outflank-mailman (input) for mailman id 165726;
 Wed, 11 Aug 2021 10:31:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9qiF=NC=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mDlRR-0000BQ-EW
 for xen-devel@lists.xenproject.org; Wed, 11 Aug 2021 10:26:33 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7e1a::629])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2afdca48-3fe6-451f-b879-b76fa520a6ca;
 Wed, 11 Aug 2021 10:25:38 +0000 (UTC)
Received: from DB6PR07CA0157.eurprd07.prod.outlook.com (2603:10a6:6:43::11) by
 DB7PR08MB3433.eurprd08.prod.outlook.com (2603:10a6:10:48::30) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.13; Wed, 11 Aug 2021 10:25:36 +0000
Received: from DB5EUR03FT025.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:43:cafe::a8) by DB6PR07CA0157.outlook.office365.com
 (2603:10a6:6:43::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.6 via Frontend
 Transport; Wed, 11 Aug 2021 10:25:36 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT025.mail.protection.outlook.com (10.152.20.104) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.16 via Frontend Transport; Wed, 11 Aug 2021 10:25:36 +0000
Received: ("Tessian outbound 077ab11054bf:v101");
 Wed, 11 Aug 2021 10:25:36 +0000
Received: from 7cac37810ffc.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 86FF1607-A9F0-4732-AFC9-5B2442877FEE.1; 
 Wed, 11 Aug 2021 10:25:29 +0000
Received: from EUR03-AM5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 7cac37810ffc.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 11 Aug 2021 10:25:29 +0000
Received: from DB9PR06CA0028.eurprd06.prod.outlook.com (2603:10a6:10:1db::33)
 by AM6PR08MB5175.eurprd08.prod.outlook.com (2603:10a6:20b:ef::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.19; Wed, 11 Aug
 2021 10:25:25 +0000
Received: from DB5EUR03FT012.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:1db:cafe::11) by DB9PR06CA0028.outlook.office365.com
 (2603:10a6:10:1db::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16 via Frontend
 Transport; Wed, 11 Aug 2021 10:25:25 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT012.mail.protection.outlook.com (10.152.20.161) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4415.16 via Frontend Transport; Wed, 11 Aug 2021 10:25:25 +0000
Received: from AZ-NEU-EX01.Emea.Arm.com (10.251.26.4) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2308.14; Wed, 11 Aug
 2021 10:25:23 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX01.Emea.Arm.com
 (10.251.26.4) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Wed, 11
 Aug 2021 10:25:23 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.87) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Wed, 11 Aug 2021 10:25:20 +0000
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
X-Inumbo-ID: 2afdca48-3fe6-451f-b879-b76fa520a6ca
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C7gc62amk+AdDN6sirEJxKpJ++i0p773bONvwikpyjY=;
 b=V9yCHIbjtNZjW50ukC6RQwdNrPTniVVOg24brU7RF3K5JfjvUPoCA7Ln+YfaEl4yQMit6OHHFXcsAxzOZ6o4m8RwAZctqTVLsl7T8nhRo6n9jw4tlLpT2s7FaCwq/a5yuUR5XyT+mvlOILEkCD+MuouUWolJv436cPD3CAfv+44=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 02b7615fedc72c2e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TqLFEiskTVOKDvjS+Tmi08Qn97Vx2tQv3bZkcd2BJn3YJzL1QWMjyvIO+zJ4e8e6W73vMFzUdxvxFRTzJWI1eZPMANwZUTTsrT4XpTzQTsGHWTFdYxYjUdmh5eMW9ULPZkHCmF+/2C6RZu5l9NlIu9tT4EtIYHvDBYUlkS1JgeXC6Exr3aoeuGhQhli4QCdB3Yk0ZaFWQZglKufX9uBqjtinyjF7F3nGKD7Ig3Q+vwkXaEgOXz44919JVC0Ag6LVG/544wDsvO9Rtgfxe3whLgcMSYqm2MPWgnhX56LWV1fG95eXMkWO9WHyqaKjRjEooJ9KAr+GOPBa7TGyICFykQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C7gc62amk+AdDN6sirEJxKpJ++i0p773bONvwikpyjY=;
 b=BNMxZtmhrMlNsgYDtcFAvgHl2i7SAytbzm7cpXvTj4DvPBw99qON4QrgAFk5jUzNLw9VMsirXyaGGmdN2cF/zqI6OGkQJwLEEL2hUdQEXXBF88FPEc1Lf7zNIPpLotg8KIRRQhaOyrtU8PawATfHEcO/rX/oqOqTZZWc80/2hTyIE3zFxsmAXhffWiIaCwVFTYZ2DnYdMEyBmWqx3nAKzyWzYHpi/LZzZ8WAA6ESHy13te9jxf3at4ixoI80ULWtKlK26zJHcPbgyoEOFNB5O2GjVQzp+OufCLfaNZs5wCRz1Qk68ilYNrPeTqC2bsvGMxl9DirYtwVKShewcXYn0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C7gc62amk+AdDN6sirEJxKpJ++i0p773bONvwikpyjY=;
 b=V9yCHIbjtNZjW50ukC6RQwdNrPTniVVOg24brU7RF3K5JfjvUPoCA7Ln+YfaEl4yQMit6OHHFXcsAxzOZ6o4m8RwAZctqTVLsl7T8nhRo6n9jw4tlLpT2s7FaCwq/a5yuUR5XyT+mvlOILEkCD+MuouUWolJv436cPD3CAfv+44=
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
Subject: [XEN RFC PATCH 21/40] xen/arm: introduce device_tree_numa as a switch for device tree NUMA
Date: Wed, 11 Aug 2021 18:24:04 +0800
Message-ID: <20210811102423.28908-22-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210811102423.28908-1-wei.chen@arm.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4be59d33-8c33-4edc-d3ea-08d95cb25bf6
X-MS-TrafficTypeDiagnostic: AM6PR08MB5175:|DB7PR08MB3433:
X-Microsoft-Antispam-PRVS:
	<DB7PR08MB3433DA701D40ECAB10A381D69EF89@DB7PR08MB3433.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 09ob8oqXRgcKeOSA9bnr4c6OdqnODOm+bqSHMazmPZL5B1a6o8MHYLARrETK9MwCzwdGzypZvb2kDArr+5BYuuZbd/xsrL+hF8wnsONakXxZAPS9/CWeb4WTZOcTYxavjt1oGNT5IG5WbiltbAlTH0xFdCZdG2++YDO3mFy/48BcSgw5qUhFZ4fkqqFwGcQfBcjub0q4dUG3Vq1mji28ZHvPUrZ8ihyrpVKuy77NPum5ofFkl3HNz4mpOw+RjtFMuf+Aol9ugEgG97UekP1G8U3k6y7/eZaa4kNSPltiBd3bWZtQrT+3ljY34ZcQ2eL72DIsZuWJZD2CuXxtM8Ud6N4kLf4UohAWNGOSMU9wwiCHnvguCNDBYKVpDGuzGXG4qi1qbNTONfDcWivgyUn0G/RhEyfeGKCkp+Fr0f6VOixZpT3qeEHWnZyKw554c9Ph6ypxESyZ6Di8UV9K2V7v//opWkNEhEWPF4/BKl0J/qlK4h5qgkDmt/DbmBrgHzntHIMPs13wd16Ybg5MwU+4YdfqOUV2nEW8492rPzX/WrNnkhRa6njtIlFkV0/rv2tRHzmahhaleMmciZkn/VkkLiddzFeNWtOdWcLSefM9pR8VjcltlyfV8HYlTthQT5Oa/yjW5bkIf9bwR9ck3Pw89DpKycLUt+NSCoZkuNDBAB5I5B9BjQ66eA5v5rRPtRtdVKVrWBiNAvH5odB0x9F9sHnBAIWWZ1X4CjIqueHKgiVJjca0CreTSZ5JNJSxysl1jZdHwfXVtwdruH1Wr5oJoqg5AkSkCuyO8LIjZOUH2mc0JqLVgbNK+adV3p8yOyScgOVqmUiP1LtuUlcfVgwACXvnM+LhzkcPeRDtfdZhxJpRyn9kC7Rph+WL7EpwyLBCpbb2RRGErxT5DMAddJ06Hw==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(346002)(376002)(396003)(39860400002)(136003)(36840700001)(46966006)(426003)(2906002)(82310400003)(47076005)(1076003)(6666004)(36860700001)(8936002)(26005)(336012)(36756003)(8676002)(4326008)(34070700002)(478600001)(82740400003)(2616005)(83380400001)(44832011)(356005)(86362001)(70206006)(7696005)(110136005)(5660300002)(316002)(186003)(81166007)(70586007)(2004002)(2101003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB5175
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	216fdec2-55a0-4d92-3ae4-08d95cb25588
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rqTMCj9DPWghZYgbzBJuNoHc0BxUP15bvEB1uUGB/g50Oslka9w95egGqLpUuKnH1koiMR5I9cEbwFUp8UF0nDC8Udr2BThD0d/i+S60YhNuSuaf+Zoz5f/o0ozvvVjMejbkCgYbwZMa71Z06VverqkbXFKTwErSbGVvLhysthXPsfiPylDKR5HqdcUii87qAvT9G2QetCuoj9kYXdGrI6UCuuyRgNm7QjfPqQjdcUBPj2gbA0ZwI7slxgv35ekHwXZA7ESYHOzATMOaS8YmzdXYXwIpmDByWSlJkAjlZlbAHDyZNzIwRoYqmQ1ZnMgpnMyBJId/HdVI4Rv5HnUW4J5y28C9rBZeLyv+RmlJhpyh3hEfEFXe2FJpMPYkS4/OLGT1wAWaQZpjE5kz7en9V/f5F2lji4HYqLr18897VUv5yGeLeqVsSVrTXPIx6Rsk+fLP9zU9fq6o7kDAD/mZ9AbRK+bf6NXt3NjRZ5ZeJ7QLvVnUw+3rSsR/tsIRtRp508//Ms0bDN9SwWfcvNA8Ktu7iy/nQNq+8MusBR5SvVQemT++/DLrifvKGk+IvqxClK2xhj4Cz+zsTtxnBtUNlhjb06bgL/h0apVcfyQq7MStzipsiBweE8Zj6zXkD357KUHZkzjYaAFLPW21NwriV9ej3FSR9MB+q7XC09WTlk4gKVDEiK33fOAFZVSqGFqHop2cohexnkie9Nt2x1Jmz/ChVzvZUT9ArxCg4nyuO4C6eJxqqa4zOArfI2WNJ0/ixY3Byg6KJCDiPt/J54Fcc0qpmeAVaNTLjby3rV991ktJsHTecool9dQv1nkiToOMAEQn8um4+IqowhcILnH1nA==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(39850400004)(396003)(376002)(136003)(346002)(46966006)(36840700001)(7696005)(8936002)(44832011)(8676002)(70586007)(70206006)(336012)(82310400003)(47076005)(83380400001)(4326008)(186003)(36756003)(26005)(478600001)(316002)(86362001)(81166007)(110136005)(5660300002)(2906002)(2616005)(6666004)(426003)(82740400003)(1076003)(36860700001)(2004002)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2021 10:25:36.6402
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4be59d33-8c33-4edc-d3ea-08d95cb25bf6
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT025.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3433

Like acpi_numa in x86 as a switch for ACPI based NUMA, we introduce
device_tree_numa as a switch for Arm device tree based NUMA. When
NUMA information in device tree is invalid, this switch will be set
to -1, then NUMA support for Arm will be disabled, even if user set
numa_off=0.

Keep using bad_srat and srat_disabled functions name, because we will
reuse node_covers_memory and acpi_scan_nodes code for Arm. These
functions are using these two API names. And, as device tree can be
treated as one kind of static resource table. So we keep these two
function names.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/arch/arm/Makefile           |  1 +
 xen/arch/arm/numa_device_tree.c | 35 +++++++++++++++++++++++++++++++++
 xen/include/asm-arm/numa.h      |  2 ++
 3 files changed, 38 insertions(+)
 create mode 100644 xen/arch/arm/numa_device_tree.c

diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 6e3fb8033e..13e1549be0 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -36,6 +36,7 @@ obj-y += mem_access.o
 obj-y += mm.o
 obj-y += monitor.o
 obj-$(CONFIG_NUMA) += numa.o
+obj-$(CONFIG_DEVICE_TREE_NUMA) += numa_device_tree.o
 obj-y += p2m.o
 obj-y += percpu.o
 obj-y += platform.o
diff --git a/xen/arch/arm/numa_device_tree.c b/xen/arch/arm/numa_device_tree.c
new file mode 100644
index 0000000000..1c74ad135d
--- /dev/null
+++ b/xen/arch/arm/numa_device_tree.c
@@ -0,0 +1,35 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Arm Architecture support layer for NUMA.
+ *
+ * Copyright (C) 2021 Arm Ltd
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program. If not, see <http://www.gnu.org/licenses/>.
+ *
+ */
+#include <xen/init.h>
+#include <xen/nodemask.h>
+#include <xen/numa.h>
+
+s8 device_tree_numa = 0;
+
+int srat_disabled(void)
+{
+    return numa_off || device_tree_numa < 0;
+}
+
+void __init bad_srat(void)
+{
+    printk(KERN_ERR "DT: NUMA information is not used.\n");
+    device_tree_numa = -1;
+}
diff --git a/xen/include/asm-arm/numa.h b/xen/include/asm-arm/numa.h
index 559b028a01..756ad82d07 100644
--- a/xen/include/asm-arm/numa.h
+++ b/xen/include/asm-arm/numa.h
@@ -23,6 +23,8 @@ typedef u8 nodeid_t;
 #define NUMA_LOCAL_DISTANCE     10
 #define NUMA_REMOTE_DISTANCE    20
 
+extern s8 device_tree_numa;
+
 extern void numa_init(bool acpi_off);
 extern void numa_set_distance(nodeid_t from, nodeid_t to, uint32_t distance);
 
-- 
2.25.1


