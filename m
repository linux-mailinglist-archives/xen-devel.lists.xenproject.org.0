Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D078B17695
	for <lists+xen-devel@lfdr.de>; Thu, 31 Jul 2025 21:22:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1066274.1431518 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhYqv-0008I1-QK; Thu, 31 Jul 2025 19:22:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1066274.1431518; Thu, 31 Jul 2025 19:22:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uhYqv-0008Ey-Lq; Thu, 31 Jul 2025 19:22:09 +0000
Received: by outflank-mailman (input) for mailman id 1066274;
 Thu, 31 Jul 2025 19:22:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hI6J=2M=proton.me=dmkhn@srs-se1.protection.inumbo.net>)
 id 1uhYqu-00075q-5l
 for xen-devel@lists.xenproject.org; Thu, 31 Jul 2025 19:22:08 +0000
Received: from mail-24418.protonmail.ch (mail-24418.protonmail.ch
 [109.224.244.18]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a4bf5530-6e43-11f0-b895-0df219b8e170;
 Thu, 31 Jul 2025 21:22:05 +0200 (CEST)
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
X-Inumbo-ID: a4bf5530-6e43-11f0-b895-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1753989724; x=1754248924;
	bh=8lIklxnXt50wHs0x1dEjXiRXbOxyK6NJO48hlbUQUkk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=WgG0BaCpD8rgLHZGAH3pCnKsFqn+N+AVSk84RxU0YLDpbnqq5zTx78ChB211d+ob1
	 +j9FYbqZfLaWfeqmwVdZm1/k19KLSK6c+MXdroUph7PhVCUJDd9G2LguNQX4QHahAy
	 1z544+9g92UnIVMMX9Jie8UuirkTMfJsuzFKnF4Ha8xZoJbNcj4xMjfVeRXGpV75FQ
	 /xs/to2lVZk95MekF8bFZSooOmP6YbvHV8tduKjbgK85TxZjI+oQimC2utLrbK3gNg
	 XfN2csfX5+cIbM5E0pRw5KeduZUdpJB4whysWKbrhnqgbwsHf8jefxQkXYuG8Ja0sK
	 YXMmhFBtHGDgg==
Date: Thu, 31 Jul 2025 19:22:01 +0000
To: xen-devel@lists.xenproject.org
From: dmkhn@proton.me
Cc: andrew.cooper3@citrix.com, anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, dmukhin@ford.com
Subject: [PATCH v4 4/8] xen/8250-uart: update definitions
Message-ID: <20250731192130.3948419-5-dmukhin@ford.com>
In-Reply-To: <20250731192130.3948419-1-dmukhin@ford.com>
References: <20250731192130.3948419-1-dmukhin@ford.com>
Feedback-ID: 123220910:user:proton
X-Pm-Message-ID: 0838d986e3229c7a6454a8177cb5be715c3e6fae
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

From: Denis Mukhin <dmukhin@ford.com>=20

Added missing definitions needed for NS16550 UART emulator.

Newly introduced MSR definitions re-used in the existing ns16550 driver.

Also, corrected FCR DMA definition bit#3 (0x08) as per:
  https://www.ti.com/lit/ds/symlink/tl16c550c.pdf
See "7.7.2 FIFO Control Register (FCR)".

Signed-off-by: Denis Mukhin <dmukhin@ford.com>
---
Changes since v3:
- feedback addressed
- made use of new UART_MCR_XXX bits in ns16550 driver
- Link to v3: https://lore.kernel.org/xen-devel/20250103-vuart-ns8250-v3-v1=
-19-c5d36b31d66c@ford.com/
---
 xen/drivers/char/ns16550.c  |  6 ++---
 xen/include/xen/8250-uart.h | 50 ++++++++++++++++++++++++++++++-------
 2 files changed, 44 insertions(+), 12 deletions(-)

diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index df7fff7f81df..a899711e2a8b 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -739,9 +739,9 @@ static int __init check_existence(struct ns16550 *uart)
      * Check to see if a UART is really there.
      * Use loopback test mode.
      */
-    ns_write_reg(uart, UART_MCR, UART_MCR_LOOP | 0x0A);
-    status =3D ns_read_reg(uart, UART_MSR) & 0xF0;
-    return (status =3D=3D 0x90);
+    ns_write_reg(uart, UART_MCR, UART_MCR_LOOP | UART_MCR_RTS | UART_MCR_O=
UT2);
+    status =3D ns_read_reg(uart, UART_MSR) & UART_MSR_STATUS;
+    return (status =3D=3D (UART_MSR_CTS | UART_MSR_DCD));
 }
