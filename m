Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB412B248DF
	for <lists+xen-devel@lfdr.de>; Wed, 13 Aug 2025 13:54:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1079809.1440492 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umA3E-0005PD-8G; Wed, 13 Aug 2025 11:53:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1079809.1440492; Wed, 13 Aug 2025 11:53:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umA3E-0005Nj-4a; Wed, 13 Aug 2025 11:53:52 +0000
Received: by outflank-mailman (input) for mailman id 1079809;
 Wed, 13 Aug 2025 11:53:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2/kn=2Z=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1umA3C-0005Nd-BL
 for xen-devel@lists.xenproject.org; Wed, 13 Aug 2025 11:53:50 +0000
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [2a00:1450:4864:20::333])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2bed270c-783c-11f0-b898-0df219b8e170;
 Wed, 13 Aug 2025 13:53:48 +0200 (CEST)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-45a15fd04d9so5743625e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 13 Aug 2025 04:53:48 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45a16dfdb01sm30261665e9.26.2025.08.13.04.53.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Aug 2025 04:53:46 -0700 (PDT)
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
X-Inumbo-ID: 2bed270c-783c-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755086027; x=1755690827; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sEgN1NBRp2UQbu6ugHzoR/y9qKrCo5852koNe2J45jY=;
        b=uP8C4mKoTxCz01BNaRda7c6ogzKtbzEcy30mSXQ3TAL8XAJSxubUNowij32BuMCj9X
         M+2ZodZGXnEKkAc8LolXnSNNFkrYp40qB4ql4soZjyWaDQLpv5ct/idyO3gHOyAbvv+X
         RBXK8KsK7tnpdMGhzMmMfGSLcg7jhq4GoNMe8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755086027; x=1755690827;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sEgN1NBRp2UQbu6ugHzoR/y9qKrCo5852koNe2J45jY=;
        b=rgx1obvC32EWtZbJAWJCGTxlf7O5agxbm9sor/MO3gd8zZSRb4o7bhtWlRiAFMCHiK
         5ifCBbXH2qOg/NqCYtmFuyXAAVS5au9kLaNdnkGXVwpZFqj2zJxKjBFuleQwnu+DTyQN
         XeQNV0u8kHmL1mz8TqfaNrsgW2WCUo6Q5MhawWecheMZ7NxB2JW1WG6pwgVtnO3A1N7p
         jUmHgLtRRVpNMR3bDgdtKjHWA5oa5n9lw3yONQYbzWq3Xoo6appDa9P6n2xGmByR8I8K
         9pSAljkMGjaiDj/I27kaY3Ng50kZBMj3e873F4p81HsrpWSUgV3qRNC5CxxcyUPSXRI7
         G0JQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHZRpa/eYiEJ9R2Ee+SqMae8ItrRqTupc6tI8VKOh0A8Ow0lTuSUsqJOQ4T64nOhuwDdJ/iu/qkGA=@lists.xenproject.org
X-Gm-Message-State: AOJu0YzzzuohvRqVMEGN+Su9r/atALE5MC1QBvtgznXmXKATNIC3gDzM
	5iQieyijK/FaGTSj9IKyTUTiSSNM8jtrJ3/8Ku+rGRIqElIIJA1f8hqiw0RyDgKlfxQXMdv+zxT
	pjyDs
X-Gm-Gg: ASbGncvmOd1qzg8IOhttpAqC/ffvjk5GrZhdtG4DtN1VKiS78jbZRXQUv6Zkb/YBQgX
	1biU06hy7VBBbN2giCAJ69uxWsCWqXcemJPzJbABbLwCama/HywXepssFOgyaHhT2VVdN2iY1WN
	Snbcwsh62FHKtAXAVMmNaWshMh75FBoGRw48CzZVymZohqGU+MIYM3SzzZIFimYXJs0MzcAhmmu
	pgJIH75af2eSaQtx1bgvuA8CDMPDbzy67lH5jkttZO892FbIjkQmEh/y/wO1+z4KjbXHRq0CIpP
	/Hg1bCnCkxAN+0L3VmTMO+7m6mX/8P4hguiRbG4pVxbI0W0CmwwYwpVzKes2yG6bbzvEJNywMkb
	/K0RRqwnPwqWDMX0CRZwtwOLUjShmWUwdGpkBzg7G6g8utKEXT61qbipgyBYm6HPJ5Z+D
