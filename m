Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8A5B1D1ED
	for <lists+xen-devel@lfdr.de>; Thu,  7 Aug 2025 07:18:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1072506.1435562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujszt-000337-T7; Thu, 07 Aug 2025 05:17:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1072506.1435562; Thu, 07 Aug 2025 05:17:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ujszt-00030W-Pi; Thu, 07 Aug 2025 05:17:01 +0000
Received: by outflank-mailman (input) for mailman id 1072506;
 Thu, 07 Aug 2025 05:17:00 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gbW2=2T=gmail.com=xakep.amatop@srs-se1.protection.inumbo.net>)
 id 1ujszs-00030Q-I4
 for xen-devel@lists.xenproject.org; Thu, 07 Aug 2025 05:17:00 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be04f9c9-734d-11f0-a324-13f23c93f187;
 Thu, 07 Aug 2025 07:16:58 +0200 (CEST)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-332559ace6eso5183631fa.1
 for <xen-devel@lists.xenproject.org>; Wed, 06 Aug 2025 22:16:58 -0700 (PDT)
Received: from yp-VivoBook-ASUSLaptop-M1503QA-M1503QA.. ([95.67.15.120])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-332617dad03sm15339301fa.58.2025.08.06.22.16.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Aug 2025 22:16:56 -0700 (PDT)
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
X-Inumbo-ID: be04f9c9-734d-11f0-a324-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754543818; x=1755148618; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2cwbTztMm7LAAWc7S9z7SIjMK5xW5qzQ5BPRA2LNUzk=;
        b=hAUUwIvtbwFjf7EVen+wjgjLrg+u7+is/QUTEoQKfjLLLvL0vCFVmMPCiAT03P0jb+
         zzY3xH/YcN5sN1hCq3R8Xhrb4izhfdXwvPFh2IqjCanhAt/ANHJviJXq0Fk9lhwaIYOr
         HOlhOM3HgnH2M0O8ZPk+LsRWe2jqDEqwadMStkjl6MWc4jBtNDUSoUExQNqTiMoDl8L+
         OiiCdfBs67/OpJhlzGM4jYl1tLYevhwx39oWX1yBvnxrduj482+QFWLM0gPluvSPqw7T
         Qqa5REq7qDtA8RPm3sRUcQ+kdaFyP3u7mz8Ol4XRjIVpSaipIRx+njelBLb4qoY4E0Kf
         Sziw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754543818; x=1755148618;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2cwbTztMm7LAAWc7S9z7SIjMK5xW5qzQ5BPRA2LNUzk=;
        b=Vao1IamqHV6lEPLfVLcJf4KM1u9DeKnvw23Zi722KBIEpQSD/qkR37oo9fk+5rRDRn
         aFfoyqm2nq6yeLqGiXqn3ljwPntsGgdy3q5CdhlDOA2sE4p20YJ9f7R4T8Ugc/8Z1eaz
         QF2NBsCa+omGSxeRKdgWRmOreWgyntEFLiSvB1rZSlKphcla9SOxQz67kzLENsA6DRqG
         0wgkgq4TTuwnGoTmFIZP9Y9PvtlkHx4SF072zWVFgx0k+VnP7MNaij0aHg4KGOQdbXdG
         +a22dR7Rh3rJ9Td3+LRCBdGo7acepLj/HdLmHrW/jhKAehQOHyDDPfeqUg4HEi7O/ZNG
         0p6w==
X-Gm-Message-State: AOJu0Yxg/WVQtpatwUc6LB3b3jmFcl6KnywC7Ga1AHzLEc0iGRARCgik
	iw9IknytMiBWIiRzpQkqZPlOq/9rXRRVGD6fYD+OARiWo/tVEVXtDGhvlGkRhg==
X-Gm-Gg: ASbGncu355VvywOw4OzvWRBjVjljYIhEFZzpW7/kWU2Y+CKQUKlHqedn3tzP2E0NJHp
	4CtoBeR+O+Duqt1RVZchP+tfuS/JQwASeg8mdohK+eXQL9rZK+670JqMackunL7CTqaq6tcxnbv
	FSuvD+UHDLn55FnscIqXCr4w/9QSu+0Qyr8vUQM0agi/C2ba4dhM0pkBhe1Dmx5WW3J3dIG+WPo
	sJOSU5cr8NyAGhyl65PAT7k9FWcV7ec0+By8Zb1OcbqIRGLqiGbAeXSmP7SUToR6vs9tN98WrCz
	BxqTOab+OXjzW6nAHR3bPf3F9NXkRHvqrN8HgTdvuNKTEaubsePA8f8s1aIJDydIywwJOk1biUf
	PyFaBsMT70l85psA2xZpxxqL9eHQkORwGwRJDTh9XZ5udwaK639M3i6BnHrBsPEHHyEDeAGJ0
X-Google-Smtp-Source: AGHT+IGvuioCeTS98AKrplArDhtvwSyMwrb+yYBqVXHVvICbOsAyeSz3J4FR4WidZls81El2gvsIcw==
X-Received: by 2002:a2e:1311:0:b0:32c:abf4:d76a with SMTP id 38308e7fff4ca-33381477218mr12043971fa.38.1754543817383;
        Wed, 06 Aug 2025 22:16:57 -0700 (PDT)
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
Subject: [PATCH v5] xen/char: implement suspend/resume calls for SCIF driver
Date: Thu,  7 Aug 2025 08:16:52 +0300
Message-ID: <e57133182b9bcecb519911c8b3f0d871955d6fef.1754540991.git.mykola_kvach@epam.com>
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
In patch v5, there are no changes at all;
it was done just to trigger a review.

In patch v4, enhance commit message, no functional changes

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


