Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4555B26B20
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 17:36:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1081950.1441916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umZzV-0003gV-8j; Thu, 14 Aug 2025 15:35:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1081950.1441916; Thu, 14 Aug 2025 15:35:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umZzV-0003eu-4y; Thu, 14 Aug 2025 15:35:45 +0000
Received: by outflank-mailman (input) for mailman id 1081950;
 Thu, 14 Aug 2025 15:35:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xqZt=22=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1umZzU-0003eo-4K
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 15:35:44 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5610e483-7924-11f0-b898-0df219b8e170;
 Thu, 14 Aug 2025 17:35:42 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-afca41c7d7fso349654066b.1
 for <xen-devel@lists.xenproject.org>; Thu, 14 Aug 2025 08:35:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a0df10asm2612037366b.59.2025.08.14.08.35.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Aug 2025 08:35:41 -0700 (PDT)
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
X-Inumbo-ID: 5610e483-7924-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755185741; x=1755790541; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=5actuKiRsrgN3UDhO2IKTu1ZOwv4i2IltujExJv2M6Y=;
        b=OgGgYz5dFTjbsVbUWiHHBUpOs/XGMSypMVzoREHEfKpyTOKC5LKQQhIl8argq2G7Dq
         Cl7ZKvE30w+2Gx0cVSd+sdN1Sz3Wize62NAIE59tQOXEf9wSIroV9v/TmWO2cFzFXGQK
         l8hzGUCYmhzKFe97xof8G158dIoQefrq1c9cwdiac2IFY5VZrZ2dn4uUtFlWQmoXNobT
         o06BIim1avuEJpzth5dJbbSlDrH9wzsyD4W5ElYIJRpApanIEAJ/KMtIT4vkNSKTC5Rw
         rFOtLdSuFt0i7MQZmpKR3BF6lUF0wlJBEB08gM7YLeDNKjc2ku7SPhI+gFs1hfSjJ0fP
         IMCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755185741; x=1755790541;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5actuKiRsrgN3UDhO2IKTu1ZOwv4i2IltujExJv2M6Y=;
        b=kDad6EhLAlNjdQdO9sdTn/FQWJbVgtUDOgKA4EPoDgCxnHrrhQqSB4Ps16Wt91Oy8k
         hG6D/t/ed7I+k4SGYtwv8sZ3wT5G7u3FYKKX0G0cIYUhqiwltVZfymsxkJ4q63OZ7sQO
         QfCIEluQg1gIrt9CSPypR+7x8PHxxuZaJQXipV1INpgg63D8S1zeSYMfBO0fxxh7ooNf
         ytdkQAzz4pQCE3+SouPK18m2EshCBTvDTpgZxjQRShgwzBwfO2UrhlulToUDs2+jLOM9
         M0R26ODA57XNsnfH0uHv0JeVHfbk2AwTh7MMxPJLqD2r7KCrs5Hny0jjqftVACBrkMJg
         J9Fw==
X-Forwarded-Encrypted: i=1; AJvYcCWnnhianRhTmRwJXroanFx29WMZ5WRN1swzqKZcQtFgJX9o6IPQ7xDgep1jdLkM5cNiO/sZg6gh/Bk=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwnHVcSCfRH0s39Hw4FTcGjrvHep+q9HpzdiEScUbyscm5KlZDn
	hBuZCkpudycQKWuR2NtArkW96HqJ1oJumZ8PoelvOkY8jzd0Hl/HzZmy42ena+LRKA==
