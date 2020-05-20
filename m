Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A5F981DAEAF
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2020 11:27:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbL0B-0004zG-Fo; Wed, 20 May 2020 09:27:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=txLX=7C=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jbL0A-0004zA-MK
 for xen-devel@lists.xenproject.org; Wed, 20 May 2020 09:27:02 +0000
X-Inumbo-ID: 0f5fcd2a-9a7c-11ea-b9cf-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0f5fcd2a-9a7c-11ea-b9cf-bc764e2007e4;
 Wed, 20 May 2020 09:27:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 380DFACC3;
 Wed, 20 May 2020 09:27:03 +0000 (UTC)
Subject: Re: [PATCH v6 03/15] x86/mm: rewrite virt_to_xen_l*e
To: Hongyan Xia <hx242@xen.org>
References: <cover.1587735799.git.hongyxia@amazon.com>
 <949d2dc54fd7d3230db6a0934d73668a9999eb1a.1587735799.git.hongyxia@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5128cd55-99af-65eb-af82-1e84dcf108d0@suse.com>
Date: Wed, 20 May 2020 11:27:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <949d2dc54fd7d3230db6a0934d73668a9999eb1a.1587735799.git.hongyxia@amazon.com>
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

On 24.04.2020 16:08, Hongyan Xia wrote:
> @@ -4998,31 +5005,40 @@ static l2_pgentry_t *virt_to_xen_l2e(unsigned long v)
>      if ( !(l3e_get_flags(*pl3e) & _PAGE_PRESENT) )
>      {
>          bool locking = system_state > SYS_STATE_boot;
> -        l2_pgentry_t *l2t = alloc_xen_pagetable();
> +        l2_pgentry_t *l2t;
> +        mfn_t l2mfn = alloc_xen_pagetable_new();
>  
> -        if ( !l2t )
> +        if ( mfn_eq(l2mfn, INVALID_MFN) )
> +        {
> +            UNMAP_DOMAIN_PAGE(pl3e);
>              return NULL;
> +        }
> +        l2t = map_domain_page(l2mfn);
>          clear_page(l2t);
> +        UNMAP_DOMAIN_PAGE(l2t);
>          if ( locking )
>              spin_lock(&map_pgdir_lock);
>          if ( !(l3e_get_flags(*pl3e) & _PAGE_PRESENT) )
>          {
> -            l3e_write(pl3e, l3e_from_paddr(__pa(l2t), __PAGE_HYPERVISOR));
> -            l2t = NULL;
> +            l3e_write(pl3e, l3e_from_mfn(l2mfn, __PAGE_HYPERVISOR));
> +            l2mfn = INVALID_MFN;
>          }
>          if ( locking )
>              spin_unlock(&map_pgdir_lock);
> -        if ( l2t )
> -            free_xen_pagetable(l2t);
> +        free_xen_pagetable_new(l2mfn);
>      }
>  
>      BUG_ON(l3e_get_flags(*pl3e) & _PAGE_PSE);
> -    return l3e_to_l2e(*pl3e) + l2_table_offset(v);
> +    pl2e = map_l2t_from_l3e(*pl3e) + l2_table_offset(v);
> +    unmap_domain_page(pl3e);

To avoid undue pressure on the number of active mappings I'd like
to ask that you unmap first, then establish the new mapping.

> @@ -5095,6 +5119,10 @@ int map_pages_to_xen(
>  
>      while ( nr_mfns != 0 )
>      {
> +        /* Clean up mappings mapped in the previous iteration. */
> +        UNMAP_DOMAIN_PAGE(pl3e);
> +        UNMAP_DOMAIN_PAGE(pl2e);
> +
>          pl3e = virt_to_xen_l3e(virt);

As you don't add a comment here (and at other call sites of
virt_to_xen_l<N>e()), ...

> @@ -5260,9 +5288,12 @@ int map_pages_to_xen(
>              /* Normal page mapping. */
>              if ( !(l2e_get_flags(*pl2e) & _PAGE_PRESENT) )
>              {
> +                /* This forces the mapping to be populated. */
>                  pl1e = virt_to_xen_l1e(virt);

... I don't see why one needs adding here.

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
> +        unsigned long pfn_ = l1e_get_pfn(*pl1e_);                           \

l1e_get_mfn()?

> +        unmap_domain_page(pl1e_);                                           \
> +        _mfn(pfn_); })
> +
>  #define vmap_to_page(va)    mfn_to_page(vmap_to_mfn(va))
>  
>  #endif /* !defined(__ASSEMBLY__) */

Jan

