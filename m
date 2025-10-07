Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C20BC201C
	for <lists+xen-devel@lfdr.de>; Tue, 07 Oct 2025 17:58:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1139111.1474657 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6A5E-0006b6-OB; Tue, 07 Oct 2025 15:58:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1139111.1474657; Tue, 07 Oct 2025 15:58:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v6A5E-0006ZE-L0; Tue, 07 Oct 2025 15:58:36 +0000
Received: by outflank-mailman (input) for mailman id 1139111;
 Tue, 07 Oct 2025 15:58:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=F9pE=4Q=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1v6A5C-0006Yr-Rx
 for xen-devel@lists.xenproject.org; Tue, 07 Oct 2025 15:58:34 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 797e711b-a396-11f0-9809-7dc792cee155;
 Tue, 07 Oct 2025 17:58:32 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-b3d80891c6cso1576266b.1
 for <xen-devel@lists.xenproject.org>; Tue, 07 Oct 2025 08:58:32 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b486a177c62sm1402099766b.91.2025.10.07.08.58.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Oct 2025 08:58:31 -0700 (PDT)
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
X-Inumbo-ID: 797e711b-a396-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1759852712; x=1760457512; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=BmmoY/YkVFQNLzbMzImKLD2GRD8bP6czsMMGveScBE8=;
        b=MER01rK+nBK5bbLWnQlFWALeomDUgPsCna2+0RI7dd3XOGQ0j9DOkiO6OG9qc0Gin1
         L/PjZXvu8ufpConLXUO4CNcy+bf7O+KnvGQ7Wg5WfaB5ZixX5r6+QMrcjMcTgVJwfRDK
         pJlFfKOaUbVSW2geVJuv6EqN/xFk7DwwH8Pb8qoScQr6YpSWR6UHHNqHfOGIDyQBoWhM
         zRHtFPCd9oerAs8QwJJL6P+Lm/Ay/lX70A5drACv4h1vamm+0orxS87k+q/fr3/y1lgM
         pZJZl9e8C4lr7w9Vgpkw6UWdmGUy0sN6iN9hD7UNmwk+PiwthArjmsfen6be+SK+pY4y
         bgug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759852712; x=1760457512;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BmmoY/YkVFQNLzbMzImKLD2GRD8bP6czsMMGveScBE8=;
        b=sgGJFiVFVyy3dtOC4SYvpurWhsylm/Fts6YlJSVnrbj2Qg5uAc0p+6dHnZlXdMXFUQ
         VokNno3GfA0RzIszYuSh2w7aRXvlqCpkjCB80BbdNIfBwwenrytJMWze0aFxQQZbEu5g
         NSviTkMZXYaD5kX5iQ8VerTTorY2eCHuZi31uu4yN4RHGAJJqaTVLHsM4tODKNFA53pA
         pr0qTou1BH1XkFyh2bSby5WJM059MwOPHTUoKRn+R6fYj9lkGmEdx8z64vPZszc/wRCf
         5a093YMz0m2dZP02md/cTBNkdRNQJwpGCX9RYh+VHMHP+V4K83JGoYJ6gg2sX/OHz+xJ
         z+Bg==
X-Forwarded-Encrypted: i=1; AJvYcCWjyMKI6PRzCVaA7lt+ETq6YddtRTqX121oVYjpNPsWXh3EBdi+N0KTNtxrJCM3ALUJIV3fZASc90I=@lists.xenproject.org
X-Gm-Message-State: AOJu0YyQ4yQ6QF4a8IP4a8yRCWRUWcz0ii7zurHdXNk7RNMKvHywXJrU
	n4+hU4IxVL9FY0O9LhgmXYUyza26MTzo8NxqwlGPSo3lVWhvubLJ6NjKTdNoRVknrw==
X-Gm-Gg: ASbGncvOmrCos6HMcBpTLMA9KBaSSLMwuf0FH9p4KCHV5Pk/R0RLA7Wo10t/kuWRaaW
	mOdoX+E9KRxThizpw0DIsbT4NBM1QDFRELoMW4dgJsRGqSvZchf5UlY7Rcr8zFUU0qQ5V1qCDO2
	MEWyWo2aBHDLV2c59OrXS6qYaWcS0xiyuGcFlCJlo8fGpx3LUIs9upx7DTCbDJntXs7G3MQhdRX
	fazw20Xpt5U6ivZ8ZKfp+IgsOspG5ndiPinD7Z1XXkUu46ohATpD/HRFrs5NK8g2JAWxasENlco
	CWwYJci6xZhcHaQYCQYSe8LZnp4wIEZVrKosAkV7rYDTYMd5bMi3nQx2hx9kil3quRdz8V8N8Gy
	j4heuv5oLMHmz3Hex/6qjYyplfP+hAeOgXbcnO14tLF3/NwhjWSeyaDl+k6PCBIRiNioF0cayG7
	SDPK0quY+jvK39TUmDCtD9LaFeNOfv5KI=
X-Google-Smtp-Source: AGHT+IEfKO5m0SS0FtnW6/2HjHJnWzRHq7ZjbMSOYu786RyM4sfkw2B/BMRbQTL0kh+PQkLrjQD3mA==
X-Received: by 2002:a17:907:c717:b0:b4c:629b:aa67 with SMTP id a640c23a62f3a-b4f43730a1dmr482237866b.32.1759852712244;
        Tue, 07 Oct 2025 08:58:32 -0700 (PDT)
Message-ID: <e314d193-79f2-4d77-a2ed-1590375b4b96@suse.com>
Date: Tue, 7 Oct 2025 17:58:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/22] x86/traps: Alter switch_stack_and_jump() for
 FRED mode
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251003225334.2123667-1-andrew.cooper3@citrix.com>
 <20251003225334.2123667-8-andrew.cooper3@citrix.com>
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
In-Reply-To: <20251003225334.2123667-8-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04.10.2025 00:53, Andrew Cooper wrote:
> FRED and IDT differ by a Supervisor Token on the base of the shstk.  This
> means that switch_stack_and_jump() needs to discard one extra word when FRED
> is active.
> 
> Fix a typo in the parameter name, which should be shstk_base.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> 
> Leave as $%c.  Otherwise it doesn't assemble correctly presented with $$24568
> to parse as an instruction immediate.

I don't follow. Where would the 2nd $ come from if you write ...

> --- a/xen/arch/x86/include/asm/current.h
> +++ b/xen/arch/x86/include/asm/current.h
> @@ -154,7 +154,9 @@ unsigned long get_stack_dump_bottom (unsigned long sp);
>      "rdsspd %[ssp];"                                            \
>      "cmp $1, %[ssp];"                                           \
>      "je .L_shstk_done.%=;" /* CET not active?  Skip. */         \
> -    "mov $%c[skstk_base], %[val];"                              \
> +    ALTERNATIVE("mov $%c[shstk_base], %[val];",                 \
> +                "mov $%c[shstk_base] + 8, %[val];",             \
> +                X86_FEATURE_XEN_FRED)                           \

    ALTERNATIVE("mov %[shstk_base], %[val];",                   \
                "mov %[shstk_base] + 8, %[val];",               \
                X86_FEATURE_XEN_FRED)                           \

Jan

