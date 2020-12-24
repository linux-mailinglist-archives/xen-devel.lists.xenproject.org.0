Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B86202E25C8
	for <lists+xen-devel@lfdr.de>; Thu, 24 Dec 2020 10:58:20 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.58660.103321 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ksNMr-00007S-2X; Thu, 24 Dec 2020 09:57:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 58660.103321; Thu, 24 Dec 2020 09:57:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ksNMq-000071-VW; Thu, 24 Dec 2020 09:57:08 +0000
Received: by outflank-mailman (input) for mailman id 58660;
 Thu, 24 Dec 2020 09:57:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ksNMp-00006v-Qq
 for xen-devel@lists.xenproject.org; Thu, 24 Dec 2020 09:57:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ksNMn-0002jL-IN; Thu, 24 Dec 2020 09:57:05 +0000
Received: from gw1.octic.net ([81.187.162.82] helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ksNMn-0003W4-A2; Thu, 24 Dec 2020 09:57:05 +0000
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
	bh=2SpNjW3sD0Axl+ITSM5G9zkjGRjVX81oW9IkwDFCpoc=; b=d4SwOX2XbwKRZvisBE7inROc3v
	L/iteJwqpsDLchvmJo5lM0amLEfqHJxghdsUz76X4WZVmZZTWX5CUW8qho38GrDr3j7orNlPMWcmd
	peJArrB7hxaxRzJrC/UsZUHODDoS2mYRfEgs70hGHQDGh3nc/09OfrHUfR5k1kWZjpAc=;
Subject: Re: [PATCH v2] gnttab: defer allocation of status frame tracking
 array
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <57dc915c-c373-5003-80f7-279dd300d571@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <bab2f11f-dd59-87fb-1311-2732a71543d0@xen.org>
Date: Thu, 24 Dec 2020 09:57:02 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <57dc915c-c373-5003-80f7-279dd300d571@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 23/12/2020 15:13, Jan Beulich wrote:
> This array can be large when many grant frames are permitted; avoid
> allocating it when it's not going to be used anyway, by doing this only
> in gnttab_populate_status_frames().
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> v2: Defer allocation to when a domain actually switches to the v2 grant
>      API.
> 
> --- a/xen/common/grant_table.c
> +++ b/xen/common/grant_table.c
> @@ -1725,6 +1728,17 @@ gnttab_populate_status_frames(struct dom
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
> @@ -1745,18 +1759,23 @@ status_alloc_failed:
>           free_xenheap_page(gt->status[i]);
>           gt->status[i] = NULL;
>       }
> +    if ( !nr_status_frames(gt) )
> +    {
> +        xfree(gt->status);
> +        gt->status = ZERO_BLOCK_PTR;
> +    }
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
> @@ -1811,12 +1830,12 @@ gnttab_unpopulate_status_frames(struct d
>           page_set_owner(pg, NULL);
>       }
>   
> -    for ( i = 0; i < nr_status_frames(gt); i++ )
> -    {
> -        free_xenheap_page(gt->status[i]);
> -        gt->status[i] = NULL;
> -    }
>       gt->nr_status_frames = 0;
> +    smp_wmb(); /* Just in case - all accesses should be under lock. */

I think gt->status cannot be accessed locklessly. If a entity read 
gt->nr_status_frames != 0, then there is no promise the array will be 
accessible when trying to access it as it may have been freed.

So I would drop the barrier here.

The rest of the code looks good to me.

Cheers,

-- 
Julien Grall

