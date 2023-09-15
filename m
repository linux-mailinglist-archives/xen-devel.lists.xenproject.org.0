Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2693F7A29E6
	for <lists+xen-devel@lfdr.de>; Fri, 15 Sep 2023 23:59:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603444.940445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhGpz-000162-NU; Fri, 15 Sep 2023 21:58:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603444.940445; Fri, 15 Sep 2023 21:58:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhGpz-00013V-KF; Fri, 15 Sep 2023 21:58:55 +0000
Received: by outflank-mailman (input) for mailman id 603444;
 Fri, 15 Sep 2023 21:58:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qhGpy-00013P-07
 for xen-devel@lists.xenproject.org; Fri, 15 Sep 2023 21:58:54 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qhGpx-0000lo-OL; Fri, 15 Sep 2023 21:58:53 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qhGpx-0002bG-Gi; Fri, 15 Sep 2023 21:58:53 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=LDGyTgn9922NIE2Hb0pRvlpvqTv3uLX7PzT4rmzmZME=; b=NPRYQ/RMvlWQLAiJtrVnFWvABD
	t2ASTUPvOZ4fHKlVLgAu561yALk+KslaZ413olYf4Hko2H5WOfpB4czKqiL74Je3wATlr6k6OGsqJ
	Fyll3cGVEBpnBVwlZQjhmMy8QxMu3H+OfWyvqu6qdU3VNq29UXQdOGR7bakP/etRxyjE=;
Message-ID: <4d7a9849-8990-8ddd-3531-93f4e2e262b1@xen.org>
Date: Fri, 15 Sep 2023 22:58:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
To: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <wei.chen@arm.com>,
 Penny Zheng <penny.zheng@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230828013224.669433-1-Henry.Wang@arm.com>
 <20230828013224.669433-9-Henry.Wang@arm.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v6 08/13] xen/arm: Fold mmu_init_secondary_cpu() to head.S
In-Reply-To: <20230828013224.669433-9-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

On 28/08/2023 02:32, Henry Wang wrote:
> Currently mmu_init_secondary_cpu() only enforces the page table
> should not contain mapping that are both Writable and eXecutables
> after boot. To ease the arch/arm/mm.c split work, fold this function
> to head.S.
> 
> Introduce assembly macro pt_enforce_wxn for both arm32 and arm64.
> For arm64, the macro is called at the end of enable_secondary_cpu_mm().
> For arm32, the macro is called before secondary CPUs jumping into
> the C world.
> 
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
> ---
> v6:
> - New patch.
> ---
>   xen/arch/arm/arm32/head.S     | 20 ++++++++++++++++++++
>   xen/arch/arm/arm64/mmu/head.S | 21 +++++++++++++++++++++
>   xen/arch/arm/include/asm/mm.h |  2 --
>   xen/arch/arm/mm.c             |  6 ------
>   xen/arch/arm/smpboot.c        |  2 --
>   5 files changed, 41 insertions(+), 10 deletions(-)
> 
> diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
> index 33b038e7e0..39218cf15f 100644
> --- a/xen/arch/arm/arm32/head.S
> +++ b/xen/arch/arm/arm32/head.S
> @@ -83,6 +83,25 @@
>           isb
>   .endm
>   
> +/*
> + * Enforce Xen page-tables do not contain mapping that are both
> + * Writable and eXecutables.
> + *
> + * This should be called on each secondary CPU.
> + */
> +.macro pt_enforce_wxn tmp
> +        mrc   CP32(\tmp, HSCTLR)
> +        orr   \tmp, \tmp, #SCTLR_Axx_ELx_WXN
> +        dsb
> +        mcr   CP32(\tmp, HSCTLR)
> +        /*
> +         * The TLBs may cache SCTLR_EL2.WXN. So ensure it is synchronized
> +         * before flushing the TLBs.
> +         */
> +        isb
> +        flush_xen_tlb_local \tmp
> +.endm
> +
>   /*
>    * Common register usage in this file:
>    *   r0  -
> @@ -254,6 +273,7 @@ secondary_switched:
>           /* Use a virtual address to access the UART. */
>           mov_w r11, EARLY_UART_VIRTUAL_ADDRESS
>   #endif
> +        pt_enforce_wxn r0
>           PRINT("- Ready -\r\n")
>           /* Jump to C world */
>           mov_w r2, start_secondary
> diff --git a/xen/arch/arm/arm64/mmu/head.S b/xen/arch/arm/arm64/mmu/head.S
> index a5271e3880..25028bdf07 100644
> --- a/xen/arch/arm/arm64/mmu/head.S
> +++ b/xen/arch/arm/arm64/mmu/head.S
> @@ -31,6 +31,25 @@
>           isb
>   .endm
>   
> +/*
> + * Enforce Xen page-tables do not contain mapping that are both
> + * Writable and eXecutables.
> + *
> + * This should be called on each secondary CPU.
> + */
> +.macro pt_enforce_wxn tmp
> +       mrs   \tmp, SCTLR_EL2
> +       orr   \tmp, \tmp, #SCTLR_Axx_ELx_WXN
> +       dsb   sy
> +       msr   SCTLR_EL2, \tmp
> +       /*
> +        * The TLBs may cache SCTLR_EL2.WXN. So ensure it is synchronized
> +        * before flushing the TLBs.
> +        */
> +       isb
> +       flush_xen_tlb_local
> +.endm
> +

