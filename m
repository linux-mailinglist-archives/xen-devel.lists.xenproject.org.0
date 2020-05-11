Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E59711CE94E
	for <lists+xen-devel@lfdr.de>; Tue, 12 May 2020 01:47:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jYI84-0007r8-8O; Mon, 11 May 2020 23:46:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MQL3=6Z=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1jYI82-0007r3-V5
 for xen-devel@lists.xenproject.org; Mon, 11 May 2020 23:46:35 +0000
X-Inumbo-ID: a4b427a0-93e1-11ea-ae69-bc764e2007e4
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a4b427a0-93e1-11ea-ae69-bc764e2007e4;
 Mon, 11 May 2020 23:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589240793;
 h=subject:to:cc:references:from:message-id:date:
 mime-version:in-reply-to:content-transfer-encoding;
 bh=jPa6okqu5A+kF2s16qpmwy8N+5Q7RFJ4j6mt3oTu4AI=;
 b=FJEmN6di0WJKKc6A8CeG4GhMcG1GiG/cRXS28DAAGardECmLwoS0m/vb
 apC6aBgr/gG3JRZQtfarAyDkBHU7D5ASDQtD1v+Msgka9w4TaRMXgZU5F
 k0VpGVMDscVF6AQ6YOUWEi0jbrfItVJ3BuImHH/lL5CubI7ZUshrARdOA k=;
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 andrew.cooper3@citrix.com) identity=pra;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="andrew.cooper3@citrix.com";
 x-conformance=sidf_compatible
Received-SPF: Pass (esa3.hc3370-68.iphmx.com: domain of
 Andrew.Cooper3@citrix.com designates 162.221.158.21 as
 permitted sender) identity=mailfrom;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="Andrew.Cooper3@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa3.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa3.hc3370-68.iphmx.com;
 envelope-from="Andrew.Cooper3@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=andrew.cooper3@citrix.com;
 spf=Pass smtp.mailfrom=Andrew.Cooper3@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: 4Dtoer7KjLyUlA+aX2MVIzWULzMvb17acOPLvWGtId1EgDX8ae9XaLCIjYYx8ZtTn2c/5i47wn
 GppFtduONHKUQKLcRnc2XhLxAyexj9dlOpb6/T4c5Oy2lFdFvNoDopxHVHe136aj4zf/n+mtBY
 9Hq4HsboGfNnv8xNb4i1uAN1jN2rsLb4YgbBqcLORGTdqCSp286AeqXZI56nSf+ITsIrFTIQdh
 6n8FAIt1ywUCkm75OaPqdlfTsYlKvC2M3SqBShMepU6biZMjcoB9AFctuAgmm6aTo4SOqYciPW
 0Os=
X-SBRS: 2.7
X-MesageID: 17258483
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,381,1583211600"; d="scan'208";a="17258483"
Subject: Re: [PATCH 16/16] x86/shstk: Activate Supervisor Shadow Stacks
To: Jan Beulich <jbeulich@suse.com>
References: <20200501225838.9866-1-andrew.cooper3@citrix.com>
 <20200501225838.9866-17-andrew.cooper3@citrix.com>
 <eacafb0a-a049-5bca-7a43-c9c3deb26054@suse.com>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <b2e2c7ec-6ed7-b77d-5e0a-6b0f716c451d@citrix.com>
Date: Tue, 12 May 2020 00:46:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <eacafb0a-a049-5bca-7a43-c9c3deb26054@suse.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 07/05/2020 15:54, Jan Beulich wrote:
> On 02.05.2020 00:58, Andrew Cooper wrote:
>> --- a/xen/arch/x86/acpi/wakeup_prot.S
>> +++ b/xen/arch/x86/acpi/wakeup_prot.S
>> @@ -1,3 +1,8 @@
>> +#include <asm/config.h>
> Why is this needed? Afaics assembly files, just like C ones, get
> xen/config.h included from the compiler command line.

