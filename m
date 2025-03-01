Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECF4A4AAB6
	for <lists+xen-devel@lfdr.de>; Sat,  1 Mar 2025 12:43:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.899374.1307726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1toLFA-0000fF-NN; Sat, 01 Mar 2025 11:42:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 899374.1307726; Sat, 01 Mar 2025 11:42:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1toLFA-0000dB-JB; Sat, 01 Mar 2025 11:42:56 +0000
Received: by outflank-mailman (input) for mailman id 899374;
 Sat, 01 Mar 2025 11:42:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tn84=VU=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1toLF9-0000De-H1
 for xen-devel@lists.xenproject.org; Sat, 01 Mar 2025 11:42:55 +0000
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5029b041-f692-11ef-9ab0-95dc52dad729;
 Sat, 01 Mar 2025 12:42:54 +0100 (CET)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-54957f0c657so1103483e87.0
 for <xen-devel@lists.xenproject.org>; Sat, 01 Mar 2025 03:42:54 -0800 (PST)
Received: from a2klaptop.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5494d7ac5aasm529435e87.120.2025.03.01.03.42.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Mar 2025 03:42:52 -0800 (PST)
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
X-Inumbo-ID: 5029b041-f692-11ef-9ab0-95dc52dad729
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740829373; x=1741434173; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8FflU+Os5qjZCptb7/2Oo5l7bXlBx0KY0qkevSMYIvQ=;
        b=nNJGd8/tc8v5FQsHxsl2CHKeshLlwoMmfgneUh/UkQkJr8J1d7PkdAu/M1CZcGfxF9
         feFvdK5QxV/qFJZp0NyvNNlWLSmJCjubz0Tskjd3FuVC7bcn7QI1rRi5hCuP6CDspkPS
         huu4ybxLaX8uN6AzqbPBuq+Nshi3LBgjbbWMCPgzpdn0UAn3VRmRAUdTm565js1YrU/1
         b8Xm1BqgaLKRZRm8LlI2XW72XeIbgQLuI0krmRyQDJPlJxpA+OhJWU8bLuMs74myuGUm
         DhoTBGBNpoG2WfrJ7WfFnVKe91e214RDIfV/eiBKm6ALxHHjW50vlKKXNvIlqx6zpO0i
         cQCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740829373; x=1741434173;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8FflU+Os5qjZCptb7/2Oo5l7bXlBx0KY0qkevSMYIvQ=;
        b=X6pNKdQl3LosZrZMSidgJ390gNPWTsJZR1wekEaMx2L6cD0tUFDuDBCh/t1XK+lJdd
         YXo91YgZ1bDiayT7YdPwZJe1yLfYZzPVSQYF2pIB4lUH23pqP0F5wkSur7U8vkorS9HF
         WOAvdv8EhwBE4lcxF8f0L5QM60bi4mj4EhZ5c3HVMPhRCD/dR6UjRKAAdgjZygrms80y
         /IXTjLkPMW6xUHNEQ1ZGdsr3jmlOOZA4mPjJlrjUHEcfM/Od55Z5VaTZw8m50MjfQkte
         GtmQU4zJqzq5z3J5LF1DsZwtdX5hH1mFq9LZGQsMZcoCNDKAHrSz/hptCCMYMvCC2h4M
         5b0Q==
X-Gm-Message-State: AOJu0YwhMqVIPlKwyfJWuE3Q3txjQPdcrLgOPzbLoQnJG5y2oEDPCp0X
	gaNP75INkqJ6khoRbVcI1JhbOzyeHSvZs+h1EmUQVGnSy7J2WuY3mpBdXfhv
X-Gm-Gg: ASbGnctjtYl2cwmH5oPtzKMK640QUX8qInzQHIOrSPlJOOfOqC+hzBCbGWQayQdPUOj
	DUOnv5HcAnNEiYDOJ9+RkdVG8Yod6cwYI0OBv8TkfwCDN85PA8o+A4D0QiW0VTPCty1TP1l66tU
	ufluCtjDv9v709bueIh3HXi0vtLT677YqQNfJqDS1kDEwzBo+Vv78cXuYG9IhslRXGcE3FwNRZQ
	nhCc4/WaZXzG55RJzfUH0d0Wugy4k+8HmT90VaiUQ0o85j1pKFblECH0lU+krSs6X5fgo7OFO9j
	LQ976pC9ZdR4fo0aS3KiPL8LHL++c1biYlF345NbwMvI/iT+1VyXZw==
X-Google-Smtp-Source: AGHT+IHrO/PxJz1la6A2/UtF7kPd60s0hPMesf4wO9jK5XIhnmwC35ZO2bjPxQp/XuyLw1uhicpL0Q==
X-Received: by 2002:a05:6512:398e:b0:545:2cb2:8b25 with SMTP id 2adb3069b0e04-5494c323717mr2711013e87.14.1740829373290;
        Sat, 01 Mar 2025 03:42:53 -0800 (PST)
From: Oleksandr Andrushchenko <andr2000@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: andr2000@gmail.com,
	sstabellini@kernel.org,
	Artem_Mygaiev@epam.com,
	jbeulich@suse.com,
	Luca.Fancellu@arm.com,
	roger.pau@citrix.com,
	marmarek@invisiblethingslab.com,
	andrew.cooper3@citrix.com,
	anthony.perard@vates.tech
Subject: [PATCH 3/4] [EXAMPLE] Changes done by clang-format to the previous commit
Date: Sat,  1 Mar 2025 13:42:41 +0200
Message-Id: <20250301114242.93650-4-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250301114242.93650-1-andr2000@gmail.com>
References: <20250301114242.93650-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch is the result of the:

$ git-clang-format --style=file --verbose HEAD~1
Running clang-format on the following files:
    tools/xl/xl_info.c
    xen/drivers/char/ns16550.c
old tree: dceb97b3ef3c80cbb9c29311a7f5783df2f69127
new tree: a8d36f8f45c3ee0d75e674ecda102ffc6a0a0ef3
changed files:
    xen/drivers/char/ns16550.c

It is seen that only xen/ part of the patch was touched. The result can
still be manually adjusted before committing.

Signed-off-by: Oleksandr Andrushchenko <andr2000@gmail.com>
---
 xen/drivers/char/ns16550.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index 53586f110008..4d79ef2b08bc 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -340,7 +340,9 @@ static void ns16550_setup_preirq(struct ns16550 *uart)
         if ( divisor )
             uart->baud = uart->clock_hz / (divisor << 4);
         else
-            printk(XENLOG_ERR "Automatic baud rate determination was requested,"  " but a baud rate was not set up\n");
+            printk(
+                XENLOG_ERR
+                "Automatic baud rate determination was requested," " but a baud rate was not set up\n");
     }
     ns_write_reg(uart, UART_LCR, lcr);
 
@@ -348,8 +350,9 @@ static void ns16550_setup_preirq(struct ns16550 *uart)
     ns_write_reg(uart, UART_MCR, UART_MCR_DTR | UART_MCR_RTS);
 
     /* Enable and clear the FIFOs. Set a large trigger threshold. */
-    ns_write_reg(uart, UART_FCR, UART_FCR_ENABLE | UART_FCR_CLRX |
-                 UART_FCR_CLTX | UART_FCR_TRG14);
+    ns_write_reg(uart, UART_FCR,
+                 UART_FCR_ENABLE | UART_FCR_CLRX | UART_FCR_CLTX |
+                     UART_FCR_TRG14);
 }
 
 static void __init cf_check ns16550_init_preirq(struct serial_port *port)
-- 
2.25.1


