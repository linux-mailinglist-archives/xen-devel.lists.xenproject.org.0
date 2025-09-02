Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD17B3F60B
	for <lists+xen-devel@lfdr.de>; Tue,  2 Sep 2025 08:57:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1105708.1456561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utKws-0003QB-5l; Tue, 02 Sep 2025 06:56:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1105708.1456561; Tue, 02 Sep 2025 06:56:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1utKws-0003Oj-2i; Tue, 02 Sep 2025 06:56:58 +0000
Received: by outflank-mailman (input) for mailman id 1105708;
 Tue, 02 Sep 2025 06:56:56 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=P0Jg=3N=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1utKwp-0002tl-V1
 for xen-devel@lists.xenproject.org; Tue, 02 Sep 2025 06:56:55 +0000
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [2a00:1450:4864:20::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 027174c3-87ca-11f0-8dd7-1b34d833f44b;
 Tue, 02 Sep 2025 08:56:54 +0200 (CEST)
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-b042cc3962aso194314166b.0
 for <xen-devel@lists.xenproject.org>; Mon, 01 Sep 2025 23:56:54 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b03ab857474sm718771266b.89.2025.09.01.23.56.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Sep 2025 23:56:49 -0700 (PDT)
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
X-Inumbo-ID: 027174c3-87ca-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1756796214; x=1757401014; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=hNnfACBahHBKeprYuJQzjChOP5KXOJ9ZHh3sDc3oWVk=;
        b=TLRV++gQAAwg2UsEexfF023pgRj1d8Xv79yp5w3V4xa7pRJSNKViDTDHOUEGTtuNk/
         KXDIE4favuOdbVq1TcubJ/L1B9+DhAQcRYMWm7YKv9BnJP2sZCAlBThojSMRDdVY6EUg
         Gi1QVWjN1PRaBr+puW5UuUsJtqr6DJlEGb9Lc7pgoKfW1m5YtjV1PyvqRr/l+bAETnN+
         7sC891VL39z3I4JMSlP8zvkWZt0Dk02a9G0WpRSSqWWWXtURtIGj8FvTvircq4aQ5ZAb
         i44jodWOhkMxZQDWi6GcgdrHCTqwIXMdtBFFPLJSZekeuR2DS8hnWR4UVDJMuMpB/oE+
         8EXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756796214; x=1757401014;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hNnfACBahHBKeprYuJQzjChOP5KXOJ9ZHh3sDc3oWVk=;
        b=JjyCdEfUbNUIQo58EOyOQBAcSXiT/obCF+pSMebwQqrsIBZAxVCYsa3yrFQfPhgykF
         MVb2nEzXnO/IiyO0Tl4biJTACkhIDb+5nxXQeUVAr31QzqRzSLXW0FfzRHbemH9IH10M
         eWPiRWFIJoK/RAFMox6zKfJik8uzYyvsvSvYWta3ifnb8RUCpuNPtcczhGeE5qc925x0
         9jjWxpnMHgMVF55uJ/cdkqbQFUo6YMBTcVkDcwO9uzpLp69bOJiVYZes8iEpKBWfudQB
         kG/xlSsfq3hq5LlNa6qcpH3SJfi0wPIi4kCgj5Y4+JgATKBcovamv87k8Vz+od9dQVgt
         RR/g==
X-Forwarded-Encrypted: i=1; AJvYcCXMYjAjxGdBeUKRrZ3HESGmXI6pPr5fNYFucY08Btm/io2aUbtHR8I3MZeRQFv7BoedFnmMD2Tb0Bc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxoLhhIA/Ylbszipzok7T+JpQhMAYr0wq+LXl+GeNSDjzlnyQHt
	QuJP/pwaVuFfpV0n9ist+6w7PY0NOUkjQBVHU4gmNfTwbkCFF37x9xJ69FzKZjjB+A==
X-Gm-Gg: ASbGncscuKY4asb3iGKmEhxf5tt4ZLI17aGGv0UrR69/NJxIj57/0TLodXBK9UNFZvA
	kXxCYTJc0ljwNJl8qL6a0O21wSO6BJbJ2+bVnm7GfjuenRIpnerLQwO9rLiYCOuQeEfiEem3kiH
	P80BQNDBzzDr2YM6YbMXUAQoJ7Mi/W9GvKLae9wGOnKT72okNgj/feTkEFgb/sKKtZJFzhytKO4
	QX7vE1eKimE/fRZNzLRx5lmv9rVuRl8QKclgu1TBhMGayImdMHWRccaf7YLSaU2zVflbH+VjZRX
	OvT5o0FFbbWsEo9fKPlG0WeUxrjZ6AUY1ZJOYB0kjln4h3h8123DBGEkfU10AW356+GzsMNcK1M
	9ovw8nHx7MNx29/SMo0yQTym50dh2pjBp24AtabTjul05Q9hPRgEuejY4o/6U419KkFX8qqSJaU
	VxpY7wcb4=
X-Google-Smtp-Source: AGHT+IHys+Fr7k7u2T8Xv9vHg9gjIwVZD1vPPlQfAIi5Fna/rSCAumm02LFYNGVkNtRJlFSWZUu9wg==
X-Received: by 2002:a17:907:2d27:b0:b04:27a9:cfe1 with SMTP id a640c23a62f3a-b0427a9df6dmr501066166b.47.1756796210184;
        Mon, 01 Sep 2025 23:56:50 -0700 (PDT)
Message-ID: <6f9d9bb0-9e36-4c20-b464-364aafdf239f@suse.com>
Date: Tue, 2 Sep 2025 08:56:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 1/4] xen/arm: Implement PSCI SYSTEM_SUSPEND call for
 guests
