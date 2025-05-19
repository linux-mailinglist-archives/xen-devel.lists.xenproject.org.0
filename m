Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA27DABCBB2
	for <lists+xen-devel@lfdr.de>; Tue, 20 May 2025 01:46:14 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.990376.1374337 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHABC-0007Qv-PX; Mon, 19 May 2025 23:45:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 990376.1374337; Mon, 19 May 2025 23:45:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uHABC-0007Oo-Mw; Mon, 19 May 2025 23:45:58 +0000
Received: by outflank-mailman (input) for mailman id 990376;
 Mon, 19 May 2025 23:45:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=klDL=YD=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uHABB-0007Oh-A4
 for xen-devel@lists.xenproject.org; Mon, 19 May 2025 23:45:57 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 67312efc-350b-11f0-a2fa-13f23c93f187;
 Tue, 20 May 2025 01:45:54 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 79A2961120;
 Mon, 19 May 2025 23:45:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 797F6C4CEEB;
 Mon, 19 May 2025 23:45:51 +0000 (UTC)
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
X-Inumbo-ID: 67312efc-350b-11f0-a2fa-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747698353;
	bh=yoqX8B6ldnLpDlSDOQ5Vatb8SMeCi4qN5BARC4x5qnw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=cbJADzsuE984dUrExhAahEPWCQ3FcR60ZmreQVCPr/c+cue4HsM5rVl6yrvstFQsI
	 Sp5bXjoirmbOjQJV7v5A0SxIXFwE60BTLvAXDQG+4rbyU/+w4Z4vjabpEq6kAstniA
	 O+genAbFdQaznOA3rr6AobQ1CIPXCrCDlMvU8kbyqOJOoLinwb7StPM0LpMN1VqLUg
	 BmuxhwKD9WVA/VlYZOa930ug4C3bDvYtbS3z52SYkBu+ZNvbw/Gir0AM22aFA9bLHG
	 TEAXkF1qXVFfn4as4nAMtidazz3NJWccjoOdnuAQvqeQrhyt2CjmAhH7Iv0BMP5CdP
	 kh7yGL+EnVv/g==
Date: Mon, 19 May 2025 16:45:50 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Jan Beulich <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>, 
    Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Grygorii Strashko <grygorii_strashko@epam.com>
Subject: Re: [RFC PATCH v4 1/8] xen/arm: add generic SCI subsystem
In-Reply-To: <48b70b34c576d8dfcf6156d1997bc3c0f7cbbceb.1747669845.git.oleksii_moisieiev@epam.com>
Message-ID: <alpine.DEB.2.22.394.2505191645210.145034@ubuntu-linux-20-04-desktop>
References: <cover.1747669845.git.oleksii_moisieiev@epam.com> <48b70b34c576d8dfcf6156d1997bc3c0f7cbbceb.1747669845.git.oleksii_moisieiev@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 19 May 2025, Oleksii Moisieiev wrote:
> This patch adds the basic framework for ARM SCI mediator. SCI is System
> Control Interface, which is designed to redirect requests from the Domains
> to ARM specific Firmware (for example SCMI). This will allow the devices,
> passed-through to the different Domains, to access to the System resources
> (such as clocks/resets etc) by sending requests to the firmware.
> 
> ARM SCI subsystem allows to implement different SCI drivers to handle
> specific ARM firmware interfaces (like ARM SCMI) and mediate requests
> between the Domains and the Firmware. Also it allows SCI drivers to perform
> proper action during Domain creation/destruction which is vital for
> handling use cases like Domain reboot.
> 
> This patch introduces new DEVICE_FIRMWARE device subclass for probing SCI
> drivers basing on device tree, SCI drivers register itself with
> DT_DEVICE_START/END macro. On init - the SCI drivers should register its
> SCI ops with sci_register(). Only one SCI driver can be supported.
> 
> At run-time, the following SCI API calls are introduced:
> 
> - sci_domain_sanitise_config() called from arch_sanitise_domain_config()
> - sci_domain_init() called from arch_domain_create()
> - sci_relinquish_resources() called from domain_relinquish_resources()
> - sci_domain_destroy() called from arch_domain_destroy()
> - sci_handle_call() called from vsmccc_handle_call()
> - sci_dt_handle_node()
>   sci_dt_finalize() called from handle_node() (Dom0 DT)
> 
> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>

