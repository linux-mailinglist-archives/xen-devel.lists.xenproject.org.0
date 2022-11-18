Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9564F62F3F5
	for <lists+xen-devel@lfdr.de>; Fri, 18 Nov 2022 12:47:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.445617.700865 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovzpZ-0000jI-2R; Fri, 18 Nov 2022 11:46:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 445617.700865; Fri, 18 Nov 2022 11:46:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ovzpY-0000hE-VT; Fri, 18 Nov 2022 11:46:48 +0000
Received: by outflank-mailman (input) for mailman id 445617;
 Fri, 18 Nov 2022 11:46:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jn0n=3S=amd.com=Michal.Orzel@srs-se1.protection.inumbo.net>)
 id 1ovzpX-0000h4-4a
 for xen-devel@lists.xenproject.org; Fri, 18 Nov 2022 11:46:47 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20603.outbound.protection.outlook.com
 [2a01:111:f400:7e88::603])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a7a206c2-6736-11ed-8fd2-01056ac49cbb;
 Fri, 18 Nov 2022 12:46:35 +0100 (CET)
Received: from BN0PR04CA0184.namprd04.prod.outlook.com (2603:10b6:408:e9::9)
 by PH8PR12MB6865.namprd12.prod.outlook.com (2603:10b6:510:1c8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Fri, 18 Nov
 2022 11:46:40 +0000
Received: from BN8NAM11FT108.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e9:cafe::d4) by BN0PR04CA0184.outlook.office365.com
 (2603:10b6:408:e9::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5813.20 via Frontend
 Transport; Fri, 18 Nov 2022 11:46:40 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT108.mail.protection.outlook.com (10.13.176.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5834.8 via Frontend Transport; Fri, 18 Nov 2022 11:46:40 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Fri, 18 Nov
 2022 05:46:39 -0600
Received: from XIR-MICHALO-L1.xilinx.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34
 via Frontend Transport; Fri, 18 Nov 2022 05:46:38 -0600
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
X-Inumbo-ID: a7a206c2-6736-11ed-8fd2-01056ac49cbb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eezJC3BFbL/+SXrGTOSCReSCmJzQJJFld35SSbMfGpG3ceWahRo7Wr7JrmONts4DjGrEAIg0dHJCjYnauhgDHlbL7oSPXrbUkX7Foir6JYB1kpgwW1JY4mxCQhI9SrEjOgcnJzDPzsCPXb8m1sSVlOVgvGNqMnyyiCsKS9GwhKAoLyVifPtluljmegygf+VF/P9uDexvfLBG3hJHsP5yn2MgtKbwm7iuD1pi4PHIXkw9jCJshXGI8U50/hOEQpyZAun9R/srLSe+o1wwC139y6L9PVJLdYeeYODEdpisTDB8Rr84JiKLkVJkAfANSWY1BIrJnX4xY+Hx2AcS43aMmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+M+4H7JP9TPokpt207QPaKodTXJurywMQrtxzR4L+NM=;
 b=fpq9OTChNNsDJ9pK1AOz1JeT0vHcd5itbBoDprjk9P9DHpdgJOOPSHzc9+WxccvXA6JSOn6f7bfj+KeiJy+1twWGmrZV3Ez8v7UsJp+OcvrHXmPvEF0HdDm3ZZ1PV0Pe0AIxFpkfSAhp65dQEWd+iaSrh3za2pHhAxAQ1X4Iv2m3cB0rb4aOF4Jw5/3HAifAXLOuamz0hKWOvcOmtD6BjPL/5KaMzPbIDS4oySOlp0qXKYQZNZD358lPPekoweXs6rUz9LabXH1C9qSvHe1oS2VLCWD6HtE401sD3WWG8KOtrBQm3sJ84+Pcq7/2yQZ5BBFph0G9Ir0Z/Tc9Mt3DKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+M+4H7JP9TPokpt207QPaKodTXJurywMQrtxzR4L+NM=;
 b=f0bqYLDx0NIAzf18YVjniYL+Lc+2ExZqGjR1xBtICbm8JRg3xq5zLkAcUJZx0iXckT+GqD9iyDv9hMM7E0sXQ/5TKLiJUSxnClS2SxiqiYwvpfuhVvT5nOc4Llanl5NqiWXX9Z/lIPMqp8XWfdcHBLvtno9qN9bshq26ghCdJ5Q=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Michal Orzel <michal.orzel@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Michal Orzel <michal.orzel@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Luca Fancellu <luca.fancellu@arm.com>, Julien Grall <jgrall@amazon.com>
Subject: [PATCH 2/3] xen/arm: debug-pl011.inc: Use macros instead of hardcoded values
Date: Fri, 18 Nov 2022 12:46:17 +0100
Message-ID: <20221118114618.20754-3-michal.orzel@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221118114618.20754-1-michal.orzel@amd.com>
References: <20221118114618.20754-1-michal.orzel@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT108:EE_|PH8PR12MB6865:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f95dd7c-98b6-44ff-3b18-08dac95a8e96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	OFz061r2jyiVH/8HU7QvV5MCbQWNt8JUUyPL7MGrMRIY/W+nzjFcFOK4Lg7JwzpSCBua46fmbHcXei9PxfnG5X0pDsjC6g+/P+a88UmyH2OpOxJc6UhqtJTMGUa9vCY07GwcShwZTFq12U3ulT+2C6YBi4hjtFnBJOdJxYTUF9CfrCqpWxzNAgy/gXs/YBBj8N3WF4CemQhBBUsyi6hDl+zh9NLWw5gy6yogfynB0hKNQDluoW2gA/+bF1FTn4X9dBmlxArTsFDFSNOVziX5j7Cihm3PmJkNcvLRGYG4KQg0NmotmDbLfsmHuQIwVpmQMhtYKTFn3Mq0mEKCQodkTTnY/XNNDk8Kk+jzagLWsSLHxaQua5jqe38Ua6/2lLlFtd6m3U1GeiF+ly2nixmMddUDkskp5q/BMw3bq+u8211xlKitStrBMddrYAZMaRjSc6P8jTohwamwa40zCJLSZ4kFjbOzX5wSrwum4EgySO/3M2rYpqDtz5kQ7AW8IPZk4jf/r5c8z+5JCz1sMOPn5MhN03FwavK54mZhy6z7wHh5VDVsA4QpmyRWV9Hmtxfakz359Li4y/LGT8xoTvkTZw4QiPLthFYc2BzEQhEV4XKFya334gHakQ4m2PaFEk1Epb/ASLAIP+6ChlQXZUT4OE3B+8u4+9LfzgZMYEMF/9YmuDtarngM1fLO71xqe+IGuL0ljMAxHRZZaqtcJM3Ec3vWLzOJGhhWxvz4UcAUgpQ=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(346002)(376002)(39860400002)(451199015)(40470700004)(36840700001)(46966006)(54906003)(478600001)(47076005)(316002)(70586007)(6666004)(26005)(70206006)(6916009)(41300700001)(4326008)(8676002)(8936002)(1076003)(2616005)(44832011)(5660300002)(336012)(186003)(2906002)(83380400001)(426003)(36860700001)(40480700001)(82310400005)(36756003)(86362001)(40460700003)(82740400003)(81166007)(356005)(36900700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2022 11:46:40.2171
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f95dd7c-98b6-44ff-3b18-08dac95a8e96
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN8NAM11FT108.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6865

Make use of the macros defined in asm/pl011-uart.h instead of hardcoding
the values. Also, take the opportunity to fix the file extension in a
top-level comment.

No functional change intended.

Signed-off-by: Michal Orzel <michal.orzel@amd.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
Acked-by: Julien Grall <jgrall@amazon.com>
---
This patch has already been reviewed/acked when pushed as a standalone one.
Added to the series for ease of merging.
---
 xen/arch/arm/arm64/debug-pl011.inc | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/xen/arch/arm/arm64/debug-pl011.inc b/xen/arch/arm/arm64/debug-pl011.inc
index 1928a2e3ffbb..d82f2f1de197 100644
--- a/xen/arch/arm/arm64/debug-pl011.inc
+++ b/xen/arch/arm/arm64/debug-pl011.inc
@@ -1,5 +1,5 @@
 /*
- * xen/arch/arm/arm64/debug-pl011.S
+ * xen/arch/arm/arm64/debug-pl011.inc
  *
  * PL011 specific debug code
  *
@@ -16,6 +16,8 @@
  * GNU General Public License for more details.
  */
 
+ #include <asm/pl011-uart.h>
+
 /*
  * PL011 UART initialization
  * xb: register which containts the UART base address
@@ -23,13 +25,13 @@
  */
 .macro early_uart_init xb, c
         mov   x\c, #(7372800 / CONFIG_EARLY_UART_PL011_BAUD_RATE % 16)
-        strh  w\c, [\xb, #0x28]      /* -> UARTFBRD (Baud divisor fraction) */
+        strh  w\c, [\xb, #FBRD]      /* -> UARTFBRD (Baud divisor fraction) */
         mov   x\c, #(7372800 / CONFIG_EARLY_UART_PL011_BAUD_RATE / 16)
-        strh  w\c, [\xb, #0x24]      /* -> UARTIBRD (Baud divisor integer) */
+        strh  w\c, [\xb, #IBRD]      /* -> UARTIBRD (Baud divisor integer) */
         mov   x\c, #0x60             /* 8n1 */
-        str   w\c, [\xb, #0x2C]      /* -> UARTLCR_H (Line control) */
-        ldr   x\c, =0x00000301       /* RXE | TXE | UARTEN */
-        str   w\c, [\xb, #0x30]      /* -> UARTCR (Control Register) */
+        str   w\c, [\xb, #LCR_H]     /* -> UARTLCR_H (Line control) */
+        ldr   x\c, =(RXE | TXE | UARTEN)
+        str   w\c, [\xb, #CR]        /* -> UARTCR (Control Register) */
 .endm
 
 /*
@@ -39,8 +41,8 @@
  */
 .macro early_uart_ready xb, c
 1:
-        ldrh  w\c, [\xb, #0x18]      /* <- UARTFR (Flag register) */
-        tst   w\c, #0x8              /* Check BUSY bit */
+        ldrh  w\c, [\xb, #FR]        /* <- UARTFR (Flag register) */
+        tst   w\c, #BUSY             /* Check BUSY bit */
         b.ne  1b                     /* Wait for the UART to be ready */
 .endm
 
@@ -50,7 +52,7 @@
  * wt: register which contains the character to transmit
  */
 .macro early_uart_transmit xb, wt
-        strb  \wt, [\xb]             /* -> UARTDR (Data Register) */
+        strb  \wt, [\xb, #DR]        /* -> UARTDR (Data Register) */
 .endm
 
 /*
-- 
2.25.1


