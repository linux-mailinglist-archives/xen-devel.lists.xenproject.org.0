Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5B5765143
	for <lists+xen-devel@lfdr.de>; Thu, 27 Jul 2023 12:33:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570995.893751 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOyIJ-0003br-BR; Thu, 27 Jul 2023 10:32:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570995.893751; Thu, 27 Jul 2023 10:32:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOyIJ-0003Zs-8k; Thu, 27 Jul 2023 10:32:31 +0000
Received: by outflank-mailman (input) for mailman id 570995;
 Thu, 27 Jul 2023 10:32:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eXb/=DN=bytedance.com=zhengqi.arch@srs-se1.protection.inumbo.net>)
 id 1qOyIH-0003AY-Gv
 for xen-devel@lists.xenproject.org; Thu, 27 Jul 2023 10:32:29 +0000
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [2607:f8b0:4864:20::1032])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e146129c-2c68-11ee-b247-6b7b168915f2;
 Thu, 27 Jul 2023 12:32:28 +0200 (CEST)
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-2659b1113c2so160323a91.1
 for <xen-devel@lists.xenproject.org>; Thu, 27 Jul 2023 03:32:28 -0700 (PDT)
Received: from [10.70.252.135] ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 8-20020a17090a018800b0026309d57724sm2755058pjc.39.2023.07.27.03.32.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jul 2023 03:32:25 -0700 (PDT)
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
X-Inumbo-ID: e146129c-2c68-11ee-b247-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1690453945; x=1691058745;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4VsKgOIlO7JTMbURB3u+V7Qr/QzOpc+0Bt56AjhAYAM=;
        b=Zr/NhsMbDbdIdSqoueTQTw00LusmUmyLrdR7MeDx+ZO5Q+75jdmzv373GL0Ee5CtKr
         W6fluKiuFJCg5ZU3kW0Km101UvphMU1vBCY7hDEO6TFqab4XzqrIV8fVDPR2Owpqim7U
         N3OX4eAxVQVjc5z6Zvv7YweV9TAIgzv2mVUZoaytYD45Z4tHHiC7Kn023GaYmi5v6RKy
         g9n+r/2KPb5qfD2ZK/MDUQIwCLsfUVl7c4q/2XRu1uefpNinWMEwlZLohyik+zojbFUF
         urJtl81vW3ulTBjRT5ht+WLfC03kh8PaMNuzZ2kESl6uu5dT49u0KrVoAN4kKuQ8SPSD
         k2iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690453945; x=1691058745;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4VsKgOIlO7JTMbURB3u+V7Qr/QzOpc+0Bt56AjhAYAM=;
        b=hiYtVNOLMofMExT6wPK2p09gI80E55bQSADjs+iexaICMoQ34iiA5TRvg+wCo9n/Kk
         d8rlmKKEN8y23QlLW6+SKB+6r2n/1kfXdjhIa0RuAls4euubJMDRLa9cTHGS2O6qZj9f
         a8UIRHMYlWkBfz3xQC+Vh3Oqvb4n2comrC+q7/Bkc4k6fcTTUUWBSjLD4HSyPV+k1gDa
         btO2DmZ6K+mEYt3MJvzLJXAtilDeJj60+UIKPMIXQNyThBtWslTj+6RHCRQBBroIXUJb
         A68ELgrPoqYZM5diWNeCyImg1bArW30z/2zzyYwKSyN43x+zh2CRj4iGiJCAZTAAZOQ7
         iZrg==
X-Gm-Message-State: ABy/qLZeq59bkmZ/Y+N9X0y1hpJ3wxaarLS3bs7fwllpIVpukvc/0Mmq
	AFtpeWTFD4eex4F1xXr4JIK7yw==
X-Google-Smtp-Source: APBJJlGmzPZn88CMJAqpsojyTb97uikW28yo5O3pi8rH8SDlSH8BwjASuoOudfeGFyxgCSRxAf0mLA==
X-Received: by 2002:a17:90a:1b06:b0:263:2312:60c2 with SMTP id q6-20020a17090a1b0600b00263231260c2mr4299433pjq.3.1690453945653;
        Thu, 27 Jul 2023 03:32:25 -0700 (PDT)
Message-ID: <cc819e13-cb25-ddaa-e0e3-7328f5ea3a4f@bytedance.com>
Date: Thu, 27 Jul 2023 18:32:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v3 28/49] dm zoned: dynamically allocate the dm-zoned-meta
 shrinker
Content-Language: en-US
To: Damien Le Moal <dlemoal@kernel.org>
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
 Muchun Song <songmuchun@bytedance.com>, akpm@linux-foundation.org,
 david@fromorbit.com, tkhai@ya.ru, vbabka@suse.cz, roman.gushchin@linux.dev,
 djwong@kernel.org, brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
 steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
 yujie.liu@intel.com, gregkh@linuxfoundation.org, muchun.song@linux.dev
References: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
 <20230727080502.77895-29-zhengqi.arch@bytedance.com>
 <baaf7de4-9a0e-b953-2b6a-46e60c415614@kernel.org>
 <56ee1d92-28ee-81cb-9c41-6ca7ea6556b0@bytedance.com>
 <ba0868b2-9f90-3d81-1c91-8810057fb3ce@kernel.org>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <ba0868b2-9f90-3d81-1c91-8810057fb3ce@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2023/7/27 18:20, Damien Le Moal wrote:
> On 7/27/23 17:55, Qi Zheng wrote:
>>>>            goto err;
>>>>        }
>>>>    +    zmd->mblk_shrinker->count_objects = dmz_mblock_shrinker_count;
>>>> +    zmd->mblk_shrinker->scan_objects = dmz_mblock_shrinker_scan;
>>>> +    zmd->mblk_shrinker->seeks = DEFAULT_SEEKS;
>>>> +    zmd->mblk_shrinker->private_data = zmd;
>>>> +
>>>> +    shrinker_register(zmd->mblk_shrinker);
>>>
>>> I fail to see how this new shrinker API is better... Why isn't there a
>>> shrinker_alloc_and_register() function ? That would avoid adding all this code
>>> all over the place as the new API call would be very similar to the current
>>> shrinker_register() call with static allocation.
>>
>> In some registration scenarios, memory needs to be allocated in advance.
>> So we continue to use the previous prealloc/register_prepared()
>> algorithm. The shrinker_alloc_and_register() is just a helper function
>> that combines the two, and this increases the number of APIs that
>> shrinker exposes to the outside, so I choose not to add this helper.
> 
> And that results in more code in many places instead of less code + a simple
> inline helper in the shrinker header file... So not adding that super simple

It also needs to be exported to the driver for use.

> helper is not exactly the best choice in my opinion.

Hm, either one is fine for me. If no one else objects, I can add this
helper. ;)

> 

