Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A31ABCB6C
	for <lists+xen-devel@lfdr.de>; Tue, 20 May 2025 01:30:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.990368.1374328 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH9uz-0004ee-GM; Mon, 19 May 2025 23:29:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 990368.1374328; Mon, 19 May 2025 23:29:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uH9uz-0004co-Cr; Mon, 19 May 2025 23:29:13 +0000
Received: by outflank-mailman (input) for mailman id 990368;
 Mon, 19 May 2025 23:29:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=klDL=YD=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uH9uy-0004c9-80
 for xen-devel@lists.xenproject.org; Mon, 19 May 2025 23:29:12 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 10b29514-3509-11f0-a2fa-13f23c93f187;
 Tue, 20 May 2025 01:29:10 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EE9585C566A;
 Mon, 19 May 2025 23:26:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C35EC4CEE4;
 Mon, 19 May 2025 23:29:07 +0000 (UTC)
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
X-Inumbo-ID: 10b29514-3509-11f0-a2fa-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747697348;
	bh=pLdSU8aYNSRM4c6HfUiNt4SomeBz/h9Ae2mnyku9/os=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=XFGVaOhtQYLphp/zN5dRmroygyvG1Bb8rztCX44948LibrHcFUEBsfEDy11BRQa8w
	 NQTp5nZOtqyCTIRKcFuwH6Ytgt4krah23NSC3oFgNdwJyCARCJKUkYwMXFt/wVfVDd
	 MQesvTXArG617zV0dzH2yaUeZIgVnCvrO/Yc03V8jdKOa6CVu5Z62CE6w6wwlCS9m7
	 wdvzZzViLipyLJYb7H0IvONSMNvXHx0aX1S1hJUESe1AR3ekjMmXoVSykSFZ0t2Gjv
	 6BhaB/U7wimz6Zc2QfcgW/XlXmyDSxD5KT1gluqbxglpFCxn3mH+8rOEhApcFgNJV1
	 vw/o8TxGQLcnw==
Date: Mon, 19 May 2025 16:29:05 -0700 (PDT)
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
Subject: Re: [RFC PATCH v4 2/8] xen/arm: scmi-smc: update to be used under
 sci subsystem
In-Reply-To: <21bdecf961b60fb0094b1f722444a45228aef878.1747669845.git.oleksii_moisieiev@epam.com>
Message-ID: <alpine.DEB.2.22.394.2505191628570.145034@ubuntu-linux-20-04-desktop>
References: <cover.1747669845.git.oleksii_moisieiev@epam.com> <21bdecf961b60fb0094b1f722444a45228aef878.1747669845.git.oleksii_moisieiev@epam.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 19 May 2025, Oleksii Moisieiev wrote:
> From: Grygorii Strashko <grygorii_strashko@epam.com>
> 
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
> There are no functional changes in general, the driver is just adopted
> to the SCI interface.
> 
> Signed-off-by: Grygorii Strashko <grygorii_strashko@epam.com>
> Signed-off-by: Oleksii Moisieiev <oleksii_moisieiev@epam.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> 
> 
> 
>  xen/arch/arm/firmware/Kconfig                | 13 ++-
>  xen/arch/arm/firmware/scmi-smc.c             | 93 +++++++++++---------
>  xen/arch/arm/include/asm/firmware/scmi-smc.h | 41 ---------
>  xen/arch/arm/vsmc.c                          |  5 +-
>  xen/include/public/arch-arm.h                |  1 +
>  5 files changed, 64 insertions(+), 89 deletions(-)
>  delete mode 100644 xen/arch/arm/include/asm/firmware/scmi-smc.h
> 
> diff --git a/xen/arch/arm/firmware/Kconfig b/xen/arch/arm/firmware/Kconfig
> index fc7918c7fc..bbf88fbb9a 100644
> --- a/xen/arch/arm/firmware/Kconfig
> +++ b/xen/arch/arm/firmware/Kconfig
> @@ -8,9 +8,18 @@ config ARM_SCI
>  
>  menu "Firmware Drivers"
>  
> +choice
> +	prompt "ARM SCI driver type"
> +	default SCMI_SMC
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
> index 33473c04b1..13d1137592 100644
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
> +DT_DEVICE_START(scmi_smc, "SCMI SMC DOM0", DEVICE_FIRMWARE)
> +    .dt_match = scmi_smc_match,
> +    .init = scmi_dom0_init,
> +DT_DEVICE_END
>  
>  /*
>   * Local variables:
> diff --git a/xen/arch/arm/include/asm/firmware/scmi-smc.h b/xen/arch/arm/include/asm/firmware/scmi-smc.h
> deleted file mode 100644
> index 6b1a164a40..0000000000
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
> index 51b3c02973..b33c69a1c2 100644
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
>  }
>  
>  /*
> @@ -301,8 +300,6 @@ static bool vsmccc_handle_call(struct cpu_user_regs *regs)
>              break;
>          case ARM_SMCCC_OWNER_SIP:
>              handled = handle_sip(regs);
> -            if ( !handled )
> -                handled = sci_handle_call(regs);
>              break;
>          case ARM_SMCCC_OWNER_TRUSTED_APP ... ARM_SMCCC_OWNER_TRUSTED_APP_END:
>          case ARM_SMCCC_OWNER_TRUSTED_OS ... ARM_SMCCC_OWNER_TRUSTED_OS_END:
> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
> index 55eed9992c..095b1a23e3 100644
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

