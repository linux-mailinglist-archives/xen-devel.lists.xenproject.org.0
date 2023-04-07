Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 630AB6DB6C4
	for <lists+xen-devel@lfdr.de>; Sat,  8 Apr 2023 01:04:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.519126.806343 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkv7c-0000fb-Gd; Fri, 07 Apr 2023 23:03:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 519126.806343; Fri, 07 Apr 2023 23:03:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkv7c-0000ca-Dw; Fri, 07 Apr 2023 23:03:56 +0000
Received: by outflank-mailman (input) for mailman id 519126;
 Fri, 07 Apr 2023 23:03:55 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2dUW=76=linaro.org=richard.henderson@srs-se1.protection.inumbo.net>)
 id 1pkv7b-0000cU-Eu
 for xen-devel@lists.xenproject.org; Fri, 07 Apr 2023 23:03:55 +0000
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [2607:f8b0:4864:20::42f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 76e36e35-d598-11ed-b464-930f4c7d94ae;
 Sat, 08 Apr 2023 01:03:53 +0200 (CEST)
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-63255e756bfso12345b3a.2
 for <xen-devel@lists.xenproject.org>; Fri, 07 Apr 2023 16:03:53 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8?
 ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 b13-20020aa7870d000000b0062e26487e7esm3525658pfo.155.2023.04.07.16.03.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Apr 2023 16:03:51 -0700 (PDT)
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
X-Inumbo-ID: 76e36e35-d598-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680908632;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hZqP/mMtrcpUQSJ0MIEuq6L7i9BJbItpoxQhlUdV2j0=;
        b=OScsKdJq+aKS4EMfnsQDF1A4ZpE9lHLC3dBugCWoYJ+T+zxfKuy7Bcfowv1Z4sMNGt
         5Tvqtj2tiQHF/cjx4hdeKJ6bZl9Y/HxUihnLOA+u6o+0o8KEhFMiBHXApK9qw2CCJXQY
         B/O1pBojgVNojn4tHZwtZ9Gj8964Bhc4vqVPOXtmkWUbZHDB/khpku9T9hNbVRaYpnKf
         6WkmzIgkqbHy5Lu85TuUalah4TTDdXAr+WRzB+W03rr+p/gGfvJi+W66/flHhGLrSK6a
         w5iWxWFxH44qZpC/JwuKPFVtQLmfZeKHX2acjMCobg3Mcp8TCtZQwPxUU3D6tMzl+TdP
         a4Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680908632;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hZqP/mMtrcpUQSJ0MIEuq6L7i9BJbItpoxQhlUdV2j0=;
        b=cVKd6ApFSDrvpps4mp1Z1h9LxXqqMZr+SFFMZ7Jdwi+vZZP+uNCLWuTIw7RVPeiEcf
         T8cbxN7C9ekuMM2/ZeZb0W/9YY6Q/Sp5PyAQVUfQO8saKDGZSU8mRh4y73a8a9RitXe5
         7KbAYr+n0XcbsMjLGCOcETx+4h1lsTR4coWSwkZTr6iGHuYntW2iyomqAbkwX7RAuWXj
         JlkRJprgQ/hkFjGeLW3oGtqmI/rnHP+jbbF1/gdOe3FooLNAQ6nKYswxHR+KqZB4GUoY
         bUElkvLtPE1Y4cmiwMZQ8mEELIJru2r5fNI5tWQnSCffqxPtrOU0ngFAmZbtOcuV+6NF
         K88w==
X-Gm-Message-State: AAQBX9cTFy3HiAbv/vP6eSQZyxVbzhlKP7h8JHuFewCFTCtgnBeUDWIp
	tFFoFpWLmyp5Mx7cZZfZehEmjQ==
X-Google-Smtp-Source: AKy350an52aELf6hlPTEwYKQg2oGfdoio44PzUivo7lHIUSuO2HA+GtnFtvlc2ICRNAVAvj8q2M6tQ==
X-Received: by 2002:a62:5e41:0:b0:626:2ae6:31f6 with SMTP id s62-20020a625e41000000b006262ae631f6mr3993369pfb.7.1680908631953;
        Fri, 07 Apr 2023 16:03:51 -0700 (PDT)
Message-ID: <f28d2337-37c0-5a93-438f-7ce0ea7fc565@linaro.org>
Date: Fri, 7 Apr 2023 16:03:49 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 05/14] accel: Rename 'hax_vcpu' as 'accel' in CPUState
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, xen-devel@lists.xenproject.org,
 kvm@vger.kernel.org, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>, Reinoud Zandijk <reinoud@netbsd.org>,
 Sunil Muthuswamy <sunilmut@microsoft.com>
References: <20230405101811.76663-1-philmd@linaro.org>
 <20230405101811.76663-6-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230405101811.76663-6-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/5/23 03:18, Philippe Mathieu-Daudé wrote:
> All accelerators will share a single opaque context
> in CPUState. Start by renaming 'hax_vcpu' as 'accelCPUState'.

Pasto in 'accel' here.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