This patch needs a pretty major rebase. But the looks OK to me.

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> 
> Changes in v4:
> - fix SPDX-License
> - rename DEVICE_ARM_SCI DT device class to FIRMWARE_DEVICE
> - move XEN_DOMCTL_assign_device code in separate patch
> - Add documentation for SCI SCMI drivers
> 
>  MAINTAINERS                             |   6 +
>  xen/arch/arm/device.c                   |   5 +
>  xen/arch/arm/dom0less-build.c           |   7 +
>  xen/arch/arm/domain.c                   |  12 +-
>  xen/arch/arm/domain_build.c             |   8 +
>  xen/arch/arm/firmware/Kconfig           |   8 +
>  xen/arch/arm/firmware/Makefile          |   1 +
>  xen/arch/arm/firmware/sci.c             | 154 ++++++++++++++++++
>  xen/arch/arm/include/asm/domain.h       |   5 +
>  xen/arch/arm/include/asm/firmware/sci.h | 200 ++++++++++++++++++++++++
>  xen/arch/arm/vsmc.c                     |   3 +
>  xen/include/asm-generic/device.h        |   1 +
>  xen/include/public/arch-arm.h           |   4 +
>  13 files changed, 413 insertions(+), 1 deletion(-)
>  create mode 100644 xen/arch/arm/firmware/sci.c
>  create mode 100644 xen/arch/arm/include/asm/firmware/sci.h
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c11b82eca9..f5e3c48b96 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -507,6 +507,12 @@ R:	George Dunlap <gwd@xenproject.org>
>  S:	Supported
>  F:	xen/common/sched/
>  
> +SCI MEDIATORS
> +M:	Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> +S:	Supported
> +F:	xen/arch/arm/firmware/sci.c
> +F:	xen/arch/arm/include/asm/firmware/sci.h
> +
>  SEABIOS UPSTREAM
>  M:	Wei Liu <wl@xen.org>
>  S:	Supported
> diff --git a/xen/arch/arm/device.c b/xen/arch/arm/device.c
> index 5610cddcba..bdab96a408 100644
> --- a/xen/arch/arm/device.c
> +++ b/xen/arch/arm/device.c
> @@ -13,6 +13,7 @@
>  #include <xen/iocap.h>
>  #include <xen/lib.h>
>  
> +#include <asm/firmware/sci.h>
>  #include <asm/setup.h>
>  
>  int map_irq_to_domain(struct domain *d, unsigned int irq,
> @@ -303,6 +304,10 @@ int handle_device(struct domain *d, struct dt_device_node *dev, p2m_type_t p2mt,
>                  return res;
>              }
>          }
> +
> +        res = sci_assign_dt_device(d, dev);
> +        if ( res )
> +            return res;
>      }
>  
>      res = map_device_irqs_to_domain(d, dev, own_device, irq_ranges);
> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
> index 49d1f14d65..a09c4c4bd7 100644
> --- a/xen/arch/arm/dom0less-build.c
> +++ b/xen/arch/arm/dom0less-build.c
> @@ -14,6 +14,7 @@
>  #include <asm/arm64/sve.h>
>  #include <asm/dom0less-build.h>
>  #include <asm/domain_build.h>
> +#include <asm/firmware/sci.h>
>  #include <asm/static-memory.h>
>  #include <asm/static-shmem.h>
>  
> @@ -321,6 +322,10 @@ static int __init handle_passthrough_prop(struct kernel_info *kinfo,
>          return -EINVAL;
>      }
>  
> +    res = sci_assign_dt_device(kinfo->d, node);
> +    if ( res )
> +        return res;
> +
>      res = map_device_irqs_to_domain(kinfo->d, node, true, NULL);
>      if ( res < 0 )
>          return res;
> @@ -970,6 +975,8 @@ void __init create_domUs(void)
>          if ( !llc_coloring_enabled && llc_colors_str )
>              panic("'llc-colors' found, but LLC coloring is disabled\n");
>  
> +        d_cfg.arch.arm_sci_type = XEN_DOMCTL_CONFIG_ARM_SCI_NONE;
> +
>          /*
>           * The variable max_init_domid is initialized with zero, so here it's
>           * very important to use the pre-increment operator to call
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 3ba959f866..652aeb7a55 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -25,6 +25,7 @@
>  #include <asm/platform.h>
>  #include <asm/procinfo.h>
>  #include <asm/regs.h>
> +#include <asm/firmware/sci.h>
>  #include <asm/tee/tee.h>
>  #include <asm/vfp.h>
>  #include <asm/vgic.h>
> @@ -694,7 +695,7 @@ int arch_sanitise_domain_config(struct xen_domctl_createdomain *config)
>          return -EINVAL;
>      }
>  
> -    return 0;
> +    return sci_domain_sanitise_config(config);
>  }
>  
>  int arch_domain_create(struct domain *d,
> @@ -786,6 +787,9 @@ int arch_domain_create(struct domain *d,
>      d->arch.sve_vl = config->arch.sve_vl;
>  #endif
>  
> +    if ( (rc = sci_domain_init(d, config)) != 0 )
> +        goto fail;
> +
>      return 0;
>  
>  fail:
> @@ -846,6 +850,7 @@ void arch_domain_destroy(struct domain *d)
>      domain_vgic_free(d);
>      domain_vuart_free(d);
>      free_xenheap_page(d->shared_info);
> +    sci_domain_destroy(d);
>  #ifdef CONFIG_ACPI
>      free_xenheap_pages(d->arch.efi_acpi_table,
>                         get_order_from_bytes(d->arch.efi_acpi_len));
> @@ -1039,6 +1044,7 @@ enum {
>      PROG_p2m_root,
>      PROG_p2m,
>      PROG_p2m_pool,
> +    PROG_sci,
>      PROG_done,
>  };
>  
> @@ -1098,6 +1104,10 @@ int domain_relinquish_resources(struct domain *d)
>          ret = relinquish_p2m_mapping(d);
>          if ( ret )
>              return ret;
> +    PROGRESS(sci):
> +        ret = sci_relinquish_resources(d);
> +        if ( ret )
> +            return ret;
>  
>      PROGRESS(p2m_root):
>          /*
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 7b47abade1..36d28b52a4 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -24,6 +24,7 @@
>  #include <asm/setup.h>
>  #include <asm/tee/tee.h>
>  #include <asm/pci.h>
> +#include <asm/firmware/sci.h>
>  #include <asm/platform.h>
>  #include <asm/psci.h>
>  #include <asm/setup.h>
> @@ -1888,6 +1889,9 @@ static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
>          return 0;
>      }
>  
> +    if ( sci_dt_handle_node(d, node) )
> +        return 0;
> +
>      /*
>       * The vGIC does not support routing hardware PPIs to guest. So
>       * we need to skip any node using PPIs.
> @@ -1988,6 +1992,10 @@ static int __init handle_node(struct domain *d, struct kernel_info *kinfo,
>          if ( res )
>              return res;
>  
> +        res = sci_dt_finalize(d, kinfo->fdt);
> +        if ( res )
> +            return res;
> +
>          /*
>           * Create a second memory node to store the ranges covering
>           * reserved-memory regions.
> diff --git a/xen/arch/arm/firmware/Kconfig b/xen/arch/arm/firmware/Kconfig
> index 817da745fd..fc7918c7fc 100644
> --- a/xen/arch/arm/firmware/Kconfig
> +++ b/xen/arch/arm/firmware/Kconfig
> @@ -1,3 +1,11 @@
> +config ARM_SCI
> +	bool
> +	depends on ARM
> +	help
> +	  This option enables generic Arm SCI (System Control Interface) mediators
> +	  support. It allows domains to control system resources via one of
> +	  Arm SCI mediators drivers implemented in XEN, like SCMI.
> +
>  menu "Firmware Drivers"
>  
>  config SCMI_SMC
> diff --git a/xen/arch/arm/firmware/Makefile b/xen/arch/arm/firmware/Makefile
> index a5e4542666..71bdefc24a 100644
> --- a/xen/arch/arm/firmware/Makefile
> +++ b/xen/arch/arm/firmware/Makefile
> @@ -1 +1,2 @@
> +obj-$(CONFIG_ARM_SCI) += sci.o
>  obj-$(CONFIG_SCMI_SMC) += scmi-smc.o
> diff --git a/xen/arch/arm/firmware/sci.c b/xen/arch/arm/firmware/sci.c
> new file mode 100644
> index 0000000000..e1522e10e2
> --- /dev/null
> +++ b/xen/arch/arm/firmware/sci.c
> @@ -0,0 +1,154 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Generic part of the SCI (System Control Interface) subsystem.
> + *
> + * Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> + * Copyright (c) 2025 EPAM Systems
> + */
> +
> +#include <xen/acpi.h>
> +#include <xen/errno.h>
> +#include <xen/init.h>
> +#include <xen/sched.h>
> +#include <xen/types.h>
> +
> +#include <asm/firmware/sci.h>
> +
> +static const struct sci_mediator_ops __read_mostly *cur_mediator;
> +
> +int sci_register(const struct sci_mediator_ops *ops)
> +{
> +    if ( cur_mediator )
> +        return -EEXIST;
> +
> +    if ( !ops->domain_init || !ops->domain_destroy || !ops->handle_call )
> +        return -EINVAL;
> +
> +    cur_mediator = ops;
> +
> +    return 0;
> +};
> +
> +bool sci_handle_call(struct cpu_user_regs *args)
> +{
> +    if ( unlikely(!cur_mediator) )
> +        return false;
> +
> +    return cur_mediator->handle_call(args);
> +}
> +
> +int sci_domain_init(struct domain *d, struct xen_domctl_createdomain *config)
> +{
> +    if ( !cur_mediator )
> +        return 0;
> +
> +    return cur_mediator->domain_init(d, config);
> +}
> +
> +int sci_domain_sanitise_config(struct xen_domctl_createdomain *config)
> +{
> +    if ( !cur_mediator )
> +        return 0;
> +
> +    if ( !cur_mediator->domain_sanitise_config )
> +        return 0;
> +
> +    return cur_mediator->domain_sanitise_config(config);
> +}
> +
> +void sci_domain_destroy(struct domain *d)
> +{
> +    if ( !cur_mediator )
> +        return;
> +
> +    cur_mediator->domain_destroy(d);
> +}
> +
> +int sci_relinquish_resources(struct domain *d)
> +{
> +    if ( !cur_mediator )
> +        return 0;
> +
> +    if ( !cur_mediator->relinquish_resources )
> +        return 0;
> +
> +    return cur_mediator->relinquish_resources(d);
> +}
> +
> +bool sci_dt_handle_node(struct domain *d, struct dt_device_node *node)
> +{
> +    if ( !cur_mediator )
> +        return 0;
> +
> +    if ( !cur_mediator->dom0_dt_handle_node )
> +        return 0;
> +
> +    return cur_mediator->dom0_dt_handle_node(d, node);
> +}
> +
> +int sci_dt_finalize(struct domain *d, void *fdt)
> +{
> +    if ( !cur_mediator )
> +        return 0;
> +
> +    if ( !cur_mediator->dom0_dt_finalize )
> +        return 0;
> +
> +    return cur_mediator->dom0_dt_finalize(d, fdt);
> +}
> +
> +int sci_assign_dt_device(struct domain *d, struct dt_device_node *dev)
> +{
> +    struct dt_phandle_args ac_spec;
> +    int index = 0;
> +    int ret;
> +
> +    if ( !cur_mediator )
> +        return 0;
> +
> +    if ( !cur_mediator->assign_dt_device )
> +        return 0;
> +
> +    while ( !dt_parse_phandle_with_args(dev, "access-controllers",
> +                                        "#access-controller-cells", index,
> +                                        &ac_spec) )
> +    {
> +        printk(XENLOG_DEBUG "sci: assign device %s to %pd\n",
> +               dt_node_full_name(dev), d);
> +
> +        ret = cur_mediator->assign_dt_device(d, &ac_spec);
> +        if ( ret )
> +            return ret;
> +
> +        index++;
> +    }
> +
> +    return 0;
> +}
> +
> +static int __init sci_init(void)
> +{
> +    struct dt_device_node *np;
> +    unsigned int num_sci = 0;
> +    int rc;
> +
> +    dt_for_each_device_node(dt_host, np)
> +    {
> +        rc = device_init(np, DEVICE_FIRMWARE, NULL);
> +        if ( !rc && num_sci )
> +        {
> +            printk(XENLOG_ERR
> +                   "SCMI: Only one SCI controller is supported. found second %s\n",
> +                   np->name);
> +            return -EOPNOTSUPP;
> +        }
> +        else if ( !rc )
> +            num_sci++;
> +        else if ( rc != -EBADF && rc != -ENODEV )
> +            return rc;
> +    }
> +
> +    return 0;
> +}
> +
> +__initcall(sci_init);
> diff --git a/xen/arch/arm/include/asm/domain.h b/xen/arch/arm/include/asm/domain.h
> index f1d72c6e48..fa0898b7cf 100644
> --- a/xen/arch/arm/include/asm/domain.h
> +++ b/xen/arch/arm/include/asm/domain.h
> @@ -118,6 +118,11 @@ struct arch_domain
>  #ifdef CONFIG_TEE
>      void *tee;
>  #endif
> +#ifdef CONFIG_ARM_SCI
> +    bool sci_enabled;
> +    /* ARM SCI driver's specific data */
> +    void *sci_data;
> +#endif
>  
>  }  __cacheline_aligned;
>  
> diff --git a/xen/arch/arm/include/asm/firmware/sci.h b/xen/arch/arm/include/asm/firmware/sci.h
> new file mode 100644
> index 0000000000..71fb54852e
> --- /dev/null
> +++ b/xen/arch/arm/include/asm/firmware/sci.h
> @@ -0,0 +1,200 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Generic ARM SCI (System Control Interface) subsystem.
> + *
> + * Oleksii Moisieiev <oleksii_moisieiev@epam.com>
> + * Copyright (c) 2025 EPAM Systems
> + */
> +
> +#ifndef __ASM_ARM_SCI_H
> +#define __ASM_ARM_SCI_H
> +
> +#include <xen/lib.h>
> +#include <xen/types.h>
> +#include <xen/device_tree.h>
> +#include <xen/errno.h>
> +#include <xen/sched.h>
> +
> +#ifdef CONFIG_ARM_SCI
> +
> +struct sci_mediator_ops {
> +    /*
> +     * Called during domain construction. If it is requested to enable
> +     * SCI support, so SCI driver can create own structures for the new domain
> +     * and inform firmware about new domain (if required).
> +     * Mandatory.
> +     */
> +    int (*domain_init)(struct domain *d,
> +                       struct xen_domctl_createdomain *config);
> +
> +    /*
> +     * Called during domain construction. The SCI driver uses
> +     * it to sanitize domain SCI configuration parameters.
> +     * Optional.
> +     */
> +    int (*domain_sanitise_config)(struct xen_domctl_createdomain *config);
> +
> +    /*
> +     * Called during domain destruction, releases all resources, that
> +     * were allocated for domain.
> +     * Mandatory.
> +     */
> +    void (*domain_destroy)(struct domain *d);
> +
> +    /*
> +     * Called during domain destruction to relinquish resources used
> +     * by SCI driver itself and request resources releasing from firmware.
> +     * Optional.
> +     */
> +    int (*relinquish_resources)(struct domain *d);
> +
> +    /* SMC/HVC Handle callback */
> +    bool (*handle_call)(struct cpu_user_regs *regs);
> +
> +    /*
> +     * Dom0 DT nodes handling callback so SCI driver can detect DT nodes it
> +     * need to handle and decide if those nodes need to be provided to Dom0.
> +     * Optional.
> +     */
> +    bool (*dom0_dt_handle_node)(struct domain *d, struct dt_device_node *node);
> +
> +    /*
> +     * SCI driver callback called at the end of Dom0 DT generation, so
> +     * it can perform steps to modify DT to enable/disable SCI
> +     * functionality for Dom0.
> +     */
> +    int (*dom0_dt_finalize)(struct domain *d, void *fdt);
> +
> +    /*
> +     * SCI driver callback called when DT device is passed through to guest,
> +     * so SCI driver can enable device access to the domain if SCI FW provides
> +     * Device specific access control functionality.
> +     * Optional.
> +     */
> +    int (*assign_dt_device)(struct domain *d, struct dt_phandle_args *ac_spec);
> +};
> +
> +
> +static inline bool sci_domain_is_enabled(struct domain *d)
> +{
> +    return d->arch.sci_enabled;
> +}
> +
> +/*
> + * Register SCI subsystem ops.
> + *
> + * Register SCI drivers operation and so enable SCI functionality.
> + * Only one SCI driver is supported.
> + */
> +int sci_register(const struct sci_mediator_ops *ops);
> +
> +/*
> + * Initialize SCI functionality for domain if configured.
> + *
> + * Initialization routine to enable SCI functionality for the domain.
> + * The SCI configuration data and decision about enabling SCI functionality
> + * for the domain is SCI driver specific.
> + */
> +int sci_domain_init(struct domain *d, struct xen_domctl_createdomain *config);
> +
> +/*
> + * Sanitise domain configuration parameters.
> + *
> + */
> +int sci_domain_sanitise_config(struct xen_domctl_createdomain *config);
> +
> +/*
> + * Destroy SCI domain instance.
> + */
> +void sci_domain_destroy(struct domain *d);
> +
> +/*
> + * Free resources assigned to the certain domain.
> + */
> +int sci_relinquish_resources(struct domain *d);
> +
> +/*
> + * SMC/HVC Handle callback.
> + *
> + * SCI driver acts as SMC/HVC server for the registered domains and
> + * does redirection of the domain calls to the SCI firmware,
> + * such as ARM TF-A or similar.
> + */
> +bool sci_handle_call(struct cpu_user_regs *regs);
> +
> +/*
> + * Dom0 DT nodes handling function.
> + *
> + * Allows SCI driver to detect DT nodes it need to handle and decide if
> + * those nodes need to be provided to Dom0.
> + */
> +bool sci_dt_handle_node(struct domain *d, struct dt_device_node *node);
> +
> +/*
> + * Dom0 DT generation finalize.
> + *
> + * Called at the end of Dom0 DT generation, so SCI driver can perform steps
> + * to modify DT to enable/disable SCI functionality for Dom0.
> + */
> +int sci_dt_finalize(struct domain *d, void *fdt);
> +
> +/*
> + * Assign DT device to domain.
> + *
> + * Called when DT device is passed through to guest, so SCI driver can enable
> + * device access to the domain if SCI FW provides "Device specific access
> + * control" functionality.
> + */
> +int sci_assign_dt_device(struct domain *d, struct dt_device_node *dev);
> +#else
> +
> +static inline bool sci_domain_is_enabled(struct domain *d)
> +{
> +    return false;
> +}
> +
> +static inline int sci_domain_init(struct domain *d,
> +                                  struct xen_domctl_createdomain *config)
> +{
> +    return 0;
> +}
> +
> +static inline int
> +sci_domain_sanitise_config(struct xen_domctl_createdomain *config)
> +{
> +    return 0;
> +}
> +
> +static inline void sci_domain_destroy(struct domain *d)
> +{}
> +
> +static inline int sci_relinquish_resources(struct domain *d)
> +{
> +    return 0;
> +}
> +
> +static inline bool sci_handle_call(struct cpu_user_regs *args)
> +{
> +    return false;
> +}
> +
> +static inline bool sci_dt_handle_node(struct domain *d,
> +                                      struct dt_device_node *node)
> +{
> +    return false;
> +}
> +
> +static inline int sci_dt_finalize(struct domain *d, void *fdt)
> +{
> +    return false;
> +}
> +
> +static inline int sci_assign_dt_device(struct domain *d,
> +                                       struct dt_device_node *dev)
> +{
> +    return 0;
> +}
> +
> +#endif /* CONFIG_ARM_SCI */
> +
> +#endif /* __ASM_ARM_SCI_H */
> diff --git a/xen/arch/arm/vsmc.c b/xen/arch/arm/vsmc.c
> index 62d8117a12..51b3c02973 100644
> --- a/xen/arch/arm/vsmc.c
> +++ b/xen/arch/arm/vsmc.c
> @@ -12,6 +12,7 @@
>  #include <public/arch-arm/smccc.h>
>  #include <asm/cpuerrata.h>
>  #include <asm/cpufeature.h>
> +#include <asm/firmware/sci.h>
>  #include <asm/monitor.h>
>  #include <asm/regs.h>
>  #include <asm/smccc.h>
> @@ -300,6 +301,8 @@ static bool vsmccc_handle_call(struct cpu_user_regs *regs)
>              break;
>          case ARM_SMCCC_OWNER_SIP:
>              handled = handle_sip(regs);
> +            if ( !handled )
> +                handled = sci_handle_call(regs);
>              break;
>          case ARM_SMCCC_OWNER_TRUSTED_APP ... ARM_SMCCC_OWNER_TRUSTED_APP_END:
>          case ARM_SMCCC_OWNER_TRUSTED_OS ... ARM_SMCCC_OWNER_TRUSTED_OS_END:
> diff --git a/xen/include/asm-generic/device.h b/xen/include/asm-generic/device.h
> index 1acd1ba1d8..e96c5558c2 100644
> --- a/xen/include/asm-generic/device.h
> +++ b/xen/include/asm-generic/device.h
> @@ -18,6 +18,7 @@ enum device_class
>      DEVICE_IOMMU,
>      DEVICE_INTERRUPT_CONTROLLER,
>      DEVICE_PCI_HOSTBRIDGE,
> +    DEVICE_FIRMWARE,
>      /* Use for error */
>      DEVICE_UNKNOWN,
>  };
> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
> index 24840eeaa6..55eed9992c 100644
> --- a/xen/include/public/arch-arm.h
> +++ b/xen/include/public/arch-arm.h
> @@ -327,6 +327,8 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
>  #define XEN_DOMCTL_CONFIG_TEE_OPTEE     1
>  #define XEN_DOMCTL_CONFIG_TEE_FFA       2
>  
> +#define XEN_DOMCTL_CONFIG_ARM_SCI_NONE      0
> +
>  struct xen_arch_domainconfig {
>      /* IN/OUT */
>      uint8_t gic_version;
> @@ -350,6 +352,8 @@ struct xen_arch_domainconfig {
>       *
>       */
>      uint32_t clock_frequency;
> +    /* IN */
> +    uint8_t arm_sci_type;
>  };
>  #endif /* __XEN__ || __XEN_TOOLS__ */
>  
> -- 
> 2.34.1
> 

