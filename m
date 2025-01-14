Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9636AA10CB0
	for <lists+xen-devel@lfdr.de>; Tue, 14 Jan 2025 17:50:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.871572.1282552 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXk6m-00066Q-HM; Tue, 14 Jan 2025 16:49:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 871572.1282552; Tue, 14 Jan 2025 16:49:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tXk6m-000642-Eb; Tue, 14 Jan 2025 16:49:40 +0000
Received: by outflank-mailman (input) for mailman id 871572;
 Tue, 14 Jan 2025 16:49:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=/Vp6=UG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tXk6k-00063w-SX
 for xen-devel@lists.xenproject.org; Tue, 14 Jan 2025 16:49:38 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 89bc92b1-d297-11ef-99a4-01e77a169b0f;
 Tue, 14 Jan 2025 17:49:36 +0100 (CET)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-436ce2ab251so41316005e9.1
 for <xen-devel@lists.xenproject.org>; Tue, 14 Jan 2025 08:49:36 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e383965sm15589078f8f.31.2025.01.14.08.49.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Jan 2025 08:49:35 -0800 (PST)
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
X-Inumbo-ID: 89bc92b1-d297-11ef-99a4-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1736873376; x=1737478176; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=UZk66YKJtRTqx3KwmPWZCxM4nkt3s6xtpbLoFnnm1G8=;
        b=QQi6Lw9Zx+XliYPk1NE/8PRBn0MWDo7HeRpZUZUZ1JW8d8v5nd7Ilcq5+4vUu32IdL
         HgN/X1D/5IQdsrMCCkEJfzh/TREgqbloGuhAt/2KcMwv2qqTya2d6HoMFJwucwjSFH3z
         OEDpzsGskvx2wOMrfLUhsQsZH/Rb8TLRUGUzolkDc8rmSvuzNvCCWYe4X7rBfTyp7jt8
         MLhSFmln+3yMgVhK7wzM4ijSz3BxCNLabQ/24JpWDEqhrREHV3RPfP5vIRPCrS8dI2rg
         8if+f407VoLCUaLyXh6RfgAvINMF6YLMSurIqQT6pRynubuZpgEJeQcZwtRJWm2+IFDm
         iVAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736873376; x=1737478176;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UZk66YKJtRTqx3KwmPWZCxM4nkt3s6xtpbLoFnnm1G8=;
        b=uJnH2mKniWrLw7VnQjksAsPurHgK0+liZBtS5aJfULaVZCX6QghtGFBENryNNhejYq
         QQ0gcwSc1xGLX4pNqfy21467Lg1VJaHdtW5iFgGTv1na8onU470L/qjiSnEbZBhRMSK3
         M40/lsqbRpiOkaQWhM8mRfVhM7tnrZCFDwhSjd3TcOwrk/EBBpO1DEFSHP+SXTjZpChK
         pPWWs+lI2oficv227IxFM4opHK88uQzHYeCTijsQdDcYTxYZuERZYzx+Ka7l3wMbPjsG
         SbN/HmgxhIOstQgXpO27Ptl+MAtQjls8sdtATg170PqJUeEwCfVWjEwndw7zZf3piGFB
         91qg==
X-Forwarded-Encrypted: i=1; AJvYcCX3OmgTjf/onsM1Jn39AaMu+DPxWIB2+6gXABi7C1MmIXEjwGGZdqzo4kdKYVQVjy0ugRSQKm7GyHs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yzh6H2FT8433PXwd0NRZQAO+bty//5V6SFp4Ujuom4KJw4W+gH3
	SRuRL2m8upiYb/wHVSeuI5Gx+ElNGH9YtSZDaLkc/1lCD5Tz6VJRIoOUkheYXQ==
X-Gm-Gg: ASbGncuEzxl/WybEmYti9mxvuEoPCK9rAYOuTHlmZxi0tW9k2/8JqsKK6boYQTmTAyS
	N7bwpbpZqSH8niOVxEth4P0Yg53Am6AWFs7IKQUKIy5fWSq5SzbjhS/L1SyyEmlh5xmUoYz4lFg
	PqodbrH0u14Y6MsYI+NwGgGZxQKeVhI5f4jbyZ7Mme+v9a26VNIM+BcdiS363c1+9oQUk4cayHf
	P8ftaZQO1NLzzx4v7TLDfIgAXYw4gdHMPJsUkSvJMdfVqwYeE1IYirOIcHy2j+7FMahvDyIq0eU
	ASW/H6DmRltJ0VChjF/c5yp4v3MQbI9Tc+lGe0Qn4g==
X-Google-Smtp-Source: AGHT+IElQs/Bg5F1uMHJc19crJm0wlZXCUP+SpClRo3IEA7ZA69jF4bPJhjtmtMhf7aTJ5MxluIrmQ==
X-Received: by 2002:a05:600c:19ce:b0:42c:bb96:340e with SMTP id 5b1f17b1804b1-436e26f857fmr236536335e9.31.1736873375948;
        Tue, 14 Jan 2025 08:49:35 -0800 (PST)
