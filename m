Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 618457AB406
	for <lists+xen-devel@lfdr.de>; Fri, 22 Sep 2023 16:47:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.606918.945010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjhQq-00074T-AK; Fri, 22 Sep 2023 14:47:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 606918.945010; Fri, 22 Sep 2023 14:47:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjhQq-00072F-6x; Fri, 22 Sep 2023 14:47:00 +0000
Received: by outflank-mailman (input) for mailman id 606918;
 Fri, 22 Sep 2023 14:46:59 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PcWe=FG=cloud.com=george.dunlap@srs-se1.protection.inumbo.net>)
 id 1qjhQp-00070Q-4V
 for xen-devel@lists.xenproject.org; Fri, 22 Sep 2023 14:46:59 +0000
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [2a00:1450:4864:20::232])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e0fbca02-5956-11ee-9b0d-b553b5be7939;
 Fri, 22 Sep 2023 16:46:57 +0200 (CEST)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2c131ddfeb8so28284601fa.3
 for <xen-devel@lists.xenproject.org>; Fri, 22 Sep 2023 07:46:57 -0700 (PDT)
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
X-Inumbo-ID: e0fbca02-5956-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1695394017; x=1695998817; darn=lists.xenproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7+pbIH7kh8kx6qkEOQ3aN7dv5sqdupBRAm9xcVdmE1Q=;
        b=II0f/98fOSq5/gN/eSZqlbEBDne1omfh35RmiEmaov0ifIGPnQLN19QvnulsZggSGi
         1/5sIF8Lk/3ch72fVfLjZBhbveqbyUN5D0kvf2fEBrLzMA4KQeGx46qwlbLymJwWM1hm
         uyfs59ofrvHixr4RadSbgJzkFWB2PYTHGoOjQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695394017; x=1695998817;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7+pbIH7kh8kx6qkEOQ3aN7dv5sqdupBRAm9xcVdmE1Q=;
        b=PibPaXYlj5U2UuKaKrqNVQwcR1QTRDhrzAZg50bKiyU+o38AlP3HYhcBlV00P3MO0s
         pUxFwhBMUX1jmfWDmo3SR2GRJVZSKOiJ+zC2NoDDCg8qDGfjy6+xI9TWqoQg7Nx1wNs2
         yXxlsryqpt2t9ZFm+CWP+R1Gdf5nvU7he/6mcj7BcluBpUCstqa5P3aYLlZYt6sE9XZA
         kQ9fgNcZOvMcPN2B4k2hRK4LeY7HYp5v/iD+5FuvTIrhn8b1Mz8UerB4CL3eeVI/BeH0
         kH+TdKO+n2daz4JN5xC09XWQpqaCGo3GWlICOqcF5vLKyv4Yi9T399E1NzJYx2rnA5rF
         kMoQ==
X-Gm-Message-State: AOJu0YzUWmLy5zD7/lDo+r9p2Xpcv57R+rkzFjAnJqs0IV1crZ/VcrOM
	CIP4sPgbX4YnRTauGedKpa9xUZiPnuKNtWGX6P2YsXtBqxd+IUolzKY=
X-Google-Smtp-Source: AGHT+IH7X3jb+1HgLuw4J++w+LNEzcrYRbAzc8Wmyms5sHh4qYOJqBNqiUEZdJwvfvvKfRwOHGw61jh//VWsAeyULzc=
X-Received: by 2002:a2e:9919:0:b0:2b6:eb5a:d377 with SMTP id
 v25-20020a2e9919000000b002b6eb5ad377mr7763731lji.5.1695394016774; Fri, 22 Sep
 2023 07:46:56 -0700 (PDT)
MIME-Version: 1.0
References: <20230921122352.2307574-1-george.dunlap@cloud.com>
 <9456c563-dfbb-4592-a4cb-c11b75f1c27f@suse.com> <CA+zSX=aCyQg+R09_zw2EwcLCtMLOFCqQYejmP-aWXficZ-okdg@mail.gmail.com>
 <f82916a5-758a-d1e1-62d1-2fa890c5f99a@suse.com>
In-Reply-To: <f82916a5-758a-d1e1-62d1-2fa890c5f99a@suse.com>
From: George Dunlap <george.dunlap@cloud.com>
Date: Fri, 22 Sep 2023 15:46:45 +0100
Message-ID: <CA+zSX=YHugEE=hehyq_+SdfLVz+=9LSGyTo_R+XV0hO4TZAMgw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] credit: Limit load balancing to once per millisecond
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel@lists.xenproject.org, Dario Faggioli <dfaggioli@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, Juergen Gross <jgross@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 22, 2023 at 2:49=E2=80=AFPM Jan Beulich <jbeulich@suse.com> wro=
te:
>
> On 22.09.2023 14:20, George Dunlap wrote:
> > On Thu, Sep 21, 2023 at 2:12=E2=80=AFPM Juergen Gross <jgross@suse.com>=
 wrote:
