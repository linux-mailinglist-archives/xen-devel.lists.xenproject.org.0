Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E214CB3BE2A
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 16:43:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1101535.1454566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1us0JJ-0002JW-5B; Fri, 29 Aug 2025 14:42:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1101535.1454566; Fri, 29 Aug 2025 14:42:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1us0JJ-0002Hf-1J; Fri, 29 Aug 2025 14:42:37 +0000
Received: by outflank-mailman (input) for mailman id 1101535;
 Fri, 29 Aug 2025 14:42:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OeP6=3J=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1us0JH-0002HZ-NT
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 14:42:35 +0000
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [2a00:1450:4864:20::12a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 65d78884-84e6-11f0-8dd7-1b34d833f44b;
 Fri, 29 Aug 2025 16:42:33 +0200 (CEST)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-55f69e15914so759246e87.2
 for <xen-devel@lists.xenproject.org>; Fri, 29 Aug 2025 07:42:33 -0700 (PDT)
Received: from [192.168.0.110] ([91.123.151.69])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-55f67a419d3sm657316e87.132.2025.08.29.07.42.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Aug 2025 07:42:32 -0700 (PDT)
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
X-Inumbo-ID: 65d78884-84e6-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756478553; x=1757083353; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=swDZ+fntRONO5czR6KwW+GkUl6TgUf3mVzoeTy96+UA=;
        b=WfcbNU8cNq6R2rjuCsqs1eC4fa+cb1PI6wS7fFJBtKshPSXfDioaeipU7gVDZAeYpl
         CzQOyzwGs8vSkq5jFoeFEavjolKqDpr4x5iNCh/6XERU5QADk3vtBhnLN/A0Y54adoD/
         pk99rgomQSJvHqPY4BhhZvmEVzzpFnrkO8So8ZueJC4rCV7JvP+LO8y1vayCLvxpJZaI
         eswKZWLg35dq/AiaOX+zvCE6n6nWAWCBDd3UrSwuhElPOGrCPHMb5LxnJvv1LJTtdFXb
         A7Q06fYF5zAnqZxKfG96F+17uYIKcYJGPS+pKTZrvVO/9zADdka1tVK9OJc0fbNN3bje
         HQnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756478553; x=1757083353;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=swDZ+fntRONO5czR6KwW+GkUl6TgUf3mVzoeTy96+UA=;
        b=VylLbvTWonClBZUVASM6Gpbec6OFRON2dY6mEaiO6x5pYHt5IfPWTixvksReWSLRbq
         5s+F3OAFs9c4xhWCDEQU0OiKzEtZ2Cc7BXOmEEWgb2Pcjpkc0zao54SV22fWDtpCtaS0
         wxtZHvh0j864kNqTKpck0hxnUyVdf4+lh8gjCE0SRpUB8N2Pzp5PBcsqBDwtwuyialy0
         voZNEP+gUmUNVcp6yGrCv9qd73IHeW9sWnO6NdThoK/vUT/x3tV7apxQwteNMrNLIOyN
         zWGtV75hN0E0Cgie+AqpODf7QQTNm+9UK3XFNonJD8aAovzkO1mLDvA2O8cSDG0CD2mZ
         cakw==
X-Forwarded-Encrypted: i=1; AJvYcCWQGoaGYy2x32ewoQdzI+VYIXbmYODdZInjjuKe50fdmSX6ycaXhlvyyNZqpITEfgEhtfnNgj/A144=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzCQ60pZySps1swjLqxQr0LNCYrt2TwdI+Gbl9FPyKgNOWbeUIM
	M6acwVhEpXAw+2+sbJfjAnsVBOxxoul7Qq2fRfQ5Fvn9C1ikKdW+Y7og
X-Gm-Gg: ASbGncsjbCjNl9GrKaOLiG+O+4cLpDwZG0kPJb22pB4enUFoXd3JbpWN97Gmiq9wsAt
	ssDb3dZ2uCafVNqK+ynfniVJnD/hxnd7t3D1/7ecMAICQ/IjjU/RifLJDxIa7VcgSslBCr6tHnU
	xpqn5XB/yIXBnaL9ufEuTHyPMq0XGHtv/N4MPMid2KSnd8Dpjgpmol9iJrPWKdAiNA7qqy9dkFE
	E7RLxkSkYFlW1L/xS3PT12YjZtDfHpWTv4n9//VvsRLAidAOAaLb8qqmqhuDK14qu3oyJrb87Kc
	gKky5QWAPedWeGUwb3H1OlTtmOF+NwWqqULPObOvRs3w7LioSsLM5UBcjVWXkxNs4A6vrNF3kzl
	YSrvkAqE4jZdxSP29fZ3IenRXvuFHVpUdnpYS
X-Google-Smtp-Source: AGHT+IG8gb1xVes/hmugAqnhOm7mWQbjxuHoG+1PsX80zrHtIvyoovISTPIJqm96jFt/tUcZROeZDw==
X-Received: by 2002:a05:6512:2608:b0:55f:467f:37d6 with SMTP id 2adb3069b0e04-55f467f3e42mr5609485e87.35.1756478552512;
        Fri, 29 Aug 2025 07:42:32 -0700 (PDT)
Message-ID: <4eb6782d-2b5c-47e9-a81b-8bbeb17b83e6@gmail.com>
Date: Fri, 29 Aug 2025 17:42:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/4] xen/arm: scmi-smc: update to be used under sci
 subsystem
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Bertrand Marquis <bertrand.marquis@arm.com>, Jan Beulich
 <jbeulich@suse.com>, Juergen Gross <jgross@suse.com>,
 Julien Grall <julien@xen.org>, Michal Orzel <michal.orzel@amd.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Grygorii Strashko <grygorii_strashko@epam.com>
