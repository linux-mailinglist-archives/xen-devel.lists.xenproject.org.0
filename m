Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF78B784297
	for <lists+xen-devel@lfdr.de>; Tue, 22 Aug 2023 15:56:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.588492.920004 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYRru-0006M8-UF; Tue, 22 Aug 2023 13:56:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 588492.920004; Tue, 22 Aug 2023 13:56:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qYRru-0006JD-Qz; Tue, 22 Aug 2023 13:56:26 +0000
Received: by outflank-mailman (input) for mailman id 588492;
 Tue, 22 Aug 2023 13:56:25 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3ZPx=EH=ffwll.ch=daniel@srs-se1.protection.inumbo.net>)
 id 1qYRrt-0006Hp-6b
 for xen-devel@lists.xenproject.org; Tue, 22 Aug 2023 13:56:25 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id adc55ba0-40f3-11ee-9b0c-b553b5be7939;
 Tue, 22 Aug 2023 15:56:23 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-31c5ee810e3so184739f8f.0
 for <xen-devel@lists.xenproject.org>; Tue, 22 Aug 2023 06:56:23 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 u5-20020a05600c210500b003fc02e8ea68sm19456835wml.13.2023.08.22.06.56.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Aug 2023 06:56:22 -0700 (PDT)
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
X-Inumbo-ID: adc55ba0-40f3-11ee-9b0c-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1692712583; x=1693317383;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LXzMnEM8moHL5KfliVx5cD1lb3aAd5NGNjk14fqFYLY=;
        b=OvQvaauBf9P71X6OM3iV6zJjVstVKwDXVeR2TcNPjDcJz2f399JP5BZxFUiXHkTWc/
         r5lP7XQ7vkvpSMptW40PFm8KnzYip/IftCKI/V7U1LWv+OZcsOEZqcqKXDKRf7oBDJOP
         RNOespNYAQNJ9FavrWx3YuWYiBeKAeIF+XsTA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692712583; x=1693317383;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LXzMnEM8moHL5KfliVx5cD1lb3aAd5NGNjk14fqFYLY=;
        b=VbOS/8x8WmELQ2a6CoamaEi7dBjhM9mUWIbuQfjULYQgT0L/YGgokvbGz/eM03mlyJ
         iNKykJ7qBfxkhDLLpd/oXX0yBLZXERBZO3jAnAnfD+vFA95q1yOywM9YW7WzwoaHVPmm
         +5RgzBi8FwKoBR41sPHDpv5Dm0zJ0GVoAu7jnQn8+Sarfo9C/eE1OeKGGv0cTnZoXk7i
         4EYnmL/JA/SjlWgQHuJOu7sK4TLGFUk7IWdGsO800klCTaCH3dhvknEKIXaUOzGNvJI4
         lLWOqwfEKrlaLBxF8YzyUvbwA6GWXWcHAMPmqDtOafZAM5hilEwNeLdT7dFkheA7gKdy
         rosw==
X-Gm-Message-State: AOJu0Yx1dzE7kxPeb+9jYbJa0xcJLmQDAUYvFHiL7QOoDlZ1zD5YOlxR
	vAbWYO5smmFK8ukErh+DYVlxXw==
X-Google-Smtp-Source: AGHT+IHJQrlSrCu8WgUX5s8XkdDm6/hR/jwfxds8mVBdQgFEL5tBYnuf/oIT+VMpj8Z6S8wRiH/+Kw==
X-Received: by 2002:a5d:65c5:0:b0:319:8dcf:5c10 with SMTP id e5-20020a5d65c5000000b003198dcf5c10mr6979657wrw.6.1692712582669;
        Tue, 22 Aug 2023 06:56:22 -0700 (PDT)
Date: Tue, 22 Aug 2023 15:56:19 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
	vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
	brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
	steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
	yujie.liu@intel.com, gregkh@linuxfoundation.org,
	muchun.song@linux.dev, simon.horman@corigine.com,
	dlemoal@kernel.org, kvm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
	dm-devel@redhat.com, linux-mtd@lists.infradead.org, x86@kernel.org,
	cluster-devel@redhat.com, xen-devel@lists.xenproject.org,
	linux-ext4@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	rcu@vger.kernel.org, linux-bcache@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>, linux-raid@vger.kernel.org,
	linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-btrfs@vger.kernel.org
Subject: Re: [PATCH v4 43/48] drm/ttm: introduce pool_shrink_rwsem
Message-ID: <ZOS+g51Yx9PsYkGU@phenom.ffwll.local>
Mail-Followup-To: Qi Zheng <zhengqi.arch@bytedance.com>,
	akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
	vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
	brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
	steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
	yujie.liu@intel.com, gregkh@linuxfoundation.org,
	muchun.song@linux.dev, simon.horman@corigine.com,
	dlemoal@kernel.org, kvm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
	dm-devel@redhat.com, linux-mtd@lists.infradead.org, x86@kernel.org,
	cluster-devel@redhat.com, xen-devel@lists.xenproject.org,
	linux-ext4@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	rcu@vger.kernel.org, linux-bcache@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>, linux-raid@vger.kernel.org,
	linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-erofs@lists.ozlabs.org,
	linux-btrfs@vger.kernel.org
