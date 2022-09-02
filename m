Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B965AA456
	for <lists+xen-devel@lfdr.de>; Fri,  2 Sep 2022 02:25:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.397092.637550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTuUQ-0001aJ-J4; Fri, 02 Sep 2022 00:24:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 397092.637550; Fri, 02 Sep 2022 00:24:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTuUQ-0001YG-GU; Fri, 02 Sep 2022 00:24:54 +0000
Received: by outflank-mailman (input) for mailman id 397092;
 Fri, 02 Sep 2022 00:24:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VX1/=ZF=google.com=surenb@srs-se1.protection.inumbo.net>)
 id 1oTuUP-0001IP-Bm
 for xen-devel@lists.xenproject.org; Fri, 02 Sep 2022 00:24:53 +0000
Received: from mail-yb1-xb33.google.com (mail-yb1-xb33.google.com
 [2607:f8b0:4864:20::b33])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a953c43d-2a55-11ed-934f-f50d60e1c1bd;
 Fri, 02 Sep 2022 02:24:52 +0200 (CEST)
Received: by mail-yb1-xb33.google.com with SMTP id t184so1074471yba.4
 for <xen-devel@lists.xenproject.org>; Thu, 01 Sep 2022 17:24:52 -0700 (PDT)
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
X-Inumbo-ID: a953c43d-2a55-11ed-934f-f50d60e1c1bd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=/pPOPbPw8AnpH29BUzSqTrm5ZvDmaEgEyFxuBQlNiEg=;
        b=JFydOg9QoPX5QvCMFfTX+qzkxy7dX+yug3qLsycd8X5fIiKliNhG2sOdd7n2FZxg0x
         wlIQ0PSe2w+jF1eYJALDSn9VwIQg7e+fojjEXzmIOWtowrPcZ8vVaDgvGlc5viuLzbLq
         BuWwUYh3dJTjnuDVzKYwlUlnzQN1dlqhuf8e4UUJj0Gz3yVOw7ZhtZlACThcN+JogWbQ
         XLiaLX50zBOT8vT4sikyfQhvA5G9n7Ys1zkULvj3Bu6V7OPgO3m2SYNlgkEGLVgRXA6S
         YaT8WKnNiPs7HVTvCKPZfxYMJ9fk0eCfVfQjSQqADIJwkH1wr6+8aSYndPr9n1G1vqpS
         RvLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=/pPOPbPw8AnpH29BUzSqTrm5ZvDmaEgEyFxuBQlNiEg=;
        b=kp+FNkgJ9PFnS65CFTvjjoxAWYNclUBcMTSFeSp1p7SmNu6sczO+sIoxoDF7AyoQUu
         91GSrXpYHSrincWtGYQVuAZ/AXZUbrJseenVD+NcGYZZGsZLaOl05XGFzr/UJXauhZxl
         Ys2jkeilJgRVXIEi7tNDR3ASWjP5fjyES9xfNs0DTbRLEfcXFgRlT/g7jocjuEUoqD+w
         odwgPNVfq5V+Hndp2GRMv3moakBebdZd8LHzQqVSfrVienJmwcwSUBCFmwopOGqxBnct
         M9oaO8m4iDiFihi15q45k1luf7rgFEmQSLU7yBC/M5O5Ql31yh9goN0Fb9um9zAfB4gX
         NkOw==
X-Gm-Message-State: ACgBeo360X8wNoXvfICqS9YzcJP9A7WBiUTVTqFhqJxBbLWIvmSd3gcd
	Ihyatl5dI5WzGb4wgu0Hq1tQ1jmCkbCl1ukeernuCA==
X-Google-Smtp-Source: AA6agR5/Ulv2F+QXTz0x1dcq0Ynnhj3rjvCeoD8VrxwV966KDu/pwW+2XwncQnNg3JY46QNFp+MHM1SP5XYuAvh7JKU=
X-Received: by 2002:a05:6902:705:b0:695:b3b9:41bc with SMTP id
 k5-20020a056902070500b00695b3b941bcmr21283555ybt.426.1662078291363; Thu, 01
 Sep 2022 17:24:51 -0700 (PDT)
MIME-Version: 1.0
References: <20220830214919.53220-1-surenb@google.com> <20220830214919.53220-15-surenb@google.com>
 <YxFC9NSQ7OADTEwp@P9FQF9L96D.corp.robot.car>
In-Reply-To: <YxFC9NSQ7OADTEwp@P9FQF9L96D.corp.robot.car>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 1 Sep 2022 17:24:40 -0700
Message-ID: <CAJuCfpGRL72qghDf9bNsp_K0kabvLBs5ags2hHXn-5_Ar8RX5A@mail.gmail.com>
Subject: Re: [RFC PATCH 14/30] mm: prevent slabobj_ext allocations for
 slabobj_ext and kmem_cache objects
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Michal Hocko <mhocko@suse.com>, Vlastimil Babka <vbabka@suse.cz>, Johannes Weiner <hannes@cmpxchg.org>, 
	Mel Gorman <mgorman@suse.de>, Davidlohr Bueso <dave@stgolabs.net>, 
	Matthew Wilcox <willy@infradead.org>, "Liam R. Howlett" <liam.howlett@oracle.com>, 
	David Vernet <void@manifault.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Laurent Dufour <ldufour@linux.ibm.com>, 
	Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>, Jens Axboe <axboe@kernel.dk>, 
	mcgrof@kernel.org, masahiroy@kernel.org, nathan@kernel.org, 
	changbin.du@intel.com, ytcoode@gmail.com, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Benjamin Segall <bsegall@google.com>, 
	Daniel Bristot de Oliveira <bristot@redhat.com>, Valentin Schneider <vschneid@redhat.com>, 
	Christopher Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, 
	42.hyeyoo@gmail.com, Alexander Potapenko <glider@google.com>, Marco Elver <elver@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Shakeel Butt <shakeelb@google.com>, 
	Muchun Song <songmuchun@bytedance.com>, arnd@arndb.de, jbaron@akamai.com, 
	David Rientjes <rientjes@google.com>, Minchan Kim <minchan@google.com>, 
	Kalesh Singh <kaleshsingh@google.com>, kernel-team <kernel-team@android.com>, 
	linux-mm <linux-mm@kvack.org>, iommu@lists.linux.dev, kasan-dev@googlegroups.com, 
	io-uring@vger.kernel.org, linux-arch@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org, 
	linux-modules@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 1, 2022 at 4:41 PM Roman Gushchin <roman.gushchin@linux.dev> wrote:
>
> On Tue, Aug 30, 2022 at 02:49:03PM -0700, Suren Baghdasaryan wrote:
> > Use __GFP_NO_OBJ_EXT to prevent recursions when allocating slabobj_ext
> > objects. Also prevent slabobj_ext allocations for kmem_cache objects.
> >
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
>
> Patches 12-14 look good to me.
> It's probably to early to ack anything, but otherwise I'd ack them.

Thank you for reviewing!

>
> Thanks!

