Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BBCAC80A5
	for <lists+xen-devel@lfdr.de>; Thu, 29 May 2025 18:03:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1000052.1380490 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKfiu-00032U-Cq; Thu, 29 May 2025 16:03:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1000052.1380490; Thu, 29 May 2025 16:03:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uKfiu-0002zx-A9; Thu, 29 May 2025 16:03:16 +0000
Received: by outflank-mailman (input) for mailman id 1000052;
 Thu, 29 May 2025 16:03:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1uKfis-0002zr-M5
 for xen-devel@lists.xenproject.org; Thu, 29 May 2025 16:03:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uKfis-008PjO-0V;
 Thu, 29 May 2025 16:03:14 +0000
Received: from [15.248.2.29] (helo=[10.24.66.169])
 by xenbits.xenproject.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <julien@xen.org>) id 1uKfis-00F5mZ-1L;
 Thu, 29 May 2025 16:03:14 +0000
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
	bh=zkH6wO2Jc9ucDpPtbdQM1mfSYmuHc5XcJF5Rb0Oq8dE=; b=wk0ccfAqJ0ST5arbyLOmAC5hAG
	rA0CgdTdMNzNrX/0tZ6kg0JYolpwro/nvfhz7i7F/HIQKb4C5Uh5BaZpOGpzbf2Js+o+fnPRD46kb
	oiyxbF7AugA/FQBAw4xK3CTpP8C4I8uID0jWfsXSVxWZdMD5Hpc+20N46AzB6ctXNEuQ=;
Message-ID: <8c93db26-fd37-4e37-9822-54986e5ee3cc@xen.org>
Date: Thu, 29 May 2025 17:03:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] xen/arm: dom0less: Add trap-unmapped-accesses
Content-Language: en-GB
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 xen-devel@lists.xenproject.org
Cc: sstabellini@kernel.org, bertrand.marquis@arm.com, michal.orzel@amd.com,
 Volodymyr_Babchuk@epam.com, andrew.cooper3@citrix.com, edgar.iglesias@amd.com
References: <20250529155024.1284227-1-edgar.iglesias@gmail.com>
 <20250529155024.1284227-3-edgar.iglesias@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20250529155024.1284227-3-edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Edgar,

On 29/05/2025 16:50, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> Add the trap-unmapped-accesses per-domain fdt property.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> ---
>   docs/misc/arm/device-tree/booting.txt | 9 +++++++++
>   xen/arch/arm/dom0less-build.c         | 9 ++++++++-
>   2 files changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
> index 59fa96a82e..8a5c40ddf3 100644
> --- a/docs/misc/arm/device-tree/booting.txt
> +++ b/docs/misc/arm/device-tree/booting.txt
> @@ -225,6 +225,15 @@ with the following properties:
>       option is provided with a non zero value, but the platform doesn't support
>       SVE.
>   
> +- trap-unmapped-accesses
> +
> +    Optional. An integer that configures handling of accesses to unmapped
> +    address ranges.
> +    If set to 0, guest accesses will read 0xFFFFFFFF and writes will be ignored.

Looking at the code, if I am not mistaken, it will only return this 
value for 32-bit. For 64-bit there will be a few Fs more and for less 
there will be less. So I think this needs to be reworded.

The rest looks good to me.

> +
> +    This option is only implemented for ARM where the default is 1.
> +
>   - xen,enhanced
>   
>       A string property. Possible property values are:
> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
> index a4e0a33632..69324aa597 100644
> --- a/xen/arch/arm/dom0less-build.c
> +++ b/xen/arch/arm/dom0less-build.c
> @@ -344,8 +344,15 @@ void __init arch_create_domUs(struct dt_device_node *node,
>   #endif
>       }
>   
> -    /* Trap accesses to unmapped areas. */
> +    /* Trap unmapped accesses by default. */
>       d_cfg->flags |= XEN_DOMCTL_CDF_trap_unmapped_accesses;
> +    if ( dt_property_read_u32(node, "trap-unmapped-accesses", &val) )
> +    {
> +        if ( val > 1 )
> +            panic("trap-unmapped-accesses: supported values are 0 or 1");
> +        if ( !val )
> +            d_cfg->flags &= ~XEN_DOMCTL_CDF_trap_unmapped_accesses;
> +    }
>   }
>   
>   int __init init_intc_phandle(struct kernel_info *kinfo, const char *name,

Cheers,

-- 
Julien Grall


