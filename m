Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 887765AD8D0
	for <lists+xen-devel@lfdr.de>; Mon,  5 Sep 2022 20:07:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.399106.640158 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVGVY-00021Z-BZ; Mon, 05 Sep 2022 18:07:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 399106.640158; Mon, 05 Sep 2022 18:07:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVGVY-0001zQ-7T; Mon, 05 Sep 2022 18:07:40 +0000
Received: by outflank-mailman (input) for mailman id 399106;
 Mon, 05 Sep 2022 18:07:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=5Tfq=ZI=google.com=surenb@srs-se1.protection.inumbo.net>)
 id 1oVGVX-0001z4-7f
 for xen-devel@lists.xenproject.org; Mon, 05 Sep 2022 18:07:39 +0000
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [2607:f8b0:4864:20::d32])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9faea228-2d45-11ed-a016-b9edf5238543;
 Mon, 05 Sep 2022 20:07:38 +0200 (CEST)
Received: by mail-io1-xd32.google.com with SMTP id d68so7246698iof.11
 for <xen-devel@lists.xenproject.org>; Mon, 05 Sep 2022 11:07:38 -0700 (PDT)
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
X-Inumbo-ID: 9faea228-2d45-11ed-a016-b9edf5238543
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=Bum5cdqCm4gIf+I6AQy+wa1rXRQMNTd23PbVP2YAzEs=;
        b=P1Rb3fVwlXmtVf21S4DMQt260sMuniAXM5U5+atV+MhvCaumM2tXM3K6KXNyMSjZe0
         3nRcAmBfF+7W6/WOVR2XOADKxyQte4OnojdLmDBhMFh9NdRikO81nZDemeys0l200+Ya
         BtEOzumSQwgu7ZWm3QeSZrXIo15d7vuotOaip8lu87RHKwjf3TUmogDdVvisjKKDmHLO
         PI+YQ7orIzFlOARyvXxCAIGW+yY5UcwZ3NgJ+U4tIgdfF/EioIbKjubkaR07oZSndJ0y
         pThgMzg7BhFJemuG5SPivo5QOLrPUeLBb55vYf5zQYtWTw5SjAAGq1FqYgp+ZLnBdvd/
         Qr0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=Bum5cdqCm4gIf+I6AQy+wa1rXRQMNTd23PbVP2YAzEs=;
        b=3wyp9ZpnL+vgMFI47uuUlJNsUtlwPltnV0aqxhJ4SqFK2dluTU1cwLkMbumqE5kShj
         sMkGPvfqVPkTZMwb4DiwGF0IThUY/afGD2VYuXih5hwpGaN/ytw59k4Z4GeREK1ne89s
         fuTRWw2tO0ABREEqdOlDhGl7rVBVEYhU92luT+4nR2VQ4mEIRdZHMn4Gx23pIK2T+YJJ
         fQQg/MLYnw+5ASYMSvUg8JZb44Hb74yam0luwdxCz8fwqeRnf73pYDoHif/vbIsfICrR
         Hb4NeKihf354PcSgaI57vPu9Vz0ESdaLg5N5sWH+Qi35ViDkvwqIsEF85GNxXsdWH4Ru
         PMzQ==
X-Gm-Message-State: ACgBeo2kPe2BWo79yJN3dN4HGuxmeIscXndye4FGMoZL42Wa1fZqv4WC
	Bykcw38wrdZNzQX7E7Ibfv5p0V5E3d30wadUV9LBEQ==
X-Google-Smtp-Source: AA6agR6r5XgehoMYjBLme4+OWXroqyk9NqBwquoUHJYNtZV3MpkU67zLpVv3eXPms5QzjDOiUeZjqJqeUZuYSAeGarw=
X-Received: by 2002:a05:6638:1492:b0:34c:d42:ac2f with SMTP id
 j18-20020a056638149200b0034c0d42ac2fmr13910620jak.305.1662401256621; Mon, 05
 Sep 2022 11:07:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220830214919.53220-1-surenb@google.com> <Yw8P8xZ4zqu121xL@hirez.programming.kicks-ass.net>
 <20220831084230.3ti3vitrzhzsu3fs@moria.home.lan> <20220831101948.f3etturccmp5ovkl@suse.de>
 <Yw88RFuBgc7yFYxA@dhcp22.suse.cz> <20220831190154.qdlsxfamans3ya5j@moria.home.lan>
 <YxBc1xuGbB36f8zC@dhcp22.suse.cz> <CAJuCfpGhwPFYdkOLjwwD4ra9JxPqq1T5d1jd41Jy3LJnVnhNdg@mail.gmail.com>
 <YxEE1vOwRPdzKxoq@dhcp22.suse.cz> <CAJuCfpFrRwXXQ=wAvZ-oUNKXUJ=uUA=fiDrkhRu5VGXcM+=cuA@mail.gmail.com>
 <YxWvbMYLkPoJrQyr@dhcp22.suse.cz> <CANpmjNOYNWSSiV+VzvzBAeDJX+c1DRP+6jedKMt3gLNg8bgWKA@mail.gmail.com>
