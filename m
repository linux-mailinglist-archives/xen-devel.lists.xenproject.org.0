Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A61877AAADE
	for <lists+xen-devel@lfdr.de>; Fri, 22 Sep 2023 09:55:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.606739.944755 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjb0A-0007Id-Eu; Fri, 22 Sep 2023 07:55:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 606739.944755; Fri, 22 Sep 2023 07:55:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qjb0A-0007Ga-Bf; Fri, 22 Sep 2023 07:55:02 +0000
Received: by outflank-mailman (input) for mailman id 606739;
 Fri, 22 Sep 2023 07:55:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WcZa=FG=gmail.com=akihiko.odaki@srs-se1.protection.inumbo.net>)
 id 1qjb09-0007GU-5Z
 for xen-devel@lists.xenproject.org; Fri, 22 Sep 2023 07:55:01 +0000
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [2607:f8b0:4864:20::112f])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 54202a5c-591d-11ee-878a-cb3800f73035;
 Fri, 22 Sep 2023 09:55:00 +0200 (CEST)
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-59be6605e1dso22165827b3.3
 for <xen-devel@lists.xenproject.org>; Fri, 22 Sep 2023 00:55:00 -0700 (PDT)
Received: from [157.82.207.177] ([157.82.207.177])
 by smtp.gmail.com with ESMTPSA id
 z27-20020a637e1b000000b00563e1ef0491sm2552667pgc.8.2023.09.22.00.54.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Sep 2023 00:54:58 -0700 (PDT)
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
X-Inumbo-ID: 54202a5c-591d-11ee-878a-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695369299; x=1695974099; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C8RXYYOqkolR4tgfj+/pR4qTvePP5DdDSeLK49U0/dw=;
        b=LjIJbFXfs/l0qCAAJ0GTXroaUoH/2kLkfy8SlcJmLsp/0pZlli1U9/EuKpUilUAvs7
         l3w0RRqVLn3uKRZVcHf5IeWyq2erh1Qu7wSOTY7qY2B3M5C/bV82tu467oo+ncYZuegh
         W0ilpkvB3XcX0zAuO+LDy9iOYAv/j1vJEkjIOZwZ4EyAr5SIkA57sxMMmsA345h/dTDX
         pi+Q9QIRgqbiSBaOndRbwSYo5kacIAJEyIH2Mm8iT8QZz3nZJGSdHJ9Txa7MC23deudy
         cj7iuBZsxLb0qLaYJL7CmNGHzNs3xlugLNBfBtZKIfOyBZEGouh9Pmh2H7E2uImVGwHg
         OjDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695369299; x=1695974099;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C8RXYYOqkolR4tgfj+/pR4qTvePP5DdDSeLK49U0/dw=;
        b=cXy4n3gecyB+3J0sIABZ1Ug5NKveroQmzxFMD3Cb4QHoQuSLlcIFG8TG9/PDsWnpM0
         sZfrhOmMqjReKnxacWMoKDDGjzlUZDKtcvMayp4PA7S/UjHClnHxV1IMyafy/ky8kY4U
         uKgF4BDnNspv8FZdh1WoBLdtqzRlk9f4Pfhf7+XUxLcKhCWk+7kiWTRlXSSAzuiNkh/A
         wKuLM5Xt3FQjmbnWS2Mp8Kit9BAg/ZOy683Jtx0XZJvfhz9xuqE9jT7uUE7UDp9IBHr/
         fxlZSt2cmLP+vyaVuIbaCmIryRYnfi4RqwilLgd+BPWGzR6WyruQbcrRTZ6/M6zzn5bc
         jGmw==
X-Gm-Message-State: AOJu0Ywx0IJSeJWEnIZw0o9UiSfmC5gZkV7x74wbIpbFHQoUHGOpuj37
	HV7vQBYlQxV16Pc1jqPPjAc=
X-Google-Smtp-Source: AGHT+IGkCXCqQW0xPMFjAF/2h7RN/DE7xkOIqvXLg6jkoeiOLg1gR9PUTF7YkZ1rX0jQd/k4EF+5qg==
X-Received: by 2002:a0d:c341:0:b0:583:307d:41bc with SMTP id f62-20020a0dc341000000b00583307d41bcmr7342128ywd.27.1695369298892;
        Fri, 22 Sep 2023 00:54:58 -0700 (PDT)
Message-ID: <faae6c7b-2b2b-44e5-99b8-261f17f28645@gmail.com>
Date: Fri, 22 Sep 2023 16:54:51 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 6/9] gfxstream + rutabaga: add initial support for
 gfxstream
To: Alyssa Ross <hi@alyssa.is>, Gurchetan Singh
 <gurchetansingh@chromium.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: qemu-devel@nongnu.org, Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 marcandre.lureau@redhat.com, ray.huang@amd.com, alex.bennee@linaro.org,
 shentey@gmail.com, ernunes@redhat.com, manos.pitsidianakis@linaro.org,
 philmd@linaro.org, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony.perard@citrix.com>,
 Antonio Caggiano <quic_acaggian@quicinc.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Robert Beckett <bob.beckett@collabora.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 xen-devel@lists.xenproject.org, Albert Esteve <aesteve@redhat.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Honglei Huang <honglei1.huang@amd.com>, Julia Zhang <julia.zhang@amd.com>,
 Chen Jiqian <Jiqian.Chen@amd.com>
References: <20230829003629.410-1-gurchetansingh@chromium.org>
 <20230829003629.410-7-gurchetansingh@chromium.org>
 <2620fca0-a5b4-49d0-bf91-fd359ee4999b@gmail.com>
 <3830bf8d-8c25-950c-f901-8d70dbfc06a6@ilande.co.uk>
 <CAAfnVBknhG=QYn=OFjNW9h=KbDtQ=xq3AEs5Pg=AG3LTO=LZ6w@mail.gmail.com>
 <6256f069-ee39-495e-a8c3-ea2328f085a2@gmail.com> <87lecyejry.fsf@alyssa.is>
Content-Language: en-US
From: Akihiko Odaki <akihiko.odaki@gmail.com>
In-Reply-To: <87lecyejry.fsf@alyssa.is>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2023/09/22 16:42, Alyssa Ross wrote:
> Akihiko Odaki <akihiko.odaki@gmail.com> writes:
> 
>> Practically there is very low chance to hit the bug. I think only
>> fuzzers and malicious actors will trigger it, and probably no one will
>> dare using virtio-gpu-rutabaga or virtio-gpu-gl in a security-sensitive
>> context.
> 
> Well, this is exactly what Chrome OS does, albiet with crosvm rather
> than QEMU, right?

I think so, but QEMU's virtio-gpu-rutabaga and virtio-gpu-gl should be 
very different from crosvm in terms that it does not isolate the 
graphics stack into a separate process while I believe crosvm does so. 
Having the entire graphics stack in a VMM is a security nightmare; it 
means giving a complex shader compiler the highest privilege. We need to 
use vhost-user-gpu instead for process isolation.

Since we already have such a serious security hazard, I don't think we 
have to care much about security. But security approximately equals to 
reliability, which matters for virtio-gpu-rutabaga and virtio-gpu-gl 
too, so it's still nice to get the bug fixed.

