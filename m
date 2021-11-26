Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B585E45EEAE
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 14:07:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.232834.403950 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqawv-0002Xe-Qh; Fri, 26 Nov 2021 13:07:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 232834.403950; Fri, 26 Nov 2021 13:07:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqawv-0002K3-5C; Fri, 26 Nov 2021 13:07:33 +0000
Received: by outflank-mailman (input) for mailman id 232834;
 Fri, 26 Nov 2021 13:07:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=k+gV=QN=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1mqauz-0003W9-DW
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 13:05:33 +0000
Received: from esa4.hc3370-68.iphmx.com (esa4.hc3370-68.iphmx.com
 [216.71.155.144]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 85fddd33-4eb9-11ec-a9d2-d9f7a1cc8784;
 Fri, 26 Nov 2021 14:05:26 +0100 (CET)
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
X-Inumbo-ID: 85fddd33-4eb9-11ec-a9d2-d9f7a1cc8784
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1637931926;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/bd2B5JZciwzE0+dMFIIH8KGXsdKJbiMpcA3tfgV6qI=;
  b=SLGI0254T9VpElD45XhyqRsctBGtlclB7XQKXU3d1hpfJCp4hD8iKdJy
   N+ji/VC2804D0nXk6uzM5frH3NlvqYl1I5SIrhh4aMUAJYWum0FMTDmXG
   dileimY3NOM0IMDj8TNzDCINfysrTzyE5FFTxadd6G1ZtdfqbvTGb+1LX
   Y=;
Authentication-Results: esa4.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: 0VJ2VbQS0zNheQg0h9xjkyhHsASv7a5dOFTxhYilSCwNr3j0B1FRaOedFFg/lPGWHzIDGsFF3X
 oPBzHHrz1karrjowWj8EyjucIMekvPWhhld5b7oiPSNKba5sXrVp2U3AxBQH0nxd1h0yseAXF/
 xPF5WfHHifL6Xaalc7MiY2DB3CnguJ2Fvy8OLW3QjaHsO9teLD4wrvz6fpPIuv4S7eXnGs+zli
 O1DWBhSPudphVpaSifwp9s4R8PIIz+yn5EnyPh2l7gvdvn7u5DyrQOFs4+/PXdSEJq0VeEFdlF
 kQixZx/2ecQKVpAUzS/KYunu
X-SBRS: 5.1
X-MesageID: 60695278
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:WoulwKATvpnLFBVW/9zkw5YqxClBgxIJ4kV8jS/XYbTApDh0hTBWz
 mJNW2jQMvfbYGP0L48jOt/g8xsE7J/Sy9JlQQY4rX1jcSlH+JHPbTi7wuYcHM8wwunrFh8PA
 xA2M4GYRCwMo/u1Si6FatANl1ElvU2zbue6WLGs1hxZH1c+EX5400w7wYbVv6Yz6TSHK1LV0
 T/Ni5W31G+Ng1aY5UpNtspvADs21BjDkGtwUm4WPJinj3eH/5UhN7oNJLnZEpfNatI88thW5
 Qr05OrREmvxp3/BAz4++1rxWhVirrX6ZWBihpfKMkQLb9crSiEai84G2PQghUh/jnbOpuxo6
 ddxtN+rYkQqFajItcY4TEwNe81+FfUuFL7vJHG+tYqYzlHccmuqyPJrZK00FdRGoKAtWzgIr
 KFGbmBWBvyAr7veLLaTY+9gnMk8auLsO5sSoCpIxjDFF/c2B5vERs0m4PcGhGlh25oRTZ4yY
 eI7eQhJMSnFYyFIJw0XCaM3rtWsh3bgJmgwRFW9+vNsvjm7IBZK+KfpGMrYfJqNX8o9tkSFo
 mPL+UzpDxdcM8aQoRKe6W6ljOLLmSL9WaoRGae++/osh0ecrkQDBRtTWValrP2Rjk+lR8kZO
 0ES4jApr6U56AqsVNaVdz+SrWOAvxUcc8FNCOB84waIopc4+C7AWDJCFGQYLoV76olmHlTGy
 2NlgfvsRntWjKS0S06ctay/7jCZPCw4D0odMHpsoRQ+3/Hvp4Q6jxTqR9llEbKogtCdJQwc0
 wxmvwBl2exN0JdjO7GTuAme3mny/sShohsdv12PBgqYAhVFiJlJjmBCwXzS9r5+IYmQVTFtV
 1BUypHFvIji4Xxg/RFhodnh/pn1uJ5p0xWG2DaD+qXNERz2oBZPmqgKvVlDyL9BaJpsRNMQS
 Ba7VfltzJFSJmC2SqR8fpi8Dc8npYC5S4+6Bq6JMYsSPMQqHONiwM2ITRXLt4wKuBJx+ZzTx
 L/BKZr8ZZrkIfgPIMWKqxc1juZwm3FWKZL7TpHn1RW3uYdyl1bOIYrpxGCmN7hjhIvd+V292
 48Ga6OilkUOOMWjM3K/2dNCcjg3wY0TWMmeRzp/LbXYfGKL2QgJVpfs/F/WU9A/wvkOyL6Xp
 irVt40x4AOXuEAr4D6iMhhLAI4Dl74lxZ7iFSBzb1uuxVY5ZoOjsPUWe5ctJOF1/+1/1/9kC
 fICfpzYUPhITz3G/RUbbIX889M+JEj621rWMnr3eiU7cr5hWxfNpo3ucDzw+XRcFSGwr8Y//
 eGtj1uJXZoZSg1+J8/Kc/bznUiptH0QlbsqDUvFK9VeYmv2941uJ3Cjh/M7OZhUex7C2iGbx
 0CdBhJB/bvBpIo88d/og6GYrtj2T7siTxQCR2SCtOS4LyjX+Gan0LRsaufQcGCPTn7w9YWje
 f5Rk6P2PsoYkQsYqIF7Cbtqk/4zvoO9u79Aww14N3zXdFD3WKh4K3yL0MQT5K1AwrhV5Vm/V
 k6Vo4QIPLyIPIXuEUILJRpjZeOGjKlGlj7X5PUzAUP7+C4oo+bXDRQMZ0GB2H5HMb94EII52
 uNw6scZ5ju2hgcuLtvb3Dtf8H6BLyBYXqgq3n3A7FQHVub/Jol+XKHh
IronPort-HdrOrdr: A9a23:SwZyDa9XhqFTZsU/0rJuk+DgI+orL9Y04lQ7vn2YSXRuHPBw8P
 re5cjztCWE7gr5N0tBpTntAsW9qDbnhPtICOoqTNCftWvdyQiVxehZhOOIqVDd8m/Fh4pgPM
 9bAtBD4bbLbGSS4/yU3ODBKadD/OW6
X-IronPort-AV: E=Sophos;i="5.87,266,1631592000"; 
   d="scan'208";a="60695278"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu
	<wl@xen.org>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 25/65] xen/console: Annotate fnptr targets
