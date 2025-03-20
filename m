Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 70292A6A9AD
	for <lists+xen-devel@lfdr.de>; Thu, 20 Mar 2025 16:23:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.922565.1326480 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvHjb-0004nO-3Z; Thu, 20 Mar 2025 15:23:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 922565.1326480; Thu, 20 Mar 2025 15:23:03 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tvHjb-0004lR-0l; Thu, 20 Mar 2025 15:23:03 +0000
Received: by outflank-mailman (input) for mailman id 922565;
 Thu, 20 Mar 2025 15:23:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=B8C5=WH=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1tvHjZ-0004l2-SN
 for xen-devel@lists.xenproject.org; Thu, 20 Mar 2025 15:23:01 +0000
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [2a00:1450:4864:20::434])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 35235944-059f-11f0-9ffa-bf95429c2676;
 Thu, 20 Mar 2025 16:23:00 +0100 (CET)
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-3913d45a148so799394f8f.3
 for <xen-devel@lists.xenproject.org>; Thu, 20 Mar 2025 08:22:59 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-395cb318aa1sm24711479f8f.64.2025.03.20.08.22.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Mar 2025 08:22:58 -0700 (PDT)
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
X-Inumbo-ID: 35235944-059f-11f0-9ffa-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742484179; x=1743088979; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=154VnlxEwZgYv8st94G79Wk8LmABjFToy/SwfuzOL6g=;
        b=ArLERxA1IjmhgTQi8yf2nSmV4+u+WseEIwBrTWfL/dNL+odh8+pbpGs+qBhMXohJq/
         Etb9WHl6jfnijvgM8XaKzl+c78sR+8euvMnhmseKPwNBlz9VeNpR/qtvycWPSLTSJ7aj
         I3AoyvnPN7jzOxxFCYNz0RTaNPCDVXd7AgQmTPUaYd6qu5qEAAF6piu9MPuAMiGCcCgH
         0XobyozxrvrWf7WwSdl2HNwZDxMMLyyF/Q4sIuRAdsH2DqqgRmZ+pS4NP/8To4+uyNUK
         I61NOcKVzcWAawOfB8ox0TiZVOy3TkdY/+BkNN5juvGx5N3/yhgk1cSkoDqGZRApir4K
         rtNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742484179; x=1743088979;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=154VnlxEwZgYv8st94G79Wk8LmABjFToy/SwfuzOL6g=;
        b=byhFlqL2sZBWLWV5ZGcKFzgnjMITP0zVET5bGy+CMug/j/MHHjjZQ6uv7OQIjLDLyA
         5E27BGqhhJSq+YHHQ2Uqg34tG+HvMvoiM+aG1TOg9xiK0LPu3g5QykBBKToiVngxZGA/
         69raKyYB1VRvvqshHYZ1v//G+6gD5n8r9uXKuO9H34M0lg/sIgx+xeC0uZ4vYj+KPPE9
         IYtL6PsFMCVFcnZCyOU3c5vbGHnML8TVkQkalQu9QUPC5fx1KA825eaqjYI7xzTBxWNQ
         UvQZY53yKNgf/wHsIzRR+PUXYqDJSQRPjIvvgy2cXBXK6QX1Ft5f9vQG73175XAEW53g
         B4tg==
X-Gm-Message-State: AOJu0YzWYirNjgIUsEeK7VBKg5bTSj8p7VwP8YSx/1y8eK1q7aM8psjH
	Xdok1ozzFGiZxnzNQUjIjGyl46dtCG9YglMtnuYwqYJa4m0u63aCn3IgxLGVqg==
X-Gm-Gg: ASbGncu4eIsXRDRWrFYJNo4bpNgOpM1wO/N3xM8bvLoDmJvuvPO898E8Iq/3CDrTB9N
	DbjcqKVa0G1R/il+Py5RGu1IymRUcP99LSvgb4eCM6YeGHjK7dJynyLFPcT3R3QvIwzmCevt5qU
	kFL0XzVcA0fq/lcjRo3jZfbv7yiYphmJEVxcZQKD0HcsCf7827bLViiHAfpECWcmVWb/myuhHXQ
	Kp4iZazMSLeTopVdT1Mo/5oOLy/TLeW9wtNyOBZKzE3VDIydfYVwRyMmljhodaYzgnHURrxsQTe
	3YB3Kx1KbwoRQ4PqvD5hKi+vJNgdljMjE/zM1xU0Ty8HYrO8/lA2Wv48jNpuxcuruC7p4cAbArr
	26pu7D4gbS2+IN3QdjdK/pdaPrj2veg==
X-Google-Smtp-Source: AGHT+IE7w+DSMf9PKOZ488gqzQklsMs/7e9PeHd7mW4gHsqx5+Ffq6RD+7xrhl7hqi4Ggh/ihn/yjw==
X-Received: by 2002:a05:6000:1446:b0:390:ebae:6c18 with SMTP id ffacd0b85a97d-399795a8d30mr2678708f8f.12.1742484178852;
        Thu, 20 Mar 2025 08:22:58 -0700 (PDT)
