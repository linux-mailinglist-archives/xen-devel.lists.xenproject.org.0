Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3B05A8D2C
	for <lists+xen-devel@lfdr.de>; Thu,  1 Sep 2022 07:13:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.396054.636270 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTcVY-0005dP-GP; Thu, 01 Sep 2022 05:12:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 396054.636270; Thu, 01 Sep 2022 05:12:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTcVY-0005aw-Dc; Thu, 01 Sep 2022 05:12:52 +0000
Received: by outflank-mailman (input) for mailman id 396054;
 Wed, 31 Aug 2022 20:56:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JTfR=ZD=google.com=yosryahmed@srs-se1.protection.inumbo.net>)
 id 1oTUlT-00084y-Ds
 for xen-devel@lists.xenproject.org; Wed, 31 Aug 2022 20:56:47 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c537492-296f-11ed-934f-f50d60e1c1bd;
 Wed, 31 Aug 2022 22:56:45 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id v16so17066498wrm.8
 for <xen-devel@lists.xenproject.org>; Wed, 31 Aug 2022 13:56:45 -0700 (PDT)
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
X-Inumbo-ID: 6c537492-296f-11ed-934f-f50d60e1c1bd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=Q+TlttOrTWNB3q3o6Zbb04N1wsFemMMzZbBDHk1hdbY=;
        b=VyP3SbNsuyxc5blP2FoCVyjA1CBQu5fk1qPBiWwHnsN7KbhALhPVRs+hdxfauKkrjN
         HjpFIvR9qflpc5b/NaZbUp4Qe+yoyJx8jmIG71feNwOicipxd4Z45zOK95SSSmFlFqg1
         JlDxmSa+dos6d565oincRG6QsILc3r0lbpSqflqmVfv9TWNY+mQW2VINkINO6wGxloda
         V9BbsnXdjx9TWnVhm9AxW/SNuwlNLiahxr1xh25VEX0zm/Rv6sxPCVqP3nUxZGj48fmq
         8freUAXARJQoL1m1MzSBuxjvucYwjbHks6tBHAAViJ2OqT1E6YeDUp+dfTHOL3fNg2CJ
         OS0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=Q+TlttOrTWNB3q3o6Zbb04N1wsFemMMzZbBDHk1hdbY=;
        b=aScYRrzKjXmnMKh3KqntjY+w/zKnEICIEmuX+ZDreBJODWvZsgpP/X1wGrrvpS3ern
         EP+RXJsb1AXquHrAT/wkxMSGhmwQhElJyoFKXT2446pxmjJvYmMYInFoH7qJawXWxR8p
         hSp/TFHtgimDTPKj11DYUpcT+qWnxlNhq40kW95JJ9jYSuNTYb6uqiFL8ESNGbEd25rO
         SbCJNUaD/lF1LrAuwGkCMomTFE10YXuNMYlwCsk/ex0/e3D7r8Np2ijVIkuc1L8gnpqD
         nqzY2oTmfqlBDHne5EdFq7rmR5okMBODp2HIyXPjsewUgv1A+SeTbsQiCWNrh4tVtbsZ
         LFMQ==
X-Gm-Message-State: ACgBeo1mpR/u7wKJk2zrHSalIzx7eug65q/RbIsnAoR0UyMqjGth3AhW
	X/wnR9loyOYP0GuQTKjKi9UxMz+rTfay9rEBhQcecA==
X-Google-Smtp-Source: AA6agR7XK78VXHUjktIpBA+ayr5Wvv6QyZC54NZbTQlygRhYLtBkkgViGprvNovg9YVhzd6mrhctznnyhI9ADAmQ4D4=
X-Received: by 2002:a05:6000:1188:b0:220:6c20:fbf6 with SMTP id
 g8-20020a056000118800b002206c20fbf6mr13193874wrx.372.1661979404912; Wed, 31
 Aug 2022 13:56:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220830214919.53220-1-surenb@google.com> <Yw8P8xZ4zqu121xL@hirez.programming.kicks-ass.net>
 <20220831084230.3ti3vitrzhzsu3fs@moria.home.lan> <20220831101948.f3etturccmp5ovkl@suse.de>
 <Yw88RFuBgc7yFYxA@dhcp22.suse.cz> <20220831190154.qdlsxfamans3ya5j@moria.home.lan>
