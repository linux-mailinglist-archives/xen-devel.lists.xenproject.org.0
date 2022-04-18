Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 889C0504E3B
	for <lists+xen-devel@lfdr.de>; Mon, 18 Apr 2022 11:09:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.307064.522370 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngNO5-0000yh-NV; Mon, 18 Apr 2022 09:09:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 307064.522370; Mon, 18 Apr 2022 09:09:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngNO5-0000ut-I8; Mon, 18 Apr 2022 09:09:37 +0000
Received: by outflank-mailman (input) for mailman id 307064;
 Mon, 18 Apr 2022 09:09:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mice=U4=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1ngNO3-0006ub-Ko
 for xen-devel@lists.xenproject.org; Mon, 18 Apr 2022 09:09:35 +0000
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on0624.outbound.protection.outlook.com
 [2a01:111:f400:fe0c::624])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4394dd6e-bef7-11ec-8fbe-03012f2f19d4;
 Mon, 18 Apr 2022 11:09:34 +0200 (CEST)
Received: from DB6PR07CA0081.eurprd07.prod.outlook.com (2603:10a6:6:2b::19) by
 VI1PR08MB3104.eurprd08.prod.outlook.com (2603:10a6:803:42::17) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5164.18; Mon, 18 Apr 2022 09:09:30 +0000
