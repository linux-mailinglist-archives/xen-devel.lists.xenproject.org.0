Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C4045CC43
	for <lists+xen-devel@lfdr.de>; Wed, 24 Nov 2021 19:40:15 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.230521.398495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpxBM-0000Hj-Ee; Wed, 24 Nov 2021 18:39:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 230521.398495; Wed, 24 Nov 2021 18:39:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mpxBM-0000FP-BM; Wed, 24 Nov 2021 18:39:48 +0000
Received: by outflank-mailman (input) for mailman id 230521;
 Wed, 24 Nov 2021 18:39:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mpxBL-0000FJ-FO
 for xen-devel@lists.xenproject.org; Wed, 24 Nov 2021 18:39:47 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mpxBK-00054K-U9; Wed, 24 Nov 2021 18:39:46 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=[192.168.24.101]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mpxBK-0001Cy-Ob; Wed, 24 Nov 2021 18:39:46 +0000
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
	bh=RUrLEThyFi+dsIJEyXUhk18hjUENoXvrEsEY81+8tIk=; b=p8zFlF1onL5LorvvKHbdxzNl38
	X1yZ+1NR0tdn10CwFjioOBoSTv4ckmFFwAoBQ/k2HOh6cU+rqyEPkl/4TEge4mO0kJMDLlKHYbEDq
	5JVfKdwZQLfXxscbqZhc8aWEil0RkEVmma5oYcsD4gdBvpIZONdmtaEtr4dzjyQUokaU=;
Message-ID: <cdb399c5-4c9a-cc76-40a7-9a32a024666c@xen.org>
Date: Wed, 24 Nov 2021 18:39:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Subject: Re: [PATCH v3 09/10] xen/arm: if direct-map domain use native UART
 address and IRQ number for vPL011
To: Penny Zheng <penny.zheng@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com
References: <20211116063155.901183-1-penny.zheng@arm.com>
 <20211116063155.901183-10-penny.zheng@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20211116063155.901183-10-penny.zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Penny,

On 16/11/2021 06:31, Penny Zheng wrote:
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
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>

AFAICT, you exchanged the signed-off-by compare to the previous version. 
May I ask why?

