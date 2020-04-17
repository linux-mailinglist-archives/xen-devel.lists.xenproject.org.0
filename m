Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC0B1ADAA8
	for <lists+xen-devel@lfdr.de>; Fri, 17 Apr 2020 12:02:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jPNpE-0001rs-Bx; Fri, 17 Apr 2020 10:02:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=x8HM=6B=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jPNpC-0001rn-BK
 for xen-devel@lists.xenproject.org; Fri, 17 Apr 2020 10:02:18 +0000
X-Inumbo-ID: 84ed83e2-8092-11ea-83d8-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 84ed83e2-8092-11ea-83d8-bc764e2007e4;
 Fri, 17 Apr 2020 10:02:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CFB98ADBB;
 Fri, 17 Apr 2020 10:02:15 +0000 (UTC)
Subject: Re: [PATCH 04/12] xen: split alloc_heap_pages in two halves for
 reusability
To: Stefano Stabellini <sstabellini@kernel.org>
References: <alpine.DEB.2.21.2004141746350.8746@sstabellini-ThinkPad-T480s>
 <20200415010255.10081-4-sstabellini@kernel.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <348994e9-7b32-33fc-0e40-f7e1a6543b92@suse.com>
Date: Fri, 17 Apr 2020 12:02:13 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200415010255.10081-4-sstabellini@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: julien@xen.org, Wei Liu <wl@xen.org>, andrew.cooper3@citrix.com,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, xen-devel@lists.xenproject.org,
 Stefano Stabellini <stefano.stabellini@xilinx.com>, Volodymyr_Babchuk@epam.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 15.04.2020 03:02, Stefano Stabellini wrote:
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -911,54 +911,18 @@ static struct page_info *get_free_buddy(unsigned int zone_lo,
>      }
>  }
>  
> -/* Allocate 2^@order contiguous pages. */
> -static struct page_info *alloc_heap_pages(
> -    unsigned int zone_lo, unsigned int zone_hi,
> -    unsigned int order, unsigned int memflags,
> -    struct domain *d)
> +static void __alloc_heap_pages(struct page_info **pgo,
> +                               unsigned int order,
> +                               unsigned int memflags,
> +                               struct domain *d)

Along the line of Wei's reply, I'd suggest the name to better reflect
the difference to alloc_heap_pages() itself. Maybe
alloc_pages_from_buddy() or alloc_buddy_pages()?

In addition
- no double leading underscores please
- instead of the function returning void and taking
  struct page_info **pgo, why not have it take and return
  struct page_info *?
- add a comment about the non-standard locking behavior

Jan

