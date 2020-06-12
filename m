Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F06C41F733B
	for <lists+xen-devel@lfdr.de>; Fri, 12 Jun 2020 06:57:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jjbkj-0006us-LS; Fri, 12 Jun 2020 04:57:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=liIz=7Z=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jjbki-0006uk-0q
 for xen-devel@lists.xenproject.org; Fri, 12 Jun 2020 04:57:16 +0000
X-Inumbo-ID: 2ef83aa6-ac69-11ea-bca7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2ef83aa6-ac69-11ea-bca7-bc764e2007e4;
 Fri, 12 Jun 2020 04:57:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 859EFAC61;
 Fri, 12 Jun 2020 04:57:17 +0000 (UTC)
Subject: Re: [RFC PATCH v1 4/6] xentop: collect IRQ and HYP time statistics.
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20200612002205.174295-1-volodymyr_babchuk@epam.com>
 <20200612002205.174295-5-volodymyr_babchuk@epam.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <2a0ff6f5-1ada-9d0a-5014-709c873ec3e3@suse.com>
Date: Fri, 12 Jun 2020 06:57:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200612002205.174295-5-volodymyr_babchuk@epam.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Dario Faggioli <dfaggioli@suse.com>,
 Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 12.06.20 02:22, Volodymyr Babchuk wrote:
> As scheduler code now collects time spent in IRQ handlers and in
> do_softirq(), we can present those values to userspace tools like
> xentop, so system administrator can see how system behaves.
> 
> We are updating counters only in sched_get_time_correction() function
> to minimize number of taken spinlocks. As atomic_t is 32 bit wide, it
> is not enough to store time with nanosecond precision. So we need to
> use 64 bit variables and protect them with spinlock.
> 
> Signed-off-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
> ---
>   xen/common/sched/core.c     | 17 +++++++++++++++++
>   xen/common/sysctl.c         |  1 +
>   xen/include/public/sysctl.h |  4 +++-
>   xen/include/xen/sched.h     |  2 ++
>   4 files changed, 23 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
> index a7294ff5c3..ee6b1d9161 100644
> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
> @@ -95,6 +95,10 @@ static struct scheduler __read_mostly ops;
>   
>   static bool scheduler_active;
>   
> +static DEFINE_SPINLOCK(sched_stat_lock);
> +s_time_t sched_stat_irq_time;
> +s_time_t sched_stat_hyp_time;
> +
>   static void sched_set_affinity(
>       struct sched_unit *unit, const cpumask_t *hard, const cpumask_t *soft);
>   
> @@ -994,9 +998,22 @@ s_time_t sched_get_time_correction(struct sched_unit *u)
>               break;
>       }
>   
> +    spin_lock_irqsave(&sched_stat_lock, flags);
> +    sched_stat_irq_time += irq;
> +    sched_stat_hyp_time += hyp;
> +    spin_unlock_irqrestore(&sched_stat_lock, flags);

Please don't use a lock. Just use add_sized() instead which will add
atomically.

> +
>       return irq + hyp;
>   }
>   
> +void sched_get_time_stats(uint64_t *irq_time, uint64_t *hyp_time)
> +{
> +    unsigned long flags;
> +
> +    spin_lock_irqsave(&sched_stat_lock, flags);
> +    *irq_time = sched_stat_irq_time;
> +    *hyp_time = sched_stat_hyp_time;
> +    spin_unlock_irqrestore(&sched_stat_lock, flags);

read_atomic() will do the job without lock.

>   }
>   
>   /*
> diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
> index 1c6a817476..00683bc93f 100644
> --- a/xen/common/sysctl.c
> +++ b/xen/common/sysctl.c
> @@ -270,6 +270,7 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
>           pi->scrub_pages = 0;
>           pi->cpu_khz = cpu_khz;
>           pi->max_mfn = get_upper_mfn_bound();
> +        sched_get_time_stats(&pi->irq_time, &pi->hyp_time);
>           arch_do_physinfo(pi);
>           if ( iommu_enabled )
>           {
> diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
> index 3a08c512e8..f320144d40 100644
> --- a/xen/include/public/sysctl.h
> +++ b/xen/include/public/sysctl.h
> @@ -35,7 +35,7 @@
>   #include "domctl.h"
>   #include "physdev.h"
>   
> -#define XEN_SYSCTL_INTERFACE_VERSION 0x00000013
> +#define XEN_SYSCTL_INTERFACE_VERSION 0x00000014
>   
>   /*
>    * Read console content from Xen buffer ring.
> @@ -118,6 +118,8 @@ struct xen_sysctl_physinfo {
>       uint64_aligned_t scrub_pages;
>       uint64_aligned_t outstanding_pages;
>       uint64_aligned_t max_mfn; /* Largest possible MFN on this host */
> +    uint64_aligned_t irq_time;
> +    uint64_aligned_t hyp_time;

Would hypfs work, too? This would avoid the need for extending another
hypercall.


Juergen


