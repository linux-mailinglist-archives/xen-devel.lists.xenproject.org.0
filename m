Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3702B511473
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 11:50:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.314690.532946 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njeJG-0002n9-Te; Wed, 27 Apr 2022 09:50:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 314690.532946; Wed, 27 Apr 2022 09:50:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njeJG-0002jB-Jh; Wed, 27 Apr 2022 09:50:10 +0000
Received: by outflank-mailman (input) for mailman id 314690;
 Wed, 27 Apr 2022 09:50:08 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XTRx=VF=arm.com=michal.orzel@srs-se1.protection.inumbo.net>)
 id 1njeJE-00085x-P7
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 09:50:08 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 6bd0b73f-c60f-11ec-a405-831a346695d4;
 Wed, 27 Apr 2022 11:50:08 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6924C14BF;
 Wed, 27 Apr 2022 02:50:07 -0700 (PDT)
Received: from e129167.arm.com (unknown [10.57.13.174])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D14C63F774;
 Wed, 27 Apr 2022 02:50:05 -0700 (PDT)
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
X-Inumbo-ID: 6bd0b73f-c60f-11ec-a405-831a346695d4
From: Michal Orzel <michal.orzel@arm.com>
To: xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 8/8] drivers/exynos4210: Remove unused-but-set variable
Date: Wed, 27 Apr 2022 11:49:41 +0200
Message-Id: <20220427094941.291554-9-michal.orzel@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220427094941.291554-1-michal.orzel@arm.com>
References: <20220427094941.291554-1-michal.orzel@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function exynos4210_uart_init_preirq defines and sets a variable
divisor but does not make use of it. Remove the definition and comment
out the assignment as this function already has some TODOs.

Signed-off-by: Michal Orzel <michal.orzel@arm.com>
---
Commenting out a code is a bad practise as well as using TODOs.
However the only alternative would be to get rid of divisor variable
and TODO comments. I'm open for solutions.
---
 xen/drivers/char/exynos4210-uart.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/xen/drivers/char/exynos4210-uart.c b/xen/drivers/char/exynos4210-uart.c
index fa7dbc0391..43aaf02e18 100644
--- a/xen/drivers/char/exynos4210-uart.c
+++ b/xen/drivers/char/exynos4210-uart.c
@@ -101,7 +101,6 @@ static void exynos4210_uart_interrupt(int irq, void *data, struct cpu_user_regs
 static void __init exynos4210_uart_init_preirq(struct serial_port *port)
 {
     struct exynos4210_uart *uart = port->uart;
-    unsigned int divisor;
     uint32_t ulcon;
 
     /* reset, TX/RX disables */
@@ -113,9 +112,12 @@ static void __init exynos4210_uart_init_preirq(struct serial_port *port)
     /* Line control and baud-rate generator. */
     if ( uart->baud != BAUD_AUTO )
     {
-        /* Baud rate specified: program it into the divisor latch. */
-        divisor = ((uart->clock_hz) / (uart->baud)) - 1;
-        /* FIXME: will use a hacked divisor, assuming the src clock and bauds */
+        /*
+         * TODO: should be updated
+         * Baud rate specified: program it into the divisor latch.
+         * divisor = ((uart->clock_hz) / (uart->baud)) - 1;
+         * FIXME: will use a hacked divisor, assuming the src clock and bauds.
+         */
         exynos4210_write(uart, UFRACVAL, 53);
         exynos4210_write(uart, UBRDIV, 4);
     }
-- 
2.25.1


