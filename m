Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F074A8ACEEC
	for <lists+xen-devel@lfdr.de>; Mon, 22 Apr 2024 16:00:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.709970.1109026 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ryuD3-0003bk-0P; Mon, 22 Apr 2024 13:59:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 709970.1109026; Mon, 22 Apr 2024 13:59:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ryuD2-0003aE-Tp; Mon, 22 Apr 2024 13:59:52 +0000
Received: by outflank-mailman (input) for mailman id 709970;
 Mon, 22 Apr 2024 13:59:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jl0+=L3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ryuD1-0003a8-CE
 for xen-devel@lists.xenproject.org; Mon, 22 Apr 2024 13:59:51 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 95cb5b66-00b0-11ef-909a-e314d9c70b13;
 Mon, 22 Apr 2024 15:59:50 +0200 (CEST)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-41a5b68ed4fso7281505e9.0
 for <xen-devel@lists.xenproject.org>; Mon, 22 Apr 2024 06:59:50 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 j10-20020a05600c190a00b00418a9961c47sm16801530wmq.47.2024.04.22.06.59.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Apr 2024 06:59:49 -0700 (PDT)
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
X-Inumbo-ID: 95cb5b66-00b0-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1713794389; x=1714399189; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eYJJmjsyepsIcZxzQDBxZkzN419rG27gTOdZzex/0H0=;
        b=Z7DmbBazNA5Xy5swGYQX5j/VkItNXPB1qqteY1nTxgI+f+CpRP2Ox+LjWc0hTcH0KN
         fp/IhGUbHg479PhCwDaYIQyhOTZmXfBCp6286X74oGpIBBkLneTTW3wHgvhnoMEiImU5
         Ue7wWKhsvp+uIv/ZhLVwcUCir46a7psGvH6jTaQhT9upX7jQC1fCUCoX/Ydlle5KYnKv
         kwqx/WUlgNbJeAnHJXCebScjzGFkG12ady2BGR/whH5hbH/CpG9BjItiFo7D4l6dg6CH
         u8UgIKKVRan3vfXvkhO+3whnr7xgPKv+r5kiqNp4yefCc5j2yd2Syy9uLqrxICODomlX
         3now==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713794389; x=1714399189;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eYJJmjsyepsIcZxzQDBxZkzN419rG27gTOdZzex/0H0=;
        b=wfGy726qcEwMmAU9hXmhv86FsO3lk49SClkBHp8skScAtI1aSMA0HQzpeugMwG72uQ
         axFdmuPFD/CUQXC1YoBaRRCFc3dLDS/hAAeYGDKDViuCCCTAHy39t0E21qTNGFr56384
         qcOwbUkInmnUMDxDc2vB5bOgbX/FqtRcOL4UuHFxLWa2AwZTR289fcaRqAbVVjpPbiyT
         4kG5KmMGTfs7FXFjw1rnQRV/6MWI2VBOPP4XwIUffy1Vqf/No0l0brYCs1jZ0XelRcxM
         B3HWXdxJ6rzvkCxFQ7djV47BwEVxos4Xgh5qPSr6a775ZBmyJ/SbsGAqBHaVVWbIYihk
         RFYg==
X-Gm-Message-State: AOJu0YyHfKUJexpThT+W8jS0KEEXz76fAioUEHAwpeXe+LR7Sj3oYjaE
	ySLg/+3drSNPTXVndgDckQO1VkVw8Hmw8sAPbEFrjjHUwTwsohdOmpv16rrqww==
X-Google-Smtp-Source: AGHT+IHdsCeGv8F0jyKQ1wKCItqx2jatYN23hf8rPLvG6BBB3iU7FyDX+N0zVPmV5jMI1s8uU6YsPQ==
X-Received: by 2002:a05:600c:3b0f:b0:418:9713:866c with SMTP id m15-20020a05600c3b0f00b004189713866cmr5695776wms.5.1713794389509;
        Mon, 22 Apr 2024 06:59:49 -0700 (PDT)
Message-ID: <5df4d9d1-bec3-4798-9664-a4c75817a766@suse.com>
Date: Mon, 22 Apr 2024 15:59:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] x86/spec: adjust logic to logic that elides lfence
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org
References: <20240418155208.7771-1-roger.pau@citrix.com>
 <20240418155208.7771-3-roger.pau@citrix.com>
 <26b9cbda-4f9b-4ddf-ab27-643e6f78b076@suse.com> <ZiZno9TUAG_gaqXg@macbook>
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
In-Reply-To: <ZiZno9TUAG_gaqXg@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 22.04.2024 15:35, Roger Pau Monné wrote:
> On Fri, Apr 19, 2024 at 08:25:00AM +0200, Jan Beulich wrote:
>> On 18.04.2024 17:52, Roger Pau Monne wrote:
>>> --- a/xen/arch/x86/include/asm/cpufeature.h
>>> +++ b/xen/arch/x86/include/asm/cpufeature.h
>>> @@ -235,9 +235,6 @@ static inline bool boot_cpu_has(unsigned int feat)
>>>  #define cpu_bug_fpu_ptrs        boot_cpu_has(X86_BUG_FPU_PTRS)
>>>  #define cpu_bug_null_seg        boot_cpu_has(X86_BUG_NULL_SEG)
>>>  
>>> -#define cpu_has_bhb_seq        (boot_cpu_has(X86_SPEC_BHB_TSX) ||       \
>>> -                                boot_cpu_has(X86_SPEC_BHB_LOOPS))
>>
>> Might be worth also mentioning in the description that this construct was
>> lacking use of X86_SPEC_BHB_LOOPS_LONG (might even warrant a 2nd Fixes:
>> tag).
> 
> Heh, no, X86_SPEC_BHB_LOOPS_LONG is added in addition to
> X86_SPEC_BHB_LOOPS.   When using long loops we have both
> X86_SPEC_BHB_LOOPS and X86_SPEC_BHB_LOOPS_LONG set (I know it's
> confusing, I was also confused the first time and asked Andrew the
> same question).  See the fallthrough in bhi_calculations().

Oh, I see.

Andrew: This is a very good example of the separating blank line being
misleading when fall-through is intended.

Jan

