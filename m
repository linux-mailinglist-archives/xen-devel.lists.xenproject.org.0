Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9C7A4AAB8
	for <lists+xen-devel@lfdr.de>; Sat,  1 Mar 2025 12:43:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.899373.1307711 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1toLF9-0000GJ-CK; Sat, 01 Mar 2025 11:42:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 899373.1307711; Sat, 01 Mar 2025 11:42:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1toLF9-0000Ba-8W; Sat, 01 Mar 2025 11:42:55 +0000
Received: by outflank-mailman (input) for mailman id 899373;
 Sat, 01 Mar 2025 11:42:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Tn84=VU=gmail.com=andr2000@srs-se1.protection.inumbo.net>)
 id 1toLF8-0008Nf-EX
 for xen-devel@lists.xenproject.org; Sat, 01 Mar 2025 11:42:54 +0000
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [2a00:1450:4864:20::231])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4f1276aa-f692-11ef-9898-31a8f345e629;
 Sat, 01 Mar 2025 12:42:52 +0100 (CET)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-30615661f98so30134351fa.2
 for <xen-devel@lists.xenproject.org>; Sat, 01 Mar 2025 03:42:52 -0800 (PST)
Received: from a2klaptop.localdomain ([185.199.97.5])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5494d7ac5aasm529435e87.120.2025.03.01.03.42.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Mar 2025 03:42:49 -0800 (PST)
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
X-Inumbo-ID: 4f1276aa-f692-11ef-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740829371; x=1741434171; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bXAxImwm4vbKts+Zk1RaNgL4ljo8Npday53UQ3vtoUY=;
        b=LgR8JB9T38/L7FWcmkOAS4Mb8FiGSqFFmolrMvbNlJ3LJKSDuHSshsY5s2MQ8z3p4R
         oktBBEtUjVjyTOlyNlIMlRh/bwuoBckFvC0VEOs51NCNJ/JRCHLnRXo0SW5zI69C3ZHN
         oykRUnF3vXdrsm8PiPfIPcNGGAMph4oCUtZiRdp2+lj9DcSqXiaSkGL5fXYNxBRLjUVl
         hj70lmvPGuBHWYc0o95NOfuiK63HHTH7SV/EEyn9uHYTMvp5N6OEuHj5FHFDBzaDpFPj
         iSHu48nmQceQwT2dmNy5prQ8dBiJsLm7uXbNMb1jsFUZso0ekVqSC1ZflGXDcJhsq0DS
         w1DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740829371; x=1741434171;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bXAxImwm4vbKts+Zk1RaNgL4ljo8Npday53UQ3vtoUY=;
        b=CtZHJN8+nspTLxC+5fR8jeU1CqmYjV5qJ6b3/mXXAzUogj98v8Tsz+zPMiaBlS1OVm
         mt2lvKhjYv6R6/1pVJJb52EKT6OOIaxO1prW2S/jTAwx3oHwbcR6cOm+XUQ9kcUtvSXI
         BGnmJ2um+Or6Si370g8J0/H6w//9FoChS3AsaqTP9gDzWM9BgqvpJoJrCZXMP5qViuSB
         JnEjdsPq3zewr6nRxVOqmiOsKYvpweA/BQwJtRbAQ3aIC4KCRSnB7zoOFV21uOP4ZPIK
         otiWh3bdhNnbxFHHNDgpdK3xTxYf0TifDI9nwY8HySuW/cbXC/8tkiFhFy+3vy8ZR3rE
         lefw==
X-Gm-Message-State: AOJu0YwQAj1Kh5roUGt32i0dJmhEn2GNtH0N5pGNMms2IcgI7hPx4o2G
	GyfT5ZNP1h14bbF774Vcwwxwi+6VLoEQM5eMZvvj1NGqVmzwtsdSlgEFlXgC
X-Gm-Gg: ASbGncsrqeL08tl5q8GxhKUqNCRcPZtpi1WZFr+MK4OFB+87UZWbKvMGhV2LtWHY3/T
	9RW1VNjBUQiEJthmjCR9KCgFu0dWQFOiJ8LDP1RHWgs3SOZ4JFRXB9i7URkBv9A5Nuk38FBNj7A
	PzAB4RIzx3nLEJsqMvGg7joDwW+09Mse9DQAMXXZnZ0e2Uwaa6XmGvzFToLHl0IE7dtoYyAgMlX
	uuXdN8U2zWWiKGLedJlMcq9KtuwL8a3FRqtViygKfp9CNIFbKw5mRAwbzGC0gYTBTGPBFjp+oRa
	bT4w+ff/6MVe08iZRzGtZWwc3C702VyLaVfvCwBAQfVVucliV1a1nQ==
