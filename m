Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C77F958AF35
	for <lists+xen-devel@lfdr.de>; Fri,  5 Aug 2022 19:53:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.381468.616171 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oK1VN-0002hj-Fi; Fri, 05 Aug 2022 17:53:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 381468.616171; Fri, 05 Aug 2022 17:53:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oK1VN-0002eu-CQ; Fri, 05 Aug 2022 17:53:01 +0000
Received: by outflank-mailman (input) for mailman id 381468;
 Fri, 05 Aug 2022 17:53:00 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oK1VM-0002eo-F0
 for xen-devel@lists.xenproject.org; Fri, 05 Aug 2022 17:53:00 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oK1VL-0006Sb-O0; Fri, 05 Aug 2022 17:52:59 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=[192.168.9.179]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oK1VL-0003UZ-Hr; Fri, 05 Aug 2022 17:52:59 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=HMYmHR92dY9g2PU3X0I7pTq+GPaKT03metYmkpUkEN4=; b=o1rUXxZDYyWsNHhTdtYfOT/8wa
	WVDZukrpPBJeS0b7UlNJZQHDE88bpxLlgN4TKjBphQulQPJlJGZF6wk5oO9Jl1HZnlZ6zHsiDzHVv
	Ia1IeO+ntYVynjTnzeGtC/+7c8auwlrlmvBd3otaB05uD0eRHXn2txByd68GRxl+9ZZs=;
Message-ID: <6b81f1fe-f548-15de-eeb4-e635ef3f7955@xen.org>
Date: Fri, 5 Aug 2022 18:52:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.1.0
Subject: Re: [PATCH v9 3/8] xen: do not merge reserved pages in
 free_heap_pages()
Content-Language: en-US
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Julien Grall <jgrall@amazon.com>
References: <20220720054611.2695787-1-Penny.Zheng@arm.com>
 <20220720054611.2695787-4-Penny.Zheng@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220720054611.2695787-4-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Penny,

Sorry I only spotted a couple of typos in the commit message now.

On 20/07/2022 06:46, Penny Zheng wrote:
> The code in free_heap_pages() will try to merge pages with the
> successor/predecessor if pages are suitably aligned. So if the pages
> reserved are right next to the pages given to the heap allocator,
> free_heap_pages() will merge them, and give the reserved pages to heap
> allocator accidently as a result.

s/accidently/accidentally/ I think.

> 
> So in order to avoid the above scenario, this commit updates free_heap_pages()
> to check whether the predecessor and/or successor has PGC_reserved set,

s/PGC_reserved/PGC_staticmem/

I think both #1 and #3 can go in now. So I would be happy to handle the 
typoes on commit.

> when trying to merge the about-to-be-freed chunk with the predecessor
> and/or successor.
> 
> Suggested-by: Julien Grall <jgrall@amazon.com>
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> Reviewed-by: Julien Grall <jgrall@amazon.com>
> ---
> v9 changes:
> - no change
> ---
> v8 changes:
> - no change
> ---
> v7 changes:
> - no change
> ---
> v6 changes:
> - adapt to PGC_static
> ---
> v5 changes:
> - change PGC_reserved to adapt to PGC_staticmem
> ---
> v4 changes:
> - no changes
> ---
> v3 changes:
> - no changes
> ---
> v2 changes:
> - new commit
> ---
>   xen/common/page_alloc.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
> index a12622e921..45bd88a685 100644
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -1475,6 +1475,7 @@ static void free_heap_pages(
>               /* Merge with predecessor block? */
>               if ( !mfn_valid(page_to_mfn(predecessor)) ||
>                    !page_state_is(predecessor, free) ||
> +                 (predecessor->count_info & PGC_static) ||
>                    (PFN_ORDER(predecessor) != order) ||
>                    (phys_to_nid(page_to_maddr(predecessor)) != node) )
>                   break;
> @@ -1498,6 +1499,7 @@ static void free_heap_pages(
>               /* Merge with successor block? */
>               if ( !mfn_valid(page_to_mfn(successor)) ||
>                    !page_state_is(successor, free) ||
> +                 (successor->count_info & PGC_static) ||
>                    (PFN_ORDER(successor) != order) ||
>                    (phys_to_nid(page_to_maddr(successor)) != node) )
>                   break;

Cheers,

-- 
Julien Grall

