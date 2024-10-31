Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D39769B779A
	for <lists+xen-devel@lfdr.de>; Thu, 31 Oct 2024 10:34:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828543.1243464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6RZW-0006DD-Hj; Thu, 31 Oct 2024 09:34:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828543.1243464; Thu, 31 Oct 2024 09:34:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6RZW-0006Ao-EU; Thu, 31 Oct 2024 09:34:30 +0000
Received: by outflank-mailman (input) for mailman id 828543;
 Thu, 31 Oct 2024 09:34:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=zW4/=R3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1t6RZV-0006Ai-Pd
 for xen-devel@lists.xenproject.org; Thu, 31 Oct 2024 09:34:29 +0000
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [2a00:1450:4864:20::132])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 50ef035a-976b-11ef-99a3-01e77a169b0f;
 Thu, 31 Oct 2024 10:34:24 +0100 (CET)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-539f84907caso774650e87.3
 for <xen-devel@lists.xenproject.org>; Thu, 31 Oct 2024 02:34:24 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-381c10e734csm1554683f8f.60.2024.10.31.02.34.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 31 Oct 2024 02:34:23 -0700 (PDT)
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
X-Inumbo-ID: 50ef035a-976b-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDA6MTQ1MDo0ODY0OjIwOjoxMzIiLCJoZWxvIjoibWFpbC1sZjEteDEzMi5nb29nbGUuY29tIn0=
X-Custom-Transaction: eyJpZCI6IjUwZWYwMzVhLTk3NmItMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwMzY3MjY0LjgxNDIzLCJzZW5kZXIiOiJqYmV1bGljaEBzdXNlLmNvbSIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1730367264; x=1730972064; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=typLIZP/MMzWQHxa3dozJ8ah4urFEFoF37pwxUrpcoA=;
        b=ahx1y60ioLeE4c5KF5tI6iXszzrmT+GN25xlOvLG4IxxsWk96V7QMYOcWM8ZrtqLyc
         C2acGtcvYabnttLeygfd63tI8TcogApySvEEMyc4h7lWsqeHiu6OwFbWn+SLDEhnNuDy
         PKZXlMX4oRn1/NZLyvO6mPeJr1jbC2CRzwyMJYPslOA8KycRdpcg5PBTZsiqEFtmDGWb
         5JRn53QCBsSxdci5PI/XNtzaIvAKtGaUz8OICM9Fg7NQ3BzLM4IBPak9g/UhJTbf9Fsp
         Dj/a9oaQ8hie33mJS/jCEaIjZdpvKOlI7WT+xXsBd5doD+FGJcyAmCiN7FP7ogYixI35
         QRqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730367264; x=1730972064;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=typLIZP/MMzWQHxa3dozJ8ah4urFEFoF37pwxUrpcoA=;
        b=WGzUhrHAZCCZ1B4TOawjRXNR4xi4QoeMIlGUP/Bgd+Fvq308XxPfmWHJe754Sc4kAi
         6I12k8eH2YYWl8gIP03d2Nt59EQTPzSmrz5efJFGdoBtnTfzJxAs2wlwP4uf3swE/Neo
         vK5EL4FUuh391qEPiWaSBxrBro711jdf5XQbJamVxj34nB4nn/IOjk6Cxb3XYQPqsJNn
         78KaBmUWoVRaGhuuR44sPV+rwtMh6dWSdptlyd9u5q/FNV6+Lk4elAfYFrJ2xN/TtM52
         W1BV8sEomrDuslNafHUTafylGrqX1n1uvHfwYSMi+ivj/q/9MQk6V4bVp32FuIAafDt0
         s/vQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCO4wZwM0+PMen3PAP/I6iJ1xmpoO2lIr5ewvxffE9stxTFGd9FoX/QeLNYsCPpP7dHccEj/0w5Gg=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyMNDMUITjf/G0UxS/Q5DNMsrmiDO0mOE8OpO6IQ2TyF99vSBYU
	fFKtEWunXGr5Y1zXoXlPn/qgM+ATKU17vzN45T+Tl1uvqPbIx+gf6fNx4uWreA==
