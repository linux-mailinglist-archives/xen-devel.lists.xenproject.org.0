Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E9991661500
	for <lists+xen-devel@lfdr.de>; Sun,  8 Jan 2023 13:23:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.473145.733625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEUhC-0007kh-Q9; Sun, 08 Jan 2023 12:22:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 473145.733625; Sun, 08 Jan 2023 12:22:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEUhC-0007iX-NB; Sun, 08 Jan 2023 12:22:38 +0000
Received: by outflank-mailman (input) for mailman id 473145;
 Sun, 08 Jan 2023 12:22:38 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pEUhC-0007iR-2Z
 for xen-devel@lists.xenproject.org; Sun, 08 Jan 2023 12:22:38 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pEUhB-0005vd-Mi; Sun, 08 Jan 2023 12:22:37 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pEUhB-0003tr-HP; Sun, 08 Jan 2023 12:22:37 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=J8OCN7wTNVpbOJr1mSt4M84BOP08M1gbQLNxXEpFxKo=; b=XlSfKSMWT0zhg8fVGW1Ah7Lk+F
	eRziJAxnghXqRHmL1sp5BHXiGLlT2dcBv0jbcZcpwfV9v467hFz6TOQW9ugzHanaS2AyUp2PMhOko
	VPZsUps26K5JSjmtEokHCAX3K7A06RAWbaBCpOd2hxpcGnsbTc0Ty2N24SeZwXRapCy4=;
Message-ID: <ff0870ab-d1b1-e029-26aa-c690063d348b@xen.org>
Date: Sun, 8 Jan 2023 12:22:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221115025235.1378931-1-Penny.Zheng@arm.com>
 <20221115025235.1378931-6-Penny.Zheng@arm.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v1 05/13] xen/arm: allocate shared memory from heap when
 host address not provided
In-Reply-To: <20221115025235.1378931-6-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Penny,

On 15/11/2022 02:52, Penny Zheng wrote:
> when host address is not provided in "xen,shared-mem", we let Xen
> allocate requested shared memory from heap, and once the shared memory is
> allocated, it will be marked as static(PGC_static), which means that it will be
> reserved as static memory, and will not go back to heap even on freeing.

Please don't move pages from the {xen,dom}heap to the static heap. If 
you need to keep the pages for longer, then get an extra reference so 
they will not be released.

> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
>   xen/arch/arm/domain_build.c | 83 ++++++++++++++++++++++++++++++++++++-
>   1 file changed, 82 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index fbb196d8a4..3de96882a5 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -835,6 +835,72 @@ static bool __init is_shm_allocated_to_domio(struct shm_membank *shm_membank)
>       return true;
>   }
>   
> +static int __init mark_shared_memory_static(struct shm_membank *shm_membank)
> +{
> +    unsigned int bank;
> +    unsigned long i, nr_mfns;
> +    struct page_info *pg;
> +    struct meminfo *meminfo;
> +
> +    BUG_ON(!shm_membank->mem.banks.meminfo);
> +    meminfo = shm_membank->mem.banks.meminfo;
> +    for ( bank = 0; bank < meminfo->nr_banks; bank++ )
> +    {
> +        pg = mfn_to_page(maddr_to_mfn(meminfo->bank[bank].start));

mfn_to_page(maddr_to_mfn(...)) is equivalent to maddr_to_page(..).

> +        nr_mfns = PFN_DOWN(meminfo->bank[bank].size);
> +
> +        for ( i = 0; i < nr_mfns; i++ )
> +        {
> +            /* The page should be already allocated from heap. */
> +            if ( !pg[i].count_info & PGC_state_inuse )

I don't think this is doing what you want because ! will take precedence 
over &. You likely want to add parenthese:

!(... & ...)

> +            {
> +                printk(XENLOG_ERR
> +                       "pg[%lu] MFN %"PRI_mfn" c=%#lx\n",
> +                       i, mfn_x(page_to_mfn(pg)) + i, pg[i].count_info);
> +                goto fail;
> +            }
> +
> +           pg[i].count_info |= PGC_static;
> +        }
> +    }
> +
> +    return 0;
> +
> + fail:
> +    while ( bank >= 0 )
> +    {
> +        while ( --i >= 0 )
> +            pg[i].count_info &= ~PGC_static;
> +        i = PFN_DOWN(meminfo->bank[--bank].size);
> +    }
> +
> +    return -EINVAL;
> +}
> +
> +static int __init allocate_shared_memory(struct shm_membank *shm_membank,
> +                                         paddr_t psize)
> +{
> +    struct meminfo *banks;
> +    int ret;
> +
> +    BUG_ON(shm_membank->mem.banks.meminfo != NULL);
> +
> +    banks = xmalloc_bytes(sizeof(struct meminfo));

Where is this freed?

> +    if ( banks == NULL )
> +        return -ENOMEM;
> +    shm_membank->mem.banks.meminfo = banks;
> +    memset(shm_membank->mem.banks.meminfo, 0, sizeof(struct meminfo));
> +
> +    if ( !allocate_domheap_memory(NULL, psize, shm_membank->mem.banks.meminfo) )
> +        return -EINVAL;
> +
> +    ret = mark_shared_memory_static(shm_membank);
> +    if ( ret )
> +        return ret;
> +
> +    return 0;
> +}
> +
>   static mfn_t __init acquire_shared_memory_bank(struct domain *d,
>                                                  paddr_t pbase, paddr_t psize)
>   {
> @@ -975,7 +1041,7 @@ static int __init process_shm(struct domain *d, struct kernel_info *kinfo,
>           unsigned int i;
>           const char *role_str;
>           const char *shm_id;
> -        bool owner_dom_io = true;
> +        bool owner_dom_io = true, paddr_assigned = true;
>           struct shm_membank *shm_membank;
>   
>           if ( !dt_device_is_compatible(shm_node, "xen,domain-shared-memory-v1") )
> @@ -1035,6 +1101,21 @@ static int __init process_shm(struct domain *d, struct kernel_info *kinfo,
>               return -ENOENT;
>           }
>   
> +        /*
> +         * When host address is not provided in "xen,shared-mem",
> +         * we let Xen allocate requested memory from heap at first domain.
> +         */
> +        if ( !paddr_assigned && !shm_membank->mem.banks.meminfo )
> +        {
> +            ret = allocate_shared_memory(shm_membank, psize);
> +            if ( ret )
> +            {
> +                printk("%pd: failed to allocate shared memory bank(%"PRIpaddr"MB) from heap: %d\n",
> +                       d, psize >> 20, ret);
> +                return ret;
> +            }
> +        }
> +
>           /*
>            * DOMID_IO is a fake domain and is not described in the Device-Tree.
>            * Therefore when the owner of the shared region is DOMID_IO, we will

Cheers,

-- 
Julien Grall

