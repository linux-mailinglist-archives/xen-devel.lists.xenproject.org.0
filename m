Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E71E91DAF72
	for <lists+xen-devel@lfdr.de>; Wed, 20 May 2020 11:54:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbLQe-0007ry-JG; Wed, 20 May 2020 09:54:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=txLX=7C=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jbLQd-0007rt-HR
 for xen-devel@lists.xenproject.org; Wed, 20 May 2020 09:54:23 +0000
X-Inumbo-ID: e18e8e64-9a7f-11ea-9887-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e18e8e64-9a7f-11ea-9887-bc764e2007e4;
 Wed, 20 May 2020 09:54:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7F383AC49;
 Wed, 20 May 2020 09:54:24 +0000 (UTC)
Subject: Re: [PATCH v6 08/15] x86_64/mm: switch to new APIs in setup_m2p_table
To: Hongyan Xia <hx242@xen.org>
References: <cover.1587735799.git.hongyxia@amazon.com>
 <a5e7c92fdc538c23f0173bec8e3b026dcf665c11.1587735799.git.hongyxia@amazon.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ac76fddd-06f8-9e60-24b7-bd942265b3c6@suse.com>
Date: Wed, 20 May 2020 11:54:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <a5e7c92fdc538c23f0173bec8e3b026dcf665c11.1587735799.git.hongyxia@amazon.com>
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
> --- a/xen/arch/x86/x86_64/mm.c
> +++ b/xen/arch/x86/x86_64/mm.c
> @@ -379,13 +379,13 @@ static int setup_m2p_table(struct mem_hotadd_info *info)
>  {
>      unsigned long i, va, smap, emap;
>      unsigned int n;
> -    l2_pgentry_t *l2_ro_mpt = NULL;
>      l3_pgentry_t *l3_ro_mpt = NULL;
>      int ret = 0;
>  
>      ASSERT(l4e_get_flags(idle_pg_table[l4_table_offset(RO_MPT_VIRT_START)])
>              & _PAGE_PRESENT);
> -    l3_ro_mpt = l4e_to_l3e(idle_pg_table[l4_table_offset(RO_MPT_VIRT_START)]);
> +    l3_ro_mpt = map_l3t_from_l4e(
> +                    idle_pg_table[l4_table_offset(RO_MPT_VIRT_START)]);
>  
>      smap = (info->spfn & (~((1UL << (L2_PAGETABLE_SHIFT - 3)) -1)));
>      emap = ((info->epfn + ((1UL << (L2_PAGETABLE_SHIFT - 3)) - 1 )) &
> @@ -424,6 +424,7 @@ static int setup_m2p_table(struct mem_hotadd_info *info)
>                  break;
>          if ( n < CNT )
>          {
> +            l2_pgentry_t *l2_ro_mpt;
>              mfn_t mfn = alloc_hotadd_mfn(info);
>  
>              ret = map_pages_to_xen(
> @@ -440,30 +441,30 @@ static int setup_m2p_table(struct mem_hotadd_info *info)
>                    _PAGE_PSE));
>              if ( l3e_get_flags(l3_ro_mpt[l3_table_offset(va)]) &
>                _PAGE_PRESENT )
> -                l2_ro_mpt = l3e_to_l2e(l3_ro_mpt[l3_table_offset(va)]) +
> -                  l2_table_offset(va);
> +                l2_ro_mpt = map_l2t_from_l3e(l3_ro_mpt[l3_table_offset(va)]);
>              else
>              {
> -                l2_ro_mpt = alloc_xen_pagetable();
> -                if ( !l2_ro_mpt )
> +                mfn_t l2_ro_mpt_mfn = alloc_xen_pagetable_new();
> +
> +                if ( mfn_eq(l2_ro_mpt_mfn, INVALID_MFN) )
>                  {
>                      ret = -ENOMEM;
>                      goto error;
>                  }
>  
> +                l2_ro_mpt = map_domain_page(l2_ro_mpt_mfn);
>                  clear_page(l2_ro_mpt);
>                  l3e_write(&l3_ro_mpt[l3_table_offset(va)],
> -                          l3e_from_paddr(__pa(l2_ro_mpt),
> -                                         __PAGE_HYPERVISOR_RO | _PAGE_USER));
> -                l2_ro_mpt += l2_table_offset(va);
> +                          l3e_from_mfn(l2_ro_mpt_mfn,
> +                                       __PAGE_HYPERVISOR_RO | _PAGE_USER));
>              }
> +            l2_ro_mpt += l2_table_offset(va);
>  
>              /* NB. Cannot be GLOBAL: guest user mode should not see it. */
>              l2e_write(l2_ro_mpt, l2e_from_mfn(mfn,
>                     /*_PAGE_GLOBAL|*/_PAGE_PSE|_PAGE_USER|_PAGE_PRESENT));
> +            unmap_domain_page(l2_ro_mpt);
>          }
> -        if ( !((unsigned long)l2_ro_mpt & ~PAGE_MASK) )
> -            l2_ro_mpt = NULL;

I think you want to consider retaining these two lines and the wider
scope of l2_ro_mpt, to leverage it to avoid mapping and unmapping
the same L2 page over and over on each loop iteration.

Jan

