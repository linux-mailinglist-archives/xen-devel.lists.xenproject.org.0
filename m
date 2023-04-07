Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ED3186DB6BD
	for <lists+xen-devel@lfdr.de>; Sat,  8 Apr 2023 01:02:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.519110.806313 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkv4x-0007Qk-EM; Fri, 07 Apr 2023 23:01:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 519110.806313; Fri, 07 Apr 2023 23:01:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pkv4x-0007Ni-BS; Fri, 07 Apr 2023 23:01:11 +0000
Received: by outflank-mailman (input) for mailman id 519110;
 Fri, 07 Apr 2023 23:01:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2dUW=76=linaro.org=richard.henderson@srs-se1.protection.inumbo.net>)
 id 1pkv4v-0007Nc-EQ
 for xen-devel@lists.xenproject.org; Fri, 07 Apr 2023 23:01:09 +0000
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [2607:f8b0:4864:20::62f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 12bf9c98-d598-11ed-b464-930f4c7d94ae;
 Sat, 08 Apr 2023 01:01:06 +0200 (CEST)
Received: by mail-pl1-x62f.google.com with SMTP id n14so25231792plc.8
 for <xen-devel@lists.xenproject.org>; Fri, 07 Apr 2023 16:01:05 -0700 (PDT)
Received: from ?IPV6:2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8?
 ([2602:ae:1541:f901:8bb4:5a9d:7ab7:b4b8])
 by smtp.gmail.com with ESMTPSA id
 s21-20020aa78295000000b0062dc14ee2a7sm3505522pfm.211.2023.04.07.16.01.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Apr 2023 16:01:03 -0700 (PDT)
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
X-Inumbo-ID: 12bf9c98-d598-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680908464;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Pwlm1lMKQRjwxkmrW2F8t3gfYFcIvBu5GbvK5p1f3qI=;
        b=WYmgbbs2HSI1ZfANhB99p0It58GikHCFHg8GiCJM3VQAfDfBj7TpC/bvTiV2pJ79UV
         KAS5g4RAW3gC6aKuL00Z27MQAUOxZbmVQcMfZCDSB1r0VuBIuxLsMFHZKi1LaGTK3hGD
         QdhxTCrlzTDRZmVjPx1eYN/x1bPBMtI6NsRmoM2cgteOFw+t/qEnW3IymFjABKUtyO2w
         8JLLbEMqf+MaY87jjDzMDFdSjZ/ZhpXDV5gbgrECBEdb7dvChp+koaU4p/FdyjA+cGPu
         Q4it2C7c8GRxrjcQrXOBMNxBTHsarpA5kw1bkpmHXyGaIy0+DjId1bO+doBUisVu8LKa
         wxmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680908464;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pwlm1lMKQRjwxkmrW2F8t3gfYFcIvBu5GbvK5p1f3qI=;
        b=yNJr1H9IkWTa1Ljy+zSaY3DaEi4NWBkZr4ST4bnHfs8mw99lzSnOX8DUeWu/QfqKHD
         c7O1b7pLgHoUBZSCz6N1zHMGANRuue3EeqOI6Uum+s0lCPif5rx+2KzyKO0cUUSY3Ajz
         J2Mp+GF/pbEI3rgu36gKNxNVFtjwWGM9LYeca1fToYOyDrnMWZajYMSVZsKUHkRjYBG3
         BOz/uIJaMpk7TbRToCEmkrASoR9x8sMWCk0Il2Ln00LVHhtuFHyV+ugpaZNluGcLx9xb
         vs1Fj3d0hgkfAH0UcsBY9XdAscZN5sNf1W+O1+apjUpgw0BeVXaNb3stU0CkPwCUV7mt
         K07A==
X-Gm-Message-State: AAQBX9etslf8UpUgY9sxt4Xb9VUO3huLLjgZjXb5O1LWLy4lkTIxuF/7
	PSGfB4VQfRlYuuCJ0I2VvgRQeg==
X-Google-Smtp-Source: AKy350aJv8JM6VFQdChjoum7LkzJsp3BEooDRP1tQQsqzUK9IOYyaf2AaDi9zqTn0y042mdujiyLbw==
X-Received: by 2002:a05:6a20:cd5d:b0:d9:f539:727f with SMTP id hn29-20020a056a20cd5d00b000d9f539727fmr4424102pzb.28.1680908463869;
        Fri, 07 Apr 2023 16:01:03 -0700 (PDT)
Message-ID: <8174dba8-3d19-58e6-9bcc-cb8b58d76c1b@linaro.org>
Date: Fri, 7 Apr 2023 16:01:01 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 01/14] accel: Document generic accelerator headers
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, xen-devel@lists.xenproject.org,
 kvm@vger.kernel.org, Reinoud Zandijk <reinoud@netbsd.org>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>
References: <20230405101811.76663-1-philmd@linaro.org>
 <20230405101811.76663-2-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230405101811.76663-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/5/23 03:17, Philippe Mathieu-Daudé wrote:
> These headers are meant to be include by any file to check
> the availability of accelerators, thus are not accelerator
> specific.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   include/sysemu/hax.h  | 2 ++
>   include/sysemu/kvm.h  | 2 ++
>   include/sysemu/nvmm.h | 2 ++
>   include/sysemu/tcg.h  | 2 ++
>   include/sysemu/whpx.h | 2 ++
>   include/sysemu/xen.h  | 2 ++
>   6 files changed, 12 insertions(+)

Acked-by: Richard Henderson <richard.henderson@linaro.org>

r~

