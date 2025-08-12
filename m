Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3179B223BB
	for <lists+xen-devel@lfdr.de>; Tue, 12 Aug 2025 11:53:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1078496.1439523 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ullgS-00046x-61; Tue, 12 Aug 2025 09:52:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1078496.1439523; Tue, 12 Aug 2025 09:52:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ullgS-00044q-1n; Tue, 12 Aug 2025 09:52:44 +0000
Received: by outflank-mailman (input) for mailman id 1078496;
 Tue, 12 Aug 2025 09:52:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Pr65=2Y=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1ullgQ-00044k-U4
 for xen-devel@lists.xenproject.org; Tue, 12 Aug 2025 09:52:42 +0000
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [2a00:1450:4864:20::633])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 15e91980-7762-11f0-b898-0df219b8e170;
 Tue, 12 Aug 2025 11:52:40 +0200 (CEST)
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-af93381a1d2so837211266b.3
 for <xen-devel@lists.xenproject.org>; Tue, 12 Aug 2025 02:52:40 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af9584b1f55sm1774238766b.55.2025.08.12.02.52.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Aug 2025 02:52:39 -0700 (PDT)
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
X-Inumbo-ID: 15e91980-7762-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754992360; x=1755597160; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=4KCOhpC5MFyNzerObbwk81lyVYPNdv9MA0d5pPEgKVI=;
        b=FFCfiIbptf/6FCHKJrsW5mvqog1bG9yQLX5K8qIwCuHVMo9yr+NghZl2GrlIPwN7/m
         IrKUVGvSUYIvfFk+r8vqZ5vXaU6qg1uF5QjqvvOz2t0tQnAczxRxhxWf4Jo4whIWXH94
         pr0G7AMZW8oIN+jOl0fFSpEJH/d4b0PpGsQ52ExjS4y6/EZ8X3GaXb4u6gQOzWrhTQjJ
         Cuub3vC3mcPQ+661vxmE+eEJjIA0JLJvK3LAkiexqhVSe1ojTMIjmBUtq3RM7PnB0fqv
         bjaqyuq5Z3y3Neg6jy1rsmsewXcz7I7i1Px3emGqVaq94G6lN02HFdqHJp7clTTB2BTF
         xUQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754992360; x=1755597160;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4KCOhpC5MFyNzerObbwk81lyVYPNdv9MA0d5pPEgKVI=;
        b=MCZAytWZdtcTqYsFOhDNk6PVAK7j1TpNwHVZKl/Hp74r32etqOaVGNaFfafgpp8fjJ
         u+tFdQzOQsHnjzkmYAiGDVPp1HvcyNHKJzIVpi66UauX7ij0W1I3i9BmTlH3tvk5Q0wP
         TE+oMzk6uYvGwlogu3ryTs9mZdFOhi8qiBpQqJ9+nKmFbzadkhLrYVIEb9Di0ReOxAAZ
         wX/WUW8FMajRXuC1EAyL9h/VpPKRqyWqjInOKacRgdLRVO4NDGYMZ0GLYsSdfyz/MEAU
         TI7d2g6qkCETWWYgwFt+G/NXlqATpNtdVMd97EVvHDt7DPVCRciQfBaNMYMb7oA+YhwC
         X5+w==
X-Forwarded-Encrypted: i=1; AJvYcCWpNDXAhaekzoGSjY93ZMeetZH82HvSoRi80miLh4QFdIZ0tNUk8/bc5tn/VHLetezqooU7ySqpwqA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxYDlFehEJ95UCuMa36t/Kj1/OWbgSR75yazdRrBbjTJDoIGPta
	p30HOdT7Vbbt6mofp0DkEyJWCKH/n+Q1KynVYRspKbslq+wwncQdEftBTcAAc0TRD8ddaMlnfYB
	n5sQ=
