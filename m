Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86947773504
	for <lists+xen-devel@lfdr.de>; Tue,  8 Aug 2023 01:29:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.579175.907035 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT9eh-0004nN-Eu; Mon, 07 Aug 2023 23:28:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 579175.907035; Mon, 07 Aug 2023 23:28:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qT9eh-0004lJ-C4; Mon, 07 Aug 2023 23:28:55 +0000
Received: by outflank-mailman (input) for mailman id 579175;
 Mon, 07 Aug 2023 23:28:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wJHS=DY=fromorbit.com=david@srs-se1.protection.inumbo.net>)
 id 1qT9eg-0004lD-IO
 for xen-devel@lists.xenproject.org; Mon, 07 Aug 2023 23:28:54 +0000
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [2607:f8b0:4864:20::42b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 29722fc7-357a-11ee-8613-37d641c3527e;
 Tue, 08 Aug 2023 01:28:50 +0200 (CEST)
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-6874d1c8610so3598397b3a.0
 for <xen-devel@lists.xenproject.org>; Mon, 07 Aug 2023 16:28:50 -0700 (PDT)
Received: from dread.disaster.area (pa49-180-166-213.pa.nsw.optusnet.com.au.
 [49.180.166.213]) by smtp.gmail.com with ESMTPSA id
 e18-20020aa78c52000000b0068620bee456sm6663729pfd.209.2023.08.07.16.28.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 16:28:47 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.96)
 (envelope-from <david@fromorbit.com>) id 1qT9eW-002TeM-1d;
 Tue, 08 Aug 2023 09:28:44 +1000
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
X-Inumbo-ID: 29722fc7-357a-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fromorbit-com.20221208.gappssmtp.com; s=20221208; t=1691450928; x=1692055728;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0xqamAux0UTVG6klbJHwJNM84FqVsjBhqmY+h06Y7S4=;
        b=adlg0mZ+HbNffKaKec2p7cVEI4EUlpFfVSVpmG5fvHzHnQEOdBYZjEy4QnkJtTu7lu
         YmN6EGaH1vJkJ2ZOmqiBcV/yaN6Y4JVna47CjKD7nPXpOiMzYNw9UySGma80pWoaj7Dk
         jUxXtUXqouB4bUXn3WeUBdMeMQNzv8NtKVfvER+m7KEKe99ZrQWUTG4Y9TUCDw4Kbcew
         TFF8/aAopaaIk2YO3rVVNpTSZmvFLss5lfJ8bn13k+LTkCPg51SMuEfV97r2Zvr+7s3C
         AcdJXj3qJcnQFWBnyvELMIWQLaBKzEk7yCwrvdFLv4Z0y5aFUIdjan9j2uUGZT7xZ3GX
         Ib8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691450928; x=1692055728;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0xqamAux0UTVG6klbJHwJNM84FqVsjBhqmY+h06Y7S4=;
        b=hIbGiV/uBU2CpqN3+ZpRx/fkIxo8ZvMsN5jTLsUhRCwF06P5iypftFJZG8dzZETvbZ
         TAKrsslkxePnm7wE7D+pZzd3weIxr/Pz63RV9pbxim3s2bkdiFAytnB8f5l2Dj0ZdD8m
         icSFqB7d0/DdXLYc11Jfrsh7mon3YcQvVm+O8bG7vtwb+DYWke7Ck2Q25IHMefMnxN5+
         FyCJK4aAKQJjVplHoZic83tSB0q5WZ0rgyE0oEHesgaysmHtZ02J6pfatCNewF60+WB/
         gqc8Sa3tTwLaXiJBR54TPecExGQObR9CgE2qx/ixAjroq1mSPGF9ZBkJO6rzWxwO9q3H
         c4Ig==
X-Gm-Message-State: AOJu0Yx85Phc7YRLWaKWfdt2skc/xSOrd+zydIfdrol83pRaPBSaDpW8
	iuJuBYTx/hhB4RFrPzWV+HYGvw==
X-Google-Smtp-Source: AGHT+IHWcHOenJQfOaWa9c7YDyMdy3l3j1H0rEzsEcwqog5HJ9HhPve3KCBNDXb4QQT+YEAg/cljWw==
X-Received: by 2002:a05:6a20:8e04:b0:13c:8e50:34b8 with SMTP id y4-20020a056a208e0400b0013c8e5034b8mr12892217pzj.35.1691450928413;
        Mon, 07 Aug 2023 16:28:48 -0700 (PDT)
Date: Tue, 8 Aug 2023 09:28:44 +1000
From: Dave Chinner <david@fromorbit.com>
To: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: akpm@linux-foundation.org, tkhai@ya.ru, vbabka@suse.cz,
	roman.gushchin@linux.dev, djwong@kernel.org, brauner@kernel.org,
	paulmck@kernel.org, tytso@mit.edu, steven.price@arm.com,
	cel@kernel.org, senozhatsky@chromium.org, yujie.liu@intel.com,
	gregkh@linuxfoundation.org, muchun.song@linux.dev,
	simon.horman@corigine.com, dlemoal@kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
	kvm@vger.kernel.org, xen-devel@lists.xenproject.org,
	linux-erofs@lists.ozlabs.org,
	linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
	linux-nfs@vger.kernel.org, linux-mtd@lists.infradead.org,
	rcu@vger.kernel.org, netdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
	dm-devel@redhat.com, linux-raid@vger.kernel.org,
	linux-bcache@vger.kernel.org,
	virtualization@lists.linux-foundation.org,
	linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
	linux-xfs@vger.kernel.org, linux-btrfs@vger.kernel.org
