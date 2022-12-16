Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 450CC64EB65
	for <lists+xen-devel@lfdr.de>; Fri, 16 Dec 2022 13:26:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.464673.723150 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p69n8-00085i-0P; Fri, 16 Dec 2022 12:26:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 464673.723150; Fri, 16 Dec 2022 12:26:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p69n7-00083J-Tv; Fri, 16 Dec 2022 12:26:17 +0000
Received: by outflank-mailman (input) for mailman id 464673;
 Fri, 16 Dec 2022 12:26:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p69n6-00083D-G8
 for xen-devel@lists.xenproject.org; Fri, 16 Dec 2022 12:26:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p69n5-0003I8-TJ; Fri, 16 Dec 2022 12:26:15 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.4.243]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p69n5-0006cq-My; Fri, 16 Dec 2022 12:26:15 +0000
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
	bh=PjRUqSugEdYNTgD7UWELGLhjZLwXszOTMXrZuiRvoQc=; b=j7SSG4KlAfH1csDUQZuSxwoCzW
	EheeQHkRkycf2jU8AcYdIXQg24ngaLUGsH0jB7MkJfF9mBuMs4lpKsXg0keQhpCHsD5hWJJEG+zLP
	1eTQFbMcLgetYuFYa5M5iJk5A5D72hZV9mMF44kenqqEoh5zpSR5kwdixjmwgWcd3h6I=;
Message-ID: <33a84c2a-0c94-a62d-3754-4a61aa951c83@xen.org>
Date: Fri, 16 Dec 2022 12:26:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH RFC 04/10] domain: update GADDR based runstate guest area
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <bcab8340-6bfd-8dfc-efe1-564e520b3a06@suse.com>
 <22422a1c-1cfa-95d0-c1fa-99150a8f2a32@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <22422a1c-1cfa-95d0-c1fa-99150a8f2a32@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 19/10/2022 08:41, Jan Beulich wrote:
> Before adding a new vCPU operation to register the runstate area by
> guest-physical address, add code to actually keep such areas up-to-date.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> RFC: Pages aren't marked dirty when written to (matching the handling of
>       space mapped by map_vcpu_info() afaict), on the basis that the
>       registrations are lost anyway across migration. 

So I agree for the existing migration. But I wonder whether we would 
need to dirty those pages if we live-migrated a guest without its help 
(IOW the registrations would still be present).

Anyway, nothing to worry about yet as this is not supported upstream.

> Plus the contents
>       of the areas in question have to be deemed volatile in the first
>       place (so saving a "most recent" value is pretty meaningless even
>       for e.g. snapshotting).
> 
> RFC: Can we perhaps avoid the VM-assist conditionals, assuming the more
>       modern behavior to apply uniformly for gaddr-based registrations?

It is not clear why someone would want to use the old behavior with the 
new gaddr-based registrations. So I would say yes.

> 
> RFC: HVM guests (on x86) can change bitness and hence layout (and size!
>       and alignment) of the runstate area. I don't think it is an option
>       to require 32-bit code to pass a range such that even the 64-bit
>       layout wouldn't cross a page boundary (and be suitably aligned). I
>       also don't see any other good solution, so for now a crude approach
>       with an extra boolean is used (using has_32bit_shinfo() isn't race
>       free and could hence lead to overrunning the mapped space).

I think the extra check for 32-bit code to pass the check for 64-bit 
layout would be better.

> 
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -1599,14 +1599,55 @@ bool update_runstate_area(struct vcpu *v
>       struct guest_memory_policy policy = { };
>       void __user *guest_handle = NULL;
>       struct vcpu_runstate_info runstate;
> +    struct vcpu_runstate_info *map = v->runstate_guest_area.map;
> +
> +    memcpy(&runstate, &v->runstate, sizeof(runstate));
> +
> +    if ( map )
> +    {
> +        uint64_t *pset = NULL;
> +#ifdef CONFIG_COMPAT
> +        struct compat_vcpu_runstate_info *cmap = NULL;
> +
> +        if ( v->runstate_guest_area_compat )
> +            cmap = (void *)map;
> +#endif
> +
> +        if ( VM_ASSIST(v->domain, runstate_update_flag) )
> +        {
> +#ifdef CONFIG_COMPAT
> +            if ( cmap )
> +                pset = &cmap->state_entry_time;
> +            else
> +#endif
> +                pset = &map->state_entry_time;
> +            runstate.state_entry_time |= XEN_RUNSTATE_UPDATE;
> +            write_atomic(pset, runstate.state_entry_time);
> +            smp_wmb();
> +        }
> +
> +#ifdef CONFIG_COMPAT
> +        if ( cmap )
> +            XLAT_vcpu_runstate_info(cmap, &runstate);
> +        else
> +#endif
> +            *map = runstate;
> +
> +        if ( pset )
> +        {
> +            smp_wmb();
> +            runstate.state_entry_time &= ~XEN_RUNSTATE_UPDATE;
> +            write_atomic(pset, runstate.state_entry_time);
> +        }
> +
> +        return true;
> +    }
>   
>       if ( guest_handle_is_null(runstate_guest(v)) )
>           return true;
>   
>       update_guest_memory_policy(v, &policy);
>   
> -    memcpy(&runstate, &v->runstate, sizeof(runstate));
> -
>       if ( VM_ASSIST(v->domain, runstate_update_flag) )
>       {
>   #ifdef CONFIG_COMPAT
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -231,6 +231,8 @@ struct vcpu
>   #ifdef CONFIG_COMPAT
>       /* A hypercall is using the compat ABI? */
>       bool             hcall_compat;
> +    /* Physical runstate area registered via compat ABI? */
> +    bool             runstate_guest_area_compat;
>   #endif
>   
>   #ifdef CONFIG_IOREQ_SERVER
> 

Cheers,

-- 
Julien Grall

