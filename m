Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE6D8CE129
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2024 08:50:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.729092.1134224 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAOkO-0002iF-QB; Fri, 24 May 2024 06:49:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 729092.1134224; Fri, 24 May 2024 06:49:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAOkO-0002gI-NL; Fri, 24 May 2024 06:49:48 +0000
Received: by outflank-mailman (input) for mailman id 729092;
 Fri, 24 May 2024 06:49:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=s7SU=M3=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sAOkN-0002g4-9H
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 06:49:47 +0000
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [2a00:1450:4864:20::630])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ce304178-1999-11ef-b4bb-af5377834399;
 Fri, 24 May 2024 08:49:45 +0200 (CEST)
Received: by mail-ej1-x630.google.com with SMTP id
 a640c23a62f3a-a5a4bc9578cso1205498666b.2
 for <xen-devel@lists.xenproject.org>; Thu, 23 May 2024 23:49:45 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a626c93a807sm78653366b.85.2024.05.23.23.49.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 May 2024 23:49:44 -0700 (PDT)
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
X-Inumbo-ID: ce304178-1999-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716533385; x=1717138185; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FnPAIiIXWxMiuZAd3kSHvNQulM6dhBK4pPIRRxXJNMM=;
        b=TLQ5h6KSUJYuZ0KAIh9gdMKbb3hKpCYapR6kolUjfVj3OiMxIcOPmbCuL0YhlIb3l5
         wCHY83TIMNkwrVhG6qFxcLHQ/xj4nSep17S5OWMJoaCX71Yz8REiUXcz2f0jlVs0/zBA
         NWmjnhlHqOLF4rGCWKhFLfEQ9fJmfONVmg3aK1joETpNndNc0oZCLjd9hFwCxUOMsqmF
         6cPiLIBP0Slssgyicq9rhYfan/x/IzIVk8jjRmMGv4vTKIrXkFlyEg/OxyrjA6U5NgA5
         Fc0GkbQZKzgFuuJG60ghkwYn2RAf4FffRJydCxBqPMdjPLeW3Lgzqx3STR7xS/yaaF1S
         1w+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716533385; x=1717138185;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FnPAIiIXWxMiuZAd3kSHvNQulM6dhBK4pPIRRxXJNMM=;
        b=BsoSlCuGWCtvPqC2dcbvzLctAJu103CdY2SbtsCzZ1jkqKmW8pMTR3y6MhQiVpZg/b
         mo8FyLh1eUhcWAYFnlB2HO5UkJzbiIZ6f3UsoJtUdRwtocR4b2NE5YAM01SGDGsG0y31
         WGo5wN/sMb35o+JTTm3aWpzGMSO7UbdmVOflXToOKK2D7Y4Hau/VQbM2p+8J+l7+1TiA
         1hIDiNXMX/zMqYhl86GZdeU+1C1xF0jJ8P7VimZifTqCc+eeZ0w6mbVVWErKMzoTq4mX
         G3R9bRxgv6r6vW7JUkzwvIaYjlPE9T8FGTB5d8Eh0Wm+Pek3YdDEzm69NLMuOyRlBhtk
         /SgA==
X-Forwarded-Encrypted: i=1; AJvYcCUSTpWA9KtQ6RyJVtrHm6LYp5/GEoW2BoFDqY86preyN3Qm+iY2pDFbj96G7cLhxQE2MmKD689QKo8VTfgh5HVf5y71cLgWpPkSyPJZVr0=
X-Gm-Message-State: AOJu0YyAxlwtvDa8A/qgeXVxSdw3BukGJ1SGD0CP2TEHij/+Tzd7VxwO
	HGHmBzP/I7+XJTHANO9DuMQm7ujRubHa0cuBrrVewGoslb68H7ducDqzUEtHEw==
X-Google-Smtp-Source: AGHT+IHEgyKuceJTC55l+lQaiejqdPEnqPBG7f3Ac6quwNXjgIp9yfMmsaZ/bdVoaeeVRrjHcfthiQ==
X-Received: by 2002:a17:906:2ada:b0:a59:c941:e5e5 with SMTP id a640c23a62f3a-a62646d5a8amr124102066b.45.1716533384790;
        Thu, 23 May 2024 23:49:44 -0700 (PDT)
Message-ID: <7caffe42-3fa2-406d-94f0-fce21b44d52b@suse.com>
Date: Fri, 24 May 2024 08:49:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 07/15] x86: guard cpu_has_{svm/vmx} macros with
 CONFIG_{SVM/VMX}
