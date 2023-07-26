Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89748762DBA
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 09:32:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570134.891582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOZ0Y-0000FI-GX; Wed, 26 Jul 2023 07:32:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570134.891582; Wed, 26 Jul 2023 07:32:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOZ0Y-0000DV-Cl; Wed, 26 Jul 2023 07:32:30 +0000
Received: by outflank-mailman (input) for mailman id 570134;
 Wed, 26 Jul 2023 07:32:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pzNf=DM=linux.dev=muchun.song@srs-se1.protection.inumbo.net>)
 id 1qOZ0X-0000DJ-3V
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 07:32:29 +0000
Received: from out-9.mta1.migadu.com (out-9.mta1.migadu.com [95.215.58.9])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 91bb1b9f-2b86-11ee-8613-37d641c3527e;
 Wed, 26 Jul 2023 09:32:26 +0200 (CEST)
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
X-Inumbo-ID: 91bb1b9f-2b86-11ee-8613-37d641c3527e
Message-ID: <4ee26da4-314e-0517-5d9a-31fb107368ef@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1690356746;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OYGRVTqgscFQdcJoAIv1RQJgZK2J3Xems6RanwsA4o0=;
	b=GCsKw+CqeG0NLvU5JG9vhNLkiCqBIozjq4+mghrN4n54qEc8Ada19ZBzziy+rqbgGP2UKc
	TRnfIbI6wQqD1XzBynZ64zgbT937OIDi9314tjiKBhNwZptVDCqjhQglYT3NeOO47ZzKdD
	/L1dy0OB1iSvzxJ2Vh5k44+kOPJOpuA=
Date: Wed, 26 Jul 2023 15:32:10 +0800
MIME-Version: 1.0
Subject: Re: [PATCH v2 28/47] bcache: dynamically allocate the md-bcache
 shrinker
To: Qi Zheng <zhengqi.arch@bytedance.com>, akpm@linux-foundation.org,
 david@fromorbit.com, tkhai@ya.ru, vbabka@suse.cz, roman.gushchin@linux.dev,
 djwong@kernel.org, brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
 steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
 yujie.liu@intel.com, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
 kvm@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-erofs@lists.ozlabs.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, linux-nfs@vger.kernel.org,
 linux-mtd@lists.infradead.org, rcu@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 dm-devel@redhat.com, linux-raid@vger.kernel.org,
 linux-bcache@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org, linux-btrfs@vger.kernel.org
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
 <20230724094354.90817-29-zhengqi.arch@bytedance.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20230724094354.90817-29-zhengqi.arch@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT



On 2023/7/24 17:43, Qi Zheng wrote:
> In preparation for implementing lockless slab shrink, use new APIs to
> dynamically allocate the md-bcache shrinker, so that it can be freed
> asynchronously using kfree_rcu(). Then it doesn't need to wait for RCU
> read-side critical section when releasing the struct cache_set.
>
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> ---
>   drivers/md/bcache/bcache.h |  2 +-
>   drivers/md/bcache/btree.c  | 27 ++++++++++++++++-----------
>   drivers/md/bcache/sysfs.c  |  3 ++-
>   3 files changed, 19 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/md/bcache/bcache.h b/drivers/md/bcache/bcache.h
> index 5a79bb3c272f..c622bc50f81b 100644
> --- a/drivers/md/bcache/bcache.h
> +++ b/drivers/md/bcache/bcache.h
> @@ -541,7 +541,7 @@ struct cache_set {
>   	struct bio_set		bio_split;
>   
>   	/* For the btree cache */
> -	struct shrinker		shrink;
> +	struct shrinker		*shrink;
>   
>   	/* For the btree cache and anything allocation related */
>   	struct mutex		bucket_lock;
> diff --git a/drivers/md/bcache/btree.c b/drivers/md/bcache/btree.c
> index fd121a61f17c..c176c7fc77d9 100644
> --- a/drivers/md/bcache/btree.c
> +++ b/drivers/md/bcache/btree.c
> @@ -667,7 +667,7 @@ static int mca_reap(struct btree *b, unsigned int min_order, bool flush)
>   static unsigned long bch_mca_scan(struct shrinker *shrink,
>   				  struct shrink_control *sc)
>   {
> -	struct cache_set *c = container_of(shrink, struct cache_set, shrink);
> +	struct cache_set *c = shrink->private_data;
>   	struct btree *b, *t;
>   	unsigned long i, nr = sc->nr_to_scan;
>   	unsigned long freed = 0;
> @@ -734,7 +734,7 @@ static unsigned long bch_mca_scan(struct shrinker *shrink,
>   static unsigned long bch_mca_count(struct shrinker *shrink,
>   				   struct shrink_control *sc)
>   {
> -	struct cache_set *c = container_of(shrink, struct cache_set, shrink);
> +	struct cache_set *c = shrink->private_data;
>   
>   	if (c->shrinker_disabled)
>   		return 0;
> @@ -752,8 +752,8 @@ void bch_btree_cache_free(struct cache_set *c)
>   
>   	closure_init_stack(&cl);
>   
> -	if (c->shrink.list.next)
> -		unregister_shrinker(&c->shrink);
> +	if (c->shrink)
> +		shrinker_unregister(c->shrink);
>   
>   	mutex_lock(&c->bucket_lock);
>   
> @@ -828,14 +828,19 @@ int bch_btree_cache_alloc(struct cache_set *c)
>   		c->verify_data = NULL;
>   #endif
>   
> -	c->shrink.count_objects = bch_mca_count;
> -	c->shrink.scan_objects = bch_mca_scan;
> -	c->shrink.seeks = 4;
> -	c->shrink.batch = c->btree_pages * 2;
> +	c->shrink = shrinker_alloc(0, "md-bcache:%pU", c->set_uuid);
> +	if (!c->shrink) {
> +		pr_warn("bcache: %s: could not allocate shrinker\n", __func__);
> +		return -ENOMEM;

Seems you have cheanged the semantic of this. In the past,
it is better to have a shrinker, but now it becomes a mandatory.
Right? I don't know if it is acceptable. From my point of view,
just do the cleanup, don't change any behaviour.

> +	}
> +
> +	c->shrink->count_objects = bch_mca_count;
> +	c->shrink->scan_objects = bch_mca_scan;
> +	c->shrink->seeks = 4;
> +	c->shrink->batch = c->btree_pages * 2;
> +	c->shrink->private_data = c;
>   
> -	if (register_shrinker(&c->shrink, "md-bcache:%pU", c->set_uuid))
> -		pr_warn("bcache: %s: could not register shrinker\n",
> -				__func__);
> +	shrinker_register(c->shrink);
>   
>   	return 0;
>   }
> diff --git a/drivers/md/bcache/sysfs.c b/drivers/md/bcache/sysfs.c
> index 0e2c1880f60b..45d8af755de6 100644
> --- a/drivers/md/bcache/sysfs.c
> +++ b/drivers/md/bcache/sysfs.c
> @@ -866,7 +866,8 @@ STORE(__bch_cache_set)
>   
>   		sc.gfp_mask = GFP_KERNEL;
>   		sc.nr_to_scan = strtoul_or_return(buf);
> -		c->shrink.scan_objects(&c->shrink, &sc);
> +		if (c->shrink)
> +			c->shrink->scan_objects(c->shrink, &sc);
>   	}
>   
>   	sysfs_strtoul_clamp(congested_read_threshold_us,


