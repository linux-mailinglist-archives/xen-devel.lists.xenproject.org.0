Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC0B77CC3AD
	for <lists+xen-devel@lfdr.de>; Tue, 17 Oct 2023 14:54:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.618241.961636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsjYg-0004BH-Lv; Tue, 17 Oct 2023 12:52:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 618241.961636; Tue, 17 Oct 2023 12:52:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qsjYg-00047v-Ix; Tue, 17 Oct 2023 12:52:26 +0000
Received: by outflank-mailman (input) for mailman id 618241;
 Tue, 17 Oct 2023 12:52:25 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qsjYf-00047p-0g
 for xen-devel@lists.xenproject.org; Tue, 17 Oct 2023 12:52:25 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qsjYe-0004Bu-FG; Tue, 17 Oct 2023 12:52:24 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qsjYe-000569-4z; Tue, 17 Oct 2023 12:52:24 +0000
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
	Subject:Cc:To:From; bh=MknmP2wGrjGZswt9B/XD/+18BWa0iXBTx/DOGz518es=; b=0VjuO+
	LCVBaB1uWH4aQ5H6z50Z9e0Kjr33nbMDweemQeeQZxj1uZpToHiEWCJCUPjmwlNvf6qRtCWfMj7yW
	pUolvCV/euEdspZd5j7r+4k68YHt4eDBUK+C2NOO8cWspdPeIjdKEc5FCjnffbbivlFxc211jOb7/
	NpdvHavTib8=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: ayan.kumar.halder@amd.com,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [for-4.19] xen/arm64: head: only use the macro load_paddr() in the MMU code
Date: Tue, 17 Oct 2023 13:52:19 +0100
Message-Id: <20231017125219.76626-1-julien@xen.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The macro load_paddr() requires to know the offset between the
physical location of Xen and the virtual location.

When using the MPU, x20 will always be 0. Rather than wasting
a register for a compile-time constant value, it would be best if
we can avoid using load_paddr() altogher in the common head.S code.

The current use of load_paddr() are equivalent to adr_l() because
the MMU is off.

All the use of load_paddr() in arm64/head.S are now replaced with
adr_l(). With that, load_paddr() can now be moved in arm64/mmu/head.S.

For now, x20 is still unconditionally set. But this could change
in the future if needed.

Signed-off-by: Julien Grall <julien@xen.org>
---
 xen/arch/arm/arm64/head.S               | 4 ++--
 xen/arch/arm/arm64/mmu/head.S           | 6 ++++++
 xen/arch/arm/include/asm/arm64/macros.h | 6 ------
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
index 4ad85dcf58d2..8dbd3300d89f 100644
--- a/xen/arch/arm/arm64/head.S
+++ b/xen/arch/arm/arm64/head.S
@@ -259,7 +259,7 @@ real_start_efi:
 
         /* Using the DTB in the .dtb section? */
 .ifnes CONFIG_DTB_FILE,""
-        load_paddr x21, _sdtb
+        adr_l x21, _sdtb
 .endif
 
         /* Initialize the UART if earlyprintk has been enabled. */
@@ -301,7 +301,7 @@ GLOBAL(init_secondary)
         bic   x24, x0, x13           /* Mask out flags to get CPU ID */
 
         /* Wait here until __cpu_up is ready to handle the CPU */
-        load_paddr x0, smp_up_cpu
+        adr_l x0, smp_up_cpu
         dsb   sy
 2:      ldr   x1, [x0]
         cmp   x1, x24
diff --git a/xen/arch/arm/arm64/mmu/head.S b/xen/arch/arm/arm64/mmu/head.S
index 88075ef08334..412b28e649a4 100644
--- a/xen/arch/arm/arm64/mmu/head.S
+++ b/xen/arch/arm/arm64/mmu/head.S
@@ -19,6 +19,12 @@
 #define XEN_FIRST_SLOT      first_table_offset(XEN_VIRT_START)
 #define XEN_SECOND_SLOT     second_table_offset(XEN_VIRT_START)
 
+/* Load the physical address of a symbol into xb */
+.macro load_paddr xb, sym
+        ldr \xb, =\sym
+        add \xb, \xb, x20
+.endm
+
 /*
  * Flush local TLBs
  *
diff --git a/xen/arch/arm/include/asm/arm64/macros.h b/xen/arch/arm/include/asm/arm64/macros.h
index 99c401fcafa9..fb9a0602494d 100644
--- a/xen/arch/arm/include/asm/arm64/macros.h
+++ b/xen/arch/arm/include/asm/arm64/macros.h
@@ -62,12 +62,6 @@
         add  \dst, \dst, :lo12:\sym
 .endm
 
-/* Load the physical address of a symbol into xb */
-.macro load_paddr xb, sym
-        ldr \xb, =\sym
-        add \xb, \xb, x20
-.endm
-
 /*
  * Register aliases.
  */
-- 
2.40.1


