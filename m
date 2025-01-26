Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09455A1CE73
	for <lists+xen-devel@lfdr.de>; Sun, 26 Jan 2025 21:37:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.877277.1287413 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tc9ND-0002wc-Rz; Sun, 26 Jan 2025 20:36:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 877277.1287413; Sun, 26 Jan 2025 20:36:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tc9ND-0002ts-Op; Sun, 26 Jan 2025 20:36:51 +0000
Received: by outflank-mailman (input) for mailman id 877277;
 Sun, 26 Jan 2025 20:36:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vl/L=US=linaro.org=richard.henderson@srs-se1.protection.inumbo.net>)
 id 1tc9NC-0002th-Vq
 for xen-devel@lists.xenproject.org; Sun, 26 Jan 2025 20:36:50 +0000
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [2607:f8b0:4864:20::62c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 43cfd0a7-dc25-11ef-99a4-01e77a169b0f;
 Sun, 26 Jan 2025 21:36:49 +0100 (CET)
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-2161eb94cceso44373175ad.2
 for <xen-devel@lists.xenproject.org>; Sun, 26 Jan 2025 12:36:49 -0800 (PST)
Received: from [192.168.0.4] (174-21-71-127.tukw.qwest.net. [174.21.71.127])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72f8a6b18b5sm5645530b3a.39.2025.01.26.12.36.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Jan 2025 12:36:47 -0800 (PST)
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
X-Inumbo-ID: 43cfd0a7-dc25-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737923807; x=1738528607; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g2WeP5q4hv+K1Hr21O956YlU/gBG9YtJDHMFPAKuFc4=;
        b=QEt1SpT0VtBkL2hZ85IaRNu0Maypq2iNdmwVLvx2v6o5ZPXF6f9Oc5hOK9V4xdLoTI
         QokCQk4qDhltNpFuhbCmMfsIuJ6rOJCem2OHVRMrZvGgR5vyMjKGJoVmz0JIjx/2jKu4
         kILVQ5eegQGNM7SAYIbYlbJmopFEIaceHSIE/wtTPyJPyz3v0TPtCzrJHbXO3dYzvs4A
         V0AxDQU5ccSbsgP8Pu4jfxF8uMI8+FfirlJGbYUZV4TUQq2YH3hm3Mkxsl07GbVUCwQP
         097B8lCM/Kr3Od2Z4KhniEUj4RMqgeEDikk17pAaBfbA4legl5ldeJMX7InxHbAj5yKJ
         1NAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737923807; x=1738528607;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g2WeP5q4hv+K1Hr21O956YlU/gBG9YtJDHMFPAKuFc4=;
        b=j+2Z4nHjQiWLwgua8P3pgXo/0VeDyw856YXHLkERmFNAQZB+XkJmuEN2NKiVGnRczK
         CDRF8KJzNuLZvypq4dW5FznNqhfePIxqUBnXJJ3DgVjFmfs3Fniraw/mJeCJ3m1MEzFr
         31p+v0JH6jmqI62x0Pq6cIcOO+80WmTOiPVtzPuNJMx/Xbs4d2Glz5lo4CIOcDb1cWkh
         e7zaZUIumQ02g47r9CyQnZwzR+wNXu5vwQ2cNwLYdqCo0E3PJVc8U3xdiOpuzHCP+IAo
         2WRfnaUXX/eqvT9WN0nKNUpuxMRQLfRdWy2Rv7vaEgSSiNld85H43dC9v3bUeCPhFCx1
         Ly7A==
X-Forwarded-Encrypted: i=1; AJvYcCXDWU2MELgxWkpfydnCjoIcv15Hdz4zCRBcPlM8InlYcpmzH5y41dCu+RmofOnRVju4u9p0m4g6MyA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzZNjHcwLw+/kDybamOg8BHygDDal+CkjJlp8kiVfn1aaj/lNox
	cEpKPCgcVvoj0fG7t0OU+kT2j0Ry/l784QIJXgcHcXgaqoeQGaZ5cH4pm+LFk48=
X-Gm-Gg: ASbGncth5U42uW6kWQ4+xJsinHLKUA9g/KuTrg+HcVI/9gq22rt/sFvSR1wLybPdSN9
	wV7nBcCu9QDOeiThA+2jUW7K/29atFa0A7ySv97/H0fVxGhr1krCUG9EiTFciSoKwCDKOh97Dix
	53kV/wN09WVfZNDG5egtTF4ArksF6MnHsTjyc90bAe6ysWDgD1Prut+Xy7F8um+d6jY72yt9J5V
	R6z5nxmllKQ1YZQlmd5ZfLaIH0waOGURamdZlDp4Dk1MKZlccPqjFe5u8hfsX0K1vrZVH9ja5ev
	Yt/Y6FiwnHRzgm0H/DJUIjXy+OPe29CRvjXNzq9L9798g0M=
X-Google-Smtp-Source: AGHT+IG7QHEN6N12IEj7HpZ8+9ISOfMpvPDzHND+sb7CKsQVCW2Siz1JbFKV0CJ4CarsM9/PXCPftw==
X-Received: by 2002:a05:6a20:2447:b0:1e0:ce11:b0ce with SMTP id adf61e73a8af0-1eb215adabfmr66485176637.35.1737923807521;
        Sun, 26 Jan 2025 12:36:47 -0800 (PST)
Message-ID: <d81542e9-bebf-4f5f-a911-8ab7b6180d4e@linaro.org>
Date: Sun, 26 Jan 2025 12:36:45 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/20] accel/tcg: Rename 'hw/core/tcg-cpu-ops.h' ->
 'accel/tcg/cpu-ops.h'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, kvm@vger.kernel.org, qemu-ppc@nongnu.org,
 qemu-riscv@nongnu.org, David Hildenbrand <david@redhat.com>,
 qemu-s390x@nongnu.org, xen-devel@lists.xenproject.org
