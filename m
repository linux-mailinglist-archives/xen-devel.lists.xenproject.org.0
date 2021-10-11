Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 509A7428B0C
	for <lists+xen-devel@lfdr.de>; Mon, 11 Oct 2021 12:49:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.205731.361115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZss0-0000ez-PA; Mon, 11 Oct 2021 10:49:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 205731.361115; Mon, 11 Oct 2021 10:49:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mZss0-0000cU-MG; Mon, 11 Oct 2021 10:49:24 +0000
Received: by outflank-mailman (input) for mailman id 205731;
 Mon, 11 Oct 2021 10:49:22 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mZsry-0000cO-Bk
 for xen-devel@lists.xenproject.org; Mon, 11 Oct 2021 10:49:22 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mZsry-00039b-5o; Mon, 11 Oct 2021 10:49:22 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=[192.168.17.141]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mZsrx-0000LG-Vw; Mon, 11 Oct 2021 10:49:22 +0000
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
	bh=jTmHjCnoTVDYQ0BD0P56aPmCyTGWXHuTzvImY1jXc9w=; b=ZSWg5N30TosRb3Jn7JN5fqIeLg
	0OEk68JRz7booeKh2RinDMi4N7zKfwPHb+LQ3xtjEgEEcrEh6K49wW7qoQaRrUhC0l/P/jKuECoiH
	ZWxXpSwwwdUV5qSg2G2FGZoGFE+czux1YaOM/qQ5KuGbKHoGXvPJ700qLijG04guOgWo=;
Message-ID: <45f31ced-f011-a8fd-5c80-822b9c731adb@xen.org>
Date: Mon, 11 Oct 2021 11:49:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.0
Subject: Re: [PATCH 09/11] xen/arm: if 1:1 direct-map domain use native UART
 address and IRQ number for vPL011
To: Penny Zheng <Penny.Zheng@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, Wei Chen <Wei.Chen@arm.com>
References: <20210923031115.1429719-1-penny.zheng@arm.com>
 <20210923031115.1429719-10-penny.zheng@arm.com>
 <db752d34-fc23-04b3-3c84-12d4de6859e0@xen.org>
 <VE1PR08MB5215F07156273D0822515E92F7B39@VE1PR08MB5215.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <VE1PR08MB5215F07156273D0822515E92F7B39@VE1PR08MB5215.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/10/2021 09:47, Penny Zheng wrote:
> Hi Julien

Hi Penny,

