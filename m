Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B692E23DA0D
	for <lists+xen-devel@lfdr.de>; Thu,  6 Aug 2020 13:41:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3eGp-0007Mz-Np; Thu, 06 Aug 2020 11:41:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gxiU=BQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k3eGo-0007Mu-9X
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2020 11:41:14 +0000
X-Inumbo-ID: ae7ea68d-7cb1-4847-a5a7-ea9201b2b85e
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ae7ea68d-7cb1-4847-a5a7-ea9201b2b85e;
 Thu, 06 Aug 2020 11:41:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F076DAC3F;
 Thu,  6 Aug 2020 11:41:29 +0000 (UTC)
Subject: Re: [PATCH v4 06/14] iommu: flush I/O TLB if iommu_map() or
 iommu_unmap() fail
To: Paul Durrant <paul@xen.org>
References: <20200804134209.8717-1-paul@xen.org>
 <20200804134209.8717-7-paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <13baa3ec-b038-32a5-a99a-3fb122b984a8@suse.com>
Date: Thu, 6 Aug 2020 13:41:14 +0200
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
> --- a/xen/drivers/passthrough/iommu.c
> +++ b/xen/drivers/passthrough/iommu.c
> @@ -274,6 +274,10 @@ int iommu_map(struct domain *d, dfn_t dfn, mfn_t mfn,
>          break;
>      }
>  
> +    /* Something went wrong so flush everything and clear flush flags */
> +    if ( unlikely(rc) && iommu_iotlb_flush_all(d, *flush_flags) )
> +        flush_flags = 0;

Noticed only while looking at patch 9: There's also an indirection
missing both here and ...

> @@ -330,6 +328,10 @@ int iommu_unmap(struct domain *d, dfn_t dfn, unsigned int page_order,
>          }
>      }
>  
> +    /* Something went wrong so flush everything and clear flush flags */
> +    if ( unlikely(rc) && iommu_iotlb_flush_all(d, *flush_flags) )
> +        flush_flags = 0;

... here.

Jan

