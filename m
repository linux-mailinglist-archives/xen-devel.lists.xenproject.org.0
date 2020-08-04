Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 311A123C22B
	for <lists+xen-devel@lfdr.de>; Wed,  5 Aug 2020 01:23:19 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k36GY-0001ge-7l; Tue, 04 Aug 2020 23:22:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gGWh=BO=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1k36GW-0001gY-9b
 for xen-devel@lists.xenproject.org; Tue, 04 Aug 2020 23:22:40 +0000
X-Inumbo-ID: 2af5228c-9e89-43d0-81ed-fff943d236dd
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2af5228c-9e89-43d0-81ed-fff943d236dd;
 Tue, 04 Aug 2020 23:22:39 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AF0A82073E;
 Tue,  4 Aug 2020 23:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596583359;
 bh=O5lobv7IQQbkINSkzdl2ELQpbr6+hMPYTclAIKLSEKA=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=zGTQeKo6Z2x/OUqg4XVeqCGyRyc2VYjG6V1g9d8FzHjNnLSV6GyUA5xMyXEnBL4VV
 zT6gM1WiKUT7K/I4v48HMnpylxptw/IVekdr1MsuwyDxWvQuo5L1P/JbNg9/sM6e33
 INISlgG3pZ7iv5SKdOgdMgX0RLKAV3j4IBXS1dFk=
Date: Tue, 4 Aug 2020 16:22:38 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
Subject: Re: [RFC PATCH V1 05/12] hvm/dm: Introduce
 xendevicemodel_set_irq_level DM op
In-Reply-To: <1596478888-23030-6-git-send-email-olekstysh@gmail.com>
Message-ID: <alpine.DEB.2.21.2008041358150.5748@sstabellini-ThinkPad-T480s>
References: <1596478888-23030-1-git-send-email-olekstysh@gmail.com>
 <1596478888-23030-6-git-send-email-olekstysh@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, 3 Aug 2020, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> This patch adds ability to the device emulator to notify otherend
> (some entity running in the guest) using a SPI and implements Arm
> specific bits for it. Proposed interface allows emulator to set
> the logical level of a one of a domain's IRQ lines.
> 
> Please note, this is a split/cleanup of Julien's PoC:
> "Add support for Guest IO forwarding to a device emulator"
> 
> Signed-off-by: Julien Grall <julien.grall@arm.com>
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> ---
>  tools/libs/devicemodel/core.c                   | 18 ++++++++++++++++++
>  tools/libs/devicemodel/include/xendevicemodel.h |  4 ++++
>  tools/libs/devicemodel/libxendevicemodel.map    |  1 +
>  xen/arch/arm/dm.c                               | 22 +++++++++++++++++++++-
>  xen/common/hvm/dm.c                             |  1 +
>  xen/include/public/hvm/dm_op.h                  | 15 +++++++++++++++
>  6 files changed, 60 insertions(+), 1 deletion(-)
> 
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

It is a pity that having xen_dm_op_set_pci_intx_level and
xen_dm_op_set_isa_irq_level already we need to add a third one, but from
the names alone I don't think we can reuse either of them.

It is very similar to set_isa_irq_level. We could almost rename
xendevicemodel_set_isa_irq_level to xendevicemodel_set_irq_level or,
better, just add an alias to it so that xendevicemodel_set_irq_level is
implemented by calling xendevicemodel_set_isa_irq_level. Honestly I am
not sure if it is worth doing it though. Any other opinions?


But I think we should plan for not needing two calls (one to set level
to 1, and one to set it to 0):
https://marc.info/?l=xen-devel&m=159535112027405


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
> diff --git a/tools/libs/devicemodel/include/xendevicemodel.h b/tools/libs/devicemodel/include/xendevicemodel.h
> index e877f5c..c06b3c8 100644
> --- a/tools/libs/devicemodel/include/xendevicemodel.h
> +++ b/tools/libs/devicemodel/include/xendevicemodel.h
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
> index 2437099..8431805 100644
> --- a/xen/arch/arm/dm.c
> +++ b/xen/arch/arm/dm.c
> @@ -20,7 +20,27 @@
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
> +
> +        /* XXX: Handle check */
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
> diff --git a/xen/common/hvm/dm.c b/xen/common/hvm/dm.c
> index 09e9542..e2e1250 100644
> --- a/xen/common/hvm/dm.c
> +++ b/xen/common/hvm/dm.c
> @@ -47,6 +47,7 @@ static int dm_op(const struct dmop_args *op_args)
>          [XEN_DMOP_remote_shutdown]                  = sizeof(struct xen_dm_op_remote_shutdown),
>          [XEN_DMOP_relocate_memory]                  = sizeof(struct xen_dm_op_relocate_memory),
>          [XEN_DMOP_pin_memory_cacheattr]             = sizeof(struct xen_dm_op_pin_memory_cacheattr),
> +        [XEN_DMOP_set_irq_level]                    = sizeof(struct xen_dm_op_set_irq_level),
>      };
>  
>      rc = rcu_lock_remote_domain_by_id(op_args->domid, &d);
> diff --git a/xen/include/public/hvm/dm_op.h b/xen/include/public/hvm/dm_op.h
> index fd00e9d..c45d29e 100644
> --- a/xen/include/public/hvm/dm_op.h
> +++ b/xen/include/public/hvm/dm_op.h
> @@ -417,6 +417,20 @@ struct xen_dm_op_pin_memory_cacheattr {
>      uint32_t pad;
>  };
>  
> +/*
> + * XEN_DMOP_set_irq_level: Set the logical level of a one of a domain's
> + *                         IRQ lines.
> + * XXX Handle PPIs.
> + */
> +#define XEN_DMOP_set_irq_level 19
> +
> +struct xen_dm_op_set_irq_level {
> +    uint32_t irq;
> +    /* IN - Level: 0 -> deasserted, 1 -> asserted */
> +    uint8_t  level;
> +};
> +
> +
>  struct xen_dm_op {
>      uint32_t op;
>      uint32_t pad;
> @@ -430,6 +444,7 @@ struct xen_dm_op {
>          struct xen_dm_op_track_dirty_vram track_dirty_vram;
>          struct xen_dm_op_set_pci_intx_level set_pci_intx_level;
>          struct xen_dm_op_set_isa_irq_level set_isa_irq_level;
> +        struct xen_dm_op_set_irq_level set_irq_level;
>          struct xen_dm_op_set_pci_link_route set_pci_link_route;
>          struct xen_dm_op_modified_memory modified_memory;
>          struct xen_dm_op_set_mem_type set_mem_type;
> -- 
> 2.7.4
> 

