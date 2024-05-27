Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 516C98CFE59
	for <lists+xen-devel@lfdr.de>; Mon, 27 May 2024 12:49:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.730670.1135829 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBXur-0003H1-GA; Mon, 27 May 2024 10:49:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 730670.1135829; Mon, 27 May 2024 10:49:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sBXur-0003EK-Ce; Mon, 27 May 2024 10:49:21 +0000
Received: by outflank-mailman (input) for mailman id 730670;
 Mon, 27 May 2024 10:49:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O60l=M6=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sBXuq-0003EE-6x
 for xen-devel@lists.xenproject.org; Mon, 27 May 2024 10:49:20 +0000
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [2a00:1450:4864:20::62c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c4d662cd-1c16-11ef-90a1-e314d9c70b13;
 Mon, 27 May 2024 12:49:19 +0200 (CEST)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a61b70394c0so903218666b.1
 for <xen-devel@lists.xenproject.org>; Mon, 27 May 2024 03:49:19 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a626c818362sm479015566b.34.2024.05.27.03.49.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 May 2024 03:49:18 -0700 (PDT)
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
X-Inumbo-ID: c4d662cd-1c16-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716806958; x=1717411758; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8dvO+/8haWXIPjweNYb9W8ujvzQUrct9skr+FbumigQ=;
        b=FAtvIyG8OijPeGZR2vHm70j91oPDwAzHjUwMrh+DCnThIaAcBn2z1/LTG0ekFMnofX
         qe8DFk9YlPuQFTo4IqHkON3l6ENbqIChL3yZ4yRx0zdkJjlLUKOJAQS5lFxWuy1+GvKJ
         3A7dRCvenmQgqeFXLp251CnRzAXNDLiK2EZD8T8xyEYntowpdmk6b/zgj2jZoHM6n7AZ
         3h1AdqOIN47acPfmZvz7E+Lmv2Oxyn0UHSrknBfrsKCS9kQnxKIlbj4dQ5CCjI3OXOvu
         ZMlciwGw8aHWmfMWx1umgKFldrp49vjftC4WiWQO53Cd2iA9xhg+OeITtEey3cuLi3kw
         pV0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716806958; x=1717411758;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8dvO+/8haWXIPjweNYb9W8ujvzQUrct9skr+FbumigQ=;
        b=J4FcEvEg3ZwA43aHxaczfRHee3hKLllCqO1k/7mg+cudfQL0dOnCbgKxHPYOFLnRWL
         f6R3VBmcTGZoOPlbSlF0KEBhEKE5wevu/PPBzhHJFsrBXDbCtyCwPOTV8l9XNAIYEgb5
         xulY+y70DHmPLDexLvKPXvWAzUb2E/BhdHWHyTvbS6JRpKyoQ0as2MFIquSnTjDXJjVw
         A2iGwXKgNsc3S2P/r6FxNUav5k4MbFOilqgkp6/W517my9z3wTHGH6vf4ZsXu1XtgGcW
         tNIlL+br2x4gsGrDel+SAN55g3VNF3Jkh4j1yfNkViEm+m5UcH2Kp6yxjMzn8i0LIAGm
         za1w==
X-Forwarded-Encrypted: i=1; AJvYcCUMG3Nc4WFJTP3sc1myx+ypxclkfQJUW9Ar7Pj9l+3iyiTupLKaY6bMC877vCmeHsQ5qvWMf7pgCE9BYmN5o5GQ/njFqZqwqLQh0PRkiWY=
X-Gm-Message-State: AOJu0Yz58NCUXVANHftC7L4xhkFygwlwqnZDY99o2ZRachJbc0TdDH4g
	u4Ku9MDfhrIrAbUhPJ0MU2h5lSl4T5pMjKRKPuNxMoQjm1Mwk1mn4erYC0omqcehAh88W7J8CjI
	=
X-Google-Smtp-Source: AGHT+IFNPnrVTZsmXBSmjLfqrz6gNHNFefuMq9DDR/uKlpOFez43acCnEwchlG3eOb3DkfQP04jX0w==
X-Received: by 2002:a17:906:2890:b0:a62:2ef9:13d with SMTP id a640c23a62f3a-a626308f5cbmr602170466b.0.1716806958281;
        Mon, 27 May 2024 03:49:18 -0700 (PDT)
Message-ID: <a695f51e-aaaf-4132-bbf5-d7d108cdc37a@suse.com>
Date: Mon, 27 May 2024 12:49:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 07/15] x86: guard cpu_has_{svm/vmx} macros with
 CONFIG_{SVM/VMX}