In-Reply-To: <20220831190154.qdlsxfamans3ya5j@moria.home.lan>
From: Yosry Ahmed <yosryahmed@google.com>
Date: Wed, 31 Aug 2022 13:56:08 -0700
Message-ID: <CAJD7tkaev9B=UDYj2RL6pz-1454J8tv4gEr9y-2dnCksoLK0bw@mail.gmail.com>
Subject: Re: [RFC PATCH 00/30] Code tagging framework and applications
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Michal Hocko <mhocko@suse.com>, Mel Gorman <mgorman@suse.de>, 
	Peter Zijlstra <peterz@infradead.org>, Suren Baghdasaryan <surenb@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@suse.cz>, 
	Johannes Weiner <hannes@cmpxchg.org>, Roman Gushchin <roman.gushchin@linux.dev>, dave@stgolabs.net, 
	Matthew Wilcox <willy@infradead.org>, liam.howlett@oracle.com, void@manifault.com, 
	juri.lelli@redhat.com, ldufour@linux.ibm.com, Peter Xu <peterx@redhat.com>, 
	David Hildenbrand <david@redhat.com>, axboe@kernel.dk, mcgrof@kernel.org, masahiroy@kernel.org, 
	nathan@kernel.org, changbin.du@intel.com, ytcoode@gmail.com, 
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com, 
	Steven Rostedt <rostedt@goodmis.org>, bsegall@google.com, bristot@redhat.com, 
	vschneid@redhat.com, Christoph Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>, 
	Joonsoo Kim <iamjoonsoo.kim@lge.com>, 42.hyeyoo@gmail.com, glider@google.com, 
	elver@google.com, dvyukov@google.com, Shakeel Butt <shakeelb@google.com>, 
	Muchun Song <songmuchun@bytedance.com>, arnd@arndb.de, jbaron@akamai.com, 
	David Rientjes <rientjes@google.com>, minchan@google.com, kaleshsingh@google.com, 
	kernel-team@android.com, Linux-MM <linux-mm@kvack.org>, iommu@lists.linux.dev, 
	kasan-dev@googlegroups.com, io-uring@vger.kernel.org, 
	linux-arch@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-bcache@vger.kernel.org, linux-modules@vger.kernel.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 31, 2022 at 12:02 PM Kent Overstreet
<kent.overstreet@linux.dev> wrote:
>
> On Wed, Aug 31, 2022 at 12:47:32PM +0200, Michal Hocko wrote:
> > On Wed 31-08-22 11:19:48, Mel Gorman wrote:
> > > Whatever asking for an explanation as to why equivalent functionality
> > > cannot not be created from ftrace/kprobe/eBPF/whatever is reasonable.
> >
> > Fully agreed and this is especially true for a change this size
> > 77 files changed, 3406 insertions(+), 703 deletions(-)
>
> In the case of memory allocation accounting, you flat cannot do this with ftrace
> - you could maybe do a janky version that isn't fully accurate, much slower,
> more complicated for the developer to understand and debug and more complicated
> for the end user.
>
> But please, I invite anyone who's actually been doing this with ftrace to
> demonstrate otherwise.
>
> Ftrace just isn't the right tool for the job here - we're talking about adding
> per callsite accounting to some of the fastest fast paths in the kernel.
>
> And the size of the changes for memory allocation accounting are much more
> reasonable:
>  33 files changed, 623 insertions(+), 99 deletions(-)
>
> The code tagging library should exist anyways, it's been open coded half a dozen
> times in the kernel already.
>
> And once we've got that, the time stats code is _also_ far simpler than doing it
> with ftrace would be. If anyone here has successfully debugged latency issues
> with ftrace, I'd really like to hear it. Again, for debugging latency issues you
> want something that can always be on, and that's not cheap with ftrace - and
> never mind the hassle of correlating start and end wait trace events, builting
> up histograms, etc. - that's all handled here.
>
> Cheap, simple, easy to use. What more could you want?
>

This is very interesting work! Do you have any data about the overhead
this introduces, especially in a production environment? I am
especially interested in memory allocations tracking and detecting
leaks.
(Sorry if you already posted this kind of data somewhere that I missed)