References: <20250123234415.59850-1-philmd@linaro.org>
 <20250123234415.59850-11-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250123234415.59850-11-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 1/23/25 15:44, Philippe Mathieu-Daudé wrote:
> TCGCPUOps structure makes more sense in the accelerator context
> rather than hardware emulation. Move it under the accel/tcg/ scope.
> 
> Mechanical change doing:
> 
>   $  sed -i -e 's,hw/core/tcg-cpu-ops.h,accel/tcg/cpu-ops.h,g' \
>     $(git grep -l hw/core/tcg-cpu-ops.h)
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   MAINTAINERS                                            | 2 +-
>   include/{hw/core/tcg-cpu-ops.h => accel/tcg/cpu-ops.h} | 0
>   accel/tcg/cpu-exec.c                                   | 4 ++--
>   accel/tcg/cputlb.c                                     | 2 +-
>   accel/tcg/translate-all.c                              | 2 +-
>   accel/tcg/user-exec.c                                  | 2 +-
>   accel/tcg/watchpoint.c                                 | 2 +-
>   bsd-user/signal.c                                      | 2 +-
>   hw/mips/jazz.c                                         | 2 +-
>   linux-user/signal.c                                    | 2 +-
>   system/physmem.c                                       | 2 +-
>   target/alpha/cpu.c                                     | 2 +-
>   target/arm/cpu.c                                       | 2 +-
>   target/arm/tcg/cpu-v7m.c                               | 2 +-
>   target/arm/tcg/cpu32.c                                 | 2 +-
>   target/arm/tcg/mte_helper.c                            | 2 +-
>   target/arm/tcg/sve_helper.c                            | 2 +-
>   target/avr/cpu.c                                       | 2 +-
>   target/avr/helper.c                                    | 2 +-
>   target/hexagon/cpu.c                                   | 2 +-
>   target/hppa/cpu.c                                      | 2 +-
>   target/i386/tcg/tcg-cpu.c                              | 2 +-
>   target/loongarch/cpu.c                                 | 2 +-
>   target/m68k/cpu.c                                      | 2 +-
>   target/microblaze/cpu.c                                | 2 +-
>   target/mips/cpu.c                                      | 2 +-
>   target/openrisc/cpu.c                                  | 2 +-
>   target/ppc/cpu_init.c                                  | 2 +-
>   target/riscv/tcg/tcg-cpu.c                             | 2 +-
>   target/rx/cpu.c                                        | 2 +-
>   target/s390x/cpu.c                                     | 2 +-
>   target/s390x/tcg/mem_helper.c                          | 2 +-
>   target/sh4/cpu.c                                       | 2 +-
>   target/sparc/cpu.c                                     | 2 +-
>   target/tricore/cpu.c                                   | 2 +-
>   target/xtensa/cpu.c                                    | 2 +-
>   36 files changed, 36 insertions(+), 36 deletions(-)
>   rename include/{hw/core/tcg-cpu-ops.h => accel/tcg/cpu-ops.h} (100%)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 7be3d8f431a..fa46d077d30 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -175,7 +175,7 @@ F: include/exec/helper-info.c.inc
>   F: include/exec/page-protection.h
>   F: include/system/cpus.h
>   F: include/system/tcg.h
> -F: include/hw/core/tcg-cpu-ops.h
> +F: include/accel/tcg/cpu-ops.h
>   F: host/include/*/host/cpuinfo.h
>   F: util/cpuinfo-*.c
>   F: include/tcg/
> diff --git a/include/hw/core/tcg-cpu-ops.h b/include/accel/tcg/cpu-ops.h
> similarity index 100%
> rename from include/hw/core/tcg-cpu-ops.h
> rename to include/accel/tcg/cpu-ops.h
> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> index be2ba199d3d..8ee76e14b0d 100644
> --- a/accel/tcg/cpu-exec.c
> +++ b/accel/tcg/cpu-exec.c
> @@ -22,7 +22,7 @@
>   #include "qapi/error.h"
>   #include "qapi/type-helpers.h"
>   #include "hw/core/cpu.h"
> -#include "hw/core/tcg-cpu-ops.h"
> +#include "accel/tcg/cpu-ops.h"
>   #include "trace.h"
>   #include "disas/disas.h"
>   #include "exec/cpu-common.h"
> @@ -39,7 +39,7 @@
>   #include "exec/replay-core.h"
>   #include "system/tcg.h"
>   #include "exec/helper-proto-common.h"
> -#include "tb-jmp-cache.h"
> +//#include "tb-jmp-cache.h"

What's this?


r~

