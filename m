Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B22DE87178E
	for <lists+xen-devel@lfdr.de>; Tue,  5 Mar 2024 09:06:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.688624.1073023 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhPnU-0002PH-6S; Tue, 05 Mar 2024 08:05:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 688624.1073023; Tue, 05 Mar 2024 08:05:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rhPnU-0002Mu-3t; Tue, 05 Mar 2024 08:05:12 +0000
Received: by outflank-mailman (input) for mailman id 688624;
 Tue, 05 Mar 2024 08:05:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Mek3=KL=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rhPnS-0002Mo-H8
 for xen-devel@lists.xenproject.org; Tue, 05 Mar 2024 08:05:10 +0000
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [2a00:1450:4864:20::636])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1401aac2-dac7-11ee-a1ee-f123f15fe8a2;
 Tue, 05 Mar 2024 09:05:06 +0100 (CET)
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-a4499ef8b5aso383143966b.0
 for <xen-devel@lists.xenproject.org>; Tue, 05 Mar 2024 00:05:06 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 pv25-20020a170907209900b00a3ee9305b02sm5717054ejb.20.2024.03.05.00.05.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Mar 2024 00:05:06 -0800 (PST)
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
X-Inumbo-ID: 1401aac2-dac7-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709625906; x=1710230706; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZppC4XnuYv6vFg7B59V/gfQbC07jiAGXp641l7cWU7E=;
        b=L8Ztma2gjG2oqJwxqvhGXBKeq2aPnw/F6BMNFYL44ngFIruf7jWVQqauMobF78zTKO
         6v188OHtRUcQEft3n91uE3/TA9bR8zDACtV9j0wliYSNvrUMAYE3JOGZoKnWKjtx7Hz/
         b1z8ZNXpCQS1uwlhDOivdZmOld/CfIgg4dXl80AAUJhKE9mh1Ag5yInOMESGOF7yB6zQ
         JKEIb5D1iF8RKKjr2Ali/u7nn1RBtEOyTgbgYsJhVwu6is+wTQXUvs9CSjWxQomYdmAV
         PYLZ75T0wB7mgi4y1E/LYtikwDP/1LRr8G5Ztl8DRWwPmLrvo0q3aq4/Kxe8h0RUPc0a
         ujwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709625906; x=1710230706;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZppC4XnuYv6vFg7B59V/gfQbC07jiAGXp641l7cWU7E=;
        b=vRKHHDkHsuIjEDf4NR2jHUwxpIdQ6GAilaPQV8DrHWbVfAwe9JmPe/9n86PLo1pDqK
         7b6MwDpR6jhWs3nLraEY3jatO+Dw9p3InQCorQ0RjCK0PaJcMP+7FydGJhCH+feMSARj
         4rk32S/v1IkVxZP9oiTaxo9OJ4mnZKJ4Q3USu8pBZTzbk6Nbd8tCg6CKBI8Xr4nbSMrM
         BxKumuoYrWdQjaQ7s7qFBYPrcAqa8bdrYvgDLx3SaxpXBL3lznE88iDVy24kkhtMxbhN
         /nWrR06657xylZWoZaBTx6+kFocFjGv3+HAelwF5usMrposIiOIQTIMzWmIHUR0G+pgH
         7XYw==
X-Forwarded-Encrypted: i=1; AJvYcCUuCTMGWw0855KHL1BSANbbBhpssJnViqiiVle3yoqtBJHQaH4U3XXtlv+n44CBZEsdWVGvf0dCoCZvnRigkVrK84mxFBAk6qVKSBNyD5E=
X-Gm-Message-State: AOJu0Yypjw+VzDGlpVhBX3tuxXSMqwVG9aDACRoqHo3ueupgjox/qjlo
	dQ5ghkLDZ1Fay6a9nX4LhO9c1px1yjPLtIwySVxCcHmpijlgvGfvpFTiskLm6A==
X-Google-Smtp-Source: AGHT+IFEqoW+Qa2czMVSnUt2/MnyfQBRNlJ37D7Km/QFaXOcEAClGka3Zab4bJVZJU5PgINg2AUHGw==
X-Received: by 2002:a17:906:7f0e:b0:a44:b91e:315a with SMTP id d14-20020a1709067f0e00b00a44b91e315amr6953008ejr.68.1709625906322;
        Tue, 05 Mar 2024 00:05:06 -0800 (PST)
Message-ID: <bd916469-f764-4d2e-bce6-52e3ed5e74d1@suse.com>
Date: Tue, 5 Mar 2024 09:05:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 18/23] xen/riscv: add minimal stuff to processor.h to
 build full Xen
