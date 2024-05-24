Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 812638CE79E
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2024 17:16:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.729626.1134842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAWeK-0007Gy-B5; Fri, 24 May 2024 15:16:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 729626.1134842; Fri, 24 May 2024 15:16:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAWeK-0007Ey-76; Fri, 24 May 2024 15:16:04 +0000
Received: by outflank-mailman (input) for mailman id 729626;
 Fri, 24 May 2024 15:16:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=di0w=M3=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sAWeJ-0006r6-FZ
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 15:16:03 +0000
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [2a00:1450:4864:20::32b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8897f6c5-19e0-11ef-90a1-e314d9c70b13;
 Fri, 24 May 2024 17:16:02 +0200 (CEST)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-421087b6f3fso9691095e9.1
 for <xen-devel@lists.xenproject.org>; Fri, 24 May 2024 08:16:02 -0700 (PDT)
Received: from [192.168.0.16] (0545937c.skybroadband.com. [5.69.147.124])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-421089667fbsm23226005e9.9.2024.05.24.08.16.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 May 2024 08:16:01 -0700 (PDT)
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
X-Inumbo-ID: 8897f6c5-19e0-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1716563762; x=1717168562; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9JrTo/FWXvXLGJX0A+cyjzMM3Yze1fosVh7VTTyCRZk=;
        b=ikmQ7uxo75JExPHvDmtLuGsedR7A+KaosMosLcVHfrnSfzfpp38IOD7XhYANhGNn+I
         sKD/ujKdpernJ/P9YGbfuH5DZJc4LG6vw+KZ98J5c6+cOCSTifpMacvRbPrVKujvO0U3
         C2rk4VTQdu03YUSL6GxrQtAVjYMKSWj4c8HjA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716563762; x=1717168562;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9JrTo/FWXvXLGJX0A+cyjzMM3Yze1fosVh7VTTyCRZk=;
        b=peqSCWFM2Rre+crqFaDAm1bYJLeVdBu9wIIs+JLOJ+879RCuqGMmf8c/s/9dTLysCo
         BYuCmTnJCjNa0HJX3qkM/ffSCVWsLWHESRvzQxYIZMdLPcHBfhSFsfoO7UVl+AG5lOW7
         J6jvbHJ3XVXffsG8zFeBEY69Ko2HXsGhHyUt3z/QbAjK6gDqxIflc0scqUgpgiWepjVv
         cre8YFSsCwXy86PyeRzkbsJ0qtDAQqMKmHIvkypBJbv2RCAyChbSs8Lh+6UlusAnXnB4
         uSqyk/9bkGh28fNKpiRUte23aUxNtlkESYtxLJYzwEfBrC/umnxYVo5wDaI6MfxAXT95
         +Zxg==
X-Gm-Message-State: AOJu0YwdFjr/dqpSvYca2eg9Ey9Ot/AI8QPPFL9H634nWgJamlGOp5OK
	tA2+kBZy6SKtA7DfIFs2jbnySKxwtjJZ6jFXLbXPD+k/1aUAcecMXpkiJdkUaPE=
X-Google-Smtp-Source: AGHT+IElGLDWgvok5fpHRZ3Aj+ujcGFBt08ISngygkdwl+RuHW3A2M4ezk/7P4Ux6GC0kRpFBsTo3Q==
X-Received: by 2002:a7b:cbd0:0:b0:420:1592:da3f with SMTP id 5b1f17b1804b1-421089d9db8mr22247835e9.11.1716563762200;
        Fri, 24 May 2024 08:16:02 -0700 (PDT)
Message-ID: <d6ebb2f0-fb15-4ca4-9833-cd635511b2d3@cloud.com>
Date: Fri, 24 May 2024 16:16:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] tools/hvmloader: Retrieve (x2)APIC IDs from the
 APs themselves
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 Anthony PERARD <anthony@xenproject.org>
References: <cover.1715102098.git.alejandro.vallejo@cloud.com>
 <b2d4109cd30c82e0af153d36f8dce77c59f03695.1715102098.git.alejandro.vallejo@cloud.com>
 <Zk9rOqooa3PJCyw1@macbook>
