Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF53CAF32F
	for <lists+xen-devel@lfdr.de>; Tue, 09 Dec 2025 08:50:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1181209.1504294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSsTq-0006w1-0B; Tue, 09 Dec 2025 07:49:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1181209.1504294; Tue, 09 Dec 2025 07:49:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vSsTp-0006tr-SE; Tue, 09 Dec 2025 07:49:53 +0000
Received: by outflank-mailman (input) for mailman id 1181209;
 Tue, 09 Dec 2025 07:49:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=sSjK=6P=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vSsTo-0006tl-4b
 for xen-devel@lists.xenproject.org; Tue, 09 Dec 2025 07:49:52 +0000
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [2a00:1450:4864:20::334])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a40b0cb9-d4d3-11f0-b15b-2bf370ae4941;
 Tue, 09 Dec 2025 08:49:50 +0100 (CET)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-477632b0621so38026695e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 08 Dec 2025 23:49:50 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a7d70fa07sm25079445e9.11.2025.12.08.23.49.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Dec 2025 23:49:49 -0800 (PST)
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
X-Inumbo-ID: a40b0cb9-d4d3-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765266590; x=1765871390; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=+3r+atcXVEiS+kDducUz0JqOu8TMMBGGKW/R5/SLZ8g=;
        b=VVe43Liel5WwJ2i7EQJxBDagsd8sPjzYHh0VaMDu+ZNlBU+0Y7wHMety8u6gktlkHx
         NksQWFcCh0yvsqL6KhXv1aep/pg9qNRNhEv0K4qIDBHnjLF/3G1+OWbKdWJMV7ukqoyT
         2C6/y+cUO5YltU5HWzr/8hr6w3vEZBfXqRJxcLRKhSsUX2Exw9XkGJOex4qukKHd745I
         ZWm0UGXlwLNdxN7JsUKEJrKsBuWqZVKa6lGubY+kuZVLbkct/hXHEePuX/XqCc9M9xAY
         T1fHKxfBvxtTfxpv8IEVWxcsHEtMJ1zcuvKXAyJDrhCjJoTKhuBRPhy7BBhFjjwG4LUa
         dpCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765266590; x=1765871390;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+3r+atcXVEiS+kDducUz0JqOu8TMMBGGKW/R5/SLZ8g=;
        b=gsOmxnAFygLSsce6B6MOoKBrDk5MvSQUB4OyVcm6ykPawhp191Dp8xmID93LPtOauo
         a0dvDPlI9e+TbT1U6ByabbJGakJUEhXgKb7MsODP58rUJLYyOVNx9HPL0sorAhysRno4
         893KN5YS66/Y2NUecLP++v96e98FsiXw56fHQEgpWnSFJ3+e+/E/m63FKKjhhCN8Ngxo
         xJH1ivsZjQUNPQBiByM1se6nfVJ+zlGOLDQ7ekn/r30zgcNW/6jr3Zi6oOl81T/BR5Sz
         tdpHcHeZTkDayo4VTn1+rYn8/bFkfWjzrkBE4/q1Mndo5769RZL48rhgeC+ZI9TsTQ+7
         Xdbw==
X-Forwarded-Encrypted: i=1; AJvYcCWbYCUMLEor7qx1ejIBXdF/DWkDfu6mrEz9ULusaCywY+g04vtDqeBs2hfTPwEEqcedV8p/8B/p+78=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyRlH0XL2Qxz/DRtOkH3sH4K7kYzbEUgx6QAHlC4g2SnhOW3Thz
	ATymplKd5apmzSVgbI+VuZbeiLOSTE6Rbj0wpHmpMBDXKu4PJiH3Cu/dVeMEDV5Ozw==
