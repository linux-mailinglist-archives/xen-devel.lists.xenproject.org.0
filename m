Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 275554D68E1
	for <lists+xen-devel@lfdr.de>; Fri, 11 Mar 2022 20:06:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.289224.490721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSkaG-0001Nd-2e; Fri, 11 Mar 2022 19:05:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 289224.490721; Fri, 11 Mar 2022 19:05:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nSkaF-0001Lo-Vi; Fri, 11 Mar 2022 19:05:51 +0000
Received: by outflank-mailman (input) for mailman id 289224;
 Fri, 11 Mar 2022 19:05:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nSkaE-0001Li-BG
 for xen-devel@lists.xenproject.org; Fri, 11 Mar 2022 19:05:50 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nSkaD-0007TX-Tf; Fri, 11 Mar 2022 19:05:49 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233] helo=[10.95.172.72])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nSkaD-0000bg-Mw; Fri, 11 Mar 2022 19:05:49 +0000
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
	bh=Suvb3LfmjFYbJRJ34pluTgk0Y3N1eRKOlk11Q45rlGw=; b=4gxWKgrnYKiylYcrl/qcP8USN/
	V0eAjup9bYe4uQn6aYE272JHKU/p4QK8qi/aGZ7AngXUIPfJVOBd0FjkImY4Vfox4kwmugh6NwJ26
	bVlsdUDiRVueJjEY9yofjD+toHwp7/YEolXjmUtx2qM2rIvz8/lE57BOa4Y+vpIo6aDw=;
Message-ID: <1b34e833-9b7d-2ab2-cabb-658e7045fea5@xen.org>
Date: Fri, 11 Mar 2022 19:05:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH 12/36] xen/arm: initialize cache coloring data for Dom0/U
To: Marco Solieri <marco.solieri@minervasys.tech>,
 xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Marco Solieri <marco.solieri@unimore.it>,
 Andrea Bastoni <andrea.bastoni@minervasys.tech>,
 Luca Miccio <lucmiccio@gmail.com>
References: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
 <20220304174701.1453977-13-marco.solieri@minervasys.tech>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220304174701.1453977-13-marco.solieri@minervasys.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 04/03/2022 17:46, Marco Solieri wrote:
> From: Luca Miccio <lucmiccio@gmail.com>
> 
> Initialize cache coloring configuration during domain creation. If no
> colors assignment is provided by the user, use the default one.
> The default configuration is the one assigned to Dom0. The latter is
> configured as a standard domain with default configuration.
> 
> Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
> Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
> ---
>   xen/arch/arm/domain.c       | 53 +++++++++++++++++++++++++++++++++++++
>   xen/arch/arm/domain_build.c |  5 +++-
>   2 files changed, 57 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 8110c1df86..33471b3c58 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -38,6 +38,7 @@
>   #include <asm/vfp.h>
>   #include <asm/vgic.h>
>   #include <asm/vtimer.h>
> +#include <asm/coloring.h>
>   
>   #include "vpci.h"
>   #include "vuart.h"
> @@ -782,6 +783,58 @@ int arch_domain_create(struct domain *d,
>       if ( (rc = domain_vpci_init(d)) != 0 )
>           goto fail;
>   
> +    d->max_colors = 0;

NIT: d is always zeroed when allocated. So it is not necessary to 
initialize the field again.

> +#ifdef CONFIG_COLORING

Please move this code in a separate helper. The new helper could be 
defined in coloring.c.

Furthermore, I would initialize the coloring information earlier in 
arch_domain_create(). This could be useful if we want to allocate 
internal structure from a color assigned to the domain.

> +    /* Setup domain colors */
> +    if ( !config->arch.colors.max_colors )
> +    {
> +        if ( !is_hardware_domain(d) )
> +            printk(XENLOG_INFO "Color configuration not found for dom%u, using default\n",

This message and the other below wants to be ratelimited. I would use 
XENLOG_G_{INFO, ERROR}.

Please use %pd instead of dom%u. This remark is valid for all the other 
use below.

> +                   d->domain_id);

This would need to be changed to 'd'.

> +        d->colors = setup_default_colors(&d->max_colors);

Looking at setup_default_colors(), it using "dom0_col_num". This implies 
we are using the dom0 color. Shouldn't we return an error if d is not 
the hardware domain?

Also, AFAICT, you allocate the memory but never free it.

> +        if ( !d->colors )
> +        {
> +            rc = -ENOMEM;
> +            printk(XENLOG_ERR "Color array allocation failed for dom%u\n",
> +                   d->domain_id);
> +            goto fail;
> +        }
> +    }
> +    else
> +    {
> +        int i, k;
> +
> +        d->colors = xzalloc_array(uint32_t, config->arch.colors.max_colors);

Same here.

> +        if ( !d->colors )
> +        {
> +            rc = -ENOMEM;
> +            printk(XENLOG_ERR "Failed to alloc colors for dom%u\n",
> +                   d->domain_id);
> +            goto fail;
> +        }
> +
> +        d->max_colors = config->arch.colors.max_colors;
> +        for ( i = 0, k = 0;
> +              k < d->max_colors && i < sizeof(config->arch.colors.colors) * 8;
> +              i++ )
> +        {
> +            if ( config->arch.colors.colors[i / 32] & (1 << (i % 32)) )
> +                d->colors[k++] = i;
> +        }
> +    }
> +
> +    printk("Dom%u colors: [ ", d->domain_id);
> +    for ( int i = 0; i < d->max_colors; i++ ) > +        printk("%u ", d->colors[i]);
> +    printk("]\n");

You will be able to get the same information using the debug-key. So I 
am not convinced this is warrant to print here. The more the 
configuration should always be the same as what the user requested.

> +
> +    if ( !check_domain_colors(d) )
> +    {
> +        rc = -EINVAL;
> +        printk(XENLOG_ERR "Failed to check colors for dom%u\n", d->domain_id);
> +        goto fail;
> +    }
> +#endif
>       return 0;
>   
>   fail:
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 8be01678de..9630d00066 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -3344,7 +3344,10 @@ void __init create_dom0(void)
>           printk(XENLOG_WARNING "Maximum number of vGIC IRQs exceeded.\n");
>       dom0_cfg.arch.tee_type = tee_get_type();
>       dom0_cfg.max_vcpus = dom0_max_vcpus();
> -
> +#ifdef CONFIG_COLORING
> +    /* Colors are set after domain_create */

Do you instead mean 'by'?

> +    dom0_cfg.arch.colors.max_colors = 0;
> +#endif
>       if ( iommu_enabled )
>           dom0_cfg.flags |= XEN_DOMCTL_CDF_iommu;
>   

Cheers,

-- 
Julien Grall

