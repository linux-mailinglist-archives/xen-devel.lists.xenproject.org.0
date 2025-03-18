Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F455A67A37
	for <lists+xen-devel@lfdr.de>; Tue, 18 Mar 2025 18:02:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.919514.1323943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuaK8-0004mo-E9; Tue, 18 Mar 2025 17:01:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 919514.1323943; Tue, 18 Mar 2025 17:01:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tuaK8-0004kR-9e; Tue, 18 Mar 2025 17:01:52 +0000
Received: by outflank-mailman (input) for mailman id 919514;
 Tue, 18 Mar 2025 17:01:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=kmRG=WF=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tuaK6-0004kL-PV
 for xen-devel@lists.xenproject.org; Tue, 18 Mar 2025 17:01:50 +0000
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [2a00:1450:4864:20::32d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ae141441-041a-11f0-9899-31a8f345e629;
 Tue, 18 Mar 2025 18:01:48 +0100 (CET)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-43d0782d787so24917975e9.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Mar 2025 10:01:48 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d1fe0636dsm139216435e9.11.2025.03.18.10.01.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Mar 2025 10:01:47 -0700 (PDT)
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
X-Inumbo-ID: ae141441-041a-11f0-9899-31a8f345e629
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742317308; x=1742922108; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=heWz7tWZrDtHmRAc/+uii0MDgoomWa07tHXU3vF15wI=;
        b=fnJ8z9g8RRAMOWhGjChOJg2PTJsPnct83zcePYw+If6fJK/bJp41TFrURyMuxRckQr
         nUBE39P6GHrppH0AbaTc6ngWstzk1GS+o5b1Se/fVhP3xwkmVHmnAEt3iOR7cMUFV1qv
         Rb6yrR/Tj4N9QLrhmHROIPC8Un9kvdyZB7giO+q7vlvP74ZddNCuxiGTJwkK0gGgJWWz
         FiYVkXBQSLFcrSLEf9NegAMeD+2lw9CBH1EJvBh7v49mWmONkAjwYsTsbEomG/sejzLm
         0NaufNhsjLoW/Xm0vLa7tK+Iwq6AWe38+aHc5fkw2IivXm/wzV96Ru+ZgJzBO3PIcGuH
         xXnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742317308; x=1742922108;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=heWz7tWZrDtHmRAc/+uii0MDgoomWa07tHXU3vF15wI=;
        b=oN0Hjc/NuO1jz+hivLIisyz6Vz8vR5X0LvGRCc59w5PjvH4PfKAH/qgGNk1+i+3YFI
         XLpGcp+uus36ZpwTkw9Bx+53B98SX8e/2E3xBHF/ceGO+BgaFLKyXtl6naRVUIo8PCMv
         ZrUpMaCIO1KjwpY+/DfcrEo52Nfsji2Mfy8QqXL0Jc5pLbBDR3Th54p0k2q9pVi8iHye
         WHok6UGXFY5S7zt1xiad4RHQEfdBc2FE7sK/DojfHIXrgPl964tD/Pc5Fa3rHwzZhWxj
         gREDi6vsuEjPbpqiqdmJsGOj0MPt8TrDFdeNQVN6J5akNeUb4eEcwVc6nwtK25kcz6uY
         NRvQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8VSFCCGZVxBqxLYqg4dnZo4zieDmy8Er9WgeC8EOiuP7SbKXBA2HqkKHqjKaPVgI982OstWwBV+s=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywf9yYIKoMdTxa9Z/xdN48GmEvs7pA0O8Hl8Z0o2A8L/j91noGt
	jT0+LSH9Tad28gN1EZgvl6xPeWefwo15AMYqp4n06eMNgMCte/IT1rVBtVDVHg==
X-Gm-Gg: ASbGncstONEKIUnn10l1C9ovG5HKwpoY7WrDeoWjCCYU0V8GUwXKBIaYxwUgtmhkV+g
	DfTLpUGLpYIu96+r+O+mLciskIP5NLTRGYBYbiREJTZ5ZLUkQP2XDFY/xWSmwP+U0LdZHeYus6c
	nAaydwWTb9bOCqJRy+Y4msnJEQLvP0JWTaTsRxAJSRMYSMo8SAU5dbodAZCIO8iMHr4OFeSTB0k
	fKJ+xuni/PSEgg8lSWXabIwBBe07cvDazBXxVNnShbaGlKrY7M+ZlFkeF3oYN9blub/A/kkLvDa
	4EHX8NuOpHtUFCGYAEtPYDyp7bJzqDIT0Nh4srFUJV9m8YhU/Sw6TWpwDU4lLEOPxdlt1vdEtwE
	6nHpntd4hlXDCuZpSC708gAlPib7M2w==
X-Google-Smtp-Source: AGHT+IHP79rVdnonYOd4YxlOuBEch3hxH+MI3of+ZZz6gnbY4JC0Z/p/eu2Xh4rNOsjNd16ziPiUtg==
X-Received: by 2002:a05:600c:468e:b0:43c:f81d:f with SMTP id 5b1f17b1804b1-43d3b986350mr26375115e9.8.1742317307777;
        Tue, 18 Mar 2025 10:01:47 -0700 (PDT)
Message-ID: <1e37eb58-21a0-49a1-b7fe-9c950b32e2e6@suse.com>
Date: Tue, 18 Mar 2025 18:01:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] x86/xlat: fix UB pointer arithmetic in
 COMPAT_ARG_XLAT_VIRT_BASE
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
References: <20250318091904.52903-1-roger.pau@citrix.com>
 <20250318091904.52903-4-roger.pau@citrix.com>
 <8ad59d67-02f8-415c-93a0-2361e920c017@suse.com>
 <Z9mSub1DgzoP71-v@macbook.local>
 <06e00c30-90d4-42a1-a1d7-fadd63b9377e@suse.com>
 <Z9mjsLFkCCxMR84Z@macbook.local>
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
In-Reply-To: <Z9mjsLFkCCxMR84Z@macbook.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 18.03.2025 17:47, Roger Pau Monné wrote:
> On Tue, Mar 18, 2025 at 04:50:58PM +0100, Jan Beulich wrote:
>> On 18.03.2025 16:35, Roger Pau Monné wrote:
>>> On Tue, Mar 18, 2025 at 03:33:03PM +0100, Jan Beulich wrote:
>>>> On 18.03.2025 10:19, Roger Pau Monne wrote:
>>>>> --- a/xen/arch/x86/include/asm/x86_64/uaccess.h
>>>>> +++ b/xen/arch/x86/include/asm/x86_64/uaccess.h
>>>>> @@ -9,9 +9,9 @@
>>>>>   * a secondary mapping installed, which needs to be used for such accesses in
>>>>>   * the PV case, and will also be used for HVM to avoid extra conditionals.
>>>>>   */
>>>>> -#define COMPAT_ARG_XLAT_VIRT_BASE ((void *)ARG_XLAT_START(current) + \
>>>>> -                                   (PERDOMAIN_ALT_VIRT_START - \
>>>>> -                                    PERDOMAIN_VIRT_START))
>>>>> +#define COMPAT_ARG_XLAT_VIRT_BASE ((void *)ARG_XLAT_START(current) - \
>>>>> +                                   (PERDOMAIN_VIRT_START - \
>>>>> +                                    PERDOMAIN_ALT_VIRT_START))
>>>>
>>>> Aren't we then (still) dependent on ordering between PERDOMAIN_VIRT_START
>>>> and PERDOMAIN_ALT_VIRT_START? Would
>>>>
>>>> #define COMPAT_ARG_XLAT_VIRT_BASE ((void *)ARG_XLAT_START(current) - \
>>>>                                    PERDOMAIN_VIRT_START + \
>>>>                                    PERDOMAIN_ALT_VIRT_START)
>>>>
>>>> perhaps be less fragile?
>>>
>>> PERDOMAIN_{ALT_,}VIRT_START are unsigned long, so this might work.
>>>
>>> Note however that even with your suggestion we are still dependant on
>>> ARG_XLAT_START(v) > PERDOMAIN_ALT_VIRT_START, or else the '-' won't
>>> work.  I think I prefer my proposed version, because it's clear that
>>> PERDOMAIN_VIRT_START, ARG_XLAT_START(current) >
>>> PERDOMAIN_ALT_VIRT_START.
>>
>> What makes that clear? Can't we move PERDOMAIN_ALT_VIRT_START pretty
>> much at will?
> 
> We would need to adjust the calculations here again, if
> PERDOMAIN_ALT_VIRT_START > PERDOMAIN_VIRT_START the subtraction would
> lead to an underflow, and would also be UB pointer arithmetic?

With

#define ARG_XLAT_VIRT_START      PERDOMAIN_VIRT_SLOT(2)

I can't see how subtracting PERDOMAIN_VIRT_START could lead to an underflow.
The idea of the expression suggested is to first subtract the area base (no
underflow) and then add the other area's base (no overflow).

Jan