> >>
> >> On 21.09.23 14:23, George Dunlap wrote:
> >>> The credit scheduler tries as hard as it can to ensure that it always
> >>> runs scheduling units with positive credit (PRI_TS_UNDER) before
> >>> running those with negative credit (PRI_TS_OVER).  If the next
> >>> runnable scheduling unit is of priority OVER, it will always run the
> >>> load balancer, which will scour the system looking for another
> >>> scheduling unit of the UNDER priority.
> >>>
> >>> Unfortunately, as the number of cores on a system has grown, the cost
> >>> of the work-stealing algorithm has dramatically increased; a recent
> >>> trace on a system with 128 cores showed this taking over 50
> >>> microseconds.
> >>>
> >>> Add a parameter, load_balance_ratelimit, to limit the frequency of
> >>> load balance operations on a given pcpu.  Default this to 1
> >>> millisecond.
> >>>
> >>> Invert the load balancing conditional to make it more clear, and line
> >>> up more closely with the comment above it.
> >>>
> >>> Overall it might be cleaner to have the last_load_balance checking
> >>> happen inside csched_load_balance(), but that would require either
> >>> passing both now and spc into the function, or looking them up again;
> >>> both of which seemed to be worse than simply checking and setting the
> >>> values before calling it.
> >>>
> >>> On a system with a vcpu:pcpu ratio of 2:1, running Windows guests
> >>> (which will end up calling YIELD during spinlock contention), this
> >>> patch increased performance significantly.
> >>>
> >>> Signed-off-by: George Dunlap <george.dunlap@cloud.com>
> >>> ---
> >>> Changes since v1:
> >>> - Fix editing mistake in commit message
> >>> - Improve documentation
> >>> - global var is __ro_after_init
> >>> - Remove sysctl, as it's not used.  Define max value in credit.c.
> >>> - Fix some style issues
> >>> - Move comment tweak to the right patch
> >>> - In the event that the commandline-parameter value is too high, clip
> >>>    to the maximum value rather than setting to the default.
> >>>
> >>> CC: Dario Faggioli <dfaggioli@suse.com>
> >>> CC: Andrew Cooper <andrew.cooper3@citrix.com>
> >>> CC: George Dunlap <george.dunlap@citrix.com>
> >>> CC: Jan Beulich <jbeulich@suse.com>
> >>> CC: Julien Grall <julien@xen.org>
> >>> CC: Stefano Stabellini <sstabellini@kernel.org>
> >>> CC: Wei Liu <wl@xen.org>
> >>> ---
> >>>   docs/misc/xen-command-line.pandoc |  8 ++++++
> >>>   xen/common/sched/credit.c         | 47 +++++++++++++++++++++++++---=
---
> >>>   2 files changed, 46 insertions(+), 9 deletions(-)
> >>>
> >>> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-comman=
d-line.pandoc
> >>> index f88e6a70ae..9c3c72a7f9 100644
> >>> --- a/docs/misc/xen-command-line.pandoc
> >>> +++ b/docs/misc/xen-command-line.pandoc
> >>> @@ -1884,6 +1884,14 @@ By default, Xen will use the INVPCID instructi=
on for TLB management if
> >>>   it is available.  This option can be used to cause Xen to fall back=
 to
