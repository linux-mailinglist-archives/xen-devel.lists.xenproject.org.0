Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 033C8B07A91
	for <lists+xen-devel@lfdr.de>; Wed, 16 Jul 2025 18:02:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045432.1415555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc4am-0002c5-5F; Wed, 16 Jul 2025 16:02:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045432.1415555; Wed, 16 Jul 2025 16:02:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uc4am-0002aL-0O; Wed, 16 Jul 2025 16:02:48 +0000
Received: by outflank-mailman (input) for mailman id 1045432;
 Wed, 16 Jul 2025 16:02:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=L52i=Z5=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1uc4ak-0002aF-H1
 for xen-devel@lists.xenproject.org; Wed, 16 Jul 2025 16:02:46 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4f406156-625e-11f0-b894-0df219b8e170;
 Wed, 16 Jul 2025 18:02:44 +0200 (CEST)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3a507e88b0aso9010f8f.1
 for <xen-devel@lists.xenproject.org>; Wed, 16 Jul 2025 09:02:44 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23de435cb63sm126769965ad.235.2025.07.16.09.02.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jul 2025 09:02:42 -0700 (PDT)
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
X-Inumbo-ID: 4f406156-625e-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1752681764; x=1753286564; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=qimlHLhmhYpSOetFnlvFGqCSN6FNcPV6hqRWuJy3CCs=;
        b=X03jyNidYKist4az/Qj3nz53qhOc1gyBbgWTp8pgkbm4Jg7jSlUkuGSz72aBmE/tw4
         9+uv9zuq1OvedvkG2QisGEXWWa88eGJF0q9hNuPAxcQde7SFoOhUrn3gWuepZc/rE2pp
         EjHhG8X5insn7hqjv2G5r0u3dVc+sVG43vkZpAYUYO3KTJhYzkG78NnU6JSbfwpCn9Hr
         ATbV+Vp0LKbQUmq8UX/SleFpr2bOYHX4v92BWZngI70lYnFN9+EgGmu0CsEqCgIuVzFx
         BVwJUNuvtwMCtp9rz0RjYRjBaYd2cEJcim1l4d1xcPJzVMn5KRgfx2n+9DIIlzHff3eJ
         R7Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752681764; x=1753286564;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qimlHLhmhYpSOetFnlvFGqCSN6FNcPV6hqRWuJy3CCs=;
        b=ttcuQAHD624ecdR3HYsQi7P8D/+WHcm9PleXdwqaus5kncty6ubvPZG14rXJ8rPnJn
         Krt46S6+tdBOPQ0nJrK9Lmn5pyoOmU7tEFhKFsz2mJSi4kZrrXjp636JnMnQcIFxJXIP
         6UgTXDlNZE3sQZ+QzQwOfbrmd5D+5lAqWXLIutK7GYnz/xMf6pIa0xWkccwJBc9lFQoG
         ojn5ELq6wH9XR77fTiAcP53c0NcBekooooeZUDpzQ0+tS7N+muAbQeLfe7ztcpDQioh8
         DVXTM8UFmPkiU4ztFRC/P99cVCN1SAyxgJ187qj4jsLZflzVUkZPGtnnpXSBPa+BCZMa
         JsPw==
X-Forwarded-Encrypted: i=1; AJvYcCUraQC11HqEQatcyUSsFUuxEo6YJyZvcJTSzRnMEobIeD0+VsyBttakxY5OYLlbIgqywRCpXl95h1Q=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yy4FDeyAFQQCxzGF+rXdorGlGqSWymC801HAcECARldum2rOw3j
	S1hpgWS5bXSluaP6HOm+tiFRf16AVLDDtD30zyNZIOueE1pAoFT28sQZH0Adxt+cCQ==
X-Gm-Gg: ASbGncuW4u3xJ9p+FTxuy5LLJkmWvDRbmPNGApbn8oKn8ljBo/vxxb1pMOuFeO3Pal4
	/wBmfp6c6FxNtGq+PXeQlaLWcyXbxuBu1viNIlLB5GfpxYqEzwDQ2aW5Y51yKeiYKbGiJYxGqDy
	MsOIAMS2JNADPNYxKadb5H782Sp2l6B25BuvtHXXTp5vxp8lh8fpSCHtv3hL62aabtAi2wV1egl
	reK68qmj2SH+cbAO23KSjhD/C8ygDXu1NW0k+sr46FILIcOpPfOaeOWfl74qcbaIspSjmQK6sQy
	4xLmfV+ayKJzZYb4lcDb2MMRVQ6+SP7e8ZUA8Hurl5TVclpb4yflnkP9dcrVXENPWgV7Xfi8Zmi
	4MBmdGnTv3vqpxTEvbiQQgn4PZhlz+RPmBr+dYaGdd3bO4nNbvM7Szphf3iujnMOlnJkMwgg70C
	6D7zPCEOhDTniN/EPk9g==
X-Google-Smtp-Source: AGHT+IGdwdfSc5JwFKnlkjGEXtw4j4/+jTMDWxRlKqxM6XADLZztkJtCbR/HlA8Asnwn+QpWS6O89g==
X-Received: by 2002:a05:6000:1a85:b0:3a4:f744:e00e with SMTP id ffacd0b85a97d-3b60e4be7aemr2728858f8f.4.1752681763732;
        Wed, 16 Jul 2025 09:02:43 -0700 (PDT)
Message-ID: <b224ff70-f047-42c1-82ef-153fc87cce88@suse.com>
Date: Wed, 16 Jul 2025 18:02:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] x86: Rearrange struct cpuinfo_x86 to introduce a vfm
 field
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250716132843.2086965-1-andrew.cooper3@citrix.com>
 <20250716132843.2086965-2-andrew.cooper3@citrix.com>
 <9feece5c-4ca7-42b5-b41f-6d9843e07c21@suse.com>
 <0c8e178e-434e-4620-a79b-08bb55b848bd@citrix.com>
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
In-Reply-To: <0c8e178e-434e-4620-a79b-08bb55b848bd@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 16.07.2025 17:45, Andrew Cooper wrote:
> On 16/07/2025 2:47 pm, Jan Beulich wrote:
>> On 16.07.2025 15:28, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/include/asm/cpufeature.h
>>> +++ b/xen/arch/x86/include/asm/cpufeature.h
>>> @@ -20,10 +20,30 @@
>>>  #ifndef __ASSEMBLY__
>>>  
>>>  struct cpuinfo_x86 {
>>> -    unsigned char x86;                 /* CPU family */
>>> -    unsigned char x86_vendor;          /* CPU vendor */
>>> -    unsigned char x86_model;
>>> -    unsigned char x86_mask;
>>> +    /* TODO: Phase out the x86 prefixed names. */
>>> +    union {
>>> +        struct {
>>> +            union {
>>> +                uint8_t x86_model;
>>> +                uint8_t model;
>>> +            };
>>> +            union {
>>> +                uint8_t x86;
>>> +                uint8_t family;
>>> +            };
>>> +            union {
>>> +                uint8_t x86_vendor;
>>> +                uint8_t vendor;
>>> +            };
>>> +            uint8_t _rsvd;
>> Can we perhaps name this e.g. _zero, so it's clear that it cannot be
>> repurposed?
> 
> It can be repurposed; it just must be done in coordination with VFM_MAKE().

Hmm, true.

> I can add a comment to this effect, but it would need to be in the
> subsequent patch when VFM_MAKE() is introduced.

Okay, and thanks.

Jan

