Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C3E78E9ED
	for <lists+xen-devel@lfdr.de>; Thu, 31 Aug 2023 12:10:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593715.926778 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbed2-00080x-M5; Thu, 31 Aug 2023 10:10:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593715.926778; Thu, 31 Aug 2023 10:10:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbed2-0007xi-IQ; Thu, 31 Aug 2023 10:10:20 +0000
Received: by outflank-mailman (input) for mailman id 593715;
 Thu, 31 Aug 2023 10:10:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DT0c=EQ=daynix.com=akihiko.odaki@srs-se1.protection.inumbo.net>)
 id 1qbed0-0007xa-H9
 for xen-devel@lists.xenproject.org; Thu, 31 Aug 2023 10:10:18 +0000
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [2607:f8b0:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94659ad9-47e6-11ee-9b0d-b553b5be7939;
 Thu, 31 Aug 2023 12:10:16 +0200 (CEST)
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-68a529e1974so450243b3a.3
 for <xen-devel@lists.xenproject.org>; Thu, 31 Aug 2023 03:10:16 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:78d2:b862:10a7:d486?
 ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
 by smtp.gmail.com with ESMTPSA id
 ff16-20020a056a002f5000b0068991abe1desm1026798pfb.176.2023.08.31.03.10.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Aug 2023 03:10:14 -0700 (PDT)
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
X-Inumbo-ID: 94659ad9-47e6-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1693476614; x=1694081414; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7xV5TKTZLN/3JXan3YO54ft5hHcTRYD0N+F4yuMnyUc=;
        b=f8d+ZtV+wtwOcnP3rXmg3y0M8nY1dFC+o7XN0FxLnyrg+hLC0GU8ZJemdj4ftk2qYF
         eZKlyIs6KfUT69iAf9xYE/WME/BeAg2f4ob8Io4JFkJgy95e/PXZjI/y3onk781+SQ0L
         GAAg6HPdVBijTeueqhtNwSnxs0DrwBHt3O6w6fIMV865bodHqpxtbY4/EnOGmbUNT67b
         lGdDCODSV/4rHpqT2OdU52G+QALJzW8ArIJOkBTadZvn080E/KragV8gwrragM53F4GU
         l4EpkdB47CkoZB0gIXcRODQhEzZ96L0qRl4Xkp6v6Np3A9zWbjcg3zJy5Ypb7xnuMUu2
         YpWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693476614; x=1694081414;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7xV5TKTZLN/3JXan3YO54ft5hHcTRYD0N+F4yuMnyUc=;
        b=TjhR/L83O3gR5aSib1CJPWqxTvFbm4wfIjayT811ih7gV4hfXV+qY6s2SYWrLcEjgZ
         pXoVwAdFhqO0+T7i6a4bMnRv0f9wQ3R9d6HJIXOfpuzGUflW6b/9WjotOm8YkqKbbnaC
         15JxgX/etQyQzLhp9VVUvO/qxvGR/b1clQ/TLmBPDd94dHYTVj73BE2hxhWotGZmo0Gq
         +2gnafpDUiRt0pj5YAY1CfS2kEpIj+flVaM5ZxtRKgE3/4zMqOgF4t/R7H1gXqWZRx/q
         e07wvgBdjeLw8y811Go6kCbR3ucmIXh6isbn2giUKIbYDOYAemJ96tX13Udj+Dgc0TxJ
         byTQ==
X-Gm-Message-State: AOJu0Ywy5EVDYmKM1cH3KmTCScqm5YOSTymh9/6wCdGgP1zTc2BwAbkE
	pmiTc9EdoxEPJHZ8WDJnQQWTRw==
X-Google-Smtp-Source: AGHT+IEzCPAVkZ+OTDDrjqC043m/jBaZip82pDddNT2h8xBjnKXA9BSp1Xd1jvkLzRYYNTay05mZbA==
X-Received: by 2002:a05:6a20:c901:b0:130:835b:e6b7 with SMTP id gx1-20020a056a20c90100b00130835be6b7mr4181294pzb.47.1693476614617;
        Thu, 31 Aug 2023 03:10:14 -0700 (PDT)
Message-ID: <b988f9d4-69d7-4cc4-b13e-3e697acf9fe9@daynix.com>
Date: Thu, 31 Aug 2023 19:10:08 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [QEMU PATCH v4 07/13] softmmu/memory: enable automatic
 deallocation of memory regions
To: Huang Rui <ray.huang@amd.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Antonio Caggiano <antonio.caggiano@collabora.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Robert Beckett <bob.beckett@collabora.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org,
 Gurchetan Singh <gurchetansingh@chromium.org>, ernunes@redhat.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alyssa Ross <hi@alyssa.is>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Honglei Huang <honglei1.huang@amd.com>, Julia Zhang <julia.zhang@amd.com>,
 Chen Jiqian <Jiqian.Chen@amd.com>
References: <20230831093252.2461282-1-ray.huang@amd.com>
 <20230831093252.2461282-8-ray.huang@amd.com>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20230831093252.2461282-8-ray.huang@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023/08/31 18:32, Huang Rui wrote:
> From: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
> 
> When the memory region has a different life-cycle from that of her parent,
> could be automatically released, once has been unparent and once all of her
> references have gone away, via the object's free callback.
> 
> However, currently, references to the memory region are held by its owner
> without first incrementing the memory region object's reference count.
> As a result, the automatic deallocation of the object, not taking into
> account those references, results in use-after-free memory corruption.
> 
> This patch increases the reference count of the memory region object on
> each memory_region_ref() and decreases it on each memory_region_unref().
> 
> Signed-off-by: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
> Signed-off-by: Huang Rui <ray.huang@amd.com>
> ---
> 
> New patch
> 
>   softmmu/memory.c | 19 +++++++++++++++++--
>   1 file changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/softmmu/memory.c b/softmmu/memory.c
> index 7d9494ce70..0fdd5eebf9 100644
> --- a/softmmu/memory.c
> +++ b/softmmu/memory.c
> @@ -1797,6 +1797,15 @@ Object *memory_region_owner(MemoryRegion *mr)
>   
>   void memory_region_ref(MemoryRegion *mr)
>   {
> +    if (!mr) {
> +        return;
> +    }
> +
> +    /* Obtain a reference to prevent the memory region object
> +     * from being released under our feet.
> +     */
> +    object_ref(OBJECT(mr));
> +
>       /* MMIO callbacks most likely will access data that belongs
>        * to the owner, hence the need to ref/unref the owner whenever
>        * the memory region is in use.
> @@ -1807,16 +1816,22 @@ void memory_region_ref(MemoryRegion *mr)
>        * Memory regions without an owner are supposed to never go away;
>        * we do not ref/unref them because it slows down DMA sensibly.
>        */

The collapsed comment says:
 > The memory region is a child of its owner.  As long as the
 > owner doesn't call unparent itself on the memory region,
 > ref-ing the owner will also keep the memory region alive.
 > Memory regions without an owner are supposed to never go away;
 > we do not ref/unref them because it slows down DMA sensibly.

It contradicts with this patch.

> -    if (mr && mr->owner) {
> +    if (mr->owner) {
>           object_ref(mr->owner);
>       }
>   }
>   
>   void memory_region_unref(MemoryRegion *mr)
>   {
> -    if (mr && mr->owner) {
> +    if (!mr) {
> +        return;
> +    }
> +
> +    if (mr->owner) {
>           object_unref(mr->owner);
>       }
> +
> +    object_unref(OBJECT(mr));
>   }
>   
>   uint64_t memory_region_size(MemoryRegion *mr)

