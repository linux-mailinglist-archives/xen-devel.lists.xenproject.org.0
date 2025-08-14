Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4974B27048
	for <lists+xen-devel@lfdr.de>; Thu, 14 Aug 2025 22:41:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1082503.1442334 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umeke-0008W7-NE; Thu, 14 Aug 2025 20:40:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1082503.1442334; Thu, 14 Aug 2025 20:40:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1umeke-0008T0-Jv; Thu, 14 Aug 2025 20:40:44 +0000
Received: by outflank-mailman (input) for mailman id 1082503;
 Thu, 14 Aug 2025 20:40:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mOIo=22=cloud.com=andrew.cooper@srs-se1.protection.inumbo.net>)
 id 1umekd-0008Su-4P
 for xen-devel@lists.xenproject.org; Thu, 14 Aug 2025 20:40:43 +0000
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [2a00:1450:4864:20::435])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f113e329-794e-11f0-b898-0df219b8e170;
 Thu, 14 Aug 2025 22:40:40 +0200 (CEST)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3b9dc5c6521so767803f8f.1
 for <xen-devel@lists.xenproject.org>; Thu, 14 Aug 2025 13:40:40 -0700 (PDT)
Received: from [192.168.1.183] (host-195-149-20-212.as13285.net.
 [195.149.20.212]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45a1c6bc932sm36123625e9.3.2025.08.14.13.40.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Aug 2025 13:40:39 -0700 (PDT)
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
X-Inumbo-ID: f113e329-794e-11f0-b898-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1755204040; x=1755808840; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=EM+HNoQBt+VGaLjN4m1AxiSkl0/PgB3AVdnRqyt9mYU=;
        b=PqDIHu47e6VsnmudeJMFNm1GC/LowgxfeDIqjpijG4+SkCVp8TW140DEkAwlqFio8p
         CU7q+b0TSTAa921vm8QWOS1UwFdu/Zxz5iMmcpTU9i+FG8r2iI+fLTj4gGAuXkWO8MCW
         EYTMPtxdQg8UKFDftt1q2gWnhEiCe/YViZZ5Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755204040; x=1755808840;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EM+HNoQBt+VGaLjN4m1AxiSkl0/PgB3AVdnRqyt9mYU=;
        b=cd7Q/au6wlbcqVjsZ5v22geQXGj2lHcazDTEWsuk/Vl6+KzKfAVSJ/GFxk3lGPuMky
         vQ6A6ur4XF8PWDyMHxEnDvpJVWwMioB2nlYL3Vx+XJvUhvftaBca0AQrvigT1dXSBLaw
         O+pCxlG/Ho/F5VrQKs23HwzAUPBQHh2UGHgBJVvl2jV/0aQ5+pLjYFeaBO7i4fFCp+n/
         /QUuILpi89mOA32MPxvyZi2Vp/EH8O9JmcpF9+515QxeD0dz8tyZnEEC0ZPOAhwi1Fdl
         RKS4T97X+KeJUmzNkyZ6ZiOxIoEPFnF/6R0f0wT43LwbxsnRYlmyElj31TXa+EVEi6V4
         eXLg==
X-Forwarded-Encrypted: i=1; AJvYcCWDV1NZZZbu9y3obpEqChnB/BrPnepcQD6JRmRLza+0Vsvuwq9T6em23uaNJDQcZi3akSl98q65MM4=@lists.xenproject.org
X-Gm-Message-State: AOJu0Yyvz0YiHwHq2iv/KlaBbKs/qUYlDOpg6CqEKWyACVE/jJJ85PTF
	CgjKFJd5Dv9UkltwNtCYrxh5YqNIAwRoepFoCkkFCvidu2+CE+qNvIVZLIhCdtGZNjs=
X-Gm-Gg: ASbGncvwPkPBSyrVsiFEgRsofdUZCNln4SJvFmmR/BE8BBjE6PUGk31N6FhL5qMVizQ
	+YqKsySMI2/PKPWLXc/MT+efkbX5HwWK+qjGX22HSBaHkCKDiVERt094R5cwFkUeZj2cWO2tqcE
	a8C4zemRVGlVKJq/x8T5kkGTJ8fyZQ/10wC2BRaZhov/krOkr1YqQT0kbTloFpAPNWkDPT6lHRa
	1UrfTJF+E7KyksQ75WKz1dliMVqu1EaeE8+tZpQrKzSoVKe84KpWGl57kUsNHsdZs2msqPSt2yd
	BNbP482neZ7ONIJT4HDTDt5H70d9YYaqb1tQIRWzsQj8zoHj522FAluLencXjhORyUXsX0KsPWz
	UdWl/qFBqptRZE2bPVZBlPzuDQigc3mrHooJoBhc+b0EsAXfnOnKHQULqbxF1xfYBOprT
X-Google-Smtp-Source: AGHT+IGxC4LPnlikozzrfsQ6uwwai3SKTcqJCMLrNKAYvDH0Kv6qKwpJ2otRVgi+cmHIJIK8cGJd4w==
X-Received: by 2002:a05:6000:2302:b0:3a3:63d3:369a with SMTP id ffacd0b85a97d-3bb2483ccf3mr101660f8f.25.1755204040162;
        Thu, 14 Aug 2025 13:40:40 -0700 (PDT)
Message-ID: <37cb95df-520e-45b3-9003-b638296d1001@citrix.com>
Date: Thu, 14 Aug 2025 21:40:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 21/22] x86/traps: Introduce FRED entrypoints
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20250808202314.1045968-1-andrew.cooper3@citrix.com>
 <20250808202314.1045968-22-andrew.cooper3@citrix.com>
 <53028a31-e07d-43f1-b320-2775c5560a09@suse.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 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
 6+ahAA==