Content-Language: en-US
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, xen-devel@lists.xenproject.org
References: <cover.1708962629.git.oleksii.kurochko@gmail.com>
 <4e1ee99a9ad71015b5e8860d20b63337b526d0e9.1708962629.git.oleksii.kurochko@gmail.com>
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
In-Reply-To: <4e1ee99a9ad71015b5e8860d20b63337b526d0e9.1708962629.git.oleksii.kurochko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.02.2024 18:39, Oleksii Kurochko wrote:
> --- /dev/null
> +++ b/docs/misc/riscv/booting.txt
> @@ -0,0 +1,8 @@
> +System requirements
> +===================
> +
> +The following extensions are expected to be supported by a system on which
> +Xen is run:
> +- Zihintpause:
> +  On a system that doesn't have this extension, cpu_relax() should be
> +  implemented properly. Otherwise, an illegal instruction exception will arise.

This decision wants justifying in the (presently once again empty) description.

Furthermore - will there really be an illegal instruction exception otherwise?
Isn't it the nature of hints that they are NOPs if not serving their designated
purpose?

> --- a/xen/arch/riscv/arch.mk
> +++ b/xen/arch/riscv/arch.mk
> @@ -5,6 +5,12 @@ $(call cc-options-add,CFLAGS,CC,$(EMBEDDED_EXTRA_CFLAGS))
>  
>  CFLAGS-$(CONFIG_RISCV_64) += -mabi=lp64
>  
> +ifeq ($(CONFIG_RISCV_64),y)
> +has_zihintpause = $(call as-insn,$(CC) -mabi=lp64 -march=rv64i_zihintpause, "pause",_zihintpause,)
> +else
> +has_zihintpause = $(call as-insn,$(CC) -mabi=ilp32 -march=rv32i_zihintpause, "pause",_zihintpause,)
> +endif

Considering that down the road likely more such tests will want adding, I think
this wants further abstracting for the rv32/rv64 difference (ideally in a way
that wouldn't make future RV128 wrongly and silently take the RV32 branch).
This would include eliminating the -mabi=lp64 redundancy with what's visible in
context, perhaps by way of introducing a separate helper macro, e.g.

riscv-abi-$(CONFIG_RISCV_32) := -mabi=ilp32
riscv-abi-$(CONFIG_RISCV_64) := -mabi=lp64

I further see nothing wrong with also using $(riscv-march-y) here. I.e.
overall

_zihintpause := $(call as-insn,$(CC) $(riscv-abi-y) $(riscv-march-y)_zihintpause,"pause",_zihintpause)

(still with potential of abstracting further through another macro such
that not every such construct would need to spell out the ABI and arch
compiler options).

Plus a macro named has_* imo can be expected to expand to y or n. I would
suggest to simply drop the "has", thus ...

> @@ -12,7 +18,7 @@ riscv-march-$(CONFIG_RISCV_ISA_C)       := $(riscv-march-y)c
>  # into the upper half _or_ the lower half of the address space.
>  # -mcmodel=medlow would force Xen into the lower half.
>  
> -CFLAGS += -march=$(riscv-march-y) -mstrict-align -mcmodel=medany
> +CFLAGS += -march=$(riscv-march-y)$(has_zihintpause) -mstrict-align -mcmodel=medany

... also making the use site look 

> --- a/xen/arch/riscv/include/asm/processor.h
> +++ b/xen/arch/riscv/include/asm/processor.h
> @@ -12,6 +12,9 @@
>  
>  #ifndef __ASSEMBLY__
>  
> +/* TODO: need to be implemeted */
> +#define smp_processor_id() 0
> +
>  /* On stack VCPU state */
>  struct cpu_user_regs
>  {
> @@ -53,6 +56,26 @@ struct cpu_user_regs
>      unsigned long pregs;
>  };
>  
> +/* TODO: need to implement */
> +#define cpu_to_core(cpu)   (0)
> +#define cpu_to_socket(cpu) (0)

Nit: Like above in smp_processor_id() no need for parentheses here.

> +static inline void cpu_relax(void)
> +{
> +#ifdef __riscv_zihintpause
> +    /*
> +     * Reduce instruction retirement.
> +     * This assumes the PC changes.

What is this 2nd sentence about?

> +     */
> +    __asm__ __volatile__ ( "pause" );
> +#else
> +    /* Encoding of the pause instruction */
> +    __asm__ __volatile__ ( ".insn 0x100000F" );

May I ask that you spell out the leading zero here, to make clear there
aren't, by mistake, one to few zeroes in the middle?

Jan

