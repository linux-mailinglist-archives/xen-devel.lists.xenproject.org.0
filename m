Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B0EF0B26365
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 12:53:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1081508.1441586 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umVZl-0000fW-Lp; Thu, 14 Aug 2025 10:52:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1081508.1441586; Thu, 14 Aug 2025 10:52:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umVZl-0000cx-IP; Thu, 14 Aug 2025 10:52:53 +0000
Received: by outflank-mailman (input) for mailman id 1081508;
 Thu, 14 Aug 2025 10:52:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xqZt=22=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1umVZk-0000cr-BA
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 10:52:52 +0000
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [2a00:1450:4864:20::52c])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d2df2afc-78fc-11f0-a328-13f23c93f187;
 Thu, 14 Aug 2025 12:52:51 +0200 (CEST)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-6188b794743so1354377a12.3
 for <xen-devel@lists.xenproject.org>; Thu, 14 Aug 2025 03:52:51 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af91a21c076sm2541282366b.102.2025.08.14.03.52.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Aug 2025 03:52:50 -0700 (PDT)
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
X-Inumbo-ID: d2df2afc-78fc-11f0-a328-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755168771; x=1755773571; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lezYT3SvZLzF4P9U0wTJrL9LXUkMsne2pf9H833LEtE=;
        b=TwM9Rd6kWvIGYNYMw2zNH3lWKhXFvqOBAliYxXD4XSG5ZDDvU2/aThXyeI2lnplU5H
         rLFxNSkQHYBhNYfeTSqog1HfriDDlCew7tAbKsJhcT3WjQdgptOgIBfoLPQmhD1vZfoJ
         3/KVuJ9Qxoq0G2PwwwngfJ/9zgw/v1sbqmq8Ce3uIRjMy8m2fgBxESGrTi0i0lxU4ggH
         DeHekCEqd/RSlbSm0G62qu5efKL5m7DBaHkqAgqEfpACorxxMB/PCsqP2W33xjcw9RNn
         /H1HMaaf6b2UCiBSKce3cGwnCdDIOBGGuon+INO+2ZXm99nYnzvxC/4bq43rDn3MctZ1
         2kzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755168771; x=1755773571;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lezYT3SvZLzF4P9U0wTJrL9LXUkMsne2pf9H833LEtE=;
        b=DWqxm2eEXt4cPOtihGEe9whSI5kdZDKQZ3P64TU9Qm6/oRzMDS+c6WXnw0/Qgxn7dB
         FEBAmKpiptV5stz2NuRSUGtbb5eZQYMrpxCeQ2nxwBiSrFXUsFMNIFKG0ss00/dqVwiU
         Tslp/cYLw+hFmOmPYkfkLQI08Ox2sgmeox6Dw8I4zhLWP6RvAKv4GR5R798R1LXqktpi
         qad07EsB7akL9P9P3VQVUjViM1lk0Kt4XICBIUujsMMAHrU51Jo9/OZzXqHtLJZZHuke
         5VtEWh7+OXG5fQonBS//4VD9n5WO5gQU8/wcqUoMOhlDpOqjiQ7tdlVNKmXr4zD2bX07
         yBKg==
X-Forwarded-Encrypted: i=1; AJvYcCXcPMwoe/ltAqNxAbI3fVYHH8JOL4fDUoGmcsXtyYFqq1F/BbToadBHIeQc2rGnQt0mmDykra+eYBw=@lists.xenproject.org
X-Gm-Message-State: AOJu0YwxjrilHsV+nbf8UJk3PkwIMUNFdQiRQRD8kgYybyyGtcSKAlJt
	BRBR7rggPjK3T9UEBexSMgxcFk359lbQTgzxfMbm+1w5R8gom/c8dwZNS2Zo3pkHmg==
