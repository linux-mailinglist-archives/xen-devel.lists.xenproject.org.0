Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D35E14C66DB
	for <lists+xen-devel@lfdr.de>; Mon, 28 Feb 2022 11:07:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.280298.478192 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOcwT-0002nK-Cx; Mon, 28 Feb 2022 10:07:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 280298.478192; Mon, 28 Feb 2022 10:07:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOcwT-0002kb-9u; Mon, 28 Feb 2022 10:07:45 +0000
Received: by outflank-mailman (input) for mailman id 280298;
 Mon, 28 Feb 2022 10:07:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nOcwS-0002kP-00
 for xen-devel@lists.xenproject.org; Mon, 28 Feb 2022 10:07:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nOcwR-0002MV-Oe; Mon, 28 Feb 2022 10:07:43 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nOcwR-0004Yf-GI; Mon, 28 Feb 2022 10:07:43 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
	Subject:Cc:To:From; bh=KVCoOox3nA3HgaYBDS9j2yAj0flJel/SfOyIYIak1Ps=; b=Nit+xE
	LNV8iy8Uqf4JZe7qnQRsweoNgwj/BP5EIv7byFjM26Nl0Pii4iYyyQhbAR+Bxbyj1q3ZttaWlIqPt
	9vislkGnav2t4Y45BqqzKElu8bHXNASoskzvlz+8iWcyoXKWgLpZsi05AiAt81AZ9OeuGSesNcz7M
	zHkSbq6ikDc=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm32: head: Mark the end of subroutines with ENDPROC (take two)
Date: Mon, 28 Feb 2022 10:07:40 +0000
Message-Id: <20220228100740.60332-1-julien@xen.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

Commit 2ac705a59ef5 ("xen/arm32: head: Mark the end of subroutines
with ENDPROC") intended to mark all the subroutines with ENDPROC.

Unfortunately, I missed fail(), switch_ttbr(), init_uart() and
__lookup_processor_type(). Add ENDPROC for the benefits of
static analysis tools and the reader.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 xen/arch/arm/arm32/head.S | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
index b1d209ea2842..13cfc837d39c 100644
--- a/xen/arch/arm/arm32/head.S
+++ b/xen/arch/arm/arm32/head.S
@@ -661,6 +661,7 @@ ENDPROC(launch)
 fail:   PRINT("- Boot failed -\r\n")
 1:      wfe
         b     1b
+ENDPROC(fail)
 
 GLOBAL(_end_boot)
 
@@ -694,6 +695,7 @@ ENTRY(switch_ttbr)
         isb
 
         mov pc, lr
+ENDPROC(switch_ttbr)
 
 #ifdef CONFIG_EARLY_PRINTK
 /*
@@ -711,6 +713,7 @@ init_uart:
 #endif
         PRINT("- UART enabled -\r\n")
         mov   pc, lr
+ENDPROC(init_uart)
 
 /*
  * Print early debug messages.
@@ -798,6 +801,7 @@ __lookup_processor_type:
         mov   r1, #0
 2:
         mov   pc, lr
+ENDPROC(__lookup_processor_type)
 
 /*
  * Local variables:
-- 
2.32.0


