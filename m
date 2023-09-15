Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DAD27A240A
	for <lists+xen-devel@lfdr.de>; Fri, 15 Sep 2023 18:59:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603316.940275 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhC9R-00051y-8I; Fri, 15 Sep 2023 16:58:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603316.940275; Fri, 15 Sep 2023 16:58:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhC9R-0004zg-5G; Fri, 15 Sep 2023 16:58:41 +0000
Received: by outflank-mailman (input) for mailman id 603316;
 Fri, 15 Sep 2023 16:58:40 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cweo=E7=daynix.com=akihiko.odaki@srs-se1.protection.inumbo.net>)
 id 1qhC9Q-0004za-ID
 for xen-devel@lists.xenproject.org; Fri, 15 Sep 2023 16:58:40 +0000
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [2607:f8b0:4864:20::432])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1dca5fe4-53e9-11ee-8788-cb3800f73035;
 Fri, 15 Sep 2023 18:58:39 +0200 (CEST)
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-68fbb10dea4so1955779b3a.3
 for <xen-devel@lists.xenproject.org>; Fri, 15 Sep 2023 09:58:39 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:78d2:b862:10a7:d486?
 ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
 by smtp.gmail.com with ESMTPSA id
 fm25-20020a056a002f9900b0068782960099sm3185450pfb.22.2023.09.15.09.58.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Sep 2023 09:58:37 -0700 (PDT)
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
X-Inumbo-ID: 1dca5fe4-53e9-11ee-8788-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1694797118; x=1695401918; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SuhfdU4PspnFHfisOXH5BuuofTvFKNo2MDW2PD1bi8M=;
        b=uqlymalZGx0UemnQ9CEddvuO/G+eaMFhjv0wPo9vI8qpIw2i9J9OK8h32/zluqVnhB
         C75a/2J274IOXNhFkyb6jPdUjNujRXzDY1jdtVQl6aXoRFnkqzfyTmcr17X+RphMfIZv
         mOe8tZpz0SVYstkvVUr0Ki6JSbFCuz59dymnkMxOeBAnIXfXf40TQOora4/sgqqFDCJB
         Zf77jzxPzsqpJJ22OwfGXb/R9MLk4350oxYg9ZDwkCss7Xo/RPOQC71pGTrmTAuFYXCt
         e/7zAAUl7P/qkUxuyiLaLo6hVRSd7sqvNbrzkvjZ267KplapOLQvdG4cEnRMYCTa9aR9
         zehQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694797118; x=1695401918;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SuhfdU4PspnFHfisOXH5BuuofTvFKNo2MDW2PD1bi8M=;
        b=gvQcmXwBKA4x/2v7XZizjijXzfFFLPaBvrZUOgP37cA72nYFwiAtQBq7RfeZ/G0/f7
         48nY6s5CZi/LBiKpEvkIGcxnfBY1/irlByzvbA4Pl11QM9jfMiPFmrCPNHg2N0qXTnRs
         kfLJJesB+ZqkOh1kmeL1f5HjmUJTbx+WSlgKuA1nlHT1XfqaQpSNUBZ4KsPEkbBUBolz
         L2fPspFBjQmp/avry2v9VVVkf/Mccm4/3lerQeuTUncPrwklU9NHIOnnu+sraQCqJO+b
         CfM5a1i9+DQxEza3Y2eW0KHFTk/YhuCE7j9Pc0CdgSNVtczeFUZVyckmabOJiH8LkmLJ
         fVow==
X-Gm-Message-State: AOJu0YzzLu12p5vZL7Tb8AleUK+ApFquseR+YSbdVQjoOy+ZOWcvex3t
	cDw9OP6Y0jajBE2fTywb14/2EQ==
X-Google-Smtp-Source: AGHT+IFdIGM6BidTwVLg4yqxDpSenVicZi7FNFdLCOeFim7bvnHJNiyUoQPR1KebsFw6KPvuwdbZBA==
X-Received: by 2002:a05:6a20:3d83:b0:13d:bf07:7444 with SMTP id s3-20020a056a203d8300b0013dbf077444mr2649176pzi.0.1694797117959;
        Fri, 15 Sep 2023 09:58:37 -0700 (PDT)
