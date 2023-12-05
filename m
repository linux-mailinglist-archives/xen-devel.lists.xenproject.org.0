Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C0D805949
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 16:59:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.648109.1012113 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAXpc-0002l9-Vd; Tue, 05 Dec 2023 15:59:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 648109.1012113; Tue, 05 Dec 2023 15:59:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAXpc-0002jW-Qs; Tue, 05 Dec 2023 15:59:32 +0000
Received: by outflank-mailman (input) for mailman id 648109;
 Tue, 05 Dec 2023 15:59:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kfJ1=HQ=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rAXpa-0002TH-SR
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 15:59:30 +0000
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 45857e76-9387-11ee-9b0f-b553b5be7939;
 Tue, 05 Dec 2023 16:59:29 +0100 (CET)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3333224c7b9so3708343f8f.1
 for <xen-devel@lists.xenproject.org>; Tue, 05 Dec 2023 07:59:29 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 k13-20020adfe8cd000000b003333c2c313bsm9075325wrn.100.2023.12.05.07.59.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Dec 2023 07:59:28 -0800 (PST)
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
X-Inumbo-ID: 45857e76-9387-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701791969; x=1702396769; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SFdecdSjLAj7BDMMjO8ChRVswMaSIGmw/k4UUfGRHk8=;
        b=Pzb9mSC5/k07VBjSYEhfPHHH/ULrH7e5UGnNxX5Cbma4cxo3DEuAYwZZuwmxC7YqlZ
         hyxZetaJxmhxasaDwoHhUu4glVsentkbX5h4mSZpXOVieIkC8UeQ62HaYG/xrulHRDXn
         +ubifvvFW3BzwnqzVOoa0AkTLYznYITAlED14qaZb8ya45lUdS8XX4j1A1WCfe3wt7C1
         VZd4JAMWhVgFqrTBlQXTrPeilJYQqGdOWxEf0sabLL3sEwr/3B+q13sep+WsWzuwDjiI
         Bp5oXDpPrFVeuu4YTeb8q86tS5oQCl0+MQY6shQPY5dafwRwUyCkD3yhtzy0cES8W+J9
         cmCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701791969; x=1702396769;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SFdecdSjLAj7BDMMjO8ChRVswMaSIGmw/k4UUfGRHk8=;
        b=V33U4f+gp05MUHnF9hzftOT9qomiAJrOQpSSTO8sG2aWSzx+pk21gn3Fp6Rx9n5SVd
         p5odd8ja4kOS+WxdTCnTt7BESR/cRdt3MNsiVK92PEOTLvc5lAgo9QOicN8XvwMTJQ2L
         BJxHYDI6R7nUDMqSg0dNj+qhGAI+8vRZ8XEtw5MOTRG771L5dPmnZxv4LrrwoJcKKStb
         MG980hD0rUtJXd4WmJqfEerkV6IdOUSgDifyCsRBvkwAUnBmmrlt56MwxWley/iKYfRA
         KCxnTAc4hNMWxfSfbvl2mF2x6cov0vKFxuP6ctFDNCdL2U+O0IiWNI1434OVrXtT6SUF
         jymQ==
X-Gm-Message-State: AOJu0YxCBrSRuK4ZDs8mPArLK2PFGhW4oLVPftgUbV+mVegH9x4jo7lB
	QQJalFlQpgBbdu5aUs3ALs8R
X-Google-Smtp-Source: AGHT+IELuc6gl0Bb6ygffESUBfeP+0X6h8K7W/7Wh+rylwO8S1FzT5LgrjnrHp/K7ZILoc2oPBdBYw==
X-Received: by 2002:a5d:6b8f:0:b0:333:4989:3aae with SMTP id n15-20020a5d6b8f000000b0033349893aaemr2090494wrx.129.1701791968713;
        Tue, 05 Dec 2023 07:59:28 -0800 (PST)
Message-ID: <5eae9d9b-e499-4c8c-aed0-2f52c0aa7c9f@suse.com>
Date: Tue, 5 Dec 2023 16:59:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/39] xen/riscv: introduce arch-riscv/hvm/save.h
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Shawn Anastasio <sanastasio@raptorengineering.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <cover.1700761381.git.oleksii.kurochko@gmail.com>
 <acb870b980a791d7800d47c08c9574275159df39.1700761381.git.oleksii.kurochko@gmail.com>
