Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D86715584F1
	for <lists+xen-devel@lfdr.de>; Thu, 23 Jun 2022 19:51:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.355096.582551 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4QyD-0003Ly-Gl; Thu, 23 Jun 2022 17:50:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 355096.582551; Thu, 23 Jun 2022 17:50:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o4QyD-0003Iy-DY; Thu, 23 Jun 2022 17:50:21 +0000
Received: by outflank-mailman (input) for mailman id 355096;
 Thu, 23 Jun 2022 17:50:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1o4QyC-0003Is-7K
 for xen-devel@lists.xenproject.org; Thu, 23 Jun 2022 17:50:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o4QyB-0002NG-BM; Thu, 23 Jun 2022 17:50:19 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=[192.168.0.239]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1o4QyB-0008HH-3r; Thu, 23 Jun 2022 17:50:19 +0000
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
	bh=tqk1hy+kIMGA35BVYbXUaKlK3h+awE2BvB7uWBSKPQM=; b=AazkShVuUI34tY+XSI0AKGA2PC
	ZPKXtC0SoGFaHKSrKzb1g7nY1u+5hxCH0TISviUi/F1cX2/E7hR9ppJLAdmAPD4axHR71ffycnFp6
	4HkN6UDJOtGlJbxKBSubY2SNn3dQRyXt27dnysU4BHlfsvn3DqVZfvfBu3TBMBiWUcws=;
Message-ID: <632404c3-b285-753d-6644-bccbc17d42c0@xen.org>
Date: Thu, 23 Jun 2022 18:50:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.10.0
Subject: Re: [PATCH V6 1/2] xen/gnttab: Store frame GFN in struct page_info on
 Arm
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <1652294845-13980-1-git-send-email-olekstysh@gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <1652294845-13980-1-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Oleksandr,

Sorry for the late reply.

On 11/05/2022 19:47, Oleksandr Tyshchenko wrote:
> diff --git a/xen/arch/arm/include/asm/mm.h b/xen/arch/arm/include/asm/mm.h
> +/*
> + * All accesses to the GFN portion of type_info field should always be
> + * protected by the P2M lock. In case when it is not feasible to satisfy
> + * that requirement (risk of deadlock, lock inversion, etc) it is important
> + * to make sure that all non-protected updates to this field are atomic.

Here you say the non-protected updates should be atomic but...

[...]

> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index 7b1f2f4..c94bdaf 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -1400,8 +1400,10 @@ void share_xen_page_with_guest(struct page_info *page, struct domain *d,
>       spin_lock(&d->page_alloc_lock);
>   
>       /* The incremented type count pins as writable or read-only. */
> -    page->u.inuse.type_info =
> -        (flags == SHARE_ro ? PGT_none : PGT_writable_page) | 1;
> +    page->u.inuse.type_info &= ~(PGT_type_mask | PGT_count_mask);
> +    page->u.inuse.type_info |= (flags == SHARE_ro ? PGT_none
> +                                                  : PGT_writable_page) |
> +                                MASK_INSR(1, PGT_count_mask);

... this is not going to be atomic. So I would suggest to add a comment 
explaining why this is fine.

>   
>       page_set_owner(page, d);
>       smp_wmb(); /* install valid domain ptr before updating refcnt. */
> @@ -1505,7 +1507,23 @@ int xenmem_add_to_physmap_one(
>       }
>   
>       /* Map at new location. */
> -    rc = guest_physmap_add_entry(d, gfn, mfn, 0, t);

> +    if ( !p2m_is_ram(t) || !is_xen_heap_mfn(mfn) )
> +        rc = guest_physmap_add_entry(d, gfn, mfn, 0, t);

I would expand the comment above to explain why you need a different 
path for xenheap mapped as RAM. AFAICT, this is because we need to call 
page_set_xenheap_gfn().

> +    else
> +    {
> +        struct p2m_domain *p2m = p2m_get_hostp2m(d);
> +
> +        p2m_write_lock(p2m);
> +        if ( gfn_eq(page_get_xenheap_gfn(mfn_to_page(mfn)), INVALID_GFN) )

Sorry to only notice it now. This check will also change the behavior 
for XENMAPSPACE_shared_info. Now, we are only allowed to map the shared 
info once.

I believe this is fine because AFAICT x86 already prevents it. But this 
is probably something that ought to be explained in the already long 
commit message.

My comments are mainly seeking for clarifications. The code itself looks 
correct to me. I can handle the comments on commit to save you a round 
trip once we agree on them.

Cheers,

-- 
Julien Grall

