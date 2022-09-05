Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDBF25AD5BC
	for <lists+xen-devel@lfdr.de>; Mon,  5 Sep 2022 17:07:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.398913.639901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVDgW-0004lc-2Z; Mon, 05 Sep 2022 15:06:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 398913.639901; Mon, 05 Sep 2022 15:06:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVDgV-0004jS-W2; Mon, 05 Sep 2022 15:06:47 +0000
Received: by outflank-mailman (input) for mailman id 398913;
 Mon, 05 Sep 2022 15:06:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a78l=ZI=goodmis.org=rostedt@kernel.org>)
 id 1oVDgU-0004jM-Ce
 for xen-devel@lists.xenproject.org; Mon, 05 Sep 2022 15:06:46 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5a7f3d8a-2d2c-11ed-af93-0125da4c0113;
 Mon, 05 Sep 2022 17:06:44 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 00378B8119C;
 Mon,  5 Sep 2022 15:06:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99AC4C433D6;
 Mon,  5 Sep 2022 15:06:36 +0000 (UTC)
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
X-Inumbo-ID: 5a7f3d8a-2d2c-11ed-af93-0125da4c0113
Date: Mon, 5 Sep 2022 11:07:13 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Suren Baghdasaryan <surenb@google.com>
Cc: Michal Hocko <mhocko@suse.com>, Kent Overstreet
 <kent.overstreet@linux.dev>, Mel Gorman <mgorman@suse.de>, Peter Zijlstra
 <peterz@infradead.org>, Andrew Morton <akpm@linux-foundation.org>,
 Vlastimil Babka <vbabka@suse.cz>, Johannes Weiner <hannes@cmpxchg.org>,
 Roman Gushchin <roman.gushchin@linux.dev>, Davidlohr Bueso
 <dave@stgolabs.net>, Matthew Wilcox <willy@infradead.org>, "Liam R.
 Howlett" <liam.howlett@oracle.com>, David Vernet <void@manifault.com>, Juri
 Lelli <juri.lelli@redhat.com>, Laurent Dufour <ldufour@linux.ibm.com>,
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>, Jens
 Axboe <axboe@kernel.dk>, mcgrof@kernel.org, masahiroy@kernel.org,
 nathan@kernel.org, changbin.du@intel.com, ytcoode@gmail.com, Vincent
 Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann
 <dietmar.eggemann@arm.com>, Benjamin Segall <bsegall@google.com>, Daniel
 Bristot de Oliveira <bristot@redhat.com>, Valentin Schneider
 <vschneid@redhat.com>, Christopher Lameter <cl@linux.com>, Pekka Enberg
 <penberg@kernel.org>, Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 42.hyeyoo@gmail.com, Alexander Potapenko <glider@google.com>, Marco Elver
 <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>, Shakeel Butt
 <shakeelb@google.com>, Muchun Song <songmuchun@bytedance.com>,
 arnd@arndb.de, jbaron@akamai.com, David Rientjes <rientjes@google.com>,
 Minchan Kim <minchan@google.com>, Kalesh Singh <kaleshsingh@google.com>,
 kernel-team <kernel-team@android.com>, linux-mm <linux-mm@kvack.org>,
 iommu@lists.linux.dev, kasan-dev@googlegroups.com,
 io-uring@vger.kernel.org, linux-arch@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
 linux-modules@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH 00/30] Code tagging framework and applications
Message-ID: <20220905110713.27304149@gandalf.local.home>
In-Reply-To: <CAJuCfpFrRwXXQ=wAvZ-oUNKXUJ=uUA=fiDrkhRu5VGXcM+=cuA@mail.gmail.com>
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
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 4 Sep 2022 18:32:58 -0700
Suren Baghdasaryan <surenb@google.com> wrote:

> Page allocations (overheads are compared to get_free_pages() duration):
> 6.8% Codetag counter manipulations (__lazy_percpu_counter_add + __alloc_tag_add)
> 8.8% lookup_page_ext
> 1237% call stack capture
> 139% tracepoint with attached empty BPF program

Have you tried tracepoint with custom callback?

static void my_callback(void *data, unsigned long call_site,
			const void *ptr, struct kmem_cache *s,
			size_t bytes_req, size_t bytes_alloc,
			gfp_t gfp_flags)
{
	struct my_data_struct *my_data = data;

	{ do whatever }
}

[..]
	register_trace_kmem_alloc(my_callback, my_data);

Now the my_callback function will be called directly every time the
kmem_alloc tracepoint is hit.

This avoids that perf and BPF overhead.

-- Steve

