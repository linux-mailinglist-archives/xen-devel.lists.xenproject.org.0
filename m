Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DED1FAB5FAF
	for <lists+xen-devel@lfdr.de>; Wed, 14 May 2025 00:56:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.983613.1369854 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEyXd-0002tY-T3; Tue, 13 May 2025 22:56:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 983613.1369854; Tue, 13 May 2025 22:56:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uEyXd-0002qs-PO; Tue, 13 May 2025 22:56:05 +0000
Received: by outflank-mailman (input) for mailman id 983613;
 Tue, 13 May 2025 22:56:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yV0d=X5=linaro.org=pierrick.bouvier@srs-se1.protection.inumbo.net>)
 id 1uEyXd-0002qm-7V
 for xen-devel@lists.xenproject.org; Tue, 13 May 2025 22:56:05 +0000
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [2607:f8b0:4864:20::531])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6cd8c795-304d-11f0-9eb6-5ba50f476ded;
 Wed, 14 May 2025 00:55:55 +0200 (CEST)
Received: by mail-pg1-x531.google.com with SMTP id
 41be03b00d2f7-af908bb32fdso233183a12.1
 for <xen-devel@lists.xenproject.org>; Tue, 13 May 2025 15:55:55 -0700 (PDT)
Received: from [192.168.1.87] ([38.41.223.211])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-30e33482fd3sm136941a91.37.2025.05.13.15.55.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 May 2025 15:55:53 -0700 (PDT)
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
X-Inumbo-ID: 6cd8c795-304d-11f0-9eb6-5ba50f476ded
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747176954; x=1747781754; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LBJDbb+g+rnG8821hA+sNUH+3t1umps8kf5QOmsN0dM=;
        b=V/Xii7LAHbEm/Yza/HOnYLYv3UQyVosETh/uIxnnFozRikhfajOkMI5RnpNNHUbGHO
         4rcriKiTeBoA9g1k8zfd/atP27caxln7kZvS/nfuHaqdF/jWKFpBGy8oJ0D0tjfuzw4c
         T4CR7Lmu5ElME2MMJd6lrXa0zf2eqcf+HtznIkYFBKHLdWlb9bTZbiyN5Q18T2ztL3FX
         tG/rvfD+A0bZMPFc8e8ebtdw6oOCy+B/8H6p2RhyuAn3F/yXWGIWFDn14qpYgAYsb0rn
         wprkC+cX687XuJyTz+9bNR9v0ryTMKOUlTWTrbuqeTdnRfu4Lmy5d4vvxIoByN21rLat
         ClXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747176954; x=1747781754;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LBJDbb+g+rnG8821hA+sNUH+3t1umps8kf5QOmsN0dM=;
        b=AgY5CN8ogxr520G1QBOtrzv/0mZ340aUKIRY9J4OpBFz6C+f01k//hnUT/dkn5DHmt
         y6GHFWQYTe5EnlN7M+QUhAarNwfUYhEJxr0TXbw5MHbWkBfFPek1ctKxRP6uDm+cLfHe
         FzkpER+ryRqRUiqvv0Hh8dwPJ4pDyB1y4BQj2bHfjYQXlgXGb7J/DUNcLwzE85PhWxon
         BO1FuaAETitR2X7CXjMZfKrr2lBSWOQ3GFUjvd8eJZZFKrF8nW7jAwA29cntRALc6foj
         ZK62tPb5c/UZn+2/IZoA8hV0IQY3x04WkxTHO9BCZCwEHRqMCn1zZzRcqjXh2O7nHoYl
         bJdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVU4vhaZkqULhFcPRikNg2q0iq/xdLR67nz46OTzoRiCEivl81tZZL15pqGbTJMVJbS1CJT5ehqQnI=@lists.xenproject.org
X-Gm-Message-State: AOJu0YybhzRhXK45z0Ra6Dp6wqch4XG+Wfa1w3S5HlpEJT6meJf4CrBG
	pthzSN68ij3quwTeoJXyZfynbcA/yLIifC1jFoIqCDlZd9ZeC/TaSQPnFcTZp0wXPQFmrX9kgm4
	2
X-Gm-Gg: ASbGncsCl0gWnpm9WIfhhAeQ2NYdfIrLBqo8/4Ifdm2PvQ54XG7zlNeMO7HyIZDyRwV
	m1I91e8XVh22XZrpfm+d6YrK/9HkSFn2ktqUuKoy6rifgXZJ8MMWHkNrFU8o+Zab2dYgPYl8iPd
	mYsxdFJsmQCtzu2sfRRaYFrTp2LXybVonjCu0EQdw5zR5CXYRiKjTl5HZOjN6gWumKxAqAPRbQ2
	D9NiAxlmPcfWz0nfPdzLwc9fKwoMSbDJHAUI7y4Cdk0biaSMOtPP4nBmA/lTmqcR7V/uRfhv+p5
	3PPHmlQMR+AU8V8ciuVyJXcnqZkEcAyijd/HZ0+Nzgnd4jBifd9/r+hPKVTBIHqi
