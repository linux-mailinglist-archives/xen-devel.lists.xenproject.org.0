Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BC5D89D9F8E
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2024 00:23:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.844081.1259762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tG4u2-0004fK-0s; Tue, 26 Nov 2024 23:23:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 844081.1259762; Tue, 26 Nov 2024 23:23:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tG4u0-0004Ku-IJ; Tue, 26 Nov 2024 23:23:28 +0000
Received: by outflank-mailman (input) for mailman id 844081;
 Tue, 26 Nov 2024 23:22:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rasV=SV=kernel.org=devnull+dmukhin.ford.com@srs-se1.protection.inumbo.net>)
 id 1tG4sl-0000Ao-Mn
 for xen-devel@lists.xenproject.org; Tue, 26 Nov 2024 23:22:11 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3f7e5ad1-ac4d-11ef-a0cd-8be0dac302b0;
 Wed, 27 Nov 2024 00:22:05 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5A14E5C5D97;
 Tue, 26 Nov 2024 23:21:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8904BC4CED3;
 Tue, 26 Nov 2024 23:21:57 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 80BA4D66B8E;
 Tue, 26 Nov 2024 23:21:57 +0000 (UTC)
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
X-Inumbo-ID: 3f7e5ad1-ac4d-11ef-a0cd-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjI2MDQ6MTM4MDo0NjQxOmM1MDA6OjEiLCJoZWxvIjoiZGZ3LnNvdXJjZS5rZXJuZWwub3JnIn0=
X-Custom-Transaction: eyJpZCI6IjNmN2U1YWQxLWFjNGQtMTFlZi1hMGNkLThiZTBkYWMzMDJiMCIsInRzIjoxNzMyNjYzMzI1LjM1MDAwMywic2VuZGVyIjoiZGV2bnVsbCtkbXVraGluLmZvcmQuY29tQGtlcm5lbC5vcmciLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732663317;
	bh=XhlyTKT6Hlfb0qF61veOPFsm+lhyRH3KNfs5+i2StaA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=gTcMOlTcS220ZM2r3z/DMYmj2iowjMt3qadytRFodvrayrx+QnwWiMg91clSJiJj+
	 cFJ9n1Ia714FZLG8xgMviWPsttV/UzwdV8NBFJB4mjpO2uDUiQNTUyQy5xHaD7YMpa
	 X9dlVpa8vrb1Usnn89466SRbjYHEZF20hf2ryG9UbH8sDKual57tXsH0eDEzBJLjbM
	 uPCp30t6v+1gI7tXUgvoWcUvmVKobFtQ6hFXWwfsqC2lJAasw7eT7Z6q4MiyYt9Lw4
	 P50S+94VXQgnowVD+aZ89YSKtm1BrODQz7iVNuLVz1TtCfHl6aBZN09AzNyqGt96si
	 yc1pRzOUoiNmg==
From: Denis Mukhin via B4 Relay <devnull+dmukhin.ford.com@kernel.org>
Date: Tue, 26 Nov 2024 15:22:20 -0800
Subject: [PATCH 30/36] xen/8250-uart: add missing definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241126-vuart-ns8250-v1-v1-30-87b9a8375b7a@ford.com>
References: <20241126-vuart-ns8250-v1-v1-0-87b9a8375b7a@ford.com>
In-Reply-To: <20241126-vuart-ns8250-v1-v1-0-87b9a8375b7a@ford.com>
To: Jan Beulich <jbeulich@suse.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
 "Daniel P. Smith" <dpsmith@apertussolutions.com>, 
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
 Bertrand Marquis <bertrand.marquis@arm.com>, 
 Michal Orzel <michal.orzel@amd.com>, Rahul Singh <rahul.singh@arm.com>, 
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
 Alistair Francis <alistair.francis@wdc.com>, 
 Bob Eshleman <bobbyeshleman@gmail.com>, 
 Connor Davis <connojdavis@gmail.com>, 
 Oleksii Kurochko <oleksii.kurochko@gmail.com>, 
 Shawn Anastasio <sanastasio@raptorengineering.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>, 
 Christian Lindig <christian.lindig@citrix.com>, 
 David Scott <dave@recoil.org>, 
 =?utf-8?q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, Denis Mukhin <dmukhin@ford.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732663312; l=7186;
 i=dmukhin@ford.com; s=20241125; h=from:subject:message-id;
 bh=oejdv1gxnsCTTpK0zev/wdrMthybKBcbIC8U8s3WUPs=;
 b=/MaDwKP9awtaJDnFOE38qqIxCqUh/XIedVanwgDnvHPxhEduc2YVmEpIhzLVWa/T0f6THEh4s
 nu/8XGQN8rGCDv5+owOfQdvcFbtjw+36ayeQrOU70Rz12/xHWMGYE64
X-Developer-Key: i=dmukhin@ford.com; a=ed25519;
 pk=SsDZ9p39s0fqcpUKQuqKqrbn0rq6EtEAClvpOpzx6+U=
