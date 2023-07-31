Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0D976A31A
	for <lists+xen-devel@lfdr.de>; Mon, 31 Jul 2023 23:40:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.573478.898225 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQad0-0003vY-BT; Mon, 31 Jul 2023 21:40:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 573478.898225; Mon, 31 Jul 2023 21:40:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qQad0-0003tI-7k; Mon, 31 Jul 2023 21:40:34 +0000
Received: by outflank-mailman (input) for mailman id 573478;
 Mon, 31 Jul 2023 21:40:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Bj4f=DR=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qQacy-0003tC-Ui
 for xen-devel@lists.xenproject.org; Mon, 31 Jul 2023 21:40:32 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id de41a2d4-2fea-11ee-8613-37d641c3527e;
 Mon, 31 Jul 2023 23:40:30 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9EF0F612F2;
 Mon, 31 Jul 2023 21:40:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 304A4C43397;
 Mon, 31 Jul 2023 21:40:26 +0000 (UTC)
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
X-Inumbo-ID: de41a2d4-2fea-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690839628;
	bh=NzcH+3rbR7RnqSjaZbiwiH9jnASItRJntnVLzzHqLFE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=PRtNzdfm25+M/dyU/2MUp4D18C47cMcTKJbehsFU285JCW8EZ9Tg6zcRX5s/CV3dc
	 YF4k1MirCH7jq7LW3YG0ru9TZggUOCndY1l/3afFVfBbSZgIEIk4piXpAtlev4rw39
	 E9xa6gWcq8Ejanv/m0T66HL1gZpJULI4aIJc268d8D+8+Da9Nrqhcm8TWw0wF/KIss
	 +sR4taC7axorEi5tZyhIDtiuvHz2zNr8mpX8H985wsHNBZW3sOnobEBvLxtXAiMM7x
	 dLcyJSdudpXvV8iOzyt2stPZldr36scDWt5CQ8BAtDQC2l25uCa5QsAL+QDvkhnaTA
	 37xgt5Vp3ocaA==
Date: Mon, 31 Jul 2023 14:40:24 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: george.dunlap@citrix.com, dfaggioli@suse.com, george.dunlap@cloud.com
cc: Nicola Vetrini <nicola.vetrini@bugseng.com>, 
    xen-devel@lists.xenproject.org, michal.orzel@amd.com, 
    xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, George Dunlap <george.dunlap@citrix.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>, 
    sstabellini@kernel.org
Subject: Re: ack needed [XEN PATCH v3] xen/sched: mechanical renaming to
 address MISRA C:2012 Rule 5.3
In-Reply-To: <alpine.DEB.2.22.394.2307281621260.3118466@ubuntu-linux-20-04-desktop>
Message-ID: <alpine.DEB.2.22.394.2307311439320.1972086@ubuntu-linux-20-04-desktop>
References: <12a21bfd59d85c7b8619631edac93d79d7225c60.1690547599.git.nicola.vetrini@bugseng.com> <alpine.DEB.2.22.394.2307281621260.3118466@ubuntu-linux-20-04-desktop>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

George, Dario,

Please ack


