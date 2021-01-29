Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E360A3087A4
	for <lists+xen-devel@lfdr.de>; Fri, 29 Jan 2021 11:05:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77872.141358 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Qet-0002nM-Kn; Fri, 29 Jan 2021 10:05:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77872.141358; Fri, 29 Jan 2021 10:05:43 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5Qet-0002mw-HL; Fri, 29 Jan 2021 10:05:43 +0000
Received: by outflank-mailman (input) for mailman id 77872;
 Fri, 29 Jan 2021 10:05:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l5Qer-0002mo-LM
 for xen-devel@lists.xenproject.org; Fri, 29 Jan 2021 10:05:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l5Qel-0002uO-PX; Fri, 29 Jan 2021 10:05:35 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l5Qel-000108-BX; Fri, 29 Jan 2021 10:05:35 +0000
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
	bh=Yh7ZKzVBfgKwxiJmK7+9fN528wQWDTAwShO9y2K5+Vs=; b=m+Rs1gkKkBWCIAFo3CFGmGEYoK
	BymNRyWdpz8c7pyhD24L9+uyLVx1QP7oMCkHCA55rjTKd5qLYEHWm2wr4k0uA7iAXt8auyajzKbhn
	Pgmv3hemWMSqEhmOBDa5u7+zaw3JR+43fvvzYjwI1ZIO+7mywRd9tt2rkw2S7gik0rb4=;
Subject: [TOOLS ACK needed] Re: [PATCH V6 18/24] xen/dm: Introduce
 xendevicemodel_set_irq_level DM op
To: Oleksandr Tyshchenko <olekstysh@gmail.com>,
 xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Julien Grall <julien.grall@arm.com>
References: <1611884932-1851-1-git-send-email-olekstysh@gmail.com>
 <1611884932-1851-19-git-send-email-olekstysh@gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <7bffd24d-e30b-ecad-4725-721523036a5d@xen.org>
Date: Fri, 29 Jan 2021 10:05:32 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <1611884932-1851-19-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi,

On 29/01/2021 01:48, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> This patch adds ability to the device emulator to notify otherend
> (some entity running in the guest) using a SPI and implements Arm
> specific bits for it. Proposed interface allows emulator to set
> the logical level of a one of a domain's IRQ lines.
> 
> We can't reuse the existing DM op (xen_dm_op_set_isa_irq_level)
> to inject an interrupt as the "isa_irq" field is only 8-bit and
> able to cover IRQ 0 - 255, whereas we need a wider range (0 - 1020).
> 
> Please note, for egde-triggered interrupt (which is used for
> the virtio-mmio emulation) we only trigger the interrupt on Arm
> if the level is asserted (rising edge) and do nothing if the level
> is deasserted (falling edge), so the call could be named "trigger_irq"
> (without the level parameter). But, in order to model the line closely
> (to be able to support level-triggered interrupt) we need to know whether
> the line is low or high, so the proposed interface has been chosen.
> However, it is worth mentioning that in case of the level-triggered
> interrupt, we should keep injecting the interrupt to the guest until
> the line is deasserted (this is not covered by current patch).
> 
> Signed-off-by: Julien Grall <julien.grall@arm.com>
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Acked-by: Stefano Stabellini <sstabellini@kernel.org>
> [On Arm only]
> Tested-by: Wei Chen <Wei.Chen@arm.com>

@Ian, @Wei, can we get an ack for the tools part?

Cheers,

