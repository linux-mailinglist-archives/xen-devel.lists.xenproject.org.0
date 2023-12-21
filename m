Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8459581AE8D
	for <lists+xen-devel@lfdr.de>; Thu, 21 Dec 2023 06:58:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.658480.1027638 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGC40-0005JB-NA; Thu, 21 Dec 2023 05:57:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 658480.1027638; Thu, 21 Dec 2023 05:57:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGC40-0005GU-Ka; Thu, 21 Dec 2023 05:57:44 +0000
Received: by outflank-mailman (input) for mailman id 658480;
 Thu, 21 Dec 2023 05:57:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1W3I=IA=daynix.com=akihiko.odaki@srs-se1.protection.inumbo.net>)
 id 1rGC3y-0005GO-Um
 for xen-devel@lists.xenproject.org; Thu, 21 Dec 2023 05:57:42 +0000
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [2607:f8b0:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d93d2991-9fc5-11ee-9b0f-b553b5be7939;
 Thu, 21 Dec 2023 06:57:40 +0100 (CET)
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1d3ce28ac3cso2326605ad.0
 for <xen-devel@lists.xenproject.org>; Wed, 20 Dec 2023 21:57:40 -0800 (PST)
Received: from [157.82.205.15] ([157.82.205.15])
 by smtp.gmail.com with ESMTPSA id
 d11-20020a170902c18b00b001d3f056bd65sm706571pld.191.2023.12.20.21.57.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Dec 2023 21:57:38 -0800 (PST)
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
X-Inumbo-ID: d93d2991-9fc5-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1703138259; x=1703743059; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7Rcc45KsdcmjGxxLc8UIdrrEhZeaVWgm/MkKyVTozcM=;
        b=yUNDOpnzRLiyUnEEcu/gRc2SQ0fei8bz5K8Sc6HFChBWbDxmZABSZrISaUKSeEpr+q
         xgD6CdO6wZrIf7SzfqFMdPy+Ucm4UViqbHkG+bXlUN5IiSwKnX107g4E3J4EZcrmlaTW
         rVeQF+Nc5zkBUHwIb3w6G1+35HEQBDtacwN07z751z7nFUPUHOBJHMlk9k+7EZ1/CVy9
         Aefdj1USwBj4h2DU1ZbihzSX/N0KViNObIon5MWpZxA7bIAAYur/O89UWwfxvU6OSl20
         7KwCQzsqQoIkbae4bfyNrmcRKqnCvxt1kgRmQos0Evdoawhj4agp3AOGNcFOAkuLN4aE
         jsug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703138259; x=1703743059;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7Rcc45KsdcmjGxxLc8UIdrrEhZeaVWgm/MkKyVTozcM=;
        b=ws0SfVeFVOZG5jqsWgRvLUOwqUoKkDoGxfd13KwPH+HZY453G7xthT/H01TiEYwRTl
         qGJfzickIOIuRx817Nz3K4MnCtAbmtPexuS1d+ewxLtEI0hb2sfwf/A4bUj7kLvgt3sp
         O4Irzta87auvP2gnNFwWRIZFQ0kHa+6UNvwbJVtp8FK2p37y2ScZgo7WqSponrKaZ3JN
         1d+ZxliaRrmUFmC48xm9cXgebI4uewnBfyDzbyMvX5NYmDO/xDpOj7Lgo3baUPA0vlqC
         ET6BAVjktVHNLvpOHm+PeYZkY3j/ATh2vmvmslaIiAVIHBfxZJ21RHWbtJYWH9vCa0mV
         y3cg==
X-Gm-Message-State: AOJu0YxNduuG9BVo7IGjZovXoIUDEztNjX/ov9/aLHHHmhg50ZxqjRnc
	t20mvqLShxGkDi5GDDKaJiFuqA==
X-Google-Smtp-Source: AGHT+IHGw0/xJGMfpNai3w9B7992IeeEENPNFYUbvUzBvYTZo9zWw6/R2YYwCA50v8JBAqb4YhbKsw==
X-Received: by 2002:a17:902:c451:b0:1d3:e9f5:d3aa with SMTP id m17-20020a170902c45100b001d3e9f5d3aamr1549392plm.45.1703138259056;
        Wed, 20 Dec 2023 21:57:39 -0800 (PST)
Message-ID: <9ee393a7-283c-41b2-a7bb-5e3306c0257e@daynix.com>
Date: Thu, 21 Dec 2023 14:57:32 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 07/11] virtio-gpu: Handle resource blob commands
Content-Language: en-US
To: Huang Rui <ray.huang@amd.com>,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Antonio Caggiano <quic_acaggian@quicinc.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Robert Beckett <bob.beckett@collabora.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gert Wollny <gert.wollny@collabora.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org,
 Gurchetan Singh <gurchetansingh@chromium.org>, ernunes@redhat.com,
 Alyssa Ross <hi@alyssa.is>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Alex Deucher <alexander.deucher@amd.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Honglei Huang <honglei1.huang@amd.com>, Julia Zhang <julia.zhang@amd.com>,
 Chen Jiqian <Jiqian.Chen@amd.com>,
 Antonio Caggiano <antonio.caggiano@collabora.com>
References: <20231219075320.165227-1-ray.huang@amd.com>
 <20231219075320.165227-8-ray.huang@amd.com>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20231219075320.165227-8-ray.huang@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023/12/19 16:53, Huang Rui wrote:
