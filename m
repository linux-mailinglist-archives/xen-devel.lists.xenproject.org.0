Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D977415C9D
	for <lists+xen-devel@lfdr.de>; Thu, 23 Sep 2021 13:14:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.193737.345117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTMgA-00007U-Dc; Thu, 23 Sep 2021 11:14:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 193737.345117; Thu, 23 Sep 2021 11:14:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mTMgA-000054-A6; Thu, 23 Sep 2021 11:14:14 +0000
Received: by outflank-mailman (input) for mailman id 193737;
 Thu, 23 Sep 2021 11:14:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mTMg8-00004q-II
 for xen-devel@lists.xenproject.org; Thu, 23 Sep 2021 11:14:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mTMg8-0006Fa-69; Thu, 23 Sep 2021 11:14:12 +0000
Received: from [202.153.84.92] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mTMg7-00048U-SI; Thu, 23 Sep 2021 11:14:12 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=1zAR4mzKy/VhBD2yok0W5hHTz87+eTPfnMf+q8xx1mk=; b=D5nNqcchyYQ2r5dRrivs9TiLEK
	BtydZV6pt0tdRNv8nORjnloodcVCuf2bkzlsnnXsjmuN2X9cGpZePbrA5OIRwG7QebfoGO4TlQ0O/
	CMRC2lHZy9s6JZTmCt1MDg7RTdBCT6WlTt3eNUkomM0InGxH4YjpMeBvZzjS2o8s2GwE=;
Subject: Re: [PATCH 09/11] xen/arm: if 1:1 direct-map domain use native UART
 address and IRQ number for vPL011
To: Penny Zheng <penny.zheng@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com
References: <20210923031115.1429719-1-penny.zheng@arm.com>
 <20210923031115.1429719-10-penny.zheng@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <db752d34-fc23-04b3-3c84-12d4de6859e0@xen.org>
