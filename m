Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD03CC45192
	for <lists+xen-devel@lfdr.de>; Mon, 10 Nov 2025 07:37:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1158117.1486510 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vILVk-0002Zf-S2; Mon, 10 Nov 2025 06:36:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1158117.1486510; Mon, 10 Nov 2025 06:36:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vILVk-0002Wd-LV; Mon, 10 Nov 2025 06:36:20 +0000
Received: by outflank-mailman (input) for mailman id 1158117;
 Mon, 10 Nov 2025 06:36:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Ugol=5S=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vILVi-0002WV-SN
 for xen-devel@lists.xenproject.org; Mon, 10 Nov 2025 06:36:18 +0000
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [2a00:1450:4864:20::42d])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 868b7980-bdff-11f0-980a-7dc792cee155;
 Mon, 10 Nov 2025 07:36:02 +0100 (CET)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-42b2a0c18caso1623083f8f.1
 for <xen-devel@lists.xenproject.org>; Sun, 09 Nov 2025 22:36:02 -0800 (PST)
Received: from ?IPV6:2003:ca:b70c:6a8d:3447:d20d:2d49:c08?
 (p200300cab70c6a8d3447d20d2d490c08.dip0.t-ipconnect.de.
 [2003:ca:b70c:6a8d:3447:d20d:2d49:c08])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-42b32ecf522sm8675021f8f.45.2025.11.09.22.36.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 09 Nov 2025 22:36:01 -0800 (PST)
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
X-Inumbo-ID: 868b7980-bdff-11f0-980a-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762756561; x=1763361361; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kr+XGRoKIHGRYsiEGErklOAhl7b0/4B1Yaxz6uQK/Zw=;
        b=GzEdIFS01sQ8D43+7ABYJhl7wnibH2yqjb6Ds+uUsnJT0oQ+pxMAyeZECKJiaqXd4U
         qW7cI+aYLQmN0xn4DMdPwTRqnnDK+e18lLA5ud9QN76OXF+PhamyLLHZFQMuJrRQ7M7w
         BnfjCtfvMw8Lvw17D+98P9nbKm1bBVKBiDWweddX4mp+01gvTraseI4IYvnpH0SFm1vz
         Hm7GyASu1ng5vUkbTIQalWQIw9vcmpD511HT0l2JvES9v3B2zV0AxAd69wci8z7j9LkN
         UEqWlZD3lAiaJFdmkOh20zF/1peyTZGhxEFksMZ9cyXIeeFDSzTgK6CJlKH4FWOzqo/L
         dy+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762756561; x=1763361361;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kr+XGRoKIHGRYsiEGErklOAhl7b0/4B1Yaxz6uQK/Zw=;
        b=jYWLsNLHdTy46qmcima9Us+TkBl60rQVqRwn9iQyVLE3xn50TIvnrxMdOCL6z3KzqI
         od7MhhAGNSaUkmZ/v+z9wEHXbAqglqRo7m+vNKor86oi+UXzYzgUu1blqf5GZdm9/Gp5
         rf+7qgwFUqw/4VMYxtxvXzw7+ae4/dyXLMt9wfxjMjq3j1KkgfhaynSHolDW9r+BRgdE
         ulpktNsx3yLiEFLQWef9qNCOmQtOaMa/IbVSZVoolQYdE8wheK6vS3MkZz4uI1MVx7ma
         WfDI8qjL7KWxKOxfgde5tp1gp4pX+QWKkjFIaW/mFh8cY6l5XTZXY7534VhssiecJEw6
         zyOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXgC1JOnp+zoOK3SIwFQk7vc0WFTtl+pb1SnorKRaBvogq3H/Rz5jRsIT2oW4zb6NL3W42Ww5Uo+no=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yx5Cy4wPJBl7iYGE5438GZnaJQCkPYHuBn0TRh1BmDs5j8Rs1WE
	qaPDUT2ePrRk6ITuEmjSEdR8MnfPYZWjRv4c50BhGHOLN13Cn7vR2qfQlLjtWcyU5g==
X-Gm-Gg: ASbGnctC+zV3pIVDEvjSQMYyMwaVlLxZUfRaC1Sxr0dUkpaP68HY1qXd4DR4zzHDwPt
	QDRkby/auI0QnN0knGOGkU468tUc5l7HtAlO8V9w5g9J3z2quzw5B4PABRMY+hw8kLukZN2bfEb
	PQtTOf9EzoDOqpUQJCAQZVhk+zJ7ezImM6FBrdqICtlnakSoyGSPFS2cLOFCvMHGFhYbcjG+v2m
	s6vvw5IoN9q1wsxLUOgDs4GFpDAaMap2cFCPh8B33kOduGM8j4BaE8xNw0OSDi1qBauJKBsRUb5
	4wGxeXCR8hemKE1sRijDXtfkGjlGiRFU7WWseRwdRaGZSF4PNnNLUMHhLuSKC/ySjCMaGUhGyfK
	LJNsM8sNFpb0UrStxUZ+tqtcTnuncq8eqRSX/CDd2M9s9wtloFCAdqDb244OGrj2JBn9zlk920B
	kOsNUgi9lKjUnf2aQZfRj1myvD4e2qdpLT0QeJgKzyn9t+mrCB4nAeI9oNADG0t+e2iwIdLRj9T
	5e3juXjlbkFpwSKX5zKBnO28v9L++fTC0sIwRMFkEDQ4Q==
