Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA785AE60E3
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 11:31:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023477.1399456 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU00H-00031A-54; Tue, 24 Jun 2025 09:31:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023477.1399456; Tue, 24 Jun 2025 09:31:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU00H-0002z3-1Q; Tue, 24 Jun 2025 09:31:45 +0000
Received: by outflank-mailman (input) for mailman id 1023477;
 Tue, 24 Jun 2025 09:31:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LEHU=ZH=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uU00F-0002yv-9j
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 09:31:43 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0999bc92-50de-11f0-a30f-13f23c93f187;
 Tue, 24 Jun 2025 11:31:42 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-553b165c80cso200693e87.2
 for <xen-devel@lists.xenproject.org>; Tue, 24 Jun 2025 02:31:42 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-553e414c819sm1738529e87.79.2025.06.24.02.31.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jun 2025 02:31:40 -0700 (PDT)
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
X-Inumbo-ID: 0999bc92-50de-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750757501; x=1751362301; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=byP8LjI+aWUJ/3ahxydRbTTYwpcCU0/sOWIxaFa3vSk=;
        b=P3uVBDm2ufxi7T0mf34QiQc6tkw4ZyzX43r4X+WnzV8cFm7VwVgMg97o5fCOhGBSUf
         k4cdd1XU/roUIrAyt1PCL8nHLIbQI+HprLu72vyN5rW6uJwwqpmIoHaUvYI457C8hFFA
         ukYFla9EPx/nrbzt0AcEeDn1xDKyhBQ0uTBLJJYeSzW5fnGZ84zujVr+Sc67Fjo+M0qO
         IUw7XH4t3WYcA4tgE4j6RP8oe+j0sP+qLliOIU6mYlWRb6LHfyu/WEIIwwM3QAeO3nwc
         CnACLb90aATtmOphhYaN612344w4NPMKnGpV74mOcqe5te0XhE+886n+UsPvGZPUMkad
         U13g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750757501; x=1751362301;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=byP8LjI+aWUJ/3ahxydRbTTYwpcCU0/sOWIxaFa3vSk=;
        b=U7lU/hROk6dNy3xDLpczODQ9pvRcdz07hP+fXAiafWgD74mZQrpcrSxzn60CuERbeF
         bUyuizBOqSPb0wYTJMuQjG65Z6P1rdatUD1bWsGY2N3+w6qPuPNsVoNU9p5dTllUx/DM
         7hMKehw5VddQRu/WldaiNHDEVHq812F1DEjJoXChyRaskeqJF13VX74s2tZ28NB0GOi/
         oRI3iM7vtDtprUhKzo9m8gCjal8okpEM1fDVPVsjd3mJVQrq7gpKbrIOR0c/q98rKr9v
         SOUhfCj0D9kvxW5fCSGEM8N2qCOVNj0l9qg9LdAmtiVcVyjli5g7wOiH3bWX34GsTFOB
         xlLw==
X-Gm-Message-State: AOJu0Yz7JJc0V2EME7TXhPDUdwPjYzc/q71D45sV3qMxgHQXGk3+Uacm
	7tfduiJifoihxjiInD09VfCvvhK5BB/bT3QCfewyeOU0t3URRG2ry2cXsjA3gaBcHZs=
X-Gm-Gg: ASbGncv86+szFV5HcuR+0iQSjwBA145qMW4infX8v+GDFCmwlM5gT8XUEEMMgpZYRtu
	rOkZE+1EuhJGq4gaGH0HbLP/H5LRhvd/SgMsZUz48Bx5W7CNVUiAU5YGO54YT5vxd9t6k5mqvz7
	hjAJd3Yd8gujCCS/E1yyOvrdCPTxQQX93QV/GY+qbCSHEJL77gCx8a3MgZQP5yupefjq3j2Se3c
	kB8UIwmP4XVkqU25WkhmAyYz8nLBgXXdDsiMxrJxDZb/qhG5HkdAIlcoqR4ZN+I2sDIIuplYLpQ
	YsrmngpZE7pA3t8DQaNGgxQo0LO8/1usUkL5++FY4t/rlMlJJ+YYHv8bx8BzyEkk/Y9g3HUY+t3
	l5P2SIDBEVAPp3AjAWQcA3llkpg==
X-Google-Smtp-Source: AGHT+IHbVNIJ4/GIRmsR+sg9L/Yy+f9x7Ag7IV0yYk0m581aBg8OJjhMaoqNPaNj5PRASROXQyk0Bg==
X-Received: by 2002:a05:6512:3c8b:b0:549:5b54:2c68 with SMTP id 2adb3069b0e04-553e3bcce22mr5219002e87.22.1750757501144;
        Tue, 24 Jun 2025 02:31:41 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Jan Beulich <jbeulich@suse.com>,
	Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] xen/char: wrap suspend/resume console callbacks with CONFIG_SYSTEM_SUSPEND
