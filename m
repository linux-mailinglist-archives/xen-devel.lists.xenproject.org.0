Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 513EC725A62
	for <lists+xen-devel@lfdr.de>; Wed,  7 Jun 2023 11:28:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.544578.850476 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6pSO-0008G5-JT; Wed, 07 Jun 2023 09:27:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 544578.850476; Wed, 07 Jun 2023 09:27:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q6pSO-0008D8-GI; Wed, 07 Jun 2023 09:27:56 +0000
Received: by outflank-mailman (input) for mailman id 544578;
 Wed, 07 Jun 2023 09:27:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A2EA=B3=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1q6pSM-00089h-Vy
 for xen-devel@lists.xenproject.org; Wed, 07 Jun 2023 09:27:54 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060b.outbound.protection.outlook.com
 [2a01:111:f400:7eab::60b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 93395952-0515-11ee-b232-6b7b168915f2;
 Wed, 07 Jun 2023 11:27:53 +0200 (CEST)
Received: from BN0PR04CA0025.namprd04.prod.outlook.com (2603:10b6:408:ee::30)
 by SA1PR12MB8095.namprd12.prod.outlook.com (2603:10b6:806:33f::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Wed, 7 Jun
 2023 09:27:49 +0000
Received: from BN8NAM11FT022.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ee:cafe::f2) by BN0PR04CA0025.outlook.office365.com
 (2603:10b6:408:ee::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.34 via Frontend
 Transport; Wed, 7 Jun 2023 09:27:48 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT022.mail.protection.outlook.com (10.13.176.112) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6477.24 via Frontend Transport; Wed, 7 Jun 2023 09:27:48 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Wed, 7 Jun
 2023 04:27:32 -0500
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Wed, 7 Jun 2023 04:27:30 -0500
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
X-Inumbo-ID: 93395952-0515-11ee-b232-6b7b168915f2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cFjCnFMc2lmarIabjWLZCCEtgMmEZDrR9qFFfvT02sgpxU9Z8qQ7Od3/z4n9hej60RhlB6PwBGX6gIYOVcLoslz7JVNWBO0lKiXsKMFRtsPgL6nAz59fSJlWaLDVAbOorzyebu1Q3Uk7wSogvplJD1zNRb/Ui0G+Id8dW4RC+0XgTUSxyZCFoKOg3Yc2OsivyAnckDwvnKBP/61tLrhTWknZ+tx1dI0dAlZsjx4FESrpgsEVQbdbzhwZ9crEjm+0dggREoTJsE5m/87jMA5vq9sXid7F4mp4KW/v2hORU3BDlKr7wpTfgJimBIYKspsycQqfumOMOVaSWK39wU+dyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R98uFfHZVa1myY/azuIH4bMaUuCmPRTnAIKrAgYKBu4=;
 b=Y7RKgMKzVoBnqA9pchorKI2jcr5iMyTGiL/W95AQXTEF6PTPhTFdx2csr5okXNW5xnOcucvHekclhTUlV+/UVIEYI8EpgvBQ9DYbL+MBubcwaGjYccguqIAYfDVOPwbAXjzUp4b2F2WWgYrRNBThjAOdhg/6xwZXB50R8Mj4chfUPdDsIyS6nFAfJB8nR1Z0wUCGPFqH3Zry1ihcon5mmqEEt84HP6ZSq1gt/ICvDSRUHkwtj4ERG0qpPlRIK9YuzR/IsmNLL6W7+uq0gPh9RaUOh1c9w9kE2JNdalWuQyAWBvnhJRZaQNCZL0ARjHXDTYoHaZMNrKJmua++SUoPRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R98uFfHZVa1myY/azuIH4bMaUuCmPRTnAIKrAgYKBu4=;
 b=QCTzPS+ZsgDM3eYLpD4EG+LBHsmmVQNCHkFc1axLasf1uVcWolwlPTjufMSVxMXoe/himnjhFMMrVTHgddQSXI8ZebLfIioh9X5CEYaS3hPA0wgG93pdtgKUJyu/VsCcyYifGpc3hppAGdbhEaMuN8QJ0DuCb+bJIrJuc9YM51g=
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
Subject: [PATCH 1/4] xen/arm: debug-pl011: Use correct accessors
Date: Wed, 7 Jun 2023 11:27:24 +0200
Message-ID: <20230607092727.19654-2-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230607092727.19654-1-michal.orzel@amd.com>
References: <20230607092727.19654-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT022:EE_|SA1PR12MB8095:EE_
X-MS-Office365-Filtering-Correlation-Id: e18bc765-03f6-46c2-c383-08db67397560
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	+y5v0KUXBn5ltYOvS/9qKff63wB9TRruezPas+CVmrXNl2FR/I2C3Q5W5ssiMPUGWJ0El2n6nWESFhkqbAW4whZmFZjr9htGkvmLd8UEJOHCZKawiZMeMEXNN0dteQzDXIxftmO3jg9HXOBHCQJr8AvjzhRAalI8auVyOWV4AmDWaHh1uMfWo9aT2zET39tKiH1POELaFG23gmwv1ljIDOD3WwIgopaBeCISIBkmDE5IBDTojRVzJL1qtlwPhOYQRr1eLpwyojwjkhywLjvldVbOsA4BJnJYs3E9NHSUPururEJrSAUMU62oSzPiE8HbIKz6KTYJJvNDO0+bawEQjveIegjL+sQD2tBrv8TVskiuy0eV617LcG/e7J5jRVmG+Kg7MWX5SjtdFWJESwe7nwIKEnQ/H44AZXT2yXFUSwZiLbskYdExr5IGMKAFsnVyjXYTbVu9dHin528gkZu6g0MoYR3iLiay251xTVWa3SFBdJ17fHO9U13btGn+CkjjyAcywh08fSPA/M4YytZGkyUNeySWQ+2c2f+IeFO0/ZBx3SBjxv4PfupGh11A6MH0Q0UtuJvY7XMSaNRz3DMvCwGZ4ta71MPogX16sJjAXWhMYLk9p2AS591UmEdkv21WURXAs251ftYVtUv+QloiqXmSE/YyFaEuJ6ByWgIN+RRWywLIuYHzTIAQExKz/Ux4Edsf0X+pvr4VYJucsSA9HNvuoeNzrB51XocEPy2idRHb+lbNf86ZDWRGyAbVjOd1Ea31/Og5qjbOxPE2QHC7Ag==
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(376002)(396003)(136003)(451199021)(40470700004)(36840700001)(46966006)(83380400001)(40460700003)(47076005)(336012)(426003)(2906002)(2616005)(36756003)(86362001)(82310400005)(356005)(81166007)(82740400003)(36860700001)(40480700001)(41300700001)(316002)(6666004)(5660300002)(8936002)(8676002)(478600001)(54906003)(6916009)(70586007)(70206006)(4326008)(26005)(1076003)(186003)(44832011)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 09:27:48.2661
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e18bc765-03f6-46c2-c383-08db67397560
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT022.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8095

Although most PL011 UARTs can cope with 32-bit accesses, some of the old
legacy ones might not. PL011 registers are 8/16-bit wide and this shall
be perceived as the normal behavior.

Modify early printk pl011 code for arm32/arm64 to use the correct
accessors depending on the register size (refer ARM DDI 0183G, Table 3.1).

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
---
Next patch will override strX,ldrX with macros but I prefer to keep the
history clean (+ possibiltity for a backport if needed).
---
 xen/arch/arm/arm32/debug-pl011.inc | 12 ++++++------
 xen/arch/arm/arm64/debug-pl011.inc |  6 +++---
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/xen/arch/arm/arm32/debug-pl011.inc b/xen/arch/arm/arm32/debug-pl011.inc
index c527f1d4424d..9fe0c2503831 100644
--- a/xen/arch/arm/arm32/debug-pl011.inc
+++ b/xen/arch/arm/arm32/debug-pl011.inc
@@ -26,13 +26,13 @@
  */
 .macro early_uart_init rb, rc, rd
         mov   \rc, #(7372800 / CONFIG_EARLY_UART_PL011_BAUD_RATE % 16)
-        str   \rc, [\rb, #FBRD]     /* -> UARTFBRD (Baud divisor fraction) */
+        strb  \rc, [\rb, #FBRD]     /* -> UARTFBRD (Baud divisor fraction) */
         mov   \rc, #(7372800 / CONFIG_EARLY_UART_PL011_BAUD_RATE / 16)
-        str   \rc, [\rb, #IBRD]     /* -> UARTIBRD (Baud divisor integer) */
+        strh  \rc, [\rb, #IBRD]     /* -> UARTIBRD (Baud divisor integer) */
         mov   \rc, #WLEN_8          /* 8n1 */
-        str   \rc, [\rb, #LCR_H]     /* -> UARTLCR_H (Line control) */
+        strb  \rc, [\rb, #LCR_H]     /* -> UARTLCR_H (Line control) */
         ldr   \rc, =(RXE | TXE | UARTEN)      /* RXE | TXE | UARTEN */
-        str   \rc, [\rb, #CR]     /* -> UARTCR (Control Register) */
+        strh  \rc, [\rb, #CR]     /* -> UARTCR (Control Register) */
 .endm
 
 /*
@@ -42,7 +42,7 @@
  */
 .macro early_uart_ready rb, rc
 1:
-        ldr   \rc, [\rb, #FR]       /* <- UARTFR (Flag register) */
+        ldrh  \rc, [\rb, #FR]       /* <- UARTFR (Flag register) */
         tst   \rc, #BUSY             /* Check BUSY bit */
         bne   1b                    /* Wait for the UART to be ready */
 .endm
@@ -53,7 +53,7 @@
  * rt: register which contains the character to transmit
  */
 .macro early_uart_transmit rb, rt
-        str   \rt, [\rb, #DR]            /* -> UARTDR (Data Register) */
+        strb  \rt, [\rb, #DR]            /* -> UARTDR (Data Register) */
 .endm
 
 /*
diff --git a/xen/arch/arm/arm64/debug-pl011.inc b/xen/arch/arm/arm64/debug-pl011.inc
index 6d60e78c8ba3..df713eff4922 100644
--- a/xen/arch/arm/arm64/debug-pl011.inc
+++ b/xen/arch/arm/arm64/debug-pl011.inc
@@ -25,13 +25,13 @@
  */
 .macro early_uart_init xb, c
         mov   x\c, #(7372800 / CONFIG_EARLY_UART_PL011_BAUD_RATE % 16)
-        strh  w\c, [\xb, #FBRD]      /* -> UARTFBRD (Baud divisor fraction) */
+        strb  w\c, [\xb, #FBRD]      /* -> UARTFBRD (Baud divisor fraction) */
         mov   x\c, #(7372800 / CONFIG_EARLY_UART_PL011_BAUD_RATE / 16)
         strh  w\c, [\xb, #IBRD]      /* -> UARTIBRD (Baud divisor integer) */
         mov   x\c, #WLEN_8           /* 8n1 */
-        str   w\c, [\xb, #LCR_H]     /* -> UARTLCR_H (Line control) */
+        strb  w\c, [\xb, #LCR_H]     /* -> UARTLCR_H (Line control) */
         ldr   x\c, =(RXE | TXE | UARTEN)
-        str   w\c, [\xb, #CR]        /* -> UARTCR (Control Register) */
+        strh  w\c, [\xb, #CR]        /* -> UARTCR (Control Register) */
 .endm
 
 /*
-- 
2.25.1


