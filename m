Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6CED8D3623
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2024 14:17:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.731837.1137569 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCIEY-0001W2-Ic; Wed, 29 May 2024 12:16:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 731837.1137569; Wed, 29 May 2024 12:16:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sCIEY-0001Tu-Fy; Wed, 29 May 2024 12:16:46 +0000
Received: by outflank-mailman (input) for mailman id 731837;
 Wed, 29 May 2024 12:16:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=RuQ4=NA=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1sCIEX-0001To-1h
 for xen-devel@lists.xenproject.org; Wed, 29 May 2024 12:16:45 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4f910756-1db5-11ef-90a1-e314d9c70b13;
 Wed, 29 May 2024 14:16:43 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a626919d19dso149639766b.0
 for <xen-devel@lists.xenproject.org>; Wed, 29 May 2024 05:16:43 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a626cc8d70bsm707420166b.180.2024.05.29.05.16.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 May 2024 05:16:42 -0700 (PDT)
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
X-Inumbo-ID: 4f910756-1db5-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1716985003; x=1717589803; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rG/fvfzzduYmDhNxdJuBdBQWYN0pxrOBGx3ksl4Y5A4=;
        b=Ay7RHCQn5ioXrcML2obpJMUIN9gPulBAUdqJIRQqYRdvB7cBtdsH19srtZDMAZBvip
         Riayk/4uM/qnqZCTMKaXsgJsthlS9zxvncdQF9la4GAUn4cBPrGC6C6qvdIdPveceRYs
         cg99s3rutDwnZ5lf/WiqxJXv0sLQ4aMqU8djm1nPpePK42Dc3+yIigAUhGpQDjoz1T93
         q7i1WJJweE1HQlWjcbyuwLLaeO3Akw2QLcp6It1PH4TZU/NZEOzWVIU9S8sPJSzSyKyi
         h/wbUoE8a3ODlDVjF5M+J/1IHPRVJgDcZhu72L3YYZKDD7MT06UQ5YGuBGFFhY/p7S+O
         0C5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716985003; x=1717589803;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rG/fvfzzduYmDhNxdJuBdBQWYN0pxrOBGx3ksl4Y5A4=;
        b=Ee1z7e8bB6/kk/7O6RxLU7rC22DPa4PwvVpcTmRE85dxX0k5Gt/0JnFtN1UekRh6XG
         5Tr4hSU0XIzP9iWDcDCWZYFqqaHrlYtJZrqOIKlh0eCNGkVd5UjWSAZEEp4GveOVxq00
         BTb22+bvHE0XCuVqwjYujaXVgPgNa0Y4AZNVV+82yfdd35VU9yPEtKPmZxr3zdGNOFkb
         ateqxymz3gCt5EDzpJKJduQr57zbux2POE/9fboNeudID5MEHWgP6SNWTLcVfggK0Hyl
         KEtr/6u2vqTvxXtc6IfFccpud93EXU6EBX1XTOH+ZrwqwzHdRFLS0pI5Lg3lPw1pyTZe
         TvAQ==
X-Gm-Message-State: AOJu0YxeuPE5fRKDtR/Z6debu3ut5c1ZQEbmw1hHO7AWL82khmY5QZQA
	5uCAzsonEIJonmglQrcYxoTOak4e8zX9ehtx7/l9WGnH7xLx6B4rQhi5kRd1cg==
X-Google-Smtp-Source: AGHT+IHR/6lZ/Dx+CVPKGCJswTV2hCRNabPR03yu1XxtMiJVSbZjjVPRlCqTJOwnbV8GcRNOhkB0AA==
X-Received: by 2002:a17:906:a898:b0:a62:2e6e:d28c with SMTP id a640c23a62f3a-a642da8aeedmr167064066b.34.1716985002973;
        Wed, 29 May 2024 05:16:42 -0700 (PDT)
Message-ID: <bfa3a3e0-0cc7-4321-80f1-814a256a054f@suse.com>
Date: Wed, 29 May 2024 14:16:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2 12/15] x86/vmx: guard access to cpu_has_vmx_* in
 common code
To: Sergiy Kibrik <sergiy_kibrik@epam.com>
Cc: xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Paul Durrant <paul@xen.org>,
 Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <cover.1715761386.git.Sergiy_Kibrik@epam.com>
 <c1f40e8e9a35f7e9ba55adc44a9fe93d48749c92.1715761386.git.Sergiy_Kibrik@epam.com>
 <alpine.DEB.2.22.394.2405151748080.2544314@ubuntu-linux-20-04-desktop>
 <4f2c1486-1b58-4c8d-a74e-ad83bf9cc4c7@suse.com>
 <8d9fd413-fa35-429d-bc4b-8261671b9c6a@epam.com>
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
In-Reply-To: <8d9fd413-fa35-429d-bc4b-8261671b9c6a@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 29.05.2024 12:58, Sergiy Kibrik wrote:
> 16.05.24 10:32, Jan Beulich:
>> On 16.05.2024 02:50, Stefano Stabellini wrote:
>>> On Wed, 15 May 2024, Sergiy Kibrik wrote:
>>>> There're several places in common code, outside of arch/x86/hvm/vmx,
>>>> where cpu_has_vmx_* get accessed without checking if VMX present first.
>>>> We may want to guard these macros, as they read global variables defined
>>>> inside vmx-specific files -- so VMX can be made optional later on.
>>>>
>>>> Signed-off-by: Sergiy Kibrik <Sergiy_Kibrik@epam.com>
>>>> CC: Andrew Cooper <andrew.cooper3@citrix.com>
>>>> CC: Jan Beulich <jbeulich@suse.com>
>>>> ---
>>>> Here I've tried a different approach from prev.patches [1,2] -- instead of
>>>> modifying whole set of cpu_has_{svm/vmx}_* macros, we can:
>>>>   1) do not touch SVM part at all, because just as Andrew pointed out they're
>>>> used inside arch/x86/hvm/svm only.
>>>>   2) track several places in common code where cpu_has_vmx_* features are
>>>> checked out and guard them using cpu_has_vmx condition
>>>>   3) two of cpu_has_vmx_* macros being used in common code are checked in a bit
>>>> more tricky way, so instead of making complex conditionals even more complicated,
>>>> we can instead integrate cpu_has_vmx condition inside these two macros.
>>>>
>>>> This patch aims to replace [1,2] from v1 series by doing steps above.
>>>>
> [..]
>>>
>>> I am missing some of the previous discussions but why can't we just fix
>>> all of the cpu_has_vmx_* #defines in vmcs.h to also check for
>>> cpu_has_vmx?
>>>
>>> That seems easier and simpler than to add add-hoc checks at the invocations?
>>
>> I'd like to take the question on step further: Following 0b5f149338e3
>> ("x86/HVM: hide SVM/VMX when their enabling is prohibited by firmware"),
>> is this change needed at all? IOW is there a path left where cpu_has_vmx
>> may be false, by any cpu_has_vmx_* may still yield true?
>>
> 
> This change is about exec control variables (vmx_secondary_exec_control, 
> vmx_pin_based_exec_control etc) not been built, because they're in vmx 
> code, but accessed in common code. The description is probably unclear 
> about that.
> Also build issues related to VMX can be solved differently, without 
> touching cpu_has_vmx_* macros and related logic at all.
> I can move exec control variables from vmcs.c to common hvm.c, this 
> would be simpler change and directly related to problem that I'm having.

That would be moving them one layer too high. Proper disentangling then
will need to wait until that data is actually part of the (host) CPU
policy. For the time being your change may thus be acceptable, assuming
that we won't be very quick in doing said move.

Jan

