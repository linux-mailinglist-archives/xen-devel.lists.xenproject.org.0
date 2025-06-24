Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 657DAAE5D89
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 09:19:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023179.1399106 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTxvx-0008B4-15; Tue, 24 Jun 2025 07:19:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023179.1399106; Tue, 24 Jun 2025 07:19:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTxvw-00088l-UQ; Tue, 24 Jun 2025 07:19:08 +0000
Received: by outflank-mailman (input) for mailman id 1023179;
 Tue, 24 Jun 2025 07:19:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LEHU=ZH=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uTxvv-00088f-NX
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 07:19:07 +0000
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [2a00:1450:4864:20::136])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 82968876-50cb-11f0-a30f-13f23c93f187;
 Tue, 24 Jun 2025 09:19:04 +0200 (CEST)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-553ba7f11cbso112460e87.1
 for <xen-devel@lists.xenproject.org>; Tue, 24 Jun 2025 00:19:04 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-553e41c301esm1713392e87.143.2025.06.24.00.19.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jun 2025 00:19:03 -0700 (PDT)
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
X-Inumbo-ID: 82968876-50cb-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750749544; x=1751354344; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LXYC7VlKvFyK65wnrApO7g7blDDOmo+NPeKeGgJUPGo=;
        b=W3RUm1EvZtOkibcHR/8KRq8sSeq4SmxIjUZULPcRWVMWfC8ajdLkDFoqfnDHQtWC60
         dM+IGRBcX8MdnR1YDUrec+OfQCRssaF65iIE2FN7w8ZbmJF48pufMqr031oQJ96nvcpa
         3a0ODyNrD9FVgluSFnj6XDVLa9L08YI04zutcJQzhviuXd8TmC1LpwWZarpXGzvTZfvq
         JjTqF6tGYYaxKdE1o2WHSSrsPbI2DZhUORyB97FehW6EOfUJir9nmAFHApRjYqODSCGd
         Q29/491Mppxc04kTWv3QkXkgiQDjR4SVF6iGUHW8Ub5+VXqlWY2ALOwSZWH+ZiFKLvnH
         5v3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750749544; x=1751354344;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LXYC7VlKvFyK65wnrApO7g7blDDOmo+NPeKeGgJUPGo=;
        b=M7qQdntocf3ejiLGckaru3yhUpHM9p9BgHW0Wh2FGMxuGHxlmlaYnPzH6drAEfAiNs
         dO3AmUz2W9I6f1XcvdbmNz4z0jW0sels9oQZexkAH6u7b5+fQOh7hzDUOt8A76+22o3c
         iqIG9Ry6gQHC5/NLuKNQNmSPH/kojzlPlSz9EFsy7txbUHGgbCAYhHBZ8UPSF6KfwA2s
         uuJcIyjm6HRPKd9uipBA39+EM+Oo76rkGZMvzoqXhrWDOZEIjJwtM7Tx6Uz9oWPdaM6O
         Zv3CPlHFkPtuyg5LvUXz8S8dgaoceUHYq+g+Igpj0aU3/8/T/rx8CfTv++q41zfPsTK1
         hezQ==
X-Gm-Message-State: AOJu0YyIdKRYmHnB/iF9EUVLF7t/pYx5Z2uBHDp6eq//Wy/Av00m08Nb
	oZNfBWc9EWpIRMzUM4UCiBclcNb/o9DZcAQF6xRqXlOTm6XF74z/FAjNHYctV06GZao=
X-Gm-Gg: ASbGncshFkGDEDZxlAZuzRd/ri96cxIaP9TFGamohaOFxMsJzFmBJXMzkO68GzbqR2d
	UB9QyWfZnpEcnBFLIzAy80Cqw47ICY5JcHvDxCHBDUsp5wxBx0imQUPGJi7QOYhBWdObSDO2boP
	FXhEAUB97Eq2W5rT15qyv8MAHw0KVrb9kisqtwmDhoGbw39+/CwI2sz9839bZxQW/u12jWC5Wqb
	ivaIs1rf2HjbcnSlVqHfD4ZdzsAuqtfjY6DVzGUSi3JwoztdvKugWbngfhMGEfGHuRdAaUeY0k+
	k2ozBoTZSOWueYr4BwtspdUXTLknSwOdDkiS9a5wyzD0gYmNI7Hw1q/KGvWuOYKm4WFomcWfdi7
	GD3m+KIZIY70Fu9xQ6TYDh4qHQg==
