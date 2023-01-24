Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 427DD67A266
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jan 2023 20:09:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.483696.750018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKOfK-0001v3-QN; Tue, 24 Jan 2023 19:09:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 483696.750018; Tue, 24 Jan 2023 19:09:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKOfK-0001t9-Mz; Tue, 24 Jan 2023 19:09:06 +0000
Received: by outflank-mailman (input) for mailman id 483696;
 Tue, 24 Jan 2023 19:09:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pKOfJ-0001t3-0U
 for xen-devel@lists.xenproject.org; Tue, 24 Jan 2023 19:09:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pKOfI-0002M9-LZ; Tue, 24 Jan 2023 19:09:04 +0000
Received: from [54.239.6.189] (helo=[192.168.20.46])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pKOfI-0002Ff-CE; Tue, 24 Jan 2023 19:09:04 +0000
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
	bh=TJNXNMFwokljr+TcruYlTqOvD9ILefY2hlX2fJ0KNhY=; b=Ulk0gUs/7OfUTw/8SeNfi//KSq
	HBoBgalLzaIJqiOlpNIm7W5asXT7jLKuEXccKjia37A0tRgQlobABKPnmsoSAMepYel5zOK91zhiG
	6p6rrTEMC9Hyvo0mxVdcAzV5F32aGQRO9UOEQkOOYETy+f0ugKtE9jYK+RHrdn9/viVw=;
Message-ID: <23f49916-dd2a-a956-1e6b-6dbb41a8817b@xen.org>
Date: Tue, 24 Jan 2023 19:09:02 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v2 13/40] xen/mpu: introduce unified function
 setup_early_uart to map early UART
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20230113052914.3845596-1-Penny.Zheng@arm.com>
 <20230113052914.3845596-14-Penny.Zheng@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230113052914.3845596-14-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Peny,

On 13/01/2023 05:28, Penny Zheng wrote:
> In MMU system, we map the UART in the fixmap (when earlyprintk is used).
> However in MPU system, we map the UART with a transient MPU memory
> region.
> 
> So we introduce a new unified function setup_early_uart to replace
> the previous setup_fixmap.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
>   xen/arch/arm/arm64/head.S               |  2 +-
>   xen/arch/arm/arm64/head_mmu.S           |  4 +-
>   xen/arch/arm/arm64/head_mpu.S           | 52 +++++++++++++++++++++++++
>   xen/arch/arm/include/asm/early_printk.h |  1 +
>   4 files changed, 56 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
> index 7f3f973468..a92883319d 100644
> --- a/xen/arch/arm/arm64/head.S
> +++ b/xen/arch/arm/arm64/head.S
> @@ -272,7 +272,7 @@ primary_switched:
>            * afterwards.
>            */
>           bl    remove_identity_mapping
> -        bl    setup_fixmap
> +        bl    setup_early_uart
>   #ifdef CONFIG_EARLY_PRINTK
>           /* Use a virtual address to access the UART. */
>           ldr   x23, =EARLY_UART_VIRTUAL_ADDRESS
> diff --git a/xen/arch/arm/arm64/head_mmu.S b/xen/arch/arm/arm64/head_mmu.S
> index b59c40495f..a19b7c873d 100644
> --- a/xen/arch/arm/arm64/head_mmu.S
> +++ b/xen/arch/arm/arm64/head_mmu.S
> @@ -312,7 +312,7 @@ ENDPROC(remove_identity_mapping)
>    *
>    * Clobbers x0 - x3
>    */
> -ENTRY(setup_fixmap)
> +ENTRY(setup_early_uart)

This function is doing more than enable the early UART. It also setups 
the fixmap even earlyprintk is not configured.

I am not entirely sure what could be the name. Maybe this needs to be 
split further.

