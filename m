Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F1B27631AE
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 11:21:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570220.891813 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOahh-0007ZE-8f; Wed, 26 Jul 2023 09:21:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570220.891813; Wed, 26 Jul 2023 09:21:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOahh-0007Wh-5d; Wed, 26 Jul 2023 09:21:09 +0000
Received: by outflank-mailman (input) for mailman id 570220;
 Wed, 26 Jul 2023 09:21:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7qZ+=DM=bytedance.com=zhengqi.arch@srs-se1.protection.inumbo.net>)
 id 1qOahf-0007Wb-Rn
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 09:21:07 +0000
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [2607:f8b0:4864:20::d30])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id beebeadc-2b95-11ee-8613-37d641c3527e;
 Wed, 26 Jul 2023 11:21:05 +0200 (CEST)
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-77dcff76e35so80533739f.1
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jul 2023 02:21:05 -0700 (PDT)
Received: from [10.70.252.135] ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 j1-20020a63b601000000b005638a70110bsm9005279pgf.65.2023.07.26.02.20.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Jul 2023 02:21:03 -0700 (PDT)
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
X-Inumbo-ID: beebeadc-2b95-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1690363264; x=1690968064;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7Vnbbe8QuBX5IRYOyrvoqHk8WWyxAnIOQvNq7rt3Y5Y=;
        b=kMv6YWq3e1+EWrbASVGI+G088ii73Fem/3I6VWvBzdurPzbdbS5fA2RHQQMLz4AOt4
         QngIWAV+s2uZUHK0vckMw0bfgtFV0R5eMbZlIk8/4w/wEVCJ5y5HwXF0DUiZjpzQho8t
         GXjQcaARWKdDQm6TOuzP1j52qtjLaAhVczvWaaLuobF1qPY5atrskgUIXJQL3lYTey8z
         3gvyQ55zN42zfh91LApyOvBpv3V6BxPnFobMIvKLNhs41DtS3MI2Zhwie6ylRR2RxuF8
         50dWB5Tz79PFVi03oGgeTfo0ercw9F6h7q/ECB9SYkDgRGeW/OcVP5UyZnJ2fh3Kr582
         LeCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690363264; x=1690968064;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7Vnbbe8QuBX5IRYOyrvoqHk8WWyxAnIOQvNq7rt3Y5Y=;
        b=fPQ9KnqkOdzaDtOjm5QxHkwehmqxvfJ9ycjwue6F0B/UWzJLRCjX3XcLc3kRtS2hSu
         PRlp327tUAVzCtGs7diTunnbj8JGuu3HH9Up23+70KX7wm+VLP61VQOvmkcFqIi8ddgo
         i8oZKR90dDBq1RcpsYj+BJZsyzLMQYcy6ABN/WjelF6c+bUs6JwuKGpDPH+SIMF1vVh/
         ZveM4xmGNG8U6T8+hg4WFkRgfczzlMBxrQY8OgH1m8Do6Dvs1AhQIqBIsRi/xr0WRgZG
         8p7e2jMmu+wyNZjONTdjbCY2mAGtBG16bfJQRflucrqLy6irYuD4lI1ognwdBiquRvbz
         vZTQ==
X-Gm-Message-State: ABy/qLb5mnIOo2UGWQEPrhUJEq3oQivqZQ5VprQktf0zPHBqdbybANhR
	W6G8DnxqlkX97KM+SPwuhT2UYw==
X-Google-Smtp-Source: APBJJlFD+0JL20cmcfz8xSZcxHSPSuKA9am5rBHzXLXGZAWVolxxOeef+bBAtrNC9deWoQ1MX3gUWg==
X-Received: by 2002:a6b:3b44:0:b0:787:1926:54ed with SMTP id i65-20020a6b3b44000000b00787192654edmr1450699ioa.1.1690363264233;
        Wed, 26 Jul 2023 02:21:04 -0700 (PDT)
Message-ID: <0caf10e8-e54b-3c1b-7df5-d95adc757ba7@bytedance.com>
Date: Wed, 26 Jul 2023 17:20:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v2 03/47] mm: shrinker: add infrastructure for dynamically
 allocating shrinker
Content-Language: en-US
To: Dave Chinner <david@fromorbit.com>
Cc: akpm@linux-foundation.org, tkhai@ya.ru, vbabka@suse.cz,
 roman.gushchin@linux.dev, djwong@kernel.org, brauner@kernel.org,
 paulmck@kernel.org, tytso@mit.edu, steven.price@arm.com, cel@kernel.org,
 senozhatsky@chromium.org, yujie.liu@intel.com, gregkh@linuxfoundation.org,
 muchun.song@linux.dev, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 x86@kernel.org, kvm@vger.kernel.org, xen-devel@lists.xenproject.org,
 linux-erofs@lists.ozlabs.org, linux-f2fs-devel@lists.sourceforge.net,
 cluster-devel@redhat.com, linux-nfs@vger.kernel.org,
 linux-mtd@lists.infradead.org, rcu@vger.kernel.org, netdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 dm-devel@redhat.com, linux-raid@vger.kernel.org,
 linux-bcache@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org, linux-btrfs@vger.kernel.org
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
 <20230724094354.90817-4-zhengqi.arch@bytedance.com>
 <ZMDKjBCZH6+OP5gW@dread.disaster.area>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <ZMDKjBCZH6+OP5gW@dread.disaster.area>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Dave,

On 2023/7/26 15:26, Dave Chinner wrote:
> On Mon, Jul 24, 2023 at 05:43:10PM +0800, Qi Zheng wrote:
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
>> 2. shrinker_free_non_registered()
>>
>> Used to destroy the non-registered shrinker instance.
> 
> This is a bit nasty
> 
>>
>> 3. shrinker_register()
>>
>> Used to register the shrinker instance, which is same as the current
>> register_shrinker_prepared().
>>
>> 4. shrinker_unregister()
> 
> rename this "shrinker_free()" and key the two different freeing
> cases on the SHRINKER_REGISTERED bit rather than mostly duplicating
> the two.

OK, will do in the next version.

> 
> void shrinker_free(struct shrinker *shrinker)
> {
> 	struct dentry *debugfs_entry = NULL;
> 	int debugfs_id;
> 
> 	if (!shrinker)
> 		return;
> 
> 	down_write(&shrinker_rwsem);
> 	if (shrinker->flags & SHRINKER_REGISTERED) {
> 		list_del(&shrinker->list);
> 		debugfs_entry = shrinker_debugfs_detach(shrinker, &debugfs_id);
> 	} else if (IS_ENABLED(CONFIG_SHRINKER_DEBUG)) {
> 		kfree_const(shrinker->name);
> 	}
> 
> 	if (shrinker->flags & SHRINKER_MEMCG_AWARE)
> 		unregister_memcg_shrinker(shrinker);
> 	up_write(&shrinker_rwsem);
> 
> 	if (debugfs_entry)
> 		shrinker_debugfs_remove(debugfs_entry, debugfs_id);
> 
> 	kfree(shrinker->nr_deferred);
> 	kfree(shrinker);
> }
> EXPORT_SYMBOL_GPL(shrinker_free);

Ah, I will change all new APIs to use EXPORT_SYMBOL_GPL().

Thanks,
Qi

> 

