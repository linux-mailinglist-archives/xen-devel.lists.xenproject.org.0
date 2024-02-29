Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F57986C37A
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 09:29:21 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686882.1069458 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfbmS-0001ud-8r; Thu, 29 Feb 2024 08:28:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686882.1069458; Thu, 29 Feb 2024 08:28:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfbmS-0001sl-65; Thu, 29 Feb 2024 08:28:40 +0000
Received: by outflank-mailman (input) for mailman id 686882;
 Thu, 29 Feb 2024 08:28:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=x8AV=KG=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1rfbmQ-0001sf-37
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 08:28:38 +0000
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [2a00:1450:4864:20::631])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 876c283e-d6dc-11ee-a1ee-f123f15fe8a2;
 Thu, 29 Feb 2024 09:28:35 +0100 (CET)
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-a3e552eff09so80037566b.3
 for <xen-devel@lists.xenproject.org>; Thu, 29 Feb 2024 00:28:34 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 ch14-20020a170906c2ce00b00a42ea946917sm430382ejb.130.2024.02.29.00.28.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Feb 2024 00:28:34 -0800 (PST)
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
X-Inumbo-ID: 876c283e-d6dc-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1709195314; x=1709800114; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HHze7WSwz4Ru+J/UVMxo4r1+7P5s2XyBorYTfUVw/V8=;
        b=CX00drdmtr6Zq1E48ZBwlh6nI4wJTDoO29ltkPTzZIMZb/n7urLqpISosulUpel0Xx
         EZKyBj+mCYHGKQ3wJTyOL9K8ahtXrflLIhgGCLATPuzApByUSuzSH9goJ4M/R2xOZWJV
         yVp8Q0Lp6HHfybbo1/CoMtXySFJulmcveR1eLOdjSwPeak341mHxYnb4YhKkckiNcWjP
         ZrzbgFSFAdhAakfuVmLjd9HDvziwOanyEaNQamNoq8AN1gE30R3Lpages3imDjTl93t8
         VP0EKOrZUkZiNuCTHaTI4QNaSzIY/3gjmLWm8DQn3U0eI6wTtqcBn1pn72cy2ASokkIN
         CR9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709195314; x=1709800114;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HHze7WSwz4Ru+J/UVMxo4r1+7P5s2XyBorYTfUVw/V8=;
        b=UdZFmIMJpBYRcjbyEI2H8xLLnsrA7bXFtWhSdOoHI5bjzg66FUrETiWMjZulSWAXfL
         qAQpuhClzHVbGCryezaIF/dvHxfTEbmwC0VxrY3R49yedBTY23fo1MhNjfi7tFOKrSs+
         olvs50q0OUexd9UO9Xd2JqCEJ5rc+vmrAwoNq8ZYiRWNRKEuXHqU+IyHJ9ugvY3aNpvk
         HDwaIj4pBfAhuknf/hlarYMH98W+OSstTEA+4iDk6+jh6S2CgqHCl6D0T8aaKZHUvk79
         Z4lp3anPGMkLBSAJkf32qsgbrSoOwdOcHr1yD7wugmePA0E0jTbV+gfXHt15eWnWPyJJ
         dM3w==
X-Forwarded-Encrypted: i=1; AJvYcCUg+naYDFHi2XFEB+uAxERk4NtWgz22kdyhZbl+fS3jWpUgo76vi2T8vc9xOBE5oPLKGzD5MdOICkm8ohBbEXvwrpYnLT2wQ4Hz5HpIGDc=
X-Gm-Message-State: AOJu0YyA9TpzVr0wdAFJyQXWu6ZU/pivY+4zFMUGN98gHDud516qlVyX
	8kykvf75h6Bmm7mjpwhrOq7GZY0zRMTbUDO/wDJyWGKVrqWiBE1kCo/o0lXrOw==
X-Google-Smtp-Source: AGHT+IGDxMA8iN85HxphBrIKIO8VuFZSBfVVSQj8jsBlTz+YBLJf5FnkpiPXdVXTd9E/mGcGt22IAg==
X-Received: by 2002:a17:906:a88:b0:a3e:473d:e391 with SMTP id y8-20020a1709060a8800b00a3e473de391mr906719ejf.22.1709195314303;
        Thu, 29 Feb 2024 00:28:34 -0800 (PST)