Subject: Re: [PATCH v4 45/48] mm: shrinker: make global slab shrink lockless
Message-ID: <ZNF+LLUpKWHDEG1u@dread.disaster.area>
References: <20230807110936.21819-1-zhengqi.arch@bytedance.com>
 <20230807110936.21819-46-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230807110936.21819-46-zhengqi.arch@bytedance.com>

On Mon, Aug 07, 2023 at 07:09:33PM +0800, Qi Zheng wrote:
> The shrinker_rwsem is a global read-write lock in shrinkers subsystem,
> which protects most operations such as slab shrink, registration and
> unregistration of shrinkers, etc. This can easily cause problems in the
> following cases.
....
> This commit uses the refcount+RCU method [5] proposed by Dave Chinner
> to re-implement the lockless global slab shrink. The memcg slab shrink is
> handled in the subsequent patch.
....
> ---
>  include/linux/shrinker.h | 17 ++++++++++
>  mm/shrinker.c            | 70 +++++++++++++++++++++++++++++-----------
>  2 files changed, 68 insertions(+), 19 deletions(-)

There's no documentation in the code explaining how the lockless
shrinker algorithm works. It's left to the reader to work out how
this all goes together....

> diff --git a/include/linux/shrinker.h b/include/linux/shrinker.h
> index eb342994675a..f06225f18531 100644
> --- a/include/linux/shrinker.h
> +++ b/include/linux/shrinker.h
> @@ -4,6 +4,8 @@
>  
>  #include <linux/atomic.h>
>  #include <linux/types.h>
> +#include <linux/refcount.h>
> +#include <linux/completion.h>
>  
>  #define SHRINKER_UNIT_BITS	BITS_PER_LONG
>  
> @@ -87,6 +89,10 @@ struct shrinker {
>  	int seeks;	/* seeks to recreate an obj */
>  	unsigned flags;
>  
> +	refcount_t refcount;
> +	struct completion done;
> +	struct rcu_head rcu;

What does the refcount protect, why do we need the completion, etc?

> +
>  	void *private_data;
>  
>  	/* These are for internal use */
> @@ -120,6 +126,17 @@ struct shrinker *shrinker_alloc(unsigned int flags, const char *fmt, ...);
>  void shrinker_register(struct shrinker *shrinker);
>  void shrinker_free(struct shrinker *shrinker);
>  
> +static inline bool shrinker_try_get(struct shrinker *shrinker)
> +{
> +	return refcount_inc_not_zero(&shrinker->refcount);
> +}
> +
> +static inline void shrinker_put(struct shrinker *shrinker)
> +{
> +	if (refcount_dec_and_test(&shrinker->refcount))
> +		complete(&shrinker->done);
> +}
> +
>  #ifdef CONFIG_SHRINKER_DEBUG
>  extern int __printf(2, 3) shrinker_debugfs_rename(struct shrinker *shrinker,
>  						  const char *fmt, ...);
> diff --git a/mm/shrinker.c b/mm/shrinker.c
> index 1911c06b8af5..d318f5621862 100644
> --- a/mm/shrinker.c
> +++ b/mm/shrinker.c
> @@ -2,6 +2,7 @@
>  #include <linux/memcontrol.h>
>  #include <linux/rwsem.h>
>  #include <linux/shrinker.h>
> +#include <linux/rculist.h>
>  #include <trace/events/vmscan.h>
>  
>  #include "internal.h"
> @@ -577,33 +578,42 @@ unsigned long shrink_slab(gfp_t gfp_mask, int nid, struct mem_cgroup *memcg,
>  	if (!mem_cgroup_disabled() && !mem_cgroup_is_root(memcg))
>  		return shrink_slab_memcg(gfp_mask, nid, memcg, priority);
>  
> -	if (!down_read_trylock(&shrinker_rwsem))
> -		goto out;
> -
> -	list_for_each_entry(shrinker, &shrinker_list, list) {
> +	rcu_read_lock();
> +	list_for_each_entry_rcu(shrinker, &shrinker_list, list) {
>  		struct shrink_control sc = {
>  			.gfp_mask = gfp_mask,
>  			.nid = nid,
>  			.memcg = memcg,
>  		};
>  
> +		if (!shrinker_try_get(shrinker))
> +			continue;
> +
> +		/*
> +		 * We can safely unlock the RCU lock here since we already
> +		 * hold the refcount of the shrinker.
> +		 */
> +		rcu_read_unlock();
> +
>  		ret = do_shrink_slab(&sc, shrinker, priority);
>  		if (ret == SHRINK_EMPTY)
>  			ret = 0;
>  		freed += ret;
> +
>  		/*
> -		 * Bail out if someone want to register a new shrinker to
> -		 * prevent the registration from being stalled for long periods
> -		 * by parallel ongoing shrinking.
> +		 * This shrinker may be deleted from shrinker_list and freed
> +		 * after the shrinker_put() below, but this shrinker is still
> +		 * used for the next traversal. So it is necessary to hold the
> +		 * RCU lock first to prevent this shrinker from being freed,
> +		 * which also ensures that the next shrinker that is traversed
> +		 * will not be freed (even if it is deleted from shrinker_list
> +		 * at the same time).
>  		 */

This comment really should be at the head of the function,
describing the algorithm used within the function itself. i.e. how
reference counts are used w.r.t. the rcu_read_lock() usage to
guarantee existence of the shrinker and the validity of the list
walk.

I'm not going to remember all these little details when I look at
this code in another 6 months time, and having to work it out from
first principles every time I look at the code will waste of a lot
of time...

-Dave.
-- 
Dave Chinner
david@fromorbit.com

