Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DC5A01199
	for <lists+xen-devel@lfdr.de>; Sat,  4 Jan 2025 02:59:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.864717.1276060 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTtQv-0008M2-JZ; Sat, 04 Jan 2025 01:58:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 864717.1276060; Sat, 04 Jan 2025 01:58:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tTtQu-00085l-K5; Sat, 04 Jan 2025 01:58:32 +0000
Received: by outflank-mailman (input) for mailman id 864717;
 Sat, 04 Jan 2025 01:58:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AhC6=T4=kernel.org=devnull+dmukhin.ford.com@srs-se1.protection.inumbo.net>)
 id 1tTtQn-0005Ay-HM
 for xen-devel@lists.xenproject.org; Sat, 04 Jan 2025 01:58:25 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5e86857b-ca3f-11ef-99a4-01e77a169b0f;
 Sat, 04 Jan 2025 02:58:19 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BCBD75C6381;
 Sat,  4 Jan 2025 01:57:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CCE25C4CEDD;
 Sat,  4 Jan 2025 01:58:15 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id C54DCE77198;
 Sat,  4 Jan 2025 01:58:15 +0000 (UTC)
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
X-Inumbo-ID: 5e86857b-ca3f-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735955895;
	bh=c/sQchAB2th2WIR91b/A5zvJkudq54ZcORx3s/2AFYc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=O3wpE11lMn4BMs9NE6jG7Q1a7wgxfshSnVuXaS7yZUJX8gSJrEUhFJPrZKeEPDjZf
	 gQUE2PfMxP/McKgUaPCwcq236fLhwJnZHoekBjERHLzjTRYdkIdw3RN9h1MO7q2WCW
	 +SYMuvCqHb2SsndAIQfD4FjgQfIB8oQN5BGoEd8L9GOsRpORKara7MJMu/UeOyYt7+
	 2d1vHWZUV5P9CFWxmHYUylm6v5SYjuBO1bOFQl5ZVM7EGrkrPaxLUcFRALcYXL8HPc
	 ESggfeSIh7sj08XUDmqZdyt0CVVOIQj8zDUaPg3ZjozYURGo0caiMU37m5gPOqH8Ym
	 /hwyXTB2HrdnA==
From: Denis Mukhin via B4 Relay <devnull+dmukhin.ford.com@kernel.org>
Date: Fri, 03 Jan 2025 17:58:25 -0800
Subject: [PATCH v3 19/24] xen/8250-uart: add missing definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250103-vuart-ns8250-v3-v1-19-c5d36b31d66c@ford.com>
References: <20250103-vuart-ns8250-v3-v1-0-c5d36b31d66c@ford.com>
In-Reply-To: <20250103-vuart-ns8250-v3-v1-0-c5d36b31d66c@ford.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, 
 Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>, 
 =?utf-8?q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
 Denis Mukhin <dmukhin@ford.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735955892; l=7808;
 i=dmukhin@ford.com; s=20241125; h=from:subject:message-id;
 bh=T+cbSUlwhOiYz+Afz3lMbHpJVwMTNzMdAT/z7b8cRYc=;
 b=Seh7LR0DR3fCTrjLnw3IFzcTtD9s+yB1Dw9zGVcAIVgBH0T14IQCAi2JaSEmb3Itsmxz5kRJD
 fDh0gHaKhV9BZJqddjdkPR5d3OBSGRt1Jm6ts0V00OayTEtEPw4C1Re
X-Developer-Key: i=dmukhin@ford.com; a=ed25519;
 pk=SsDZ9p39s0fqcpUKQuqKqrbn0rq6EtEAClvpOpzx6+U=
X-Endpoint-Received: by B4 Relay for dmukhin@ford.com/20241125 with
 auth_id=287
X-Original-From: Denis Mukhin <dmukhin@ford.com>
Reply-To: dmukhin@ford.com

From: Denis Mukhin <dmukhin@ford.com>

Added missing definitions needed for NS8250 UART emulator.

Re-used newly introduced MSR definitions in the existing ns16550 driver.

