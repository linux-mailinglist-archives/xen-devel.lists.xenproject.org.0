Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F7051E2EB
	for <lists+xen-devel@lfdr.de>; Sat,  7 May 2022 03:09:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.323486.545175 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nn8wY-0005p1-Py; Sat, 07 May 2022 01:09:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 323486.545175; Sat, 07 May 2022 01:09:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nn8wY-0005mY-Lt; Sat, 07 May 2022 01:09:10 +0000
Received: by outflank-mailman (input) for mailman id 323486;
 Sat, 07 May 2022 01:09:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DtL8=VP=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nn8wW-0004gy-NY
 for xen-devel@lists.xenproject.org; Sat, 07 May 2022 01:09:08 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4b1dd347-cda2-11ec-8fc4-03012f2f19d4;
 Sat, 07 May 2022 03:09:07 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B24BB61D48;
 Sat,  7 May 2022 01:09:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C208FC385A8;
 Sat,  7 May 2022 01:09:05 +0000 (UTC)
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
X-Inumbo-ID: 4b1dd347-cda2-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1651885746;
	bh=tvJ8vHOgeXadbKseYtdzdG7b5YDjhBrgmuFtkclQREw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=kFAeEoAfHwzRiLbGYwaL6IvVOZFJlhGA41rpEAdPQTaG296YsrcP8h/8bt0OTfjTm
	 R1ZR2a00ElciGmZ1w7y85/kJR8rTnVHvtcNBsE+JbqnvA490agxrEZ+NnWG5lBVs1y
	 mJ1oRppoBN6n/JynmcZUmonUbP1pDcQiDvioGoXiyS+z1yxdY1Qja9U/0I2WBZaomR
	 mSuXRztcXtAQcCe9QAYzCMVxlIfSI8VDecu5/8k89kGMAMxb6OsydXhFQvMFt3JNbk
	 kZJ5YBf3sgQ3KelJvz4Jo59zENsehB2Qq58vGfraIUarxMsw0dalRO0r7ip/FCOTbd
	 9XtL2JVTTxRHg==
Date: Fri, 6 May 2022 18:09:05 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Penny Zheng <Penny.Zheng@arm.com>
cc: xen-devel@lists.xenproject.org, wei.chen@arm.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 5/9] xen/arm: Add additional reference to owner domain
 when the owner is allocated
In-Reply-To: <20220506072502.2177828-6-Penny.Zheng@arm.com>
Message-ID: <alpine.DEB.2.22.394.2205061748560.43560@ubuntu-linux-20-04-desktop>
References: <20220506072502.2177828-1-Penny.Zheng@arm.com> <20220506072502.2177828-6-Penny.Zheng@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 6 May 2022, Penny Zheng wrote:
> Borrower domain will fail to get a page ref using the owner domain
> during allocation, when the owner is created after borrower.
> 
> So here, we decide to get and add the right amount of reference, which
> is the number of borrowers, when the owner is allocated.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
>
> ---
> v2 change:
> - new commit
> ---
>  xen/arch/arm/domain_build.c | 62 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index f43378227a..b3ba0c501d 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -792,6 +792,34 @@ static mfn_t __init acquire_shared_memory_bank(struct domain *d,
>  
>  }
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
> +        *nr_borrowers = bootinfo.reserved_mem.bank[bank].nr_shm_domain - 1;
> +
> +    return 0;
> +}
> +
>  /*
>   * Func allocate_shared_memory is supposed to be only called
>   * from the owner.
> @@ -803,6 +831,8 @@ static int __init allocate_shared_memory(struct domain *d,
>  {
>      mfn_t smfn;
>      int ret = 0;
> +    unsigned long nr_pages, nr_borrowers, i;
> +    struct page_info *page;
>  
>      dprintk(XENLOG_INFO,
>              "Allocate static shared memory BANK %#"PRIpaddr"-%#"PRIpaddr".\n",
> @@ -817,6 +847,7 @@ static int __init allocate_shared_memory(struct domain *d,
>       * DOMID_IO is the domain, like DOMID_XEN, that is not auto-translated.
>       * It sees RAM 1:1 and we do not need to create P2M mapping for it.
>       */
> +    nr_pages = PFN_DOWN(psize);
>      if ( d != dom_io )
>      {
>          ret = guest_physmap_add_pages(d, gaddr_to_gfn(gbase), smfn, PFN_DOWN(psize));
> @@ -828,6 +859,37 @@ static int __init allocate_shared_memory(struct domain *d,
>          }
>      }
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
> +     * additional reference as the number of borrowers when the owner
> +     * is allocated, since there is a chance that owner is created
> +     * after borrower.
> +     */
> +    page = mfn_to_page(smfn);
> +    for ( i = 0; i < nr_pages; i++ )
> +    {
> +        if ( !get_page_nr(page + i, d, nr_borrowers) )
> +        {
> +            dprintk(XENLOG_ERR,
> +                    "Failed to add %lu references to page %"PRI_mfn".\n",
> +                    nr_borrowers, mfn_x(smfn) + i);

dprintk only prints errors when DEBUG is selected. This is actually a
pretty serious error so I think it should be printed in all cases. A
normal printk would be fine.


> +            goto fail;
> +        }
> +    }
> +
> +    return 0;
> +
> + fail:
> +    while ( --i >= 0 )
> +        put_page_nr(page + i, nr_borrowers);
>      return ret;
>  }
>  
> -- 
> 2.25.1
> 

