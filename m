Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F8B5915F0
	for <lists+xen-devel@lfdr.de>; Fri, 12 Aug 2022 21:25:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.385863.621705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMaHW-00029O-88; Fri, 12 Aug 2022 19:25:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 385863.621705; Fri, 12 Aug 2022 19:25:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMaHV-00025t-Od; Fri, 12 Aug 2022 19:25:17 +0000
Received: by outflank-mailman (input) for mailman id 385863;
 Fri, 12 Aug 2022 19:25:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oMaHT-0001c6-Cy
 for xen-devel@lists.xenproject.org; Fri, 12 Aug 2022 19:25:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oMaHT-0000yr-3l; Fri, 12 Aug 2022 19:25:15 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oMaHS-0006n6-SF; Fri, 12 Aug 2022 19:25:15 +0000
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
	bh=N0+B5XI5k/0P7I6pJAFTgtxvabGcKL0aymNxJrmp098=; b=7DIcsA5igRjgb1+LpFavAWnCwf
	wBTHUqkSDjwyxf9Xaylx9d33crE1BD4l1az20wETg1Ik5LUi85syQEujQh5AXegA7kgzuHIDIIveJ
	PWUdDnq80nOUhbGp6YcbBvpdOjiDc8ExeqedyidYHN67sxCuQfPHlwCcSonFdbAc1/Hg=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 7/8] patch arm32-tweak-enable-mmu.patch
Date: Fri, 12 Aug 2022 20:24:46 +0100
Message-Id: <20220812192448.43016-8-julien@xen.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220812192448.43016-1-julien@xen.org>
References: <20220812192448.43016-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

---
 xen/arch/arm/arm32/head.S | 50 +++++++++++++++++++++++----------------
 1 file changed, 30 insertions(+), 20 deletions(-)

diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
index a558c2a6876e..a914ffab98a5 100644
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
@@ -523,9 +514,11 @@ virtphys_clash:
 ENDPROC(create_page_tables)
 
 /*
- * Turn on the Data Cache and the MMU. The function will return on the 1:1
- * mapping. In other word, the caller is responsible to switch to the runtime
- * mapping.
+ * Turn on the Data Cache and the MMU. The function will return
+ * to the virtual address provided in LR (e.g. the runtime mapping).
+ *
+ * Inputs:
+ *   lr : Virtual address to return to
  *
  * Clobbers r0 - r3
  */
@@ -551,7 +544,24 @@ enable_mmu:
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


