Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DCACB55A8
	for <lists+xen-devel@lfdr.de>; Thu, 11 Dec 2025 10:24:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1183717.1506318 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTctW-0004zB-UE; Thu, 11 Dec 2025 09:23:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1183717.1506318; Thu, 11 Dec 2025 09:23:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vTctW-0004xl-Rc; Thu, 11 Dec 2025 09:23:30 +0000
Received: by outflank-mailman (input) for mailman id 1183717;
 Thu, 11 Dec 2025 09:23:29 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+yrZ=6R=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1vTctV-0004xf-KI
 for xen-devel@lists.xenproject.org; Thu, 11 Dec 2025 09:23:29 +0000
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [2a00:1450:4864:20::32c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 0d51c1bf-d673-11f0-b15b-2bf370ae4941;
 Thu, 11 Dec 2025 10:23:28 +0100 (CET)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-47774d3536dso6659385e9.0
 for <xen-devel@lists.xenproject.org>; Thu, 11 Dec 2025 01:23:28 -0800 (PST)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47a89f74284sm25553135e9.9.2025.12.11.01.23.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Dec 2025 01:23:27 -0800 (PST)
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
X-Inumbo-ID: 0d51c1bf-d673-11f0-b15b-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1765445008; x=1766049808; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kNO9XuR2fhQM61QZ4gHtoS+xI87s6RFcxonDT/qIhXc=;
        b=I6PGtovGNOZASLWggGpytJqGIbDfq/L6+B0nYTvM697JgUOch2GgD3ykQ5Gkm9uEGu
         0XKmQ4lLUAR8xobQl18JDYcP28pfX4VxY+1iqHGS/iEfBSXHfFRRk8vvDl4xp+aqAxl/
         sAgC4nKc5QZjCxbYj1X/zl7WDig/QVf4z7uwOCwdW572MH40dPJsR4y1n6mDMFWfAX7P
         J1a43wzAiYJGdY9pEuv1VMF0vuCfKcbFOGvXH8hut/59Wmcmx3dcEXcSFMkXUmnBQUib
         Ls8zxSGFjRTLbQ56WtJrb0rxY2f4v0yOJGTvRyzTNqkbvl8ImjqdpvabCK3zYgF1m2ZX
         Z/kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765445008; x=1766049808;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kNO9XuR2fhQM61QZ4gHtoS+xI87s6RFcxonDT/qIhXc=;
        b=q8QVOC6+Y7QZChGtPJF24DuSmEYI+GFVY1qwTqnrsHeHykeVYxTpEX0XmoePR1SbTE
         6tV544BQ1tWFjAYs4pAetN9234giDTlBxcNi44+1rBqpluqXREIOHtsuOVigzcPyUovx
         C4pGZOuVZkgQostTfehyEg/H+FBHE19oESESl2+87XF2WH9rlR/jTB4hC26gX8sw/sL0
         erbva3nkql+MRRBHyARcc1bn/BxWLBMaHjylUxyU9vcYM4Utgfc8ebnP7x98gLyIH3Kj
         NFtScqXtumk5ql02okSLo4PjOqj5yCd7ighrk32wBWSdxGUr2eUdUYo4TVRk0L77lUA5
         CdOg==
X-Forwarded-Encrypted: i=1; AJvYcCU6aAXLmLgxfsrxd7R+D7hVMw/ZEu7Yfm9DWWgmrsKsrc09LgIN45VuHHCwFZ6RLOU5hxHJgp83nT0=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yxe1cx7XPFXhY4k8xA+qWiULbC7ZgIcYfhLpzxkWYOdgzqGKVay
	8sxtL9vTduxj6/AIvK8MH1jO9TYE2gtbHspSx09lvkANHfLPJM5v2GTu3NpNUluvFw==
X-Gm-Gg: AY/fxX5yhUVX5z9KgQglQrJmkE0i+zIuRebRpWhgrFhVcRM+BRs6wXS9TDvjLmGJz94
	+hOU3BRRkccqbXiQLRkpffPuh48LoPOy8qxgt0xurlJL1DQpH3OJ6N0OPtYtiJmFCEbU+fHMXhR
	rQwpSjOWCq4vHnOKVGvtUfjqCdYmufy66EgxOiDrJN/dZ/hx+SUSic1r3SKAr1SafrridWmLEOx
	2NjzlXehxC8cHPLKEpALh7V0aF9zcABEQ4dMId2sqt6zpDzgbBOODJWBduJeTP5RVqztesy2lzx
	uC3AVHaE7/EglVtB4w++R5M/Cyfs6KfKyvGgqRf3hSxoEWXCDSIxbXkv+Aj7ObPLAFziA52DrPC
	USJ4q2YBkPfl4n2Q1gvvDYKUR51fLclpyGPWqalYg+YMF+gPAcnauWZ5Lij5SECw7g7LALnivbS
	NTBL3Hx/HVYKvwS2sGBetZ3GH9Gq4HYEX+J5tfru1vFyQL0EYsQ1e0GSoPOP9rX3zzXmUdAPu9U
	t9Hat6lHfJbFw==
X-Google-Smtp-Source: AGHT+IE2G9UKETmAEgg9VgMKE92zhI1fwv913Bim39G+c/AJfrzY/Tjvd8GqZ9I9iesDSlqEiYV8yA==
X-Received: by 2002:a05:600c:46d0:b0:477:9fa0:7495 with SMTP id 5b1f17b1804b1-47a89fa781amr14610365e9.14.1765445007575;
        Thu, 11 Dec 2025 01:23:27 -0800 (PST)
Message-ID: <a6ab2189-bf24-4384-8b28-58729c7d0d9f@suse.com>
Date: Thu, 11 Dec 2025 10:23:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] xen/riscv: introduce vSBI extension framework
To: Oleksii Kurochko <oleksii.kurochko@gmail.com>
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bob Eshleman <bobbyeshleman@gmail.com>, Connor Davis
 <connojdavis@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony.perard@vates.tech>,
 Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