Content-Language: en-GB
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
In-Reply-To: <Zk9rOqooa3PJCyw1@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 23/05/2024 17:13, Roger Pau Monné wrote:
> On Wed, May 08, 2024 at 01:39:24PM +0100, Alejandro Vallejo wrote:
>> Make it so the APs expose their own APIC IDs in a LUT. We can use that LUT to
>> populate the MADT, decoupling the algorithm that relates CPU IDs and APIC IDs
>> from hvmloader.
>>
>> While at this also remove ap_callin, as writing the APIC ID may serve the same
>> purpose.
>>
>> Signed-off-by: Alejandro Vallejo <alejandro.vallejo@cloud.com>
>> ---
>> v2:
>>   * New patch. Replaces adding cpu policy to hvmloader in v1.
>> ---
>>  tools/firmware/hvmloader/config.h    |  6 ++++-
>>  tools/firmware/hvmloader/hvmloader.c |  4 +--
>>  tools/firmware/hvmloader/smp.c       | 40 +++++++++++++++++++++++-----
>>  tools/firmware/hvmloader/util.h      |  5 ++++
>>  xen/arch/x86/include/asm/hvm/hvm.h   |  1 +
>>  5 files changed, 47 insertions(+), 9 deletions(-)
>>
>> diff --git a/tools/firmware/hvmloader/config.h b/tools/firmware/hvmloader/config.h
>> index c82adf6dc508..edf6fa9c908c 100644
>> --- a/tools/firmware/hvmloader/config.h
>> +++ b/tools/firmware/hvmloader/config.h
>> @@ -4,6 +4,8 @@
>>  #include <stdint.h>
>>  #include <stdbool.h>
>>  
>> +#include <xen/hvm/hvm_info_table.h>
>> +
>>  enum virtual_vga { VGA_none, VGA_std, VGA_cirrus, VGA_pt };
>>  extern enum virtual_vga virtual_vga;
>>  
>> @@ -49,8 +51,10 @@ extern uint8_t ioapic_version;
>>  
>>  #define IOAPIC_ID           0x01
>>  
>> +extern uint32_t CPU_TO_X2APICID[HVM_MAX_VCPUS];
>> +
>>  #define LAPIC_BASE_ADDRESS  0xfee00000
>> -#define LAPIC_ID(vcpu_id)   ((vcpu_id) * 2)
>> +#define LAPIC_ID(vcpu_id)   (CPU_TO_X2APICID[(vcpu_id)])
>>  
>>  #define PCI_ISA_DEVFN       0x08    /* dev 1, fn 0 */
>>  #define PCI_ISA_IRQ_MASK    0x0c20U /* ISA IRQs 5,10,11 are PCI connected */
>> diff --git a/tools/firmware/hvmloader/hvmloader.c b/tools/firmware/hvmloader/hvmloader.c
>> index c58841e5b556..1eba92229925 100644
>> --- a/tools/firmware/hvmloader/hvmloader.c
>> +++ b/tools/firmware/hvmloader/hvmloader.c
>> @@ -342,11 +342,11 @@ int main(void)
>>  
>>      printf("CPU speed is %u MHz\n", get_cpu_mhz());
>>  
>> +    smp_initialise();
>> +
>>      apic_setup();
>>      pci_setup();
>>  
>> -    smp_initialise();
>> -
>>      perform_tests();
>>  
>>      if ( bios->bios_info_setup )
>> diff --git a/tools/firmware/hvmloader/smp.c b/tools/firmware/hvmloader/smp.c
>> index a668f15d7e1f..4d75f239c2f5 100644
>> --- a/tools/firmware/hvmloader/smp.c
>> +++ b/tools/firmware/hvmloader/smp.c
>> @@ -29,7 +29,34 @@
>>  
>>  #include <xen/vcpu.h>
>>  
>> -static int ap_callin, ap_cpuid;
>> +static int ap_cpuid;
>> +
>> +/**
>> + * Lookup table of x2APIC IDs.
>> + *
>> + * Each entry is populated its respective CPU as they come online. This is required
>> + * for generating the MADT with minimal assumptions about ID relationships.
>> + */
>> +uint32_t CPU_TO_X2APICID[HVM_MAX_VCPUS];
>> +
>> +static uint32_t read_apic_id(void)
>> +{
>> +    uint32_t apic_id;
>> +
>> +    cpuid(1, NULL, &apic_id, NULL, NULL);
>> +    apic_id >>= 24;
>> +
>> +    /*
>> +     * APIC IDs over 255 are represented by 255 in leaf 1 and are meant to be
>> +     * read from topology leaves instead. Xen exposes x2APIC IDs in leaf 0xb,
>> +     * but only if the x2APIC feature is present. If there are that many CPUs
>> +     * it's guaranteed to be there so we can avoid checking for it specifically
>> +     */
> 
> Maybe I'm missing something, but given the current code won't Xen just
> return the low 8 bits from the x2APIC ID?  I don't see any code in
> guest_cpuid() that adjusts the IDs to be 255 when > 255.>
>> +    if ( apic_id == 255 )
>> +        cpuid(0xb, NULL, NULL, NULL, &apic_id);
> 
> Won't the correct logic be to check if x2APIC is set in CPUID, and
> then fetch the APIC ID from leaf 0xb, otherwise fallback to fetching
> the APID ID from leaf 1?

I was pretty sure that was the behaviour of real HW, but clearly I was
wrong. Just checked on a beefy machine and that's indeed the low 8 bits,
just as Xen emulates. Got confused with the core count, that does clip
to 255.

Will adjust by explicitly checking for the x2apic_id bit.

> 
>> +
>> +    return apic_id;
>> +}
>>  
>>  static void ap_start(void)
>>  {
>> @@ -37,12 +64,12 @@ static void ap_start(void)
>>      cacheattr_init();
>>      printf("done.\n");
>>  
>> +    wmb();
>> +    ACCESS_ONCE(CPU_TO_X2APICID[ap_cpuid]) = read_apic_id();
> 
> A comment would be helpful here, that CPU_TO_X2APICID[ap_cpuid] is
> used as synchronization that the AP has started.
> 
> You probably want to assert that read_apic_id() doesn't return 0,
> otherwise we are skewed.

Not a bad idea. Sure

> 
>> +
>>      if ( !ap_cpuid )
>>          return;
>>  
>> -    wmb();
>> -    ap_callin = 1;
>> -
>>      while ( 1 )
>>          asm volatile ( "hlt" );
>>  }
>> @@ -86,10 +113,11 @@ static void boot_cpu(unsigned int cpu)
>>          BUG();
>>  
>>      /*
>> -     * Wait for the secondary processor to complete initialisation.
>> +     * Wait for the secondary processor to complete initialisation,
>> +     * which is signaled by its x2APIC ID being writted to the LUT.
>>       * Do not touch shared resources meanwhile.
>>       */
>> -    while ( !ap_callin )
>> +    while ( !ACCESS_ONCE(CPU_TO_X2APICID[cpu]) )
>>          cpu_relax();
> 
> As a further improvement, we could launch all APs in pararell, and use
> a for loop to wait until all positions of the CPU_TO_X2APICID array
> are set.

