Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 58BE0AD0030
	for <lists+xen-devel@lfdr.de>; Fri,  6 Jun 2025 12:11:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1008360.1387653 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNU3D-0005iE-LJ; Fri, 06 Jun 2025 10:11:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1008360.1387653; Fri, 06 Jun 2025 10:11:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uNU3D-0005fy-HF; Fri, 06 Jun 2025 10:11:51 +0000
Received: by outflank-mailman (input) for mailman id 1008360;
 Fri, 06 Jun 2025 10:11:49 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WdQj=YV=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1uNU3B-0005Rm-Hk
 for xen-devel@lists.xenproject.org; Fri, 06 Jun 2025 10:11:49 +0000
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [2a00:1450:4864:20::12c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a8aeaa0b-42be-11f0-a301-13f23c93f187;
 Fri, 06 Jun 2025 12:11:49 +0200 (CEST)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-55365c63fa5so946653e87.1
 for <xen-devel@lists.xenproject.org>; Fri, 06 Jun 2025 03:11:49 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-553677389d5sm143592e87.259.2025.06.06.03.11.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Jun 2025 03:11:47 -0700 (PDT)
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
X-Inumbo-ID: a8aeaa0b-42be-11f0-a301-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749204708; x=1749809508; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9dWxP7Icxj1+b68Zu3OZEwOOJEHkIKPApD7TkfsOeh4=;
        b=NWnFApOn6agP8AoJCRiexbt3oZuRnUVeB0Yv9rRmn/uFgZscNdmpOt3CCygmVV7bev
         5g3co1JWI963iab/o8ZmjQ//TQZvshu5chxTKLJ0LdLpsBiopLI1uMpkUT8+txw2KB7Q
         6mr9FlerLBxVIKfrZWB49P88lEiZDadfVAgMwqy9M1Uf7/9son1ACSqH+xcpO3EGozUc
         1cLcvUtFejT5cPJ7278QzKaoiEa0MeSesffI3jEd3Gnl19X5/vCba0RViHKTT17qFhmB
         H0ZEHs8bfqpWWxTVgUOYxTmhoIxWSKtIaRwP579BC8ZVzNjLCBi8JrOBGMBXUbRmCYKJ
         9i1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749204708; x=1749809508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9dWxP7Icxj1+b68Zu3OZEwOOJEHkIKPApD7TkfsOeh4=;
        b=Eeor0SkvFT8+bxN4gc7S8Bi58RVzYbFB7yLuyL8+voPWmA1xyI+0LYIYX9fTqJtqQ5
         CkpwxfXhmUGg2VF7HHrL4W3CXJ1m6RawaDeW2/xnyQx1roydBIszZaLNteU+E+xAkbwO
         dS2ILkr3kOyvAAQQykfqFlR5d8JWI/YLdYym7pOcPpD546kY+GwQcxQQrkHVSn8z1Hr2
         oP9wkPxyfGn4OAD0sl0gh1ORq/LZ7vvfFYUvPVWe7yes/7bEZ5OnDJoWQneM8NXUKOXB
         fL+bMWlojS0jsrvEyTBO7xvyueDh7CasunG50xIKtxhwl29wno8yXOz+S/+TMlY8ngTZ
         7gUA==
X-Gm-Message-State: AOJu0YzYGNrZutouLcWVMa01nkIbF0qHg7ycEc2bPh8dgO6ac3ucuEw/
	N/YRbVcTpkjaPH1HCJgo79MJk1ILduuEIPRyrWwb/yQLJNv7VEizKLg4hJrv7VKJ
X-Gm-Gg: ASbGncsX+62RGZ+NdUY/GYfs1vyp7ETgLG2T5uJQlM2Wpz7tyzVuGnqTIjnQ2oshNUL
	i49lZKG1Us4zLm9PF1pa1y+I0eAr9pJpDNBS6jwZpm0n3Jh1tDXlTIDxwO/u2ScuguYr6Cea54Y
	Xknt1Q/WpIXHnpaP6F+WDQ06tIoU+2F16VZ72OyEDWS7ODd/+MZMtQyczwz0ugyhnq+H5oFKsNh
	KcmKhYCK51DYg68tealsMpokVF++xhfGKUE5DJb5Yp+XfFN81yViMgmZJm2VmpvLLcaYlhOdo0f
	qRfgGWBO/+ye9ozBXycF7veKs16+VINXqpsqOSu9WUIZEvQZ9txeEGkosGTsxb0HXlFgyuRhWM7
	WQ5t5fPdgAd8nWUsA9bFIqKzMwQ==
X-Google-Smtp-Source: AGHT+IFtTWG82lj9kW60Ux7/zGpH+k9xbSgOEp6QEHnyKcsn4vfhrvxUPy+hETCT0HhwTVgiuuYEFw==
X-Received: by 2002:a05:6512:2345:b0:553:2dce:3abc with SMTP id 2adb3069b0e04-55366c38984mr725671e87.50.1749204707935;
        Fri, 06 Jun 2025 03:11:47 -0700 (PDT)
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
Subject: [PATCH v3 2/2] xen/char: implement suspend/resume calls for SCIF driver
Date: Fri,  6 Jun 2025 13:11:42 +0300
Message-ID: <3be3369910ec5159eab3cb26155da645dd1df83b.1749204282.git.mykola_kvach@epam.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1749204282.git.mykola_kvach@epam.com>
References: <cover.1749204282.git.mykola_kvach@epam.com>
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


