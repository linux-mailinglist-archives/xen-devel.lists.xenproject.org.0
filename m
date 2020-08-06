Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF76723DA1C
	for <lists+xen-devel@lfdr.de>; Thu,  6 Aug 2020 13:49:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3eOV-0007he-TS; Thu, 06 Aug 2020 11:49:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gxiU=BQ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1k3eOU-0007gT-Sy
 for xen-devel@lists.xenproject.org; Thu, 06 Aug 2020 11:49:10 +0000
X-Inumbo-ID: 9dacde75-e8e7-4001-86d1-28b9cd188ad8
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9dacde75-e8e7-4001-86d1-28b9cd188ad8;
 Thu, 06 Aug 2020 11:49:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8E2BCAE18;
 Thu,  6 Aug 2020 11:49:26 +0000 (UTC)
Subject: Re: [PATCH v4 09/14] common/grant_table: batch flush I/O TLB
To: Paul Durrant <paul@xen.org>
References: <20200804134209.8717-1-paul@xen.org>
 <20200804134209.8717-10-paul@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <4f533589-4df9-59d3-d238-cb46d292e16d@suse.com>
Date: Thu, 6 Aug 2020 13:49:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200804134209.8717-10-paul@xen.org>
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Paul Durrant <pdurrant@amazon.com>, Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 04.08.2020 15:42, Paul Durrant wrote:
> From: Paul Durrant <pdurrant@amazon.com>
> 
> This patch avoids calling iommu_iotlb_flush() for each individual GNTTABOP and
> insteads calls iommu_iotlb_flush_all() at the end of the hypercall. This
> should mean batched map/unmap operations perform better but may be slightly
> detrimental to singleton performance.

I would strongly suggest keeping singleton operations do single-DFN flushes.

> @@ -1329,20 +1326,30 @@ gnttab_map_grant_ref(
>              return i;

This one line is part of a path which you can't bypass as far as flushing
is concerned. In this regard the description is also slightly misleading:
It's not just "at the end of the hypercall" when flushing needs doing,
but also on every preemption.

>          if ( unlikely(__copy_from_guest_offset(&op, uop, i, 1)) )
> -            return -EFAULT;
> +        {
> +            rc = -EFAULT;
> +            break;
> +        }
>  
> -        map_grant_ref(&op);
> +        map_grant_ref(&op, &flush_flags);
>  
>          if ( unlikely(__copy_to_guest_offset(uop, i, &op, 1)) )
> -            return -EFAULT;
> +        {
> +            rc = -EFAULT;
> +            break;
> +        }
>      }
>  
> -    return 0;
> +    err = iommu_iotlb_flush_all(current->domain, flush_flags);
> +    if ( !rc )
> +        rc = err;

Not sure how important it is to retain performance upon errors: Strictly
speaking there's no need to flush when i == 0 and rc != 0.

Jan

