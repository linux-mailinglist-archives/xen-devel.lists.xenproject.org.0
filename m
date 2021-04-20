Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8643658CA
	for <lists+xen-devel@lfdr.de>; Tue, 20 Apr 2021 14:17:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.113584.216465 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYpK1-0005Gx-CH; Tue, 20 Apr 2021 12:17:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 113584.216465; Tue, 20 Apr 2021 12:17:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYpK1-0005GX-8F; Tue, 20 Apr 2021 12:17:41 +0000
Received: by outflank-mailman (input) for mailman id 113584;
 Tue, 20 Apr 2021 12:17:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nVk9=JR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lYpJz-0005GN-Fm
 for xen-devel@lists.xenproject.org; Tue, 20 Apr 2021 12:17:39 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 23a1bf1a-19ec-480f-88a6-1478a11a6020;
 Tue, 20 Apr 2021 12:17:38 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A299DB2E1;
 Tue, 20 Apr 2021 12:17:37 +0000 (UTC)
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
X-Inumbo-ID: 23a1bf1a-19ec-480f-88a6-1478a11a6020
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618921057; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c/+zxE0uiFPvIFS0I1UuwDxDqhSw5DNLUUOpC3KlqYk=;
	b=kXzHnZIt/7osW8X9ZeC3VLod0N510FEpmfX0F+hNai/nY1BXSUNja7mFTu7XLJZDYoMDKC
	DDRLE37Ap86z0U98GQEwu8iDu3D6He8kT6WYHNeXhpoQPEQxeOCZObYxM0QPXjR2a8apr9
	kzpM372ylqmjTTNPS6JTq2RHxVHu4rE=
Subject: Re: [PATCH v9 01/13] x86/mm: rewrite virt_to_xen_l*e
To: Hongyan Xia <hx242@xen.org>
Cc: jgrall@amazon.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <iwj@xenproject.org>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1617706782.git.hongyxia@amazon.com>
 <b70cc7c0854a6a25b00624b5fa83684a20916ca3.1617706782.git.hongyxia@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <fbc4a42f-549b-515f-279f-92466f89af79@suse.com>
Date: Tue, 20 Apr 2021 14:17:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <b70cc7c0854a6a25b00624b5fa83684a20916ca3.1617706782.git.hongyxia@amazon.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 06.04.2021 13:05, Hongyan Xia wrote:
> From: Wei Liu <wei.liu2@citrix.com>
> 
> Rewrite those functions to use the new APIs. Modify its callers to unmap
> the pointer returned. Since alloc_xen_pagetable_new() is almost never
> useful unless accompanied by page clearing and a mapping, introduce a
> helper alloc_map_clear_xen_pt() for this sequence.
> 
> Signed-off-by: Wei Liu <wei.liu2@citrix.com>
> Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
> 
> ---
> Changed in v9:
> - use domain_page_map_to_mfn() around the L3 table locking logic.
> - remove vmap_to_mfn() changes since we now use xen_map_to_mfn().
> 
> Changed in v8:
> - s/virtual address/linear address/.
> - BUG_ON() on NULL return in vmap_to_mfn().
> 
> Changed in v7:
> - remove a comment.
> - use l1e_get_mfn() instead of converting things back and forth.
> - add alloc_map_clear_xen_pt().

I realize this was in v7 already, but at v6 time the name I suggested
was

void *alloc_mapped_pagetable(mfn_t *mfn);

"alloc_map_clear_xen", for my taste at least, is too strange. It
doesn't really matter whether it's a page table for Xen's own use
(it typically will be), so "xen" could be dropped. Clearing of a
page table ought to also be the rule rather than the exception, so
I'd see "clear" also dropped. I'd be fine with alloc_map_pt() or
about any intermediate variant between that and my originally
suggested name.

> @@ -5108,7 +5140,8 @@ int map_pages_to_xen(
>      unsigned int flags)
>  {
>      bool locking = system_state > SYS_STATE_boot;
> -    l2_pgentry_t *pl2e, ol2e;
> +    l3_pgentry_t *pl3e = NULL, ol3e;
> +    l2_pgentry_t *pl2e = NULL, ol2e;
>      l1_pgentry_t *pl1e, ol1e;
>      unsigned int  i;
>      int rc = -ENOMEM;
> @@ -5132,15 +5165,16 @@ int map_pages_to_xen(
>  
>      while ( nr_mfns != 0 )
>      {
> -        l3_pgentry_t *pl3e, ol3e;
> -
> +        /* Clean up the previous iteration. */
>          L3T_UNLOCK(current_l3page);
> +        UNMAP_DOMAIN_PAGE(pl3e);
> +        UNMAP_DOMAIN_PAGE(pl2e);

Doing this here suggests the lower-case equivalent is needed at the
out label, even without looking at the rest of the function (doing
so confirms the suspicion, as there's at least one "goto out" with
pl2e clearly still mapped).

> @@ -5305,6 +5339,8 @@ int map_pages_to_xen(
>                  pl1e = virt_to_xen_l1e(virt);
>                  if ( pl1e == NULL )
>                      goto out;
> +
> +                UNMAP_DOMAIN_PAGE(pl1e);
>              }

Unmapping the page right after mapping it looks suspicious. I see that
further down we have

            pl1e  = l2e_to_l1e(*pl2e) + l1_table_offset(virt);

but don't you need to also change that? Actually, you do in patch 2,
but the latest then the double mapping should imo be avoided.

> @@ -5505,6 +5542,7 @@ int populate_pt_range(unsigned long virt, unsigned long nr_mfns)
>  int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
>  {
>      bool locking = system_state > SYS_STATE_boot;
> +    l3_pgentry_t *pl3e = NULL;
>      l2_pgentry_t *pl2e;
>      l1_pgentry_t *pl1e;
>      unsigned int  i;

And here we have the opposite situation: You don't set pl2e to NULL
and the function only uses l3e_to_l2e() to initialize the variable,
yet ...

> @@ -5761,6 +5799,8 @@ int modify_xen_mappings(unsigned long s, unsigned long e, unsigned int nf)
>  
>   out:
>      L3T_UNLOCK(current_l3page);
> +    unmap_domain_page(pl2e);
> +    unmap_domain_page(pl3e);

... here you try to unmap it. Did the two respective hunks somehow
magically get swapped?

> --- a/xen/common/vmap.c
> +++ b/xen/common/vmap.c
> @@ -1,6 +1,7 @@
>  #ifdef VMAP_VIRT_START
>  #include <xen/bitmap.h>
>  #include <xen/cache.h>
> +#include <xen/domain_page.h>

Why is this needed? (Looks like a now stale change.)

Jan