In-Reply-To: <CANpmjNOYNWSSiV+VzvzBAeDJX+c1DRP+6jedKMt3gLNg8bgWKA@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 5 Sep 2022 11:07:25 -0700
Message-ID: <CAJuCfpF4Meeo5b=ZTGe+YDCd9-jJ+WUazpJzaq7stOu2=1oP9Q@mail.gmail.com>
Subject: Re: [RFC PATCH 00/30] Code tagging framework and applications
To: Marco Elver <elver@google.com>
Cc: Michal Hocko <mhocko@suse.com>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Mel Gorman <mgorman@suse.de>, Peter Zijlstra <peterz@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>, 
	Johannes Weiner <hannes@cmpxchg.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Davidlohr Bueso <dave@stgolabs.net>, Matthew Wilcox <willy@infradead.org>, 
	"Liam R. Howlett" <liam.howlett@oracle.com>, David Vernet <void@manifault.com>, 
	Juri Lelli <juri.lelli@redhat.com>, Laurent Dufour <ldufour@linux.ibm.com>, 
	Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>, Jens Axboe <axboe@kernel.dk>, 
	mcgrof@kernel.org, masahiroy@kernel.org, nathan@kernel.org, 
	changbin.du@intel.com, ytcoode@gmail.com, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Benjamin Segall <bsegall@google.com>, 
	Daniel Bristot de Oliveira <bristot@redhat.com>, Valentin Schneider <vschneid@redhat.com>, 
	Christopher Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, 
	42.hyeyoo@gmail.com, Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Shakeel Butt <shakeelb@google.com>, Muchun Song <songmuchun@bytedance.com>, arnd@arndb.de, 
	jbaron@akamai.com, David Rientjes <rientjes@google.com>, Minchan Kim <minchan@google.com>, 
	Kalesh Singh <kaleshsingh@google.com>, kernel-team <kernel-team@android.com>, 
	linux-mm <linux-mm@kvack.org>, iommu@lists.linux.dev, kasan-dev@googlegroups.com, 
	io-uring@vger.kernel.org, linux-arch@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org, 
	linux-modules@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Sep 5, 2022 at 1:58 AM Marco Elver <elver@google.com> wrote:
>
> On Mon, 5 Sept 2022 at 10:12, Michal Hocko <mhocko@suse.com> wrote:
> > On Sun 04-09-22 18:32:58, Suren Baghdasaryan wrote:
> > > On Thu, Sep 1, 2022 at 12:15 PM Michal Hocko <mhocko@suse.com> wrote:
> > [...]
> > > > Yes, tracking back the call trace would be really needed. The question
> > > > is whether this is really prohibitively expensive. How much overhead are
> > > > we talking about? There is no free lunch here, really.  You either have
> > > > the overhead during runtime when the feature is used or on the source
> > > > code level for all the future development (with a maze of macros and
> > > > wrappers).
> > >
> > > As promised, I profiled a simple code that repeatedly makes 10
> > > allocations/frees in a loop and measured overheads of code tagging,
> > > call stack capturing and tracing+BPF for page and slab allocations.
> > > Summary:
> > >
> > > Page allocations (overheads are compared to get_free_pages() duration):
> > > 6.8% Codetag counter manipulations (__lazy_percpu_counter_add + __alloc_tag_add)
> > > 8.8% lookup_page_ext
> > > 1237% call stack capture
> > > 139% tracepoint with attached empty BPF program
> >
> > Yes, I am not surprised that the call stack capturing is really
> > expensive comparing to the allocator fast path (which is really highly
> > optimized and I suspect that with 10 allocation/free loop you mostly get
> > your memory from the pcp lists). Is this overhead still _that_ visible
> > for somehow less microoptimized workloads which have to take slow paths
> > as well?
> >
> > Also what kind of stack unwinder is configured (I guess ORC)? This is
> > not my area but from what I remember the unwinder overhead varies
> > between ORC and FP.
> >
> > And just to make it clear. I do realize that an overhead from the stack
> > unwinding is unavoidable. And code tagging would logically have lower
> > overhead as it performs much less work. But the main point is whether
> > our existing stack unwiding approach is really prohibitively expensive
> > to be used for debugging purposes on production systems. I might
> > misremember but I recall people having bigger concerns with page_owner
> > memory footprint than the actual stack unwinder overhead.
>
> This is just to point out that we've also been looking at cheaper
> collection of the stack trace (for KASAN and other sanitizers). The
> cheapest way to unwind the stack would be a system with "shadow call
> stack" enabled. With compiler support it's available on arm64, see
> CONFIG_SHADOW_CALL_STACK. For x86 the hope is that at one point the
> kernel will support CET, which newer Intel and AMD CPUs support.
> Collecting the call stack would then be a simple memcpy.

Thanks for the note Marco! I'll check out the CONFIG_SHADOW_CALL_STACK
on Android.

