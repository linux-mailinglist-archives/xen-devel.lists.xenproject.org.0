Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B9D8264AC96
	for <lists+xen-devel@lfdr.de>; Tue, 13 Dec 2022 01:47:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.460020.717812 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4tRa-0000rB-B0; Tue, 13 Dec 2022 00:46:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 460020.717812; Tue, 13 Dec 2022 00:46:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p4tRa-0000np-8B; Tue, 13 Dec 2022 00:46:50 +0000
Received: by outflank-mailman (input) for mailman id 460020;
 Tue, 13 Dec 2022 00:46:49 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TuKI=4L=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1p4tRZ-0000nj-8Q
 for xen-devel@lists.xenproject.org; Tue, 13 Dec 2022 00:46:49 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9f26ed08-7a7f-11ed-8fd2-01056ac49cbb;
 Tue, 13 Dec 2022 01:46:48 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5B773612C5;
 Tue, 13 Dec 2022 00:46:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8E2EC433EF;
 Tue, 13 Dec 2022 00:46:44 +0000 (UTC)
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
X-Inumbo-ID: 9f26ed08-7a7f-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670892405;
	bh=XXT8Pba0qoutG85To85Sk8VlBcTPK73rdEClmyJ2swU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=hVEYRWHNcbMLDxHFMWpJE/O15yg5xwtVwtx0Xnb71lIrSs2Zwrp7QdLQ3jrbmsLKZ
	 itiwfOFYp6hn0ql0+XMtfqY3VMAZ9iDq1Ob64/a2XuJGPcCxON0EpVwDZ+cp6Li8dj
	 8SZu6G9UYfUEnJXPSNUWygXWo2Yj52tivaBOQhYcl6n50MzkBQyEIRQQtq0FgoUVqT
	 V2C0U5FxNkAwlbh7Hh347fY7sjnTcnx5zFTOmc2aeK7p/oBhfTOpIts/h1BLzHUBBP
	 L6LmV9VRLc+LWu4cmFCWGxBi8PMMlYI9RigDLkzQnS6TsKIFuIU2ZJEoEXE4HvKOwG
	 LqGYgPTm+NhXw==
Date: Mon, 12 Dec 2022 16:46:43 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com, 
    Luca.Fancellu@arm.com, Julien Grall <jgrall@amazon.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v3 07/18] xen/arm32: head: Jump to the runtime mapping
 in enable_mmu()
In-Reply-To: <20221212095523.52683-8-julien@xen.org>
Message-ID: <alpine.DEB.2.22.394.2212121646370.3075842@ubuntu-linux-20-04-desktop>
References: <20221212095523.52683-1-julien@xen.org> <20221212095523.52683-8-julien@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 12 Dec 2022, Julien Grall wrote:
> From: Julien Grall <jgrall@amazon.com>
> 
> At the moment, enable_mmu() will return to an address in the 1:1 mapping
> and each path is responsible to switch to the runtime mapping.
> 
> In a follow-up patch, the behavior to switch to the runtime mapping
> will become more complex. So to avoid more code/comment duplication,
> move the switch in enable_mmu().
> 
> Lastly, take the opportunity to replace load from literal pool with
> mov_w.
> 
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

> ---
>     Changes in v3:
>         - Fix typo in the commit message
> 
>     Changes in v2:
>         - Patch added
> ---
>  xen/arch/arm/arm32/head.S | 50 +++++++++++++++++++++++----------------
>  1 file changed, 30 insertions(+), 20 deletions(-)
> 
> diff --git a/xen/arch/arm/arm32/head.S b/xen/arch/arm/arm32/head.S
> index ce680be91be1..40c1d7502007 100644
> --- a/xen/arch/arm/arm32/head.S
> +++ b/xen/arch/arm/arm32/head.S
> @@ -167,19 +167,11 @@ past_zImage:
>          bl    check_cpu_mode
>          bl    cpu_init
>          bl    create_page_tables
> -        bl    enable_mmu
>  
> -        /* We are still in the 1:1 mapping. Jump to the runtime Virtual Address. */
> -        mov_w r0, primary_switched
> -        mov   pc, r0
> +        /* Address in the runtime mapping to jump to after the MMU is enabled */
> +        mov_w lr, primary_switched
> +        b     enable_mmu
>  primary_switched:
> -        /*
> -         * The 1:1 map may clash with other parts of the Xen virtual memory
> -         * layout. As it is not used anymore, remove it completely to
> -         * avoid having to worry about replacing existing mapping
> -         * afterwards.
> -         */
> -        bl    remove_identity_mapping
>          bl    setup_fixmap
>  #ifdef CONFIG_EARLY_PRINTK
>          /* Use a virtual address to access the UART. */
> @@ -223,12 +215,10 @@ GLOBAL(init_secondary)
>          bl    check_cpu_mode
>          bl    cpu_init
>          bl    create_page_tables
> -        bl    enable_mmu
>  
> -
> -        /* We are still in the 1:1 mapping. Jump to the runtime Virtual Address. */
> -        mov_w r0, secondary_switched
> -        mov   pc, r0
> +        /* Address in the runtime mapping to jump to after the MMU is enabled */
> +        mov_w lr, secondary_switched
> +        b     enable_mmu
>  secondary_switched:
>          /*
>           * Non-boot CPUs need to move on to the proper pagetables, which were
> @@ -523,9 +513,12 @@ virtphys_clash:
>  ENDPROC(create_page_tables)
>  
>  /*
> - * Turn on the Data Cache and the MMU. The function will return on the 1:1
> - * mapping. In other word, the caller is responsible to switch to the runtime
> - * mapping.
> + * Turn on the Data Cache and the MMU. The function will return
> + * to the virtual address provided in LR (e.g. the runtime mapping).
> + *
> + * Inputs:
> + *   r9 : paddr(start)
> + *   lr : Virtual address to return to
>   *
>   * Clobbers r0 - r3
>   */
> @@ -551,7 +544,24 @@ enable_mmu:
>          dsb                          /* Flush PTE writes and finish reads */
>          mcr   CP32(r0, HSCTLR)       /* now paging is enabled */
>          isb                          /* Now, flush the icache */
> -        mov   pc, lr
> +
> +        /*
> +         * The MMU is turned on and we are in the 1:1 mapping. Switch
> +         * to the runtime mapping.
> +         */
> +        mov_w r0, 1f
> +        mov   pc, r0
> +1:
> +        /*
> +         * The 1:1 map may clash with other parts of the Xen virtual memory
> +         * layout. As it is not used anymore, remove it completely to
> +         * avoid having to worry about replacing existing mapping
> +         * afterwards.
> +         *
> +         * On return this will jump to the virtual address requested by
> +         * the caller.
> +         */
> +        b     remove_identity_mapping
>  ENDPROC(enable_mmu)
>  
>  /*
> -- 
> 2.38.1
> 