X-Google-Smtp-Source: AGHT+IEgayhKxHFJmNN6Ovp5H1MhTchYfR1FplToSOh7uzRgnNYn07QfVv8gUBESsjJ6nr7onJsvgA==
X-Received: by 2002:a05:6512:3b98:b0:539:fb56:7790 with SMTP id 2adb3069b0e04-53b348ec010mr10540758e87.6.1730367264068;
        Thu, 31 Oct 2024 02:34:24 -0700 (PDT)
Message-ID: <6461a47f-759a-4138-970c-4e5f68b07bae@suse.com>
Date: Thu, 31 Oct 2024 10:34:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen/common: Move gic_preinit() to common code
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
Cc: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <e906b538aba684ab108cc70e8c60ed35ddfad74e.1730292286.git.oleksii.kurochko@gmail.com>
Content-Language: en-US
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
In-Reply-To: <e906b538aba684ab108cc70e8c60ed35ddfad74e.1730292286.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 30.10.2024 14:14, Oleksii Kurochko wrote:
> Introduce ic_preinit() in the common codebase, as it is not
> architecture-specific and can be reused by both PPC and RISC-V.
> This function identifies the node with the interrupt-controller property
> in the device tree and calls device_init() to handle architecture-specific
> initialization of the interrupt controller.
> 
> Additionally, rename gic_acpi_preinit() to ic_acpi_preinit() as it is used
> by ic_preinit(), while keeping it defined in architecture-specific as this
> part is architecture-specific. In case if CONFIG_ACPI=n a stub for
> ic_acpi_preinit() is provided. To declaration/defintion of ic_acpi_preint()
> is added `inline` to deal with the compilation issue:
>   error: 'ic_acpi_preinit' defined but not used [-Werror=unused-function]
> 
> Make minor adjustments compared to the original ARM implementation of
> gic_dt_preinit():
>  - Remove the local rc variable in gic_dt_preinit() since it is only used once.
>  - Change the prefix from gic to ic to clarify that the function is not
>    specific to ARM’s GIC, making it suitable for other architectures as well.
> 
> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
> ---
> Changes in v2:
>  - Revert changes connected to moving of gic_acpi_preinit() to common code as
>    it isn't really architecture indepent part.
>  - Update the commit message.
>  - Move stub of ic_acpi_preinit() to <asm-generic/device.h> for the case when
>    CONFIG_ACPI=n.
> ---
>  xen/arch/arm/gic.c               | 45 +------------------------------
>  xen/arch/arm/setup.c             |  3 ++-
>  xen/common/device.c              | 46 ++++++++++++++++++++++++++++++++
>  xen/include/asm-generic/device.h | 10 +++++++
>  4 files changed, 59 insertions(+), 45 deletions(-)

Looks largely okay to me now, with a question and a nit at the bottom. The
question is mainly to Arm folks, where the code is coming from, and DT
maintainers: Is a file named device.c really an appropriate "home" for
IC-related code? If IC is a common thing in the DT world, would such code
maybe better live under common/device-tree/?

> --- a/xen/include/asm-generic/device.h
> +++ b/xen/include/asm-generic/device.h
> @@ -127,6 +127,16 @@ __section(".adev.info") = {                                         \
>  
>  #endif /* CONFIG_ACPI */
>  
> +void ic_preinit(void);
> +
> +#ifdef CONFIG_ACPI
> +void ic_acpi_preinit(void);
> +#else
> +#include <xen/init.h>
> +
> +static inline void __init ic_acpi_preinit(void) { }
> +#endif

I don't think there's a need to have __init on an empty inline stub. That'll
then also eliminate the need for the extra #include.

Jan