References: <cover.1764582112.git.oleksii.kurochko@gmail.com>
 <3b67330dc4c1aa053eb15261a559e7b4eac3f493.1764582112.git.oleksii.kurochko@gmail.com>
 <df316e2f-9eb0-4bb8-96cd-e5e0c42d123e@suse.com>
 <02b72d6f-d95b-4caf-825a-15280902af27@gmail.com>
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
In-Reply-To: <02b72d6f-d95b-4caf-825a-15280902af27@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10.12.2025 18:03, Oleksii Kurochko wrote:
> On 12/8/25 3:25 PM, Jan Beulich wrote:
>> On 01.12.2025 11:24, Oleksii Kurochko wrote:
>>> This commit introduces support for handling virtual SBI extensions in Xen.
>>>
>>> The changes include:
>>> - Added new vsbi.c and vsbi.h files to implement virtual SBI extension
>>>    handling.
>>> - Modified traps.c to handle CAUSE_VIRTUAL_SUPERVISOR_ECALL by calling
>>>    vsbi_handle_ecall() when the trap originates from VS-mode.
>>> - Updated xen.lds.S to include a new .vsbi.exts section for virtual SBI
>>>    extension data.
>>> - Updated Makefile to include the new vsbi/ directory in the build.
>>> - Add hstatus register to struct cpu_user_regs as it is needed for
>>>    a check that CAUSE_VIRTUAL_SUPERVISOR_ECALL happens from VS-mode.
>> I can spot the check, yes, but without the field ever being set how is one
>> to determine whether that check actually makes sense?
> 
> But hstatus is set automatically when a trap occurs and will be copied in
> handle_trap() in entry.S.

Just that entry.S isn't even touched by this series. Did you perhaps omit an
important part of the change?

> If you think it is better to introduce saving and restoring of hstatus in
> handle_trap() now, or instead drop the handling of
> “case CAUSE_VIRTUAL_SUPERVISOR_ECALL:” in do_trap(), please let me know.

I think what I said above is quite clear: When you introduce a field that's
supposed to be filled upon entry to the hypervisor, the entry code wants
updating accordingly.

>>> ---
>>>   xen/arch/riscv/Makefile                |  1 +
>>>   xen/arch/riscv/include/asm/processor.h |  1 +
>>>   xen/arch/riscv/include/asm/vsbi.h      | 31 +++++++++++++++++
>>>   xen/arch/riscv/traps.c                 |  8 +++++
>>>   xen/arch/riscv/vsbi/Makefile           |  1 +
>>>   xen/arch/riscv/vsbi/vsbi.c             | 46 ++++++++++++++++++++++++++
>> A file named identical to the directory it lives in raises the question of
>> why there is such a new sub-directory. Are you expecting moree files to
>> appear there?
> 
> Yes, I'm expecting that and it is done in the next patches of this patch
> series.
> 
>>   How's vsbi.c then be "special" compared to the others? Do
>> you perhaps mean someling like "core.c" or "common.c" here?
> 
> Agree, this is more appropriate for either “core.c” or “common.c”. Both options
> are fine with me. I slightly prefer using the prefix “vsbi-{core/common}.c”, but
> if you think it is better to omit the prefix since the folder name already
> provides that context, I’m fine with dropping it.

Yes, I'm actually quite heavily opposed to such redundant prefixes. They obfuscate
things, and they get in the way of name completion features in shells and alike.

>>> +static const struct vsbi_ext vsbi_ext_##ext __used                  \
>>> +__section(".vsbi.exts") = {                                         \
>>> +    .name = #ext,                                                   \
>>> +    .eid_start = extid_start,                                       \
>>> +    .eid_end = extid_end,                                           \
>>> +    .handle = extid_handle,
>>> +
>>> +#define VSBI_EXT_END                                                \
>>> +};
>> There's no use here, and peeking ahead at the other two patches shows
>> no use where this odd split of the macros would be necessary. What is
>> this about?
> 
> I thought this was the common approach, similar to DT_DEVICE, where we have
> DT_DEVICE_START and DT_DEVICE_END. There may be no need for it right now, but
> perhaps we will eventually want similar behavior for VSBI_EXT_START.

