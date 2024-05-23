Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC8C8CD621
	for <lists+xen-devel@lfdr.de>; Thu, 23 May 2024 16:51:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.728610.1133597 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA9mF-0006Qw-02; Thu, 23 May 2024 14:50:43 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 728610.1133597; Thu, 23 May 2024 14:50:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sA9mE-0006Nv-TS; Thu, 23 May 2024 14:50:42 +0000
Received: by outflank-mailman (input) for mailman id 728610;
 Thu, 23 May 2024 14:50:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=OfYh=M2=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sA9mE-0006Np-5k
 for xen-devel@lists.xenproject.org; Thu, 23 May 2024 14:50:42 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d30ca65a-1913-11ef-90a1-e314d9c70b13;
 Thu, 23 May 2024 16:50:40 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a5a7d28555bso1198749466b.1
 for <xen-devel@lists.xenproject.org>; Thu, 23 May 2024 07:50:41 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a179c7d2bsm1926534366b.120.2024.05.23.07.50.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 May 2024 07:50:40 -0700 (PDT)
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
X-Inumbo-ID: d30ca65a-1913-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716475840; x=1717080640; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eLOdg9fpKsuZESivE/qScPwjJzL8tE6jJFJ9lWoyKK0=;
        b=UhJ+7KDguvTroUbpoZ9NT1Nl+4ov2q1/yCxjsnQEDn1CsSDYw9lN4Nur06UFTC078+
         /W39PsucO0MLjv10BSzJaIGVPtErRC3joRlD8IDJp6pmfCp79J+R/V3wNWeSfEAFUprJ
         2PO+EH+SPY/cDkUD6b9lwuFJhdBex5rov3cOlPcjBFViGjv8SBKY7hbILMJNNvLJkKn7
         mzOPf8is5LKkk4LTsYOJtZtW5fpNiyyA0laPJTBlib577DolCG7yfcMOvIbws2xTfxoV
         kbreDkAgQQhjxKYBe/VU25bKtBhN9k4a2j25VA7gBAHzBQ28TbFrfDx2RcOcxe7P6tBX
         RA/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716475840; x=1717080640;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eLOdg9fpKsuZESivE/qScPwjJzL8tE6jJFJ9lWoyKK0=;
        b=g5E1u11U7qzAbknFso6Ao3IK4Ha3ui7TE1QWYFdzmZarGpwYQpGeEZU8f18pgIVhtu
         PRm88wqV8beACyhXgS59xoGusHj2nkLkt0zgB7mWAyR9ON7d83hF0XRFshVlVUK9feG+
         o3+bnJlqi6+PCByPbtLFj67vaHsDVM9uRFcUwXSJ2NZVhPaZSqmsDOGX0Sn9dugLK+Md
         c9eMDQ6ZhS1Yc5KbVnb7nFwmpTRx5CNsQr7fPcLBqg/Axw4Fcp0oE0ei8OFrFHNnYW87
         s99jrc3MApiTmuW+/gWamsMFBfpqHRRp2N8ZbEoLG/frJ7ZfiOCLHfysjvOyfrr9BlrI
         4Eig==
X-Forwarded-Encrypted: i=1; AJvYcCXiSXRcxN9xLdDAtQXn5j5qNsbZJrKQjvtiGnSLwjiO99w2VGXc0daFSC1ZeH4VR4Ge5zDdrg+FD6HeVV6XyNr1vYOGNygndc4fUMchAJE=
X-Gm-Message-State: AOJu0YwhmEFgIvlQEK74r7GSsp+8mr1hgOAPO/aID+boXCB8kxU7fCUg
	sNn/t7Vc8P0dJkYX6SOhD6aiRym453Vy5U+uF35T5vyHCorzx5NRhF5MvIeQoA==
X-Google-Smtp-Source: AGHT+IEahX/ato0feV7ZZ8OUr0aAe04RFXcdz7e5I3Fb3wxHdnvGWQ7QIoBQgnrY+SoCPUX7RN1taw==
X-Received: by 2002:a17:906:7ad8:b0:a59:a18e:3fd9 with SMTP id a640c23a62f3a-a622807b0e2mr344377566b.5.1716475840607;
        Thu, 23 May 2024 07:50:40 -0700 (PDT)
