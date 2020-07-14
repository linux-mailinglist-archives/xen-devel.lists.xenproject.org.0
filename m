Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C9021EE4A
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jul 2020 12:48:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jvITD-0008VM-W4; Tue, 14 Jul 2020 10:47:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=bg5W=AZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jvITC-0008VH-PS
 for xen-devel@lists.xenproject.org; Tue, 14 Jul 2020 10:47:30 +0000
X-Inumbo-ID: 695681de-c5bf-11ea-8496-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 695681de-c5bf-11ea-8496-bc764e2007e4;
 Tue, 14 Jul 2020 10:47:29 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AC26FACF9;
 Tue, 14 Jul 2020 10:47:30 +0000 (UTC)
Subject: Re: [PATCH v7 03/15] x86/mm: rewrite virt_to_xen_l*e
To: Hongyan Xia <hx242@xen.org>
References: <cover.1590750232.git.hongyxia@amazon.com>
 <fd5d98198d9539b232a570a83e7a24be2407e739.1590750232.git.hongyxia@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <826d5a28-c391-dd30-d588-6f730b454c18@suse.com>
Date: Tue, 14 Jul 2020 12:47:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <fd5d98198d9539b232a570a83e7a24be2407e739.1590750232.git.hongyxia@amazon.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, julien@xen.org,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 29.05.2020 13:11, Hongyan Xia wrote:
> From: Wei Liu <wei.liu2@citrix.com>
> 
> Rewrite those functions to use the new APIs. Modify its callers to unmap
> the pointer returned. Since alloc_xen_pagetable_new() is almost never
> useful unless accompanied by page clearing and a mapping, introduce a
> helper alloc_map_clear_xen_pt() for this sequence.
> 
> Note that the change of virt_to_xen_l1e() also requires vmap_to_mfn() to
> unmap the page, which requires domain_page.h header in vmap.
> 
> Signed-off-by: Wei Liu <wei.liu2@citrix.com>
> Signed-off-by: Hongyan Xia <hongyxia@amazon.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with two further small adjustments:

> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -4948,8 +4948,28 @@ void free_xen_pagetable_new(mfn_t mfn)
>          free_xenheap_page(mfn_to_virt(mfn_x(mfn)));
>  }
>  
> +void *alloc_map_clear_xen_pt(mfn_t *pmfn)
> +{
> +    mfn_t mfn = alloc_xen_pagetable_new();
> +    void *ret;
> +
> +    if ( mfn_eq(mfn, INVALID_MFN) )
> +        return NULL;
> +
> +    if ( pmfn )
> +        *pmfn = mfn;
> +    ret = map_domain_page(mfn);
> +    clear_page(ret);
> +
> +    return ret;
> +}
> +
>  static DEFINE_SPINLOCK(map_pgdir_lock);
>  
> +/*
> + * For virt_to_xen_lXe() functions, they take a virtual address and return a
> + * pointer to Xen's LX entry. Caller needs to unmap the pointer.
> + */
>  static l3_pgentry_t *virt_to_xen_l3e(unsigned long v)

May I suggest s/virtual/linear/ to at least make the new comment
correct?

> --- a/xen/include/asm-x86/page.h
> +++ b/xen/include/asm-x86/page.h
> @@ -291,7 +291,13 @@ void copy_page_sse2(void *, const void *);
>  #define pfn_to_paddr(pfn)   __pfn_to_paddr(pfn)
>  #define paddr_to_pfn(pa)    __paddr_to_pfn(pa)
>  #define paddr_to_pdx(pa)    pfn_to_pdx(paddr_to_pfn(pa))
> -#define vmap_to_mfn(va)     _mfn(l1e_get_pfn(*virt_to_xen_l1e((unsigned long)(va))))
> +
> +#define vmap_to_mfn(va) ({                                                  \
> +        const l1_pgentry_t *pl1e_ = virt_to_xen_l1e((unsigned long)(va));   \
> +        mfn_t mfn_ = l1e_get_mfn(*pl1e_);                                   \
> +        unmap_domain_page(pl1e_);                                           \
> +        mfn_; })

Just like is already the case in domain_page_map_to_mfn() I think
you want to add "BUG_ON(!pl1e)" here to limit the impact of any
problem to DoS (rather than a possible privilege escalation).

Or actually, considering the only case where virt_to_xen_l1e()
would return NULL, returning INVALID_MFN here would likely be
even more robust. There looks to be just a single caller, which
would need adjusting to cope with an error coming back. In fact -
it already ASSERT()s, despite NULL right now never coming back
from vmap_to_page(). I think the loop there would better be

    for ( i = 0; i < pages; i++ )
    {
        struct page_info *page = vmap_to_page(va + i * PAGE_SIZE);

        if ( page )
            page_list_add(page, &pg_list);
        else
            printk_once(...);
    }

Thoughts?

Jan