For DT_DEVICE_{START,END} there at least is a reason to have a split like
this. (I would very much like for that to be done without such a split, though.)

> If you think it is better to drop VSBI_EXT_END for now, I’m okay with that,
> and can just use VSBI_EXT instead of VSBI_EXT_START.

Yes please. If and when the need arises, it can be introduced, or (as per above)
a better solution be found.

>>> --- a/xen/arch/riscv/traps.c
>>> +++ b/xen/arch/riscv/traps.c
>>> @@ -15,6 +15,7 @@
>>>   #include <asm/processor.h>
>>>   #include <asm/riscv_encoding.h>
>>>   #include <asm/traps.h>
>>> +#include <asm/vsbi.h>
>>>   
>>>   /*
>>>    * Initialize the trap handling.
>>> @@ -114,6 +115,13 @@ void do_trap(struct cpu_user_regs *cpu_regs)
>>>   
>>>       switch ( cause )
>>>       {
>>> +    case CAUSE_VIRTUAL_SUPERVISOR_ECALL:
>>> +        if ( !(cpu_regs->hstatus & HSTATUS_SPV) )
>>> +            panic("CAUSE_VIRTUAL_SUPERVISOR_ECALL came not from VS-mode\n");
>> This might more naturally want to be BUG_ON()? Assuming of course the value
>> in question is exclusively under hypervisor control. Otherwise panic() would
>> also be wrong to use here.
> 
> Only hypervisor can access ->hstatus (of course, hart is changing it when a trap
> happens, for example).
> BUG_ON() is a good option for me.

Just to clarify: "can access" != "under control". There's also the possibility
that a guest could do something causing the hardware to raise a
CAUSE_VIRTUAL_SUPERVISOR_ECALL trap without setting HSTATUS_SPV. That was the
underlying question here.

>>> --- /dev/null
>>> +++ b/xen/arch/riscv/vsbi/vsbi.c
>>> @@ -0,0 +1,46 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-only */
>>> +
>>> +#include <xen/sched.h>
>>> +
>>> +#include <asm/processor.h>
>>> +#include <asm/sbi.h>
>>> +#include <asm/vsbi.h>
>>> +
>>> +extern const struct vsbi_ext _svsbi_exts[], _evsbi_exts[];
>>> +
>>> +const struct vsbi_ext *vsbi_find_extension(unsigned long ext_id)
>> static?
> 
> It could be use not in vsbi.c (for example, in the next patches it is used for
> SBI_EXT_BASE_PROBE_EXT), so it shouldn't be static.

Okay. In RISC-V that's okay as long as it's not subject to Misra scanning. Yet
still introducing a non-static function without callers from other CUs may
warrant a remark in the description. Once RISC-V becomes subject to Misra scans,
such will be problematic, after all.

>> Also, again - is the ext_ prefix adding any value here?
> 
> Not really, I guess.

Maybe, to still distinguish from "fid", use "eid" here then?

>>> +{
>>> +    const struct vsbi_ext *vsbi_ext;
>>> +
>>> +    for ( vsbi_ext = _svsbi_exts; vsbi_ext != _evsbi_exts; vsbi_ext++ )
>>> +        if ( ext_id >= vsbi_ext->eid_start &&
>>> +             ext_id <= vsbi_ext->eid_end )
>>> +            return vsbi_ext;
>> What if multiple entries have overlapping EID ranges?
> 
> Good question, I wasn't able to find that EID is always unique in SBI spec,
> but, at the same time, if to look at all available extensions and their id(s),
> they are always unique, so I expect that they will be always unique, otherwise,
> it won't be possible which extension should be used.

Then should there be a build-time (or if that's not easily possible, boot-
time) check?

>>> +void vsbi_handle_ecall(struct vcpu *vcpu, struct cpu_user_regs *regs)
>>> +{
>>> +    const unsigned long eid = regs->a7;
>>> +    const unsigned long fid = regs->a6;
>>> +    const struct vsbi_ext *ext = vsbi_find_extension(eid);
>>> +    int ret;
>>> +
>>> +    if ( ext && ext->handle )
>>> +        ret = ext->handle(vcpu, eid, fid, regs);
>> Is a registration record NULL handler pointer actually legitimate / useful?
>> (If there was range overlap checking I could see a reason to permit such.)
> 
> it is a good question, I think ext->handle = NULL should be impossible. At
> least, at the moment I can't come up with the case where it is possible and
> what will be a use case. I will drop ext->handle check.
> 
>>
>>> +    else
>>> +    {
>>> +        printk("Unsupported Guest SBI EID #%#lx, FID #%lu\n", eid, regs->a1);
>> Are the #-es ahead of the %-s adding value here?
> 
> It is how SBI spec writes them. For example,
>   9. Hart State Management Extension (EID #0x48534D "HSM") . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 26
>   9.1. Function: Hart start (FID #0) . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 27
> 
> So I thought that it would help to find stuff faster.

Okay. Maybe mention such in the description?

Jan

