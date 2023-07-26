Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D69EF762D35
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 09:24:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570119.891532 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOYsj-0004sI-KM; Wed, 26 Jul 2023 07:24:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570119.891532; Wed, 26 Jul 2023 07:24:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOYsj-0004qO-HE; Wed, 26 Jul 2023 07:24:25 +0000
Received: by outflank-mailman (input) for mailman id 570119;
 Wed, 26 Jul 2023 07:24:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pzNf=DM=linux.dev=muchun.song@srs-se1.protection.inumbo.net>)
 id 1qOYsi-0004qC-HH
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 07:24:24 +0000
Received: from out-34.mta1.migadu.com (out-34.mta1.migadu.com [95.215.58.34])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 71823979-2b85-11ee-b242-6b7b168915f2;
 Wed, 26 Jul 2023 09:24:23 +0200 (CEST)
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
X-Inumbo-ID: 71823979-2b85-11ee-b242-6b7b168915f2
Message-ID: <17de3f5b-3bef-be38-9801-0e84cfe8539b@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1690356262;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nTTDffXkzxVXBy4JmC8uLINROt4TIYQk3fp5u25NUNM=;
	b=BnM6ObbVvlHjNT0EQ9FNfJjw5uDAlrCLhNEcIu2YqjXKf/vGuoud+hHft88ZtRNtDuEwCg
	tBOK3Iz/LamlBXXb/s2VBKik1ft+6SPkGLcP8h8g11eIlgemJmkdkTnX+9qLAUoZF66N+E
	FHLnBM7v5jm+QRNUOfsvfgruR8wkbzM=
Date: Wed, 26 Jul 2023 15:24:02 +0800
MIME-Version: 1.0
Subject: Re: [PATCH v2 23/47] drm/msm: dynamically allocate the drm-msm_gem
 shrinker
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
 <20230724094354.90817-24-zhengqi.arch@bytedance.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20230724094354.90817-24-zhengqi.arch@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT



On 2023/7/24 17:43, Qi Zheng wrote:
> In preparation for implementing lockless slab shrink, use new APIs to
> dynamically allocate the drm-msm_gem shrinker, so that it can be freed
> asynchronously using kfree_rcu(). Then it doesn't need to wait for RCU
> read-side critical section when releasing the struct msm_drm_private.
>
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>

Reviewed-by: Muchun Song <songmuchun@bytedance.com>

A nit bellow.

