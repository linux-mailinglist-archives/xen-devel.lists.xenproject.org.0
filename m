Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A4236EB34
	for <lists+xen-devel@lfdr.de>; Thu, 29 Apr 2021 15:16:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119997.226888 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc6W9-0001QI-OL; Thu, 29 Apr 2021 13:15:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119997.226888; Thu, 29 Apr 2021 13:15:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc6W9-0001Pr-Jw; Thu, 29 Apr 2021 13:15:45 +0000
Received: by outflank-mailman (input) for mailman id 119997;
 Thu, 29 Apr 2021 13:15:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lc6W8-0001Pm-AY
 for xen-devel@lists.xenproject.org; Thu, 29 Apr 2021 13:15:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lc6W6-0004qM-9y; Thu, 29 Apr 2021 13:15:42 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lc6W6-0000kC-0v; Thu, 29 Apr 2021 13:15:42 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=e0Q1Ff80FfEIWIQMfznCRyf4yKWW+MH4snAWf1VboQQ=; b=RmuL+ku1QfzoVKyxo1Liyj8zCy
	1laW4g69Wj5cl/a9w7yLt97PNqq1bToulwJJlBqIULhxe8R+UhDFqwM0dErAwlHoKje6gShCjiy3b
	i75O5eKI1V1DOusNqPl6xGp5fyskHAiA71TpKV7nA1tVEtdm24vBkI0ZOdlF3FqcBM34=;
Subject: Re: [PATCH v3] gnttab: defer allocation of status frame tracking
 array
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <d2397cd4-040e-3cc0-22d8-3f65d01f9326@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <581f843f-25de-bf8a-e8b9-7a407158bd4f@xen.org>
Date: Thu, 29 Apr 2021 14:15:39 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <d2397cd4-040e-3cc0-22d8-3f65d01f9326@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 15/04/2021 10:41, Jan Beulich wrote:
> This array can be large when many grant frames are permitted; avoid
> allocating it when it's not going to be used anyway, by doing this only
> in gnttab_populate_status_frames().

Given the controversy of the change, I would suggest to summarize why 
this approach is considered to be ok in the commit message.

> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v3: Drop smp_wmb(). Re-base.
> v2: Defer allocation to when a domain actually switches to the v2 grant
>      API.
> 
> --- a/xen/common/grant_table.c
> +++ b/xen/common/grant_table.c
> @@ -1747,6 +1747,17 @@ gnttab_populate_status_frames(struct dom
>       /* Make sure, prior version checks are architectural visible */
>       block_speculation();
>   
> +    if ( gt->status == ZERO_BLOCK_PTR )
> +    {
> +        gt->status = xzalloc_array(grant_status_t *,
> +                                   grant_to_status_frames(gt->max_grant_frames));
> +        if ( !gt->status )
> +        {
> +            gt->status = ZERO_BLOCK_PTR;
> +            return -ENOMEM;
> +        }
> +    }
> +
>       for ( i = nr_status_frames(gt); i < req_status_frames; i++ )
>       {
>           if ( (gt->status[i] = alloc_xenheap_page()) == NULL )
> @@ -1767,18 +1778,23 @@ status_alloc_failed:
>           free_xenheap_page(gt->status[i]);
>           gt->status[i] = NULL;
>       }

NIT: can you add a newline here and...

> +    if ( !nr_status_frames(gt) )
> +    {
> +        xfree(gt->status);
> +        gt->status = ZERO_BLOCK_PTR;
> +    }

... here for readability.

>       return -ENOMEM;
>   }
>   
>   static int
>   gnttab_unpopulate_status_frames(struct domain *d, struct grant_table *gt)
>   {
> -    unsigned int i;
> +    unsigned int i, n = nr_status_frames(gt);
>   
>       /* Make sure, prior version checks are architectural visible */
>       block_speculation();
>   
> -    for ( i = 0; i < nr_status_frames(gt); i++ )
> +    for ( i = 0; i < n; i++ )
>       {
>           struct page_info *pg = virt_to_page(gt->status[i]);
>           gfn_t gfn = gnttab_get_frame_gfn(gt, true, i);
> @@ -1833,12 +1849,11 @@ gnttab_unpopulate_status_frames(struct d
>           page_set_owner(pg, NULL);
>       }
>   
> -    for ( i = 0; i < nr_status_frames(gt); i++ )
> -    {
> -        free_xenheap_page(gt->status[i]);
> -        gt->status[i] = NULL;
> -    }
>       gt->nr_status_frames = 0;
> +    for ( i = 0; i < n; i++ )
> +        free_xenheap_page(gt->status[i]);
> +    xfree(gt->status);
> +    gt->status = ZERO_BLOCK_PTR;
The new position of the for loop seems unrelated to the purpose of the 
patch. May I ask why this was done?

>   
>       return 0;
>   }
> @@ -1969,11 +1984,11 @@ int grant_table_init(struct domain *d, i
>       if ( gt->shared_raw == NULL )
>           goto out;
>   
> -    /* Status pages for grant table - for version 2 */
> -    gt->status = xzalloc_array(grant_status_t *,
> -                               grant_to_status_frames(gt->max_grant_frames));
> -    if ( gt->status == NULL )
> -        goto out;
> +    /*
> +     * Status page tracking array for v2 gets allocated on demand. But don't
> +     * leave a NULL pointer there.
> +     */
> +    gt->status = ZERO_BLOCK_PTR;
>   
>       grant_write_lock(gt);
>   
> @@ -4047,11 +4062,12 @@ int gnttab_acquire_resource(
>           if ( gt->gt_version != 2 )
>               break;
>   
> +        rc = gnttab_get_status_frame_mfn(d, final_frame, &tmp);

NIT: It wasn't obvious to me why gnttab_get_status_frame_mfn() is moved 
before gt->status. May I suggest to add a in-code comment abouve the 
ordering?

> +
>           /* Check that void ** is a suitable representation for gt->status. */
>           BUILD_BUG_ON(!__builtin_types_compatible_p(
>                            typeof(gt->status), grant_status_t **));
>           vaddrs = (void **)gt->status;
> -        rc = gnttab_get_status_frame_mfn(d, final_frame, &tmp);
>           break;
>       }
>   
> 

Cheers,

-- 
Julien Grall