=20
 #ifdef CONFIG_HAS_PCI
diff --git a/xen/include/xen/8250-uart.h b/xen/include/xen/8250-uart.h
index d13352940c13..bc11cdc376c9 100644
--- a/xen/include/xen/8250-uart.h
+++ b/xen/include/xen/8250-uart.h
@@ -32,6 +32,7 @@
 #define UART_MCR          0x04    /* Modem control        */
 #define UART_LSR          0x05    /* line status          */
 #define UART_MSR          0x06    /* Modem status         */
+#define UART_SCR          0x07    /* Scratch pad          */
 #define UART_USR          0x1f    /* Status register (DW) */
 #define UART_DLL          0x00    /* divisor latch (ls) (DLAB=3D1) */
 #define UART_DLM          0x01    /* divisor latch (ms) (DLAB=3D1) */
@@ -42,6 +43,8 @@
 #define UART_IER_ETHREI   0x02    /* tx reg. empty        */
 #define UART_IER_ELSI     0x04    /* rx line status       */
 #define UART_IER_EMSI     0x08    /* MODEM status         */
+#define UART_IER_MASK \
+    (UART_IER_ERDAI | UART_IER_ETHREI | UART_IER_ELSI | UART_IER_EMSI)
=20
 /* Interrupt Identification Register */
 #define UART_IIR_NOINT    0x01    /* no interrupt pending */
@@ -51,12 +54,19 @@
 #define UART_IIR_THR      0x02    /*  - tx reg. empty     */
 #define UART_IIR_MSI      0x00    /*  - MODEM status      */
 #define UART_IIR_BSY      0x07    /*  - busy detect (DW) */
+#define UART_IIR_FE       0xc0    /* FIFO enabled (2 bits) */
=20
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
@@ -96,11 +106,32 @@
 #define UART_LCR_CONF_MODE_B=090xBF=09=09/* Configuration mode B */
=20
 /* Modem Control Register */
-#define UART_MCR_DTR      0x01    /* Data Terminal Ready  */
-#define UART_MCR_RTS      0x02    /* Request to Send      */
-#define UART_MCR_OUT2     0x08    /* OUT2: interrupt mask */
-#define UART_MCR_LOOP     0x10    /* Enable loopback test mode */
-#define UART_MCR_TCRTLR   0x40    /* Access TCR/TLR (TI16C752, EFR[4]=3D1)=
 */
+#define UART_MCR_DTR            BIT(0, U)   /* Data Terminal Ready  */
+#define UART_MCR_RTS            BIT(1, U)   /* Request to Send      */
+#define UART_MCR_OUT1           BIT(2, U)   /* OUT1: interrupt mask */
+#define UART_MCR_OUT2           BIT(3, U)   /* OUT2: interrupt mask */
+#define UART_MCR_LOOP           BIT(4, U)   /* Enable loopback test mode *=
/
+#define UART_MCR_RESERVED0      BIT(5, U)   /* Reserved #0 */
+#define UART_MCR_TCRTLR         BIT(6, U)   /* Access TCR/TLR (TI16C752, E=
FR[4]=3D1) */
+#define UART_MCR_RESERVED1      BIT(7, U)   /* Reserved #1 */
+#define UART_MCR_MASK \
+    (UART_MCR_DTR | UART_MCR_RTS | \
+     UART_MCR_OUT1 | UART_MCR_OUT2 | \
+     UART_MCR_LOOP | UART_MCR_TCRTLR)
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
=20
 /* Line Status Register */
 #define UART_LSR_DR       0x01    /* Data ready           */
@@ -111,6 +142,7 @@
 #define UART_LSR_THRE     0x20    /* Xmit hold reg empty  */
 #define UART_LSR_TEMT     0x40    /* Xmitter empty        */
 #define UART_LSR_ERR      0x80    /* Error                */
+#define UART_LSR_MASK     (UART_LSR_OE | UART_LSR_BI)
=20
 /* These parity settings can be ORed directly into the LCR. */
 #define UART_PARITY_NONE  (0<<3)
--=20
2.34.1



