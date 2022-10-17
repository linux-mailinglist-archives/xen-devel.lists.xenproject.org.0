Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC47A601A5D
	for <lists+xen-devel@lfdr.de>; Mon, 17 Oct 2022 22:36:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.424593.672130 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okWqD-0004q0-TM; Mon, 17 Oct 2022 20:36:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 424593.672130; Mon, 17 Oct 2022 20:36:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1okWqD-0004ny-PQ; Mon, 17 Oct 2022 20:36:05 +0000
Received: by outflank-mailman (input) for mailman id 424593;
 Mon, 17 Oct 2022 20:36:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1okWqC-0004ns-5d
 for xen-devel@lists.xenproject.org; Mon, 17 Oct 2022 20:36:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1okWqB-0007ob-I7; Mon, 17 Oct 2022 20:36:03 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1okWqB-0007IS-Cs; Mon, 17 Oct 2022 20:36:03 +0000
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
	bh=ZDoKRqdEUVIZJRdouTDUvuzP9UoNdQH+aHz7DhW9VJ8=; b=2aZXz2OArnFvYWQh0lYmsK4cDc
	gP3z0gxyRWv4fGeE1yWyAYmQ+VdPvKl4qyozXe6RZo6wF+1+tjBOvHLQ9JcFb0s2C2vNqO2CRUWBp
	4olBnmMFnxZKimdW5QXBtpQsznBiyUBKqi6N+gUq/nW2hDQzdRzdVj1nNwGnL1VNfHcQ=;
Message-ID: <0456d318-731f-8df7-297c-19ecde06ed96@xen.org>
Date: Mon, 17 Oct 2022 21:36:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.3
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Henry Wang <Henry.Wang@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <20221017191237.11079-1-andrew.cooper3@citrix.com>
 <20221017191237.11079-3-andrew.cooper3@citrix.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH 2/2] xen/arm: p2m: Populate pages for GICv2 mapping in
 arch_domain_create()
In-Reply-To: <20221017191237.11079-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Andrew,

On 17/10/2022 20:12, Andrew Cooper wrote:
> From: Henry Wang <Henry.Wang@arm.com>
> 
> The XSA-409 fixes discovered that the GICv2 path tries to create P2M mappings
> in the domain_create() path.  This fails, as the P2M pool is empty before a
> XEN_DOMCTL_SHADOW_OP_SET_ALLOCATION hypercall.
> 
> As a stopgap, automatically give domains 16 pages of P2M memory.  This is
> large enough to allow the GICv2 case to work, but small enough to not
> introduce a continuation worry.
> 
> A consequence is that, for later error paths domain_create(), we end up in
> p2m_final_teardown() with a nonzero P2M pool.  Such a domain has no vCPUs, and
> has never been scheduled, so free the memory directly.
> 
> Fixes: cbea5a1149ca ("xen/arm: Allocate and free P2M pages from the P2M pool")
> Suggested-by: Julien Grall <jgrall@amazon.com>

This is not really in the spirit of my original suggestion anymore... In 
fact, you drop all the explanations regarding how the code is fragile 
(e.g. we are relying on early mapping to not take any extra reference). 
Maybe you don't care, but I do as Henry and I spent ages to figure out 
all the corner cases. In addition to that...

> Signed-off-by: Henry Wang <Henry.Wang@arm.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> CC: Henry Wang <Henry.Wang@arm.com>
> ---
>   xen/arch/arm/p2m.c | 43 +++++++++++++++++++++++++++++++++++++++++--
>   1 file changed, 41 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
> index 6826f6315080..76a0e31c6c8c 100644
> --- a/xen/arch/arm/p2m.c
> +++ b/xen/arch/arm/p2m.c
> @@ -1736,8 +1736,36 @@ void p2m_final_teardown(struct domain *d)
>       if ( !p2m->domain )
>           return;
>   
> -    ASSERT(page_list_empty(&p2m->pages));
> -    ASSERT(page_list_empty(&d->arch.paging.p2m_freelist));
> +    /*
> +     * On the domain_create() error path only, we can end up here with a
> +     * non-zero P2M pool.
> +     *
> +     * At present, this is a maximum of 16 pages, spread between p2m->pages
> +     * and the free list.  The domain has never been scheduled (it has no
> +     * vcpus), so there is TLB maintenance to perform; just free everything.
> +     */
> +    if ( !page_list_empty(&p2m->pages) ||
> +         !page_list_empty(&d->arch.paging.p2m_freelist) )
> +    {
> +        struct page_info *pg;
> +
> +        /*
> +         * There's no sensible "in the domain_create() error path" predicate,
> +         * so simply sanity check that we don't have unexpected work to do.
> +         */
> +        ASSERT(d->arch.paging.p2m_total_pages <= 16);
> +
> +        spin_lock(&d->arch.paging.lock);
> +
> +        while ( (pg = page_list_remove_head(&p2m->pages)) )
> +            free_domheap_page(pg);
> +        while ( (pg = page_list_remove_head(&d->arch.paging.p2m_freelist)) )
> +            free_domheap_page(pg);
> +
> +        d->arch.paging.p2m_total_pages = 0;
> +
> +        spin_unlock(&d->arch.paging.lock);
> +    }

... you are hardcoding both p2m_teardown() and p2m_set_allocation().
IMO this is not an improvement at all. It is just making the code more 
complex than necessary and lack all the explanation on the assumptions.

So while I am fine with your patch #1 (already reviewed it), there is a 
better patch from Henry on the ML. So we should take his (rebased) 
instead of yours.

Cheers,

-- 
Julien Grall

