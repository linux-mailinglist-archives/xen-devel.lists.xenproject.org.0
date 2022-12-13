Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B238464AC7F
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 01:33:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.460000.717790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4tD2-0006jC-MO; Tue, 13 Dec 2022 00:31:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 460000.717790; Tue, 13 Dec 2022 00:31:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4tD2-0006hN-Ih; Tue, 13 Dec 2022 00:31:48 +0000
Received: by outflank-mailman (input) for mailman id 460000;
 Tue, 13 Dec 2022 00:31:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TuKI=4L=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1p4tD0-0006hH-G4
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 00:31:46 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 84a4ee53-7a7d-11ed-8fd2-01056ac49cbb;
 Tue, 13 Dec 2022 01:31:44 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D033E6125F;
 Tue, 13 Dec 2022 00:31:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C80FC433D2;
 Tue, 13 Dec 2022 00:31:41 +0000 (UTC)
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
X-Inumbo-ID: 84a4ee53-7a7d-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670891502;
	bh=IVm2reqsYyOHXVBsb40bFinYDBHIWbHiv1CGabuXfAI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Wo1SrzXgFcNXgazlnhyntTS3G6yhhMPiH6G0W9z6uxK7GYrpNwQyqfV7lK7ixZsMq
	 KOthGpgoyM/l6FtZCWirEbbC67jaC4SL1Q3GvyU6Ot3Bl54LsfeZuNFbYjNAu4ZAqD
	 +8uxJXAzgMPwLn3CNMhz1G7uEGetC1k3ge6gNz+7qnN8dlyuwT68FOSy/knY1W9ZTq
	 fu40duUtY97CJ7JMOqJyrIfcGW5uNWJWV0xZwONsAglTlTlPLbjCXkAsH5dYJ6zS+C
	 aU1koizrLlrw75JGG0oX6+y3dMhVqUWHlLAIFvdtb9UbYwelT+0CixYsNTDdycwb6/
	 B009AUrJ28JqA==
Date: Mon, 12 Dec 2022 16:31:39 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com, 
    Luca.Fancellu@arm.com, Julien Grall <jgrall@amazon.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 06/18] xen/arm32: head: Replace "ldr rX, =<label>"
 with "mov_w rX, <label>"