In-Reply-To: <53028a31-e07d-43f1-b320-2775c5560a09@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 14/08/2025 4:57 pm, Jan Beulich wrote:
> On 08.08.2025 22:23, Andrew Cooper wrote:
>> --- a/xen/arch/x86/include/asm/asm_defns.h
>> +++ b/xen/arch/x86/include/asm/asm_defns.h
>> @@ -315,6 +315,71 @@ static always_inline void stac(void)
>>          subq  $-(UREGS_error_code-UREGS_r15+\adj), %rsp
>>  .endm
>>  
>> +/*
>> + * Push and clear GPRs
>> + */
>> +.macro PUSH_AND_CLEAR_GPRS
>> +        push  %rdi
>> +        xor   %edi, %edi
>> +        push  %rsi
>> +        xor   %esi, %esi
>> +        push  %rdx
>> +        xor   %edx, %edx
>> +        push  %rcx
>> +        xor   %ecx, %ecx
>> +        push  %rax
>> +        xor   %eax, %eax
>> +        push  %r8
>> +        xor   %r8d, %r8d
>> +        push  %r9
>> +        xor   %r9d, %r9d
>> +        push  %r10
>> +        xor   %r10d, %r10d
>> +        push  %r11
>> +        xor   %r11d, %r11d
>> +        push  %rbx
>> +        xor   %ebx, %ebx
>> +        push  %rbp
>> +#ifdef CONFIG_FRAME_POINTER
>> +/* Indicate special exception stack frame by inverting the frame pointer. */
>> +        mov   %rsp, %rbp
>> +        notq  %rbp
>> +#else
>> +        xor   %ebp, %ebp
>> +#endif
>> +        push  %r12
>> +        xor   %r12d, %r12d
>> +        push  %r13
>> +        xor   %r13d, %r13d
>> +        push  %r14
>> +        xor   %r14d, %r14d
>> +        push  %r15
>> +        xor   %r15d, %r15d
>> +.endm
>> +
>> +/*
>> + * POP GPRs from a UREGS_* frame on the stack.  Does not modify flags.
>> + *
>> + * @rax: Alternative destination for the %rax value on the stack.
>> + */
>> +.macro POP_GPRS rax=%rax
>> +        pop   %r15
>> +        pop   %r14
>> +        pop   %r13
>> +        pop   %r12
>> +        pop   %rbp
>> +        pop   %rbx
>> +        pop   %r11
>> +        pop   %r10
>> +        pop   %r9
>> +        pop   %r8
>> +        pop   \rax
>> +        pop   %rcx
>> +        pop   %rdx
>> +        pop   %rsi
>> +        pop   %rdi
>> +.endm
> Hmm, yes, differences are apparently large enough to warrant the redundancy
> with SAVE_ALL / RESTORE_ALL.

You may recall this construct from prior attempts I've had to remove
SAVE_ALL/RESTORE_ALL, even with the \rax parameter for SVM.  I still
intend to complete that work at some point.

