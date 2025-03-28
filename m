Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1D8FA74438
	for <lists+xen-devel@lfdr.de>; Fri, 28 Mar 2025 08:09:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.930190.1332859 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ty3pa-0006HR-Kb; Fri, 28 Mar 2025 07:08:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 930190.1332859; Fri, 28 Mar 2025 07:08:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ty3pa-0006EO-HS; Fri, 28 Mar 2025 07:08:42 +0000
Received: by outflank-mailman (input) for mailman id 930190;
 Fri, 28 Mar 2025 07:08:41 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kqHR=WP=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1ty3pZ-0006EI-5v
 for xen-devel@lists.xenproject.org; Fri, 28 Mar 2025 07:08:41 +0000
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com
 [2a00:1450:4864:20::529])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 79d111a7-0ba3-11f0-9ea3-5ba50f476ded;
 Fri, 28 Mar 2025 08:08:40 +0100 (CET)
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-5e66407963fso3493523a12.2
 for <xen-devel@lists.xenproject.org>; Fri, 28 Mar 2025 00:08:40 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5edc17b2214sm897827a12.54.2025.03.28.00.08.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Mar 2025 00:08:38 -0700 (PDT)
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
X-Inumbo-ID: 79d111a7-0ba3-11f0-9ea3-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743145719; x=1743750519; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mlAnhWMOxFU2qjJ66imKm1iwMnse11AYFRs4Tjl2pTg=;
        b=ZlU+l1pcCJydW9pk5yKH02slIGfWR+4F25G8qp/RAn6PgkZV4wqJPglRLVTO6t/VKW
         t6O5HZl8YSCxtpPxSOKwYuswYWS0laX0PhTLEC97qw6eqWuscKEh4cFHxT7YnWJ+VcWE
         mCidHFMXSq/E2BOtxkzA+SKu9eDh1e9j9gZOk3CzD0GfAe78RUmYV4BhZt+M4hbNXqiy
         ScbPrOBsO273uRee8YcvDiqgWEsj6oYgZ6qVSoAC3rSfai/fXWWl0uwuOZqvK+E8WLpE
         VsJG1eILNi7IaIXJqs5SbQ4HenOmwrs7ghYnxGXuKRDG5B6Th2o5NxFtzCmoFGfJYYz6
         lVxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743145719; x=1743750519;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mlAnhWMOxFU2qjJ66imKm1iwMnse11AYFRs4Tjl2pTg=;
        b=lzzczku1TRii/5D0tcVOjxJWuNqM8EzJp5E0SKM85WvXqyfL1zGxV//al5cYCN3OdE
         qt/BPSXZxKC6EKeMJD7BZZYWgSZEJrQ0jOMBpmLnigYOlLWSYKky/LyINCxHFLS01SJk
         CGAdW7N6vCFElJT2jFwSDYxTQFFVfVJNk1xv3INXkalsgNKLXLbmtZQNke/dB9Say84i
         EKGYAp7NEpCBmwm8BhgoeRDqoWY2z6d+ik8bdUVLzIJbd/piL2EOqCI1ycCeq18FR4Lq
         Yfi+uRbjGQww51uA4D+/uTlfIvecfKZjpbYgCIH6i+0dBYmgRqQ9wgRGiaUThFQsj1Vb
         mlMA==
X-Gm-Message-State: AOJu0YzHG4BPlCXMlATWROoYlUKHEaMNwlJqHeTFLSkJh8U8yvj3M99R
	e5LLzXYCLk/4cmk17hCcnJrB/AtAcMjqQgUlkOeGOpvrbaj7aOE3dTySww==
X-Gm-Gg: ASbGncv71ASm0G0LVStWAH+GJENQNFVjfzDvX07Fz37QESSUYl7bQUEvToxd7tq/TQq
	rTXPmcO2C7s084Z/0hQQ5FcdodXzQfHuNGxzKeg5hnBAYQ7409hZJqGgvLqeLv8TI4x3ZNmpU6h
	yUYxfoJaN/+IaAiT08EccouPwtWkb4JrpvUMH8agAYOq+hvi0iuRr10b0eC1Piq5NwpZG9NVcnl
	NM+dUcECwDao6csK6gx8nb4HZU2XwKvNqjLJJRHDd4eBHipR1ZPGb0nsELERmUhEFyiUYEQCweq
	n0hChT2mQ91kOa5/N1phYD2kih9e9cuZq1aCK5mTpii3vyuqtZRtDMMX+Q8aUVm2KXjlMHvkF3K
	9JelSWRET
X-Google-Smtp-Source: AGHT+IFneya84quYsKrcX9FAUlxti5iEgjppu1P5Sv3AjACuikZpnkitBNi+8oyj2l9pMEHwAapdCw==
X-Received: by 2002:a17:907:94d0:b0:ac4:491:1548 with SMTP id a640c23a62f3a-ac6faea744emr684803066b.11.1743145719027;
        Fri, 28 Mar 2025 00:08:39 -0700 (PDT)
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
Subject: [PATCH] xen/char: implement suspend/resume calls for SCIF driver
Date: Fri, 28 Mar 2025 09:08:22 +0200
Message-ID: <800acb5c8447153e6c451c8df316ff678fbb4087.1743114879.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Volodymyr Babchuk <volodymyr_babchuk@epam.com>

The changes have been tested only on the Renesas R-Car H3 Starter Kit board.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
 xen/drivers/char/scif-uart.c | 34 ++++++++++++++++++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

diff --git a/xen/drivers/char/scif-uart.c b/xen/drivers/char/scif-uart.c
index 757793ca45..ce0f87c650 100644
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
@@ -271,6 +278,27 @@ static void scif_uart_stop_tx(struct serial_port *port)
     scif_writew(uart, SCIF_SCSCR, scif_readw(uart, SCIF_SCSCR) & ~SCSCR_TIE);
 }
 
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
 static struct uart_driver __read_mostly scif_uart_driver = {
     .init_preirq  = scif_uart_init_preirq,
     .init_postirq = scif_uart_init_postirq,
@@ -281,6 +309,8 @@ static struct uart_driver __read_mostly scif_uart_driver = {
     .start_tx     = scif_uart_start_tx,
     .stop_tx      = scif_uart_stop_tx,
     .vuart_info   = scif_vuart_info,
+    .suspend      = scif_uart_suspend,
+    .resume       = scif_uart_resume,
 };
 
 static const struct dt_device_match scif_uart_dt_match[] __initconst =
-- 
2.43.0


