Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C23B6559622
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jun 2022 11:12:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355322.582923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4fM1-0003c4-Nt; Fri, 24 Jun 2022 09:11:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355322.582923; Fri, 24 Jun 2022 09:11:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4fM1-0003X3-J8; Fri, 24 Jun 2022 09:11:53 +0000
Received: by outflank-mailman (input) for mailman id 355322;
 Fri, 24 Jun 2022 09:11:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o4fM0-0003JW-51
 for xen-devel@lists.xenproject.org; Fri, 24 Jun 2022 09:11:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o4fLz-0001zI-Ti; Fri, 24 Jun 2022 09:11:51 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=dev-dsk-jgrall-1b-035652ec.eu-west-1.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o4fLz-0005kh-La; Fri, 24 Jun 2022 09:11:51 +0000
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
	bh=axjB04kMHfN9pAzvy+jzI10okTa32BNLwJRPdmioDVM=; b=bXb8SxvJFtPDGp5SOcKBg1Un+d
	KM5InCR6Jw3nm52QKRmf5r2E7AnV0tJ6Cf7M5EkDqXp6fpJiTVg9I2v16gz+XqJe+ii8oJAli2rUK
	YFPwzm5f+f6vPcDe/u/Soo07Hk6KsV78yiFn9i+9evPycJJtrcCm2GP0Bin7Z+4F+5yE=;
From: Julien Grall <julien@xen.org>
To: xen-devel@lists.xenproject.org
Cc: julien@xen.org,
	Julien Grall <jgrall@amazon.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Bertrand Marquis <bertrand.marquis@arm.com>,
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: [PATCH 2/7] xen/arm32: head.S: Introduce a macro to load the physical address of a symbol
Date: Fri, 24 Jun 2022 10:11:41 +0100
Message-Id: <20220624091146.35716-3-julien@xen.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220624091146.35716-1-julien@xen.org>
References: <20220624091146.35716-1-julien@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Julien Grall <jgrall@amazon.com>

A lot of places in the ARM32 assembly requires to load the physical address
of a symbol. Rather than open-coding the translation, introduce a new macro
that will load the phyiscal address of a symbol.

Lastly, use the new macro to replace all the current open-coded version.

Note that most of the comments associated to the code changed have been
removed because the code is now self-explanatory.

Signed-off-by: Julien Grall <jgrall@amazon.com>
---
 xen/arch/arm/arm32/head.S | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
index c837d3054cf9..77f0a619ca51 100644
--- a/xen/arch/arm/arm32/head.S
+++ b/xen/arch/arm/arm32/head.S
@@ -65,6 +65,11 @@
         .endif
 .endm
 
+.macro load_paddr rb, sym
+        ldr   \rb, =\sym
+        add   \rb, \rb, r10
+.endm
+
 /*
  * Common register usage in this file:
  *   r0  -
@@ -157,8 +162,7 @@ past_zImage:
 
         /* Using the DTB in the .dtb section? */
 .ifnes CONFIG_DTB_FILE,""
-        ldr   r8, =_sdtb
-        add   r8, r10                /* r8 := paddr(DTB) */
+        load_paddr r8, _stdb
 .endif
 
         /* Initialize the UART if earlyprintk has been enabled. */
@@ -208,8 +212,7 @@ GLOBAL(init_secondary)
         mrc   CP32(r1, MPIDR)
         bic   r7, r1, #(~MPIDR_HWID_MASK) /* Mask out flags to get CPU ID */
 
-        ldr   r0, =smp_up_cpu
-        add   r0, r0, r10            /* Apply physical offset */
+        load_paddr r0, smp_up_cpu
         dsb
 2:      ldr   r1, [r0]
         cmp   r1, r7
@@ -376,8 +379,7 @@ ENDPROC(cpu_init)
         and   r1, r1, r2             /* r1 := slot in \tlb */
         lsl   r1, r1, #3             /* r1 := slot offset in \tlb */
 
-        ldr   r4, =\tbl
-        add   r4, r4, r10            /* r4 := paddr(\tlb) */
+        load_paddr r4, \tbl
 
         movw  r2, #PT_PT             /* r2:r3 := right for linear PT */
         orr   r2, r2, r4             /*           + \tlb paddr */
@@ -536,8 +538,7 @@ enable_mmu:
         dsb   nsh
 
         /* Write Xen's PT's paddr into the HTTBR */
-        ldr   r0, =boot_pgtable
-        add   r0, r0, r10            /* r0 := paddr (boot_pagetable) */
+        load_paddr r0, boot_pgtable
         mov   r1, #0                 /* r0:r1 is paddr (boot_pagetable) */
         mcrr  CP64(r0, r1, HTTBR)
         isb
@@ -782,10 +783,8 @@ ENTRY(lookup_processor_type)
  */
 __lookup_processor_type:
         mrc   CP32(r0, MIDR)                /* r0 := our cpu id */
-        ldr   r1, = __proc_info_start
-        add   r1, r1, r10                   /* r1 := paddr of table (start) */
-        ldr   r2, = __proc_info_end
-        add   r2, r2, r10                   /* r2 := paddr of table (end) */
+        load_paddr r1, __proc_info_start
+        load_paddr r2, __proc_info_end
 1:      ldr   r3, [r1, #PROCINFO_cpu_mask]
         and   r4, r0, r3                    /* r4 := our cpu id with mask */
         ldr   r3, [r1, #PROCINFO_cpu_val]   /* r3 := cpu val in current proc info */
-- 
2.32.0


