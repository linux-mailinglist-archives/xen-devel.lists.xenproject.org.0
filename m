Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CBFCB558638
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jun 2022 20:09:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355103.582562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4RG7-0004yw-0y; Thu, 23 Jun 2022 18:08:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355103.582562; Thu, 23 Jun 2022 18:08:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4RG6-0004xA-Tl; Thu, 23 Jun 2022 18:08:50 +0000
Received: by outflank-mailman (input) for mailman id 355103;
 Thu, 23 Jun 2022 18:08:48 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o4RG4-0004x4-Ob
 for xen-devel@lists.xenproject.org; Thu, 23 Jun 2022 18:08:48 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o4RG4-0002lh-8I; Thu, 23 Jun 2022 18:08:48 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.0.239]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o4RG4-0000os-21; Thu, 23 Jun 2022 18:08:48 +0000
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
	bh=dT+l2tfaBQirVi8w4X5VjEB80gAkXTYZbZarg3UrK50=; b=MB8j3JOLmxw1xBbxutfFWfCZdZ
	GBbLR5Gdnu5MLWjZXbS+itBVxc5vSHM23pS+y2hUxLkcZdjg/LwmMcrM1DGyzIT76O1iwmB/6/vp3
	PvMCurHr3+6rcIwtj/SI/hO0FTEPUSr1qK4PldmvIWO/IYd5pd4wXYhssFINBavRYOUk=;
Message-ID: <42b0d343-a491-877c-3b5c-d9c95872774c@xen.org>
Date: Thu, 23 Jun 2022 19:08:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH V6 2/2] xen/arm: Harden the P2M code in
 p2m_remove_mapping()
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <1652294845-13980-1-git-send-email-olekstysh@gmail.com>
 <1652294845-13980-2-git-send-email-olekstysh@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <1652294845-13980-2-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksandr,

On 11/05/2022 19:47, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> Borrow the x86's check from p2m_remove_page() which was added
> by the following commit: c65ea16dbcafbe4fe21693b18f8c2a3c5d14600e
> "x86/p2m: don't assert that the passed in MFN matches for a remove"
> and adjust it to the Arm code base.
> 
> Basically, this check is strictly needed for the xenheap pages only
> since there are several non-protected read accesses to our simplified
> xenheap based M2P approach on Arm (most calls to page_get_xenheap_gfn()
> are not protected by the P2M lock).

To me, this read as you introduced a bug in patch #1 and now you are 
fixing it. So this patch should have been first.

> 
> But, it will be a good opportunity to harden the P2M code for *every*
> RAM pages since it is possible to remove any GFN - MFN mapping
> currently on Arm (even with the wrong helpers).

> This can result in
> a few issues when mapping is overridden silently (in particular when
> building dom0).

Hmmm... AFAIU, in such situation p2m_remove_mapping() wouldn't be 
called. Instead, we would call the mapping helper twice and the override 
would still happen.

> 
> Suggested-by: Julien Grall <jgrall@amazon.com>
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> ---
> You can find the corresponding discussion at:
> https://lore.kernel.org/xen-devel/82d8bfe0-cb46-d303-6a60-2324dd76a1f7@xen.org/
> 
> Changes V5 -> V6:
>   - new patch
> ---
>   xen/arch/arm/p2m.c | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
> 
> diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
> index f87b48e..635e474 100644
> --- a/xen/arch/arm/p2m.c
> +++ b/xen/arch/arm/p2m.c
> @@ -1311,11 +1311,32 @@ static inline int p2m_remove_mapping(struct domain *d,
>                                        mfn_t mfn)
>   {
>       struct p2m_domain *p2m = p2m_get_hostp2m(d);
> +    unsigned long i;
>       int rc;
>   
>       p2m_write_lock(p2m);
> +    for ( i = 0; i < nr; )
One bit I really hate in the x86 code is the lack of in-code 
documentation. It makes really difficult to understand the logic.

I know this code was taken from x86, but I would like to avoid making 
same mistake (this code is definitely not trivial). So can we document 
the logic?

The code itself looks good to me.

> +    {
> +        unsigned int cur_order;
> +        p2m_type_t t;
> +        mfn_t mfn_return = p2m_get_entry(p2m, gfn_add(start_gfn, i), &t, NULL,
> +                                         &cur_order, NULL);
> +
> +        if ( p2m_is_any_ram(t) &&
> +             (!mfn_valid(mfn) || !mfn_eq(mfn_add(mfn, i), mfn_return)) )
> +        {
> +            rc = -EILSEQ;
> +            goto out;
> +        }
> +
> +        i += (1UL << cur_order) -
> +             ((gfn_x(start_gfn) + i) & ((1UL << cur_order) - 1));
> +    }
> +
>       rc = p2m_set_entry(p2m, start_gfn, nr, INVALID_MFN,
>                          p2m_invalid, p2m_access_rwx);
> +
> +out:
>       p2m_write_unlock(p2m);
>   
>       return rc;

Cheers,

-- 
Julien Grall

