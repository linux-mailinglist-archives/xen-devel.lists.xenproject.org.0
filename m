Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20470663BE7
	for <lists+xen-devel@lfdr.de>; Tue, 10 Jan 2023 09:54:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.474437.735656 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFAOl-0007gW-AL; Tue, 10 Jan 2023 08:54:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 474437.735656; Tue, 10 Jan 2023 08:54:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pFAOl-0007cl-17; Tue, 10 Jan 2023 08:54:23 +0000
Received: by outflank-mailman (input) for mailman id 474437;
 Tue, 10 Jan 2023 08:54:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K1Mu=5H=arm.com=Wei.Chen@srs-se1.protection.inumbo.net>)
 id 1pFAOj-0005oC-LX
 for xen-devel@lists.xenproject.org; Tue, 10 Jan 2023 08:54:21 +0000
Received: from EUR02-AM0-obe.outbound.protection.outlook.com
 (mail-am0eur02on2040.outbound.protection.outlook.com [40.107.247.40])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5e93e1ff-90c4-11ed-b8d0-410ff93cb8f0;
 Tue, 10 Jan 2023 09:54:19 +0100 (CET)
Received: from AS9PR0301CA0045.eurprd03.prod.outlook.com
 (2603:10a6:20b:469::13) by AS4PR08MB7783.eurprd08.prod.outlook.com
 (2603:10a6:20b:517::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 08:54:08 +0000
Received: from AM7EUR03FT005.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:469:cafe::5) by AS9PR0301CA0045.outlook.office365.com
 (2603:10a6:20b:469::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18 via Frontend
 Transport; Tue, 10 Jan 2023 08:54:07 +0000
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT005.mail.protection.outlook.com (100.127.140.218) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.18 via Frontend Transport; Tue, 10 Jan 2023 08:54:07 +0000
Received: ("Tessian outbound 8038f0863a52:v132");
 Tue, 10 Jan 2023 08:54:07 +0000
Received: from 506abfabed72.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 67DB3E74-75F4-498C-8913-675EE63F1492.1; 
 Tue, 10 Jan 2023 08:54:00 +0000
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 506abfabed72.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Tue, 10 Jan 2023 08:54:00 +0000
Received: from FR3P281CA0049.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:4a::22)
 by AS2PR08MB9570.eurprd08.prod.outlook.com (2603:10a6:20b:60a::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Tue, 10 Jan
 2023 08:53:54 +0000
Received: from VI1EUR03FT035.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:d10:4a:cafe::56) by FR3P281CA0049.outlook.office365.com
 (2603:10a6:d10:4a::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.11 via Frontend
 Transport; Tue, 10 Jan 2023 08:53:54 +0000
Received: from nebula.arm.com (40.67.248.234) by
 VI1EUR03FT035.mail.protection.outlook.com (100.127.145.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5986.18 via Frontend Transport; Tue, 10 Jan 2023 08:53:54 +0000
Received: from AZ-NEU-EX04.Arm.com (10.251.24.32) by AZ-NEU-EX04.Arm.com
 (10.251.24.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16; Tue, 10 Jan
 2023 08:53:52 +0000
Received: from ais-wip-ds.shanghai.arm.com (10.169.190.86) by mail.arm.com
 (10.251.24.32) with Microsoft SMTP Server id 15.1.2507.16 via Frontend
 Transport; Tue, 10 Jan 2023 08:53:49 +0000
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
X-Inumbo-ID: 5e93e1ff-90c4-11ed-b8d0-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3aUeRUGBRNGaCgpSKVEFEGKe8AB9JhLLaUj+oRdym0E=;
 b=PAO6IshgIncgfGpUvO35veBmTVm6f6P1LLu6onpE7NfrSnPDrdh+lQhwumbTJXEwfS3wzlZxUsykqlflANNOZD8wxn65JCFb84NiA4pfsxNM9TqL3HATUHEMnCwMJyqLTmc25KpLynD+f0ueIKiG9lISXLRuBHFav4JONxcExeQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2bad1a70c48d8a12
X-CR-MTA-TID: 64aa7808
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V/lx093Rgg1VIfShjwQq1ohzRNs9oSNa+HDWmUcxAfm7vDJVR4R59yQiHZZwWQ4H2fQEjrLcxvcBKUUgdFtzDpaBYOMfN3rnQmfnjR7YA5Ih2lAmEpBncAyPWV75eB0LlEL+dhuosJD9kDHDB3NT8+uJH5Nj6EJtG3yQcu9efP5fLq3Xn/Ky9woedVIuh5WvZkTDim0CkWT0Ni3kJYY/E4fbuOOIC6CXMmzHA51olccHyqira4+ht4+alRSRiYDmgzVAAwHYATv8T6P/dynmv8iMcsdEIToBNlvkZpdYLRFmtWu2TOkVcIXD6GQd4MDuiQRN/h7rJN/O3RFmo7A6jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3aUeRUGBRNGaCgpSKVEFEGKe8AB9JhLLaUj+oRdym0E=;
 b=Yie0lS5hpUE7rzC0dKy8sIdh25NRAb60PPW+2f9IXL36IBGKfeU4QxUSP+wSoxcYvr2BpJa4Mly/q/J9kniMoSkADxOAMqTxkX5hQmkencgKhKVvz9DiEmwQTd5q9cxXW4q4qqPISRIeLVxWxEtIIuLmDTouY1uE97JieeUkI/baOnQ+d3v7wRVeyp76uLL04LJ/WzftFpwfgvLzDHVDzzDVX+QyZTceZY3ige9d++ZfQa3nmIMNrgbp5XagIEGnbvF5DYmLLY29td/0Nekd2sDWKxnXf4M4rwmY7T5jpSNhT8yX2DAyCh9X2HmeeRMJh0NxyWiGoRpEfRRuPqejlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 40.67.248.234) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3aUeRUGBRNGaCgpSKVEFEGKe8AB9JhLLaUj+oRdym0E=;
 b=PAO6IshgIncgfGpUvO35veBmTVm6f6P1LLu6onpE7NfrSnPDrdh+lQhwumbTJXEwfS3wzlZxUsykqlflANNOZD8wxn65JCFb84NiA4pfsxNM9TqL3HATUHEMnCwMJyqLTmc25KpLynD+f0ueIKiG9lISXLRuBHFav4JONxcExeQ=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 40.67.248.234)
 smtp.mailfrom=arm.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 40.67.248.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=40.67.248.234; helo=nebula.arm.com; pr=C
From: Wei Chen <wei.chen@arm.com>
To: <xen-devel@lists.xenproject.org>
CC: <nd@arm.com>, Wei Chen <wei.chen@arm.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap
	<george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, Wei Liu
	<wl@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 03/17] xen/arm: implement node distance helpers for Arm
