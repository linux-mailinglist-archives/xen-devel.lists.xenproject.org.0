Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FCB23D8FD
	for <lists+xen-devel@lfdr.de>; Thu,  6 Aug 2020 11:57:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3ce9-0005c9-U5; Thu, 06 Aug 2020 09:57:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gxiU=BQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k3ce7-0005c4-SN
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2020 09:57:11 +0000
X-Inumbo-ID: 82258e23-b800-4150-b2ed-01af3552afdf
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 82258e23-b800-4150-b2ed-01af3552afdf;
 Thu, 06 Aug 2020 09:57:11 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7632EAC12;
 Thu,  6 Aug 2020 09:57:27 +0000 (UTC)
Subject: Re: [PATCH v4 07/14] iommu: make map, unmap and flush all take both
 an order and a count
To: Paul Durrant <paul@xen.org>
References: <20200804134209.8717-1-paul@xen.org>
 <20200804134209.8717-8-paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2765087f-4168-191d-c547-cbc2e74d3fee@suse.com>
Date: Thu, 6 Aug 2020 11:57:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200804134209.8717-8-paul@xen.org>
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
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 04.08.2020 15:42, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> At the moment iommu_map() and iommu_unmap() take a page order but not a
> count, whereas iommu_iotlb_flush() takes a count but not a page order.
> This patch simply makes them consistent with each other.

Why can't we do with just a count, where order gets worked out by
functions knowing how to / wanting to deal with higher order pages?

> --- a/xen/arch/x86/mm/p2m-ept.c
> +++ b/xen/arch/x86/mm/p2m-ept.c
> @@ -843,7 +843,7 @@ out:
>           need_modify_vtd_table )
>      {
>          if ( iommu_use_hap_pt(d) )
> -            rc = iommu_iotlb_flush(d, _dfn(gfn), (1u << order),
> +            rc = iommu_iotlb_flush(d, _dfn(gfn), (1u << order), 1,

Forgot to drop the "1 << "? (There are then I think two more instances
further down.)

> --- a/xen/common/memory.c
> +++ b/xen/common/memory.c
> @@ -851,12 +851,12 @@ int xenmem_add_to_physmap(struct domain *d, struct xen_add_to_physmap *xatp,
>  
>          this_cpu(iommu_dont_flush_iotlb) = 0;
>  
> -        ret = iommu_iotlb_flush(d, _dfn(xatp->idx - done), done,
> +        ret = iommu_iotlb_flush(d, _dfn(xatp->idx - done), 0, done,

Arguments wrong way round? (This risk of inverting their order is
one of the primary reasons why I think we want just a count.) I'm
also uncertain about the use of 0 vs PAGE_ORDER_4K here.

>                                  IOMMU_FLUSHF_added | IOMMU_FLUSHF_modified);
>          if ( unlikely(ret) && rc >= 0 )
>              rc = ret;
>  
> -        ret = iommu_iotlb_flush(d, _dfn(xatp->gpfn - done), done,
> +        ret = iommu_iotlb_flush(d, _dfn(xatp->gpfn - done), 0, done,

Same here then.

Jan

