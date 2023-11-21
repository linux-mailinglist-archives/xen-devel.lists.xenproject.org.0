Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B957F292C
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 10:46:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637608.993579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5NKF-0004km-S6; Tue, 21 Nov 2023 09:45:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637608.993579; Tue, 21 Nov 2023 09:45:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5NKF-0004hy-Ov; Tue, 21 Nov 2023 09:45:47 +0000
Received: by outflank-mailman (input) for mailman id 637608;
 Tue, 21 Nov 2023 09:45:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rqtY=HC=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1r5NKD-0004CN-TT
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 09:45:45 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060d.outbound.protection.outlook.com
 [2a01:111:f400:7eab::60d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bc620642-8852-11ee-9b0e-b553b5be7939;
 Tue, 21 Nov 2023 10:45:43 +0100 (CET)
Received: from BLAPR03CA0066.namprd03.prod.outlook.com (2603:10b6:208:329::11)
 by CY5PR12MB6573.namprd12.prod.outlook.com (2603:10b6:930:43::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.30; Tue, 21 Nov
 2023 09:45:39 +0000
Received: from MN1PEPF0000ECD8.namprd02.prod.outlook.com
 (2603:10b6:208:329:cafe::43) by BLAPR03CA0066.outlook.office365.com
 (2603:10b6:208:329::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27 via Frontend
 Transport; Tue, 21 Nov 2023 09:45:38 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000ECD8.mail.protection.outlook.com (10.167.242.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7025.12 via Frontend Transport; Tue, 21 Nov 2023 09:45:38 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.34; Tue, 21 Nov
 2023 03:45:37 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.34
 via Frontend Transport; Tue, 21 Nov 2023 03:45:36 -0600
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
X-Inumbo-ID: bc620642-8852-11ee-9b0e-b553b5be7939
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oFZsSNPkl1Kxpv75CybbHDRm3RLYKhnMsGTAcEFvUk0WfU/Fr8qB54ugtpjf916L4Ft2UcFxo2WtfI+9Q8EHTqlkQYvvk2fEOOf1Rb1sQkJOol+lXRkr2UuaOITEV5Ma6efvaqx3o1pgmgX2ArZlCitCIeESxvCBexYW9K6Fymnv4+bvbNX1+5KODyj57Q7y5SCYSNDeQPoFS6iSrqH8+MnRyOrc3DX4LgNqpmTOwkG9QtUvWLpQ+29emwWyrbSOxmiTqvAXiFIH1/J42pC90tXlZLKof6cIpU8HmyJtJvbSF9noujH1VbARJN6CTddmfwpGO8pEgURFi8ntYzjL4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UQB4kMys3NHsmr+0I1e6qowHc6xEtQRyK9lAZRDr8Go=;
 b=UF+35IGjIAt0AxDOYdmEv7tBOSV3Mu46O1OCznaOcc/1K0tw+EB3p8ppZNNAuAJhmcvEPbn2rFNccdhQyyYrhdfypyFS3W8y/hr2OHbh48TalcvYg8bJ159fpAmvtdN427YQfk09neOlPQiRQcS3kT0AD+qgD0yroIrs64BVbapBBlj0crEVwKMQ79UcvVzsfMUc5VU10IE3ncVZJprc+PacJWEZwVSzitUfVSndbQ/4EGx+HBhJR9ebKW4cPoIaRa1Ewsfn9EwNsTOgfnfStRgAwyHN6lvv2ofUSn8wdg4KWg4u0Eo3f0kNz/HGcEt5f8HCxHv7wgMlH9Jg7wp4EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UQB4kMys3NHsmr+0I1e6qowHc6xEtQRyK9lAZRDr8Go=;
 b=mwNwugPZ2eiMBae1mhS1F/mdDnW2Inl8VpYH/kbsruX4Q0dBB7cHqoyB1EiVH7TwLEDSOGkZgpJl/MwrOkccABRXGs4KLVb4esH9qqSc5NUo01sMCcNww851FGswiO9kOMrpqvCMZUaV+STZN5roYjO69SXqC2O7E7rL6aYKBfY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 2/3] xen/arm64: Move print_reg macro to asm/arm64/macros.h
Date: Tue, 21 Nov 2023 10:45:15 +0100
Message-ID: <20231121094516.24714-3-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231121094516.24714-1-michal.orzel@amd.com>
References: <20231121094516.24714-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD8:EE_|CY5PR12MB6573:EE_
X-MS-Office365-Filtering-Correlation-Id: dc33c694-241e-49db-7693-08dbea769e6d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	meXwaICaO/p/gVP8HBStiSRKhm5FpCLVmw8OJKihTTzE46EeXbPiQS5jr+Rq4RiAxAde6R/iVwJCMRP+Se1aGM/GWlhd7XMgkOnX/FO4a0I2MgtHfPOBNVTTNVQ05MnU+ATB9IH6N0xB1swgaO7A2qFqkD1xWvOBIIODJuAzaysUoO6rnFQPdjlNLp+BjVf1vhFl/QSDFdSPTQbyH15kTpYIbIwVmvHIh8EaN2R/GpGnwlfBGSa6joALDI6eHt9Q7Ep1A9aTtkXeuy4c8KIySTpPeMiIYa30SoH3ocJiGKd8V+WaFbEFIscMiwT4aidOS24m5jk8c/yYBCDsHFEn25vrXHqLYamxq9KTlz4zUYrvHbydD1DuXZzR04ZOv0UkUdJTVga1irtEq/WHWKoxDE301PVfD1pSvI1hmuX8o3jXxZh/xFldv/8yhQJ6NJ13d6BY6ENVn0nRLKiat80297AHrSTR8VeLZkEIwBU9Xi82t3zgWkL5OQgoYCEOhuoO7Vbbt5X9E2/3QIYLU7NQ68Lik61zlsCmz3Hpp8SE1aFRFC0ggWboStelWWGGnHU0gQz2yfJBvFssslm+6NwzlYnM+6ES2D+5cYq0E25FUJ3HQi5rV/9VMNk2MTRbdSbI7u+UIYUCHE76jd7eElioT2SerzHMJ48k8Mv+vU6F/Px24fGh+a5SoKfdZ+Cee/AWtE+aECd6nF4e/drWk5UVyIpq54ETNjL9GCg3Rst+7ALV52wE2L9lsau7yF2Wkv3malIiKF/ed4mAFG1XqS5gTA==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(396003)(376002)(136003)(230922051799003)(82310400011)(64100799003)(186009)(1800799012)(451199024)(46966006)(40470700004)(36840700001)(356005)(83380400001)(478600001)(81166007)(47076005)(36860700001)(2616005)(6666004)(1076003)(26005)(40480700001)(82740400003)(426003)(336012)(54906003)(6916009)(316002)(44832011)(70586007)(70206006)(86362001)(5660300002)(2906002)(41300700001)(8936002)(8676002)(40460700003)(4326008)(36756003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2023 09:45:38.7134
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc33c694-241e-49db-7693-08dbea769e6d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MN1PEPF0000ECD8.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6573

Macro print_reg is used to print a value of a register passed as an
argument. While today it is only used from within the common head.S,
in the future we might want to make use of it from other files, just
like PRINT(). It also serves as a great aid when debugging.

Expose print_reg macro by moving it to asm/arm64/macros.h and:
 - rename putn to asm_putn to denote the usage from assembly only,
 - use ENTRY() for asm_putn to make it globally visible,
 - get rid of unneeded stubs for early_puts, init_uart and putn since
   the calls to them are already protected by #ifdef CONFIG_EARLY_PRINTK.

This way the behavior will be consistent with what we already do on arm32.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
 xen/arch/arm/arm64/head.S               | 32 ++++---------------------
 xen/arch/arm/include/asm/arm64/macros.h | 15 ++++++++++++
 2 files changed, 19 insertions(+), 28 deletions(-)

diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
index b6111399e766..a3dbf81ab515 100644
--- a/xen/arch/arm/arm64/head.S
+++ b/xen/arch/arm/arm64/head.S
@@ -74,25 +74,6 @@
  *  x30 - lr
  */
 
- #ifdef CONFIG_EARLY_PRINTK
-/*
- * Macro to print the value of register \xb
- *
- * Clobbers x0 - x4
- */
-.macro print_reg xb
-        mov   x0, \xb
-        mov   x4, lr
-        bl    putn
-        mov   lr, x4
-.endm
-
-#else /* CONFIG_EARLY_PRINTK */
-.macro print_reg xb
-.endm
-
-#endif /* !CONFIG_EARLY_PRINTK */
-
 .section .text.header, "ax", %progbits
 /*.aarch64*/
 
@@ -493,11 +474,12 @@ ENDPROC(asm_puts)
 
 /*
  * Print a 64-bit number in hex.
+ * Note: This function must be called from assembly.
  * x0: Number to print.
  * x23: Early UART base address
  * Clobbers x0-x3
  */
-putn:
+ENTRY(asm_putn)
         adr_l x1, hex
         mov   x3, #16
 1:
@@ -510,17 +492,11 @@ putn:
         subs  x3, x3, #1
         b.ne  1b
         ret
-ENDPROC(putn)
+ENDPROC(asm_putn)
 
 RODATA_STR(hex, "0123456789abcdef")
 
-#else  /* CONFIG_EARLY_PRINTK */
-
-ENTRY(early_puts)
-init_uart:
-putn:   ret
-
-#endif /* !CONFIG_EARLY_PRINTK */
+#endif /* CONFIG_EARLY_PRINTK */
 
 /* This provides a C-API version of __lookup_processor_type
  * TODO: For now, the implementation return NULL every time
diff --git a/xen/arch/arm/include/asm/arm64/macros.h b/xen/arch/arm/include/asm/arm64/macros.h
index fb9a0602494d..d108dc3a3a71 100644
--- a/xen/arch/arm/include/asm/arm64/macros.h
+++ b/xen/arch/arm/include/asm/arm64/macros.h
@@ -45,9 +45,24 @@
         mov   lr, x3 ;     \
         RODATA_STR(98, _s)
 
+/*
+ * Macro to print the value of register \xb
+ *
+ * Clobbers x0 - x4
+ */
+.macro print_reg xb
+        mov   x0, \xb
+        mov   x4, lr
+        bl    asm_putn
+        mov   lr, x4
+.endm
+
 #else /* CONFIG_EARLY_PRINTK */
 #define PRINT(s)
 
+.macro print_reg xb
+.endm
+
 #endif /* !CONFIG_EARLY_PRINTK */
 
 /*
-- 
2.25.1


