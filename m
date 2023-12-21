Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6637F81AE7F
	for <lists+xen-devel@lfdr.de>; Thu, 21 Dec 2023 06:46:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.658473.1027628 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGBsM-0003HY-LU; Thu, 21 Dec 2023 05:45:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 658473.1027628; Thu, 21 Dec 2023 05:45:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGBsM-0003En-If; Thu, 21 Dec 2023 05:45:42 +0000
Received: by outflank-mailman (input) for mailman id 658473;
 Thu, 21 Dec 2023 05:45:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1W3I=IA=daynix.com=akihiko.odaki@srs-se1.protection.inumbo.net>)
 id 1rGBsL-0003Ed-EJ
 for xen-devel@lists.xenproject.org; Thu, 21 Dec 2023 05:45:41 +0000
Received: from mail-oo1-xc30.google.com (mail-oo1-xc30.google.com
 [2607:f8b0:4864:20::c30])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2a9526f2-9fc4-11ee-9b0f-b553b5be7939;
 Thu, 21 Dec 2023 06:45:38 +0100 (CET)
Received: by mail-oo1-xc30.google.com with SMTP id
 006d021491bc7-59417406825so166881eaf.0
 for <xen-devel@lists.xenproject.org>; Wed, 20 Dec 2023 21:45:37 -0800 (PST)
Received: from [157.82.205.15] ([157.82.205.15])
 by smtp.gmail.com with ESMTPSA id
 q34-20020a63f962000000b0059b2316be86sm713948pgk.46.2023.12.20.21.45.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Dec 2023 21:45:36 -0800 (PST)
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
X-Inumbo-ID: 2a9526f2-9fc4-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1703137536; x=1703742336; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pYgbZX5oCxCQw3VEkezO/vga4YX/OVJ5osQ8+MorHmg=;
        b=nR5aRgXGKnD5Qzufz1X20pvPcCIp7aDyvLzUYN0fShd1LzUp6rCKyneg5KMg2u2igy
         jLtmQkSdhH8sjhWe48ZIKFIw38QkGa3ZdiaIPBF/SBNdIbYYJJdMiwpGb4jmVP8BuD2u
         f4vlUpVZIxnNUdAtjo500VC8wejsv4GeeVQJffBbRHotZdFYAlEBQEZv0Mk5t5+tZNdu
         5o19x1dxRphI4wbhTIyImd+0EkJyhXV4LbHfIbxjgCWPrZHrAOyOawrz9YdTPeuW8JNo
         UZiw0iDmkNUAM42t1+z2s/W1IDvFXYAQgEW2vDlyXyjSwWyYJbLU6G3ReTwoVGeoqKDT
         Lkuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703137536; x=1703742336;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pYgbZX5oCxCQw3VEkezO/vga4YX/OVJ5osQ8+MorHmg=;
        b=AQ8KUK7sfJhdyyPy2X+8IIOIOE9Ea66FcmXrb1rhN5/osXVWsRyH5KeByqMijQTmBC
         6LgqGqQrgOZY1/nhuoAB9T8HQ5Ndd9EnJM4UIzUrJpnPHAX1/eFac1sYg0D+Q6W4eQJn
         n6bx4y7/rNW3eI80u3xBLxYkOdxQRpvF/dopr2LPrhkvxxBlmk6XnxL4/RGLxBdaBK9D
         Ps54F13WII4el1/+ywVaTtUPd28Nv+6CHdPJwG+jBA0Q+DM1B78nsMh0x+YEEIrx5yyb
         y1LfbzWG07Km5zQz6ccCIkhALwYVwTdwrpUdUzgu6va6Dsfmy+52GRF22TcI2ltNEV81
         qAcQ==
X-Gm-Message-State: AOJu0Yx0F0QrMzSYoDdLI892n1CJN3n6LhrruSiC7hbRN17IeuG7CdiB
	RRDPvPBaGn37f++I1Rvre9VeYA==
X-Google-Smtp-Source: AGHT+IE01jjYRJY2nG5j+/EQsT2ho4uIRHCQQSrz97BxpLgOmSpO+kuxuXOUcaUgxjTijO+11eelNA==
X-Received: by 2002:a05:6808:2e4c:b0:3ba:205d:452 with SMTP id gp12-20020a0568082e4c00b003ba205d0452mr13773760oib.92.1703137536578;
        Wed, 20 Dec 2023 21:45:36 -0800 (PST)
Message-ID: <a88696bc-2ffe-442a-a171-50e6120bbf97@daynix.com>
Date: Thu, 21 Dec 2023 14:45:29 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/11] softmmu/memory: enable automatic deallocation of
 memory regions
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
 Chen Jiqian <Jiqian.Chen@amd.com>
References: <20231219075320.165227-1-ray.huang@amd.com>
 <20231219075320.165227-7-ray.huang@amd.com>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <20231219075320.165227-7-ray.huang@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023/12/19 16:53, Huang Rui wrote:
> From: Xenia Ragiadakou <xenia.ragiadakou@amd.com>
> 
> When the memory region has a different life-cycle from that of her parent,
> could be automatically released, once has been unparent and once all of her
> references have gone away, via the object's free callback.
> 
> However, currently, the address space subsystem keeps references to the
> memory region without first incrementing its object's reference count.
> As a result, the automatic deallocation of the object, not taking into
> account those references, results in use-after-free memory corruption.
> 
> More specifically, reference to the memory region is kept in flatview
> ranges. If the reference count of the memory region is not incremented,
> flatview_destroy(), that is asynchronous, may be called after memory
> region's destruction. If the reference count of the memory region is
> incremented, memory region's destruction will take place after
> flatview_destroy() has released its references.
> 
> This patch increases the reference count of an owned memory region object
> on each memory_region_ref() and decreases it on each memory_region_unref().

Why not pass the memory region itself as the owner parameter of 
memory_region_init_ram_ptr()?

