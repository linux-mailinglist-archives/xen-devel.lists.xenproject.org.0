Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C91262F03
	for <lists+xen-devel@lfdr.de>; Wed,  9 Sep 2020 15:17:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kFzxn-0004WS-RC; Wed, 09 Sep 2020 13:16:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Y3mV=CS=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kFzxm-0004WM-MW
 for xen-devel@lists.xenproject.org; Wed, 09 Sep 2020 13:16:38 +0000
X-Inumbo-ID: 034619a4-a27b-4966-9f7b-1c6c3e942b12
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 034619a4-a27b-4966-9f7b-1c6c3e942b12;
 Wed, 09 Sep 2020 13:16:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 7A628B257;
 Wed,  9 Sep 2020 13:16:51 +0000 (UTC)
Subject: Re: [PATCH v5 3/8] iommu: flush I/O TLB if iommu_map() or
 iommu_unmap() fail
To: Paul Durrant <paul@xen.org>
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>
References: <20200907074023.1392-1-paul@xen.org>
 <20200907074023.1392-4-paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <a0ea98cb-0d76-0f20-278b-7a68058277a2@suse.com>
Date: Wed, 9 Sep 2020 15:16:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200907074023.1392-4-paul@xen.org>
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
> From: Paul Durrant <pdurrant@amazon.com>
> 
> This patch adds a full I/O TLB flush to the error paths of iommu_map() and
> iommu_unmap().
> 
> Without this change callers need constructs such as:
> 
> rc = iommu_map/unmap(...)
> err = iommu_flush(...)
> if ( !rc )
>   rc = err;
> 
> With this change, it can be simplified to:
> 
> rc = iommu_map/unmap(...)
> if ( !rc )
>   rc = iommu_flush(...)
> 
> because, if the map or unmap fails the flush will be unnecessary. This saves
> a stack variable and generally makes the call sites tidier.
> 
> Signed-off-by: Paul Durrant <pdurrant@amazon.com>

Reviewed-by: Jan Beulich <jbeulich@suse.com>
with one cosmetic issue taken care of (perhaps while committing):

> @@ -338,14 +346,8 @@ int iommu_legacy_unmap(struct domain *d, dfn_t dfn, unsigned int page_order)
>      unsigned int flush_flags = 0;
>      int rc = iommu_unmap(d, dfn, page_order, &flush_flags);
>  
> -    if ( !this_cpu(iommu_dont_flush_iotlb) )
> -    {
> -        int err = iommu_iotlb_flush(d, dfn, (1u << page_order),
> -                                    flush_flags);
> -
> -        if ( !rc )
> -            rc = err;
> -    }
> +    if ( !this_cpu(iommu_dont_flush_iotlb) && ! rc )

There's a stray blank after the latter ! here.

Jan

