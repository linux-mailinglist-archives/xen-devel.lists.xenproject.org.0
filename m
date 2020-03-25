Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3470192C8D
	for <lists+xen-devel@lfdr.de>; Wed, 25 Mar 2020 16:31:18 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jH7w3-0004hh-CO; Wed, 25 Mar 2020 15:27:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=grKZ=5K=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jH7w2-0004hc-8b
 for xen-devel@lists.xenproject.org; Wed, 25 Mar 2020 15:27:14 +0000
X-Inumbo-ID: 198fe19a-6ead-11ea-92cf-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 198fe19a-6ead-11ea-92cf-bc764e2007e4;
 Wed, 25 Mar 2020 15:27:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id D2E88AD07;
 Wed, 25 Mar 2020 15:27:11 +0000 (UTC)
To: julien@xen.org
References: <20200322161418.31606-1-julien@xen.org>
 <20200322161418.31606-5-julien@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ae87e95c-b897-4057-0400-944764734875@suse.com>
Date: Wed, 25 Mar 2020 16:27:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200322161418.31606-5-julien@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [Xen-devel] [PATCH 04/17] xen: Convert virt_to_mfn() and
 mfn_to_virt() to use typesafe MFN
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <jgrall@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 Lukasz Hawrylko <lukasz.hawrylko@linux.intel.com>,
 xen-devel@lists.xenproject.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 22.03.2020 17:14, julien@xen.org wrote:
> @@ -785,21 +781,21 @@ bool is_iomem_page(mfn_t mfn)
>      return (page_get_owner(page) == dom_io);
>  }
>  
> -static int update_xen_mappings(unsigned long mfn, unsigned int cacheattr)
> +static int update_xen_mappings(mfn_t mfn, unsigned int cacheattr)
>  {
>      int err = 0;
> -    bool alias = mfn >= PFN_DOWN(xen_phys_start) &&
> -         mfn < PFN_UP(xen_phys_start + xen_virt_end - XEN_VIRT_START);
> +    bool alias = mfn_x(mfn) >= PFN_DOWN(xen_phys_start) &&
> +         mfn_x(mfn) < PFN_UP(xen_phys_start + xen_virt_end - XEN_VIRT_START);
>      unsigned long xen_va =
> -        XEN_VIRT_START + ((mfn - PFN_DOWN(xen_phys_start)) << PAGE_SHIFT);
> +        XEN_VIRT_START + mfn_to_maddr(mfn_add(mfn, -PFN_DOWN(xen_phys_start)));

Depending on the types involved (e.g. in PFN_DOWN()) this may
or may not be safe, so I consider such a transformation at
least fragile. I think we either want to gain mfn_sub() or
keep this as a "real" subtraction.

> @@ -584,21 +584,21 @@ static unsigned long init_node_heap(int node, unsigned long mfn,
>          needed = 0;
>      }
>      else if ( *use_tail && nr >= needed &&
> -              arch_mfn_in_directmap(mfn + nr) &&
> +              arch_mfn_in_directmap(mfn_x(mfn_add(mfn, nr))) &&
>                (!xenheap_bits ||
> -               !((mfn + nr - 1) >> (xenheap_bits - PAGE_SHIFT))) )
> +               !((mfn_x(mfn) + nr - 1) >> (xenheap_bits - PAGE_SHIFT))) )

May I suggest consistency here: This one uses +, while ...

>      {
> -        _heap[node] = mfn_to_virt(mfn + nr - needed);
> -        avail[node] = mfn_to_virt(mfn + nr - 1) +
> +        _heap[node] = mfn_to_virt(mfn_add(mfn, nr - needed));
> +        avail[node] = mfn_to_virt(mfn_add(mfn, nr - 1)) +
>                        PAGE_SIZE - sizeof(**avail) * NR_ZONES;
>      }
>      else if ( nr >= needed &&
> -              arch_mfn_in_directmap(mfn + needed) &&
> +              arch_mfn_in_directmap(mfn_x(mfn_add(mfn, needed))) &&

... this one uses mfn_add() despite the mfn_x() around it, and ...

>                (!xenheap_bits ||
> -               !((mfn + needed - 1) >> (xenheap_bits - PAGE_SHIFT))) )
> +               !((mfn_x(mfn) + needed - 1) >> (xenheap_bits - PAGE_SHIFT))) )

... here you use + again. My personal preference would be to avoid
constructs like mfn_x(mfn_add()).

> @@ -269,10 +270,10 @@ out_dealloc:
>              continue;
>          for ( i = 0; i < pages; i++ )
>          {
> -            uint32_t mfn = t_info_mfn_list[offset + i];
> -            if ( !mfn )
> +            mfn_t mfn = _mfn(t_info_mfn_list[offset + i]);
> +            if ( mfn_eq(mfn, _mfn(0)) )

Please could you take the opportunity and add the missing blank line
between these two?

> --- a/xen/include/asm-x86/mm.h
> +++ b/xen/include/asm-x86/mm.h
> @@ -667,7 +667,7 @@ static inline bool arch_mfn_in_directmap(unsigned long mfn)
>  {
>      unsigned long eva = min(DIRECTMAP_VIRT_END, HYPERVISOR_VIRT_END);
>  
> -    return mfn <= (virt_to_mfn(eva - 1) + 1);
> +    return mfn <= mfn_x(mfn_add(virt_to_mfn(eva - 1),  1));

Even if you wanted to stick to using mfn_add() here, there's one
blank too many after the comma.

With these taken care of
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