> 
> ---
> Please note, this is a split/cleanup/hardening of Julien's PoC:
> "Add support for Guest IO forwarding to a device emulator"
> 
> Changes RFC -> V1:
>     - check incoming parameters in arch_dm_op()
>     - add explicit padding to struct xen_dm_op_set_irq_level
> 
> Changes V1 -> V2:
>     - update the author of a patch
>     - update patch description
>     - check that padding is always 0
>     - mention that interface is Arm only and only SPIs are
>       supported for now
>     - allow to set the logical level of a line for non-allocated
>       interrupts only
>     - add xen_dm_op_set_irq_level_t
> 
> Changes V2 -> V3:
>     - no changes
> 
> Changes V3 -> V4:
>     - update patch description
>     - update patch according to the IOREQ related dm-op handling changes
> 
> Changes V4 -> V5:
>     - rebase
>     - add Stefano-s A-b
> 
> Changes V5 -> V6:
>     - no changes
> ---
> ---
>   tools/include/xendevicemodel.h               |  4 +++
>   tools/libs/devicemodel/core.c                | 18 ++++++++++
>   tools/libs/devicemodel/libxendevicemodel.map |  1 +
>   xen/arch/arm/dm.c                            | 54 +++++++++++++++++++++++++++-
>   xen/include/public/hvm/dm_op.h               | 16 +++++++++
>   5 files changed, 92 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/include/xendevicemodel.h b/tools/include/xendevicemodel.h
> index e877f5c..c06b3c8 100644
> --- a/tools/include/xendevicemodel.h
> +++ b/tools/include/xendevicemodel.h
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
> index f254ed7..7854133 100644
> --- a/xen/arch/arm/dm.c
> +++ b/xen/arch/arm/dm.c
> @@ -20,6 +20,8 @@
>   #include <xen/ioreq.h>
>   #include <xen/nospec.h>
>   
> +#include <asm/vgic.h>
> +
>   int dm_op(const struct dmop_args *op_args)
>   {
>       struct domain *d;
> @@ -35,6 +37,7 @@ int dm_op(const struct dmop_args *op_args)
>           [XEN_DMOP_unmap_io_range_from_ioreq_server] = sizeof(struct xen_dm_op_ioreq_server_range),
>           [XEN_DMOP_set_ioreq_server_state]           = sizeof(struct xen_dm_op_set_ioreq_server_state),
>           [XEN_DMOP_destroy_ioreq_server]             = sizeof(struct xen_dm_op_destroy_ioreq_server),
> +        [XEN_DMOP_set_irq_level]                    = sizeof(struct xen_dm_op_set_irq_level),
>       };
>   
>       rc = rcu_lock_remote_domain_by_id(op_args->domid, &d);
> @@ -73,7 +76,56 @@ int dm_op(const struct dmop_args *op_args)
>       if ( op.pad )
>           goto out;
>   
> -    rc = ioreq_server_dm_op(&op, d, &const_op);
> +    switch ( op.op )
> +    {
> +    case XEN_DMOP_set_irq_level:
> +    {
> +        const struct xen_dm_op_set_irq_level *data =
> +            &op.u.set_irq_level;
> +        unsigned int i;
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
> +        /* Check that padding is always 0 */
> +        for ( i = 0; i < sizeof(data->pad); i++ )
> +        {
> +            if ( data->pad[i] )
> +            {
> +                rc = -EINVAL;
> +                break;
> +            }
> +        }
> +
> +        /*
> +         * Allow to set the logical level of a line for non-allocated
> +         * interrupts only.
> +         */
> +        if ( test_bit(data->irq, d->arch.vgic.allocated_irqs) )
> +        {
> +            rc = -EINVAL;
> +            break;
> +        }
> +
> +        vgic_inject_irq(d, NULL, data->irq, data->level);
> +        rc = 0;
> +        break;
> +    }
> +
> +    default:
> +        rc = ioreq_server_dm_op(&op, d, &const_op);
> +        break;
> +    }
>   
>       if ( (!rc || rc == -ERESTART) &&
>            !const_op && copy_to_guest_offset(op_args->buf[0].h, offset,
> diff --git a/xen/include/public/hvm/dm_op.h b/xen/include/public/hvm/dm_op.h
> index 66cae1a..1f70d58 100644
> --- a/xen/include/public/hvm/dm_op.h
> +++ b/xen/include/public/hvm/dm_op.h
> @@ -434,6 +434,21 @@ struct xen_dm_op_pin_memory_cacheattr {
>   };
>   typedef struct xen_dm_op_pin_memory_cacheattr xen_dm_op_pin_memory_cacheattr_t;
>   
> +/*
> + * XEN_DMOP_set_irq_level: Set the logical level of a one of a domain's
> + *                         IRQ lines (currently Arm only).
> + * Only SPIs are supported.
> + */
> +#define XEN_DMOP_set_irq_level 19
> +
> +struct xen_dm_op_set_irq_level {
> +    uint32_t irq;
> +    /* IN - Level: 0 -> deasserted, 1 -> asserted */
> +    uint8_t level;
> +    uint8_t pad[3];
> +};
> +typedef struct xen_dm_op_set_irq_level xen_dm_op_set_irq_level_t;
> +
>   struct xen_dm_op {
>       uint32_t op;
>       uint32_t pad;
> @@ -447,6 +462,7 @@ struct xen_dm_op {
>           xen_dm_op_track_dirty_vram_t track_dirty_vram;
>           xen_dm_op_set_pci_intx_level_t set_pci_intx_level;
>           xen_dm_op_set_isa_irq_level_t set_isa_irq_level;
> +        xen_dm_op_set_irq_level_t set_irq_level;
>           xen_dm_op_set_pci_link_route_t set_pci_link_route;
>           xen_dm_op_modified_memory_t modified_memory;
>           xen_dm_op_set_mem_type_t set_mem_type;
> 

-- 
Julien Grall

