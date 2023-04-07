Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D826DB70C
	for <lists+xen-devel@lfdr.de>; Sat,  8 Apr 2023 01:14:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.519167.806424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkvHW-00063T-7K; Fri, 07 Apr 2023 23:14:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 519167.806424; Fri, 07 Apr 2023 23:14:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkvHW-00061R-3j; Fri, 07 Apr 2023 23:14:10 +0000
Received: by outflank-mailman (input) for mailman id 519167;
 Fri, 07 Apr 2023 23:14:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2dUW=76=linaro.org=richard.henderson@srs-se1.protection.inumbo.net>)
 id 1pkvHU-0005Ev-QZ
 for xen-devel@lists.xenproject.org; Fri, 07 Apr 2023 23:14:08 +0000
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [2607:f8b0:4864:20::102b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e4ce64e0-d599-11ed-b464-930f4c7d94ae;
 Sat, 08 Apr 2023 01:14:07 +0200 (CEST)
Received: by mail-pj1-x102b.google.com with SMTP id
 pc4-20020a17090b3b8400b0024676052044so104462pjb.1
 for <xen-devel@lists.xenproject.org>; Fri, 07 Apr 2023 16:14:07 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8?
 ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 jh3-20020a170903328300b001963a178dfcsm1477074plb.244.2023.04.07.16.14.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Apr 2023 16:14:05 -0700 (PDT)
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
X-Inumbo-ID: e4ce64e0-d599-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680909246;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZEtxxHTBPYDx1m8Q5UryyRdPATKO4VY3g+smnvxOwf4=;
        b=con+E+nBuUuL8bc6aBTNFmZw3A88rUFZYxGTFhDreXq5RHJZKuVoYlJBjJANRic/qc
         d5s0aIniIw0RL+malEGtEBMEHpe94GQp29//JHjND3LOTt2Qz6neACI5ima/6Bs8ADdA
         yo/JWYahYMsh7ErPLucmzyNckoeMuF0c9x1qrf9zMQmx6Bnh5MEN+0uiyAhmVmsWPJFI
         pWVaQ9k2ZnUgguA6EPAKVUUEzJY96hKZT4/VabPIIz8klAbW+JC3mY3jjRBuLk3fSGy5
         mfIp7D/2faI4Ti1BgkVfeheIv0888nglBVVCpOLVsdTkwhfsjv/mG9K919FmrAqv8UV4
         NPiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680909246;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZEtxxHTBPYDx1m8Q5UryyRdPATKO4VY3g+smnvxOwf4=;
        b=BmpybB9a8L6zOZIbSLPZKlUs1wvXxxJfrgZpopGgFeUtouEGrqS0t/jIhKTGJ8YU9+
         FFg626Z0zu+byPUMNL62awH5BlwHcwp+Nm57qeUxzKjyCxmgabp6471sEvTaiCNG+zHt
         g/zWOrglujcEKBk1XQdamcU0DIMs61N0UDn/lP5mI+xNay4XocLU4hhPVGQkXfMQhbIw
         GyDn9DNTiaj/kfYZdJLglzG99hSyHA/CrsW6L3e7AcIgNrplNhV5OxJUn2LlpQPNjJbF
         vvrmb9h0eC5eMndkz1//22zvp7G01RU4Au4L+IemWUkjEFAWe0m51oRl12bgHqkRDU7Z
         DXzw==
X-Gm-Message-State: AAQBX9fllYsEBfYeDNshlfwX7mWDQJav8EcXzRbd61HlRQs4Xcs3LqHy
	HJyeJOrcEYIGK73JjIDlsdBp7w==
X-Google-Smtp-Source: AKy350aI+71oWAmO3OSiaf8U410Jg/WRlz+R9/yR6IazGZ/MKyDHhEtyo9+noerB1d8Pc0Zo6Qu0ww==
X-Received: by 2002:a17:903:183:b0:1a1:e33f:d567 with SMTP id z3-20020a170903018300b001a1e33fd567mr5603426plg.52.1680909245863;
        Fri, 07 Apr 2023 16:14:05 -0700 (PDT)
Message-ID: <e2687d91-85d8-d11f-4cea-c7363927cb9b@linaro.org>
Date: Fri, 7 Apr 2023 16:14:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 14/14] accel: Rename HVF struct hvf_vcpu_state -> struct
 AccelvCPUState
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, xen-devel@lists.xenproject.org,
 kvm@vger.kernel.org, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Alexander Graf <agraf@csgraf.de>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20230405101811.76663-1-philmd@linaro.org>
 <20230405101811.76663-15-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230405101811.76663-15-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/5/23 03:18, Philippe Mathieu-Daudé wrote:
> We want all accelerators to share the same opaque pointer in
> CPUState.
> 
> Rename the 'hvf_vcpu_state' structure as 'AccelvCPUState'.
> 
> Use the generic 'accel' field of CPUState instead of 'hvf'.
> 
> Replace g_malloc0() by g_new0() for readability.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   include/hw/core/cpu.h     |  3 --
>   include/sysemu/hvf_int.h  |  2 +-
>   accel/hvf/hvf-accel-ops.c | 16 ++++-----
>   target/arm/hvf/hvf.c      | 70 +++++++++++++++++++--------------------
>   4 files changed, 44 insertions(+), 47 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

