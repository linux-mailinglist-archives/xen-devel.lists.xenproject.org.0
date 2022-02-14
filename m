Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3134B5166
	for <lists+xen-devel@lfdr.de>; Mon, 14 Feb 2022 14:17:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.271957.466733 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJbDu-0005OA-Dx; Mon, 14 Feb 2022 13:16:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 271957.466733; Mon, 14 Feb 2022 13:16:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nJbDu-0005L3-94; Mon, 14 Feb 2022 13:16:58 +0000
Received: by outflank-mailman (input) for mailman id 271957;
 Mon, 14 Feb 2022 13:16:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HcNt=S5=citrix.com=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1nJb3b-0008IH-7q
 for xen-devel@lists.xenproject.org; Mon, 14 Feb 2022 13:06:19 +0000
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com
 [216.71.145.155]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e5622eb6-8d96-11ec-8eb8-a37418f5ba1a;
 Mon, 14 Feb 2022 14:06:17 +0100 (CET)
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
X-Inumbo-ID: e5622eb6-8d96-11ec-8eb8-a37418f5ba1a
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1644843977;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=lw78qzzzuiYAtb4DaXkKqrMnrmW0OepdLJjLyhv/BGI=;
  b=W9n8TYnjPjjYwOzqjane4XyVrnSWiI/J32ZALF4kLtTR4fno/J6EzjxR
   L5wXZQ76dYH1hv22eqrDnZof/g2b8nN8KUqgd7TlZAMRag05o0GRjGNtG
   7SHbhu2EaK6k7f4SlQnCine7MTFP00nEI5hjLH2n5QXbkscNXlEXBnroV
   Y=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: GiZ73pqCSnaQswr4ErlANhPRz8vWxZokQs4C0FBQcFZXfCidf60HFdYdTd2usiV/4U3k7KkZj0
 ZgqndL5rtOQOTlLuIhZY2QgsYcO5ZKhsO+7sAoXzTqD8M+AiC05Nb1xzhjaNqL9sLm6F613k5p
 EutSoSYZ0Jn6/SJNiwdLvkFPKhywz3hQ0iQbUeaXNzQimGc7Z0oO9fFNmqYfIjGokplOGfNcgZ
 E7snI3yZJ3Atgy0EZf1Z+uL61s1RG2QibSY94225E2N1x369piJQhUsORPDztGDywMupsc9WXH
 U+db3yoTiU8ThmrKHa8ySRA1
X-SBRS: 5.1
X-MesageID: 64149893
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:fa50kqLNV0ODhaYOFE+Rz5IlxSXFcZb7ZxGr2PjKsXjdYENS1jcOz
 jQeXW7UO/aMajf0LdBxbo6+pxsPvsXWyIBgGgdlqX01Q3x08seUXt7xwmUcns+xwm8vaGo9s
 q3yv/GZdJhcokcxIn5BC5C5xZVG/fjgqoHUVaiUakideSc+EH170Ug6x7Zg6mJVqYPR7z2l6
 IuaT/L3YDdJ6xYsWo7Dw/vewP/HlK2aVAIw5jTSV9gS1LPtvyB94KYkDbOwNxPFrrx8RYZWc
 QphIIaRpQs19z91Yj+sfy2SnkciGtY+NiDW4pZatjTLbrGvaUXe345iXMfwZ3u7hB2th45q8
 8xGtKfsEyYQY7H2t/QBaANXRnQW0a1uoNcrIFC6uM2XiUbHb2Ht07NlC0Re0Y8wo7gtRzsUr
 LpBdW5LPkvra+GemdpXTsFFgMg5IdatF4QYonx6lhnSDOo8QICFSKLPjTNd9Gls35wfTaeFD
 yYfQX00LwrHSg9qAAgwOoswk9+ZjHXjShQN/Tp5ooJoujOOnWSdyoPFINfTP9CHW8hRtkKZv
 X7duXT0BAkAM96SwibD9Wij7tIjhguiBthUTufhsKc33hvDnQT/FSH6S3OfuaeisVe1WukDc
 W0tpzYUgrguz1akG4yVswKDnFaIuRsVWtx1GuI86R2Qxqe83zt1FlToXRYaNoV46ZZeqSgCk
 wbQwoi3XWAHXKi9FCrFnop4uw9eLsT8wYUqQSYfBTUI7ND4yG3YpkKeF40zeEJZYzCcJN0R/
 9xohHVk71nwpZRSv0lewbwgq2jyzqUltiZvum3qspuNt2uVnrKNaY2y8kT85v1dNoufRVTpl
 CFax5TBvLBTUMnUz3blrAAx8FaBvajtDdEhqQQ3Q8lJG8qFpxZPgry8EBkhfRw0Y67oiBfiY
 VPJuBM52XOgFCDCUEODWKroU55C5fG5TbzND6mIBvITMskZXFLWp0lGOB/Pt10BZWBxyMnTz
 7/AKp3yZZvbYIw6pAeLqxA1j+N6mHBmnTmLLX05pjz+uYejiLeuYe9tGDOzgioRsctoeS3Zr
 IRSMdWk0RJaXLGsayXb69dLf1sLMWI6Fdb9rMkOLryPJQ9vGWcADf7NwOx+J9w5zvoNzuqYr
 GugXkJ4yUbkgSGVIwu9dX0+OqjkWoxyrCxnMHV0b0qowXUqfa2m8LwbK8ksZbAi+eE6lax0Q
 vAJdt+uGPNKTjibqT0RYYOk9N5pdQixhBLINC2gOWBtc5llTg3P29nlYgqwq3VeUnvp7ZMz+
 uTy2BnaTJwPQxVZIPzXMP//nUmsuXU9mf5pWxeaKNdkZ0ixopNhLDb8j6FrLphUewnD3DaTy
 y2fHQwc+bvWu4Yw/dTE2fKEooOuH7csF0ZWBTCGv7O/NC2c9Wu/245QFu2PeGmFBm/z/ayjY
 8RTzu39b6JbzAob7dIkHuY517866vvuu6Ren1ZtE3j8Zli2Dq9tfyud1s5Vu6wRnrJUtGNag
 K5UFgW27VlRBP7YLQ==
IronPort-HdrOrdr: A9a23:Qef3WKgwrG4UduGeoQJ/ya/4nnBQXtgji2hC6mlwRA09TySZ//
 rBoB17726MtN9/YhEdcLy7VJVoBEmskKKdgrNhW4tKPjOW21dARbsKheCJrgEIWReOktK1vZ
 0QFJSWY+eQMbEVt6nHCXGDYrQd/OU=
X-IronPort-AV: E=Sophos;i="5.88,367,1635220800"; 
   d="scan'208";a="64149893"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: [PATCH v2 29/70] xen/console: CFI hardening
Date: Mon, 14 Feb 2022 12:50:46 +0000
Message-ID: <20220214125127.17985-30-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220214125127.17985-1-andrew.cooper3@citrix.com>
References: <20220214125127.17985-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain

Control Flow Integrity schemes use toolchain and optionally hardware support
to help protect against call/jump/return oriented programming attacks.

Use cf_check to annotate function pointer targets for the toolchain.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
Acked-by: Jan Beulich <jbeulich@suse.com>
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


