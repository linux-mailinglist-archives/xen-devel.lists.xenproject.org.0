Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD98B3E8E8A
	for <lists+xen-devel@lfdr.de>; Wed, 11 Aug 2021 12:25:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.165618.302669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlQ5-0001Yw-Uv; Wed, 11 Aug 2021 10:25:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 165618.302669; Wed, 11 Aug 2021 10:25:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mDlQ5-0001VO-Qe; Wed, 11 Aug 2021 10:25:09 +0000
Received: by outflank-mailman (input) for mailman id 165618;
 Wed, 11 Aug 2021 10:25:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9qiF=NC=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mDlQ4-0000BQ-BT
 for xen-devel@lists.xenproject.org; Wed, 11 Aug 2021 10:25:08 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (unknown
 [2a01:111:f400:7e1a::601])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f9537592-742e-4216-8581-8787da46ecd7;
 Wed, 11 Aug 2021 10:24:59 +0000 (UTC)
Received: from AS8PR04CA0079.eurprd04.prod.outlook.com (2603:10a6:20b:313::24)
 by PR3PR08MB5753.eurprd08.prod.outlook.com (2603:10a6:102:87::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.21; Wed, 11 Aug
 2021 10:24:57 +0000
Received: from VE1EUR03FT017.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:313::4) by AS8PR04CA0079.outlook.office365.com
 (2603:10a6:20b:313::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.13 via Frontend
 Transport; Wed, 11 Aug 2021 10:24:57 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT017.mail.protection.outlook.com (10.152.18.90) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4415.16 via Frontend Transport; Wed, 11 Aug 2021 10:24:56 +0000
Received: ("Tessian outbound 8529ae990a93:v101");
 Wed, 11 Aug 2021 10:24:56 +0000
Received: from 69e55c52c790.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 551884DF-DD4E-477B-97D7-AE621449E982.1; 
 Wed, 11 Aug 2021 10:24:50 +0000
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 69e55c52c790.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 11 Aug 2021 10:24:50 +0000
Received: from DU2PR04CA0004.eurprd04.prod.outlook.com (2603:10a6:10:3b::9) by
 PR3PR08MB5628.eurprd08.prod.outlook.com (2603:10a6:102:8e::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4394.19; Wed, 11 Aug 2021 10:24:49 +0000
Received: from DB5EUR03FT007.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:3b:cafe::c2) by DU2PR04CA0004.outlook.office365.com
 (2603:10a6:10:3b::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.16 via Frontend
 Transport; Wed, 11 Aug 2021 10:24:49 +0000
Received: from nebula.arm.com (40.67.248.234) by
 DB5EUR03FT007.mail.protection.outlook.com (10.152.20.148) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4415.16 via Frontend Transport; Wed, 11 Aug 2021 10:24:49 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Wed, 11 Aug
 2021 10:24:46 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.87) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Wed, 11 Aug 2021 10:24:44 +0000
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
X-Inumbo-ID: f9537592-742e-4216-8581-8787da46ecd7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kVKHdbqA0nYwZzQvyecp9+EIwlyV0oUC0TssqSpKYD4=;
 b=lo1WlehcOh3Ry0Us5owmBqaFJw1ohWxF2AK8yfGTAJ3B1/6jOCThrAMZb4CUChd/jFenbj4z2doCsPOq0Suf1A25tuQmmZGsRS1oJaQsBbNMq+BR2UI5IAGFGpdAYoHyGCM/RaD98CeH0BeC2BifuFkyYk3PIpRIs0kTHbjnyk4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: db3c120abeff39d6
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MfYSVHEVzEdo+xe8cd5hkYOUi6KK0a+H1+BjKcohEwsi6nmqDVP4cwFBXl1ZPjhMIxh6iLuBvEphpX57kj3Lcmmoo/6RfA+2LQKvrcWk7/f+gREzqFcmnr/ibgPkbIiOdSmK6hc00infbvO6ZBkPtdBL1pFDctJh5coaNcJjakBPLtVvAGbTVUFpU/RQRBatcxuI+TppvLILuwT4arzVLlWZeWk9n4pAXyV0vZP5MZCbWDxc8WvGr65y8wELyn1o/wrDgpxp4tov/tgF41zFELOdR9TbI2Ll2IdSTOf1qYc1HSdR50UBf8n9LZtPmDKiyvRrDiEumF5RB++iQssR0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kVKHdbqA0nYwZzQvyecp9+EIwlyV0oUC0TssqSpKYD4=;
 b=j3oq0oBpbVGtoJpWuf+GCI0YjLzFMwI2Z2bgyVQq3DCf3vMI++F3Gbh1RHPZgpl+UjpWFL6B40j5urzASRfPe6dpQDFAzRue2PZ5ENdbAbfz7TVIrl7OyhVlWvBCy3fi/Dx2/1hNAxjB+1JEvhlBpQl/ATAboQCSKHA+GLwfzpDtOxyLLtXTbpIQDqcTl2OaGP2wOtBhKAWZ9LjsIx2h3DD49DDPcblQwmZGlR2iZQtVbHnxHc+L2wPuoyzOfB9QtoSSZcL7KL/XQ8WA7aX0ufOoljlsaPGyF24PPkt1c0M425M4PDqZwah+NAqqZl6dw/nKjvTbU6oWfX7o+RGIdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kVKHdbqA0nYwZzQvyecp9+EIwlyV0oUC0TssqSpKYD4=;
 b=lo1WlehcOh3Ry0Us5owmBqaFJw1ohWxF2AK8yfGTAJ3B1/6jOCThrAMZb4CUChd/jFenbj4z2doCsPOq0Suf1A25tuQmmZGsRS1oJaQsBbNMq+BR2UI5IAGFGpdAYoHyGCM/RaD98CeH0BeC2BifuFkyYk3PIpRIs0kTHbjnyk4=
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
Subject: [XEN RFC PATCH 06/40] xen: decouple NUMA from ACPI in Kconfig
Date: Wed, 11 Aug 2021 18:23:49 +0800
Message-ID: <20210811102423.28908-7-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210811102423.28908-1-wei.chen@arm.com>
References: <20210811102423.28908-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 959913fc-9cbf-4074-0338-08d95cb24467
X-MS-TrafficTypeDiagnostic: PR3PR08MB5628:|PR3PR08MB5753:
X-Microsoft-Antispam-PRVS:
	<PR3PR08MB57531F6CD4B8A1DD3BDD2B2C9EF89@PR3PR08MB5753.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 M/CGGbl0pAZg84Ne2ki8WaCskNwh5I4+RlJkX+GluzEeSKDHzvG8WBDfvMRS/1rUkuzZVSt2YOAeIyvyoUKmpRbAaPCGCW5UVppdlTk/LQBFUDeRvcG0QNjxbaY4gBeZHYuoO7mbyl4qOCPyIoDbah44dMClk0mzLHpZrSnFVXm0+eNc6ASLj8PTzcMixjvNedHN6mu64k3OeFunTOZJ45ws2hEAb28OZxjE30h9Dop82Wfl/roy7fLSZ5US86G6YVRazM/4XhxbEAuMcpg9R/W0hyzTGLoXaEWvxdxMdxFp26VVvnkG5zG6Gy1OeihKR+KkS+ir1Yc/2znvyR4XGR7hxsfXOihU4Gi2YBMRqxVsT+gn4yvNRFencGCfV8UvO6yenq4aMJFvZFgUpsnbE3iYPzXcNarOqifvMgDpT/ktj2G9/NZwegV1n4H2RmSXJLZk4Co01C3vG2iPS36Jwbnb0hgQDhmuVN+XT93Ixo0JH6chIJj7mXnmzWpZsu0gLERSLlGcc3ilIqcnQv63cACcV3PkXtbmbhRiKh/d2uNXtgkvh13ayagehGQuFKNt1T7R7IM8+Yw8DWMKaIndaOF5D16dQ+zUx5hGyeqXkvQuwA+UAhfjtbAbc8g5mHZ2Va9kG8gnBywYdFIQbI391p+WwwS95eXOHVzsgXZWsT7AcVA8O4qYkFVz+wdDPA/07OCqaJxjkB3eeyt22j/FTU7yefla5cmlNOxqe0F0cxF7Wj5ax9xNPu+CoconNsePT01IQdWERhvQcXmtMCL7xRk3pcT35KY6bxxYrLt82Q4=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(39860400002)(396003)(136003)(376002)(346002)(36840700001)(46966006)(8676002)(7696005)(336012)(316002)(26005)(426003)(83380400001)(36860700001)(8936002)(110136005)(36756003)(82310400003)(1076003)(47076005)(34070700002)(356005)(44832011)(82740400003)(70586007)(70206006)(81166007)(5660300002)(478600001)(2616005)(186003)(4326008)(2906002)(86362001)(36900700001)(2101003);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5628
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	0c417f11-cd95-4a0e-1d75-08d95cb23f94
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	183ptZiCG4uWNUrFG+W+z7pFOk0ikPTXbJDJSabPKWiB2Sy4BtITQ4zkuRc4NcuNC+LujUdE1k37MjWS96R5Ow2jw5xTOlZapnXy/BabFkS5OWIa848n7Eg+euqUtdT36phQli/QeAXz8KkxH+nxS+v3fUTZYx+TkUai3yUNLNjBW0uLuCHmzjrckRsyDAtP9xtErSjdB/ihEycrYuHPBwgEyHSbpllGcrjcX9KQlVa7/i1h8Syyl8S/Bu6t/LICe7WM0kEym/COfgQKh0PHrmp57Ex7Zn/3ZzZxIcF/8oBW5/Sr9S6+gvgSLpcW3xbs6Rxy/3wO36O7wBTaYyqJr3stSshuaFKwVy8U59ME0A4/mNPgjqft4c+DqdAzwPAwYx0tnklPDt5TJW84FORORqLozd8QoC9kAscTe+vxVpHarFmQlROll1Vx9HiSVVcTQ9oyZumABLLLNPec3HqKC6N/JXNvNGMF/g3fRmozlXDnR2HUQwYF6Gzn86jSd/v966IW3yBNSkxnk0PNDlQR8yQWYS/wmXIHrI5bQCMTRbuSBBx0qhDgrbsXUz87wsNOb9J0MFFJGMojlpegJOpoKCtzY4o35ADVhgP/Ohp5JJMJ5W1aYsevLu3BaUy7dKR2OveVvUvF5EL7OT016Gg7CBWcghV68r+RS5kU0ZM7ZoLnfYOcFKjjoMKG/W/TDhgj5EBoGSijiOzraz+DqlNjpm/rx066tFXwuXTDAxgkL0A=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(70206006)(81166007)(8936002)(26005)(4326008)(110136005)(2616005)(36860700001)(70586007)(316002)(7696005)(8676002)(5660300002)(508600001)(426003)(82310400003)(186003)(2906002)(1076003)(47076005)(44832011)(83380400001)(86362001)(336012)(36756003)(2101003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2021 10:24:56.9972
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 959913fc-9cbf-4074-0338-08d95cb24467
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT017.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR08MB5753

In current Xen code only implments x86 ACPI-based NUMA support.
So in Xen Kconfig system, NUMA equals to ACPI_NUMA. x86 selects
NUMA by default, and CONFIG_ACPI_NUMA is hardcode in config.h.

In this patch series, we introduced device tree based NUMA for
Arm. That means we will have two NUMA implemetations, so in this
patch we decouple NUMA from ACPI based NUMA in Kconfig. Make NUMA
as a common feature, that device tree based NUMA also can select it.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/arch/x86/Kconfig         | 2 +-
 xen/common/Kconfig           | 3 +++
 xen/drivers/acpi/Kconfig     | 3 ++-
 xen/drivers/acpi/Makefile    | 2 +-
 xen/include/asm-x86/config.h | 1 -
 5 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 9b164db641..7414aef113 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -24,7 +24,7 @@ config X86
 	select HAS_UBSAN
 	select HAS_VPCI if HVM
 	select NEEDS_LIBELF
-	select NUMA
+	select ACPI_NUMA
 
 config ARCH_DEFCONFIG
 	string
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 0ddd18e11a..b1f1145613 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -67,6 +67,9 @@ config MEM_ACCESS
 config NEEDS_LIBELF
 	bool
 
+config NUMA
+	bool
+
 menu "Speculative hardening"
 
 config SPECULATIVE_HARDEN_ARRAY
diff --git a/xen/drivers/acpi/Kconfig b/xen/drivers/acpi/Kconfig
index b64d3731fb..e3f3d8f4b1 100644
--- a/xen/drivers/acpi/Kconfig
+++ b/xen/drivers/acpi/Kconfig
@@ -5,5 +5,6 @@ config ACPI
 config ACPI_LEGACY_TABLES_LOOKUP
 	bool
 
-config NUMA
+config ACPI_NUMA
 	bool
+	select NUMA
diff --git a/xen/drivers/acpi/Makefile b/xen/drivers/acpi/Makefile
index 4f8e97228e..2fc5230253 100644
--- a/xen/drivers/acpi/Makefile
+++ b/xen/drivers/acpi/Makefile
@@ -3,7 +3,7 @@ obj-y += utilities/
 obj-$(CONFIG_X86) += apei/
 
 obj-bin-y += tables.init.o
-obj-$(CONFIG_NUMA) += numa.o
+obj-$(CONFIG_ACPI_NUMA) += numa.o
 obj-y += osl.o
 obj-$(CONFIG_HAS_CPUFREQ) += pmstat.o
 
diff --git a/xen/include/asm-x86/config.h b/xen/include/asm-x86/config.h
index 883c2ef0df..9a6f0a6edf 100644
--- a/xen/include/asm-x86/config.h
+++ b/xen/include/asm-x86/config.h
@@ -31,7 +31,6 @@
 /* Intel P4 currently has largest cache line (L2 line size is 128 bytes). */
 #define CONFIG_X86_L1_CACHE_SHIFT 7
 
-#define CONFIG_ACPI_NUMA 1
 #define CONFIG_ACPI_SRAT 1
 #define CONFIG_ACPI_CSTATE 1
 
-- 
2.25.1


