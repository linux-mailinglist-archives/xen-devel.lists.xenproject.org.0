Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E92782A868
	for <lists+xen-devel@lfdr.de>; Thu, 11 Jan 2024 08:34:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.665949.1036306 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNpaF-0000Yv-4R; Thu, 11 Jan 2024 07:34:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 665949.1036306; Thu, 11 Jan 2024 07:34:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rNpaE-0000XL-W4; Thu, 11 Jan 2024 07:34:34 +0000
Received: by outflank-mailman (input) for mailman id 665949;
 Thu, 11 Jan 2024 07:34:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=YFj+=IV=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rNpaD-0000XC-OO
 for xen-devel@lists.xenproject.org; Thu, 11 Jan 2024 07:34:33 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id dc9aadaf-b053-11ee-98f0-6d05b1d4d9a1;
 Thu, 11 Jan 2024 08:34:32 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-40e60e13581so1653715e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 10 Jan 2024 23:34:32 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d6-20020a056000114600b003366a9cb0d1sm444087wrx.92.2024.01.10.23.34.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Jan 2024 23:34:31 -0800 (PST)
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
X-Inumbo-ID: dc9aadaf-b053-11ee-98f0-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1704958472; x=1705563272; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oZKCYOY6gg3N8LW61PDUiaDApFPPurPi/J2T7sVSPdg=;
        b=N2j4rO7/S+XmTPoGdFpAWuiF5LOKyPQeVsXICi3HUfxGYNjC8qYx2rtTQeSntGB83i
         4n+MLfolAdp4ddeDqhWHJDILkOvU4rr6vkH1yUo/l5NMoD/v8kAqettQaSWlXcdmKwXi
         qybgOFjsmCtERMZol5MaIN21eaji3GfQDxOyJJKT0tz6sKZAZSuAk8dlBmwrzSOWdh/Q
         OMlVHYqGWIJuDtdYHi8CsJlY8vwonSn3OvUSbTUEQocNgDMbK6UrkY9Zp52ocr+uipWN
         ctrQziUZuYwEn6DDSdazGMp2VHrMWwL9ASMxD7rw2D7fIyZl0/h9S1Zk16f3pg0ObclS
         aGgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704958472; x=1705563272;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oZKCYOY6gg3N8LW61PDUiaDApFPPurPi/J2T7sVSPdg=;
        b=EKWn6BWSQFGTniCcbYOmQiCEwZGi9Ny2c995Omcq4o7GOV1SgFCzRFAmlXU9iBr0QY
         8GyA+1w/3455rRbIct6yt+Bj4ILhJVJS5Pij1Qi8PYEDcGUAW+CMcgyqXFditZ/9NdEc
         wd1dJPnv2auJC3zWDJfZsUnut5Zp+YKqHphqNUAmSnSVt8BfzCeyBghIoDg6ADJkhSCo
         pSTUSaGhIGNscxhkPNEEZdeOfB44If8dIw6YQgYHRVj5CK2TfVXcbZF+gsthHvMAPR/I
         Eo1qTjvAWsS6hlR91WXi4JQb7kUQy3UPiYoy2ykXNNnQeQcJPai2BK9+QyScEeQ+k1yn
         VMWA==
X-Gm-Message-State: AOJu0YzXwqqYcDj0v09+D/xu9Qnzx6DYSU+9yDMFflYWgPbn7CjW6Hf/
	0xPofrACCtYXhNAlcUZmpVRda0+St+N1U2aDioXSUFruYg==
X-Google-Smtp-Source: AGHT+IHLJlz2c/qbYVyOLjZctY3pLI6OSnMk/W+Ulnl4UM8Mb2lIMCrBge74IAUwiV/oUu+Fgj+CmQ==
X-Received: by 2002:a05:600c:314f:b0:40e:49ac:e4a6 with SMTP id h15-20020a05600c314f00b0040e49ace4a6mr107078wmo.171.1704958472053;
        Wed, 10 Jan 2024 23:34:32 -0800 (PST)
