Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C99EA415DCC
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 14:04:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193826.345347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTNSR-0000TW-96; Thu, 23 Sep 2021 12:04:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193826.345347; Thu, 23 Sep 2021 12:04:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTNSR-0000QA-4C; Thu, 23 Sep 2021 12:04:07 +0000
Received: by outflank-mailman (input) for mailman id 193826;
 Thu, 23 Sep 2021 12:04:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fewu=ON=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mTNSP-0006xV-Nt
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 12:04:05 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com (unknown
 [40.107.1.42]) by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 51e1b6dc-1c66-11ec-ba2e-12813bfff9fa;
 Thu, 23 Sep 2021 12:03:53 +0000 (UTC)
Received: from PR0P264CA0183.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1c::27)
 by PAXPR08MB6525.eurprd08.prod.outlook.com (2603:10a6:102:154::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.15; Thu, 23 Sep
 2021 12:03:51 +0000
Received: from VE1EUR03FT011.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:100:1c:cafe::29) by PR0P264CA0183.outlook.office365.com
 (2603:10a6:100:1c::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend
 Transport; Thu, 23 Sep 2021 12:03:51 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT011.mail.protection.outlook.com (10.152.18.134) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 12:03:51 +0000
Received: ("Tessian outbound a77cafe56b47:v103");
 Thu, 23 Sep 2021 12:03:47 +0000
Received: from caa7b4dcd7cb.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 A11E3031-0ACD-43CA-A9D7-E16F6FA992ED.1; 
 Thu, 23 Sep 2021 12:03:29 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id caa7b4dcd7cb.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 23 Sep 2021 12:03:29 +0000
Received: from AM6PR0202CA0050.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::27) by AM9PR08MB7117.eurprd08.prod.outlook.com
 (2603:10a6:20b:41d::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14; Thu, 23 Sep
 2021 12:03:27 +0000
Received: from AM5EUR03FT009.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:3a:cafe::3e) by AM6PR0202CA0050.outlook.office365.com
 (2603:10a6:20b:3a::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Thu, 23 Sep 2021 12:03:27 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT009.mail.protection.outlook.com (10.152.16.110) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 12:03:27 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX03.Arm.com
 (10.251.24.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Thu, 23 Sep
 2021 12:03:19 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.87) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Thu, 23 Sep 2021 12:03:17 +0000
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
X-Inumbo-ID: 51e1b6dc-1c66-11ec-ba2e-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Bj0MiZUkjRpuLNYU7r2jj8EyNrfRU+quQC40vND4xs=;
 b=a0GfpOWRG7JknM/pMBuTF26K0ly9DQCzJedWLlJUKC4Ly+Pn1E71QNRDXypogtDNd5rUXsGJqF94cS5uLQXmx1x5oVfG6oHbnI0aLi4WOkDbwrJAPvKQOYhpWdx48/sJAFSc9zwjMt/FRgSh3vwuhUb9WcT2dXRWtfV4wESvx4Y=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: cf82ffb760e15b2e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=da8nWAOCURge37dfwRPFct2SZ1BQ4LF/AgWfRK6q//W6UUeFwOKhgJEwvLMoqqWqyqVtZpQpkpeBP7/vPAUuLzIHIfigQDktKw014jymWKxChM7v/lfgho/ayDfg9oLH4eMSqFesEj4qsRQdFHXWVjYgmZETVeuxU93/58DXXEsvWZBkHE7rNoH8HHoBWxvueSXK7w72tZcRRZRJvbpKxiNOGlsU2mm51T/+AjWy+M1mc0XX8kUIQNYqv4VoAliYeDi19SSC88OKEgLJnAvv1jy1YbxzyaOE9XltvIm9l58SWCkspLxJBDGhMlpdWiJDmzuyJ2XzaRmSa9NzAyaVbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=5Bj0MiZUkjRpuLNYU7r2jj8EyNrfRU+quQC40vND4xs=;
 b=hPP6iOn6UOFbpgVxkaV+k1XPMNueoirTjkG1WtdQ0E0sPtPr9IrRtK5eg23Ov1Vmn/0CuNWzVR1WCacAQ0QQhid2qd27bpxh/VZ+gxC0qK877s2bxCYAbYvJwL1VO/2FI8b1xRxOiEyOEwUP6S6SST4NeZ6ITbd4GYnJcpMEhGtWr8Yq6OGxx72spHNMpZw2uGqxvuPodcehK4ePY7j7GmmJqs3vGM7xpO6OzgM50hXnUDRHfRa3R0lTlVxjAgBrdFmUP8KiFKnaKwluvVXifzDR6BY6Jaz7P3PAdrJbp0QtG5DjY+pCu2MAsDnJH1Cm3zAGemm5GR02bewRtj3G1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5Bj0MiZUkjRpuLNYU7r2jj8EyNrfRU+quQC40vND4xs=;
 b=a0GfpOWRG7JknM/pMBuTF26K0ly9DQCzJedWLlJUKC4Ly+Pn1E71QNRDXypogtDNd5rUXsGJqF94cS5uLQXmx1x5oVfG6oHbnI0aLi4WOkDbwrJAPvKQOYhpWdx48/sJAFSc9zwjMt/FRgSh3vwuhUb9WcT2dXRWtfV4wESvx4Y=
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
Subject: [PATCH 05/37] xen: decouple NUMA from ACPI in Kconfig
Date: Thu, 23 Sep 2021 20:02:04 +0800
Message-ID: <20210923120236.3692135-6-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210923120236.3692135-1-wei.chen@arm.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e70ab8b5-14b4-481b-383f-08d97e8a353f
X-MS-TrafficTypeDiagnostic: AM9PR08MB7117:|PAXPR08MB6525:
X-Microsoft-Antispam-PRVS:
	<PAXPR08MB65254EAD4A5884D750EB3E439EA39@PAXPR08MB6525.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:935;OLM:935;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 WGTXvtcGlJfOrMskUH8PFEP99JJ+k79pMI0AmoBzPCRXFzGyFmpvSTboI5WWNpo+18J38XAotRpBPiWQ7R60Zp4olsVc4HwgyuxzZrUPtPjq5+oIluSwDxnMccHrxFRtpIpU/CA2J3UWzT1bvIg1aCf91N7kyEST+qcFcuXjOvaOvDsvwNzqYaoa9bcGd+wi1VQ3bio2yOCPIatKIHuwai7tBC4Vn5s6JfkJnZReDLRSoOLilw5O3qrBewKAvqecLVTnX5sGVtAGH9t1v/hAoOF4QvbXgWW6TgRxeJMPPd993OPy7qneiVrvLGeeMhDo8EjypxvzFuBdWwIAEahePglVfQzME0VhLmmSMwNg4t5iQyFYl60fP70qsA7T7JVymr+Dq6wKWAqR0IcQ0PoRdXlthU9k13s/BrkgHl/u9naxIjhUbd5BloaolMxLcDowi7rNI6cQEDzZM1/6D+MEqeTvBv/NsbtMYQDinS1Y736lgB5VeDjX48CMOge/14ZCs7nOO8WdG21cg80EXt1mQpjIdvNljPw07DIQMSuRcG2nBnBU42XkM0EtDw3Tk7X7skIoPcAI6R1Zm4C6u3mq0qNPkXXJVxYNyUYF2TGPsGZY6KsmoVF5ncAMABcPJpjd0nvbf2NCmvfgtalg9Db1WcaFl9qds3iNG8OBCngEyyHp66Ip1CYY1hAOriNC/fwmR6RrxtPlepQv2JRdir7z60AwqMcR5k4FgRRhUqBw8Eg=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(7696005)(8936002)(2906002)(356005)(81166007)(508600001)(5660300002)(36756003)(26005)(2616005)(82310400003)(36860700001)(1076003)(47076005)(316002)(8676002)(70206006)(83380400001)(336012)(4326008)(6666004)(186003)(110136005)(86362001)(44832011)(70586007)(426003)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR08MB7117
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 VE1EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	cb3a5a9e-9c97-487d-af5d-08d97e8a270b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	3RPlFvkCFNZMclfgKD9d4sKfv9SKt6SNqSfe78HlUj/FHF/bFngypu0ANtE1fyDkjlOUT9v0PESi3eUgUi0q0C9xUe4OHxnMLkZpcS424838v101OqmM+X2TCLoCi1N1OBCXrTL4bvrDaL3z6Zg51cI9czmsdWw8j7291o3qo6JekqnvGDpIpOJbzwBUla8qLRGIrSUlH2T+3ofGP0/3csYjWsAMwWJyTkfhxJs5wVRTVdt/Bk7ORCD3N5wf2dlHcOZAVHxDIUB+hA/C1ZvBGyZXOOaE1r254QIZ4REM+92oRdb+tgEPlPdAQxZtdYaNZGBj1jrpW4bf1OQChBvLj2yAMThL1tfaz6MffMoXewg8NeTPhjF1pQ7RgEmkvlQkw68USjv+kT23Z+rhp5jTfeuDRhAhJ2mbYmBLUT9vYB0+prhDaKoSImjNDsccvSAl4f4JCD+Z2TtRfXiQlXCfzi4JDBLmJHObCC7UAfktusIVP4QaEzDEEFMNv129xV4IPPDJ0qfOKF0wUEYqMSNysGknxjoA94PYFlJJPOtpITpMvnlj+5nObrc2uLpANedZIUMNqTskviGMEtg17uditfG84K10L/zKz5JIcG0Y8pfjeVXwoDMcd65x7D4VAqvPXQzN5h7Yr/2+FRYZcO1eiVbg+HqAlVhCE3tQj+/ZW4IJvzTl4P+1eOemsowF/7u4YRIkF5zOrN6SVXH9/eSk9g==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(186003)(36756003)(26005)(8676002)(7696005)(6666004)(426003)(82310400003)(44832011)(4326008)(336012)(83380400001)(2906002)(86362001)(508600001)(81166007)(1076003)(5660300002)(70586007)(36860700001)(2616005)(8936002)(316002)(70206006)(47076005)(110136005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 12:03:51.2448
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e70ab8b5-14b4-481b-383f-08d97e8a353f
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	VE1EUR03FT011.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6525

In current Xen code only implements x86 ACPI-based NUMA support.
So in Xen Kconfig system, NUMA equals to ACPI_NUMA. x86 selects
NUMA by default, and CONFIG_ACPI_NUMA is hardcode in config.h.

In a follow-up patch, we will introduce support for NUMA using
the device tree. That means we will have two NUMA implementations,
so in this patch we decouple NUMA from ACPI based NUMA in Kconfig.
Make NUMA as a common feature, that device tree based NUMA also
can select it.

Signed-off-by: Wei Chen <wei.chen@arm.com>
Reviewed-by: Jan Beulich <jbeulich@suse.com>
---
 xen/arch/x86/Kconfig         | 2 +-
 xen/common/Kconfig           | 3 +++
 xen/drivers/acpi/Kconfig     | 3 ++-
 xen/drivers/acpi/Makefile    | 2 +-
 xen/include/asm-x86/config.h | 1 -
 5 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 1f83518ee0..28d13b9705 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -6,6 +6,7 @@ config X86
 	def_bool y
 	select ACPI
 	select ACPI_LEGACY_TABLES_LOOKUP
+	select ACPI_NUMA
 	select ALTERNATIVE_CALL
 	select ARCH_SUPPORTS_INT128
 	select CORE_PARKING
@@ -25,7 +26,6 @@ config X86
 	select HAS_UBSAN
 	select HAS_VPCI if HVM
 	select NEEDS_LIBELF
-	select NUMA
 
 config ARCH_DEFCONFIG
 	string
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index db687b1785..9ebb1c239b 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -70,6 +70,9 @@ config MEM_ACCESS
 config NEEDS_LIBELF
 	bool
 
+config NUMA
+	bool
+
 config STATIC_MEMORY
 	bool "Static Allocation Support (UNSUPPORTED)" if UNSUPPORTED
 	depends on ARM
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


