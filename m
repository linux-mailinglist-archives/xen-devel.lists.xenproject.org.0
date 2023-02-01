Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 282C2686105
	for <lists+xen-devel@lfdr.de>; Wed,  1 Feb 2023 08:55:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.488144.756082 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pN7wx-0002Yy-Ja; Wed, 01 Feb 2023 07:54:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 488144.756082; Wed, 01 Feb 2023 07:54:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pN7wx-0002X9-GX; Wed, 01 Feb 2023 07:54:35 +0000
Received: by outflank-mailman (input) for mailman id 488144;
 Wed, 01 Feb 2023 07:54:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EYYs=55=gmail.com=xadimgnik@srs-se1.protection.inumbo.net>)
 id 1pN7wv-0002X3-Ai
 for xen-devel@lists.xenproject.org; Wed, 01 Feb 2023 07:54:33 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a53a09c3-a205-11ed-b63b-5f92e7d2e73a;
 Wed, 01 Feb 2023 08:54:25 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id bg26so6133738wmb.0
 for <xen-devel@lists.xenproject.org>; Tue, 31 Jan 2023 23:54:30 -0800 (PST)
Received: from [192.168.9.204] (54-240-197-238.amazon.com. [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id
 b9-20020a05600c150900b003daf672a616sm859085wmg.22.2023.01.31.23.54.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Jan 2023 23:54:29 -0800 (PST)
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
X-Inumbo-ID: a53a09c3-a205-11ed-b63b-5f92e7d2e73a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tF6b+FZ/vwEGQ06h3xdBxOjcTdoCvjB2eFH4X/PWMV4=;
        b=Zbid6yH79dOqTUGKoJSIoLLd2f6TRIAjljirZ81diqB8MS7s7mlxRLkroDfxceGSdl
         bXyXP9+QrRy3Q+k8RZzahbPnaGmVWtJQPPlvliRPAdS+Ygu6ZXBr7OWuTerjNKgWAoo+
         4JXUGRVPtwVxD71yAQFIrfGDtERb5og505GUm/0fItQ/KzQYqxDgviYHEWG5xJHPTTYK
         MVIQyErxK/kfaYA5EXEY31LbrULJy0XNYjHdk2kaWeFVqBvouHwTxa1czRsBXFu1ExZb
         AKQspaREGPTMp3SKBdso7g9xn9nBkwanoJ+2Xck11QIU+cFzFddXHc09yHjmTTH+TPI+
         EsiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tF6b+FZ/vwEGQ06h3xdBxOjcTdoCvjB2eFH4X/PWMV4=;
        b=60sLo7lnFAp6lmZSPrFcX84w3Mf5vkuf5ugHPlpCEOu2TZsNMaF1vfujG7cErzcJJX
         Xj6P8yeF1Q3wB7Fqrnzce1fILYMkt6WBNUukBldUByUuMUjzaSgj6fB/bNVx4Iim9Etp
         nT+IettsKUJjQ38UgXj9tmEdFXX5dRVoM+mIhPIp3p8N36rkiDr3QH5cUuanFBhlLlZM
         +C5c6fiYQ37jd9WTOf2mfoonNfMNK0yfzYwfTDGjXMPArte14thAERiOs6+cM3MiJs42
         1/dzmYToYLd8JcXo5/pUxNqX6chzN9ht/AoZ0xw9AQkbJgwdGLScTERi2Pwq176gReLH
         2U1Q==
X-Gm-Message-State: AO0yUKURarMVg57mG2FeAx2qOwVu3nY0SukgEPbP39NcnjsVMeVl6fxH
	YZd255ejDAlf8aunJZqBcgA=
X-Google-Smtp-Source: AK7set8UFjNEV3CqydT78jA5XvU/Hwp9p7Lzv1PCa3cZdV7qvdbW/Vp4fBbafqW4ng7hwbxQO7e/5g==
X-Received: by 2002:a05:600c:b88:b0:3d3:5a4a:9103 with SMTP id fl8-20020a05600c0b8800b003d35a4a9103mr1022429wmb.31.1675238070338;
        Tue, 31 Jan 2023 23:54:30 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <8b43c153-8c7c-1834-11d6-b3d9c73e2893@xen.org>
Date: Wed, 1 Feb 2023 07:54:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Reply-To: paul@xen.org
Subject: Re: [QEMU][PATCH v5 01/10] hw/i386/xen/: move xen-mapcache.c to
 hw/xen/
Content-Language: en-US
To: Vikram Garhwal <vikram.garhwal@amd.com>, qemu-devel@nongnu.org
Cc: xen-devel@lists.xenproject.org, stefano.stabellini@amd.com,
 alex.bennee@linaro.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>
References: <20230131225149.14764-1-vikram.garhwal@amd.com>
 <20230131225149.14764-2-vikram.garhwal@amd.com>
Organization: Xen Project
In-Reply-To: <20230131225149.14764-2-vikram.garhwal@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31/01/2023 22:51, Vikram Garhwal wrote:
> xen-mapcache.c contains common functions which can be used for enabling Xen on
> aarch64 with IOREQ handling. Moving it out from hw/i386/xen to hw/xen to make it
> accessible for both aarch64 and x86.
> 
> Signed-off-by: Vikram Garhwal <vikram.garhwal@amd.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
> ---
>   hw/i386/meson.build              | 1 +
>   hw/i386/xen/meson.build          | 1 -
>   hw/i386/xen/trace-events         | 5 -----
>   hw/xen/meson.build               | 4 ++++
>   hw/xen/trace-events              | 5 +++++
>   hw/{i386 => }/xen/xen-mapcache.c | 0
>   6 files changed, 10 insertions(+), 6 deletions(-)
>   rename hw/{i386 => }/xen/xen-mapcache.c (100%)
> 

Reviewed-by: Paul Durrant <paul@xen.org>


