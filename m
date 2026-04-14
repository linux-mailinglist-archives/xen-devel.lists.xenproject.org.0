Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Ji6GJmi3mlYGwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2026 22:24:57 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1735B3FE56C
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2026 22:24:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1282083.1564777 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCkJS-0005rw-J5; Tue, 14 Apr 2026 20:24:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1282083.1564777; Tue, 14 Apr 2026 20:24:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCkJS-0005oQ-Fi; Tue, 14 Apr 2026 20:24:46 +0000
Received: by outflank-mailman (input) for mailman id 1282083;
 Tue, 14 Apr 2026 20:24:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1wCkJQ-0005mB-Nd
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2026 20:24:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1wCkJQ-001nTb-1F;
 Tue, 14 Apr 2026 20:24:44 +0000
Received: from [2a02:8012:3a1:0:6452:fdce:8dbd:9a39]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1wCkJQ-0036wi-0F;
 Tue, 14 Apr 2026 20:24:44 +0000
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
	bh=y9Jy5pZT/zSrlNnVBifWKpQNbFOCzie1g4ZvyNRLRHY=; b=qE6DT/azrqQnsOwGlseeR9+lKy
	jB8R93UfI8s5smLGSC5n65lXfAKmdZ8uOiZMfcKqYbUkrnp2QN7JfVZ8ijL6dBxkPpDL2jz8gJdCQ
	0CSrpri/qlWvjdxHhQj/u+1XemFdJ2TD416WpBvzeluY1SQX4U77PUq6fzrEYLmKwuBY=;
Message-ID: <1dcec397-a265-4972-8f2c-fd10c6e0b6ad@xen.org>
Date: Tue, 14 Apr 2026 16:09:33 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/23] xen/arm: vsmmuv3: Add dummy support for virtual
 SMMUv3 for guests
