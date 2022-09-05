Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6ACA5AD97D
	for <lists+xen-devel@lfdr.de>; Mon,  5 Sep 2022 21:17:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.399146.640216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVHZr-00032o-LR; Mon, 05 Sep 2022 19:16:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 399146.640216; Mon, 05 Sep 2022 19:16:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVHZr-00030a-IQ; Mon, 05 Sep 2022 19:16:11 +0000
Received: by outflank-mailman (input) for mailman id 399146;
 Mon, 05 Sep 2022 19:16:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=a78l=ZI=goodmis.org=rostedt@kernel.org>)
 id 1oVHZq-00030U-15
 for xen-devel@lists.xenproject.org; Mon, 05 Sep 2022 19:16:10 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2ecc8dad-2d4f-11ed-a016-b9edf5238543;
 Mon, 05 Sep 2022 21:16:04 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 455796146B;
 Mon,  5 Sep 2022 19:16:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7168DC433C1;
 Mon,  5 Sep 2022 19:15:56 +0000 (UTC)
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
X-Inumbo-ID: 2ecc8dad-2d4f-11ed-a016-b9edf5238543
Date: Mon, 5 Sep 2022 15:16:33 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Nadav Amit <nadav.amit@gmail.com>
Cc: Mel Gorman <mgorman@suse.de>, Kent Overstreet
 <kent.overstreet@linux.dev>, Peter Zijlstra <peterz@infradead.org>, Suren
 Baghdasaryan <surenb@google.com>, Andrew Morton
 <akpm@linux-foundation.org>, Michal Hocko <mhocko@suse.com>, Vlastimil
 Babka <vbabka@suse.cz>, Johannes Weiner <hannes@cmpxchg.org>,
 roman.gushchin@linux.dev, dave@stgolabs.net, Matthew Wilcox
 <willy@infradead.org>, liam.howlett@oracle.com, void@manifault.com,
 juri.lelli@redhat.com, ldufour@linux.ibm.com, Peter Xu <peterx@redhat.com>,
 David Hildenbrand <david@redhat.com>, Jens Axboe <axboe@kernel.dk>,
 mcgrof@kernel.org, masahiroy@kernel.org, nathan@kernel.org,
 changbin.du@intel.com, ytcoode@gmail.com, vincent.guittot@linaro.org,
 dietmar.eggemann@arm.com, bsegall@google.com, bristot@redhat.com,
 vschneid@redhat.com, cl@linux.com, penberg@kernel.org,
 iamjoonsoo.kim@lge.com, 42.hyeyoo@gmail.com, glider@google.com, Marco Elver
 <elver@google.com>, dvyukov@google.com, Shakeel Butt <shakeelb@google.com>,
 Muchun Song <songmuchun@bytedance.com>, Arnd Bergmann <arnd@arndb.de>,
 jbaron@akamai.com, David Rientjes <rientjes@google.com>,
 minchan@google.com, kaleshsingh@google.com, kernel-team@android.com, Linux
 MM <linux-mm@kvack.org>, iommu@lists.linux.dev, kasan-dev@googlegroups.com,
 io-uring@vger.kernel.org, linux-arch <linux-arch@vger.kernel.org>,
 xen-devel@lists.xenproject.org, linux-bcache@vger.kernel.org,
 linux-modules@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH 00/30] Code tagging framework and applications
Message-ID: <20220905151633.04081816@gandalf.local.home>
In-Reply-To: <8EB7F2CE-2C8E-47EA-817F-6DE2D95F0A8B@gmail.com>
References: <20220830214919.53220-1-surenb@google.com>
	<Yw8P8xZ4zqu121xL@hirez.programming.kicks-ass.net>
	<20220831084230.3ti3vitrzhzsu3fs@moria.home.lan>
	<20220831101948.f3etturccmp5ovkl@suse.de>
	<8EB7F2CE-2C8E-47EA-817F-6DE2D95F0A8B@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 5 Sep 2022 11:44:55 -0700
Nadav Amit <nadav.amit@gmail.com> wrote:

> I would note that I have a solution in the making (which pretty much works)
> for this matter, and does not require any kernel changes. It produces a
> call stack that leads to the code that lead to syscall failure.
> 
> The way it works is by using seccomp to trap syscall failures, and then
> setting ftrace function filters and kprobes on conditional branches,
> indirect branch targets and function returns.

Ooh nifty!

> 
> Using symbolic execution, backtracking is performed and the condition that
> lead to the failure is then pin-pointed.
> 
> I hope to share the code soon.

Looking forward to it.

-- Steve

