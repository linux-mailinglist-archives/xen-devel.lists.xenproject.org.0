Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC0C767D51
	for <lists+xen-devel@lfdr.de>; Sat, 29 Jul 2023 10:48:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.571684.896015 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPfcT-00066U-Hs; Sat, 29 Jul 2023 08:48:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 571684.896015; Sat, 29 Jul 2023 08:48:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qPfcT-00063g-F2; Sat, 29 Jul 2023 08:48:13 +0000
Received: by outflank-mailman (input) for mailman id 571684;
 Sat, 29 Jul 2023 08:48:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=C7MR=DP=bytedance.com=zhengqi.arch@srs-se1.protection.inumbo.net>)
 id 1qPfcR-00063F-GB
 for xen-devel@lists.xenproject.org; Sat, 29 Jul 2023 08:48:11 +0000
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [2607:f8b0:4864:20::436])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a452fac3-2dec-11ee-b24f-6b7b168915f2;
 Sat, 29 Jul 2023 10:48:09 +0200 (CEST)
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-682ae5d4184so685358b3a.1
 for <xen-devel@lists.xenproject.org>; Sat, 29 Jul 2023 01:48:09 -0700 (PDT)
Received: from ?IPV6:fdbd:ff1:ce00:1c25:884:3ed:e1db:b610?
 ([240e:694:e21:b::2]) by smtp.gmail.com with ESMTPSA id
 s1-20020a62e701000000b00687087d8bc3sm2935245pfh.141.2023.07.29.01.47.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 29 Jul 2023 01:48:07 -0700 (PDT)
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
X-Inumbo-ID: a452fac3-2dec-11ee-b24f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1690620488; x=1691225288;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AbdgPGpGzwv3Ba9ss/qbC8w4dcIJ6EfJ8tT9+ztVBsQ=;
        b=DZFLwwmJndUW6zfnORbYzoucbeb9saaQKrl/QBur5VgS6P58gRgdpp8MYduMN550+T
         ThpBMQd+wqwbcBoSGmvKI7V9Ma4LCpYLWFunl5NiegFEHJNTQE3HPx1j7Fgc5gNqx8Iq
         YHUiWta6/cfbGMyg9gyEl8Eynz728/mHaw1lMQy+t/GfUp9Wqb7L9kJmHKg93SZhln4L
         nQEOOjCm3XtItdkVREm8m6+qA283u73jSwvq4ou9Fha1ZKE4dHZmspSiYw7ywEJDGstN
         q98qzRnKmdM4q9DzoCiLAmxpMakkQvrAM25zQsh718wYNXYSnABRZn4Jdwg4vno9Osq9
         PVdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690620488; x=1691225288;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AbdgPGpGzwv3Ba9ss/qbC8w4dcIJ6EfJ8tT9+ztVBsQ=;
        b=QW8gLIczRqlEaOxnzLIfuQchp6d5F39Rl/zwhmd0Cljr02h2rJYCHnxRtiVXneTrVi
         PBzCpznk5dXo9aA1Mq1X2S5KpDUpNk6+KXgkdEG/YiFhRwEk8q1rIC+jSTJWZpvug7tc
         bOHBJRhT5v+/SoaMqrbiBLnwd9X8ZILCaWAxRL9+mVILOHZIyCHfPM1OUrJaIaOScDr7
         axLPqWiwJxauiwG68njoWJxlqMshpmVYCheb+bBieMcXh4RzL6KvXWFRw5R+tHX/YP6H
         jkE+9BDcMr6bf6XONLhxExlY/o25CtzGWER3sVDStewcj5GW2b5RvGp72a36/z5Q6/Nm
         t2hA==
X-Gm-Message-State: ABy/qLZUGm4c6Y3P1sGB0V6NQCj3QKNo+sI0l9fK2/ip2310+J9KRKIk
	qq/8RMrgutZm4m4+7F2QAAeixQ==
X-Google-Smtp-Source: APBJJlGU4WvDtIE3roPXfr2RIP3jnPqKjXBKgd99me7vK4BYh3P3V9BBkMbm8JQkpcQK7ib8McexOg==
X-Received: by 2002:a05:6a00:32c8:b0:67f:7403:1fe8 with SMTP id cl8-20020a056a0032c800b0067f74031fe8mr1763906pfb.3.1690620488142;
        Sat, 29 Jul 2023 01:48:08 -0700 (PDT)
