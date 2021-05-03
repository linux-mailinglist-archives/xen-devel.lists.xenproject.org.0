Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A43333718CD
	for <lists+xen-devel@lfdr.de>; Mon,  3 May 2021 17:59:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.121742.229625 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldayh-0003hd-Tg; Mon, 03 May 2021 15:59:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 121742.229625; Mon, 03 May 2021 15:59:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldayh-0003hD-Qe; Mon, 03 May 2021 15:59:23 +0000
Received: by outflank-mailman (input) for mailman id 121742;
 Mon, 03 May 2021 15:59:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TA2L=J6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ldayg-0003h4-6l
 for xen-devel@lists.xenproject.org; Mon, 03 May 2021 15:59:22 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f22c889c-682e-4513-b001-5a76cd2e7cdc;
 Mon, 03 May 2021 15:59:20 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 23295B011;
 Mon,  3 May 2021 15:59:20 +0000 (UTC)
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
X-Inumbo-ID: f22c889c-682e-4513-b001-5a76cd2e7cdc
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1620057560; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3zjsJslUplCDLd2j5GYvhm/B4wkceDi5tiQCLODoQQw=;
	b=RpVqDnKpw/wxx5k4D6kbw3iqh/lvIXGDTRPoBKZL80VxFrWXfjB3MjLix+NSkLGwhMoi09
	5DLNVFT9i3esBKdkdcb/m4JpaTisMHc635bF/t/ddIoyohU84FR9tb0F7GVsfDrvHHWuaL
	2Rn2ptwZawd3eH8k+Z9GdShyoqIjIQc=
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
 <d8ed89e8-d13a-9ed6-e92b-fc7072b8382e@suse.com>
 <YJAWmGCtaTktGRG0@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <abed4575-b1f7-5134-483e-2301447d77e0@suse.com>
Date: Mon, 3 May 2021 17:59:19 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <YJAWmGCtaTktGRG0@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 03.05.2021 17:28, Roger Pau Monné wrote:
> On Mon, May 03, 2021 at 04:58:07PM +0200, Jan Beulich wrote:
>> On 03.05.2021 16:47, Roger Pau Monné wrote:
>>> On Mon, May 03, 2021 at 02:26:51PM +0200, Jan Beulich wrote:
>>>> On 03.05.2021 11:28, Roger Pau Monné wrote:
>>>>> On Thu, Apr 29, 2021 at 04:53:07PM +0200, Jan Beulich wrote:
>>>>>> On 20.04.2021 16:07, Roger Pau Monne wrote:
>>>>>>> @@ -337,8 +336,7 @@ int pt_update_irq(struct vcpu *v)
>>>>>>>      {
>>>>>>>          if ( pt->pending_intr_nr )
>>>>>>>          {
>>>>>>> -            /* RTC code takes care of disabling the timer itself. */
>>>>>>> -            if ( (pt->irq != RTC_IRQ || !pt->priv) && pt_irq_masked(pt) &&
>>>>>>> +            if ( pt_irq_masked(pt) &&
>>>>>>>                   /* Level interrupts should be asserted even if masked. */
>>>>>>>                   !pt->level )
>>>>>>>              {
>>>>>>
>>>>>> I'm struggling to relate this to any other part of the patch. In
>>>>>> particular I can't find the case where a periodic timer would be
>>>>>> registered with RTC_IRQ and a NULL private pointer. The only use
>>>>>> I can find is with a non-NULL pointer, which would mean the "else"
>>>>>> path is always taken at present for the RTC case (which you now
>>>>>> change).
>>>>>
>>>>> Right, the else case was always taken because as the comment noted RTC
>>>>> would take care of disabling itself (by calling destroy_periodic_time
>>>>> from the callback when using strict_mode). When no_ack mode was
>>>>> implemented this wasn't taken into account AFAICT, and thus the RTC
>>>>> was never removed from the list even when masked.
>>>>>
>>>>> I think with no_ack mode the RTC shouldn't have this specific handling
>>>>> in pt_update_irq, as it should behave like any other virtual timer.
>>>>> I could try to split this as a separate bugfix, but then I would have
>>>>> to teach pt_update_irq to differentiate between strict_mode and no_ack
>>>>> mode.
>>>>
>>>> A fair part of my confusion was about "&& !pt->priv".
>>>
>>> I think you meant "|| !pt->priv"?
>>
>> Oops, indeed.
>>
>>>> I've looked back
>>>> at 9607327abbd3 ("x86/HVM: properly handle RTC periodic timer even when
>>>> !RTC_PIE"), where this was added. It was, afaict, to cover for
>>>> hpet_set_timer() passing NULL with RTC_IRQ.
>>>
>>> That's tricky, as hpet_set_timer hardcodes 8 instead of using RTC_IRQ
>>> which makes it really easy to miss.
>>>
>>>> Which makes me suspect that
>>>> be07023be115 ("x86/vhpet: add support for level triggered interrupts")
>>>> may have subtly broken things.
>>>
>>> Right - as that would have made the RTC irq when generated from the
>>> HPET no longer be suspended when masked (as pt->priv would no longer
>>> be NULL). Could be fixed with:
>>>
>>> diff --git a/xen/arch/x86/hvm/hpet.c b/xen/arch/x86/hvm/hpet.c
>>> index ca94e8b4538..f2cbd12f400 100644
>>> --- a/xen/arch/x86/hvm/hpet.c
>>> +++ b/xen/arch/x86/hvm/hpet.c
>>> @@ -318,7 +318,8 @@ static void hpet_set_timer(HPETState *h, unsigned int tn,
>>>                           hpet_tick_to_ns(h, diff),
>>>                           oneshot ? 0 : hpet_tick_to_ns(h, h->hpet.period[tn]),
>>>                           irq, timer_level(h, tn) ? hpet_timer_fired : NULL,
>>> -                         (void *)(unsigned long)tn, timer_level(h, tn));
>>> +                         timer_level(h, tn) ? (void *)(unsigned long)tn : NULL,
>>> +                         timer_level(h, tn));
>>>  }
>>>  
>>>  static inline uint64_t hpet_fixup_reg(
>>>
>>> Passing again NULL as the callback private data for edge triggered
>>> interrupts.
>>
>> Right, plus perhaps at the same time replacing the hardcoded 8.
> 
> Right, but if you agree to take this patch and remove strict_mode then
> the emulated RTC won't disable itself anymore, and hence needs to be
> handled as any other virtual timer?

I'm still trying to become convinced, both of the removal of the mode
in general and the particular part of the change I've been struggling
with.

Jan

