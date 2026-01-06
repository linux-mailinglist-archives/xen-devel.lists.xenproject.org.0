Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB64CF72DD
	for <lists+xen-devel@lfdr.de>; Tue, 06 Jan 2026 09:00:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1195850.1513741 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vd1yt-0002cR-Jb; Tue, 06 Jan 2026 07:59:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1195850.1513741; Tue, 06 Jan 2026 07:59:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vd1yt-0002aF-Gr; Tue, 06 Jan 2026 07:59:55 +0000
Received: by outflank-mailman (input) for mailman id 1195850;
 Tue, 06 Jan 2026 07:59:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=jshP=7L=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vd1yr-0002a9-JT
 for xen-devel@lists.xenproject.org; Tue, 06 Jan 2026 07:59:53 +0000
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [2a00:1450:4864:20::336])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id acdff867-ead5-11f0-9ccf-f158ae23cfc8;
 Tue, 06 Jan 2026 08:59:49 +0100 (CET)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-477ba2c1ca2so7205085e9.2
 for <xen-devel@lists.xenproject.org>; Mon, 05 Jan 2026 23:59:49 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d7f695956sm28690045e9.6.2026.01.05.23.59.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jan 2026 23:59:48 -0800 (PST)
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
X-Inumbo-ID: acdff867-ead5-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767686389; x=1768291189; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=W+VElUht1tGQQpu9NmbvXUKqeP5mLf9xG4i5ZNxiFpA=;
        b=bRHB6ymlstNZ7j4zIOV4IVOfl+XR1U5x/alp6ugzRu5uB6Z5Qmti/9OyoKEPd+gGQD
         zwCtQndWEx2YNNrPIgm020/1BbS0VZlij9A9QiLpf+hHdv8VwSC/DJyw3U4Sf0QcpXzn
         mmeM52XQQSyYstcOXUYr+j54vCPcIvVdJbA16Qxcy+egys46J5RB+WYtXTZkBxqprOu9
         kFzZ/9q+H4NjC/NLCPO8FodT+fZbPCh/UjWa+r2EwCeCUSC2O9ZIA2gH99BtMZs9qQrp
         x1Bl1yb/aQ3dFOmsxwoD9YLcAQsYPx6Ox23yOj+IePiZ7NAe6KSIjZofPukYYsYqAaUQ
         fPYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767686389; x=1768291189;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W+VElUht1tGQQpu9NmbvXUKqeP5mLf9xG4i5ZNxiFpA=;
        b=WaVKGPTg0Ye/7mEa/lTFyAf/6cZ8D3A6pcNKpWrGDSY1tJ163TZZodmN+Z9CyuUUbf
         4zUuVr8EzU72pzNU69gNAhOH7Uf76aIwE9jQ42Za0FxK+/T0GATLbVuJe3f9OWarL/eD
         Q6p1SMZg5u1T2EcGNsyxiykPvnbyfFZ2WWFqAGqcY6HtwLZRAsZ2r2Ew1YWlQTQADGBz
         yJCvAbAofuFcFrIzdKvOYoe21qsU2CwR8xR6P0btd39oRkayxTP2nR4Tg6tK2sEzMRLH
         8NWkqSOTAklkcYm8ggawKxRIriXOFKGv2krjTdNH5+HDCyFcsmfw+v2FGLvkE+TE1076
         RsOA==
X-Forwarded-Encrypted: i=1; AJvYcCUSvyU7rT4AIlDxwGzm7G5OFQgwR/zdKepO04t3CroXJ4Ksr8M1+htnLa5022ECpZ/9Ukt6bAJzsUs=@lists.xenproject.org
X-Gm-Message-State: AOJu0Ywizej3cJCAfd/0WSIeqC7rkQzlorfi8QoxkMgtbT1PxPsZez0p
	y9IlGJxyy0Xn0tn3ksycbAPKJpE9wT6AM/Mjh1e3EZ9aK07BFEAQBEtyeqSmZ+ukjw==
