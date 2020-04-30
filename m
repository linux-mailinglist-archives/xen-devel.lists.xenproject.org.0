Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 473271BF086
	for <lists+xen-devel@lfdr.de>; Thu, 30 Apr 2020 08:46:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jU2xF-0002Ec-3X; Thu, 30 Apr 2020 06:45:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mtm3=6O=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jU2xD-0002EX-IL
 for xen-devel@lists.xenproject.org; Thu, 30 Apr 2020 06:45:51 +0000
X-Inumbo-ID: 3a6d4408-8aae-11ea-9a07-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3a6d4408-8aae-11ea-9a07-12813bfff9fa;
 Thu, 30 Apr 2020 06:45:50 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 2F909AB76;
 Thu, 30 Apr 2020 06:45:48 +0000 (UTC)
Subject: Re: [PATCH 2/2] xen: credit2: limit the max number of CPUs in a
 runqueue
To: Dario Faggioli <dfaggioli@suse.com>
References: <158818022727.24327.14309662489731832234.stgit@Palanthas>
 <158818179558.24327.11334680191217289878.stgit@Palanthas>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <3db33b8a-ba97-f302-a325-e989ff0e7084@suse.com>
Date: Thu, 30 Apr 2020 08:45:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <158818179558.24327.11334680191217289878.stgit@Palanthas>
Content-Type: text/plain; charset=utf-8
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 George Dunlap <george.dunlap@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 29.04.2020 19:36, Dario Faggioli wrote:
> @@ -852,14 +862,61 @@ cpu_runqueue_match(const struct csched2_runqueue_data *rqd, unsigned int cpu)
>             (opt_runqueue == OPT_RUNQUEUE_NODE && same_node(peer_cpu, cpu));
>  }
>  
> +/* Additional checks, to avoid separating siblings in different runqueues. */
> +static bool
> +cpu_runqueue_smt_match(const struct csched2_runqueue_data *rqd, unsigned int cpu)
> +{
> +    unsigned int nr_sibl = cpumask_weight(per_cpu(cpu_sibling_mask, cpu));
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
> +            nr_smts += nr_sibl;

This being common code, is it appropriate to assume all CPUs having
the same number of siblings? Even beyond that, iirc the sibling mask
represents the online or parked siblings, but not offline ones. For
the purpose here, don't you rather care about the full set?

What about HT vs AMD Fam15's CUs? Do you want both to be treated
the same here?

Also could you outline the intentions with this logic in the
description, to be able to match the goal with what gets done?

> +        }
> +    }
> +    /*
> +     * We know that neither the CPU, nor any of its sibling are here,
> +     * or we wouldn't even have entered the function.
> +     */
> +    ASSERT(!cpumask_intersects(cpumask_scratch_cpu(cpu),
> +                               per_cpu(cpu_sibling_mask, cpu)));
> +
> +    /* Try adding CPU and its sibling(s) to the count and check... */
> +    nr_smts += nr_sibl;
> +
> +    if ( nr_smts <= opt_max_cpus_runqueue )
> +        return true;
> +
> +    return false;

Fold these into

    return nr_smts <= opt_max_cpus_runqueue;

?

> @@ -873,11 +930,44 @@ cpu_add_to_runqueue(struct csched2_private *prv, unsigned int cpu)
>          if ( !rqi_unused && rqd->id > rqi )
>              rqi_unused = true;
>  
> -        if ( cpu_runqueue_match(rqd, cpu) )
> +        /*
> +         * Check whether the CPU should (according to the topology) and also
> +         * can (if we there aren't too many already) go in this runqueue.

Nit: Stray "we"?

> +         */
> +        if ( rqd->refcnt < opt_max_cpus_runqueue &&
> +             cpu_runqueue_match(rqd, cpu) )
>          {
> -            rqd_valid = true;
> -            break;
> +            cpumask_t *siblings = per_cpu(cpu_sibling_mask, cpu);
> +
> +            dprintk(XENLOG_DEBUG, "CPU %d matches runq %d, cpus={%*pbl} (max %d)\n",
> +                    cpu, rqd->id, CPUMASK_PR(&rqd->active),
> +                    opt_max_cpus_runqueue);
> +
> +            /*
> +             * If we're using core (or socket!) scheduling, or we don't have
> +             * hyperthreading, no need to do any further checking.
> +             *
> +             * If no (to both), but our sibling is already in this runqueue,
> +             * then it's also ok for the CPU to stay in this runqueue..

Nit: Stray full 2nd stop?

> +             * Otherwise, do some more checks, to better account for SMT.
> +             */
> +            if ( opt_sched_granularity != SCHED_GRAN_cpu ||
> +                 cpumask_weight(siblings) <= 1 ||
> +                 cpumask_intersects(&rqd->active, siblings) )
> +            {
> +                dprintk(XENLOG_DEBUG, "runq %d selected\n", rqd->id);
> +                rqd_valid = rqd;
> +                break;
> +            }
> +            else if ( cpu_runqueue_smt_match(rqd, cpu) )
> +            {
> +                dprintk(XENLOG_DEBUG, "considering runq %d...\n", rqd->id);
> +                rqd_valid = rqd;
> +            }
>          }
> +	else

Hard tab slipped in.

> @@ -900,6 +990,12 @@ cpu_add_to_runqueue(struct csched2_private *prv, unsigned int cpu)
>          rqd->pick_bias = cpu;
>          rqd->id = rqi;
>      }
> +    else
> +        rqd = rqd_valid;
> +
> +    printk(XENLOG_INFO "CPU %d (sibling={%*pbl}) will go to runqueue %d with {%*pbl}\n",
> +           cpu, CPUMASK_PR(per_cpu(cpu_sibling_mask, cpu)), rqd->id,
> +           CPUMASK_PR(&rqd->active));

Iirc there's one per-CPU printk() already. On large systems this isn't
very nice, so I'd like to ask that their total number at least not get
further grown. Ideally there would be a less verbose summary after all
CPUs have been brought up at boot, with per-CPU info be logged only
during CPU hot online.

Jan

