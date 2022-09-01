Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 944155A9BC7
	for <lists+xen-devel@lfdr.de>; Thu,  1 Sep 2022 17:33:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.396782.637089 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTmCE-0005C0-Cw; Thu, 01 Sep 2022 15:33:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 396782.637089; Thu, 01 Sep 2022 15:33:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTmCE-00059A-A2; Thu, 01 Sep 2022 15:33:34 +0000
Received: by outflank-mailman (input) for mailman id 396782;
 Thu, 01 Sep 2022 15:33:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=86q5=ZE=google.com=surenb@srs-se1.protection.inumbo.net>)
 id 1oTmCD-000594-Ck
 for xen-devel@lists.xenproject.org; Thu, 01 Sep 2022 15:33:33 +0000
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [2607:f8b0:4864:20::b2c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6f2518da-2a0b-11ed-934f-f50d60e1c1bd;
 Thu, 01 Sep 2022 17:33:32 +0200 (CEST)
Received: by mail-yb1-xb2c.google.com with SMTP id t184so9125033yba.4
 for <xen-devel@lists.xenproject.org>; Thu, 01 Sep 2022 08:33:32 -0700 (PDT)
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
X-Inumbo-ID: 6f2518da-2a0b-11ed-934f-f50d60e1c1bd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=cuZ+nGX7dbAKHVSMzM9WDnRxW6f4Hrbmbun1Vl7XZUY=;
        b=nPy2aaUnPlKN9168rAezb9LSPcW4fo9+X5T3qYP77vPFcpzl+GhEzMZUxcz6J/8TiE
         IizY0PKy2tILVlboBx4hOHtK6o3BgdgdGqsyzqTvhnIsClaTwjg++DGXEdjbBPa8JR6s
         MIO2ZCktfdOzY88zke9nN4gcVwpbigx1IRCHgdE2F2Mq1597r9VFdc/4HIbMkV/CeG8x
         zsKr4C+BAyJ34f5F1Hb/vV3IvHxRb8IEQg4iOBO9diUXfW6M3nrOExLvEuVNGqzKErqg
         hzqElImWPPWWViyded2pBo3h+cgyvOivEpW732ttVGvmx+I0KmbeGYZvy64qW3Me0ncH
         pw1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=cuZ+nGX7dbAKHVSMzM9WDnRxW6f4Hrbmbun1Vl7XZUY=;
        b=cCH507uoVpiOaVv1wxBkBLErqClVaIPdoJRT72yjptjG8uuKrl+Jx+7RSlWXjBNEwY
         ZvBh/Cbk+PSsUnY71UjziNZo0Q2Q83NcuD+7/JFoYlgsDiz3l9JEMGmi9SAXcgITI5kb
         kw5y+QPbmXyrr3mn5yFuGhISAyzTcNBv1QjYHEEOODBJ9DzeFlzvAAQMlJ92GGrREdjD
         FAqPSHwpGBJrhwP3H3Yz2qPFIpUMjeITpVswlE4HO5rR9vd30MhqvzB19IMM6JPe8eE3
         X2hWp4XzGIvoiPFS8jw25BmCkgkx1w+oJhaGiYR31qgi9uvHqqoz9mCkceSn4nZ4BH8C
         6zvQ==
X-Gm-Message-State: ACgBeo1jxIzZMBjEZTTXNXo5yUi5DosB7xWQh39/EkzJleRluneg+DWL
	y51uKbC6Y2Qxo0+EymNuBKgjFLp4lYfBf+LAUEGHZQ==
X-Google-Smtp-Source: AA6agR7nkVcaAE7evofOhQO8CQyYLS6FGoseisRuE7p9aju3ICNx4/ZUVa/hlS8HLwBhdw8j7iOCWiWLZKuRzYzC+BI=
X-Received: by 2002:a05:6902:705:b0:695:b3b9:41bc with SMTP id
 k5-20020a056902070500b00695b3b941bcmr19699146ybt.426.1662046410779; Thu, 01
 Sep 2022 08:33:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220830214919.53220-1-surenb@google.com> <Yw8P8xZ4zqu121xL@hirez.programming.kicks-ass.net>
 <20220831084230.3ti3vitrzhzsu3fs@moria.home.lan> <20220831101948.f3etturccmp5ovkl@suse.de>
 <Yw88RFuBgc7yFYxA@dhcp22.suse.cz> <20220831190154.qdlsxfamans3ya5j@moria.home.lan>
 <YxBc1xuGbB36f8zC@dhcp22.suse.cz>
In-Reply-To: <YxBc1xuGbB36f8zC@dhcp22.suse.cz>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 1 Sep 2022 08:33:19 -0700
Message-ID: <CAJuCfpGhwPFYdkOLjwwD4ra9JxPqq1T5d1jd41Jy3LJnVnhNdg@mail.gmail.com>
Subject: Re: [RFC PATCH 00/30] Code tagging framework and applications
To: Michal Hocko <mhocko@suse.com>
Cc: Kent Overstreet <kent.overstreet@linux.dev>, Mel Gorman <mgorman@suse.de>, 
	Peter Zijlstra <peterz@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Vlastimil Babka <vbabka@suse.cz>, Johannes Weiner <hannes@cmpxchg.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Davidlohr Bueso <dave@stgolabs.net>, 
	Matthew Wilcox <willy@infradead.org>, "Liam R. Howlett" <liam.howlett@oracle.com>, 
	David Vernet <void@manifault.com>, Juri Lelli <juri.lelli@redhat.com>, 
	Laurent Dufour <ldufour@linux.ibm.com>, Peter Xu <peterx@redhat.com>, 
	David Hildenbrand <david@redhat.com>, Jens Axboe <axboe@kernel.dk>, mcgrof@kernel.org, 
	masahiroy@kernel.org, nathan@kernel.org, changbin.du@intel.com, 
	ytcoode@gmail.com, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Benjamin Segall <bsegall@google.com>, Daniel Bristot de Oliveira <bristot@redhat.com>, 
	Valentin Schneider <vschneid@redhat.com>, Christopher Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>, 
	Joonsoo Kim <iamjoonsoo.kim@lge.com>, 42.hyeyoo@gmail.com, 
	Alexander Potapenko <glider@google.com>, Marco Elver <elver@google.com>, dvyukov@google.com, 
	Shakeel Butt <shakeelb@google.com>, Muchun Song <songmuchun@bytedance.com>, arnd@arndb.de, 
	jbaron@akamai.com, David Rientjes <rientjes@google.com>, Minchan Kim <minchan@google.com>, 
	Kalesh Singh <kaleshsingh@google.com>, kernel-team <kernel-team@android.com>, 
	linux-mm <linux-mm@kvack.org>, iommu@lists.linux.dev, kasan-dev@googlegroups.com, 
	io-uring@vger.kernel.org, linux-arch@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org, 
	linux-modules@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 1, 2022 at 12:18 AM Michal Hocko <mhocko@suse.com> wrote:
>
> On Wed 31-08-22 15:01:54, Kent Overstreet wrote:
> > On Wed, Aug 31, 2022 at 12:47:32PM +0200, Michal Hocko wrote:
> > > On Wed 31-08-22 11:19:48, Mel Gorman wrote:
> > > > Whatever asking for an explanation as to why equivalent functionality
> > > > cannot not be created from ftrace/kprobe/eBPF/whatever is reasonable.
> > >
> > > Fully agreed and this is especially true for a change this size
> > > 77 files changed, 3406 insertions(+), 703 deletions(-)
> >
> > In the case of memory allocation accounting, you flat cannot do this with ftrace
> > - you could maybe do a janky version that isn't fully accurate, much slower,
> > more complicated for the developer to understand and debug and more complicated
> > for the end user.
> >
> > But please, I invite anyone who's actually been doing this with ftrace to
> > demonstrate otherwise.
> >
> > Ftrace just isn't the right tool for the job here - we're talking about adding
> > per callsite accounting to some of the fastest fast paths in the kernel.
> >
> > And the size of the changes for memory allocation accounting are much more
> > reasonable:
> >  33 files changed, 623 insertions(+), 99 deletions(-)
> >
> > The code tagging library should exist anyways, it's been open coded half a dozen
> > times in the kernel already.
> >
> > And once we've got that, the time stats code is _also_ far simpler than doing it
> > with ftrace would be. If anyone here has successfully debugged latency issues
> > with ftrace, I'd really like to hear it. Again, for debugging latency issues you
> > want something that can always be on, and that's not cheap with ftrace - and
> > never mind the hassle of correlating start and end wait trace events, builting
> > up histograms, etc. - that's all handled here.
> >
> > Cheap, simple, easy to use. What more could you want?
>
> A big ad on a banner. But more seriously.
>
> This patchset is _huge_ and touching a lot of different areas. It will
> be not only hard to review but even harder to maintain longterm. So
> it is completely reasonable to ask for potential alternatives with a
> smaller code footprint. I am pretty sure you are aware of that workflow.

The patchset is huge because it introduces a reusable part (the first
6 patches introducing code tagging) and 6 different applications in
very different areas of the kernel. We wanted to present all of them
in the RFC to show the variety of cases this mechanism can be reused
for. If the code tagging is accepted, each application can be posted
separately to the appropriate group of people. Hopefully that makes it
easier to review. Those first 6 patches are not that big and are quite
isolated IMHO:

 include/linux/codetag.h             |  83 ++++++++++
 include/linux/lazy-percpu-counter.h |  67 ++++++++
 include/linux/module.h              |   1 +
 kernel/module/internal.h            |   1 -
 kernel/module/main.c                |   4 +
 lib/Kconfig                         |   3 +
 lib/Kconfig.debug                   |   4 +
 lib/Makefile                        |   3 +
 lib/codetag.c                       | 248 ++++++++++++++++++++++++++++
 lib/lazy-percpu-counter.c           | 141 ++++++++++++++++
 lib/string_helpers.c                |   3 +-
 scripts/kallsyms.c                  |  13 ++

>
> So I find Peter's question completely appropriate while your response to
> that not so much! Maybe ftrace is not the right tool for the intented
> job. Maybe there are other ways and it would be really great to show
> that those have been evaluated and they are not suitable for a), b) and
> c) reasons.

