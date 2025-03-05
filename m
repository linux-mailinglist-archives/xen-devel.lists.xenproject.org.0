Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 36712A4F995
	for <lists+xen-devel@lfdr.de>; Wed,  5 Mar 2025 10:12:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.901874.1309856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpknP-0008Kt-T6; Wed, 05 Mar 2025 09:12:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 901874.1309856; Wed, 05 Mar 2025 09:12:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tpknP-0008Eh-MD; Wed, 05 Mar 2025 09:12:07 +0000
Received: by outflank-mailman (input) for mailman id 901874;
 Wed, 05 Mar 2025 09:12:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0bc7=VY=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1tpknO-0006ew-7y
 for xen-devel@lists.xenproject.org; Wed, 05 Mar 2025 09:12:06 +0000
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e7d6b355-f9a1-11ef-9898-31a8f345e629;
 Wed, 05 Mar 2025 10:12:04 +0100 (CET)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-548430564d9so6960606e87.2
 for <xen-devel@lists.xenproject.org>; Wed, 05 Mar 2025 01:12:04 -0800 (PST)
Received: from EPUAKYIW02F7.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5495de028fasm1078264e87.139.2025.03.05.01.12.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Mar 2025 01:12:02 -0800 (PST)
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
X-Inumbo-ID: e7d6b355-f9a1-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741165924; x=1741770724; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hk7OlNvHyGrBIxhedAYhMR4TCL3M3B56gPlyju/+iaE=;
        b=cDCjt77bN2Pk28HYeWZzKju7Rb0gQh0LFmo0f45du8Zrm9CSkcbMMnKpZQTgeQUNEw
         SMPAiaJI9FyxPoWIw/zixgqPTHXW7fgKcI6nw/NrKCOd+kDXqH+t4AX5WuXca5dXNHMx
         pXowUOwCyNIYPAYLAek39kK8EDhDwTSZpkKZBrJY6Fw+8K3X20qGR1wSw4s7cnGpDUjS
         njzeUKPF/OohHaYKIRUSIMlN5PBeGaEhNCLjWicRXi9wvXOJwWVshbpR6u/jerfOoyN/
         KsOIlgf90AYv3NGv4HbXBvTbZQUUxAb/2QFj4mpkfhErX3GyvcvpaWm0NoyGGBBAg+t3
         SBmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741165924; x=1741770724;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Hk7OlNvHyGrBIxhedAYhMR4TCL3M3B56gPlyju/+iaE=;
        b=A6ihjZ1ZEHosMdkpGA0qHfLS3+Gg1CjIvFAK3vmxV43LfjhvxYUqsEVH13HYduJQqN
         sy970NyGQ/E764ALcXVDWUNfpAM79/REgxngbZdpiNRpdkBFqNkUe12Smad+3gUYE+MD
         VLhGKTPwzfX02R+vWn9541W3GIOvOTnlTfKmSC5SZUxW6/IWUPzGyA/0tnlzR9P6PUBM
         HoTjdXUuohK36Dv4E4A+mZlTOKOoe4awXl/cXncUI0qI43ZruA7r+Jz/8Cpme6t0IcM+
         CPIHEG4epO9vuH8s9xKqGOJathV3oNafb+1wvpiSwxis/CFbMynge0lEZnXOZih8mIgc
         TPAg==
X-Gm-Message-State: AOJu0Yxtw9ll/0samTbMc25iSHFAw57X10Pl0PcGC/1LxkZphjhDypP7
	0nBaHbGBlAQRQUDv38rAZJiEa9RUciG+md/2guh+vP+D5n9LfIzAO/awOqIz
X-Gm-Gg: ASbGnctCVBZL86rywC6SqXELoa1edValxEscJmB7EOZpzvg+l1nbzxN3z1CBUkdZxAP
	ZyufRqrmlu/pFtKzdPf4KGz60AdNxqUgP4FY7XMuHhGWki9oH3Mlkx363s5UCnBmNrhQ81a8R07
	0iqvQYfr9d2O+oiLhTHeJgVR+iUXOElucNKN9CUk2r3FCOcmHwRR6Uz/K0hPYw+Iu+p/xR/MUPe
	6nCNc2wl42PSRZC4wKV5fPAilOj/QBXTPz+N1EaF1cUaYxVjrcz3tTxYlLbprsov70eSItGCZ+c
	/67Wv+MfTA8BgncIeftSyS0dWWoGeiiiFJDv+LhSCYm8wdPq0w==