Received: from DB5EUR03FT034.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:6:2b:cafe::e6) by DB6PR07CA0081.outlook.office365.com
 (2603:10a6:6:2b::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.12 via Frontend
 Transport; Mon, 18 Apr 2022 09:09:30 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5EUR03FT034.mail.protection.outlook.com (10.152.20.87) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5164.19 via Frontend Transport; Mon, 18 Apr 2022 09:09:30 +0000
Received: ("Tessian outbound 62985e3c34b6:v118");
 Mon, 18 Apr 2022 09:09:30 +0000
Received: from 4f42fa70571b.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 FF6153FE-11D1-415C-91D8-C9DFCB1B1FCB.1; 
 Mon, 18 Apr 2022 09:09:23 +0000
Received: from EUR02-HE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 4f42fa70571b.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Mon, 18 Apr 2022 09:09:23 +0000
Received: from AM6PR0502CA0070.eurprd05.prod.outlook.com
 (2603:10a6:20b:56::47) by DB6PR0801MB2069.eurprd08.prod.outlook.com
 (2603:10a6:4:7a::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Mon, 18 Apr
 2022 09:09:21 +0000
Received: from VE1EUR03FT013.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:56:cafe::a2) by AM6PR0502CA0070.outlook.office365.com
 (2603:10a6:20b:56::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20 via Frontend
 Transport; Mon, 18 Apr 2022 09:09:21 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VE1EUR03FT013.mail.protection.outlook.com (10.152.19.37) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5164.19 via Frontend Transport; Mon, 18 Apr 2022 09:09:20 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.27; Mon, 18 Apr
 2022 09:09:19 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2308.27 via Frontend
 Transport; Mon, 18 Apr 2022 09:09:16 +0000
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
X-Inumbo-ID: 4394dd6e-bef7-11ec-8fbe-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bpBKGazT9JC8lRpfqSPdaFeJFZI9C70EVp+BKwYVSR4=;
 b=nQ+5MP228nSOFQBxbFNYpOZFA3FJTx0PYgo593b0kojgaovpgPA17f2LMDesqQcVu7P2KH+2vX7bmmuf2YWf1Wh5i3IXBUMHsIVsZd2PkH58gO/lLZX9c9YbxkJz2YLSCdoX99XD/lbP1/WBLIqY26op2sMeo2AreflHn2K8K3U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
X-CheckRecipientChecked: true
X-CR-MTA-CID: 23b4a5fef05d5e3e
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qu7vEESF5z6unrsZANbJVxjyuDCWIgW25s1Mt3F2+KC1PHbovU8aR3tTrc5Mtk3UXvNUCuBRMOGG5Xhmw07eIz43xr07gFXhJOim8QL8DXk5uRgwFY5AQI7IyU6J2LngytOAVJ2ExZMyUx7B3FBuu76z7lJgaKLObukZc7K0F/zhsBsYv6FvQdv5ghyCPTT422k3LLw3nqYzuXvU7kMliUozoY2PsJjfbqCYUk8z7bfh3FW9fQ++GacZNp5hB0wr3dpDc1x/DO/BWjzRmym56Xef6FDBfAa+YYWszDnCcp9y2RWS1aiom+uMzNLR/eRug4t1C3XeffbjRpmOQpllOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bpBKGazT9JC8lRpfqSPdaFeJFZI9C70EVp+BKwYVSR4=;
 b=h7X7y4Kf66cd7DEbFbDHCIoGUCNfCWo/Rc+unLWy1mtErL4ZfjsNEgxS9df9KkY0tiE88qPel80sMrjD2wu01AWjzfCLH7kZWQi+65Too7aYHDU7JgS+5CpxfndSMAwmKD8UH7WOuHZO+sRKvoPhqThB15ZhzSrZY0OgD3hfabgd9phCkBNUEUOp9ZAW4VmFG62+8i/qNwO1CyzdhvpuaYYZOOfpHO0zlXvvDBlJOnV3cM27qWr4gI6PlnhSnzj64DoI9r4umG7k6kWf+hueQJR2RYPSS2iyDuILRGuk2DTaNxBa609CPntQxO01zPhJ031aLSDpx/W/1OasHGQ96Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bpBKGazT9JC8lRpfqSPdaFeJFZI9C70EVp+BKwYVSR4=;
 b=nQ+5MP228nSOFQBxbFNYpOZFA3FJTx0PYgo593b0kojgaovpgPA17f2LMDesqQcVu7P2KH+2vX7bmmuf2YWf1Wh5i3IXBUMHsIVsZd2PkH58gO/lLZX9c9YbxkJz2YLSCdoX99XD/lbP1/WBLIqY26op2sMeo2AreflHn2K8K3U=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com;
From: Wei Chen <wei.chen@arm.com>
To: <--to=xen-devel@lists.xenproject.org>, <xen-devel@lists.xenproject.org>
CC: <nd@arm.com>, Wei Chen <wei.chen@arm.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
	<wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall
	<julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH v2 07/10] xen: decouple NUMA from ACPI in Kconfig
Date: Mon, 18 Apr 2022 17:07:32 +0800
Message-ID: <20220418090735.3940393-8-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220418090735.3940393-1-wei.chen@arm.com>
References: <20220418090735.3940393-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-Office365-Filtering-Correlation-Id: d5855dca-c0cc-4346-8026-08da211b2575
X-MS-TrafficTypeDiagnostic:
	DB6PR0801MB2069:EE_|DB5EUR03FT034:EE_|VI1PR08MB3104:EE_
X-Microsoft-Antispam-PRVS:
	<VI1PR08MB3104D8DBDBA8996CEE297A679EF39@VI1PR08MB3104.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 gluoZOpqTErfSkjpXG4bjpicgNlQUvAqQOyKwXx3178Z3G0Jhc7aZIzRjfMFHJiu08QuhKOcuJMlwHARcohT4lRylZPuGrXpW47A27Ncje+i6jGRNoE+ET9E9OUqmRgZOO1HRjmQwiJ/lz7Tb+eHPZUkq+YSud70fCPAoNVwMsFyjjnaKzzJ7KbrffK2FCrbNPylIunh//406cVjt5tpAQiCvmOChu5myOUngysvTcIhlxcu6qLZ+CTzzvLbt1OQFpPwwqjqzqLuEeNv492l1Hzs+DcaYcsS1I7yMwfzK0Dw04NKicU3reeLlw5TY6e1B6bbyHF+6WiScyyfsmNX4mozWEAn/TxjSt/hrguxFeZfGT5Bd5ApCjufToUazFS4j1/LvOr9uSukd6fx4EbM6z1O+Iz99ib26FJYz8qIKGYg/CW55CC0uVIFgbU2wVZZzgT9HCNVgrl7oNXRQgYASJsu0lDO/zHPmjN+DqxTepxL67T4TqVkNUVDsfvQpnKDVWneXtL5y0Ohga7F7tSCEuIriVLWvqGqWlsWNjNpWD21v/mn2urnSuNU0MRyLaUKWYuqbmLgZ3eUPVHDMb+gLgWdefDb5n/yp60XyN3HafArG0XC03WgviaVHEXG3HNsrr1Gsp03XxB+BecUJ6tTnb7228w6pCcLsHYTeXiYXd7nVx+5YWe30GvEvXyPvg3N
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(46966006)(36840700001)(86362001)(83380400001)(5660300002)(110136005)(1076003)(7696005)(82310400005)(2906002)(508600001)(81166007)(356005)(36756003)(26005)(186003)(54906003)(47076005)(426003)(336012)(8936002)(2616005)(44832011)(6666004)(36860700001)(8676002)(4326008)(70206006)(316002)(70586007)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB6PR0801MB2069
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 DB5EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	15f81b41-839c-4ea2-ef6a-08da211b1ffa
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+6IE9pkXIU+eAR2kSZmGkM49XZCJ17ZGJ/Qt8BSj/PvGOKvKIWywiq8+hqxwCYjBr5EDdt90E+Fst8TTDfow8bUheq0veEVwHnZ7SzS8T94clMB753Oo5Br/hO/8Y/zyT13GyW60a1mgRzBlRjk0fM9155vZ/y7Tx8HzdHQD/Gz0E8lEgoY//+4m12eTLcQcqCcH3x98a69oG1auXQPj3xUpppxJ/V9q46WlXUNB08NZGRuDR/YtuJuvR1c7gSe4AqB5ch95sCCEp2dLjQQYvAZt4Ct3LXubqju5NBzNeAJzVmFAb6VnWREzk0qLQt5/vIl0Mu9XHjr5JlA60mcLzXkS/hmR+YjDcWUfNDD7/igWHkNFfO2cYrdBeHX8QjhyVXBHZdOWtIlhoB1XkOKgAi279EVfdBYiDYRCByBCKl2FWTGmhI/TkS3SS9MXVstSK3Z8rVhrksYpM7KDQvJIqPlbd7yJt3KKCFSu88lhnvddSu7Pdns+l7V2vqQOYwaC8bboXtI0N5MrKcj6s4r7tfCp3ZfUfptQTGnrjJFL8f0a0EwGPfrJJ6tQRaknFcJRlwInq16VIVVyXrI2Ma9JzkmRCTj6sV5utz0UNm9W9E/VfWeiOQ2cFrYtXgspolvMJ6bGsvQLauHH0iDbfoY9Pg==
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(46966006)(44832011)(36756003)(8936002)(5660300002)(2616005)(450100002)(316002)(54906003)(110136005)(7696005)(6666004)(508600001)(70586007)(70206006)(2906002)(1076003)(86362001)(186003)(107886003)(426003)(26005)(47076005)(336012)(36860700001)(82310400005)(8676002)(4326008)(81166007)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2022 09:09:30.2637
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d5855dca-c0cc-4346-8026-08da211b2575
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5EUR03FT034.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3104

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
 xen/arch/x86/Kconfig              | 2 +-
 xen/arch/x86/include/asm/config.h | 1 -
 xen/common/Kconfig                | 3 +++
 xen/drivers/acpi/Kconfig          | 3 ++-
 xen/drivers/acpi/Makefile         | 2 +-
 5 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/xen/arch/x86/Kconfig b/xen/arch/x86/Kconfig
index 06d6fbc864..1e31edc99f 100644
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
@@ -26,7 +27,6 @@ config X86
 	select HAS_UBSAN
 	select HAS_VPCI if HVM
 	select NEEDS_LIBELF
-	select NUMA
 
 config ARCH_DEFCONFIG
 	string
diff --git a/xen/arch/x86/include/asm/config.h b/xen/arch/x86/include/asm/config.h
index de20642524..07bcd15831 100644
--- a/xen/arch/x86/include/asm/config.h
+++ b/xen/arch/x86/include/asm/config.h
@@ -31,7 +31,6 @@
 /* Intel P4 currently has largest cache line (L2 line size is 128 bytes). */
 #define CONFIG_X86_L1_CACHE_SHIFT 7
 
-#define CONFIG_ACPI_NUMA 1
 #define CONFIG_ACPI_SRAT 1
 #define CONFIG_ACPI_CSTATE 1
 
diff --git a/xen/common/Kconfig b/xen/common/Kconfig
index d921c74d61..d65add3fc6 100644
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
 
-- 
2.25.1


