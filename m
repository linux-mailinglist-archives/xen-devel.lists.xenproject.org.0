Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99DAC762BE8
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 08:49:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570077.891392 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOYKo-0001jC-UB; Wed, 26 Jul 2023 06:49:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570077.891392; Wed, 26 Jul 2023 06:49:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOYKo-0001g9-RQ; Wed, 26 Jul 2023 06:49:22 +0000
Received: by outflank-mailman (input) for mailman id 570077;
 Wed, 26 Jul 2023 06:49:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pzNf=DM=linux.dev=muchun.song@srs-se1.protection.inumbo.net>)
 id 1qOYKn-0001g1-Ma
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 06:49:21 +0000
Received: from out-3.mta0.migadu.com (out-3.mta0.migadu.com
 [2001:41d0:1004:224b::3])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8b7c962c-2b80-11ee-8613-37d641c3527e;
 Wed, 26 Jul 2023 08:49:19 +0200 (CEST)
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
X-Inumbo-ID: 8b7c962c-2b80-11ee-8613-37d641c3527e
Message-ID: <e7204276-9de5-17eb-90ae-e51657d73ef4@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1690354158;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=07kRInGgcVMiksfMsun8p4HGvWms170mUSINrsZDIPU=;
	b=SItOX2s1O2xRbklfqsU1E20kPvGPKi6lNjfeuPsz787gwDukUtasKQC+RRJ78xAQZyjij6
	0JlhE8ny7YCW/WIa1zfjcf/R7sJjT11NiI0YLFw4BmC6xi+4P258FcCDYig5b0NazpkEtw
	pJl7w1nj4tDpMcmLDY8eVxmHbXISOTw=
Date: Wed, 26 Jul 2023 14:49:05 +0800
MIME-Version: 1.0
Subject: Re: [PATCH v2 11/47] gfs2: dynamically allocate the gfs2-qd shrinker
To: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
 kvm@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-erofs@lists.ozlabs.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, linux-nfs@vger.kernel.org,
 linux-mtd@lists.infradead.org, rcu@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 dm-devel@redhat.com, linux-raid@vger.kernel.org,
 linux-bcache@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org, linux-btrfs@vger.kernel.org,
 akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru, vbabka@suse.cz,
 roman.gushchin@linux.dev, djwong@kernel.org, brauner@kernel.org,
 paulmck@kernel.org, tytso@mit.edu, steven.price@arm.com, cel@kernel.org,
 senozhatsky@chromium.org, yujie.liu@intel.com, gregkh@linuxfoundation.org
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
 <20230724094354.90817-12-zhengqi.arch@bytedance.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20230724094354.90817-12-zhengqi.arch@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT



On 2023/7/24 17:43, Qi Zheng wrote:
> Use new APIs to dynamically allocate the gfs2-qd shrinker.
>
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> ---
>   fs/gfs2/main.c  |  6 +++---
>   fs/gfs2/quota.c | 26 ++++++++++++++++++++------
>   fs/gfs2/quota.h |  3 ++-
>   3 files changed, 25 insertions(+), 10 deletions(-)
>
> diff --git a/fs/gfs2/main.c b/fs/gfs2/main.c
> index afcb32854f14..e47b1cc79f59 100644
> --- a/fs/gfs2/main.c
> +++ b/fs/gfs2/main.c
> @@ -147,7 +147,7 @@ static int __init init_gfs2_fs(void)
>   	if (!gfs2_trans_cachep)
>   		goto fail_cachep8;
>   
> -	error = register_shrinker(&gfs2_qd_shrinker, "gfs2-qd");
> +	error = gfs2_qd_shrinker_init();
>   	if (error)
>   		goto fail_shrinker;
>   
> @@ -196,7 +196,7 @@ static int __init init_gfs2_fs(void)
>   fail_wq2:
>   	destroy_workqueue(gfs_recovery_wq);
>   fail_wq1:
> -	unregister_shrinker(&gfs2_qd_shrinker);
> +	gfs2_qd_shrinker_exit();
>   fail_shrinker:
>   	kmem_cache_destroy(gfs2_trans_cachep);
>   fail_cachep8:
> @@ -229,7 +229,7 @@ static int __init init_gfs2_fs(void)
>   
>   static void __exit exit_gfs2_fs(void)
>   {
> -	unregister_shrinker(&gfs2_qd_shrinker);
> +	gfs2_qd_shrinker_exit();
>   	gfs2_glock_exit();
>   	gfs2_unregister_debugfs();
>   	unregister_filesystem(&gfs2_fs_type);
> diff --git a/fs/gfs2/quota.c b/fs/gfs2/quota.c
> index 704192b73605..bc9883cea847 100644
> --- a/fs/gfs2/quota.c
> +++ b/fs/gfs2/quota.c
> @@ -186,13 +186,27 @@ static unsigned long gfs2_qd_shrink_count(struct shrinker *shrink,
>   	return vfs_pressure_ratio(list_lru_shrink_count(&gfs2_qd_lru, sc));
>   }
>   
> -struct shrinker gfs2_qd_shrinker = {
> -	.count_objects = gfs2_qd_shrink_count,
> -	.scan_objects = gfs2_qd_shrink_scan,
> -	.seeks = DEFAULT_SEEKS,
> -	.flags = SHRINKER_NUMA_AWARE,
> -};
> +static struct shrinker *gfs2_qd_shrinker;
> +
> +int gfs2_qd_shrinker_init(void)

It's better to declare this as __init.

> +{
> +	gfs2_qd_shrinker = shrinker_alloc(SHRINKER_NUMA_AWARE, "gfs2-qd");
> +	if (!gfs2_qd_shrinker)
> +		return -ENOMEM;
> +
> +	gfs2_qd_shrinker->count_objects = gfs2_qd_shrink_count;
> +	gfs2_qd_shrinker->scan_objects = gfs2_qd_shrink_scan;
> +	gfs2_qd_shrinker->seeks = DEFAULT_SEEKS;
> +
> +	shrinker_register(gfs2_qd_shrinker);
>   
> +	return 0;
> +}
> +
> +void gfs2_qd_shrinker_exit(void)
> +{
> +	shrinker_unregister(gfs2_qd_shrinker);
> +}
>   
>   static u64 qd2index(struct gfs2_quota_data *qd)
>   {
> diff --git a/fs/gfs2/quota.h b/fs/gfs2/quota.h
> index 21ada332d555..f9cb863373f7 100644
> --- a/fs/gfs2/quota.h
> +++ b/fs/gfs2/quota.h
> @@ -59,7 +59,8 @@ static inline int gfs2_quota_lock_check(struct gfs2_inode *ip,
>   }
>   
>   extern const struct quotactl_ops gfs2_quotactl_ops;
> -extern struct shrinker gfs2_qd_shrinker;
> +int gfs2_qd_shrinker_init(void);
> +void gfs2_qd_shrinker_exit(void);
>   extern struct list_lru gfs2_qd_lru;
>   extern void __init gfs2_quota_hash_init(void);
>   


