Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0C1661540
	for <lists+xen-devel@lfdr.de>; Sun,  8 Jan 2023 13:54:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.473152.733636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEVAb-0002gt-6P; Sun, 08 Jan 2023 12:53:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 473152.733636; Sun, 08 Jan 2023 12:53:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pEVAb-0002e9-3G; Sun, 08 Jan 2023 12:53:01 +0000
Received: by outflank-mailman (input) for mailman id 473152;
 Sun, 08 Jan 2023 12:52:59 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pEVAZ-0002e3-Kq
 for xen-devel@lists.xenproject.org; Sun, 08 Jan 2023 12:52:59 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pEVAZ-0006YE-C2; Sun, 08 Jan 2023 12:52:59 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pEVAZ-0004sX-5w; Sun, 08 Jan 2023 12:52:59 +0000
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
	bh=Jle59iCiMsqHyxp4ZpisjmnJ5CRT/9Fb4pdXCheufD4=; b=L9dnkChRACQaoIFXmeMAfTP1tb
	84VHd6rY3RfaSfLTaUiS+W1WKRtr9i8fSCw7aOxCVf2ua8s3rxAR7WY1AMTsxQ2Zawy2rA2I36l7Q
	4Q9M7RglpY+N4bXXuup9UuzuGQ6eKV3TIY3Fpf0tEYpKUicN7jbWxVb4daOnCC50GC4c=;
Message-ID: <d7f12897-c6cc-0895-b70e-53c0b88bd0f9@xen.org>
Date: Sun, 8 Jan 2023 12:52:57 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20221115025235.1378931-1-Penny.Zheng@arm.com>
 <20221115025235.1378931-7-Penny.Zheng@arm.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v1 06/13] xen/arm: assign shared memory to owner when host
 address not provided
In-Reply-To: <20221115025235.1378931-7-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 15/11/2022 02:52, Penny Zheng wrote:
> @@ -922,33 +927,82 @@ static mfn_t __init acquire_shared_memory_bank(struct domain *d,
>       d->max_pages += nr_pfns;
>   
>       smfn = maddr_to_mfn(pbase);
> -    res = acquire_domstatic_pages(d, smfn, nr_pfns, 0);
> -    if ( res )
> +    page = mfn_to_page(smfn);
> +    /*
> +     * If page is allocated from heap as static shared memory, then we just
> +     * assign it to the owner domain
> +     */
> +    if ( page->count_info == (PGC_state_inuse | PGC_static) )
I am a bit confused how this can help differentiating 
becaPGC_state_inuse is 0. So effectively, you are checking that 
count_info is equal to PGC_static.

But as I wrote in a previous patch, I don't think you should convert 
{xen,dom}heap pages to a static pages.

[...]

> +static int __init assign_shared_memory(struct domain *d,
> +                                       struct shm_membank *shm_membank,
> +                                       paddr_t gbase)
> +{
> +    int ret = 0;
> +    unsigned long nr_pages, nr_borrowers;
> +    struct page_info *page;
> +    unsigned int i;
> +    struct meminfo *meminfo;
> +
> +    /* Host address is not provided in "xen,shared-mem" */
> +    if ( shm_membank->mem.banks.meminfo )
> +    {
> +        meminfo = shm_membank->mem.banks.meminfo;
> +        for ( i = 0; i < meminfo->nr_banks; i++ )
> +        {
> +            ret = acquire_shared_memory(d,
> +                                        meminfo->bank[i].start,
> +                                        meminfo->bank[i].size,
> +                                        gbase);
> +            if ( ret )
> +                return ret;
> +
> +            gbase += meminfo->bank[i].size;
> +        }
> +    }
> +    else
> +    {
> +        ret = acquire_shared_memory(d,
> +                                    shm_membank->mem.bank->start,
> +                                    shm_membank->mem.bank->size, gbase);
> +        if ( ret )
> +            return ret;
> +    }

Looking at this change and...

> +
>       /*
>        * Get the right amount of references per page, which is the number of
>        * borrower domains.
> @@ -984,23 +1076,37 @@ static int __init assign_shared_memory(struct domain *d,
>        * So if the borrower is created first, it will cause adding pages
>        * in the P2M without reference.
>        */
> -    page = mfn_to_page(smfn);
> -    for ( i = 0; i < nr_pages; i++ )
> +    if ( shm_membank->mem.banks.meminfo )
>       {
> -        if ( !get_page_nr(page + i, d, nr_borrowers) )
> +        meminfo = shm_membank->mem.banks.meminfo;
> +        for ( i = 0; i < meminfo->nr_banks; i++ )
>           {
> -            printk(XENLOG_ERR
> -                   "Failed to add %lu references to page %"PRI_mfn".\n",
> -                   nr_borrowers, mfn_x(smfn) + i);
> -            goto fail;
> +            page = mfn_to_page(maddr_to_mfn(meminfo->bank[i].start));
> +            nr_pages = PFN_DOWN(meminfo->bank[i].size);
> +            ret = add_shared_memory_ref(d, page, nr_pages, nr_borrowers);
> +            if ( ret )
> +                goto fail;
>           }
>       }
> +    else
> +    {
> +        page = mfn_to_page(
> +                maddr_to_mfn(shm_membank->mem.bank->start));
> +        nr_pages = shm_membank->mem.bank->size >> PAGE_SHIFT;
> +        ret = add_shared_memory_ref(d, page, nr_pages, nr_borrowers);
> +        if ( ret )
> +            return ret;
> +    }

... this one. The code to deal with a bank is exactly the same. But you 
need the duplication because you special case "one bank".

As I wrote in a previous patch, I don't think we should special case it. 
If the concern is memory usage, then we should look at reworking meminfo 
instead (or using a different structure).

>   
>       return 0;
>   
>    fail:
>       while ( --i >= 0 )
> -        put_page_nr(page + i, nr_borrowers);
> +    {
> +        page = mfn_to_page(maddr_to_mfn(meminfo->bank[i].start));
> +        nr_pages = PFN_DOWN(meminfo->bank[i].size);
> +        remove_shared_memory_ref(page, nr_pages, nr_borrowers);
> +    }
>       return ret;
>   }
>   

Cheers,

-- 
Julien Grall

