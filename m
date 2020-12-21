Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3BB2DFFF7
	for <lists+xen-devel@lfdr.de>; Mon, 21 Dec 2020 19:37:56 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.57527.100705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krQ3N-0002r2-5T; Mon, 21 Dec 2020 18:37:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 57527.100705; Mon, 21 Dec 2020 18:37:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1krQ3N-0002qK-2F; Mon, 21 Dec 2020 18:37:05 +0000
Received: by outflank-mailman (input) for mailman id 57527;
 Mon, 21 Dec 2020 18:37:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1krQ3L-0002qF-LS
 for xen-devel@lists.xenproject.org; Mon, 21 Dec 2020 18:37:03 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1krQ3J-0003H5-Pr; Mon, 21 Dec 2020 18:37:01 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1krQ3J-000478-Cv; Mon, 21 Dec 2020 18:37:01 +0000
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
	bh=5vLLbcgmGgg3oUH+sxO0KIURyPatcCvjjXrEjyyojz8=; b=FS6IhAKXwwh7V48mwkgYofh/DM
	AVVLLOuzLiUUPmQpqG8xgoPUHrm6HWfpA8uXTi3B9vVUaQwiHZCNYxeWPVVCgtPEzNe/cuC/LZ233
	tQb0h6aKNmLlF45V/2HI+jJJF+D6zmo1LuGoZooILfimOvE+fyOK6UEbAODgJakUMHqo=;
Subject: Re: [PATCH 2/3] xen/domain: Introduce domain_teardown()
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?=
 <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20201221181446.7791-1-andrew.cooper3@citrix.com>
 <20201221181446.7791-3-andrew.cooper3@citrix.com>
From: Julien Grall <julien@xen.org>
Message-ID: <f42f6b6e-3ee3-f58e-513b-70f80f7541ee@xen.org>
Date: Mon, 21 Dec 2020 18:36:59 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201221181446.7791-3-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Andrew,

On 21/12/2020 18:14, Andrew Cooper wrote:
> There is no common equivelent of domain_reliquish_resources(), which has

s/equivelent/equivalent/

> caused various pieces of common cleanup to live in inappropriate
> places.
> 
> Perhaps most obviously, evtchn_destroy() is called for every continuation of
> domain_reliquish_resources(), which can easily be thousands of times.

s/reliquish/relinquish/

> 
> Create domain_teardown() to be a new top level facility, and call it from the
> appropriate positions in domain_kill() and domain_create()'s error path.
> 
> No change in behaviour yet.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> ---
>   xen/common/domain.c     | 59 +++++++++++++++++++++++++++++++++++++++++++++++++
>   xen/include/xen/sched.h |  8 +++++++
>   2 files changed, 67 insertions(+)
> 
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index ce3667f1b4..ef1987335b 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -273,6 +273,59 @@ static int __init parse_extra_guest_irqs(const char *s)
>   custom_param("extra_guest_irqs", parse_extra_guest_irqs);
>   
>   /*
> + * Release resources held by a domain.  There may or may not be live
> + * references to the domain, and it may or may not be fully constructed.
> + *
> + * d->is_dying differing between DOMDYING_dying and DOMDYING_dead can be used
> + * to determine if live references to the domain exist, and also whether
> + * continuations are permitted.
> + *
> + * If d->is_dying is DOMDYING_dead, this must not return non-zero.
> + */
> +static int domain_teardown(struct domain *d)
> +{
> +    BUG_ON(!d->is_dying);
> +
> +    /*
> +     * This hypercall can take minutes of wallclock time to complete.  This
> +     * logic implements a co-routine, stashing state in struct domain across
> +     * hypercall continuation boundaries.
> +     */
> +    switch ( d->teardown.val )
> +    {
> +        /*
> +         * Record the current progress.  Subsequent hypercall continuations
> +         * will logically restart work from this point.
> +         *
> +         * PROGRESS() markers must not be in the middle of loops.  The loop
> +         * variable isn't preserved across a continuation.
> +         *
> +         * To avoid redundant work, there should be a marker before each
> +         * function which may return -ERESTART.
> +         */
> +#define PROGRESS(x)                             \
> +        d->teardown.val = PROG_ ## x;           \
> +        /* Fallthrough */                       \
> +    case PROG_ ## x
> +
> +        enum {
> +            PROG_done = 1,
> +        };
> +
> +    case 0:
> +    PROGRESS(done):
> +        break;
> +
> +#undef PROGRESS
> +
> +    default:
> +        BUG();
> +    }
> +
> +    return 0;
> +}
> +
> +/*
>    * Destroy a domain once all references to it have been dropped.  Used either
>    * from the RCU path, or from the domain_create() error path before the domain
>    * is inserted into the domlist.
> @@ -553,6 +606,9 @@ struct domain *domain_create(domid_t domid,
>       if ( init_status & INIT_watchdog )
>           watchdog_domain_destroy(d);
>   
> +    /* Must not hit a continuation in this context. */
> +    ASSERT(domain_teardown(d) == 0);
The ASSERT() will become a NOP in production build, so 
domain_teardown_down() will not be called.

However, I think it would be better if we pass an extra argument to 
indicated wheter the code is allowed to preempt. This would make the 
preemption check more obvious in evtchn_destroy() compare to the current 
d->is_dying != DOMDYING_dead.

> +
>       _domain_destroy(d);
>   
>       return ERR_PTR(err);
> @@ -733,6 +789,9 @@ int domain_kill(struct domain *d)
>           domain_set_outstanding_pages(d, 0);
>           /* fallthrough */
>       case DOMDYING_dying:
> +        rc = domain_teardown(d);
> +        if ( rc )
> +            break;
>           rc = evtchn_destroy(d);
>           if ( rc )
>               break;
> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> index faf5fda36f..3f35c537b8 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -525,6 +525,14 @@ struct domain
>       /* Argo interdomain communication support */
>       struct argo_domain *argo;
>   #endif
> +
> +    /*
> +     * Continuation information for domain_teardown().  All fields entirely
> +     * private.
> +     */
> +    struct {
> +        unsigned int val;
> +    } teardown;
>   };
>   
>   static inline struct page_list_head *page_to_list(
> 

Cheers,

-- 
Julien Grall