X-Gm-Gg: ASbGncsOPQfQ+TAA47R3dGSm35sn/lGpoD/Z4XtZyA4HKwPZ/iLNQh8u1a8+8WVJiaL
	bC9+lrl1A0/rVglbKEpSr4/QbVwhlkDYBrOyzrdYZQI6SSFvIZFTS8Ypf3GvrT3b0q60hMY0bXe
	mwqwgksiqHixB6yhDp01eOhJJPuzeMEtVHq5OFE/lgkaJyN7PhCiDWsoWqRGW3RRblIll/kl9Fo
	RHkW6wJvSJcODSSkTmlsANjUC6OfcT8V0LYxPjEMjFDNq/81Al+5RJ0jmBsszEH6i3dxM3A86mM
	kIHXLMAoqvWytUiGU6fH4f8B9SeF1O2TOerC4IwLvZyjyZyqHtZ9X3IVL+fMRZfg3GnVVf9OXkg
	GXYTmHyMG2Rly1lG9t+piu3FMNvrOLcFhyYJySAXokn3CSA19o+gF3D+reGihm8mPWLxBswtolf
	Mqp4By+R5HbyBkpb9rFg==
X-Google-Smtp-Source: AGHT+IEMkFv200OoJkAiqsGuwEwV8QgkYjgILTyv9J4yVnL28Nnw8NU/RshLu3A+JVIzW1FPT4nAWQ==
X-Received: by 2002:a17:907:980f:b0:af9:c10d:746 with SMTP id a640c23a62f3a-afa1dfade34mr262331366b.10.1754992359935;
        Tue, 12 Aug 2025 02:52:39 -0700 (PDT)
