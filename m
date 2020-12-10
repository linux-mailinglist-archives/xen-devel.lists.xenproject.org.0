Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E6D2D50C8
	for <lists+xen-devel@lfdr.de>; Thu, 10 Dec 2020 03:22:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.48916.86553 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knBaA-0002pc-Fr; Thu, 10 Dec 2020 02:21:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 48916.86553; Thu, 10 Dec 2020 02:21:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1knBaA-0002pD-Ci; Thu, 10 Dec 2020 02:21:26 +0000
Received: by outflank-mailman (input) for mailman id 48916;
 Thu, 10 Dec 2020 02:21:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JUBE=FO=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1knBa8-0002p8-OK
 for xen-devel@lists.xenproject.org; Thu, 10 Dec 2020 02:21:24 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c30a9133-2519-4b0d-af31-b349307a50ab;
 Thu, 10 Dec 2020 02:21:23 +0000 (UTC)
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
X-Inumbo-ID: c30a9133-2519-4b0d-af31-b349307a50ab
Date: Wed, 9 Dec 2020 18:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1607566882;
	bh=UNQcLEtngSuCobx1FTNYh6Y2rz91ba3pHeTBgv1GL40=;
	h=From:To:cc:Subject:In-Reply-To:References:From;
	b=QScRGRK6nByNLxX2ExDW9w65WRTNycxcOU9wGa8TXEdUZwqtqIQJbrTIwqCkJDOE0
	 5moUzqPTN5bRnfZ/ZcvEx3OgNaZD9BuG+Gqz0H0IWlgqSlmKe9O0GSCZIz/wypmZlM
	 v0Z2lY0xhWYP2oEHUacB3Qkz/LR74JvqSDikxZJo+QhzJfW0eCQYx8f25sq4mCl7gq
	 1y4H5GjFWKFzxdW7eM3XwkJFVck6+lGlDnAre5U+bB2S6zoEZaE8D5dAOwbS2Wbcpq
	 Cj8jyyofYjaFNK8aNW0Od6rXOqJZFhXqBKSIt1nhTO2Ce0U7g0Opk3PZb2iDVCYfEi
	 sfYEcSSECYp6g==
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>, 
    Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    alex.bennee@linaro.org
Subject: Re: [PATCH V3 18/23] xen/dm: Introduce xendevicemodel_set_irq_level
 DM op
In-Reply-To: <1606732298-22107-19-git-send-email-olekstysh@gmail.com>
Message-ID: <alpine.DEB.2.21.2012091802240.20986@sstabellini-ThinkPad-T480s>
References: <1606732298-22107-1-git-send-email-olekstysh@gmail.com> <1606732298-22107-19-git-send-email-olekstysh@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 30 Nov 2020, Oleksandr Tyshchenko wrote:
> From: Julien Grall <julien.grall@arm.com>
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
> Signed-off-by: Julien Grall <julien.grall@arm.com>
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> ---
> Please note, this is a split/cleanup/hardening of Julien's PoC:
> "Add support for Guest IO forwarding to a device emulator"
> 
> ***
> Please note, I left interface untouched since there is still
> an open discussion what interface to use/what information to pass
> to the hypervisor. The question whether we should abstract away
> the state of the line or not.
> ***

Let's start with a simple question: is this going to work with
virtio-mmio emulation in QEMU that doesn't lower the state of the line
to end the notification (only calls qemu_set_irq(irq, high))?

See: hw/virtio/virtio-mmio.c:virtio_mmio_update_irq


