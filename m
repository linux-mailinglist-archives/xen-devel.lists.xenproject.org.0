Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A07DE7A20DB
	for <lists+xen-devel@lfdr.de>; Fri, 15 Sep 2023 16:27:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603188.940104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qh9nM-0001tS-AZ; Fri, 15 Sep 2023 14:27:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603188.940104; Fri, 15 Sep 2023 14:27:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qh9nM-0001rc-7f; Fri, 15 Sep 2023 14:27:44 +0000
Received: by outflank-mailman (input) for mailman id 603188;
 Fri, 15 Sep 2023 14:27:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qh9nK-0001rW-NT
 for xen-devel@lists.xenproject.org; Fri, 15 Sep 2023 14:27:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qh9nK-0005aU-6X; Fri, 15 Sep 2023 14:27:42 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qh9nJ-0004Ko-Vt; Fri, 15 Sep 2023 14:27:42 +0000
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
	bh=xnhn3aKc3YlLSDzkYZp/1f1Nzs9om5x/LxHz3ICgYi0=; b=P4HeswXKEWSd0uDBiIskYohPo4
	X+c6B/HN+ZtOarj61OejSW1qZIBd5hcc62RjnwadgXkW8UXqnJH4d7iQJFB2WI25Cxck0PCNb1dXe
	HhweCi7ocKaKCXAw88ZrycKx7OIj1NRh810UFQQnJzWbfCjldLwWSPCW5onlVuOWllhs=;
Message-ID: <1b85b1fc-72b7-4ed7-9236-3d82671ca44e@xen.org>
Date: Fri, 15 Sep 2023 15:27:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] xen/x86: io_apic: Introduce a command line option to
 skip timer check
Content-Language: en-GB
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20230818134441.45586-1-julien@xen.org>
 <20230818134441.45586-2-julien@xen.org>
 <ZQRiL0Mf5_5EC8oj@MacBook-MacBook-Pro-de-Roger.local>
From: Julien Grall <julien@xen.org>
In-Reply-To: <ZQRiL0Mf5_5EC8oj@MacBook-MacBook-Pro-de-Roger.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Roger,

On 15/09/2023 14:54, Roger Pau Monné wrote:
> On Fri, Aug 18, 2023 at 02:44:40PM +0100, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Currently, Xen will spend ~100ms to check if the timer works. If the
>> Admin knows their platform have a working timer, then it would be
>> handy to be able to bypass the check.
> 
> I'm of the opinion that the current code is at least dubious.
> 
> Specifically attempts to test the PIT timer, even when the hypervisor
> might be using a different timer.  At which point it mostly attempts
> to test that the interrupt routing from the PIT (or it's replacement)
> is correct, and that Xen can receive such interrupts.
> 
> We go to great lengths in order to attempt to please this piece of
> code, even when no PIT is available, at which point we switch the HPET
> to legacy replacement mode in order to satisfy the checks.
> 
> I think the current code is not useful, and I would be fine if it was
> just removed.

I am afraid I don't know enough the code to be able to say if it can be 
removed.

I also have no idea how common are such platforms nowadays (I suspect it 
is rather small). Which I why I went with a command line option.

> 
>>
>> Introduce a command line option 'no_timer_check' (the name is
>> matching the Linux parameter) for this purpose.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>> ---
>>   docs/misc/xen-command-line.pandoc |  7 +++++++
>>   xen/arch/x86/io_apic.c            | 11 +++++++++++
>>   2 files changed, 18 insertions(+)
>>
>> diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-line.pandoc
>> index 4872b9098e83..1f9d3106383f 100644
>> --- a/docs/misc/xen-command-line.pandoc
>> +++ b/docs/misc/xen-command-line.pandoc
>> @@ -1896,6 +1896,13 @@ This option is ignored in **pv-shim** mode.
>>   ### nr_irqs (x86)
>>   > `= <integer>`
>>   
>> +### no_timer_works (x86)
> 
> I find the naming confusing, and I would rather avoid negative named
> booleans.
> 
> Maybe it should be `check_pit_intr` and default to enabled for the
> time being?
Jan suggested to use timer-irq-works. Would you be happy with the name?

> 
>> +> `=<boolean>`
>> +
>> +> Default: `true`
> 
> I think the default is wrong here?  AFAICT no_timer_check will default
> to false.

Ah yes. In the downstream version, I went with setting to true by 
default as we don't support any platform with broken timer. I forgot to 
update the patch before sending.

> 
>> +
>> +Disables the code which tests for broken timer IRQ sources.
> 
> Hm, yes, it does check for one specific source, which doesn't need to
> be the currently selected timer.
> 
> "Disables the code which tests interrupt injection from the legacy
> i8259 timer."

I can update the comment.

> 
> Even that is not fully true, as it would resort to testing the HPET
> legacy mode if PIT doesn't work, but one could argue the HPET legacy
> mode is just a replacement for the i8254.
> 
>> +
>>   ### irq-max-guests (x86)
>>   > `= <integer>`
>>   
>> diff --git a/xen/arch/x86/io_apic.c b/xen/arch/x86/io_apic.c
>> index b3afef8933d7..4875bb97003f 100644
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
> 
> I would mention i8254 here, as said this is quite likely not testing
> the currently in use timer.

Sure.

> Note that if you don't want to run the test in timer_irq_works() you
> can possibly avoid the code in preinit_pit(), as there no need to
> setup channel 0 in periodic mode then.

The channel also seems to be used as a fallback method for calibrating 
the APIC (see calibrate_APIC_clock()). AFAICT, the fallback method 
should only be used when the PIT is enabled.

I think it would still be feasible to avoid running the IRQ tests even 
when PIT is used. So it means, we cannot skip preinit_pit().

As a side note, I noticed that preinit_pit() is called during resume. 
But I can't find any use of channel 0 after boot. So maybe the call 
could be removed?

Cheers,

-- 
Julien Grall