I'll double check, but I do recall it being necessary.

>> @@ -48,6 +59,48 @@ ENTRY(s3_resume)
>>          pushq   %rax
>>          lretq
>>  1:
>> +#ifdef CONFIG_XEN_SHSTK
>> +	/*
>> +         * Restoring SSP is a little convoluted, because we are intercepting
>> +         * the middle of an in-use shadow stack.  Write a temporary supervisor
>> +         * token under the stack, so SETSSBSY takes us where we want, then
>> +         * reset MSR_PL0_SSP to its usual value and pop the temporary token.
> What do you mean by "takes us where we want"? I take it "us" is really
> SSP here?

Load the SSP that we want.  SETSSBSY is the only instruction which can
do a fairly arbitrary load of SSP, but it still has to complete the
check and activation of the supervisor token.

>> +         */
>> +        mov     saved_rsp(%rip), %rdi
>> +        cmpq    $1, %rdi
>> +        je      .L_shstk_done
>> +
>> +        /* Write a supervisor token under SSP. */
>> +        sub     $8, %rdi
>> +        mov     %rdi, (%rdi)
>> +
>> +        /* Load it into MSR_PL0_SSP. */
>> +        mov     $MSR_PL0_SSP, %ecx
>> +        mov     %rdi, %rdx
>> +        shr     $32, %rdx
>> +        mov     %edi, %eax
>> +
>> +        /* Enable CET. */
>> +        mov     $MSR_S_CET, %ecx
>> +        xor     %edx, %edx
>> +        mov     $CET_SHSTK_EN | CET_WRSS_EN, %eax
>> +        wrmsr
>> +
>> +        /* Activate our temporary token. */
>> +        mov     $XEN_MINIMAL_CR4 | X86_CR4_CET, %ebx
>> +        mov     %rbx, %cr4
>> +        setssbsy
>> +
>> +        /* Reset MSR_PL0_SSP back to its expected value. */
>> +        and     $~(STACK_SIZE - 1), %eax
>> +        or      $0x5ff8, %eax
>> +        wrmsr
> Ahead of this WRMSR neither %ecx nor %edx look to have their intended
> values anymore. Also there is a again a magic 0x5ff8 here (and at
> least one more further down).

There is another bug in this version which I spotted and fixed.  The
write of the supervisor shadow stack token has to be done after CET is
enabled and with WRSSQ because the mapping is already read-only.

>> --- a/xen/arch/x86/boot/x86_64.S
>> +++ b/xen/arch/x86/boot/x86_64.S
>> @@ -28,8 +28,36 @@ ENTRY(__high_start)
>>          lretq
>>  1:
>>          test    %ebx,%ebx
>> -        jnz     start_secondary
>> +        jz      .L_bsp
>>  
>> +        /* APs.  Set up shadow stacks before entering C. */
>> +
>> +        testl   $cpufeat_mask(X86_FEATURE_XEN_SHSTK), \
>> +                CPUINFO_FEATURE_OFFSET(X86_FEATURE_XEN_SHSTK) + boot_cpu_data(%rip)
>> +        je      .L_ap_shstk_done
>> +
>> +        mov     $MSR_S_CET, %ecx
>> +        xor     %edx, %edx
>> +        mov     $CET_SHSTK_EN | CET_WRSS_EN, %eax
>> +        wrmsr
>> +
>> +        mov     $MSR_PL0_SSP, %ecx
>> +        mov     %rsp, %rdx
>> +        shr     $32, %rdx
>> +        mov     %esp, %eax
>> +        and     $~(STACK_SIZE - 1), %eax
>> +        or      $0x5ff8, %eax
>> +        wrmsr
>> +
>> +        mov     $XEN_MINIMAL_CR4 | X86_CR4_CET, %ecx
>> +        mov     %rcx, %cr4
>> +        setssbsy
> Since the token doesn't get written here, could you make the comment
> say where this happens? I have to admit that I had to go through
> earlier patches to find it again.

