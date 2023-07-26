Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28AF2762EEA
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 09:57:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570169.891713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOZOX-000172-B9; Wed, 26 Jul 2023 07:57:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570169.891713; Wed, 26 Jul 2023 07:57:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOZOX-00014O-7b; Wed, 26 Jul 2023 07:57:17 +0000
Received: by outflank-mailman (input) for mailman id 570169;
 Wed, 26 Jul 2023 07:57:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pzNf=DM=linux.dev=muchun.song@srs-se1.protection.inumbo.net>)
 id 1qOZOV-00014I-GA
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 07:57:15 +0000
Received: from out-15.mta1.migadu.com (out-15.mta1.migadu.com [95.215.58.15])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 081dca14-2b8a-11ee-b242-6b7b168915f2;
 Wed, 26 Jul 2023 09:57:13 +0200 (CEST)
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
X-Inumbo-ID: 081dca14-2b8a-11ee-b242-6b7b168915f2
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1690358232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DrTjaApThAuzzzwg/AJ38QfJI73QqK5cZWNfOYAaBzo=;
	b=wmb9Oc63rqgJphlqbAiUGQf+QfWRu1BB5RekgtePch6TWeTBhXF8/rZbaJe3xMLy22V28n
	AB61q+qfNpO4zxg1WfzVWjZzQVs0/ao+ef/zXMB6L8A11iP2pUjCxTGOuptX1W/mgnuJdh
	cKneJyV5E4YSzAPypp2CHjNMfrcxLhY=
MIME-Version: 1.0
Subject: Re: [PATCH v2 42/47] drm/ttm: introduce pool_shrink_rwsem
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20230724094354.90817-43-zhengqi.arch@bytedance.com>
Date: Wed, 26 Jul 2023 15:56:40 +0800
Cc: Andrew Morton <akpm@linux-foundation.org>,
 david@fromorbit.com,
 tkhai@ya.ru,
 Vlastimil Babka <vbabka@suse.cz>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 djwong@kernel.org,
 Christian Brauner <brauner@kernel.org>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 tytso@mit.edu,
 steven.price@arm.com,
 cel@kernel.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 yujie.liu@intel.com,
 gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org,
 linux-mm@kvack.org,
 x86@kernel.org,
 kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org,
 linux-erofs@lists.ozlabs.org,
 linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com,
 linux-nfs@vger.kernel.org,
 linux-mtd@lists.infradead.org,
 rcu@vger.kernel.org,
 netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org,
 dm-devel@redhat.com,
 linux-raid@vger.kernel.org,
 linux-bcache@vger.kernel.org,
 virtualization@lists.linux-foundation.org,
 linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <FB7D0111-36DB-4F76-831B-4D20E997EB93@linux.dev>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
 <20230724094354.90817-43-zhengqi.arch@bytedance.com>
To: Qi Zheng <zhengqi.arch@bytedance.com>
X-Migadu-Flow: FLOW_OUT



> On Jul 24, 2023, at 17:43, Qi Zheng <zhengqi.arch@bytedance.com> wrote:
> 
> Currently, the synchronize_shrinkers() is only used by TTM pool. It only
> requires that no shrinkers run in parallel.
> 
> After we use RCU+refcount method to implement the lockless slab shrink,
> we can not use shrinker_rwsem or synchronize_rcu() to guarantee that all
> shrinker invocations have seen an update before freeing memory.
> 
> So we introduce a new pool_shrink_rwsem to implement a private
> synchronize_shrinkers(), so as to achieve the same purpose.
> 
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>

Reviewed-by: Muchun Song <songmuchun@bytedance.com>



