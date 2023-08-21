Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C2B7834C3
	for <lists+xen-devel@lfdr.de>; Mon, 21 Aug 2023 23:20:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.587889.919291 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYCJB-0007xA-9T; Mon, 21 Aug 2023 21:19:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 587889.919291; Mon, 21 Aug 2023 21:19:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYCJB-0007uU-5y; Mon, 21 Aug 2023 21:19:33 +0000
Received: by outflank-mailman (input) for mailman id 587889;
 Mon, 21 Aug 2023 21:19:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qYCJ9-0007uO-Gc
 for xen-devel@lists.xenproject.org; Mon, 21 Aug 2023 21:19:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qYCJ8-0002My-Sq; Mon, 21 Aug 2023 21:19:30 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qYCJ8-000749-HX; Mon, 21 Aug 2023 21:19:30 +0000
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
	bh=HEdre+l/Qu9vvgeRBiRh6CtkhDdhZuy9tB8MbMhRsOQ=; b=RCXZxMQf0/WHxmW8QWOwLLICU/
	bnXztQOOWqEHSRNyi4hliaZ6jCOdU1HWRN0T0UDPutG0PCdAJhAYKmdZyPIwa+GHJ8fzWp5v+C/MN
	5DmMlDS9mTnA+a/OuVEnqf0jwX7eZWUKL9zfQSDfH4eqtgIX/KokI0rkLYS0HUCpBx2M=;
Message-ID: <a665733f-5b57-436f-df02-81ed1c9ecd28@xen.org>
Date: Mon, 21 Aug 2023 22:19:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
To: Henry Wang <Henry.Wang@arm.com>, xen-devel@lists.xenproject.org
Cc: Penny Zheng <penny.zheng@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Wei Chen <wei.chen@arm.com>
References: <20230814042536.878720-1-Henry.Wang@arm.com>
 <20230814042536.878720-11-Henry.Wang@arm.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v5 10/13] xen/arm: mmu: move MMU-specific setup_mm to
 mmu/setup.c
In-Reply-To: <20230814042536.878720-11-Henry.Wang@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 14/08/2023 05:25, Henry Wang wrote:
> From: Penny Zheng <penny.zheng@arm.com>
> 
> setup_mm is used for Xen to setup memory management subsystem at boot
> time, like boot allocator, direct-mapping, xenheap initialization,
> frametable and static memory pages.
> 
> We could inherit some components seamlessly in later MPU system like
> boot allocator, whilst we need to implement some components differently
> in MPU, like xenheap, etc. There are some components that is specific
> to MMU only, like direct-mapping.
> 
> In the commit, we move MMU-specific components into mmu/setup.c, in
> preparation of implementing MPU version of setup_mm later in future
> commit. Also, make init_pdx(), init_staticmem_pages(), setup_mm(), and
> populate_boot_allocator() public for future MPU inplementation.

Typo: s/inplementation/implementation/

> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
> ---
> v5:
> - No change
> v4:
> - No change
> ---
>   xen/arch/arm/include/asm/setup.h |   5 +
>   xen/arch/arm/mmu/Makefile        |   1 +
>   xen/arch/arm/mmu/setup.c         | 339 +++++++++++++++++++++++++++++++
>   xen/arch/arm/setup.c             | 326 +----------------------------
>   4 files changed, 349 insertions(+), 322 deletions(-)
>   create mode 100644 xen/arch/arm/mmu/setup.c
> 
> diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
> index f0f64d228c..0922549631 100644
> --- a/xen/arch/arm/include/asm/setup.h
> +++ b/xen/arch/arm/include/asm/setup.h
> @@ -156,6 +156,11 @@ struct bootcmdline *boot_cmdline_find_by_kind(bootmodule_kind kind);
>   struct bootcmdline * boot_cmdline_find_by_name(const char *name);
>   const char *boot_module_kind_as_string(bootmodule_kind kind);
>   
> +extern void init_pdx(void);
> +extern void init_staticmem_pages(void);
> +extern void populate_boot_allocator(void);
> +extern void setup_mm(void);

Please avoid the 'extern' for new function declaration.

> +
>   extern uint32_t hyp_traps_vector[];
>   void init_traps(void);
>   
> diff --git a/xen/arch/arm/mmu/Makefile b/xen/arch/arm/mmu/Makefile
> index b18cec4836..4aa1fb466d 100644
> --- a/xen/arch/arm/mmu/Makefile
> +++ b/xen/arch/arm/mmu/Makefile
> @@ -1 +1,2 @@
>   obj-y += mm.o
> +obj-y += setup.o
> diff --git a/xen/arch/arm/mmu/setup.c b/xen/arch/arm/mmu/setup.c
> new file mode 100644
> index 0000000000..e05cca3f86
> --- /dev/null
> +++ b/xen/arch/arm/mmu/setup.c
> @@ -0,0 +1,339 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * xen/arch/arm/mmu/setup.c
> + *
> + * MMU-specific early bringup code for an ARMv7-A with virt extensions.

