Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D95D764F38
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 11:18:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570975.893661 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOx87-0007iz-0f; Thu, 27 Jul 2023 09:17:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570975.893661; Thu, 27 Jul 2023 09:17:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOx86-0007gi-UC; Thu, 27 Jul 2023 09:17:54 +0000
Received: by outflank-mailman (input) for mailman id 570975;
 Thu, 27 Jul 2023 09:17:53 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eXb/=DN=bytedance.com=zhengqi.arch@srs-se1.protection.inumbo.net>)
 id 1qOx85-0007gW-E1
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 09:17:53 +0000
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [2607:f8b0:4864:20::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75641255-2c5e-11ee-b247-6b7b168915f2;
 Thu, 27 Jul 2023 11:17:51 +0200 (CEST)
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1bb91c20602so949045ad.0
 for <xen-devel@lists.xenproject.org>; Thu, 27 Jul 2023 02:17:51 -0700 (PDT)
Received: from [10.70.252.135] ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 x3-20020a170902ea8300b001b8c3c7b102sm1099792plb.127.2023.07.27.02.17.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jul 2023 02:17:49 -0700 (PDT)
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
X-Inumbo-ID: 75641255-2c5e-11ee-b247-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1690449470; x=1691054270;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zDAeke9dPI5F1DLlt143+V+9EjjOTI/Ym3kFZW9NJks=;
        b=GMz7Ro63z/YezVqKkIH1jrxAzOT75QcUy09pRQPD7AgfWuYvUeuW5VEqNC1XIv9vFN
         mRwt8c6aGV8kgK9lP5FEKupjXOG/bSxCUR1Wt+sQMg8uYMaVdTfESuVXyke/16/L/yN6
         lgXVNg46bwMvdgDL/au4WPig1MVEHeG5wVY0ujpNjiLSHIkveiLIrECL7sZMPk2KN/og
         cOXK7BC9rcgfo0JQrpwRHwvNtz6wdTJySW4bqDUFHi4zdm4Oj9K7/OLBxIv3WQBH67f1
         OvlGd9tRajLpgSW70SF8ktMkDj4Bt1BHUDLO+7r2qg+4O9VtPvpOqNWx1A6uYkZBjzBr
         UEhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690449470; x=1691054270;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zDAeke9dPI5F1DLlt143+V+9EjjOTI/Ym3kFZW9NJks=;
        b=EtBuADm/twQrO0pNUjMntqNEENGiqo5DRuyel3MpmqAEBYHpdzwqBDk0OFFtN+w1WB
         aawgPM+PXyuhFx7KihZt+vrv7mHLU1JIl3poezn3SaO3aoeqJu6O1qV5JureXW72BXg6
         WH1QI+316ZQS++IaRRD90ACdKBI+RhrEudy1wBzc/Ei3sBnhU2RIxcfaLd0nqGZvsfKS
         jBkuQxXP0IvieRMY0GJkEJjytPBdOoaw0Il/oBkLnk7gO+VutQywAtKjkok5RcbAl4SE
         jiz05gQBo21BQ1NJCQa+jcqSio1J7bGywovACuHLx3WdttoD0yFNBNuoDUQFx8Bj97Yy
         m/zA==
X-Gm-Message-State: ABy/qLbnawjpWZVBDf4BXgxsGC6jQ221nJSQ5Zg5JF9cbWRYNBh0R7nR
	+fD31Gh+1h9WDkuv8k6dNIxuTw==
X-Google-Smtp-Source: APBJJlEO2aWJnLprK4RcTuXXptsAhhV2CWniExK2SV0FTWirST2PpjxVowXAUeeRM51pJjQHZWKeBg==
X-Received: by 2002:a17:902:dac6:b0:1b8:9fc4:2733 with SMTP id q6-20020a170902dac600b001b89fc42733mr5853252plx.3.1690449469696;
        Thu, 27 Jul 2023 02:17:49 -0700 (PDT)
Message-ID: <df02ac8e-b9b3-1582-7d11-fb5ab54f2e64@bytedance.com>
Date: Thu, 27 Jul 2023 17:17:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 34/49] ext4: dynamically allocate the ext4-es shrinker
Content-Language: en-US
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu, steven.price@arm.com,
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
 linux-xfs@vger.kernel.org, linux-btrfs@vger.kernel.org,
 Muchun Song <songmuchun@bytedance.com>
References: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
 <20230727080502.77895-35-zhengqi.arch@bytedance.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <20230727080502.77895-35-zhengqi.arch@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 2023/7/27 16:04, Qi Zheng wrote:
