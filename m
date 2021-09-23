Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5596D415E21
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 14:17:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193974.345612 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTNfb-0000a9-MS; Thu, 23 Sep 2021 12:17:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193974.345612; Thu, 23 Sep 2021 12:17:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTNfb-0000YQ-GC; Thu, 23 Sep 2021 12:17:43 +0000
Received: by outflank-mailman (input) for mailman id 193974;
 Thu, 23 Sep 2021 12:17:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fewu=ON=arm.com=Wei.Chen@srs-us1.protection.inumbo.net>)
 id 1mTNVu-0005KP-6K
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 12:07:42 +0000
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (unknown
 [40.107.2.57]) by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 688aa582-8a07-4358-9127-1a73f69cb49a;
 Thu, 23 Sep 2021 12:04:32 +0000 (UTC)
Received: from DBBPR09CA0018.eurprd09.prod.outlook.com (2603:10a6:10:c0::30)
 by AM6PR08MB4423.eurprd08.prod.outlook.com (2603:10a6:20b:bf::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Thu, 23 Sep
 2021 12:04:30 +0000
Received: from DB5EUR03FT015.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:c0:cafe::cd) by DBBPR09CA0018.outlook.office365.com
 (2603:10a6:10:c0::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.14 via Frontend
 Transport; Thu, 23 Sep 2021 12:04:30 +0000
Received: from 64aa7808-outbound-2.mta.getcheckrecipient.com (63.33.187.114)
 by DB5EUR03FT015.mail.protection.outlook.com (10.152.20.145) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 12:04:30 +0000
Received: ("Tessian outbound 8b24208353e0:v103");
 Thu, 23 Sep 2021 12:04:29 +0000
Received: from b3dfbd92560a.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 D55D4007-D26D-4147-A030-86248BA07E8C.1; 
 Thu, 23 Sep 2021 12:04:15 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id b3dfbd92560a.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Thu, 23 Sep 2021 12:04:15 +0000
Received: from AS9PR06CA0110.eurprd06.prod.outlook.com (2603:10a6:20b:465::29)
 by DB8PR08MB5387.eurprd08.prod.outlook.com (2603:10a6:10:115::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Thu, 23 Sep
 2021 12:04:14 +0000
Received: from AM5EUR03FT011.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:465:cafe::4e) by AS9PR06CA0110.outlook.office365.com
 (2603:10a6:20b:465::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Thu, 23 Sep 2021 12:04:14 +0000
Received: from nebula.arm.com (40.67.248.234) by
 AM5EUR03FT011.mail.protection.outlook.com (10.152.16.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4544.13 via Frontend Transport; Thu, 23 Sep 2021 12:04:13 +0000
Received: from AZ-NEU-EX03.Arm.com (10.251.24.31) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.14; Thu, 23 Sep
 2021 12:03:53 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.87) by mail.arm.com
 (10.251.24.31) with Microsoft SMTP Server id 15.1.2308.14 via Frontend
 Transport; Thu, 23 Sep 2021 12:03:51 +0000
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
X-Inumbo-ID: 688aa582-8a07-4358-9127-1a73f69cb49a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LT0n1SFAvgK3Jv0H4JFQYnKlHEfutbmGqdGdC9djIAI=;
 b=b9ufI3LQ1/Tv+xEHMCAlr66hy75m+aULqpElhnB4AEO8yffhvCMz7ujCsBy6CLJIXyQHPwBnTuZ6H+UTfbW75k+90N8pEJ94jhcUMZvw0fTOeu2QjoSknNqvcj3ERwzMZ5hgvQbwxsfxLd5uW+rPfOnD2fcov3L79isTlse+Pm0=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.33.187.114)
 smtp.mailfrom=arm.com; lists.xenproject.org; dkim=pass (signature was
 verified) header.d=armh.onmicrosoft.com;lists.xenproject.org; dmarc=pass
 action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.33.187.114 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.33.187.114; helo=64aa7808-outbound-2.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 842a8a7af6a85634
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WPm7kFPrkfvNHLp1jVs/Dj/yQpBqiTqy9fblwKyVzTjmqsbVrTvubZydMEq/uuXqHRqx+sHv9zrETxx2yhTweWWnU47bQ2RcbhX6lSVTpm8SPWzBR4fyIDMPVNSnAPaCMNV1yir7xSjejnlUhVeN43WYIyJkmLGNgl/BAWp+YErsQj8R9dSLPxh7QSPxDwh63oBiq0zAWKefu5XMYM1HJuKze5L9mqbgi9nq9lV/8b1sUYag4ccsdcjTpIgg03ntlGQKh9gt6Q0Nl084+v4XzxkbHbval9t4upktzCfTLq11FsEbOTzJSggCeYYiOIlSaSnVg4fX4Q0Vxk/gsI+xEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=LT0n1SFAvgK3Jv0H4JFQYnKlHEfutbmGqdGdC9djIAI=;
 b=PzH9vR8mxqXjux9n95YDETh9Kl8ilbDO+K/9Ewheqq4TVcx8u93my/OOvl8CnzvbNC+cRD5cPRVv8wRAJRlpHBe+SkBpuY1v1VxbZxmUHZiRRSfGY640tKTkVfDEbQQa8KcsCZC8enpiAHhVVNJNQFm/3O/qzz8dx0HJ0JVcYVSXeeT9JlOYHfSJxQNt77zlAQ5cEybz9j4DinmwU3c2LSrDFtTZKX52Iiz/dmZdY2sJZwYwVEscQ8blBdCOdhkr4JkxWC+BJgtrbS8M/0Meuloduw9SRpKonRmC2SCdAFF2v+zKpKdrL5r7gv7W7LKc1DZzRrxDgsx80K0hj/TBkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LT0n1SFAvgK3Jv0H4JFQYnKlHEfutbmGqdGdC9djIAI=;
 b=b9ufI3LQ1/Tv+xEHMCAlr66hy75m+aULqpElhnB4AEO8yffhvCMz7ujCsBy6CLJIXyQHPwBnTuZ6H+UTfbW75k+90N8pEJ94jhcUMZvw0fTOeu2QjoSknNqvcj3ERwzMZ5hgvQbwxsfxLd5uW+rPfOnD2fcov3L79isTlse+Pm0=
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
Subject: [PATCH 20/37] xen: introduce CONFIG_EFI to stub API for non-EFI architecture
Date: Thu, 23 Sep 2021 20:02:19 +0800
Message-ID: <20210923120236.3692135-21-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210923120236.3692135-1-wei.chen@arm.com>
References: <20210923120236.3692135-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 526ce2ac-6d4e-44f1-b7ab-08d97e8a4c98
X-MS-TrafficTypeDiagnostic: DB8PR08MB5387:|AM6PR08MB4423:
X-Microsoft-Antispam-PRVS:
	<AM6PR08MB4423D71E54E6720A49AF42EF9EA39@AM6PR08MB4423.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 9jObQxWYN9620scgtKFIYTHJuMrjm5Bk8hWQ2NRflQm3oojfiWWq5iJ5s4UxIU2uBDyHR7x3Lnytub4syAIXOJGJNgpAOx3YlsmC0LjziT3NnmZVgJyJYPNwInPv5Qq0hEFZGGo2vcdKPiuFNRq5OBG2aj34nhiPVgQ4aB3hZylLAEBGt5Tc9DuH2vSMxqZNcmP7wKiHkL/NY/BjCBqIlklXcTboFWFpoczU7a/ZxeaNNRVbSSQizwOaJu+LoDULtXH6FZUyYAieW3gpdCJFbb2U/ru9ZDs/jN/f5Y9XBlJxc3MENIjy64+Ee/5n/AXmcbYPaBj/LyxMk6m3bRNceuK5Wo5raeLcrxIbuNJBQyIpvkEgQCu1Io0wC7/fVxlop9QCjNdkRQFRLHa9zywvsmDpY8arwZ8/KANtw+TrahSCs4gIOOeGLFLxpgQ3GIpwjadhJCG5iSmfOarZqgx0Si6msjiGOIRJEDm+ySguglMAaDH/O3JBZVUdVNGk6klyGau/abfoOniteNwbFWfXX1GTIfjmtj/k9UBhnBfEfWReOxRXM+UxCHJGuE2cNJ8riMFodTibxfBPaW+VJB+HhfFBj0IgyXfRMmFHlIIvCvOkKnT/gL/8tzKEJ7MqkL7gALN7r/tzLHtGwk8iyaqHhMFl/K8yHAl6HbE7uB/nLjgq3Sz3HhH1ZpT133QBCaf94ZsFphFqqwb8ag+C0EEjDbJojqn9GCmb56Cxo1YJsVw=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(47076005)(8936002)(316002)(82310400003)(70206006)(70586007)(6666004)(36756003)(356005)(1076003)(36860700001)(8676002)(83380400001)(5660300002)(86362001)(26005)(508600001)(186003)(4326008)(2616005)(336012)(426003)(44832011)(2906002)(7696005)(110136005)(81166007)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5387
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	5b603ccb-8d6c-4b1e-1089-08d97e8a428e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	NJWgKKGtYEBLDdw4o2hBj8Kqs5UeS1kwojL78S/J19Tw0xqIJqMBiy+1TAEPlctUhi5p4keGur6yXVeD1EYJojvtRtOyma/EuRwZjZlrGNw7lsV0mQjEPT3Q2ZrAdZJUCA9/4boBnH9UjxFcjj8/NhsFi0aTPAMlgjfGj9c215mcT9mhYc4mBq0RPc051gRSipaI6ej1iBx7MhNwnDFCdqiq1HVEWxUibA2tYmvqO/vB4RsXrxtbTipZfw9W//7sY5WdYUdQnsLtiMn+9Clr633CeFOEmkpcie9JhOAU1kR1Y2D1yJeH31K1VIumvLzSLx992fJqf4S/0MuXU+u7k5iAgGwjtM95RE5s5ApR4TnxYbzeMmtwI0+as/5Y2aMCRyvp8isXEvOph7jluOlezSX7/dKijxzKSxS4egKJKyiYWGEfjcHrxs/+MXE08BF0zui0JRG9QBjuoN1PlWZrkQ+ZL+fTHGASxhdlPG5oKA03LQNYf0W+TAKNEVM46DYajofKiGSGnL1NTe3zSlcUA6Rw1+EvAii+xC08KHP1cKuKGl1GF/yQwXYzQRBZn8yijcr//DzSH5gt8kfis+yH9Bh+J1lCjyQllcGU+VNfBVEh95ocbqaRMEDH10WkMC0lPvl12fpeeh5CIEOE42cSOT1uItXqukKyCyLltlEPELisSuuUcOu6nbaX/2xhLty45AZ6F9JS26FNgceP4z25gw==
X-Forefront-Antispam-Report:
	CIP:63.33.187.114;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-2.mta.getcheckrecipient.com;PTR:ec2-63-33-187-114.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(508600001)(4326008)(110136005)(316002)(36756003)(5660300002)(81166007)(8676002)(8936002)(44832011)(2906002)(86362001)(26005)(83380400001)(186003)(1076003)(70206006)(2616005)(70586007)(47076005)(336012)(426003)(82310400003)(7696005)(36860700001)(6666004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2021 12:04:30.5229
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 526ce2ac-6d4e-44f1-b7ab-08d97e8a4c98
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.33.187.114];Helo=[64aa7808-outbound-2.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT015.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR08MB4423

Some architectures do not support EFI, but EFI API will be used
in some common features. Instead of spreading #ifdef ARCH, we
introduce this Kconfig option to give Xen the ability of stubing
EFI API for non-EFI supported architectures.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
 xen/arch/arm/Kconfig  |  1 +
 xen/arch/arm/Makefile |  2 +-
 xen/arch/x86/Kconfig  |  1 +
 xen/common/Kconfig    | 11 +++++++++++
 xen/include/xen/efi.h |  4 ++++
 5 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index ecfa6822e4..865ad83a89 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -6,6 +6,7 @@ config ARM_64
 	def_bool y
 	depends on !ARM_32
 	select 64BIT
+	select EFI
 	select HAS_FAST_MULTIPLY
 
 config ARM
diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 3d3b97b5b4..ae4efbf76e 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -1,6 +1,6 @@
 obj-$(CONFIG_ARM_32) += arm32/
 obj-$(CONFIG_ARM_64) += arm64/
-obj-$(CONFIG_ARM_64) += efi/
+obj-$(CONFIG_EFI) += efi/
 obj-$(CONFIG_ACPI) += acpi/
 ifneq ($(CONFIG_NO_PLAT),y)
 obj-y += platforms/
diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 28d13b9705..b9ed187f6b 100644
--- a/xen/arch/x86/Kconfig
+++ b/xen/arch/x86/Kconfig
@@ -10,6 +10,7 @@ config X86
 	select ALTERNATIVE_CALL
 	select ARCH_SUPPORTS_INT128
 	select CORE_PARKING
+	select EFI
 	select HAS_ALTERNATIVE
 	select HAS_COMPAT
 	select HAS_CPUFREQ
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index 9ebb1c239b..f998746a1a 100644
--- a/xen/common/Kconfig
+++ b/xen/common/Kconfig
@@ -11,6 +11,16 @@ config COMPAT
 config CORE_PARKING
 	bool
 
+config EFI
+	bool
+	---help---
+      This option provides support for runtime services provided
+      by UEFI firmware (such as non-volatile variables, realtime
+      clock, and platform reset). A UEFI stub is also provided to
+      allow the kernel to be booted as an EFI application. This
+      is only useful for kernels that may run on systems that have
+      UEFI firmware.
+
 config GRANT_TABLE
 	bool "Grant table support" if EXPERT
 	default y
@@ -196,6 +206,7 @@ config KEXEC
 
 config EFI_SET_VIRTUAL_ADDRESS_MAP
     bool "EFI: call SetVirtualAddressMap()" if EXPERT
+    depends on EFI
     ---help---
       Call EFI SetVirtualAddressMap() runtime service to setup memory map for
       further runtime services. According to UEFI spec, it isn't strictly
diff --git a/xen/include/xen/efi.h b/xen/include/xen/efi.h
index 94a7e547f9..661a48286a 100644
--- a/xen/include/xen/efi.h
+++ b/xen/include/xen/efi.h
@@ -25,6 +25,8 @@ extern struct efi efi;
 
 #ifndef __ASSEMBLY__
 
+#ifdef CONFIG_EFI
+
 union xenpf_efi_info;
 union compat_pf_efi_info;
 
@@ -45,6 +47,8 @@ int efi_runtime_call(struct xenpf_efi_runtime_call *);
 int efi_compat_get_info(uint32_t idx, union compat_pf_efi_info *);
 int efi_compat_runtime_call(struct compat_pf_efi_runtime_call *);
 
+#endif /* CONFIG_EFI*/
+
 #endif /* !__ASSEMBLY__ */
 
 #endif /* __XEN_EFI_H__ */
-- 
2.25.1