Date: Tue, 10 Jan 2023 16:49:16 +0800
Message-ID: <20230110084930.1095203-4-wei.chen@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230110084930.1095203-1-wei.chen@arm.com>
References: <20230110084930.1095203-1-wei.chen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 1
X-MS-TrafficTypeDiagnostic:
	VI1EUR03FT035:EE_|AS2PR08MB9570:EE_|AM7EUR03FT005:EE_|AS4PR08MB7783:EE_
X-MS-Office365-Filtering-Correlation-Id: d6ff6283-0e07-422c-adb8-08daf2e83bc8
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:
 hbjNgsCSK8+bVz4REmlbUM3es/jUHi81a7rooPo68FJU8b4Z6G5bBfPCxPZvJ97ZKjHpzFXi3nSejLOfCRO4ac0GVMdonoHFJCtH4GaG8gPHdtPWOqyMGr9f4ecTTc2bHCU8EOsEmOAla56E5dhE8CuJI6LvAjLqPJ+zOW/Q2lhA0oXOTxkM/iWa7W6FJG/6MExdzZmRR02CCTQrQtjzxiiZi0NDD4R16nK4ypkVx7MUtHcwkPTN2x4JSDry63ATDcUKzwMrnrk36ByKA3oz9YFmMQzletrmwwtTQpgdX+6DHbc6eqZEGNOjrvpraDgAEV1j7XdCyD7y6VhtHwjA7P5snhl74qbdP/BHQJht6VATcISOE1qscMdH6DbkgHceXnfhw4F0c/kE9/HJVWUr+BUZMZnVBBCdbjvmHxRrPwCU5xl5KLE5zQj4kC/swUHFUpUJd6d214GxLqvgPx4UpQfd3MbwI+hwfMeL7pFHqriqFWxMIuGJOCM/jz0xqB0k8yqxc2zs49hfItZdsUCGZ+tDlJ9GfL9M5AZOfKkqlZeHHAG0mnCJyQ2idVgF0e+9PLFI1F8wGB+JYhWT6MlOV231G5tZQ/ExnXfzZ+relYMme9Ph6YD5vUcVAPAFgvc3lHho0e7dYVAMUsCJ8qjwh3feahAHQJ7Vcj+e9cd7+GDZjQP7QPvVQrsaSj/NguCGH1XRSLBOvfuIdSrS4OSWo/E+P3K8plxMzsKapolStjY=
