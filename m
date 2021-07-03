Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD6E3BA8D2
	for <lists+xen-devel@lfdr.de>; Sat,  3 Jul 2021 15:26:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.149492.276461 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzfeo-0003SY-GY; Sat, 03 Jul 2021 13:26:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 149492.276461; Sat, 03 Jul 2021 13:26:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lzfeo-0003QG-DO; Sat, 03 Jul 2021 13:26:06 +0000
Received: by outflank-mailman (input) for mailman id 149492;
 Sat, 03 Jul 2021 13:26:05 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lzfen-0003Q8-1E
 for xen-devel@lists.xenproject.org; Sat, 03 Jul 2021 13:26:05 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lzfem-0003Ii-05; Sat, 03 Jul 2021 13:26:04 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lzfel-0008Jb-QL; Sat, 03 Jul 2021 13:26:03 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=XvOslK9tGoMg5XCnqq1G7RAZ5HOjX1mCqIZCMegLo/o=; b=ZejDebksHYUqdBzcK0Ke96f5Ur
	YV6L7sYc2QTM+fh5w2BYL64VBm++kc0NiQDkRLoFQ6NMiaNbzHb2SDhDKKk3/nVAm78p64jXepciA
	A4tLQlZlWfCXcv8WXuKqll1XAg1cH7LGzZVpky9IJtXT1x4+w9ZmvaV0Yew0LNKeBfYc=;
Subject: Re: [PATCH 8/9] xen/arm: check `xen,static-mem` property during
 domain construction
To: Penny Zheng <penny.zheng@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org, jbeulich@suse.com
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com
References: <20210607024318.3988467-1-penny.zheng@arm.com>
 <20210607024318.3988467-9-penny.zheng@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <f613372a-eac8-f79b-2941-b7cce3e1e0e7@xen.org>
Date: Sat, 3 Jul 2021 14:26:01 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210607024318.3988467-9-penny.zheng@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Penny,

On 07/06/2021 03:43, Penny Zheng wrote:
> This commit checks `xen,static-mem` device tree property in /domUx node,
> to determine whether domain is on Static Allocation, when constructing
> domain during boot-up.
> 
> Right now, the implementation of allocate_static_memory is missing, and
> will be introduced later. It just BUG() out at the moment.
> 
> And if the `memory` property and `xen,static-mem` are both set, it shall
> be verified that if the memory size defined in both is consistent.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
> changes v2:
> - remove parsing procedure here
> - check the consistency when `xen,static-mem` and `memory` are both defined
> ---
>   xen/arch/arm/domain_build.c | 37 +++++++++++++++++++++++++++++++------
>   1 file changed, 31 insertions(+), 6 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 282416e74d..4166d7993c 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -2424,23 +2424,47 @@ static int __init construct_domU(struct domain *d,
>   {
>       struct kernel_info kinfo = {};
>       int rc;
> -    u64 mem;
> +    u64 mem, static_mem_size = 0;
> +    const struct dt_property *prop;
> +    bool static_mem = false;
> +
> +    d->max_pages = ~0U;
> +    /*
> +     * Guest RAM could be of static memory from static allocation,
> +     * which will be specified through "xen,static-mem" phandle.
> +     */
> +    prop = dt_find_property(node, "xen,static-mem", NULL);
> +    if ( prop )
> +    {
> +        static_mem = true;
> +        /* static_mem_size = allocate_static_memory(...); */
> +        BUG();
> +    }

I would prefer if the static memory is allocated close to 
allocate_memory() below. AFAICT, the reason you allocate here is because 
you want to have the property "memory" optional.

However, I am not entirely convinced this is a good idea to make 
optional. It would be easier for a reader to figure out from the 
device-tree how much memory we give to the guest.

>   
>       rc = dt_property_read_u64(node, "memory", &mem);
> -    if ( !rc )
> +    if ( !static_mem && !rc )
>       {
>           printk("Error building DomU: cannot read \"memory\" property\n");
>           return -EINVAL;
> +    } else if ( rc && static_mem )
> +    {
> +        if ( static_mem_size != mem * SZ_1K )
> +        {
> +            printk("Memory size in \"memory\" property isn't consistent with"
> +                   "the ones defined in \"xen,static-mem\".\n");
> +            return -EINVAL;
> +        }
>       } > -    kinfo.unassigned_mem = (paddr_t)mem * SZ_1K;
> +    kinfo.unassigned_mem = static_mem ? 0 : (paddr_t)mem * SZ_1K; >
> -    printk("*** LOADING DOMU cpus=%u memory=%"PRIx64"KB ***\n", d->max_vcpus, mem);
> +    printk("*** LOADING DOMU cpus=%u memory=%"PRIx64"KB ***\n",
> +            d->max_vcpus,
> +            static_mem ? static_mem_size : (kinfo.unassigned_mem) >> 10);


If we mandate the property "memory", then kinfo.unassigned_mem doesn't 
need to be touched. Instead, you could simply check the 
kinfo.unassigned_mem is equivalent to static_mem_size.

>   
>       kinfo.vpl011 = dt_property_read_bool(node, "vpl011");
>   
>       if ( vcpu_create(d, 0) == NULL )
>           return -ENOMEM;
> -    d->max_pages = ~0U;
>   
>       kinfo.d = d;
>   
> @@ -2452,7 +2476,8 @@ static int __init construct_domU(struct domain *d,
>       /* type must be set before allocate memory */
>       d->arch.type = kinfo.type;
>   #endif
> -    allocate_memory(d, &kinfo);
> +    if ( !static_mem )
> +        allocate_memory(d, &kinfo);
>   
>       rc = prepare_dtb_domU(d, &kinfo);
>       if ( rc < 0 )
> 

Cheers,

-- 
Julien Grall

