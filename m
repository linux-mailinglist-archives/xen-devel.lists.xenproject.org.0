Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D07AB434A37
	for <lists+xen-devel@lfdr.de>; Wed, 20 Oct 2021 13:38:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.213859.372210 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1md9v5-0005SE-Ex; Wed, 20 Oct 2021 11:38:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 213859.372210; Wed, 20 Oct 2021 11:38:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1md9v5-0005QL-Bd; Wed, 20 Oct 2021 11:38:07 +0000
Received: by outflank-mailman (input) for mailman id 213859;
 Wed, 20 Oct 2021 11:38:06 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1md9v4-0005QF-1W
 for xen-devel@lists.xenproject.org; Wed, 20 Oct 2021 11:38:06 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1md9v3-0003vc-R4; Wed, 20 Oct 2021 11:38:05 +0000
Received: from [54.239.6.185] (helo=[192.168.28.129])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1md9v3-0007os-Kx; Wed, 20 Oct 2021 11:38:05 +0000
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
	bh=kQjCWWtOI7g0EdEvV5l4EedgBWlhHpwyi9Wu79MEUMY=; b=22MfwAZ5nZXkwz+e5o9UKwlC/h
	d3DBFSivJoeS+prY7FWMFv7s262vdRlVMzIU0G8odIGhfo92DaB92adg7vW5iJHLbXyLDk6XWcV4y
	OhgVELmRY61mE451p7WJ/Lu/yiP1eOpVuyvR7HcHJ/ErnY91asBd4UEdb6sj8XKR9VEk=;
Message-ID: <034a0836-7bf6-8f86-0d93-38ebd8817ed2@xen.org>
Date: Wed, 20 Oct 2021 12:38:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: [PATCH v2 5/6] xen/arm: if direct-map domain use native UART
 address and IRQ number for vPL011
To: Penny Zheng <penny.zheng@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org
Cc: Wei.Chen@arm.com, Bertrand.Marquis@arm.com
References: <20211015030945.2082898-1-penny.zheng@arm.com>
 <20211015030945.2082898-6-penny.zheng@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20211015030945.2082898-6-penny.zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Penny,

On 15/10/2021 04:09, Penny Zheng wrote:
> From: Stefano Stabellini <stefano.stabellini@xilinx.com>
> 
> We always use a fix address to map the vPL011 to domains. The address
> could be a problem for direct-map domains.
> 
> So, for domains that are directly mapped, reuse the address of the
> physical UART on the platform to avoid potential clashes.
> 
> Do the same for the virtual IRQ number: instead of always using
> GUEST_VPL011_SPI, try to reuse the physical SPI number if possible.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
>   xen/arch/arm/domain_build.c  | 41 ++++++++++++++++++++++-----
>   xen/arch/arm/vpl011.c        | 54 +++++++++++++++++++++++++++++++-----
>   xen/include/asm-arm/vpl011.h |  2 ++
>   3 files changed, 83 insertions(+), 14 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 7e0ee07e06..f3e87709f6 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -30,6 +30,7 @@
>   
>   #include <xen/irq.h>
>   #include <xen/grant_table.h>
> +#include <xen/serial.h>
>   
>   static unsigned int __initdata opt_dom0_max_vcpus;
>   integer_param("dom0_max_vcpus", opt_dom0_max_vcpus);
> @@ -2350,8 +2351,11 @@ static int __init make_vpl011_uart_node(struct kernel_info *kinfo)
>       gic_interrupt_t intr;
>       __be32 reg[GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS];
>       __be32 *cells;
> +    struct domain *d = kinfo->d;
> +    char buf[27];

Please explain how the '27' was found.