>   #ifdef CONFIG_EARLY_PRINTK
>           /* Add UART to the fixmap table */
>           ldr   x0, =EARLY_UART_VIRTUAL_ADDRESS
> @@ -325,7 +325,7 @@ ENTRY(setup_fixmap)
>           dsb   nshst
>   
>           ret
> -ENDPROC(setup_fixmap)
> +ENDPROC(setup_early_uart)
>   
>   /* Fail-stop */
>   fail:   PRINT("- Boot failed -\r\n")
> diff --git a/xen/arch/arm/arm64/head_mpu.S b/xen/arch/arm/arm64/head_mpu.S
> index e2ac69b0cc..72d1e0863d 100644
> --- a/xen/arch/arm/arm64/head_mpu.S
> +++ b/xen/arch/arm/arm64/head_mpu.S
> @@ -18,8 +18,10 @@
>   #define REGION_TEXT_PRBAR       0x38    /* SH=11 AP=10 XN=00 */
>   #define REGION_RO_PRBAR         0x3A    /* SH=11 AP=10 XN=10 */
>   #define REGION_DATA_PRBAR       0x32    /* SH=11 AP=00 XN=10 */
> +#define REGION_DEVICE_PRBAR     0x22    /* SH=10 AP=00 XN=10 */
>   
>   #define REGION_NORMAL_PRLAR     0x0f    /* NS=0 ATTR=111 EN=1 */
> +#define REGION_DEVICE_PRLAR     0x09    /* NS=0 ATTR=100 EN=1 */
>   
>   /*
>    * Macro to round up the section address to be PAGE_SIZE aligned
> @@ -334,6 +336,56 @@ ENTRY(enable_mm)
>       ret
>   ENDPROC(enable_mm)
>   
> +/*
> + * Map the early UART with a new transient MPU memory region.
> + *

Missing "Inputs: "

> + * x27: region selector
> + * x28: prbar
> + * x29: prlar
> + *
> + * Clobbers x0 - x4
> + *
> + */
> +ENTRY(setup_early_uart)
> +#ifdef CONFIG_EARLY_PRINTK
> +    /* stack LR as write_pr will be called later like nested function */
> +    mov   x3, lr
> +
> +    /*
> +     * MPU region for early UART is a transient region, since it will be
> +     * replaced by specific device memory layout when FDT gets parsed.

I would rather not mention "FDT" here because this code is independent 
to the firmware table used.

However, any reason to use a transient region rather than the one that 
will be used for the UART driver?

> +     */
> +    load_paddr x0, next_transient_region_idx
> +    ldr   x4, [x0]
> +
> +    ldr   x28, =CONFIG_EARLY_UART_BASE_ADDRESS
> +    and   x28, x28, #MPU_REGION_MASK
> +    mov   x1, #REGION_DEVICE_PRBAR
> +    orr   x28, x28, x1

This needs some documentation to explain the logic. Maybe even a macro.

> +
> +    ldr x29, =(CONFIG_EARLY_UART_BASE_ADDRESS + EARLY_UART_SIZE)
> +    roundup_section x29

Does this mean we could give access to more than necessary? Shouldn't 
instead prevent compilation if the size doesn't align with the section size?

> +    /* Limit address is inclusive */
> +    sub   x29, x29, #1
> +    and   x29, x29, #MPU_REGION_MASK
> +    mov   x2, #REGION_DEVICE_PRLAR
> +    orr   x29, x29, x2
> +
> +    mov   x27, x4

This needs some documentation like:

x27: region selector

See how we documented the existing helpers.

> +    bl    write_pr
> +
> +    /* Create a new entry in xen_mpumap for early UART */
> +    create_mpu_entry xen_mpumap, x4, x28, x29, x1, x2
> +
> +    /* Update next_transient_region_idx */
> +    sub   x4, x4, #1
> +    str   x4, [x0]
> +
> +    mov   lr, x3
> +    ret
> +#endif
> +ENDPROC(setup_early_uart)
> +
>   /*
>    * Local variables:
>    * mode: ASM
> diff --git a/xen/arch/arm/include/asm/early_printk.h b/xen/arch/arm/include/asm/early_printk.h
> index 44a230853f..d87623e6d5 100644
> --- a/xen/arch/arm/include/asm/early_printk.h
> +++ b/xen/arch/arm/include/asm/early_printk.h
> @@ -22,6 +22,7 @@
>    * for EARLY_UART_VIRTUAL_ADDRESS.
>    */
>   #define EARLY_UART_VIRTUAL_ADDRESS CONFIG_EARLY_UART_BASE_ADDRESS
> +#define EARLY_UART_SIZE            0x1000

Shouldn't this be PAGE_SIZE? If not, how did you come up with the number?

Cheers,

-- 
Julien Grall

