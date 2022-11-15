Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA28B629213
	for <lists+xen-devel@lfdr.de>; Tue, 15 Nov 2022 07:59:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.443773.698507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouptu-0004Hk-OH; Tue, 15 Nov 2022 06:58:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 443773.698507; Tue, 15 Nov 2022 06:58:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ouptu-0004Ec-Lc; Tue, 15 Nov 2022 06:58:30 +0000
Received: by outflank-mailman (input) for mailman id 443773;
 Tue, 15 Nov 2022 06:58:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZQXS=3P=gmail.com=casionwoo@srs-se1.protection.inumbo.net>)
 id 1ouptt-0004ES-8k
 for xen-devel@lists.xenproject.org; Tue, 15 Nov 2022 06:58:29 +0000
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com
 [2607:f8b0:4864:20::b2a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e7a422e5-64b2-11ed-8fd2-01056ac49cbb;
 Tue, 15 Nov 2022 07:58:27 +0100 (CET)
Received: by mail-yb1-xb2a.google.com with SMTP id 136so519386ybn.1
 for <xen-devel@lists.xenproject.org>; Mon, 14 Nov 2022 22:58:27 -0800 (PST)
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
X-Inumbo-ID: e7a422e5-64b2-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JJbf6CTTdmdKi2q8fRCrfv+2xLBLA+vZ/1LRWKN5m88=;
        b=fbbJIRPxLIIpKtIeu0ZOB7U8f4u79rsLWRJ2x5xtI8NvpqzttL84ls9MlVyCITGsaQ
         MIif2ZCRKTADjKJ05ZJn/QDpyybKokHr60cj5udWgJYXjWn3pDZw1eKf98s8NMvIID0T
         4Uh4m8qU3zoHZJRQcOnT4PpIW6VQTTrsrRMkWltZFt5U00kyBLwPE6jJAGVwcSDSKk8E
         nTGpOg76xYpSDX5GFRqGLaSGz61Vr8J92zXBhZJrvG7LFfq2YyALALR0UMc5uKCAi95/
         dDUY9egJjuRGJPoncXhbkn54/PC7dGX8sVserWRZkp7c5yVx3sfMo4nOO0sf1oIY+Z+W
         bCdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JJbf6CTTdmdKi2q8fRCrfv+2xLBLA+vZ/1LRWKN5m88=;
        b=NLKYwS5vElvY/HtWVe2Rc7WYKspbgtP7vV50l9MaCUITEBr6PP/f/IXiGOdaw0f/f/
         QmJTyoCW/2KQCqpBlqVaphyOusx1/4Ky/fh6cOmd7QJ8D7uB+LGBO4yuPIHTpKX7vs2a
         mMRCA4KvZ4ldUQwPpWSqI/wwW/48ipJclkyrMVDHEXGiZdqnOBjmlxB0SLduOp2SD4sZ
         5D/U8aiHtlRN8SP4hh//98/fk1W5ZDFKLp1hcJyOMOt0oxbcPnIGPvy16XeHnmYAmhA3
         nX0ba7Tuln4pkSHRVutru8BDf0T+CMedWhhUrClA9Psa+c6SNptruC/cVpGUDaixItZt
         seZQ==
X-Gm-Message-State: ANoB5pkoY40jFkQkPF6Nm3+ynibm1iCTsTFgBDCI0RLsIGellIZ7SRj0
	/tonUro89ueEAeOUd8p5o8eQko+A7muQRu+2vZg=
X-Google-Smtp-Source: AA0mqf4gVfgMSVAMNL3h39idvp38XmXaqF9WakCb+Ymxl3tXsiR2YZym9cX6x2EM5wrGC36pnnqn8ApgKdjZSZEQDyA=
X-Received: by 2002:a25:c653:0:b0:6cb:2aeb:d5b5 with SMTP id
 k80-20020a25c653000000b006cb2aebd5b5mr16257986ybf.333.1668495506518; Mon, 14
 Nov 2022 22:58:26 -0800 (PST)
MIME-Version: 1.0
References: <20221115025235.1378931-1-Penny.Zheng@arm.com> <20221115025235.1378931-3-Penny.Zheng@arm.com>
In-Reply-To: <20221115025235.1378931-3-Penny.Zheng@arm.com>
From: Jeungwoo Yoo <casionwoo@gmail.com>
Date: Tue, 15 Nov 2022 07:58:15 +0100
Message-ID: <CAMguKxZyWwPM-rgtbfjwnH1b-TG_b+AKb59Yim7oJib1oAg=8g@mail.gmail.com>
Subject: Re: [PATCH v1 02/13] xen/arm: switch to use shm_membank as function parameter
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"

Hello,

Reading this patch, I found one place that can be improved.

On 11/15/22 03:52, Penny Zheng wrote:
> Instead of using multiple function parameters to deliver various shm-related
> info, like host physical address, SHMID, etc, and with the introduction
> of new struct "shm_membank", we could switch to use "shm_membank" as
> function parameter to replace them all, to make codes more clear and
> tidy.
>
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
>   xen/arch/arm/domain_build.c | 46 ++++++++++++++++++-------------------
>   1 file changed, 23 insertions(+), 23 deletions(-)
>
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index c0fd13f6ed..d2b9e60b5c 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -751,40 +751,31 @@ static void __init assign_static_memory_11(struct domain *d,
>   }
>
>   #ifdef CONFIG_STATIC_SHM
> -static int __init acquire_nr_borrower_domain(struct domain *d,
> -                                             paddr_t pbase, paddr_t psize,
> -                                             unsigned long *nr_borrowers)
> +static struct shm_membank * __init acquire_shm_membank(const char *shm_id)
>   {
>       unsigned int bank;
>
>       /* Iterate static shared memory to find requested shm bank. */
>       for ( bank = 0 ; bank < bootinfo.shm_mem.nr_banks; bank++ )
> -    {
> -        paddr_t bank_start = bootinfo.shm_mem.bank[bank].membank->start;
> -        paddr_t bank_size = bootinfo.shm_mem.bank[bank].membank->size;
> -
> -        if ( (pbase == bank_start) && (psize == bank_size) )
> +        if ( strcmp(shm_id, bootinfo.shm_mem.bank[bank].shm_id) == 0 )

The target shared memory is found and the bank can be returned
directly here (return &bootinfo.shm_mem.bank[bank];).
Therefore, the out-of-bounds condition check can be removed below.

>               break;
> -    }
>
>       if ( bank == bootinfo.shm_mem.nr_banks )

This can be removed, but only return NULL because the target memory is
not found.


> -        return -ENOENT;
> -
> -    *nr_borrowers = bootinfo.shm_mem.bank[bank].nr_shm_borrowers;
> +        return NULL;
>
> -    return 0;
> +    return &bootinfo.shm_mem.bank[bank];
>   }
>
>   /*
>    * This function checks whether the static shared memory region is
>    * already allocated to dom_io.
>    */
> -static bool __init is_shm_allocated_to_domio(paddr_t pbase)
> +static bool __init is_shm_allocated_to_domio(struct shm_membank *shm_membank)
>   {
>       struct page_info *page;
>       struct domain *d;
>
> -    page = maddr_to_page(pbase);
> +    page = maddr_to_page(shm_membank->membank->start);
>       d = page_get_owner_and_reference(page);
>       if ( d == NULL )
>           return false;
> @@ -835,14 +826,17 @@ static mfn_t __init acquire_shared_memory_bank(struct domain *d,
>   }
>
>   static int __init assign_shared_memory(struct domain *d,
> -                                       uint32_t addr_cells, uint32_t size_cells,
> -                                       paddr_t pbase, paddr_t psize,
> +                                       struct shm_membank *shm_membank,
>                                          paddr_t gbase)
>   {
>       mfn_t smfn;
>       int ret = 0;
>       unsigned long nr_pages, nr_borrowers, i;
>       struct page_info *page;
> +    paddr_t pbase, psize;
> +
> +    pbase = shm_membank->membank->start;
> +    psize = shm_membank->membank->size;
>
>       printk("%pd: allocate static shared memory BANK %#"PRIpaddr"-%#"PRIpaddr".\n",
>              d, pbase, pbase + psize);
> @@ -871,9 +865,7 @@ static int __init assign_shared_memory(struct domain *d,
>        * Get the right amount of references per page, which is the number of
>        * borrower domains.
>        */
> -    ret = acquire_nr_borrower_domain(d, pbase, psize, &nr_borrowers);
> -    if ( ret )
> -        return ret;
> +    nr_borrowers = shm_membank->nr_shm_borrowers;
>
>       /*
>        * Instead of letting borrower domain get a page ref, we add as many
> @@ -941,6 +933,7 @@ static int __init process_shm(struct domain *d, struct kernel_info *kinfo,
>           const char *role_str;
>           const char *shm_id;
>           bool owner_dom_io = true;
> +        struct shm_membank *shm_membank;
>
>           if ( !dt_device_is_compatible(shm_node, "xen,domain-shared-memory-v1") )
>               continue;
> @@ -991,12 +984,20 @@ static int __init process_shm(struct domain *d, struct kernel_info *kinfo,
>           }
>           BUG_ON((strlen(shm_id) <= 0) || (strlen(shm_id) >= MAX_SHM_ID_LENGTH));
>
> +        shm_membank = acquire_shm_membank(shm_id);
> +        if ( !shm_membank )
> +        {
> +            printk("%pd: failed to acquire %s shared memory bank\n",
> +                   d, shm_id);
> +            return -ENOENT;
> +        }
> +
>           /*
>            * DOMID_IO is a fake domain and is not described in the Device-Tree.
>            * Therefore when the owner of the shared region is DOMID_IO, we will
>            * only find the borrowers.
>            */
> -        if ( (owner_dom_io && !is_shm_allocated_to_domio(pbase)) ||
> +        if ( (owner_dom_io && !is_shm_allocated_to_domio(shm_membank)) ||
>                (!owner_dom_io && strcmp(role_str, "owner") == 0) )
>           {
>               /*
> @@ -1004,8 +1005,7 @@ static int __init process_shm(struct domain *d, struct kernel_info *kinfo,
>                * specified, so they should be assigned to dom_io.
>                */
>               ret = assign_shared_memory(owner_dom_io ? dom_io : d,
> -                                       addr_cells, size_cells,
> -                                       pbase, psize, gbase);
> +                                       shm_membank, gbase);
>               if ( ret )
>                   return ret;
>           }