Date: Fri, 26 Nov 2021 12:34:06 +0000
Message-ID: <20211126123446.32324-26-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211126123446.32324-1-andrew.cooper3@citrix.com>
References: <20211126123446.32324-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Stefano Stabellini <sstabellini@kernel.org>
CC: Wei Liu <wl@xen.org>
CC: Julien Grall <julien@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/drivers/char/console.c   |  4 ++--
 xen/drivers/char/ehci-dbgp.c | 24 +++++++++++++-----------
 xen/drivers/char/ns16550.c   | 26 +++++++++++++-------------
 3 files changed, 28 insertions(+), 26 deletions(-)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 380765ab02fd..d9d6556c2293 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -552,7 +552,7 @@ static void __serial_rx(char c, struct cpu_user_regs *regs)
 #endif
 }
 
-static void serial_rx(char c, struct cpu_user_regs *regs)
+static void cf_check serial_rx(char c, struct cpu_user_regs *regs)
 {
     static int switch_code_count = 0;
 
@@ -1286,7 +1286,7 @@ void panic(const char *fmt, ...)
  * **************************************************************
  */
 
-static void suspend_steal_fn(const char *str, size_t nr) { }
+static void cf_check suspend_steal_fn(const char *str, size_t nr) { }
 static int suspend_steal_id;
 
 int console_suspend(void)
diff --git a/xen/drivers/char/ehci-dbgp.c b/xen/drivers/char/ehci-dbgp.c
index a6b57fdf2d19..e205c0da6a61 100644
--- a/xen/drivers/char/ehci-dbgp.c
+++ b/xen/drivers/char/ehci-dbgp.c
@@ -1000,13 +1000,15 @@ static int ehci_dbgp_external_startup(struct ehci_dbgp *dbgp)
 
 typedef void (*set_debug_port_t)(struct ehci_dbgp *, unsigned int);
 
-static void default_set_debug_port(struct ehci_dbgp *dbgp, unsigned int port)
+static void cf_check default_set_debug_port(
+    struct ehci_dbgp *dbgp, unsigned int port)
 {
 }
 
 static set_debug_port_t __read_mostly set_debug_port = default_set_debug_port;
 
-static void nvidia_set_debug_port(struct ehci_dbgp *dbgp, unsigned int port)
+static void cf_check nvidia_set_debug_port(
+    struct ehci_dbgp *dbgp, unsigned int port)
 {
     uint32_t dword = pci_conf_read32(PCI_SBDF(0, dbgp->bus, dbgp->slot,
                                               dbgp->func), 0x74);
@@ -1167,7 +1169,7 @@ static inline void _ehci_dbgp_flush(struct ehci_dbgp *dbgp)
     dbgp->out.chunk = 0;
 }
 
-static void ehci_dbgp_flush(struct serial_port *port)
+static void cf_check ehci_dbgp_flush(struct serial_port *port)
 {
     struct ehci_dbgp *dbgp = port->uart;
     s_time_t goal;
@@ -1196,7 +1198,7 @@ static void ehci_dbgp_flush(struct serial_port *port)
        set_timer(&dbgp->timer, goal);
 }
 
-static void ehci_dbgp_putc(struct serial_port *port, char c)
+static void cf_check ehci_dbgp_putc(struct serial_port *port, char c)
 {
     struct ehci_dbgp *dbgp = port->uart;
 
@@ -1209,7 +1211,7 @@ static void ehci_dbgp_putc(struct serial_port *port, char c)
         ehci_dbgp_flush(port);
 }
 
-static int ehci_dbgp_tx_ready(struct serial_port *port)
+static int cf_check ehci_dbgp_tx_ready(struct serial_port *port)
 {
     struct ehci_dbgp *dbgp = port->uart;
 
@@ -1228,7 +1230,7 @@ static int ehci_dbgp_tx_ready(struct serial_port *port)
            (dbgp->state == dbgp_idle) * DBGP_MAX_PACKET;
 }
 
-static int ehci_dbgp_getc(struct serial_port *port, char *pc)
+static int cf_check ehci_dbgp_getc(struct serial_port *port, char *pc)
 {
     struct ehci_dbgp *dbgp = port->uart;
 
@@ -1309,7 +1311,7 @@ static bool_t ehci_dbgp_setup_preirq(struct ehci_dbgp *dbgp)
     return 0;
 }
 
-static void __init ehci_dbgp_init_preirq(struct serial_port *port)
+static void __init cf_check ehci_dbgp_init_preirq(struct serial_port *port)
 {
     struct ehci_dbgp *dbgp = port->uart;
     u32 debug_port, offset;
@@ -1358,7 +1360,7 @@ static void ehci_dbgp_setup_postirq(struct ehci_dbgp *dbgp)
     set_timer(&dbgp->timer, NOW() + MILLISECS(1));
 }
 
-static void __init ehci_dbgp_init_postirq(struct serial_port *port)
+static void __init cf_check ehci_dbgp_init_postirq(struct serial_port *port)
 {
     struct ehci_dbgp *dbgp = port->uart;
 
@@ -1409,12 +1411,12 @@ static int ehci_dbgp_check_release(struct ehci_dbgp *dbgp)
     return 0;
 }
 
-static void __init ehci_dbgp_endboot(struct serial_port *port)
+static void __init cf_check ehci_dbgp_endboot(struct serial_port *port)
 {
     ehci_dbgp_check_release(port->uart);
 }
 
-static void ehci_dbgp_suspend(struct serial_port *port)
+static void cf_check ehci_dbgp_suspend(struct serial_port *port)
 {
     struct ehci_dbgp *dbgp = port->uart;
 
@@ -1431,7 +1433,7 @@ static void ehci_dbgp_suspend(struct serial_port *port)
     dbgp->state = dbgp_unsafe;
 }
 
-static void ehci_dbgp_resume(struct serial_port *port)
+static void cf_check ehci_dbgp_resume(struct serial_port *port)
 {
     struct ehci_dbgp *dbgp = port->uart;
 
diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index 990cad39fe85..8df1ee4d5c2c 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -174,7 +174,7 @@ static void handle_dw_usr_busy_quirk(struct ns16550 *uart)
     }
 }
 