X-Gm-Gg: AY/fxX5xzBqzXHbU/th3KOJChBlVGcyvWizsarLVw8uWvMsymj8+ls/W0Nb1g96UQcm
	+C4AGPhHyAYbFOofoQBF1gFDmVXlYvTneDoJ1QfK6lWcdy7SeHASPmQjAXZcmE+7MbrZ9ICrKFe
	FvVVmMUYKkPkIqeIsJVnKJmo/zFMQbumIqgitK18WESwSACBaTSZHn54DXgXhW52fm5iOZby2bi
	hyEJ3ZU1gH75doIJ1myCxe69XsCWKftWgIeXwUzYyhuBAxkmG7jpPzXZSoCtRSmgELWQuJa27Xn
	zW1/qkE7hnWwu3VbJ6WC3RFj4BodJldqAgRD04fD+PNzdNyKVxHKL8OQvWORmMrVrd51lkh5bik
	XFua1MR/Dwx6UWGF0acArvfgKc3ktm/U4Y6XQYJ9iCQNtFcn67e+p3S5O511wNPBm/qIKexhbq+
	RtPZTFVRoVfngcJVxOBYAtDvwClL8DcD609Z9uxV2X3WT+YkxkkTVKtJkda6tbC+tgLQEtatTlX
	Wtc4FNXJ0dsWQ==
X-Google-Smtp-Source: AGHT+IFYKMj4I83QfzjCwQYRl3JFmJb17JHz7QppLFZo3+Wnw+ch2w7irUPCn8yKIhaUidx0ICsv9Q==
X-Received: by 2002:a05:600c:1d1d:b0:479:1b0f:dfff with SMTP id 5b1f17b1804b1-47d7f073054mr22937385e9.10.1767686389260;
        Mon, 05 Jan 2026 23:59:49 -0800 (PST)
Message-ID: <6062efac-8285-4062-926f-dc3ece871654@suse.com>
Date: Tue, 6 Jan 2026 08:59:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] x86/xstate: Rework XSAVE/XRSTOR given a newer
 toolchain baseline
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20251230135427.188440-1-andrew.cooper3@citrix.com>
 <20251230135427.188440-3-andrew.cooper3@citrix.com>
 <4b051e1f-0d99-4637-b433-bade93e67e0a@suse.com>
 <e34ecbe6-5b74-451f-8540-037966f1be21@citrix.com>
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
In-Reply-To: <e34ecbe6-5b74-451f-8540-037966f1be21@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05.01.2026 18:45, Andrew Cooper wrote:
> On 05/01/2026 3:46 pm, Jan Beulich wrote:
>> On 30.12.2025 14:54, Andrew Cooper wrote:
>>> --- a/xen/arch/x86/xstate.c
>>> +++ b/xen/arch/x86/xstate.c
>>> @@ -310,21 +310,21 @@ void xsave(struct vcpu *v, uint64_t mask)
>>>      uint32_t hmask = mask >> 32;
>>>      uint32_t lmask = mask;
>>>      unsigned int fip_width = v->domain->arch.x87_fip_width;
>>> -#define XSAVE(pfx) \
>>> -        if ( v->arch.xcr0_accum & XSTATE_XSAVES_ONLY ) \
>>> -            asm volatile ( ".byte " pfx "0x0f,0xc7,0x2f\n" /* xsaves */ \
>>> -                           : "=m" (*ptr) \
>>> -                           : "a" (lmask), "d" (hmask), "D" (ptr) ); \
>>> -        else \
>>> -            alternative_io(".byte " pfx "0x0f,0xae,0x27\n", /* xsave */ \
>>> -                           ".byte " pfx "0x0f,0xae,0x37\n", /* xsaveopt */ \
>>> -                           X86_FEATURE_XSAVEOPT, \
>>> -                           "=m" (*ptr), \
>>> -                           "a" (lmask), "d" (hmask), "D" (ptr))
>>> +
>>> +#define XSAVE(pfx)                                                      \
>>> +    if ( v->arch.xcr0_accum & XSTATE_XSAVES_ONLY )                      \
>>> +        asm volatile ( "xsaves %0"                                      \
>>> +                       : "=m" (*ptr)                                    \
>>> +                       : "a" (lmask), "d" (hmask) );                    \
>>> +    else                                                                \
>>> +        alternative_io("xsave %0",                                      \
>>> +                       "xsaveopt %0", X86_FEATURE_XSAVEOPT,             \
>>> +                       "=m" (*ptr),                                     \
>>> +                       "a" (lmask), "d" (hmask))
>> While no doubt neater to read this way, there's a subtle latent issue here:
>> "m" doesn't exclude RIP-relative addressing, yet that addressing form can't
>> be used in replacement code (up and until we leverage your decode-lite to
>> actually be able to fix up the displacement).
> 
> I guess I'll fix that first.
> 
> I'm not interested in trying to keep playing games to work around
> deficiencies in our alternatives infrastructure.
> 
>>  Sadly "o" as a constraint
>> doesn't look to be any different in this regard (I think it should be, as
>> adding a "small integer" may already bring the displacement beyond the
>> permitted range, but their definition of "offsettable" allows this).
>>
>> This issue is latent until such time that (a) a caller appears passing in
>> the address of a Xen-internal variable and (b) we make LTO work again.
>> Since the breakage would be impossible to notice at build time, I think we
>> would be better off if we avoided it from the beginning. Which may mean
>> sacrificing on code gen, by using "r" and then "(%0)" as the insn operand.
> 
> Even with LTO, I don't see any plausible case where we have build-time
> struct vcpu's to pass in.

