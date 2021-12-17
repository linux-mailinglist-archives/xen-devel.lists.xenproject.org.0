Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00605478359
	for <lists+xen-devel@lfdr.de>; Fri, 17 Dec 2021 03:46:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.248367.428447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1my3FO-0000r0-8l; Fri, 17 Dec 2021 02:45:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 248367.428447; Fri, 17 Dec 2021 02:45:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1my3FO-0000pG-2j; Fri, 17 Dec 2021 02:45:26 +0000
Received: by outflank-mailman (input) for mailman id 248367;
 Fri, 17 Dec 2021 02:45:24 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=W3Ie=RC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1my3FM-0000pA-KE
 for xen-devel@lists.xenproject.org; Fri, 17 Dec 2021 02:45:24 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 60ef3376-5ee3-11ec-85d3-df6b77346a89;
 Fri, 17 Dec 2021 03:45:22 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2B24FB826A3;
 Fri, 17 Dec 2021 02:45:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BB4CC36AE2;
 Fri, 17 Dec 2021 02:45:19 +0000 (UTC)
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
X-Inumbo-ID: 60ef3376-5ee3-11ec-85d3-df6b77346a89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1639709119;
	bh=8QVZJDOPniwAZkXBcz6X6ZxsEmS3i2SJkY6aH8/wrxM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=FvHVulrBF2PZnoKMwJjpIIalITMg7lTPrXSLnZphvnOGpsI9m4w4b96wMaChm+wlC
	 TbuTwtOKSdnrzFgpCGF8hln3569lvscDCetHa6evcatJHhmUHPZNSpLy/WkmtTBl8t
	 PA3gSAM7THPr2Ek9/ZXSbgrcQL+0tmJjgF5ahtHeD3tko64KDK5H3XP765AHEuPAq4
	 ka/Q9BHSyk4unwg02GN02afaYeNZOIqtKr+rULrDS7mergCjJksRP9VPH+HSNnGvTk
	 5pd3GllbFyvOF628sSvbmjs991aBKIta8wDEfsCkuvXd7QYejSejBWO8lHclcK49tO
	 nshgtqCmGtzrA==
