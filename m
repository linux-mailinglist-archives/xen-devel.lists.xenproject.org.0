Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D2064C6E4D
	for <lists+xen-devel@lfdr.de>; Mon, 28 Feb 2022 14:35:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.280565.478548 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOgBo-0008CD-PB; Mon, 28 Feb 2022 13:35:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 280565.478548; Mon, 28 Feb 2022 13:35:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nOgBo-00089h-Lv; Mon, 28 Feb 2022 13:35:48 +0000
Received: by outflank-mailman (input) for mailman id 280565;
 Mon, 28 Feb 2022 13:35:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nOgBn-00089b-HQ
 for xen-devel@lists.xenproject.org; Mon, 28 Feb 2022 13:35:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nOgBn-000650-95; Mon, 28 Feb 2022 13:35:47 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nOgBn-00044y-11; Mon, 28 Feb 2022 13:35:47 +0000
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
	Subject:Cc:To:From; bh=Bn4hKvD9tCHF+9EbFmzzBxbr9GyN25lLdXJIPYnrD3g=; b=Dr8F1w
	cKuWsyhC+ytpO2SIPHUHY/3hQHUek69ei/AmJ/gE3lZmJtdyxIKf+LdH25c+WsSONqoxSiJsXBTX1
	dj+txc3Z46+WZcH5QKLKcIEv7fWOyNqT3YS2t2lBFEitZczZ943q8FSJ5myePkupJij3UXaWwXt8L
	d/q+tgZdXAA=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: michal.orzel@arm.com,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v2] xen/arm32: head: Don't set r12 and update the documentation
Date: Mon, 28 Feb 2022 13:35:36 +0000
Message-Id: <20220228133536.57004-1-julien@xen.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

Since commit 54c4ae18d158 ("xen/arm32: head: Rework and document
launch()"), the boot code is setting r12 but not read it.

So remove the two instructions setting r12 and update the documentation
to show r12 has no specific purpose.

Signed-off-by: Julien Grall <jgrall@amazon.com>

---
    Changes in v2:
        - Don't set r12.
---
 xen/arch/arm/arm32/head.S | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
index 13cfc837d39c..7a906167efca 100644
--- a/xen/arch/arm/arm32/head.S
+++ b/xen/arch/arm/arm32/head.S
@@ -79,7 +79,7 @@
  *   r9  - paddr(start)
  *   r10 - phys offset
  *   r11 - UART address
- *   r12 - is_secondary_cpu
+ *   r12 -
  *   r13 - SP
  *   r14 - LR
  *   r15 - PC
@@ -166,8 +166,6 @@ past_zImage:
 #endif
         PRINT("- Boot CPU booting -\r\n")
 
-        mov   r12, #0                /* r12 := is_secondary_cpu */
-
         bl    check_cpu_mode
         bl    cpu_init
         bl    create_page_tables
@@ -206,8 +204,6 @@ GLOBAL(init_secondary)
         adr   r9, start              /* r9  := paddr (start) */
         sub   r10, r9, r0            /* r10 := phys-offset */
 
-        mov   r12, #1                /* r12 := is_secondary_cpu */
-
         mrc   CP32(r1, MPIDR)
         bic   r7, r1, #(~MPIDR_HWID_MASK) /* Mask out flags to get CPU ID */
 
-- 
2.32.0


