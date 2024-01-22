Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3188364C5
	for <lists+xen-devel@lfdr.de>; Mon, 22 Jan 2024 14:51:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.669928.1042486 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRuhm-0004Zx-Te; Mon, 22 Jan 2024 13:51:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 669928.1042486; Mon, 22 Jan 2024 13:51:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rRuhm-0004Xe-QL; Mon, 22 Jan 2024 13:51:14 +0000
Received: by outflank-mailman (input) for mailman id 669928;
 Mon, 22 Jan 2024 13:51:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VPlZ=JA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rRuhl-0004XY-IT
 for xen-devel@lists.xenproject.org; Mon, 22 Jan 2024 13:51:13 +0000
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [2a00:1450:4864:20::22b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4d1576c0-b92d-11ee-9b0f-b553b5be7939;
 Mon, 22 Jan 2024 14:51:11 +0100 (CET)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2cdeb80fdfdso34067331fa.2
 for <xen-devel@lists.xenproject.org>; Mon, 22 Jan 2024 05:51:11 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 cw13-20020a05663849cd00b0046e627dbc4csm3035114jab.121.2024.01.22.05.51.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Jan 2024 05:51:10 -0800 (PST)
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
X-Inumbo-ID: 4d1576c0-b92d-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1705931471; x=1706536271; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0DlbwChHh3lVOiwYmNPTJJLzXFhauBoipOMIM8LYm04=;
        b=GIs0n7VImCPALKZLXJT6DVRMX/0lelm0/pok4oh/GBA8SGvF9HNjf984nychVNr4hY
         AsAfEBjezel0RQQTK90p4k3y3xj786AKtA3bCUhZPJU6Y2ePrgVia2I6iehfqxZFuURj
         cq0ri8xTAHS3nxExCoBPFpcNLiM4rEolKS01gU2HSM4PYHq2NIo4RHmbtU7ni8/N8jhe
         3kjs9+anJx0lfTwLT7XIcZSL3G5Qb/MCCM6i63DftYGgy736OzCYlEYCvAvETD93kV+f
         K42yHtPLw+0kEsrS6kuqsbkTEq6QGWhMROI4hmDU/Cld20x0ShwCowm6wlXAsZgvugG8
         M+8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705931471; x=1706536271;
        h=content-transfer-encoding:in-reply-to:autocrypt:references:cc:to
         :from:content-language:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0DlbwChHh3lVOiwYmNPTJJLzXFhauBoipOMIM8LYm04=;
        b=Rld5QhbFoL1YeUUoDMjCMnJdoCNJhLcuN3wQQD8tfeqlmzUjGKLpw5qR3rJaRqZFP+
         iOCP4jtIV/dp1RmdOKFSJv4Y7+yOGWJuJsPAEB0ahcPo3l8SlHh95ONC7CoWGMDOPFPu
         qyLpsolIUqMtvZJwAsJL2tJi5y5bRR6PMBWUKWbzKJEorDemUVRgJIvMs9mhmET56jMS
         U0/HYjA2oPf+Aw2eIaCPxcEcU0+Zv+CQgL7NhDafi7l0y6niJ+LgoESGB8rnp6NaSEbB
         ddd73g3DdrdmXUlPJw4Vi3RXI4gMtxEUpAWSM56GO2lXxIp24GTw5ELGSPz6BGgCgQNK
         z8bw==
X-Gm-Message-State: AOJu0YwkVlG/X5T8SnKTodTlHYhJnT6B4JmdVDJ3ppQ6PuEGZLCaPsVv
	bjPrIiAXsidEnx4YyJCvZqVfW9YDyGe8sUZx2ucPQgRYEwX0EUGm9nwQyIdsitnuVmctqPt0F3c
	=
X-Google-Smtp-Source: AGHT+IGBuTNm1MoxvXDHdtdm1SYp6BAOZ9TKrCNTmDrmshgXeB12M6qM7pvuTd3OZ7uvVPSzop++OA==
X-Received: by 2002:a05:651c:19a3:b0:2cd:54d:4838 with SMTP id bx35-20020a05651c19a300b002cd054d4838mr865048ljb.53.1705931470896;
        Mon, 22 Jan 2024 05:51:10 -0800 (PST)
Message-ID: <6a40828d-35fa-458c-8b31-5768e54498d7@suse.com>
Date: Mon, 22 Jan 2024 14:51:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 6/8] serial: drop serial_[rt]x_interrupt()'s regs parameter
Content-Language: en-US
From: Jan Beulich <jbeulich@suse.com>
To: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <33db57a2-b569-4fa8-b0b0-36ea92528d7b@suse.com>
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
In-Reply-To: <33db57a2-b569-4fa8-b0b0-36ea92528d7b@suse.com>
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


