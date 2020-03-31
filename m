Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86033199618
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2020 14:15:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJFkn-0003dC-0l; Tue, 31 Mar 2020 12:12:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=DP+J=5Q=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jJFkl-0003d7-QJ
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2020 12:12:23 +0000
X-Inumbo-ID: e05230cc-7348-11ea-b58d-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e05230cc-7348-11ea-b58d-bc764e2007e4;
 Tue, 31 Mar 2020 12:12:23 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 63AA6AEBF;
 Tue, 31 Mar 2020 12:12:22 +0000 (UTC)
Subject: Re: [PATCH 3/3] xen/x86: ioapic: Simplify ioapic_init()
To: Julien Grall <julien@xen.org>
References: <20200327190546.21580-1-julien@xen.org>
 <20200327190546.21580-4-julien@xen.org>
 <9c656f26-9510-d11c-ba30-094cc23481d1@suse.com>
 <4517371f-7b8b-3612-2917-f392388c914e@xen.org>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <362393f8-b242-1d5d-9f42-7a925cd8496e@suse.com>
Date: Tue, 31 Mar 2020 14:12:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <4517371f-7b8b-3612-2917-f392388c914e@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
 =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 31.03.2020 13:51, Julien Grall wrote:
> Hi Jan,
> 
> On 31/03/2020 12:22, Jan Beulich wrote:
>> On 27.03.2020 20:05, Julien Grall wrote:
>>> --- a/xen/arch/x86/io_apic.c
>>> +++ b/xen/arch/x86/io_apic.c
>>> @@ -2537,34 +2537,25 @@ static __init bool bad_ioapic_register(unsigned int idx)
>>>       return false;
>>>   }
>>>   -void __init init_ioapic(void)
>>> +static void __init init_ioapic_mappings(void)
>>>   {
>>> -    unsigned long ioapic_phys;
>>>       unsigned int i, idx = FIX_IO_APIC_BASE_0;
>>> -    union IO_APIC_reg_01 reg_01;
>>>   -    if ( smp_found_config )
>>> -        nr_irqs_gsi = 0;
>>>       for ( i = 0; i < nr_ioapics; i++ )
>>>       {
>>> -        if ( smp_found_config )
>>> -        {
>>> -            ioapic_phys = mp_ioapics[i].mpc_apicaddr;
>>> -            if ( !ioapic_phys )
>>> -            {
>>> -                printk(KERN_ERR "WARNING: bogus zero IO-APIC address "
>>> -                       "found in MPTABLE, disabling IO/APIC support!\n");
>>> -                smp_found_config = false;
>>> -                skip_ioapic_setup = true;
>>> -                goto fake_ioapic_page;
>>> -            }
>>> -        }
>>> -        else
>>> +        union IO_APIC_reg_01 reg_01;
>>> +        unsigned long ioapic_phys = mp_ioapics[i].mpc_apicaddr;
>>> +
>>> +        ioapic_phys = mp_ioapics[i].mpc_apicaddr;
>>> +        if ( !ioapic_phys )
>>>           {
>>> - fake_ioapic_page:
>>> -            ioapic_phys = __pa(alloc_xenheap_page());
>>> -            clear_page(__va(ioapic_phys));
>>> +            printk(KERN_ERR
>>> +                   "WARNING: bogus zero IO-APIC address found in MPTABLE, disabling IO/APIC support!\n");
>>> +            smp_found_config = false;
>>> +            skip_ioapic_setup = true;
>>> +            break;
>>>           }
>>> +
>>>           set_fixmap_nocache(idx, ioapic_phys);
>>>           apic_printk(APIC_VERBOSE, "mapped IOAPIC to %08Lx (%08lx)\n",
>>>                       __fix_to_virt(idx), ioapic_phys);
>>> @@ -2576,18 +2567,24 @@ void __init init_ioapic(void)
>>>               continue;
>>>           }
>>>   -        if ( smp_found_config )
>>> -        {
>>> -            /* The number of IO-APIC IRQ registers (== #pins): */
>>> -            reg_01.raw = io_apic_read(i, 1);
>>> -            nr_ioapic_entries[i] = reg_01.bits.entries + 1;
>>> -            nr_irqs_gsi += nr_ioapic_entries[i];
>>> -
>>> -            if ( rangeset_add_singleton(mmio_ro_ranges,
>>> -                                        ioapic_phys >> PAGE_SHIFT) )
>>> -                printk(KERN_ERR "Failed to mark IO-APIC page %lx read-only\n",
>>> -                       ioapic_phys);
>>> -        }
>>> +        /* The number of IO-APIC IRQ registers (== #pins): */
>>> +        reg_01.raw = io_apic_read(i, 1);
>>> +        nr_ioapic_entries[i] = reg_01.bits.entries + 1;
>>> +        nr_irqs_gsi += nr_ioapic_entries[i];
>>> +
>>> +        if ( rangeset_add_singleton(mmio_ro_ranges,
>>> +                                    ioapic_phys >> PAGE_SHIFT) )
>>> +            printk(KERN_ERR "Failed to mark IO-APIC page %lx read-only\n",
>>> +                   ioapic_phys);
>>> +    }
>>> +}
>>> +
>>> +void __init init_ioapic(void)
>>> +{
>>> +    if ( smp_found_config )
>>> +    {
>>> +        nr_irqs_gsi = 0;
>>
>> This would seem to also belong into the function, e.g. as part of
>> the loop header:
>>
>>      for ( nr_irqs_gsi = i = 0; i < nr_ioapics; i++ )
> 
> While the initial value of the 'i' and 'nr_irqs_gsi' is the same,
> the variables have very different meaning and may confuse the reader.

I expected reservations like this, hence the "e.g."; i.e. ...

> So I would rather not follow your suggestion here. Although, I can
> move the zeroing right before the for loop.

... I'm fine with this as well.

Jan

