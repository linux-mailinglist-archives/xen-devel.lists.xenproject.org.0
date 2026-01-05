Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DDD09CF4CDF
	for <lists+xen-devel@lfdr.de>; Mon, 05 Jan 2026 17:49:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1195654.1513579 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vcnkz-0006IF-Rt; Mon, 05 Jan 2026 16:48:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1195654.1513579; Mon, 05 Jan 2026 16:48:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vcnkz-0006GG-On; Mon, 05 Jan 2026 16:48:37 +0000
Received: by outflank-mailman (input) for mailman id 1195654;
 Mon, 05 Jan 2026 16:48:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VkFg=7K=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vcnky-0006Fo-9w
 for xen-devel@lists.xenproject.org; Mon, 05 Jan 2026 16:48:36 +0000
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5df10cd8-ea56-11f0-9ccf-f158ae23cfc8;
 Mon, 05 Jan 2026 17:48:31 +0100 (CET)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-47aa03d3326so1034585e9.3
 for <xen-devel@lists.xenproject.org>; Mon, 05 Jan 2026 08:48:31 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d7ee79168sm2487765e9.15.2026.01.05.08.48.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Jan 2026 08:48:30 -0800 (PST)
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
X-Inumbo-ID: 5df10cd8-ea56-11f0-9ccf-f158ae23cfc8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1767631711; x=1768236511; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=E09I5imYmWYeJj+EEPmVbW6LYOM7SpfXkaLt0CMgNbo=;
        b=A68nNRGpEhCiwTDo6y0FfH3yVu8elnvNu6u0AzAZLEZx61PTnOKX75jA+v5dycRr8q
         CExB3n/J06R77MuHiAk/RAyJXrF2O9e3pZNxWbfYwf1I40ANTcOrlrbMgDTf0u6mBf2Z
         TKWKiZTdq4/VKVGmlRvCtwSItKxrpJQboxzEzWmS+nDpNtmwVXPaIrO3aozPKh2Oaem+
         /90bpNiVnKAeDmxbPuhpkIrHn00S2xDw/1rxYIDACXDa3OpB24xFFk2r6zrUzft42rRZ
         tYc5sazDmvvCGVuF72bTjRLHcX+I5l4I0+fs1FZWGqULjPOjc1PYPoSyE2MZxgaERpTj
         jzoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767631711; x=1768236511;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E09I5imYmWYeJj+EEPmVbW6LYOM7SpfXkaLt0CMgNbo=;
        b=cGRv7hwpNxQBkL9wjVVY+EXf5pz6/EhQNUZOLSd13GbEWgqmd/pByZljKDOn8Huram
         +qn4fZR24b+XrHO31ngDSDkIBX+I7nSnPqOMOEN8GG5xM/xBO0IPuQFPXuDDPuMQHQUB
         /7y1VXGDzazUa8z8cPRZar/IsufUtTs5unvdYefryHxLwi2a9kkgaFOWXOkHAg4QzHtM
         IIFyGoFRLQhvBSJPot/cd3isjAZgzF1ytySVaaNKO/fUH1jWYpXeDasTSzIFij+VUdAP
         CNEHWLhuSVk9S9NQDibL/v8vBBJzfDZ/tQ0ClI9YvItScxUcdDMIrn4EWibqTroR+P3y
         gD1g==
X-Forwarded-Encrypted: i=1; AJvYcCUmV5qx0sgd7WAeZeGrkoEffeclfun4cm2Nr0s3YksrPymSEhLLq6vHeTqt9WweXF6dqt9AegxoBIA=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yz+jTUx0A6hPzW941woshWBehluYdkThFJK2EB+garS2MfQzzfm
	OqzIGlTHjdUFyFr7NSjkenI8+OWLLNSzTqDvy+TlpgcBsshmG/6RuGbLlQswZKc+XiaXxEX8rFg
	Ro8k=