X-Gm-Gg: ASbGncsHwcze0eWVyvCIbo+1jCdQkLNtNYl+CfrDDjTbnAqyNCUiF6gxAg067NzuDOu
	U3y2WwK5d4UoanA1VDL8ROn1J7xMfSAKq2XaS1VbrfRRjBQZkjWZ/2xWe2fI6x7lKj793rydVJL
	s+51W38Viknz8+u9O5sRITwb+xEfgQPm4OF/ZRPM8DRNb5tGqO4o5nYnDIEBABcr02Sjpj+ePk3
	rd9lpb8ceB5XgXnOC42wmtEECwDnI2qOao3FCZ1HNfGcQU4YxQh8UeRxvAgABB4HyCp+HuHKoOb
	s6rDsZowep3gH7El2Y7y+YbwQZn4GVyd3ajczV4gAVkCvSKGUm1NzxSwBQOjGhcwe4Vl1C7Psde
	t26DITwfk09eUjgy/Z8jRkq6fs4d6+66uEc0q4sY6K4nifAY+UGLTgNkQY+WQ2mhZZx2ytBDnDq
	d71U5oyFkzGW1DnQc+Ag==
X-Google-Smtp-Source: AGHT+IG94TTioTDYCC10AAycrh0spbCdqsT4AIiNxfTLkdHgsL6jgK5mHp6VPzGqjSQ6ZMpYkbNydQ==
X-Received: by 2002:a17:906:f5aa:b0:afa:1d2c:2dc7 with SMTP id a640c23a62f3a-afcb9a46654mr277385166b.57.1755168770806;
        Thu, 14 Aug 2025 03:52:50 -0700 (PDT)