X-Endpoint-Received: by B4 Relay for dmukhin@ford.com/20241125 with
 auth_id=287
X-Original-From: Denis Mukhin <dmukhin@ford.com>
Reply-To: dmukhin@ford.com

From: Denis Mukhin <dmukhin@ford.com>

Added missing definitions needed for NS8250 UART emulator.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/include/xen/8250-uart.h | 82 +++++++++++++++++++++++++++++++++------------
 1 file changed, 61 insertions(+), 21 deletions(-)

diff --git a/xen/include/xen/8250-uart.h b/xen/include/xen/8250-uart.h
index d13352940c13c50bac17d4cdf2f3bf584380776a..51c9b8c5fc3b8d9fa4b93f7722acb963fdf52a3d 100644
--- a/xen/include/xen/8250-uart.h
+++ b/xen/include/xen/8250-uart.h
@@ -32,16 +32,22 @@
 #define UART_MCR          0x04    /* Modem control        */
 #define UART_LSR          0x05    /* line status          */
 #define UART_MSR          0x06    /* Modem status         */
+#define UART_SCR          0x07    /* Scratch pad          */
 #define UART_USR          0x1f    /* Status register (DW) */
 #define UART_DLL          0x00    /* divisor latch (ls) (DLAB=1) */
 #define UART_DLM          0x01    /* divisor latch (ms) (DLAB=1) */
 #define UART_XR_EFR       0x09    /* Enhanced function register (Exar) */
 
+/* ns8250 emulator: range of emulated registers [0..UART_MAX-1] */
+#define UART_MAX          (UART_SCR + 1)
+
 /* Interrupt Enable Register */
 #define UART_IER_ERDAI    0x01    /* rx data recv'd       */
 #define UART_IER_ETHREI   0x02    /* tx reg. empty        */
 #define UART_IER_ELSI     0x04    /* rx line status       */
 #define UART_IER_EMSI     0x08    /* MODEM status         */
+#define UART_IER_MASK \
+    (UART_IER_ERDAI | UART_IER_ETHREI | UART_IER_ELSI | UART_IER_EMSI)
 
 /* Interrupt Identification Register */
 #define UART_IIR_NOINT    0x01    /* no interrupt pending */
@@ -51,12 +57,21 @@
 #define UART_IIR_THR      0x02    /*  - tx reg. empty     */
 #define UART_IIR_MSI      0x00    /*  - MODEM status      */
 #define UART_IIR_BSY      0x07    /*  - busy detect (DW) */
+#define UART_IIR_FE0      BIT(6, U) /* FIFO enable #0 */
+#define UART_IIR_FE1      BIT(7, U) /* FIFO enable #1 */
+#define UART_IIR_FE_MASK  (UART_IIR_FE0 | UART_IIR_FE1)
 
 /* FIFO Control Register */
-#define UART_FCR_ENABLE   0x01    /* enable FIFO          */
-#define UART_FCR_CLRX     0x02    /* clear Rx FIFO        */
-#define UART_FCR_CLTX     0x04    /* clear Tx FIFO        */
-#define UART_FCR_DMA      0x10    /* enter DMA mode       */
+#define UART_FCR_ENABLE     BIT(0, U)   /* enable FIFO          */
+#define UART_FCR_CLRX       BIT(1, U)   /* clear Rx FIFO        */
+#define UART_FCR_CLTX       BIT(2, U)   /* clear Tx FIFO        */
+#define UART_FCR_DMA        BIT(3, U)   /* enter DMA mode       */
+#define UART_FCR_RESERVED0  BIT(4, U)   /* reserved; always 0   */
+#define UART_FCR_RESERVED1  BIT(5, U)   /* reserved; always 0   */
+#define UART_FCR_RTB0       BIT(6, U)   /* receiver trigger bit #0 */
+#define UART_FCR_RTB1       BIT(7, U)   /* receiver trigger bit #1 */
+#define UART_FCR_TRG_MASK   (UART_FCR_RTB0 | UART_FCR_RTB1)
+
 #define UART_FCR_TRG1     0x00    /* Rx FIFO trig lev 1   */
 #define UART_FCR_TRG4     0x40    /* Rx FIFO trig lev 4   */
 #define UART_FCR_TRG8     0x80    /* Rx FIFO trig lev 8   */
