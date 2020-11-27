Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 611B12C6805
	for <lists+xen-devel@lfdr.de>; Fri, 27 Nov 2020 15:39:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.39518.72458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kieuV-0000Va-Mw; Fri, 27 Nov 2020 14:39:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 39518.72458; Fri, 27 Nov 2020 14:39:43 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kieuV-0000VD-Hl; Fri, 27 Nov 2020 14:39:43 +0000
Received: by outflank-mailman (input) for mailman id 39518;
 Fri, 27 Nov 2020 14:39:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rmeX=FB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kieuT-0000V2-QD
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 14:39:41 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 96b2181a-2184-4f83-be4c-abeaede88ee2;
 Fri, 27 Nov 2020 14:39:40 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D0FBFABD7;
 Fri, 27 Nov 2020 14:39:39 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=rmeX=FB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kieuT-0000V2-QD
	for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 14:39:41 +0000
X-Inumbo-ID: 96b2181a-2184-4f83-be4c-abeaede88ee2
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 96b2181a-2184-4f83-be4c-abeaede88ee2;
	Fri, 27 Nov 2020 14:39:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606487979; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UmA4DRpHijWQ21BBicmaNvL34nvckkY07jwQErDBbIA=;
	b=lyX8Fo0RvawhGB2l3Z/ui2tbWH3kRRaCorXIeOb6FZpsvS58iHzTuinbbFFFk5ZQC1+4KN
	u6u3yBUgw11nJwvSHxd9+wrnjOmnCO6RG4upUUQk32Ip5rl5oYDI7ideUh0KDv39Ye0hPd
	KBVapFTNphHZVZh65WzCENr7sYc1b3Y=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id D0FBFABD7;
	Fri, 27 Nov 2020 14:39:39 +0000 (UTC)
Subject: Re: [PATCH v10 1/7] remove remaining uses of iommu_legacy_map/unmap
To: Paul Durrant <paul@xen.org>
Cc: Paul Durrant <pdurrant@amazon.com>, Julien Grall <jgrall@amazon.com>,
 Kevin Tian <kevin.tian@intel.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org
References: <20201120132440.1141-1-paul@xen.org>
 <20201120132440.1141-2-paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <bf07896c-c2ce-6f5f-eb82-4180b60fa58e@suse.com>