Message-ID: <50b2b50a-da3a-44f9-9fea-10e2426ad0e6@suse.com>
Date: Thu, 14 Aug 2025 12:52:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/22] x86/traps: Move subarch_percpu_traps_init() into
 traps-setup.c
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
 <20250808202314.1045968-11-andrew.cooper3@citrix.com>
 <646c538a-850a-4370-8132-c06d9be8b422@citrix.com>
 <769ba73f-b490-43db-a056-fc1d95ec9f27@suse.com>
 <3ff00f71-b16e-4426-98f5-27bc6f6b92cf@citrix.com>
 <d1a309bc-dc90-4383-a844-ebb9b668e0d2@suse.com>
 <fe98713c-664d-4e68-8cf5-eeb23e694c46@citrix.com>
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
In-Reply-To: <fe98713c-664d-4e68-8cf5-eeb23e694c46@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14.08.2025 12:17, Andrew Cooper wrote:
> On 14/08/2025 9:58 am, Jan Beulich wrote:
>> On 13.08.2025 13:53, Andrew Cooper wrote:
>>> On 12/08/2025 10:52 am, Jan Beulich wrote:
>>>> On 11.08.2025 10:17, Andrew Cooper wrote:
>>>>> On 08/08/2025 9:23 pm, Andrew Cooper wrote:
>>>>>> ... along with the supporting functions.  Switch to Xen coding style, and make
>>>>>> static as there are no external callers.
>>>>>>
>>>>>> Rename to legacy_syscall_init() as a more accurate name.
>>>>>>
>>>>>> No functional change.
>>>>>>
>>>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>>>> ---
>>>>>> CC: Jan Beulich <JBeulich@suse.com>
>>>>>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>>>>> ---
>>>>>>  xen/arch/x86/include/asm/system.h |  2 -
>>>>>>  xen/arch/x86/traps-setup.c        | 97 ++++++++++++++++++++++++++++++-
>>>>>>  xen/arch/x86/x86_64/traps.c       | 92 -----------------------------
>>>>>>  3 files changed, 95 insertions(+), 96 deletions(-)
>>>>>>
>>>>>> diff --git a/xen/arch/x86/include/asm/system.h b/xen/arch/x86/include/asm/system.h
>>>>>> index 3cdc56e4ba6d..6c2800d8158d 100644
>>>>>> --- a/xen/arch/x86/include/asm/system.h
>>>>>> +++ b/xen/arch/x86/include/asm/system.h
>>>>>> @@ -256,6 +256,4 @@ static inline int local_irq_is_enabled(void)
>>>>>>  #define BROKEN_ACPI_Sx          0x0001
>>>>>>  #define BROKEN_INIT_AFTER_S1    0x0002
>>>>>>  
>>>>>> -void subarch_percpu_traps_init(void);
>>>>>> -
>>>>>>  #endif
>>>>>> diff --git a/xen/arch/x86/traps-setup.c b/xen/arch/x86/traps-setup.c
>>>>>> index 13b8fcf0ba51..fbae7072c292 100644
>>>>>> --- a/xen/arch/x86/traps-setup.c
>>>>>> +++ b/xen/arch/x86/traps-setup.c
>>>>>> @@ -2,13 +2,15 @@
>>>>>>  /*
>>>>>>   * Configuration of event handling for all CPUs.
>>>>>>   */
>>>>>> +#include <xen/domain_page.h>
>>>>>>  #include <xen/init.h>
>>>>>>  #include <xen/param.h>
>>>>>>  
>>>>>> +#include <asm/endbr.h>
>>>>>>  #include <asm/idt.h>
>>>>>>  #include <asm/msr.h>
>>>>>>  #include <asm/shstk.h>
>>>>>> -#include <asm/system.h>
>>>>>> +#include <asm/stubs.h>
>>>>>>  #include <asm/traps.h>
>>>>>>  
>>>>>>  DEFINE_PER_CPU_READ_MOSTLY(idt_entry_t *, idt);
>>>>>> @@ -19,6 +21,8 @@ static bool __initdata opt_ler;
>>>>>>  boolean_param("ler", opt_ler);
>>>>>>  
>>>>>>  void nocall entry_PF(void);
>>>>>> +void nocall lstar_enter(void);
>>>>>> +void nocall cstar_enter(void);
>>>>>>  
>>>>>>  /*
>>>>>>   * Sets up system tables and descriptors for IDT devliery.
>>>>>> @@ -138,6 +142,95 @@ static void load_system_tables(void)
>>>>>>      BUG_ON(stack_bottom & 15);
>>>>>>  }
>>>>>>  
>>>>>> +static unsigned int write_stub_trampoline(
>>>>>> +    unsigned char *stub, unsigned long stub_va,
>>>>>> +    unsigned long stack_bottom, unsigned long target_va)
>>>>>> +{
>>>>>> +    unsigned char *p = stub;
>>>>>> +
>>>>>> +    if ( cpu_has_xen_ibt )
>>>>>> +    {
>>>>>> +        place_endbr64(p);
>>>>>> +        p += 4;
>>>>>> +    }
>>>>>> +
>>>>>> +    /* Store guest %rax into %ss slot */
>>>>>> +    /* movabsq %rax, stack_bottom - 8 */
>>>>>> +    *p++ = 0x48;
>>>>>> +    *p++ = 0xa3;
>>>>>> +    *(uint64_t *)p = stack_bottom - 8;
>>>>>> +    p += 8;
>>>>>> +
>>>>>> +    /* Store guest %rsp in %rax */
>>>>>> +    /* movq %rsp, %rax */
>>>>>> +    *p++ = 0x48;
>>>>>> +    *p++ = 0x89;
>>>>>> +    *p++ = 0xe0;
>>>>>> +
>>>>>> +    /* Switch to Xen stack */
>>>>>> +    /* movabsq $stack_bottom - 8, %rsp */
>>>>>> +    *p++ = 0x48;
>>>>>> +    *p++ = 0xbc;
>>>>>> +    *(uint64_t *)p = stack_bottom - 8;
>>>>>> +    p += 8;
>>>>>> +
>>>>>> +    /* jmp target_va */
>>>>>> +    *p++ = 0xe9;
>>>>>> +    *(int32_t *)p = target_va - (stub_va + (p - stub) + 4);
>>>>>> +    p += 4;
>>>>>> +
>>>>>> +    /* Round up to a multiple of 16 bytes. */
>>>>>> +    return ROUNDUP(p - stub, 16);
>>>>>> +}
>>>>>> +
>>>>>> +static void legacy_syscall_init(void)
>>>>>> +{
>>>>>> +    unsigned long stack_bottom = get_stack_bottom();
>>>>>> +    unsigned long stub_va = this_cpu(stubs.addr);
>>>>>> +    unsigned char *stub_page;
>>>>>> +    unsigned int offset;
>>>>>> +
>>>>>> +    /* No PV guests?  No need to set up SYSCALL/SYSENTER infrastructure. */
>>>>>> +    if ( !IS_ENABLED(CONFIG_PV) )
>>>>>> +        return;
>>>>>> +
>>>>>> +    stub_page = map_domain_page(_mfn(this_cpu(stubs.mfn)));
>>>>>> +
>>>>>> +    /*
>>>>>> +     * Trampoline for SYSCALL entry from 64-bit mode.  The VT-x HVM vcpu
>>>>>> +     * context switch logic relies on the SYSCALL trampoline being at the
>>>>>> +     * start of the stubs.
>>>>>> +     */
>>>>>> +    wrmsrl(MSR_LSTAR, stub_va);
>>>>>> +    offset = write_stub_trampoline(stub_page + (stub_va & ~PAGE_MASK),
>>>>>> +                                   stub_va, stack_bottom,
>>>>>> +                                   (unsigned long)lstar_enter);
>>>>>> +    stub_va += offset;
>>>>>> +
>>>>>> +    if ( cpu_has_sep )
>>>>>> +    {
>>>>>> +        /* SYSENTER entry. */
>>>>>> +        wrmsrl(MSR_IA32_SYSENTER_ESP, stack_bottom);
>>>>>> +        wrmsrl(MSR_IA32_SYSENTER_EIP, (unsigned long)sysenter_entry);
>>>>>> +        wrmsr(MSR_IA32_SYSENTER_CS, __HYPERVISOR_CS, 0);
>>>>>> +    }
>>>>>> +
>>>>>> +    /* Trampoline for SYSCALL entry from compatibility mode. */
>>>>>> +    wrmsrl(MSR_CSTAR, stub_va);
>>>>>> +    offset += write_stub_trampoline(stub_page + (stub_va & ~PAGE_MASK),
>>>>>> +                                    stub_va, stack_bottom,
>>>>>> +                                    (unsigned long)cstar_enter);
>>>>>> +
>>>>>> +    /* Don't consume more than half of the stub space here. */
>>>>>> +    ASSERT(offset <= STUB_BUF_SIZE / 2);
>>>>>> +
>>>>>> +    unmap_domain_page(stub_page);
>>>>>> +
>>>>>> +    /* Common SYSCALL parameters. */
>>>>>> +    wrmsrl(MSR_STAR, XEN_MSR_STAR);
>>>>>> +    wrmsrl(MSR_SYSCALL_MASK, XEN_SYSCALL_MASK);
>>>>>> +}
>>>>> These want adjusting to use wrmsrns(), similarly to the previous patch. 
>>>>> Fixed locally.
>>>> Also the one higher in the function, I suppose.
>>> All of them.
>>>
>>> I'm not aware of anywhere were we want serialising behaviour, except for
>>> ICR which is buggly non-serialising and has workarounds.
>>>
>>> But I'm also not sure enough of this to suggest that we make wrmsr() be
>>> wrmsrns() by default.
>> I'm pretty sure we don't want this. If nothing else then to avoid code bloat
>> for MSR writes which are non-serializing even in the original form.
> 
> Even that's complicated.
> 
> For FRED, FS/GS_BASE/KERN need changes because the lack of SWAPGS forces
> MSR accesses even if we do have FSGSBASE active.
> 
> Writes to these were made non-serialising in Zen2 and later, but are
> still serialising on Intel.  i.e. they need converting to WRMSRNS even
> though plain WRMSR would be "fine" on all AMD systems (either because
> it's the only option, or because it's non-serialising).

Right, such would need converting. But x2APIC MSR accesses, for example,
should have a need.

Jan

