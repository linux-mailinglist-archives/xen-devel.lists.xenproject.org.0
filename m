Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE97A1CECD
	for <lists+xen-devel@lfdr.de>; Sun, 26 Jan 2025 22:36:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.877356.1287513 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcAI5-0002ij-Pr; Sun, 26 Jan 2025 21:35:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 877356.1287513; Sun, 26 Jan 2025 21:35:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tcAI5-0002gw-NM; Sun, 26 Jan 2025 21:35:37 +0000
Received: by outflank-mailman (input) for mailman id 877356;
 Sun, 26 Jan 2025 21:35:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vl/L=US=linaro.org=richard.henderson@srs-se1.protection.inumbo.net>)
 id 1tcAI4-0002gq-Cb
 for xen-devel@lists.xenproject.org; Sun, 26 Jan 2025 21:35:36 +0000
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [2607:f8b0:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 78ef9286-dc2d-11ef-99a4-01e77a169b0f;
 Sun, 26 Jan 2025 22:35:34 +0100 (CET)
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-2164b662090so72058995ad.1
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jan 2025 13:35:34 -0800 (PST)
Received: from [192.168.0.4] (174-21-71-127.tukw.qwest.net. [174.21.71.127])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21da3d9c552sm50455215ad.18.2025.01.26.13.35.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Jan 2025 13:35:27 -0800 (PST)
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
X-Inumbo-ID: 78ef9286-dc2d-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737927332; x=1738532132; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u0m5yL8s0TWSEEfxviVLYoEbDIw5bajMGnLn0okjgqc=;
        b=zK6rk0zU1Gui0fVQjM7n4PH2mUStiW4oL/uxFpSjU1rHho8LJy8QAaZbvbWsOpBho7
         Ufw4tUFIp1MEfZLHFYPxXNAlvssN1sCCOm83l4NrgPLO3IeGFe8T91JD1AaKFpLBR9wD
         D1S4pF5V7GJOlm4wrzL82qVpHGbbaSPbAauD0COs9LHOFP+7bqbwUXpJlHacQ2JKhKfX
         lMzL0wxCJjg/fGzw/0jAcQaeEsFDWZgSS5oRqut/v6pxlY6AIyapu19NHdNDiMQDXMDX
         N3Tj7+dTkIbTCHGlLm0AUuoxtzCDhrVLnNuPEyVDi21AKdewzIp2yB0Wb2CZBMmipV6K
         MKNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737927332; x=1738532132;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u0m5yL8s0TWSEEfxviVLYoEbDIw5bajMGnLn0okjgqc=;
        b=idNdlIygjNrZCPeK6PBvvrzzlTeKiMEGTf9cp8ApjkccqIvscu/0QYcWS0rYzlhnhg
         fdOU4H0Fa3l7lB9OwLkY34JYl7y7DCu2uMw1Bed2WbeOVqbZT/WEy5ptXKFELb1wCWzF
         VN1c5Dz0/HiIxvMsG9YNy4Vp8uOo7MtTsBC+3RmxwmUHhTIkstZLJ5CI/2d0jKlSIRNl
         +P1lVGdsDejLchzFWrcapraIH0jSQaZ28lEcz+7UStmnAiiZlj+sgdcbZRHQCElg3zOL
         CGsehHin0WVCn7KNnIulWyJaFgAVGEsmWHia+ZeRHwnzSo3rYjdcgUjRBUadesl2b/R8
         6raA==
X-Forwarded-Encrypted: i=1; AJvYcCUX0Pv6ZJvUadbC/trtRGK1uhRKIsAUC+KBeOwCLx8+C11BbRdKsdTTHV1uwDfmlVwFukJZ8HHQgD0=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwN8vdQF1LW5U2o16r6JxCbI+qAK/H6471yBp+zpq/pih49422X
	hS0SKWFH1kGAprxFCmzJuMHQMymN07CGbOfsVN1HekC62FTO6GwGXJ4U9ts9CPA=
X-Gm-Gg: ASbGncu6P9IK5yX+GsxZZmV27p6+LrIEqYxa8IaLCS+N77kexqveOz+Xnjf7dMTZVmr
	yt3Z7gpYJpctW+Cz6GBVjK/Ie133ZCt9w/ZkGWNxanEIE/ciCFJrYCZV+4P3YRO3d5HXpM0p7+h
	ehS+Pq0mI+6elzQNtPKazOJzr3BHw8IlCIdXYRnOC41pzHX38WIURkF7JJ1V5Vf+BVkKwQr6yK2
	14wF9zFrlLp8hcYfDI4eZ2lDiDKcYtkLNOvWHN5xXLKu2KRGpOwQ+xU4aAxiH4qCHQSN9AtHsO1
	xqGxpA3CHvlmPyAweLq1Bz11ryeARFTNh5Wmtvb8M02fSQo=
X-Google-Smtp-Source: AGHT+IF/uxXXMxK7HfifMI4lK/bjNl3NXv2LfDusZSj5Oq6BRtJb3xCpVAH5ppeGMpTK7NLB5Z4iRQ==
X-Received: by 2002:a17:903:191:b0:216:3466:7414 with SMTP id d9443c01a7336-21c355f6a9cmr669165345ad.44.1737927327477;
        Sun, 26 Jan 2025 13:35:27 -0800 (PST)
Message-ID: <4de30644-618d-4914-a1c6-008992c7edff@linaro.org>
Date: Sun, 26 Jan 2025 13:35:25 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/20] cpus: Register VMState per user / system emulation
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, David Hildenbrand <david@redhat.com>,
 qemu-s390x@nongnu.org, xen-devel@lists.xenproject.org
References: <20250123234415.59850-1-philmd@linaro.org>
 <20250123234415.59850-20-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250123234415.59850-20-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/23/25 15:44, Philippe Mathieu-Daudé wrote:
> Simplify cpu-target.c by extracting mixed vmstate code
> into the cpu_vmstate_register() / cpu_vmstate_unregister()
> helpers, implemented in cpu-user.c and cpu-system.c.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> XXX: tlb_flush() temporary declared manually.
> 
> Only 2 more CONFIG_USER_ONLY to go.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

> --- a/hw/core/cpu-system.c
> +++ b/hw/core/cpu-system.c
> @@ -22,10 +22,21 @@
>   #include "qapi/error.h"
>   #include "exec/address-spaces.h"
>   #include "exec/memory.h"
> +#include "exec/tb-flush.h"
>   #include "exec/tswap.h"
>   #include "hw/qdev-core.h"
>   #include "hw/qdev-properties.h"
>   #include "hw/core/sysemu-cpu-ops.h"
> +#include "migration/vmstate.h"
> +#include "system/tcg.h"
> +
> +/*
> + * XXX this series plan is to be applied on top on my exec/cputlb rework series,
> + * then tlb_flush() won't be declared target-specific in exec-all.h.
> + * Meanwhile, declare locally.
> + * XXX
> + */
> +void tlb_flush(CPUState *cs);

Ack.


r~

