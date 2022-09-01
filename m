Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DF2CD5AA3D0
	for <lists+xen-devel@lfdr.de>; Fri,  2 Sep 2022 01:37:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.397058.637506 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTtjk-0002aS-45; Thu, 01 Sep 2022 23:36:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 397058.637506; Thu, 01 Sep 2022 23:36:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTtjk-0002Y3-0l; Thu, 01 Sep 2022 23:36:40 +0000
Received: by outflank-mailman (input) for mailman id 397058;
 Thu, 01 Sep 2022 23:36:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=86q5=ZE=google.com=surenb@srs-se1.protection.inumbo.net>)
 id 1oTtji-0002Xw-3b
 for xen-devel@lists.xenproject.org; Thu, 01 Sep 2022 23:36:38 +0000
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com
 [2607:f8b0:4864:20::1132])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id eb04535c-2a4e-11ed-934f-f50d60e1c1bd;
 Fri, 02 Sep 2022 01:36:36 +0200 (CEST)
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-324ec5a9e97so2217047b3.7
 for <xen-devel@lists.xenproject.org>; Thu, 01 Sep 2022 16:36:36 -0700 (PDT)
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
X-Inumbo-ID: eb04535c-2a4e-11ed-934f-f50d60e1c1bd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=5pc1SgOf8Owl6sShRuirH1QWrWtPdJIgt3qepozMpkE=;
        b=QPtBN+jZZjR+fJQ+f+TgwZFy47TE1rR8gr1i8rB6mNu2nigO0JdCAAjMoUMaOVDYnd
         PiHulcKqQEwjGxjDADddZzXOUg5TYr/Y37FY0mLnlnZh9oqDpuWtb21NiE8K+MvKfMRy
         5X2JycO4tSVca0qzV4Yx+TBoNNmpSKbKbCfgMYwA7K5CFp+VszB2v0xi3C2mZ4ZpAFpk
         VGoNBkpcZXTh7tuDysjYq/uSfLBayYSiQwhTFjGtzTF3WK2rRSdy71A7E9l9S18szgn+
         hw0Qy3jClG1SDJCQ3AEQ+kyF5TgjSC7WKM1l7PFAPgZmXyevNIAyCBELnZOO/Zt3zo42
         CuWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=5pc1SgOf8Owl6sShRuirH1QWrWtPdJIgt3qepozMpkE=;
        b=VzpD6SE0V1cKzN/ZS4PXXZLneBowbWeynVwYyVWmwBt3Oli2XBpUCr8Sx2xbC/4zA2
         s/2fCVGtG452EjL5Rv5DdrrfHddF/nE3H99P1En/TzYKzCG4bMb1plF66Vq0Su6dT17U
         kogypXdftq1FSXK1IfaMGK1b6hari6uXtP+fX9PBRRdtxMfCKSqUCLF9Pxv+D5fiTSzg
         82pY6gbFRfa2Tbu0AeKwKFmTW3rrIKz4klPfbmyjjHHKkfZ/c76z60JxEuZy48lVH9zd
         npmuT3lp7Qw/Ae5DJJRQotCuRPDSrgYwC9wiGveOljSWvOU6VrmRHK4uPnH/ZGOyqcP/
         uHjA==
X-Gm-Message-State: ACgBeo3Wg5xt7mzCN3w5gVTDwwKbzb4Z1vkNicZmryqJl5YKdoTm4+y/
	Kp1D2SczYoLlYeeALNl97HYzrh/PbojThLfPMPVkog==
X-Google-Smtp-Source: AA6agR6KXscPx8LI6183+UcafzSZSBU2Me59d4tUPUgAjsDK3Cl3Xie4I9qREIbKygjbUBWHlz0pZa86okKUwdzJLtw=
X-Received: by 2002:a0d:c981:0:b0:330:dc03:7387 with SMTP id
 l123-20020a0dc981000000b00330dc037387mr25216063ywd.380.1662075395130; Thu, 01
 Sep 2022 16:36:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220830214919.53220-1-surenb@google.com> <Yw8P8xZ4zqu121xL@hirez.programming.kicks-ass.net>
 <20220831084230.3ti3vitrzhzsu3fs@moria.home.lan> <20220831101948.f3etturccmp5ovkl@suse.de>
 <Yw88RFuBgc7yFYxA@dhcp22.suse.cz> <20220831190154.qdlsxfamans3ya5j@moria.home.lan>
 <CAJD7tkaev9B=UDYj2RL6pz-1454J8tv4gEr9y-2dnCksoLK0bw@mail.gmail.com>
 <YxExz+c1k3nbQMh4@P9FQF9L96D.corp.robot.car> <20220901223720.e4gudprscjtwltif@moria.home.lan>
 <YxE4BXw5i+BkxxD8@P9FQF9L96D.corp.robot.car>
