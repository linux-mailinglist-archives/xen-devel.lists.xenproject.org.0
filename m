Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E884A26464F
	for <lists+xen-devel@lfdr.de>; Thu, 10 Sep 2020 14:48:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGLzM-0002WO-Ip; Thu, 10 Sep 2020 12:47:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dCRG=CT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kGLzL-0002WJ-8J
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2020 12:47:43 +0000
X-Inumbo-ID: 6ea8def3-fa38-4751-871f-e99bbaab28bb
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6ea8def3-fa38-4751-871f-e99bbaab28bb;
 Thu, 10 Sep 2020 12:47:42 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BD8A9ACF2;
 Thu, 10 Sep 2020 12:47:56 +0000 (UTC)
Subject: Re: [PATCH v5 4/8] iommu: make map and unmap take a page count,
 similar to flush
To: Paul Durrant <paul@xen.org>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
References: <20200907074023.1392-1-paul@xen.org>
 <20200907074023.1392-5-paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <369c4c5d-b8e4-77b6-45aa-572d531d1699@suse.com>
Date: Thu, 10 Sep 2020 14:47:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200907074023.1392-5-paul@xen.org>
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 07.09.2020 09:40, Paul Durrant wrote:
> --- a/xen/arch/x86/mm.c
> +++ b/xen/arch/x86/mm.c
> @@ -2966,9 +2966,11 @@ static int _get_page_type(struct page_info *page, unsigned long type,
>              mfn_t mfn = page_to_mfn(page);
>  
>              if ( (x & PGT_type_mask) == PGT_writable_page )
> -                rc = iommu_legacy_unmap(d, _dfn(mfn_x(mfn)), PAGE_ORDER_4K);
> +                rc = iommu_legacy_unmap(d, _dfn(mfn_x(mfn)),
> +                                        1ul << PAGE_ORDER_4K);
>              else
> -                rc = iommu_legacy_map(d, _dfn(mfn_x(mfn)), mfn, PAGE_ORDER_4K,
> +                rc = iommu_legacy_map(d, _dfn(mfn_x(mfn)), mfn,
> +                                      1ul << PAGE_ORDER_4K,
>                                        IOMMUF_readable | IOMMUF_writable);
>  
>              if ( unlikely(rc) )

A few hundred lines up from here there is

            int rc2 = iommu_legacy_unmap(d, _dfn(mfn), PAGE_ORDER_4K);

in cleanup_page_mappings().

> --- a/xen/common/grant_table.c
> +++ b/xen/common/grant_table.c
> @@ -1225,7 +1225,7 @@ map_grant_ref(
>              kind = IOMMUF_readable;
>          else
>              kind = 0;
> -        if ( kind && iommu_legacy_map(ld, _dfn(mfn_x(mfn)), mfn, 0, kind) )
> +        if ( kind && iommu_legacy_map(ld, _dfn(mfn_x(mfn)), mfn, 1ul, kind) )
>          {
>              double_gt_unlock(lgt, rgt);
>              rc = GNTST_general_error;
> @@ -1479,9 +1479,9 @@ unmap_common(
>  
>          kind = mapkind(lgt, rd, op->mfn);
>          if ( !kind )
> -            err = iommu_legacy_unmap(ld, _dfn(mfn_x(op->mfn)), 0);
> +            err = iommu_legacy_unmap(ld, _dfn(mfn_x(op->mfn)), 1ul);
>          else if ( !(kind & MAPKIND_WRITE) )
> -            err = iommu_legacy_map(ld, _dfn(mfn_x(op->mfn)), op->mfn, 0,
> +            err = iommu_legacy_map(ld, _dfn(mfn_x(op->mfn)), op->mfn, 1ul,

For all three of these, I guess either 1ul << PAGE_ORDER_4K or simply 1?
(Given that the code didn't use PAGE_ORDER_4K so far, I'd slightly
prefer the latter. I'd be fine making the change while committing, but
it looks like v6 is going to be needed anyway.)

> --- a/xen/drivers/passthrough/amd/iommu_map.c
> +++ b/xen/drivers/passthrough/amd/iommu_map.c
> @@ -362,7 +362,7 @@ static unsigned long flush_count(unsigned long dfn, unsigned int page_count,
>  }
>  
>  int amd_iommu_flush_iotlb_pages(struct domain *d, dfn_t dfn,
> -                                unsigned int page_count,
> +                                unsigned long page_count,

This ought to be accompanied by a similar change to its flush_count()
helper.

> @@ -632,7 +632,7 @@ static int __must_check iommu_flush_iotlb(struct domain *d, dfn_t dfn,
>  
>  static int __must_check iommu_flush_iotlb_pages(struct domain *d,
>                                                  dfn_t dfn,
> -                                                unsigned int page_count,
> +                                                unsigned long page_count,
>                                                  unsigned int flush_flags)
>  {
>      ASSERT(page_count && !dfn_eq(dfn, INVALID_DFN));

This similarly ought to be accompanied by a change to its
iommu_flush_iotlb() helper.

Jan

