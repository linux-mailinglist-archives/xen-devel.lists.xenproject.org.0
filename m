Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D98125915EA
	for <lists+xen-devel@lfdr.de>; Fri, 12 Aug 2022 21:25:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.385860.621685 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMaHT-0001fa-Un; Fri, 12 Aug 2022 19:25:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 385860.621685; Fri, 12 Aug 2022 19:25:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMaHT-0001bf-PF; Fri, 12 Aug 2022 19:25:15 +0000
Received: by outflank-mailman (input) for mailman id 385860;
 Fri, 12 Aug 2022 19:25:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oMaHR-0001CF-BA
 for xen-devel@lists.xenproject.org; Fri, 12 Aug 2022 19:25:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oMaHR-0000yS-13; Fri, 12 Aug 2022 19:25:13 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oMaHQ-0006n6-PT; Fri, 12 Aug 2022 19:25:12 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=KSNSRhk/b7PF+Veoqw2eqLMcjCDzJVoJhlmghRfM920=; b=ZCkoDm+ZTirO4BNHjMNk5xuq33
	f3rtyXAH3xWYCjq79zyYeHN2QV+2yLqY6vW97Eu3JLKvZnY8hFYAFlnUO84vIXG3hmy+zt+pYG84p
	JnLwH6tMPpXjgCHTrYAZ3AgMerdBr8qCs382VleKjRokRwzoeBp0Xn7ubJG9iGjpm3tg=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 5/7] xen/arm32: head: Move earlyprintk messages to .rodata.str
Date: Fri, 12 Aug 2022 20:24:44 +0100
Message-Id: <20220812192448.43016-6-julien@xen.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220812192448.43016-1-julien@xen.org>
References: <20220812192448.43016-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

At the moment, the strings are in text right after each use because
the instruction 'adr' has specific requirement on the location
and the compiler will forbid cross section label.

The macro 'adr_l' was recently reworked so the caller doesn't need
to know whether the MMU is on. This makes it easier to use where
instructions can be run in both context.

This also means that the strings don't need to be part of .text
anymore. So move them to .rodata.str.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 xen/arch/arm/arm32/head.S | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
index 27d02ac8d68f..a558c2a6876e 100644
--- a/xen/arch/arm/arm32/head.S
+++ b/xen/arch/arm/arm32/head.S
@@ -93,13 +93,10 @@
  */
 #define PRINT(_s)           \
         mov   r3, lr       ;\
-        adr   r0, 98f      ;\
+        adr_l r0, 98f      ;\
         bl    puts         ;\
         mov   lr, r3       ;\
-        b     99f          ;\
-98:     .asciz _s          ;\
-        .align 2           ;\
-99:
+        RODATA_STR(98, _s)
 
 /*
  * Macro to print the value of register \rb
@@ -736,7 +733,7 @@ ENDPROC(puts)
  * Clobbers r0-r3
  */
 putn:
-        adr   r1, hex
+        adr_l r1, hex
         mov   r3, #8
 1:
         early_uart_ready r11, r2
@@ -749,8 +746,7 @@ putn:
         mov   pc, lr
 ENDPROC(putn)
 
-hex:    .ascii "0123456789abcdef"
-        .align 2
+RODATA_STR(hex, "0123456789abcdef")
 
 #else  /* CONFIG_EARLY_PRINTK */
 
-- 
2.37.1


