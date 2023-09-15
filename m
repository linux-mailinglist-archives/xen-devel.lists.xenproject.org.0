Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0231F7A2056
	for <lists+xen-devel@lfdr.de>; Fri, 15 Sep 2023 16:01:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603166.940075 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qh9NN-0002UN-Ph; Fri, 15 Sep 2023 14:00:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603166.940075; Fri, 15 Sep 2023 14:00:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qh9NN-0002S2-MR; Fri, 15 Sep 2023 14:00:53 +0000
Received: by outflank-mailman (input) for mailman id 603166;
 Fri, 15 Sep 2023 14:00:52 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qh9NM-0002Rw-5W
 for xen-devel@lists.xenproject.org; Fri, 15 Sep 2023 14:00:52 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qh9NJ-0004wZ-PA; Fri, 15 Sep 2023 14:00:49 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qh9NJ-0003Fu-K5; Fri, 15 Sep 2023 14:00:49 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=QUV1spqR0JMQKCwaTmDPetRqsUrvpfywVpdbE0IFAQo=; b=e/uMGhSca3lUwnoRwxRIyPMTsA
	xzQdFnoUWf5U11IfC4maAFAZzpkiz1DnNgnxDZLXhvCThoOI2LWqC5uxFoR81bKrYCUIrZGrqp/Q/
	tAKNfrk7wBynvpxVBjU5e3tJ8w2ZNu6VMBaPxqjt0Y19IXlOCRT/QJrcbZAS/oOjstPo=;
Message-ID: <28ada8e1-0b24-4632-8bec-4939405f5d00@xen.org>
Date: Fri, 15 Sep 2023 15:00:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] xen/x86: ioapic: Bail out from timer_irq_works() as
 soon as possible
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu
 <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20230818134441.45586-1-julien@xen.org>
 <20230818134441.45586-3-julien@xen.org>
 <a198d472-4b1d-1da5-e336-232af98b87aa@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <a198d472-4b1d-1da5-e336-232af98b87aa@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 07/09/2023 15:28, Jan Beulich wrote:
> On 18.08.2023 15:44, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Currently timer_irq_works() will wait the full 100ms before checking
>> that pit0_ticks has been incremented at least 4 times.
>>
>> However, the bulk of the BIOS/platform should not have a buggy timer.
>> So waiting for the full 100ms is a bit harsh.
>>
>> Rework the logic to only wait until 100ms passed or we saw more than
>> 4 ticks. So now, in the good case, this will reduce the wait time
>> to ~50ms.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> In principle this is all fine. There's a secondary aspect though which
> may call for a slight rework of the patch.
> 
>> --- a/xen/arch/x86/io_apic.c
>> +++ b/xen/arch/x86/io_apic.c
>> @@ -1509,6 +1509,8 @@ static void __init setup_ioapic_ids_from_mpc(void)
>>   static int __init timer_irq_works(void)
>>   {
>>       unsigned long t1, flags;
>> +    /* Wait for maximum 10 ticks */
>> +    unsigned long msec = (10 * 1000) / HZ;
> 
> (Minor remark: I don't think this needs to be unsigned long; unsigned
> in will suffice.)

You are right. I can switch to unsigned int.

> 
>> @@ -1517,19 +1519,25 @@ static int __init timer_irq_works(void)
>>   
>>       local_save_flags(flags);
>>       local_irq_enable();
>> -    /* Let ten ticks pass... */
>> -    mdelay((10 * 1000) / HZ);
>> -    local_irq_restore(flags);
>>   
>> -    /*
>> -     * Expect a few ticks at least, to be sure some possible
>> -     * glue logic does not lock up after one or two first
>> -     * ticks in a non-ExtINT mode.  Also the local APIC
>> -     * might have cached one ExtINT interrupt.  Finally, at
>> -     * least one tick may be lost due to delays.
>> -     */
>> -    if ( (ACCESS_ONCE(pit0_ticks) - t1) > 4 )
>> +    while ( msec-- )
>> +    {
>> +        mdelay(1);
>> +        /*
>> +         * Expect a few ticks at least, to be sure some possible
>> +         * glue logic does not lock up after one or two first
>> +         * ticks in a non-ExtINT mode.  Also the local APIC
>> +         * might have cached one ExtINT interrupt.  Finally, at
>> +         * least one tick may be lost due to delays.
>> +         */
>> +        if ( (ACCESS_ONCE(pit0_ticks) - t1) <= 4 )
>> +            continue;
>> +
>> +        local_irq_restore(flags);
>>           return 1;
>> +    }
>> +
>> +    local_irq_restore(flags);
>>   
>>       return 0;
>>   }
> 
> While Andrew has a patch pending (not sure why it didn't go in yet)
> to simplify local_irq_restore(), and while further it shouldn't really
> need using here (local_irq_disable() ought to be fine)

Skimming through the code, the last call of timer_irq_works() in 
check_timer() happens after the interrupts masking state have been restored:

local_irq_restore(flags);

if ( timer_irq_works() )
   ...


So I think timer_irq_works() can be called with interrupts enabled and 
therefore we can't use local_irq_disable().

> I can see that
> you don't want to make such an adjustment here. But then I'd prefer if
> we got away with just a single instance, adjusting the final return
> statement accordingly (easiest would likely be to go from the value of
> "msec").

I was thinking to use 'msec > 0' as a condition to determine if the test 
passed. However, it would consider a failure if it tooks 10ms for the 
test to pass.

I will see if I can rework the loop.

Cheers,

-- 
Julien Grall