>   
> -    res = fdt_begin_node(fdt, "sbsa-uart@"__stringify(GUEST_PL011_BASE));
> +    snprintf(buf, sizeof(buf), "sbsa-uart@%"PRIx64, d->arch.vpl011.base_addr);
> +    res = fdt_begin_node(fdt, buf);
>       if ( res )
>           return res;
>   
> @@ -2361,14 +2365,14 @@ static int __init make_vpl011_uart_node(struct kernel_info *kinfo)
>   
>       cells = &reg[0];
>       dt_child_set_range(&cells, GUEST_ROOT_ADDRESS_CELLS,
> -                       GUEST_ROOT_SIZE_CELLS, GUEST_PL011_BASE,
> +                       GUEST_ROOT_SIZE_CELLS, d->arch.vpl011.base_addr,
>                          GUEST_PL011_SIZE);
>   
>       res = fdt_property(fdt, "reg", reg, sizeof(reg));
>       if ( res )
>           return res;
>   
> -    set_interrupt(intr, GUEST_VPL011_SPI, 0xf, DT_IRQ_TYPE_LEVEL_HIGH);
> +    set_interrupt(intr, d->arch.vpl011.virq, 0xf, DT_IRQ_TYPE_LEVEL_HIGH);
>   
>       res = fdt_property(fdt, "interrupts", intr, sizeof (intr));
>       if ( res )
> @@ -3083,6 +3087,14 @@ static int __init construct_domU(struct domain *d,
>               allocate_static_memory(d, &kinfo, node);
>       }
>   
> +    /*
> +     * Base address and irq number are needed when creating vpl011 device
> +     * tree node in prepare_dtb_domU, so initialization on related variables
> +     * shall be dealt firstly.
> +     */
> +    if ( kinfo.vpl011 )
> +        rc = domain_vpl011_init(d, NULL);
> +
>       rc = prepare_dtb_domU(d, &kinfo);
>       if ( rc < 0 )
>           return rc;
> @@ -3091,9 +3103,6 @@ static int __init construct_domU(struct domain *d,
>       if ( rc < 0 )
>           return rc;
>   
> -    if ( kinfo.vpl011 )
> -        rc = domain_vpl011_init(d, NULL);
> -
>       return rc;
>   }
>   
> @@ -3132,15 +3141,33 @@ void __init create_domUs(void)
>   
>           if ( !dt_property_read_u32(node, "nr_spis", &d_cfg.arch.nr_spis) )
>           {
> +            unsigned int vpl011_virq = GUEST_VPL011_SPI;
> +
>               d_cfg.arch.nr_spis = gic_number_lines() - 32;
>   
> +            /*
> +             * The VPL011 virq is GUEST_VPL011_SPI, unless direct-map in
> +             * set, in which case we'll try to match the hardware.

I think you want to drop "try" to avoid implying there is a fallback if 
we can't match it.

> +             *
> +             * Typically, d->arch.vpl011.virq has the vpl011 irq number
> +             * but at this point of the boot sequence it is not
> +             * initialized yet.
The last paragraph is difficult to read. We are building the domain (not 
booting!) and at this point we are still trying to figure out its 
initial configuration. IOW, the domain is not even created.

I think it would be better to say the domain is not built. So we need to 
open-code the logic to find the vIRQ. We should also probably mention 
that the logic should match the one in domain_vpl011_init().

> +             */
> +            if ( d_cfg.flags & XEN_DOMCTL_CDF_directmap )
> +            {
> +                vpl011_virq = serial_irq(SERHND_DTUART);
> +                if ( vpl011_virq < 0 )
> +                    panic("Error getting IRQ number for this serial port %d\n",
> +                          SERHND_DTUART);
> +            }
> +
>               /*
>                * vpl011 uses one emulated SPI. If vpl011 is requested, make
>                * sure that we allocate enough SPIs for it.
>                */
>               if ( dt_property_read_bool(node, "vpl011") )
>                   d_cfg.arch.nr_spis = MAX(d_cfg.arch.nr_spis,
> -                                         GUEST_VPL011_SPI - 32 + 1);
> +                                         vpl011_virq - 32 + 1);
>           }
>   
>           /*
> diff --git a/xen/arch/arm/vpl011.c b/xen/arch/arm/vpl011.c
> index 895f436cc4..2de59e584d 100644
> --- a/xen/arch/arm/vpl011.c
> +++ b/xen/arch/arm/vpl011.c
> @@ -29,6 +29,7 @@
>   #include <xen/mm.h>
>   #include <xen/sched.h>
>   #include <xen/console.h>
> +#include <xen/serial.h>
>   #include <public/domctl.h>
>   #include <public/io/console.h>
>   #include <asm/pl011-uart.h>
> @@ -71,11 +72,11 @@ static void vpl011_update_interrupt_status(struct domain *d)
>        * status bit has been set since the last time.
>        */
>       if ( uartmis & ~vpl011->shadow_uartmis )
> -        vgic_inject_irq(d, NULL, GUEST_VPL011_SPI, true);
> +        vgic_inject_irq(d, NULL, vpl011->virq, true);
>   
>       vpl011->shadow_uartmis = uartmis;
>   #else
> -    vgic_inject_irq(d, NULL, GUEST_VPL011_SPI, uartmis);
> +    vgic_inject_irq(d, NULL, vpl011->virq, uartmis);
>   #endif
>   }
>   
> @@ -347,7 +348,8 @@ static int vpl011_mmio_read(struct vcpu *v,
>                               void *priv)
>   {
>       struct hsr_dabt dabt = info->dabt;
> -    uint32_t vpl011_reg = (uint32_t)(info->gpa - GUEST_PL011_BASE);
> +    uint32_t vpl011_reg = (uint32_t)(info->gpa -
> +                                     v->domain->arch.vpl011.base_addr);
>       struct vpl011 *vpl011 = &v->domain->arch.vpl011;
>       struct domain *d = v->domain;
>       unsigned long flags;
> @@ -430,7 +432,8 @@ static int vpl011_mmio_write(struct vcpu *v,
>                                void *priv)
>   {
>       struct hsr_dabt dabt = info->dabt;
> -    uint32_t vpl011_reg = (uint32_t)(info->gpa - GUEST_PL011_BASE);
> +    uint32_t vpl011_reg = (uint32_t)(info->gpa -
> +                                     v->domain->arch.vpl011.base_addr);
>       struct vpl011 *vpl011 = &v->domain->arch.vpl011;
>       struct domain *d = v->domain;
>       unsigned long flags;
> @@ -626,6 +629,43 @@ int domain_vpl011_init(struct domain *d, struct vpl011_init_info *info)
>       if ( vpl011->backend.dom.ring_buf )
>           return -EINVAL;
>   

I would suggest to add a comment similar to the first paragraph you 
added in create_domUs(). In addition to that, it would be good to 
mention the code should stay in sync with the one in create_domUs().

> +    if ( is_domain_direct_mapped(d) )
> +    {
> +        const struct vuart_info *uart = serial_vuart_info(SERHND_DTUART);
> +        int vpl011_irq = serial_irq(SERHND_DTUART);
> +
> +        /*
> +         * Since the PL011 we emulate for the guest requires a 4KB region,
> +         * and on some Hardware (IIRC pine64), the UART MMIO region is
In fact, this is an issue that seems to be common on (old?) sunxi SoC. I 
would suggest to replace the (...) with (e.g. on some sunxi SoC).

> +         * less than 4KB, in which case, there may exist multiple devices
> +         * within the same 4KB region, here adds the following check to
> +         * prevent potential known pitfalls
> +         */
> +        if ( uart->size < GUEST_PL011_SIZE )
> +        {
> +            printk(XENLOG_ERR
> +                   "The hardware UART region is smaller than GUEST_PL011_SIZE, impossible to emulate on direct-map guests.\n");

s/on/it for/ I believe.

But i am not sure it is worth mentionning that we can't emulate it. This 
is sort of implied by the fact this returns an error. So how about:

vpl011: Can't re-use the Xen UART MMIO region as it is too small.

Note that I mention "Xen" rather than "HW" because there might be 
multiple uart on platforms. So I feel "Xen" might make it clearer which 
one we are referring to.

> +            return -EINVAL;
> +        }
> +
> +        if ( uart != NULL && vpl011_irq > 0 )

You are checking uart is not-NULL here but just before you dereference 
it. So shouldn't you move the check earlier?

> +        {
> +            vpl011->base_addr = uart->base_addr;
> +            vpl011->virq = vpl011_irq;
> +        }
> +        else
> +        {
> +            printk(XENLOG_ERR
> +                   "Unable to reuse physical UART address and irq for vPL011 on direct-mapped domain.\n");

In this case how about:

vpl011: Unable to re-use the Xen UART information

> +            return -EINVAL;
> +        }
> +    }
> +    else
> +    {
> +        vpl011->base_addr = GUEST_PL011_BASE;
> +        vpl011->virq = GUEST_VPL011_SPI;
> +    }
> +
>       /*
>        * info is NULL when the backend is in Xen.
>        * info is != NULL when the backend is in a domain.
> @@ -661,7 +701,7 @@ int domain_vpl011_init(struct domain *d, struct vpl011_init_info *info)
>           }
>       }
>   
> -    rc = vgic_reserve_virq(d, GUEST_VPL011_SPI);
> +    rc = vgic_reserve_virq(d, vpl011->virq);
>       if ( !rc )
>       {
>           rc = -EINVAL;
> @@ -673,12 +713,12 @@ int domain_vpl011_init(struct domain *d, struct vpl011_init_info *info)
>       spin_lock_init(&vpl011->lock);
>   
>       register_mmio_handler(d, &vpl011_mmio_handler,
> -                          GUEST_PL011_BASE, GUEST_PL011_SIZE, NULL);
> +                          vpl011->base_addr, GUEST_PL011_SIZE, NULL);
>   
>       return 0;
>   
>   out2:
> -    vgic_free_virq(d, GUEST_VPL011_SPI);
> +    vgic_free_virq(d, vpl011->virq);
>   
>   out1:
>       if ( vpl011->backend_in_domain )
> diff --git a/xen/include/asm-arm/vpl011.h b/xen/include/asm-arm/vpl011.h
> index e6c7ab7381..c09abcd7a9 100644
> --- a/xen/include/asm-arm/vpl011.h
> +++ b/xen/include/asm-arm/vpl011.h
> @@ -53,6 +53,8 @@ struct vpl011 {
>       uint32_t    uarticr;        /* Interrupt clear register */
>       uint32_t    uartris;        /* Raw interrupt status register */
>       uint32_t    shadow_uartmis; /* shadow masked interrupt register */
> +    paddr_t     base_addr;
> +    unsigned int virq;
>       spinlock_t  lock;
>       evtchn_port_t evtchn;
>   };
> 

Cheers,

-- 
Julien Grall

