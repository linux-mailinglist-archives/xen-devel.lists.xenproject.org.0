Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3585A9BE0
	for <lists+xen-devel@lfdr.de>; Thu,  1 Sep 2022 17:40:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.396798.637114 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTmIV-0006nk-Go; Thu, 01 Sep 2022 15:40:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 396798.637114; Thu, 01 Sep 2022 15:40:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTmIV-0006kS-D2; Thu, 01 Sep 2022 15:40:03 +0000
Received: by outflank-mailman (input) for mailman id 396798;
 Thu, 01 Sep 2022 15:40:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=86q5=ZE=google.com=surenb@srs-se1.protection.inumbo.net>)
 id 1oTmIU-0006Y1-2f
 for xen-devel@lists.xenproject.org; Thu, 01 Sep 2022 15:40:02 +0000
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com
 [2607:f8b0:4864:20::b35])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 56c71e21-2a0c-11ed-82f2-63bd783d45fa;
 Thu, 01 Sep 2022 17:40:01 +0200 (CEST)
Received: by mail-yb1-xb35.google.com with SMTP id 130so9146650ybw.8
 for <xen-devel@lists.xenproject.org>; Thu, 01 Sep 2022 08:40:00 -0700 (PDT)
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
X-Inumbo-ID: 56c71e21-2a0c-11ed-82f2-63bd783d45fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=3cE853tliEpPWpHjkdjBsm55bguibJ1NOZ2l+ytqvIs=;
        b=CNR1NtmysqZN43aw5siPQxQB15yoyKxn0UtAt1eFrCVSTrqVXrck0MJQ5rF0EE8Iqy
         FECYDZNtaf4xFqIfRFeGfncBEzgsXCtgfPFQ9NnPdVRFkAf7PTRy+isa8Q/3u9s63jFF
         Bkv08GJGttRtk8ihR4u9G9sfgOvnbQBOURRSewgh7NzkPEQgVbW8k9NY5ToRU0fk16sO
         KDQeEwKDvn2AZgblfu2tmDll7zNnUGlKeUzAPAS8k31d+CGKhmmtzNe2LpeGY2e9A3T2
         OyHR4dbvshaM9SSwkyP8U36LLaknoM2MMTtTCDpp5f48zXa2ecNcsCYbrEUZ3+gtqLOE
         C5XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=3cE853tliEpPWpHjkdjBsm55bguibJ1NOZ2l+ytqvIs=;
        b=vMFBFQ9gaUDuAiOK6XxdMiUg+fSEUI34GgK0Re70nYnkYJbAXte5DdiW3AbqGaHD1E
         RUPDTd1a6F7c/hvxCHJQlTead4MajdAmiqekUEBnTgJuvRh60Q3mQT0AQNxnPrJegHcv
         NBULDWW78/w9s27bakyQst/yrp2pGxPk2abHXPSk1HCFHi7XL1W9x/FgtYl9Ifr4KWPg
         nvLE1EhJ+jjJMgWHxU1Q6Ot/NFxWkJiVWFpOsr+acyN9ClGtD/+/2Cw6vX0fIa0ZTF9O
         MhwnmpVyFLTr0252Cf/WNrtUEgg7LgsAJiXcoJi6qQ97DAzkFhdYy99ygJon87iMGOK2
         EnMg==
X-Gm-Message-State: ACgBeo3Fzx9Vu7HsPy5gNv+3oF3S1ML6830fVqL4bY+fHAkgzWhKegch
	9wYA/fIePfNneLMOai9dqCcYMhw9fpjtoIQ0/Oui+w==
X-Google-Smtp-Source: AA6agR5aFHV5oWy3bOo2eVd0PIajtlCyUMrAF/y9Oh7oqrhvwnrJM9jnSE6k3ZmfRfh8uK89oJZlft1zkj3aGLobpWw=
X-Received: by 2002:a25:b983:0:b0:695:d8b4:a5a3 with SMTP id
 r3-20020a25b983000000b00695d8b4a5a3mr20405655ybg.553.1662046799565; Thu, 01
 Sep 2022 08:39:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220830214919.53220-1-surenb@google.com> <Yw8P8xZ4zqu121xL@hirez.programming.kicks-ass.net>
 <20220831084230.3ti3vitrzhzsu3fs@moria.home.lan> <20220831101948.f3etturccmp5ovkl@suse.de>
 <Yw88RFuBgc7yFYxA@dhcp22.suse.cz> <20220831190154.qdlsxfamans3ya5j@moria.home.lan>
 <404e947a-e1b2-0fae-8b4f-6f2e3ba6328d@redhat.com> <20220901142345.agkfp2d5lijdp6pt@moria.home.lan>
 <78e55029-0eaf-b4b3-7e86-1086b97c60c6@redhat.com>
