Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C6CC7FCF9
	for <lists+xen-devel@lfdr.de>; Mon, 24 Nov 2025 11:09:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1170177.1495252 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNTV6-0004NI-NK; Mon, 24 Nov 2025 10:08:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1170177.1495252; Mon, 24 Nov 2025 10:08:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vNTV6-0004KX-KS; Mon, 24 Nov 2025 10:08:52 +0000
Received: by outflank-mailman (input) for mailman id 1170177;
 Mon, 24 Nov 2025 10:08:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=CeM5=6A=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vNTV5-0004KR-NC
 for xen-devel@lists.xenproject.org; Mon, 24 Nov 2025 10:08:51 +0000
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [2a00:1450:4864:20::32a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9279ffd9-c91d-11f0-9d18-b5c5bf9af7f9;
 Mon, 24 Nov 2025 11:08:50 +0100 (CET)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-477563e28a3so27665765e9.1
 for <xen-devel@lists.xenproject.org>; Mon, 24 Nov 2025 02:08:49 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477bf3b4eb2sm186092755e9.12.2025.11.24.02.08.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Nov 2025 02:08:48 -0800 (PST)
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
X-Inumbo-ID: 9279ffd9-c91d-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1763978929; x=1764583729; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=9Fs3gD4ZDZl88AOfCN6PkViaymokcZX2oa8oa+/ySW0=;
        b=Cmh6xNe7PNwr4A6vJSG24yXe/RjrxY7MgmNwqqR5OPhO5ur5lqv2jVfoCLW5EtmM5w
         1WM5pt1zenwYTl4bmw56xlWtkiZyDMe0+9xh8DA6HLADrGLbNVUTUkxqQbldfe+xZfyJ
         rfvJJ+R8SpF8st8talJGAVuCTe6toapu75y9lkuPllWibLE93/qhNO4q+kKdGe/0z3oN
         kh6kMQ3pxZiMP/OSMs+sJiilQyW1Qh30nwWX7uCOUT3ExhKsq9ya2nGJ3e/IuGLU1yzw
         r4NzB6XwyIiFruhvZdp8c2lhlPuYGsmfXmyBPr7gVwysnC6PNs/i490eW7trgFma0XGI
         tI6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763978929; x=1764583729;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Fs3gD4ZDZl88AOfCN6PkViaymokcZX2oa8oa+/ySW0=;
        b=lz0RMZ5fU2WSUi/3NgeNOBfbgyRrpdMnN0XKu7ehus/5OOqLGUEy8uFLIWJOFgwcAW
         mwEuamhLh8DiVuE0J+mBTPykihS7gFj+GRX4zFETsB3x5UmPVFofdpmRVEWLT8IpWkj0
         pvjwIQrzjeZXU4mckV9MP62jRodA3UwohBK8QqBjjluMXtQBCXBvl7O7/XTuH4Orpvi1
         A2lRxNEqZta4xvB+Jas3unWEyUj/PjZE1TqTq2u5yfcAO74Tk+sIJKRcgg+sB9TL1BF6
         rA2sKGn3cDNNs1C/uvfnoeauhT6IqLVL4EtFYnyqG0YCNoDWhVKQm/beds2xSB0nBGEY
         wjVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFSSupXne0dRs8I9Uqh9WN8W/9RLljKVwP4pdR9X+gvrzgGcfDuhdzYJVF2b6ulmhpFHSP3Mppzy8=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzoIDkP2X55O7WLhDYckIUcyCOnl3Sq1NCwqjNhh3vjMGLUwGbc
	I2qzqsbrDMdW6X2k4NguCKuht1e29TsYwloR8OmN6/TydTb8kM0p5XYKuFIMG96a1Q==
X-Gm-Gg: ASbGncvR2iP0d5mL+vi3pmJCRDdjG+zhrY1Rd5exQGbJSxYHMOQh9amud1zf6l+yP9W
	JihOmVFeJHRIbHSfqqdLg6OrARfYyrbjinPdJpTNjiDE25maqDEKEPfI/U6pklVlZ9XfEy486g3
	piTCSPSDwhgllfObgT4bSuj0vh+FNYNbBtdNYryuyszoJq3PIJcScyGeQeHGWoRna90ghrPDM1F
	MZdxiS/0j06fGMAwEqdxBjZ+RyaHUqTQL13Ud7s2Ztg4zMzgEc0Jky6I2XcMQO93Sg2sYiRfgti
	qn6vTUzRdOtp1sNgl5y3bY51oAc60S1Yc75jxWxVr2Yq9HJYiFCkVe2meuAnglOwHWng25wp85G
	TftUT+5LySrub+F/hedfp0eLgnD6hn/N+RYokTHkZgtHjlA75Y4i5JwSNez3kRQpnPponpV3M7y
	VSPVJ4NkKffxEWoY7T/gqDVo8lHrYXbpwN+XcHWEOFlpYJpMzBct9M7RBbQ17y2rB2hlVpUQwkk
	18=
X-Google-Smtp-Source: AGHT+IG3OFtIjeTBWOE7RPdAXJZ/V34haFrWgYYOYDnxRC0X/ACk2ov3cZiKBz139J2b/y4jJywEwg==
X-Received: by 2002:a05:600c:5952:b0:477:3fcf:368c with SMTP id 5b1f17b1804b1-477b9ee4fbfmr102810185e9.9.1763978929247;
        Mon, 24 Nov 2025 02:08:49 -0800 (PST)
Message-ID: <0256fa42-59d9-4d0e-b439-0a89217a207e@suse.com>
Date: Mon, 24 Nov 2025 11:08:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH v4] xen/x86: guest_access: optimize raw_x_guest() for
 PV and HVM combinations