Alex (CC'ed) might be able to confirm whether I am reading the QEMU code
correctly. Assuming that it is true that QEMU is only raising the level,
never lowering it, although the emulation is obviously not correct, I
would rather keep QEMU as is for efficiency reasons, and because we
don't want to deviate from the common implementation in QEMU.


Looking at this patch and at vgic_inject_irq, yes, I think it would
work as is.


So it looks like we are going to end up with an interface that:

- in theory it is modelling the line closely
- in practice it is only called to "trigger the IRQ"


Hence my preference for being explicit about it and just call it
trigger_irq.

If we keep the patch as is, should we at least add a comment to document
the "QEMU style" use model?


> Changes RFC -> V1:
>    - check incoming parameters in arch_dm_op()
>    - add explicit padding to struct xen_dm_op_set_irq_level
> 
> Changes V1 -> V2:
>    - update the author of a patch
>    - update patch description
>    - check that padding is always 0
>    - mention that interface is Arm only and only SPIs are
>      supported for now
>    - allow to set the logical level of a line for non-allocated
>      interrupts only
>    - add xen_dm_op_set_irq_level_t
> 
> Changes V2 -> V3:
>    - no changes
> ---
> ---
>  tools/include/xendevicemodel.h               |  4 ++
>  tools/libs/devicemodel/core.c                | 18 +++++++++
>  tools/libs/devicemodel/libxendevicemodel.map |  1 +
>  xen/arch/arm/dm.c                            | 57 +++++++++++++++++++++++++++-
>  xen/common/dm.c                              |  1 +
>  xen/include/public/hvm/dm_op.h               | 16 ++++++++
>  6 files changed, 96 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/include/xendevicemodel.h b/tools/include/xendevicemodel.h
> index e877f5c..c06b3c8 100644
> --- a/tools/include/xendevicemodel.h
> +++ b/tools/include/xendevicemodel.h
> @@ -209,6 +209,10 @@ int xendevicemodel_set_isa_irq_level(
>      xendevicemodel_handle *dmod, domid_t domid, uint8_t irq,
>      unsigned int level);
>  
> +int xendevicemodel_set_irq_level(
> +    xendevicemodel_handle *dmod, domid_t domid, unsigned int irq,
> +    unsigned int level);
> +
>  /**
>   * This function maps a PCI INTx line to a an IRQ line.
>   *
> diff --git a/tools/libs/devicemodel/core.c b/tools/libs/devicemodel/core.c
> index 4d40639..30bd79f 100644
> --- a/tools/libs/devicemodel/core.c
> +++ b/tools/libs/devicemodel/core.c
> @@ -430,6 +430,24 @@ int xendevicemodel_set_isa_irq_level(
>      return xendevicemodel_op(dmod, domid, 1, &op, sizeof(op));
>  }
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
>  int xendevicemodel_set_pci_link_route(
>      xendevicemodel_handle *dmod, domid_t domid, uint8_t link, uint8_t irq)
>  {
> diff --git a/tools/libs/devicemodel/libxendevicemodel.map b/tools/libs/devicemodel/libxendevicemodel.map
> index 561c62d..a0c3012 100644
> --- a/tools/libs/devicemodel/libxendevicemodel.map
> +++ b/tools/libs/devicemodel/libxendevicemodel.map
> @@ -32,6 +32,7 @@ VERS_1.2 {
>  	global:
>  		xendevicemodel_relocate_memory;
>  		xendevicemodel_pin_memory_cacheattr;
> +		xendevicemodel_set_irq_level;
>  } VERS_1.1;
>  
>  VERS_1.3 {
> diff --git a/xen/arch/arm/dm.c b/xen/arch/arm/dm.c
> index 5d3da37..e4bb233 100644
> --- a/xen/arch/arm/dm.c
> +++ b/xen/arch/arm/dm.c
> @@ -17,10 +17,65 @@
>  #include <xen/dm.h>
>  #include <xen/hypercall.h>
>  
> +#include <asm/vgic.h>
> +
>  int arch_dm_op(struct xen_dm_op *op, struct domain *d,
>                 const struct dmop_args *op_args, bool *const_op)
>  {
> -    return -EOPNOTSUPP;
> +    int rc;
> +
> +    switch ( op->op )
> +    {
> +    case XEN_DMOP_set_irq_level:
> +    {
> +        const struct xen_dm_op_set_irq_level *data =
> +            &op->u.set_irq_level;
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
> +        rc = -EOPNOTSUPP;
> +        break;
> +    }
> +
> +    return rc;
>  }
>  
>  /*
> diff --git a/xen/common/dm.c b/xen/common/dm.c
> index 9d394fc..7bfb46c 100644
> --- a/xen/common/dm.c
> +++ b/xen/common/dm.c
> @@ -48,6 +48,7 @@ static int dm_op(const struct dmop_args *op_args)
>          [XEN_DMOP_remote_shutdown]                  = sizeof(struct xen_dm_op_remote_shutdown),
>          [XEN_DMOP_relocate_memory]                  = sizeof(struct xen_dm_op_relocate_memory),
>          [XEN_DMOP_pin_memory_cacheattr]             = sizeof(struct xen_dm_op_pin_memory_cacheattr),
> +        [XEN_DMOP_set_irq_level]                    = sizeof(struct xen_dm_op_set_irq_level),
>      };
>  
>      rc = rcu_lock_remote_domain_by_id(op_args->domid, &d);
> diff --git a/xen/include/public/hvm/dm_op.h b/xen/include/public/hvm/dm_op.h
> index 66cae1a..1f70d58 100644
> --- a/xen/include/public/hvm/dm_op.h
> +++ b/xen/include/public/hvm/dm_op.h
> @@ -434,6 +434,21 @@ struct xen_dm_op_pin_memory_cacheattr {
>  };
>  typedef struct xen_dm_op_pin_memory_cacheattr xen_dm_op_pin_memory_cacheattr_t;
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
>  struct xen_dm_op {
>      uint32_t op;
>      uint32_t pad;
> @@ -447,6 +462,7 @@ struct xen_dm_op {
>          xen_dm_op_track_dirty_vram_t track_dirty_vram;
>          xen_dm_op_set_pci_intx_level_t set_pci_intx_level;
>          xen_dm_op_set_isa_irq_level_t set_isa_irq_level;
> +        xen_dm_op_set_irq_level_t set_irq_level;
>          xen_dm_op_set_pci_link_route_t set_pci_link_route;
>          xen_dm_op_modified_memory_t modified_memory;
>          xen_dm_op_set_mem_type_t set_mem_type;
> -- 
> 2.7.4
> 