-static void ns16550_interrupt(
+static void cf_check ns16550_interrupt(
     int irq, void *dev_id, struct cpu_user_regs *regs)
 {
     struct serial_port *port = dev_id;
@@ -239,7 +239,7 @@ static void cf_check ns16550_poll(void *data)
 #endif
 }
 
-static int ns16550_tx_ready(struct serial_port *port)
+static int cf_check ns16550_tx_ready(struct serial_port *port)
 {
     struct ns16550 *uart = port->uart;
 
@@ -250,13 +250,13 @@ static int ns16550_tx_ready(struct serial_port *port)
               uart->lsr_mask ) == uart->lsr_mask ) ? uart->fifo_size : 0;
 }
 
-static void ns16550_putc(struct serial_port *port, char c)
+static void cf_check ns16550_putc(struct serial_port *port, char c)
 {
     struct ns16550 *uart = port->uart;
     ns_write_reg(uart, UART_THR, c);
 }
 
-static int ns16550_getc(struct serial_port *port, char *pc)
+static int cf_check ns16550_getc(struct serial_port *port, char *pc)
 {
     struct ns16550 *uart = port->uart;
 
@@ -344,7 +344,7 @@ static void ns16550_setup_preirq(struct ns16550 *uart)
                  UART_FCR_ENABLE | UART_FCR_CLRX | UART_FCR_CLTX | UART_FCR_TRG14);
 }
 
