Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1164A849BCB
	for <lists+xen-devel@lfdr.de>; Mon,  5 Feb 2024 14:30:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.676047.1051836 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWz3C-0005Om-JX; Mon, 05 Feb 2024 13:30:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 676047.1051836; Mon, 05 Feb 2024 13:30:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rWz3C-0005MV-Gu; Mon, 05 Feb 2024 13:30:18 +0000
Received: by outflank-mailman (input) for mailman id 676047;
 Mon, 05 Feb 2024 13:30:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=8/S5=JO=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rWz3B-0004HJ-E0
 for xen-devel@lists.xenproject.org; Mon, 05 Feb 2024 13:30:17 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b2dab967-c42a-11ee-8a45-1f161083a0e0;
 Mon, 05 Feb 2024 14:30:16 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40fd280421aso15725275e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Feb 2024 05:30:16 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 n10-20020a5d67ca000000b0033b3cf1ff09sm2278382wrw.29.2024.02.05.05.30.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Feb 2024 05:30:15 -0800 (PST)
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
X-Inumbo-ID: b2dab967-c42a-11ee-8a45-1f161083a0e0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707139816; x=1707744616; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0DlbwChHh3lVOiwYmNPTJJLzXFhauBoipOMIM8LYm04=;
        b=fFKq0LqqmrSiqo+Cli0FN1OV82rY8UgBbtiETk0CUTgAR/A/2y6iK5ZcekWPfswbLg
         TWUTiH0KaUCD+r1tDOzYrQmco+Qu8VB1GDlpxVUnZeiw3xvEHLHrdP10py7ppP5vDpQ3
         uK6aZ0gqb9sxgq1ondzBcl6HgaJtVcJvxbS3QV92GH07uuVvOVVAJBIWPiJCgMyVRXRP
         4vHgND8Yk62tig7OJY66FUSe/b3ZUcaftSKnlICYyS2MaYGgZpz7P4cp6VLL1WbI9tsh
         d9Daqyg2jp++JjXbfpmdHtuGj5nwnQzutg/ndlqK4p5FhK7WobdPWRX3R4lJzZ81UG92
         Xdjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707139816; x=1707744616;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0DlbwChHh3lVOiwYmNPTJJLzXFhauBoipOMIM8LYm04=;
        b=CUPfr58Q1dDsEWfJVXWK6sKSsHvuQDcQ5jg13Sc9ssFoIK3t4CtqoUPEIqAtluvofu
         euNx/4Q3eJ4dECEPHYJgh7LVF4NX+Y1wjyg1I53nYh3NHJCkJ2n5lprWIUgGisMtYYHv
         JTxu2/Pb4wnz9SFN9TQMlcBTcfzSRthg7I0P5ZlUwHpgBRP7V26oADTP5V8xEcAiHDpr
         CwsxAKQQwI4s24qxUb2orQ0fzoaLmkP8kn8BLIz9+hrhTsV46WmHcF6T5Pm8L6zHzX1J
         p7Syy/Oulvz1n0ViXOu2tfw+WnenZeOAK9vkMP4z1jOrG1opKeN75u/ByuNditDAAW1b
         ZNoA==
X-Gm-Message-State: AOJu0YwSz86IRUvLhE495Y8GAKGKU/vpuTPkVQzRKshOH1kIqA15ljHX
	tz6M2wZMWjRdFnNXG+W96bxn1o2emEAWCpK13wf2BsOPpPV2cOHuMBZbUbsARs+vcLxahpEV4uM
	=
X-Google-Smtp-Source: AGHT+IEWfBJhc0XvEQRQk7IjE0kBMObIrmCcQzT6dWwQH+7AdZByvK3ccdT0AUCQHrl2vijDWLcVcw==
X-Received: by 2002:adf:a39b:0:b0:33a:fc6e:c728 with SMTP id l27-20020adfa39b000000b0033afc6ec728mr6175580wrb.32.1707139815886;
        Mon, 05 Feb 2024 05:30:15 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWFJN9zGAhJw44sNlKGBPB2AVw9uieWHp0F7BpfVyryjKkSP6jkROxDikQOcnmwgCoRAYGpUHUMeYKj/wSXFgipt/nLruwrbXeUR63nhh1KYMp/LB2aNBwERpjto3WYIHaZ7F9PAk9ND0OGeTUOvUQsNPJi+NesYbMNX/Kl/bLgG+R9ln1AMx9XIiG2JDWAGn+lKnaWz0wYtDbx6GrpC8Hg0MzCufcerGTzILpk/1RS7Bk8cHT2B5r7vR7GkLPZAU6KqO3d+nzhUA==
Message-ID: <93aec041-70f6-4385-9a52-8808e0cea931@suse.com>
Date: Mon, 5 Feb 2024 14:30:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 5/8] serial: drop serial_[rt]x_interrupt()'s regs parameter
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Michal Orzel <michal.orzel@amd.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <volodymyr_babchuk@epam.com>
References: <ebc330a9-eafa-4858-b5cf-5694c4da911d@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <ebc330a9-eafa-4858-b5cf-5694c4da911d@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

