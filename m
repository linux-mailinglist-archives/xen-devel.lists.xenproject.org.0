Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7108F744195
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jun 2023 19:49:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557603.871099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFIEE-0002Bf-5M; Fri, 30 Jun 2023 17:48:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557603.871099; Fri, 30 Jun 2023 17:48:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qFIEE-0002A0-1u; Fri, 30 Jun 2023 17:48:18 +0000
Received: by outflank-mailman (input) for mailman id 557603;
 Fri, 30 Jun 2023 17:48:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qFIEB-00029u-VB
 for xen-devel@lists.xenproject.org; Fri, 30 Jun 2023 17:48:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qFIEA-00053N-MC; Fri, 30 Jun 2023 17:48:14 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qFIEA-0004Wl-H6; Fri, 30 Jun 2023 17:48:14 +0000
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
	bh=sjzImeYkNG7NylrMmxHVQyR8h+mADIPok8IbERHuSCI=; b=bMn5x0gx6mDJs8QgUYCKd5yA/D
	p/WbrPJP/Wxa5LqZ/F4ex0xUENWs8m5qtlZU7Wz43T6I98b35Oii+2UoOhb2ZKGenAcAH4XRhO/Pm
	TGatW/oLXHg0rMb1hDSUdnKqXIqHD3hWy2wmPC8cAOeenukaIwWgjIN9N9HZciDLdcxc=;
Message-ID: <42d6cf5e-03ab-a55b-a4d5-54bd063f793d@xen.org>
Date: Fri, 30 Jun 2023 18:48:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH 1/2] credit: Limit load balancing to once per millisecond
Content-Language: en-US
To: George Dunlap <george.dunlap@cloud.com>, xen-devel@lists.xenproject.org
Cc: Dario Faggioli <dfaggioli@suse.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20230630113756.672607-1-george.dunlap@cloud.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230630113756.672607-1-george.dunlap@cloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi George,

On 30/06/2023 12:37, George Dunlap wrote:
> The credit scheduler tries as hard as it can to ensure that it always
> runs scheduling units with positive credit (PRI_TS_UNDER) before
> running those with negative credit (PRI_TS_OVER).  If the next
> runnable scheduling unit is of priority OVER, it will always run the
> load balancer, which will scour the system looking for another
> scheduling unit of the UNDER priority.
> 
> Unfortunately, as the number of cores on a system has grown, the cost
> of the work-stealing algorithm has dramatically increased; a recent
> trace on a system with 128 cores showed this taking over 50
> microseconds.
> 
> Add a parameter, load_balance_ratelimit, to limit the frequency of
> load balance operations on a given pcpu.  Default this to 1
> millisecond.
> 
> Invert the load balancing conditional to make it more clear, and line
> up more closely with the comment above it.
> 
> Overall it might be cleaner to have the last_load_balance checking
> happen inside csched_load_balance(), but that would require either
> passing both now and spc into the function, or looking them up again;
> both of which seemed to be worse than simply checking and setting the
> values before calling it.
> 
> Without this patch, on a system with a vcpu:pcpu ratio of 2:1, running
> Windows guests (which will end up calling YIELD during spinlock
> contention), this patch increased performance significantly.

I don't understand this sentence. Did you intende to write

"Without this patch, ..., the performance are significantly worse"?

> 
> Signed-off-by: George Dunlap <george.dunlap@cloud.com>
> ---
> CC: Dario Faggioli <dfaggioli@suse.com>
> CC: Andrew Cooper <andrew.cooper3@citrix.com>
> CC: George Dunlap <george.dunlap@citrix.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Julien Grall <julien@xen.org>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Wei Liu <wl@xen.org>
> ---
>   docs/misc/xen-command-line.pandoc |  6 +++++
>   xen/common/sched/credit.c         | 40 ++++++++++++++++++++++++++-----
>   xen/include/public/sysctl.h       |  6 +++++
>   3 files changed, 46 insertions(+), 6 deletions(-)
> 
> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
> index 4060ebdc5d..369557020f 100644
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -1856,6 +1856,12 @@ By default, Xen will use the INVPCID instruction for TLB management if
>   it is available.  This option can be used to cause Xen to fall back to
>   older mechanisms, which are generally slower.
>   
> +### load-balance-ratelimit
> +> `= <integer>`
> +
> +The minimum interval between load balancing events on a given pcpu.
> +At the moment only credit honors this parameter.