Message-ID: <201c4e7f-c493-4156-a855-b2207107e6c4@suse.com>
Date: Thu, 23 May 2024 16:50:39 +0200
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
In-Reply-To: <4b02bf84-0d81-467e-8577-f33dbfb71e8f@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 23.05.2024 15:07, Sergiy Kibrik wrote:
> 16.05.24 14:12, Jan Beulich:
>> On 15.05.2024 11:12, Sergiy Kibrik wrote:
>>> --- a/xen/arch/x86/include/asm/cpufeature.h
>>> +++ b/xen/arch/x86/include/asm/cpufeature.h
>>> @@ -81,7 +81,8 @@ static inline bool boot_cpu_has(unsigned int feat)
>>>   #define cpu_has_sse3            boot_cpu_has(X86_FEATURE_SSE3)
>>>   #define cpu_has_pclmulqdq       boot_cpu_has(X86_FEATURE_PCLMULQDQ)
>>>   #define cpu_has_monitor         boot_cpu_has(X86_FEATURE_MONITOR)
>>> -#define cpu_has_vmx             boot_cpu_has(X86_FEATURE_VMX)
>>> +#define cpu_has_vmx             ( IS_ENABLED(CONFIG_VMX) && \
>>> +                                  boot_cpu_has(X86_FEATURE_VMX))
>>>   #define cpu_has_eist            boot_cpu_has(X86_FEATURE_EIST)
>>>   #define cpu_has_ssse3           boot_cpu_has(X86_FEATURE_SSSE3)
>>>   #define cpu_has_fma             boot_cpu_has(X86_FEATURE_FMA)
>>> @@ -109,7 +110,8 @@ static inline bool boot_cpu_has(unsigned int feat)
>>>   
>>>   /* CPUID level 0x80000001.ecx */
>>>   #define cpu_has_cmp_legacy      boot_cpu_has(X86_FEATURE_CMP_LEGACY)
>>> -#define cpu_has_svm             boot_cpu_has(X86_FEATURE_SVM)
>>> +#define cpu_has_svm             ( IS_ENABLED(CONFIG_SVM) && \
>>> +                                  boot_cpu_has(X86_FEATURE_SVM))
>>>   #define cpu_has_sse4a           boot_cpu_has(X86_FEATURE_SSE4A)
>>>   #define cpu_has_xop             boot_cpu_has(X86_FEATURE_XOP)
>>>   #define cpu_has_skinit          boot_cpu_has(X86_FEATURE_SKINIT)
>>
>> Hmm, leaving aside the style issue (stray blanks after opening parentheses,
>> and as a result one-off indentation on the wrapped lines) I'm not really
>> certain we can do this. The description goes into detail why we would want
>> this, but it doesn't cover at all why it is safe for all present (and
>> ideally also future) uses. I wouldn't be surprised if we had VMX/SVM checks
>> just to derive further knowledge from that, without them being directly
>> related to the use of VMX/SVM. Take a look at calculate_hvm_max_policy(),
>> for example. While it looks to be okay there, it may give you an idea of
>> what I mean.
>>
>> Things might become better separated if instead for such checks we used
>> host and raw CPU policies instead of cpuinfo_x86.x86_capability[]. But
>> that's still pretty far out, I'm afraid.
> 
> I've followed a suggestion you made for patch in previous series:
> 
> https://lore.kernel.org/xen-devel/8fbd604e-5e5d-410c-880f-2ad257bbe08a@suse.com/

See the "If not, ..." that I had put there. Doing the change just mechanically
isn't enough, you also need to make clear (in the description) that you
verified it's safe to have this way.

> yet if this approach can potentially be unsafe (I'm not completely sure 
> it's safe), should we instead fallback to the way it was done in v1 
> series? I.e. guard calls to vmx/svm-specific calls where needed, like in 
> these 3 patches:
> 
> 1) 
> https://lore.kernel.org/xen-devel/20240416063328.3469386-1-Sergiy_Kibrik@epam.com/
> 
> 2) 
> https://lore.kernel.org/xen-devel/20240416063740.3469592-1-Sergiy_Kibrik@epam.com/
> 
> 3) 
> https://lore.kernel.org/xen-devel/20240416063947.3469718-1-Sergiy_Kibrik@epam.com/

I don't like this sprinkling around of IS_ENABLED() very much. Maybe we want
to have two new helpers (say using_svm() and using_vmx()), to be used in place
of most but possibly not all cpu_has_{svm,vmx}? Doing such a transformation
would then kind of implicitly answer the safety question above, as at every
use site you'd need to judge whether the replacement is correct. If it's
correct everywhere, the construct(s) as proposed in this version could then be
considered to be used in this very shape (instead of introducing the two new
helpers). But of course the transition could also be done gradually then,
touching only those uses that previously you touched in 1), 2), and 3).

Jan