Message-ID: <7a319cbb-d19c-44f2-b407-e173d575ba8b@suse.com>
Date: Thu, 20 Mar 2025 16:22:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] x86: make Viridian support optional
To: Alejandro Vallejo <alejandro.vallejo@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Sergiy Kibrik <sergiy_kibrik@epam.com>
References: <20250317071919.3766976-1-Sergiy_Kibrik@epam.com>
 <CAFi36o263XOQbTpSGDcM3PmpY+MwodHi1tOXDp3W60N0n9b9YA@mail.gmail.com>
 <93e98ebb-4679-4c34-a5af-f105e89c7304@epam.com>
 <D8L6ZRL4CIUK.FGKVDP8TJAGU@cloud.com>
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
In-Reply-To: <D8L6ZRL4CIUK.FGKVDP8TJAGU@cloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 20.03.2025 16:18, Alejandro Vallejo wrote:
> On Thu Mar 20, 2025 at 9:39 AM GMT, Sergiy Kibrik wrote:
>> hi Alejandro,
>>
>> 17.03.25 11:19, Alejandro Vallejo:
>> [..]
>>>       endif
>>>
>>>     +config HVM_VIRIDIAN
>>>     +       bool "Viridian enlightenments support" if EXPERT
>>>     +       depends on HVM
>>>     +       default y
>>>     +
>>>
>>>
>>>
>>> I don't see why this should be gated by EXPERT, provided a
>>> suitable (now absent) help message was to exist explaining
>>> what it does in plain simple words.
>>
>> The option is intended primarily for fine-tuned systems optimized for 
>> particular platform and mode of operation. As for generic systems (e.g. 
>> distributions) whey wouldn't want to disable it anyway.
> 
> 
> 
>>>
>>> For the title, I'd say it needs to properly state it refers to
>>> enlightenments for guests, rather than enlightenments for
>>> Xen itself when running under Hyper-V. As it is, it sounds
>>> ambiguous (Maybe "Hyper-V enlighnments for guests"?).
>>>
>>
>> Agree, "Hyper-V enlighnments for guests" is better title.
>> As for help message, would the one below be sufficient?:
>>
>>   help
>>     Support optimizations for Hyper-V guests such as faster hypercalls,
>>     efficient timer and interrupt handling, and enhanced paravirtualized
>>     I/O. This is to improve performance and compatibility of Windows VMs.
>>
>>     If unsure, say Y.
> 
> Sounds good enough to me.
> 
>>
>>
>>> On a personal nitpicky preference note, I'd say HVM_VIRIDIAN sounds
>>> rather redundant, and I think just VIRIDIAN works just as well
>>> while being shorter.
>>>
>>
>> this is rather to highlight the fact that the code is part of HVM 
>> support, a bit of self-documenting
>>
>> [..]
> 
> That's fair enough.
> 
>>>     diff --git a/xen/arch/x86/include/asm/hvm/vcpu.h
>>>     b/xen/arch/x86/include/asm/hvm/vcpu.h
>>>     index 196fed6d5d..bac35ec47a 100644
>>>     --- a/xen/arch/x86/include/asm/hvm/vcpu.h
>>>     +++ b/xen/arch/x86/include/asm/hvm/vcpu.h
>>>     @@ -171,8 +171,9 @@ struct hvm_vcpu {
>>>
>>>           /* Pending hw/sw interrupt (.vector = -1 means nothing
>>>     pending). */
>>>           struct x86_event     inject_event;
>>>     -
>>>     +#ifdef CONFIG_HVM_VIRIDIAN
>>>           struct viridian_vcpu *viridian;
>>>     +#endif
>>>       };
>>>
>>>       #endif /* __ASM_X86_HVM_VCPU_H__ */
>>>
>>>
>>> nit: I suspect the code would be far less cluttered with "if 
>>> viridian..." if the
>>> init/deinit/etc functions had dummy versions of those functions when
>>> !HVM_VIRIDIAN in the header.
>>>
>>
>> as Jan explained some time ago [1] it's preferable to compile as much as 
>> possible in all build configuration. Besides most of calls to viridian 
>> code are already guarded by is_viridian_domain() & not actually require 
>> stubs.
>>
>>   -Sergiy
>>
>> [1] 
>> https://lore.kernel.org/xen-devel/36708a3f-2664-4b04-9f5d-f115d362d100@suse.com/
> 
> That answer seems to state a preference for...
> 
>     if ( foo_enabled() )
>         rc = foo();
> 
> ... against...
> 
>     #ifdef CONFIG_FOO
>     rc = foo();
>     #endif
> 
> ... where foo() in the header looks like...
> 
>     #ifdef CONFIG_FOO
>     int foo(void);
>     #else /* CONFIG_FOO */
>     static inline int foo(void)
>     {
>         return /*some-error*/;
>     }
>     #endif /* CONFIG_FOO */
> 
> But that's not what's going on here, I think? I didn't initially notice the
> subtlety of the change. On more careful look, it seems to rely on the compiler
> doing dead-code-elimination. The functions missing in the linking stage don't
> cause a compile-time error because the conditionals are completely gone by
> then. Neat as it is, it sounds a bit fragile. Can we really rely on this
> behaviour not changing? Furthermore, does MISRA have views about having dead
> code calls to unimplemented functions?

We use DCE like this in many places, so we already rely on this behavior not
changing.

Jan

