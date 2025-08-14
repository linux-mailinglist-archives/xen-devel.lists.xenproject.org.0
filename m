Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89739B25FCC
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 10:58:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1081141.1441268 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umTmk-0006uG-EW; Thu, 14 Aug 2025 08:58:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1081141.1441268; Thu, 14 Aug 2025 08:58:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umTmk-0006rR-B6; Thu, 14 Aug 2025 08:58:10 +0000
Received: by outflank-mailman (input) for mailman id 1081141;
 Thu, 14 Aug 2025 08:58:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xqZt=22=suse.com=jbeulich@srs-se1.protection.inumbo.net>)
 id 1umTmj-0006rL-0x
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 08:58:09 +0000
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [2a00:1450:4864:20::62a])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cb18a2a0-78ec-11f0-b898-0df219b8e170;
 Thu, 14 Aug 2025 10:58:06 +0200 (CEST)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-afcb7a3a085so116630266b.2
 for <xen-devel@lists.xenproject.org>; Thu, 14 Aug 2025 01:58:06 -0700 (PDT)
Received: from [10.156.60.236] (ip-037-024-206-209.um08.pools.vodafone-ip.de.
 [37.24.206.209]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-af929c6a157sm2435099566b.91.2025.08.14.01.58.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Aug 2025 01:58:05 -0700 (PDT)
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
X-Inumbo-ID: cb18a2a0-78ec-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755161886; x=1755766686; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=v7zxseWO7fJ41t6X11VD6A//Wc+ZvOZijJ0WWNZHnGs=;
        b=KeSyides42XKgfk3FpPfJjSKb2hfhU0EE+2bytigcc/ZGpEvHOs5eGt7KK7EVMFkLB
         6CCJtPJcQFxn9gADvNf28knrM8IEkXnq2Djmb+i33vtLj8MTAP1qHz78id4nnBrG8H3N
         1AhOVzqCMVhhU7nK4M8sf/5UnyOREWy6vTBdRlT3quA8Tpp9Hacs2AG9Ngczdod2qToJ
         qrv5RyWO1HL9sPvRJS6bZfUUlbL+2hwyxkVL87iwAG0GLS2qRuUv9/Y53Gb++gcK9cdM
         jwXFv/brPUHX54tGLw0D5VmAQWEdIzHT2aw0UASWbYCF625/LUuM6VggiNyfeaPqD9NM
         eTjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755161886; x=1755766686;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v7zxseWO7fJ41t6X11VD6A//Wc+ZvOZijJ0WWNZHnGs=;
        b=Dv1AvTd4BQT0/VlZi+myg02p9gxyUVu8I+8XhZncGRraaJcfTILGu2hIqWYOMOoANg
         AZoA4cwA5qS7E0QglG6YZ2vZ3tC9RD4z1oKvjUG9xcVrzDfZ1TNQWT3ubdFNr/miMSAm
         avp+6ZbvErLWrBmbnwnsgIvlmoo4A+ggNkTgxAZPT44jxPHYfqvVucJ3pkY3mYIuT/fe
         dyJZNUVPUz7+Lf5ZMXwjH67p5qEe1NAHrwUz2TiwavJBa2BuxNOPoEWS6V5CVZqHkuUG
         EuXF0IwpJtnWt96XnWN+mrzdCEkjLVrtgn5fv6uGuFp9gJx4fXe9vM0mL4KvOlpv2k45
         U8TA==
X-Forwarded-Encrypted: i=1; AJvYcCXmSlmSTeAEi6i0CcHtp2otnMO9LNc27Gp6aGCqjhKzJzYHX+gThtOVJ+ih78CRAWFTlA26/f0GJek=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxG9Nat+b23j1DRZ2jNoQ94vINkT65GxWtYgCByUkt8TJhpqaN4
	BVfQKygk2G9e/eHQCtnCoQhX+B2jiWjpdhCY2NuJh3tpuKIRInSHZTlGkf+ieryJ6zgGXKyb4vz
	DXJE=
X-Gm-Gg: ASbGncv7nR2FvID9ikw6qCWpQm6f7DOpR4uafBVcA9PdAqK1OjRe79fI8H37EKfd/MD
	AmT1KrqUxlDzcRVL5vGIhbUlcoPvcu6iGSq2Dk/IJCNWLXtUa0OdFGbdI7EWnRBJ6NN8v4un+qa
	2FXC7BkxI7oIKmeaP1q+4kpx9ezDR6vT4JJfM2g3Jm2urk4UxKIOMONTMHgK9cmR37MpjDEgROX
	KEy3+foeVC98KSdoVsQv/i8Qq96WHqr7uDjQP1yQ48zYWdFfMhp1ObQFvtSVdCTP21lB6nJqcbn
	xvY8yLtAg6Q5ScYkIEpYsx6Ckcw+RPSiA0ioBJhy0gxMZYvjOdcf/PHo2gVJ855vUXBvs/r0oEa
	SGY5Fdcdzea5AL+mo5SmZXzGDgxH27S4Ot0DMUuWi4aknXuAksWgP5UZ8s3gSDtbbyBl1OYvj1f
	x6omGX3C4=
X-Google-Smtp-Source: AGHT+IHea2b9brVqjktVDTIR8Kz2UD1jotBaKgncHbZ2BLXaHy/JuPMgfb5+Za1y84qhfaSGAsgiJA==
X-Received: by 2002:a17:906:ef0b:b0:ae3:4f57:2110 with SMTP id a640c23a62f3a-afcb992522amr215157266b.54.1755161885791;
        Thu, 14 Aug 2025 01:58:05 -0700 (PDT)
Message-ID: <d1a309bc-dc90-4383-a844-ebb9b668e0d2@suse.com>
Date: Thu, 14 Aug 2025 10:58:03 +0200
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
In-Reply-To: <3ff00f71-b16e-4426-98f5-27bc6f6b92cf@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 13.08.2025 13:53, Andrew Cooper wrote:
> On 12/08/2025 10:52 am, Jan Beulich wrote:
>> On 11.08.2025 10:17, Andrew Cooper wrote:
>>> On 08/08/2025 9:23 pm, Andrew Cooper wrote:
>>>> ... along with the supporting functions.  Switch to Xen coding style, and make
>>>> static as there are no external callers.
>>>>
>>>> Rename to legacy_syscall_init() as a more accurate name.
>>>>
>>>> No functional change.
>>>>
>>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>>> ---
>>>> CC: Jan Beulich <JBeulich@suse.com>
>>>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>>> ---
>>>>  xen/arch/x86/include/asm/system.h |  2 -
>>>>  xen/arch/x86/traps-setup.c        | 97 ++++++++++++++++++++++++++++++-
>>>>  xen/arch/x86/x86_64/traps.c       | 92 -----------------------------
>>>>  3 files changed, 95 insertions(+), 96 deletions(-)
>>>>
>>>> diff --git a/xen/arch/x86/include/asm/system.h b/xen/arch/x86/include/asm/system.h
>>>> index 3cdc56e4ba6d..6c2800d8158d 100644
>>>> --- a/xen/arch/x86/include/asm/system.h
>>>> +++ b/xen/arch/x86/include/asm/system.h
>>>> @@ -256,6 +256,4 @@ static inline int local_irq_is_enabled(void)
>>>>  #define BROKEN_ACPI_Sx          0x0001
>>>>  #define BROKEN_INIT_AFTER_S1    0x0002
>>>>  
>>>> -void subarch_percpu_traps_init(void);
>>>> -
>>>>  #endif
>>>> diff --git a/xen/arch/x86/traps-setup.c b/xen/arch/x86/traps-setup.c
>>>> index 13b8fcf0ba51..fbae7072c292 100644
>>>> --- a/xen/arch/x86/traps-setup.c
>>>> +++ b/xen/arch/x86/traps-setup.c
>>>> @@ -2,13 +2,15 @@
>>>>  /*
>>>>   * Configuration of event handling for all CPUs.
>>>>   */
>>>> +#include <xen/domain_page.h>
>>>>  #include <xen/init.h>
>>>>  #include <xen/param.h>
>>>>  
>>>> +#include <asm/endbr.h>
>>>>  #include <asm/idt.h>
>>>>  #include <asm/msr.h>
>>>>  #include <asm/shstk.h>
>>>> -#include <asm/system.h>
>>>> +#include <asm/stubs.h>
>>>>  #include <asm/traps.h>
>>>>  
>>>>  DEFINE_PER_CPU_READ_MOSTLY(idt_entry_t *, idt);
>>>> @@ -19,6 +21,8 @@ static bool __initdata opt_ler;
>>>>  boolean_param("ler", opt_ler);
>>>>  
>>>>  void nocall entry_PF(void);
>>>> +void nocall lstar_enter(void);
>>>> +void nocall cstar_enter(void);
>>>>  
>>>>  /*
>>>>   * Sets up system tables and descriptors for IDT devliery.
>>>> @@ -138,6 +142,95 @@ static void load_system_tables(void)
>>>>      BUG_ON(stack_bottom & 15);
>>>>  }
>>>>  
>>>> +static unsigned int write_stub_trampoline(
>>>> +    unsigned char *stub, unsigned long stub_va,
>>>> +    unsigned long stack_bottom, unsigned long target_va)
>>>> +{
>>>> +    unsigned char *p = stub;
>>>> +
>>>> +    if ( cpu_has_xen_ibt )
>>>> +    {
>>>> +        place_endbr64(p);
>>>> +        p += 4;
>>>> +    }
>>>> +
>>>> +    /* Store guest %rax into %ss slot */
>>>> +    /* movabsq %rax, stack_bottom - 8 */
>>>> +    *p++ = 0x48;
>>>> +    *p++ = 0xa3;
>>>> +    *(uint64_t *)p = stack_bottom - 8;
>>>> +    p += 8;
>>>> +
>>>> +    /* Store guest %rsp in %rax */
>>>> +    /* movq %rsp, %rax */
>>>> +    *p++ = 0x48;
>>>> +    *p++ = 0x89;
>>>> +    *p++ = 0xe0;
>>>> +
>>>> +    /* Switch to Xen stack */
>>>> +    /* movabsq $stack_bottom - 8, %rsp */
>>>> +    *p++ = 0x48;
>>>> +    *p++ = 0xbc;
>>>> +    *(uint64_t *)p = stack_bottom - 8;
>>>> +    p += 8;
>>>> +
>>>> +    /* jmp target_va */
>>>> +    *p++ = 0xe9;
>>>> +    *(int32_t *)p = target_va - (stub_va + (p - stub) + 4);
>>>> +    p += 4;
>>>> +
>>>> +    /* Round up to a multiple of 16 bytes. */
>>>> +    return ROUNDUP(p - stub, 16);
>>>> +}
>>>> +
>>>> +static void legacy_syscall_init(void)
>>>> +{
>>>> +    unsigned long stack_bottom = get_stack_bottom();
>>>> +    unsigned long stub_va = this_cpu(stubs.addr);
>>>> +    unsigned char *stub_page;
>>>> +    unsigned int offset;
>>>> +
>>>> +    /* No PV guests?  No need to set up SYSCALL/SYSENTER infrastructure. */
>>>> +    if ( !IS_ENABLED(CONFIG_PV) )
>>>> +        return;
>>>> +
>>>> +    stub_page = map_domain_page(_mfn(this_cpu(stubs.mfn)));
>>>> +
>>>> +    /*
>>>> +     * Trampoline for SYSCALL entry from 64-bit mode.  The VT-x HVM vcpu
>>>> +     * context switch logic relies on the SYSCALL trampoline being at the
>>>> +     * start of the stubs.
>>>> +     */
>>>> +    wrmsrl(MSR_LSTAR, stub_va);
>>>> +    offset = write_stub_trampoline(stub_page + (stub_va & ~PAGE_MASK),
>>>> +                                   stub_va, stack_bottom,
>>>> +                                   (unsigned long)lstar_enter);
>>>> +    stub_va += offset;
>>>> +
>>>> +    if ( cpu_has_sep )
>>>> +    {
>>>> +        /* SYSENTER entry. */
>>>> +        wrmsrl(MSR_IA32_SYSENTER_ESP, stack_bottom);
>>>> +        wrmsrl(MSR_IA32_SYSENTER_EIP, (unsigned long)sysenter_entry);
>>>> +        wrmsr(MSR_IA32_SYSENTER_CS, __HYPERVISOR_CS, 0);
>>>> +    }
>>>> +
>>>> +    /* Trampoline for SYSCALL entry from compatibility mode. */
>>>> +    wrmsrl(MSR_CSTAR, stub_va);
>>>> +    offset += write_stub_trampoline(stub_page + (stub_va & ~PAGE_MASK),
>>>> +                                    stub_va, stack_bottom,
>>>> +                                    (unsigned long)cstar_enter);
>>>> +
>>>> +    /* Don't consume more than half of the stub space here. */
>>>> +    ASSERT(offset <= STUB_BUF_SIZE / 2);
>>>> +
>>>> +    unmap_domain_page(stub_page);
>>>> +
>>>> +    /* Common SYSCALL parameters. */
>>>> +    wrmsrl(MSR_STAR, XEN_MSR_STAR);
>>>> +    wrmsrl(MSR_SYSCALL_MASK, XEN_SYSCALL_MASK);
>>>> +}
>>> These want adjusting to use wrmsrns(), similarly to the previous patch. 
>>> Fixed locally.
>> Also the one higher in the function, I suppose.
> 
> All of them.
> 
> I'm not aware of anywhere were we want serialising behaviour, except for
> ICR which is buggly non-serialising and has workarounds.
> 
> But I'm also not sure enough of this to suggest that we make wrmsr() be
> wrmsrns() by default.

I'm pretty sure we don't want this. If nothing else then to avoid code bloat
for MSR writes which are non-serializing even in the original form.

Jan