X-Google-Smtp-Source: AGHT+IGa4Au9bIHRjI28POgwOAtq9JiCYwQiOMBbK1EpfFlaP4s3Aovcoamq2nQ/Phr0HY5Pc+OOlA==
X-Received: by 2002:a05:6512:224a:b0:553:ad9b:cfb1 with SMTP id 2adb3069b0e04-553e3b9a36fmr4461062e87.9.1750749543739;
        Tue, 24 Jun 2025 00:19:03 -0700 (PDT)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Mykola Kvach <mykola_kvach@epam.com>
Subject: [PATCH v4] xen/char: implement suspend/resume calls for SCIF driver
Date: Tue, 24 Jun 2025 10:18:56 +0300
Message-ID: <5449d6fc4a6e47af173d9e2b285f1e3398de98a3.1750749332.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

Implement suspend and resume callbacks for the SCIF UART driver,
enabled when CONFIG_SYSTEM_SUSPEND is set. This allows proper
handling of UART state across system suspend/resume cycles.

Tested on Renesas R-Car H3 Starter Kit.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
In patch v2, I just added a CONFIG_SYSTEM_SUSPEND check around
the suspend/resume functions in the SCIF driver.

In patch v4, enhance commit message, no functional changes
---
 xen/drivers/char/scif-uart.c | 40 ++++++++++++++++++++++++++++++++++--
 1 file changed, 38 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/char/scif-uart.c b/xen/drivers/char/scif-uart.c
index 757793ca45..888821a3b8 100644
--- a/xen/drivers/char/scif-uart.c
+++ b/xen/drivers/char/scif-uart.c
@@ -139,9 +139,8 @@ static void scif_uart_interrupt(int irq, void *data)
     }
 }
 
-static void __init scif_uart_init_preirq(struct serial_port *port)
+static void scif_uart_disable(struct scif_uart *uart)
 {
-    struct scif_uart *uart = port->uart;
     const struct port_params *params = uart->params;
 
     /*
@@ -155,6 +154,14 @@ static void __init scif_uart_init_preirq(struct serial_port *port)
 
     /* Reset TX/RX FIFOs */
     scif_writew(uart, SCIF_SCFCR, SCFCR_RFRST | SCFCR_TFRST);
+}
+
+static void scif_uart_init_preirq(struct serial_port *port)
+{
+    struct scif_uart *uart = port->uart;
+    const struct port_params *params = uart->params;
+
+    scif_uart_disable(uart);
 
     /* Clear all errors and flags */
     scif_readw(uart, params->status_reg);
@@ -271,6 +278,31 @@ static void scif_uart_stop_tx(struct serial_port *port)
     scif_writew(uart, SCIF_SCSCR, scif_readw(uart, SCIF_SCSCR) & ~SCSCR_TIE);
 }
 
+#ifdef CONFIG_SYSTEM_SUSPEND
+
+static void scif_uart_suspend(struct serial_port *port)
+{
+    struct scif_uart *uart = port->uart;
+
+    scif_uart_stop_tx(port);
+    scif_uart_disable(uart);
+}
+
+static void scif_uart_resume(struct serial_port *port)
+{
+    struct scif_uart *uart = port->uart;
+    const struct port_params *params = uart->params;
+    uint16_t ctrl;
+
+    scif_uart_init_preirq(port);
+
+    /* Enable TX/RX and Error Interrupts  */
+    ctrl = scif_readw(uart, SCIF_SCSCR);
+    scif_writew(uart, SCIF_SCSCR, ctrl | params->irq_flags);
+}
+
+#endif /* CONFIG_SYSTEM_SUSPEND */
+
 static struct uart_driver __read_mostly scif_uart_driver = {
     .init_preirq  = scif_uart_init_preirq,
     .init_postirq = scif_uart_init_postirq,
@@ -281,6 +313,10 @@ static struct uart_driver __read_mostly scif_uart_driver = {
     .start_tx     = scif_uart_start_tx,
     .stop_tx      = scif_uart_stop_tx,
     .vuart_info   = scif_vuart_info,
+#ifdef CONFIG_SYSTEM_SUSPEND
+    .suspend      = scif_uart_suspend,
+    .resume       = scif_uart_resume,
+#endif
 };
 
 static const struct dt_device_match scif_uart_dt_match[] __initconst =
-- 
2.48.1