X-Google-Smtp-Source: AGHT+IEIUNIyqIxvynpuLuIPXWu5ZNrVatGILJqxFJ5qgs7gjphHV9/kq2qqAOMcHFIgr20BAbiaZg==
X-Received: by 2002:a05:6512:3b11:b0:549:7c13:e895 with SMTP id 2adb3069b0e04-5497d380d02mr820547e87.47.1741165923806;
        Wed, 05 Mar 2025 01:12:03 -0800 (PST)
From: Mykola Kvach <xakep.amatop@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: Mykola Kvach <mykola_kvach@epam.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
	Volodymyr Babchuk <volodymyr_babchuk@epam.com>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Subject: [PATCH 07/16] xen/char: implement suspend/resume calls for SCIF driver
Date: Wed,  5 Mar 2025 11:11:15 +0200
Message-ID: <503edd5fb277699aaeb87507bb39fbb52e81f168.1741164138.git.xakep.amatop@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1741164138.git.xakep.amatop@gmail.com>
References: <cover.1741164138.git.xakep.amatop@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mykola Kvach <mykola_kvach@epam.com>

The changes have been tested only on the Renesas R-Car-H3 Starter Kit board.

Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
Signed-off-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Signed-off-by: Mykola Kvach <mykola_kvach@epam.com>
---
 xen/drivers/char/scif-uart.c | 31 ++++++++++++++++++++++++++++++-
 1 file changed, 30 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/char/scif-uart.c b/xen/drivers/char/scif-uart.c
index 757793ca45..e166fb0f36 100644
--- a/xen/drivers/char/scif-uart.c
+++ b/xen/drivers/char/scif-uart.c
@@ -139,7 +139,7 @@ static void scif_uart_interrupt(int irq, void *data)
     }
 }
 
-static void __init scif_uart_init_preirq(struct serial_port *port)
+static void scif_uart_init_preirq(struct serial_port *port)
 {
     struct scif_uart *uart = port->uart;
     const struct port_params *params = uart->params;
@@ -271,6 +271,33 @@ static void scif_uart_stop_tx(struct serial_port *port)
     scif_writew(uart, SCIF_SCSCR, scif_readw(uart, SCIF_SCSCR) & ~SCSCR_TIE);
 }
 
+static void scif_uart_suspend(struct serial_port *port)
+{
+    struct scif_uart *uart = port->uart;
+
+    scif_uart_stop_tx(port);
+
+    /* Wait until last bit has been transmitted. */
+    while ( !(scif_readw(uart, SCIF_SCFSR) & SCFSR_TEND) );
+
+    /* Disable TX/RX parts and all interrupts */
+    scif_writew(uart, SCIF_SCSCR, 0);
+
+    /* Reset TX/RX FIFOs */
+    scif_writew(uart, SCIF_SCFCR, SCFCR_RFRST | SCFCR_TFRST);
+}
+
+static void scif_uart_resume(struct serial_port *port)
+{
+    struct scif_uart *uart = port->uart;
+
+    scif_uart_init_preirq(port);
+
+    /* Enable TX/RX and Error Interrupts  */
+    scif_writew(uart, SCIF_SCSCR, scif_readw(uart, SCIF_SCSCR) |
+                SCSCR_TIE | SCSCR_RIE | SCSCR_REIE);
+}
+
 static struct uart_driver __read_mostly scif_uart_driver = {
     .init_preirq  = scif_uart_init_preirq,
     .init_postirq = scif_uart_init_postirq,
@@ -281,6 +308,8 @@ static struct uart_driver __read_mostly scif_uart_driver = {
     .start_tx     = scif_uart_start_tx,
     .stop_tx      = scif_uart_stop_tx,
     .vuart_info   = scif_vuart_info,
+    .suspend      = scif_uart_suspend,
+    .resume       = scif_uart_resume,
 };
 
 static const struct dt_device_match scif_uart_dt_match[] __initconst =
-- 
2.43.0


