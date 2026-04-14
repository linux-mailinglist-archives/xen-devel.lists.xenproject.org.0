Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oOkvAJGi3mkeGwAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2026 22:24:49 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5253FE55E
	for <lists+xen-devel@lfdr.de>; Tue, 14 Apr 2026 22:24:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1282080.1564760 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCkJF-0005Ga-W7; Tue, 14 Apr 2026 20:24:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1282080.1564760; Tue, 14 Apr 2026 20:24:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wCkJF-0005DV-Sl; Tue, 14 Apr 2026 20:24:33 +0000
Received: by outflank-mailman (input) for mailman id 1282080;
 Tue, 14 Apr 2026 20:24:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1wCkJF-0005CU-8n
 for xen-devel@lists.xenproject.org; Tue, 14 Apr 2026 20:24:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1wCkJE-001nT3-26;
 Tue, 14 Apr 2026 20:24:32 +0000
Received: from [2a02:8012:3a1:0:6452:fdce:8dbd:9a39]
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1wCkJE-0036wi-1I;
 Tue, 14 Apr 2026 20:24:32 +0000
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
	bh=hvfc6WY0pbSdLS2SJLE1D/glK/FsO9Y9J36uU8Z+6EY=; b=5VltWaQYTRHArNRQXpNj+qjEJJ
	HbSV/AXBfcZhwczUsUmhAv7f6ST+rdx1obUA1X9sc86DgII0rLppdPQRiAsUeQ5z57oKg1ABmJrmi
	p79pLpggf2RT4ei+vc/G88LWPiU4OdOBwgA1lUFJKB9sGIy+tIRtFs4ZL4JOnag1Dg5A=;
Message-ID: <8cb4ca97-e605-4416-b532-a8df4816a0ee@xen.org>
Date: Tue, 14 Apr 2026 15:15:38 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/23] xen/arm: vIOMMU: add generic vIOMMU framework
Content-Language: en-GB
To: Milan Djokic <milan_djokic@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Rahul Singh <rahul.singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <cover.1774918270.git.milan_djokic@epam.com>
 <c12f84b9306a2b74a555c710f21f5362120205ed.1774918270.git.milan_djokic@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <c12f84b9306a2b74a555c710f21f5362120205ed.1774918270.git.milan_djokic@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.69 / 15.00];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[xen.org:s=20200302mail];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xen.org:dkim,xen.org:mid];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:milan_djokic@epam.com,m:xen-devel@lists.xenproject.org,m:rahul.singh@arm.com,m:sstabellini@kernel.org,m:bertrand.marquis@arm.com,m:michal.orzel@amd.com,m:Volodymyr_Babchuk@epam.com,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:roger.pau@citrix.com,s:lists@lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CB5253FE55E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Milan,

