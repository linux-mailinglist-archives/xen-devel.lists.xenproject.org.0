Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C9974798A
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jul 2023 23:24:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.558712.873044 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGnVa-0000Dg-1p; Tue, 04 Jul 2023 21:24:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 558712.873044; Tue, 04 Jul 2023 21:24:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qGnVZ-0000A3-Uk; Tue, 04 Jul 2023 21:24:25 +0000
Received: by outflank-mailman (input) for mailman id 558712;
 Tue, 04 Jul 2023 21:24:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qGnVY-00009v-R8
 for xen-devel@lists.xenproject.org; Tue, 04 Jul 2023 21:24:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qGnVY-0003Mi-Ey; Tue, 04 Jul 2023 21:24:24 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234] helo=[192.168.9.70])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qGnVY-0006tR-7Q; Tue, 04 Jul 2023 21:24:24 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=e5ubz8UrYX6OL0apaBXuBGIrfFL4OwQgQZ/vdsrV/wQ=; b=dNlWZdb3DrLFSQuMec22f4gzh4
	A0vFVUOPdF/VB706ZodBDnbSxsYb6HA4kLUxyNFP7yEu7Ymy4VLzGJJhv8CPynaMNJZBIjPFa+YG7
	0kED9p/WVXNHjTeCV8OTBKqFA98GFYuk3btVJR6eOxa+u9R0nhRcQmcjv+kDOVnd7cSY=;
Message-ID: <c10bc254-ad79-dada-d5fb-9ee619934ffb@xen.org>
Date: Tue, 4 Jul 2023 22:24:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 05/52] xen/arm64: head: Introduce enable_boot_mmu and
 enable_runtime_mmu
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: Wei Chen <wei.chen@arm.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230626033443.2943270-1-Penny.Zheng@arm.com>
 <20230626033443.2943270-6-Penny.Zheng@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230626033443.2943270-6-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Penny,

On 26/06/2023 04:33, Penny Zheng wrote:
> From: Wei Chen <wei.chen@arm.com>
> 
> At the moment, on MMU system, enable_mmu() will return to an
> address in the 1:1 mapping, then each path is responsible to
> switch to virtual runtime mapping. Then remove_identity_mapping()
> is called to remove all 1:1 mapping.

The identity mapping is only removed for the boot CPU. You mention it 
correctly below but here it lead to think it may be called on the 
secondary CPU. So I would add 'on the boot CPU'.

> 
> Since remove_identity_mapping() is not necessary on Non-MMU system,
> and we also avoid creating empty function for Non-MMU system, trying
> to keep only one codeflow in arm64/head.S, we move path switch and
> remove_identity_mapping() in enable_mmu() on MMU system.
> 
> As the remove_identity_mapping should only be called for the boot
> CPU only, so we introduce enable_boot_mmu for boot CPU and
> enable_runtime_mmu for secondary CPUs in this patch.

NIT: Add () after enable_runtime_mmu to be consistent with the rest of 
commit message. Same for the title.

Also, I would prefer if we name the functions properly from the start. 
So we don't have to rename them when they are moved in patch 7.

> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
> v3:
> - new patch
> ---
>   xen/arch/arm/arm64/head.S | 87 +++++++++++++++++++++++++++++++--------
>   1 file changed, 70 insertions(+), 17 deletions(-)
> 
> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
> index 10a07db428..4dfbe0bc6f 100644
> --- a/xen/arch/arm/arm64/head.S
> +++ b/xen/arch/arm/arm64/head.S
> @@ -314,21 +314,12 @@ real_start_efi:
>   
>           bl    check_cpu_mode
>           bl    cpu_init
> -        bl    create_page_tables
> -        load_paddr x0, boot_pgtable
> -        bl    enable_mmu
>   
>           /* We are still in the 1:1 mapping. Jump to the runtime Virtual Address. */

This comment is not accurate anymore given that the MMU is off.