Content-Language: en-US
To: Sergiy Kibrik <sergiy_kibrik@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>, xen-devel@lists.xenproject.org
References: <cover.1715761386.git.Sergiy_Kibrik@epam.com>
 <09f1336974c8fd2f788fe8e1d3ca5fee91da5a81.1715761386.git.Sergiy_Kibrik@epam.com>
 <a881c6a6-2c36-4e5c-8336-21cd0e14b873@suse.com>
 <4b02bf84-0d81-467e-8577-f33dbfb71e8f@epam.com>
 <201c4e7f-c493-4156-a855-b2207107e6c4@suse.com>
 <0b2292da-a68f-4608-93a1-bbf54611e3e1@epam.com>
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
In-Reply-To: <0b2292da-a68f-4608-93a1-bbf54611e3e1@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 27.05.2024 12:27, Sergiy Kibrik wrote:
> 23.05.24 17:50, Jan Beulich:
>> On 23.05.2024 15:07, Sergiy Kibrik wrote:
>>> 16.05.24 14:12, Jan Beulich:
>>>> On 15.05.2024 11:12, Sergiy Kibrik wrote:
>>>>> --- a/xen/arch/x86/include/asm/cpufeature.h
>>>>> +++ b/xen/arch/x86/include/asm/cpufeature.h
>>>>> @@ -81,7 +81,8 @@ static inline bool boot_cpu_has(unsigned int feat)
>>>>>    #define cpu_has_sse3            boot_cpu_has(X86_FEATURE_SSE3)
>>>>>    #define cpu_has_pclmulqdq       boot_cpu_has(X86_FEATURE_PCLMULQDQ)
>>>>>    #define cpu_has_monitor         boot_cpu_has(X86_FEATURE_MONITOR)
>>>>> -#define cpu_has_vmx             boot_cpu_has(X86_FEATURE_VMX)
>>>>> +#define cpu_has_vmx             ( IS_ENABLED(CONFIG_VMX) && \
>>>>> +                                  boot_cpu_has(X86_FEATURE_VMX))
>>>>>    #define cpu_has_eist            boot_cpu_has(X86_FEATURE_EIST)
>>>>>    #define cpu_has_ssse3           boot_cpu_has(X86_FEATURE_SSSE3)
>>>>>    #define cpu_has_fma             boot_cpu_has(X86_FEATURE_FMA)
>>>>> @@ -109,7 +110,8 @@ static inline bool boot_cpu_has(unsigned int feat)
>>>>>    
>>>>>    /* CPUID level 0x80000001.ecx */
>>>>>    #define cpu_has_cmp_legacy      boot_cpu_has(X86_FEATURE_CMP_LEGACY)
>>>>> -#define cpu_has_svm             boot_cpu_has(X86_FEATURE_SVM)
>>>>> +#define cpu_has_svm             ( IS_ENABLED(CONFIG_SVM) && \
>>>>> +                                  boot_cpu_has(X86_FEATURE_SVM))
>>>>>    #define cpu_has_sse4a           boot_cpu_has(X86_FEATURE_SSE4A)
>>>>>    #define cpu_has_xop             boot_cpu_has(X86_FEATURE_XOP)
>>>>>    #define cpu_has_skinit          boot_cpu_has(X86_FEATURE_SKINIT)
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
> [..]
>>
>> See the "If not, ..." that I had put there. Doing the change just mechanically
>> isn't enough, you also need to make clear (in the description) that you
>> verified it's safe to have this way.
>>
>>> yet if this approach can potentially be unsafe (I'm not completely sure
>>> it's safe), should we instead fallback to the way it was done in v1
>>> series? I.e. guard calls to vmx/svm-specific calls where needed, like in
>>> these 3 patches:
>>>
> [..]
>>
>> I don't like this sprinkling around of IS_ENABLED() very much. Maybe we want
>> to have two new helpers (say using_svm() and using_vmx()), to be used in place
>> of most but possibly not all cpu_has_{svm,vmx}? Doing such a transformation
>> would then kind of implicitly answer the safety question above, as at every
>> use site you'd need to judge whether the replacement is correct. If it's
>> correct everywhere, the construct(s) as proposed in this version could then be
>> considered to be used in this very shape (instead of introducing the two new
>> helpers). But of course the transition could also be done gradually then,
>> touching only those uses that previously you touched in 1), 2), and 3).
>>
> 
> now I might be seeing your concerns, if I understood correctly, 
> situation is the following.
> 
>   As an example of cpu_has_vmx macro, it can be used to prove either of 
> following two statements: 1) VMX features can be used or 2) CPU provides 
> VMX features.
> Currently they're the same for Xen, yet after this patch series they're 
> not, as the situation possible when non-vmx build would be able to get 
> executed on vmx-enabled machine. E.g. the case of PV guest, or (if that 
> makes any sense) at least hypervisor's code is still able to run until 
> HVM guest has to be created. Changes in this patch makes 
> indistinguishable for a user whether VMX support is absent in code or in 
> hardware -- hence we may need two separate macros for these.
> 
> Still the question remains whether a separate macro to check if CPU 
> provides VMX/SVM is really needed at all at this point.
> 
> I've counted only 16 uses of cpu_has_vmx in the code, not that much to 
> check every one of them, so I did that.
> Most of uses are obviously checks before using vmx features, so logic 
> not broken.
> As for the others, the surrounding context presumes that HVM domain 
> required there or had already been created. But non-vmx build can't 
> create HVM VMX domain anyway, so the logic not broken either.
> 
> As for cpu_has_svm only 8 uses I've counted, all but one also don't seem 
> to break logic as described above. One check of cpu_has_svm in 
> init_speculation_mitigations(), where default speculation control flag 
> gets set, not uses SVM features directly. Yet from the comment I can 
> assume that it's also related to running HVM domain and usage of VMX 
> features at later time.

Note how to comment (necessarily) mixes SVM and VT-x. The !cpu_have_svm
really looks to mean cpu_has_vmx there (i.e. absence of SVM on a HVM-only
path implying VT-x). This would be broken if cpu_has_svm had
IS_ENABLED() added to it. You'll want to consult the commit introducing
the construct as well as perhaps Andrew directly as to whether switching
to cpu_has_vmx here would be appropriate. I'm pretty sure there was a
reason why this was written using the negative (!SVM) form.

> With all above, at the moment there doesn't seem to be uses of 
> cpu_has_{svm,vmx} macros without subsequent usage of svm/vmx features, 
> so this patch should be quite safe.
> 
> Please let me know whether the above reasoning makes sense.

Fundamentally it does, with said one exception. Yet even in the absence
of that exception the question would then remain whether we really want
to close the road to one of the two possible uses of these constructs.

Jan

