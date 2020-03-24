Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD80190C95
	for <lists+xen-devel@lfdr.de>; Tue, 24 Mar 2020 12:36:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jGhpg-0000Tl-J0; Tue, 24 Mar 2020 11:34:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=hjhq=5J=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jGhpe-0000Tf-Th
 for xen-devel@lists.xenproject.org; Tue, 24 Mar 2020 11:34:54 +0000
X-Inumbo-ID: 7a97bdcc-6dc3-11ea-83cf-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7a97bdcc-6dc3-11ea-83cf-12813bfff9fa;
 Tue, 24 Mar 2020 11:34:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id B686EAC52;
 Tue, 24 Mar 2020 11:34:52 +0000 (UTC)
To: xen-devel@lists.xenproject.org
References: <20200310080946.29020-1-jgross@suse.com>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <d9d4687c-5f4c-7fff-ca24-600ff53d09ea@suse.com>
Date: Tue, 24 Mar 2020 12:34:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200310080946.29020-1-jgross@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [Xen-devel] [PATCH v3] xen/sched: fix cpu offlining with core
 scheduling
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Ping?

On 10.03.20 09:09, Juergen Gross wrote:
> Offlining a cpu with core scheduling active can result in a hanging
> system. Reason is the scheduling resource and unit of the to be removed
> cpus needs to be split in order to remove the cpu from its cpupool and
> move it to the idle scheduler. In case one of the involved cpus happens
> to have received a sched slave event due to a vcpu former having been
> running on that cpu being woken up again, it can happen that this cpu
> will enter sched_wait_rendezvous_in() while its scheduling resource is
> just about to be split. It might wait for ever for the other sibling
> to join, which will never happen due to the resources already being
> modified.
> 
> This can easily be avoided by:
> - resetting the rendezvous counters of the idle unit which is kept
> - checking for a new scheduling resource in sched_wait_rendezvous_in()
>    after reacquiring the scheduling lock and resetting the counters in
>    that case without scheduling another vcpu
> - moving schedule resource modifications (in schedule_cpu_rm()) and
>    retrieving (schedule(), sched_slave() is fine already, others are not
>    critical) into locked regions
> 
> Reported-by: Igor Druzhinin <igor.druzhinin@citrix.com>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V2:
> - fix unlocking, add some related comments
> 
> V3:
> - small comment corrections (Jan Beulich)
> ---
>   xen/common/sched/core.c | 39 ++++++++++++++++++++++++++++++++-------
>   1 file changed, 32 insertions(+), 7 deletions(-)
> 
> diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
> index 7e8e7d2c39..626861a3fe 100644
> --- a/xen/common/sched/core.c
> +++ b/xen/common/sched/core.c
> @@ -2299,6 +2299,10 @@ void sched_context_switched(struct vcpu *vprev, struct vcpu *vnext)
>       rcu_read_unlock(&sched_res_rculock);
>   }
>   
> +/*
> + * Switch to a new context or keep the current one running.
> + * On x86 it won't return, so it needs to drop the still held sched_res_rculock.
> + */
>   static void sched_context_switch(struct vcpu *vprev, struct vcpu *vnext,
>                                    bool reset_idle_unit, s_time_t now)
>   {
> @@ -2408,6 +2412,9 @@ static struct vcpu *sched_force_context_switch(struct vcpu *vprev,
>    * zero do_schedule() is called and the rendezvous counter for leaving
>    * context_switch() is set. All other members will wait until the counter is
>    * becoming zero, dropping the schedule lock in between.
> + * Either returns the new unit to run, or NULL if no context switch is
> + * required or (on Arm) has already been performed. If NULL is returned
> + * sched_res_rculock has been dropped.
>    */
>   static struct sched_unit *sched_wait_rendezvous_in(struct sched_unit *prev,
>                                                      spinlock_t **lock, int cpu,
> @@ -2415,7 +2422,8 @@ static struct sched_unit *sched_wait_rendezvous_in(struct sched_unit *prev,
>   {
>       struct sched_unit *next;
>       struct vcpu *v;
> -    unsigned int gran = get_sched_res(cpu)->granularity;
> +    struct sched_resource *sr = get_sched_res(cpu);
> +    unsigned int gran = sr->granularity;
>   
>       if ( !--prev->rendezvous_in_cnt )
>       {
> @@ -2482,6 +2490,21 @@ static struct sched_unit *sched_wait_rendezvous_in(struct sched_unit *prev,
>               atomic_set(&prev->next_task->rendezvous_out_cnt, 0);
>               prev->rendezvous_in_cnt = 0;
>           }
> +
> +        /*
> +         * Check for scheduling resource switched. This happens when we are
> +         * moved away from our cpupool and cpus are subject of the idle
> +         * scheduler now.
> +         */
> +        if ( unlikely(sr != get_sched_res(cpu)) )
> +        {
> +            ASSERT(is_idle_unit(prev));
> +            atomic_set(&prev->next_task->rendezvous_out_cnt, 0);
> +            prev->rendezvous_in_cnt = 0;
> +            pcpu_schedule_unlock_irq(*lock, cpu);
> +            rcu_read_unlock(&sched_res_rculock);
> +            return NULL;
> +        }
>       }
>   
>       return prev->next_task;
> @@ -2567,11 +2590,11 @@ static void schedule(void)
>   
>       rcu_read_lock(&sched_res_rculock);
>   
> +    lock = pcpu_schedule_lock_irq(cpu);
> +
>       sr = get_sched_res(cpu);
>       gran = sr->granularity;
>   
> -    lock = pcpu_schedule_lock_irq(cpu);
> -
>       if ( prev->rendezvous_in_cnt )
>       {
>           /*
> @@ -3151,7 +3174,10 @@ int schedule_cpu_rm(unsigned int cpu)
>           per_cpu(sched_res_idx, cpu_iter) = 0;
>           if ( cpu_iter == cpu )
>           {
> -            idle_vcpu[cpu_iter]->sched_unit->priv = NULL;
> +            unit = idle_vcpu[cpu_iter]->sched_unit;
> +            unit->priv = NULL;
> +            atomic_set(&unit->next_task->rendezvous_out_cnt, 0);
> +            unit->rendezvous_in_cnt = 0;
>           }
>           else
>           {
> @@ -3182,6 +3208,8 @@ int schedule_cpu_rm(unsigned int cpu)
>       }
>       sr->scheduler = &sched_idle_ops;
>       sr->sched_priv = NULL;
> +    sr->granularity = 1;
> +    sr->cpupool = NULL;
>   
>       smp_mb();
>       sr->schedule_lock = &sched_free_cpu_lock;
> @@ -3194,9 +3222,6 @@ int schedule_cpu_rm(unsigned int cpu)
>       sched_free_udata(old_ops, vpriv_old);
>       sched_free_pdata(old_ops, ppriv_old, cpu);
>   
> -    sr->granularity = 1;
> -    sr->cpupool = NULL;
> -
>   out:
>       rcu_read_unlock(&sched_res_rculock);
>       xfree(sr_new);
> 


