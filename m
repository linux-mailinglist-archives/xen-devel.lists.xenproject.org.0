Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42367511456
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 11:40:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.314657.532823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nje92-0005Pf-8G; Wed, 27 Apr 2022 09:39:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 314657.532823; Wed, 27 Apr 2022 09:39:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nje92-0005NS-5E; Wed, 27 Apr 2022 09:39:36 +0000
Received: by outflank-mailman (input) for mailman id 314657;
 Wed, 27 Apr 2022 09:39:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nje90-0005NM-FW
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 09:39:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nje90-000288-0O; Wed, 27 Apr 2022 09:39:34 +0000
Received: from [54.239.6.186] (helo=[192.168.24.58])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nje8z-0000QF-QH; Wed, 27 Apr 2022 09:39:33 +0000
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
	bh=I+28T+DDvm4eITMDqJNGSBnDw1r1vdwO2PyWoGHOrjw=; b=2JyXxoBxbbVlvjiX0674G5Y7/U
	ixywtufH+Vz3FSgMcvV1eNr3OJpHZx85ALLxwsVxhsehre2Yt6hneJsizlb5sTb1vQGoXwU+miPPu
	3f1MlrYl1JNwT1edw22JDERUOSXetI0b8yCtaYhAWcYfHTS+fnN9u04vBTdyoUBTJsac=;
Message-ID: <6d7a3a35-4244-6c10-024e-9e7ada318d48@xen.org>
Date: Wed, 27 Apr 2022 10:39:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.8.0
Subject: Re: [PATCH v3 2/6] xen: do not merge reserved pages in
 free_heap_pages()
To: Penny Zheng <Penny.Zheng@arm.com>, xen-devel@lists.xenproject.org
Cc: wei.chen@arm.com, henry.wang@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20220427092743.925563-1-Penny.Zheng@arm.com>
 <20220427092743.925563-3-Penny.Zheng@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220427092743.925563-3-Penny.Zheng@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 27/04/2022 10:27, Penny Zheng wrote:
> There is a slim chance that free_heap_pages() may decide to merge a chunk
> from the static region(PGC_reserved) with the about-to-be-free chunk.
This sentence tells me that the merge can happen but it doesn't tell me 
the cases. I think the second part is more important to know.

The code in free_heap_Pages() will try to merge with the 
successor/predecessor if they are suitably aligned. So the issue can 
only happen if the pages reserved are right next to the pages given to 
the heap allocator.

> 
> So in order to avoid the above scenario, this commit updates free_heap_pages()
> to check whether the predecessor and/or successor has PGC_reserved set,
> when trying to merge the about-to-be-freed chunk with the predecessor
> and/or successor.
> 
> Signed-off-by: Penny Zheng <penny.zheng@arm.com>
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
> index be501582a3..1f3ad4bd28 100644
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -1483,6 +1483,7 @@ static void free_heap_pages(
>               /* Merge with predecessor block? */
>               if ( !mfn_valid(page_to_mfn(predecessor)) ||
>                    !page_state_is(predecessor, free) ||
> +                 (predecessor->count_info & PGC_reserved) ||
>                    (PFN_ORDER(predecessor) != order) ||
>                    (phys_to_nid(page_to_maddr(predecessor)) != node) )
>                   break;
> @@ -1506,6 +1507,7 @@ static void free_heap_pages(
>               /* Merge with successor block? */
>               if ( !mfn_valid(page_to_mfn(successor)) ||
>                    !page_state_is(successor, free) ||
> +                 (successor->count_info & PGC_reserved) ||
>                    (PFN_ORDER(successor) != order) ||
>                    (phys_to_nid(page_to_maddr(successor)) != node) )
>                   break;

Cheers,

-- 
Julien Grall

