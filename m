Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CF6938008F
	for <lists+xen-devel@lfdr.de>; Fri, 14 May 2021 00:58:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.127102.238802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhKHb-00018K-1F; Thu, 13 May 2021 22:58:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 127102.238802; Thu, 13 May 2021 22:58:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lhKHa-00015H-Tq; Thu, 13 May 2021 22:58:18 +0000
Received: by outflank-mailman (input) for mailman id 127102;
 Thu, 13 May 2021 22:58:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=J2h5=KI=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1lhKHZ-000159-4N
 for xen-devel@lists.xenproject.org; Thu, 13 May 2021 22:58:17 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 038240cf-730e-4e95-ba80-0b82c1316b3d;
 Thu, 13 May 2021 22:58:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 856FC613F2;
 Thu, 13 May 2021 22:58:15 +0000 (UTC)
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
X-Inumbo-ID: 038240cf-730e-4e95-ba80-0b82c1316b3d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1620946695;
	bh=mJyZjD0j0jh/C9sjuzveh3hfW5aCZqoqnRKmjNZsgW8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=HocVW8WT1IhE6KWJGiBxD0c6F67fjN/+vtS+z8pA/p6izSawad3smgymhX7QUd7/l
	 UdxQrjKzewHiCaSmwvjlB9arf3Do67S+youUOGslNjpWtbrrLdxWn/HGB5QGr1HzCV
	 SlobJcf4rxZOGdo2KFTy80kpWYum/BpDi2+lzrxDBxX7h9PrUaDAoD6ePB8jFXNyl1
	 5loG41loVuce3jDzlXC5KXxP7YJK+aQxbVQF4S0kmIQkl1a0jfmVkFRtJe8wVhgYFH
	 M/riNtAGx4tVMWWToRAydOxgBao0Aan3Dg5t/XL74FFYYut+ED9qrUZlq4VVUhM23s
	 T5sABUu+8KHUA==
Date: Thu, 13 May 2021 15:58:14 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: xen-devel@lists.xenproject.org, Wei.Chen@arm.com, Henry.Wang@arm.com, 
    Penny.Zheng@arm.com, Bertrand.Marquis@arm.com, 
    Julien Grall <julien.grall@arm.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    Julien Grall <jgrall@amazon.com>
Subject: Re: [PATCH RFCv2 11/15] xen/arm: mm: Allow page-table allocation
 from the boot allocator
In-Reply-To: <20210425201318.15447-12-julien@xen.org>
Message-ID: <alpine.DEB.2.21.2105131556050.5018@sstabellini-ThinkPad-T480s>
References: <20210425201318.15447-1-julien@xen.org> <20210425201318.15447-12-julien@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sun, 25 Apr 2021, Julien Grall wrote:
> From: Julien Grall <julien.grall@arm.com>
> 
> At the moment, page-table can only be allocated from domheap. This means
> it is not possible to create mapping in the page-tables via
> map_pages_to_xen() if page-table needs to be allocated.
> 
> In order to avoid open-coding page-tables update in early boot, we need
> to be able to allocate page-tables much earlier. Thankfully, we have the
> boot allocator for those cases.
> 
> create_xen_table() is updated to cater early boot allocation by using
> alloc_boot_pages().
> 
> Note, this is not sufficient to bootstrap the page-tables (i.e mapping
> before any memory is actually mapped). This will be addressed
> separately.
> 
> Signed-off-by: Julien Grall <julien.grall@arm.com>
> Signed-off-by: Julien Grall <jgrall@amazon.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>     Changes in v2:
>         - New patch
> ---
>  xen/arch/arm/mm.c | 20 ++++++++++++++------
>  1 file changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index ae5a07ea956b..d090fdfd5994 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -1011,19 +1011,27 @@ static void xen_unmap_table(const lpae_t *table)
>  
>  static int create_xen_table(lpae_t *entry)
>  {
> -    struct page_info *pg;
> +    mfn_t mfn;
>      void *p;
>      lpae_t pte;
>  
> -    pg = alloc_domheap_page(NULL, 0);
> -    if ( pg == NULL )
> -        return -ENOMEM;
> +    if ( system_state != SYS_STATE_early_boot )
> +    {
> +        struct page_info *pg = alloc_domheap_page(NULL, 0);
> +
> +        if ( pg == NULL )
> +            return -ENOMEM;
> +
> +        mfn = page_to_mfn(pg);
> +    }
> +    else
> +        mfn = alloc_boot_pages(1, 1);
>  
> -    p = xen_map_table(page_to_mfn(pg));
> +    p = xen_map_table(mfn);
>      clear_page(p);
>      xen_unmap_table(p);
>  
> -    pte = mfn_to_xen_entry(page_to_mfn(pg), MT_NORMAL);
> +    pte = mfn_to_xen_entry(mfn, MT_NORMAL);
>      pte.pt.table = 1;
>      write_pte(entry, pte);
>  
> -- 
> 2.17.1
> 

