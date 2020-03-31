Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 22D7D1995D7
	for <lists+xen-devel@lfdr.de>; Tue, 31 Mar 2020 13:54:58 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jJFQT-0001Z3-RE; Tue, 31 Mar 2020 11:51:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=sM9E=5Q=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jJFQS-0001Yv-6n
 for xen-devel@lists.xenproject.org; Tue, 31 Mar 2020 11:51:24 +0000
X-Inumbo-ID: f1e1b7f2-7345-11ea-b4f4-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f1e1b7f2-7345-11ea-b4f4-bc764e2007e4;
 Tue, 31 Mar 2020 11:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Eg5IDB3u80cumliv9RV4rGHEqFKxnOn/GItjn4CbCZY=; b=ndAUZSPIfth1q1JvEzg5+oSrzg
 Onfv5Oza01S8UO5X2y6nOtwgoF/A6OcC8zaDLeqw5B1HMqsFi0FNycvVwDaCePOexUAb0L+ox5oBt
 jM019y5iwo8XYNUuYLBHp03JIhzQEnpDpvVnZJ31o8R+4Z3Czq/mUxmfcnoyG2VDuVDw=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jJFQP-0003zt-G5; Tue, 31 Mar 2020 11:51:21 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.89)
 (envelope-from <julien@xen.org>)
 id 1jJFQP-00004x-81; Tue, 31 Mar 2020 11:51:21 +0000
Subject: Re: [PATCH 3/3] xen/x86: ioapic: Simplify ioapic_init()
To: Jan Beulich <jbeulich@suse.com>
References: <20200327190546.21580-1-julien@xen.org>
 <20200327190546.21580-4-julien@xen.org>
 <9c656f26-9510-d11c-ba30-094cc23481d1@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <4517371f-7b8b-3612-2917-f392388c914e@xen.org>
Date: Tue, 31 Mar 2020 12:51:19 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:68.0)
 Gecko/20100101 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <9c656f26-9510-d11c-ba30-094cc23481d1@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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

Hi Jan,

On 31/03/2020 12:22, Jan Beulich wrote:
> On 27.03.2020 20:05, Julien Grall wrote:
>> --- a/xen/arch/x86/io_apic.c
>> +++ b/xen/arch/x86/io_apic.c
>> @@ -2537,34 +2537,25 @@ static __init bool bad_ioapic_register(unsigned int idx)
>>       return false;
>>   }
>>   
>> -void __init init_ioapic(void)
>> +static void __init init_ioapic_mappings(void)
>>   {
>> -    unsigned long ioapic_phys;
>>       unsigned int i, idx = FIX_IO_APIC_BASE_0;
>> -    union IO_APIC_reg_01 reg_01;
>>   
>> -    if ( smp_found_config )
>> -        nr_irqs_gsi = 0;
>>       for ( i = 0; i < nr_ioapics; i++ )
>>       {
>> -        if ( smp_found_config )
>> -        {
>> -            ioapic_phys = mp_ioapics[i].mpc_apicaddr;
>> -            if ( !ioapic_phys )
>> -            {
>> -                printk(KERN_ERR "WARNING: bogus zero IO-APIC address "
>> -                       "found in MPTABLE, disabling IO/APIC support!\n");
>> -                smp_found_config = false;
>> -                skip_ioapic_setup = true;
>> -                goto fake_ioapic_page;
>> -            }
>> -        }
>> -        else
>> +        union IO_APIC_reg_01 reg_01;
>> +        unsigned long ioapic_phys = mp_ioapics[i].mpc_apicaddr;
>> +
>> +        ioapic_phys = mp_ioapics[i].mpc_apicaddr;
>> +        if ( !ioapic_phys )
>>           {
>> - fake_ioapic_page:
>> -            ioapic_phys = __pa(alloc_xenheap_page());
>> -            clear_page(__va(ioapic_phys));
>> +            printk(KERN_ERR
>> +                   "WARNING: bogus zero IO-APIC address found in MPTABLE, disabling IO/APIC support!\n");
>> +            smp_found_config = false;
>> +            skip_ioapic_setup = true;
>> +            break;
>>           }
>> +
>>           set_fixmap_nocache(idx, ioapic_phys);
>>           apic_printk(APIC_VERBOSE, "mapped IOAPIC to %08Lx (%08lx)\n",
>>                       __fix_to_virt(idx), ioapic_phys);
>> @@ -2576,18 +2567,24 @@ void __init init_ioapic(void)
>>               continue;
>>           }
>>   
>> -        if ( smp_found_config )
>> -        {
>> -            /* The number of IO-APIC IRQ registers (== #pins): */
>> -            reg_01.raw = io_apic_read(i, 1);
>> -            nr_ioapic_entries[i] = reg_01.bits.entries + 1;
>> -            nr_irqs_gsi += nr_ioapic_entries[i];
>> -
>> -            if ( rangeset_add_singleton(mmio_ro_ranges,
>> -                                        ioapic_phys >> PAGE_SHIFT) )
>> -                printk(KERN_ERR "Failed to mark IO-APIC page %lx read-only\n",
>> -                       ioapic_phys);
>> -        }
>> +        /* The number of IO-APIC IRQ registers (== #pins): */
>> +        reg_01.raw = io_apic_read(i, 1);
>> +        nr_ioapic_entries[i] = reg_01.bits.entries + 1;
>> +        nr_irqs_gsi += nr_ioapic_entries[i];
>> +
>> +        if ( rangeset_add_singleton(mmio_ro_ranges,
>> +                                    ioapic_phys >> PAGE_SHIFT) )
>> +            printk(KERN_ERR "Failed to mark IO-APIC page %lx read-only\n",
>> +                   ioapic_phys);
>> +    }
>> +}
>> +
>> +void __init init_ioapic(void)
>> +{
>> +    if ( smp_found_config )
>> +    {
>> +        nr_irqs_gsi = 0;
> 
> This would seem to also belong into the function, e.g. as part of
> the loop header:
> 
>      for ( nr_irqs_gsi = i = 0; i < nr_ioapics; i++ )

While the initial value of the 'i' and 'nr_irqs_gsi' is the same, the 
variables have very different meaning and may confuse the reader.

So I would rather not follow your suggestion here. Although, I can move 
the zeroing right before the for loop.

Cheers,

-- 
Julien Grall

