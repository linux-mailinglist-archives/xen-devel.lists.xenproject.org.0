Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ABA1799C94
	for <lists+xen-devel@lfdr.de>; Sun, 10 Sep 2023 06:23:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.598644.933617 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfBxX-0007uj-SG; Sun, 10 Sep 2023 04:22:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 598644.933617; Sun, 10 Sep 2023 04:22:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qfBxX-0007rl-Pg; Sun, 10 Sep 2023 04:22:07 +0000
Received: by outflank-mailman (input) for mailman id 598644;
 Sun, 10 Sep 2023 04:22:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uHF+=E2=daynix.com=akihiko.odaki@srs-se1.protection.inumbo.net>)
 id 1qfBxW-0007rP-7A
 for xen-devel@lists.xenproject.org; Sun, 10 Sep 2023 04:22:06 +0000
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [2607:f8b0:4864:20::432])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 973f8b27-4f91-11ee-9b0d-b553b5be7939;
 Sun, 10 Sep 2023 06:22:03 +0200 (CEST)
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-68c0d886ea0so2910158b3a.2
 for <xen-devel@lists.xenproject.org>; Sat, 09 Sep 2023 21:22:03 -0700 (PDT)
Received: from ?IPV6:2400:4050:a840:1e00:78d2:b862:10a7:d486?
 ([2400:4050:a840:1e00:78d2:b862:10a7:d486])
 by smtp.gmail.com with ESMTPSA id
 t5-20020a63b705000000b0056afdbd0a24sm142840pgf.9.2023.09.09.21.21.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 Sep 2023 21:22:01 -0700 (PDT)
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
X-Inumbo-ID: 973f8b27-4f91-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20230601.gappssmtp.com; s=20230601; t=1694319721; x=1694924521; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y41O7m8lzKH6Z6I1rP686Lg5qOtZy5LXRHQ0fLJI1OY=;
        b=x/9S1fZOZ9U3zgZWe2CeXtvefhO1w2Io7ThIxTatVo5tCQacDE8+6A7vNCjttGG5xx
         1HEgmZf9WcDMRkTFWwtNuTBc9fAjWcBUlJhUu2WXyIYoYB9hSqrKXqdFMjmMCl4nkVuP
         DVMa7NlYEF/QV7KZ4Hd9dxM+OK1RfjwHMCtpRyJnrnM9lm6UZXmG1kQEoXYvKQBBopZ2
         A4VX+gmDPDhudvdxi8l9RaEF/5UAWYjCI1uXF3LXcFHBIUuPTOlXuV5CU0NyreSU6hXa
         8rqAo5FhI0um6B9mGaVMND8ySikVlrtDuUZPJ94XFfns5e+d4vfUYqyaCeLMmZzT9+c1
         qzFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694319721; x=1694924521;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y41O7m8lzKH6Z6I1rP686Lg5qOtZy5LXRHQ0fLJI1OY=;
        b=CHyfkko/m8n65yCaWeN4J0Ck7HAj2eZgCGwaqiSGQDMOFyM8lgTIalCT9ybRBqym0t
         WkHW3VHc2muNe5RTQgZSNpnd/H+eCDS1YURw6h7zuh+ZpaPo9JVdyIDRgt8ai7p9NJuP
         J/NoL5Xow0NI7mfuPh1s2MufGn8mtqEoJJg1QXX2T0+Detn684Z5hGEMuxCzID5CfuJY
         GQEBirtwQfJCgOAdQVABh9CYKHh7lT9CEkVJHz+ORiozZ0PVK2UQBtrjD23J+6wVrJLS
         nTHg9/hVT0q0T8Fxy0iYmpE64APtJ+qzVF64WPDaJpKF3lG0dC/iU60Aja2E80+A1Phl
         2Qgw==
X-Gm-Message-State: AOJu0Yxnte4tPo220+FCL7sgB5r3lRnUDPGOXtp8wFRmuaPeV+OxewXk
	Rf1mvxwzdy8MZd9QwOherFPt3g==
X-Google-Smtp-Source: AGHT+IG3w2NwKdjms/SuiPqAhtRTC9XzAYUKIfiyZjUtztV1ZlgLuJusPzzoM2Ll4o14KuOFM1cx2w==
X-Received: by 2002:a05:6a20:105a:b0:14d:16c:2d20 with SMTP id gt26-20020a056a20105a00b0014d016c2d20mr6996494pzc.44.1694319721488;
        Sat, 09 Sep 2023 21:22:01 -0700 (PDT)
Message-ID: <11c227e8-a464-41ce-a435-82c570746388@daynix.com>
Date: Sun, 10 Sep 2023 13:21:56 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [QEMU PATCH v4 10/13] virtio-gpu: Resource UUID
Content-Language: en-US
To: Huang Rui <ray.huang@amd.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Michael S . Tsirkin"
 <mst@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Antonio Caggiano <antonio.caggiano@collabora.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Robert Beckett <bob.beckett@collabora.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 "ernunes@redhat.com" <ernunes@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alyssa Ross <hi@alyssa.is>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "Koenig, Christian" <Christian.Koenig@amd.com>,
 "Ragiadakou, Xenia" <Xenia.Ragiadakou@amd.com>,
 "Pelloux-Prayer, Pierre-Eric" <Pierre-eric.Pelloux-prayer@amd.com>,
 "Huang, Honglei1" <Honglei1.Huang@amd.com>,
 "Zhang, Julia" <Julia.Zhang@amd.com>, "Chen, Jiqian" <Jiqian.Chen@amd.com>
References: <20230831093252.2461282-1-ray.huang@amd.com>
 <20230831093252.2461282-11-ray.huang@amd.com>
 <58a4e81f-b0ce-49db-8a6a-f6b5bdc3d2d6@daynix.com> <ZPw2UjxogIULU722@amd.com>
From: Akihiko Odaki <akihiko.odaki@daynix.com>
In-Reply-To: <ZPw2UjxogIULU722@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023/09/09 18:09, Huang Rui wrote:
> On Thu, Aug 31, 2023 at 06:36:57PM +0800, Akihiko Odaki wrote:
>> On 2023/08/31 18:32, Huang Rui wrote:
>>> From: Antonio Caggiano <antonio.caggiano@collabora.com>
>>>
>>> Enable resource UUID feature and implement command resource assign UUID.
>>> This is done by introducing a hash table to map resource IDs to their
>>> UUIDs.
>>
>> The hash table does not seem to be stored during migration.
> 
> May I know whether you point g->resource_uuids table data in VirtIOGPU
> device should be stored in virtio_gpu_save() and resumed in
> virtio_gpu_load() for virtio migration?

Yes, that's what I meant.

Regards,
Akihiko Odaki