X-Gm-Gg: AY/fxX6y35CgTGa0zRMWiXEL/bljXd44BKntysE1OQlQQmVf8QFnsG+ZNB3g5KR+h/E
	FcstpSnHNpodsV6/u61oEM+Rf0M6m+5NHJV5UhixjrRhe9R+tqz7fvg1rChrZMdH2ovt4eI9VV7
	dZ51Z7uu+lUk5ueZaYCglwBpiYM0FexaQI4sUFICI7y0D4z5Bm9R9XZxIHNn48Eb6VIpbve7pM8
	bSAJfwuUPsuvH9HEljPcWK8T3hKAM22mWg4XUzRgKV4Udygwpq2Jt+L29w9FWUjfg06vWWzdk3o
	+80pIN1kPst43TxdMDIB8hzhjq0BWjGafo/1hRK7ASx/qB1VzGRXysak+UHqEhDcL1mMmkqWCR3
	Y6jZj8RJZl3EpU2Zmck34wOTUPdpliCkyKk1hirhlRKCKbTMk1vpSx+dEMWwL9ukavmY2dhWx4d
	bbHQZg8M7FAnVllUfRL6Z+pya+STKdsRL1FFgIa7iZfDeWnuDB/DYLc7z+6DxYaGdaC93ewj7fX
	Xo=
X-Google-Smtp-Source: AGHT+IEJr6hXDvCpEsE99FObOMSKOczkJqcOtquEVpKhtfmXSLfCgqr7ukl7hsp8hGMEWSYHJ4iQVw==
X-Received: by 2002:a05:600c:858e:b0:47a:81b7:9a20 with SMTP id 5b1f17b1804b1-47d1c62930dmr467911725e9.9.1767631710726;
        Mon, 05 Jan 2026 08:48:30 -0800 (PST)