Date: Thu, 16 Dec 2021 18:45:11 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>
Subject: Re: [RFC v1 2/5] xen/arm: add generic SCI mediator framework
In-Reply-To: <c0afe4837fe99e7f7921fc43b130aa2234f234be.1639472078.git.oleksii_moisieiev@epam.com>
Message-ID: <alpine.DEB.2.22.394.2112161831230.1662642@ubuntu-linux-20-04-desktop>
References: <cover.1639472078.git.oleksii_moisieiev@epam.com> <c0afe4837fe99e7f7921fc43b130aa2234f234be.1639472078.git.oleksii_moisieiev@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 14 Dec 2021, Oleksii Moisieiev wrote:
> This patch adds the basic framework for SCI mediator.
> SCI is System Control Interface, which is designed to redirect
> requests for the Hardware (such as power-domain/clock/resets etc)
> from the Domains to the firmware. Originally, cpg should be passed
> to the domain so it can work with power-domains/clocks/resets etc.
> Considering that cpg can't be split between the Domains, we get the
> limitation that the devices, which are using power-domains/clocks/resets
> etc, couldn't be split between the domains.
> The solution is to move the power-domain/clock/resets etc to the
> Firmware (such as SCP firmware or ATF) and provide interface for the Domains.
> XEN shoud have an entity, caled SCI-Mediator, which is responsible for messages
> redirection between Domains and Firmware and for permission handling.
> 
> This is how it works: user can build XEN with multiple SCI mediators.
> See the next patches, where SCMI-SMC mediator is introduced.
> SCI mediator register itself with REGISTER_SCI_MEDIATOR() macro.
> 
> At run-time, during initialization, framework calls probe for the first
> matching device in the device-tree. When no device-tree is present - the
> first registered mediator should be probed.
> 
> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> ---
>  MAINTAINERS                    |   6 ++
>  xen/arch/arm/Kconfig           |   8 ++
>  xen/arch/arm/Makefile          |   1 +
>  xen/arch/arm/domain.c          |  24 +++++
>  xen/arch/arm/domain_build.c    |  11 +++
>  xen/arch/arm/platforms/rcar3.c |   3 +-
>  xen/arch/arm/sci/Makefile      |   1 +
>  xen/arch/arm/sci/sci.c         | 128 ++++++++++++++++++++++++++
>  xen/arch/arm/setup.c           |   1 +
>  xen/arch/arm/xen.lds.S         |   7 ++
>  xen/include/asm-arm/domain.h   |   4 +
>  xen/include/asm-arm/sci/sci.h  | 162 +++++++++++++++++++++++++++++++++
>  xen/include/public/arch-arm.h  |  10 ++
>  13 files changed, 365 insertions(+), 1 deletion(-)
>  create mode 100644 xen/arch/arm/sci/Makefile
>  create mode 100644 xen/arch/arm/sci/sci.c
>  create mode 100644 xen/include/asm-arm/sci/sci.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e43dc0edce..5f96ea35ba 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -512,6 +512,12 @@ S:	Supported
>  F:	xen/arch/arm/tee/
>  F:	xen/include/asm-arm/tee
>  
> +SCI MEDIATORS
> +M:	Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> +S:	Supported
> +F:	xen/arch/arm/sci
> +F:	xen/include/asm-arm/sci
> +
>  TOOLSTACK
>  M:	Wei Liu <wl@xen.org>
>  S:	Supported
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index ecfa6822e4..186e1db389 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -106,6 +106,14 @@ config TEE
>  
>  source "arch/arm/tee/Kconfig"
>  
> +config SCI
> +	bool "Enable SCI mediators support"
> +	default n
> +	help
> +	  This option enables generic SCI (System Control Interface) mediators
> +	  support. It allows guests to control system resourcess via one of
> +	  SCI mediators implemented in XEN.
> +
>  endmenu
>  
>  menu "ARM errata workaround via the alternative framework"
> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> index 07f634508e..6366ff55e5 100644
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -8,6 +8,7 @@ obj-y += platforms/
>  endif
>  obj-$(CONFIG_TEE) += tee/
>  obj-$(CONFIG_HAS_VPCI) += vpci.o
> +obj-$(CONFIG_SCI) += sci/
>  
>  obj-$(CONFIG_HAS_ALTERNATIVE) += alternative.o
>  obj-y += bootfdt.init.o
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 96e1b23550..80d0a23767 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -34,6 +34,7 @@
>  #include <asm/platform.h>
>  #include <asm/procinfo.h>
>  #include <asm/regs.h>
> +#include <asm/sci/sci.h>
>  #include <asm/tee/tee.h>
>  #include <asm/vfp.h>
>  #include <asm/vgic.h>
> @@ -688,6 +689,13 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>          return -EINVAL;
>      }
>  
> +    if ( config->arch.sci_type != XEN_DOMCTL_CONFIG_SCI_NONE &&
> +         config->arch.sci_type != sci_get_type() )
> +    {
> +        dprintk(XENLOG_INFO, "Unsupported SCI type\n");
> +        return -EINVAL;
> +    }
> +
>      return 0;
>  }
>  
> @@ -764,6 +772,15 @@ int arch_domain_create(struct domain *d,
>          /* At this stage vgic_reserve_virq should never fail */
>          if ( !vgic_reserve_virq(d, GUEST_EVTCHN_PPI) )
>              BUG();
> +
> +        if ( config->arch.sci_type != XEN_DOMCTL_CONFIG_SCI_NONE )
> +        {
> +            if ( (rc = sci_domain_init(d, config->arch.sci_type)) != 0)
> +                goto fail;
> +
> +            if ( (rc = sci_get_channel_info(d, &config->arch)) != 0)
> +                goto fail;
> +        }
>      }
>  
>      /*
> @@ -796,6 +813,7 @@ void arch_domain_destroy(struct domain *d)
>      domain_vgic_free(d);
>      domain_vuart_free(d);
>      free_xenheap_page(d->shared_info);
> +    sci_domain_destroy(d);
>  #ifdef CONFIG_ACPI
>      free_xenheap_pages(d->arch.efi_acpi_table,
>                         get_order_from_bytes(d->arch.efi_acpi_len));
> @@ -996,6 +1014,7 @@ enum {
>      PROG_xen,
>      PROG_page,
>      PROG_mapping,
> +    PROG_sci,
>      PROG_done,
>  };
>  
> @@ -1056,6 +1075,11 @@ int domain_relinquish_resources(struct domain *d)
>          if ( ret )
>              return ret;
>  
> +    PROGRESS(sci):
> +        ret = sci_relinquish_resources(d);
> +        if ( ret )
> +            return ret;
> +
>      PROGRESS(done):
>          break;
>  
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index d02bacbcd1..38874615dd 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -22,6 +22,7 @@
>  #include <asm/kernel.h>
>  #include <asm/setup.h>
>  #include <asm/tee/tee.h>
> +#include <asm/sci/sci.h>
>  #include <asm/platform.h>
>  #include <asm/psci.h>
>  #include <asm/setup.h>
> @@ -1894,6 +1895,10 @@ static int __init handle_device(struct domain *d, struct dt_device_node *dev,
>                  return res;
>              }
>          }
> +
> +        res = sci_add_dt_device(d, dev);
> +        if ( res < 0 )
> +            return res;
>      }

It would be good to add the call to dom0less domUs too


>      res = handle_device_interrupts(d, dev, need_mapping);
> @@ -3075,6 +3080,10 @@ static int __init construct_dom0(struct domain *d)
>      if ( rc < 0 )
>          return rc;
>  
> +    rc = sci_domain_init(d, sci_get_type());
> +    if ( rc < 0 )
> +        return rc;

same here


>      if ( acpi_disabled )
>          rc = prepare_dtb_hwdom(d, &kinfo);
>      else
> @@ -3109,6 +3118,8 @@ void __init create_dom0(void)
>      dom0_cfg.arch.tee_type = tee_get_type();
>      dom0_cfg.max_vcpus = dom0_max_vcpus();
>  
> +    dom0_cfg.arch.sci_type = sci_get_type();

and here


>      if ( iommu_enabled )
>          dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
>  
> diff --git a/xen/arch/arm/platforms/rcar3.c b/xen/arch/arm/platforms/rcar3.c
> index d740145c71..a268b09454 100644
> --- a/xen/arch/arm/platforms/rcar3.c
> +++ b/xen/arch/arm/platforms/rcar3.c
> @@ -18,10 +18,11 @@
>   */
>  
>  #include <asm/platform.h>
> +#include <asm/sci/sci.h>
>  
>  static bool rcar3_smc(struct cpu_user_regs *regs)
>  {
> -    return false;
> +    return sci_handle_call(current->domain, regs);
>  }
>  
>  static const char *const rcar3_dt_compat[] __initconst =
> diff --git a/xen/arch/arm/sci/Makefile b/xen/arch/arm/sci/Makefile
> new file mode 100644
> index 0000000000..837dc7492b
> --- /dev/null
> +++ b/xen/arch/arm/sci/Makefile
> @@ -0,0 +1 @@
> +obj-y += sci.o
> diff --git a/xen/arch/arm/sci/sci.c b/xen/arch/arm/sci/sci.c
> new file mode 100644
> index 0000000000..5961b4cd5d
> --- /dev/null
> +++ b/xen/arch/arm/sci/sci.c
> @@ -0,0 +1,128 @@
> +/*
> + * xen/arch/arm/sci/sci.c
> + *
> + * Generic part of SCI mediator driver
> + *
> + * Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> + * Copyright (C) 2021, EPAM Systems.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <xen/errno.h>
> +#include <xen/init.h>
> +#include <xen/sched.h>
> +#include <xen/types.h>
> +
> +#include <asm/sci/sci.h>
> +
> +extern const struct sci_mediator_desc _sscimediator[], _escimediator[];
> +static const struct sci_mediator_desc __read_mostly *cur_mediator;
> +
> +bool sci_handle_call(struct domain *d, void *args)
> +{
> +    if ( unlikely(!cur_mediator) )
> +        return false;
> +
> +    return cur_mediator->ops->handle_call(d, args);
> +}
> +
> +int sci_domain_init(struct domain *d, uint16_t sci_type)
> +{
> +    if ( sci_type == XEN_DOMCTL_CONFIG_SCI_NONE )
> +        return 0;
> +
> +    if ( unlikely(!cur_mediator) )
> +        return -ENODEV;
> +
> +    if ( cur_mediator->sci_type != sci_type )
> +        return -EINVAL;
> +
> +    return cur_mediator->ops->domain_init(d);
> +}
> +
> +void sci_domain_destroy(struct domain *d)
> +{
> +    if ( unlikely(!cur_mediator) )
> +        return;
> +
> +    cur_mediator->ops->domain_destroy(d);
> +}
> +
> +int sci_relinquish_resources(struct domain *d)
> +{
> +    if ( unlikely(!cur_mediator) )
> +        return 0;
> +
> +    return cur_mediator->ops->relinquish_resources(d);
> +}
> +
> +
> +int sci_add_dt_device(struct domain *d, struct dt_device_node *dev)
> +{
> +    if ( unlikely(!cur_mediator) )
> +        return 0;
> +
> +    return cur_mediator->ops->add_dt_device(d, dev);
> +}
> +
> +int sci_get_channel_info(struct domain *d,
> +                         struct xen_arch_domainconfig *config)
> +{
> +    if ( unlikely(!cur_mediator) )
> +        return 0;
> +
> +    return cur_mediator->ops->get_channel_info(d->arch.sci, config);
> +}
> +
> +uint16_t sci_get_type(void)
> +{
> +    if ( unlikely(!cur_mediator) )
> +        return XEN_DOMCTL_CONFIG_SCI_NONE;
> +
> +    return cur_mediator->sci_type;
> +}
> +
> +static int __init sci_init(void)
> +{
> +    const struct sci_mediator_desc *desc;
> +    struct dt_device_node *dt = NULL;
> +
> +    for ( desc = _sscimediator; desc != _escimediator; desc++ )
> +    {
> +        if ( likely(dt_host) )

I think you can assume that dt_host is correctly set, right?
Instead of this check, I would just add:

    if ( !acpi_disabled )
        return -ENODEV;

at the beginning of sci_init


> +        {
> +            dt = dt_find_matching_node(dt_host, desc->dt_match);
> +            if ( !dt )
> +                continue;
> +        }
> +
> +        if ( desc->ops->probe(dt) )
> +        {
> +            printk(XENLOG_INFO "Using SCI mediator for %s\n", desc->name);
> +            cur_mediator = desc;
> +            return 0;
> +        }
> +    }
> +
> +    return 0;
> +}
> +
> +__initcall(sci_init);
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * indent-tabs-mode: nil
> + * End:
> + */
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index d5d0792ed4..201de01411 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -50,6 +50,7 @@
>  #include <asm/cpufeature.h>
>  #include <asm/platform.h>
>  #include <asm/procinfo.h>
> +#include <asm/sci/sci.h>
>  #include <asm/setup.h>
>  #include <xsm/xsm.h>
>  #include <asm/acpi.h>
> diff --git a/xen/arch/arm/xen.lds.S b/xen/arch/arm/xen.lds.S
> index 08016948ab..3683f4821f 100644
> --- a/xen/arch/arm/xen.lds.S
> +++ b/xen/arch/arm/xen.lds.S
> @@ -142,6 +142,13 @@ SECTIONS
>        _eteemediator = .;
>    } :text
>  
> +  . = ALIGN(8);
> +  .scimediator.info : {
> +      _sscimediator = .;
> +      *(.scimediator.info)
> +      _escimediator = .;
> +  } :text
> +
>    . = ALIGN(PAGE_SIZE);             /* Init code and data */
>    __init_begin = .;
>    .init.text : {
> diff --git a/xen/include/asm-arm/domain.h b/xen/include/asm-arm/domain.h
> index 9b3647587a..d9b164017f 100644
> --- a/xen/include/asm-arm/domain.h
> +++ b/xen/include/asm-arm/domain.h
> @@ -89,6 +89,10 @@ struct arch_domain
>  #ifdef CONFIG_TEE
>      void *tee;
>  #endif
> +
> +#ifdef CONFIG_SCI
> +    void *sci;
> +#endif
>  }  __cacheline_aligned;
>  
>  struct arch_vcpu
> diff --git a/xen/include/asm-arm/sci/sci.h b/xen/include/asm-arm/sci/sci.h
> new file mode 100644
> index 0000000000..aeff689c72
> --- /dev/null
> +++ b/xen/include/asm-arm/sci/sci.h
> @@ -0,0 +1,162 @@
> +/*
> + * xen/include/asm-arm/sci/sci.h
> + *
> + * Generic part of the SCI (System Control Interface) subsystem.
> + *
> + * Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> + * Copyright (C) 2021, EPAM Systems.
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#ifndef __ASM_ARM_SCI_H
> +#define __ASM_ARM_SCI_H
> +
> +#include <xen/lib.h>
> +#include <xen/types.h>
> +#include <xen/device_tree.h>
> +
> +#ifdef CONFIG_SCI
> +
> +struct sci_mediator_ops {
> +
> +    /*
> +     * Probe for SCI. Should return true if SCI found and
> +     * mediator is initialized.
> +     */
> +    bool (*probe)(struct dt_device_node *scmi_node);
> +
> +    /*
> +     * Called during domain construction if toolstack requests to enable
> +     * SCI support so mediator can inform SCP-firmware about new
> +     * guest and create own structures for the new domain.
> +     */
> +    int (*domain_init)(struct domain *d);
> +
> +    /*
> +     * Called during domain destruction, releases all resources, that
> +     * were allocated by the mediator.
> +     */
> +    void (*domain_destroy)(struct domain *d);
> +
> +    /*
> +     * Called during parsing partial device-sci for the domain.
> +     * Passing device_node so mediator could process the device and
> +     * mark the device as related to the domain if needed.
> +     */
> +    int (*add_dt_device)(struct domain *d, struct dt_device_node *dev);
> +
> +    /*
> +     * Called during domain destruction to relinquish resources used
> +     * by mediator itself. This function can return -ERESTART to indicate
> +     * that it does not finished work and should be called again.
> +     */
> +    int (*relinquish_resources)(struct domain *d);
> +
> +    /* Handle call for current domain */
> +    bool (*handle_call)(struct domain *d, void *regs);
> +
> +    /* Gets channel configuration and store it in domainconfig */
> +    int (*get_channel_info)(void *sci_ops,
> +                            struct xen_arch_domainconfig *config);

