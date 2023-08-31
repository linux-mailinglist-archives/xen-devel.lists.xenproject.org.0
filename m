Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2996478E99E
	for <lists+xen-devel@lfdr.de>; Thu, 31 Aug 2023 11:40:12 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.593617.926664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbe9R-0002jl-NQ; Thu, 31 Aug 2023 09:39:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 593617.926664; Thu, 31 Aug 2023 09:39:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbe9R-0002i5-KU; Thu, 31 Aug 2023 09:39:45 +0000
Received: by outflank-mailman (input) for mailman id 593617;
 Thu, 31 Aug 2023 09:39:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nRSd=EQ=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1qbe9Q-0002hz-Mg
 for xen-devel@lists.xenproject.org; Thu, 31 Aug 2023 09:39:44 +0000
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4fcc2c5a-47e2-11ee-9b0d-b553b5be7939;
 Thu, 31 Aug 2023 11:39:42 +0200 (CEST)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-52bcd4db4e6so741218a12.0
 for <xen-devel@lists.xenproject.org>; Thu, 31 Aug 2023 02:39:42 -0700 (PDT)
Received: from [192.168.69.115] ([176.187.199.245])
 by smtp.gmail.com with ESMTPSA id
 s2-20020a056402164200b00521953ce6e0sm573340edx.93.2023.08.31.02.39.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Aug 2023 02:39:41 -0700 (PDT)
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
X-Inumbo-ID: 4fcc2c5a-47e2-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693474782; x=1694079582; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7JdPg93Ei8hblCCjbAx2Au7bfzurcULcL9LDqSm08Ls=;
        b=ElPKTW/VKonKLj9qefDP1y3ixxj0E4DMUMgMgBw02V2JjhVWw9mDt7t0Ft133Z9XTH
         rcUDYc9Cx0ClAi9UyBPq3JcMGjPC5X1k9i6uX9Ra37B6vIkG1h/rc5B9713PKpUlc0fT
         34vDA+Aa13geCWfA498uNFt+DF5Uiy1r2pi8U/JJW4zA5fgbEo16GT9GKyCqsRS10VNI
         l07HRD9bvJo+oKBvK+c4rGOKUUu/T5E22IJZrf5bDYjlQdRn8UU/4NFyRsvGZu/CE84Z
         vWympyLrpunqosripMiu3ADyyTyZnDsKm6BfQMMuNHl4e3nrgLvqZ4diaAC+ajh0ZEZI
         luaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693474782; x=1694079582;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7JdPg93Ei8hblCCjbAx2Au7bfzurcULcL9LDqSm08Ls=;
        b=NaiDeDJKcG+BW74kH8yFH9jY/xDvnTHnmuVgAHJGyEcdXaQDjXe+zpTgxOjL78TOQr
         xpOfaAJjCGm3NXDWOJQmAnl0Fy4lI6LQhQSoCR5HfEVtL1SkFIiEX3xG3eAw//OPcP92
         naMOAU9dFZsaQuM6CJZ5LueOaEAXHUjnKRo5mGOjsMclL/uEsmZgm/ouA6mShzrqS88Q
         gLk3yVE1FT0/PdwKvxYOnQnM6dP4t3O8B8DfG960kJR3+KNEwLz2XSmJkEoJR8weMKJn
         1to7qBpWASk6nkKv7Iyan60f0BMlp5jlOZpa9jEgb7J9cpf7Od20qR83ibQtncZyuHmC
         ZpNw==
X-Gm-Message-State: AOJu0YxdWaH+xVpmcbL890BWPA4ckVB/P2YZHcvms9MILCO28xKkrn4z
	INoUwzBXiVo2BRr1R6Bc+xMTBQ==
X-Google-Smtp-Source: AGHT+IFKFcGA55zoP29NL8tSR2n9BKd9iAV/sJ4cWrvrJR59iHHmgQtwvMfn6apItLJAT6m18Ev6sw==
X-Received: by 2002:aa7:d80f:0:b0:52b:ce21:ad12 with SMTP id v15-20020aa7d80f000000b0052bce21ad12mr3293192edq.4.1693474781845;
        Thu, 31 Aug 2023 02:39:41 -0700 (PDT)
Message-ID: <a3ffe20a-db49-5c16-caed-a858ea5dff09@linaro.org>
Date: Thu, 31 Aug 2023 11:39:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [QEMU PATCH v4 06/13] virtio-gpu: Configure context init for
 virglrenderer
Content-Language: en-US
To: Huang Rui <ray.huang@amd.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Antonio Caggiano <antonio.caggiano@collabora.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Robert Beckett <bob.beckett@collabora.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org,
 Gurchetan Singh <gurchetansingh@chromium.org>, ernunes@redhat.com,
 Akihiko Odaki <akihiko.odaki@daynix.com>, Alyssa Ross <hi@alyssa.is>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Honglei Huang <honglei1.huang@amd.com>, Julia Zhang <julia.zhang@amd.com>,
 Chen Jiqian <Jiqian.Chen@amd.com>
References: <20230831093252.2461282-1-ray.huang@amd.com>
 <20230831093252.2461282-7-ray.huang@amd.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230831093252.2461282-7-ray.huang@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31/8/23 11:32, Huang Rui wrote:
> Configure context init feature flag for virglrenderer.
> 
> Originally-by: Antonio Caggiano <antonio.caggiano@collabora.com>
> Signed-off-by: Huang Rui <ray.huang@amd.com>
> ---
> 
> New patch, result of splitting
> [RFC QEMU PATCH 04/18] virtio-gpu: CONTEXT_INIT feature
> 
>   meson.build | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/meson.build b/meson.build
> index 98e68ef0b1..ff20d3c249 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1068,6 +1068,10 @@ if not get_option('virglrenderer').auto() or have_system or have_vhost_user_gpu
>                                          prefix: '#include <virglrenderer.h>',
>                                          dependencies: virgl))
>     endif
> +  config_host_data.set('HAVE_VIRGL_CONTEXT_INIT',
> +                       cc.has_function('virgl_renderer_context_create_with_flags',
> +                                       prefix: '#include <virglrenderer.h>',
> +                                       dependencies: virgl))

Shouldn't this be inverted with previous patch?


