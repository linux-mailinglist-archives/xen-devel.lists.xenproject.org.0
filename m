Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5B5760647
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 05:05:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569342.889762 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qO8Mb-0000uV-90; Tue, 25 Jul 2023 03:05:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569342.889762; Tue, 25 Jul 2023 03:05:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qO8Mb-0000sC-6O; Tue, 25 Jul 2023 03:05:29 +0000
Received: by outflank-mailman (input) for mailman id 569342;
 Tue, 25 Jul 2023 03:05:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8+K8=DL=bytedance.com=zhengqi.arch@srs-se1.protection.inumbo.net>)
 id 1qO8MZ-0000s6-Nf
 for xen-devel@lists.xenproject.org; Tue, 25 Jul 2023 03:05:27 +0000
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [2607:f8b0:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 19e3d1b2-2a98-11ee-b23c-6b7b168915f2;
 Tue, 25 Jul 2023 05:05:26 +0200 (CEST)
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-6864c144897so1189009b3a.1
 for <xen-devel@lists.xenproject.org>; Mon, 24 Jul 2023 20:05:26 -0700 (PDT)
Received: from ?IPV6:fdbd:ff1:ce00:1c25:884:3ed:e1db:b610?
 ([2408:8000:b001:1:1f:58ff:f102:103])
 by smtp.gmail.com with ESMTPSA id
 t10-20020a17090aba8a00b002681d44071csm2043968pjr.46.2023.07.24.20.05.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jul 2023 20:05:24 -0700 (PDT)
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
X-Inumbo-ID: 19e3d1b2-2a98-11ee-b23c-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1690254325; x=1690859125;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=niSMZqBCvW/Me9jsMaxXz5gtuZ44llk1Ot3soT0LhIs=;
        b=FniJo6cfZiXO48N3LrJPbrRtsXuGwEsrxL+rPNcNzpIfBU8e0vwfaKRVcngIxQ6/Nq
         uV6IwXjWItzg/7IWT04hxNl0ft8u0yvH7EyRJ6POcXsP6dFyjR2vvuievKT7V7wXKj9i
         Hs4OFXg82m4uyRZZDGIHYrUPf7Daiin7owJFDMH9ALFzGhGiMR/jo54iE9PQ2yCszEax
         GduXKZlfrLf0f1lI69b+SeFKsM1fBAPgAwEi9/QiPJB5pr3rcwSAawR7U6Bt6cbBHX1B
         l+6jljnScvspLgnoIuyzCCNBX+9PGgFUwcZiZbmROS7agCNCVVXov8LOv0CsZfjvTopq
         9j6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690254325; x=1690859125;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=niSMZqBCvW/Me9jsMaxXz5gtuZ44llk1Ot3soT0LhIs=;
        b=OTg2q0BtlKaUZHlyUlNa8DtLOEWQWxwY32ELSMYm2VBT+iI6mJHyHA94i8GDg3P3YC
         Qmhvz3yAOW6MZjJv1OdZsdviKKjCNStApUPEcJbX0qHGLLP6pV8hqtXl73u4zYSoMqOx
         Wqpn7qRcOnjFo5fWu3JSICHzORYGi5naIEpQSia9SOod5RBMpivtcYY4r8WvgaTBh4V/
         NeU/z2AlUBd3QSBuFCIG8VHi5GigQSygMHQF9A9H8VQqXyG/KA6tOG5VYPdqxmYGkq55
         VY45Npf1oRFiYbwY8utmNunUQIl+UA/hOp+RQcLaE8NRmVvTV2LZ80ojQwQ9gqRTMJVq
         PNPA==
X-Gm-Message-State: ABy/qLZgtF7DStjXfHm2eFUxCM+IdwSXFRFZ5hyUNgapqIhxlHnwEzFB
	C+GgfR2sHdvYAAOVI/TQmvJ4VA==
X-Google-Smtp-Source: APBJJlFB/cQTGj3IlIfGF+HAM8hU50IJB+Lr29ujA3cHbbDSAB3N90HdGCOpa8iydTeMw+f8qxyL2Q==
X-Received: by 2002:a17:90a:1d46:b0:268:abc:83d5 with SMTP id u6-20020a17090a1d4600b002680abc83d5mr6012554pju.4.1690254324674;
        Mon, 24 Jul 2023 20:05:24 -0700 (PDT)
Message-ID: <6049aa99-aa47-5137-f66e-350bc4723914@bytedance.com>
Date: Tue, 25 Jul 2023 11:05:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.12.0
Subject: Re: [PATCH v2 24/47] drm/panfrost: dynamically allocate the
 drm-panfrost shrinker
Content-Language: en-US
To: Steven Price <steven.price@arm.com>
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
 paulmck@kernel.org, tytso@mit.edu, cel@kernel.org, senozhatsky@chromium.org,
 yujie.liu@intel.com, gregkh@linuxfoundation.org, muchun.song@linux.dev
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
 <20230724094354.90817-25-zhengqi.arch@bytedance.com>
 <cdd08c9e-81d3-a85f-5426-5db738aa73ec@arm.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <cdd08c9e-81d3-a85f-5426-5db738aa73ec@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Steven,

On 2023/7/24 19:17, Steven Price wrote:
> On 24/07/2023 10:43, Qi Zheng wrote:
>> In preparation for implementing lockless slab shrink, use new APIs to
>> dynamically allocate the drm-panfrost shrinker, so that it can be freed
>> asynchronously using kfree_rcu(). Then it doesn't need to wait for RCU
>> read-side critical section when releasing the struct panfrost_device.
>>
>> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> 
> One nit below, but otherwise:
> 
> Reviewed-by: Steven Price <steven.price@arm.com>
> 
>> ---
>>   drivers/gpu/drm/panfrost/panfrost_device.h    |  2 +-
>>   drivers/gpu/drm/panfrost/panfrost_drv.c       |  6 +++-
>>   drivers/gpu/drm/panfrost/panfrost_gem.h       |  2 +-
>>   .../gpu/drm/panfrost/panfrost_gem_shrinker.c  | 32 ++++++++++++-------
>>   4 files changed, 27 insertions(+), 15 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
>> index b0126b9fbadc..e667e5689353 100644
>> --- a/drivers/gpu/drm/panfrost/panfrost_device.h
>> +++ b/drivers/gpu/drm/panfrost/panfrost_device.h
>> @@ -118,7 +118,7 @@ struct panfrost_device {
>>   
>>   	struct mutex shrinker_lock;
>>   	struct list_head shrinker_list;
>> -	struct shrinker shrinker;
>> +	struct shrinker *shrinker;
>>   
>>   	struct panfrost_devfreq pfdevfreq;
>>   };
>> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
>> index bbada731bbbd..f705bbdea360 100644
>> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
>> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
>> @@ -598,10 +598,14 @@ static int panfrost_probe(struct platform_device *pdev)
>>   	if (err < 0)
>>   		goto err_out1;
>>   
>> -	panfrost_gem_shrinker_init(ddev);
>> +	err = panfrost_gem_shrinker_init(ddev);
>> +	if (err)
>> +		goto err_out2;
>>   
>>   	return 0;
>>   
>> +err_out2:
>> +	drm_dev_unregister(ddev);
>>   err_out1:
>>   	pm_runtime_disable(pfdev->dev);
>>   	panfrost_device_fini(pfdev);
>> diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.h b/drivers/gpu/drm/panfrost/panfrost_gem.h
>> index ad2877eeeccd..863d2ec8d4f0 100644
>> --- a/drivers/gpu/drm/panfrost/panfrost_gem.h
>> +++ b/drivers/gpu/drm/panfrost/panfrost_gem.h
>> @@ -81,7 +81,7 @@ panfrost_gem_mapping_get(struct panfrost_gem_object *bo,
>>   void panfrost_gem_mapping_put(struct panfrost_gem_mapping *mapping);
>>   void panfrost_gem_teardown_mappings_locked(struct panfrost_gem_object *bo);
>>   
>> -void panfrost_gem_shrinker_init(struct drm_device *dev);
>> +int panfrost_gem_shrinker_init(struct drm_device *dev);
>>   void panfrost_gem_shrinker_cleanup(struct drm_device *dev);
>>   
>>   #endif /* __PANFROST_GEM_H__ */
>> diff --git a/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c b/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
>> index bf0170782f25..9a90dfb5301f 100644
>> --- a/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
>> +++ b/drivers/gpu/drm/panfrost/panfrost_gem_shrinker.c
>> @@ -18,8 +18,7 @@
>>   static unsigned long
>>   panfrost_gem_shrinker_count(struct shrinker *shrinker, struct shrink_control *sc)
>>   {
>> -	struct panfrost_device *pfdev =
>> -		container_of(shrinker, struct panfrost_device, shrinker);
>> +	struct panfrost_device *pfdev = shrinker->private_data;
>>   	struct drm_gem_shmem_object *shmem;
>>   	unsigned long count = 0;
>>   
>> @@ -65,8 +64,7 @@ static bool panfrost_gem_purge(struct drm_gem_object *obj)
>>   static unsigned long
>>   panfrost_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
>>   {
>> -	struct panfrost_device *pfdev =
>> -		container_of(shrinker, struct panfrost_device, shrinker);
>> +	struct panfrost_device *pfdev = shrinker->private_data;
>>   	struct drm_gem_shmem_object *shmem, *tmp;
>>   	unsigned long freed = 0;
>>   
>> @@ -97,13 +95,24 @@ panfrost_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
>>    *
>>    * This function registers and sets up the panfrost shrinker.
>>    */
>> -void panfrost_gem_shrinker_init(struct drm_device *dev)
>> +int panfrost_gem_shrinker_init(struct drm_device *dev)
>>   {
>>   	struct panfrost_device *pfdev = dev->dev_private;
>> -	pfdev->shrinker.count_objects = panfrost_gem_shrinker_count;
>> -	pfdev->shrinker.scan_objects = panfrost_gem_shrinker_scan;
>> -	pfdev->shrinker.seeks = DEFAULT_SEEKS;
>> -	WARN_ON(register_shrinker(&pfdev->shrinker, "drm-panfrost"));
>> +
>> +	pfdev->shrinker = shrinker_alloc(0, "drm-panfrost");
>> +	if (!pfdev->shrinker) {
>> +		WARN_ON(1);
> 
> I don't think this WARN_ON is particularly useful - if there's a failed
> memory allocation we should see output from the kernel anyway. And we're
> changing the semantics from "continue just without a shrinker" (which
> argueably justifies the warning) to "probe fails, device doesn't work"
> which will be obvious to the user so I don't feel we need the additional
> warn.

Make sense. Will delete this WARN_ON() in the next version.

Thanks,
Qi

> 
>> +		return -ENOMEM;
>> +	}
>> +
>> +	pfdev->shrinker->count_objects = panfrost_gem_shrinker_count;
>> +	pfdev->shrinker->scan_objects = panfrost_gem_shrinker_scan;
>> +	pfdev->shrinker->seeks = DEFAULT_SEEKS;
>> +	pfdev->shrinker->private_data = pfdev;
>> +
>> +	shrinker_register(pfdev->shrinker);
>> +
>> +	return 0;
>>   }
>>   
>>   /**
>> @@ -116,7 +125,6 @@ void panfrost_gem_shrinker_cleanup(struct drm_device *dev)
>>   {
>>   	struct panfrost_device *pfdev = dev->dev_private;
>>   
>> -	if (pfdev->shrinker.nr_deferred) {
>> -		unregister_shrinker(&pfdev->shrinker);
>> -	}
>> +	if (pfdev->shrinker)
>> +		shrinker_unregister(pfdev->shrinker);
>>   }
> 

