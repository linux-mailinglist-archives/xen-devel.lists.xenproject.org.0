Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFF482F09B
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jan 2024 15:37:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.667807.1039461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPkZ4-0007se-5h; Tue, 16 Jan 2024 14:37:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 667807.1039461; Tue, 16 Jan 2024 14:37:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rPkZ4-0007qc-1r; Tue, 16 Jan 2024 14:37:18 +0000
Received: by outflank-mailman (input) for mailman id 667807;
 Tue, 16 Jan 2024 14:37:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rPkZ2-0007d6-R8
 for xen-devel@lists.xenproject.org; Tue, 16 Jan 2024 14:37:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rPkZ2-0002wi-Cj; Tue, 16 Jan 2024 14:37:16 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rPkZ2-0000Te-52; Tue, 16 Jan 2024 14:37:16 +0000
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
	bh=QB4GZQCd//Kzo6y8zaEONm7rNVnOunv9HV6HbpL0NS0=; b=A10stZBEien/4deDkPtbAED6FI
	z8KyK9NuT23J+Tfi8gKy5JLzHdPt0933+ubBHtxhUvqYQZfgaJFp/SPeERvR3iaGbqTjumRISYRKV
	uand0Fk37UNxaOzAeV9lVt5+5vid6AHgf/WoRxHKtwZEiyQUT88SCsM4hORVi6MBDuhU=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: carlo.nonato@minervasys.tech,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH v1 repost 3/4] xen/arm64: head: Use PRINT_ID() for secondary CPU MMU-off boot code
Date: Tue, 16 Jan 2024 14:37:08 +0000
Message-Id: <20240116143709.86584-4-julien@xen.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240116143709.86584-1-julien@xen.org>
References: <20240116143709.86584-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

With the upcoming work to color Xen, the binary will not be anymore
physically contiguous. This will be a problem during boot as the
assembly code will need to work out where each piece of Xen reside.

An easy way to solve the issue is to have all code/data accessed
by the secondary CPUs while the MMU is off within a single page.

Right now, most of the early printk messages are using PRINT() which
will add the message in .rodata. This is unlikely to be within the
same page as the rest of the idmap.

So replace all the PRINT() that can be reachable by the secondary
CPU with MMU-off with PRINT_ID().

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 xen/arch/arm/arm64/head.S               | 14 +++++++-------
 xen/arch/arm/arm64/mmu/head.S           |  2 +-
 xen/arch/arm/include/asm/arm64/macros.h |  9 ++++++---
 3 files changed, 14 insertions(+), 11 deletions(-)

diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
index cfc04c755400..fa8b00b6f1db 100644
--- a/xen/arch/arm/arm64/head.S
+++ b/xen/arch/arm/arm64/head.S
@@ -289,9 +289,9 @@ GLOBAL(init_secondary)
 
 #ifdef CONFIG_EARLY_PRINTK
         ldr   x23, =CONFIG_EARLY_UART_BASE_ADDRESS /* x23 := UART base address */
-        PRINT("- CPU ")
+        PRINT_ID("- CPU ")
         print_reg x24
-        PRINT(" booting -\r\n")
+        PRINT_ID(" booting -\r\n")
 #endif
         bl    check_cpu_mode
         bl    cpu_init
@@ -314,10 +314,10 @@ ENDPROC(init_secondary)
  * Clobbers x0 - x5
  */
 check_cpu_mode:
-        PRINT("- Current EL ")
+        PRINT_ID("- Current EL ")
         mrs   x5, CurrentEL
         print_reg x5
-        PRINT(" -\r\n")
+        PRINT_ID(" -\r\n")
 
         /* Are we in EL2 */
         cmp   x5, #PSR_MODE_EL2t
@@ -326,8 +326,8 @@ check_cpu_mode:
         ret
 1:
         /* OK, we're boned. */
-        PRINT("- Xen must be entered in NS EL2 mode -\r\n")
-        PRINT("- Please update the bootloader -\r\n")
+        PRINT_ID("- Xen must be entered in NS EL2 mode -\r\n")
+        PRINT_ID("- Please update the bootloader -\r\n")
         b fail
 ENDPROC(check_cpu_mode)
 
@@ -361,7 +361,7 @@ ENDPROC(zero_bss)
  * Clobbers x0 - x3
  */
 cpu_init:
-        PRINT("- Initialize CPU -\r\n")
+        PRINT_ID("- Initialize CPU -\r\n")
 
         /* Set up memory attribute type tables */
         ldr   x0, =MAIRVAL
diff --git a/xen/arch/arm/arm64/mmu/head.S b/xen/arch/arm/arm64/mmu/head.S
index 92b62ae94ce5..fa40b696ddc8 100644
--- a/xen/arch/arm/arm64/mmu/head.S
+++ b/xen/arch/arm/arm64/mmu/head.S
@@ -276,7 +276,7 @@ ENDPROC(create_page_tables)
 enable_mmu:
         mov   x4, x0
         mov   x5, x1
-        PRINT("- Turning on paging -\r\n")
+        PRINT_ID("- Turning on paging -\r\n")
 
         /*
          * The state of the TLBs is unknown before turning on the MMU.
diff --git a/xen/arch/arm/include/asm/arm64/macros.h b/xen/arch/arm/include/asm/arm64/macros.h
index 10e652041f57..6a0108f778a2 100644
--- a/xen/arch/arm/include/asm/arm64/macros.h
+++ b/xen/arch/arm/include/asm/arm64/macros.h
@@ -39,9 +39,12 @@
  * There are multiple flavors:
  *  - PRINT_SECT(section, string): The @string will be located in @section
  *  - PRINT(): The string will be located in .rodata.str.
- *  - PRINT_ID(): When Xen is running on the Identity Mapping, it is
- *    only possible to have a limited amount of Xen. This will create
- *    the string in .rodata.idmap which will always be mapped.
+ *  - PRINT_ID(): This will create the string in .rodata.idmap which
+ *    will always be accessible. This is used when:
+ *      - Xen is running on the identity mapping because not all of Xen is mapped
+ *      - Running with the MMU-off on secondary boots as Xen may not be
+ *        physically contiguous in memory (e.g. in the case of cache
+ *        coloring).
  *
  * Clobbers x0 - x3
  */
-- 
2.40.1


