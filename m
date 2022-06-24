Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F7955A169
	for <lists+xen-devel@lfdr.de>; Fri, 24 Jun 2022 21:18:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355846.583775 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4op3-0004bI-6v; Fri, 24 Jun 2022 19:18:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355846.583775; Fri, 24 Jun 2022 19:18:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4op3-0004YS-3t; Fri, 24 Jun 2022 19:18:29 +0000
Received: by outflank-mailman (input) for mailman id 355846;
 Fri, 24 Jun 2022 19:18:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o4op2-0004Y7-8B
 for xen-devel@lists.xenproject.org; Fri, 24 Jun 2022 19:18:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o4op1-0005yQ-Va; Fri, 24 Jun 2022 19:18:27 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238] helo=[192.168.4.76])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o4op1-0000B4-Oh; Fri, 24 Jun 2022 19:18:27 +0000
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
	bh=I4Fwegyrc1IZQItWF5i8KJDAzGvkaQ79eiPkaAvvogs=; b=v+/p9wzC/UoVO94s9LOzsFujuC
	+adZaDA4TZ/N+dgQSD74dwvcqAyVKTCHSugEVpf7JHHBUiORzh/w1lDTu3GhsDuRBE1QK3Ct60s6o
	NM2Aal0FKPadFlIJq6CvFZwfBavONAkRd6G85e7Jqxk9yXshbBRZx2C4ygBtJS0Si0xk=;
Message-ID: <3e397ff3-0b67-523c-179a-0a2035b081da@xen.org>
Date: Fri, 24 Jun 2022 20:18:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH v5 5/8] xen/arm: Add additional reference to owner domain
 when the owner is allocated
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220620051114.210118-1-Penny.Zheng@arm.com>
 <20220620051114.210118-6-Penny.Zheng@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220620051114.210118-6-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Penny,

On 20/06/2022 06:11, Penny Zheng wrote:
> Borrower domain will fail to get a page ref using the owner domain
> during allocation, when the owner is created after borrower.
> 
> So here, we decide to get and add the right amount of reference, which
> is the number of borrowers, when the owner is allocated.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> ---
> v5 change:
> - no change
> ---
> v4 changes:
> - no change
> ---
> v3 change:
> - printk rather than dprintk since it is a serious error
> ---
> v2 change:
> - new commit
> ---
>   xen/arch/arm/domain_build.c | 62 +++++++++++++++++++++++++++++++++++++
>   1 file changed, 62 insertions(+)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index d4fd64e2bd..650d18f5ef 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -799,6 +799,34 @@ static mfn_t __init acquire_shared_memory_bank(struct domain *d,
>   
>   }
>   
> +static int __init acquire_nr_borrower_domain(struct domain *d,
> +                                             paddr_t pbase, paddr_t psize,
> +                                             unsigned long *nr_borrowers)
> +{
> +    unsigned long bank;
> +
> +    /* Iterate reserved memory to find requested shm bank. */
> +    for ( bank = 0 ; bank < bootinfo.reserved_mem.nr_banks; bank++ )
> +    {
> +        paddr_t bank_start = bootinfo.reserved_mem.bank[bank].start;
> +        paddr_t bank_size = bootinfo.reserved_mem.bank[bank].size;
> +
> +        if ( pbase == bank_start && psize == bank_size )
> +            break;
> +    }
> +
> +    if ( bank == bootinfo.reserved_mem.nr_banks )
> +        return -ENOENT;
> +
> +    if ( d == dom_io )
> +        *nr_borrowers = bootinfo.reserved_mem.bank[bank].nr_shm_domain;
> +    else
> +        /* Exclude the owner domain itself. */
NIT: I think this comment wants to be just above the 'if' and expanded 
to explain why the "dom_io" is not included. AFAIU, this is because 
"dom_io" is not described in the Device-Tree, so it would not be taken 
into account for nr_shm_domain.

> +        *nr_borrowers = bootinfo.reserved_mem.bank[bank].nr_shm_domain - 1;

TBH, given the use here. I would have consider to not increment 
nr_shm_domain if the role was owner in parsing code. This is v5 now, so 
I would be OK with the comment above.

But I would suggest to consider it as a follow-up.

> +
> +    return 0;
> +}
> +
>   /*
>    * Func allocate_shared_memory is supposed to be only called
>    * from the owner.
> @@ -810,6 +838,8 @@ static int __init allocate_shared_memory(struct domain *d,
>   {
>       mfn_t smfn;
>       int ret = 0;
> +    unsigned long nr_pages, nr_borrowers, i;
> +    struct page_info *page;
>   
>       dprintk(XENLOG_INFO,
>               "Allocate static shared memory BANK %#"PRIpaddr"-%#"PRIpaddr".\n",
> @@ -824,6 +854,7 @@ static int __init allocate_shared_memory(struct domain *d,
>        * DOMID_IO is the domain, like DOMID_XEN, that is not auto-translated.
>        * It sees RAM 1:1 and we do not need to create P2M mapping for it
>        */
> +    nr_pages = PFN_DOWN(psize);
>       if ( d != dom_io )
>       {
>           ret = guest_physmap_add_pages(d, gaddr_to_gfn(gbase), smfn, PFN_DOWN(psize));
> @@ -835,6 +866,37 @@ static int __init allocate_shared_memory(struct domain *d,
>           }
>       }
>   
> +    /*
> +     * Get the right amount of references per page, which is the number of
> +     * borrow domains.
> +     */
> +    ret = acquire_nr_borrower_domain(d, pbase, psize, &nr_borrowers);
> +    if ( ret )
> +        return ret;
> +
> +    /*
> +     * Instead of let borrower domain get a page ref, we add as many

Typo: s/let/letting/

> +     * additional reference as the number of borrowers when the owner
> +     * is allocated, since there is a chance that owner is created
> +     * after borrower.

What if the borrower is created first? Wouldn't this result to add pages 
in the P2M without reference?

If yes, then I think this is worth an explaination.

> +     */
> +    page = mfn_to_page(smfn);

Where do you validate the range [smfn, nr_pages]?

> +    for ( i = 0; i < nr_pages; i++ )
> +    {
> +        if ( !get_page_nr(page + i, d, nr_borrowers) )
> +        {
> +            printk(XENLOG_ERR
> +                   "Failed to add %lu references to page %"PRI_mfn".\n",
> +                   nr_borrowers, mfn_x(smfn) + i);
> +            goto fail;
> +        }
> +    }
> +
> +    return 0;
> +
> + fail:
> +    while ( --i >= 0 )
> +        put_page_nr(page + i, nr_borrowers);
>       return ret;
>   }
>   

Cheers,

-- 
Julien Grall

