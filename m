Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A22B23D941
	for <lists+xen-devel@lfdr.de>; Thu,  6 Aug 2020 12:29:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3d8j-0008SI-Vh; Thu, 06 Aug 2020 10:28:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gxiU=BQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k3d8i-0008SD-8v
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2020 10:28:48 +0000
X-Inumbo-ID: e8bdfaed-1eba-4c1b-93ba-e1b172916a3e
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e8bdfaed-1eba-4c1b-93ba-e1b172916a3e;
 Thu, 06 Aug 2020 10:28:46 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E67DDACB0;
 Thu,  6 Aug 2020 10:29:02 +0000 (UTC)
Subject: Re: [PATCH v4 08/14] remove remaining uses of iommu_legacy_map/unmap
To: Paul Durrant <paul@xen.org>
References: <20200804134209.8717-1-paul@xen.org>
 <20200804134209.8717-9-paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <9d5a59cd-9e4e-2299-bc1c-af3c00a8719f@suse.com>
Date: Thu, 6 Aug 2020 12:28:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200804134209.8717-9-paul@xen.org>
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 04.08.2020 15:42, Paul Durrant wrote:
> The 'legacy' functions do implicit flushing so amend the callers to do the
> appropriate flushing.
> 
> Unfortunately, because of the structure of the P2M code, we cannot remove
> the per-CPU 'iommu_dont_flush_iotlb' global and the optimization it
> facilitates. It is now checked directly iommu_iotlb_flush(). Also, it is
> now declared as bool (rather than bool_t) and setting/clearing it are no
> longer pointlessly gated on is_iommu_enabled() returning true. (Arguably
> it is also pointless to gate the call to iommu_iotlb_flush() on that
> condition - since it is a no-op in that case - but the if clause allows
> the scope of a stack variable to be restricted).
> 
> NOTE: The code in memory_add() now fails if the number of pages passed to
>       a single call overflows an unsigned int. I don't believe this will
>       ever happen in practice.

I.e. you don't think adding 16Tb of memory in one go is possible?
I wouldn't bet on that ...

> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -2446,10 +2446,16 @@ static int cleanup_page_mappings(struct page_info *page)
>  
>          if ( d && unlikely(need_iommu_pt_sync(d)) && is_pv_domain(d) )
>          {
> -            int rc2 = iommu_legacy_unmap(d, _dfn(mfn), PAGE_ORDER_4K);
> +            unsigned int flush_flags = 0;
> +            int err;
>  
> +            err = iommu_unmap(d, _dfn(mfn), PAGE_ORDER_4K, 1, &flush_flags);
>              if ( !rc )
> -                rc = rc2;
> +                rc = err;
> +
> +            err = iommu_iotlb_flush(d, _dfn(mfn), PAGE_ORDER_4K, 1, flush_flags);
> +            if ( !rc )
> +                rc = err;
>          }

Wasn't the earlier change to add flushing in the error case to
allow to simplify code like this to

        if ( d && unlikely(need_iommu_pt_sync(d)) && is_pv_domain(d) )
        {
            unsigned int flush_flags = 0;
            int err;

            err = iommu_unmap(d, _dfn(mfn), PAGE_ORDER_4K, 1, &flush_flags);
            if ( !err )
                err = iommu_iotlb_flush(d, _dfn(mfn), PAGE_ORDER_4K, 1, flush_flags);
            if ( !rc )
                rc = err;
        }

?

> @@ -1441,9 +1446,16 @@ int clear_identity_p2m_entry(struct domain *d, unsigned long gfn_l)
>  
>      if ( !paging_mode_translate(d) )
>      {
> -        if ( !is_iommu_enabled(d) )
> -            return 0;
> -        return iommu_legacy_unmap(d, _dfn(gfn_l), PAGE_ORDER_4K);
> +        unsigned int flush_flags = 0;
> +        int err;
> +
> +        ret = iommu_unmap(d, _dfn(gfn_l), PAGE_ORDER_4K, 1, &flush_flags);
> +
> +        err = iommu_iotlb_flush(d, _dfn(gfn_l), PAGE_ORDER_4K, 1, flush_flags);
> +        if ( !ret )
> +            ret = err;
> +
> +        return ret;
>      }

Similarly here then.

> --- a/xen/arch/x86/x86_64/mm.c
> +++ b/xen/arch/x86/x86_64/mm.c
> @@ -1413,21 +1413,22 @@ int memory_add(unsigned long spfn, unsigned long epfn, unsigned int pxm)
>           !iommu_use_hap_pt(hardware_domain) &&
>           !need_iommu_pt_sync(hardware_domain) )
>      {
> -        for ( i = spfn; i < epfn; i++ )
> -            if ( iommu_legacy_map(hardware_domain, _dfn(i), _mfn(i),
> -                                  PAGE_ORDER_4K,
> -                                  IOMMUF_readable | IOMMUF_writable) )
> -                break;
> -        if ( i != epfn )
> -        {
> -            while (i-- > old_max)
> -                /* If statement to satisfy __must_check. */
> -                if ( iommu_legacy_unmap(hardware_domain, _dfn(i),
> -                                        PAGE_ORDER_4K) )
> -                    continue;
> +        unsigned int flush_flags = 0;
> +        unsigned int n = epfn - spfn;
> +        int rc;
>  
> +        ret = -EOVERFLOW;
> +        if ( spfn + n != epfn )
> +            goto destroy_m2p;
> +
> +        rc = iommu_map(hardware_domain, _dfn(i), _mfn(i),
> +                       PAGE_ORDER_4K, n, IOMMUF_readable | IOMMUF_writable,
> +                       &flush_flags);
> +        if ( !rc )
> +            rc = iommu_iotlb_flush(hardware_domain, _dfn(i), PAGE_ORDER_4K, n,
> +                                       flush_flags);
> +        if ( rc )
>              goto destroy_m2p;
> -        }
>      }

