Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D470B75F4C5
	for <lists+xen-devel@lfdr.de>; Mon, 24 Jul 2023 13:18:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.568795.888835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNtZY-0000Ap-6g; Mon, 24 Jul 2023 11:17:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 568795.888835; Mon, 24 Jul 2023 11:17:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qNtZY-00008A-3v; Mon, 24 Jul 2023 11:17:52 +0000
Received: by outflank-mailman (input) for mailman id 568795;
 Mon, 24 Jul 2023 11:17:50 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BDRN=DK=arm.com=steven.price@srs-se1.protection.inumbo.net>)
 id 1qNtZW-000084-J5
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 11:17:50 +0000
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id b7bc57ef-2a13-11ee-b23a-6b7b168915f2;
 Mon, 24 Jul 2023 13:17:47 +0200 (CEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B206CDE0;
 Mon, 24 Jul 2023 04:18:29 -0700 (PDT)
Received: from [10.57.34.62] (unknown [10.57.34.62])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C518B3F5A1;
 Mon, 24 Jul 2023 04:17:39 -0700 (PDT)
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
X-Inumbo-ID: b7bc57ef-2a13-11ee-b23a-6b7b168915f2
Message-ID: <cdd08c9e-81d3-a85f-5426-5db738aa73ec@arm.com>
Date: Mon, 24 Jul 2023 12:17:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 24/47] drm/panfrost: dynamically allocate the
 drm-panfrost shrinker
To: Qi Zheng <zhengqi.arch@bytedance.com>, akpm@linux-foundation.org,
 david@fromorbit.com, tkhai@ya.ru, vbabka@suse.cz, roman.gushchin@linux.dev,
 djwong@kernel.org, brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
 cel@kernel.org, senozhatsky@chromium.org, yujie.liu@intel.com,
 gregkh@linuxfoundation.org, muchun.song@linux.dev
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
 <20230724094354.90817-25-zhengqi.arch@bytedance.com>
Content-Language: en-GB
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20230724094354.90817-25-zhengqi.arch@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24/07/2023 10:43, Qi Zheng wrote:
> In preparation for implementing lockless slab shrink, use new APIs to
> dynamically allocate the drm-panfrost shrinker, so that it can be freed
> asynchronously using kfree_rcu(). Then it doesn't need to wait for RCU
> read-side critical section when releasing the struct panfrost_device.
> 
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>

One nit below, but otherwise:

Reviewed-by: Steven Price <steven.price@arm.com>