In-Reply-To: <78e55029-0eaf-b4b3-7e86-1086b97c60c6@redhat.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 1 Sep 2022 08:39:48 -0700
Message-ID: <CAJuCfpEgWx4mmiSCvcMOF0+Luyw1w-hVyLV-cvhbxnwsN6qg0g@mail.gmail.com>
Subject: Re: [RFC PATCH 00/30] Code tagging framework and applications
To: David Hildenbrand <david@redhat.com>
Cc: Kent Overstreet <kent.overstreet@linux.dev>, Michal Hocko <mhocko@suse.com>, 
	Mel Gorman <mgorman@suse.de>, Peter Zijlstra <peterz@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>, 
	Johannes Weiner <hannes@cmpxchg.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Davidlohr Bueso <dave@stgolabs.net>, Matthew Wilcox <willy@infradead.org>, 
	"Liam R. Howlett" <liam.howlett@oracle.com>, David Vernet <void@manifault.com>, 
	Juri Lelli <juri.lelli@redhat.com>, Laurent Dufour <ldufour@linux.ibm.com>, 
	Peter Xu <peterx@redhat.com>, Jens Axboe <axboe@kernel.dk>, mcgrof@kernel.org, 
	masahiroy@kernel.org, nathan@kernel.org, changbin.du@intel.com, 
	ytcoode@gmail.com, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Benjamin Segall <bsegall@google.com>, Daniel Bristot de Oliveira <bristot@redhat.com>, 
	Valentin Schneider <vschneid@redhat.com>, Christopher Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>, 
	Joonsoo Kim <iamjoonsoo.kim@lge.com>, 42.hyeyoo@gmail.com, 
	Alexander Potapenko <glider@google.com>, Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Shakeel Butt <shakeelb@google.com>, Muchun Song <songmuchun@bytedance.com>, arnd@arndb.de, 
	jbaron@akamai.com, David Rientjes <rientjes@google.com>, Minchan Kim <minchan@google.com>, 
	Kalesh Singh <kaleshsingh@google.com>, kernel-team <kernel-team@android.com>, 
	linux-mm <linux-mm@kvack.org>, iommu@lists.linux.dev, kasan-dev@googlegroups.com, 
	io-uring@vger.kernel.org, linux-arch@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org, 
	linux-modules@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 1, 2022 at 8:07 AM David Hildenbrand <david@redhat.com> wrote:
>
> On 01.09.22 16:23, Kent Overstreet wrote:
> > On Thu, Sep 01, 2022 at 10:05:03AM +0200, David Hildenbrand wrote:
> >> On 31.08.22 21:01, Kent Overstreet wrote:
> >>> On Wed, Aug 31, 2022 at 12:47:32PM +0200, Michal Hocko wrote:
> >>>> On Wed 31-08-22 11:19:48, Mel Gorman wrote:
> >>>>> Whatever asking for an explanation as to why equivalent functionality
> >>>>> cannot not be created from ftrace/kprobe/eBPF/whatever is reasonable.
> >>>>
> >>>> Fully agreed and this is especially true for a change this size
> >>>> 77 files changed, 3406 insertions(+), 703 deletions(-)
> >>>
> >>> In the case of memory allocation accounting, you flat cannot do this with ftrace
> >>> - you could maybe do a janky version that isn't fully accurate, much slower,
> >>> more complicated for the developer to understand and debug and more complicated
> >>> for the end user.
> >>>
> >>> But please, I invite anyone who's actually been doing this with ftrace to
> >>> demonstrate otherwise.
> >>>
> >>> Ftrace just isn't the right tool for the job here - we're talking about adding
> >>> per callsite accounting to some of the fastest fast paths in the kernel.
> >>>
> >>> And the size of the changes for memory allocation accounting are much more
> >>> reasonable:
> >>>  33 files changed, 623 insertions(+), 99 deletions(-)
> >>>
> >>> The code tagging library should exist anyways, it's been open coded half a dozen
> >>> times in the kernel already.
> >>
> >> Hi Kent,
> >>
> >> independent of the other discussions, if it's open coded already, does
> >> it make sense to factor that already-open-coded part out independently
> >> of the remainder of the full series here?
> >
> > It's discussed in the cover letter, that is exactly how the patch series is
> > structured.
>
> Skimming over the patches (that I was CCed on) and skimming over the
> cover letter, I got the impression that everything after patch 7 is
> introducing something new instead of refactoring something out.

Hi David,
Yes, you are right, the RFC does incorporate lots of parts which can
be considered separately. They are sent together to present the
overall scope of the proposal but I do intend to send them separately
once we decide if it's worth working on.
Thanks,
Suren.

>
> >
> >> [I didn't immediately spot if this series also attempts already to
> >> replace that open-coded part]
> >
> > Uh huh.
> >
> > Honestly, some days it feels like lkml is just as bad as slashdot, with people
> > wanting to get in their two cents without actually reading...
>
> ... and of course you had to reply like that. I should just have learned
> from my last upstream experience with you and kept you on my spam list.
>
> Thanks, bye
>
> --
> Thanks,
>
> David / dhildenb
>

