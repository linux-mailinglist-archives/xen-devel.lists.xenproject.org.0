Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F08F64FAE0
	for <lists+xen-devel@lfdr.de>; Sat, 17 Dec 2022 16:53:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.465314.723969 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6ZUw-000205-5k; Sat, 17 Dec 2022 15:53:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 465314.723969; Sat, 17 Dec 2022 15:53:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p6ZUw-0001yE-35; Sat, 17 Dec 2022 15:53:14 +0000
Received: by outflank-mailman (input) for mailman id 465314;
 Sat, 17 Dec 2022 15:53:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p6ZUu-0001y6-Iy
 for xen-devel@lists.xenproject.org; Sat, 17 Dec 2022 15:53:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p6ZUt-0000eC-MK; Sat, 17 Dec 2022 15:53:11 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.102])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p6ZUt-0001xz-Fq; Sat, 17 Dec 2022 15:53:11 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:
	From:References:Cc:To:MIME-Version:Date:Message-ID;
	bh=TIOHSW/sI/bOW3uJfurFdY8Z5d7tAJ7IirRUjKcZ/Lg=; b=jS4yawNUFYqswHlDq6S7+GTFHF
	mqJ09sYjCvM5KMUiasKxZtlpZt+pjQthZSa5/rJWlmcVkNq9URAXgu/fc+ATt+XxLejtpgP1CFGS0
	8NZzOdrrWzgeT0MxVAc39qtra0l6/vXhv7005Jt77CO07FhkEbibPDJu0c5h1lNNlCTI=;
Message-ID: <92e35f8b-72d9-e55f-9218-3f21742c14c6@xen.org>
Date: Sat, 17 Dec 2022 15:53:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
To: Jan Beulich <jbeulich@suse.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Tamas K Lengyel <tamas@tklengyel.com>
References: <bcab8340-6bfd-8dfc-efe1-564e520b3a06@suse.com>
 <f1745e62-8a46-e9af-6a79-592a5402a5f4@suse.com>
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH RFC 10/10] common: convert vCPU info area registration
In-Reply-To: <f1745e62-8a46-e9af-6a79-592a5402a5f4@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 19/10/2022 08:45, Jan Beulich wrote:
> Switch to using map_guest_area(). Noteworthy differences from
> map_vcpu_info():
> - remote vCPU-s are paused rather than checked for being down (which in
>    principle can change right after the check),
> - the domain lock is taken for a much smaller region,
> - areas could now be registered more than once, if we want this,
> - as a corner case registering the area at GFN 0 offset 0 is no longer
>    possible (this is considered an invalid de-registration request).
> 
> Note that this eliminates a bug in copy_vcpu_settings(): The function
> did allocate a new page regardless of the GFN already having a mapping,
> thus in particular breaking the case of two vCPU-s having their info
> areas on the same page.
> 
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---
> RFC: While the "no re-registration" check is retained, it is now racy.
>       If we really think it needs retaining _and_ properly enforcing,
>       then locking will be needed, but I don't think we can hold the
>       domain lock around a call to map_guest_area(), first and foremost
>       because of its use of vcpu_pause().

function like evtchn_2l_unmask() may access vcpu_info that is not the 
current one.

So I believe the check needs to be reatined and properly enforced. 
Otherwise, the old structure may still be used for a short time even if 
it has been freed.

> 
> RFC: Is the GFN 0 offset 0 behavioral change deemed acceptable?

I would say n  (See the previous discussion for more details).

> 
> RFC: To have just a single instance of casts to vcpu_info_t *,
>       introducing a macro (or inline function if header dependencies
>       permit) might be nice. However, the only sensible identifier for it
>       would imo be vcpu_info(). Yet we already have a macro of that name.
>       With some trickery it might be possible to overload the macro
>       (making the "field" argument optional), but this may not be
>       desirable for other reasons (it could e.g. be deemed confusing).

You might be able to reduce the number of cast by using local variables.

But it is not entirely clear why we can't use the existing vcpu_info() 
in many of the cases. For instance...


> 
> --- a/xen/arch/x86/include/asm/shared.h
> +++ b/xen/arch/x86/include/asm/shared.h
> @@ -27,16 +27,16 @@ static inline void arch_set_##field(stru
>   static inline type arch_get_##field(const struct vcpu *v)       \
>   {                                                               \
>       return !has_32bit_shinfo(v->domain) ?                       \
> -           v->vcpu_info->native.arch.field :                    \
> -           v->vcpu_info->compat.arch.field;                     \
> +           ((const vcpu_info_t *)v->vcpu_info_area.map)->native.arch.field : \
> +           ((const vcpu_info_t *)v->vcpu_info_area.map)->compat.arch.field;  \

... here.

>   }                                                               \
>   static inline void arch_set_##field(struct vcpu *v,             \
>                                       type val)                   \
>   {                                                               \
>       if ( !has_32bit_shinfo(v->domain) )                         \
> -        v->vcpu_info->native.arch.field = val;                  \
> +        ((vcpu_info_t *)v->vcpu_info_area.map)->native.arch.field = val; \
>       else                                                        \
> -        v->vcpu_info->compat.arch.field = val;                  \
> +        ((vcpu_info_t *)v->vcpu_info_area.map)->compat.arch.field = val; \

Cheers,

-- 
Julien Grall

