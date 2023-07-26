Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 63CE37631B8
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 11:22:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570224.891823 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOaiq-00085o-I4; Wed, 26 Jul 2023 09:22:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570224.891823; Wed, 26 Jul 2023 09:22:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOaiq-00083a-ES; Wed, 26 Jul 2023 09:22:20 +0000
Received: by outflank-mailman (input) for mailman id 570224;
 Wed, 26 Jul 2023 09:22:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7qZ+=DM=bytedance.com=zhengqi.arch@srs-se1.protection.inumbo.net>)
 id 1qOaio-00083O-Os
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 09:22:18 +0000
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [2607:f8b0:4864:20::42c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e9393fdc-2b95-11ee-8613-37d641c3527e;
 Wed, 26 Jul 2023 11:22:16 +0200 (CEST)
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-66d6a9851f3so1487684b3a.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jul 2023 02:22:16 -0700 (PDT)
Received: from [10.70.252.135] ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 k11-20020aa790cb000000b006827c26f147sm10955045pfk.138.2023.07.26.02.22.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jul 2023 02:22:14 -0700 (PDT)
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
X-Inumbo-ID: e9393fdc-2b95-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1690363335; x=1690968135;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xHFf+qIXuXcHU2hnpeM9isQldhnSqSauyHf1oBu4R8I=;
        b=jAMndxc3vAfZ9MlugwiN2m1td4+ENgo1ZcEkULNu4w0l2e+7SjL15Aj8xsnH/hg6mq
         Yuh7Pj+WIpy+9FKbmqcmIZPowwXwCsZ/HE/uYPa/USpf5RWRvsmKXdX1EOhGqDHtCRhA
         5Tx4ycmmPjyUjagwQ6weN00EPkG2yYEGVkFAeT+5NL38WWOxpIAWxDe7x+TtdzGSmFXw
         AaN6OIhFdWcuFQV9AajQEHTHNR/HQhAWIjBkgsz+1GmBQBDd2nNKfKbDgsLcpETIdF18
         CdbQtqtDxhcETBnzscklNfC8QDSVXvKpexDlKf4G6IIrjU6vkXpbe5y1T2yEBA/OqHN2
         vBww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690363335; x=1690968135;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xHFf+qIXuXcHU2hnpeM9isQldhnSqSauyHf1oBu4R8I=;
        b=kr93BDMSTmjuJd/Bi8eOEXyqaoAuWdKmyPBiKcgAmDlVCq6zsAWscW1nCU1V48M5CE
         gky7i8F2vdC27yUB2hrTltP9CdYsYD6vsghe8Ytfh6WseOP8jMfWODYFWz32nbXTG6hE
         9QIZeYGRj1y4fJmPHReJvdjW4XsS79WQa5URdcD3BTyl/gX2tFf+Vqe/eAknFMy+fyAV
         iJ4hP5goy1XztPubRIskQiQVJRhyHokB4enamO6JF6ZR4L/iZ5d/9JeOeAY4KnRppsSR
         mHumVwKBFWXP33tjjqcxCjtrhDCk+X/0ZiPJoP4cNYomuabtsHNQxIxoFAFYIJ8ddp+V
         nQYw==
X-Gm-Message-State: ABy/qLZk22cSl96U7UyTNjYEOEtE5jF7jOOYdqYm+o/Xd+pzLv5ZROow
	ad17psKN8ASj7d/xPMbzwNNgEA==
X-Google-Smtp-Source: APBJJlGzKLkoeooTK7rnc1fJ6mfD6dUCrzzNETRC7Ci4c1Yh8zXhisYlXfajH5gn3qqQbLizO8XVQA==
X-Received: by 2002:a05:6a20:729a:b0:100:b92b:e8be with SMTP id o26-20020a056a20729a00b00100b92be8bemr1779967pzk.2.1690363335131;
        Wed, 26 Jul 2023 02:22:15 -0700 (PDT)
Message-ID: <d96777ce-be8a-1665-dd00-1e696e5575a8@bytedance.com>
Date: Wed, 26 Jul 2023 17:22:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v2 11/47] gfs2: dynamically allocate the gfs2-qd shrinker
Content-Language: en-US
To: Muchun Song <muchun.song@linux.dev>
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
 <e7204276-9de5-17eb-90ae-e51657d73ef4@linux.dev>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <e7204276-9de5-17eb-90ae-e51657d73ef4@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2023/7/26 14:49, Muchun Song wrote:
> 
> 
> On 2023/7/24 17:43, Qi Zheng wrote:
>> Use new APIs to dynamically allocate the gfs2-qd shrinker.
>>
>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
>> ---
>>   fs/gfs2/main.c  |  6 +++---
>>   fs/gfs2/quota.c | 26 ++++++++++++++++++++------
>>   fs/gfs2/quota.h |  3 ++-
>>   3 files changed, 25 insertions(+), 10 deletions(-)
>>
>> diff --git a/fs/gfs2/main.c b/fs/gfs2/main.c
>> index afcb32854f14..e47b1cc79f59 100644
>> --- a/fs/gfs2/main.c
>> +++ b/fs/gfs2/main.c
>> @@ -147,7 +147,7 @@ static int __init init_gfs2_fs(void)
>>       if (!gfs2_trans_cachep)
>>           goto fail_cachep8;
>> -    error = register_shrinker(&gfs2_qd_shrinker, "gfs2-qd");
>> +    error = gfs2_qd_shrinker_init();
>>       if (error)
>>           goto fail_shrinker;
>> @@ -196,7 +196,7 @@ static int __init init_gfs2_fs(void)
>>   fail_wq2:
>>       destroy_workqueue(gfs_recovery_wq);
>>   fail_wq1:
>> -    unregister_shrinker(&gfs2_qd_shrinker);
>> +    gfs2_qd_shrinker_exit();
>>   fail_shrinker:
>>       kmem_cache_destroy(gfs2_trans_cachep);
>>   fail_cachep8:
>> @@ -229,7 +229,7 @@ static int __init init_gfs2_fs(void)
>>   static void __exit exit_gfs2_fs(void)
>>   {
>> -    unregister_shrinker(&gfs2_qd_shrinker);
>> +    gfs2_qd_shrinker_exit();
>>       gfs2_glock_exit();
>>       gfs2_unregister_debugfs();
>>       unregister_filesystem(&gfs2_fs_type);
>> diff --git a/fs/gfs2/quota.c b/fs/gfs2/quota.c
>> index 704192b73605..bc9883cea847 100644
>> --- a/fs/gfs2/quota.c
>> +++ b/fs/gfs2/quota.c
>> @@ -186,13 +186,27 @@ static unsigned long gfs2_qd_shrink_count(struct 
>> shrinker *shrink,
>>       return vfs_pressure_ratio(list_lru_shrink_count(&gfs2_qd_lru, sc));
>>   }
>> -struct shrinker gfs2_qd_shrinker = {
>> -    .count_objects = gfs2_qd_shrink_count,
>> -    .scan_objects = gfs2_qd_shrink_scan,
>> -    .seeks = DEFAULT_SEEKS,
>> -    .flags = SHRINKER_NUMA_AWARE,
>> -};
>> +static struct shrinker *gfs2_qd_shrinker;
>> +
>> +int gfs2_qd_shrinker_init(void)
> 
> It's better to declare this as __init.

OK, Will do.

> 
>> +{
>> +    gfs2_qd_shrinker = shrinker_alloc(SHRINKER_NUMA_AWARE, "gfs2-qd");
>> +    if (!gfs2_qd_shrinker)
>> +        return -ENOMEM;
>> +
>> +    gfs2_qd_shrinker->count_objects = gfs2_qd_shrink_count;
>> +    gfs2_qd_shrinker->scan_objects = gfs2_qd_shrink_scan;
>> +    gfs2_qd_shrinker->seeks = DEFAULT_SEEKS;
>> +
>> +    shrinker_register(gfs2_qd_shrinker);
>> +    return 0;
>> +}
>> +
>> +void gfs2_qd_shrinker_exit(void)
>> +{
>> +    shrinker_unregister(gfs2_qd_shrinker);
>> +}
>>   static u64 qd2index(struct gfs2_quota_data *qd)
>>   {
>> diff --git a/fs/gfs2/quota.h b/fs/gfs2/quota.h
>> index 21ada332d555..f9cb863373f7 100644
>> --- a/fs/gfs2/quota.h
>> +++ b/fs/gfs2/quota.h
>> @@ -59,7 +59,8 @@ static inline int gfs2_quota_lock_check(struct 
>> gfs2_inode *ip,
>>   }
>>   extern const struct quotactl_ops gfs2_quotactl_ops;
>> -extern struct shrinker gfs2_qd_shrinker;
>> +int gfs2_qd_shrinker_init(void);
>> +void gfs2_qd_shrinker_exit(void);
>>   extern struct list_lru gfs2_qd_lru;
>>   extern void __init gfs2_quota_hash_init(void);
> 

