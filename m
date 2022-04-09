Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F984FA694
	for <lists+xen-devel@lfdr.de>; Sat,  9 Apr 2022 11:45:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.302145.515727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nd7e4-0005r6-5l; Sat, 09 Apr 2022 09:44:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 302145.515727; Sat, 09 Apr 2022 09:44:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nd7e4-0005pB-2c; Sat, 09 Apr 2022 09:44:40 +0000
Received: by outflank-mailman (input) for mailman id 302145;
 Sat, 09 Apr 2022 09:44:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nd7e3-0005p5-7j
 for xen-devel@lists.xenproject.org; Sat, 09 Apr 2022 09:44:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nd7e2-0001wH-VF; Sat, 09 Apr 2022 09:44:38 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nd7e2-0005Sn-Pm; Sat, 09 Apr 2022 09:44:38 +0000
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
	bh=fzERs1kviIvjjzyupRx/3OkO6phfvv6S3S9sSXlOZe4=; b=Z1SrrOBV4pi+g8OoOxPfBogfzF
	MTbKDj0EwKpPR0u+3S8K+Hit7cglj45GQl5tdboL4wuW2lsueRjd+032kmewU7KAiYGa2ihFX1kx7
	JMsFEgkrepoXZbsGn3+zO7XCLwfBi11KLdvmk0uV3E6GGi4cpY5C4XxpozM+BxuwxGRc=;
Message-ID: <8808802f-feca-bd21-8bbe-ba4f1b9ce5f1@xen.org>
Date: Sat, 9 Apr 2022 10:44:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: nd@arm.com, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20220311061123.1883189-1-Penny.Zheng@arm.com>
 <20220311061123.1883189-14-Penny.Zheng@arm.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v1 13/13] xen/arm: unmap foreign memory mapping when
 destroyed domain is owner domain
In-Reply-To: <20220311061123.1883189-14-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 11/03/2022 06:11, Penny Zheng wrote:
> From: Penny Zheng <penny.zheng@arm.com>
> 
> When destroyed domain is an owner domain of a static shared memory
> region, then we need to ensure that all according borrower domains
> shall not have the access to this static shared memory region too.

As Stefano wrote, I don't think this is necessary. The page reference 
accounting will keep the page alive until everyone have released the page.

So can you explain why you want to do that?

> 
> This commit covers above scenario through unmapping all borrowers'
> according foreign memory mapping when destroyed domain is a owner
> domain of a static shared memory region.
> 
> NOTE: It will best for users to destroy all borrowers before the owner
> domain in case encountering data abort when accidentally accessing
> the static shared memory region.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> ---
>   xen/arch/arm/domain.c | 88 ++++++++++++++++++++++++++++++++++---------
>   1 file changed, 71 insertions(+), 17 deletions(-)
> 
> diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
> index 73ffbfb918..8f4a8dcbfc 100644
> --- a/xen/arch/arm/domain.c
> +++ b/xen/arch/arm/domain.c
> @@ -998,10 +998,39 @@ static int relinquish_memory(struct domain *d, struct page_list_head *list)
>   }
>   
>   #ifdef CONFIG_STATIC_SHM
> +static int destroy_shm(struct domain *d, gfn_t gfn, unsigned long nr_gfns)
If you still plan to go ahead with this approach, then I would prefer if 
this function is created in patch #8. This will help to reduce the churn 
in this patch.

[...]

> -            for ( j = 0; j < nr_gfns; j++ )
> +            if ( test_bit(shm_id, shm_list_mask) )
>               {
> -                mfn_t mfn;
> -
> -                mfn = gfn_to_mfn(d, gfn_add(gfn, j));
> -                if ( !mfn_valid(mfn) )
> +                domid_t od = shm_list[shm_id].owner_dom;
> +                unsigned long j;
> +                /*
> +                 * If it is a owner domain, then after it gets destroyed,
> +                 * static shared memory region shall be unaccessible to all
> +                 * borrower domains too.
> +                 */
> +                if ( d->domain_id == od )
>                   {
> -                    dprintk(XENLOG_ERR,
> -                            "Domain %pd page number %lx invalid.\n",
> -                            d, gfn_x(gfn) + i);
> -                    return -EINVAL;
> +                    struct domain *bd;
> +
> +                    for ( j = 0; j < shm_list[shm_id].nr_borrower; j++ )
> +                    {
> +                        bd = get_domain_by_id(shm_list[shm_id].borrower_dom[j]);
> +                        /*
> +                         * borrower domain could be dead already, in such case
> +                         * no need to do the unmapping.

The domain ID could have been re-used. So it is not enough to lookup for 
the ID.

> +                         */
> +                        if ( bd != NULL )
> +                        {
> +                            gfn_t b_gfn = gaddr_to_gfn(
> +                                          shm_list[shm_id].borrower_gbase[j]);
> +                            ret = destroy_shm(bd, b_gfn, nr_gfns);
> +                            if ( ret )
> +                                dprintk(XENLOG_ERR,
> +                                        "Domain %pd: failed to destroy static shared memory.\n",
> +                                        bd);

In the commit message, you wrote you want to remove the pages from the 
borrower. But here, you will ignore a failure and continue to destroy 
the owner like nothing happened.

If you are concerned that the borrower can still use the pages. Then we 
should make sure that they are removed in every cases.

However, I think the code is going to quite complex. So I think we 
should consider to do nothing here and let the borrower use the pages 
until they die.

Potentially, we could notify the borrowers that the owner died so they 
can decide to remove/shutdown themself. Of course, it would mean we are 
relying on the borrowers to be nice. An alternative would be to destroy 
them.

Cheers,

-- 
Julien Grall