X-Google-Smtp-Source: AGHT+IEk4H4TgXkpqJ68tLuz95VZH9b/vQeQfuDR/C5jZ9yu0y+AtXpPmYrqGsSr3Qc0Mih7K8R5dg==
X-Received: by 2002:a05:6512:a8b:b0:545:49d:547a with SMTP id 2adb3069b0e04-5494c122e84mr2681261e87.18.1740829371327;
        Sat, 01 Mar 2025 03:42:51 -0800 (PST)
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
Subject: [PATCH 2/4] [EXAMPLE] Provide an example of a malformed patch
Date: Sat,  1 Mar 2025 13:42:40 +0200
Message-Id: <20250301114242.93650-3-andr2000@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250301114242.93650-1-andr2000@gmail.com>
References: <20250301114242.93650-1-andr2000@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch touches tools/xl and xen/. clang-format, if applied, will
only change xen/ part.

Signed-off-by: Oleksandr Andrushchenko <andr2000@gmail.com>
---
 tools/xl/xl_info.c         |  6 ++----
 xen/drivers/char/ns16550.c | 12 +++++-------
 2 files changed, 7 insertions(+), 11 deletions(-)

diff --git a/tools/xl/xl_info.c b/tools/xl/xl_info.c
index 72e87eac46d1..cbb0f695685f 100644
--- a/tools/xl/xl_info.c
+++ b/tools/xl/xl_info.c
@@ -59,8 +59,7 @@ static int maybe_printf(const char *fmt, ...)
     return count;
 }
 
-static yajl_gen_status printf_info_one_json(yajl_gen hand, int domid,
-                                            libxl_domain_config *d_config)
+static yajl_gen_status printf_info_one_json(yajl_gen hand, int domid, libxl_domain_config *d_config)
 {
     yajl_gen_status s;
 
@@ -68,8 +67,7 @@ static yajl_gen_status printf_info_one_json(yajl_gen hand, int domid,
     if (s != yajl_gen_status_ok)
         goto out;
 
-    s = yajl_gen_string(hand, (const unsigned char *)"domid",
-                        sizeof("domid")-1);
+    s = yajl_gen_string(hand, (const unsigned char *)"domid", sizeof("domid")-1);
     if (s != yajl_gen_status_ok)
         goto out;
     if (domid != -1)
diff --git a/xen/drivers/char/ns16550.c b/xen/drivers/char/ns16550.c
index eaeb0e09d01e..53586f110008 100644
--- a/xen/drivers/char/ns16550.c
+++ b/xen/drivers/char/ns16550.c
@@ -340,9 +340,7 @@ static void ns16550_setup_preirq(struct ns16550 *uart)
         if ( divisor )
             uart->baud = uart->clock_hz / (divisor << 4);
         else
-            printk(XENLOG_ERR
-                   "Automatic baud rate determination was requested,"
-                   " but a baud rate was not set up\n");
+            printk(XENLOG_ERR "Automatic baud rate determination was requested,"  " but a baud rate was not set up\n");
     }
     ns_write_reg(uart, UART_LCR, lcr);
 
@@ -350,8 +348,8 @@ static void ns16550_setup_preirq(struct ns16550 *uart)
     ns_write_reg(uart, UART_MCR, UART_MCR_DTR | UART_MCR_RTS);
 
     /* Enable and clear the FIFOs. Set a large trigger threshold. */
-    ns_write_reg(uart, UART_FCR,
-                 UART_FCR_ENABLE | UART_FCR_CLRX | UART_FCR_CLTX | UART_FCR_TRG14);
+    ns_write_reg(uart, UART_FCR, UART_FCR_ENABLE | UART_FCR_CLRX |
+                 UART_FCR_CLTX | UART_FCR_TRG14);
 }
 
 static void __init cf_check ns16550_init_preirq(struct serial_port *port)
@@ -398,8 +396,8 @@ static void ns16550_setup_postirq(struct ns16550 *uart)
     if ( uart->irq > 0 )
     {
         /* Master interrupt enable; also keep DTR/RTS asserted. */
-        ns_write_reg(uart,
-                     UART_MCR, UART_MCR_OUT2 | UART_MCR_DTR | UART_MCR_RTS);
+        ns_write_reg(uart, UART_MCR,
+                     UART_MCR_OUT2 | UART_MCR_DTR | UART_MCR_RTS);
 
         /* Enable receive interrupts. */
         ns_write_reg(uart, UART_IER, UART_IER_ERDAI);
-- 
2.25.1