> ---
>   drivers/gpu/drm/msm/msm_drv.c          |  4 ++-
>   drivers/gpu/drm/msm/msm_drv.h          |  4 +--
>   drivers/gpu/drm/msm/msm_gem_shrinker.c | 36 ++++++++++++++++----------
>   3 files changed, 28 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 891eff8433a9..7f6933be703f 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -461,7 +461,9 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
>   	if (ret)
>   		goto err_msm_uninit;
>   
> -	msm_gem_shrinker_init(ddev);
> +	ret = msm_gem_shrinker_init(ddev);
> +	if (ret)
> +		goto err_msm_uninit;
>   
>   	if (priv->kms_init) {
>   		ret = priv->kms_init(ddev);
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index e13a8cbd61c9..84523d4a1e58 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -217,7 +217,7 @@ struct msm_drm_private {
>   	} vram;
>   
>   	struct notifier_block vmap_notifier;
> -	struct shrinker shrinker;
> +	struct shrinker *shrinker;
>   
>   	struct drm_atomic_state *pm_state;
>   
> @@ -279,7 +279,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
>   unsigned long msm_gem_shrinker_shrink(struct drm_device *dev, unsigned long nr_to_scan);
>   #endif
>   
> -void msm_gem_shrinker_init(struct drm_device *dev);
> +int msm_gem_shrinker_init(struct drm_device *dev);
>   void msm_gem_shrinker_cleanup(struct drm_device *dev);
>   
>   int msm_gem_prime_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma);
> diff --git a/drivers/gpu/drm/msm/msm_gem_shrinker.c b/drivers/gpu/drm/msm/msm_gem_shrinker.c
> index f38296ad8743..7daab1298c11 100644
> --- a/drivers/gpu/drm/msm/msm_gem_shrinker.c
> +++ b/drivers/gpu/drm/msm/msm_gem_shrinker.c
> @@ -34,8 +34,7 @@ static bool can_block(struct shrink_control *sc)
>   static unsigned long
>   msm_gem_shrinker_count(struct shrinker *shrinker, struct shrink_control *sc)
>   {
> -	struct msm_drm_private *priv =
> -		container_of(shrinker, struct msm_drm_private, shrinker);
> +	struct msm_drm_private *priv = shrinker->private_data;
>   	unsigned count = priv->lru.dontneed.count;
>   
>   	if (can_swap())
> @@ -100,8 +99,7 @@ active_evict(struct drm_gem_object *obj)
>   static unsigned long
>   msm_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
>   {
> -	struct msm_drm_private *priv =
> -		container_of(shrinker, struct msm_drm_private, shrinker);
> +	struct msm_drm_private *priv = shrinker->private_data;
>   	struct {
>   		struct drm_gem_lru *lru;
>   		bool (*shrink)(struct drm_gem_object *obj);
> @@ -148,10 +146,11 @@ msm_gem_shrinker_shrink(struct drm_device *dev, unsigned long nr_to_scan)
>   	struct shrink_control sc = {
>   		.nr_to_scan = nr_to_scan,
>   	};
> -	int ret;
> +	unsigned long ret = SHRINK_STOP;
>   
>   	fs_reclaim_acquire(GFP_KERNEL);
> -	ret = msm_gem_shrinker_scan(&priv->shrinker, &sc);
> +	if (priv->shrinker)
> +		ret = msm_gem_shrinker_scan(priv->shrinker, &sc);
>   	fs_reclaim_release(GFP_KERNEL);
>   
>   	return ret;
> @@ -210,16 +209,27 @@ msm_gem_shrinker_vmap(struct notifier_block *nb, unsigned long event, void *ptr)
>    *
>    * This function registers and sets up the msm shrinker.
>    */
> -void msm_gem_shrinker_init(struct drm_device *dev)
> +int msm_gem_shrinker_init(struct drm_device *dev)
>   {
>   	struct msm_drm_private *priv = dev->dev_private;
> -	priv->shrinker.count_objects = msm_gem_shrinker_count;
> -	priv->shrinker.scan_objects = msm_gem_shrinker_scan;
> -	priv->shrinker.seeks = DEFAULT_SEEKS;
> -	WARN_ON(register_shrinker(&priv->shrinker, "drm-msm_gem"));
> +
> +	priv->shrinker = shrinker_alloc(0, "drm-msm_gem");
> +	if (!priv->shrinker) {

Just "if (WARN_ON(!priv->shrinker))"

> +		WARN_ON(1);
> +		return -ENOMEM;
> +	}
> +
> +	priv->shrinker->count_objects = msm_gem_shrinker_count;
> +	priv->shrinker->scan_objects = msm_gem_shrinker_scan;
> +	priv->shrinker->seeks = DEFAULT_SEEKS;
> +	priv->shrinker->private_data = priv;
> +
> +	shrinker_register(priv->shrinker);
>   
>   	priv->vmap_notifier.notifier_call = msm_gem_shrinker_vmap;
>   	WARN_ON(register_vmap_purge_notifier(&priv->vmap_notifier));
> +
> +	return 0;
>   }
>   
>   /**
> @@ -232,8 +242,8 @@ void msm_gem_shrinker_cleanup(struct drm_device *dev)
>   {
>   	struct msm_drm_private *priv = dev->dev_private;
>   
> -	if (priv->shrinker.nr_deferred) {
> +	if (priv->shrinker) {
>   		WARN_ON(unregister_vmap_purge_notifier(&priv->vmap_notifier));
> -		unregister_shrinker(&priv->shrinker);
> +		shrinker_unregister(priv->shrinker);
>   	}
>   }