Content-Language: en-GB
To: Milan Djokic <milan_djokic@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>
References: <cover.1774918270.git.milan_djokic@epam.com>
 <97aa20fdcec324bb58c6869ddcba5fcf29bf75b3.1774918270.git.milan_djokic@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <97aa20fdcec324bb58c6869ddcba5fcf29bf75b3.1774918270.git.milan_djokic@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[xen.org:s=20200302mail];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xen.org:dkim,xen.org:mid];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:milan_djokic@epam.com,m:xen-devel@lists.xenproject.org,m:rahul.singh@arm.com,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:jbeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
	DMARC_NA(0.00)[xen.org];
	FORGED_SENDER(0.00)[julien@xen.org,xen-devel-bounces@lists.xenproject.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[xen.org:+];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[julien@xen.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1735B3FE56C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Milan,

On 31/03/2026 10:52, Milan Djokic wrote:
> From: Rahul Singh <rahul.singh@arm.com>
> 
> domain_viommu_init() will be called during domain creation and will add
> the dummy trap handler for virtual IOMMUs for guests.
> 
> A host IOMMU list will be created when host IOMMU devices are probed
> and this list will be used to create the IOMMU device tree node for
> dom0. For dom0, 1-1 mapping will be established between vIOMMU in dom0
> and physical IOMMU.
> 
> For domUs, the 1-N mapping will be established between domU and physical
> IOMMUs. A new area has been reserved in the arm guest physical map at
> which the emulated vIOMMU node is created in the device tree.
> 
> Also set the vIOMMU type to vSMMUv3 to enable vIOMMU framework to call
> vSMMUv3 domain creation/destroy functions.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> Signed-off-by: Milan Djokic <milan_djokic@epam.com>
> ---
>   xen/arch/arm/domain.c                  |   3 +-
>   xen/arch/arm/include/asm/domain.h      |   4 +
>   xen/arch/arm/include/asm/viommu.h      |  20 ++++
>   xen/drivers/passthrough/Kconfig        |   8 ++
>   xen/drivers/passthrough/arm/Makefile   |   1 +
>   xen/drivers/passthrough/arm/smmu-v3.c  |   7 ++
>   xen/drivers/passthrough/arm/viommu.c   |  30 ++++++
>   xen/drivers/passthrough/arm/vsmmu-v3.c | 124 +++++++++++++++++++++++++
>   xen/drivers/passthrough/arm/vsmmu-v3.h |  20 ++++
>   xen/include/public/arch-arm.h          |   7 +-
>   10 files changed, 222 insertions(+), 2 deletions(-)
>   create mode 100644 xen/drivers/passthrough/arm/vsmmu-v3.c
>   create mode 100644 xen/drivers/passthrough/arm/vsmmu-v3.h
> 
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 241f87386b..b982d79b3b 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -643,7 +643,8 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>           return -EINVAL;
>       }
>   
> -    if ( config->arch.viommu_type != XEN_DOMCTL_CONFIG_VIOMMU_NONE )
> +    if ( config->arch.viommu_type != XEN_DOMCTL_CONFIG_VIOMMU_NONE &&
> +         config->arch.viommu_type != viommu_get_type() )
>       {
>           dprintk(XENLOG_INFO,
>                   "vIOMMU type requested not supported by the platform or Xen\n");
> diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
> index 758ad807e4..61108d0068 100644
> --- a/xen/arch/arm/include/asm/domain.h
> +++ b/xen/arch/arm/include/asm/domain.h
> @@ -126,6 +126,10 @@ struct arch_domain
>       void *sci_data;
>   #endif
>   
> +#ifdef CONFIG_ARM_VIRTUAL_IOMMU
> +    struct list_head viommu_list;     /* List of virtual IOMMUs */
> +#endif
> +
>   }  __cacheline_aligned;
>   
>   struct arch_vcpu
> diff --git a/xen/arch/arm/include/asm/viommu.h b/xen/arch/arm/include/asm/viommu.h
> index 4598f543b8..2a6742de73 100644
> --- a/xen/arch/arm/include/asm/viommu.h
> +++ b/xen/arch/arm/include/asm/viommu.h
> @@ -5,9 +5,21 @@
>   #ifdef CONFIG_ARM_VIRTUAL_IOMMU
>   
>   #include <xen/lib.h>
> +#include <xen/list.h>
>   #include <xen/types.h>
>   #include <public/xen.h>
>   
> +extern struct list_head host_iommu_list;
> +
> +/* data structure for each hardware IOMMU */
> +struct host_iommu {
> +    struct list_head entry;
> +    const struct dt_device_node *dt_node;
> +    paddr_t addr;
> +    paddr_t size;
> +    uint32_t irq;

You don't seem to use ``irq`` in this patch. What is this meant to be 
used for?

> +};
> +
>   struct viommu_ops {
>       /*
>        * Called during domain construction if toolstack requests to enable
> @@ -35,6 +47,8 @@ struct viommu_desc {
>   int domain_viommu_init(struct domain *d, uint16_t viommu_type);
>   int viommu_relinquish_resources(struct domain *d);
>   uint16_t viommu_get_type(void);
> +void add_to_host_iommu_list(paddr_t addr, paddr_t size,
> +                            const struct dt_device_node *node);
>   
>   #else
>   
> @@ -56,6 +70,12 @@ static inline int viommu_relinquish_resources(struct domain *d)
>       return 0;
>   }
>   
> +static inline void add_to_host_iommu_list(paddr_t addr, paddr_t size,
> +                                          const struct dt_device_node *node)
> +{
> +    return;
> +}
> +
>   #endif /* CONFIG_ARM_VIRTUAL_IOMMU */
>   
>   #endif /* __ARCH_ARM_VIOMMU_H__ */
> diff --git a/xen/drivers/passthrough/Kconfig b/xen/drivers/passthrough/Kconfig
> index 3c174bc87b..9c48e7415e 100644
> --- a/xen/drivers/passthrough/Kconfig
> +++ b/xen/drivers/passthrough/Kconfig
> @@ -40,6 +40,14 @@ config ARM_VIRTUAL_IOMMU
>   	help
>   	 Support virtual IOMMU infrastructure to implement vIOMMU.
>   
> +config VIRTUAL_ARM_SMMU_V3
> +	bool "ARM Ltd. Virtual SMMUv3 Support (UNSUPPORTED)"
> +	depends on ARM_SMMU_V3 && ARM_VIRTUAL_IOMMU
> +	help
> +	 Support for implementations of the virtual ARM System MMU architecture
> +	 version 3. Virtual SMMUv3 is unsupported feature and should not be used
> +	 in production.
> +
>   endif
>   
>   config AMD_IOMMU
> diff --git a/xen/drivers/passthrough/arm/Makefile b/xen/drivers/passthrough/arm/Makefile
> index c3783188e3..c8f0a5f802 100644
> --- a/xen/drivers/passthrough/arm/Makefile
> +++ b/xen/drivers/passthrough/arm/Makefile
> @@ -3,3 +3,4 @@ obj-$(CONFIG_ARM_SMMU) += smmu.o
>   obj-$(CONFIG_IPMMU_VMSA) += ipmmu-vmsa.o
>   obj-$(CONFIG_ARM_SMMU_V3) += smmu-v3.o
>   obj-$(CONFIG_ARM_VIRTUAL_IOMMU) += viommu.o
> +obj-$(CONFIG_VIRTUAL_ARM_SMMU_V3) += vsmmu-v3.o
> diff --git a/xen/drivers/passthrough/arm/smmu-v3.c b/xen/drivers/passthrough/arm/smmu-v3.c
> index 19e55b6c9b..87612df21d 100644
> --- a/xen/drivers/passthrough/arm/smmu-v3.c
> +++ b/xen/drivers/passthrough/arm/smmu-v3.c
> @@ -93,6 +93,7 @@
>   #include <asm/platform.h>
>   
>   #include "smmu-v3.h"
> +#include "vsmmu-v3.h"
>   
>   #define ARM_SMMU_VTCR_SH_IS		3
>   #define ARM_SMMU_VTCR_RGN_WBWA		1
> @@ -2727,6 +2728,9 @@ static int __init arm_smmu_device_probe(struct platform_device *pdev)
>   	list_add(&smmu->devices, &arm_smmu_devices);
>   	spin_unlock(&arm_smmu_devices_lock);
>   
> +    /* Add to host IOMMU list to initialize vIOMMU for dom0 */

The indentation looks odd. Is this correctly aligned?

> +	add_to_host_iommu_list(ioaddr, iosize, dev_to_dt(pdev));
> +
>   	return 0;
>   
>   
> @@ -3058,6 +3062,9 @@ static __init int arm_smmu_dt_init(struct dt_device_node *dev,
>   
>   	platform_features &= smmu->features;
>   
> +	/* Set vIOMMU type to SMMUv3 */
> +	vsmmuv3_set_type();
> +
>   	return 0;
>   }
>   
> diff --git a/xen/drivers/passthrough/arm/viommu.c b/xen/drivers/passthrough/arm/viommu.c
> index 7ab6061e34..53ae46349a 100644
> --- a/xen/drivers/passthrough/arm/viommu.c
> +++ b/xen/drivers/passthrough/arm/viommu.c
> @@ -2,12 +2,42 @@
>   
>   #include <xen/errno.h>
>   #include <xen/init.h>
> +#include <xen/irq.h>
>   #include <xen/types.h>
>   
>   #include <asm/viommu.h>
>   
> +/* List of all host IOMMUs */
> +LIST_HEAD(host_iommu_list);

I don't quite follow why this is part of the common code. That said, why 
do we need to register the host IOMMU? Wouldn't it be simpler to go 
through the list of pIOMMU in the vSMMU v3 implementation?

> +
>   const struct viommu_desc __read_mostly *cur_viommu;
>   
> +/* Common function for adding to host_iommu_list */
> +void add_to_host_iommu_list(paddr_t addr, paddr_t size,
> +                            const struct dt_device_node *node)

Is this supposed to only be called during __init? If so, this will help 
to justify the ...

> +{
> +    struct host_iommu *iommu_data;
> +
> +    iommu_data = xzalloc(struct host_iommu);
> +    if ( !iommu_data )
> +        panic("vIOMMU: Cannot allocate memory for host IOMMU data\n");

... panic(). If not, then this function needs to return an error.

> +
> +    iommu_data->addr = addr;
> +    iommu_data->size = size;
> +    iommu_data->dt_node = node;
> +    iommu_data->irq = platform_get_irq(node, 0);
> +    if ( iommu_data->irq < 0 )
> +    {
> +        gdprintk(XENLOG_ERR,
> +                 "vIOMMU: Cannot find a valid IOMMU irq\n");

Shouldn't you free the allocated memory? That said, why is it ok to 
ignore the vIOMMU in this case?

> +        return;
> +    }
> +
> +    printk("vIOMMU: Found IOMMU @0x%"PRIx64"\n", addr);
> +
> +    list_add_tail(&iommu_data->entry, &host_iommu_list);
> +}
> +
>   int domain_viommu_init(struct domain *d, uint16_t viommu_type)
>   {
>       if ( viommu_type == XEN_DOMCTL_CONFIG_VIOMMU_NONE )
> diff --git a/xen/drivers/passthrough/arm/vsmmu-v3.c b/xen/drivers/passthrough/arm/vsmmu-v3.c
> new file mode 100644
> index 0000000000..6b4009e5ef
> --- /dev/null
> +++ b/xen/drivers/passthrough/arm/vsmmu-v3.c
> @@ -0,0 +1,124 @@
> +/* SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause) */
> +
> +#include <xen/param.h>
> +#include <xen/sched.h>
> +#include <asm/mmio.h>
> +#include <asm/viommu.h>
> +
> +/* Struct to hold the vIOMMU ops and vIOMMU type */
> +extern const struct viommu_desc __read_mostly *cur_viommu;

Why is this defined in the C file? Shouldn't this be defined in 
``viomum.h``? That said, looking at the use, I think we want to 
introduce a helper to set the cur_viommu and not export ``cur_viommu``.

> +
> +struct virt_smmu {
> +    struct      domain *d;
> +    struct      list_head viommu_list;
> +};
> +
> +static int vsmmuv3_mmio_write(struct vcpu *v, mmio_info_t *info,
> +                              register_t r, void *priv)
> +{
> +    return IO_HANDLED;
> +}
> +
> +static int vsmmuv3_mmio_read(struct vcpu *v, mmio_info_t *info,
> +                             register_t *r, void *priv)
> +{
> +    return IO_HANDLED;
> +}

I undertand that both helpers are meant to be updated in a later patch. 
However, I think it makes quite difficult to know whether the code is 
complete by the end of the series. I would strongly recommend adding 
'BUG_ON("unimplemented");' so we can easily grep whether there is 
anything missing by the end.

> +
> +static const struct mmio_handler_ops vsmmuv3_mmio_handler = {
> +    .read  = vsmmuv3_mmio_read,
> +    .write = vsmmuv3_mmio_write,
> +};
> +
> +static int vsmmuv3_init_single(struct domain *d, paddr_t addr, paddr_t size)
> +{
> +    struct virt_smmu *smmu;
> +
> +    smmu = xzalloc(struct virt_smmu);
> +    if ( !smmu )
> +        return -ENOMEM;
> +
> +    smmu->d = d;
> +
> +    register_mmio_handler(d, &vsmmuv3_mmio_handler, addr, size, smmu);

I can't seem to find a place where the number of handler supported is 
incremented (see domain_io_init()) for the vIOMMU. Are you sure we 
always have enough space today?

> +
> +    /* Register the vIOMMU to be able to clean it up later. */
> +    list_add_tail(&smmu->viommu_list, &d->arch.viommu_list);
> +
> +    return 0;
> +}
> +
> +int domain_vsmmuv3_init(struct domain *d)
> +{
> +    int ret;

Coding style: newline missing.

> +    INIT_LIST_HEAD(&d->arch.viommu_list);
> +
> +    if ( is_hardware_domain(d) )
> +    {
> +        struct host_iommu *hw_iommu;
> +
> +        list_for_each_entry(hw_iommu, &host_iommu_list, entry)
> +        {
> +            ret = vsmmuv3_init_single(d, hw_iommu->addr, hw_iommu->size);
> +            if ( ret )
> +                return ret;
> +        }
> +    }
> +    else
> +    {
> +        ret = vsmmuv3_init_single(d, GUEST_VSMMUV3_BASE, GUEST_VSMMUV3_SIZE);
> +        if ( ret )
> +            return ret;
> +    }
> +
> +    return 0;
> +}
> +
> +int vsmmuv3_relinquish_resources(struct domain *d)
> +{
> +    struct virt_smmu *pos, *temp;
> +
> +    /* Cope with unitialized vIOMMU */
> +    if ( list_head_is_null(&d->arch.viommu_list) )
> +        return 0;
> +
> +    list_for_each_entry_safe(pos, temp, &d->arch.viommu_list, viommu_list )
> +    {
> +        list_del(&pos->viommu_list);
> +        xfree(pos);
> +    }
> +
> +    return 0;
> +}
> +
> +static const struct viommu_ops vsmmuv3_ops = {
> +    .domain_init = domain_vsmmuv3_init,
> +    .relinquish_resources = vsmmuv3_relinquish_resources,
> +};
> +
> +static const struct viommu_desc vsmmuv3_desc = {
> +    .ops = &vsmmuv3_ops,
> +    .viommu_type = XEN_DOMCTL_CONFIG_VIOMMU_SMMUV3,
> +};
> +
> +void __init vsmmuv3_set_type(void)
> +{
> +    const struct viommu_desc *desc = &vsmmuv3_desc;
> +
> +    if ( cur_viommu && (cur_viommu != desc) )
> +    {
> +        printk("WARNING: Cannot set vIOMMU, already set to a different value\n");
> +        return;
> +    }
> +
> +    cur_viommu = desc;
> +}
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/drivers/passthrough/arm/vsmmu-v3.h b/xen/drivers/passthrough/arm/vsmmu-v3.h
> new file mode 100644
> index 0000000000..e11f85b431
> --- /dev/null
> +++ b/xen/drivers/passthrough/arm/vsmmu-v3.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause) */
> +#ifndef __ARCH_ARM_VSMMU_V3_H__
> +#define __ARCH_ARM_VSMMU_V3_H__
> +
> +#include <asm/viommu.h>
> +
> +#ifdef CONFIG_VIRTUAL_ARM_SMMU_V3
> +
> +void vsmmuv3_set_type(void);
> +
> +#else
> +
> +static inline void vsmmuv3_set_type(void)
> +{
> +    return;
> +}
> +
> +#endif /* CONFIG_VIRTUAL_ARM_SMMU_V3 */
> +
> +#endif /* __ARCH_ARM_VSMMU_V3_H__ */
> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
> index d4953d40fd..ebac02ed63 100644
> --- a/xen/include/public/arch-arm.h
> +++ b/xen/include/public/arch-arm.h
> @@ -330,7 +330,8 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
>   #define XEN_DOMCTL_CONFIG_ARM_SCI_NONE      0
>   #define XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC  1
>   
> -#define XEN_DOMCTL_CONFIG_VIOMMU_NONE   0
> +#define XEN_DOMCTL_CONFIG_VIOMMU_NONE       0

I am generally against trying to align values because this is just 
introducing unnecessary churn in the code.

> +#define XEN_DOMCTL_CONFIG_VIOMMU_SMMUV3     1
>   
>   struct xen_arch_domainconfig {
>       /* IN/OUT */
> @@ -456,6 +457,10 @@ typedef uint64_t xen_callback_t;
>   #define GUEST_GICV3_GICR0_BASE     xen_mk_ullong(0x03020000) /* vCPU0..127 */
>   #define GUEST_GICV3_GICR0_SIZE     xen_mk_ullong(0x01000000)
>   
> +/* vsmmuv3 ITS mappings */

What is ITS stand for in this context?

> +#define GUEST_VSMMUV3_BASE     xen_mk_ullong(0x04040000)
> +#define GUEST_VSMMUV3_SIZE     xen_mk_ullong(0x00040000)

If I am not mistaken, you are reserving 256KiB. However, looking at the 
SMMU spec (section 6.1, ARM IHI 0070 H.a), the minimum is 128 KiB. Are 
you intending to expose additional features?

> +
>   /*
>    * 256 MB is reserved for VPCI configuration space based on calculation
>    * 256 buses x 32 devices x 8 functions x 4 KB = 256 MB

Cheers,

-- 
Julien Grall