References: <20230807110936.21819-1-zhengqi.arch@bytedance.com>
 <20230807110936.21819-44-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230807110936.21819-44-zhengqi.arch@bytedance.com>
X-Operating-System: Linux phenom 6.3.0-2-amd64 

On Mon, Aug 07, 2023 at 07:09:31PM +0800, Qi Zheng wrote:
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
> Reviewed-by: Muchun Song <songmuchun@bytedance.com>

On the 5 drm patches (I counted 2 ttm and 3 drivers) for merging through
some other tree (since I'm assuming that's how this will land):

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  drivers/gpu/drm/ttm/ttm_pool.c | 15 +++++++++++++++
>  include/linux/shrinker.h       |  2 --
>  mm/shrinker.c                  | 15 ---------------
>  3 files changed, 15 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
> index c9c9618c0dce..38b4c280725c 100644
> --- a/drivers/gpu/drm/ttm/ttm_pool.c
> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
> @@ -74,6 +74,7 @@ static struct ttm_pool_type global_dma32_uncached[MAX_ORDER + 1];
>  static spinlock_t shrinker_lock;
>  static struct list_head shrinker_list;
>  static struct shrinker *mm_shrinker;
> +static DECLARE_RWSEM(pool_shrink_rwsem);
>  
>  /* Allocate pages of size 1 << order with the given gfp_flags */
>  static struct page *ttm_pool_alloc_page(struct ttm_pool *pool, gfp_t gfp_flags,
> @@ -317,6 +318,7 @@ static unsigned int ttm_pool_shrink(void)
>  	unsigned int num_pages;
>  	struct page *p;
>  
> +	down_read(&pool_shrink_rwsem);
>  	spin_lock(&shrinker_lock);
>  	pt = list_first_entry(&shrinker_list, typeof(*pt), shrinker_list);
>  	list_move_tail(&pt->shrinker_list, &shrinker_list);
> @@ -329,6 +331,7 @@ static unsigned int ttm_pool_shrink(void)
>  	} else {
>  		num_pages = 0;
>  	}
> +	up_read(&pool_shrink_rwsem);
>  
>  	return num_pages;
>  }
> @@ -572,6 +575,18 @@ void ttm_pool_init(struct ttm_pool *pool, struct device *dev,
>  }
>  EXPORT_SYMBOL(ttm_pool_init);
>  
> +/**
> + * synchronize_shrinkers - Wait for all running shrinkers to complete.
> + *
> + * This is useful to guarantee that all shrinker invocations have seen an
> + * update, before freeing memory, similar to rcu.
> + */
> +static void synchronize_shrinkers(void)
> +{
> +	down_write(&pool_shrink_rwsem);
> +	up_write(&pool_shrink_rwsem);
> +}
> +
>  /**
>   * ttm_pool_fini - Cleanup a pool
>   *
> diff --git a/include/linux/shrinker.h b/include/linux/shrinker.h
> index c55c07c3f0cb..025c8070dd86 100644
> --- a/include/linux/shrinker.h
> +++ b/include/linux/shrinker.h
> @@ -103,8 +103,6 @@ struct shrinker *shrinker_alloc(unsigned int flags, const char *fmt, ...);
>  void shrinker_register(struct shrinker *shrinker);
>  void shrinker_free(struct shrinker *shrinker);
>  
> -extern void synchronize_shrinkers(void);
> -
>  #ifdef CONFIG_SHRINKER_DEBUG
>  extern int __printf(2, 3) shrinker_debugfs_rename(struct shrinker *shrinker,
>  						  const char *fmt, ...);
> diff --git a/mm/shrinker.c b/mm/shrinker.c
> index 3ab301ff122d..a27779ed3798 100644
> --- a/mm/shrinker.c
> +++ b/mm/shrinker.c
> @@ -650,18 +650,3 @@ void shrinker_free(struct shrinker *shrinker)
>  	kfree(shrinker);
>  }
>  EXPORT_SYMBOL_GPL(shrinker_free);
> -
> -/**
> - * synchronize_shrinkers - Wait for all running shrinkers to complete.
> - *
> - * This is equivalent to calling unregister_shrink() and register_shrinker(),
> - * but atomically and with less overhead. This is useful to guarantee that all
> - * shrinker invocations have seen an update, before freeing memory, similar to
> - * rcu.
> - */
> -void synchronize_shrinkers(void)
> -{
> -	down_write(&shrinker_rwsem);
> -	up_write(&shrinker_rwsem);
> -}
> -EXPORT_SYMBOL(synchronize_shrinkers);
> -- 
> 2.30.2
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

