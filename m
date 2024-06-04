Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E70698FB064
	for <lists+xen-devel@lfdr.de>; Tue,  4 Jun 2024 12:50:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.735327.1141497 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sERkP-0001eR-1J; Tue, 04 Jun 2024 10:50:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 735327.1141497; Tue, 04 Jun 2024 10:50:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sERkO-0001cZ-Uu; Tue, 04 Jun 2024 10:50:32 +0000
Received: by outflank-mailman (input) for mailman id 735327;
 Tue, 04 Jun 2024 10:50:31 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sERkN-0001cT-CF
 for xen-devel@lists.xenproject.org; Tue, 04 Jun 2024 10:50:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sERkM-00088Q-RG; Tue, 04 Jun 2024 10:50:30 +0000
Received: from [62.28.225.65] (helo=[172.20.145.71])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sERkM-0000gn-Io; Tue, 04 Jun 2024 10:50:30 +0000
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
	bh=z6vpzpsfxfMyMDwp7y9YIOP9EZv+qTKBIiUzP933kQ8=; b=xO2R9AL+pLfrSeiUMHW2AW66S0
	+RDWG0tO4XHhA5Bj5CLilqkidi0A0khhAbYQXUTq7iOgmH06rIHkxI8Tl2fN6BpxXHjJQjD9lus3t
	asqFpt8T4hw3IfRltmom2MQcGV+lJ+G4N1v3sQ1WYOKJHLzk/qrFClSqgm/glKC1VFes=;
Message-ID: <9e62b5d9-9c80-4f7c-9cc6-3b863f0c90ad@xen.org>
Date: Tue, 4 Jun 2024 11:50:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2] arm: dom0less: add TEE support
Content-Language: en-GB
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <20240531174915.1679443-1-volodymyr_babchuk@epam.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240531174915.1679443-1-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Volodymyr,

On 31/05/2024 18:49, Volodymyr Babchuk wrote:
> Extend TEE mediator interface with two functions :
> 
>   - tee_get_type_from_dts() returns TEE type based on input string
>   - tee_make_dtb_node() creates a DTB entry for the selected
>     TEE mediator
> 
> Use those new functions to parse "xen,tee" DTS property for dom0less
> guests and enable appropriate TEE mediator.
> 
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> 
> ---
> 
> This is still RFC because I am not happy how I decide if
> tee_make_dtb_node() needs to be called.
> 
> TEE type is stored in d_cfg, but d_cfg is not passed to
> construct_domU()->prepare_dtb_domU(). So right now I am relying on
> fact that every TEE mediator initilizes d->arch.tee.
> 
> Also I am sorry about previous completely botched version of this
> patch. I really messed it up, including absence of [RFC] tag :(

That's fine. We all sent botched patches at least once :). Some comments 
below on the series.

> 
> ---
>   docs/misc/arm/device-tree/booting.txt | 17 +++++++++++++
>   xen/arch/arm/dom0less-build.c         | 19 +++++++++++++++
>   xen/arch/arm/include/asm/tee/tee.h    | 13 ++++++++++
>   xen/arch/arm/tee/ffa.c                |  8 ++++++
>   xen/arch/arm/tee/optee.c              | 35 +++++++++++++++++++++++++++
>   xen/arch/arm/tee/tee.c                | 21 ++++++++++++++++
>   6 files changed, 113 insertions(+)
> 
> diff --git a/docs/misc/arm/device-tree/booting.txt b/docs/misc/arm/device-tree/booting.txt
> index bbd955e9c2..711a6080b5 100644
> --- a/docs/misc/arm/device-tree/booting.txt
> +++ b/docs/misc/arm/device-tree/booting.txt
> @@ -231,6 +231,23 @@ with the following properties:
>       In the future other possible property values might be added to
>       enable only selected interfaces.
>   
> +- xen,tee
> +
> +    A string property that describes what TEE mediator should be enabled
> +    for the domain. Possible property values are:
> +
> +    - "none" (or missing property value)
> +    No TEE will be available in the VM.
> +
> +    - "OP-TEE"
> +    VM will have access to the OP-TEE using classic OP-TEE SMC interface.
> +
> +    - "FF-A"
> +    VM will have access to a TEE using generic FF-A interface.

I understand why you chose those name, but it also means we are using 
different name in XL and Dom0less. I would rather prefer if they are the 
same.

> +
> +    In the future other TEE mediators may be added, extending possible
> +    values for this property.
> +
>   - xen,domain-p2m-mem-mb
>   
>       Optional. A 32-bit integer specifying the amount of megabytes of RAM
> diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
> index fb63ec6fd1..13fdd44eef 100644
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
> @@ -650,6 +651,10 @@ static int __init prepare_dtb_domU(struct domain *d, struct kernel_info *kinfo)
>       if ( ret )
>           goto err;
>   
> +    /* We are making assumption that every mediator sets d->arch.tee */
> +    if ( d->arch.tee )

I think the assumption is Ok. I would consider to move this check in 
each TEE callback. IOW call tee_make_dtb_node() unconditionally.

> +        tee_make_dtb_node(kinfo->fdt);

AFAICT, tee_make_dtb_node() can return an error. So please check the 
return value.

> +
>       /*
>        * domain_handle_dtb_bootmodule has to be called before the rest of
>        * the device tree is generated because it depends on the value of
> @@ -871,6 +876,7 @@ void __init create_domUs(void)
>           unsigned int flags = 0U;
>           uint32_t val;
>           int rc;
> +        const char *tee_name;
>   
>           if ( !dt_device_is_compatible(node, "xen,domain") )
>               continue;
> @@ -881,6 +887,19 @@ void __init create_domUs(void)
>           if ( dt_find_property(node, "xen,static-mem", NULL) )
>               flags |= CDF_staticmem;
>   
> +        tee_name = dt_get_property(node, "xen,tee", NULL);

In the previous version, you used dt_property_read_property_string() 
which contained some sanity check. Can you explain why you switch to 
dt_get_property()?

> +        if ( tee_name )
> +        {
> +            rc = tee_get_type_from_dts(tee_name);
> +            if ( rc < 0) > +                panic("Can't enable requested TEE for domain: %d\n", 
rc);> +            d_cfg.arch.tee_type = rc;
> +        }
> +        else
> +        {

NIT: The parentheses are not necessary.

> +            d_cfg.arch.tee_type = XEN_DOMCTL_CONFIG_TEE_NONE;
> +        }
> +
>           if ( dt_property_read_bool(node, "direct-map") )
>           {
>               if ( !(flags & CDF_staticmem) )

Cheers,

---
Julien Grall

