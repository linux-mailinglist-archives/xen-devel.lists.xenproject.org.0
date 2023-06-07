Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 495AC725A60
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jun 2023 11:28:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544579.850486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6pSP-00005L-TD; Wed, 07 Jun 2023 09:27:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544579.850486; Wed, 07 Jun 2023 09:27:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6pSP-0008US-Pk; Wed, 07 Jun 2023 09:27:57 +0000
Received: by outflank-mailman (input) for mailman id 544579;
 Wed, 07 Jun 2023 09:27:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A2EA=B3=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1q6pSO-0007p9-77
 for xen-devel@lists.xenproject.org; Wed, 07 Jun 2023 09:27:56 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2060a.outbound.protection.outlook.com
 [2a01:111:f400:7ea9::60a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 93e5247f-0515-11ee-8611-37d641c3527e;
 Wed, 07 Jun 2023 11:27:54 +0200 (CEST)
Received: from BN0PR04CA0025.namprd04.prod.outlook.com (2603:10b6:408:ee::30)
 by MW5PR12MB5650.namprd12.prod.outlook.com (2603:10b6:303:19e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Wed, 7 Jun
 2023 09:27:50 +0000
Received: from BN8NAM11FT022.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ee:cafe::5d) by BN0PR04CA0025.outlook.office365.com
 (2603:10b6:408:ee::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.34 via Frontend
 Transport; Wed, 7 Jun 2023 09:27:49 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT022.mail.protection.outlook.com (10.13.176.112) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6477.24 via Frontend Transport; Wed, 7 Jun 2023 09:27:49 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 7 Jun
 2023 04:27:49 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Wed, 7 Jun 2023 04:27:48 -0500
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
X-Inumbo-ID: 93e5247f-0515-11ee-8611-37d641c3527e
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YL1h80F2FZ10lQdRJMkb80SDnRP+ig3NqBhwJ78E5Xr/+d/iZwz9DObxOHAXe9a6TjrtzwClfHfEXr/FVr/nL+jv86Os/Mg/2i+p4BQ43go7Klc2vZ9MWlUBL3G5IBsf4ddH/6J4B+rBKrbj0pNQ3sP6WfXWn+H4dcnjgmTZ4Q+I81niDvpcwj5TQB0vQwe3QQ/YQZW8QiOUKh/C9uKJ2an78efBel/aH0KlcgRaeaZ83ZacrCxlSZpsgMw5cewTVqvzt+JgtIXdfyprtSZchVAXrXyVJdf5+UMv2LluECXuuXzsQNKuvznfVKE+qtUxiHogqSP5XbMO74KVBgzX2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OTo7I0DVrCkuyNeXEOXOkuzsUeukIRgS1qykKhC9IWw=;
 b=ifVNbolO2CFVQTNc9XbfEe8Gf/0eljW3JJHvii1ws13WlpxPl5Yha+0Gc0EXCocl/um6YHJSuPBOtHfLdvSH2MvVVTDrTTdXmBstQBXr6R1dMckiaw7kdF7TXvtBV0CADt0WjUkBWhey6ryl1SIfxRhXi9uy4nN3le+YEjHyiCGtuJ8jqG++irAII+y0aJ4FRkkvtmYC02+At8tlUWn5/E832E8bVmk+u0PSfVTZSWBK78KaAG+R7Wj+epQsjV38CexbPOZOzTv4pFKrPZnCKxtcCzykxHIJFVqq4enwr/ewVHsNQtJ9aGURBhknvO+YToTiMGtcnaYWzvnNY7GC0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OTo7I0DVrCkuyNeXEOXOkuzsUeukIRgS1qykKhC9IWw=;
 b=qAPqpjJZCl30H2p+s16ogobwhluzSyyAQIPsRgGn+W0e9JHZXIjG0yM9tQSBx/NKfhousxAVCDMWNVOrT8EhNX3qTqO5xcn61BtJiS/Rg5ld0F/Xh85mQA2WQGZ+SlQsiDOOijrh9bp2DM35cKYyXvdHBSJzuvvU7edo5E1uJ6E=
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
Subject: [PATCH 2/4] xen/arm: debug-pl011: Add support for 32-bit only MMIO
Date: Wed, 7 Jun 2023 11:27:25 +0200
Message-ID: <20230607092727.19654-3-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230607092727.19654-1-michal.orzel@amd.com>
References: <20230607092727.19654-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT022:EE_|MW5PR12MB5650:EE_
X-MS-Office365-Filtering-Correlation-Id: 43246eb3-bf50-47af-8c8c-08db67397651
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	rJRNV4WpAVB5NkqfhR92+wX8QjUo92RVxyA9P3uUlJAC6I//pp9B4D0rvPleAC1a+XCPQnDzYUV4TJnd61hwjqSvCVap7OmbyewhScJFv1jbDMBOIeRg/m1v2HLFkP+e5OLc+SIGz7on/9Bu5CPn67azpY2BTWCHM9PowVEc46RB+bSORAlXd/h8qsvvJN2K4vKtHVHBg34FDBpjO4Ek3A0dgP2pHLX1B4ZBUX9I+42r7fNqfXCWecnuwx9SAyE0/isXXVeh2kbvMl0ZorZ/i8WuZx9iDAll1qK1fj+dzmynGQNyXWLejDMiWk+ZkiBle9XvMjtH6zngCS2SAp3Y7Io7xzlTkSiwln6ct7RSITeFE5ncpbHkT/ngqPkYMhmAT6T01BS7MdOQGleO/GvUMpzOJoR54zSrBAbMAOeMSAjtKtRbk3LzC93xzW6hP7mjuyTeFvl5YWCgkDs+ve9gJ+l061SES3dE+Kbu2gqp/KrDGvgn9AcfK2ULh+1Yf95vS/w7/ktrN+cHYkt71omXvZKxl3NTgRfZWRkbWrpzFxPyWw5L2OcHxAflWU23CmYAvSqY4qWjpjX3LoPwvgF8ojJTyeF/PZd8mgRxhR6zbkhREuHvrzp2oDk1kIyjRkOHSCG8XHMH0Czfo58qpE+UAIxj6Uw/jgTU8Yp4lZC3lIbzXsYD3J+ONv2S0P/+ckpJhJOCeR/kVzMpE5YXVZnA8s40TNrzmithwhiULbHgeX7nGRHW19AT4AMWTtsRXtPqlPdoFgntZOW394g9VvEq0Q==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(396003)(136003)(39860400002)(376002)(346002)(451199021)(40470700004)(36840700001)(46966006)(54906003)(40460700003)(478600001)(40480700001)(6916009)(44832011)(8936002)(8676002)(2906002)(36756003)(5660300002)(86362001)(82310400005)(4326008)(81166007)(70206006)(70586007)(356005)(316002)(82740400003)(2616005)(1076003)(41300700001)(26005)(47076005)(36860700001)(83380400001)(186003)(336012)(6666004)(426003)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 09:27:49.8441
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 43246eb3-bf50-47af-8c8c-08db67397651
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT022.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5650

There are implementations of PL011 that can only handle 32-bit accesses
as oppose to the normal behavior where accesses are 8/16-bit wide. This
is usually advertised by setting a dt property 'reg-io-width' to 4.

Introduce CONFIG_EARLY_UART_PL011_MMIO32 Kconfig option to be able to
enable the use of 32-bit only accessors in PL011 early printk code.
Define macros PL011_{STRH,STRB,LDRH} to distinguish accessors for normal
case from 32-bit MMIO one and use them in arm32/arm64 pl011 early printk
code.

Update documentation accordingly.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
I might want to align the indentation of operands but doing so in this patch
is rather no go as it would limit the visibility of the scope of this patch.
Something to do in the future.
---
 docs/misc/arm/early-printk.txt        |  3 +++
 xen/arch/arm/Kconfig.debug            |  7 +++++++
 xen/arch/arm/arm32/debug-pl011.inc    | 12 ++++++------
 xen/arch/arm/arm64/debug-pl011.inc    | 12 ++++++------
 xen/arch/arm/include/asm/pl011-uart.h | 19 +++++++++++++++++++
 5 files changed, 41 insertions(+), 12 deletions(-)

diff --git a/docs/misc/arm/early-printk.txt b/docs/misc/arm/early-printk.txt
index aa22826075a4..bc2d65aa2ea3 100644
--- a/docs/misc/arm/early-printk.txt
+++ b/docs/misc/arm/early-printk.txt
@@ -26,6 +26,9 @@ Other options depends on the driver selected:
       If CONFIG_EARLY_UART_PL011_BAUD_RATE  is set to 0 then the code will
       not try to initialize the UART, so that bootloader or firmware
       settings can be used for maximum compatibility.
+
+    - CONFIG_EARLY_UART_PL011_MMIO32 is, optionally, used to enable 32-bit
+      only accesses to registers.
   - scif
     - CONFIG_EARLY_UART_SCIF_VERSION_* is, optionally, the interface version
       of the UART. Default to version NONE.
diff --git a/xen/arch/arm/Kconfig.debug b/xen/arch/arm/Kconfig.debug
index 842d768280c4..eec860e88e0b 100644
--- a/xen/arch/arm/Kconfig.debug
+++ b/xen/arch/arm/Kconfig.debug
@@ -253,6 +253,13 @@ config EARLY_UART_PL011_BAUD_RATE
 	default 115200 if EARLY_PRINTK_FASTMODEL
 	default 0
 
+config EARLY_UART_PL011_MMIO32
+	bool "32-bit only MMIO for PL011 early printk"
+	depends on EARLY_UART_PL011
+	help
+	  If specified, all accesses to PL011 registers made from early printk code
+	  will be done using 32-bit only accessors.
+
 config EARLY_UART_INIT
 	depends on EARLY_UART_PL011 && EARLY_UART_PL011_BAUD_RATE != 0
 	def_bool y
diff --git a/xen/arch/arm/arm32/debug-pl011.inc b/xen/arch/arm/arm32/debug-pl011.inc
index 9fe0c2503831..5833da2a235c 100644
--- a/xen/arch/arm/arm32/debug-pl011.inc
+++ b/xen/arch/arm/arm32/debug-pl011.inc
@@ -26,13 +26,13 @@
  */
 .macro early_uart_init rb, rc, rd
         mov   \rc, #(7372800 / CONFIG_EARLY_UART_PL011_BAUD_RATE % 16)
-        strb  \rc, [\rb, #FBRD]     /* -> UARTFBRD (Baud divisor fraction) */
+        PL011_STRB  \rc, [\rb, #FBRD]  /* -> UARTFBRD (Baud divisor fraction) */
         mov   \rc, #(7372800 / CONFIG_EARLY_UART_PL011_BAUD_RATE / 16)
-        strh  \rc, [\rb, #IBRD]     /* -> UARTIBRD (Baud divisor integer) */
+        PL011_STRH  \rc, [\rb, #IBRD]  /* -> UARTIBRD (Baud divisor integer) */
         mov   \rc, #WLEN_8          /* 8n1 */
-        strb  \rc, [\rb, #LCR_H]     /* -> UARTLCR_H (Line control) */
+        PL011_STRB  \rc, [\rb, #LCR_H] /* -> UARTLCR_H (Line control) */
         ldr   \rc, =(RXE | TXE | UARTEN)      /* RXE | TXE | UARTEN */
-        strh  \rc, [\rb, #CR]     /* -> UARTCR (Control Register) */
+        PL011_STRH  \rc, [\rb, #CR]    /* -> UARTCR (Control Register) */
 .endm
 
 /*
@@ -42,7 +42,7 @@
  */
 .macro early_uart_ready rb, rc
 1:
-        ldrh  \rc, [\rb, #FR]       /* <- UARTFR (Flag register) */
+        PL011_LDRH  \rc, [\rb, #FR] /* <- UARTFR (Flag register) */
         tst   \rc, #BUSY             /* Check BUSY bit */
         bne   1b                    /* Wait for the UART to be ready */
 .endm
@@ -53,7 +53,7 @@
  * rt: register which contains the character to transmit
  */
 .macro early_uart_transmit rb, rt
-        strb  \rt, [\rb, #DR]            /* -> UARTDR (Data Register) */
+        PL011_STRB  \rt, [\rb, #DR]      /* -> UARTDR (Data Register) */
 .endm
 
 /*
diff --git a/xen/arch/arm/arm64/debug-pl011.inc b/xen/arch/arm/arm64/debug-pl011.inc
index df713eff4922..430594610b2c 100644
--- a/xen/arch/arm/arm64/debug-pl011.inc
+++ b/xen/arch/arm/arm64/debug-pl011.inc
@@ -25,13 +25,13 @@
  */
 .macro early_uart_init xb, c
         mov   x\c, #(7372800 / CONFIG_EARLY_UART_PL011_BAUD_RATE % 16)
-        strb  w\c, [\xb, #FBRD]      /* -> UARTFBRD (Baud divisor fraction) */
+        PL011_STRB  w\c, [\xb, #FBRD]  /* -> UARTFBRD (Baud divisor fraction) */
         mov   x\c, #(7372800 / CONFIG_EARLY_UART_PL011_BAUD_RATE / 16)
-        strh  w\c, [\xb, #IBRD]      /* -> UARTIBRD (Baud divisor integer) */
+        PL011_STRH  w\c, [\xb, #IBRD]  /* -> UARTIBRD (Baud divisor integer) */
         mov   x\c, #WLEN_8           /* 8n1 */
-        strb  w\c, [\xb, #LCR_H]     /* -> UARTLCR_H (Line control) */
+        PL011_STRB  w\c, [\xb, #LCR_H] /* -> UARTLCR_H (Line control) */
         ldr   x\c, =(RXE | TXE | UARTEN)
-        strh  w\c, [\xb, #CR]        /* -> UARTCR (Control Register) */
+        PL011_STRH  w\c, [\xb, #CR]    /* -> UARTCR (Control Register) */
 .endm
 
 /*
@@ -41,7 +41,7 @@
  */
 .macro early_uart_ready xb, c
 1:
-        ldrh  w\c, [\xb, #FR]        /* <- UARTFR (Flag register) */
+        PL011_LDRH  w\c, [\xb, #FR]  /* <- UARTFR (Flag register) */
         tst   w\c, #BUSY             /* Check BUSY bit */
         b.ne  1b                     /* Wait for the UART to be ready */
 .endm
@@ -52,7 +52,7 @@
  * wt: register which contains the character to transmit
  */
 .macro early_uart_transmit xb, wt
-        strb  \wt, [\xb, #DR]        /* -> UARTDR (Data Register) */
+        PL011_STRB  \wt, [\xb, #DR]  /* -> UARTDR (Data Register) */
 .endm
 
 /*
diff --git a/xen/arch/arm/include/asm/pl011-uart.h b/xen/arch/arm/include/asm/pl011-uart.h
index 5bb563ec0814..27c9bfa444cb 100644
--- a/xen/arch/arm/include/asm/pl011-uart.h
+++ b/xen/arch/arm/include/asm/pl011-uart.h
@@ -21,6 +21,25 @@
 #ifndef __ASM_ARM_PL011_H
 #define __ASM_ARM_PL011_H
 
+#ifdef __ASSEMBLY__
+
+/*
+ * PL011 registers are 8/16-bit wide. However, there are implementations that
+ * can only handle 32-bit accesses. The following macros used in early printk
+ * are defined to distinguish accessors for normal case from 32-bit MMIO one.
+ */
+#ifdef CONFIG_EARLY_UART_PL011_MMIO32
+#define PL011_STRH str
+#define PL011_STRB str
+#define PL011_LDRH ldr
+#else
+#define PL011_STRH strh
+#define PL011_STRB strb
+#define PL011_LDRH ldrh
+#endif
+
+#endif /* __ASSEMBLY__ */
+
 /* PL011 register addresses */
 #define DR     (0x00)
 #define RSR    (0x04)
-- 
2.25.1


