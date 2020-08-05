Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 062D323CBEE
	for <lists+xen-devel@lfdr.de>; Wed,  5 Aug 2020 18:07:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3Lvg-0004yD-K5; Wed, 05 Aug 2020 16:06:12 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=7mHh=BP=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k3Lvf-0004y8-6Y
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2020 16:06:11 +0000
X-Inumbo-ID: 115bf38e-e4c0-489d-b230-e2431965cf35
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 115bf38e-e4c0-489d-b230-e2431965cf35;
 Wed, 05 Aug 2020 16:06:09 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 83F07B73F;
 Wed,  5 Aug 2020 16:06:25 +0000 (UTC)
Subject: Re: [PATCH v4 06/14] iommu: flush I/O TLB if iommu_map() or
 iommu_unmap() fail
To: Paul Durrant <paul@xen.org>
References: <20200804134209.8717-1-paul@xen.org>
 <20200804134209.8717-7-paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <82d73571-3e05-65b5-2731-d8cdee651995@suse.com>
Date: Wed, 5 Aug 2020 18:06:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200804134209.8717-7-paul@xen.org>
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
Cc: xen-devel@lists.xenproject.org, Paul Durrant <pdurrant@amazon.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 04.08.2020 15:42, Paul Durrant wrote:
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

I appreciate the intent of tidier code, but I wonder whether this
flushing doesn't go a little too far: There's a need to flush in
general when multiple pages were to be (un)mapped, and there was
at least partial success. Hence e.g. in the order == 0 case I
don't see why any flushing would be needed. Granted errors aren't
commonly expected, but anyway.

> --- a/xen/drivers/passthrough/iommu.c
> +++ b/xen/drivers/passthrough/iommu.c
> @@ -274,6 +274,10 @@ int iommu_map(struct domain *d, dfn_t dfn, mfn_t mfn,
>          break;
>      }
>  
> +    /* Something went wrong so flush everything and clear flush flags */
> +    if ( unlikely(rc) && iommu_iotlb_flush_all(d, *flush_flags) )

Both here and in the unmap path, did you get the return value
of iommu_iotlb_flush_all() the wrong way round (i.e. isn't there
a missing ! )?

Jan