X-Forefront-Antispam-Report-Untrusted:
 CIP:40.67.248.234;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:nebula.arm.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(346002)(136003)(396003)(451199015)(36840700001)(46966006)(83380400001)(36860700001)(86362001)(356005)(2906002)(4326008)(82740400003)(81166007)(44832011)(8676002)(5660300002)(70586007)(8936002)(70206006)(426003)(40480700001)(41300700001)(82310400005)(186003)(26005)(336012)(2616005)(47076005)(1076003)(7696005)(316002)(6916009)(478600001)(54906003)(6666004)(36756003)(2004002)(36900700001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9570
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AM7EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	cf03f6e2-3636-4159-bfff-08daf2e833c9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	VW7TrlGt2fVdKZarcjmXloyKk/QCj/J9JvtDmZ2/okup7iEfY7akz2qC0DmF6+RdD1RP54n0c7gqawZrFgSyyIvma6H58oRx0CmsWUzDh+tBVXudK7b67xIshwAaYlM64qeSPf2vVuyGfJGLgBB2yyZLr+ODA4wKYjK2M+mxiArJ7ojWiCjCTUme9A6tdFi/oftRuALDNED2osE9ZD+3QPAjjG9pubjl2lTkYC7MYiOp2l126iQ08W/RET4t5qNFes2N3MC97nSOG1pUNkQJgY96Wlg4A9DajdCILzC0a8LnMepQGUdj8xcQLJC5NfsWK2m+TiM3ey6Udr2iBlMlYVe1qUuHDB18AzIhUz82AI4b6Gl6seEDe39ifLkdxmoenGLMGKnraUb+Ssh4WDDmYbbxgm6Jw7/SZfNuoxbDIDfylfkSx90CHf/Jxfrclv9QPcDNJzmvCVfAHWtzlholCRuI72RT4pPIhUFz2R/r8fCu41dyyFWTgvF6+ZKBMGJcM0zRxKtuDtFGjghhzOMOtKccss0MWnud/PGtagX6BOpAL7gaHp+sk2WYHvjsRID2v+RorESu5UM55BglGnqAwdFtcnTJIv2weQA7MYezHeTCbjxV4U6etP1tGZP4i16HSacuuU8VjDznsoHR8JjGzASKedseA/o6QvmezuDY0blGpp+0deKC8v40iIxM/l7YfAPltgYowYr0OSb5omfLmyMUKiOz66JfAtT02PfjnHs=
X-Forefront-Antispam-Report:
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(396003)(136003)(376002)(451199015)(36840700001)(40470700004)(46966006)(40480700001)(36756003)(86362001)(40460700003)(316002)(7696005)(54906003)(6916009)(478600001)(6666004)(5660300002)(2906002)(44832011)(70586007)(107886003)(70206006)(8676002)(4326008)(41300700001)(36860700001)(83380400001)(82740400003)(2616005)(81166007)(26005)(8936002)(1076003)(186003)(47076005)(426003)(336012)(82310400005)(2004002);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2023 08:54:07.5219
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6ff6283-0e07-422c-adb8-08daf2e83bc8
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7EUR03FT005.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR08MB7783

We will parse NUMA nodes distances from device tree. So we need
a matrix to record the distances between any two nodes we parsed.
Accordingly, we provide this node_set_distance API for device tree
NUMA to set the distance for any two nodes in this patch. When
NUMA initialization failed, __node_distance will return
NUMA_REMOTE_DISTANCE, this will help us avoid doing rollback
for distance maxtrix when NUMA initialization failed.

As both x86 and Arm have implemented __node_distance, so we move
its definition from asm/numa.h to xen/numa.h. At same time, the
outdated u8 return value of x86 has been changed to unsigned char.

Signed-off-by: Wei Chen <wei.chen@arm.com>
---
v1 -> v2:
1. Use unsigned int/char instead of uint32_t/u8.
2. Re-org the commit message.
---
 xen/arch/arm/Makefile           |  1 +
 xen/arch/arm/include/asm/numa.h | 14 +++++++++
 xen/arch/arm/numa.c             | 52 ++++++++++++++++++++++++++++++++-
 xen/arch/x86/include/asm/numa.h |  1 -
 xen/arch/x86/srat.c             |  2 +-
 xen/include/xen/numa.h          |  1 +
 6 files changed, 68 insertions(+), 3 deletions(-)

diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 4d076b278b..9073398d6e 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -38,6 +38,7 @@ obj-$(CONFIG_LIVEPATCH) += livepatch.o
 obj-y += mem_access.o
 obj-y += mm.o
 obj-y += monitor.o
+obj-$(CONFIG_NUMA) += numa.o
 obj-y += p2m.o
 obj-y += percpu.o
 obj-y += platform.o
diff --git a/xen/arch/arm/include/asm/numa.h b/xen/arch/arm/include/asm/numa.h
index 52ca414e47..dbdb632711 100644
--- a/xen/arch/arm/include/asm/numa.h
+++ b/xen/arch/arm/include/asm/numa.h
@@ -28,6 +28,20 @@ enum dt_numa_status {
     DT_NUMA_OFF,
 };
 
+/*
+ * In ACPI spec, 0-9 are the reserved values for node distance,
+ * 10 indicates local node distance, 20 indicates remote node
+ * distance. Set node distance map in device tree will follow
+ * the ACPI's definition.
+ */
+#define NUMA_DISTANCE_UDF_MIN   0
+#define NUMA_DISTANCE_UDF_MAX   9
+#define NUMA_LOCAL_DISTANCE     10
+#define NUMA_REMOTE_DISTANCE    20
+
+extern void numa_set_distance(nodeid_t from, nodeid_t to,
+                              unsigned int distance);
+
 #else
 
 /* Fake one node for now. See also node_online_map. */
diff --git a/xen/arch/arm/numa.c b/xen/arch/arm/numa.c
index 1c02b6a25d..34851ceacf 100644
--- a/xen/arch/arm/numa.c
+++ b/xen/arch/arm/numa.c
@@ -2,7 +2,7 @@
 /*
  * Arm Architecture support layer for NUMA.
  *
- * Copyright (C) 2021 Arm Ltd
+ * Copyright (C) 2022 Arm Ltd
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
@@ -22,6 +22,11 @@
 
 static enum dt_numa_status __read_mostly device_tree_numa;
 
+static unsigned char __read_mostly
+node_distance_map[MAX_NUMNODES][MAX_NUMNODES] = {
+    { 0 }
+};
+
 void __init numa_fw_bad(void)
 {
     printk(KERN_ERR "NUMA: device tree numa info table not used.\n");
@@ -42,3 +47,48 @@ int __init arch_numa_setup(const char *opt)
 {
     return -EINVAL;
 }
+
+void __init numa_set_distance(nodeid_t from, nodeid_t to,
+                              unsigned int distance)
+{
+    if ( from >= MAX_NUMNODES || to >= MAX_NUMNODES )
+    {
+        printk(KERN_WARNING
+               "NUMA: invalid nodes: from=%"PRIu8" to=%"PRIu8" MAX=%"PRIu8"\n",
+               from, to, MAX_NUMNODES);
+        return;
+    }
+
+    /* NUMA defines 0xff as an unreachable node and 0-9 are undefined */
+    if ( distance >= NUMA_NO_DISTANCE ||
+        (distance >= NUMA_DISTANCE_UDF_MIN &&
+         distance <= NUMA_DISTANCE_UDF_MAX) ||
+        (from == to && distance != NUMA_LOCAL_DISTANCE) )
+    {
+        printk(KERN_WARNING
+               "NUMA: invalid distance: from=%"PRIu8" to=%"PRIu8" distance=%"PRIu32"\n",
+               from, to, distance);
+        return;
+    }
+
+    node_distance_map[from][to] = distance;
+}
+
+unsigned char __node_distance(nodeid_t from, nodeid_t to)
+{
+    /* When NUMA is off, any distance will be treated as remote. */
+    if ( numa_disabled() )
+        return NUMA_REMOTE_DISTANCE;
+
+    /*
+     * Check whether the nodes are in the matrix range.
+     * When any node is out of range, except from and to nodes are the
+     * same, we treat them as unreachable (return 0xFF)
+     */
+    if ( from >= MAX_NUMNODES || to >= MAX_NUMNODES )
+        return from == to ? NUMA_LOCAL_DISTANCE : NUMA_NO_DISTANCE;
+
+    return node_distance_map[from][to];
+}
+
+EXPORT_SYMBOL(__node_distance);
diff --git a/xen/arch/x86/include/asm/numa.h b/xen/arch/x86/include/asm/numa.h
index 61efe60a95..18b71ddfef 100644
--- a/xen/arch/x86/include/asm/numa.h
+++ b/xen/arch/x86/include/asm/numa.h
@@ -21,7 +21,6 @@ extern void init_cpu_to_node(void);
 #define arch_want_default_dmazone() (num_online_nodes() > 1)
 
 void srat_parse_regions(paddr_t addr);