Ok.

>
>> +.L_ap_shstk_done:
>> +        call    start_secondary
>> +        BUG     /* start_secondary() shouldn't return. */
> This conversion from a jump to CALL is unrelated and hence would
> better be mentioned in the description imo.
>
>> --- a/xen/arch/x86/cpu/common.c
>> +++ b/xen/arch/x86/cpu/common.c
>> @@ -323,6 +323,11 @@ void __init early_cpu_init(void)
>>  	       x86_cpuid_vendor_to_str(c->x86_vendor), c->x86, c->x86,
>>  	       c->x86_model, c->x86_model, c->x86_mask, eax);
>>  
>> +	if (c->cpuid_level >= 7) {
>> +		cpuid_count(7, 0, &eax, &ebx, &ecx, &edx);
>> +		c->x86_capability[cpufeat_word(X86_FEATURE_CET_SS)] = ecx;
>> +	}
> How about moving the leaf 7 code from generic_identify() here as
> a whole?

In the past, we've deliberately not done that to avoid code gaining a
reliance on the pre-cached values.

I have a plan to rework this substantially when I move microcode loading
to the start of __start_xen(), at which point early_cpu_init() will
disappear and become the BSP's regular cpu_init().

Until then, we shouldn't cache unnecessary leaves this early.

>> --- a/xen/arch/x86/setup.c
>> +++ b/xen/arch/x86/setup.c
>> @@ -664,6 +664,13 @@ static void __init noreturn reinit_bsp_stack(void)
>>      stack_base[0] = stack;
>>      memguard_guard_stack(stack);
>>  
>> +    if ( cpu_has_xen_shstk )
>> +    {
>> +        wrmsrl(MSR_PL0_SSP, (unsigned long)stack + 0x5ff8);
>> +        wrmsrl(MSR_S_CET, CET_SHSTK_EN | CET_WRSS_EN);
>> +        asm volatile ("setssbsy" ::: "memory");
>> +    }
> Same as for APs - a brief comment pointing at where the token was
> written would seem helpful.
>
> Could you also have the patch description say a word on the choice
> of enabling CET_WRSS_EN uniformly and globally?

That is an area for possible improvement.  For now, it is unilaterally
enabled for simplicity.

None of the places we need to use WRSSQ are fastpaths.  It is in the
extable recovery, S3 path and enable_nmi()'s.

We can get away with a RDMSR/WRMSR/WRMSR sequence, which keeps us safe
to ROP gadgets and problems from poisoning a read-mostly default.

>> @@ -985,6 +992,21 @@ void __init noreturn __start_xen(unsigned long mbi_p)
>>      /* This must come before e820 code because it sets paddr_bits. */
>>      early_cpu_init();
>>  
>> +    /* Choose shadow stack early, to set infrastructure up appropriately. */
>> +    if ( opt_xen_shstk && boot_cpu_has(X86_FEATURE_CET_SS) )
>> +    {
>> +        printk("Enabling Supervisor Shadow Stacks\n");
>> +
>> +        setup_force_cpu_cap(X86_FEATURE_XEN_SHSTK);
>> +#ifdef CONFIG_PV32
>> +        if ( opt_pv32 )
>> +        {
>> +            opt_pv32 = 0;
>> +            printk("  - Disabling PV32 due to Shadow Stacks\n");
>> +        }
>> +#endif
> I think this deserves an explanation, either in a comment or in
> the patch description.

Probably both.

>
>> @@ -1721,6 +1743,10 @@ void __init noreturn __start_xen(unsigned long mbi_p)
>>  
>>      alternative_branches();
>>  
>> +    /* Defer CR4.CET until alternatives have finished playing with CR4.WP */
>> +    if ( cpu_has_xen_shstk )
>> +        set_in_cr4(X86_CR4_CET);
> Nit: CR0.WP (in the comment)

Oops.

~Andrew

