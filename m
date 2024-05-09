Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8188C0EA7
	for <lists+xen-devel@lfdr.de>; Thu,  9 May 2024 13:04:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.719184.1121790 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s51Zd-0002PL-KJ; Thu, 09 May 2024 11:04:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 719184.1121790; Thu, 09 May 2024 11:04:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s51Zd-0002N0-HC; Thu, 09 May 2024 11:04:29 +0000
Received: by outflank-mailman (input) for mailman id 719184;
 Thu, 09 May 2024 11:04:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Aro1=MM=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1s51Zc-0002Mr-7n
 for xen-devel@lists.xenproject.org; Thu, 09 May 2024 11:04:28 +0000
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com
 [2a00:1450:4864:20::62e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e67b2933-0df3-11ef-909c-e314d9c70b13;
 Thu, 09 May 2024 13:04:26 +0200 (CEST)
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-a59cc765c29so162603666b.3
 for <xen-devel@lists.xenproject.org>; Thu, 09 May 2024 04:04:26 -0700 (PDT)
Received: from [10.80.5.21] (default-46-102-197-194.interdsl.co.uk.
 [46.102.197.194]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a17b0195dsm61403666b.184.2024.05.09.04.04.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 May 2024 04:04:25 -0700 (PDT)
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
X-Inumbo-ID: e67b2933-0df3-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1715252666; x=1715857466; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PMufEVeBYg1pSZzp2+OPQIs/m8kDLgfByhJaHU++gLs=;
        b=fVS48UGmqJScjFMYbcxre81Bp81D6Bgu+vO/lMrlIOgzDjGb1qtjax0pZDEVeh+OxU
         jaAf51ILCUYXq11hi0wbDvM8yeR5HzKIWS64J91XPcLtHwXmodF9W4bpVRaaeT/VJSQw
         sbORLzEqN2gJ+6nRpr1FGRa6lakz7UUPxWPcE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715252666; x=1715857466;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PMufEVeBYg1pSZzp2+OPQIs/m8kDLgfByhJaHU++gLs=;
        b=CNB108plyVeRmcLlj0k6NDpWohPqNjETpPtC4ess09TJlmMFBbrC5VFCSWuzasarcL
         C58CeGtJQdB8e2A+vXLhAefeE2G1CvtA69+3JDeNM95FcGOzmtOdU4z1v8/irZnR/Z4p
         vDbOuUOoe7BYxd4R2IbOz741rXKb70KB/uGAkAQBZxbd7lyMHy1HovioxihMGHeZh7gE
         ktAqHZLkCWH5OhG+4TAtdNYfwpcXvRs+LYO4TIBpJTm7E7U7IBp0yXGE1hHcUtIfsqAS
         iVMuXNyYjRPabPjr2f7B/X5eGvibdDzgtBHAfJ3bzN+Yo0Btd2dmU6IHU5TfwH96eABP
         SDSA==
X-Forwarded-Encrypted: i=1; AJvYcCXwi1bru/3HwJ2xZyhidIZuUQ/8gRc0hIpRIAmysRhxW7A+/xnHjvtofQ2lkvlz8gBEE9UhgxyM8fKb3DK7APoTCYxKjnJR0qKtuM1WwRw=
X-Gm-Message-State: AOJu0Yyx24yZGM3Tk1C8mT4dVzyJwJmqbbaulzx+rb3PZcoRgD1dOJNt
	P6N/D5XfaCyzmvYFqaAVkOe9an+QCyhOWY3gLavHX3kRvvuKcYM8VZq9XdK8awZhapkYSGX2bbJ
	W
X-Google-Smtp-Source: AGHT+IG6grUV5/lS2w3bMTtoCAulDTTROye5EolaEoqZa76P2VjxCyKwO58J3r0yHOUXyg8bKxKEgQ==
X-Received: by 2002:a17:906:4fc3:b0:a59:bfd3:2b27 with SMTP id a640c23a62f3a-a59fb9f45dfmr377339866b.70.1715252666270;
        Thu, 09 May 2024 04:04:26 -0700 (PDT)
Message-ID: <d187b452-c847-4681-b6a0-5eaa6cd9b2e7@cloud.com>
Date: Thu, 9 May 2024 12:04:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] tools/hvmloader: Wake APs with hypercalls and not
 with INIT+SIPI+SIPI
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Anthony PERARD <anthony@xenproject.org>
References: <cover.1715102098.git.alejandro.vallejo@cloud.com>
 <bd23a05ea25b2f431bb0655ca6402073f9cf49b8.1715102098.git.alejandro.vallejo@cloud.com>
 <45753c70-eef4-4ca7-b7f7-73b452310d4a@citrix.com>
Content-Language: en-GB
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
In-Reply-To: <45753c70-eef4-4ca7-b7f7-73b452310d4a@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 08/05/2024 20:13, Andrew Cooper wrote:
> On 08/05/2024 1:39 pm, Alejandro Vallejo wrote:
>> Removes a needless assembly entry point and simplifies the codebase by allowing
>> hvmloader to wake APs it doesn't know the APIC ID of.
>>
>> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> 
> This is basically independent of the rest of the series, and it would be
> good to pull it in separately.  A few notes.
> 
> The commit message ought to note that this has a side effect of removing
> an LMSW instruction which has fastpath at all on AMD CPUs, and requires
> full emulation, and it gets rid of 13 vLAPIC emulations when 3
> hypercalls would do.
> 
> The point being that this is borderline backport material, although it
> does depend on the 32 vCPU bugfix.
> 
>> ---
>> v2:
>>   * New patch. Replaces adding cpu policy to hvmloader in v1.
>> ---
>>  tools/firmware/hvmloader/smp.c | 111 +++++++++++++--------------------
>>  1 file changed, 44 insertions(+), 67 deletions(-)
>>
>> diff --git a/tools/firmware/hvmloader/smp.c b/tools/firmware/hvmloader/smp.c
>> index 082b17f13818..a668f15d7e1f 100644
>> --- a/tools/firmware/hvmloader/smp.c
>> +++ b/tools/firmware/hvmloader/smp.c
>> @@ -22,88 +22,68 @@
>>  #include "util.h"
>>  #include "config.h"
>>  #include "apic_regs.h"
>> +#include "hypercall.h"
>>  
>> -#define AP_BOOT_EIP 0x1000
>> -extern char ap_boot_start[], ap_boot_end[];
>> +#include <xen/asm/x86-defns.h>
>> +#include <xen/hvm/hvm_vcpu.h>
>> +
>> +#include <xen/vcpu.h>
>>  
>>  static int ap_callin, ap_cpuid;
>>  
>> -asm (
>> -    "    .text                       \n"
>> -    "    .code16                     \n"
>> -    "ap_boot_start: .code16          \n"
>> -    "    mov   %cs,%ax               \n"
>> -    "    mov   %ax,%ds               \n"
>> -    "    lgdt  gdt_desr-ap_boot_start\n"
>> -    "    xor   %ax, %ax              \n"
>> -    "    inc   %ax                   \n"
>> -    "    lmsw  %ax                   \n"
>> -    "    ljmpl $0x08,$1f             \n"
>> -    "gdt_desr:                       \n"
>> -    "    .word gdt_end - gdt - 1     \n"
>> -    "    .long gdt                   \n"
>> -    "ap_boot_end: .code32            \n"
>> -    "1:  mov   $0x10,%eax            \n"
>> -    "    mov   %eax,%ds              \n"
>> -    "    mov   %eax,%es              \n"
>> -    "    mov   %eax,%ss              \n"
>> -    "    movl  $stack_top,%esp       \n"
>> -    "    movl  %esp,%ebp             \n"
>> -    "    call  ap_start              \n"
>> -    "1:  hlt                         \n"
>> -    "    jmp  1b                     \n"
>> -    "                                \n"
>> -    "    .align 8                    \n"
>> -    "gdt:                            \n"
>> -    "    .quad 0x0000000000000000    \n"
>> -    "    .quad 0x00cf9a000000ffff    \n" /* 0x08: Flat code segment */
>> -    "    .quad 0x00cf92000000ffff    \n" /* 0x10: Flat data segment */
>> -    "gdt_end:                        \n"
>> -    "                                \n"
>> -    "    .bss                        \n"
>> -    "    .align    8                 \n"
>> -    "stack:                          \n"
>> -    "    .skip    0x4000             \n"
>> -    "stack_top:                      \n"
>> -    "    .text                       \n"
>> -    );
>> -
>> -void ap_start(void); /* non-static avoids unused-function compiler warning */
>> -/*static*/ void ap_start(void)
>> +static void ap_start(void)
>>  {
>>      printf(" - CPU%d ... ", ap_cpuid);
>>      cacheattr_init();
>>      printf("done.\n");
>> +
>> +    if ( !ap_cpuid )
>> +        return;
>> +
>>      wmb();
>>      ap_callin = 1;
> 
> /* After this point, the BSP will shut us down. */
> 
>> -}
>>  
>> -static void lapic_wait_ready(void)
>> -{
>> -    while ( lapic_read(APIC_ICR) & APIC_ICR_BUSY )
>> -        cpu_relax();
>> +    while ( 1 )
> 
> For this, we tend to favour "for ( ;; )".
> 
>> +        asm volatile ( "hlt" );
>>  }
>>  
>>  static void boot_cpu(unsigned int cpu)
>>  {
>> -    unsigned int icr2 = SET_APIC_DEST_FIELD(LAPIC_ID(cpu));
>> +    static uint8_t ap_stack[4 * PAGE_SIZE] __attribute__ ((aligned (16)));
> 
> I know you're just copying what was there, but 4 pages is stupidly large
> for something that needs about 4 stack slots.
> 
> 4K is absolutely plenty.
> 
>> +    static struct vcpu_hvm_context ap;
>>  
>>      /* Initialise shared variables. */
>>      ap_cpuid = cpu;
>> -    ap_callin = 0;
>>      wmb();
>>  
>> -    /* Wake up the secondary processor: INIT-SIPI-SIPI... */
>> -    lapic_wait_ready();
>> -    lapic_write(APIC_ICR2, icr2);
>> -    lapic_write(APIC_ICR, APIC_DM_INIT);
>> -    lapic_wait_ready();
>> -    lapic_write(APIC_ICR2, icr2);
>> -    lapic_write(APIC_ICR, APIC_DM_STARTUP | (AP_BOOT_EIP >> 12));
>> -    lapic_wait_ready();
>> -    lapic_write(APIC_ICR2, icr2);
>> -    lapic_write(APIC_ICR, APIC_DM_STARTUP | (AP_BOOT_EIP >> 12));
>> -    lapic_wait_ready();
>> +    /* Wake up the secondary processor */
>> +    ap = (struct vcpu_hvm_context) {
>> +        .mode = VCPU_HVM_MODE_32B,
>> +        .cpu_regs.x86_32 = {
>> +            .eip = (uint32_t)ap_start,
>> +            .esp = (uint32_t)ap_stack + ARRAY_SIZE(ap_stack),
> 
> Not that it really matters, but these want to be unsigned long casts.
> 
>> +
>> +            /* Protected mode with MMU off */
>> +            .cr0 = X86_CR0_PE,
>> +
>> +            /* Prepopulate the GDT */
> 
> /* 32bit Flat Mode */
> 
> This isn't the GDT; it's the segment registers, but "Flat Mode" is the
> more meaningful term to use.
> 
> 
> I'm happy to fix all on commit.
> 
> ~Andrew

All sound ok to me.

Cheers,
Alejandro