> From: Antonio Caggiano <antonio.caggiano@collabora.com>
> 
> Support BLOB resources creation, mapping and unmapping by calling the
> new stable virglrenderer 0.10 interface. Only enabled when available and
> via the blob config. E.g. -device virtio-vga-gl,blob=true
> 
> Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
> Signed-off-by: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
> Signed-off-by: Huang Rui <ray.huang@amd.com>
> ---
> 
> Changes in v6:
> - Use new struct virgl_gpu_resource.
> - Unmap, unref and destroy the resource only after the memory region
>    has been completely removed.
> - In unref check whether the resource is still mapped.
> - In unmap_blob check whether the resource has been already unmapped.
> - Fix coding style
> 
>   hw/display/virtio-gpu-virgl.c | 274 +++++++++++++++++++++++++++++++++-
>   hw/display/virtio-gpu.c       |   4 +-
>   meson.build                   |   4 +
>   3 files changed, 276 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
> index faab374336..5a3a292f79 100644
> --- a/hw/display/virtio-gpu-virgl.c
> +++ b/hw/display/virtio-gpu-virgl.c
> @@ -17,6 +17,7 @@
>   #include "trace.h"
>   #include "hw/virtio/virtio.h"
>   #include "hw/virtio/virtio-gpu.h"
> +#include "hw/virtio/virtio-gpu-bswap.h"
>   
>   #include "ui/egl-helpers.h"
>   
> @@ -24,8 +25,62 @@
>   
>   struct virgl_gpu_resource {
>       struct virtio_gpu_simple_resource res;
> +    uint32_t ref;
> +    VirtIOGPU *g;
> +
> +#ifdef HAVE_VIRGL_RESOURCE_BLOB
> +    /* only blob resource needs this region to be mapped as guest mmio */
> +    MemoryRegion *region;

Why not just embed MemoryRegion into struct virgl_gpu_resource instead 
of having a pointer?

> +#endif
>   };
>   
> +static void vres_get_ref(struct virgl_gpu_resource *vres)
> +{
> +    uint32_t ref;
> +
> +    ref = qatomic_fetch_inc(&vres->ref);
> +    g_assert(ref < INT_MAX);
> +}
> +
> +static void virgl_resource_destroy(struct virgl_gpu_resource *vres)
> +{
> +    struct virtio_gpu_simple_resource *res;
> +    VirtIOGPU *g;
> +
> +    if (!vres) {
> +        return;
> +    }
> +
> +    g = vres->g;
> +    res = &vres->res;
> +    QTAILQ_REMOVE(&g->reslist, res, next);
> +    virtio_gpu_cleanup_mapping(g, res);
> +    g_free(vres);
> +}
> +
> +static void virgl_resource_unref(struct virgl_gpu_resource *vres)
> +{
> +    struct virtio_gpu_simple_resource *res;
> +
> +    if (!vres) {
> +        return;
> +    }
> +
> +    res = &vres->res;
> +    virgl_renderer_resource_detach_iov(res->resource_id, NULL, NULL);
> +    virgl_renderer_resource_unref(res->resource_id);
> +}
> +
> +static void vres_put_ref(struct virgl_gpu_resource *vres)
> +{
> +    g_assert(vres->ref > 0);
> +
> +    if (qatomic_fetch_dec(&vres->ref) == 1) {
> +        virgl_resource_unref(vres);
> +        virgl_resource_destroy(vres);
> +    }
> +}
> +
>   static struct virgl_gpu_resource *
>   virgl_gpu_find_resource(VirtIOGPU *g, uint32_t resource_id)
>   {
> @@ -59,6 +114,8 @@ static void virgl_cmd_create_resource_2d(VirtIOGPU *g,
>                                          c2d.width, c2d.height);
>   
>       vres = g_new0(struct virgl_gpu_resource, 1);
> +    vres_get_ref(vres);
> +    vres->g = g;
>       vres->res.width = c2d.width;
>       vres->res.height = c2d.height;
>       vres->res.format = c2d.format;
> @@ -91,6 +148,8 @@ static void virgl_cmd_create_resource_3d(VirtIOGPU *g,
>                                          c3d.width, c3d.height, c3d.depth);
>   
>       vres = g_new0(struct virgl_gpu_resource, 1);
> +    vres_get_ref(vres);
> +    vres->g = g;
>       vres->res.width = c3d.width;
>       vres->res.height = c3d.height;
>       vres->res.format = c3d.format;
> @@ -126,12 +185,21 @@ static void virgl_cmd_resource_unref(VirtIOGPU *g,
>           return;
>       }
>   
> -    virgl_renderer_resource_detach_iov(unref.resource_id, NULL, NULL);
> -    virgl_renderer_resource_unref(unref.resource_id);
> +#ifdef HAVE_VIRGL_RESOURCE_BLOB
> +    if (vres->region) {
> +        VirtIOGPUBase *b = VIRTIO_GPU_BASE(g);
> +        MemoryRegion *mr = vres->region;
> +
> +        warn_report("%s: blob resource %d not unmapped",
> +                    __func__, unref.resource_id);
> +        vres->region = NULL;
> +        memory_region_set_enabled(mr, false);
> +        memory_region_del_subregion(&b->hostmem, mr);
> +        object_unparent(OBJECT(mr));
> +    }
> +#endif /* HAVE_VIRGL_RESOURCE_BLOB */
>   
> -    QTAILQ_REMOVE(&g->reslist, &vres->res, next);
> -    virtio_gpu_cleanup_mapping(g, &vres->res);
> -    g_free(vres);
> +    vres_put_ref(vres);

What will happen if the guest consecutively requests 
VIRTIO_GPU_CMD_RESOURCE_UNREF twice for a mapped resource?

