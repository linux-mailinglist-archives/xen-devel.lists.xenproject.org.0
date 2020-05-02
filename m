Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0951C24C4
	for <lists+xen-devel@lfdr.de>; Sat,  2 May 2020 13:37:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jUqRz-00044n-At; Sat, 02 May 2020 11:36:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L6si=6Q=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jUqRy-00044i-8N
 for xen-devel@lists.xenproject.org; Sat, 02 May 2020 11:36:54 +0000
X-Inumbo-ID: 386ca5ce-8c69-11ea-b07b-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 386ca5ce-8c69-11ea-b07b-bc764e2007e4;
 Sat, 02 May 2020 11:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tO3PIjh7OdxzIES4DppdeP43LpKddLtfk2rLdmA9WAA=; b=FIz6a9rWZqqCqIHA9+AK8IsICR
 u2KuueaNrH4r36kWE+NG/o4fwq5EZL3SPCWlRSKGAQQmGt1Q5qdmY8LdiXhjji7b4lTRCjBiAegnA
 qlQNsKat8Iuv1DpOplqMm2Otb9C7f7I7coXXSTQ0YOUIqOuj6qfMY00p+0pO5OKFhplU=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jUqRu-0003jN-SW; Sat, 02 May 2020 11:36:50 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jUqRu-0007nr-Kz; Sat, 02 May 2020 11:36:50 +0000
Subject: Re: [PATCH v1.1 2/3] xen/sched: fix theoretical races accessing
 vcpu->dirty_cpu
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
References: <20200430152848.20275-1-jgross@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <987abb9e-e4f1-1981-595d-0474e91d67f8@xen.org>
Date: Sat, 2 May 2020 12:36:47 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200430152848.20275-1-jgross@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Juergen,

They are less theoritical than we would want. :/ There was a great 
series of article on lwn [1] about compiler optimization last year.

There is at least a few TOCTOU in the code where you could end up with 
cpumask_of(VCPU_CPU_CLEAN).

On 30/04/2020 16:28, Juergen Gross wrote:
> The dirty_cpu field of struct vcpu denotes which cpu still holds data
> of a vcpu. All accesses to this field should be atomic in case the
> vcpu could just be running, as it is accessed without any lock held
> in most cases.

Looking at the patch below, I am not sure why the issue is happening 
only when running. For instance, in the case of context_switch(), 'next' 
should not be running.

Instead, I think, the race would happen if the vCPU state is 
synchronized (__sync_local_execstate()) at the same time as time 
context_switch(). Am I correct?

> 
> There are some instances where accesses are not atomically done, and
> even worse where multiple accesses are done when a single one would
> be mandated.
> 
> Correct that in order to avoid potential problems.
> 
> Add some assertions to verify dirty_cpu is handled properly.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
>   xen/arch/x86/domain.c   | 14 ++++++++++----
>   xen/include/xen/sched.h |  2 +-
>   2 files changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
> index a4428190d5..f0579a56d1 100644
> --- a/xen/arch/x86/domain.c
> +++ b/xen/arch/x86/domain.c
> @@ -1769,6 +1769,7 @@ static void __context_switch(void)
>   
>       if ( !is_idle_domain(pd) )
>       {
> +        ASSERT(read_atomic(&p->dirty_cpu) == cpu);
>           memcpy(&p->arch.user_regs, stack_regs, CTXT_SWITCH_STACK_BYTES);
>           vcpu_save_fpu(p);
>           pd->arch.ctxt_switch->from(p);
> @@ -1832,7 +1833,7 @@ void context_switch(struct vcpu *prev, struct vcpu *next)
>   {
>       unsigned int cpu = smp_processor_id();
>       const struct domain *prevd = prev->domain, *nextd = next->domain;
> -    unsigned int dirty_cpu = next->dirty_cpu;
> +    unsigned int dirty_cpu = read_atomic(&next->dirty_cpu);
>   
>       ASSERT(prev != next);
>       ASSERT(local_irq_is_enabled());
> @@ -1844,6 +1845,7 @@ void context_switch(struct vcpu *prev, struct vcpu *next)
>       {
>           /* Remote CPU calls __sync_local_execstate() from flush IPI handler. */
>           flush_mask(cpumask_of(dirty_cpu), FLUSH_VCPU_STATE);
> +        ASSERT(read_atomic(&next->dirty_cpu) == VCPU_CPU_CLEAN);
>       }
>   
>       _update_runstate_area(prev);
> @@ -1956,13 +1958,17 @@ void sync_local_execstate(void)
>   
>   void sync_vcpu_execstate(struct vcpu *v)
>   {
> -    if ( v->dirty_cpu == smp_processor_id() )
> +    unsigned int dirty_cpu = read_atomic(&v->dirty_cpu);
> +
> +    if ( dirty_cpu == smp_processor_id() )
>           sync_local_execstate();
> -    else if ( vcpu_cpu_dirty(v) )
> +    else if ( is_vcpu_dirty_cpu(dirty_cpu) )
>       {
>           /* Remote CPU calls __sync_local_execstate() from flush IPI handler. */
> -        flush_mask(cpumask_of(v->dirty_cpu), FLUSH_VCPU_STATE);
> +        flush_mask(cpumask_of(dirty_cpu), FLUSH_VCPU_STATE);
>       }
> +    ASSERT(read_atomic(&v->dirty_cpu) != dirty_cpu ||
> +           dirty_cpu == VCPU_CPU_CLEAN); >   }
>   
>   static int relinquish_memory(
> diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> index 195e7ee583..81628e2d98 100644
> --- a/xen/include/xen/sched.h
> +++ b/xen/include/xen/sched.h
> @@ -844,7 +844,7 @@ static inline bool is_vcpu_dirty_cpu(unsigned int cpu)
>   
>   static inline bool vcpu_cpu_dirty(const struct vcpu *v)
>   {
> -    return is_vcpu_dirty_cpu(v->dirty_cpu);
> +    return is_vcpu_dirty_cpu(read_atomic((unsigned int *)&v->dirty_cpu));

Is the cast necessary?

>   }
>   
>   void vcpu_block(void);
> 

Cheers,

[1] https://lwn.net/Articles/793253/

-- 
Julien Grall

