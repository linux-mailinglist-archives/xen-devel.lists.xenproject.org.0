Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A185AA19E
	for <lists+xen-devel@lfdr.de>; Thu,  1 Sep 2022 23:46:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.396956.637367 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTs0l-00038h-2B; Thu, 01 Sep 2022 21:46:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 396956.637367; Thu, 01 Sep 2022 21:46:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oTs0k-00035Q-V9; Thu, 01 Sep 2022 21:46:06 +0000
Received: by outflank-mailman (input) for mailman id 396956;
 Thu, 01 Sep 2022 21:46:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=hZ//=ZE=goodmis.org=rostedt@kernel.org>)
 id 1oTs0j-00035K-Ln
 for xen-devel@lists.xenproject.org; Thu, 01 Sep 2022 21:46:05 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 79641aba-2a3f-11ed-82f2-63bd783d45fa;
 Thu, 01 Sep 2022 23:46:03 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 06F9161F70;
 Thu,  1 Sep 2022 21:46:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58693C433C1;
 Thu,  1 Sep 2022 21:45:56 +0000 (UTC)
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
X-Inumbo-ID: 79641aba-2a3f-11ed-82f2-63bd783d45fa
Date: Thu, 1 Sep 2022 17:46:27 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Suren Baghdasaryan <surenb@google.com>
Cc: akpm@linux-foundation.org, kent.overstreet@linux.dev, mhocko@suse.com,
 vbabka@suse.cz, hannes@cmpxchg.org, roman.gushchin@linux.dev,
 mgorman@suse.de, dave@stgolabs.net, willy@infradead.org,
 liam.howlett@oracle.com, void@manifault.com, peterz@infradead.org,
 juri.lelli@redhat.com, ldufour@linux.ibm.com, peterx@redhat.com,
 david@redhat.com, axboe@kernel.dk, mcgrof@kernel.org, masahiroy@kernel.org,
 nathan@kernel.org, changbin.du@intel.com, ytcoode@gmail.com,
 vincent.guittot@linaro.org, dietmar.eggemann@arm.com, bsegall@google.com,
 bristot@redhat.com, vschneid@redhat.com, cl@linux.com, penberg@kernel.org,
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
Message-ID: <20220901174627.27c7e23d@gandalf.local.home>
In-Reply-To: <20220901173844.36e1683c@gandalf.local.home>
References: <20220830214919.53220-1-surenb@google.com>
	<20220830214919.53220-28-surenb@google.com>
	<20220901173844.36e1683c@gandalf.local.home>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 1 Sep 2022 17:38:44 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

>  # echo 'hist:keys=comm,prio,delta.buckets=10:sort=delta' > /sys/kernel/tracing/events/synthetic/wakeup_lat/trigger

The above could almost be done with sqlhist (but I haven't implemented
"buckets=10" yet because that's a new feature. But for now, let's do log2):

 # sqlhist -e 'select comm,prio,cast(delta as log2) from wakeup_lat'

("-e" is to execute the command, as it normally only displays what commands
need to be run to create the synthetic events and histograms)

# cat /sys/kernel/tracing/events/synthetic/wakeup_lat/hist
# event histogram
#
# trigger info: hist:keys=comm,prio,delta.log2:vals=hitcount:sort=hitcount:size=2048 [active]
#

{ comm: migration/4                                       , prio:          0, delta: ~ 2^5  } hitcount:          1
{ comm: migration/0                                       , prio:          0, delta: ~ 2^4  } hitcount:          2
{ comm: rtkit-daemon                                      , prio:          0, delta: ~ 2^7  } hitcount:          2
{ comm: rtkit-daemon                                      , prio:          0, delta: ~ 2^6  } hitcount:          4
{ comm: migration/0                                       , prio:          0, delta: ~ 2^5  } hitcount:          8
{ comm: migration/4                                       , prio:          0, delta: ~ 2^4  } hitcount:          9
{ comm: migration/2                                       , prio:          0, delta: ~ 2^4  } hitcount:         10
{ comm: migration/5                                       , prio:          0, delta: ~ 2^4  } hitcount:         10
{ comm: migration/7                                       , prio:          0, delta: ~ 2^4  } hitcount:         10
{ comm: migration/1                                       , prio:          0, delta: ~ 2^4  } hitcount:         10
{ comm: migration/6                                       , prio:          0, delta: ~ 2^4  } hitcount:         10

Totals:
    Hits: 76
    Entries: 11
    Dropped: 0


-- Steve

