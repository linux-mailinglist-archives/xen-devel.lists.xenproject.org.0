Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 839687F21EB
	for <lists+xen-devel@lfdr.de>; Tue, 21 Nov 2023 01:03:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.637401.993154 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5EEK-00036G-IA; Tue, 21 Nov 2023 00:03:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 637401.993154; Tue, 21 Nov 2023 00:03:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r5EEK-00033N-FG; Tue, 21 Nov 2023 00:03:04 +0000
Received: by outflank-mailman (input) for mailman id 637401;
 Tue, 21 Nov 2023 00:03:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GQYN=HC=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1r5EEI-00033H-QQ
 for xen-devel@lists.xenproject.org; Tue, 21 Nov 2023 00:03:02 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 550c1721-8801-11ee-98e0-6d05b1d4d9a1;
 Tue, 21 Nov 2023 01:03:01 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 55E6F615C6;
 Tue, 21 Nov 2023 00:02:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA3B3C433C7;
 Tue, 21 Nov 2023 00:02:57 +0000 (UTC)
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
X-Inumbo-ID: 550c1721-8801-11ee-98e0-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700524979;
	bh=oVA62WBvEgQ8V+5S/PwHm28Az+1LTi+tFg8xgHi+U/8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=KO5gGHSwVQhcja41h2THoBXvqdQmTDTgm57pEQNEo9xR4mu25wMgz6k6oOqHTr2Ow
	 XKgq8JeA3aSuTnNz0j2LYBJgajYanpLb42ko0I8rT7Xg6ROTWdvo27YEWfAyhz8AUg
	 ZXv2We6ify5IBwWDkQdkl7SOLNPynepzfEiI/j0BaJ1AWpl+rOtxbyQv33DA/hOK2x
	 5vCEYTtbzrV08hftEH9E7Tb2i8IGj/ZHfcl9wtc8ZMP+vDz9ZsGdSOXofIdR16hOuT
	 rtRO8yntiOLXIfmFcyFxICFzI0oZ9Ev9rVy0LdGK8ycizGRkQUuRf07EzJUWlxnl8X
	 JtGySY6YtFmDw==
Date: Mon, 20 Nov 2023 16:02:56 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 1/5] xen/common: address violations of MISRA C:2012
 Rule 8.2
In-Reply-To: <a03a8d60-5e46-4ef2-9e35-cc6892d229ee@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2311201602500.773207@ubuntu-linux-20-04-desktop>
References: <cover.1700209834.git.federico.serafini@bugseng.com> <ccc8b4bea515360e448f1975dadb326ad2e6c918.1700209834.git.federico.serafini@bugseng.com> <alpine.DEB.2.22.394.2311171851260.773207@ubuntu-linux-20-04-desktop>
 <a03a8d60-5e46-4ef2-9e35-cc6892d229ee@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 19 Nov 2023, Federico Serafini wrote:
> On 18/11/23 03:59, Stefano Stabellini wrote:
> > On Fri, 17 Nov 2023, Federico Serafini wrote:
> > > diff --git a/xen/common/stop_machine.c b/xen/common/stop_machine.c
> > > index 3adbe380de..398cfd507c 100644
> > > --- a/xen/common/stop_machine.c
> > > +++ b/xen/common/stop_machine.c
> > > @@ -46,7 +46,7 @@ struct stopmachine_data {
> > >         unsigned int fn_cpu;
> > >       int fn_result;
> > > -    int (*fn)(void *);
> > > +    int (*fn)(void *data);
> > >       void *fn_data;
> > >   };
> > 
> > At least one of the possible function used here calls the parameter
> > "arg", see take_cpu_down. But I don't think it is a MISRA requirement to
> > also harmonize those?
> > 
> > 
> > > @@ -73,7 +73,7 @@ static void stopmachine_wait_state(void)
> > >    * mandatory to be called only on an idle vcpu, as otherwise active core
> > >    * scheduling might hang.
> > >    */
> > > -int stop_machine_run(int (*fn)(void *), void *data, unsigned int cpu)
> > > +int stop_machine_run(int (*fn)(void *data), void *data, unsigned int cpu)
> > >   {
> > >       unsigned int i, nr_cpus;
> > >       unsigned int this = smp_processor_id();
> > > diff --git a/xen/common/tasklet.c b/xen/common/tasklet.c
> > > index 3ad67b5c24..3649798e6b 100644
> > > --- a/xen/common/tasklet.c
> > > +++ b/xen/common/tasklet.c
> > > @@ -199,7 +199,7 @@ static void migrate_tasklets_from_cpu(unsigned int
> > > cpu, struct list_head *list)
> > >       spin_unlock_irqrestore(&tasklet_lock, flags);
> > >   }
> > >   -void tasklet_init(struct tasklet *t, void (*func)(void *), void *data)
> > > +void tasklet_init(struct tasklet *t, void (*func)(void *data), void
> > > *data)
> > >   {
> > >       memset(t, 0, sizeof(*t));
> > >       INIT_LIST_HEAD(&t->list);
> > > @@ -208,7 +208,8 @@ void tasklet_init(struct tasklet *t, void (*func)(void
> > > *), void *data)
> > >       t->data = data;
> > >   }
> > >   -void softirq_tasklet_init(struct tasklet *t, void (*func)(void *), void
> > > *data)
> > > +void softirq_tasklet_init(struct tasklet *t,
> > > +                          void (*func)(void *data), void *data)
> > >   {
> > >       tasklet_init(t, func, data);
> > >       t->is_softirq = 1;
> > > diff --git a/xen/common/timer.c b/xen/common/timer.c
> > > index 0fddfa7487..bf7792dcb3 100644
> > > --- a/xen/common/timer.c
> > > +++ b/xen/common/timer.c
> > > @@ -291,7 +291,7 @@ static bool active_timer(const struct timer *timer)
> > >     void init_timer(
> > >       struct timer *timer,
> > > -    void        (*function)(void *),
> > > +    void        (*function)(void *data),
> > >       void         *data,
> > >       unsigned int  cpu)
> > >   {
> > > @@ -441,7 +441,7 @@ void kill_timer(struct timer *timer)
> > >     static void execute_timer(struct timers *ts, struct timer *t)
> > >   {
> > > -    void (*fn)(void *) = t->function;
> > > +    void (*fn)(void *data) = t->function;
> > >       void *data = t->data;
> > >         t->status = TIMER_STATUS_inactive;
> > > diff --git a/xen/include/xen/rangeset.h b/xen/include/xen/rangeset.h
> > > index 135f33f606..390f7b6082 100644
> > > --- a/xen/include/xen/rangeset.h
> > > +++ b/xen/include/xen/rangeset.h
> > > @@ -68,7 +68,7 @@ bool_t __must_check rangeset_overlaps_range(
> > >       struct rangeset *r, unsigned long s, unsigned long e);
> > >   int rangeset_report_ranges(
> > >       struct rangeset *r, unsigned long s, unsigned long e,
> > > -    int (*cb)(unsigned long s, unsigned long e, void *), void *ctxt);
> > > +    int (*cb)(unsigned long s, unsigned long e, void *data), void *ctxt);
> > 
> > Also here some of the functions use "arg" instead of ctxt
> > 
> > 
> > >   /*
> > >    * Note that the consume function can return an error value apart from
> > > @@ -77,7 +77,7 @@ int rangeset_report_ranges(
> > >    */
> > >   int rangeset_consume_ranges(struct rangeset *r,
> > >                               int (*cb)(unsigned long s, unsigned long e,
> > > -                                      void *, unsigned long *c),
> > > +                                      void *ctxt, unsigned long *c),
> > >                               void *ctxt);
> > 
> > Also here some of the functions use "dom" like irq_remove_cb.
> > 
> > 
> > But I actually like the patch as is, so if that's OK from a MISRA point
> > of view then I would give my reviewed-by.
> 
> Yes, this is OK for MISRA.


Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