Message-ID: <0ec9f311-803a-4af2-9b3e-7225fbbadfef@suse.com>
Date: Tue, 14 Jan 2025 17:49:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 02/10] x86: Define arch LBR feature bits
To: Tu Dinh <ngoc-tu.dinh@vates.tech>
Cc: Anthony PERARD <anthony.perard@vates.tech>,
 Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20250102084413.102-1-ngoc-tu.dinh@vates.tech>
 <20250102084413.102-3-ngoc-tu.dinh@vates.tech>
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
In-Reply-To: <20250102084413.102-3-ngoc-tu.dinh@vates.tech>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 02.01.2025 09:45, Tu Dinh wrote:
> --- a/xen/arch/x86/include/asm/cpufeature.h
> +++ b/xen/arch/x86/include/asm/cpufeature.h
> @@ -219,6 +219,11 @@ static inline bool boot_cpu_has(unsigned int feat)
>  #define cpu_has_rfds_no         boot_cpu_has(X86_FEATURE_RFDS_NO)
>  #define cpu_has_rfds_clear      boot_cpu_has(X86_FEATURE_RFDS_CLEAR)
>  
> +/* CPUID level 0x0000001c.eax */
> +
> +#define current_cpu_has_lbr_lip cpu_has(&current_cpu_data, \
> +                                        X86_FEATURE_LBR_LIP);

Why would this, unlike all other similar constructs, need to use
current_cpu_data rather than boot_cpu_has()? If there is a reason, it almost
certainly wants naming in the description.

> --- a/xen/include/public/arch-x86/cpufeatureset.h
> +++ b/xen/include/public/arch-x86/cpufeatureset.h
> @@ -284,7 +284,7 @@ XEN_CPUFEATURE(SERIALIZE,     9*32+14) /*A  SERIALIZE insn */
>  XEN_CPUFEATURE(HYBRID,        9*32+15) /*   Heterogeneous platform */
>  XEN_CPUFEATURE(TSXLDTRK,      9*32+16) /*a  TSX load tracking suspend/resume insns */
>  XEN_CPUFEATURE(PCONFIG,       9*32+18) /*   PCONFIG instruction */
> -XEN_CPUFEATURE(ARCH_LBR,      9*32+19) /*   Architectural Last Branch Record */
> +XEN_CPUFEATURE(ARCH_LBR,      9*32+19) /*s  Architectural Last Branch Record */

The 's' here (and below) may only be added once all of the respective handling is
complete.

> --- a/xen/include/xen/lib/x86/cpu-policy.h
> +++ b/xen/include/xen/lib/x86/cpu-policy.h
> @@ -22,6 +22,9 @@
>  #define FEATURESET_7d1       15 /* 0x00000007:1.edx    */
>  #define FEATURESET_m10Al     16 /* 0x0000010a.eax      */
>  #define FEATURESET_m10Ah     17 /* 0x0000010a.edx      */
> +#define FEATURESET_1Ca       18 /* 0x0000001c.eax      */
> +#define FEATURESET_1Cb       19 /* 0x0000001c.ebx      */
> +#define FEATURESET_1Cc       20 /* 0x0000001c.ecx      */
>  
>  struct cpuid_leaf
>  {
> @@ -85,7 +88,7 @@ unsigned int x86_cpuid_lookup_vendor(uint32_t ebx, uint32_t ecx, uint32_t edx);
>   */
>  const char *x86_cpuid_vendor_to_str(unsigned int vendor);
>  
> -#define CPUID_GUEST_NR_BASIC      (0xdu + 1)
> +#define CPUID_GUEST_NR_BASIC      (0x1cu + 1)

Are you sure this can be done with no other prep work? I've been sitting
on AMX and AVX10 patches where I need to bump this, too. Yet I continue
to think that something along the lines of the 3-patch series at [1] is
necessary up front.

> @@ -158,6 +161,52 @@ struct cpu_policy
>              uint64_t :64, :64; /* Leaf 0xb - Topology. */
>              uint64_t :64, :64; /* Leaf 0xc - rsvd */
>              uint64_t :64, :64; /* Leaf 0xd - XSTATE. */
> +
> +            uint64_t :64, :64; /* Leaf 0xe - rsvd */
> +            uint64_t :64, :64; /* Leaf 0xf - rsvd */
> +            uint64_t :64, :64; /* Leaf 0x10 - rsvd */
> +            uint64_t :64, :64; /* Leaf 0x11 - rsvd */
> +            uint64_t :64, :64; /* Leaf 0x12 - rsvd */
> +            uint64_t :64, :64; /* Leaf 0x13 - rsvd */
> +            uint64_t :64, :64; /* Leaf 0x14 - rsvd */
> +            uint64_t :64, :64; /* Leaf 0x15 - rsvd */
> +            uint64_t :64, :64; /* Leaf 0x16 - rsvd */
> +            uint64_t :64, :64; /* Leaf 0x17 - rsvd */
> +            uint64_t :64, :64; /* Leaf 0x18 - rsvd */
> +            uint64_t :64, :64; /* Leaf 0x19 - rsvd */
> +            uint64_t :64, :64; /* Leaf 0x1a - rsvd */
> +            uint64_t :64, :64; /* Leaf 0x1b - rsvd */
> +
> +            union {
> +                uint32_t _1Ca;
> +                struct {
> +                    uint32_t supported_depths:8;

According to XEN_CPUFEATURE(LBR_DEPTH_...) further up these are 8 individual
bits. Further, is there a reason you don't use here what the additions there
produce in the generated header, but you rather re-define the fields from
scratch?

Jan

[1] https://lists.xen.org/archives/html/xen-devel/2024-08/msg00591.html