X-Google-Smtp-Source: AGHT+IH4Rvto99U04q4jqjsdpgdqnC+Ko5Aw+FvKiuI1uwej27aa0B60AyTZGc2REe9VkQYIhp0MxA==
X-Received: by 2002:a5d:5f83:0:b0:428:5673:11e0 with SMTP id ffacd0b85a97d-42b2dc8725bmr5205479f8f.40.1762756561429;
        Sun, 09 Nov 2025 22:36:01 -0800 (PST)
Message-ID: <0613cfb9-0f6e-4c55-a250-ba2a5aa0e182@suse.com>
Date: Mon, 10 Nov 2025 07:36:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH] xen: make VMTRACE support optional
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>,
 Penny Zheng <Penny.Zheng@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Teddy Astie <teddy.astie@vates.tech>
References: <20251031212005.1338212-1-grygorii_strashko@epam.com>
 <b6337cb5-da85-492d-bba9-688e35695c46@suse.com>
 <e55f990a-1781-4651-a899-9d78bbbbdfd0@epam.com>
 <63525e6f-4e17-4155-87b2-47b9ac9ea474@suse.com>
 <acac87ba-5a5a-49d1-925a-8754f4a3179f@epam.com>
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
In-Reply-To: <acac87ba-5a5a-49d1-925a-8754f4a3179f@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 07.11.2025 16:47, Grygorii Strashko wrote:
> Hi
> 
> On 06.11.25 16:09, Jan Beulich wrote:
>> On 06.11.2025 14:50, Grygorii Strashko wrote:
>>> On 06.11.25 14:00, Jan Beulich wrote:
>>>> On 31.10.2025 22:20, Grygorii Strashko wrote:
>>>>> --- a/xen/Kconfig.debug
>>>>> +++ b/xen/Kconfig.debug
>>>>> @@ -155,4 +155,19 @@ config DEBUG_INFO
>>>>>          "make install-xen" for installing xen.efi, stripping needs to be
>>>>>          done outside the Xen build environment).
>>>>>    +config HAS_VMTRACE
>>>>> +    bool
>>>>> +
>>>>> +config VMTRACE
>>>>> +    bool "HW VM tracing support"
>>>>> +    depends on HAS_VMTRACE
>>>>> +    default y
>>>>> +    help
>>>>> +      Enables HW VM tracing support which allows to configure HW processor
>>>>> +      features (vmtrace_op) to enable capturing information about software
>>>>> +      execution using dedicated hardware facilities with minimal interference
>>>>> +      to the software being traced. The trace date can be retrieved using buffer
>>>>
>>>> Nit: s/date/data/
>>>>
>>>>> +      shared between Xen and domain
>>>>> +      (see XENMEM_acquire_resource(XENMEM_resource_vmtrace_buf)).
>>>>> +
>>>>
>>>> I was actually meaning to ask that "VMX only" should somehow be mentioned here,
>>>> but then I noticed this is an arch-independent location.
>>>
>>> Right, Arch code advertise VMTRACE support with HAS_VMTRACE.
>>> In this particular case:
>>> config INTEL_VMX
>>> ...
>>>     select HAS_VMTRACE
>>>
>>>
>>>> I'm not quite sure we want it like this (just yet).
>>>
>>> ?
>>
>> To rephrase the question: Are we expecting anything other than VMX to support
>> VMTRACE any time soon?
>>
> 
> That's I do not know.
> 
> I assume your point is similar to what Teddy noted [1].
> 
> I think vmtrace code can be consolidate, but question is on what level(s):
> 
> only:
>  xen/arch/x86/hvm/vmx/
>  |- vmtrace.c
> 
> or:
>  xen/arch/x86/hvm
>  |- vmtrace.c
>     <- vmtrace_alloc/free_buffer(), acquire_vmtrace_buf(), do_vmtrace_op()
>  xen/arch/x86/hvm/vmx/
>  |- vmtrace.c
> 
> it will require more work comparing to the current change.

Well, I don't think code movement is strictly necessary here. But as I'm unconvinced
of Kconfig.debug (in whatever subdir) being an appropriate place to add this, for
the time being merely putting the new Kconfig option directly next to INTEL_VMX (and
then without any new HAS_*) wants at least considering, imo. If and when some other
use appears, HAS_* can be introduced and the whole thing moved.

As otoh abstracting things in an arch-independent way also has its merits, it is -
as said - not quite clear to me which way we'd prefer to have it.

Jan

> [1] https://patchwork.kernel.org/comment/26637627/
> 