> ---
>  drivers/gpu/drm/panfrost/panfrost_device.h    |  2 +-
>  drivers/gpu/drm/panfrost/panfrost_drv.c       |  6 +++-
>  drivers/gpu/drm/panfrost/panfrost_gem.h       |  2 +-
>  .../gpu/drm/panfrost/panfrost_gem_shrinker.c  | 32 ++++++++++++-------
>  4 files changed, 27 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
> index b0126b9fbadc..e667e5689353 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_device.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_device.h
> @@ -118,7 +118,7 @@ struct panfrost_device {
>  
>  	struct mutex shrinker_lock;
>  	struct list_head shrinker_list;
> -	struct shrinker shrinker;
> +	struct shrinker *shrinker;
>  
>  	struct panfrost_devfreq pfdevfreq;
>  };
> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
> index bbada731bbbd..f705bbdea360 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
> @@ -598,10 +598,14 @@ static int panfrost_probe(struct platform_device *pdev)
>  	if (err < 0)
>  		goto err_out1;
>  
> -	panfrost_gem_shrinker_init(ddev);
> +	err = panfrost_gem_shrinker_init(ddev);
> +	if (err)
> +		goto err_out2;
>  
>  	return 0;
>  
> +err_out2:
> +	drm_dev_unregister(ddev);
>  err_out1:
>  	pm_runtime_disable(pfdev->dev);
>  	panfrost_device_fini(pfdev);
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.h b/drivers/gpu/drm/panfrost/panfrost_gem.h
> index ad2877eeeccd..863d2ec8d4f0 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gem.h
> +++ b/drivers/gpu/drm/panfrost/panfrost_gem.h
> @@ -81,7 +81,7 @@ panfrost_gem_mapping_get(struct panfrost_gem_object *bo,
>  void panfrost_gem_mapping_put(struct panfrost_gem_mapping *mapping);
>  void panfrost_gem_teardown_mappings_locked(struct panfrost_gem_object *bo);
>  
> -void panfrost_gem_shrinker_init(struct drm_device *dev);
> +int panfrost_gem_shrinker_init(struct drm_device *dev);
>  void panfrost_gem_shrinker_cleanup(struct drm_device *dev);
>  
>  #endif /* __PANFROST_GEM_H__ */
> diff --git a/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c b/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
> index bf0170782f25..9a90dfb5301f 100644
> --- a/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
> +++ b/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
> @@ -18,8 +18,7 @@
>  static unsigned long
>  panfrost_gem_shrinker_count(struct shrinker *shrinker, struct shrink_control *sc)
>  {
> -	struct panfrost_device *pfdev =
> -		container_of(shrinker, struct panfrost_device, shrinker);
> +	struct panfrost_device *pfdev = shrinker->private_data;
>  	struct drm_gem_shmem_object *shmem;
>  	unsigned long count = 0;
>  
> @@ -65,8 +64,7 @@ static bool panfrost_gem_purge(struct drm_gem_object *obj)
>  static unsigned long
>  panfrost_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
>  {
> -	struct panfrost_device *pfdev =
> -		container_of(shrinker, struct panfrost_device, shrinker);
> +	struct panfrost_device *pfdev = shrinker->private_data;
>  	struct drm_gem_shmem_object *shmem, *tmp;
>  	unsigned long freed = 0;
>  
> @@ -97,13 +95,24 @@ panfrost_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
>   *
>   * This function registers and sets up the panfrost shrinker.
>   */
> -void panfrost_gem_shrinker_init(struct drm_device *dev)
> +int panfrost_gem_shrinker_init(struct drm_device *dev)
>  {
>  	struct panfrost_device *pfdev = dev->dev_private;
> -	pfdev->shrinker.count_objects = panfrost_gem_shrinker_count;
> -	pfdev->shrinker.scan_objects = panfrost_gem_shrinker_scan;
> -	pfdev->shrinker.seeks = DEFAULT_SEEKS;
> -	WARN_ON(register_shrinker(&pfdev->shrinker, "drm-panfrost"));
> +
> +	pfdev->shrinker = shrinker_alloc(0, "drm-panfrost");
> +	if (!pfdev->shrinker) {
> +		WARN_ON(1);

I don't think this WARN_ON is particularly useful - if there's a failed
memory allocation we should see output from the kernel anyway. And we're
changing the semantics from "continue just without a shrinker" (which
argueably justifies the warning) to "probe fails, device doesn't work"
which will be obvious to the user so I don't feel we need the additional
warn.

> +		return -ENOMEM;
> +	}
> +
> +	pfdev->shrinker->count_objects = panfrost_gem_shrinker_count;
> +	pfdev->shrinker->scan_objects = panfrost_gem_shrinker_scan;
> +	pfdev->shrinker->seeks = DEFAULT_SEEKS;
> +	pfdev->shrinker->private_data = pfdev;
> +
> +	shrinker_register(pfdev->shrinker);
> +
> +	return 0;
>  }
>  
>  /**
> @@ -116,7 +125,6 @@ void panfrost_gem_shrinker_cleanup(struct drm_device *dev)
>  {
>  	struct panfrost_device *pfdev = dev->dev_private;
>  
> -	if (pfdev->shrinker.nr_deferred) {
> -		unregister_shrinker(&pfdev->shrinker);
> -	}
> +	if (pfdev->shrinker)
> +		shrinker_unregister(pfdev->shrinker);
>  }


