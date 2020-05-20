Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 949471DAF27
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2020 11:46:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbLIe-0006wC-Lk; Wed, 20 May 2020 09:46:08 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=txLX=7C=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jbLIc-0006w7-W8
 for xen-devel@lists.xenproject.org; Wed, 20 May 2020 09:46:07 +0000
X-Inumbo-ID: b997d02e-9a7e-11ea-9887-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b997d02e-9a7e-11ea-9887-bc764e2007e4;
 Wed, 20 May 2020 09:46:06 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id C6AB8AED9;
 Wed, 20 May 2020 09:46:07 +0000 (UTC)
Subject: Re: [PATCH v6 07/15] x86_64/mm: switch to new APIs in paging_init
To: Hongyan Xia <hx242@xen.org>
References: <cover.1587735799.git.hongyxia@amazon.com>
 <0655cc2d3dc27141ef102076c4ad390a37191b37.1587735799.git.hongyxia@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <80d185d4-c7c3-53b9-d851-ab56ea4bc755@suse.com>
Date: Wed, 20 May 2020 11:46:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <0655cc2d3dc27141ef102076c4ad390a37191b37.1587735799.git.hongyxia@amazon.com>
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
Cc: xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, julien@xen.org,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 24.04.2020 16:08, Hongyan Xia wrote:
> @@ -493,22 +494,28 @@ void __init paging_init(void)
>          if ( !(l4e_get_flags(idle_pg_table[l4_table_offset(va)]) &
>                _PAGE_PRESENT) )
>          {
> -            l3_pgentry_t *pl3t = alloc_xen_pagetable();
> +            l3_pgentry_t *pl3t;
> +            mfn_t l3mfn = alloc_xen_pagetable_new();
>  
> -            if ( !pl3t )
> +            if ( mfn_eq(l3mfn, INVALID_MFN) )
>                  goto nomem;
> +
> +            pl3t = map_domain_page(l3mfn);
>              clear_page(pl3t);
>              l4e_write(&idle_pg_table[l4_table_offset(va)],
> -                      l4e_from_paddr(__pa(pl3t), __PAGE_HYPERVISOR_RW));
> +                      l4e_from_mfn(l3mfn, __PAGE_HYPERVISOR_RW));
> +            unmap_domain_page(pl3t);

This can be moved up, and once it is you'll notice that you're
open-coding clear_domain_page(). I wonder whether I didn't spot
the same in other patches of this series.

Besides the previously raised point of possibly having an
allocation function that returns a mapping of the page right
away (not needed here) - are there many cases where allocation
of a new page table isn't accompanied by clearing the page? If
not, should the function perhaps do so (and then, once it has
a mapping anyway, it would be even more so natural to return
it for users wanting a mapping anyway)?

> @@ -662,6 +677,8 @@ void __init paging_init(void)
>      return;
>  
>   nomem:
> +    UNMAP_DOMAIN_PAGE(l2_ro_mpt);
> +    UNMAP_DOMAIN_PAGE(l3_ro_mpt);
>      panic("Not enough memory for m2p table\n");
>  }

I don't think this is a very useful addition.

Jan

