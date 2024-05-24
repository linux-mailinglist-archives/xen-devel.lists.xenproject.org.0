Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBA18CE79F
	for <lists+xen-devel@lfdr.de>; Fri, 24 May 2024 17:16:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.729621.1134832 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAWdu-0006tS-3P; Fri, 24 May 2024 15:15:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 729621.1134832; Fri, 24 May 2024 15:15:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sAWdt-0006rC-Vz; Fri, 24 May 2024 15:15:37 +0000
Received: by outflank-mailman (input) for mailman id 729621;
 Fri, 24 May 2024 15:15:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=di0w=M3=cloud.com=alejandro.vallejo@srs-se1.protection.inumbo.net>)
 id 1sAWds-0006r6-WA
 for xen-devel@lists.xenproject.org; Fri, 24 May 2024 15:15:37 +0000
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7882f9e8-19e0-11ef-90a1-e314d9c70b13;
 Fri, 24 May 2024 17:15:35 +0200 (CEST)
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-351da5838fcso7063945f8f.1
 for <xen-devel@lists.xenproject.org>; Fri, 24 May 2024 08:15:35 -0700 (PDT)
Received: from [192.168.0.16] (0545937c.skybroadband.com. [5.69.147.124])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3557a090366sm1794956f8f.56.2024.05.24.08.15.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 May 2024 08:15:34 -0700 (PDT)
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
X-Inumbo-ID: 7882f9e8-19e0-11ef-90a1-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloud.com; s=cloud; t=1716563735; x=1717168535; darn=lists.xenproject.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Pzha0SXnIFFw19paCm4++P584G1jtIlrmAuQIZQA6dE=;
        b=limjjwZ1pDHvLoffNejEbuTU6wiIhLlSd+SOX+Quft2zDJ1w4C4JBVgwUDygdYK6wj
         xskaPi87Imu7mUTwUzBxC6CEYMICMpQjFfbepbnt95/q2vSM1yULkrCtXBxe7k+ybT/W
         IP6FXkPi2G5mV1cWylH1etRkYw8T97UV84mj8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716563735; x=1717168535;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Pzha0SXnIFFw19paCm4++P584G1jtIlrmAuQIZQA6dE=;
        b=uvfesDQROwqMoffwLjniWHqafilVmGR5YT+fFi5MD9tzDQkBumg4o4nyD8i8uKt6Lh
         LdlIsWHBEiX8C5Q4DAZYj+MPmy5au+yLOGEDueTExVw5r/Q45z+uyEVyVlBmkUM8Hqmi
         2ZQcx3KgbOksMOWoN9I9K3XHBsCWaBVy4B1nE3AlOmiwX8BOCIJtBSK/RsbF2StPoi/l
         SFFmNv5u/tGzUEr6BXmVp2SQHV5J/1I2/74Gl2MBWj6bAMgveazJ9HesHhJJmSAUXOq7
         1ehfod1RIzMJALwEjKqhO9xUiGSviPtAGDPNZlUkJZqOYuz5fgqEFTLVBxG+f2upFY87
         y75g==
X-Gm-Message-State: AOJu0YycwJZXaF2puH09HQlu3gr84KwnbBW1qDKN8ohpA91Q/sqvsSnN
	tD6/rkeLB0OEs9pSICRqSFochas2AUejNtOUNPcnz++THgsLnsdEZp9vep37O/c=
X-Google-Smtp-Source: AGHT+IHlHiW2Hh/ZZWF3LWZwfHs3V9smVwqZIdKzr8tYVGynHLEvWLfT0e4s9D02jD5e8EqOefi+HQ==
X-Received: by 2002:a5d:4a0b:0:b0:34c:9a04:466f with SMTP id ffacd0b85a97d-35527055733mr1868554f8f.50.1716563735135;
        Fri, 24 May 2024 08:15:35 -0700 (PDT)
Message-ID: <8cac1707-855b-478a-b88d-7fd619f19352@cloud.com>
Date: Fri, 24 May 2024 16:15:34 +0100
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
 <ZlA_6Abtw-u4a84J@macbook>
Content-Language: en-GB
From: Alejandro Vallejo <alejandro.vallejo@cloud.com>
In-Reply-To: <ZlA_6Abtw-u4a84J@macbook>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 24/05/2024 08:21, Roger Pau Monné wrote:
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
>> +    if ( apic_id == 255 )
>> +        cpuid(0xb, NULL, NULL, NULL, &apic_id);
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
> Further thinking about this: do we really need the wmb(), given the
> usage of ACCESS_ONCE()?
> 
> wmb() is a compiler barrier, and the usage of volatile in
> ACCESS_ONCE() should already prevent any compiler re-ordering.
> 
> Thanks, Roger.

volatile reads/writes cannot be reordered with other volatile
reads/writes, but volatile reads/writes can be reordered with
non-volatile reads/writes, AFAIR.

My intent here was to prevent the compiler omitting the write (though in
practice it didn't). I think the barrier is still required to prevent
reordering according to the spec.

Cheers,
Alejandro