To: Mykola Kvach <xakep.amatop@gmail.com>
Cc: Mykola Kvach <mykola_kvach@epam.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Oleksii Kurochko <oleksii.kurochko@gmail.com>,
 xen-devel@lists.xenproject.org
References: <cover.1756586648.git.mykola_kvach@epam.com>
 <244e5c2bcebad9563595ac7564ffa105d5f568d3.1756586648.git.mykola_kvach@epam.com>
 <80c8dbfe-5240-441d-84fc-603e9c5f9812@suse.com>
 <CAGeoDV8Jjri+EhJDvxuZED9gm_b5JGcCouSeHqdBF=xR6VZw+w@mail.gmail.com>
 <CAGeoDV_zfFhgKr1RMVB2rLnXJd3TrzD8nNr4z4uREeLyH_sGuQ@mail.gmail.com>
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
In-Reply-To: <CAGeoDV_zfFhgKr1RMVB2rLnXJd3TrzD8nNr4z4uREeLyH_sGuQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 02.09.2025 08:29, Mykola Kvach wrote:
> On Mon, Sep 1, 2025 at 8:02 PM Mykola Kvach <xakep.amatop@gmail.com> wrote:
>>
>> Hi Jan,
>>
>> On Mon, Sep 1, 2025 at 5:29 PM Jan Beulich <jbeulich@suse.com> wrote:
>>>
>>> On 31.08.2025 00:10, Mykola Kvach wrote:
>>>> --- a/xen/arch/ppc/stubs.c
>>>> +++ b/xen/arch/ppc/stubs.c
>>>> @@ -224,6 +224,11 @@ void arch_domain_creation_finished(struct domain *d)
>>>>      BUG_ON("unimplemented");
>>>>  }
>>>>
>>>> +int arch_domain_resume(struct domain *d)
>>>> +{
>>>> +    return 0;
>>>> +}
>>>> +
>>>>  int arch_set_info_guest(struct vcpu *v, vcpu_guest_context_u c)
>>>>  {
>>>>      BUG_ON("unimplemented");
>>>> diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
>>>> index 1a8c86cd8d..52532ae14d 100644
>>>> --- a/xen/arch/riscv/stubs.c
>>>> +++ b/xen/arch/riscv/stubs.c
>>>> @@ -198,6 +198,11 @@ void arch_domain_creation_finished(struct domain *d)
>>>>      BUG_ON("unimplemented");
>>>>  }
>>>>
>>>> +int arch_domain_resume(struct domain *d)
>>>> +{
>>>> +    return 0;
>>>> +}
>>>> +
>>>>  int arch_set_info_guest(struct vcpu *v, vcpu_guest_context_u c)
>>>>  {
>>>>      BUG_ON("unimplemented");
>>>> diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
>>>> index 19fd86ce88..94a06bc697 100644
>>>> --- a/xen/arch/x86/domain.c
>>>> +++ b/xen/arch/x86/domain.c
>>>> @@ -1138,6 +1138,11 @@ void arch_domain_creation_finished(struct domain *d)
>>>>          hvm_domain_creation_finished(d);
>>>>  }
>>>>
>>>> +int arch_domain_resume(struct domain *d)
>>>> +{
>>>> +    return 0;
>>>> +}
>>>> +
>>>>  #ifdef CONFIG_COMPAT
>>>>  #define xen_vcpu_guest_context vcpu_guest_context
>>>>  #define fpu_ctxt fpu_ctxt.x
>>>
>>> I definitely don't like this redundancy, and even less so that you introduce out-
>>> of-line calls.
>>
>> Thank you for your feedback.
>> I followed the existing pattern used in other architecture stubs.
>>
>>>
>>>> --- a/xen/include/xen/domain.h
>>>> +++ b/xen/include/xen/domain.h
>>>> @@ -109,6 +109,8 @@ int arch_domain_soft_reset(struct domain *d);
>>>>
>>>>  void arch_domain_creation_finished(struct domain *d);
>>>>
>>>> +int arch_domain_resume(struct domain *d);
>>>
>>> I think this wants to move to a per-arch header, presence of which is checked by
>>> has_include(), with an inline fallback define once centrally here.
>>
>> Would it be acceptable to use a weak function as the default
>> implementation instead? This way, architectures needing a real
>> implementation could override it, while others would use the weak
>> default.

Besides this not addressing my out-of-line concern, we avoided the use
of weak symbols so far. While I don't recall specific details, iirc
this was somewhat related to Linux at some point deciding to reduce
(eventually eliminate?) the use of weak symbols.

> AFAIU, both your proposal and mine would violate MISRA C Dir 1.1 and
> Rule 1.1 (also Rule 1.2 but it is acceptable). According to these
> requirements, any use of compiler extensions should be documented and
> understood. In the context of the Xen hypervisor, such extensions must
> be listed in "docs/misra/C-language-toolchain.rst" as required by our
> project guidelines.

Just to mention that we use has_include() already, and that there are
two uses of __weak in livepatch code (which I would prefer not to use as
justification that further use of weak symbols is okay, as they're in
macros used in livepatches only, not in core Xen).

Jan

