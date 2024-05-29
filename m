Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 268048D4021
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 23:12:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.732388.1138373 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCQae-0004aC-Ps; Wed, 29 May 2024 21:12:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 732388.1138373; Wed, 29 May 2024 21:12:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCQae-0004XO-MM; Wed, 29 May 2024 21:12:08 +0000
Received: by outflank-mailman (input) for mailman id 732388;
 Wed, 29 May 2024 21:12:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sCQad-0004Vv-6H
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 21:12:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sCQac-0007ov-RU; Wed, 29 May 2024 21:12:06 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.0.211])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sCQac-0002qN-Jx; Wed, 29 May 2024 21:12:06 +0000
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
	bh=THmYiT9zAxdWi1+vL4P+XbWF6tAahHUIHfjQWlhZ2ic=; b=ia16PbdKvSXROAGscJhwOwK40l
	5J6zfCkh/Td3jyxD94v3IyKiF8NFnoys4aCpn218kBhCUqe6AfY2gQ7+hZhuLlCGdzFKFrOPFzZRp
	MrNTWU8mwNRs4MhZxehImljW3dC0dZiVee9nElJDraD69z+Zms51PT8C1iGclHOKzMCs=;
Message-ID: <be133b0b-5b22-4b82-b5f6-3c257b45553f@xen.org>
Date: Wed, 29 May 2024 22:12:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm: dom0less: add TEE support
Content-Language: en-GB
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <20240529204305.1402036-1-volodymyr_babchuk@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240529204305.1402036-1-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Volodymyr,

Can you clarify whether this is intended for the next release cycle?

On 29/05/2024 21:43, Volodymyr Babchuk wrote:
> Allow to provide TEE type for a Dom0less guest via "xen,tee"
> property. Create appropriate nodes in the guests' device tree and
> initialize tee subsystem for it.

The new property needs to be documented in 
docs/misc/arm/device-tree/booting.txt.

> 
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> ---
>   xen/arch/arm/dom0less-build.c     | 69 +++++++++++++++++++++++++++++++
>   xen/arch/arm/include/asm/kernel.h |  3 ++
>   2 files changed, 72 insertions(+)
> 
> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
> index fb63ec6fd1..1ea3ecc45c 100644
> --- a/xen/arch/arm/dom0less-build.c
> +++ b/xen/arch/arm/dom0less-build.c
> @@ -15,6 +15,7 @@
>   #include <asm/domain_build.h>
>   #include <asm/static-memory.h>
>   #include <asm/static-shmem.h>
> +#include <asm/tee/tee.h>
>   
>   bool __init is_dom0less_mode(void)
>   {
> @@ -277,6 +278,42 @@ static int __init make_vpl011_uart_node(struct kernel_info *kinfo)
>   }
>   #endif
>   
> +#ifdef CONFIG_OPTEE
> +static int __init make_optee_node(struct kernel_info *kinfo)

Please introduce a callback in the TEE framework that will create the 
OPTEE node.

[...]

>   /*
>    * Scan device tree properties for passthrough specific information.
>    * Returns < 0 on error
> @@ -650,6 +687,15 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
>       if ( ret )
>           goto err;
>   
> +#ifdef CONFIG_OPTEE
> +    if ( kinfo->tee_type == XEN_DOMCTL_CONFIG_TEE_OPTEE)
> +    {
> +        ret = make_optee_node(kinfo);
> +        if ( ret )
> +            goto err;
> +    }
> +#endif
> +
>       /*
>        * domain_handle_dtb_bootmodule has to be called before the rest of
>        * the device tree is generated because it depends on the value of
> @@ -743,6 +789,9 @@ static int __init construct_domU(struct domain *d,
>   {
>       struct kernel_info kinfo = {};
>       const char *dom0less_enhanced;
> +#ifdef CONFIG_TEE
> +    const char *tee;
> +#endif
>       int rc;
>       u64 mem;
>       u32 p2m_mem_mb;
> @@ -786,6 +835,18 @@ static int __init construct_domU(struct domain *d,
>       else if ( rc == 0 && !strcmp(dom0less_enhanced, "no-xenstore") )
>           kinfo.dom0less_feature = DOM0LESS_ENHANCED_NO_XS;
>   
> +#ifdef CONFIG_TEE

I would rather prefer if this code is implemented in tee.c. We also...

> +    rc = dt_property_read_string(node, "xen,tee", &tee);

... want to return an error if "xen,tee" exists because CONFIG_TEE is 
not set.

> +    if ( rc == -EILSEQ ||
> +         rc == -ENODATA ||
> +         (rc == 0 && !strcmp(tee, "none")) )
> +    {
> +        if ( !hardware_domain )


I don't understand this check. Why would we require dom0 for OP-TEE? In 
any case we should avoid to hide a feature behind the user back. At 
minimum, we should print a message, but I would rather prefer a panic() 
because the user asks for a feature and we denied it.

> +            kinfo.tee_type = XEN_DOMCTL_CONFIG_TEE_NONE;
Why don't we have a else case? Are you assuming that tee_type is 
initialized to TEE_NONE (which luckily happens to be 0)? If so, why do 
we need the check above?

> +    }
> +    else if ( rc == 0 && !strcmp(tee, "optee") )
> +        kinfo.tee_type = XEN_DOMCTL_CONFIG_TEE_OPTEE;

All the other values should be rejected.

> +#endif
>       if ( vcpu_create(d, 0) == NULL )
>           return -ENOMEM;
>   
> @@ -824,6 +885,14 @@ static int __init construct_domU(struct domain *d,
>               return rc;
>       }
>   
> +#ifdef CONFIG_TEE
> +    if ( kinfo.tee_type )
> +    {
> +        rc = tee_domain_init(d, kinfo.tee_type);

Can you explain why do you need to call tee_domain_init() rather than 
setting d_cfg.arch.tee_type just before domain_create() is called and 
rely on the latter to call the former?

> +        if ( rc < 0 )
> +            return rc;
> +    }
> +#endif
>       rc = prepare_dtb_domU(d, &kinfo);
>       if ( rc < 0 )
>           return rc;
> diff --git a/xen/arch/arm/include/asm/kernel.h b/xen/arch/arm/include/asm/kernel.h
> index 0a23e86c2d..7e7b3f4d56 100644
> --- a/xen/arch/arm/include/asm/kernel.h
> +++ b/xen/arch/arm/include/asm/kernel.h
> @@ -57,6 +57,9 @@ struct kernel_info {
>       /* Enable pl011 emulation */
>       bool vpl011;
>   
> +    /* TEE type */
> +    uint16_t tee_type;
> +
>       /* Enable/Disable PV drivers interfaces */
>       uint16_t dom0less_feature;
>   

Cheers,

-- 
Julien Grall