X-Google-Smtp-Source: AGHT+IHdeevlFHLxUccT1xfjG6u5tqxbZV9hv1bsXOwnio3wriSr/+Avu60k8tk0djcNq0ykX0Xh9w==
X-Received: by 2002:a17:90b:33c8:b0:2fa:2268:1af4 with SMTP id 98e67ed59e1d1-30e0db01419mr7180936a91.7.1747176953809;
        Tue, 13 May 2025 15:55:53 -0700 (PDT)
Message-ID: <d7e3158c-2115-4a74-96a1-aec7fa99e172@linaro.org>
Date: Tue, 13 May 2025 15:55:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/xen/arch_hvm: Unify x86 and ARM variants
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Anthony PERARD <anthony@xenproject.org>,
 David Woodhouse <dwmw@amazon.co.uk>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
 Stefano Stabellini <sstabellini@kernel.org>, Paul Durrant <paul@xen.org>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20250513171737.74386-1-philmd@linaro.org>
From: Pierrick Bouvier <pierrick.bouvier@linaro.org>
In-Reply-To: <20250513171737.74386-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/13/25 10:17 AM, Philippe Mathieu-Daudé wrote:
> As each target declares the same prototypes, we can
> use a single header, removing the TARGET_XXX uses.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/hw/arm/xen_arch_hvm.h  |  9 ---------
>   include/hw/i386/xen_arch_hvm.h | 11 -----------
>   include/hw/xen/arch_hvm.h      | 14 ++++++++++----
>   hw/arm/xen-pvh.c               |  1 -
>   4 files changed, 10 insertions(+), 25 deletions(-)
>   delete mode 100644 include/hw/arm/xen_arch_hvm.h
>   delete mode 100644 include/hw/i386/xen_arch_hvm.h
> 
> diff --git a/include/hw/arm/xen_arch_hvm.h b/include/hw/arm/xen_arch_hvm.h
> deleted file mode 100644
> index 8fd645e7232..00000000000
> --- a/include/hw/arm/xen_arch_hvm.h
> +++ /dev/null
> @@ -1,9 +0,0 @@
> -#ifndef HW_XEN_ARCH_ARM_HVM_H
> -#define HW_XEN_ARCH_ARM_HVM_H
> -
> -#include <xen/hvm/ioreq.h>
> -void arch_handle_ioreq(XenIOState *state, ioreq_t *req);
> -void arch_xen_set_memory(XenIOState *state,
> -                         MemoryRegionSection *section,
> -                         bool add);
> -#endif
> diff --git a/include/hw/i386/xen_arch_hvm.h b/include/hw/i386/xen_arch_hvm.h
> deleted file mode 100644
> index 1000f8f5433..00000000000
> --- a/include/hw/i386/xen_arch_hvm.h
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -#ifndef HW_XEN_ARCH_I386_HVM_H
> -#define HW_XEN_ARCH_I386_HVM_H
> -
> -#include <xen/hvm/ioreq.h>
> -#include "hw/xen/xen-hvm-common.h"
> -
> -void arch_handle_ioreq(XenIOState *state, ioreq_t *req);
> -void arch_xen_set_memory(XenIOState *state,
> -                         MemoryRegionSection *section,
> -                         bool add);
> -#endif
> diff --git a/include/hw/xen/arch_hvm.h b/include/hw/xen/arch_hvm.h
> index df39c819c8f..8bacaa4ec41 100644
> --- a/include/hw/xen/arch_hvm.h
> +++ b/include/hw/xen/arch_hvm.h
> @@ -1,5 +1,11 @@
> -#if defined(TARGET_I386) || defined(TARGET_X86_64)
> -#include "hw/i386/xen_arch_hvm.h"
> -#elif defined(TARGET_ARM) || defined(TARGET_AARCH64)
> -#include "hw/arm/xen_arch_hvm.h"
> +#ifndef HW_XEN_ARCH_HVM_H
> +#define HW_XEN_ARCH_HVM_H
> +
> +#include <xen/hvm/ioreq.h>
> +#include "hw/xen/xen-hvm-common.h"
> +
> +void arch_handle_ioreq(XenIOState *state, ioreq_t *req);
> +void arch_xen_set_memory(XenIOState *state,
> +                         MemoryRegionSection *section,
> +                         bool add);
>   #endif
> diff --git a/hw/arm/xen-pvh.c b/hw/arm/xen-pvh.c
> index 4b26bcff7a5..1a9eeb01c8e 100644
> --- a/hw/arm/xen-pvh.c
> +++ b/hw/arm/xen-pvh.c
> @@ -10,7 +10,6 @@
>   #include "hw/boards.h"
>   #include "system/system.h"
>   #include "hw/xen/xen-pvh-common.h"
> -#include "hw/xen/arch_hvm.h"
>   
>   #define TYPE_XEN_ARM  MACHINE_TYPE_NAME("xenpvh")
>   

Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>


