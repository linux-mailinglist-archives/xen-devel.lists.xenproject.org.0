Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF142F635A
	for <lists+xen-devel@lfdr.de>; Thu, 14 Jan 2021 15:44:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.67055.119364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l03qG-0002sU-Kg; Thu, 14 Jan 2021 14:43:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 67055.119364; Thu, 14 Jan 2021 14:43:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l03qG-0002s8-Ha; Thu, 14 Jan 2021 14:43:16 +0000
Received: by outflank-mailman (input) for mailman id 67055;
 Thu, 14 Jan 2021 14:43:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l03qF-0002s3-LR
 for xen-devel@lists.xenproject.org; Thu, 14 Jan 2021 14:43:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l03qD-0005Vk-EF; Thu, 14 Jan 2021 14:43:13 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l03qD-00072R-6K; Thu, 14 Jan 2021 14:43:13 +0000
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
	bh=4NWpKd86qtQMvptosZXdgEwAsAKuS7Yft0n2p87Dj88=; b=Xh28Bq59zZhumII1VDDnkP76dg
	HASKXy9NZ0JbN4xzmmKzCq6SxU/OWnX4xXf/hjztuemRd4rdzPwvUwDLbKVTXRO1vRvSCViXXyPgr
	pnBHyB4dgPx/FXDDmgWDt6ho6Gz2201mRctSrlIfi+6mgoSWw4ICszdKxxnEm2/Dp6Qo=;
Subject: Re: [PATCH] common: don't require use of DOMID_SELF
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <72c9f0ec-81e3-63f9-2513-46e463642219@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <6b80d9bd-58a1-0854-2ff9-7153ddecae26@xen.org>
Date: Thu, 14 Jan 2021 14:43:11 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <72c9f0ec-81e3-63f9-2513-46e463642219@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 14/01/2021 14:02, Jan Beulich wrote:
> It's not overly difficult for a domain to figure out its ID, so
> requiring the use of DOMID_SELF in a very limited set of places isn't
> really helpful towards keeping the ID opaque to the guest.

So I agree that a domid can be figured out really easily today and in 
principle it would be fine to relax it.

However, most of the guest OSes will care about running on older Xen 
versions. Therefore they are not going to be able to use this relaxation.

So I am not entirely convinced the relaxation is actually worth it for 
existing hypercalls.

Anyway, if we decide to relax it, then I think we should update the 
public headers because an OS using this relaxation will not work on 
older Xen. A developper will not be able to know that without looking at 
the implementation.

Cheers,

> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> 
> --- a/xen/common/grant_table.c
> +++ b/xen/common/grant_table.c
> @@ -2776,15 +2776,19 @@ struct gnttab_copy_buf {
>   static int gnttab_copy_lock_domain(domid_t domid, bool is_gref,
>                                      struct gnttab_copy_buf *buf)
>   {
> -    /* Only DOMID_SELF may reference via frame. */
> -    if ( domid != DOMID_SELF && !is_gref )
> -        return GNTST_permission_denied;
> -
>       buf->domain = rcu_lock_domain_by_any_id(domid);
>   
>       if ( !buf->domain )
>           return GNTST_bad_domain;
>   
> +    /* Only the local domain may reference via frame. */
> +    if ( buf->domain != current->domain && !is_gref )
> +    {
> +        rcu_unlock_domain(buf->domain);
> +        buf->domain = NULL;
> +        return GNTST_permission_denied;
> +    }
> +
>       buf->ptr.domid = domid;
>   
>       return GNTST_okay;
> --- a/xen/common/page_alloc.c
> +++ b/xen/common/page_alloc.c
> @@ -2566,13 +2566,7 @@ __initcall(register_heap_trigger);
>   
>   struct domain *get_pg_owner(domid_t domid)
>   {
> -    struct domain *pg_owner = NULL, *curr = current->domain;
> -
> -    if ( unlikely(domid == curr->domain_id) )
> -    {
> -        gdprintk(XENLOG_WARNING, "Cannot specify itself as foreign domain\n");
> -        goto out;
> -    }
> +    struct domain *pg_owner;
>   
>       switch ( domid )
>       {
> @@ -2590,7 +2584,6 @@ struct domain *get_pg_owner(domid_t domi
>           break;
>       }
>   
> - out:
>       return pg_owner;
>   }
>   
> 

-- 
Julien Grall