I would suggest to mention the default value. So a reader don't have to 
look up in the code to find out.

Also, AFAICT, there is max value. I would mention it here too.

> +
>   ### noirqbalance (x86)
>   > `= <boolean>`
>   
> diff --git a/xen/common/sched/credit.c b/xen/common/sched/credit.c
> index f2cd3d9da3..b8bdfd5f6a 100644
> --- a/xen/common/sched/credit.c
> +++ b/xen/common/sched/credit.c
> @@ -50,6 +50,8 @@
>   #define CSCHED_TICKS_PER_TSLICE     3
>   /* Default timeslice: 30ms */
>   #define CSCHED_DEFAULT_TSLICE_MS    30
> +/* Default load balancing ratelimit: 1ms */
> +#define CSCHED_DEFAULT_LOAD_BALANCE_RATELIMIT_US 1000
>   #define CSCHED_CREDITS_PER_MSEC     10
>   /* Never set a timer shorter than this value. */
>   #define CSCHED_MIN_TIMER            XEN_SYSCTL_SCHED_RATELIMIT_MIN
> @@ -153,6 +155,7 @@ struct csched_pcpu {
>   
>       unsigned int idle_bias;
>       unsigned int nr_runnable;
> +    s_time_t last_load_balance;
>   
>       unsigned int tick;
>       struct timer ticker;
> @@ -218,7 +221,7 @@ struct csched_private {
>   
>       /* Period of master and tick in milliseconds */
>       unsigned int tick_period_us, ticks_per_tslice;
> -    s_time_t ratelimit, tslice, unit_migr_delay;
> +    s_time_t ratelimit, tslice, unit_migr_delay, load_balance_ratelimit;
>   
>       struct list_head active_sdom;
>       uint32_t weight;
> @@ -612,6 +615,8 @@ init_pdata(struct csched_private *prv, struct csched_pcpu *spc, int cpu)
>       BUG_ON(!is_idle_unit(curr_on_cpu(cpu)));
>       cpumask_set_cpu(cpu, prv->idlers);
>       spc->nr_runnable = 0;
> +
> +    spc->last_load_balance = NOW();
>   }
>   
>   static void cf_check
> @@ -1267,7 +1272,8 @@ csched_sys_cntl(const struct scheduler *ops,
>                    && (params->ratelimit_us > XEN_SYSCTL_SCHED_RATELIMIT_MAX
>                        || params->ratelimit_us < XEN_SYSCTL_SCHED_RATELIMIT_MIN))
>                || MICROSECS(params->ratelimit_us) > MILLISECS(params->tslice_ms)
> -             || params->vcpu_migr_delay_us > XEN_SYSCTL_CSCHED_MGR_DLY_MAX_US )
> +             || params->vcpu_migr_delay_us > XEN_SYSCTL_CSCHED_MGR_DLY_MAX_US
> +             || params->load_balance_ratelimit_us > XEN_SYSCTL_CSCHED_LB_RATE_MAX_US)
>                   goto out;
>   
>           spin_lock_irqsave(&prv->lock, flags);
> @@ -1278,6 +1284,7 @@ csched_sys_cntl(const struct scheduler *ops,
>               printk(XENLOG_INFO "Disabling context switch rate limiting\n");
>           prv->ratelimit = MICROSECS(params->ratelimit_us);
>           prv->unit_migr_delay = MICROSECS(params->vcpu_migr_delay_us);
> +        prv->load_balance_ratelimit = MICROSECS(params->load_balance_ratelimit_us);
>           spin_unlock_irqrestore(&prv->lock, flags);
>   
>           /* FALLTHRU */
> @@ -1285,6 +1292,7 @@ csched_sys_cntl(const struct scheduler *ops,
>           params->tslice_ms = prv->tslice / MILLISECS(1);
>           params->ratelimit_us = prv->ratelimit / MICROSECS(1);
>           params->vcpu_migr_delay_us = prv->unit_migr_delay / MICROSECS(1);
> +        params->load_balance_ratelimit_us = prv->load_balance_ratelimit / MICROSECS(1);
>           rc = 0;
>           break;
>       }
> @@ -1676,9 +1684,17 @@ csched_runq_steal(int peer_cpu, int cpu, int pri, int balance_step)
>       return NULL;
>   }
>   
> +/*
> + * Minimum delay, in microseconds, between load balance operations.
> + * This prevents spending too much time doing load balancing, particularly
> + * when the system has a high number of YIELDs due to spinlock priority inversion.
> + */
> +static unsigned int __read_mostly load_balance_ratelimit_us = CSCHED_DEFAULT_LOAD_BALANCE_RATELIMIT_US;