Also, fixed indentation in a comment for FCR register.

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
 xen/drivers/char/ns16550.c  |  6 ++--
 xen/include/xen/8250-uart.h | 78 +++++++++++++++++++++++++++++++++------------
 2 files changed, 60 insertions(+), 24 deletions(-)

diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index eaeb0e09d01ea70f865b8aee4f34ab7a0d4c5cf9..025ba5819d46ea567d41cea512b5f166969fb95f 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -721,9 +721,9 @@ static int __init check_existence(struct ns16550 *uart)
      * Check to see if a UART is really there.
      * Use loopback test mode.
      */
-    ns_write_reg(uart, UART_MCR, UART_MCR_LOOP | 0x0A);
-    status = ns_read_reg(uart, UART_MSR) & 0xF0;
-    return (status == 0x90);
+    ns_write_reg(uart, UART_MCR, UART_MCR_LOOP | UART_MCR_RTS | UART_MCR_OUT2);
+    status = ns_read_reg(uart, UART_MSR) & UART_MSR_STATUS;
+    return (status == (UART_MSR_CTS | UART_MSR_DCD));
 }
 
 #ifdef CONFIG_HAS_PCI
diff --git a/xen/include/xen/8250-uart.h b/xen/include/xen/8250-uart.h
index d13352940c13c50bac17d4cdf2f3bf584380776a..6d1af31d582a3dd674a401d7f649e28c889cdc3e 100644
--- a/xen/include/xen/8250-uart.h
+++ b/xen/include/xen/8250-uart.h
@@ -32,6 +32,7 @@
 #define UART_MCR          0x04    /* Modem control        */
 #define UART_LSR          0x05    /* line status          */
 #define UART_MSR          0x06    /* Modem status         */
+#define UART_SCR          0x07    /* Scratch pad          */
 #define UART_USR          0x1f    /* Status register (DW) */
 #define UART_DLL          0x00    /* divisor latch (ls) (DLAB=1) */
 #define UART_DLM          0x01    /* divisor latch (ms) (DLAB=1) */
@@ -42,6 +43,8 @@
 #define UART_IER_ETHREI   0x02    /* tx reg. empty        */
 #define UART_IER_ELSI     0x04    /* rx line status       */
 #define UART_IER_EMSI     0x08    /* MODEM status         */
+#define UART_IER_MASK \
+    (UART_IER_ERDAI | UART_IER_ETHREI | UART_IER_ELSI | UART_IER_EMSI)
 
 /* Interrupt Identification Register */
 #define UART_IIR_NOINT    0x01    /* no interrupt pending */
@@ -51,12 +54,19 @@
 #define UART_IIR_THR      0x02    /*  - tx reg. empty     */
 #define UART_IIR_MSI      0x00    /*  - MODEM status      */
 #define UART_IIR_BSY      0x07    /*  - busy detect (DW) */
+#define UART_IIR_FE       0xC0    /* FIFO enabled (2 bits) */
 
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
@@ -64,17 +74,17 @@
 
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
@@ -96,11 +106,33 @@
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
+#define UART_MSR_CHANGE \
+    (UART_MSR_DCTS | UART_MSR_DDSR | UART_MSR_TERI | UART_MSR_DDCD)
+#define UART_MSR_STATUS \
+    (UART_MSR_CTS | UART_MSR_DSR | UART_MSR_RI | UART_MSR_DCD)
 
 /* Line Status Register */
 #define UART_LSR_DR       0x01    /* Data ready           */
@@ -111,6 +143,7 @@
 #define UART_LSR_THRE     0x20    /* Xmit hold reg empty  */
 #define UART_LSR_TEMT     0x40    /* Xmitter empty        */
 #define UART_LSR_ERR      0x80    /* Error                */
+#define UART_LSR_MASK     (UART_LSR_OE | UART_LSR_BI)
 
 /* These parity settings can be ORed directly into the LCR. */
 #define UART_PARITY_NONE  (0<<3)
@@ -119,7 +152,10 @@
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