From: Jan Beulich <jbeulich@suse.com>
Autocrypt: addr=jbeulich@suse.com; keydata=
 xsDiBFk3nEQRBADAEaSw6zC/EJkiwGPXbWtPxl2xCdSoeepS07jW8UgcHNurfHvUzogEq5xk
 hu507c3BarVjyWCJOylMNR98Yd8VqD9UfmX0Hb8/BrA+Hl6/DB/eqGptrf4BSRwcZQM32aZK
 7Pj2XbGWIUrZrd70x1eAP9QE3P79Y2oLrsCgbZJfEwCgvz9JjGmQqQkRiTVzlZVCJYcyGGsD
 /0tbFCzD2h20ahe8rC1gbb3K3qk+LpBtvjBu1RY9drYk0NymiGbJWZgab6t1jM7sk2vuf0Py
 O9Hf9XBmK0uE9IgMaiCpc32XV9oASz6UJebwkX+zF2jG5I1BfnO9g7KlotcA/v5ClMjgo6Gl
 MDY4HxoSRu3i1cqqSDtVlt+AOVBJBACrZcnHAUSuCXBPy0jOlBhxPqRWv6ND4c9PH1xjQ3NP
 nxJuMBS8rnNg22uyfAgmBKNLpLgAGVRMZGaGoJObGf72s6TeIqKJo/LtggAS9qAUiuKVnygo
 3wjfkS9A3DRO+SpU7JqWdsveeIQyeyEJ/8PTowmSQLakF+3fote9ybzd880fSmFuIEJldWxp
 Y2ggPGpiZXVsaWNoQHN1c2UuY29tPsJgBBMRAgAgBQJZN5xEAhsDBgsJCAcDAgQVAggDBBYC
 AwECHgECF4AACgkQoDSui/t3IH4J+wCfQ5jHdEjCRHj23O/5ttg9r9OIruwAn3103WUITZee
 e7Sbg12UgcQ5lv7SzsFNBFk3nEQQCACCuTjCjFOUdi5Nm244F+78kLghRcin/awv+IrTcIWF
 hUpSs1Y91iQQ7KItirz5uwCPlwejSJDQJLIS+QtJHaXDXeV6NI0Uef1hP20+y8qydDiVkv6l
 IreXjTb7DvksRgJNvCkWtYnlS3mYvQ9NzS9PhyALWbXnH6sIJd2O9lKS1Mrfq+y0IXCP10eS
 FFGg+Av3IQeFatkJAyju0PPthyTqxSI4lZYuJVPknzgaeuJv/2NccrPvmeDg6Coe7ZIeQ8Yj
 t0ARxu2xytAkkLCel1Lz1WLmwLstV30g80nkgZf/wr+/BXJW/oIvRlonUkxv+IbBM3dX2OV8
 AmRv1ySWPTP7AAMFB/9PQK/VtlNUJvg8GXj9ootzrteGfVZVVT4XBJkfwBcpC/XcPzldjv+3
 HYudvpdNK3lLujXeA5fLOH+Z/G9WBc5pFVSMocI71I8bT8lIAzreg0WvkWg5V2WZsUMlnDL9
 mpwIGFhlbM3gfDMs7MPMu8YQRFVdUvtSpaAs8OFfGQ0ia3LGZcjA6Ik2+xcqscEJzNH+qh8V
 m5jjp28yZgaqTaRbg3M/+MTbMpicpZuqF4rnB0AQD12/3BNWDR6bmh+EkYSMcEIpQmBM51qM
 EKYTQGybRCjpnKHGOxG0rfFY1085mBDZCH5Kx0cl0HVJuQKC+dV2ZY5AqjcKwAxpE75MLFkr
 wkkEGBECAAkFAlk3nEQCGwwACgkQoDSui/t3IH7nnwCfcJWUDUFKdCsBH/E5d+0ZnMQi+G0A
 nAuWpQkjM1ASeQwSHEeAWPgskBQL
In-Reply-To: <acb870b980a791d7800d47c08c9574275159df39.1700761381.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.11.2023 11:30, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/xen/include/public/arch-riscv/hvm/save.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Structure definitions for HVM state that is held by Xen and must
> + * be saved along with the domain's memory and device-model state.
> + */
> +
> +#ifndef __XEN_PUBLIC_HVM_SAVE_RISCV_H__
> +#define __XEN_PUBLIC_HVM_SAVE_RISCV_H__
> +
> +#endif
> +
> +/*
> + * Local variables:
> + * mode: C
> + * c-file-style: "BSD"
> + * c-basic-offset: 4
> + * tab-width: 4
> + * indent-tabs-mode: nil
> + * End:
> + */

Seeing that Arm's is as empty, I wonder why we have it. Julien, Stefano?

> --- a/xen/include/public/hvm/save.h
> +++ b/xen/include/public/hvm/save.h
> @@ -91,6 +91,8 @@ DECLARE_HVM_SAVE_TYPE(END, 0, struct hvm_save_end);
>  #include "../arch-arm/hvm/save.h"
>  #elif defined(__powerpc64__)
>  #include "../arch-ppc.h"
> +#elif defined(__riscv)
> +#include "../arch-riscv/hvm/save.h"
>  #else
>  #error "unsupported architecture"
>  #endif

The PPC part here looks bogus altogether. Shawn?

Jan