AFAICT, load_balance_ratelimit_us is not updated after boot. So 
shouldn't the attribute be __ro_after_init?

> +integer_param("load-balance-ratelimit", load_balance_ratelimit_us);
> +
>   static struct csched_unit *
>   csched_load_balance(struct csched_private *prv, int cpu,
> -    struct csched_unit *snext, bool *stolen)
> +                    struct csched_unit *snext, bool *stolen)
>   {
>       const struct cpupool *c = get_sched_res(cpu)->cpupool;
>       struct csched_unit *speer;
> @@ -1963,10 +1979,12 @@ static void cf_check csched_schedule(
>            * urgent work... If not, csched_load_balance() will return snext, but
>            * already removed from the runq.
>            */
> -        if ( snext->pri > CSCHED_PRI_TS_OVER )
> -            __runq_remove(snext);
> -        else
> +        if ( snext->pri <= CSCHED_PRI_TS_OVER
> +             && now - spc->last_load_balance > prv->load_balance_ratelimit) {
> +            spc->last_load_balance = now;
>               snext = csched_load_balance(prv, sched_cpu, snext, &migrated);
> +        } else
> +            __runq_remove(snext);
>   
>       } while ( !unit_runnable_state(snext->unit) );
>   
> @@ -2181,6 +2199,14 @@ csched_global_init(void)
>                  XEN_SYSCTL_CSCHED_MGR_DLY_MAX_US, vcpu_migration_delay_us);
>       }
>   
> +    if ( load_balance_ratelimit_us > XEN_SYSCTL_CSCHED_LB_RATE_MAX_US )
> +    {
> +        load_balance_ratelimit_us = CSCHED_DEFAULT_LOAD_BALANCE_RATELIMIT_US;
> +        printk("WARNING: load-balance-ratelimit outside of valid range [0,%d]us.\n"
> +               "Resetting to default: %u\n",
> +               XEN_SYSCTL_CSCHED_LB_RATE_MAX_US, load_balance_ratelimit_us);
> +    }
> +
>       return 0;
>   }
>   
> @@ -2223,6 +2249,8 @@ csched_init(struct scheduler *ops)
>   
>       prv->unit_migr_delay = MICROSECS(vcpu_migration_delay_us);
>   
> +    prv->load_balance_ratelimit = MICROSECS(load_balance_ratelimit_us);
> +
>       return 0;
>   }
>   
> diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
> index 9d06e92d0f..48f7f57037 100644
> --- a/xen/include/public/sysctl.h
> +++ b/xen/include/public/sysctl.h
> @@ -641,6 +641,12 @@ struct xen_sysctl_credit_schedule {
>       */
>   #define XEN_SYSCTL_CSCHED_MGR_DLY_MAX_US (100 * 1000)
>       uint32_t vcpu_migr_delay_us;
> +    /*
> +     * Minimum delay, in microseconds, between load balance
> +     * operations; max 1 second.
> +     */
> +#define XEN_SYSCTL_CSCHED_LB_RATE_MAX_US (1000000)
> +    uint32_t load_balance_ratelimit_us;

Shouldn't this change bump the sysctl interface version?

>   };
>   
>   struct xen_sysctl_credit2_schedule {

-- 
Julien Grall

