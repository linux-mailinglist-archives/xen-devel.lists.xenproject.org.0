Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D42AF63D8
	for <lists+xen-devel@lfdr.de>; Wed,  2 Jul 2025 23:20:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1031547.1405352 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uX4s0-00064P-AI; Wed, 02 Jul 2025 21:19:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1031547.1405352; Wed, 02 Jul 2025 21:19:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uX4s0-00061o-6I; Wed, 02 Jul 2025 21:19:56 +0000
Received: by outflank-mailman (input) for mailman id 1031547;
 Wed, 02 Jul 2025 21:19:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MFEm=ZP=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1uX4rz-00061c-16
 for xen-devel@lists.xenproject.org; Wed, 02 Jul 2025 21:19:55 +0000
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [2607:f8b0:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4a9e269c-578a-11f0-b894-0df219b8e170;
 Wed, 02 Jul 2025 23:19:52 +0200 (CEST)
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-2350fc2591dso2945745ad.1
 for <xen-devel@lists.xenproject.org>; Wed, 02 Jul 2025 14:19:52 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23acb39b95csm142670205ad.139.2025.07.02.14.19.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jul 2025 14:19:50 -0700 (PDT)
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
X-Inumbo-ID: 4a9e269c-578a-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751491191; x=1752095991; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z2oLpuDzuhdHiQaMDk9scXG+1ZBfQnlbCx000gNoXhE=;
        b=HwmK1OhD4eOZUPRXK1nIgXwx6DIYVlMHI5pjWK+o7eLrGWyuLbN8dTukUwuZ/AnBKT
         74Rvitc1U2gQiUfjNKUEmljKG8+WNKZ5z/JYVeFFJHLu5+2aWDVQl1SE/uEojeJx8G2h
         yufQrizFJyLgJ+YDrxgIXsqO9Cj9zZZgNoFytrJKcbIqQhVQ3lubynK+tLz3zI4C9SFh
         2qkBcSHDfPtQkxZlmUbY5rLgTlAQu1dkVKCSb6uUGJZmWlcwcFCCHaLlW0Q8fRNKHtCj
         57l0BQoTNUuRs9RFFzEczg7oqlHAUy4TTq0TNEa9TZtZVIBafyWQ693tMHznDYO2+HZQ
         Pkyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751491191; x=1752095991;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z2oLpuDzuhdHiQaMDk9scXG+1ZBfQnlbCx000gNoXhE=;
        b=iyEkwcAszfMC11uyq/BhV/JcIGDzZzwCw38c/WD9m2RsnPb11JuSQML3scdZkopb+L
         lQmulMWIMZBzP/d/8FfeYHLJIghfRxnoOlCHcv2J9pIr/uGjCJ6vlbpT01MB2jF89y7n
         FemMhDmx5l1/KmTejca14s+8VKzEbDdc5Ebm2b75URlsfccx9yLWAFkPEtd70kUkDUFZ
         u2DQHFac5E10uoMP7vJ3UYLQxdFQ7zG2SN0NVSbqh/FgrcdtfqmKpaQL0Y6MScTjXC22
         RhuQLVFlXotIht4MIoIJiP9pLKSJqtGY4nlS2L4VpYttv4gk9Yji3y8l+mhDQ8rh1cbH
         m14w==
X-Forwarded-Encrypted: i=1; AJvYcCXSASyO3p9WI1ryTPCwmE0FNBz2Wb9yLt/tYLDb4KrCeKBwJAfMLb3+vlIiqFPONWdzxFBP9aiC8zw=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzr1cWmAK+C1S7EZ0ic8IqnvgbHJounoORGYuM7ur52Y0OFjdUz
	ngdwsy1VRkJ4mpPVqRTZnpLe0PubcPQNmpYDLl8OM2gKctLWE6AMCu0F5/rzoxJny/0=
X-Gm-Gg: ASbGnct+d8zL111BzAMR6bxbHNfecPE4+ZmtDooudKBQ83XIE5KXeQaSKvGYQbbJwdN
	dNtcjVyeXTXbUuxwxe58lKUIgrlaFIEzSkwIz/ZVryVxtbNaEK2UHuFiAQpNcOrK9FzQXaOsfQr
	af8OfIDie5rYuFAVdnsM8ljVMzhEUcCSmyJ094+1WxB9MKM1iG5fq5l3ElF8su955qtnvrMKT5V
	vN50iCVtC1/i9LqJA3owCRTmPcCIfOSg++RMHrQYgp1lgChae3uWy2sxZQHuyJTPWQrBgwbQTmd
	r+LQtLAWh/GJ1X834amTWfV4xLhrMK3pCot9XCCJxIeCsRDog2vhitPjgUz5waabPkmrqraGjK7
	3zlopNSD4eg==
X-Google-Smtp-Source: AGHT+IEveK9a4pLkComAd6bEMhUh5nd/K1YH+GcPSFUDBL56X19TYihBZ8kJjOvEoyFIVMBoN6XXAg==
X-Received: by 2002:a17:902:f690:b0:221:1497:7b08 with SMTP id d9443c01a7336-23c7942d9b2mr15121325ad.23.1751491190998;
        Wed, 02 Jul 2025 14:19:50 -0700 (PDT)
Message-ID: <f456a9b8-5e6c-4ed9-aa94-0bb6350052f5@linaro.org>
Date: Wed, 2 Jul 2025 14:19:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 56/65] accel: Expose and register
 generic_handle_interrupt()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <rbolshakov@ddn.com>,
 Phil Dennis-Jordan <phil@philjordan.eu>, Mads Ynddal <mads@ynddal.dk>,
 Fabiano Rosas <farosas@suse.de>, Laurent Vivier <lvivier@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>, Paul Durrant <paul@xen.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Reinoud Zandijk <reinoud@netbsd.org>,
 Sunil Muthuswamy <sunilmut@microsoft.com>, kvm@vger.kernel.org,
 xen-devel@lists.xenproject.org
References: <20250702185332.43650-1-philmd@linaro.org>
 <20250702185332.43650-57-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250702185332.43650-57-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 7/2/25 11:53 AM, Philippe Mathieu-Daudé wrote:
> In order to dispatch over AccelOpsClass::handle_interrupt(),
> we need it always defined, not calling a hidden handler under
> the hood. Make AccelOpsClass::handle_interrupt() mandatory.
> Expose generic_handle_interrupt() prototype and register it
> for each accelerator.
> 
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/system/accel-ops.h        | 3 +++
>   accel/hvf/hvf-accel-ops.c         | 1 +
>   accel/kvm/kvm-accel-ops.c         | 1 +
>   accel/qtest/qtest.c               | 1 +
>   accel/xen/xen-all.c               | 1 +
>   system/cpus.c                     | 9 +++------
>   target/i386/nvmm/nvmm-accel-ops.c | 1 +
>   target/i386/whpx/whpx-accel-ops.c | 1 +
>   8 files changed, 12 insertions(+), 6 deletions(-)

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