>
>> --- a/xen/arch/x86/include/asm/msr.h
>> +++ b/xen/arch/x86/include/asm/msr.h
>> @@ -202,9 +202,9 @@ static inline unsigned long read_gs_base(void)
>>  
>>  static inline unsigned long read_gs_shadow(void)
>>  {
>> -    unsigned long base;
>> +    unsigned long base, cr4 = read_cr4();
>>  
>> -    if ( read_cr4() & X86_CR4_FSGSBASE )
>> +    if ( !(cr4 & X86_CR4_FRED) && (cr4 & X86_CR4_FSGSBASE) )
>>      {
>>          asm volatile ( "swapgs" );
>>          base = __rdgsbase();
>> @@ -234,7 +234,9 @@ static inline void write_gs_base(unsigned long base)
>>  
>>  static inline void write_gs_shadow(unsigned long base)
>>  {
>> -    if ( read_cr4() & X86_CR4_FSGSBASE )
>> +    unsigned long cr4 = read_cr4();
>> +
>> +    if ( !(cr4 & X86_CR4_FRED) && (cr4 & X86_CR4_FSGSBASE) )
>>      {
>>          asm volatile ( "swapgs\n\t"
>>                         "wrgsbase %0\n\t"
> I don't quite get how these changes fit into this patch.

Without the change, read_registers() suffers #UD because of the SWAPGS.

This recurses until hitting the guard page, then repeats the same on the
#DF stack.  And because stacks work nicely under FRED, you eventually
hit #DF's guard page.

Strictly speaking it's only read_gs_shadow() which we need to change to
make exception handling work, but I fixed both at the same time.

That said, I have actually cleaned this codepath up with the MSR work
because the code gen in read_registers() is terrible.  Due to
no-strict-aliasing, every store into state-> forces a recalculation of
get_cpu_info(), meaning that read_cr4() cannot be hoisted, and there's a
branch in every helper.

I'm still not sure how best to fit it into this series.

>
>> --- a/xen/arch/x86/traps.c
>> +++ b/xen/arch/x86/traps.c
>> @@ -1013,6 +1013,32 @@ void show_execution_state_nmi(const cpumask_t *mask, bool show_all)
>>          printk("Non-responding CPUs: {%*pbl}\n", CPUMASK_PR(&show_state_mask));
>>  }
>>  
>> +static const char *x86_et_name(unsigned int type)
>> +{
>> +    static const char *const names[] = {
>> +        [X86_ET_EXT_INTR]    = "EXT_INTR",
>> +        [X86_ET_NMI]         = "NMI",
>> +        [X86_ET_HW_EXC]      = "HW_EXC",
>> +        [X86_ET_SW_INT]      = "SW_INT",
>> +        [X86_ET_PRIV_SW_EXC] = "PRIV_SW_EXEC",
>> +        [X86_ET_SW_EXC]      = "SW_EXEC",
>> +        [X86_ET_OTHER]       = "OTHER",
>> +    };
>> +
>> +    return (type < ARRAY_SIZE(names) && names[type]) ? names[type] : "???";
>> +}
>> +
>> +static const char *x86_et_other_name(unsigned int vec)
> This isn't really a vector, is it?

Well - you are decoding the field name regs->fred_ss.vector.

Also I see I've typo'd EXEC in two of those names.

>
>> +{
>> +    static const char *const names[] = {
>> +        [0] = "MTF",
>> +        [1] = "SYSCALL",
>> +        [2] = "SYSENTER",
>> +    };
>> +
>> +    return (vec < ARRAY_SIZE(names) && names[vec][0]) ? names[vec] : "???";
> Did you mean to check names[ves] for being NULL? Or is this a leftover
> from the array being something like names[][10]?

Oh, bad copy&paste.  Will fix.

>
>> --- a/xen/arch/x86/x86_64/Makefile
>> +++ b/xen/arch/x86/x86_64/Makefile
>> @@ -1,6 +1,7 @@
>>  obj-$(CONFIG_PV32) += compat/
>>  
>>  obj-bin-y += entry.o
>> +obj-bin-y += entry-fred.o
> For the ordering here, ...
>
>> --- /dev/null
>> +++ b/xen/arch/x86/x86_64/entry-fred.S
>> @@ -0,0 +1,35 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +
>> +        .file "x86_64/entry-fred.S"
>> +
>> +#include <asm/asm_defns.h>
>> +#include <asm/page.h>
>> +
>> +        .section .text.entry, "ax", @progbits
>> +
>> +        /* The Ring3 entry point is required to be 4k aligned. */
>> +
>> +FUNC(entry_FRED_R3, 4096)
> ... doesn't this 4k-alignment requirement suggest we want to put
> entry-fred.o first?

Perhaps, but that is quite subtle.  I did also consider a
.text.entry.page_aligned section, but .text.entry only matters for XPTI
which (as agreed), I'm not intending to implement in FRED mode unless it
proves to be necessary.

Also IIRC there's still a symbol bug where _sentrytext takes priority
over entry_FRED_R3, so the backtrace is effectively wrong.

(These are all bad excuses, but some parts of this series are rather old.)

>  Also, might it be more natural to use PAGE_SIZE
> here?

I did debate that, but the spec uses 0xfff, not pages, even if the
pipline surely does have an optimisation for chopping 12 metadata bits
off the bottom of a pointer.

~Andrew