-extern u8 __node_distance(nodeid_t a, nodeid_t b);
 unsigned int arch_get_dma_bitsize(void);
 
 #endif
diff --git a/xen/arch/x86/srat.c b/xen/arch/x86/srat.c
index 56749ddca5..50faf5d352 100644
--- a/xen/arch/x86/srat.c
+++ b/xen/arch/x86/srat.c
@@ -328,7 +328,7 @@ unsigned int numa_node_to_arch_nid(nodeid_t n)
 	return 0;
 }
 
-u8 __node_distance(nodeid_t a, nodeid_t b)
+unsigned char __node_distance(nodeid_t a, nodeid_t b)
 {
 	unsigned index;
 	u8 slit_val;
diff --git a/xen/include/xen/numa.h b/xen/include/xen/numa.h
index 7d7aeb3a3c..cff4fb8ccc 100644
--- a/xen/include/xen/numa.h
+++ b/xen/include/xen/numa.h
@@ -115,6 +115,7 @@ extern bool numa_memblks_available(void);
 extern bool numa_update_node_memblks(nodeid_t node, unsigned int arch_nid,
                                      paddr_t start, paddr_t size, bool hotplug);
 extern void numa_set_processor_nodes_parsed(nodeid_t node);
+extern unsigned char __node_distance(nodeid_t a, nodeid_t b);
 
 #else
 
-- 
2.25.1