Sure, but struct vcpu * also isn't a great parameter for this kind of a
function.

>>> @@ -489,17 +484,17 @@ void xrstor(struct vcpu *v, uint64_t mask)
>>>              ptr->xsave_hdr.xcomp_bv = 0;
>>>          }
>>>          memset(ptr->xsave_hdr.reserved, 0, sizeof(ptr->xsave_hdr.reserved));
>>> -        continue;
>>> +        goto retry;
>>>  
>>>      case 2: /* Stage 2: Reset all state. */
>>>          ptr->fpu_sse.mxcsr = MXCSR_DEFAULT;
>>>          ptr->xsave_hdr.xstate_bv = 0;
>>>          ptr->xsave_hdr.xcomp_bv = v->arch.xcr0_accum & XSTATE_XSAVES_ONLY
>>>              ? XSTATE_COMPACTION_ENABLED : 0;
>>> -        continue;
>>> -    }
>>> +        goto retry;
>>>  
>>> -        domain_crash(current->domain);
>>> +    default: /* Stage 3: Nothing else to do. */
>>> +        domain_crash(v->domain, "Uncorrectable XRSTOR fault\n");
>>>          return;
>> There's an unexplained change here as to which domain is being crashed.
>> You switch to crashing the subject domain, yet if that's not also the
>> requester, it isn't "guilty" in causing the observed fault.
> 
> So dom0 should be crashed because there bad data in the migration stream?

Well, I'm not saying the behavior needs to stay like this, or that's it's
the best of all possible options. But in principle Dom0 could sanitize the
migration stream before passing it to Xen. So it is still first and foremost
Dom0 which is to blame.

> v is always curr.

Not quite - see xstate_set_init(). And for some of the callers of
hvm_update_guest_cr() I also don't think they always act on current. In
particular hvm_vcpu_reset_state() never does, I suppose (not the least
because of the vcpu_pause() in its sole caller).

>  XRSTOR can't be used correctly outside of the subject context,

Then are you suggesting e.g. xstate_set_init() is buggy?

> and indeed the Stage 2 logic above is definitely buggy when v != curr.

Apparently I'm blind, as I don't see an issue there. It's all v's data
which is being fiddled with.

Jan