> In preparation for implementing lockless slab shrink, use new APIs to
> dynamically allocate the ext4-es shrinker, so that it can be freed
> asynchronously using kfree_rcu(). Then it doesn't need to wait for RCU
> read-side critical section when releasing the struct ext4_sb_info.
> 
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> Reviewed-by: Muchun Song <songmuchun@bytedance.com>
> ---
>   fs/ext4/ext4.h           |  2 +-
>   fs/ext4/extents_status.c | 22 ++++++++++++----------
>   2 files changed, 13 insertions(+), 11 deletions(-)
> 
> diff --git a/fs/ext4/ext4.h b/fs/ext4/ext4.h
> index 1e2259d9967d..82397bf0b33e 100644
> --- a/fs/ext4/ext4.h
> +++ b/fs/ext4/ext4.h
> @@ -1657,7 +1657,7 @@ struct ext4_sb_info {
>   	__u32 s_csum_seed;
>   
>   	/* Reclaim extents from extent status tree */
> -	struct shrinker s_es_shrinker;
> +	struct shrinker *s_es_shrinker;
>   	struct list_head s_es_list;	/* List of inodes with reclaimable extents */
>   	long s_es_nr_inode;
>   	struct ext4_es_stats s_es_stats;
> diff --git a/fs/ext4/extents_status.c b/fs/ext4/extents_status.c
> index 9b5b8951afb4..74bb64fadbc4 100644
> --- a/fs/ext4/extents_status.c
> +++ b/fs/ext4/extents_status.c
> @@ -1596,7 +1596,7 @@ static unsigned long ext4_es_count(struct shrinker *shrink,
>   	unsigned long nr;
>   	struct ext4_sb_info *sbi;
>   
> -	sbi = container_of(shrink, struct ext4_sb_info, s_es_shrinker);
> +	sbi = shrink->private_data;
>   	nr = percpu_counter_read_positive(&sbi->s_es_stats.es_stats_shk_cnt);
>   	trace_ext4_es_shrink_count(sbi->s_sb, sc->nr_to_scan, nr);
>   	return nr;
> @@ -1605,8 +1605,7 @@ static unsigned long ext4_es_count(struct shrinker *shrink,
>   static unsigned long ext4_es_scan(struct shrinker *shrink,
>   				  struct shrink_control *sc)
>   {
> -	struct ext4_sb_info *sbi = container_of(shrink,
> -					struct ext4_sb_info, s_es_shrinker);
> +	struct ext4_sb_info *sbi = shrink->private_data;
>   	int nr_to_scan = sc->nr_to_scan;
>   	int ret, nr_shrunk;
>   
> @@ -1690,14 +1689,17 @@ int ext4_es_register_shrinker(struct ext4_sb_info *sbi)
>   	if (err)
>   		goto err3;
>   
> -	sbi->s_es_shrinker.scan_objects = ext4_es_scan;
> -	sbi->s_es_shrinker.count_objects = ext4_es_count;
> -	sbi->s_es_shrinker.seeks = DEFAULT_SEEKS;
> -	err = register_shrinker(&sbi->s_es_shrinker, "ext4-es:%s",
> -				sbi->s_sb->s_id);
> -	if (err)
> +	sbi->s_es_shrinker = shrinker_alloc(0, "ext4-es:%s", sbi->s_sb->s_id);
> +	if (!sbi->s_es_shrinker)

Here should set err to -ENOMEM, will fix.

>   		goto err4;
>   
> +	sbi->s_es_shrinker->scan_objects = ext4_es_scan;
> +	sbi->s_es_shrinker->count_objects = ext4_es_count;
> +	sbi->s_es_shrinker->seeks = DEFAULT_SEEKS;
> +	sbi->s_es_shrinker->private_data = sbi;
> +
> +	shrinker_register(sbi->s_es_shrinker);
> +
>   	return 0;
>   err4:
>   	percpu_counter_destroy(&sbi->s_es_stats.es_stats_shk_cnt);
> @@ -1716,7 +1718,7 @@ void ext4_es_unregister_shrinker(struct ext4_sb_info *sbi)
>   	percpu_counter_destroy(&sbi->s_es_stats.es_stats_cache_misses);
>   	percpu_counter_destroy(&sbi->s_es_stats.es_stats_all_cnt);
>   	percpu_counter_destroy(&sbi->s_es_stats.es_stats_shk_cnt);
> -	unregister_shrinker(&sbi->s_es_shrinker);
> +	shrinker_free(sbi->s_es_shrinker);
>   }
>   
>   /*