From: Jan Beulich <jbeulich@suse.com>
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 Alejandro Vallejo <alejandro.garciavallejo@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20251114140117.270461-1-grygorii_strashko@epam.com>
 <11c3929a-977b-4ef8-aaaa-9aea01657b04@suse.com>
 <fdd51da7-c8dc-4c0f-aaaf-a9fd2094bcd4@epam.com>
 <567f2759-fa03-43bd-9ae4-75e0e3811b60@suse.com>
 <276968a6-4688-48bb-b0a1-5270ad3f0002@epam.com>
 <081b0989-79fc-4cf2-9527-0dcd2d91d518@suse.com>
Content-Language: en-US
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
In-Reply-To: <081b0989-79fc-4cf2-9527-0dcd2d91d518@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 20.11.2025 09:11, Jan Beulich wrote:
> On 19.11.2025 20:36, Grygorii Strashko wrote:
>> Hi Jan
>>
>> On 18.11.25 15:45, Jan Beulich wrote:
>>> On 18.11.2025 14:08, Grygorii Strashko wrote:
>>>> On 17.11.25 18:43, Jan Beulich wrote:
>>>>> On 14.11.2025 15:01, Grygorii Strashko wrote:
>>>>>> --- a/xen/arch/x86/pv/Makefile
>>>>>> +++ b/xen/arch/x86/pv/Makefile
>>>>>> @@ -14,6 +14,10 @@ obj-y += ro-page-fault.o
>>>>>>    obj-$(CONFIG_PV_SHIM) += shim.o
>>>>>>    obj-$(CONFIG_TRACEBUFFER) += trace.o
>>>>>>    obj-y += traps.o
>>>>>> +obj-$(CONFIG_PV) += usercopy.o
>>>>>
>>>>> Just obj-y with the movement.
>>>>>
>>>>> However, is the movement (and was the adding of $(CONFIG_PV) in the earlier
>>>>> version) actually correct? The file also produces copy_{from,to}_unsafe_ll(),
>>>>> which aren't PV-specific. This may be only a latent issue right now, as we
>>>>> have only a single use site of copy_from_unsafe(), but those functions need
>>>>> to remain available. (We may want to arrange for them to be removed when
>>>>> linking, as long as they're not referenced. But that's a separate topic.)
>>>>
>>>> It is confusing that none of build cfg combinations have failed
>>>> (HVM=y PV=n, HVM=n PV=n) :(
>>>>
>>>> copy_to_unsafe_ll()
>>>> - called from copy_to_unsafe()
>>>> - copy_to_unsafe() has no users (unreachable, MISRA 2.1?)
>>>>
>>>> copy_from_unsafe_ll()
>>>> - called from copy_from_unsafe()
>>>> - copy_from_unsafe() called from one place do_invalid_op() with
>>>>     copy_from_unsafe(,, n = sizeof(bug_insn)).
>>>>     Due to __builtin_constant_p(n) check the copy_from_unsafe() call
>>>>     optimized by compiler to
>>>>     get_unsafe_size(*(uint16_t *)to, from, 2, UA_DROP, ret, 2);
>>>>
>>>> as result copy_from_unsafe_ll() is unreachable also (?).
>>>
>>> Yes, these likely all want to become library-like, so they are linked in only
>>> when actually referenced.
>>>
>>>> If those function are not subject to be removed, the
>>>>    usercopy.c can't be moved in "x86/pv", Right?
>>>
>>> That's my take, yes.
>>>
>>>> Making copy_{from,to}_unsafe_ll() available for !PV means
>>>> rewriting usercopy.c in some way, Right?
>>>
>>> "Re-writing" is probably too much, but some adjustments would be needed if
>>> you want to keep the "unsafe" functions but compile out the "guest" ones.
>>> It may be possible to compile the file twice, once from x86/pv/ and once
>>> from x86/, replacing the self-#include near the bottom of the file. The
>>> former would then produce the "guest" functions, the latter the "unsafe"
>>> ones.
>>
>> Below is the difference I came up with, will it work?
> 
> That'll be on you to make sure, but ...
> 
>> --- /dev/null
>> +++ b/xen/arch/x86/usercopy.c
>> @@ -0,0 +1,77 @@
>> +/*
>> + * User address space access functions.
>> + *
>> + * Copyright 1997 Andi Kleen <ak@muc.de>
>> + * Copyright 1997 Linus Torvalds
>> + * Copyright 2002 Andi Kleen <ak@suse.de>
>> + */
>> +
>> +#include <xen/lib.h>
>> +#include <xen/sched.h>
>> +#include <asm/uaccess.h>
>> +
>> +# define GUARD UA_DROP
>> +# define copy_to_guest_ll copy_to_unsafe_ll
>> +# define copy_from_guest_ll copy_from_unsafe_ll
>> +# undef __user
>> +# define __user
>> +
>> +unsigned int copy_to_guest_ll(void __user *to, const void *from, unsigned int n)
>> +{
>> +    GUARD(unsigned dummy);
>> +
>> +    stac();
>> +    asm_inline volatile (
>> +        GUARD(
>> +        "    guest_access_mask_ptr %[to], %q[scratch1], %q[scratch2]\n"
>> +        )
>> +        "1:  rep movsb\n"
>> +        "2:\n"
>> +        _ASM_EXTABLE(1b, 2b)
>> +        : [cnt] "+c" (n), [to] "+D" (to), [from] "+S" (from)
>> +          GUARD(, [scratch1] "=&r" (dummy), [scratch2] "=&r" (dummy))
>> +        :: "memory" );
>> +    clac();
>> +
>> +    return n;
>> +}
>> +
>> +unsigned int copy_from_guest_ll(void *to, const void __user *from, unsigned int n)
>> +{
>> +    unsigned dummy;
>> +
>> +    stac();
>> +    asm_inline volatile (
>> +        GUARD(
>> +        "    guest_access_mask_ptr %[from], %q[scratch1], %q[scratch2]\n"
>> +        )
>> +        "1:  rep movsb\n"
>> +        "2:\n"
>> +        ".section .fixup,\"ax\"\n"
>> +        "6:  mov  %[cnt], %k[from]\n"
>> +        "    xchg %%eax, %[aux]\n"
>> +        "    xor  %%eax, %%eax\n"
>> +        "    rep stosb\n"
>> +        "    xchg %[aux], %%eax\n"
>> +        "    mov  %k[from], %[cnt]\n"
>> +        "    jmp 2b\n"
>> +        ".previous\n"
>> +        _ASM_EXTABLE(1b, 6b)
>> +        : [cnt] "+c" (n), [to] "+D" (to), [from] "+S" (from),
>> +          [aux] "=&r" (dummy)
>> +          GUARD(, [scratch1] "=&r" (dummy), [scratch2] "=&r" (dummy))
>> +        :: "memory" );
>> +    clac();
>> +
>> +    return n;
>> +}
> 
> ... we don't want to have two instances of that code in the code base. One file
> should #include the other, after putting in place suitable #define-s. Which
> direction the #include should work I'm not entirely certain:
> - pv/usercopy.c including usercopy.c means usercopy.c then ends up misnamed,
> - usercopy.c including pv/usercopy.c means a "common" file includes a more
>   specialized (PV-only) one.

Likely it would be best to build this into library members (ideally one per
function), such that unused ones wouldn't even be pulled in by the linker. I
meant to suggest to move to xen/arch/x86/lib/, but right now we only have
xen/lib/x86/, where I don't think this would be a good fit. I've brought this
up with the other x86 maintainers ...

Jan