-static void __init ns16550_init_preirq(struct serial_port *port)
+static void __init cf_check ns16550_init_preirq(struct serial_port *port)
 {
     struct ns16550 *uart = port->uart;
 
@@ -373,7 +373,7 @@ static void __init ns16550_init_preirq(struct serial_port *port)
         uart->fifo_size = 16;
 }
 
-static void __init ns16550_init_irq(struct serial_port *port)
+static void __init cf_check ns16550_init_irq(struct serial_port *port)
 {
 #ifdef NS16550_PCI
     struct ns16550 *uart = port->uart;
@@ -399,7 +399,7 @@ static void ns16550_setup_postirq(struct ns16550 *uart)
         set_timer(&uart->timer, NOW() + MILLISECS(uart->timeout_ms));
 }
 
-static void __init ns16550_init_postirq(struct serial_port *port)
+static void __init cf_check ns16550_init_postirq(struct serial_port *port)
 {
     struct ns16550 *uart = port->uart;
     int rc, bits;
@@ -491,7 +491,7 @@ static void __init ns16550_init_postirq(struct serial_port *port)
     ns16550_setup_postirq(uart);
 }
 
-static void ns16550_suspend(struct serial_port *port)
+static void cf_check ns16550_suspend(struct serial_port *port)
 {
     struct ns16550 *uart = port->uart;
 
@@ -543,7 +543,7 @@ static void cf_check ns16550_delayed_resume(void *data)
         _ns16550_resume(port);
 }
 
-static void ns16550_resume(struct serial_port *port)
+static void cf_check ns16550_resume(struct serial_port *port)
 {
     struct ns16550 *uart = port->uart;
 
@@ -569,7 +569,7 @@ static void ns16550_resume(struct serial_port *port)
         _ns16550_resume(port);
 }
 
-static void __init ns16550_endboot(struct serial_port *port)
+static void __init cf_check ns16550_endboot(struct serial_port *port)
 {
 #ifdef CONFIG_HAS_IOPORTS
     struct ns16550 *uart = port->uart;
@@ -583,13 +583,13 @@ static void __init ns16550_endboot(struct serial_port *port)
 #endif
 }
 
-static int __init ns16550_irq(struct serial_port *port)
+static int __init cf_check ns16550_irq(struct serial_port *port)
 {
     struct ns16550 *uart = port->uart;
     return ((uart->irq > 0) ? uart->irq : -1);
 }
 
-static void ns16550_start_tx(struct serial_port *port)
+static void cf_check ns16550_start_tx(struct serial_port *port)
 {
     struct ns16550 *uart = port->uart;
     u8 ier = ns_read_reg(uart, UART_IER);
@@ -599,7 +599,7 @@ static void ns16550_start_tx(struct serial_port *port)
         ns_write_reg(uart, UART_IER, ier | UART_IER_ETHREI);
 }
 
-static void ns16550_stop_tx(struct serial_port *port)
+static void cf_check ns16550_stop_tx(struct serial_port *port)
 {
     struct ns16550 *uart = port->uart;
     u8 ier = ns_read_reg(uart, UART_IER);
-- 
2.11.0


