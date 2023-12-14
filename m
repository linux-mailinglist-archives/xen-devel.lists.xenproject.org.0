Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B0E812C9F
	for <lists+xen-devel@lfdr.de>; Thu, 14 Dec 2023 11:15:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.654397.1021274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDijp-0005dt-J4; Thu, 14 Dec 2023 10:14:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 654397.1021274; Thu, 14 Dec 2023 10:14:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rDijp-0005bf-GP; Thu, 14 Dec 2023 10:14:41 +0000
Received: by outflank-mailman (input) for mailman id 654397;
 Thu, 14 Dec 2023 10:14:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rDijn-0005bZ-OW
 for xen-devel@lists.xenproject.org; Thu, 14 Dec 2023 10:14:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rDijk-0007uu-TQ; Thu, 14 Dec 2023 10:14:36 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rDijk-0004Mk-O8; Thu, 14 Dec 2023 10:14:36 +0000
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
	bh=vCkJKxxnc56SMIBx7j5k/fHoO7EYyhNLBp9OTVpvOyU=; b=S7vyrY9ntIdQsbjn5v7rmiyAHm
	XamEpBMA+2njaNP3YQWkblbMgJaKPF/iceiQ0xqbHhTF/BcBZ7tZTpT8WXk83JaNt0ABLbZVye2hq
	Jwmb/KaVHyX/a/AmcGqRglSBZ1iHFgLQ2Pa4GAxlCpGSpeJ7GL2/g9Pgh7Uy7cvIBFV0=;
Message-ID: <8b8a62a0-f854-405e-b256-5eee4bfdcb6c@xen.org>
Date: Thu, 14 Dec 2023 10:14:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] xen/x86: io_apic: Introduce a command line option
 to skip timer check
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 xen-devel@lists.xenproject.org
References: <20231211122322.15815-1-julien@xen.org>
 <20231211122322.15815-2-julien@xen.org>
 <b17bb7d1-1206-4ad1-96b1-7b903a740c83@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <b17bb7d1-1206-4ad1-96b1-7b903a740c83@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 14/12/2023 10:10, Jan Beulich wrote:
> On 11.12.2023 13:23, Julien Grall wrote:
>> --- a/docs/misc/xen-command-line.pandoc
>> +++ b/docs/misc/xen-command-line.pandoc
>> @@ -2535,6 +2535,17 @@ pages) must also be specified via the tbuf_size parameter.
>>   ### tickle_one_idle_cpu
>>   > `= <boolean>`
>>   
>> +### pit-irq-works (x86)
>> +> `=<boolean>`
>> +
>> +> Default: `false`
>> +
>> +Disables the code which tests for broken timer IRQ sources. Enabling
>> +this option will reduce boot time on HW where the timer works properly.
>> +
>> +If the system is unstable when enabling the option, then it means you
>> +may have a broken HW and therefore the testing cannot be be skipped.
>> +
>>   ### timer_slop
>>   > `= <integer>`
> 
> With the rename this now needs to move up to retain sorting.

Ok.

> 
>> --- a/xen/arch/x86/io_apic.c
>> +++ b/xen/arch/x86/io_apic.c
>> @@ -57,6 +57,14 @@ bool __initdata ioapic_ack_forced;
>>   int __read_mostly nr_ioapic_entries[MAX_IO_APICS];
>>   int __read_mostly nr_ioapics;
>>   
>> +/*
>> + * The logic to check if the timer is working is expensive. So allow
>> + * the admin to bypass it if they know their platform doesn't have
>> + * a buggy timer.
>> + */
>> +static bool __initdata pit_irq_works;
>> +boolean_param("pit-irq-works", pit_irq_works);
>> +
>>   /*
>>    * Rough estimation of how many shared IRQs there are, can
>>    * be changed anytime.
>> @@ -1502,6 +1510,9 @@ static int __init timer_irq_works(void)
>>   {
>>       unsigned long t1, flags;
>>   
>> +    if ( pit_irq_works )
>> +        return 1;
> 
> When the check is placed here, what exactly use of the option means is
> system dependent. I consider this somewhat risky, so I'd prefer if the
> check was put on the "normal" path in check_timer(). That way it'll
> affect only the one case which we can generally consider "known good",
> but not the cases where the virtual wire setups are being probed. I.e.

I am not against restricting when we allow skipping the timer check. But 
in that case, I wonder why Linux is doing it differently?

After all, this code is heavily borrowed from Linux. So shouldn't we 
follow what they are doing?

Cheers,

-- 
Julien Grall

