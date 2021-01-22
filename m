Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3222D2FFFBC
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jan 2021 11:06:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72655.130873 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2tKg-0008F2-Fi; Fri, 22 Jan 2021 10:06:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72655.130873; Fri, 22 Jan 2021 10:06:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2tKg-0008Ed-CN; Fri, 22 Jan 2021 10:06:22 +0000
Received: by outflank-mailman (input) for mailman id 72655;
 Fri, 22 Jan 2021 10:06:21 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=83/a=GZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l2tKf-0008EY-L7
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 10:06:21 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 36e33469-176a-4c15-b979-ac107ca9daec;
 Fri, 22 Jan 2021 10:06:18 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id BA346AB9F;
 Fri, 22 Jan 2021 10:06:17 +0000 (UTC)
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
X-Inumbo-ID: 36e33469-176a-4c15-b979-ac107ca9daec
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611309977; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zyxZqEMVYesvwarE9Sw5jNJSxpCR/OJBKRQRTSbvCZs=;
	b=pDLE0DjDfo0Xj3Lm6OvbpM+MItuWaiJ8i1E5czXPqvyzEJT76NXX8HplIrR2sRX85ZaANX
	Q489ERi5ZsxEoeTEL2jkbGzJX4u4ugjoNyyVY5xWfJPAG/NJo9Uu8NZvDBVJ9YQWRthXZq
	SpJ9EaJrleiOgQEw57RmgqXwGHdfI58=
Subject: Re: [PATCH v2 3/4] x86/vpic: issue dpci EOI for cleared pins at ICW1
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210115142820.35224-1-roger.pau@citrix.com>
 <20210115142820.35224-4-roger.pau@citrix.com>
 <2ebcf745-cee2-b90d-9983-42c7297c7f3a@suse.com>
 <20210122095354.c2ft7776poj7dusd@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b47adf3f-0677-8b94-4f4a-0a902620a4fa@suse.com>
Date: Fri, 22 Jan 2021 11:06:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210122095354.c2ft7776poj7dusd@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 22.01.2021 10:53, Roger Pau Monné wrote:
> On Fri, Jan 22, 2021 at 10:02:15AM +0100, Jan Beulich wrote:
>> On 15.01.2021 15:28, Roger Pau Monne wrote:
>>> When pins are cleared from either ISR or IRR as part of the
>>> initialization sequence forward the clearing of those pins to the dpci
>>> EOI handler, as it is equivalent to an EOI. Not doing so can bring the
>>> interrupt controller state out of sync with the dpci handling logic,
>>> that expects a notification when a pin has been EOI'ed.
>>
>> The question though is what this clearing of ISR and some of
>> IRR during ICW1 is based upon: Going through various manuals
>> (up-to-date from Nov 2020, intermediate, and all the way
>> through to an old hard copy from 1993) I can't find a single
>> mention of ICW1 having any effect on ISR or IRR, despite both
>> soft copy ones being detailed about other state getting
>> changed.
>>
>> There is "Following initialization, an interrupt request (IRQ)
>> input must make a low-to-high transition to generate an
>> interrupt", but I'm afraid this can be read to mean different
>> things. And if it was meant to describe an effect on ISR
>> and/or IRR, it would imo be in conflict with us keeping IRR
>> bits of level triggered interrupts.
> 
> I have an old copy of the 8259A spec, and it does mention the same
> quote that you have above. I also wondered while I was adjusting this
> code whether what we do is fine. I have to admit I haven't considered
> changing this logic much because I don't have an effective way to test
> it.
> 
> I've also taken a look at what others do, QEMU for example will do
> exactly the same logic as Xen during ICW1, bhyve OTOH will fully zero
> IRR and leave ISR as is.
> 
> Doing a bit of archaeology in QEMU I've found the following change:
> 
> commit aa24822bdc7c4e74afbc6fa1324b01cf067da7cb
> Author: Jan Kiszka <jan.kiszka@siemens.com>
> Date:   Tue Jan 24 16:29:29 2012 +0100
> 
>     i8259: Do not clear level-triggered lines in IRR on init
> 
>     When an input line is handled as level-triggered, it will immediately
>     raise an IRQ on the output of a PIC again that goes through an init
>     reset. So only clear the edge-triggered inputs from IRR in that
>     scenario.
> 
>     Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
>     Signed-off-by: Anthony Liguori <aliguori@us.ibm.com>
> 
> Which seems to point out there's a reasoning behind what it's
> currently implemented. This seems to be against the spec as there's no
> low-to-high transition?

Would seem so to me, yes. Knowing how hard it was back at the time
to find any doc on the 8259A at all, and knowing that the doc that
initially became available wasn't very complete, I could very well
imagine the present doc still being incomplete. Let me see if I
can get something out of Intel.

>>> @@ -217,6 +219,24 @@ static void vpic_ioport_write(
>>>              }
>>>  
>>>              vpic->init_state = ((val & 3) << 2) | 1;
>>> +            vpic_update_int_output(vpic);
>>> +            vpic_unlock(vpic);
>>> +
>>> +            /*
>>> +             * Forward the EOI of any pending or in service interrupt that has
>>> +             * been cleared from IRR or ISR, or else the dpci logic will get
>>> +             * out of sync with the state of the interrupt controller.
>>> +             */
>>> +            while ( pending )
>>> +            {
>>> +                unsigned int pin = __scanbit(pending, 8);
>>> +
>>> +                ASSERT(pin < 8);
>>> +                hvm_dpci_eoi(current->domain,
>>> +                             hvm_isa_irq_to_gsi((addr >> 7) ? (pin | 8) : pin));
>>> +                __clear_bit(pin, &pending);
>>> +            }
>>> +            goto unmask;
>>
>> A similar consideration applies here (albeit just as an
>> observation, as being orthogonal to your change): A PIC
>> becomes ready for handling interrupts only at the end of the
>> ICWx sequence. Hence it would seem to me that invoking
>> pt_may_unmask_irq()
> 
> Right, it might be best to force unmask = 1 when init_state gets set
> to 0. A spurious call to pt_may_unmask_irq won't be harmful anyway,
> even if no pins have been actually unmasked.

Right, that's what I was considering too. (Really I was
thinking to propagate the "unmasked" value from ICW1
processing to when init_state gets cleared, but you're
right about a stray call to pt_may_unmask_irq() not doing
any harm.)

>> (maybe also vpic_update_int_output()) at
>> ICW1 is premature. To me this seems particularly relevant
>> considering that ICW1 clears IMR, and hence an interrupt
>> becoming pending between ICW1 and ICW2 wouldn't know which
>> vector to use.
>>
>> Or maybe on that side of things, vpic_update_int_output()
>> should really do
>>
>>     if ( vpic->int_output == (!vpic->init_state && irq >= 0) )
>>         return;
>>
>>     /* INT line transition L->H or H->L. */
>>     vpic->int_output = !vpic->init_state && !vpic->int_output;
>>
>> ?
> 
> So to force int_output = false when in init state. Seems reasonable, I
> can implement this either as a pre-patch or a followup, but again I'm
> not sure I have means to properly test it.

That testing consideration goes as well for the correctness
of what we have right now. It functions for the very limited
set of modes typical OSes use, and likely nobody really
knows whether it would also function correctly when used in
"exotic" ways.

As to pre-patch or follow-up: For this latter aspect it
probably doesn't matter much. If any adjustment is made
affecting the code further up, it may want to be a pre-patch
though, as it may change how you want to exit (e.g. I'd
expect the "goto" to possibly go away).

Jan

