Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B30644AFB0
	for <lists+xen-devel@lfdr.de>; Tue,  9 Nov 2021 15:43:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.223967.386963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkSL1-0005MI-Gq; Tue, 09 Nov 2021 14:43:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 223967.386963; Tue, 09 Nov 2021 14:43:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mkSL1-0005Jj-Dp; Tue, 09 Nov 2021 14:43:03 +0000
Received: by outflank-mailman (input) for mailman id 223967;
 Tue, 09 Nov 2021 14:43:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mkSL0-0005Jd-0N
 for xen-devel@lists.xenproject.org; Tue, 09 Nov 2021 14:43:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mkSKz-0000lh-1f; Tue, 09 Nov 2021 14:43:01 +0000
Received: from 54-240-197-238.amazon.com ([54.240.197.238]
 helo=[192.168.22.169]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mkSKy-0004LH-R6; Tue, 09 Nov 2021 14:43:00 +0000
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
	bh=6FZmRv9aAgNBy9HKxGjvY98NJK91UZI6MMdHdzpmLek=; b=nRGSXsPs7NIam2dkhbTgQMMQhJ
	yZzW6Xzzm6B/ycB2xTqlj5LmdHJuqQzHyFJdmNm0oEIkFv1FT6ZZrMqm2KYFYLmKF2K0O3rWN5gGj
	ixgEjTHTCSUpjQEhU+oVXNqQy6N9l27d3gq4E+NLNynP4Ov6UbXXl1hMcOoEmfE7YwU4=;
Message-ID: <a708312d-ab1b-4784-b1fe-01dbb680e7e9@xen.org>
Date: Tue, 9 Nov 2021 14:42:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.0
Subject: Re: [PATCH for-4.16] Revert "domctl: improve locking during domain
 destruction"
To: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Hongyan Xia <hongyxia@amazon.com>, Dmitry Isaikin
 <isaikin-dmitry@yandex.ru>, Ian Jackson <iwj@xenproject.org>
References: <20211109143128.56089-1-roger.pau@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20211109143128.56089-1-roger.pau@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Roger,

On 09/11/2021 14:31, Roger Pau Monne wrote:
> This reverts commit 228ab9992ffb1d8f9d2475f2581e68b2913acb88.
> 
> Performance analysis has shown that dropping the domctl lock during
> domain destruction greatly increases the contention in the heap_lock,
> thus making parallel destruction of domains slower.
> 
> The following lockperf data shows the difference between the current
> code and the reverted one:
> 
> lock:  3342357(2.268295505s), block:  3263853(18.556650797s)
> lock:  2788704(0.362311723s), block:   222681( 0.091152276s)

Thanks for the numbers, this is already an improvement from the reverted.

Can you also please provide some details on the setup that was used to 
get the number? (e.g. how many guests, amount of memory...).

For instance, in the case of Amazon our setup was:

On a 144-core server with 4TiB of memory, destroying 32 guests (each
with 4 vcpus and 122GiB memory) simultaneously takes:

before the revert: 29 minutes
after the revert: 6 minutes

> 
> Given the current point in the release, revert the commit and
> reinstate holding the domctl lock during domain destruction. Further
> work should be done in order to re-add more fine grained locking to
> the domain destruction path once a proper solution to avoid the
> heap_lock contention is found.
> 
> Reported-by: Hongyan Xia <hongyxia@amazon.com>
> Reported-by: Dmitry Isaikin <isaikin-dmitry@yandex.ru>
> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> ---
> Cc: Ian Jackson <iwj@xenproject.org>
> 
> Since this is a revert and not new code I think the risk is lower.
> There's however some risk, as the original commit was from 2017, and
> hence the surrounding code has changed a bit. It's also a possibility
> that some other parts of the domain destruction code now rely on this
> more fine grained locking. Local tests however haven't shown issues.
> ---
>   xen/common/domain.c | 12 ++----------
>   xen/common/domctl.c |  5 +----
>   2 files changed, 3 insertions(+), 14 deletions(-)
> 
> diff --git a/xen/common/domain.c b/xen/common/domain.c
> index 56d47dd664..093bb4403f 100644
> --- a/xen/common/domain.c
> +++ b/xen/common/domain.c
> @@ -917,21 +917,13 @@ int domain_kill(struct domain *d)
>       if ( d == current->domain )
>           return -EINVAL;
>   
> -    /* Protected by d->domain_lock. */
> +    /* Protected by domctl_lock. */
>       switch ( d->is_dying )
>       {
>       case DOMDYING_alive:
> -        domain_unlock(d);
>           domain_pause(d);
> -        domain_lock(d);
> -        /*
> -         * With the domain lock dropped, d->is_dying may have changed. Call
> -         * ourselves recursively if so, which is safe as then we won't come
> -         * back here.
> -         */
> -        if ( d->is_dying != DOMDYING_alive )
> -            return domain_kill(d);
>           d->is_dying = DOMDYING_dying;
> +        spin_barrier(&d->domain_lock);
>           argo_destroy(d);
>           vnuma_destroy(d->vnuma);
>           domain_set_outstanding_pages(d, 0);
> diff --git a/xen/common/domctl.c b/xen/common/domctl.c
> index 271862ae58..879a2adcbe 100644
> --- a/xen/common/domctl.c
> +++ b/xen/common/domctl.c
> @@ -497,14 +497,11 @@ long do_domctl(XEN_GUEST_HANDLE_PARAM(xen_domctl_t) u_domctl)
>           break;
>   
>       case XEN_DOMCTL_destroydomain:
> -        domctl_lock_release();
> -        domain_lock(d);
>           ret = domain_kill(d);
> -        domain_unlock(d);
>           if ( ret == -ERESTART )
>               ret = hypercall_create_continuation(
>                   __HYPERVISOR_domctl, "h", u_domctl);
> -        goto domctl_out_unlock_domonly;
> +        break;
>   
>       case XEN_DOMCTL_setnodeaffinity:
>       {
> 

-- 
Julien Grall

