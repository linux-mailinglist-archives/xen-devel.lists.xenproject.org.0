Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7E15A8F6C
	for <lists+xen-devel@lfdr.de>; Thu,  1 Sep 2022 09:12:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.396256.636336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTeMk-0003ID-9i; Thu, 01 Sep 2022 07:11:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 396256.636336; Thu, 01 Sep 2022 07:11:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTeMk-0003FQ-6S; Thu, 01 Sep 2022 07:11:54 +0000
Received: by outflank-mailman (input) for mailman id 396256;
 Thu, 01 Sep 2022 07:11:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nAYD=ZE=infradead.org=peterz@srs-se1.protection.inumbo.net>)
 id 1oTeMi-0003FK-06
 for xen-devel@lists.xenproject.org; Thu, 01 Sep 2022 07:11:52 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 587bf2ca-29c5-11ed-82f2-63bd783d45fa;
 Thu, 01 Sep 2022 09:11:49 +0200 (CEST)
Received: from j130084.upc-j.chello.nl ([24.132.130.84]
 helo=noisy.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1oTeMD-005p99-An; Thu, 01 Sep 2022 07:11:21 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id D2B58300431;
 Thu,  1 Sep 2022 09:11:17 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id B51EF20981381; Thu,  1 Sep 2022 09:11:17 +0200 (CEST)
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
X-Inumbo-ID: 587bf2ca-29c5-11ed-82f2-63bd783d45fa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=0alPrNIyXUGsDd/lDjKfjoAzSlLEpkpL3yJZZ94RPpk=; b=neTNuYxorlf1E6lqksEri7ob9s
	+fOEKml0dypX1VPsk71Al83+X/wCWVLA2v8MAkyhFFTF2iv7nIDbg8DLeKDx/Rohb0D/WGiowcdyF
	0922P6Ye6aFkRzhuFME6aeUZzKEon4H+p5J4aJUsUfyeUn3pphhfCCpeODAoqUXD8D3vBJsTb3KKg
	i0elKtC2iCCloFyRF8muS9N3Uom/PTE/NlgZ/EuB/5pL3cvoO8AeT2wg/ELDQb4daJgt/gZxAtlcx
	+BB0kImmBciB+hA72jxFiegxOnV9t9ymgmWDAn4pa1ntPYvLXdkppEVbVbS9dT3KZirOXj99594dd
	nqw0a9fg==;
Date: Thu, 1 Sep 2022 09:11:17 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Suren Baghdasaryan <surenb@google.com>
Cc: akpm@linux-foundation.org, kent.overstreet@linux.dev, mhocko@suse.com,
	vbabka@suse.cz, hannes@cmpxchg.org, roman.gushchin@linux.dev,
	mgorman@suse.de, dave@stgolabs.net, willy@infradead.org,
	liam.howlett@oracle.com, void@manifault.com, juri.lelli@redhat.com,
	ldufour@linux.ibm.com, peterx@redhat.com, david@redhat.com,
	axboe@kernel.dk, mcgrof@kernel.org, masahiroy@kernel.org,
	nathan@kernel.org, changbin.du@intel.com, ytcoode@gmail.com,
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
	rostedt@goodmis.org, bsegall@google.com, bristot@redhat.com,
	vschneid@redhat.com, cl@linux.com, penberg@kernel.org,
	iamjoonsoo.kim@lge.com, 42.hyeyoo@gmail.com, glider@google.com,
	elver@google.com, dvyukov@google.com, shakeelb@google.com,
	songmuchun@bytedance.com, arnd@arndb.de, jbaron@akamai.com,
	rientjes@google.com, minchan@google.com, kaleshsingh@google.com,
	kernel-team@android.com, linux-mm@kvack.org, iommu@lists.linux.dev,
	kasan-dev@googlegroups.com, io-uring@vger.kernel.org,
	linux-arch@vger.kernel.org, xen-devel@lists.xenproject.org,
	linux-bcache@vger.kernel.org, linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 27/30] Code tagging based latency tracking
Message-ID: <YxBbFUirdlbXDaZA@hirez.programming.kicks-ass.net>
References: <20220830214919.53220-1-surenb@google.com>
 <20220830214919.53220-28-surenb@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220830214919.53220-28-surenb@google.com>

On Tue, Aug 30, 2022 at 02:49:16PM -0700, Suren Baghdasaryan wrote:
> From: Kent Overstreet <kent.overstreet@linux.dev>
> 
> This adds the ability to easily instrument code for measuring latency.
> To use, add the following to calls to your code, at the start and end of
> the event you wish to measure:
> 
>   code_tag_time_stats_start(start_time);
>   code_tag_time_stats_finish(start_time);
> 
> Stastistics will then show up in debugfs under
> /sys/kernel/debug/time_stats, listed by file and line number.
> 
> Stastics measured include weighted averages of frequency, duration, max
> duration, as well as quantiles.
> 
> This patch also instruments all calls to init_wait and finish_wait,
> which includes all calls to wait_event. Example debugfs output:

How can't you do this with a simple eBPF script on top of
trace_sched_stat_* and friends?