X-Gm-Gg: ASbGncuytzvdBQ79LWqLHbF5cVqW2v/h75uDAsJbfv/nOsZrv60AXJnVbk65jH1ejF0
	JfDgVO6+oAR86r9Ke/yKMIykbBU+DoHVqVrH4VJ067K+06uhBgtwFta2mDrjM+B5y0igb31SoXr
	/75QH1mb8ljgcUt+IQxdQB9Je/CiHTHky/auQrUa0q+YwgFqh5UA02Ai3zrxYQ0bD0R5opJAejA
	k1f4cpFq+6U/faXVK6HaW8EAUk7jltbhuAo5EKjSUiJx8EyAmBQhXgjNLFFqvr4gHxxZaAYHIDA
	njr2vEINIoi4gp4AmLbzzraYdLBGEVGjHNmSwShFGmGDOhna/ps87AaVl3rxY62wCS0YdpzyRz7
	UD96Y1QLqvpopwEOszT3g4rKZGrpv561ZhjsRO46khXKaoQbEgryJ4LjLEhWgGyhCYoE1HKnYUa
	RaHCY4pznY86mYcTcJoQ==
X-Google-Smtp-Source: AGHT+IFbZBMkksT5RpiRsF62gYpSN46zi0ZXyaVntsbqrGRqM0a5C1QZK6Pb/BlAPW2SLXQyOFY5PA==
X-Received: by 2002:a17:906:d013:b0:ad8:91e4:a931 with SMTP id a640c23a62f3a-afcbe91fc5dmr214531466b.26.1755185741333;
        Thu, 14 Aug 2025 08:35:41 -0700 (PDT)
Message-ID: <7b46de92-d7b6-462f-8469-0f334d9e70bb@suse.com>
Date: Thu, 14 Aug 2025 17:35:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 20/22] x86/traps: Alter switch_stack_and_jump() for FRED
 mode
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
 <20250808202314.1045968-21-andrew.cooper3@citrix.com>
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
In-Reply-To: <20250808202314.1045968-21-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08.08.2025 22:23, Andrew Cooper wrote:
> FRED and IDT differ by a Supervisor Token on the base of the shstk.  This
> means that switch_stack_and_jump() needs to discard one extra word when FRED
> is active.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> 
> RFC.  I don't like this, but it does work.
> 
> This emits opt_fred logic outside of CONFIG_XEN_SHSTK.

opt_fred and XEN_SHSTK are orthogonal, so that's fine anyway. What I guess
you may mean is that you now have a shstk-related calculation outside of
a respective #ifdef. Given the simplicity of the calculation, ...

>  But frankly, the
> construct is already too unweildly, and all options I can think of make it
> moreso.

... I agree having it like this is okay.

> @@ -154,7 +155,6 @@ unsigned long get_stack_dump_bottom (unsigned long sp);
>      "rdsspd %[ssp];"                                            \
>      "cmp $1, %[ssp];"                                           \
>      "je .L_shstk_done.%=;" /* CET not active?  Skip. */         \
> -    "mov $%c[skstk_base], %[val];"                              \
>      "and $%c[stack_mask], %[ssp];"                              \
>      "sub %[ssp], %[val];"                                       \
>      "shr $3, %[val];"                                           \

With the latter two insns here, ...

> @@ -177,6 +177,8 @@ unsigned long get_stack_dump_bottom (unsigned long sp);
>  
>  #define switch_stack_and_jump(fn, instr, constr)                        \
>      ({                                                                  \
> +        unsigned int token_offset =                                     \
> +            (PRIMARY_SHSTK_SLOT + 1) * PAGE_SIZE - (opt_fred ? 0 : 8);  \
>          unsigned int tmp;                                               \
>          BUILD_BUG_ON(!ssaj_has_attr_noreturn(fn));                      \
>          __asm__ __volatile__ (                                          \
> @@ -184,12 +186,11 @@ unsigned long get_stack_dump_bottom (unsigned long sp);
>              "mov %[stk], %%rsp;"                                        \
>              CHECK_FOR_LIVEPATCH_WORK                                    \
>              instr "[fun]"                                               \
> -            : [val] "=&r" (tmp),                                        \
> +            : [val] "=r" (tmp),                                         \

... I don't think you can legitimately drop the & from here? With it
retained:
Reviewed-by: Jan Beulich <jbeulich@suse.com>

Jan

