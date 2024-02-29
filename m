Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 280BD86CF65
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 17:35:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687303.1070581 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfjN4-0004yo-SW; Thu, 29 Feb 2024 16:34:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687303.1070581; Thu, 29 Feb 2024 16:34:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfjN4-0004wx-PM; Thu, 29 Feb 2024 16:34:58 +0000
Received: by outflank-mailman (input) for mailman id 687303;
 Thu, 29 Feb 2024 16:34:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x8AV=KG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rfjN3-0004wp-5v
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 16:34:57 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 78392d6d-d720-11ee-a1ee-f123f15fe8a2;
 Thu, 29 Feb 2024 17:34:55 +0100 (CET)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a3fb8b0b7acso170568966b.2
 for <xen-devel@lists.xenproject.org>; Thu, 29 Feb 2024 08:34:55 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 y1-20020a1709060bc100b00a43aa27b5f2sm840849ejg.94.2024.02.29.08.34.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Feb 2024 08:34:54 -0800 (PST)
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
X-Inumbo-ID: 78392d6d-d720-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709224495; x=1709829295; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ddklw9Fup78ZYsuy+7Gip+a/kwQoVC/SFYGdun8k6mI=;
        b=UMVFfXppou8cdvZSTZZNRIiPbBo6Y0bkvGQe5/GrNwfYlqajNv1oz6/09Mk/U5iMic
         AAFbImTDLqWNn0ptzOPcIEexGcXnyms22E/qsToSJJ3BFVw7nWmF4Bz30ke9QlsoFD0V
         +Qd9JIk2YGSJYf42njMthqPpDCIal/N3o/COr5ouagzFJCEv2H8gw8XwbYuQhV3MtmDm
         wnUnFNlK0atMm5ZUoUFIkEZj+kyMYH3POmopxChgu9yd5H+V7Xb6Aop069BaoBIwJFHS
         jjeLNBEwBoUbi0zvag4lzpKrWOvlndNaWohM0qZ+8FSGZHH6eHE1+bqfxgoY5bTk7AID
         MlXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709224495; x=1709829295;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ddklw9Fup78ZYsuy+7Gip+a/kwQoVC/SFYGdun8k6mI=;
        b=G8uQPXUvm5d8TouHnfzXbVVnYeZZc6R4OAr13P4kFMGnQoNRt+idKg4rXYBMA64nNZ
         V1CPXNJ6I35ZOmuNSLxbDN3LfgsYgvgaQQ/ngmdILFSZF/1TALwxCAqCvEYiEB6i3tlb
         6VU5EhewnghR8GyFOq9vEReae73bx4JpqQ3pBztMvWurj1Y4x1/XjzoPbhZYSzQUZP60
         yGXHHMxJuXoQ9ja89TjApuwtYi+yOdZUnim9v7eZJdiEv38Mxbc+UggTK0fOpGBsTfad
         K7RE1+WvcSoFsxOoxKjkXD6NXysVI+Jly3tTEbhExILzyOBpIbRc0GwYILPGGzFLLeK4
         7b9w==
X-Forwarded-Encrypted: i=1; AJvYcCW/7cUfGKv6ZXnmOjCko30zEJ2f3t8Eo3UIEH3/hN9x1CkQnkovgWd+ysZ4qhfucBdOIj+rKcJb2mBOsAnmwmW0ynOozJgVR2tp7+ZnMn4=
X-Gm-Message-State: AOJu0YwxplsnrMtmI7YlRYFFrECY4YyoY72aO+ouwD8kLa5FN6bfERdM
	dlImD7ERz08ZoeXwT5UBLzpyztlTyb0ZfXetQ+pJMSJ4UmPpX+AHk+rT6ze7GA==
X-Google-Smtp-Source: AGHT+IHDYl+4GMETDUgdjWma9SC4pD46U6M1GZiv/Rujt98Jl8UYYqdMOcIJH0lYvJUY1kLtDrjNIw==
X-Received: by 2002:a17:906:3709:b0:a44:5258:ff3c with SMTP id d9-20020a170906370900b00a445258ff3cmr1299883ejc.1.1709224494674;
        Thu, 29 Feb 2024 08:34:54 -0800 (PST)
Message-ID: <905119be-8731-4669-ac7f-c21aed6845dc@suse.com>
Date: Thu, 29 Feb 2024 17:34:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 02/10] xen/arm: address some violations of MISRA C
 Rule 20.7
Content-Language: en-US
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 andrew.cooper3@citrix.com, roger.pau@citrix.com, bertrand.marquis@arm.com,
 julien@xen.org, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <cover.1709219010.git.nicola.vetrini@bugseng.com>
 <efdeb0e013c36e18b5545fbdb33a43bb3f87039c.1709219010.git.nicola.vetrini@bugseng.com>
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
In-Reply-To: <efdeb0e013c36e18b5545fbdb33a43bb3f87039c.1709219010.git.nicola.vetrini@bugseng.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.02.2024 16:27, Nicola Vetrini wrote:
> --- a/xen/arch/arm/cpuerrata.c
> +++ b/xen/arch/arm/cpuerrata.c
> @@ -462,8 +462,8 @@ static bool has_ssbd_mitigation(const struct arm_cpu_capabilities *entry)
>  #define MIDR_RANGE(model, min, max)     \
>      .matches = is_affected_midr_range,  \
>      .midr_model = model,                \
> -    .midr_range_min = min,              \
> -    .midr_range_max = max
> +    .midr_range_min = (min),            \
> +    .midr_range_max = (max)

Why min and max, but not model?

> --- a/xen/arch/arm/include/asm/smccc.h
> +++ b/xen/arch/arm/include/asm/smccc.h
> @@ -122,7 +122,7 @@ struct arm_smccc_res {
>  #define __constraint_read_7 __constraint_read_6, "r" (r7)
>  
>  #define __declare_arg_0(a0, res)                            \
> -    struct arm_smccc_res    *___res = res;                  \
> +    struct arm_smccc_res    *___res = (res);                \
>      register unsigned long  r0 ASM_REG(0) = (uint32_t)a0;   \

Why res but not a0?

> --- a/xen/arch/arm/include/asm/vgic-emul.h
> +++ b/xen/arch/arm/include/asm/vgic-emul.h
> @@ -6,11 +6,11 @@
>   * a range of registers
>   */
>  
> -#define VREG32(reg) reg ... reg + 3
> -#define VREG64(reg) reg ... reg + 7
> +#define VREG32(reg) (reg) ... (reg) + 3
> +#define VREG64(reg) (reg) ... (reg) + 7

#define VREG32(reg) (reg) ... ((reg) + 3)
#define VREG64(reg) (reg) ... ((reg) + 7)

?

Jan

