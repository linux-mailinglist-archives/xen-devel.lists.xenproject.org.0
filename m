Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E284C2138B0
	for <lists+xen-devel@lfdr.de>; Fri,  3 Jul 2020 12:36:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jrJ2w-00053V-Cn; Fri, 03 Jul 2020 10:35:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Kpvw=AO=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jrJ2u-00053P-70
 for xen-devel@lists.xenproject.org; Fri, 03 Jul 2020 10:35:52 +0000
X-Inumbo-ID: f7534dfa-bd18-11ea-bca7-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f7534dfa-bd18-11ea-bca7-bc764e2007e4;
 Fri, 03 Jul 2020 10:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jLYvpQIZR3neQsEKuEJQwRzz1OvwxeZioF5niqJcRX8=; b=KqJwXi3+saYywAbDfjGwv+uY9/
 VcVtHvqYFcONtKUcXqDwlMSfwQqYv8aUtlTEZAyLZXhP7qxfrGiu6oBZ/Pq6H+Izcpv9U+Rzr9/bY
 wDsX2+AzX0MCLGnAcZZa8KwkimouJ6uLfKon08ahCCC4xGzHVOLhEQNOcg/Rw6zkqQ5g=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jrJ2m-0004XD-MG; Fri, 03 Jul 2020 10:35:44 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jrJ2m-0005U7-Cd; Fri, 03 Jul 2020 10:35:44 +0000
Subject: Re: [PATCH v4 06/10] memory: batch processing in acquire_resource()
To: =?UTF-8?Q?Micha=c5=82_Leszczy=c5=84ski?= <michal.leszczynski@cert.pl>,
 xen-devel@lists.xenproject.org
References: <cover.1593519420.git.michal.leszczynski@cert.pl>
 <a317b169e3710a481bb4be066d9b878f27b3e66c.1593519420.git.michal.leszczynski@cert.pl>
From: Julien Grall <julien@xen.org>
Message-ID: <5be6cb58-82d0-0a78-a9b2-5c078b5d3587@xen.org>
Date: Fri, 3 Jul 2020 11:35:41 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a317b169e3710a481bb4be066d9b878f27b3e66c.1593519420.git.michal.leszczynski@cert.pl>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, tamas.lengyel@intel.com,
 Wei Liu <wl@xen.org>, "paul@xen.org" <paul@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 luwei.kang@intel.com
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

(+ Paul as the author XENMEM_acquire_resource)

Hi,

On 30/06/2020 13:33, Michał Leszczyński wrote:
> From: Michal Leszczynski <michal.leszczynski@cert.pl>
> 
> Allow to acquire large resources by allowing acquire_resource()
> to process items in batches, using hypercall continuation.
> 
> Signed-off-by: Michal Leszczynski <michal.leszczynski@cert.pl>
> ---
>   xen/common/memory.c | 32 +++++++++++++++++++++++++++++---
>   1 file changed, 29 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/common/memory.c b/xen/common/memory.c
> index 714077c1e5..3ab06581a2 100644
> --- a/xen/common/memory.c
> +++ b/xen/common/memory.c
> @@ -1046,10 +1046,12 @@ static int acquire_grant_table(struct domain *d, unsigned int id,
>   }
>   
>   static int acquire_resource(
> -    XEN_GUEST_HANDLE_PARAM(xen_mem_acquire_resource_t) arg)
> +    XEN_GUEST_HANDLE_PARAM(xen_mem_acquire_resource_t) arg,
> +    unsigned long *start_extent)
>   {
>       struct domain *d, *currd = current->domain;
>       xen_mem_acquire_resource_t xmar;
> +    uint32_t total_frames;
>       /*
>        * The mfn_list and gfn_list (below) arrays are ok on stack for the
>        * moment since they are small, but if they need to grow in future
> @@ -1077,8 +1079,17 @@ static int acquire_resource(
>           return 0;
>       }
>   
> +    total_frames = xmar.nr_frames;

On 32-bit, the start_extent would be 26-bits wide which is not enough to 
cover all the xmar.nr_frames. Therefore, you want that check that it is 
possible to encode a continuation. Something like:

/* Is the size too large for us to encode a continuation? */
if ( unlikely(xmar.nr_frames > (UINT_MAX >> MEMOP_EXTENT_SHIFT)) )

> +
> +    if ( *start_extent ) > +    {
> +        xmar.frame += *start_extent;
> +        xmar.nr_frames -= *start_extent;

As start_extent is exposed to the guest, you want to check if it is not 
bigger than xmar.nr_frames.

> +        guest_handle_add_offset(xmar.frame_list, *start_extent);
> +    }
> +
>       if ( xmar.nr_frames > ARRAY_SIZE(mfn_list) )
> -        return -E2BIG;
> +        xmar.nr_frames = ARRAY_SIZE(mfn_list);

The documentation of the hypercall suggests that if you pass NULL, then 
it will return the maximum number value for nr_frames supported by the 
implementation. So technically a domain cannot use more than 
ARRAY_SIZE(mfn_list).

However, you new addition conflict with the documentation. Can you 
clarify how a domain will know that it can use more than 
ARRAY_SIZE(mfn_list)?

>   
>       rc = rcu_lock_remote_domain_by_id(xmar.domid, &d);
>       if ( rc )
> @@ -1135,6 +1146,14 @@ static int acquire_resource(
>           }
>       }
>   
> +    if ( !rc )
> +    {
> +        *start_extent += xmar.nr_frames;
> +
> +        if ( *start_extent != total_frames )
> +            rc = -ERESTART;
> +    }
> +
>    out:
>       rcu_unlock_domain(d);
>   
> @@ -1600,7 +1619,14 @@ long do_memory_op(unsigned long cmd, XEN_GUEST_HANDLE_PARAM(void) arg)
>   
>       case XENMEM_acquire_resource:
>           rc = acquire_resource(
> -            guest_handle_cast(arg, xen_mem_acquire_resource_t));
> +            guest_handle_cast(arg, xen_mem_acquire_resource_t),
> +            &start_extent);

Hmmm... it looks like we forgot to check that start_extent is always 0 
when the hypercall was added.

As this is exposed to the guest, it technically means that there no 
guarantee that start_extent will always be 0.

However, in practice, this was likely the intention and should be the 
case. So it may just be enough to mention the potential breakage in the 
commit message.

@All: what do you think?

> +
> +        if ( rc == -ERESTART )
> +            return hypercall_create_continuation(
> +                __HYPERVISOR_memory_op, "lh",
> +                op | (start_extent << MEMOP_EXTENT_SHIFT), arg);
> +
>           break;
>   
>       default:
> 

Cheers,

-- 
Julien Grall