Date: Fri, 27 Nov 2020 15:39:40 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201120132440.1141-2-paul@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 20.11.2020 14:24, Paul Durrant wrote:
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -2489,10 +2489,16 @@ static int cleanup_page_mappings(struct page_info *page)
>  
>          if ( d && unlikely(need_iommu_pt_sync(d)) && is_pv_domain(d) )
>          {
> -            int rc2 = iommu_legacy_unmap(d, _dfn(mfn), 1u << PAGE_ORDER_4K);
> +            unsigned int flush_flags = 0;
> +            int err;
> +
> +            err = iommu_unmap(d, _dfn(mfn), 1ul << PAGE_ORDER_4K, &flush_flags);
> +            if ( !err && !this_cpu(iommu_dont_flush_iotlb) )
> +                err = iommu_iotlb_flush(d, _dfn(mfn), 1ul << PAGE_ORDER_4K,
> +                                        flush_flags);

As was the subject of XSA-346, honoring on a path leading to
the freeing of a page _before_ the delayed flush actually
happens is wrong. Luckily the first of the two patches for
that XSA arranged for you never being able to observe the flag
set, so the check here is simply pointless. But it should
still be removed for documentation purposes.

> @@ -3014,14 +3020,20 @@ static int _get_page_type(struct page_info *page, unsigned long type,
>          if ( d && unlikely(need_iommu_pt_sync(d)) && is_pv_domain(d) )
>          {
>              mfn_t mfn = page_to_mfn(page);
> +            dfn_t dfn = _dfn(mfn_x(mfn));
> +            unsigned int flush_flags = 0;
>  
>              if ( (x & PGT_type_mask) == PGT_writable_page )
> -                rc = iommu_legacy_unmap(d, _dfn(mfn_x(mfn)),
> -                                        1ul << PAGE_ORDER_4K);
> +                rc = iommu_unmap(d, dfn, 1ul << PAGE_ORDER_4K, &flush_flags);
>              else
> -                rc = iommu_legacy_map(d, _dfn(mfn_x(mfn)), mfn,
> -                                      1ul << PAGE_ORDER_4K,
> -                                      IOMMUF_readable | IOMMUF_writable);
> +            {
> +                rc = iommu_map(d, dfn, mfn, 1ul << PAGE_ORDER_4K,
> +                               IOMMUF_readable | IOMMUF_writable, &flush_flags);
> +            }
> +
> +            if ( !rc && !this_cpu(iommu_dont_flush_iotlb) )
> +                rc = iommu_iotlb_flush(d, dfn, 1ul << PAGE_ORDER_4K,
> +                                       flush_flags);

Along these lines here - at least the unmapping needs to be
followed by a flush before the page can assume its new role.
Yet again I don't think the flag can ever be observed true
here, first and foremost because of the is_pv_domain() in
the surrounding if(). While the check could be made
conditional upon the prior operation having been a map, I
think it's again easier to simply delete the dead check.

> --- a/xen/arch/x86/mm/p2m-ept.c
> +++ b/xen/arch/x86/mm/p2m-ept.c
> @@ -842,15 +842,19 @@ out:
>      if ( rc == 0 && p2m_is_hostp2m(p2m) &&
>           need_modify_vtd_table )
>      {
> -        if ( iommu_use_hap_pt(d) && !this_cpu(iommu_dont_flush_iotlb) )
> -            rc = iommu_iotlb_flush(d, _dfn(gfn), 1ul << order,
> -                                   (iommu_flags ? IOMMU_FLUSHF_added : 0) |
> -                                   (vtd_pte_present ? IOMMU_FLUSHF_modified
> -                                                    : 0));
> -        else if ( need_iommu_pt_sync(d) )
> +        unsigned int flush_flags = 0;
> +
> +        if ( need_iommu_pt_sync(d) )
>              rc = iommu_flags ?
> -                iommu_legacy_map(d, _dfn(gfn), mfn, 1ul << order, iommu_flags) :
> -                iommu_legacy_unmap(d, _dfn(gfn), 1ul << order);
> +                iommu_map(d, _dfn(gfn), mfn, 1ul << order, iommu_flags,
> +                          &flush_flags) :
> +                iommu_unmap(d, _dfn(gfn), 1ul << order, &flush_flags);
> +        else if ( iommu_use_hap_pt(d) )
> +            flush_flags = (iommu_flags ? IOMMU_FLUSHF_added : 0) |
> +                          (vtd_pte_present ? IOMMU_FLUSHF_modified : 0);

Is there a particular reason you inverted the order of the
iommu_use_hap_pt() and need_iommu_pt_sync() checks here?
The common (default) case for VT-x / VT-d / EPT is going to
be shared page tables, so I think this should remain the
path getting away with just one evaluation of a conditional.

> --- a/xen/common/memory.c
> +++ b/xen/common/memory.c
> @@ -836,8 +836,8 @@ int xenmem_add_to_physmap(struct domain *d, struct xen_add_to_physmap *xatp,
>  
>      if ( is_iommu_enabled(d) )
>      {
> -       this_cpu(iommu_dont_flush_iotlb) = 1;
> -       extra.ppage = &pages[0];
> +        this_cpu(iommu_dont_flush_iotlb) = true;
> +        extra.ppage = &pages[0];
>      }

Is the respective part of the description ("no longer
pointlessly gated on is_iommu_enabled() returning true") stale?

> @@ -368,15 +360,12 @@ void iommu_dev_iotlb_flush_timeout(struct domain *d, struct pci_dev *pdev);
>  
>  /*
>   * The purpose of the iommu_dont_flush_iotlb optional cpu flag is to
> - * avoid unecessary iotlb_flush in the low level IOMMU code.
> - *
> - * iommu_map_page/iommu_unmap_page must flush the iotlb but somethimes
> - * this operation can be really expensive. This flag will be set by the
> - * caller to notify the low level IOMMU code to avoid the iotlb flushes.
> - * iommu_iotlb_flush/iommu_iotlb_flush_all will be explicitly called by
> - * the caller.
> + * avoid unnecessary IOMMU flushing while updating the P2M.
> + * Setting the value to true will cause iommu_iotlb_flush() to return without
> + * actually performing a flush. A batch flush must therefore be done by the
> + * calling code after setting the value back to false.

I guess this too was in need of updating with the v9 changes?

Jan