Content-Language: en-US
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Sergiy Kibrik <sergiy_kibrik@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>, xen-devel@lists.xenproject.org
References: <cover.1715761386.git.Sergiy_Kibrik@epam.com>
 <09f1336974c8fd2f788fe8e1d3ca5fee91da5a81.1715761386.git.Sergiy_Kibrik@epam.com>
 <a881c6a6-2c36-4e5c-8336-21cd0e14b873@suse.com>
 <4b02bf84-0d81-467e-8577-f33dbfb71e8f@epam.com>
 <201c4e7f-c493-4156-a855-b2207107e6c4@suse.com>
 <alpine.DEB.2.22.394.2405231634290.2557291@ubuntu-linux-20-04-desktop>
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
In-Reply-To: <alpine.DEB.2.22.394.2405231634290.2557291@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 24.05.2024 01:36, Stefano Stabellini wrote:
> On Thu, 23 May 2024, Jan Beulich wrote:
>> On 23.05.2024 15:07, Sergiy Kibrik wrote:
>>> 16.05.24 14:12, Jan Beulich:
>>>> On 15.05.2024 11:12, Sergiy Kibrik wrote:
>>>>> --- a/xen/arch/x86/include/asm/cpufeature.h
>>>>> +++ b/xen/arch/x86/include/asm/cpufeature.h
>>>>> @@ -81,7 +81,8 @@ static inline bool boot_cpu_has(unsigned int feat)
>>>>>   #define cpu_has_sse3            boot_cpu_has(X86_FEATURE_SSE3)
>>>>>   #define cpu_has_pclmulqdq       boot_cpu_has(X86_FEATURE_PCLMULQDQ)
>>>>>   #define cpu_has_monitor         boot_cpu_has(X86_FEATURE_MONITOR)
>>>>> -#define cpu_has_vmx             boot_cpu_has(X86_FEATURE_VMX)
>>>>> +#define cpu_has_vmx             ( IS_ENABLED(CONFIG_VMX) && \
>>>>> +                                  boot_cpu_has(X86_FEATURE_VMX))
>>>>>   #define cpu_has_eist            boot_cpu_has(X86_FEATURE_EIST)
>>>>>   #define cpu_has_ssse3           boot_cpu_has(X86_FEATURE_SSSE3)
>>>>>   #define cpu_has_fma             boot_cpu_has(X86_FEATURE_FMA)
>>>>> @@ -109,7 +110,8 @@ static inline bool boot_cpu_has(unsigned int feat)
>>>>>   
>>>>>   /* CPUID level 0x80000001.ecx */
>>>>>   #define cpu_has_cmp_legacy      boot_cpu_has(X86_FEATURE_CMP_LEGACY)
>>>>> -#define cpu_has_svm             boot_cpu_has(X86_FEATURE_SVM)
>>>>> +#define cpu_has_svm             ( IS_ENABLED(CONFIG_SVM) && \
>>>>> +                                  boot_cpu_has(X86_FEATURE_SVM))
>>>>>   #define cpu_has_sse4a           boot_cpu_has(X86_FEATURE_SSE4A)
>>>>>   #define cpu_has_xop             boot_cpu_has(X86_FEATURE_XOP)
>>>>>   #define cpu_has_skinit          boot_cpu_has(X86_FEATURE_SKINIT)
>>>>
>>>> Hmm, leaving aside the style issue (stray blanks after opening parentheses,
>>>> and as a result one-off indentation on the wrapped lines) I'm not really
>>>> certain we can do this. The description goes into detail why we would want
>>>> this, but it doesn't cover at all why it is safe for all present (and
>>>> ideally also future) uses. I wouldn't be surprised if we had VMX/SVM checks
>>>> just to derive further knowledge from that, without them being directly
>>>> related to the use of VMX/SVM. Take a look at calculate_hvm_max_policy(),
>>>> for example. While it looks to be okay there, it may give you an idea of
>>>> what I mean.
>>>>
>>>> Things might become better separated if instead for such checks we used
>>>> host and raw CPU policies instead of cpuinfo_x86.x86_capability[]. But
>>>> that's still pretty far out, I'm afraid.
>>>
>>> I've followed a suggestion you made for patch in previous series:
>>>
>>> https://lore.kernel.org/xen-devel/8fbd604e-5e5d-410c-880f-2ad257bbe08a@suse.com/
>>
>> See the "If not, ..." that I had put there. Doing the change just mechanically
>> isn't enough, you also need to make clear (in the description) that you
>> verified it's safe to have this way.
> 
> What does it mean to "verified it's safe to have this way"? "Safe" in
> what way?

"Safe" as in "not breaking existing logic", anywhere.

Jan

