Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A29C763200
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 11:28:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570230.891853 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOaoQ-0001RX-K3; Wed, 26 Jul 2023 09:28:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570230.891853; Wed, 26 Jul 2023 09:28:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOaoQ-0001Oe-Gw; Wed, 26 Jul 2023 09:28:06 +0000
Received: by outflank-mailman (input) for mailman id 570230;
 Wed, 26 Jul 2023 09:28:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7qZ+=DM=bytedance.com=zhengqi.arch@srs-se1.protection.inumbo.net>)
 id 1qOaoP-0001OY-VH
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 09:28:05 +0000
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [2607:f8b0:4864:20::436])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b79bdbb7-2b96-11ee-8613-37d641c3527e;
 Wed, 26 Jul 2023 11:28:03 +0200 (CEST)
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-6864c144897so1488717b3a.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jul 2023 02:28:03 -0700 (PDT)
Received: from [10.70.252.135] ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 l73-20020a633e4c000000b00563da87a52dsm1901427pga.40.2023.07.26.02.27.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jul 2023 02:28:01 -0700 (PDT)
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
X-Inumbo-ID: b79bdbb7-2b96-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1690363681; x=1690968481;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3q/836hkNQMpcz/8YX2aFfQHacV0FqcsnRX2KDKmGK4=;
        b=VrX61tolI6lx5cf13TzjBUi7Jr7lyRI0PErux25Ugwzya6Gr7la8Z5mF2+cskv3TWz
         UBVd0Z5Poj3PRTux8odPv45l8gQzAXnTFOr3Tf8UDx7d9uUEKzN37AEVIKYy6agrhmgA
         YruSiWL83SB/lZ95d/ocS5Ez1ClN1w8sLcjpu26a2KNj8aWhEC89NaIXAD4IQeJcJzfH
         uYL7oLGt6F17I0XKTtTRSbeLX7ktBDSzYJstMwVG/599hz7kBf24kzbOMqBXrGbap2ZR
         iYE22Dihl4RYEd6b6MxzHd9sXrRhtrB75dhklT8m88pkRrstmkcW4eCpJX3cURQ8vJOi
         rydw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690363681; x=1690968481;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3q/836hkNQMpcz/8YX2aFfQHacV0FqcsnRX2KDKmGK4=;
        b=KbbdKJvg0NPP8/jGOS7cX8LoIUXuc3X6n0bi8bwGErtf6RX0Nfbn5zStAcnS2Z7U5p
         vpWb1FaY+wc7fXI7JyKNtYjCASu5n/PSHo88nLsO0159dI3xgU65Fo0JW6ol/KJG+tw1
         leSco5I310QW3qr+kPbho5TBDJNeSNBGRASmNAVjCnn+YbFoCyHUPPjpsB/h37MdrTXk
         rN6cOcCTLCmDHp3wur5e15HHaA3ztYq6e0SbmBdKU0gGP8/GAxZNG5f1JPfxzZflBgns
         RFx2TENdwpwONg9HUQdaHYNVe2HM43CKSmr/0HrfRrpNHPaYQmnEF4s9RGAl+XcuxIP3
         4OxQ==
X-Gm-Message-State: ABy/qLaaTggfAebmpIQEtV2aJN2JaVJ2ojmauT9eY2NAO2yPGeTlkDXe
	WtgAU9PHChJ1uoH5w3vtWE6ZLA==
X-Google-Smtp-Source: APBJJlFbGXVT1jvZWB8OqMMjwV1wWa8tPHrXXzsgQ/SF73jQ8jhDFJz/C4eSTJgkpJW81UF91auuJQ==
X-Received: by 2002:a05:6a20:3c90:b0:134:d4d3:f0a5 with SMTP id b16-20020a056a203c9000b00134d4d3f0a5mr1941746pzj.2.1690363681365;
        Wed, 26 Jul 2023 02:28:01 -0700 (PDT)
Message-ID: <665ccd89-8434-fc45-4813-c6412ef80c10@bytedance.com>
Date: Wed, 26 Jul 2023 17:27:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v2 19/47] mm: thp: dynamically allocate the thp-related
 shrinkers
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
 <20230724094354.90817-20-zhengqi.arch@bytedance.com>
 <d41d09bc-7c1c-f708-ecfa-ffac59bf58ad@linux.dev>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <d41d09bc-7c1c-f708-ecfa-ffac59bf58ad@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2023/7/26 15:10, Muchun Song wrote:
> 
> 
> On 2023/7/24 17:43, Qi Zheng wrote:
>> Use new APIs to dynamically allocate the thp-zero and thp-deferred_split
>> shrinkers.
>>
>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
>> ---
>>   mm/huge_memory.c | 69 +++++++++++++++++++++++++++++++-----------------
>>   1 file changed, 45 insertions(+), 24 deletions(-)
>>
>> diff --git a/mm/huge_memory.c b/mm/huge_memory.c
>> index 8c94b34024a2..4db5a1834d81 100644
>> --- a/mm/huge_memory.c
>> +++ b/mm/huge_memory.c
>> @@ -65,7 +65,11 @@ unsigned long transparent_hugepage_flags 
>> __read_mostly =
>>       (1<<TRANSPARENT_HUGEPAGE_DEFRAG_KHUGEPAGED_FLAG)|
>>       (1<<TRANSPARENT_HUGEPAGE_USE_ZERO_PAGE_FLAG);
>> -static struct shrinker deferred_split_shrinker;
>> +static struct shrinker *deferred_split_shrinker;
>> +static unsigned long deferred_split_count(struct shrinker *shrink,
>> +                      struct shrink_control *sc);
>> +static unsigned long deferred_split_scan(struct shrinker *shrink,
>> +                     struct shrink_control *sc);
>>   static atomic_t huge_zero_refcount;
>>   struct page *huge_zero_page __read_mostly;
>> @@ -229,11 +233,7 @@ static unsigned long 
>> shrink_huge_zero_page_scan(struct shrinker *shrink,
>>       return 0;
>>   }
>> -static struct shrinker huge_zero_page_shrinker = {
>> -    .count_objects = shrink_huge_zero_page_count,
>> -    .scan_objects = shrink_huge_zero_page_scan,
>> -    .seeks = DEFAULT_SEEKS,
>> -};
>> +static struct shrinker *huge_zero_page_shrinker;
> 
> Same as patch #17.

OK, will do.

> 
>>   #ifdef CONFIG_SYSFS
>>   static ssize_t enabled_show(struct kobject *kobj,
>> @@ -454,6 +454,40 @@ static inline void hugepage_exit_sysfs(struct 
>> kobject *hugepage_kobj)
>>   }
>>   #endif /* CONFIG_SYSFS */
>> +static int thp_shrinker_init(void)
> 
> Better to declare it as __init.

Will do.

> 
>> +{
>> +    huge_zero_page_shrinker = shrinker_alloc(0, "thp-zero");
>> +    if (!huge_zero_page_shrinker)
>> +        return -ENOMEM;
>> +
>> +    deferred_split_shrinker = shrinker_alloc(SHRINKER_NUMA_AWARE |
>> +                         SHRINKER_MEMCG_AWARE |
>> +                         SHRINKER_NONSLAB,
>> +                         "thp-deferred_split");
>> +    if (!deferred_split_shrinker) {
>> +        shrinker_free_non_registered(huge_zero_page_shrinker);
>> +        return -ENOMEM;
>> +    }
>> +
>> +    huge_zero_page_shrinker->count_objects = 
>> shrink_huge_zero_page_count;
>> +    huge_zero_page_shrinker->scan_objects = shrink_huge_zero_page_scan;
>> +    huge_zero_page_shrinker->seeks = DEFAULT_SEEKS;
>> +    shrinker_register(huge_zero_page_shrinker);
>> +
>> +    deferred_split_shrinker->count_objects = deferred_split_count;
>> +    deferred_split_shrinker->scan_objects = deferred_split_scan;
>> +    deferred_split_shrinker->seeks = DEFAULT_SEEKS;
>> +    shrinker_register(deferred_split_shrinker);
>> +
>> +    return 0;
>> +}
>> +
>> +static void thp_shrinker_exit(void)
> 
> Same as here.

Will do.

> 
>> +{
>> +    shrinker_unregister(huge_zero_page_shrinker);
>> +    shrinker_unregister(deferred_split_shrinker);
>> +}
>> +
>>   static int __init hugepage_init(void)
>>   {
>>       int err;
>> @@ -482,12 +516,9 @@ static int __init hugepage_init(void)
>>       if (err)
>>           goto err_slab;
>> -    err = register_shrinker(&huge_zero_page_shrinker, "thp-zero");
>> -    if (err)
>> -        goto err_hzp_shrinker;
>> -    err = register_shrinker(&deferred_split_shrinker, 
>> "thp-deferred_split");
>> +    err = thp_shrinker_init();
>>       if (err)
>> -        goto err_split_shrinker;
>> +        goto err_shrinker;
>>       /*
>>        * By default disable transparent hugepages on smaller systems,
>> @@ -505,10 +536,8 @@ static int __init hugepage_init(void)
>>       return 0;
>>   err_khugepaged:
>> -    unregister_shrinker(&deferred_split_shrinker);
>> -err_split_shrinker:
>> -    unregister_shrinker(&huge_zero_page_shrinker);
>> -err_hzp_shrinker:
>> +    thp_shrinker_exit();
>> +err_shrinker:
>>       khugepaged_destroy();
>>   err_slab:
>>       hugepage_exit_sysfs(hugepage_kobj);
>> @@ -2851,7 +2880,7 @@ void deferred_split_folio(struct folio *folio)
>>   #ifdef CONFIG_MEMCG
>>           if (memcg)
>>               set_shrinker_bit(memcg, folio_nid(folio),
>> -                     deferred_split_shrinker.id);
>> +                     deferred_split_shrinker->id);
>>   #endif
>>       }
>>       spin_unlock_irqrestore(&ds_queue->split_queue_lock, flags);
>> @@ -2925,14 +2954,6 @@ static unsigned long deferred_split_scan(struct 
>> shrinker *shrink,
>>       return split;
>>   }
>> -static struct shrinker deferred_split_shrinker = {
>> -    .count_objects = deferred_split_count,
>> -    .scan_objects = deferred_split_scan,
>> -    .seeks = DEFAULT_SEEKS,
>> -    .flags = SHRINKER_NUMA_AWARE | SHRINKER_MEMCG_AWARE |
>> -         SHRINKER_NONSLAB,
>> -};
>> -
>>   #ifdef CONFIG_DEBUG_FS
>>   static void split_huge_pages_all(void)
>>   {
> 