It would be preferable if we can set the flag right when the MMU is 
initialized enabled configured. This would avoid the extra TLB flush and 
SCTLR dance. How about the following (not compiled/cleaned) code:

diff --git a/xen/arch/arm/arm64/mmu/head.S b/xen/arch/arm/arm64/mmu/head.S
index a5271e388071..6b19d15ff89f 100644
--- a/xen/arch/arm/arm64/mmu/head.S
+++ b/xen/arch/arm/arm64/mmu/head.S
@@ -264,10 +264,11 @@ ENDPROC(create_page_tables)
   * Inputs:
   *   x0 : Physical address of the page tables.
   *
- * Clobbers x0 - x4
+ * Clobbers x0 - x6
   */
  enable_mmu:
          mov   x4, x0
+        mov   x5, x1
          PRINT("- Turning on paging -\r\n")

          /*
@@ -283,6 +284,7 @@ enable_mmu:
          mrs   x0, SCTLR_EL2
          orr   x0, x0, #SCTLR_Axx_ELx_M  /* Enable MMU */
          orr   x0, x0, #SCTLR_Axx_ELx_C  /* Enable D-cache */
+        orr   x0, x0, x5                /* Enable extra flags */
          dsb   sy                     /* Flush PTE writes and finish 
reads */
          msr   SCTLR_EL2, x0          /* now paging is enabled */
          isb                          /* Now, flush the icache */
@@ -297,16 +299,17 @@ ENDPROC(enable_mmu)
   * Inputs:
   *   lr : Virtual address to return to.
   *
- * Clobbers x0 - x5
+ * Clobbers x0 - x6
   */
  ENTRY(enable_secondary_cpu_mm)
-        mov   x5, lr
+        mov   x6, lr

          load_paddr x0, init_ttbr
          ldr   x0, [x0]

+        mov   x1, #SCTLR_Axx_ELx_WXN        /* Enable WxN from the start */
          bl    enable_mmu
-        mov   lr, x5
+        mov   lr, x6

          /* Return to the virtual address requested by the caller. */
          ret
@@ -320,16 +323,17 @@ ENDPROC(enable_secondary_cpu_mm)
   * Inputs:
   *   lr : Virtual address to return to.
   *
- * Clobbers x0 - x5
+ * Clobbers x0 - x6
   */
  ENTRY(enable_boot_cpu_mm)
-        mov   x5, lr
+        mov   x6, lr

          bl    create_page_tables
          load_paddr x0, boot_pgtable

+        mov   x1, #0        /* No extra SCTLR flags */
          bl    enable_mmu
-        mov   lr, x5
+        mov   lr, x6

          /*
           * The MMU is turned on and we are in the 1:1 mapping. Switch

The same logic could be used for arm32.

Cheers,

-- 
Julien Grall