> -        ldr   x0, =primary_switched
> -        br    x0
> +        ldr   lr, =primary_switched
> +        b     enable_boot_mmu
> +
>   primary_switched:
> -        /*
> -         * The 1:1 map may clash with other parts of the Xen virtual memory
> -         * layout. As it is not used anymore, remove it completely to
> -         * avoid having to worry about replacing existing mapping
> -         * afterwards.
> -         */
> -        bl    remove_identity_mapping
>           bl    setup_fixmap
>   #ifdef CONFIG_EARLY_PRINTK
>           /* Use a virtual address to access the UART. */
> @@ -373,13 +364,11 @@ GLOBAL(init_secondary)
>   #endif
>           bl    check_cpu_mode
>           bl    cpu_init
> -        load_paddr x0, init_ttbr
> -        ldr   x0, [x0]
> -        bl    enable_mmu
>   
>           /* We are still in the 1:1 mapping. Jump to the runtime Virtual Address. */
> -        ldr   x0, =secondary_switched
> -        br    x0
> +        ldr   lr, =secondary_switched
> +        b     enable_runtime_mmu
> +
>   secondary_switched:
>   #ifdef CONFIG_EARLY_PRINTK
>           /* Use a virtual address to access the UART. */
> @@ -694,6 +683,70 @@ enable_mmu:
>           ret
>   ENDPROC(enable_mmu)
>   
> +/*
> + * Turn on the Data Cache and the MMU. The function will return
> + * to the virtual address provided in LR (e.g. the runtime mapping).

The description here is exactly the same as below. However, there is a 
different between the two functions. One is to deal with the secondary 
CPUs whilst the second is for the boot CPUs.

> + *
> + * Inputs:
> + *   lr : Virtual address to return to.
> + *
> + * Clobbers x0 - x5
> + */
> +enable_runtime_mmu:

I find "runtime" confusing in this case. How about 
"enable_secondary_cpu_mm"?

> +        mov   x5, lr
> +
> +        load_paddr x0, init_ttbr
> +        ldr   x0, [x0]
> +
> +        bl    enable_mmu
> +        mov   lr, x5
> +
> +        /* return to secondary_switched */
> +        ret
> +ENDPROC(enable_runtime_mmu)
> +
> +/*
> + * Turn on the Data Cache and the MMU. The function will return
> + * to the virtual address provided in LR (e.g. the runtime mapping).

Similar remark as for the comment above.

> + *
> + * Inputs:
> + *   lr : Virtual address to return to.
> + *
> + * Clobbers x0 - x5
> + */
> +enable_boot_mmu:

Based on my comment above, I would sugesst to call it "enable_boot_cpu_mm"

> +        mov   x5, lr
> +
> +        bl    create_page_tables
> +        load_paddr x0, boot_pgtable
> +
> +        bl    enable_mmu
> +        mov   lr, x5
> +
> +        /*
> +         * The MMU is turned on and we are in the 1:1 mapping. Switch
> +         * to the runtime mapping.
> +         */
> +        ldr   x0, =1f
> +        br    x0
> +1:
> +        /*
> +         * The 1:1 map may clash with other parts of the Xen virtual memory
> +         * layout. As it is not used anymore, remove it completely to
> +         * avoid having to worry about replacing existing mapping
> +         * afterwards. Function will return to primary_switched.
> +         */
> +        b     remove_identity_mapping
> +
> +        /*
> +         * Here might not be reached, as "ret" in remove_identity_mapping
> +         * will use the return address in LR in advance. But keep ret here
> +         * might be more safe if "ret" in remove_identity_mapping is removed
> +         * in future.
> +         */
> +        ret

Given this path is meant to be unreachable, I would prefer if we call 
"fail".

> +ENDPROC(enable_boot_mmu)
> +
>   /*
>    * Remove the 1:1 map from the page-tables. It is not easy to keep track
>    * where the 1:1 map was mapped, so we will look for the top-level entry

Cheers,

-- 
Julien Grall

