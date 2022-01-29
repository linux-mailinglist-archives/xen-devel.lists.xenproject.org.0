Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 583074A314F
	for <lists+xen-devel@lfdr.de>; Sat, 29 Jan 2022 19:13:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.262289.454474 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDsDw-0000sz-2J; Sat, 29 Jan 2022 18:13:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 262289.454474; Sat, 29 Jan 2022 18:13:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nDsDv-0000qw-Uv; Sat, 29 Jan 2022 18:13:19 +0000
Received: by outflank-mailman (input) for mailman id 262289;
 Sat, 29 Jan 2022 18:13:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nDsDu-0000qq-5F
 for xen-devel@lists.xenproject.org; Sat, 29 Jan 2022 18:13:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nDsDt-0007Rd-Fn; Sat, 29 Jan 2022 18:13:17 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=[192.168.0.221]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nDsDt-00055E-9C; Sat, 29 Jan 2022 18:13:17 +0000
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
	bh=y1tr6zECahI/dgKeBm/NEcPYt50bKW8+Yai/bm9qMD0=; b=h6C3BrHfxdJtLnFwEJsEb2jJoR
	xPWwX4E6sjYN4TgTBI+rHhnpixTMgsbensclpM9YwQn+jMc7zY0VxtLBQEI2eTLAf3WzoUuIlfWXz
	uq6fIHoXLEd4YOQcyNZYsH9ApViaFylbsJQAf5HfHoh7oWNpEO6I2GPosSYOL0lKETgw=;
Message-ID: <e55c03f6-5b20-ce9c-ce88-11dc85623dce@xen.org>
Date: Sat, 29 Jan 2022 18:13:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH v3 3/5] xen/arm: configure dom0less domain for enabling
 xenstore after boot
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: jgross@suse.com, Bertrand.Marquis@arm.com, Volodymyr_Babchuk@epam.com,
 Luca Miccio <lucmiccio@gmail.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>
References: <alpine.DEB.2.22.394.2201281330520.27308@ubuntu-linux-20-04-desktop>
 <20220128213307.2822078-3-sstabellini@kernel.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220128213307.2822078-3-sstabellini@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 28/01/2022 21:33, Stefano Stabellini wrote:
> From: Luca Miccio <lucmiccio@gmail.com>
> 
> If "xen,enhanced" is enabled, then add to dom0less domains:
> 
> - the hypervisor node in device tree
> - the xenstore event channel
> 
> The xenstore event channel is also used for the first notification to
> let the guest know that xenstore has become available.
> 
> Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> Reviewed-by: Bertrand Marquis <bertrand.marquis@arm.com>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> 
> ---
> Changes in v3:
> - use evtchn_alloc_unbound
> 
> Changes in v2:
> - set HVM_PARAM_STORE_PFN to ~0ULL at domain creation
> - in alloc_xenstore_evtchn do not call _evtchn_alloc_unbound
> ---
>   xen/arch/arm/domain_build.c | 41 +++++++++++++++++++++++++++++++++++++
>   1 file changed, 41 insertions(+)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 9144d6c0b6..8e030a7f05 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -27,6 +27,7 @@
>   #include <asm/setup.h>
>   #include <asm/cpufeature.h>
>   #include <asm/domain_build.h>
> +#include <xen/event.h>
>   
>   #include <xen/irq.h>
>   #include <xen/grant_table.h>
> @@ -2619,6 +2620,8 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
>       int ret;
>   
>       kinfo->phandle_gic = GUEST_PHANDLE_GIC;
> +    kinfo->gnttab_start = GUEST_GNTTAB_BASE;
> +    kinfo->gnttab_size = GUEST_GNTTAB_SIZE;
>   
>       addrcells = GUEST_ROOT_ADDRESS_CELLS;
>       sizecells = GUEST_ROOT_SIZE_CELLS;
> @@ -2693,6 +2696,13 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
>               goto err;
>       }
>   
> +    if ( kinfo->dom0less_enhanced )
> +    {
> +        ret = make_hypervisor_node(d, kinfo, addrcells, sizecells);

Looking at the code, I think the extended regions will not work properly 
because we are looking at the host memory layout. In the case of domU, 
we want to use the guest layout. Please have a look how it was done in 
libxl.

> +        if ( ret )
> +            goto err;
> +    }
> +
>       ret = fdt_end_node(kinfo->fdt);
>       if ( ret < 0 )
>           goto err;
> @@ -2959,6 +2969,25 @@ static int __init construct_domain(struct domain *d, struct kernel_info *kinfo)
>       return 0;
>   }
>   
> +static int __init alloc_xenstore_evtchn(struct domain *d)
> +{
> +    evtchn_alloc_unbound_t alloc;
> +    int rc;
> +
> +    alloc.dom = d->domain_id;
> +    alloc.remote_dom = hardware_domain->domain_id;

The first thing evtchn_alloc_unbound() will do is looking up the domain. 
This seems a bit pointless given that we have the domain in hand. 
Shouldn't we extend evtchn_alloc_unbound() to pass the domain?

> +    rc = evtchn_alloc_unbound(&alloc, true);
> +    if ( rc )
> +    {
> +        printk("Failed allocating event channel for domain\n");
> +        return rc;
> +    }
> +
> +    d->arch.hvm.params[HVM_PARAM_STORE_EVTCHN] = alloc.port;
> +
> +    return 0;
> +}
> +
>   static int __init construct_domU(struct domain *d,
>                                    const struct dt_device_node *node)
>   {
> @@ -3014,7 +3043,19 @@ static int __init construct_domU(struct domain *d,
>           return rc;
>   
>       if ( kinfo.vpl011 )
> +    {
>           rc = domain_vpl011_init(d, NULL);
> +        if ( rc < 0 )
> +            return rc;
> +    }
> +
> +    if ( kinfo.dom0less_enhanced )
> +    {
> +        rc = alloc_xenstore_evtchn(d);
> +        if ( rc < 0 )
> +            return rc;
> +        d->arch.hvm.params[HVM_PARAM_STORE_PFN] = ~0ULL;

I think it would be easy to allocate the page right now. So what prevent 
us to do it right now?

Cheers,

-- 
Julien Grall