@@ -64,17 +79,17 @@
 
 /*
  * Note: The FIFO trigger levels are chip specific:
- *	RX:76 = 00  01  10  11	TX:54 = 00  01  10  11
- * PC16550D:	 1   4   8  14		xx  xx  xx  xx
- * TI16C550A:	 1   4   8  14          xx  xx  xx  xx
- * TI16C550C:	 1   4   8  14          xx  xx  xx  xx
- * ST16C550:	 1   4   8  14		xx  xx  xx  xx
- * ST16C650:	 8  16  24  28		16   8  24  30	PORT_16650V2
- * NS16C552:	 1   4   8  14		xx  xx  xx  xx
- * ST16C654:	 8  16  56  60		 8  16  32  56	PORT_16654
- * TI16C750:	 1  16  32  56		xx  xx  xx  xx	PORT_16750
- * TI16C752:	 8  16  56  60		 8  16  32  56
- * Tegra:	 1   4   8  14		16   8   4   1	PORT_TEGRA
+ *  RX:76 = 00  01  10  11  TX:54 = 00  01  10  11
+ * PC16550D:     1   4   8  14      xx  xx  xx  xx
+ * TI16C550A:    1   4   8  14      xx  xx  xx  xx
+ * TI16C550C:    1   4   8  14      xx  xx  xx  xx
+ * ST16C550:     1   4   8  14      xx  xx  xx  xx
+ * ST16C650:     8  16  24  28      16   8  24  30  PORT_16650V2
+ * NS16C552:     1   4   8  14      xx  xx  xx  xx
+ * ST16C654:     8  16  56  60       8  16  32  56  PORT_16654
+ * TI16C750:     1  16  32  56      xx  xx  xx  xx  PORT_16750
+ * TI16C752:     8  16  56  60       8  16  32  56
+ * Tegra:        1   4   8  14      16   8   4   1  PORT_TEGRA
  */
 #define UART_FCR_R_TRIG_00 0x00
 #define UART_FCR_R_TRIG_01 0x40
@@ -96,11 +111,32 @@
 #define UART_LCR_CONF_MODE_B	0xBF		/* Configuration mode B */
 
 /* Modem Control Register */
-#define UART_MCR_DTR      0x01    /* Data Terminal Ready  */
-#define UART_MCR_RTS      0x02    /* Request to Send      */
-#define UART_MCR_OUT2     0x08    /* OUT2: interrupt mask */
-#define UART_MCR_LOOP     0x10    /* Enable loopback test mode */
-#define UART_MCR_TCRTLR   0x40    /* Access TCR/TLR (TI16C752, EFR[4]=1) */
+#define UART_MCR_DTR            BIT(0, U)   /* Data Terminal Ready  */
+#define UART_MCR_RTS            BIT(1, U)   /* Request to Send      */
+#define UART_MCR_OUT1           BIT(2, U)   /* OUT1: interrupt mask */
+#define UART_MCR_OUT2           BIT(3, U)   /* OUT2: interrupt mask */
+#define UART_MCR_LOOP           BIT(4, U)   /* Enable loopback test mode */
+#define UART_MCR_RESERVED0      BIT(5, U)   /* Reserved #0 */
+#define UART_MCR_RESERVED1      BIT(6, U)   /* Reserved #1 */
+#define UART_MCR_TCRTLR         BIT(6, U)   /* Access TCR/TLR (TI16C752, EFR[4]=1) */
+#define UART_MCR_RESERVED2      BIT(7, U)   /* Reserved #2 */
+#define UART_MCR_MASK \
+    (UART_MCR_DTR | UART_MCR_RTS | \
+     UART_MCR_OUT1 | UART_MCR_OUT2 | \
+     UART_MCR_LOOP)
+
+/* Modem Status Register */
+#define UART_MSR_DCTS           BIT(0, U)   /* Change in CTS */
+#define UART_MSR_DDSR           BIT(1, U)   /* Change in DSR */
+#define UART_MSR_TERI           BIT(2, U)   /* Change in RI */
+#define UART_MSR_DDCD           BIT(3, U)   /* Change in CTS */
+#define UART_MSR_CTS            BIT(4, U)
+#define UART_MSR_DSR            BIT(5, U)
+#define UART_MSR_RI             BIT(6, U)
+#define UART_MSR_DCD            BIT(7, U)
+#define UART_MSR_SHIFT          4
+#define UART_MSR_DELTA \
+    (UART_MSR_DCTS | UART_MSR_DDSR | UART_MSR_TERI | UART_MSR_DDCD)
 
 /* Line Status Register */
 #define UART_LSR_DR       0x01    /* Data ready           */
@@ -111,6 +147,7 @@
 #define UART_LSR_THRE     0x20    /* Xmit hold reg empty  */
 #define UART_LSR_TEMT     0x40    /* Xmitter empty        */
 #define UART_LSR_ERR      0x80    /* Error                */
+#define UART_LSR_MASK     (UART_LSR_OE | UART_LSR_BI)
 
 /* These parity settings can be ORed directly into the LCR. */
 #define UART_PARITY_NONE  (0<<3)
@@ -119,7 +156,10 @@
 #define UART_PARITY_MARK  (5<<3)
 #define UART_PARITY_SPACE (7<<3)
 
-/* Frequency of external clock source. This definition assumes PC platform. */
+/*
+ * Frequency of external UART clock source.
+ * Same as IBM PC master input clock frequency.
+ */
 #define UART_CLOCK_HZ     1843200
 
 /* Bits in Exar specific UART_XR_EFR register */

-- 
2.34.1



