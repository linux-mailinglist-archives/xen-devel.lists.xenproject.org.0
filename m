Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5636C5ACD79
	for <lists+xen-devel@lfdr.de>; Mon,  5 Sep 2022 10:13:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.398575.639445 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oV7Dd-0001KG-Aq; Mon, 05 Sep 2022 08:12:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 398575.639445; Mon, 05 Sep 2022 08:12:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oV7Dd-0001I9-81; Mon, 05 Sep 2022 08:12:33 +0000
Received: by outflank-mailman (input) for mailman id 398575;
 Mon, 05 Sep 2022 08:12:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OdSv=ZI=suse.com=mhocko@srs-se1.protection.inumbo.net>)
 id 1oV7Dc-0001I3-2f
 for xen-devel@lists.xenproject.org; Mon, 05 Sep 2022 08:12:32 +0000
Received: from smtp-out2.suse.de (smtp-out2.suse.de [2001:67c:2178:6::1d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7c6a17c2-2cf2-11ed-a016-b9edf5238543;
 Mon, 05 Sep 2022 10:12:30 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 6CC095FCCC;
 Mon,  5 Sep 2022 08:12:29 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4046313A66;
 Mon,  5 Sep 2022 08:12:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id vpI8D22vFWNpBAAAMHmgww
 (envelope-from <mhocko@suse.com>); Mon, 05 Sep 2022 08:12:29 +0000
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
X-Inumbo-ID: 7c6a17c2-2cf2-11ed-a016-b9edf5238543
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1662365549; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vLBCtbeiMkaT10it/2QfW3oy9NGXJ0931FNcJJeTs+E=;
	b=hvJuONTlqXa3IZLVuzAZ3mvfimjG/HG5K1UYXiiMd6Jxc7MnBmd8EvFQgw5oSEYQnG/f0V
	+51wd/30Jfiv7ka9ky5kghqEmUu9AoehBsL4FA/S3udtvnMmZ/ybc1m3/Htxqdr3KL53Wv
	TIehxfs6fvCI+DApLUGQDHmpY/iq5bI=
Date: Mon, 5 Sep 2022 10:12:28 +0200
From: Michal Hocko <mhocko@suse.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: Kent Overstreet <kent.overstreet@linux.dev>,
	Mel Gorman <mgorman@suse.de>, Peter Zijlstra <peterz@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Matthew Wilcox <willy@infradead.org>,
	"Liam R. Howlett" <liam.howlett@oracle.com>,
	David Vernet <void@manifault.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Laurent Dufour <ldufour@linux.ibm.com>,
	Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>,
	Jens Axboe <axboe@kernel.dk>, mcgrof@kernel.org,
	masahiroy@kernel.org, nathan@kernel.org, changbin.du@intel.com,
	ytcoode@gmail.com, Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Benjamin Segall <bsegall@google.com>,
	Daniel Bristot de Oliveira <bristot@redhat.com>,
	Valentin Schneider <vschneid@redhat.com>,
	Christopher Lameter <cl@linux.com>,
	Pekka Enberg <penberg@kernel.org>,
	Joonsoo Kim <iamjoonsoo.kim@lge.com>, 42.hyeyoo@gmail.com,
	Alexander Potapenko <glider@google.com>,
	Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>,
	Shakeel Butt <shakeelb@google.com>,
	Muchun Song <songmuchun@bytedance.com>, arnd@arndb.de,
	jbaron@akamai.com, David Rientjes <rientjes@google.com>,
	Minchan Kim <minchan@google.com>,
	Kalesh Singh <kaleshsingh@google.com>,
	kernel-team <kernel-team@android.com>,
	linux-mm <linux-mm@kvack.org>, iommu@lists.linux.dev,
	kasan-dev@googlegroups.com, io-uring@vger.kernel.org,
	linux-arch@vger.kernel.org, xen-devel@lists.xenproject.org,
	linux-bcache@vger.kernel.org, linux-modules@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH 00/30] Code tagging framework and applications
Message-ID: <YxWvbMYLkPoJrQyr@dhcp22.suse.cz>
References: <20220830214919.53220-1-surenb@google.com>
 <Yw8P8xZ4zqu121xL@hirez.programming.kicks-ass.net>
 <20220831084230.3ti3vitrzhzsu3fs@moria.home.lan>
 <20220831101948.f3etturccmp5ovkl@suse.de>
 <Yw88RFuBgc7yFYxA@dhcp22.suse.cz>
 <20220831190154.qdlsxfamans3ya5j@moria.home.lan>
 <YxBc1xuGbB36f8zC@dhcp22.suse.cz>
 <CAJuCfpGhwPFYdkOLjwwD4ra9JxPqq1T5d1jd41Jy3LJnVnhNdg@mail.gmail.com>
 <YxEE1vOwRPdzKxoq@dhcp22.suse.cz>
 <CAJuCfpFrRwXXQ=wAvZ-oUNKXUJ=uUA=fiDrkhRu5VGXcM+=cuA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJuCfpFrRwXXQ=wAvZ-oUNKXUJ=uUA=fiDrkhRu5VGXcM+=cuA@mail.gmail.com>

On Sun 04-09-22 18:32:58, Suren Baghdasaryan wrote:
> On Thu, Sep 1, 2022 at 12:15 PM Michal Hocko <mhocko@suse.com> wrote:
[...]
> > Yes, tracking back the call trace would be really needed. The question
> > is whether this is really prohibitively expensive. How much overhead are
> > we talking about? There is no free lunch here, really.  You either have
> > the overhead during runtime when the feature is used or on the source
> > code level for all the future development (with a maze of macros and
> > wrappers).
> 
> As promised, I profiled a simple code that repeatedly makes 10
> allocations/frees in a loop and measured overheads of code tagging,
> call stack capturing and tracing+BPF for page and slab allocations.
> Summary:
> 
> Page allocations (overheads are compared to get_free_pages() duration):
> 6.8% Codetag counter manipulations (__lazy_percpu_counter_add + __alloc_tag_add)
> 8.8% lookup_page_ext
> 1237% call stack capture
> 139% tracepoint with attached empty BPF program

Yes, I am not surprised that the call stack capturing is really
expensive comparing to the allocator fast path (which is really highly
optimized and I suspect that with 10 allocation/free loop you mostly get
your memory from the pcp lists). Is this overhead still _that_ visible
for somehow less microoptimized workloads which have to take slow paths
as well?

Also what kind of stack unwinder is configured (I guess ORC)? This is
not my area but from what I remember the unwinder overhead varies
between ORC and FP.

And just to make it clear. I do realize that an overhead from the stack
unwinding is unavoidable. And code tagging would logically have lower
overhead as it performs much less work. But the main point is whether
our existing stack unwiding approach is really prohibitively expensive
to be used for debugging purposes on production systems. I might
misremember but I recall people having bigger concerns with page_owner
memory footprint than the actual stack unwinder overhead.
-- 
Michal Hocko
SUSE Labs

