Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B91FEA60627
	for <lists+xen-devel@lfdr.de>; Fri, 14 Mar 2025 00:49:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.913600.1319572 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tssHr-0006wF-KB; Thu, 13 Mar 2025 23:48:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 913600.1319572; Thu, 13 Mar 2025 23:48:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tssHr-0006tO-H1; Thu, 13 Mar 2025 23:48:27 +0000
Received: by outflank-mailman (input) for mailman id 913600;
 Thu, 13 Mar 2025 23:48:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YTVj=WA=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tssHq-0006f8-4T
 for xen-devel@lists.xenproject.org; Thu, 13 Mar 2025 23:48:26 +0000
Received: from nyc.source.kernel.org (nyc.source.kernel.org
 [2604:1380:45d1:ec00::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a5fb2e30-0065-11f0-9898-31a8f345e629;
 Fri, 14 Mar 2025 00:48:23 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 59318A46B67;
 Thu, 13 Mar 2025 23:42:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EAAEC4CEE9;
 Thu, 13 Mar 2025 23:48:20 +0000 (UTC)
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
X-Inumbo-ID: a5fb2e30-0065-11f0-9898-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741909701;
	bh=1qWbVs2VUwXDk9m84RyQ1weA6U/UH871av7A5Mmu6Y8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=UFMtN5utZXhPp35m3Ktu7iSms4SKF+/0kFeZ/Fe5ZqgF7P5rxdqwFwxX3ZxOS1sjy
	 ZHYDVDw0cjJIEilWmfYitGPYQnTatUHCHyo/WZXIYbr0ewiFpb6loB7lW13pzrFxx7
	 XTTJcZIkPfC84ONQ3btYdAGVsbhzm4XogoLA92GEtJqauvfgMaMKbS7m3v0NlyKKln
	 wK1IS7dsotTycwMptdzFM9OGs/pymNl3LdUDpXD5Ge8rcMrGyN7gneGh2J7UZ9TlBb
	 5v5KicPncrz2+j1xXqJ80qsjylR5iVQzCLw8ZcyMxiYoybPHYblacp0izbCprfq3jf
	 a+yEl76b88aAg==
Date: Thu, 13 Mar 2025 16:48:17 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Grygorii Strashko <gragst.linux@gmail.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    Michal Orzel <michal.orzel@amd.com>, 
    Roger Pau Monne <roger.pau@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Anthony PERARD <anthony.perard@vates.tech>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Oleksii Moisieiev <oleksii_moisieiev@epam.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Juergen Gross <jgross@suse.com>, 
    Grygorii Strashko <grygorii_strashko@epam.com>
Subject: Re: [RFC PATCH v3 2/7] xen/arm: scmi-smc: update to be used under
 sci subsystem
In-Reply-To: <20250311111618.1850927-3-grygorii_strashko@epam.com>
Message-ID: <alpine.DEB.2.22.394.2503131540530.3477110@ubuntu-linux-20-04-desktop>
References: <20250311111618.1850927-1-grygorii_strashko@epam.com> <20250311111618.1850927-3-grygorii_strashko@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 11 Mar 2025, Grygorii Strashko wrote:
> The introduced SCI (System Control Interface) subsystem provides unified
> interface to integrate in Xen SCI drivers which adds support for ARM
> firmware (EL3, SCP) based software interfaces (like SCMI) that are used in
> system management. The SCI subsystem allows to add drivers for different FW
> interfaces or have different drivers for the same FW interface (for example,
> SCMI with different transports).
> 
> This patch updates SCMI over SMC calls handling layer, introduced by
> commit 3e322bef8bc0 ("xen/arm: firmware: Add SCMI over SMC calls handling
> layer"), to be SCI driver:
> - convert to DT device;
> - convert to SCI Xen interface.
> 
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> ---
>  xen/arch/arm/firmware/Kconfig                | 13 ++-
>  xen/arch/arm/firmware/scmi-smc.c             | 93 +++++++++++---------
>  xen/arch/arm/include/asm/firmware/scmi-smc.h | 41 ---------
>  xen/arch/arm/vsmc.c                          |  5 +-
>  xen/include/public/arch-arm.h                |  1 +
>  5 files changed, 64 insertions(+), 89 deletions(-)
>  delete mode 100644 xen/arch/arm/include/asm/firmware/scmi-smc.h
> 
> diff --git a/xen/arch/arm/firmware/Kconfig b/xen/arch/arm/firmware/Kconfig
> index fc7918c7fc56..02d7b600317f 100644
> --- a/xen/arch/arm/firmware/Kconfig
> +++ b/xen/arch/arm/firmware/Kconfig
> @@ -8,9 +8,18 @@ config ARM_SCI
>  
>  menu "Firmware Drivers"
>  
> +choice
> +	prompt "ARM SCI driver type"
> +	default ARM_SCI_NONE
> +	help
> +	Choose which ARM SCI driver to enable.
> +
> +config ARM_SCI_NONE
> +	bool "none"
> +
>  config SCMI_SMC
>  	bool "Forward SCMI over SMC calls from hwdom to EL3 firmware"
> -	default y
> +	select ARM_SCI
>  	help
>  	  This option enables basic awareness for SCMI calls using SMC as
>  	  doorbell mechanism and Shared Memory for transport ("arm,scmi-smc"
> @@ -18,4 +27,6 @@ config SCMI_SMC
>  	  firmware node is used to trap and forward corresponding SCMI SMCs
>  	  to firmware running at EL3, for calls coming from the hardware domain.
>  
> +endchoice
> +
>  endmenu
> diff --git a/xen/arch/arm/firmware/scmi-smc.c b/xen/arch/arm/firmware/scmi-smc.c
> index 33473c04b181..188bd659513b 100644
> --- a/xen/arch/arm/firmware/scmi-smc.c
> +++ b/xen/arch/arm/firmware/scmi-smc.c
> @@ -9,6 +9,7 @@
>   * Copyright 2024 NXP
>   */
>  
> +#include <asm/device.h>
>  #include <xen/acpi.h>
>  #include <xen/device_tree.h>
>  #include <xen/errno.h>
> @@ -16,12 +17,11 @@
>  #include <xen/sched.h>
>  #include <xen/types.h>
>  
> +#include <asm/firmware/sci.h>
>  #include <asm/smccc.h>
> -#include <asm/firmware/scmi-smc.h>
>  
>  #define SCMI_SMC_ID_PROP   "arm,smc-id"
>  
> -static bool __ro_after_init scmi_enabled;
>  static uint32_t __ro_after_init scmi_smc_id;
>  
>  /*
> @@ -41,14 +41,11 @@ static bool scmi_is_valid_smc_id(uint32_t fid)
>   *
>   * Returns true if SMC was handled (regardless of response), false otherwise.
>   */
> -bool scmi_handle_smc(struct cpu_user_regs *regs)
> +static bool scmi_handle_smc(struct cpu_user_regs *regs)
>  {
>      uint32_t fid = (uint32_t)get_user_reg(regs, 0);
>      struct arm_smccc_res res;
>  
> -    if ( !scmi_enabled )
> -        return false;
> -
>      if ( !scmi_is_valid_smc_id(fid) )
>          return false;
>  
> @@ -78,49 +75,45 @@ bool scmi_handle_smc(struct cpu_user_regs *regs)
>      return true;
>  }
>  
> -static int __init scmi_check_smccc_ver(void)
> +static int scmi_smc_domain_init(struct domain *d,
> +                                struct xen_domctl_createdomain *config)
>  {
> -    if ( smccc_ver < ARM_SMCCC_VERSION_1_1 )
> -    {
> -        printk(XENLOG_WARNING
> -               "SCMI: No SMCCC 1.1 support, SCMI calls forwarding disabled\n");
> -        return -ENOSYS;
> -    }
> +    if ( !is_hardware_domain(d) )
> +        return 0;
>  
> +    d->arch.sci_enabled = true;
> +    printk(XENLOG_DEBUG "SCMI: %pd init\n", d);
>      return 0;
>  }
>  
> -static int __init scmi_dt_init_smccc(void)
> +static void scmi_smc_domain_destroy(struct domain *d)
>  {
> -    static const struct dt_device_match scmi_ids[] __initconst =
> -    {
> -        /* We only support "arm,scmi-smc" binding for now */
> -        DT_MATCH_COMPATIBLE("arm,scmi-smc"),
> -        { /* sentinel */ },
> -    };
> -    const struct dt_device_node *scmi_node;
> -    int ret;
> +    if ( !is_hardware_domain(d) )
> +        return;
>  
> -    /* If no SCMI firmware node found, fail silently as it's not mandatory */
> -    scmi_node = dt_find_matching_node(NULL, scmi_ids);
> -    if ( !scmi_node )
> -        return -EOPNOTSUPP;
> +    printk(XENLOG_DEBUG "SCMI: %pd destroy\n", d);
> +}
>  
> -    ret = dt_property_read_u32(scmi_node, SCMI_SMC_ID_PROP, &scmi_smc_id);
> -    if ( !ret )
> +static int __init scmi_check_smccc_ver(void)
> +{
> +    if ( smccc_ver < ARM_SMCCC_VERSION_1_1 )
>      {
> -        printk(XENLOG_ERR "SCMI: No valid \"%s\" property in \"%s\" DT node\n",
> -               SCMI_SMC_ID_PROP, scmi_node->full_name);
> -        return -ENOENT;
> +        printk(XENLOG_WARNING
> +               "SCMI: No SMCCC 1.1 support, SCMI calls forwarding disabled\n");
> +        return -ENOSYS;
>      }
>  
> -    scmi_enabled = true;
> -
>      return 0;
>  }
>  
> +static const struct sci_mediator_ops scmi_smc_ops = {
> +    .handle_call = scmi_handle_smc,
> +    .domain_init = scmi_smc_domain_init,
> +    .domain_destroy = scmi_smc_domain_destroy,
> +};
> +
>  /* Initialize the SCMI layer based on SMCs and Device-tree */
> -static int __init scmi_init(void)
> +static int __init scmi_dom0_init(struct dt_device_node *dev, const void *data)
>  {
>      int ret;
>  
> @@ -134,22 +127,36 @@ static int __init scmi_init(void)
>      if ( ret )
>          return ret;
>  
> -    ret = scmi_dt_init_smccc();
> -    if ( ret == -EOPNOTSUPP )
> -        return ret;
> +    ret = dt_property_read_u32(dev, SCMI_SMC_ID_PROP, &scmi_smc_id);
> +    if ( !ret )
> +    {
> +        printk(XENLOG_ERR "SCMI: No valid \"%s\" property in \"%s\" DT node\n",
> +               SCMI_SMC_ID_PROP, dt_node_full_name(dev));
> +        return -ENOENT;
> +    }
> +
> +    ret = sci_register(&scmi_smc_ops);
>      if ( ret )
> -        goto err;
> +    {
> +        printk(XENLOG_ERR "SCMI: mediator already registered (ret = %d)\n",
> +               ret);
> +        return ret;
> +    }
>  
>      printk(XENLOG_INFO "Using SCMI with SMC ID: 0x%x\n", scmi_smc_id);
>  
>      return 0;
> -
> - err:
> -    printk(XENLOG_ERR "SCMI: Initialization failed (ret = %d)\n", ret);
> -    return ret;
>  }
>  
> -__initcall(scmi_init);
> +static const struct dt_device_match scmi_smc_match[] __initconst = {
> +    DT_MATCH_COMPATIBLE("arm,scmi-smc"),
> +    { /* sentinel */ },
> +};
> +
> +DT_DEVICE_START(gicv3, "SCMI SMC DOM0", DEVICE_ARM_SCI)

The name should be scmi_smc instead of gicv3?

> +    .dt_match = scmi_smc_match,
> +    .init = scmi_dom0_init,
> +DT_DEVICE_END
>  
>  /*
>   * Local variables:
> diff --git a/xen/arch/arm/include/asm/firmware/scmi-smc.h b/xen/arch/arm/include/asm/firmware/scmi-smc.h
> deleted file mode 100644
> index 6b1a164a400e..000000000000
> --- a/xen/arch/arm/include/asm/firmware/scmi-smc.h
> +++ /dev/null
> @@ -1,41 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0-only */
> -/*
> - * xen/arch/arm/include/asm/firmware/scmi-smc.h
> - *
> - * ARM System Control and Management Interface (SCMI) over SMC
> - * Generic handling layer
> - *
> - * Andrei Cherechesu <andrei.cherechesu@nxp.com>
> - * Copyright 2024 NXP
> - */
> -
> -#ifndef __ASM_SCMI_SMC_H__
> -#define __ASM_SCMI_SMC_H__
> -
> -#include <xen/types.h>
> -
> -struct cpu_user_regs;
> -
> -#ifdef CONFIG_SCMI_SMC
> -
> -bool scmi_handle_smc(struct cpu_user_regs *regs);
> -
> -#else
> -
> -static inline bool scmi_handle_smc(struct cpu_user_regs *regs)
> -{
> -    return false;
> -}
> -
> -#endif /* CONFIG_SCMI_SMC */
> -
> -#endif /* __ASM_SCMI_H__ */
> -
> -/*
> - * Local variables:
> - * mode: C
> - * c-file-style: "BSD"
> - * c-basic-offset: 4
> - * indent-tabs-mode: nil
> - * End:
> - */
> diff --git a/xen/arch/arm/vsmc.c b/xen/arch/arm/vsmc.c
> index 51b3c0297314..b33c69a1c22a 100644
> --- a/xen/arch/arm/vsmc.c
> +++ b/xen/arch/arm/vsmc.c
> @@ -21,7 +21,6 @@
>  #include <asm/traps.h>
>  #include <asm/vpsci.h>
>  #include <asm/platform.h>
> -#include <asm/firmware/scmi-smc.h>
>  
>  /* Number of functions currently supported by Hypervisor Service. */
>  #define XEN_SMCCC_FUNCTION_COUNT 3
> @@ -233,7 +232,7 @@ static bool handle_sip(struct cpu_user_regs *regs)
>      if ( platform_smc(regs) )
>          return true;
>  
> -    return scmi_handle_smc(regs);
> +    return sci_handle_call(regs);

Is this change...


>  }
>  
>  /*
> @@ -301,8 +300,6 @@ static bool vsmccc_handle_call(struct cpu_user_regs *regs)
>              break;
>          case ARM_SMCCC_OWNER_SIP:
>              handled = handle_sip(regs);
> -            if ( !handled )
> -                handled = sci_handle_call(regs);

the one allowing this to be removed? Are we sure all possible SCIs are
SIPs?


>              break;
>          case ARM_SMCCC_OWNER_TRUSTED_APP ... ARM_SMCCC_OWNER_TRUSTED_APP_END:
>          case ARM_SMCCC_OWNER_TRUSTED_OS ... ARM_SMCCC_OWNER_TRUSTED_OS_END:
> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
> index 55eed9992c9d..095b1a23e30c 100644
> --- a/xen/include/public/arch-arm.h
> +++ b/xen/include/public/arch-arm.h
> @@ -328,6 +328,7 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
>  #define XEN_DOMCTL_CONFIG_TEE_FFA       2
>  
>  #define XEN_DOMCTL_CONFIG_ARM_SCI_NONE      0
> +#define XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC  1
>  
>  struct xen_arch_domainconfig {
>      /* IN/OUT */
> -- 
> 2.34.1
> 