On Fri, 28 Jul 2023, Stefano Stabellini wrote:
> On Fri, 28 Jul 2023, Nicola Vetrini wrote:
> > Rule 5.3 has the following headline:
> > "An identifier declared in an inner scope shall not hide an
> > identifier declared in an outer scope"
> > 
> > The renaming s/sched_id/scheduler_id/ of the function defined in
> > 'xen/common/sched/core.c' prevents any hiding of that function
> > by the instances of homonymous function parameters that
> > are defined in inner scopes.
> > 
> > Similarly, the renames
> > - s/ops/operations/ for the static variable in 'xen/common/sched/core.c'
> > - s/do_softirq/needs_softirq/
> > are introduced for variables, to avoid any conflict with homonymous
> > parameters or function identifiers.
> > 
> > Moreover, the variable 'loop' defined at 'xen/common/sched/credit2.c:3887'
> > has been dropped, in favour of the homonymous variable declared in the
> > outer scope. This in turn requires a modification of the printk call that
> > involves it.
> > 
> > Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> 
> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> 
> > ---
> > Changes in v3:
> > - removed stray changes to address the remarks
> > Changes in v2:
> > - s/softirq/needs_softirq/
> > - Dropped local variable 'it'
> > - Renamed the 'ops' static variable instead of function parameters
> > in the idle scheduler for coherence.
> > 
> > Note: local variable 'j' in xen/common/sched/credit2.c:3812' should
> > probably be unsigned as well, but I saw while editing the patch
> > that it's used as a parameter to 'dump_pcpu', which takes an int.
> > Possibly changing the types of parameters used in these calls is
> > probably a good target for another patch, as it's not relevant
> > w.r.t. Rule 5.3.
> > ---
> >  xen/common/sched/core.c    | 28 ++++++++++++++--------------
> >  xen/common/sched/credit2.c |  6 +++---
> >  xen/common/sysctl.c        |  2 +-
> >  xen/include/xen/sched.h    |  2 +-
> >  4 files changed, 19 insertions(+), 19 deletions(-)
> > 
> > diff --git a/xen/common/sched/core.c b/xen/common/sched/core.c
> > index 022f548652..12deefa745 100644
> > --- a/xen/common/sched/core.c
> > +++ b/xen/common/sched/core.c
> > @@ -91,7 +91,7 @@ extern const struct scheduler *__start_schedulers_array[], *__end_schedulers_arr
> >  #define NUM_SCHEDULERS (__end_schedulers_array - __start_schedulers_array)
> >  #define schedulers __start_schedulers_array
> > 
> > -static struct scheduler __read_mostly ops;
> > +static struct scheduler __read_mostly operations;
> > 
> >  static bool scheduler_active;
> > 
> > @@ -171,7 +171,7 @@ static inline struct scheduler *dom_scheduler(const struct domain *d)
> >       * is the default scheduler that has been, choosen at boot.
> >       */
> >      ASSERT(is_idle_domain(d));
> > -    return &ops;
> > +    return &operations;
> >  }
> > 
> >  static inline struct scheduler *unit_scheduler(const struct sched_unit *unit)
> > @@ -2040,10 +2040,10 @@ long do_set_timer_op(s_time_t timeout)
> >      return 0;
> >  }
> > 
> > -/* sched_id - fetch ID of current scheduler */
> > -int sched_id(void)
> > +/* scheduler_id - fetch ID of current scheduler */
> > +int scheduler_id(void)
> >  {
> > -    return ops.sched_id;
> > +    return operations.sched_id;
> >  }
> > 
> >  /* Adjust scheduling parameter for a given domain. */
> > @@ -2579,7 +2579,7 @@ static void cf_check sched_slave(void)
> >      struct sched_unit    *prev = vprev->sched_unit, *next;
> >      s_time_t              now;
> >      spinlock_t           *lock;
> > -    bool                  do_softirq = false;
> > +    bool                  needs_softirq = false;
> >      unsigned int          cpu = smp_processor_id();
> > 
> >      ASSERT_NOT_IN_ATOMIC();
> > @@ -2604,7 +2604,7 @@ static void cf_check sched_slave(void)
> >              return;
> >          }
> > 
> > -        do_softirq = true;
> > +        needs_softirq = true;
> >      }
> > 
> >      if ( !prev->rendezvous_in_cnt )
> > @@ -2614,7 +2614,7 @@ static void cf_check sched_slave(void)
> >          rcu_read_unlock(&sched_res_rculock);
> > 
> >          /* Check for failed forced context switch. */
> > -        if ( do_softirq )
> > +        if ( needs_softirq )
> >              raise_softirq(SCHEDULE_SOFTIRQ);
> > 
> >          return;
> > @@ -3016,14 +3016,14 @@ void __init scheduler_init(void)
> >          BUG_ON(!scheduler);
> >          printk("Using '%s' (%s)\n", scheduler->name, scheduler->opt_name);
> >      }
> > -    ops = *scheduler;
> > +    operations = *scheduler;
> > 
> >      if ( cpu_schedule_up(0) )
> >          BUG();
> >      register_cpu_notifier(&cpu_schedule_nfb);
> > 
> > -    printk("Using scheduler: %s (%s)\n", ops.name, ops.opt_name);
> > -    if ( sched_init(&ops) )
> > +    printk("Using scheduler: %s (%s)\n", operations.name, operations.opt_name);
> > +    if ( sched_init(&operations) )
> >          panic("scheduler returned error on init\n");
> > 
> >      if ( sched_ratelimit_us &&
> > @@ -3363,7 +3363,7 @@ int schedule_cpu_rm(unsigned int cpu, struct cpu_rm_data *data)
> > 
> >  struct scheduler *scheduler_get_default(void)
> >  {
> > -    return &ops;
> > +    return &operations;
> >  }
> > 
> >  struct scheduler *scheduler_alloc(unsigned int sched_id)
> > @@ -3392,7 +3392,7 @@ struct scheduler *scheduler_alloc(unsigned int sched_id)
> > 
> >  void scheduler_free(struct scheduler *sched)
> >  {
> > -    BUG_ON(sched == &ops);
> > +    BUG_ON(sched == &operations);
> >      sched_deinit(sched);
> >      xfree(sched);
> >  }
> > @@ -3416,7 +3416,7 @@ void schedule_dump(struct cpupool *c)
> >      }
> >      else
> >      {
> > -        sched = &ops;
> > +        sched = &operations;
> >          cpus = &cpupool_free_cpus;
> >      }
> > 
> > diff --git a/xen/common/sched/credit2.c b/xen/common/sched/credit2.c
> > index 87a1e31ee9..fc583915df 100644
> > --- a/xen/common/sched/credit2.c
> > +++ b/xen/common/sched/credit2.c
> > @@ -3874,7 +3874,7 @@ csched2_dump(const struct scheduler *ops)
> > 
> >              lock = unit_schedule_lock(unit);
> > 
> > -            printk("\t%3d: ", ++loop);
> > +            printk("\t%3u: ", ++loop);
> >              csched2_dump_unit(prv, svc);
> > 
> >              unit_schedule_unlock(lock, unit);
> > @@ -3884,8 +3884,8 @@ csched2_dump(const struct scheduler *ops)
> >      list_for_each_entry ( rqd, &prv->rql, rql )
> >      {
> >          struct list_head *iter, *runq = &rqd->runq;
> > -        int loop = 0;
> > 
> > +        loop = 0;
> >          /* We need the lock to scan the runqueue. */
> >          spin_lock(&rqd->lock);
> > 
> > @@ -3901,7 +3901,7 @@ csched2_dump(const struct scheduler *ops)
> > 
> >              if ( svc )
> >              {
> > -                printk("\t%3d: ", loop++);
> > +                printk("\t%3u: ", loop++);
> >                  csched2_dump_unit(prv, svc);
> >              }
> >          }
> > diff --git a/xen/common/sysctl.c b/xen/common/sysctl.c
> > index 0cbfe8bd44..7cabfb0230 100644
> > --- a/xen/common/sysctl.c
> > +++ b/xen/common/sysctl.c
> > @@ -71,7 +71,7 @@ long do_sysctl(XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
> >          break;
> > 
> >      case XEN_SYSCTL_sched_id:
> > -        op->u.sched_id.sched_id = sched_id();
> > +        op->u.sched_id.sched_id = scheduler_id();
> >          break;
> > 
> >      case XEN_SYSCTL_getdomaininfolist:
> > diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
> > index 854f3e32c0..bfe714d2e2 100644
> > --- a/xen/include/xen/sched.h
> > +++ b/xen/include/xen/sched.h
> > @@ -791,7 +791,7 @@ int  sched_init_domain(struct domain *d, unsigned int poolid);
> >  void sched_destroy_domain(struct domain *d);
> >  long sched_adjust(struct domain *, struct xen_domctl_scheduler_op *);
> >  long sched_adjust_global(struct xen_sysctl_scheduler_op *);
> > -int  sched_id(void);
> > +int  scheduler_id(void);
> > 
> >  /*
> >   * sched_get_id_by_name - retrieves a scheduler id given a scheduler name
> > --
> > 2.34.1
> > 
> 