Date: Tue, 24 Jun 2025 12:31:22 +0300
Message-ID: <07f047e4a3640696e46c6890d3826c03d4f28856.1750756537.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mykola Kvach <mykola_kvach@epam.com>

This patch wraps the suspend/resume console callbacks and related code within
CONFIG_SYSTEM_SUSPEND blocks. This ensures that these functions and their
calls are only included in the build when CONFIG_SYSTEM_SUSPEND is enabled.

This addresses Misra Rule 2.1 violations.

Suggested-by: Jan Beulich <jbeulich@suse.com>
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
 xen/drivers/char/console.c   |  4 ++++
 xen/drivers/char/ehci-dbgp.c |  6 ++++++
 xen/drivers/char/ns16550.c   | 12 ++++++++++++
 xen/drivers/char/serial.c    |  4 ++++
 xen/drivers/char/xhci-dbc.c  |  6 ++++++
 xen/include/xen/console.h    |  2 ++
 xen/include/xen/serial.h     |  4 ++++
 7 files changed, 38 insertions(+)

diff --git a/xen/drivers/char/console.c b/xen/drivers/char/console.c
index 5879e31786..ba5a809a99 100644
--- a/xen/drivers/char/console.c
+++ b/xen/drivers/char/console.c
@@ -1365,6 +1365,8 @@ void panic(const char *fmt, ...)
         machine_restart(5000);
 }
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+
 /*
  * **************************************************************
  * ****************** Console suspend/resume ********************
@@ -1388,6 +1390,8 @@ int console_resume(void)
     return 0;
 }
 
+#endif /* CONFIG_SYSTEM_SUSPEND */
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/drivers/char/ehci-dbgp.c b/xen/drivers/char/ehci-dbgp.c
index e9cd59b254..a5c79f56fc 100644
--- a/xen/drivers/char/ehci-dbgp.c
+++ b/xen/drivers/char/ehci-dbgp.c
@@ -1419,6 +1419,8 @@ static void __init cf_check ehci_dbgp_endboot(struct serial_port *port)
     ehci_dbgp_check_release(port->uart);
 }
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+
 static void cf_check ehci_dbgp_suspend(struct serial_port *port)
 {
     struct ehci_dbgp *dbgp = port->uart;
@@ -1452,12 +1454,16 @@ static void cf_check ehci_dbgp_resume(struct serial_port *port)
     ehci_dbgp_setup_postirq(dbgp);
 }
 