Message-ID: <769ba73f-b490-43db-a056-fc1d95ec9f27@suse.com>
Date: Tue, 12 Aug 2025 11:52:38 +0200
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
In-Reply-To: <646c538a-850a-4370-8132-c06d9be8b422@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 11.08.2025 10:17, Andrew Cooper wrote:
> On 08/08/2025 9:23 pm, Andrew Cooper wrote:
>> ... along with the supporting functions.  Switch to Xen coding style, and make
>> static as there are no external callers.
>>
>> Rename to legacy_syscall_init() as a more accurate name.
>>
>> No functional change.
>>
>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>> ---
>> CC: Jan Beulich <JBeulich@suse.com>
>> CC: Roger Pau Monné <roger.pau@citrix.com>
>> ---
>>  xen/arch/x86/include/asm/system.h |  2 -
>>  xen/arch/x86/traps-setup.c        | 97 ++++++++++++++++++++++++++++++-
>>  xen/arch/x86/x86_64/traps.c       | 92 -----------------------------
>>  3 files changed, 95 insertions(+), 96 deletions(-)
>>
>> diff --git a/xen/arch/x86/include/asm/system.h b/xen/arch/x86/include/asm/system.h
>> index 3cdc56e4ba6d..6c2800d8158d 100644
>> --- a/xen/arch/x86/include/asm/system.h
>> +++ b/xen/arch/x86/include/asm/system.h
>> @@ -256,6 +256,4 @@ static inline int local_irq_is_enabled(void)
>>  #define BROKEN_ACPI_Sx          0x0001
>>  #define BROKEN_INIT_AFTER_S1    0x0002
>>  
>> -void subarch_percpu_traps_init(void);
>> -
>>  #endif
>> diff --git a/xen/arch/x86/traps-setup.c b/xen/arch/x86/traps-setup.c
>> index 13b8fcf0ba51..fbae7072c292 100644
>> --- a/xen/arch/x86/traps-setup.c
>> +++ b/xen/arch/x86/traps-setup.c
>> @@ -2,13 +2,15 @@
>>  /*
>>   * Configuration of event handling for all CPUs.
>>   */
>> +#include <xen/domain_page.h>
>>  #include <xen/init.h>
>>  #include <xen/param.h>
>>  
>> +#include <asm/endbr.h>
>>  #include <asm/idt.h>
>>  #include <asm/msr.h>
>>  #include <asm/shstk.h>
>> -#include <asm/system.h>
>> +#include <asm/stubs.h>
>>  #include <asm/traps.h>
>>  
>>  DEFINE_PER_CPU_READ_MOSTLY(idt_entry_t *, idt);
>> @@ -19,6 +21,8 @@ static bool __initdata opt_ler;
>>  boolean_param("ler", opt_ler);
>>  
>>  void nocall entry_PF(void);
>> +void nocall lstar_enter(void);
>> +void nocall cstar_enter(void);
>>  
>>  /*
>>   * Sets up system tables and descriptors for IDT devliery.
>> @@ -138,6 +142,95 @@ static void load_system_tables(void)
>>      BUG_ON(stack_bottom & 15);
>>  }
>>  
>> +static unsigned int write_stub_trampoline(
>> +    unsigned char *stub, unsigned long stub_va,
>> +    unsigned long stack_bottom, unsigned long target_va)
>> +{
>> +    unsigned char *p = stub;
>> +
>> +    if ( cpu_has_xen_ibt )
>> +    {
>> +        place_endbr64(p);
>> +        p += 4;
>> +    }
>> +
>> +    /* Store guest %rax into %ss slot */
>> +    /* movabsq %rax, stack_bottom - 8 */
>> +    *p++ = 0x48;
>> +    *p++ = 0xa3;
>> +    *(uint64_t *)p = stack_bottom - 8;
>> +    p += 8;
>> +
>> +    /* Store guest %rsp in %rax */
>> +    /* movq %rsp, %rax */
>> +    *p++ = 0x48;
>> +    *p++ = 0x89;
>> +    *p++ = 0xe0;
>> +
>> +    /* Switch to Xen stack */
>> +    /* movabsq $stack_bottom - 8, %rsp */
>> +    *p++ = 0x48;
>> +    *p++ = 0xbc;
>> +    *(uint64_t *)p = stack_bottom - 8;
>> +    p += 8;
>> +
>> +    /* jmp target_va */
>> +    *p++ = 0xe9;
>> +    *(int32_t *)p = target_va - (stub_va + (p - stub) + 4);
>> +    p += 4;
>> +
>> +    /* Round up to a multiple of 16 bytes. */
>> +    return ROUNDUP(p - stub, 16);
>> +}
>> +
>> +static void legacy_syscall_init(void)
>> +{
>> +    unsigned long stack_bottom = get_stack_bottom();
>> +    unsigned long stub_va = this_cpu(stubs.addr);
>> +    unsigned char *stub_page;
>> +    unsigned int offset;
>> +
>> +    /* No PV guests?  No need to set up SYSCALL/SYSENTER infrastructure. */
>> +    if ( !IS_ENABLED(CONFIG_PV) )
>> +        return;
>> +
>> +    stub_page = map_domain_page(_mfn(this_cpu(stubs.mfn)));
>> +
>> +    /*
>> +     * Trampoline for SYSCALL entry from 64-bit mode.  The VT-x HVM vcpu
>> +     * context switch logic relies on the SYSCALL trampoline being at the
>> +     * start of the stubs.
>> +     */
>> +    wrmsrl(MSR_LSTAR, stub_va);
>> +    offset = write_stub_trampoline(stub_page + (stub_va & ~PAGE_MASK),
>> +                                   stub_va, stack_bottom,
>> +                                   (unsigned long)lstar_enter);
>> +    stub_va += offset;
>> +
>> +    if ( cpu_has_sep )
>> +    {
>> +        /* SYSENTER entry. */
>> +        wrmsrl(MSR_IA32_SYSENTER_ESP, stack_bottom);
>> +        wrmsrl(MSR_IA32_SYSENTER_EIP, (unsigned long)sysenter_entry);
>> +        wrmsr(MSR_IA32_SYSENTER_CS, __HYPERVISOR_CS, 0);
>> +    }
>> +
>> +    /* Trampoline for SYSCALL entry from compatibility mode. */
>> +    wrmsrl(MSR_CSTAR, stub_va);
>> +    offset += write_stub_trampoline(stub_page + (stub_va & ~PAGE_MASK),
>> +                                    stub_va, stack_bottom,
>> +                                    (unsigned long)cstar_enter);
>> +
>> +    /* Don't consume more than half of the stub space here. */
>> +    ASSERT(offset <= STUB_BUF_SIZE / 2);
>> +
>> +    unmap_domain_page(stub_page);
>> +
>> +    /* Common SYSCALL parameters. */
>> +    wrmsrl(MSR_STAR, XEN_MSR_STAR);
>> +    wrmsrl(MSR_SYSCALL_MASK, XEN_SYSCALL_MASK);
>> +}
> 
> These want adjusting to use wrmsrns(), similarly to the previous patch. 
> Fixed locally.

Also the one higher in the function, I suppose.

Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