>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Sent: Thursday, September 23, 2021 7:14 PM
>> To: Penny Zheng <Penny.Zheng@arm.com>; xen-devel@lists.xenproject.org;
>> sstabellini@kernel.org
>> Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>; Wei Chen
>> <Wei.Chen@arm.com>
>> Subject: Re: [PATCH 09/11] xen/arm: if 1:1 direct-map domain use native
>> UART address and IRQ number for vPL011
>>
>>
>>
>> On 23/09/2021 08:11, Penny Zheng wrote:
>>> From: Stefano Stabellini <stefano.stabellini@xilinx.com>
>>>
>>> We always use a fix address to map the vPL011 to domains. The address
>>> could be a problem for domains that are directly mapped.
>>>
>>> So, for domains that are directly mapped, reuse the address of the
>>> physical UART on the platform to avoid potential clashes.
>>>
>>> Do the same for the virtual IRQ number: instead of always using
>>> GUEST_VPL011_SPI, try to reuse the physical SPI number if possible.
>>>
>>> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
>>> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>>> ---
>>>    xen/arch/arm/domain_build.c  | 34 +++++++++++++++++++++++++++-------
>>>    xen/arch/arm/vpl011.c        | 34 +++++++++++++++++++++++++++-------
>>>    xen/include/asm-arm/vpl011.h |  2 ++
>>>    3 files changed, 56 insertions(+), 14 deletions(-)
>>>
>>> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
>>> index 120f1ae575..c92e510ae7 100644
>>> --- a/xen/arch/arm/domain_build.c
>>> +++ b/xen/arch/arm/domain_build.c
>>> @@ -30,6 +30,7 @@
>>>
>>>    #include <xen/irq.h>
>>>    #include <xen/grant_table.h>
>>> +#include <xen/serial.h>
>>>
>>>    static unsigned int __initdata opt_dom0_max_vcpus;
>>>    integer_param("dom0_max_vcpus", opt_dom0_max_vcpus); @@ -1942,8
>>> +1943,11 @@ static int __init make_vpl011_uart_node(struct kernel_info
>> *kinfo)
>>>        gic_interrupt_t intr;
>>>        __be32 reg[GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS];
>>>        __be32 *cells;
>>> +    struct domain *d = kinfo->d;
>>> +    char buf[27];
>>>
>>> -    res = fdt_begin_node(fdt, "sbsa-uart@"__stringify(GUEST_PL011_BASE));
>>> +    snprintf(buf, sizeof(buf), "sbsa-uart@%"PRIx64, d-
>>> arch.vpl011.base_addr);
>>> +    res = fdt_begin_node(fdt, buf);
>>>        if ( res )
>>>            return res;
>>>
>>> @@ -1953,14 +1957,14 @@ static int __init make_vpl011_uart_node(struct
>>> kernel_info *kinfo)
>>>
>>>        cells = &reg[0];
>>>        dt_child_set_range(&cells, GUEST_ROOT_ADDRESS_CELLS,
>>> -                       GUEST_ROOT_SIZE_CELLS, GUEST_PL011_BASE,
>>> +                       GUEST_ROOT_SIZE_CELLS,
>>> + d->arch.vpl011.base_addr,
>>>                           GUEST_PL011_SIZE);
>>>
>>>        res = fdt_property(fdt, "reg", reg, sizeof(reg));
>>>        if ( res )
>>>            return res;
>>>
>>> -    set_interrupt(intr, GUEST_VPL011_SPI, 0xf, DT_IRQ_TYPE_LEVEL_HIGH);
>>> +    set_interrupt(intr, d->arch.vpl011.virq, 0xf,
>>> + DT_IRQ_TYPE_LEVEL_HIGH);
>>>
>>>        res = fdt_property(fdt, "interrupts", intr, sizeof (intr));
>>>        if ( res )
>>> @@ -2670,6 +2674,13 @@ static int __init construct_domU(struct domain
>> *d,
>>>        else
>>>            allocate_static_memory(d, &kinfo, node);
>>>
>>> +    /*
>>> +     * Initialization before creating its device
>>> +     * tree node in prepare_dtb_domU.
>>> +     */
>>
>> I think it would be better to explain *why* this needs to be done before.
>>
>>> +    if ( kinfo.vpl011 )
>>> +        rc = domain_vpl011_init(d, NULL);
>>> +
>>>        rc = prepare_dtb_domU(d, &kinfo);
>>>        if ( rc < 0 )
>>>            return rc;
>>> @@ -2678,9 +2689,6 @@ static int __init construct_domU(struct domain
>> *d,
>>>        if ( rc < 0 )
>>>            return rc;
>>>
>>> -    if ( kinfo.vpl011 )
>>> -        rc = domain_vpl011_init(d, NULL);
>>> -
>>>        return rc;
>>>    }
>>>
>>> @@ -2723,15 +2731,27 @@ void __init create_domUs(void)
>>>
>>>            if ( !dt_property_read_u32(node, "nr_spis", &d_cfg.arch.nr_spis) )
>>>            {
>>> +            unsigned int vpl011_virq = GUEST_VPL011_SPI;
>>
>> Coding style: Add a newline here.
>>
>>>                d_cfg.arch.nr_spis = gic_number_lines() - 32;
>>>
>>> +            /*
>>> +             * The VPL011 virq is GUEST_VPL011_SPI, unless direct-map in
>>> +             * set, in which case we'll try to match the hardware.
>>> +             *
>>> +             * Typically, d->arch.vpl011.virq has the vpl011 irq number
>>> +             * but at this point of the boot sequence it is not
>>> +             * initialized yet.
>>> +             */
>>> +            if ( direct_map && serial_irq(SERHND_DTUART) > 0 )
>>> +                vpl011_virq = serial_irq(SERHND_DTUART);
>>
>> I think we should not continue if the domain is direct-mapped *and* the IRQ
>> is not found. Otherwise, this will may just result to potential breakage if
>> GUEST_VPL011_SPI happens to be used for an HW device.
>>
>>> +
>>>                /*
>>>                 * vpl011 uses one emulated SPI. If vpl011 is requested, make
>>>                 * sure that we allocate enough SPIs for it.
>>>                 */
>>>                if ( dt_property_read_bool(node, "vpl011") )
>>>                    d_cfg.arch.nr_spis = MAX(d_cfg.arch.nr_spis,
>>> -                                         GUEST_VPL011_SPI - 32 + 1);
>>> +                                         vpl011_virq - 32 + 1);
>>>            }
>>>
>>>            /*
>>> diff --git a/xen/arch/arm/vpl011.c b/xen/arch/arm/vpl011.c index
>>> 895f436cc4..10df25f098 100644
>>> --- a/xen/arch/arm/vpl011.c
>>> +++ b/xen/arch/arm/vpl011.c
>>> @@ -29,6 +29,7 @@
>>>    #include <xen/mm.h>
>>>    #include <xen/sched.h>
>>>    #include <xen/console.h>
>>> +#include <xen/serial.h>
>>>    #include <public/domctl.h>
>>>    #include <public/io/console.h>
>>>    #include <asm/pl011-uart.h>
>>> @@ -71,11 +72,11 @@ static void vpl011_update_interrupt_status(struct
>> domain *d)
>>>         * status bit has been set since the last time.
>>>         */
>>>        if ( uartmis & ~vpl011->shadow_uartmis )
>>> -        vgic_inject_irq(d, NULL, GUEST_VPL011_SPI, true);
>>> +        vgic_inject_irq(d, NULL, vpl011->virq, true);
>>>
>>>        vpl011->shadow_uartmis = uartmis;
>>>    #else
>>> -    vgic_inject_irq(d, NULL, GUEST_VPL011_SPI, uartmis);
>>> +    vgic_inject_irq(d, NULL, vpl011->virq, uartmis);
>>>    #endif
>>>    }
>>>
>>> @@ -347,7 +348,8 @@ static int vpl011_mmio_read(struct vcpu *v,
>>>                                void *priv)
>>>    {
>>>        struct hsr_dabt dabt = info->dabt;
>>> -    uint32_t vpl011_reg = (uint32_t)(info->gpa - GUEST_PL011_BASE);
>>> +    uint32_t vpl011_reg = (uint32_t)(info->gpa -
>>> +
>>> + v->domain->arch.vpl011.base_addr);
>>>        struct vpl011 *vpl011 = &v->domain->arch.vpl011;
>>>        struct domain *d = v->domain;
>>>        unsigned long flags;
>>> @@ -430,7 +432,8 @@ static int vpl011_mmio_write(struct vcpu *v,
>>>                                 void *priv)
>>>    {
>>>        struct hsr_dabt dabt = info->dabt;
>>> -    uint32_t vpl011_reg = (uint32_t)(info->gpa - GUEST_PL011_BASE);
>>> +    uint32_t vpl011_reg = (uint32_t)(info->gpa -
>>> +
>>> + v->domain->arch.vpl011.base_addr);
>>>        struct vpl011 *vpl011 = &v->domain->arch.vpl011;
>>>        struct domain *d = v->domain;
>>>        unsigned long flags;
>>> @@ -622,10 +625,27 @@ int domain_vpl011_init(struct domain *d, struct
>> vpl011_init_info *info)
>>>    {
>>>        int rc;
>>>        struct vpl011 *vpl011 = &d->arch.vpl011;
>>> +    const struct vuart_info *uart = serial_vuart_info(SERHND_DTUART);
>>>
>>>        if ( vpl011->backend.dom.ring_buf )
>>>            return -EINVAL;
>>>
>>> +    vpl011->base_addr = GUEST_PL011_BASE;
>>> +    vpl011->virq = GUEST_VPL011_SPI;
>>> +    if ( is_domain_direct_mapped(d) )
>>> +    {
>>> +        if ( uart != NULL && serial_irq(SERHND_DTUART) > 0 )
>>> +        {
>>> +            vpl011->base_addr = uart->base_addr;
>>> +            vpl011->virq = serial_irq(SERHND_DTUART);
>>
>> This seems a bit pointless to call serial_irq() twice. How about add a field in
>> vuart_info to return the interrupt number?
>>
>>> +        }
>>> +        else
>>> +            printk(XENLOG_ERR
>>> +                   "Unable to reuse physical UART address and irq for vPL011.\n"
>>> +                   "Defaulting to addr %#"PRIpaddr" and IRQ %u\n",
>>> +                   vpl011->base_addr, vpl011->virq);
>>> +    }
>>> +
>>>        /*
>>>         * info is NULL when the backend is in Xen.
>>>         * info is != NULL when the backend is in a domain.
>>> @@ -661,7 +681,7 @@ int domain_vpl011_init(struct domain *d, struct
>> vpl011_init_info *info)
>>>            }
>>>        }
>>>
>>> -    rc = vgic_reserve_virq(d, GUEST_VPL011_SPI);
>>> +    rc = vgic_reserve_virq(d, vpl011->virq);
>>>        if ( !rc )
>>>        {
>>>            rc = -EINVAL;
>>> @@ -673,12 +693,12 @@ int domain_vpl011_init(struct domain *d, struct
>> vpl011_init_info *info)
>>>        spin_lock_init(&vpl011->lock);
>>>
>>>        register_mmio_handler(d, &vpl011_mmio_handler,
>>> -                          GUEST_PL011_BASE, GUEST_PL011_SIZE, NULL);
>>> +                          vpl011->base_addr, GUEST_PL011_SIZE, NULL);
>>
>> So you are making the assumpption that the UART region will be equal to (or
>> bigger) than GUEST_PL011_SIZE. There are definitely UART out where the
>> MMIO region is smaller than 4K.
>>
> 
> Sorry. I got a few confused here, since I am not very familiar with pl011/UART knowledge.
> 
> Problems will occur when UART region is bigger than GUEST_PL011_SIZE, since we
> are only considering MMIO region of [vpl011->base_addr, vpl011->base_addr + GUEST_PL011_SIZE], right?

It is in fact the other way around. The problem will appear if the host 
UART MMIO region is smaller than the one we will emulate for the guest 
PL011.

> 
> So I shall add the justification like
> ASSERT(uart->size <= GUEST_PL011_SIZE);

I think this would want to be a proper check so distro users would get 
an error if they are trying to use this feature on such platform.

Cheers,

-- 
Julien Grall