Message-ID: <daac660c-a797-4784-b902-665f4c85effe@suse.com>
Date: Mon, 5 Jan 2026 17:48:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] x86/i387: Rework fpu_fxrstor() given a newer
 toolchain baseline
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <20251230135427.188440-1-andrew.cooper3@citrix.com>
 <20251230135427.188440-4-andrew.cooper3@citrix.com>
 <662888ee-e983-4194-b8ca-f28560881c29@suse.com>
 <37ff7e30cc0715d619a20d7ea6ab72b5@bugseng.com>
 <31301264-0655-4cda-a66c-8768269e0c89@citrix.com>
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
In-Reply-To: <31301264-0655-4cda-a66c-8768269e0c89@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 05.01.2026 17:39, Andrew Cooper wrote:
> On 05/01/2026 4:13 pm, Nicola Vetrini wrote:
>> On 2026-01-05 16:52, Jan Beulich wrote:
>>> On 30.12.2025 14:54, Andrew Cooper wrote:
>>>> Use asm goto rather than hiding a memset() in the fixup section. 
>>>> With the
>>>> compiler now able to see the write into fpu_ctxt (as opposed to the asm
>>>> constraint erroneously stating it as input-only), it validly objects
>>>> to the
>>>> pointer being const.
>>>>
>>>> While FXRSTOR oughtn't to fault on an all-zeros input, avoid a risk
>>>> of an
>>>> infinite loop entirely by using a fixup scheme similar to xrstor(), and
>>>> crashing the domain if we run out options.
>>>
>>> Question being - does ...
>>>
>>>> --- a/xen/arch/x86/i387.c
>>>> +++ b/xen/arch/x86/i387.c
>>>> @@ -38,7 +38,8 @@ static inline void fpu_xrstor(struct vcpu *v,
>>>> uint64_t mask)
>>>>  /* Restore x87 FPU, MMX, SSE and SSE2 state */
>>>>  static inline void fpu_fxrstor(struct vcpu *v)
>>>>  {
>>>> -    const fpusse_t *fpu_ctxt = &v->arch.xsave_area->fpu_sse;
>>>> +    fpusse_t *fpu_ctxt = &v->arch.xsave_area->fpu_sse;
>>>> +    unsigned int faults = 0;
>>>>
>>>>      /*
>>>>       * Some CPUs don't save/restore FDP/FIP/FOP unless an exception
>>>> @@ -59,49 +60,41 @@ static inline void fpu_fxrstor(struct vcpu *v)
>>>>       * possibility, which may occur if the block was passed to us
>>>> by control
>>>>       * tools or through VCPUOP_initialise, by silently clearing the
>>>> block.
>>>>       */
>>>> + retry:
>>>>      switch ( __builtin_expect(fpu_ctxt->x[FPU_WORD_SIZE_OFFSET], 8) )
>>>>      {
>>>>      default:
>>>> -        asm_inline volatile (
>>>> +        asm_inline volatile goto (
>>>>              "1: fxrstorq %0\n"
>>>> -            ".section .fixup,\"ax\"   \n"
>>>> -            "2: push %%"__OP"ax       \n"
>>>> -            "   push %%"__OP"cx       \n"
>>>> -            "   push %%"__OP"di       \n"
>>>> -            "   lea  %0,%%"__OP"di    \n"
>>>> -            "   mov  %1,%%ecx         \n"
>>>> -            "   xor  %%eax,%%eax      \n"
>>>> -            "   rep ; stosl           \n"
>>>> -            "   pop  %%"__OP"di       \n"
>>>> -            "   pop  %%"__OP"cx       \n"
>>>> -            "   pop  %%"__OP"ax       \n"
>>>> -            "   jmp  1b               \n"
>>>> -            ".previous                \n"
>>>> -            _ASM_EXTABLE(1b, 2b)
>>>> -            :
>>>> -            : "m" (*fpu_ctxt), "i" (sizeof(*fpu_ctxt) / 4) );
>>>> +            _ASM_EXTABLE(1b, %l[fault])
>>>> +            :: "m" (*fpu_ctxt)
>>>> +            :: fault );
>>>>          break;
>>>> +
>>>>      case 4: case 2:
>>>> -        asm_inline volatile (
>>>> -            "1: fxrstor %0         \n"
>>>> -            ".section .fixup,\"ax\"\n"
>>>> -            "2: push %%"__OP"ax    \n"
>>>> -            "   push %%"__OP"cx    \n"
>>>> -            "   push %%"__OP"di    \n"
>>>> -            "   lea  %0,%%"__OP"di \n"
>>>> -            "   mov  %1,%%ecx      \n"
>>>> -            "   xor  %%eax,%%eax   \n"
>>>> -            "   rep ; stosl        \n"
>>>> -            "   pop  %%"__OP"di    \n"
>>>> -            "   pop  %%"__OP"cx    \n"
>>>> -            "   pop  %%"__OP"ax    \n"
>>>> -            "   jmp  1b            \n"
>>>> -            ".previous             \n"
>>>> -            _ASM_EXTABLE(1b, 2b)
>>>> -            :
>>>> -            : "m" (*fpu_ctxt), "i" (sizeof(*fpu_ctxt) / 4) );
>>>> +        asm_inline volatile goto (
>>>> +            "1: fxrstor %0\n"
>>>> +            _ASM_EXTABLE(1b, %l[fault])
>>>> +            :: "m" (*fpu_ctxt)
>>>> +            :: fault );
>>>>          break;
>>>>      }
>>>> +
>>>> +    return;
>>>> +
>>>> + fault:
>>>> +    faults++;
>>>> +
>>>> +    switch ( faults )
>>>> +    {
>>>> +    case 1: /* Stage 1: Reset all state. */
>>>> +        memset(fpu_ctxt, 0, sizeof(*fpu_ctxt));
>>>> +        goto retry;
>>>> +
>>>> +    default: /* Stage 2: Nothing else to do. */
>>>> +        domain_crash(v->domain, "Uncorrectable FXRSTOR fault\n");
>>>> +        return;
>>>
>>> ... this then count as unreachable and/or dead code in Misra's terms?
>>> Nicola?
>>> Sure, Eclair wouldn't be able to spot it, but that's no excuse imo.
>>
>> Right now, probably not, but even if it did, an ASSERT_UNREACHABLE can
>> be added in the default branch to deal with that.
> 
> It's fully reachable.
> 
> FXRSTOR can fault multiple times, and can fault for reasons unrelated to
> the contents of the buffer.  Fault recovery isn't even limited to only
> #GP[0] only, and FXRSTOR can suffer #AC from a misaligned pointer.

None of these faults are what we mean to recover from here. Faults
unrelated to buffer contents would pretty likely occur on the memset()
as well.

As to #AC - in ring 3, but not in ring 0 (where Xen runs)?

> If Xen is operating properly, it oughtn't to fault more than once, but
> right now the logic will livelock rather than terminate.

s/will/would/ as that's only hypothetical (assuming no other bugs).

> Further fixes being discussed (better auditing of toolstack-provided
> buffers) should cause it never to fault for buffer-contents reasons, at
> which point I'll be removing the retry aspect and escalating to
> domain_crash() unconditionally.

Still in the meantime I think Nicola's suggestion should be taken
and ASSERT_UNREACHABLE() be added. Then
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