In-Reply-To: <20221212095523.52683-7-julien@xen.org>
Message-ID: <alpine.DEB.2.22.394.2212121631330.3075842@ubuntu-linux-20-04-desktop>
References: <20221212095523.52683-1-julien@xen.org> <20221212095523.52683-7-julien@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 12 Dec 2022, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> "ldr rX, =<label>" is used to load a value from the literal pool. This
> implies a memory access.
> 
> This can be avoided by using the macro mov_w which encode the value in
> the immediate of two instructions.
> 
> So replace all "ldr rX, =<label>" with "mov_w rX, <label>".
> 
> No functional changes intended.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> 
>     Changes in v3:
>         * Patch added
> ---
>  xen/arch/arm/arm32/head.S | 38 +++++++++++++++++++-------------------
>  1 file changed, 19 insertions(+), 19 deletions(-)
> 
> diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
> index a558c2a6876e..ce680be91be1 100644
> --- a/xen/arch/arm/arm32/head.S
> +++ b/xen/arch/arm/arm32/head.S
> @@ -62,7 +62,7 @@
>  .endm
>  
>  .macro load_paddr rb, sym
> -        ldr   \rb, =\sym
> +        mov_w \rb, \sym
>          add   \rb, \rb, r10
>  .endm
>  
> @@ -149,7 +149,7 @@ past_zImage:
>          mov   r8, r2                 /* r8 := DTB base address */
>  
>          /* Find out where we are */
> -        ldr   r0, =start
> +        mov_w r0, start
>          adr   r9, start              /* r9  := paddr (start) */
>          sub   r10, r9, r0            /* r10 := phys-offset */
>  
> @@ -170,7 +170,7 @@ past_zImage:
>          bl    enable_mmu
>  
>          /* We are still in the 1:1 mapping. Jump to the runtime Virtual Address. */
> -        ldr   r0, =primary_switched
> +        mov_w r0, primary_switched
>          mov   pc, r0
>  primary_switched:
>          /*
> @@ -190,7 +190,7 @@ primary_switched:
>          /* Setup the arguments for start_xen and jump to C world */
>          mov   r0, r10                /* r0 := Physical offset */
>          mov   r1, r8                 /* r1 := paddr(FDT) */
> -        ldr   r2, =start_xen
> +        mov_w r2, start_xen
>          b     launch
>  ENDPROC(start)
>  
> @@ -198,7 +198,7 @@ GLOBAL(init_secondary)
>          cpsid aif                    /* Disable all interrupts */
>  
>          /* Find out where we are */
> -        ldr   r0, =start
> +        mov_w r0, start
>          adr   r9, start              /* r9  := paddr (start) */
>          sub   r10, r9, r0            /* r10 := phys-offset */
>  
> @@ -227,7 +227,7 @@ GLOBAL(init_secondary)
>  
>  
>          /* We are still in the 1:1 mapping. Jump to the runtime Virtual Address. */
> -        ldr   r0, =secondary_switched
> +        mov_w r0, secondary_switched
>          mov   pc, r0
>  secondary_switched:
>          /*
> @@ -236,7 +236,7 @@ secondary_switched:
>           *
>           * XXX: This is not compliant with the Arm Arm.
>           */
> -        ldr   r4, =init_ttbr         /* VA of HTTBR value stashed by CPU 0 */
> +        mov_w r4, init_ttbr          /* VA of HTTBR value stashed by CPU 0 */
>          ldrd  r4, r5, [r4]           /* Actual value */
>          dsb
>          mcrr  CP64(r4, r5, HTTBR)
> @@ -254,7 +254,7 @@ secondary_switched:
>  #endif
>          PRINT("- Ready -\r\n")
>          /* Jump to C world */
> -        ldr   r2, =start_secondary
> +        mov_w r2, start_secondary
>          b     launch
>  ENDPROC(init_secondary)
>  
> @@ -297,8 +297,8 @@ ENDPROC(check_cpu_mode)
>   */
>  zero_bss:
>          PRINT("- Zero BSS -\r\n")
> -        ldr   r0, =__bss_start       /* r0 := vaddr(__bss_start) */
> -        ldr   r1, =__bss_end         /* r1 := vaddr(__bss_start) */
> +        mov_w r0, __bss_start        /* r0 := vaddr(__bss_start) */
> +        mov_w r1, __bss_end          /* r1 := vaddr(__bss_start) */
>  
>          mov   r2, #0
>  1:      str   r2, [r0], #4
> @@ -330,8 +330,8 @@ cpu_init:
>  
>  cpu_init_done:
>          /* Set up memory attribute type tables */
> -        ldr   r0, =MAIR0VAL
> -        ldr   r1, =MAIR1VAL
> +        mov_w r0, MAIR0VAL
> +        mov_w r1,MAIR1VAL
>          mcr   CP32(r0, HMAIR0)
>          mcr   CP32(r1, HMAIR1)
>  
> @@ -341,10 +341,10 @@ cpu_init_done:
>           * PT walks are write-back, write-allocate in both cache levels,
>           * Full 32-bit address space goes through this table.
>           */
> -        ldr   r0, =(TCR_RES1|TCR_SH0_IS|TCR_ORGN0_WBWA|TCR_IRGN0_WBWA|TCR_T0SZ(0))
> +        mov_w r0, (TCR_RES1|TCR_SH0_IS|TCR_ORGN0_WBWA|TCR_IRGN0_WBWA|TCR_T0SZ(0))
>          mcr   CP32(r0, HTCR)
>  
> -        ldr   r0, =HSCTLR_SET
> +        mov_w r0, HSCTLR_SET
>          mcr   CP32(r0, HSCTLR)
>          isb
>  
> @@ -452,7 +452,7 @@ ENDPROC(cpu_init)
>   */
>  create_page_tables:
>          /* Prepare the page-tables for mapping Xen */
> -        ldr   r0, =XEN_VIRT_START
> +        mov_w r0, XEN_VIRT_START
>          create_table_entry boot_pgtable, boot_second, r0, 1
>          create_table_entry boot_second, boot_third, r0, 2
>  
> @@ -576,7 +576,7 @@ remove_identity_mapping:
>          cmp   r1, #XEN_FIRST_SLOT
>          beq   1f
>          /* It is not in slot 0, remove the entry */
> -        ldr   r0, =boot_pgtable      /* r0 := root table */
> +        mov_w r0, boot_pgtable       /* r0 := root table */
>          lsl   r1, r1, #3             /* r1 := Slot offset */
>          strd  r2, r3, [r0, r1]
>          b     identity_mapping_removed
> @@ -590,7 +590,7 @@ remove_identity_mapping:
>          cmp   r1, #XEN_SECOND_SLOT
>          beq   identity_mapping_removed
>          /* It is not in slot 1, remove the entry */
> -        ldr   r0, =boot_second       /* r0 := second table */
> +        mov_w r0, boot_second        /* r0 := second table */
>          lsl   r1, r1, #3             /* r1 := Slot offset */
>          strd  r2, r3, [r0, r1]
>  
> @@ -620,7 +620,7 @@ ENDPROC(remove_identity_mapping)
>  setup_fixmap:
>  #if defined(CONFIG_EARLY_PRINTK)
>          /* Add UART to the fixmap table */
> -        ldr   r0, =EARLY_UART_VIRTUAL_ADDRESS
> +        mov_w r0, EARLY_UART_VIRTUAL_ADDRESS
>          create_mapping_entry xen_fixmap, r0, r11, type=PT_DEV_L3
>  #endif
>          /* Map fixmap into boot_second */
> @@ -643,7 +643,7 @@ ENDPROC(setup_fixmap)
>   * Clobbers r3
>   */
>  launch:
> -        ldr   r3, =init_data
> +        mov_w r3, init_data
>          add   r3, #INITINFO_stack    /* Find the boot-time stack */
>          ldr   sp, [r3]
>          add   sp, #STACK_SIZE        /* (which grows down from the top). */
> -- 
> 2.38.1
> 

