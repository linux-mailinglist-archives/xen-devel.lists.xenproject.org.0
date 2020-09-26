Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA042799C5
	for <lists+xen-devel@lfdr.de>; Sat, 26 Sep 2020 15:52:36 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kMAbN-0000S8-5O; Sat, 26 Sep 2020 13:51:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a+g/=DD=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kMAbM-0000S3-7k
 for xen-devel@lists.xenproject.org; Sat, 26 Sep 2020 13:51:00 +0000
X-Inumbo-ID: 08707510-cd79-4e71-8d89-3f80e387cd30
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 08707510-cd79-4e71-8d89-3f80e387cd30;
 Sat, 26 Sep 2020 13:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=lTRzsq39FHHYxMCopEfa8OSeX/AbJMQ4mCp7ytpQ1yA=; b=TCWJP6Nu8/h2CNoOtgWSkVBATn
 tBH+UdkzkzTzIICg6vDs6TpbheoN3vtSEYYSWGGdKLE0KBcrgTEetdc+ZQlStWISk6eh4K7STE8Hd
 qZN8e/CQcENze+2N/T+pZd4Uj3VXJnE6grseDzmB+v5+FTZL1BCYH8RhQvVt0laoyEoY=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kMAbD-0007gS-EE; Sat, 26 Sep 2020 13:50:51 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kMAbD-0001R2-01; Sat, 26 Sep 2020 13:50:51 +0000
Subject: Re: [PATCH V1 12/16] xen/dm: Introduce xendevicemodel_set_irq_level
 DM op
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <julien.grall@arm.com>, "paul@xen.org" <paul@xen.org>,
 Andre Przywara <andre.przywara@arm.com>
References: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
 <1599769330-17656-13-git-send-email-olekstysh@gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <68259658-e6c7-8a80-dbd6-a01b8f0d9a83@xen.org>
Date: Sat, 26 Sep 2020 14:50:48 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1599769330-17656-13-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

(+ Paul and Andre)

Hi,

Adding Paul as the author of DMOP and Andre as this is GIC related.

On 10/09/2020 21:22, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Looking at the PoC I shared with you, this code was originally written 
by me.

> 
> This patch adds ability to the device emulator to notify otherend
> (some entity running in the guest) using a SPI and implements Arm
> specific bits for it. Proposed interface allows emulator to set
> the logical level of a one of a domain's IRQ lines.

It would be good to explain in the commit message why we can't use the 
existing DMOP to inject an interrupt.