Did you mean to use "ret" here instead of introducing "rc"?

> --- a/xen/common/grant_table.c
> +++ b/xen/common/grant_table.c
> @@ -1225,11 +1225,23 @@ map_grant_ref(
>              kind = IOMMUF_readable;
>          else
>              kind = 0;
> -        if ( kind && iommu_legacy_map(ld, _dfn(mfn_x(mfn)), mfn, 0, kind) )
> +        if ( kind )
>          {
> -            double_gt_unlock(lgt, rgt);
> -            rc = GNTST_general_error;
> -            goto undo_out;
> +            dfn_t dfn = _dfn(mfn_x(mfn));
> +            unsigned int flush_flags = 0;
> +            int err;
> +
> +            err = iommu_map(ld, dfn, mfn, 0, 1, kind, &flush_flags);
> +            if ( !err )
> +                err = iommu_iotlb_flush(ld, dfn, 0, 1, flush_flags);

Question of 0 vs PAGE_ORDER_4K again.

> @@ -1473,21 +1485,25 @@ unmap_common(
>      if ( rc == GNTST_okay && gnttab_need_iommu_mapping(ld) )
>      {
>          unsigned int kind;
> +        dfn_t dfn = _dfn(mfn_x(op->mfn));
> +        unsigned int flush_flags = 0;
>          int err = 0;
>  
>          double_gt_lock(lgt, rgt);
>  
>          kind = mapkind(lgt, rd, op->mfn);
>          if ( !kind )
> -            err = iommu_legacy_unmap(ld, _dfn(mfn_x(op->mfn)), 0);
> +            err = iommu_unmap(ld, dfn, 0, 1, &flush_flags);
>          else if ( !(kind & MAPKIND_WRITE) )
> -            err = iommu_legacy_map(ld, _dfn(mfn_x(op->mfn)), op->mfn, 0,
> -                                   IOMMUF_readable);
> -
> -        double_gt_unlock(lgt, rgt);
> +            err = iommu_map(ld, dfn, op->mfn, 0, 1, IOMMUF_readable,
> +                            &flush_flags);
>  
> +        if ( !err )
> +            err = iommu_iotlb_flush(ld, dfn, 0, 1, flush_flags);
>          if ( err )
>              rc = GNTST_general_error;
> +
> +        double_gt_unlock(lgt, rgt);
>      }

While moving the unlock ahead of the flush would be somewhat troublesome
in the map case, it seems straightforward here. Even if this gets further
adjusted by a later patch, it should imo be done here - the later patch
may also go in much later.

> --- a/xen/common/memory.c
> +++ b/xen/common/memory.c
> @@ -824,8 +824,7 @@ int xenmem_add_to_physmap(struct domain *d, struct xen_add_to_physmap *xatp,
>      xatp->gpfn += start;
>      xatp->size -= start;
>  
> -    if ( is_iommu_enabled(d) )
> -       this_cpu(iommu_dont_flush_iotlb) = 1;
> +    this_cpu(iommu_dont_flush_iotlb) = true;

Just like you replace the original instance here, ...

> @@ -845,6 +844,8 @@ int xenmem_add_to_physmap(struct domain *d, struct xen_add_to_physmap *xatp,
>          }
>      }
>  
> +    this_cpu(iommu_dont_flush_iotlb) = false;
> +
>      if ( is_iommu_enabled(d) )
>      {
>          int ret;

... I'm sure you meant to also remove the original instance from
down below here.

> @@ -364,7 +341,7 @@ int iommu_iotlb_flush(struct domain *d, dfn_t dfn, unsigned int page_order,
>      int rc;
>  
>      if ( !is_iommu_enabled(d) || !hd->platform_ops->iotlb_flush ||
> -         !page_count || !flush_flags )
> +         !page_count || !flush_flags || this_cpu(iommu_dont_flush_iotlb) )
>          return 0;

The patch description ought to assure the safety of this change: So
far, despite the flag set callers of iommu_iotlb_flush() (which
may be unaware of the flag's state) did get what they did ask for.
The change relies on there not being any such uses.

> @@ -370,15 +362,12 @@ void iommu_dev_iotlb_flush_timeout(struct domain *d, struct pci_dev *pdev);
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
> + * avoid unecessary IOMMU flushing while updating the P2M.

Correct the spelling of "unnecessary" at the same time?

Jan

