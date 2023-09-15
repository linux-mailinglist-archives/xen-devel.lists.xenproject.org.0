Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE3A7A2232
	for <lists+xen-devel@lfdr.de>; Fri, 15 Sep 2023 17:21:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603288.940235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhAcq-0008BR-IC; Fri, 15 Sep 2023 15:20:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603288.940235; Fri, 15 Sep 2023 15:20:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhAcq-00088l-Et; Fri, 15 Sep 2023 15:20:56 +0000
Received: by outflank-mailman (input) for mailman id 603288;
 Fri, 15 Sep 2023 15:20:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cweo=E7=daynix.com=akihiko.odaki@srs-se1.protection.inumbo.net>)
 id 1qhAcp-00088f-1b
 for xen-devel@lists.xenproject.org; Fri, 15 Sep 2023 15:20:55 +0000
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [2607:f8b0:4864:20::42c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 75bc6fb2-53db-11ee-8788-cb3800f73035;
 Fri, 15 Sep 2023 17:20:54 +0200 (CEST)
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-68fb2e9ebbfso1866928b3a.2
 for <xen-devel@lists.xenproject.org>; Fri, 15 Sep 2023 08:20:54 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:78d2:b862:10a7:d486?
 ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
 by smtp.gmail.com with ESMTPSA id
 n17-20020aa78a51000000b0068bc014f352sm3106609pfa.7.2023.09.15.08.20.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 15 Sep 2023 08:20:52 -0700 (PDT)
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
X-Inumbo-ID: 75bc6fb2-53db-11ee-8788-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1694791252; x=1695396052; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/c8yieboNB6oo1mu8ZkACI0svLfzvvTV7i2vZIioxzw=;
        b=pxx0cMKi+w6CYxRlUnLtX4MpRleFRRY1kyg6/itO4flOCpQPP98lHJNX/U8e2CbHpv
         AaPekEWzcxgrAFJ7bx0O1ttZXAM0MBQHHEUJR8G7Qk/3h6SPv60rDp/KL7LsgRuTiCLq
         2QxOp7PIfM86dFQAsa2Dj1f/Y1dj7ANWztCkwB4cbxmtBvw3iBoOCJRL4UzyDesdI9ub
         24ijXiGQhrlvBch6qC9O+Wqy6XJMd5GH//9WNlIezzgCpJf+cdF9ff1TM/gIOSj5OXEA
         ajYYLGzcs4BiJJuSI6tuWZQ4izgPkdjKD0bTcpurm60MZw9CWYJJi2B7/uo9mH2g8eFi
         jKCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694791252; x=1695396052;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/c8yieboNB6oo1mu8ZkACI0svLfzvvTV7i2vZIioxzw=;
        b=FeBuTUufawbfVotFKIpaMtU5Jq+dpCdEDAz2BzSU2NLPsQKN/wtG2eLustEsFZy8D8
         CnIeaW2QgpM+Zdnu5wlhTqddkIZ+pK4vZJPVIkqY5GjA+ObCU4VvSm3+qtb6TcE6Pdfi
         U/bB0i+5Rikqt4QnzmAFW+tt8irZvEo1LGeFyPkW50miCihwAeh+gt8F5b6BLXspJ2Tv
         0gXz0y0O1UwWd02i39aQhz2+INek1L3kwTf0LXTwFrNKr86j97wSHilxlGLR1CA1gF8E
         /AF4cmHDs0xo4MAEYt5lT5SEOOjP7RSYrymM8iEe1fyaMP2mH05MFuEQGmCn6RscnfAi
         /IHQ==
X-Gm-Message-State: AOJu0YzhkbwyLAq5SlSw6SMLOtY4tl19hrGXJBRJraG6vRQX3k9zmZsx
	8hhI7BvC7cnBOe307XLpkK3DSg==
X-Google-Smtp-Source: AGHT+IEGzwW/4d4Bs56A/WRm7j4T8sgYlpdt8z9DxtjMDAWb6/tf9I3QEoiPKszLJbdDXkW5LyBbjg==
X-Received: by 2002:a05:6a00:851:b0:690:42d5:4332 with SMTP id q17-20020a056a00085100b0069042d54332mr2285518pfk.6.1694791252653;
        Fri, 15 Sep 2023 08:20:52 -0700 (PDT)
Message-ID: <561abf48-d72c-467d-94fd-54ffa1dfb512@daynix.com>
Date: Sat, 16 Sep 2023 00:20:46 +0900
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

This should deal with the case when context_init is set while 
HAVE_VIRGL_CONTEXT_INIT is not defined.