get_channel_info is the only function I don't understand among these...
what is supposed to be stored in struct xen_arch_domainconfig, just
sci_agent_paddr?

Also, it seems to be only called right after sci_domain_init, so can't
the "get_channel_info" operation just be done as part of domain_init?



> +};
> +
> +struct sci_mediator_desc {
> +    /* Printable name of the SCI. */
> +    const char *name;
> +
> +    /* Mediator callbacks as described above. */
> +    const struct sci_mediator_ops *ops;
> +
> +    /*
> +     * ID of SCI. Corresponds to xen_arch_domainconfig.sci_type.
> +     * Should be one of XEN_DOMCTL_CONFIG_SCI_xxx
> +     */
> +    uint16_t sci_type;
> +
> +    /* Match structure to init mediator */
> +    const struct dt_device_match *dt_match;
> +
> +};
> +
> +int sci_domain_init(struct domain *d, uint16_t sci_type);
> +void sci_domain_destroy(struct domain *d);
> +int sci_add_dt_device(struct domain *d, struct dt_device_node *dev);
> +int sci_relinquish_resources(struct domain *d);
> +bool sci_handle_call(struct domain *d, void *args);
> +int sci_get_channel_info(struct domain *d,
> +                         struct xen_arch_domainconfig *config);
> +uint16_t sci_get_type(void);
> +
> +#define REGISTER_SCI_MEDIATOR(_name, _namestr, _type, _match, _ops) \
> +static const struct sci_mediator_desc __sci_desc_##_name __used     \
> +__section(".scimediator.info") = {                                  \
> +    .name = _namestr,                                               \
> +    .ops = _ops,                                                    \
> +    .sci_type = _type,                                              \
> +    .dt_match = _match                                              \
> +}
> +
> +#else
> +#include <public/errno.h>
> +
> +static inline int sci_domain_init(struct domain *d, uint16_t sci_type)
> +{
> +    if ( likely(sci_type == XEN_DOMCTL_CONFIG_SCI_NONE) )
> +        return 0;
> +
> +    return -XEN_ENODEV;
> +}
> +
> +static inline void sci_domain_destroy(struct domain *d)
> +{
> +}
> +
> +static inline int sci_add_dt_device(struct domain *d,
> +                                    struct dt_device_node *dev)
> +{
> +    return 0;
> +}
> +
> +static inline int sci_relinquish_resources(struct domain *d)
> +{
> +    return 0;
> +}
> +
> +static inline bool sci_handle_call(struct domain *d, void *args)
> +{
> +    return false;
> +}
> +
> +static inline int sci_get_channel_info(struct domain *d,
> +                                       struct xen_arch_domainconfig *config)
> +{
> +    return 0;
> +}
> +
> +static inline uint16_t sci_get_type(void)
> +{
> +    return XEN_DOMCTL_CONFIG_SCI_NONE;
> +}
> +
> +#endif  /* CONFIG_SCI */
> +
> +#endif /* __ASM_ARM_SCI_H */
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
> index 94b31511dd..9180be5e86 100644
> --- a/xen/include/public/arch-arm.h
> +++ b/xen/include/public/arch-arm.h
> @@ -314,12 +314,16 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
>  #define XEN_DOMCTL_CONFIG_TEE_NONE      0
>  #define XEN_DOMCTL_CONFIG_TEE_OPTEE     1
>  
> +#define XEN_DOMCTL_CONFIG_SCI_NONE      0
> +
>  struct xen_arch_domainconfig {
>      /* IN/OUT */
>      uint8_t gic_version;
>      /* IN */
>      uint16_t tee_type;
>      /* IN */
> +    uint8_t sci_type;

sci_type is uint16_t everywhere else


> +    /* IN */
>      uint32_t nr_spis;
>      /*
>       * OUT
> @@ -335,6 +339,12 @@ struct xen_arch_domainconfig {
>       *
>       */
>      uint32_t clock_frequency;
> +
> +    /* Sets shared address to sw domains.
> +     * This information is needed to set correct channel in Domain partial
> +     * device-tree
> +     */
> +    uint64_t sci_agent_paddr;
>  };
>  #endif /* __XEN__ || __XEN_TOOLS__ */