Date: Thu, 23 Sep 2021 16:14:08 +0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210923031115.1429719-10-penny.zheng@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 23/09/2021 08:11, Penny Zheng wrote:
> From: Stefano Stabellini <stefano.stabellini@xilinx.com>
> 
> We always use a fix address to map the vPL011 to domains. The address
> could be a problem for domains that are directly mapped.
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
>   xen/arch/arm/domain_build.c  | 34 +++++++++++++++++++++++++++-------
>   xen/arch/arm/vpl011.c        | 34 +++++++++++++++++++++++++++-------
>   xen/include/asm-arm/vpl011.h |  2 ++
>   3 files changed, 56 insertions(+), 14 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 120f1ae575..c92e510ae7 100644
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
> @@ -1942,8 +1943,11 @@ static int __init make_vpl011_uart_node(struct kernel_info *kinfo)
>       gic_interrupt_t intr;
>       __be32 reg[GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS];
>       __be32 *cells;
> +    struct domain *d = kinfo->d;
> +    char buf[27];
>   
> -    res = fdt_begin_node(fdt, "sbsa-uart@"__stringify(GUEST_PL011_BASE));
> +    snprintf(buf, sizeof(buf), "sbsa-uart@%"PRIx64, d->arch.vpl011.base_addr);
> +    res = fdt_begin_node(fdt, buf);
>       if ( res )
>           return res;
>   
> @@ -1953,14 +1957,14 @@ static int __init make_vpl011_uart_node(struct kernel_info *kinfo)
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
> @@ -2670,6 +2674,13 @@ static int __init construct_domU(struct domain *d,
>       else
>           allocate_static_memory(d, &kinfo, node);
>   
> +    /*
> +     * Initialization before creating its device
> +     * tree node in prepare_dtb_domU.
> +     */

I think it would be better to explain *why* this needs to be done before.

> +    if ( kinfo.vpl011 )
> +        rc = domain_vpl011_init(d, NULL);
> +
>       rc = prepare_dtb_domU(d, &kinfo);
>       if ( rc < 0 )
>           return rc;
> @@ -2678,9 +2689,6 @@ static int __init construct_domU(struct domain *d,
>       if ( rc < 0 )
>           return rc;
>   
> -    if ( kinfo.vpl011 )
> -        rc = domain_vpl011_init(d, NULL);
> -
>       return rc;
>   }
>   
> @@ -2723,15 +2731,27 @@ void __init create_domUs(void)
>   
>           if ( !dt_property_read_u32(node, "nr_spis", &d_cfg.arch.nr_spis) )
>           {
> +            unsigned int vpl011_virq = GUEST_VPL011_SPI;

Coding style: Add a newline here.

>               d_cfg.arch.nr_spis = gic_number_lines() - 32;
>   
> +            /*
> +             * The VPL011 virq is GUEST_VPL011_SPI, unless direct-map in
> +             * set, in which case we'll try to match the hardware.
> +             *
> +             * Typically, d->arch.vpl011.virq has the vpl011 irq number
> +             * but at this point of the boot sequence it is not
> +             * initialized yet.
> +             */
> +            if ( direct_map && serial_irq(SERHND_DTUART) > 0 )
> +                vpl011_virq = serial_irq(SERHND_DTUART);

I think we should not continue if the domain is direct-mapped *and* the 
IRQ is not found. Otherwise, this will may just result to potential 
breakage if GUEST_VPL011_SPI happens to be used for an HW device.

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
> index 895f436cc4..10df25f098 100644
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
> @@ -622,10 +625,27 @@ int domain_vpl011_init(struct domain *d, struct vpl011_init_info *info)
>   {
>       int rc;
>       struct vpl011 *vpl011 = &d->arch.vpl011;
> +    const struct vuart_info *uart = serial_vuart_info(SERHND_DTUART);
>   
>       if ( vpl011->backend.dom.ring_buf )
>           return -EINVAL;
>   
> +    vpl011->base_addr = GUEST_PL011_BASE;
> +    vpl011->virq = GUEST_VPL011_SPI;
> +    if ( is_domain_direct_mapped(d) )
> +    {
> +        if ( uart != NULL && serial_irq(SERHND_DTUART) > 0 )
> +        {
> +            vpl011->base_addr = uart->base_addr;
> +            vpl011->virq = serial_irq(SERHND_DTUART);

This seems a bit pointless to call serial_irq() twice. How about add a 
field in vuart_info to return the interrupt number?

> +        }
> +        else
> +            printk(XENLOG_ERR
> +                   "Unable to reuse physical UART address and irq for vPL011.\n"
> +                   "Defaulting to addr %#"PRIpaddr" and IRQ %u\n",
> +                   vpl011->base_addr, vpl011->virq);
> +    }
> +
>       /*
>        * info is NULL when the backend is in Xen.
>        * info is != NULL when the backend is in a domain.
> @@ -661,7 +681,7 @@ int domain_vpl011_init(struct domain *d, struct vpl011_init_info *info)
>           }
>       }
>   
> -    rc = vgic_reserve_virq(d, GUEST_VPL011_SPI);
> +    rc = vgic_reserve_virq(d, vpl011->virq);
>       if ( !rc )
>       {
>           rc = -EINVAL;
> @@ -673,12 +693,12 @@ int domain_vpl011_init(struct domain *d, struct vpl011_init_info *info)
>       spin_lock_init(&vpl011->lock);
>   
>       register_mmio_handler(d, &vpl011_mmio_handler,
> -                          GUEST_PL011_BASE, GUEST_PL011_SIZE, NULL);
> +                          vpl011->base_addr, GUEST_PL011_SIZE, NULL);

So you are making the assumpption that the UART region will be equal to 
(or bigger) than GUEST_PL011_SIZE. There are definitely UART out where 
the MMIO region is smaller than 4K.

Although, I don't expect them to be passthrough today. So this is 
probably fine to assume that the next 4K is free. Can you add some 
justification in-code and in the commit message?

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