+#endif /* CONFIG_SYSTEM_SUSPEND */
+
 static struct uart_driver __read_mostly ehci_dbgp_driver = {
     .init_preirq  = ehci_dbgp_init_preirq,
     .init_postirq = ehci_dbgp_init_postirq,
     .endboot      = ehci_dbgp_endboot,
+#ifdef CONFIG_SYSTEM_SUSPEND
     .suspend      = ehci_dbgp_suspend,
     .resume       = ehci_dbgp_resume,
+#endif
     .tx_ready     = ehci_dbgp_tx_ready,
     .putc         = ehci_dbgp_putc,
     .flush        = ehci_dbgp_flush,
diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index eaeb0e09d0..6b4fb4ad31 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -57,7 +57,9 @@ static struct ns16550 {
 #endif
     /* UART with no IRQ line: periodically-polled I/O. */
     struct timer timer;
+#ifdef CONFIG_SYSTEM_SUSPEND
     struct timer resume_timer;
+#endif
     unsigned int timeout_ms;
     bool intr_works;
     bool dw_usr_bsy;
@@ -113,7 +115,9 @@ struct ns16550_config_param {
 static void enable_exar_enhanced_bits(const struct ns16550 *uart);
 #endif
 
+#ifdef CONFIG_SYSTEM_SUSPEND
 static void cf_check ns16550_delayed_resume(void *data);
+#endif
 
 static u8 ns_read_reg(const struct ns16550 *uart, unsigned int reg)
 {
@@ -420,7 +424,9 @@ static void __init cf_check ns16550_init_postirq(struct serial_port *port)
     serial_async_transmit(port);
 
     init_timer(&uart->timer, ns16550_poll, port, 0);
+#ifdef CONFIG_SYSTEM_SUSPEND
     init_timer(&uart->resume_timer, ns16550_delayed_resume, port, 0);
+#endif
 
     /* Calculate time to fill RX FIFO and/or empty TX FIFO for polling. */
     bits = uart->data_bits + uart->stop_bits + !!uart->parity;
@@ -506,6 +512,8 @@ static void __init cf_check ns16550_init_postirq(struct serial_port *port)
     ns16550_setup_postirq(uart);
 }
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+
 static void cf_check ns16550_suspend(struct serial_port *port)
 {
     struct ns16550 *uart = port->uart;
@@ -584,6 +592,8 @@ static void cf_check ns16550_resume(struct serial_port *port)
         _ns16550_resume(port);
 }
 
+#endif /* CONFIG_SYSTEM_SUSPEND */
+
 static void __init cf_check ns16550_endboot(struct serial_port *port)
 {
 #ifdef CONFIG_HAS_IOPORTS
@@ -638,8 +648,10 @@ static struct uart_driver __read_mostly ns16550_driver = {
     .init_irq     = ns16550_init_irq,
     .init_postirq = ns16550_init_postirq,
     .endboot      = ns16550_endboot,
+#ifdef CONFIG_SYSTEM_SUSPEND
     .suspend      = ns16550_suspend,
     .resume       = ns16550_resume,
+#endif
     .tx_ready     = ns16550_tx_ready,
     .putc         = ns16550_putc,
     .getc         = ns16550_getc,
diff --git a/xen/drivers/char/serial.c b/xen/drivers/char/serial.c
index 591a009008..adb312d796 100644
--- a/xen/drivers/char/serial.c
+++ b/xen/drivers/char/serial.c
@@ -495,6 +495,8 @@ const struct vuart_info *serial_vuart_info(int idx)
     return NULL;
 }
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+
 void serial_suspend(void)
 {
     int i;
@@ -511,6 +513,8 @@ void serial_resume(void)
             com[i].driver->resume(&com[i]);
 }
 
+#endif /* CONFIG_SYSTEM_SUSPEND */
+
 void __init serial_register_uart(int idx, struct uart_driver *driver,
                                  void *uart)
 {
diff --git a/xen/drivers/char/xhci-dbc.c b/xen/drivers/char/xhci-dbc.c
index d011159d18..1f7d4395dc 100644
--- a/xen/drivers/char/xhci-dbc.c
+++ b/xen/drivers/char/xhci-dbc.c
@@ -1271,6 +1271,8 @@ static void cf_check dbc_uart_flush(struct serial_port *port)
         set_timer(&uart->timer, goal);
 }
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+
 static void cf_check dbc_uart_suspend(struct serial_port *port)
 {
     struct dbc_uart *uart = port->uart;
@@ -1303,6 +1305,8 @@ static void cf_check dbc_uart_resume(struct serial_port *port)
     set_timer(&uart->timer, NOW() + MICROSECS(DBC_POLL_INTERVAL));
 }
 
+#endif /* CONFIG_SYSTEM_SUSPEND */
+
 static struct uart_driver dbc_uart_driver = {
     .init_preirq = dbc_uart_init_preirq,
     .init_postirq = dbc_uart_init_postirq,
@@ -1310,8 +1314,10 @@ static struct uart_driver dbc_uart_driver = {
     .putc = dbc_uart_putc,
     .getc = dbc_uart_getc,
     .flush = dbc_uart_flush,
+#ifdef CONFIG_SYSTEM_SUSPEND
     .suspend = dbc_uart_suspend,
     .resume = dbc_uart_resume,
+#endif
 };
 
 /* Those are accessed via DMA. */
diff --git a/xen/include/xen/console.h b/xen/include/xen/console.h
index 83cbc9fbda..feb57f92f1 100644
--- a/xen/include/xen/console.h
+++ b/xen/include/xen/console.h
@@ -44,8 +44,10 @@ int console_steal(int handle, void (*fn)(const char *str, size_t nr));
 /* Give back stolen console. Takes the identifier returned by console_steal. */
 void console_giveback(int id);
 
+#ifdef CONFIG_SYSTEM_SUSPEND
 int console_suspend(void);
 int console_resume(void);
+#endif
 
 /* Emit a string via the serial console. */
 void console_serial_puts(const char *s, size_t nr);
diff --git a/xen/include/xen/serial.h b/xen/include/xen/serial.h
index 63a82b032d..8e18445552 100644
--- a/xen/include/xen/serial.h
+++ b/xen/include/xen/serial.h
@@ -66,9 +66,11 @@ struct uart_driver {
     void (*init_postirq)(struct serial_port *port);
     /* Hook to clean up after Xen bootstrap (before domain 0 runs). */
     void (*endboot)(struct serial_port *port);
+#ifdef CONFIG_SYSTEM_SUSPEND
     /* Driver suspend/resume. */
     void (*suspend)(struct serial_port *port);
     void (*resume)(struct serial_port *port);
+#endif
     /* Return number of characters the port can hold for transmit,
      * or -EIO if port is inaccesible */
     int (*tx_ready)(struct serial_port *port);
@@ -131,9 +133,11 @@ int serial_irq(int idx);
 /* Retrieve basic UART information to emulate it (base address, size...) */
 const struct vuart_info* serial_vuart_info(int idx);
 
+#ifdef CONFIG_SYSTEM_SUSPEND
 /* Serial suspend/resume. */
 void serial_suspend(void);
 void serial_resume(void);
+#endif
 
 /*
  * Initialisation and helper functions for uart drivers.
-- 
2.48.1