X-Google-Smtp-Source: AGHT+IF1Wo/7udQ7g3xKzCTVNG6LSJABJbb/rM32Bh7Ez55u0dYGApC3Duu0BGdCKExOKqUF8L0qvQ==
X-Received: by 2002:a05:600c:5296:b0:459:d3e2:d743 with SMTP id 5b1f17b1804b1-45a1701b813mr22155885e9.8.1755086027325;
        Wed, 13 Aug 2025 04:53:47 -0700 (PDT)
Message-ID: <3ff00f71-b16e-4426-98f5-27bc6f6b92cf@citrix.com>
Date: Wed, 13 Aug 2025 12:53:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/22] x86/traps: Move subarch_percpu_traps_init() into
 traps-setup.c
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
 <20250808202314.1045968-11-andrew.cooper3@citrix.com>
 <646c538a-850a-4370-8132-c06d9be8b422@citrix.com>
 <769ba73f-b490-43db-a056-fc1d95ec9f27@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <769ba73f-b490-43db-a056-fc1d95ec9f27@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 12/08/2025 10:52 am, Jan Beulich wrote:
> On 11.08.2025 10:17, Andrew Cooper wrote:
>> On 08/08/2025 9:23 pm, Andrew Cooper wrote:
>>> ... along with the supporting functions.  Switch to Xen coding style, and make
>>> static as there are no external callers.
>>>
>>> Rename to legacy_syscall_init() as a more accurate name.
>>>
>>> No functional change.
>>>
>>> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>>> ---
>>> CC: Jan Beulich <JBeulich@suse.com>
>>> CC: Roger Pau Monné <roger.pau@citrix.com>
>>> ---
>>>  xen/arch/x86/include/asm/system.h |  2 -
>>>  xen/arch/x86/traps-setup.c        | 97 ++++++++++++++++++++++++++++++-
>>>  xen/arch/x86/x86_64/traps.c       | 92 -----------------------------
>>>  3 files changed, 95 insertions(+), 96 deletions(-)
>>>
>>> diff --git a/xen/arch/x86/include/asm/system.h b/xen/arch/x86/include/asm/system.h
>>> index 3cdc56e4ba6d..6c2800d8158d 100644
>>> --- a/xen/arch/x86/include/asm/system.h
>>> +++ b/xen/arch/x86/include/asm/system.h
>>> @@ -256,6 +256,4 @@ static inline int local_irq_is_enabled(void)
>>>  #define BROKEN_ACPI_Sx          0x0001
>>>  #define BROKEN_INIT_AFTER_S1    0x0002
>>>  
>>> -void subarch_percpu_traps_init(void);
>>> -
>>>  #endif
>>> diff --git a/xen/arch/x86/traps-setup.c b/xen/arch/x86/traps-setup.c
>>> index 13b8fcf0ba51..fbae7072c292 100644
>>> --- a/xen/arch/x86/traps-setup.c
>>> +++ b/xen/arch/x86/traps-setup.c
>>> @@ -2,13 +2,15 @@
>>>  /*
>>>   * Configuration of event handling for all CPUs.
>>>   */
>>> +#include <xen/domain_page.h>
>>>  #include <xen/init.h>
>>>  #include <xen/param.h>
>>>  
>>> +#include <asm/endbr.h>
>>>  #include <asm/idt.h>
>>>  #include <asm/msr.h>
>>>  #include <asm/shstk.h>
>>> -#include <asm/system.h>
>>> +#include <asm/stubs.h>
>>>  #include <asm/traps.h>
>>>  
>>>  DEFINE_PER_CPU_READ_MOSTLY(idt_entry_t *, idt);
>>> @@ -19,6 +21,8 @@ static bool __initdata opt_ler;
>>>  boolean_param("ler", opt_ler);
>>>  
>>>  void nocall entry_PF(void);
>>> +void nocall lstar_enter(void);
>>> +void nocall cstar_enter(void);
>>>  
>>>  /*
>>>   * Sets up system tables and descriptors for IDT devliery.
>>> @@ -138,6 +142,95 @@ static void load_system_tables(void)
>>>      BUG_ON(stack_bottom & 15);
>>>  }
>>>  
>>> +static unsigned int write_stub_trampoline(
>>> +    unsigned char *stub, unsigned long stub_va,
>>> +    unsigned long stack_bottom, unsigned long target_va)
>>> +{
>>> +    unsigned char *p = stub;
>>> +
>>> +    if ( cpu_has_xen_ibt )
>>> +    {
>>> +        place_endbr64(p);
>>> +        p += 4;
>>> +    }
>>> +
>>> +    /* Store guest %rax into %ss slot */
>>> +    /* movabsq %rax, stack_bottom - 8 */
>>> +    *p++ = 0x48;
>>> +    *p++ = 0xa3;
>>> +    *(uint64_t *)p = stack_bottom - 8;
>>> +    p += 8;
>>> +
>>> +    /* Store guest %rsp in %rax */
>>> +    /* movq %rsp, %rax */
>>> +    *p++ = 0x48;
>>> +    *p++ = 0x89;
>>> +    *p++ = 0xe0;
>>> +
>>> +    /* Switch to Xen stack */
>>> +    /* movabsq $stack_bottom - 8, %rsp */
>>> +    *p++ = 0x48;
>>> +    *p++ = 0xbc;
>>> +    *(uint64_t *)p = stack_bottom - 8;
>>> +    p += 8;
>>> +
>>> +    /* jmp target_va */
>>> +    *p++ = 0xe9;
>>> +    *(int32_t *)p = target_va - (stub_va + (p - stub) + 4);
>>> +    p += 4;
>>> +
>>> +    /* Round up to a multiple of 16 bytes. */
>>> +    return ROUNDUP(p - stub, 16);
>>> +}
>>> +
>>> +static void legacy_syscall_init(void)
>>> +{
>>> +    unsigned long stack_bottom = get_stack_bottom();
>>> +    unsigned long stub_va = this_cpu(stubs.addr);
>>> +    unsigned char *stub_page;
>>> +    unsigned int offset;
>>> +
>>> +    /* No PV guests?  No need to set up SYSCALL/SYSENTER infrastructure. */
>>> +    if ( !IS_ENABLED(CONFIG_PV) )
>>> +        return;
>>> +
>>> +    stub_page = map_domain_page(_mfn(this_cpu(stubs.mfn)));
>>> +
>>> +    /*
>>> +     * Trampoline for SYSCALL entry from 64-bit mode.  The VT-x HVM vcpu
>>> +     * context switch logic relies on the SYSCALL trampoline being at the
>>> +     * start of the stubs.
>>> +     */
>>> +    wrmsrl(MSR_LSTAR, stub_va);
>>> +    offset = write_stub_trampoline(stub_page + (stub_va & ~PAGE_MASK),
>>> +                                   stub_va, stack_bottom,
>>> +                                   (unsigned long)lstar_enter);
>>> +    stub_va += offset;
>>> +
>>> +    if ( cpu_has_sep )
>>> +    {
>>> +        /* SYSENTER entry. */
>>> +        wrmsrl(MSR_IA32_SYSENTER_ESP, stack_bottom);
>>> +        wrmsrl(MSR_IA32_SYSENTER_EIP, (unsigned long)sysenter_entry);
>>> +        wrmsr(MSR_IA32_SYSENTER_CS, __HYPERVISOR_CS, 0);
>>> +    }
>>> +
>>> +    /* Trampoline for SYSCALL entry from compatibility mode. */
>>> +    wrmsrl(MSR_CSTAR, stub_va);
>>> +    offset += write_stub_trampoline(stub_page + (stub_va & ~PAGE_MASK),
>>> +                                    stub_va, stack_bottom,
>>> +                                    (unsigned long)cstar_enter);
>>> +
>>> +    /* Don't consume more than half of the stub space here. */
>>> +    ASSERT(offset <= STUB_BUF_SIZE / 2);
>>> +
>>> +    unmap_domain_page(stub_page);
>>> +
>>> +    /* Common SYSCALL parameters. */
>>> +    wrmsrl(MSR_STAR, XEN_MSR_STAR);
>>> +    wrmsrl(MSR_SYSCALL_MASK, XEN_SYSCALL_MASK);
>>> +}
>> These want adjusting to use wrmsrns(), similarly to the previous patch. 
>> Fixed locally.
> Also the one higher in the function, I suppose.

All of them.

I'm not aware of anywhere were we want serialising behaviour, except for
ICR which is buggly non-serialising and has workarounds.

But I'm also not sure enough of this to suggest that we make wrmsr() be
wrmsrns() by default.

> Acked-by: Jan Beulich <jbeulich@suse.com>

Thanks.

~Andrew