Message-ID: <054d2605-c626-4ea2-b0e4-c0e50190e8e0@suse.com>
Date: Thu, 29 Feb 2024 09:28:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] x86: prefer shadow stack for producing call traces
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Wei Liu <wl@xen.org>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <33da6f8b-af22-48c8-acce-3aa55c0e0414@suse.com>
 <fdacbb8b-5a58-4d6b-89b2-ea98b4fed895@suse.com>
 <e687d4a1-efd8-4d7f-9c5d-8796bb99014a@citrix.com>
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
In-Reply-To: <e687d4a1-efd8-4d7f-9c5d-8796bb99014a@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 28.02.2024 17:15, Andrew Cooper wrote:
> On 28/02/2024 1:53 pm, Jan Beulich wrote:
>> --- a/xen/arch/x86/traps.c
>> +++ b/xen/arch/x86/traps.c
>> @@ -539,6 +544,50 @@ static void show_trace(const struct cpu_
>>           !is_active_kernel_text(tos) )
>>          printk("   [<%p>] R %pS\n", _p(regs->rip), _p(regs->rip));
>>  
>> +    if ( IS_ENABLED(CONFIG_XEN_SHSTK) && rdssp() != SSP_NO_SHSTK )
>> +    {
>> +        const unsigned long *ptr = _p(regs->entry_ssp);
>> +        unsigned int n;
>> +
>> +        for ( n = 0; (unsigned long)ptr & (PAGE_SIZE - sizeof(*ptr)); ++n )
>> +        {
>> +            unsigned long val = *ptr;
>> +
>> +            if ( is_active_kernel_text(val) || in_stub(val) )
>> +            {
>> +                /* Normal return address entry.  */
>> +                printk("   [<%p>] C %pS\n", _p(val), _p(val));
>> +                ++ptr;
>> +            }
>> +            else if ( !((val ^ *ptr) >> (PAGE_SHIFT + STACK_ORDER)) )
>> +            {
>> +                if ( val & (sizeof(val) - 1) )
>> +                {
>> +                    /* Most likely a supervisor token. */
>> +                    break;
>> +                }
> 
> Tokens are their own linear address, with metadata in the bottom two
> bits.  I think it would be better to check that explicitly, rather than
> assuming anything nonzero in the upper bits is a token.

Well, yes. What you don't say though is what to do in such an event
(other than simply breaking out of the loop). The lack of a clear route
here is why I've done it the "wider" way. And why hence the comment says
"likely".

>> +
>> +                /*
>> +                 * Ought to be a hypervisor interruption frame.  But don't
>> +                 * (re)log the current frame's %rip.
>> +                 */
>> +                if ( n || ptr[1] != regs->rip )
>> +                    printk("   [<%p>] E %pS\n", _p(ptr[1]), _p(ptr[1]));
>> +                ptr = _p(val);
>> +            }
>> +            else
>> +            {
>> +                /* Ought to be a PV guest hypercall/interruption frame.  */
>> +                printk("   %04lx:[<%p>] E\n", ptr[2], _p(ptr[1]));
>> +                ptr = 0;
> 
> On a CPL3 -> CPL0 transition, the guest's SSP is written back into
> MSR_PL3_SSP.  The supervisor token on MSR_PL0_SSP is marked busy (either
> automatically, or by SETSSBY), but nothing pertaining to CPL3 is pushed
> onto the supervisor shadow stack.
> 
> This is why we can move off an IST stack onto the primary stack when
> interrupting CPL3 with only a CLEARSSBSY/SETSSBSY pair, and no memmove()
> loop of WRSS's.
> 
> In other words, I'm pretty sure this is a dead codeapth.  (Or worse, if
> it happens not to  be dead, then the comment is misleading.)

IOW you're confirming the respective post-commit-message remark. Then, like
above, the question here similarly is: What's the most reasonable thing to
do in the final "else"?

> A CPL1 -> CPL0 transition does push an shstk interrupt frame, and not
> wanting to memmove() the shstk by 3 slots on a context switch is part of
> why I just disallowed PV32 guests when CET was active.

Hmm, yes, such would be needed when switching to PV32. When switching from
PV32, such moving wouldn't be necessary, would it? Upon exiting to ring3
the ring0 shadow stack isn't consulted (beyond an alignment check on SSP),
and upon next entry (from ring3) the proper base ring0 would be used
again. For VMX it would apparently be a matter of using the "load CET"
VM-exit control to get SSP similarly reset to its base value. For SVM I'm
afraid I can't find any explicit information in the PM as to what happens
during #VMEXIT (nor what, if anything, is saved by VMRUN).

Jan