I thought about it, but then we'd need locking for the prints as well,
or refactor things so only the BSP prints on success.

The time taken is truly negligible, so I reckon it's better left for
another patch.

> 
>>  
>>      /* Take the secondary processor offline. */
>> diff --git a/tools/firmware/hvmloader/util.h b/tools/firmware/hvmloader/util.h
>> index 14078bde1e30..51e9003bc615 100644
>> --- a/tools/firmware/hvmloader/util.h
>> +++ b/tools/firmware/hvmloader/util.h
>> @@ -23,6 +23,11 @@ enum {
>>  #define __STR(...) #__VA_ARGS__
>>  #define STR(...) __STR(__VA_ARGS__)
>>  
>> +#define __ACCESS_ONCE(x) ({                             \
>> +            (void)(typeof(x))0; /* Scalar typecheck. */ \
>> +            (volatile typeof(x) *)&(x); })
>> +#define ACCESS_ONCE(x) (*__ACCESS_ONCE(x))
> 
> Might be better for this to be placed in common-macros.h?

Sure.

> 
>> +
>>  /* GDT selector values. */
>>  #define SEL_CODE16          0x0008
>>  #define SEL_DATA16          0x0010
>> diff --git a/xen/arch/x86/include/asm/hvm/hvm.h b/xen/arch/x86/include/asm/hvm/hvm.h
>> index 84911f3ebcb4..6c005f0b0b38 100644
>> --- a/xen/arch/x86/include/asm/hvm/hvm.h
>> +++ b/xen/arch/x86/include/asm/hvm/hvm.h
>> @@ -16,6 +16,7 @@
>>  #include <asm/current.h>
>>  #include <asm/x86_emulate.h>
>>  #include <asm/hvm/asid.h>
>> +#include <asm/hvm/vlapic.h>
> 
> Is this a stray change?  Otherwise I don't see why this need to be
> part of this patch when the rest of the changes are exclusively to
> hvmloader.
> 
> Thanks, Roger.

Should've been part of the vlapic_policy_update change. That line got
lost in the v1->v2 conversion. I just moved to where it logically
belongs now.

Cheers,
Alejandro