Message-ID: <5e50711c-a616-f95f-d6d2-c69627ac3cf0@bytedance.com>
Date: Sat, 29 Jul 2023 16:47:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 05/49] mm: shrinker: add infrastructure for dynamically
 allocating shrinker
Content-Language: en-US
To: Simon Horman <simon.horman@corigine.com>
Cc: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu, steven.price@arm.com,
 cel@kernel.org, senozhatsky@chromium.org, yujie.liu@intel.com,
 gregkh@linuxfoundation.org, muchun.song@linux.dev,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org,
 kvm@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-erofs@lists.ozlabs.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, linux-nfs@vger.kernel.org,
 linux-mtd@lists.infradead.org, rcu@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 dm-devel@redhat.com, linux-raid@vger.kernel.org,
 linux-bcache@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org, linux-btrfs@vger.kernel.org
References: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
 <20230727080502.77895-6-zhengqi.arch@bytedance.com>
 <ZMOx0y+wdHEATDho@corigine.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <ZMOx0y+wdHEATDho@corigine.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Simon,

On 2023/7/28 20:17, Simon Horman wrote:
> On Thu, Jul 27, 2023 at 04:04:18PM +0800, Qi Zheng wrote:
>> Currently, the shrinker instances can be divided into the following three
>> types:
>>
>> a) global shrinker instance statically defined in the kernel, such as
>>     workingset_shadow_shrinker.
>>
>> b) global shrinker instance statically defined in the kernel modules, such
>>     as mmu_shrinker in x86.
>>
>> c) shrinker instance embedded in other structures.
>>
>> For case a, the memory of shrinker instance is never freed. For case b,
>> the memory of shrinker instance will be freed after synchronize_rcu() when
>> the module is unloaded. For case c, the memory of shrinker instance will
>> be freed along with the structure it is embedded in.
>>
>> In preparation for implementing lockless slab shrink, we need to
>> dynamically allocate those shrinker instances in case c, then the memory
>> can be dynamically freed alone by calling kfree_rcu().
>>
>> So this commit adds the following new APIs for dynamically allocating
>> shrinker, and add a private_data field to struct shrinker to record and
>> get the original embedded structure.
>>
>> 1. shrinker_alloc()
>>
>> Used to allocate shrinker instance itself and related memory, it will
>> return a pointer to the shrinker instance on success and NULL on failure.
>>
>> 2. shrinker_register()
>>
>> Used to register the shrinker instance, which is same as the current
>> register_shrinker_prepared().
>>
>> 3. shrinker_free()
>>
>> Used to unregister (if needed) and free the shrinker instance.
>>
>> In order to simplify shrinker-related APIs and make shrinker more
>> independent of other kernel mechanisms, subsequent submissions will use
>> the above API to convert all shrinkers (including case a and b) to
>> dynamically allocated, and then remove all existing APIs.
>>
>> This will also have another advantage mentioned by Dave Chinner:
>>
>> ```
>> The other advantage of this is that it will break all the existing
>> out of tree code and third party modules using the old API and will
>> no longer work with a kernel using lockless slab shrinkers. They
>> need to break (both at the source and binary levels) to stop bad
>> things from happening due to using uncoverted shrinkers in the new
> 
> nit: uncoverted -> unconverted

Thanks. Will fix.

> 
>> setup.
>> ```
>>
>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> 
> ...
> 
>> diff --git a/mm/shrinker_debug.c b/mm/shrinker_debug.c
>> index f1becfd45853..506257585408 100644
>> --- a/mm/shrinker_debug.c
>> +++ b/mm/shrinker_debug.c
>> @@ -191,6 +191,20 @@ int shrinker_debugfs_add(struct shrinker *shrinker)
>>   	return 0;
>>   }
>>   
>> +int shrinker_debugfs_name_alloc(struct shrinker *shrinker, const char *fmt,
>> +				va_list ap)
>> +{
>> +	shrinker->name = kvasprintf_const(GFP_KERNEL, fmt, ap);
>> +
>> +	return shrinker->name ? 0 : -ENOMEM;
>> +}
>> +
>> +void shrinker_debugfs_name_free(struct shrinker *shrinker)
>> +{
>> +	kfree_const(shrinker->name);
>> +	shrinker->name = NULL;
>> +}
>> +
> 
> These functions have no prototype in this file,
> perhaps internal.h should be included?

The compiler can find these implementations, so I don't think there
is a need to include internal.h here?

Thanks,
Qi

> 
>>   int shrinker_debugfs_rename(struct shrinker *shrinker, const char *fmt, ...)
>>   {
>>   	struct dentry *entry;
> 
> ...