In-Reply-To: <YxE4BXw5i+BkxxD8@P9FQF9L96D.corp.robot.car>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 1 Sep 2022 16:36:23 -0700
Message-ID: <CAJuCfpF=67THWzoE+TGW_VbBHMRvuC5BVVGnkLPmKtG3ZuS2Jw@mail.gmail.com>
Subject: Re: [RFC PATCH 00/30] Code tagging framework and applications
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: Kent Overstreet <kent.overstreet@linux.dev>, Yosry Ahmed <yosryahmed@google.com>, 
	Michal Hocko <mhocko@suse.com>, Mel Gorman <mgorman@suse.de>, Peter Zijlstra <peterz@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>, 
	Johannes Weiner <hannes@cmpxchg.org>, Davidlohr Bueso <dave@stgolabs.net>, 
	Matthew Wilcox <willy@infradead.org>, "Liam R. Howlett" <liam.howlett@oracle.com>, 
	David Vernet <void@manifault.com>, Juri Lelli <juri.lelli@redhat.com>, 
	Laurent Dufour <ldufour@linux.ibm.com>, Peter Xu <peterx@redhat.com>, 
	David Hildenbrand <david@redhat.com>, Jens Axboe <axboe@kernel.dk>, mcgrof@kernel.org, 
	masahiroy@kernel.org, nathan@kernel.org, changbin.du@intel.com, 
	ytcoode@gmail.com, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Benjamin Segall <bsegall@google.com>, Daniel Bristot de Oliveira <bristot@redhat.com>, 
	Valentin Schneider <vschneid@redhat.com>, Christoph Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>, 
	Joonsoo Kim <iamjoonsoo.kim@lge.com>, 42.hyeyoo@gmail.com, 
	Alexander Potapenko <glider@google.com>, Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Shakeel Butt <shakeelb@google.com>, Muchun Song <songmuchun@bytedance.com>, arnd@arndb.de, 
	jbaron@akamai.com, David Rientjes <rientjes@google.com>, Minchan Kim <minchan@google.com>, 
	Kalesh Singh <kaleshsingh@google.com>, kernel-team <kernel-team@android.com>, 
	Linux-MM <linux-mm@kvack.org>, iommu@lists.linux.dev, kasan-dev@googlegroups.com, 
	io-uring@vger.kernel.org, linux-arch@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org, 
	linux-modules@vger.kernel.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 1, 2022 at 3:54 PM Roman Gushchin <roman.gushchin@linux.dev> wrote:
>
> On Thu, Sep 01, 2022 at 06:37:20PM -0400, Kent Overstreet wrote:
> > On Thu, Sep 01, 2022 at 03:27:27PM -0700, Roman Gushchin wrote:
> > > On Wed, Aug 31, 2022 at 01:56:08PM -0700, Yosry Ahmed wrote:
> > > > This is very interesting work! Do you have any data about the overhead
> > > > this introduces, especially in a production environment? I am
> > > > especially interested in memory allocations tracking and detecting
> > > > leaks.
> > >
> > > +1
> > >
> > > I think the question whether it indeed can be always turned on in the production
> > > or not is the main one. If not, the advantage over ftrace/bpf/... is not that
> > > obvious. Otherwise it will be indeed a VERY useful thing.
> >
> > Low enough overhead to run in production was my primary design goal.
> >
> > Stats are kept in a struct that's defined at the callsite. So this adds _no_
> > pointer chasing to the allocation path, unless we've switch to percpu counters
> > at that callsite (see the lazy percpu counters patch), where we need to deref
> > one percpu pointer to save an atomic.
> >
> > Then we need to stash a pointer to the alloc_tag, so that kfree() can find it.
> > For slab allocations this uses the same storage area as memcg, so for
> > allocations that are using that we won't be touching any additional cachelines.
> > (I wanted the pointer to the alloc_tag to be stored inline with the allocation,
> > but that would've caused alignment difficulties).
> >
> > Then there's a pointer deref introduced to the kfree() path, to get back to the
> > original alloc_tag and subtract the allocation from that callsite. That one
> > won't be free, and with percpu counters we've got another dependent load too -
> > hmm, it might be worth benchmarking with just atomics, skipping the percpu
> > counters.
> >
> > So the overhead won't be zero, I expect it'll show up in some synthetic
> > benchmarks, but yes I do definitely expect this to be worth enabling in
> > production in many scenarios.
>
> I'm somewhat sceptical, but I usually am. And in this case I'll be really happy
> to be wrong.
>
> On a bright side, maybe most of the overhead will come from few allocations,
> so an option to explicitly exclude them will do the trick.
>
> I'd suggest to run something like iperf on a fast hardware. And maybe some
> io_uring stuff too. These are two places which were historically most sensitive
> to the (kernel) memory accounting speed.

Thanks for the suggestions, Roman. I'll see how I can get this done.
I'll have to find someone with access to fast hardware (Android is not
great for that) and backporting the patchset to the supported kernel
version. Will do my best.
Thanks,
Suren.

>
> Thanks!
>
> --
> To unsubscribe from this group and stop receiving emails from it, send an email to kernel-team+unsubscribe@android.com.
>