> >>>   older mechanisms, which are generally slower.
> >>>
> >>> +### load-balance-ratelimit
> >>> +> `=3D <integer>`
> >>> +
> >>> +The minimum interval between load balancing events on a given pcpu, =
in
> >>> +microseconds.  A value of '0' will disable rate limiting.  Maximum
> >>> +value 1 second. At the moment only credit honors this parameter.
> >>> +Default 1ms.
> >>> +
> >>>   ### noirqbalance (x86)
> >>>   > `=3D <boolean>`
> >>>
> >>> diff --git a/xen/common/sched/credit.c b/xen/common/sched/credit.c
> >>> index f2cd3d9da3..5c06f596d2 100644
> >>> --- a/xen/common/sched/credit.c
> >>> +++ b/xen/common/sched/credit.c
> >>> @@ -50,6 +50,10 @@
> >>>   #define CSCHED_TICKS_PER_TSLICE     3
> >>>   /* Default timeslice: 30ms */
> >>>   #define CSCHED_DEFAULT_TSLICE_MS    30
> >>> +/* Default load balancing ratelimit: 1ms */
> >>> +#define CSCHED_DEFAULT_LOAD_BALANCE_RATELIMIT_US 1000
> >>> +/* Max load balancing ratelimit: 1s */
> >>> +#define CSCHED_MAX_LOAD_BALANCE_RATELIMIT_US     1000000
> >>>   #define CSCHED_CREDITS_PER_MSEC     10
> >>>   /* Never set a timer shorter than this value. */
> >>>   #define CSCHED_MIN_TIMER            XEN_SYSCTL_SCHED_RATELIMIT_MIN
> >>> @@ -153,6 +157,7 @@ struct csched_pcpu {
> >>>
> >>>       unsigned int idle_bias;
> >>>       unsigned int nr_runnable;
> >>> +    s_time_t last_load_balance;
> >>>
> >>>       unsigned int tick;
> >>>       struct timer ticker;
> >>> @@ -218,7 +223,7 @@ struct csched_private {
> >>>
> >>>       /* Period of master and tick in milliseconds */
> >>>       unsigned int tick_period_us, ticks_per_tslice;
> >>> -    s_time_t ratelimit, tslice, unit_migr_delay;
> >>> +    s_time_t ratelimit, tslice, unit_migr_delay, load_balance_rateli=
mit;
> >>>
> >>>       struct list_head active_sdom;
> >>>       uint32_t weight;
> >>> @@ -612,6 +617,8 @@ init_pdata(struct csched_private *prv, struct csc=
hed_pcpu *spc, int cpu)
> >>>       BUG_ON(!is_idle_unit(curr_on_cpu(cpu)));
> >>>       cpumask_set_cpu(cpu, prv->idlers);
> >>>       spc->nr_runnable =3D 0;
> >>> +
> >>> +    spc->last_load_balance =3D NOW();
> >>>   }
> >>>
> >>>   static void cf_check
> >>> @@ -1676,9 +1683,17 @@ csched_runq_steal(int peer_cpu, int cpu, int p=
ri, int balance_step)
> >>>       return NULL;
> >>>   }
> >>>
> >>> +/*
> >>> + * Minimum delay, in microseconds, between load balance operations.
> >>> + * This prevents spending too much time doing load balancing, partic=
ularly
> >>> + * when the system has a high number of YIELDs due to spinlock prior=
ity inversion.
> >>> + */
> >>> +static unsigned int __ro_after_init load_balance_ratelimit_us =3D CS=
CHED_DEFAULT_LOAD_BALANCE_RATELIMIT_US;
> >>> +integer_param("load-balance-ratelimit", load_balance_ratelimit_us);
> >>> +
> >>>   static struct csched_unit *
> >>>   csched_load_balance(struct csched_private *prv, int cpu,
> >>> -    struct csched_unit *snext, bool *stolen)
> >>> +                    struct csched_unit *snext, bool *stolen)
> >>>   {
> >>>       const struct cpupool *c =3D get_sched_res(cpu)->cpupool;
> >>>       struct csched_unit *speer;
> >>> @@ -1958,15 +1973,19 @@ static void cf_check csched_schedule(
> >>>           /*
> >>>            * SMP Load balance:
> >>>            *
> >>> -         * If the next highest priority local runnable UNIT has alre=
ady eaten
> >>> -         * through its credits, look on other PCPUs to see if we hav=
e more
> >>> -         * urgent work... If not, csched_load_balance() will return =
snext, but
> >>> -         * already removed from the runq.
> >>> +         * If the next highest priority local runnable UNIT has
> >>> +         * already eaten through its credits (and we're below the
> >>> +         * balancing ratelimit), look on other PCPUs to see if we ha=
ve
> >>> +         * more urgent work... If we don't, csched_load_balance() wi=
ll
> >>> +         * return snext, but already removed from the runq.
> >>>            */
> >>> -        if ( snext->pri > CSCHED_PRI_TS_OVER )
> >>> -            __runq_remove(snext);
> >>> -        else
> >>> +        if ( snext->pri <=3D CSCHED_PRI_TS_OVER
> >>> +             && now - spc->last_load_balance > prv->load_balance_rat=
elimit) {
> >>
> >> ^ Just found a style issue (after Andrew pointing out the ones in patc=
h 2).
> >
> > Just checking, you mean the space before the closing `)`?
>
> And the placement of the opening {.

Gah, sorry I missed that. :-( (Golang won't compile if the `{` isn't
on the same line.)

I guess I'll send a follow-up patch.

 -George