> ---
> v2 changes:
> - explain why vpl011 initialization before creating its device tree node
> - error out if the domain is direct-mapped and the IRQ is not found
> - harden the code and add a check/comment when the hardware UART region
> is smaller than GUEST_VPL011_SIZE.
> ---
> v3 changes:
> - explain how the '27' was found for 'buf'
> - fix checking before dereferencing
> - refine comment message
> ---
>   xen/arch/arm/domain_build.c  | 42 ++++++++++++++++++++-----
>   xen/arch/arm/vpl011.c        | 60 +++++++++++++++++++++++++++++++-----
>   xen/include/asm-arm/vpl011.h |  2 ++
>   3 files changed, 90 insertions(+), 14 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 61fd374c5d..871c7114ae 100644
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
> @@ -2376,8 +2377,12 @@ static int __init make_vpl011_uart_node(struct kernel_info *kinfo)
>       gic_interrupt_t intr;
>       __be32 reg[GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS];
>       __be32 *cells;
> +    struct domain *d = kinfo->d;
> +    /* Placeholder for sbsa-uart@ + a 64-bit number + \0 */
> +    char buf[27];
>   
> -    res = fdt_begin_node(fdt, "sbsa-uart@"__stringify(GUEST_PL011_BASE));
> +    snprintf(buf, sizeof(buf), "sbsa-uart@%"PRIx64, d->arch.vpl011.base_addr);
> +    res = fdt_begin_node(fdt, buf);
>       if ( res )
>           return res;
>   
> @@ -2387,14 +2392,14 @@ static int __init make_vpl011_uart_node(struct kernel_info *kinfo)
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
> @@ -3109,6 +3114,14 @@ static int __init construct_domU(struct domain *d,
>               allocate_static_memory(d, &kinfo, node);
>       }
>   
> +    /*
> +     * Base address and irq number are needed when creating vpl011 device
> +     * tree node in prepare_dtb_domU, so initialization on related variables
> +     * shall be done first.
> +     */
> +    if ( kinfo.vpl011 )
> +        rc = domain_vpl011_init(d, NULL);
> +
>       rc = prepare_dtb_domU(d, &kinfo);
>       if ( rc < 0 )
>           return rc;
> @@ -3117,9 +3130,6 @@ static int __init construct_domU(struct domain *d,
>       if ( rc < 0 )
>           return rc;
>   
> -    if ( kinfo.vpl011 )
> -        rc = domain_vpl011_init(d, NULL);
> -
>       return rc;
>   }
>   
> @@ -3161,15 +3171,33 @@ void __init create_domUs(void)
>   
>           if ( !dt_property_read_u32(node, "nr_spis", &d_cfg.arch.nr_spis) )
>           {
> +            unsigned int vpl011_virq = GUEST_VPL011_SPI;
> +
>               d_cfg.arch.nr_spis = gic_number_lines() - 32;
>   
> +            /*
> +             * The VPL011 virq is GUEST_VPL011_SPI, unless direct-map is
> +             * set, in which case it'll match the hardware.
> +             *
> +             * Since here the domain is not totally built, we need to

The domain is not even built at this point. So I would say, "Since the 
domain is not yet created, we can't use d->arch.vpl011.irq. So the logic 
to find the vIRQ has to be hardcoded.".

> +             * open-code the logic to find the vIRQ. and the logic here

You added a full stop. So s/and the/The/.

> +             * is consistent with the ones in domain_vpl011_init().

s/ones/one/ I think.

> +             */
> +            if ( d_cfg.flags & XEN_DOMCTL_CDF_INTERNAL_directmap )
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
> index 895f436cc4..65610bccaf 100644
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
> @@ -626,6 +629,49 @@ int domain_vpl011_init(struct domain *d, struct vpl011_init_info *info)
>       if ( vpl011->backend.dom.ring_buf )
>           return -EINVAL;
>   
> +    /*
> +     * The VPL011 virq is GUEST_VPL011_SPI, except for direct-map domains
> +     * where the hardware value shall be used.
> +     * And the logic here should stay in sync with the one in

I would drop "And".

> +     * create_domUs().
> +     */
> +    if ( is_domain_direct_mapped(d) )
> +    {
> +        const struct vuart_info *uart = serial_vuart_info(SERHND_DTUART);
> +        int vpl011_irq = serial_irq(SERHND_DTUART);
> +
> +        if ( (uart != NULL) && (vpl011_irq > 0) )
> +        {
> +            vpl011->base_addr = uart->base_addr;
> +            vpl011->virq = vpl011_irq;
> +        }
> +        else
> +        {
> +            printk(XENLOG_ERR
> +                   "vpl011: Unable to re-use the Xen UART information.\n");
> +            return -EINVAL;
> +        }
> +
> +        /*
> +         * Since the PL011 we emulate for the guest requires a 4KB region,
> +         * and on some Hardware (e.g. on some sunxi SoC), the UART MMIO
> +         * region is less than 4KB, in which case, there may exist multiple
> +         * devices within the same 4KB region, here adds the following check to
> +         * prevent potential known pitfalls
> +         */
> +        if ( uart->size < GUEST_PL011_SIZE )
> +        {
> +            printk(XENLOG_ERR
> +                   "vpl011: Can't re-use the Xen UART MMIO region as it is too small.\n");
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
> @@ -661,7 +707,7 @@ int domain_vpl011_init(struct domain *d, struct vpl011_init_info *info)
>           }
>       }
>   
> -    rc = vgic_reserve_virq(d, GUEST_VPL011_SPI);
> +    rc = vgic_reserve_virq(d, vpl011->virq);
>       if ( !rc )
>       {
>           rc = -EINVAL;
> @@ -673,12 +719,12 @@ int domain_vpl011_init(struct domain *d, struct vpl011_init_info *info)
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

