Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 937C96D6972
	for <lists+xen-devel@lfdr.de>; Tue,  4 Apr 2023 18:52:01 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.518083.804254 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjjsi-0007Wq-AY; Tue, 04 Apr 2023 16:51:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 518083.804254; Tue, 04 Apr 2023 16:51:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjjsi-0007Tc-6i; Tue, 04 Apr 2023 16:51:40 +0000
Received: by outflank-mailman (input) for mailman id 518083;
 Tue, 04 Apr 2023 16:51:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rvLN=73=gmail.com=olekstysh@srs-se1.protection.inumbo.net>)
 id 1pjjsg-0007TW-Pv
 for xen-devel@lists.xen.org; Tue, 04 Apr 2023 16:51:38 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f5ef77c0-d308-11ed-b464-930f4c7d94ae;
 Tue, 04 Apr 2023 18:51:36 +0200 (CEST)
Received: by mail-wm1-x336.google.com with SMTP id
 j1-20020a05600c1c0100b003f04da00d07so992074wms.1
 for <xen-devel@lists.xen.org>; Tue, 04 Apr 2023 09:51:35 -0700 (PDT)
Received: from [192.168.0.106] ([91.123.150.38])
 by smtp.gmail.com with ESMTPSA id
 e5-20020a05600c218500b003ed243222adsm15616711wme.42.2023.04.04.09.51.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 04 Apr 2023 09:51:34 -0700 (PDT)
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
X-Inumbo-ID: f5ef77c0-d308-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680627095;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nmwA5QIE12SS7JgIVsKKCsxGeOjasYgBEbSu07ZYTSU=;
        b=j3X7CQ1RSjFMeq3h/sDNd516v3GtX5TcOf28kc7cih/YdK3d1j1bIgD6r8dQyy+CTV
         xS7FxlaA2mI9xXehp9sLxN2YiEzkisHp8N5GqnVLZGgOJbRKbcqftf4G50nEtCDPxUqy
         s82n2D6C8ucroeun906j3Hn/5n+h85GFAX88qGxpEMlAzDZVzcEF/p3iLVLTlqHlv+Kt
         eYyAj3fluApLMwniSQ6PXyLsuow0ouar1hI10a2VpDrbaI2MoPA37FhXvJkNLJpqBVRw
         G5dde3U+AI/b6zw4vpME7WRGv2wG9HW/fQu1IPEPHfph5u0XjDYFYkNkKmltMFO/UlCl
         0GCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680627095;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nmwA5QIE12SS7JgIVsKKCsxGeOjasYgBEbSu07ZYTSU=;
        b=Tcyvfu7cgAZzDpwl3v5r55wBKyD3SrXwk801YUGzylqlGESoaMrXEZkrj2+Cyb6lY0
         UQnp6xGi5dwBNIMPiFeJgOM51iY4aFw6hXC7ZtxANQcPkfU8HAUdQlqQKtf3s2ukUbeQ
         bHiUvvUCsoFiYsDgLkhT0LierbcNSNjREsq6aB3+6ppwT2i4LuGeIWJBbUjEOec+FVQL
         jWJ2vpl6BH4krmof4SIb9kVVQyrTfH2eqZ/I1Lkp53kDOYx5Z2A1QtxmkIQqlRZ2sZJ3
         h6AAz4xXbd/3pFeb5A78Nro9EdN41pVCpbzR+pCLMo0n2Q0r30DaRQhOidX/z2G+163x
         3fRw==
X-Gm-Message-State: AAQBX9e/uI3BSS7qgeWcgdPSH0YwkcDYU41w1I6k463yQDwTyyw+pGoR
	RyS0VAUyH7VouxpPNZK52Ro=
X-Google-Smtp-Source: AKy350ZPTHLXZZtEJJV/KLDfQHEAcggBiApR/vQ6qZwddyf+FZnWqHowVpVwxPjRx3L0JA7kCZ0Q4w==
X-Received: by 2002:a05:600c:254:b0:3ee:2552:7512 with SMTP id 20-20020a05600c025400b003ee25527512mr2628533wmj.13.1680627095070;
        Tue, 04 Apr 2023 09:51:35 -0700 (PDT)
Message-ID: <44ec8244-d172-8f21-d7c1-a070ff0a5cb5@gmail.com>
Date: Tue, 4 Apr 2023 19:51:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] libxl: fix matching of generic virtio device
Content-Language: en-US
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
 Julien Grall <julien@xen.org>, xen-devel@lists.xen.org,
 Juergen Gross <jgross@suse.com>, stratos-dev@op-lists.linaro.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.com>,
 Erik Schilling <erik.schilling@linaro.org>,
 Anthony PERARD <anthony.perard@citrix.com>
References: <210b5be4b7e84fce1519663f28ca24f6761fb2cb.1680161663.git.viresh.kumar@linaro.org>
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
In-Reply-To: <210b5be4b7e84fce1519663f28ca24f6761fb2cb.1680161663.git.viresh.kumar@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 30.03.23 10:35, Viresh Kumar wrote:


Hello Viresh


> The strings won't be an exact match, and we are only looking to match
> the prefix here, i.e. "virtio,device". This is already done properly in
> libxl_virtio.c file, lets do the same here too.
> 
> Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>


It feels to me this patch wants to gain the following tag:

Fixes: 43ba5202e2ee ("libxl: add support for generic virtio device")



> ---
>   tools/libs/light/libxl_arm.c | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/tools/libs/light/libxl_arm.c b/tools/libs/light/libxl_arm.c
> index ddc7b2a15975..97c80d7ed0fa 100644
> --- a/tools/libs/light/libxl_arm.c
> +++ b/tools/libs/light/libxl_arm.c
> @@ -1033,10 +1033,14 @@ static int make_virtio_mmio_node_device(libxl__gc *gc, void *fdt, uint64_t base,
>       } else if (!strcmp(type, VIRTIO_DEVICE_TYPE_GPIO)) {
>           res = make_virtio_mmio_node_gpio(gc, fdt);
>           if (res) return res;
> -    } else if (strcmp(type, VIRTIO_DEVICE_TYPE_GENERIC)) {
> -        /* Doesn't match generic virtio device */
> -        LOG(ERROR, "Invalid type for virtio device: %s", type);
> -        return -EINVAL;
> +    } else {
> +        int len = sizeof(VIRTIO_DEVICE_TYPE_GENERIC) - 1;
> +
> +        if (strncmp(type, VIRTIO_DEVICE_TYPE_GENERIC, len)) {
> +            /* Doesn't match generic virtio device */
> +            LOG(ERROR, "Invalid type for virtio device: %s", type);
> +            return -EINVAL;
> +        }


I agree that now code is aligned with what we have in libxl_virtio.c 
file, but I am afraid I cannot connect the sentence from the commit 
description:
"The strings won't be an exact match, and we are only looking to match
the prefix here, i.e. "virtio,device"."

with the sentence from docs/man/xl.cfg.5.pod.in:

"For generic virtio devices, where we don't need to set special or 
compatible properties in the Device Tree, the type field must be set to 
"virtio,device"."

I might miss something, but shouldn't we clarify the documentation?



>       }
>   
>       return fdt_end_node(fdt);

