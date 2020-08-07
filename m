Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D549123EEBC
	for <lists+xen-devel@lfdr.de>; Fri,  7 Aug 2020 16:10:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k4345-0004lI-R7; Fri, 07 Aug 2020 14:09:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ERlR=BR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k4344-0004lD-Is
 for xen-devel@lists.xenproject.org; Fri, 07 Aug 2020 14:09:44 +0000
X-Inumbo-ID: 86808189-a9db-4cbe-8328-a32fa1c8fdd5
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 86808189-a9db-4cbe-8328-a32fa1c8fdd5;
 Fri, 07 Aug 2020 14:09:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 17AA3B5E9;
 Fri,  7 Aug 2020 14:10:01 +0000 (UTC)
Subject: Re: [PATCH v8 07/15] x86_64/mm: switch to new APIs in paging_init
To: Hongyan Xia <hx242@xen.org>
References: <cover.1595857947.git.hongyxia@amazon.com>
 <9919850a82a7f189de2b5dcc62c55bc9d5337c4b.1595857947.git.hongyxia@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <249246be-fcf4-a610-24e8-ca85963f00d0@suse.com>
Date: Fri, 7 Aug 2020 16:09:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <9919850a82a7f189de2b5dcc62c55bc9d5337c4b.1595857947.git.hongyxia@amazon.com>
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
Cc: xen-devel@lists.xenproject.org, jgrall@amazon.com,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 27.07.2020 16:21, Hongyan Xia wrote:
> From: Wei Liu <wei.liu2@citrix.com>
> 
> Map and unmap pages instead of relying on the direct map.
> 
> Signed-off-by: Wei Liu <wei.liu2@citrix.com>
> Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> 
> ---
> Changed in v8:
> - replace l3/2_ro_mpt_mfn with just mfn since their lifetimes do not
>   overlap

Good, but ...

> --- a/xen/arch/x86/x86_64/mm.c
> +++ b/xen/arch/x86/x86_64/mm.c
> @@ -481,6 +481,7 @@ void __init paging_init(void)
>      l3_pgentry_t *l3_ro_mpt;
>      l2_pgentry_t *pl2e = NULL, *l2_ro_mpt = NULL;
>      struct page_info *l1_pg;
> +    mfn_t mfn;
>  
>      /*
>       * We setup the L3s for 1:1 mapping if host support memory hotplug
> @@ -493,22 +494,23 @@ void __init paging_init(void)
>          if ( !(l4e_get_flags(idle_pg_table[l4_table_offset(va)]) &
>                _PAGE_PRESENT) )
>          {
> -            l3_pgentry_t *pl3t = alloc_xen_pagetable();
> +            mfn_t l3mfn;

... what about this one? It's again only used ...

> +            l3_pgentry_t *pl3t = alloc_map_clear_xen_pt(&l3mfn);
>  
>              if ( !pl3t )
>                  goto nomem;
> -            clear_page(pl3t);
> +            UNMAP_DOMAIN_PAGE(pl3t);
>              l4e_write(&idle_pg_table[l4_table_offset(va)],
> -                      l4e_from_paddr(__pa(pl3t), __PAGE_HYPERVISOR_RW));
> +                      l4e_from_mfn(l3mfn, __PAGE_HYPERVISOR_RW));
>          }
>      }
>  
>      /* Create user-accessible L2 directory to map the MPT for guests. */
> -    if ( (l3_ro_mpt = alloc_xen_pagetable()) == NULL )
> +    l3_ro_mpt = alloc_map_clear_xen_pt(&mfn);

... without colliding with this first use of mfn.

Jan