They're simply not needed anymore.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
---
v2: Setting of IRQ regs split off to an earlier patch.

--- a/xen/drivers/char/cadence-uart.c
+++ b/xen/drivers/char/cadence-uart.c
@@ -51,7 +51,7 @@ static void cuart_interrupt(int irq, voi
         /* ACK.  */
         if ( status & UART_SR_INTR_RTRIG )
         {
-            serial_rx_interrupt(port, regs);
+            serial_rx_interrupt(port);
             cuart_write(uart, R_UART_CISR, UART_SR_INTR_RTRIG);
         }
     } while ( status & UART_SR_INTR_RTRIG );
--- a/xen/drivers/char/ehci-dbgp.c
+++ b/xen/drivers/char/ehci-dbgp.c
@@ -1273,10 +1273,10 @@ static void cf_check _ehci_dbgp_poll(str
     old_regs = set_irq_regs(regs);
 
     if ( dbgp->in.chunk )
-        serial_rx_interrupt(port, regs);
+        serial_rx_interrupt(port);
 
     if ( empty )
-        serial_tx_interrupt(port, regs);
+        serial_tx_interrupt(port);
 
     set_irq_regs(old_regs);
 
--- a/xen/drivers/char/exynos4210-uart.c
+++ b/xen/drivers/char/exynos4210-uart.c
@@ -81,7 +81,7 @@ static void exynos4210_uart_interrupt(in
         if ( status & (UINTM_RXD | UINTM_ERROR) )
         {
             /* uart->regs[UINTM] |= RXD|ERROR; */
-            serial_rx_interrupt(port, regs);
+            serial_rx_interrupt(port);
             /* uart->regs[UINTM] &= ~(RXD|ERROR); */
             exynos4210_write(uart, UINTP, UINTM_RXD | UINTM_ERROR);
         }
@@ -89,7 +89,7 @@ static void exynos4210_uart_interrupt(in
         if ( status & (UINTM_TXD | UINTM_MODEM) )
         {
             /* uart->regs[UINTM] |= TXD|MODEM; */
-            serial_tx_interrupt(port, regs);
+            serial_tx_interrupt(port);
             /* uart->regs[UINTM] &= ~(TXD|MODEM); */
             exynos4210_write(uart, UINTP, UINTM_TXD | UINTM_MODEM);
         }
--- a/xen/drivers/char/imx-lpuart.c
+++ b/xen/drivers/char/imx-lpuart.c
@@ -48,10 +48,10 @@ static void imx_lpuart_interrupt(int irq
     rxcnt = imx_lpuart_read(uart, UARTWATER) >> UARTWATER_RXCNT_OFF;
 
     if ( (sts & UARTSTAT_RDRF) || (rxcnt > 0) )
-	    serial_rx_interrupt(port, regs);
+	    serial_rx_interrupt(port);
 
     if ( sts & UARTSTAT_TDRE )
-	    serial_tx_interrupt(port, regs);
+	    serial_tx_interrupt(port);
 
     imx_lpuart_write(uart, UARTSTAT, sts);
 }
--- a/xen/drivers/char/meson-uart.c
+++ b/xen/drivers/char/meson-uart.c
@@ -69,10 +69,10 @@ static void meson_uart_interrupt(int irq
     uint32_t st = readl(uart->regs + AML_UART_STATUS_REG);
 
     if ( !(st & AML_UART_RX_FIFO_EMPTY) )
-        serial_rx_interrupt(port, regs);
+        serial_rx_interrupt(port);
 
     if ( !(st & AML_UART_TX_FIFO_FULL) )
-        serial_tx_interrupt(port, regs);
+        serial_tx_interrupt(port);
 }
 
 static void __init meson_uart_init_preirq(struct serial_port *port)
--- a/xen/drivers/char/mvebu-uart.c
+++ b/xen/drivers/char/mvebu-uart.c
@@ -76,10 +76,10 @@ static void mvebu3700_uart_interrupt(int
 
     if ( st & (STATUS_RX_RDY | STATUS_OVR_ERR | STATUS_FRM_ERR |
                STATUS_BRK_DET) )
-        serial_rx_interrupt(port, regs);
+        serial_rx_interrupt(port);
 
     if ( st & STATUS_TX_RDY )
-        serial_tx_interrupt(port, regs);
+        serial_tx_interrupt(port);
 }
 
 static void __init mvebu3700_uart_init_preirq(struct serial_port *port)
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -188,9 +188,9 @@ static void cf_check ns16550_interrupt(
         u8 lsr = ns_read_reg(uart, UART_LSR);
 
         if ( (lsr & uart->lsr_mask) == uart->lsr_mask )
-            serial_tx_interrupt(port, regs);
+            serial_tx_interrupt(port);
         if ( lsr & UART_LSR_DR )
-            serial_rx_interrupt(port, regs);
+            serial_rx_interrupt(port);
 
         /* A "busy-detect" condition is observed on Allwinner/sunxi UART
          * after LCR is written during setup. It needs to be cleared at
@@ -224,11 +224,11 @@ static void cf_check __ns16550_poll(stru
         if ( ns16550_ioport_invalid(uart) )
             goto out;
 
-        serial_rx_interrupt(port, regs);
+        serial_rx_interrupt(port);
     }
 
     if ( ( ns_read_reg(uart, UART_LSR) & uart->lsr_mask ) == uart->lsr_mask )
-        serial_tx_interrupt(port, regs);
+        serial_tx_interrupt(port);
 
 out:
     set_irq_regs(old_regs);
--- a/xen/drivers/char/omap-uart.c
+++ b/xen/drivers/char/omap-uart.c
@@ -70,9 +70,9 @@ static void omap_uart_interrupt(int irq,
     {
         lsr = omap_read(uart, UART_LSR) & 0xff;
 	if ( lsr & UART_LSR_THRE )
-            serial_tx_interrupt(port, regs);
+            serial_tx_interrupt(port);
 	if ( lsr & UART_LSR_DR )
-            serial_rx_interrupt(port, regs);
+            serial_rx_interrupt(port);
 
         if ( port->txbufc == port->txbufp ) {
             reg = omap_read(uart, UART_IER);
--- a/xen/drivers/char/pl011.c
+++ b/xen/drivers/char/pl011.c
@@ -95,7 +95,7 @@ static void pl011_interrupt(int irq, voi
             pl011_write(uart, ICR, status & ~(TXI|RTI|RXI));
 
             if ( status & (RTI|RXI) )
-                serial_rx_interrupt(port, regs);
+                serial_rx_interrupt(port);
 
             /* TODO
                 if ( status & (DSRMI|DCDMI|CTSMI|RIMI) )
@@ -103,7 +103,7 @@ static void pl011_interrupt(int irq, voi
             */
 
             if ( status & (TXI) )
-                serial_tx_interrupt(port, regs);
+                serial_tx_interrupt(port);
 
             status = pl011_intr_status(uart);
         } while (status != 0);
--- a/xen/drivers/char/scif-uart.c
+++ b/xen/drivers/char/scif-uart.c
@@ -119,11 +119,11 @@ static void scif_uart_interrupt(int irq,
     {
         /* TX Interrupt */
         if ( status & SCFSR_TDFE )
-            serial_tx_interrupt(port, regs);
+            serial_tx_interrupt(port);
 
         /* RX Interrupt */
         if ( status & (SCFSR_RDF | SCFSR_DR) )
-            serial_rx_interrupt(port, regs);
+            serial_rx_interrupt(port);
 
         /* Error Interrupt */
         if ( status & params->error_mask )
--- a/xen/drivers/char/serial.c
+++ b/xen/drivers/char/serial.c
@@ -45,7 +45,7 @@ static inline void serial_stop_tx(struct
         port->driver->stop_tx(port);
 }
 
-void serial_rx_interrupt(struct serial_port *port, struct cpu_user_regs *regs)
+void serial_rx_interrupt(struct serial_port *port)
 {
     char c;
     serial_rx_fn fn = NULL;
@@ -71,7 +71,7 @@ void serial_rx_interrupt(struct serial_p
         fn(c & 0x7f);
 }
 
-void serial_tx_interrupt(struct serial_port *port, struct cpu_user_regs *regs)
+void serial_tx_interrupt(struct serial_port *port)
 {
     int i, n;
     unsigned long flags;
--- a/xen/drivers/char/xhci-dbc.c
+++ b/xen/drivers/char/xhci-dbc.c
@@ -1180,9 +1180,9 @@ static void cf_check dbc_uart_poll(void
     old_regs = set_irq_regs(guest_cpu_user_regs());
 
     while ( dbc_work_ring_size(&dbc->dbc_iwork) )
-        serial_rx_interrupt(port, guest_cpu_user_regs());
+        serial_rx_interrupt(port);
 
-    serial_tx_interrupt(port, guest_cpu_user_regs());
+    serial_tx_interrupt(port);
 
     set_irq_regs(old_regs);
     set_timer(&uart->timer, NOW() + MICROSECS(DBC_POLL_INTERVAL));
--- a/xen/include/xen/serial.h
+++ b/xen/include/xen/serial.h
@@ -12,8 +12,6 @@
 #include <xen/init.h>
 #include <xen/spinlock.h>
 
-struct cpu_user_regs;
-
 /* Register a character-receive hook on the specified COM port. */
 typedef void (*serial_rx_fn)(char c);
 void serial_set_rx_handler(int handle, serial_rx_fn fn);
@@ -155,8 +153,8 @@ void serial_register_uart(int idx, struc
 /* Place the serial port into asynchronous transmit mode. */
 void serial_async_transmit(struct serial_port *port);
 /* Process work in interrupt context. */
-void serial_rx_interrupt(struct serial_port *port, struct cpu_user_regs *regs);
-void serial_tx_interrupt(struct serial_port *port, struct cpu_user_regs *regs);
+void serial_rx_interrupt(struct serial_port *port);
+void serial_tx_interrupt(struct serial_port *port);
 
 /*
  * Initialisers for individual uart drivers.


