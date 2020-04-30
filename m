Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A20CC1BF19E
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2020 09:35:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jU3j4-0007St-4L; Thu, 30 Apr 2020 07:35:18 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=H9qc=6O=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1jU3j2-0007Sn-Ew
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2020 07:35:16 +0000
X-Inumbo-ID: 21e265ec-8ab5-11ea-ae69-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 21e265ec-8ab5-11ea-ae69-bc764e2007e4;
 Thu, 30 Apr 2020 07:35:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id A6492ADF8;
 Thu, 30 Apr 2020 07:35:13 +0000 (UTC)
Subject: Re: [PATCH 2/2] xen: credit2: limit the max number of CPUs in a
 runqueue
To: Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
References: <158818022727.24327.14309662489731832234.stgit@Palanthas>
 <158818179558.24327.11334680191217289878.stgit@Palanthas>
From: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <b368ccef-d3b1-1338-6325-8f81a963876d@suse.com>
Date: Thu, 30 Apr 2020 09:35:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <158818179558.24327.11334680191217289878.stgit@Palanthas>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 29.04.20 19:36, Dario Faggioli wrote:
> In Credit2 CPUs (can) share runqueues, depending on the topology. For
> instance, with per-socket runqueues (the default) all the CPUs that are
> part of the same socket share a runqueue.
> 
> On platform with a huge number of CPUs per socket, that could be a
> problem. An example is AMD EPYC2 servers, where we can have up to 128
> CPUs in a socket.
> 
> It is of course possible to define other, still topology-based, runqueue
> arrangements (e.g., per-LLC, per-DIE, etc). But that may still result in
> runqueues with too many CPUs on other/future platforms.
> 
> Therefore, let's set a limit to the max number of CPUs that can share a
> Credit2 runqueue. The actual value is configurable (at boot time), the
> default being 16. If, for instance,  there are more than 16 CPUs in a
> socket, they'll be split among two (or more) runqueues.

Did you think about balancing the runqueues regarding the number of
cpus? E.g. in case of max being 16 and having 20 cpus to put 10 in each
runqueue? I know this will need more logic as cpus are added one by one,
but the result would be much better IMO.

> 
> Note: with core scheduling enabled, this parameter sets the max number
> of *scheduling resources* that can share a runqueue. Therefore, with
> granularity set to core (and assumint 2 threads per core), we will have
> at most 16 cores per runqueue, which corresponds to 32 threads. But that
> is fine, considering how core scheduling works.
> 
> Signed-off-by: Dario Faggioli <dfaggioli@suse.com>
> ---
> Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> Cc: George Dunlap <george.dunlap@citrix.com>
> Cc: Jan Beulich <jbeulich@suse.com>
> Cc: Juergen Gross <jgross@suse.com>
> ---
>   xen/common/sched/cpupool.c |    2 -
>   xen/common/sched/credit2.c |  104 ++++++++++++++++++++++++++++++++++++++++++--
>   xen/common/sched/private.h |    2 +
>   3 files changed, 103 insertions(+), 5 deletions(-)
> 
> diff --git a/xen/common/sched/cpupool.c b/xen/common/sched/cpupool.c
> index d40345b585..0227457285 100644
> --- a/xen/common/sched/cpupool.c
> +++ b/xen/common/sched/cpupool.c
> @@ -37,7 +37,7 @@ static cpumask_t cpupool_locked_cpus;
>   
>   static DEFINE_SPINLOCK(cpupool_lock);
>   
> -static enum sched_gran __read_mostly opt_sched_granularity = SCHED_GRAN_cpu;
> +enum sched_gran __read_mostly opt_sched_granularity = SCHED_GRAN_cpu;

Please don't use the global option value, but the per-cpupool one.

>   static unsigned int __read_mostly sched_granularity = 1;
>   
>   #ifdef CONFIG_HAS_SCHED_GRANULARITY
> diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
> index 697c9f917d..abe4d048c8 100644
> --- a/xen/common/sched/credit2.c
> +++ b/xen/common/sched/credit2.c
> @@ -471,6 +471,16 @@ static int __init parse_credit2_runqueue(const char *s)
>   }
>   custom_param("credit2_runqueue", parse_credit2_runqueue);
>   
> +/*
> + * How many CPUs will be put, at most, in the same runqueue.
> + * Runqueues are still arranged according to the host topology (and
> + * according to the value of the 'credit2_runqueue' parameter). But
> + * we also have a cap to the number of CPUs that share runqueues.
> + * As soon as we reach the limit, a new runqueue will be created.
> + */
> +static unsigned int __read_mostly opt_max_cpus_runqueue = 16;
> +integer_param("sched_credit2_max_cpus_runqueue", opt_max_cpus_runqueue);
> +
>   /*
>    * Per-runqueue data
>    */
> @@ -852,14 +862,61 @@ cpu_runqueue_match(const struct csched2_runqueue_data *rqd, unsigned int cpu)
>              (opt_runqueue == OPT_RUNQUEUE_NODE && same_node(peer_cpu, cpu));
>   }
>   
> +/* Additional checks, to avoid separating siblings in different runqueues. */
> +static bool
> +cpu_runqueue_smt_match(const struct csched2_runqueue_data *rqd, unsigned int cpu)
> +{
> +    unsigned int nr_sibl = cpumask_weight(per_cpu(cpu_sibling_mask, cpu));

Shouldn't you mask away siblings not in the cpupool?

> +    unsigned int rcpu, nr_smts = 0;
> +
> +    /*
> +     * If we put the CPU in this runqueue, we must be sure that there will
> +     * be enough room for accepting its hyperthread sibling(s) here as well.
> +     */
> +    cpumask_clear(cpumask_scratch_cpu(cpu));
> +    for_each_cpu ( rcpu, &rqd->active )
> +    {
> +        ASSERT(rcpu != cpu);
> +        if ( !cpumask_test_cpu(rcpu, cpumask_scratch_cpu(cpu)) )
> +        {
> +            /*
> +             * For each CPU already in the runqueue, account for it and for
> +             * its sibling(s), independently from whether such sibling(s) are
> +             * in the runqueue already or not.
> +             *
> +             * Of course, if there are sibling CPUs in the runqueue already,
> +             * only count them once.
> +             */
> +            cpumask_or(cpumask_scratch_cpu(cpu), cpumask_scratch_cpu(cpu),
> +                       per_cpu(cpu_sibling_mask, rcpu));

Again, local cpupool only!


Juergen