Message-ID: <05b1284a-988c-4f91-9cde-4751332aaa96@suse.com>
Date: Thu, 11 Jan 2024 08:34:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH 5/8] serial: drop serial_[rt]x_interrupt()'s regs parameter
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <1ab231ec-5e3c-4662-8530-2213bc52bb7c@suse.com>
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
In-Reply-To: <1ab231ec-5e3c-4662-8530-2213bc52bb7c@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

In the the polling functions (ab)using set_irq_regs() is necessary
to balance the change. This is in preparation of dropping the register
parameters from IRQ handler functions.

Signed-off-by: Jan Beulich <jbeulich@suse.com>

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
@@ -1253,6 +1253,7 @@ static void cf_check _ehci_dbgp_poll(str
     unsigned long flags;
     unsigned int timeout = MICROSECS(DBGP_CHECK_INTERVAL);
     bool empty = false;
+    struct cpu_user_regs *old_regs;
 
     if ( !dbgp->ehci_debug )
         return;
@@ -1268,11 +1269,16 @@ static void cf_check _ehci_dbgp_poll(str
         spin_unlock_irqrestore(&port->tx_lock, flags);
     }
 
+    /* Mimic interrupt context. */
+    old_regs = set_irq_regs(regs);
+
     if ( dbgp->in.chunk )
-        serial_rx_interrupt(port, regs);
+        serial_rx_interrupt(port);
 
     if ( empty )
-        serial_tx_interrupt(port, regs);
+        serial_tx_interrupt(port);
+
+    set_irq_regs(old_regs);
 
     if ( spin_trylock_irqsave(&port->tx_lock, flags) )
     {
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
@@ -211,22 +211,27 @@ static void cf_check __ns16550_poll(stru
 {
     struct serial_port *port = this_cpu(poll_port);
     struct ns16550 *uart = port->uart;
+    struct cpu_user_regs *old_regs;
 
     if ( uart->intr_works )
         return; /* Interrupts work - no more polling */
 
+    /* Mimic interrupt context. */
+    old_regs = set_irq_regs(regs);
+
     while ( ns_read_reg(uart, UART_LSR) & UART_LSR_DR )
     {
         if ( ns16550_ioport_invalid(uart) )
             goto out;
 
-        serial_rx_interrupt(port, regs);
+        serial_rx_interrupt(port);
     }
 
     if ( ( ns_read_reg(uart, UART_LSR) & uart->lsr_mask ) == uart->lsr_mask )
-        serial_tx_interrupt(port, regs);
+        serial_tx_interrupt(port);
 
 out:
+    set_irq_regs(old_regs);
     set_timer(&uart->timer, NOW() + MILLISECS(uart->timeout_ms));
 }
 
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
@@ -1164,6 +1164,7 @@ static void cf_check dbc_uart_poll(void
     struct dbc_uart *uart = port->uart;
     struct dbc *dbc = &uart->dbc;
     unsigned long flags = 0;
+    struct cpu_user_regs *old_regs;
 
     if ( spin_trylock_irqsave(&port->tx_lock, flags) )
     {
@@ -1175,10 +1176,15 @@ static void cf_check dbc_uart_poll(void
         spin_unlock_irqrestore(&port->tx_lock, flags);
     }
 
+    /* Mimic interrupt context. */
+    old_regs = set_irq_regs(guest_cpu_user_regs());
+
     while ( dbc_work_ring_size(&dbc->dbc_iwork) )
-        serial_rx_interrupt(port, guest_cpu_user_regs());
+        serial_rx_interrupt(port);
+
+    serial_tx_interrupt(port);
 
-    serial_tx_interrupt(port, guest_cpu_user_regs());
+    set_irq_regs(old_regs);
     set_timer(&uart->timer, NOW() + MICROSECS(DBC_POLL_INTERVAL));
 }
 
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


