Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44263523CE7
	for <lists+xen-devel@lfdr.de>; Wed, 11 May 2022 20:52:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.327199.549955 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1norRh-0005EQ-OF; Wed, 11 May 2022 18:52:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 327199.549955; Wed, 11 May 2022 18:52:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1norRh-0005B8-KL; Wed, 11 May 2022 18:52:25 +0000
Received: by outflank-mailman (input) for mailman id 327199;
 Wed, 11 May 2022 18:52:24 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1norRg-0005B2-9j
 for xen-devel@lists.xenproject.org; Wed, 11 May 2022 18:52:24 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1norRf-0005O7-4U; Wed, 11 May 2022 18:52:23 +0000
Received: from [54.239.6.188] (helo=[192.168.11.111])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1norRe-0007Bn-U3; Wed, 11 May 2022 18:52:23 +0000
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
	bh=xDJc54aGWs6VPC/aAYJYP9EWKMv/TbUIb1SicvFfR1Q=; b=lzas2N7VAy0lYtgEk/VhsiGpRT
	Witxyx+C1mxVxPyLtgwyQ2AHHNiDDbJwP+0k+J76qbQu+wpYDO9zOXGgKte5chwouvEa+PWu9evZf
	pN3lcU+iTcXyRaK9rEk2mxZWSVzXRCa7bxJOl7aoYEyhFUdTQ0F0Vz4s2Y/U6+LFAbmU=;
Message-ID: <f0eb9ccd-28d0-8709-faa5-88d67da4772c@xen.org>
Date: Wed, 11 May 2022 19:52:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH v6 4/7] xen/arm: configure dom0less domain for enabling
 xenstore after boot
To: Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org
Cc: jgross@suse.com, Bertrand.Marquis@arm.com, Volodymyr_Babchuk@epam.com,
 Luca Miccio <lucmiccio@gmail.com>,
 Stefano Stabellini <stefano.stabellini@xilinx.com>, jbeulich@suse.com
References: <alpine.DEB.2.22.394.2205041715320.43560@ubuntu-linux-20-04-desktop>
 <20220505001656.395419-4-sstabellini@kernel.org>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220505001656.395419-4-sstabellini@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 05/05/2022 01:16, Stefano Stabellini wrote:
> From: Luca Miccio <lucmiccio@gmail.com>
> 
> Export evtchn_alloc_unbound and make it __must_check.
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
> CC: jbeulich@suse.com
> 
> ---
> Changes in v5:
> - merge with "xen: export evtchn_alloc_unbound"
> - __must_check
> 
> Changes in v3:
> - use evtchn_alloc_unbound
> 
> Changes in v2:
> - set HVM_PARAM_STORE_PFN to ~0ULL at domain creation
> - in alloc_xenstore_evtchn do not call _evtchn_alloc_unbound
> 
> xen: export evtchn_alloc_unbound
> 
> It will be used during dom0less domains construction.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> ---
>   xen/arch/arm/domain_build.c | 37 +++++++++++++++++++++++++++++++++++++
>   xen/common/event_channel.c  |  2 +-
>   xen/include/xen/event.h     |  3 +++
>   3 files changed, 41 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 016f56a99f..bb430f2189 100644
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
> @@ -2810,6 +2811,8 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
>       int ret;
>   
>       kinfo->phandle_gic = GUEST_PHANDLE_GIC;
> +    kinfo->gnttab_start = GUEST_GNTTAB_BASE;
> +    kinfo->gnttab_size = GUEST_GNTTAB_SIZE;
>   
>       addrcells = GUEST_ROOT_ADDRESS_CELLS;
>       sizecells = GUEST_ROOT_SIZE_CELLS;
> @@ -2884,6 +2887,13 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
>               goto err;
>       }
>   
> +    if ( kinfo->dom0less_enhanced )
> +    {
> +        ret = make_hypervisor_node(d, kinfo, addrcells, sizecells);
> +        if ( ret )
> +            goto err;
> +    }
> +
>       ret = fdt_end_node(kinfo->fdt);
>       if ( ret < 0 )
>           goto err;
> @@ -3150,6 +3160,25 @@ static int __init construct_domain(struct domain *d, struct kernel_info *kinfo)
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
> +    rc = evtchn_alloc_unbound(&alloc);
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
> @@ -3214,6 +3243,14 @@ static int __init construct_domU(struct domain *d,
>       if ( rc < 0 )
>           return rc;
>   
> +    if ( kinfo.dom0less_enhanced )
> +    {
> +        rc = alloc_xenstore_evtchn(d);
> +        if ( rc < 0 )
> +            return rc;
> +        d->arch.hvm.params[HVM_PARAM_STORE_PFN] = ~0ULL;

This sounds a little bit odd that we set the value to ~0ULL with 
dom0less_enhanced but keep it to 0 outside of dom0less.

If there are any rationale for that, then I would suggest to add a 
comment. (Can be done on commit).

For the common part:

Acked-by: Julien Grall <jgrall@amazon.com> # common

Cheers,

-- 
Julien Grall

