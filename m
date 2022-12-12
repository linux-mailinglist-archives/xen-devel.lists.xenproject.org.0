Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6634E649B80
	for <lists+xen-devel@lfdr.de>; Mon, 12 Dec 2022 10:55:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.459264.717030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4fX8-0005CB-Hs; Mon, 12 Dec 2022 09:55:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 459264.717030; Mon, 12 Dec 2022 09:55:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4fX7-00058D-TW; Mon, 12 Dec 2022 09:55:37 +0000
Received: by outflank-mailman (input) for mailman id 459264;
 Mon, 12 Dec 2022 09:55:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p4fX6-0004ja-3g
 for xen-devel@lists.xenproject.org; Mon, 12 Dec 2022 09:55:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p4fX5-0001TW-Tg; Mon, 12 Dec 2022 09:55:35 +0000
Received: from 54-240-197-224.amazon.com ([54.240.197.224]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p4fX5-0001lz-MN; Mon, 12 Dec 2022 09:55:35 +0000
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
	bh=IkfkOtBPMDbEBtLpK7Qb9ilDR8TosDP0r588oIQO8sQ=; b=gFLykY5WKA9hd/5efzoUCsa14l
	koybqhFDNZ+bp+uwW0/nmTU0/J2tYNUB5XTQVCgobVsB6PZe5oJ0j8DZ1Ld3W8y5TUwCgjTwuXARF
	pIJJiOEXUcrwjXl+aH8djC1+w+0Q6xVY1qe9bf/TbbOwg3jHhZzI+BaqzgUV11BeGb/c=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: michal.orzel@amd.com,
	Luca.Fancellu@arm.com,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v3 08/18] xen/arm32: head: Introduce an helper to flush the TLBs
Date: Mon, 12 Dec 2022 09:55:13 +0000
Message-Id: <20221212095523.52683-9-julien@xen.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221212095523.52683-1-julien@xen.org>
References: <20221212095523.52683-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

The sequence for flushing the TLBs is 4 instruction long and often
requires an explanation how it works.

So create an helper and use it in the boot code (switch_ttbr() is left
alone for now).

Note that in secondary_switched, we were also flushing the instruction
cache and branch predictor. Neither of them was necessary because:
    * We are only supporting IVIPT cache on arm32, so the instruction
      cache flush is only necessary when executable code is modified.
      None of the boot code is doing that.
    * The instruction cache is not invalidated and misprediction is not
      a problem at boot.

Signed-off-by: Julien Grall <jgrall@amazon.com>

---
    Changes in v3:
        * Fix typo
        * Update the documentation
        * Rename the argument from tmp1 to tmp
---
 xen/arch/arm/arm32/head.S | 30 +++++++++++++++++-------------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
index 40c1d7502007..315abbbaebec 100644
--- a/xen/arch/arm/arm32/head.S
+++ b/xen/arch/arm/arm32/head.S
@@ -66,6 +66,20 @@
         add   \rb, \rb, r10
 .endm
 
+/*
+ * Flush local TLBs
+ *
+ * @tmp:    Scratch register
+ *
+ * See asm/arm32/flushtlb.h for the explanation of the sequence.
+ */
+.macro flush_xen_tlb_local tmp
+        dsb   nshst
+        mcr   CP32(\tmp, TLBIALLH)
+        dsb   nsh
+        isb
+.endm
+
 /*
  * Common register usage in this file:
  *   r0  -
@@ -232,11 +246,7 @@ secondary_switched:
         mcrr  CP64(r4, r5, HTTBR)
         dsb
         isb
-        mcr   CP32(r0, TLBIALLH)     /* Flush hypervisor TLB */
-        mcr   CP32(r0, ICIALLU)      /* Flush I-cache */
-        mcr   CP32(r0, BPIALL)       /* Flush branch predictor */
-        dsb                          /* Ensure completion of TLB+BP flush */
-        isb
+        flush_xen_tlb_local r0
 
 #ifdef CONFIG_EARLY_PRINTK
         /* Use a virtual address to access the UART. */
@@ -529,8 +539,7 @@ enable_mmu:
          * The state of the TLBs is unknown before turning on the MMU.
          * Flush them to avoid stale one.
          */
-        mcr   CP32(r0, TLBIALLH)     /* Flush hypervisor TLBs */
-        dsb   nsh
+        flush_xen_tlb_local r0
 
         /* Write Xen's PT's paddr into the HTTBR */
         load_paddr r0, boot_pgtable
@@ -605,12 +614,7 @@ remove_identity_mapping:
         strd  r2, r3, [r0, r1]
 
 identity_mapping_removed:
-        /* See asm/arm32/flushtlb.h for the explanation of the sequence. */
-        dsb   nshst
-        mcr   CP32(r0, TLBIALLH)
-        dsb   nsh
-        isb
-
+        flush_xen_tlb_local r0
         mov   pc, lr
 ENDPROC(remove_identity_mapping)
 
-- 
2.38.1


