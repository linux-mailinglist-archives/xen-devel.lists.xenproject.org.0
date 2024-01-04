Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 757D4824179
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jan 2024 13:17:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.661728.1031414 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLMeP-0006Ie-Eq; Thu, 04 Jan 2024 12:16:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 661728.1031414; Thu, 04 Jan 2024 12:16:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rLMeP-0006Fs-Bs; Thu, 04 Jan 2024 12:16:41 +0000
Received: by outflank-mailman (input) for mailman id 661728;
 Thu, 04 Jan 2024 12:16:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PTP6=IO=daynix.com=akihiko.odaki@srs-se1.protection.inumbo.net>)
 id 1rLMeO-0006Fm-Hx
 for xen-devel@lists.xenproject.org; Thu, 04 Jan 2024 12:16:40 +0000
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [2607:f8b0:4864:20::632])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1c9d07d0-aafb-11ee-98ef-6d05b1d4d9a1;
 Thu, 04 Jan 2024 13:16:39 +0100 (CET)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1d3f8af8297so2291915ad.2
 for <xen-devel@lists.xenproject.org>; Thu, 04 Jan 2024 04:16:39 -0800 (PST)
Received: from ?IPV6:2400:4050:a840:1e00:9ac7:6d57:2b16:6932?
 ([2400:4050:a840:1e00:9ac7:6d57:2b16:6932])
 by smtp.gmail.com with ESMTPSA id
 r1-20020a1709028bc100b001d4be72802esm6337823plo.150.2024.01.04.04.16.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Jan 2024 04:16:37 -0800 (PST)
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
X-Inumbo-ID: 1c9d07d0-aafb-11ee-98ef-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1704370598; x=1704975398; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EYyEGe5ydr4mM6eWvaqTfQv1BLtvmj92kc4KF6KDejI=;
        b=sDSGSns+kotuv4jIPypOtB3t/OCGS4DP1DfUxSIcLXSc8o11PwkXhSdzikNMNZrKoC
         8U/UIr1ZCWkyfBM1sPEXNJ34nZBDFmY2M4nLt4PaWDpE8DDrvAxnaaDxgX4Rn6PXxOxo
         qFpdklEfB3uLs65PiJsS2bzbyw+pIlJkOzg0wlKvxrM2YxjGgC3XHvDxlxR+ZdFqDw6H
         Pe2WklUXthW3Ocfz9D/WxBbVzwjZ/5n1UOwlMIwpgezpKW5Z+bCnDyRurgltQ9mcKzNm
         KKAUBbv6EKTM7PwvPo3hFgUBgkfX1e/ShJT8iChIqK+yNAeeN7sYBCLluKPqs3jACWVi
         M1zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704370598; x=1704975398;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EYyEGe5ydr4mM6eWvaqTfQv1BLtvmj92kc4KF6KDejI=;
        b=B1CIdTwn785we/C4KjAeS6kyUoOy8Ury2PgonkFj3iHE9SzUe4tLHpqopcrK/C5kwA
         eGibrTbDaKsCbfVzZtdZhauaXtXFSH/zi2oWmmKQ7QN1cBPmAzj+NCDAPBvu4bRBGxKZ
         FN1opgt9kX0GvYOWbuypt4HIHi/mhCpQYk2HI8pzyq4jeMRYCcAOvLHCGzLv1R0AhLYA
         Y/coe/Ls+91FTrvzD8/07QGCXYp6mE8FzjnK1aVGQJcXIC9BR1fxS2KB4f2BjS+ycvIb
         S8usDNKsGgyrFEbqYpH9jyF7wEkTIoi8nceCokxx0Y1D1OrYT0144CgJ/vWYuXITZZrp
         Ztnw==
X-Gm-Message-State: AOJu0Yx/+F+0Zgrt7waFirMunA27piJHQs28KMGk7I/D4k5RhrJ2xTQY
	5CcxLLQtFhfuUiSS41kfDpGEZFgldvMCdg==
X-Google-Smtp-Source: AGHT+IEeXiQT8qwQqiGs7lXDTBoTsxUSIfBM7UACGvrgKBmcagbrJKZAJ638hD8/dLLbDq855NNbyw==
X-Received: by 2002:a17:902:6b42:b0:1d4:60b2:b1b1 with SMTP id g2-20020a1709026b4200b001d460b2b1b1mr388277plt.6.1704370598276;
        Thu, 04 Jan 2024 04:16:38 -0800 (PST)
Message-ID: <bde05200-a450-470e-8a62-feb0235ac56f@daynix.com>
Date: Thu, 4 Jan 2024 21:16:31 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 03/11] virtio-gpu: Support context init feature with
 virglrenderer
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
 <20231219075320.165227-4-ray.huang@amd.com>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20231219075320.165227-4-ray.huang@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023/12/19 16:53, Huang Rui wrote:
> Patch "virtio-gpu: CONTEXT_INIT feature" has added the context_init
> feature flags.
> We would like to enable the feature with virglrenderer, so add to create
> virgl renderer context with flags using context_id when valid.
> 
> Originally-by: Antonio Caggiano <antonio.caggiano@collabora.com>
> Signed-off-by: Huang Rui <ray.huang@amd.com>
> ---
> 
> Changes in v6:
> - Handle the case while context_init is disabled.
> - Enable context_init by default.
> 
>   hw/display/virtio-gpu-virgl.c | 13 +++++++++++--
>   hw/display/virtio-gpu.c       |  4 ++++
>   2 files changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
> index 8bb7a2c21f..5bbc8071b2 100644
> --- a/hw/display/virtio-gpu-virgl.c
> +++ b/hw/display/virtio-gpu-virgl.c
> @@ -106,8 +106,17 @@ static void virgl_cmd_context_create(VirtIOGPU *g,
>       trace_virtio_gpu_cmd_ctx_create(cc.hdr.ctx_id,
>                                       cc.debug_name);
>   
> -    virgl_renderer_context_create(cc.hdr.ctx_id, cc.nlen,
> -                                  cc.debug_name);
> +#ifdef HAVE_VIRGL_CONTEXT_CREATE_WITH_FLAGS
> +    if (cc.context_init && virtio_gpu_context_init_enabled(g->parent_obj.conf)) {
> +        virgl_renderer_context_create_with_flags(cc.hdr.ctx_id,
> +                                                 cc.context_init,
> +                                                 cc.nlen,
> +                                                 cc.debug_name);
> +        return;
> +    }
> +#endif
> +
> +    virgl_renderer_context_create(cc.hdr.ctx_id, cc.nlen, cc.debug_name);
>   }
>   
>   static void virgl_cmd_context_destroy(VirtIOGPU *g,
> diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
> index b016d3bac8..8b2f4c6be3 100644
> --- a/hw/display/virtio-gpu.c
> +++ b/hw/display/virtio-gpu.c
> @@ -1619,6 +1619,10 @@ static Property virtio_gpu_properties[] = {
>       DEFINE_PROP_BIT("blob", VirtIOGPU, parent_obj.conf.flags,
>                       VIRTIO_GPU_FLAG_BLOB_ENABLED, false),
>       DEFINE_PROP_SIZE("hostmem", VirtIOGPU, parent_obj.conf.hostmem, 0),
> +#ifdef HAVE_VIRGL_CONTEXT_CREATE_WITH_FLAGS
> +    DEFINE_PROP_BIT("context_init", VirtIOGPU, parent_obj.conf.flags,

The convention is to use "-" instead of "_" as delimiters. See comments 
for object_property_add() in: include/qom/object.h

Regards,
Akihiko Odaki

