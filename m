Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A92FB8D2BD2
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 06:52:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731369.1136802 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCBHk-0000Me-Qd; Wed, 29 May 2024 04:51:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731369.1136802; Wed, 29 May 2024 04:51:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCBHk-0000Jc-NP; Wed, 29 May 2024 04:51:36 +0000
Received: by outflank-mailman (input) for mailman id 731369;
 Wed, 29 May 2024 04:51:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=qV8p=NA=linaro.org=philmd@srs-se1.protection.inumbo.net>)
 id 1sCBHj-0000JW-7A
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 04:51:35 +0000
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [2a00:1450:4864:20::429])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1ee7747d-1d77-11ef-b4bb-af5377834399;
 Wed, 29 May 2024 06:51:33 +0200 (CEST)
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-35b6467754cso912495f8f.3
 for <xen-devel@lists.xenproject.org>; Tue, 28 May 2024 21:51:33 -0700 (PDT)
Received: from [192.168.69.100] ([176.187.204.141])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a626c93b6d4sm677740766b.88.2024.05.28.21.51.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 May 2024 21:51:31 -0700 (PDT)
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
X-Inumbo-ID: 1ee7747d-1d77-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716958292; x=1717563092; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u1nYdfp4fuN4YG4QO33DKDAeJvAL793XESNugrAHys8=;
        b=xSqPfmXmmJ0QSd0GT72z+063yHKrJM5Q48Oa4b8R8DNjt4UoTFjz8GpLJB6pLKZm6T
         2hkskis7YDxZW5dky/tUCWVPuBzmWbd6HOhkOZHiIcPTA054odaNyay2tu1D+i3k9Xo5
         kkdKFgXZPNJ9KQoN4rDozM8dBloHp5htpFACzXQy0FXp+Kdx4ZJ+78VKXGm0j/y7iIdV
         QvI8TErlLJv5l/0ESPjPExB49lnPkcXeQhIvGVXgd003blL+2Vy03jSIULWdlCIg3+NJ
         gsZlY0ieJHvQ8XOom1F7jCqI4cge2U6XFIPJDAfcE65eBwF2xokRd+QKYnXlJnipnS16
         vQkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716958292; x=1717563092;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u1nYdfp4fuN4YG4QO33DKDAeJvAL793XESNugrAHys8=;
        b=OnICOj7bGIOBOLPbzHvFSM0cUonSvf6/GOXG01xJkUTCCYki+9SjUO8oBvdoZzThUx
         CHkG88QPH6c1igPbnp8E9XAUBcGYJM+DG9WgNnPs+8yWS1bJHtupelTdiwNImNHZxTER
         VcHP3kjah9IMZRzfYHByoV9ps0FfswuBQAhfKvS3veozf/Kl099RjrdBevT/6kaoDnXV
         Ppwq3q61blPdH17HQEJk7K75WSTgobw0DX4h0mFWqknyR1cElLjqHsVEO2YD1UO/iUkI
         OkxV5HmohpJPm3YAoVCVFI8/7TLn7yIYgu+rw7Aiw4MCSAgvotTXC80td3abPZTXPBqF
         zmHg==
X-Forwarded-Encrypted: i=1; AJvYcCW8oSEzPOTfidqUzcKeNVgP4PG+0+g7ZSpmvV6sH5dWAyhX7welRnnEy/cOWWv2jf5+19SXI/cz4qT6W2UIMHt9Cubu4kXhzPoNMc0ePaQ=
X-Gm-Message-State: AOJu0Yzyvk5SFLvgImbBBkawx6Wr69kevnTasKi9kQ43V+urbFr7UnV7
	WIfJZSDRz0VxTKSN/H5x4/ioJgu2aT7bzXePa+/3OaWwNY34a2osQr/77m1FotU=
X-Google-Smtp-Source: AGHT+IGT3NnjnHd9X0oouBZX33hk8pFTpyFyM+V1o+EOw+IGtUHkSyasUXrVcfyfdl3dvCH6VgD+zg==
X-Received: by 2002:adf:e648:0:b0:357:40e8:e574 with SMTP id ffacd0b85a97d-35740e8e60amr7150400f8f.37.1716958292268;
        Tue, 28 May 2024 21:51:32 -0700 (PDT)
Message-ID: <506f4ebe-50de-433b-8d06-9d2ceddde600@linaro.org>
Date: Wed, 29 May 2024 06:51:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] hw/xen: Simplify legacy backends handling
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Cc: Anthony PERARD <anthony@xenproject.org>, Paul Durrant <paul@xen.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eduardo Habkost
 <eduardo@habkost.net>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <20240510104908.76908-1-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240510104908.76908-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

ping?

On 10/5/24 12:49, Philippe Mathieu-Daudé wrote:
> Respin of Paolo's Xen patches from
> https://lore.kernel.org/qemu-devel/20240509170044.190795-1-pbonzini@redhat.com/
> rebased on one of my cleanup branches making backend
> structures const. Treat xenfb as other backends.
> 
> Paolo Bonzini (2):
>    hw/xen: initialize legacy backends from xen_bus_init()
>    hw/xen: register legacy backends via xen_backend_init
> 
> Philippe Mathieu-Daudé (5):
>    hw/xen: Remove declarations left over in 'xen-legacy-backend.h'
>    hw/xen: Constify XenLegacyDevice::XenDevOps
>    hw/xen: Constify xenstore_be::XenDevOps
>    hw/xen: Make XenDevOps structures const
>    hw/xen: Register framebuffer backend via xen_backend_init()
> 
>   include/hw/xen/xen-legacy-backend.h | 15 +--------------
>   include/hw/xen/xen_pvdev.h          |  3 +--
>   hw/9pfs/xen-9p-backend.c            |  8 +++++++-
>   hw/display/xenfb.c                  | 15 +++++++++++++--
>   hw/i386/pc.c                        |  1 -
>   hw/usb/xen-usb.c                    | 14 ++++----------
>   hw/xen/xen-bus.c                    |  4 ++++
>   hw/xen/xen-hvm-common.c             |  2 --
>   hw/xen/xen-legacy-backend.c         | 24 ++++--------------------
>   hw/xenpv/xen_machine_pv.c           |  7 +------
>   10 files changed, 35 insertions(+), 58 deletions(-)
> 


