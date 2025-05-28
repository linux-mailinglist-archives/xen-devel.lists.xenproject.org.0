Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9EEAC63A9
	for <lists+xen-devel@lfdr.de>; Wed, 28 May 2025 10:06:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.998972.1379655 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKBnb-0003Vo-Gz; Wed, 28 May 2025 08:06:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 998972.1379655; Wed, 28 May 2025 08:06:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKBnb-0003T3-De; Wed, 28 May 2025 08:06:07 +0000
Received: by outflank-mailman (input) for mailman id 998972;
 Wed, 28 May 2025 08:06:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ct5H=YM=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uKBnZ-0003Ro-P5
 for xen-devel@lists.xenproject.org; Wed, 28 May 2025 08:06:05 +0000
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [2a00:1450:4864:20::12b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 99029b4a-3b9a-11f0-b894-0df219b8e170;
 Wed, 28 May 2025 10:06:02 +0200 (CEST)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-54afb5fcebaso5384115e87.3
 for <xen-devel@lists.xenproject.org>; Wed, 28 May 2025 01:06:02 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32a79f5478asm1437671fa.78.2025.05.28.01.06.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 May 2025 01:06:00 -0700 (PDT)
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
X-Inumbo-ID: 99029b4a-3b9a-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748419561; x=1749024361; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9dWxP7Icxj1+b68Zu3OZEwOOJEHkIKPApD7TkfsOeh4=;
        b=JdpB73NzhO1Fnvap+aqJxwPlKOJWRow+OKWmBPv5vdxdoTBrPP86Briiekq8RNwyy5
         /XD8rif+RfkfVv1Bcn4hzmWSmvpmZtlgquFQDpmujOLCdRUDYqKbnw9bBOsBx7oxEAPI
         e19dM0q8kdO03D6TDFiKDPGvy94gBESMPrYtdZWYGN5TaVbFnZa2FMVSnynRqfCkJUsQ
         xbltNFIzF20jjDrSDmEuFdWzoyjo0LDL1fMdOZXnciLOAAGPy5HWu75C2+d/XpoNSN2w
         jgBp20Ga2TNBjxb7SS7Pw17ZIUJPatBFHRjG5jxiWvaN782CG4yMqRtdgtOcLc1/yhcp
         CC0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748419561; x=1749024361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9dWxP7Icxj1+b68Zu3OZEwOOJEHkIKPApD7TkfsOeh4=;
        b=s/wlnxmQdicrJ39MkELnSpHZ4AolkBTULc2jqoXODomyXDpNneiNzp+nFwwI/qbxIU
         teERRwlPlaR8qMUvsYwjzORdiplqFPo1IoE9Mj5k4cphYVeA0aCNkHtM1KlsX6qSOtWY
         FGgXTDgEqDtV/d3sWuSWcXJauq/6TJWJbX4+Hzi+OHEqsvvSJjzpkQXFj8BT6CEaoK3o
         L/r8aaO2/AuwK5fN4nd7axC94S5dm4jywJfUzhF9GMlwkBpGYgXzyqLhd1oP8mngdFpA
         sFKHxTUjK9S02GGDvl1AxG6e6ikRLdG0vdYGKGpPTJvtiQppDO80Fley89s23pfoy/6a
         QvuQ==
X-Gm-Message-State: AOJu0YzGmUItspWTThY0Z0UJG52bwmWxvmHGHPFfe+Ee5WljgwPc4gWv
	xq16P7diKA/8nxoLQ1n3S1mEC14ihVSRltZ7jagnk/DxuyQ11tEn2qu84oEfHw==
X-Gm-Gg: ASbGncsSGM2/51Ucyy2ry52kfAGPNRPHbsFWw1JJEZTEVza5z3laX9MVwJnYiujuyEX
	WA/fkNwMeXbCYo+ufNZqy4RObjZ4SHf95KqSCedHdtbqNChcvtbcrGD3ywfKtqOuXsJHhuSJ/ay
	wkBN/fe3FDFPas/+9yT9SpgG8etnNEX3/ZMfEdQpUqwYN56GOTENrKc7wHrCvR+JcVwChFofvR4
	lSAzBUZbbdWg19DjaKIm1nwBuKeA+A3EHt11mAI7taRQoNpuycTK2TyDCBEMtrIos/WICYdUlHK
	9qz/Tiypw8/P3egtlz/Oy8msNW/jHqxmI8WVsGHGIU3LpNsXtF4fH4bkDvPoQ5OWmPE6nM07PEK
	JrjlXq1wHfwvnTG4=
X-Google-Smtp-Source: AGHT+IG6u5YLRxmcByItaH8PWCNYHSyVYF7Eh3p2pFq0FQVKsPfgi80VcoNfxaXymwzalNg0N635lw==
X-Received: by 2002:a05:6512:3055:b0:553:2fb1:cfe9 with SMTP id 2adb3069b0e04-5532fb1e6aemr286965e87.21.1748419561240;
        Wed, 28 May 2025 01:06:01 -0700 (PDT)
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
Subject: [PATCH v2 2/2] xen/char: implement suspend/resume calls for SCIF driver
Date: Wed, 28 May 2025 11:05:19 +0300
Message-ID: <c7eff436d09256d7a30c3cf8583b2c029d8bf9c3.1748381788.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1748381788.git.mykola_kvach@epam.com>
References: <cover.1748381788.git.mykola_kvach@epam.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

The changes have been tested only on the Renesas R-Car H3 Starter Kit board.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
In patch v2, I just added a CONFIG_SYSTEM_SUSPEND check around
the suspend/resume functions in the SCIF driver.
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


