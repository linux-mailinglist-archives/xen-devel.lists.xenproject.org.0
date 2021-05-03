Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE5E37174C
	for <lists+xen-devel@lfdr.de>; Mon,  3 May 2021 16:58:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.121675.229488 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lda1T-0005v3-5H; Mon, 03 May 2021 14:58:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 121675.229488; Mon, 03 May 2021 14:58:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lda1T-0005ue-1h; Mon, 03 May 2021 14:58:11 +0000
Received: by outflank-mailman (input) for mailman id 121675;
 Mon, 03 May 2021 14:58:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TA2L=J6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lda1R-0005uZ-KE
 for xen-devel@lists.xenproject.org; Mon, 03 May 2021 14:58:09 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b1f3d413-0433-4dac-8db6-72e2f8fa8ff6;
 Mon, 03 May 2021 14:58:08 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A5366AF0E;
 Mon,  3 May 2021 14:58:07 +0000 (UTC)
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
X-Inumbo-ID: b1f3d413-0433-4dac-8db6-72e2f8fa8ff6
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1620053887; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qgAJdx89/lcuYzZsPoRl0Y9RMMFmqP8xIi4lpsqcidI=;
	b=VlvGFXCw36btspImOnKgGIJJnvHd1omnXJtSHxOVSrCvI0+MxQ9ZqFnf9bwXBjPk8yQ7Do
	7M7iDYs3cUWX+woLZkPwz16p2hT3tohWDV+qd9v8MWWMw5wiFppKrprbFyaQbwQtFntf1B
	WSvzJ79rYyLtpz25DVDi0PaLu8hlGKU=
Subject: Re: [PATCH v4 01/12] x86/rtc: drop code related to strict mode
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210420140723.65321-1-roger.pau@citrix.com>
 <20210420140723.65321-2-roger.pau@citrix.com>
 <f282a2a2-e5cb-6a65-690a-b9c27c03089a@suse.com>
 <YI/CSKpqWrilNKi8@Air-de-Roger>
 <5b06565e-1f2e-3498-c18f-e7eac0042761@suse.com>
 <YJANG3LeuA3Ygt/Q@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d8ed89e8-d13a-9ed6-e92b-fc7072b8382e@suse.com>
Date: Mon, 3 May 2021 16:58:07 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <YJANG3LeuA3Ygt/Q@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 03.05.2021 16:47, Roger Pau Monné wrote:
> On Mon, May 03, 2021 at 02:26:51PM +0200, Jan Beulich wrote:
>> On 03.05.2021 11:28, Roger Pau Monné wrote:
>>> On Thu, Apr 29, 2021 at 04:53:07PM +0200, Jan Beulich wrote:
>>>> On 20.04.2021 16:07, Roger Pau Monne wrote:
>> (I've also not seen the
>> flag named "RTC good" - the ACPI constant is ACPI_WAET_RTC_NO_ACK, for
>> example.)
> 
> I'm reading the WAET spec as published my Microsoft:
> 
> http://msdn.microsoft.com/en-us/windows/hardware/gg487524.aspx
> 
> Where the flag is listed as 'RTC good'. Maybe that's outdated now?
> Seems to be the official source for the specification from
> https://uefi.org/acpi.

Well, I guess the wording wasn't used for the constant's name because
the RTC isn't "bad" otherwise?

