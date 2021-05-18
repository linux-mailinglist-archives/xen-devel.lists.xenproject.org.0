Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DECC38787E
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 14:09:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.129143.242438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1liyXR-00008H-15; Tue, 18 May 2021 12:09:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 129143.242438; Tue, 18 May 2021 12:09:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1liyXQ-00005i-TH; Tue, 18 May 2021 12:09:28 +0000
Received: by outflank-mailman (input) for mailman id 129143;
 Tue, 18 May 2021 12:09:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1liyXP-00005V-FW
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 12:09:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1liyXP-00028H-8c; Tue, 18 May 2021 12:09:27 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1liyXP-00017N-2r; Tue, 18 May 2021 12:09:27 +0000
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
	bh=B75SvbFvvSGSgBV6m719z90SnL+abssGo0p4Kj3jQmk=; b=BzkxiSKuut5z200zepDDLDmlTk
	etBxQoar823Om8n5W4OAlnIRIQEr8+iYW8dqegilYaLVVpLD+kL8rN6Y0UmiO1uDZx61+SIpKCmBP
	SfwPztRivE9HMRDpEDovr2XUub1yDB/Eexb1rSJwLOwm5ddUaKBnPYY82V4KZqVJmR7E=;
Subject: Re: [PATCH 09/10] xen/arm: parse `xen,static-mem` info during domain
 construction
To: Penny Zheng <penny.zheng@arm.com>, xen-devel@lists.xenproject.org,
 sstabellini@kernel.org
Cc: Bertrand.Marquis@arm.com, Wei.Chen@arm.com, nd@arm.com
References: <20210518052113.725808-1-penny.zheng@arm.com>
 <20210518052113.725808-10-penny.zheng@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <61b41d12-c69e-fe41-0b5e-d35a485b4a51@xen.org>
Date: Tue, 18 May 2021 13:09:25 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210518052113.725808-10-penny.zheng@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Penny,

On 18/05/2021 06:21, Penny Zheng wrote:
> This commit parses `xen,static-mem` device tree property, to acquire
> static memory info reserved for this domain, when constructing domain
> during boot-up.
> 
> Related info shall be stored in new static_mem value under per domain
> struct arch_domain.

So far, this seems to only be used during boot. So can't this be kept in 
the kinfo structure?

> 
> Right now, the implementation of allocate_static_memory is missing, and
> will be introduced later. It just BUG() out at the moment.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
>   xen/arch/arm/domain_build.c  | 58 ++++++++++++++++++++++++++++++++----
>   xen/include/asm-arm/domain.h |  3 ++
>   2 files changed, 56 insertions(+), 5 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 282416e74d..30b55588b7 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -2424,17 +2424,61 @@ static int __init construct_domU(struct domain *d,
>   {
>       struct kernel_info kinfo = {};
>       int rc;
> -    u64 mem;
> +    u64 mem, static_mem_size = 0;
> +    const struct dt_property *prop;
> +    u32 static_mem_len;
> +    bool static_mem = false;
> +
> +    /*
> +     * Guest RAM could be of static memory from static allocation,
> +     * which will be specified through "xen,static-mem" property.
> +     */
> +    prop = dt_find_property(node, "xen,static-mem", &static_mem_len);
> +    if ( prop )
> +    {
> +        const __be32 *cell;
> +        u32 addr_cells = 2, size_cells = 2, reg_cells;
> +        u64 start, size;
> +        int i, banks;
> +        static_mem = true;
> +
> +        dt_property_read_u32(node, "#address-cells", &addr_cells);
> +        dt_property_read_u32(node, "#size-cells", &size_cells);
> +        BUG_ON(size_cells > 2 || addr_cells > 2);
> +        reg_cells = addr_cells + size_cells;
> +
> +        cell = (const __be32 *)prop->value;
> +        banks = static_mem_len / (reg_cells * sizeof (u32));
> +        BUG_ON(banks > NR_MEM_BANKS);
> +
> +        for ( i = 0; i < banks; i++ )
> +        {
> +            device_tree_get_reg(&cell, addr_cells, size_cells, &start, &size);
> +            d->arch.static_mem.bank[i].start = start;
> +            d->arch.static_mem.bank[i].size = size;
> +            static_mem_size += size;
> +
> +            printk(XENLOG_INFO
> +                    "Static Memory Bank[%d] for Domain %pd:"
> +                    "0x%"PRIx64"-0x%"PRIx64"\n",
> +                    i, d,
> +                    d->arch.static_mem.bank[i].start,
> +                    d->arch.static_mem.bank[i].start +
> +                    d->arch.static_mem.bank[i].size);
> +        }
> +        d->arch.static_mem.nr_banks = banks;
> +    }

Could we allocate the memory as we parse?

>   
>       rc = dt_property_read_u64(node, "memory", &mem);
> -    if ( !rc )
> +    if ( !static_mem && !rc )
>       {
>           printk("Error building DomU: cannot read \"memory\" property\n");
>           return -EINVAL;
>       }
> -    kinfo.unassigned_mem = (paddr_t)mem * SZ_1K;
> +    kinfo.unassigned_mem = static_mem ? static_mem_size : (paddr_t)mem * SZ_1K;
>   
> -    printk("*** LOADING DOMU cpus=%u memory=%"PRIx64"KB ***\n", d->max_vcpus, mem);
> +    printk("*** LOADING DOMU cpus=%u memory=%"PRIx64"KB ***\n",
> +            d->max_vcpus, (kinfo.unassigned_mem) >> 10);
>   
>       kinfo.vpl011 = dt_property_read_bool(node, "vpl011");
>   
> @@ -2452,7 +2496,11 @@ static int __init construct_domU(struct domain *d,
>       /* type must be set before allocate memory */
>       d->arch.type = kinfo.type;
>   #endif
> -    allocate_memory(d, &kinfo);
> +    if ( static_mem )
> +        /* allocate_static_memory(d, &kinfo); */
> +        BUG();
> +    else
> +        allocate_memory(d, &kinfo);
>   
>       rc = prepare_dtb_domU(d, &kinfo);
>       if ( rc < 0 )
> diff --git a/xen/include/asm-arm/domain.h b/xen/include/asm-arm/domain.h
> index c9277b5c6d..81b8eb453c 100644
> --- a/xen/include/asm-arm/domain.h
> +++ b/xen/include/asm-arm/domain.h
> @@ -10,6 +10,7 @@
>   #include <asm/gic.h>
>   #include <asm/vgic.h>
>   #include <asm/vpl011.h>
> +#include <asm/setup.h>
>   #include <public/hvm/params.h>
>   
>   struct hvm_domain
> @@ -89,6 +90,8 @@ struct arch_domain
>   #ifdef CONFIG_TEE
>       void *tee;
>   #endif
> +
> +    struct meminfo static_mem;
>   }  __cacheline_aligned;
>   
>   struct arch_vcpu
> 

Cheers,

-- 
Julien Grall