That's fair.
For memory tracking I looked into using kmemleak and page_owner which
can't match the required functionality at an overhead acceptable for
production and pre-production testing environments. traces + BPF I
haven't evaluated myself but heard from other members of my team who
tried using that in production environment with poor results. I'll try
to get more specific information on that.

>
> E.g. Oscar has been working on extending page_ext to track number of
> allocations for specific calltrace[1]. Is this 1:1 replacement? No! But
> it can help in environments where page_ext can be enabled and it is
> completely non-intrusive to the MM code.

Thanks for pointing out this work. I'll need to review and maybe
profile it before making any claims.

>
> If the page_ext overhead is not desirable/acceptable then I am sure
> there are other options. E.g. kprobes/LivePatching framework can hook
> into functions and alter their behavior. So why not use that for data
> collection? Has this been evaluated at all?

I'm not sure how I can hook into say alloc_pages() to find out where
it was called from without capturing the call stack (which would
introduce an overhead at every allocation). Would love to discuss this
or other alternatives if they can be done with low enough overhead.
Thanks,
Suren.

>
> And please note that I am not claiming the presented work is approaching
> the problem from a wrong direction. It might very well solve multiple
> problems in a single go _but_ the long term code maintenance burden
> really has to to be carefully evaluated and if we can achieve a
> reasonable subset of the functionality with an existing infrastructure
> then I would be inclined to sacrifice some portions with a considerably
> smaller code footprint.
>
> [1] http://lkml.kernel.org/r/20220901044249.4624-1-osalvador@suse.de
>
> --
> Michal Hocko
> SUSE Labs

