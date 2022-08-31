Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9079D5A8161
	for <lists+xen-devel@lfdr.de>; Wed, 31 Aug 2022 17:37:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.395782.635634 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTPmU-0001i0-9P; Wed, 31 Aug 2022 15:37:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 395782.635634; Wed, 31 Aug 2022 15:37:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTPmU-0001fg-6n; Wed, 31 Aug 2022 15:37:30 +0000
Received: by outflank-mailman (input) for mailman id 395782;
 Wed, 31 Aug 2022 15:37:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=q2E5=ZD=google.com=surenb@srs-se1.protection.inumbo.net>)
 id 1oTPmR-0001fa-U8
 for xen-devel@lists.xenproject.org; Wed, 31 Aug 2022 15:37:27 +0000
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com
 [2607:f8b0:4864:20::112e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d08fdd7f-2942-11ed-934f-f50d60e1c1bd;
 Wed, 31 Aug 2022 17:37:27 +0200 (CEST)
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-33dce2d4bc8so310830027b3.4
 for <xen-devel@lists.xenproject.org>; Wed, 31 Aug 2022 08:37:26 -0700 (PDT)
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
X-Inumbo-ID: d08fdd7f-2942-11ed-934f-f50d60e1c1bd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=Z5bWT124P9msiKtHJxXWtamGxGE9nU7NFSbNkXeVir4=;
        b=q4yt7LQZaKZTdzRnqOfBDWuxDUawgahY2C4+8NClZrlVWpZiq8b8wuUtt2FXanHGEc
         GKUHZeMZM5jPluxM3gpqfRkq+ZEpQLG+BNvz98YUVO6qqcwbNq/QfwpxfY1bBqJ/PbUe
         qN9rURlcwiX2U8yaFrSKUwROmM3LF8ndCfS6j0AHC4HsQL8z7s2/MCCQMTRvX3Ne6rDh
         NX1iVO84IZTdrxORhVNpFjbUB389eDGDLX9acAC39/jQL/Xkcw+zdEhsbVQSkIB5PGSl
         3MgCLAYUQZJEhdAOCDXe/UR2KtUxqwQZuMK/LjLdJHtYQZbxs0yHQAWgM70EmS5KjdKg
         raEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=Z5bWT124P9msiKtHJxXWtamGxGE9nU7NFSbNkXeVir4=;
        b=zdcNOLTcMAXA0StKP1UULObe6VVNOQf0UEKdh6dh9A+KXIoHI4U0OjypOAgw7PJfbQ
         hunWXG9dwoNlLP3fjMwwmqmskZqxaAs3xC2bqOy+lzgQl1B6ir+HfgEAf4XUxja2t7yu
         9wjP5BTFAPetVPGZ3yq8uC8pFFltZrwSDBjCua8eDqyU0C8W1ddoB7amAvp+wQ3K6xjd
         S9oSClO3axNXkLuxGXX45Bi0Wr9ipSXC6amCWNhsp1C/OlPNr+6vgduUPg5lvi7wBJ6U
         AaXHObkwnxGGV6laSYETF3X05EYYSUSJVl9Ko0TezJ00sC92kexyE77NEGDMh0gXPzMF
         Qn3Q==
X-Gm-Message-State: ACgBeo1VUJD5Wh7qdM+QL5nsc1F0Nsk+Ytudlio8c5vrWkiZ0WnDKo8C
	1wFQMy7mO952ojWOs3AqCZzuTG94Hqe002tuDXvrbA==
X-Google-Smtp-Source: AA6agR4eyfrVHwFKMQTAM4+K85p4B7I6c+zSy9tLGnKDo68fc8kY3s9yyQtJtbnPccojelXd5+hkkFEpEU7+woAq0vg=
X-Received: by 2002:a81:7784:0:b0:33d:ca62:45f5 with SMTP id
 s126-20020a817784000000b0033dca6245f5mr18452862ywc.180.1661960245620; Wed, 31
 Aug 2022 08:37:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220830214919.53220-1-surenb@google.com> <20220830214919.53220-4-surenb@google.com>
 <20220831100249.f2o27ri7ho4ma3pe@suse.de>
In-Reply-To: <20220831100249.f2o27ri7ho4ma3pe@suse.de>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 31 Aug 2022 08:37:14 -0700
Message-ID: <CAJuCfpHpBCUma_=AdTQ+UkfSkfkov2JbKfxLdp5K9_MoonkT7g@mail.gmail.com>
Subject: Re: [RFC PATCH 03/30] Lazy percpu counters
To: Mel Gorman <mgorman@suse.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Michal Hocko <mhocko@suse.com>, Vlastimil Babka <vbabka@suse.cz>, Johannes Weiner <hannes@cmpxchg.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Davidlohr Bueso <dave@stgolabs.net>, 
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
	dvyukov@google.com, Shakeel Butt <shakeelb@google.com>, 
	Muchun Song <songmuchun@bytedance.com>, arnd@arndb.de, jbaron@akamai.com, 
	David Rientjes <rientjes@google.com>, Minchan Kim <minchan@google.com>, 
	Kalesh Singh <kaleshsingh@google.com>, kernel-team <kernel-team@android.com>, 
	linux-mm <linux-mm@kvack.org>, iommu@lists.linux.dev, kasan-dev@googlegroups.com, 
	io-uring@vger.kernel.org, linux-arch@vger.kernel.org, 
	xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org, 
	linux-modules@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, Aug 31, 2022 at 3:02 AM Mel Gorman <mgorman@suse.de> wrote:
>
> On Tue, Aug 30, 2022 at 02:48:52PM -0700, Suren Baghdasaryan wrote:
> > From: Kent Overstreet <kent.overstreet@linux.dev>
> >
> > This patch adds lib/lazy-percpu-counter.c, which implements counters
> > that start out as atomics, but lazily switch to percpu mode if the
> > update rate crosses some threshold (arbitrarily set at 256 per second).
> >
> > Signed-off-by: Kent Overstreet <kent.overstreet@linux.dev>
>
> Why not use percpu_counter? It has a per-cpu counter that is synchronised
> when a batch threshold (default 32) is exceeded and can explicitly sync
> the counters when required assuming the synchronised count is only needed
> when reading debugfs.

The intent is to use atomic counters for places that are not updated very often.
This would save memory required for the counters. Originally I had a config
option to choose which counter type to use but with lazy counters we sacrifice
memory for performance only when needed while keeping the other counters
small.

>
> --
> Mel Gorman
> SUSE Labs

