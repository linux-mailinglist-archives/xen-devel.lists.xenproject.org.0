Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 64EC9608DCF
	for <lists+xen-devel@lfdr.de>; Sat, 22 Oct 2022 17:04:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.428300.678326 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omG37-0005yt-78; Sat, 22 Oct 2022 15:04:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 428300.678326; Sat, 22 Oct 2022 15:04:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1omG37-0005wY-3O; Sat, 22 Oct 2022 15:04:33 +0000
Received: by outflank-mailman (input) for mailman id 428300;
 Sat, 22 Oct 2022 15:04:30 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1omG34-0005gS-UH
 for xen-devel@lists.xenproject.org; Sat, 22 Oct 2022 15:04:30 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1omG34-0005Ej-KM; Sat, 22 Oct 2022 15:04:30 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1omG34-00023n-Bx; Sat, 22 Oct 2022 15:04:30 +0000
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
	bh=LrFyBh0VUTegwiGKJOtrjeyi3WyVFq/ISvEVIIaZGsA=; b=AAFJwHuto9C4duL4FSkEqoCtlP
	IE4EkzYWr1SxtkKMvT7OGYRG343lAdKaP/wBcQRdFz+M13Pa9uFisba+1GfigJnRj5lc2VLJz5z0d
	TLwtIjCXabD3CPG7IxsVCS3Ji0DWrrJmbeRL9PXpxPezJLCDCE6AV5F+su26hGS478S4=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: marco.solieri@minervasys.tech,
	lucmiccio@gmail.com,
	carlo.nonato@minervasys.tech,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [RFC v2 02/12] xen/arm32: head: Jump to the runtime mapping in enable_mmu()
Date: Sat, 22 Oct 2022 16:04:12 +0100
Message-Id: <20221022150422.17707-3-julien@xen.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20221022150422.17707-1-julien@xen.org>
References: <20221022150422.17707-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

At the moment, enable_mmu() will return to an address in the 1:1 mapping
and each path are responsible to switch to the runtime mapping.

In a follow-up patch, the behavior to switch to the runtime mapping
will become more complex. So to avoid more code/comment duplication,
move the switch in enable_mmu().

Lastly, take the opportunity to replace load from literal pool with
mov_w.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 xen/arch/arm/arm32/head.S | 51 ++++++++++++++++++++++++---------------
 1 file changed, 31 insertions(+), 20 deletions(-)

diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
index a558c2a6876e..163bd6596dec 100644
--- a/xen/arch/arm/arm32/head.S
+++ b/xen/arch/arm/arm32/head.S
@@ -167,19 +167,12 @@ past_zImage:
         bl    check_cpu_mode
         bl    cpu_init
         bl    create_page_tables
-        bl    enable_mmu
 
-        /* We are still in the 1:1 mapping. Jump to the runtime Virtual Address. */
-        ldr   r0, =primary_switched
-        mov   pc, r0
+        /* Address in the runtime mapping to jump to after the MMU is enabled */
+        mov_w lr, primary_switched
+        b     enable_mmu
+
 primary_switched:
-        /*
-         * The 1:1 map may clash with other parts of the Xen virtual memory
-         * layout. As it is not used anymore, remove it completely to
-         * avoid having to worry about replacing existing mapping
-         * afterwards.
-         */
-        bl    remove_identity_mapping
         bl    setup_fixmap
 #ifdef CONFIG_EARLY_PRINTK
         /* Use a virtual address to access the UART. */
@@ -223,12 +216,10 @@ GLOBAL(init_secondary)
         bl    check_cpu_mode
         bl    cpu_init
         bl    create_page_tables
-        bl    enable_mmu
-
 
-        /* We are still in the 1:1 mapping. Jump to the runtime Virtual Address. */
-        ldr   r0, =secondary_switched
-        mov   pc, r0
+        /* Address in the runtime mapping to jump to after the MMU is enabled */
+        mov_w lr, secondary_switched
+        b     enable_mmu
 secondary_switched:
         /*
          * Non-boot CPUs need to move on to the proper pagetables, which were
@@ -523,9 +514,12 @@ virtphys_clash:
 ENDPROC(create_page_tables)
 
 /*
- * Turn on the Data Cache and the MMU. The function will return on the 1:1
- * mapping. In other word, the caller is responsible to switch to the runtime
- * mapping.
+ * Turn on the Data Cache and the MMU. The function will return
+ * to the virtual address provided in LR (e.g. the runtime mapping).
+ *
+ * Inputs:
+ *   r9 : paddr(start)
+ *   lr : Virtual address to return to
  *
  * Clobbers r0 - r3
  */
@@ -551,7 +545,24 @@ enable_mmu:
         dsb                          /* Flush PTE writes and finish reads */
         mcr   CP32(r0, HSCTLR)       /* now paging is enabled */
         isb                          /* Now, flush the icache */
-        mov   pc, lr
+
+        /*
+         * The MMU is turned on and we are in the 1:1 mapping. Switch
+         * to the runtime mapping.
+         */
+        mov_w r0, 1f
+        mov   pc, r0
+1:
+        /*
+         * The 1:1 map may clash with other parts of the Xen virtual memory
+         * layout. As it is not used anymore, remove it completely to
+         * avoid having to worry about replacing existing mapping
+         * afterwards.
+         *
+         * On return this will jump to the virtual address requested by
+         * the caller.
+         */
+        b     remove_identity_mapping
 ENDPROC(enable_mmu)
 
 /*
-- 
2.37.1