> Signed-off-by: Julien Grall <julien.grall@arm.com>
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> ---
> Please note, this is a split/cleanup/hardening of Julien's PoC:
> "Add support for Guest IO forwarding to a device emulator"
> 
> Please note, I left interface untouched since there is still
> an open discussion what interface to use/what information to pass
> to the hypervisor. The question whether we should abstract away
> the state of the line or not.
> 
> Changes RFC -> V1:
>     - check incoming parameters in arch_dm_op()
>     - add explicit padding to struct xen_dm_op_set_irq_level
> ---
> ---
>   tools/libs/devicemodel/core.c                   | 18 +++++++++++++
>   tools/libs/devicemodel/include/xendevicemodel.h |  4 +++
>   tools/libs/devicemodel/libxendevicemodel.map    |  1 +
>   xen/arch/arm/dm.c                               | 36 ++++++++++++++++++++++++-
>   xen/common/dm.c                                 |  1 +
>   xen/include/public/hvm/dm_op.h                  | 15 +++++++++++
>   6 files changed, 74 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/libs/devicemodel/core.c b/tools/libs/devicemodel/core.c
> index 4d40639..30bd79f 100644
> --- a/tools/libs/devicemodel/core.c
> +++ b/tools/libs/devicemodel/core.c
> @@ -430,6 +430,24 @@ int xendevicemodel_set_isa_irq_level(
>       return xendevicemodel_op(dmod, domid, 1, &op, sizeof(op));
>   }
>   
> +int xendevicemodel_set_irq_level(
> +    xendevicemodel_handle *dmod, domid_t domid, uint32_t irq,
> +    unsigned int level)
> +{
> +    struct xen_dm_op op;
> +    struct xen_dm_op_set_irq_level *data;
> +
> +    memset(&op, 0, sizeof(op));
> +
> +    op.op = XEN_DMOP_set_irq_level;
> +    data = &op.u.set_irq_level;
> +
> +    data->irq = irq;
> +    data->level = level;
> +
> +    return xendevicemodel_op(dmod, domid, 1, &op, sizeof(op));
> +}
> +
>   int xendevicemodel_set_pci_link_route(
>       xendevicemodel_handle *dmod, domid_t domid, uint8_t link, uint8_t irq)
>   {
> diff --git a/tools/libs/devicemodel/include/xendevicemodel.h b/tools/libs/devicemodel/include/xendevicemodel.h
> index e877f5c..c06b3c8 100644
> --- a/tools/libs/devicemodel/include/xendevicemodel.h
> +++ b/tools/libs/devicemodel/include/xendevicemodel.h
> @@ -209,6 +209,10 @@ int xendevicemodel_set_isa_irq_level(
>       xendevicemodel_handle *dmod, domid_t domid, uint8_t irq,
>       unsigned int level);
>   
> +int xendevicemodel_set_irq_level(
> +    xendevicemodel_handle *dmod, domid_t domid, unsigned int irq,
> +    unsigned int level);
> +
>   /**
>    * This function maps a PCI INTx line to a an IRQ line.
>    *
> diff --git a/tools/libs/devicemodel/libxendevicemodel.map b/tools/libs/devicemodel/libxendevicemodel.map
> index 561c62d..a0c3012 100644
> --- a/tools/libs/devicemodel/libxendevicemodel.map
> +++ b/tools/libs/devicemodel/libxendevicemodel.map
> @@ -32,6 +32,7 @@ VERS_1.2 {
>   	global:
>   		xendevicemodel_relocate_memory;
>   		xendevicemodel_pin_memory_cacheattr;
> +		xendevicemodel_set_irq_level;
>   } VERS_1.1;
>   
>   VERS_1.3 {
> diff --git a/xen/arch/arm/dm.c b/xen/arch/arm/dm.c
> index eb20344..428ef98 100644
> --- a/xen/arch/arm/dm.c
> +++ b/xen/arch/arm/dm.c
> @@ -15,11 +15,45 @@
>    */
>   
>   #include <xen/hypercall.h>

NIT: newline between <xen/*> and <asm/*> includes.

> +#include <asm/vgic.h>
>   
>   int arch_dm_op(struct xen_dm_op *op, struct domain *d,
>                  const struct dmop_args *op_args, bool *const_op)
>   {
> -    return -EOPNOTSUPP;
> +    int rc;
> +
> +    switch ( op->op )
> +    {
> +    case XEN_DMOP_set_irq_level:
> +    {
> +        const struct xen_dm_op_set_irq_level *data =
> +            &op->u.set_irq_level;
> +
> +        /* Only SPIs are supported */
> +        if ( (data->irq < NR_LOCAL_IRQS) || (data->irq >= vgic_num_irqs(d)) )
> +        {
> +            rc = -EINVAL;
> +            break;
> +        }
> +
> +        if ( data->level != 0 && data->level != 1 )
> +        {
> +            rc = -EINVAL;
> +            break;
> +        }
> +

I think we want to check the padding is always 0.

> +
> +        vgic_inject_irq(d, NULL, data->irq, data->level);

So, this interface will allow the device emulator to raise/lower the 
line for an HW mapped interrupt. I think this will mess up with the 
internal state machine.

It would probably be better if a device emulator can only raise/lower 
the line for non-allocated interrupts (see d->arch.vgic.allocated_irqs). 
Any thoughts?

> +        rc = 0;
> +        break;
> +    }
> +
> +    default:
> +        rc = -EOPNOTSUPP;
> +        break;
> +    }
> +
> +    return rc;
>   }
>   
>   /*
> diff --git a/xen/common/dm.c b/xen/common/dm.c
> index 060731d..c55e042 100644
> --- a/xen/common/dm.c
> +++ b/xen/common/dm.c
> @@ -47,6 +47,7 @@ static int dm_op(const struct dmop_args *op_args)
>           [XEN_DMOP_remote_shutdown]                  = sizeof(struct xen_dm_op_remote_shutdown),
>           [XEN_DMOP_relocate_memory]                  = sizeof(struct xen_dm_op_relocate_memory),
>           [XEN_DMOP_pin_memory_cacheattr]             = sizeof(struct xen_dm_op_pin_memory_cacheattr),
> +        [XEN_DMOP_set_irq_level]                    = sizeof(struct xen_dm_op_set_irq_level),
>       };
>   
>       rc = rcu_lock_remote_domain_by_id(op_args->domid, &d);
> diff --git a/xen/include/public/hvm/dm_op.h b/xen/include/public/hvm/dm_op.h
> index fd00e9d..39567bf 100644
> --- a/xen/include/public/hvm/dm_op.h
> +++ b/xen/include/public/hvm/dm_op.h
> @@ -417,6 +417,20 @@ struct xen_dm_op_pin_memory_cacheattr {
>       uint32_t pad;
>   };
>   
> +/*
> + * XEN_DMOP_set_irq_level: Set the logical level of a one of a domain's
> + *                         IRQ lines.
> + * XXX Handle PPIs.

This is a public interface, so it seems a bit strange to leave a TODO in 
this code.

I wouldn't be surprised if someone will want PPI support soon, but we 
may be able to defer it if we can easily extend the hypercall.

@Paul, how did you envision to extend DMOP?

Also, is there any plan to add x86 support? If not, then I think we want 
to document in the interface that this is Arm only.

> + */
> +#define XEN_DMOP_set_irq_level 19
> +
> +struct xen_dm_op_set_irq_level {
> +    uint32_t irq;
> +    /* IN - Level: 0 -> deasserted, 1 -> asserted */
> +    uint8_t level;
> +    uint8_t pad[3];
> +};
> +
>   struct xen_dm_op {
>       uint32_t op;
>       uint32_t pad;
> @@ -430,6 +444,7 @@ struct xen_dm_op {
>           struct xen_dm_op_track_dirty_vram track_dirty_vram;
>           struct xen_dm_op_set_pci_intx_level set_pci_intx_level;
>           struct xen_dm_op_set_isa_irq_level set_isa_irq_level;
> +        struct xen_dm_op_set_irq_level set_irq_level;
>           struct xen_dm_op_set_pci_link_route set_pci_link_route;
>           struct xen_dm_op_modified_memory modified_memory;
>           struct xen_dm_op_set_mem_type set_mem_type;
> 

Cheers,

-- 
Julien Grall