X-Gm-Gg: ASbGncu0Ynh+6kXjN+5nhf/zdokbvs0OlNpEyOIuaU8s/G0+++Zupq2hwXOWlB0mniI
	iUyrZ3nSb4qTBq6425q01cxHWrGvpYqklfZTM4x4zEtHRU0+3TFyWGjW0W53fOrDcls8VKXETEX
	2s2nvzAzjydzzCN8SFadye2a6pj/fHaEmi9IAIWUvDPQpAKSNWDX+V0tQH7tsyHJTzRzmRlsL22
	yNucRa3D6YPcq0jccmJj8gHEwAN+7shRpTvH6jG9/CPPTrnSYdpJuEBd1w6nD2cYnqzulUVx0JG
	zJ0JGho6Kys/j8SnEYD2dbRC5Ztni6upUL6XsCGrXssvbbFbDbIkwdqTvmiSxA8hQuWFef4JI31
	tVxCC8sUq8A7jGMNgFBA+fKzOE8jg6cJ3Aw+EsR9keT4LFBLhp9OG6+m9qmi7HUxy39byFKUaTf
	Tx526RUC7L9n5wSEvTz5npg7QTgUGJRtWNAJhzlz4k/YL6jQ3kzn4K0fNDvy6dHjzUcGyI4hU7s
	jU=
X-Google-Smtp-Source: AGHT+IHE4I6HxVWWg1bmPHLKhGN+yac+uWKaYm7ARC+5RJCwRyLn4zBPcNpaHOkn8hYeQwI67pIBuA==
X-Received: by 2002:a05:600c:1992:b0:46e:1abc:1811 with SMTP id 5b1f17b1804b1-47939e387e2mr96149125e9.27.1765266589926;
        Mon, 08 Dec 2025 23:49:49 -0800 (PST)
Message-ID: <0b6b23ab-c683-4cd4-a95c-6892a2c1f164@suse.com>
Date: Tue, 9 Dec 2025 08:49:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm64: Add support Clang build on arm64
To: Saman Dehghan <samaan.dehghan@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 xen-devel@lists.xenproject.org
References: <bd6686e7fc0756e929334792b94ddd66bde125c4.1765239102.git.samaan.dehghan@gmail.com>
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
In-Reply-To: <bd6686e7fc0756e929334792b94ddd66bde125c4.1765239102.git.samaan.dehghan@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 09.12.2025 01:37, Saman Dehghan wrote:
> This patch enables building Xen on arm64 architecture using the Clang compiler.
> Changes include:
> - Add explicit -march=armv8 flag for arm64 builds.
> - Add `__attribute__((target("fp-armv8")))` to `vfp_save_state` and
>   `vfp_restore_state` functions when building with Clang to allow
>   FP instructions despite `-mgeneral-regs-only`.
> 
> Signed-off-by: Saman Dehghan <samaan.dehghan@gmail.com>
> ---
>  xen/arch/arm/arch.mk     | 1 +
>  xen/arch/arm/arm64/vfp.c | 6 ++++++
>  2 files changed, 7 insertions(+)

Please also update ./README then accordingly.

> --- a/xen/arch/arm/arm64/vfp.c
> +++ b/xen/arch/arm/arm64/vfp.c
> @@ -46,6 +46,9 @@ static inline void restore_state(const uint64_t *fpregs)
>                   : : "Q" (*fpregs), "r" (fpregs));
>  }
>  
> +#if defined(CONFIG_CC_IS_CLANG)
> +__attribute__((target("fp-armv8")))
> +#endif
>  void vfp_save_state(struct vcpu *v)
>  {
>      if ( !cpu_has_fp )
> @@ -62,6 +65,9 @@ void vfp_save_state(struct vcpu *v)
>          v->arch.vfp.fpexc32_el2 = READ_SYSREG(FPEXC32_EL2);
>  }
>  
> +#if defined(CONFIG_CC_IS_CLANG)
> +__attribute__((target("fp-armv8")))
> +#endif
>  void vfp_restore_state(struct vcpu *v)
>  {
>      if ( !cpu_has_fp )

Aren't it save_state() and restore_state() which actually use FP registers?
Applying such attributes in too wide a fashion risks the compiler using FP
registers also for other purposes. On x86 we were hit by such when we
suppressed use of SSE registers while not suppressing use of MMX ones. In
some configuration, after many years of this having gone fine, the compiler
chose to use MMX insns for some odd reason.

Seeing that save_state() and restore_state() are a single asm() statement
each, any reason not to actually have them in an assembly file, just like
their SVE counterparts are?

Jan