You modify the comment in arm/setup.c to mention ARMv8 but not here. The 
former feels somewhat unrelated.

> + */
> +
> +#include <xen/init.h>
> +#include <xen/serial.h>
> +#include <xen/libfdt/libfdt-xen.h>
> +#include <xen/mm.h>
> +#include <xen/param.h>
> +#include <xen/pfn.h>
> +#include <asm/fixmap.h>
> +#include <asm/page.h>
> +#include <asm/setup.h>
> +
> +#ifdef CONFIG_ARM_32

AFAICT, mmu/mm.c has nothing common between arm32 and arm64. So can we 
introduce arm{32, 64}/mmu/setup.c and move the respective code there?

[...]

> +void __init setup_mm(void)
> +{
> +    paddr_t ram_start, ram_end, ram_size, e, bank_start, bank_end, bank_size;
> +    paddr_t static_heap_end = 0, static_heap_size = 0;
> +    unsigned long heap_pages, xenheap_pages, domheap_pages;
> +    unsigned int i;
> +    const uint32_t ctr = READ_CP32(CTR);
> +
> +    if ( !bootinfo.mem.nr_banks )
> +        panic("No memory bank\n");
> +
> +    /* We only supports instruction caches implementing the IVIPT extension. */
> +    if ( ((ctr >> CTR_L1IP_SHIFT) & CTR_L1IP_MASK) == ICACHE_POLICY_AIVIVT )
> +        panic("AIVIVT instruction cache not supported\n");

Thi check is unlikely going to be MMU setup.c.

> +
> +    init_pdx();
> +
> +    ram_start = bootinfo.mem.bank[0].start;
> +    ram_size  = bootinfo.mem.bank[0].size;
> +    ram_end   = ram_start + ram_size;
> +
> +    for ( i = 1; i < bootinfo.mem.nr_banks; i++ )
> +    {
> +        bank_start = bootinfo.mem.bank[i].start;
> +        bank_size = bootinfo.mem.bank[i].size;
> +        bank_end = bank_start + bank_size;
> +
> +        ram_size  = ram_size + bank_size;
> +        ram_start = min(ram_start,bank_start);
> +        ram_end   = max(ram_end,bank_end);
> +    }
> +
> +    total_pages = ram_size >> PAGE_SHIFT;
> +
> +    if ( bootinfo.static_heap )
> +    {
> +        for ( i = 0 ; i < bootinfo.reserved_mem.nr_banks; i++ )
> +        {
> +            if ( bootinfo.reserved_mem.bank[i].type != MEMBANK_STATIC_HEAP )
> +                continue;
> +
> +            bank_start = bootinfo.reserved_mem.bank[i].start;
> +            bank_size = bootinfo.reserved_mem.bank[i].size;
> +            bank_end = bank_start + bank_size;
> +
> +            static_heap_size += bank_size;
> +            static_heap_end = max(static_heap_end, bank_end);
> +        }
> +
> +        heap_pages = static_heap_size >> PAGE_SHIFT;
> +    }
> +    else
> +        heap_pages = total_pages;
> +
> +    /*
> +     * If the user has not requested otherwise via the command line
> +     * then locate the xenheap using these constraints:
> +     *
> +     *  - must be contiguous
> +     *  - must be 32 MiB aligned
> +     *  - must not include Xen itself or the boot modules
> +     *  - must be at most 1GB or 1/32 the total RAM in the system (or static
> +          heap if enabled) if less

While you are moving the code can you add '*'? Could be done as a 
follow-up patch as well.

[...[

> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index 44ccea03ca..b3dea41099 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -2,7 +2,7 @@
>   /*
>    * xen/arch/arm/setup.c
>    *
> - * Early bringup code for an ARMv7-A with virt extensions.
> + * Early bringup code for an ARMv7-A/ARM64v8R with virt extensions.

You are not yet supporting ARMv8-R. But we are supporting ARMv8-A which 
is not mentioned here. That said, I don't really the benefits of 
mentioning the major revision of the Arm Arm we support. For instance, 
we are likely going to be able to boot on Armv9.

So I would just remove anything from 'for'.

Cheers,

-- 
Julien Grall