>>>>> @@ -337,8 +336,7 @@ int pt_update_irq(struct vcpu *v)
>>>>>      {
>>>>>          if ( pt->pending_intr_nr )
>>>>>          {
>>>>> -            /* RTC code takes care of disabling the timer itself. */
>>>>> -            if ( (pt->irq != RTC_IRQ || !pt->priv) && pt_irq_masked(pt) &&
>>>>> +            if ( pt_irq_masked(pt) &&
>>>>>                   /* Level interrupts should be asserted even if masked. */
>>>>>                   !pt->level )
>>>>>              {
>>>>
>>>> I'm struggling to relate this to any other part of the patch. In
>>>> particular I can't find the case where a periodic timer would be
>>>> registered with RTC_IRQ and a NULL private pointer. The only use
>>>> I can find is with a non-NULL pointer, which would mean the "else"
>>>> path is always taken at present for the RTC case (which you now
>>>> change).
>>>
>>> Right, the else case was always taken because as the comment noted RTC
>>> would take care of disabling itself (by calling destroy_periodic_time
>>> from the callback when using strict_mode). When no_ack mode was
>>> implemented this wasn't taken into account AFAICT, and thus the RTC
>>> was never removed from the list even when masked.
>>>
>>> I think with no_ack mode the RTC shouldn't have this specific handling
>>> in pt_update_irq, as it should behave like any other virtual timer.
>>> I could try to split this as a separate bugfix, but then I would have
>>> to teach pt_update_irq to differentiate between strict_mode and no_ack
>>> mode.
>>
>> A fair part of my confusion was about "&& !pt->priv".
> 
> I think you meant "|| !pt->priv"?

Oops, indeed.

>> I've looked back
>> at 9607327abbd3 ("x86/HVM: properly handle RTC periodic timer even when
>> !RTC_PIE"), where this was added. It was, afaict, to cover for
>> hpet_set_timer() passing NULL with RTC_IRQ.
> 
> That's tricky, as hpet_set_timer hardcodes 8 instead of using RTC_IRQ
> which makes it really easy to miss.
> 
>> Which makes me suspect that
>> be07023be115 ("x86/vhpet: add support for level triggered interrupts")
>> may have subtly broken things.
> 
> Right - as that would have made the RTC irq when generated from the
> HPET no longer be suspended when masked (as pt->priv would no longer
> be NULL). Could be fixed with:
> 
> diff --git a/xen/arch/x86/hvm/hpet.c b/xen/arch/x86/hvm/hpet.c
> index ca94e8b4538..f2cbd12f400 100644
> --- a/xen/arch/x86/hvm/hpet.c
> +++ b/xen/arch/x86/hvm/hpet.c
> @@ -318,7 +318,8 @@ static void hpet_set_timer(HPETState *h, unsigned int tn,
>                           hpet_tick_to_ns(h, diff),
>                           oneshot ? 0 : hpet_tick_to_ns(h, h->hpet.period[tn]),
>                           irq, timer_level(h, tn) ? hpet_timer_fired : NULL,
> -                         (void *)(unsigned long)tn, timer_level(h, tn));
> +                         timer_level(h, tn) ? (void *)(unsigned long)tn : NULL,
> +                         timer_level(h, tn));
>  }
>  
>  static inline uint64_t hpet_fixup_reg(
> 
> Passing again NULL as the callback private data for edge triggered
> interrupts.

Right, plus perhaps at the same time replacing the hardcoded 8.

>>> Would you be fine if the following is added to the commit message
>>> instead:
>>>
>>> "Note that the special handling of the RTC timer done in pt_update_irq
>>> is wrong for the no_ack mode, as the RTC timer callback won't disable
>>> the timer anymore when it detects the guest is not reading REG_C. As
>>> such remove the code as part of the removal of strict_mode, and don't
>>> special case the RTC timer anymore in pt_update_irq."
>>
>> Not sure yet - as per above I'm still not convinced this part of the
>> change is correct.
> 
> I believe part of this handling is kind of bogus - for example I'm
> unsure Xen should account masked interrupt injections as missed ticks.
> A guest might decide to mask it's interrupt source for whatever
> reason, and then it shouldn't receive a flurry of interrupts when
> unmasked. Ie: missed ticks should only be accounted for interrupts
> that should have been delivered but the guest wasn't scheduled. I
> think such model would also simplify some of the logic that we
> currently have.
> 
> In fact I have a patch on top of this current series which I haven't
> posted yet that does implement this new mode of not accounting masked
> interrupts as missed ticks to the delivered later.

This may be problematic: Iirc one of the goals of this mode is to cover
for the case where a guest simply doesn't get around to unmasking the
IRQ until the next one occurs. Yes, it feels bogus, but I'm not sure it
can be done away with. I also can't seem to be able to think of a
heuristic by which the two scenarios could be told apart halfway
reliably.

Jan

