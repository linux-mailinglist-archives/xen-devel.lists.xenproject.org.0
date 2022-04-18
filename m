Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AFA1504E39
	for <lists+xen-devel@lfdr.de>; Mon, 18 Apr 2022 11:09:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.307055.522325 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngNNp-0007qf-4y; Mon, 18 Apr 2022 09:09:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 307055.522325; Mon, 18 Apr 2022 09:09:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngNNp-0007pK-0z; Mon, 18 Apr 2022 09:09:21 +0000
Received: by outflank-mailman (input) for mailman id 307055;
 Mon, 18 Apr 2022 09:09:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mice=U4=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1ngNNn-0006ub-1b
 for xen-devel@lists.xenproject.org; Mon, 18 Apr 2022 09:09:19 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-he1eur04on0618.outbound.protection.outlook.com
 [2a01:111:f400:fe0d::618])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 39d4040b-bef7-11ec-8fbe-03012f2f19d4;
 Mon, 18 Apr 2022 11:09:18 +0200 (CEST)
Received: from DU2PR04CA0294.eurprd04.prod.outlook.com (2603:10a6:10:28c::29)
 by DB7PR08MB3161.eurprd08.prod.outlook.com (2603:10a6:5:1d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.18; Mon, 18 Apr
 2022 09:09:15 +0000
Received: from DB5EUR03FT037.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:28c:cafe::d2) by DU2PR04CA0294.outlook.office365.com
 (2603:10a6:10:28c::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.19 via Frontend
 Transport; Mon, 18 Apr 2022 09:09:15 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT037.mail.protection.outlook.com (10.152.20.215) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5164.19 via Frontend Transport; Mon, 18 Apr 2022 09:09:15 +0000
Received: ("Tessian outbound 62985e3c34b6:v118");
 Mon, 18 Apr 2022 09:09:15 +0000
Received: from 9d98b1640673.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 BB27E34A-68A8-4D6E-A93F-CB124D85EABE.1; 
 Mon, 18 Apr 2022 09:09:08 +0000
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9d98b1640673.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 18 Apr 2022 09:09:08 +0000
Received: from AS9PR06CA0202.eurprd06.prod.outlook.com (2603:10a6:20b:45d::32)
 by AM0PR08MB4593.eurprd08.prod.outlook.com (2603:10a6:208:fd::28)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Mon, 18 Apr
 2022 09:09:07 +0000
Received: from VE1EUR03FT050.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:45d:cafe::d6) by AS9PR06CA0202.outlook.office365.com
 (2603:10a6:20b:45d::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.18 via Frontend
 Transport; Mon, 18 Apr 2022 09:09:07 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT050.mail.protection.outlook.com (10.152.19.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5164.19 via Frontend Transport; Mon, 18 Apr 2022 09:09:06 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.27; Mon, 18 Apr
 2022 09:09:05 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.27 via Frontend
 Transport; Mon, 18 Apr 2022 09:09:02 +0000
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
X-Inumbo-ID: 39d4040b-bef7-11ec-8fbe-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tvRkI0wVuOuaZghSz7/nXNikDcYdh4Q7PzQrJ96r9QA=;
 b=YUDKS71MikoJvX65ifqmPpod0KGHhhnq+pzS0w4Rou/tRPHHvB0BhqcCJkvHJiKwFYzS65TqaAbYxiL4YyCwfju+9FM3pgGFWFpzSdd0PuuAPOyhg1XaxON3/J41yMX+3jF06ufHgRqdVqETjerWiSuPubJ7M8gQ5A6x9UgLb/E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 8506ce5e04c293cb
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oPwufD1BqEtiZBCWKPIhWFqRtCR90lYDMkv5Q7vm9rtS8ZOHru/opEfuIBBUlT4KwvLuFtPLBLY+eW0dAHc8HFB7pyEeQujC9B/91CDvdGeKcK9wmSlCf+6QKtGoU4xBHdTqFXIrhAakkezVr68AqiBEjZJFiEZvmpFiY8bOEW+OrzU9kjVB/3hZAHx4jAKE45km6Ly3ZzIneNQPnvSGHn3hmnAZdJIqErLzlRi8sUFX1AJbO3/7Daebwg/0g5Mdijc6b/H2Bk+rkV8Ca/3ZaOralIMneOen6n91rHJ1gC8Z9QGCvBDg5ZsyBrA5c7erNIkLWB5LTicVaxKjZAzG8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tvRkI0wVuOuaZghSz7/nXNikDcYdh4Q7PzQrJ96r9QA=;
 b=cppydxpY1baLhGESuagiuW5xVhmC++ewa3Xy5fV2ZJjxIXDg7C7qvQR2EBz/7KnzDG3o3sj6rgQncrjqWCB/io7IDkjAlK3gjNxajfb/ARX/gyRPEJ5KXGAf4MiKEDR3E0escmYpB1C8LB1UijEfbweESIjy+XxEiQdKp3yDQbUZiWWbxmSrTSXNxf2q1GTjh4WhJx9pRC1/zO1ZeWADoFlmHiwaBAQVyBBWEweXDOHkF1bHulZkhXRSPrENhibRzBv9+ThqUGxrgmO0m8FuG++2cIKic++PlAT3kJGctMZ8cie4fA7+exh7jHBZD69VA1nLMkCKxSyz2z/ImvqQlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tvRkI0wVuOuaZghSz7/nXNikDcYdh4Q7PzQrJ96r9QA=;
 b=YUDKS71MikoJvX65ifqmPpod0KGHhhnq+pzS0w4Rou/tRPHHvB0BhqcCJkvHJiKwFYzS65TqaAbYxiL4YyCwfju+9FM3pgGFWFpzSdd0PuuAPOyhg1XaxON3/J41yMX+3jF06ufHgRqdVqETjerWiSuPubJ7M8gQ5A6x9UgLb/E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Wei Chen <wei.chen@arm.com>
To: <--to=xen-devel@lists.xenproject.org>, <xen-devel@lists.xenproject.org>
CC: <nd@arm.com>, Wei Chen <wei.chen@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2 03/10] xen/arm: add CONFIG_ARM_EFI to stub EFI API
Date: Mon, 18 Apr 2022 17:07:28 +0800
Message-ID: <20220418090735.3940393-4-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220418090735.3940393-1-wei.chen@arm.com>
References: <20220418090735.3940393-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: f44a135a-5445-481a-9760-08da211b1c7a
X-MS-TrafficTypeDiagnostic:
	AM0PR08MB4593:EE_|DB5EUR03FT037:EE_|DB7PR08MB3161:EE_
X-Microsoft-Antispam-PRVS:
	<DB7PR08MB31615CE20A8BC5F7F63806299EF39@DB7PR08MB3161.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 dOXIfggwWPsp+6c2RVO80rNMNXkx9IgEIySwNoUJbD4Dqkpy/O+17fQDzLLTyAOOjO3+pZg44A8BYDfz2Hx4rxY3pjeP4WLGhkM209w6l1kvSAJxuws8HllNt2HSN12pSXS2t2bxP6E+ofPOnCJNo0+fzfT3kWPgW/nXSGgwAm+IjAzTwFx66SmXq6G631HG2Xu4OosYrSLEjugykXSV7UUAgUBaDD/gi0dWhvh6GhMv9pYu4nkX07gmPWkQvflRTVEXz55li/dBPKdYFnZjMX+7aUBuN8qWAcNEpumqyW1IIWLgwndg85EgquTQKZaWFxI9I4xiwH9VK+y3XwnSnK7uCjoMHhUGYkmUYUL86hf/2JDay6fRqaXswk8duuAlU+DM6ukk878WnLN5Hz6zFlL+fU4XdP9kiQBUB8VC/SlECGET87n9W5vevHaTLfqow9nA6AOA7937iRNwslOUKbvjxUNDDWZN++E0hcEspa5goAtnAtF7NCVoYy2h2nXVBDiEU1+G4C+tsRgOe6L1fZpGfh3byq+kgr/XsEszUxGvLa9ZWwMMYacS9cJPqvqXfWm1W5gw9t9KvKQQa4tdnuhDk6ijYRf+w/wREyPBLfL0Qw/9TM7Kr1YOmCSNaBtUpKxA+BkHw9kuUtP4XVqzOnWDLDk0AzWKH96yeBzeRs/Jdomi5Gm0WP9jOoDl2wVDufSb6rLr3kjHRdgrmwCpjA==
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(426003)(4326008)(44832011)(47076005)(508600001)(70206006)(2616005)(8676002)(6666004)(336012)(81166007)(26005)(8936002)(83380400001)(186003)(5660300002)(2906002)(316002)(356005)(1076003)(70586007)(36860700001)(110136005)(54906003)(7696005)(40460700003)(36756003)(86362001)(82310400005)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR08MB4593
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	b375e3d7-1360-4db0-74a6-08da211b178b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	pVq2uErkLBaSvoQ/RcIr2zTkF5GT/Kvp00oLPu5F37/53IjsfW2SRebGNC+k2SruUiBdryCvyNFEKma94HJ5C67OkJpowRcYme/la2Elb15W0VW8e+Smht4H8+SEF9gHB30J5dajpzut08db+x8XWtIKqVmvbImLRSmuMaOZZ30vGRr2KOphLGLbrxJOg73nWfVMImXTsB8luNJxEkgrkzKq/A7jNrhb/GqIXxOl+CAZTupmycD1+3M8SDshD7uI/sAv7Q+yUdBvoUa7j5zX+NyXOzCr/akNf/1VnK9UP7ZAD5rbs1GFcaD7jmiAQBt0o+Wg44+BiacbH1s9A9hWuj4bGFmIRckexgwElPwn32M2l2urHQF8TWMLm+uHESVoQegIZ8vGT1HalwLM5dwdT64ITr6x4nxlwdLRJU1Hb+TVhLL0SYOAvYunBuDnDUEfbFOYh36YutthvgwTdB2Wd+dPHQG12mG+WzH4Mdf2KI0kEfeXS0vFUIUEftwwUumaO+ozgg7uGs+NA7Hmacd8353yAb8bqTptg98lhO+v+yVbDtqDNgNubmsx1Q03HrchHqel1zK5dtlIQ+bB0N11OUEcTkWfOVPO2bAgykz2zVYrLitP1U9yuK++lhu/B/q5RWdOwlfG2qzAbwrxWEs+sw==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(2906002)(508600001)(36860700001)(54906003)(450100002)(81166007)(44832011)(8676002)(4326008)(70206006)(70586007)(86362001)(110136005)(316002)(83380400001)(5660300002)(8936002)(2616005)(107886003)(36756003)(336012)(1076003)(7696005)(186003)(47076005)(426003)(26005)(82310400005)(6666004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2022 09:09:15.1820
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f44a135a-5445-481a-9760-08da211b1c7a
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT037.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3161

x86 is using compiler feature testing to decide EFI
build enable or not. When EFI build is disabled, x86
will use a efi/stub.c file to replace efi/runtime.c
for build objects. Following this idea, we introduce
a stub file for Arm, but use CONFIG_ARM_EFI to decide
EFI build enable or not.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
v1 -> v2:
1. Use CONFIG_ARM_EFI to replace CONFIG_EFI
2. Remove help text and make CONFIG_ARM_EFI invisible.
3. Merge one following patch:
   xen/arm: introduce a stub file for non-EFI architectures
4. Use the common stub.c instead of creating new one.
---
 xen/arch/arm/Kconfig      | 5 +++++
 xen/arch/arm/Makefile     | 2 +-
 xen/arch/arm/efi/Makefile | 5 +++++
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index ecfa6822e4..5f1b0121b0 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -6,6 +6,7 @@ config ARM_64
 	def_bool y
 	depends on !ARM_32
 	select 64BIT
+	select ARM_EFI
 	select HAS_FAST_MULTIPLY
 
 config ARM
@@ -33,6 +34,10 @@ config ACPI
 	  Advanced Configuration and Power Interface (ACPI) support for Xen is
 	  an alternative to device tree on ARM64.
 
+config ARM_EFI
+	bool
+	depends on ARM_64
+
 config GICV3
 	bool "GICv3 driver"
 	depends on ARM_64 && !NEW_VGIC
diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 1d862351d1..bb7a6151c1 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -1,6 +1,5 @@
 obj-$(CONFIG_ARM_32) += arm32/
 obj-$(CONFIG_ARM_64) += arm64/
-obj-$(CONFIG_ARM_64) += efi/
 obj-$(CONFIG_ACPI) += acpi/
 obj-$(CONFIG_HAS_PCI) += pci/
 ifneq ($(CONFIG_NO_PLAT),y)
@@ -20,6 +19,7 @@ obj-y += domain.o
 obj-y += domain_build.init.o
 obj-y += domctl.o
 obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
+obj-y += efi/
 obj-y += gic.o
 obj-y += gic-v2.o
 obj-$(CONFIG_GICV3) += gic-v3.o
diff --git a/xen/arch/arm/efi/Makefile b/xen/arch/arm/efi/Makefile
index 4313c39066..75ef180233 100644
--- a/xen/arch/arm/efi/Makefile
+++ b/xen/arch/arm/efi/Makefile
@@ -1,4 +1,9 @@
 include $(srctree)/common/efi/efi-common.mk
 
+ifeq ($(CONFIG_ARM_EFI),y)
 obj-y += $(EFIOBJ-y)
 obj-$(CONFIG_ACPI) +=  efi-dom0.init.o
+else
+EFIOBJ-y += stub.o
+obj-y += stub.o
+endif
-- 
2.25.1


