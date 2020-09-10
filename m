Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E71C2646BF
	for <lists+xen-devel@lfdr.de>; Thu, 10 Sep 2020 15:19:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kGMTZ-0005ES-8g; Thu, 10 Sep 2020 13:18:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=dCRG=CT=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kGMTX-0005EK-Bp
 for xen-devel@lists.xenproject.org; Thu, 10 Sep 2020 13:18:55 +0000
X-Inumbo-ID: 2cfef551-7a9d-493f-aa7f-1f062e50be87
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2cfef551-7a9d-493f-aa7f-1f062e50be87;
 Thu, 10 Sep 2020 13:18:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4E4E7B163;
 Thu, 10 Sep 2020 13:19:09 +0000 (UTC)
Subject: Re: [PATCH v5 5/8] remove remaining uses of iommu_legacy_map/unmap
To: Paul Durrant <paul@xen.org>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Kevin Tian <kevin.tian@intel.com>
References: <20200907074023.1392-1-paul@xen.org>
 <20200907074023.1392-6-paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6f114986-a47e-6c0d-6c6e-ac547e157e59@suse.com>
Date: Thu, 10 Sep 2020 15:18:55 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200907074023.1392-6-paul@xen.org>
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
> NOTE: The code in memory_add() now sets 'ret' if iommu_map() or
>       iommu_iotlb_flush() fails. This seems to be have been missed before,
>       meaning the error path could actually return 0.

I agree this is the better way, but I'm not sure it really was
unintended: It could well have been considered a "best effort"
approach to get IOMMU mappings in place, back at the time.

> Signed-off-by: Paul Durrant <pdurrant@amazon.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with one nit and one further remark:

> --- a/xen/arch/x86/x86_64/mm.c
> +++ b/xen/arch/x86/x86_64/mm.c
> @@ -1478,21 +1478,15 @@ int memory_add(unsigned long spfn, unsigned long epfn, unsigned int pxm)
>           !iommu_use_hap_pt(hardware_domain) &&
>           !need_iommu_pt_sync(hardware_domain) )
>      {
> -        for ( i = spfn; i < epfn; i++ )
> -            if ( iommu_legacy_map(hardware_domain, _dfn(i), _mfn(i),
> -                                  1ul << PAGE_ORDER_4K,
> -                                  IOMMUF_readable | IOMMUF_writable) )
> -                break;
> -        if ( i != epfn )
> -        {
> -            while (i-- > old_max)
> -                /* If statement to satisfy __must_check. */
> -                if ( iommu_legacy_unmap(hardware_domain, _dfn(i),
> -                                        1ul << PAGE_ORDER_4K) )
> -                    continue;
> +        unsigned int flush_flags = 0;
> +        unsigned long n = epfn - spfn;
>  
> +        ret = iommu_map(hardware_domain, _dfn(i), _mfn(i), n,
> +                       IOMMUF_readable | IOMMUF_writable, &flush_flags);

There's one blank too little here.

> @@ -367,7 +344,7 @@ int iommu_iotlb_flush(struct domain *d, dfn_t dfn, unsigned long page_count,
>      int rc;
>  
>      if ( !is_iommu_enabled(d) || !hd->platform_ops->iotlb_flush ||
> -         !page_count || !flush_flags )
> +         !page_count || !flush_flags || this_cpu(iommu_dont_flush_iotlb) )
>          return 0;

I'm still somewhat uneasy about this change, because there could in
theory be fallout. I don't think there is in practice, so I'm willing
to let it be this way. Long term we wan want to introduce a flag
into flush_flags to allow overriding this behavior.

Jan