On 31/03/2026 10:52, Milan Djokic wrote:
> From: Rahul Singh <rahul.singh@arm.com>
> 
> This patch adds basic framework for vIOMMU.
> 
> Signed-off-by: Rahul Singh <rahul.singh@arm.com>
> Signed-off-by: Milan Djokic <milan_djokic@epam.com>
> ---
>   xen/arch/arm/dom0less-build.c        |  2 +
>   xen/arch/arm/domain.c                | 33 +++++++++++++
>   xen/arch/arm/domain_build.c          |  2 +
>   xen/arch/arm/include/asm/viommu.h    | 70 ++++++++++++++++++++++++++++
>   xen/drivers/passthrough/Kconfig      |  5 ++
>   xen/drivers/passthrough/arm/Makefile |  1 +
>   xen/drivers/passthrough/arm/viommu.c | 48 +++++++++++++++++++
>   xen/include/public/arch-arm.h        |  5 ++
>   xen/include/public/domctl.h          |  4 +-
>   9 files changed, 168 insertions(+), 2 deletions(-)
>   create mode 100644 xen/arch/arm/include/asm/viommu.h
>   create mode 100644 xen/drivers/passthrough/arm/viommu.c
> 
> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
> index 4181c10538..067835e5d0 100644
> --- a/xen/arch/arm/dom0less-build.c
> +++ b/xen/arch/arm/dom0less-build.c
> @@ -23,6 +23,7 @@
>   #include <asm/arm64/sve.h>
>   #include <asm/domain_build.h>
>   #include <asm/firmware/sci.h>
> +#include <asm/viommu.h>
>   #include <asm/grant_table.h>
>   #include <asm/setup.h>
>   
> @@ -317,6 +318,7 @@ int __init arch_parse_dom0less_node(struct dt_device_node *node,
>       uint32_t val;
>   
>       d_cfg->arch.gic_version = XEN_DOMCTL_CONFIG_GIC_NATIVE;
> +    d_cfg->arch.viommu_type = viommu_get_type();
>       d_cfg->flags |= XEN_DOMCTL_CDF_hvm | XEN_DOMCTL_CDF_hap;
>   
>       if ( domu_dt_sci_parse(node, d_cfg) )
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 94b9858ad2..241f87386b 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -28,6 +28,7 @@
>   #include <asm/tee/tee.h>
>   #include <asm/vfp.h>
>   #include <asm/vgic.h>
> +#include <asm/viommu.h>
>   #include <asm/vtimer.h>
>   
>   #include "vpci.h"
> @@ -550,6 +551,14 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>           return -EINVAL;
>       }
>   
> +    /* Check config structure padding */
> +    if ( config->arch.pad )
> +    {
> +        dprintk(XENLOG_INFO,
> +            "Invalid input config, padding must be zero\n");
> +        return -EINVAL;
> +    }
> +
>       /* Check feature flags */
>       if ( sve_vl_bits > 0 )
>       {
> @@ -626,6 +635,21 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>           return -EINVAL;
>       }
>   
> +    if ( !(config->flags & XEN_DOMCTL_CDF_iommu) &&
> +         config->arch.viommu_type != XEN_DOMCTL_CONFIG_VIOMMU_NONE )
> +    {
> +        dprintk(XENLOG_INFO,
> +                "vIOMMU requested while iommu not enabled for domain\n");
> +        return -EINVAL;
> +    }
> +
> +    if ( config->arch.viommu_type != XEN_DOMCTL_CONFIG_VIOMMU_NONE )
> +    {
> +        dprintk(XENLOG_INFO,
> +                "vIOMMU type requested not supported by the platform or Xen\n");
> +        return -EINVAL;
> +    }
> +
>       return sci_domain_sanitise_config(config);
>   }
>   
> @@ -721,6 +745,9 @@ int arch_domain_create(struct domain *d,
>       if ( (rc = sci_domain_init(d, config)) != 0 )
>           goto fail;
>   
> +    if ( (rc = domain_viommu_init(d, config->arch.viommu_type)) != 0 )
> +        goto fail;
> +
>       return 0;
>   
>   fail:
> @@ -965,6 +992,7 @@ enum {
>       PROG_pci = 1,
>       PROG_sci,
>       PROG_tee,
> +    PROG_viommu,

I am not entirely sure about the position. Is the intention to 
relinquish the viommu state *after* the devices are detached? If so, it 
would be better to move this call just after 'PROG_pci' and add a 
comment indicating the dependency.

>       PROG_xen,
>       PROG_page,
>       PROG_mapping,
> @@ -1021,6 +1049,11 @@ int domain_relinquish_resources(struct domain *d)
>           if (ret )
>               return ret;
>   
> +    PROGRESS(viommu):
> +        ret = viommu_relinquish_resources(d);
> +        if (ret )
> +            return ret;
> +
>       PROGRESS(xen):
>           ret = relinquish_memory(d, &d->xenpage_list);
>           if ( ret )
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index e8795745dd..a51563ee3d 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -35,6 +35,7 @@
>   #include <asm/arm64/sve.h>
>   #include <asm/cpufeature.h>
>   #include <asm/domain_build.h>
> +#include <asm/viommu.h>
>   #include <xen/event.h>
>   
>   #include <xen/irq.h>
> @@ -1946,6 +1947,7 @@ void __init create_dom0(void)
>       dom0_cfg.arch.nr_spis = vgic_def_nr_spis();
>       dom0_cfg.arch.tee_type = tee_get_type();
>       dom0_cfg.max_vcpus = dom0_max_vcpus();
> +    dom0_cfg.arch.viommu_type = viommu_get_type();
>   
>       if ( iommu_enabled )
>           dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
> diff --git a/xen/arch/arm/include/asm/viommu.h b/xen/arch/arm/include/asm/viommu.h
> new file mode 100644
> index 0000000000..4598f543b8
> --- /dev/null
> +++ b/xen/arch/arm/include/asm/viommu.h
> @@ -0,0 +1,70 @@
> +/* SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause) */
> +#ifndef __ARCH_ARM_VIOMMU_H__
> +#define __ARCH_ARM_VIOMMU_H__
> +
> +#ifdef CONFIG_ARM_VIRTUAL_IOMMU
> +
> +#include <xen/lib.h>
> +#include <xen/types.h>
> +#include <public/xen.h>
> +
> +struct viommu_ops {
> +    /*
> +     * Called during domain construction if toolstack requests to enable
> +     * vIOMMU support.
> +     */
> +    int (*domain_init)(struct domain *d);
> +
> +    /*
> +     * Called during domain destruction to free resources used by vIOMMU.
> +     */
> +    int (*relinquish_resources)(struct domain *d);
> +};
> +
> +struct viommu_desc {
> +    /* vIOMMU domains init/free operations described above. */
> +    const struct viommu_ops *ops;
> +
> +    /*
> +     * ID of vIOMMU. Corresponds to xen_arch_domainconfig.viommu_type.
> +     * Should be one of XEN_DOMCTL_CONFIG_VIOMMU_xxx
> +     */
> +    uint16_t viommu_type;

Below, you define viommu_type as 'uint8_t'. So shouldn't this also be 
'uint8_t'?

> +};
> +
> +int domain_viommu_init(struct domain *d, uint16_t viommu_type);
> +int viommu_relinquish_resources(struct domain *d);
> +uint16_t viommu_get_type(void);
> +
> +#else
> +
> +static inline uint8_t viommu_get_type(void)
> +{
> +    return XEN_DOMCTL_CONFIG_VIOMMU_NONE;
> +}
> +
> +static inline int domain_viommu_init(struct domain *d, uint16_t viommu_type)
> +{
> +    if ( likely(viommu_type == XEN_DOMCTL_CONFIG_VIOMMU_NONE) )
> +        return 0;
> +
> +    return -ENODEV;
> +}
> +
> +static inline int viommu_relinquish_resources(struct domain *d)
> +{
> +    return 0;
> +}
> +
> +#endif /* CONFIG_ARM_VIRTUAL_IOMMU */
> +
> +#endif /* __ARCH_ARM_VIOMMU_H__ */
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/drivers/passthrough/Kconfig b/xen/drivers/passthrough/Kconfig
> index b413c33a4c..3c174bc87b 100644
> --- a/xen/drivers/passthrough/Kconfig
> +++ b/xen/drivers/passthrough/Kconfig
> @@ -35,6 +35,11 @@ config IPMMU_VMSA
>   	  (H3 ES3.0, M3-W+, etc) or Gen4 SoCs which IPMMU hardware supports stage 2
>   	  translation table format and is able to use CPU's P2M table as is.
>   
> +config ARM_VIRTUAL_IOMMU
> +	bool "Virtual IOMMU Support (UNSUPPORTED)" if UNSUPPORTED
> +	help
> +	 Support virtual IOMMU infrastructure to implement vIOMMU.
> +
>   endif
>   
>   config AMD_IOMMU
> diff --git a/xen/drivers/passthrough/arm/Makefile b/xen/drivers/passthrough/arm/Makefile
> index c5fb3b58a5..c3783188e3 100644
> --- a/xen/drivers/passthrough/arm/Makefile
> +++ b/xen/drivers/passthrough/arm/Makefile
> @@ -2,3 +2,4 @@ obj-y += iommu.o iommu_helpers.o iommu_fwspec.o
>   obj-$(CONFIG_ARM_SMMU) += smmu.o
>   obj-$(CONFIG_IPMMU_VMSA) += ipmmu-vmsa.o
>   obj-$(CONFIG_ARM_SMMU_V3) += smmu-v3.o
> +obj-$(CONFIG_ARM_VIRTUAL_IOMMU) += viommu.o
> diff --git a/xen/drivers/passthrough/arm/viommu.c b/xen/drivers/passthrough/arm/viommu.c
> new file mode 100644
> index 0000000000..7ab6061e34
> --- /dev/null
> +++ b/xen/drivers/passthrough/arm/viommu.c
> @@ -0,0 +1,48 @@
> +/* SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause) */
> +
> +#include <xen/errno.h>
> +#include <xen/init.h>
> +#include <xen/types.h>
> +
> +#include <asm/viommu.h>
> +
> +const struct viommu_desc __read_mostly *cur_viommu;

You don't seem to define 'cur_viommmu' in the header. So shouldn't this 
be 'static'? Also, AFAICT, 'cur_viommu' would be set only once at boot. 
So rather than using __read_mostly, you probably want to use 
'__ro_after_init'.

> +
> +int domain_viommu_init(struct domain *d, uint16_t viommu_type)
> +{
> +    if ( viommu_type == XEN_DOMCTL_CONFIG_VIOMMU_NONE )
> +        return 0;
> +
> +    if ( !cur_viommu )
> +        return -ENODEV;
> +
> +    if ( cur_viommu->viommu_type != viommu_type )
> +        return -EINVAL;
> +
> +    return cur_viommu->ops->domain_init(d);
> +}
> +
> +int viommu_relinquish_resources(struct domain *d)
> +{
> +    if ( !cur_viommu )
> +        return 0;
> +
> +    return cur_viommu->ops->relinquish_resources(d);
> +}
> +
> +uint16_t viommu_get_type(void)
> +{
> +    if ( !cur_viommu )
> +        return XEN_DOMCTL_CONFIG_VIOMMU_NONE;
> +
> +    return cur_viommu->viommu_type;
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
> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
> index cd563cf706..d4953d40fd 100644
> --- a/xen/include/public/arch-arm.h
> +++ b/xen/include/public/arch-arm.h
> @@ -330,6 +330,8 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
>   #define XEN_DOMCTL_CONFIG_ARM_SCI_NONE      0
>   #define XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC  1
>   
> +#define XEN_DOMCTL_CONFIG_VIOMMU_NONE   0
> +
>   struct xen_arch_domainconfig {
>       /* IN/OUT */
>       uint8_t gic_version;
> @@ -355,6 +357,9 @@ struct xen_arch_domainconfig {
>       uint32_t clock_frequency;
>       /* IN */
>       uint8_t arm_sci_type;
> +    /* IN */
> +    uint8_t viommu_type;
> +    uint16_t pad;
>   };
>   #endif /* __XEN__ || __XEN_TOOLS__ */
>   
> diff --git a/xen/include/public/domctl.h b/xen/include/public/domctl.h
> index 8f6708c0a7..23124547f3 100644
> --- a/xen/include/public/domctl.h
> +++ b/xen/include/public/domctl.h
> @@ -30,9 +30,9 @@
>    * fields) don't require a change of the version.
>    * Stable ops are NOT covered by XEN_DOMCTL_INTERFACE_VERSION!
>    *
> - * Last version bump: Xen 4.19
> + * Last version bump: Xen 4.22
>    */
> -#define XEN_DOMCTL_INTERFACE_VERSION 0x00000017
> +#define XEN_DOMCTL_INTERFACE_VERSION 0x00000018
>   
>   /*
>    * NB. xen_domctl.domain is an IN/OUT parameter for this operation.

Cheers,

-- 
Julien Grall