References: <cover.1756399156.git.oleksii_moisieiev@epam.com>
 <8e7e9dcdd643b6681a6127d56b68536b987141af.1756399156.git.oleksii_moisieiev@epam.com>
Content-Language: en-US
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <8e7e9dcdd643b6681a6127d56b68536b987141af.1756399156.git.oleksii_moisieiev@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 28.08.25 19:40, Oleksii Moisieiev wrote:


Hello Oleksii

the patch lgtm, just some comments

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
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> ---
> 
> Changes in v6:
> - add R-b tag
> 
>   xen/arch/arm/firmware/Kconfig                | 13 ++-
>   xen/arch/arm/firmware/scmi-smc.c             | 93 +++++++++++---------
>   xen/arch/arm/include/asm/firmware/scmi-smc.h | 41 ---------
>   xen/arch/arm/vsmc.c                          |  5 +-
>   xen/include/public/arch-arm.h                |  1 +
>   5 files changed, 64 insertions(+), 89 deletions(-)
>   delete mode 100644 xen/arch/arm/include/asm/firmware/scmi-smc.h
> 
> diff --git a/xen/arch/arm/firmware/Kconfig b/xen/arch/arm/firmware/Kconfig
> index fc7918c7fc..bbf88fbb9a 100644
> --- a/xen/arch/arm/firmware/Kconfig
> +++ b/xen/arch/arm/firmware/Kconfig
> @@ -8,9 +8,18 @@ config ARM_SCI
>   
>   menu "Firmware Drivers"
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
>   config SCMI_SMC
>   	bool "Forward SCMI over SMC calls from hwdom to EL3 firmware"
> -	default y
> +	select ARM_SCI
>   	help
>   	  This option enables basic awareness for SCMI calls using SMC as
>   	  doorbell mechanism and Shared Memory for transport ("arm,scmi-smc"
> @@ -18,4 +27,6 @@ config SCMI_SMC
>   	  firmware node is used to trap and forward corresponding SCMI SMCs
>   	  to firmware running at EL3, for calls coming from the hardware domain.
>   
> +endchoice
> +
>   endmenu
> diff --git a/xen/arch/arm/firmware/scmi-smc.c b/xen/arch/arm/firmware/scmi-smc.c
> index 33473c04b1..13d1137592 100644
> --- a/xen/arch/arm/firmware/scmi-smc.c
> +++ b/xen/arch/arm/firmware/scmi-smc.c
> @@ -9,6 +9,7 @@
>    * Copyright 2024 NXP
>    */
>   
> +#include <asm/device.h>

NIT: Should be included after "xen" headers
(could probably be updated on commit)

>   #include <xen/acpi.h>
>   #include <xen/device_tree.h>
>   #include <xen/errno.h>
> @@ -16,12 +17,11 @@
>   #include <xen/sched.h>
>   #include <xen/types.h>
>   
> +#include <asm/firmware/sci.h>
>   #include <asm/smccc.h>
> -#include <asm/firmware/scmi-smc.h>
>   
>   #define SCMI_SMC_ID_PROP   "arm,smc-id"
>   
> -static bool __ro_after_init scmi_enabled;
>   static uint32_t __ro_after_init scmi_smc_id;
>   
>   /*
> @@ -41,14 +41,11 @@ static bool scmi_is_valid_smc_id(uint32_t fid)
>    *
>    * Returns true if SMC was handled (regardless of response), false otherwise.
>    */
> -bool scmi_handle_smc(struct cpu_user_regs *regs)
> +static bool scmi_handle_smc(struct cpu_user_regs *regs)
>   {
>       uint32_t fid = (uint32_t)get_user_reg(regs, 0);
>       struct arm_smccc_res res;
>   
> -    if ( !scmi_enabled )
> -        return false;
> -
>       if ( !scmi_is_valid_smc_id(fid) )
>           return false;
>   
> @@ -78,49 +75,45 @@ bool scmi_handle_smc(struct cpu_user_regs *regs)
>       return true;
>   }
>   
> -static int __init scmi_check_smccc_ver(void)
> +static int scmi_smc_domain_init(struct domain *d,
> +                                struct xen_domctl_createdomain *config)
>   {
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
>       return 0;
>   }
>   
> -static int __init scmi_dt_init_smccc(void)
> +static void scmi_smc_domain_destroy(struct domain *d)
>   {
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
>       {
> -        printk(XENLOG_ERR "SCMI: No valid \"%s\" property in \"%s\" DT node\n",
> -               SCMI_SMC_ID_PROP, scmi_node->full_name);
> -        return -ENOENT;
> +        printk(XENLOG_WARNING
> +               "SCMI: No SMCCC 1.1 support, SCMI calls forwarding disabled\n");
> +        return -ENOSYS;
>       }
>   
> -    scmi_enabled = true;
> -
>       return 0;
>   }
>   
> +static const struct sci_mediator_ops scmi_smc_ops = {
> +    .handle_call = scmi_handle_smc,
> +    .domain_init = scmi_smc_domain_init,
> +    .domain_destroy = scmi_smc_domain_destroy,
> +};
> +
>   /* Initialize the SCMI layer based on SMCs and Device-tree */
> -static int __init scmi_init(void)
> +static int __init scmi_dom0_init(struct dt_device_node *dev, const void *data)
>   {
>       int ret;
>   
> @@ -134,22 +127,36 @@ static int __init scmi_init(void)
>       if ( ret )
>           return ret;
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

I know that you are just moving the code, but I wonder whether it makes 
sense to validate that retrieved value at least corresponds to SiP 
Service Calls (for the future hardening)?


> +
> +    ret = sci_register(&scmi_smc_ops);
>       if ( ret )
> -        goto err;
> +    {
> +        printk(XENLOG_ERR "SCMI: mediator already registered (ret = %d)\n",
> +               ret);
> +        return ret;
> +    }
>   
>       printk(XENLOG_INFO "Using SCMI with SMC ID: 0x%x\n", scmi_smc_id);
>   
>       return 0;
> -
> - err:
> -    printk(XENLOG_ERR "SCMI: Initialization failed (ret = %d)\n", ret);
> -    return ret;
>   }
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
>   /*
>    * Local variables:
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
> index 2469738fcc..78d5bdf56f 100644
> --- a/xen/arch/arm/vsmc.c
> +++ b/xen/arch/arm/vsmc.c
> @@ -21,7 +21,6 @@
>   #include <asm/traps.h>
>   #include <asm/vpsci.h>
>   #include <asm/platform.h>
> -#include <asm/firmware/scmi-smc.h>
>   
>   /* Number of functions currently supported by Hypervisor Service. */
>   #define XEN_SMCCC_FUNCTION_COUNT 3
> @@ -233,7 +232,7 @@ static bool handle_sip(struct cpu_user_regs *regs)
>       if ( platform_smc(regs) )
>           return true;
>   
> -    return scmi_handle_smc(regs);
> +    return sci_handle_call(regs);
>   }
>   
>   /*
> @@ -301,8 +300,6 @@ static bool vsmccc_handle_call(struct cpu_user_regs *regs)
>               break;
>           case ARM_SMCCC_OWNER_SIP:
>               handled = handle_sip(regs);
> -            if ( !handled )
> -                handled = sci_handle_call(regs);

These two lines where added by [PATCH v6 1/4] xen/arm: add generic SCI 
subsystem, but here they are removed. This is not a request for an extra 
work right now, but ideally the series should be splitted without an 
extra temporarily changes.

>               break;
>           case ARM_SMCCC_OWNER_TRUSTED_APP ... ARM_SMCCC_OWNER_TRUSTED_APP_END:
>           case ARM_SMCCC_OWNER_TRUSTED_OS ... ARM_SMCCC_OWNER_TRUSTED_OS_END:
> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
> index 55eed9992c..095b1a23e3 100644
> --- a/xen/include/public/arch-arm.h
> +++ b/xen/include/public/arch-arm.h
> @@ -328,6 +328,7 @@ DEFINE_XEN_GUEST_HANDLE(vcpu_guest_context_t);
>   #define XEN_DOMCTL_CONFIG_TEE_FFA       2
>   
>   #define XEN_DOMCTL_CONFIG_ARM_SCI_NONE      0
> +#define XEN_DOMCTL_CONFIG_ARM_SCI_SCMI_SMC  1
>   
>   struct xen_arch_domainconfig {
>       /* IN/OUT */


