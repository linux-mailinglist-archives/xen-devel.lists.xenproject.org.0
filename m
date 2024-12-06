Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D69619E6691
	for <lists+xen-devel@lfdr.de>; Fri,  6 Dec 2024 06:00:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.849736.1264318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJQRa-0007v8-4o; Fri, 06 Dec 2024 04:59:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 849736.1264318; Fri, 06 Dec 2024 04:59:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tJQRa-0007sS-1A; Fri, 06 Dec 2024 04:59:58 +0000
Received: by outflank-mailman (input) for mailman id 849736;
 Fri, 06 Dec 2024 04:59:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5aHD=S7=kernel.org=devnull+dmukhin.ford.com@srs-se1.protection.inumbo.net>)
 id 1tJQA6-0004Ka-NM
 for xen-devel@lists.xenproject.org; Fri, 06 Dec 2024 04:41:54 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 642fa7da-b38c-11ef-a0d5-8be0dac302b0;
 Fri, 06 Dec 2024 05:41:43 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8411F5C732A;
 Fri,  6 Dec 2024 04:40:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 25C16C4CEE0;
 Fri,  6 Dec 2024 04:41:39 +0000 (UTC)
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 1DE67E77175;
 Fri,  6 Dec 2024 04:41:39 +0000 (UTC)
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
X-Inumbo-ID: 642fa7da-b38c-11ef-a0d5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733460099;
	bh=tqpmdL8JNRiLSamzy9ROf/yJ/66J2svyAG5pfiQILB0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=u7P9mgJdpIjUCR4UTz9a57NXTHwJcB5aeeBrK0LU7Nov965LEsoBe1GBVhjVO3QQZ
	 W0SvFy5A84Aj2H5qY5gPmEeXd3tCpjZc7TsXw3UnXUcX1htfK98vbtvrmCyfPpCOwQ
	 EqZnHIb39dZc2WW8OTP6pkjnestLt6EXqx62a8t0QZ38di3jKlWrRiGJJt7/fNhUrl
	 kTw2HUnIIjiUezrcjUDkyyl7bPM0FeCx3XdlC/dcbicKbiw9+tSCxw8+1oiEWNSUdq
	 zR6UZuQZHfdI3MuFIrdANp4QHQv1nNe/+H+fDOHUO0Pw9PM/3cb6xbOTNfLwmBDjBJ
	 N+4Z/BvgzJ8Mw==
From: Denis Mukhin via B4 Relay <devnull+dmukhin.ford.com@kernel.org>
Date: Thu, 05 Dec 2024 20:41:58 -0800
Subject: [PATCH v2 28/35] xen/8250-uart: add missing definitions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-vuart-ns8250-v1-28-e9aa923127eb@ford.com>
References: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
In-Reply-To: <20241205-vuart-ns8250-v1-0-e9aa923127eb@ford.com>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, 
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
 Stefano Stabellini <sstabellini@kernel.org>, 
 Denis Mukhin <dmukhin@ford.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733460095; l=7150;
 i=dmukhin@ford.com; s=20241125; h=from:subject:message-id;
 bh=tIDl7kdtapSdiWgcLjWmQ7v8zbW9hmc48ULvT599z7A=;
 b=kPzosi8ho+ByeLwfCWEeVFseo8sJZ+0pQO4SEJq2xAHq/cop5Z9wnnfTJ7hX4VXH2kuye0ajT
 y1zxyalUV4kBc0xBvVDO5M7y3G4JHEggAouSPKUNF5FfZUP436ueI3j
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
 xen/include/xen/8250-uart.h | 81 +++++++++++++++++++++++++++++++++------------
 1 file changed, 60 insertions(+), 21 deletions(-)

diff --git a/xen/include/xen/8250-uart.h b/xen/include/xen/8250-uart.h
index d13352940c13c50bac17d4cdf2f3bf584380776a..4a69b2b225140efda287bdf96fa0caa4aa70074f 100644
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
@@ -96,11 +111,31 @@
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
+#define UART_MSR_DELTA \
+    (UART_MSR_DCTS | UART_MSR_DDSR | UART_MSR_TERI | UART_MSR_DDCD)
 
 /* Line Status Register */
 #define UART_LSR_DR       0x01    /* Data ready           */
@@ -111,6 +146,7 @@
 #define UART_LSR_THRE     0x20    /* Xmit hold reg empty  */
 #define UART_LSR_TEMT     0x40    /* Xmitter empty        */
 #define UART_LSR_ERR      0x80    /* Error                */
+#define UART_LSR_MASK     (UART_LSR_OE | UART_LSR_BI)
 
 /* These parity settings can be ORed directly into the LCR. */
 #define UART_PARITY_NONE  (0<<3)
@@ -119,7 +155,10 @@
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



