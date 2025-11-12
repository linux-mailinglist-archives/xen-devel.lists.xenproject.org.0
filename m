Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 20389C5260D
	for <lists+xen-devel@lfdr.de>; Wed, 12 Nov 2025 14:07:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1159921.1488183 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJAZ6-00082e-IJ; Wed, 12 Nov 2025 13:07:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1159921.1488183; Wed, 12 Nov 2025 13:07:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJAZ6-00080D-FA; Wed, 12 Nov 2025 13:07:12 +0000
Received: by outflank-mailman (input) for mailman id 1159921;
 Wed, 12 Nov 2025 13:07:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=K5hw=5U=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vJAZ4-000807-Qe
 for xen-devel@lists.xenproject.org; Wed, 12 Nov 2025 13:07:10 +0000
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [2a00:1450:4864:20::52e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7f08d486-bfc8-11f0-9d18-b5c5bf9af7f9;
 Wed, 12 Nov 2025 14:07:09 +0100 (CET)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-6419aaced59so1164637a12.0
 for <xen-devel@lists.xenproject.org>; Wed, 12 Nov 2025 05:07:09 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6411f713a68sm15924162a12.2.2025.11.12.05.07.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Nov 2025 05:07:08 -0800 (PST)
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
X-Inumbo-ID: 7f08d486-bfc8-11f0-9d18-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1762952829; x=1763557629; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QWayfFwJBjKTbKQ+piSMhN7FPcy9SGuz11nllg1LtV4=;
        b=RP4RL1EwC0thmwoTV25iMGK31YwrXfgP2zRzPiOCd13r3NRX+J4P+/iGY3UaS2GxFq
         P3MCpJxtWwW+yjF+SYJE3SWYNGFB7/cKmaGvELUJAIS33robspPuOsYEgYHJ6U6k+z8m
         G3auP6/QCIv0vJaFvEfVgYTfxzUiShr7RH38lNwoTfn6p6swhGLgc9E3wdprCDINzBaX
         0aVKmbKIuPMvj7qpE0fuTp9LVhMXUnJ70Xs+DrchfXmKRd0G5YEke97Heh4yQwSpTmtg
         O1jFRkPOeo2ZiP69B2/FDd1VW3LG4AhVWn6ATXttbscW/91IPZpr2LXuUfsirBks7GE9
         Xhtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762952829; x=1763557629;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QWayfFwJBjKTbKQ+piSMhN7FPcy9SGuz11nllg1LtV4=;
        b=NTUZbWgTSK/xUrbp0Mzztebr9p3/SbJo6Djsqui0bSTI8huJw9NNLVio1ns0JRfnla
         UqYkuzMH1yny1L/NZjPMAzuUt/xnZyDAIxhUcg4QhYQay7H3tiEKdzAGdefSwVrcL7O0
         GW0wMh9SNMqDJ5of0lQKLnxPYhObm/F12hQiRbaIgZwANReewyB6wJzYZhKsAs3kJT0A
         oUDqoS28nXsbzIIW5UwrcXtLmQM7TUHg6MQeDBsOby3XRIoc4/nUf8UahXTjqc71QmvO
         29YgzcNBWOsOVDsrwpImjUhT6kVuaJdGd2LTqAYb6ShbRrdF0+xZjtrsrXLOMHqNzq4l
         4k1A==
X-Forwarded-Encrypted: i=1; AJvYcCW8d9GbV1MFL1KXqjMh/qYOTn7QwUCtwaaI9DNGvgP6IV4R6/yJzTc4OSX5xdgSAsug6M+N1TCRYvM=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxKr/xDubmCw3lRPbrj3JYX312nS9CnWcjf418+2ktMe0U62Q5y
	Rp6FvBp/Nk7zM/xqZ2Zt7Gpn25zAxQCEa6jiqnLD4qKOjDdPgkrj9zi6QtGuJL/iyQ==
X-Gm-Gg: ASbGncvh1LM7YkqFj+K/tP2/tmwevzYtlOMu136x9v2YhxWUY1f0oBscC/C0+OMkgZw
	9lYmkNtWrZX+m33fzvnMiI7gm8/p+xOunMS340IH9mWFH76M2pmZqkvUofHCDRjLwE1cD63yXuM
	kPUK46hIWEPfsnEUUSdoHP8+6uai3jnhnl4rr0T+KqziX8nOhhfvHNFsF2nEHfeTACwLyhNsnVD
	6xPF0+0xb7KyYM5yRWsNXCoDjkrKbdPMRxo8JfvEPVaOfY0lie2zYBEuRNuuWnf/0CKJ/vXGrTw
	42tAHYuaxMc6wBFBFACJG18ub0PhL5/9CteqMzSwXs9x7Zd9Gip/yxQ/FeKyPNIHN/1ND8BBbqx
	wXPp7To4p+sxe9xe70lmVxRXLaXWFvK9WzRy48M1KJugNT5aL0fF9u6Ygh7823bVjPngrBm44y0
	olzHzjPnNq2QzZrQr9Gu5txGTEMXGjd7+thyY5HbL7m0qQW0w8kG1yzZYsBp6ZDvjD
X-Google-Smtp-Source: AGHT+IFqMKU2U5AXIRn+3EoRF0/+8pYGcgoFqL6hZwwwXYYffR1ju6ERKSn2zkPrlTuBLbghP6DERw==
X-Received: by 2002:a05:6402:2396:b0:641:27d8:ec3f with SMTP id 4fb4d7f45d1cf-6431a55e4c8mr1707075a12.29.1762952828836;
        Wed, 12 Nov 2025 05:07:08 -0800 (PST)
Message-ID: <be5586a8-bb32-448f-b249-538d1b65f626@suse.com>
Date: Wed, 12 Nov 2025 14:07:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN][PATCH v3] xen/x86: guest_access: optimize raw_x_guest() for
 PV and HVM combinations
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jason Andryuk <jason.andryuk@amd.com>, Teddy Astie <teddy.astie@vates.tech>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Lira, Victor M" <victlira@amd.com>
References: <20251107181739.3034098-1-grygorii_strashko@epam.com>
 <47f86a44-007f-4b90-9656-b2440238b2ba@suse.com>
 <f0a5a939-7d66-417d-8a88-34cc172623e6@epam.com>
 <faab050f-677f-469c-8bca-93c55a53165c@suse.com>
 <a858cfd2-c6cc-4ed1-bb12-8cad488f4542@epam.com>
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
In-Reply-To: <a858cfd2-c6cc-4ed1-bb12-8cad488f4542@epam.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12.11.2025 12:27, Grygorii Strashko wrote:
> 
> 
> On 12.11.25 08:38, Jan Beulich wrote:
>> On 11.11.2025 18:52, Grygorii Strashko wrote:
>>> On 10.11.25 09:11, Jan Beulich wrote:
>>>> On 07.11.2025 19:17, Grygorii Strashko wrote:
>>>>> --- a/xen/arch/x86/include/asm/guest_access.h
>>>>> +++ b/xen/arch/x86/include/asm/guest_access.h
>>>>> @@ -13,26 +13,64 @@
>>>>>    #include <asm/hvm/guest_access.h>
>>>>>      /* Raw access functions: no type checking. */
>>>>> -#define raw_copy_to_guest(dst, src, len)        \
>>>>> -    (is_hvm_vcpu(current) ?                     \
>>>>> -     copy_to_user_hvm((dst), (src), (len)) :    \
>>>>> -     copy_to_guest_pv(dst, src, len))
>>>>> -#define raw_copy_from_guest(dst, src, len)      \
>>>>> -    (is_hvm_vcpu(current) ?                     \
>>>>> -     copy_from_user_hvm((dst), (src), (len)) :  \
>>>>> -     copy_from_guest_pv(dst, src, len))
>>>>> -#define raw_clear_guest(dst,  len)              \
>>>>> -    (is_hvm_vcpu(current) ?                     \
>>>>> -     clear_user_hvm((dst), (len)) :             \
>>>>> -     clear_guest_pv(dst, len))
>>>>> -#define __raw_copy_to_guest(dst, src, len)      \
>>>>> -    (is_hvm_vcpu(current) ?                     \
>>>>> -     copy_to_user_hvm((dst), (src), (len)) :    \
>>>>> -     __copy_to_guest_pv(dst, src, len))
>>>>> -#define __raw_copy_from_guest(dst, src, len)    \
>>>>> -    (is_hvm_vcpu(current) ?                     \
>>>>> -     copy_from_user_hvm((dst), (src), (len)) :  \
>>>>> -     __copy_from_guest_pv(dst, src, len))
>>>>> +static inline bool raw_use_hvm_access(const struct vcpu *v)
>>>>> +{
>>>>> +    return IS_ENABLED(CONFIG_HVM) && (!IS_ENABLED(CONFIG_PV) || is_hvm_vcpu(v));
>>>>> +}
>>>>
>>>> Without a full audit (likely tedious and error prone) this still is a
>>>> behavioral change for some (likely unintended) use against a system domain
>>>> (likely the idle one): With HVM=y PV=n we'd suddenly use the HVM accessor
>>>> there. IOW imo the "system domains are implicitly PV" aspect wants
>>>> retaining, even if only "just in case". It's okay not to invoke the PV
>>>> accessor (but return "len" instead), but it's not okay to invoke the HVM
>>>> one.
>>>
>>> This patch is subset of "constify is_hvm_domain() for PV=n case" attempts.
>>>
>>> It was made under assumption that:
>>> "System domains do not have Guests running, so can't initiate hypecalls and
>>>   can not be users of copy_to/from_user() routines. There are no Guest and no user memory".
>>> [IDLE, COW, IO, XEN]
>>>
>>> If above assumption is correct - this patch was assumed safe.
>>>
>>> if not - it all make no sense, probably.
>>
>> I wouldn't go as far as saying that. It can be arranged to avid the corner
>> case I mentioned, I think.
> 
> do you mean adding "&& !is_system_domain(v->domain)" in raw_use_hvm_access()?

No, we want to avoid adding any new any runtime checks.

> Hm, I see that vcpu(s) are not even created for system domains in domain_create().
> So seems !is_system_domain(v->domain) == true always here.

"always" in what sense? It _should_ be always true, but in the unlikely event we
have a path where it isn't (which we could be sure of only after a full audit),
behavior there shouldn't change in the described problematic way.

> Am I missing smth?
> Or you meant smth. else?

I was thinking of something along the lines of

    if ( is_hvm_vcpu(current) )
        return ..._hvm();

    if ( !IS_ENABLED(CONFIG_PV) )
        return len;

    return ..._pv();

Jan