Message-ID: <37ed7472-428f-4a5a-8ac9-fd2a7ab05691@daynix.com>
Date: Sat, 16 Sep 2023 01:58:31 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [QEMU PATCH v5 06/13] virtio-gpu: Support context init feature
 with virglrenderer
Content-Language: en-US
To: Huang Rui <ray.huang@amd.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Antonio Caggiano <quic_acaggian@quicinc.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Robert Beckett <bob.beckett@collabora.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Albert Esteve <aesteve@redhat.com>, ernunes@redhat.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alyssa Ross <hi@alyssa.is>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Honglei Huang <honglei1.huang@amd.com>, Julia Zhang <julia.zhang@amd.com>,
 Chen Jiqian <Jiqian.Chen@amd.com>,
 Antonio Caggiano <antonio.caggiano@collabora.com>
References: <20230915111130.24064-1-ray.huang@amd.com>
 <20230915111130.24064-7-ray.huang@amd.com>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20230915111130.24064-7-ray.huang@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023/09/15 20:11, Huang Rui wrote:
> Patch "virtio-gpu: CONTEXT_INIT feature" has added the context_init
> feature flags.
> We would like to enable the feature with virglrenderer, so add to create
> virgl renderer context with flags using context_id when valid.
> 
> Originally-by: Antonio Caggiano <antonio.caggiano@collabora.com>
> Signed-off-by: Huang Rui <ray.huang@amd.com>
> ---
> 
> V4 -> V5:
>      - Inverted patch 5 and 6 because we should configure
>        HAVE_VIRGL_CONTEXT_INIT firstly. (Philippe)
> 
>   hw/display/virtio-gpu-virgl.c | 13 +++++++++++--
>   hw/display/virtio-gpu.c       |  2 ++
>   2 files changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
> index 8bb7a2c21f..312953ec16 100644
> --- a/hw/display/virtio-gpu-virgl.c
> +++ b/hw/display/virtio-gpu-virgl.c
> @@ -106,8 +106,17 @@ static void virgl_cmd_context_create(VirtIOGPU *g,
>       trace_virtio_gpu_cmd_ctx_create(cc.hdr.ctx_id,
>                                       cc.debug_name);
>   
> -    virgl_renderer_context_create(cc.hdr.ctx_id, cc.nlen,
> -                                  cc.debug_name);
> +    if (cc.context_init) {
> +#ifdef HAVE_VIRGL_CONTEXT_INIT
> +        virgl_renderer_context_create_with_flags(cc.hdr.ctx_id,
> +                                                 cc.context_init,
> +                                                 cc.nlen,
> +                                                 cc.debug_name);
> +        return;
> +#endif
> +    }
> +
> +    virgl_renderer_context_create(cc.hdr.ctx_id, cc.nlen, cc.debug_name);
>   }
>   
>   static void virgl_cmd_context_destroy(VirtIOGPU *g,
> diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
> index 3e658f1fef..a66cbd9930 100644
> --- a/hw/display/virtio-gpu.c
> +++ b/hw/display/virtio-gpu.c
> @@ -1506,6 +1506,8 @@ static Property virtio_gpu_properties[] = {
>       DEFINE_PROP_BIT("blob", VirtIOGPU, parent_obj.conf.flags,
>                       VIRTIO_GPU_FLAG_BLOB_ENABLED, false),
>       DEFINE_PROP_SIZE("hostmem", VirtIOGPU, parent_obj.conf.hostmem, 0),
> +    DEFINE_PROP_BIT("context_init", VirtIOGPU, parent_obj.conf.flags,
> +                    VIRTIO_GPU_FLAG_CONTEXT_INIT_ENABLED, false),
>       DEFINE_PROP_END_OF_LIST(),
>   };
>   

I think it's more convenient if this feature is enabled by default.

