Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3427937153A
	for <lists+xen-devel@lfdr.de>; Mon,  3 May 2021 14:27:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.121559.229247 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldXf6-00085K-CD; Mon, 03 May 2021 12:26:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 121559.229247; Mon, 03 May 2021 12:26:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ldXf6-00084v-8f; Mon, 03 May 2021 12:26:56 +0000
Received: by outflank-mailman (input) for mailman id 121559;
 Mon, 03 May 2021 12:26:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TA2L=J6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1ldXf4-00084q-SW
 for xen-devel@lists.xenproject.org; Mon, 03 May 2021 12:26:54 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 458c1e55-d696-468b-ba1e-5b8563e00a19;
 Mon, 03 May 2021 12:26:53 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CFE86AD22;
 Mon,  3 May 2021 12:26:52 +0000 (UTC)
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
X-Inumbo-ID: 458c1e55-d696-468b-ba1e-5b8563e00a19
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1620044812; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jTTC7MOxUAEw3uWRU8ucnwrk9K5jqZFX/s22+9DkceY=;
	b=QhgEdmy+Pxolp72h/ebZutqlj0nBw2YcawA+B3/ds+RPWBErkyHpS01q4uxD+UQdZXsWHu
	SPmzrtfkhgQ5eGY0sVb0DifcJXhPLDH+v2EmRAzUt/T8O1CEIve5lxUtbx80g/tLEeaURq
	SwhYb0FYPHV3j30bqs+ye6CZyet2er8=
Subject: Re: [PATCH v4 01/12] x86/rtc: drop code related to strict mode
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210420140723.65321-1-roger.pau@citrix.com>
 <20210420140723.65321-2-roger.pau@citrix.com>
 <f282a2a2-e5cb-6a65-690a-b9c27c03089a@suse.com>
 <YI/CSKpqWrilNKi8@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5b06565e-1f2e-3498-c18f-e7eac0042761@suse.com>
Date: Mon, 3 May 2021 14:26:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <YI/CSKpqWrilNKi8@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 03.05.2021 11:28, Roger Pau Monné wrote:
> On Thu, Apr 29, 2021 at 04:53:07PM +0200, Jan Beulich wrote:
>> On 20.04.2021 16:07, Roger Pau Monne wrote:
>>> --- a/xen/arch/x86/hvm/rtc.c
>>> +++ b/xen/arch/x86/hvm/rtc.c
>>> @@ -46,15 +46,6 @@
>>>  #define epoch_year     1900
>>>  #define get_year(x)    (x + epoch_year)
>>>  
>>> -enum rtc_mode {
>>> -   rtc_mode_no_ack,
>>> -   rtc_mode_strict
>>> -};
>>> -
>>> -/* This must be in sync with how hvmloader sets the ACPI WAET flags. */
>>> -#define mode_is(d, m) ((void)(d), rtc_mode_##m == rtc_mode_no_ack)
>>> -#define rtc_mode_is(s, m) mode_is(vrtc_domain(s), m)
>>
>> Leaving aside my concerns about this removal, I think some form of
>> reference to hvmloader and its respective behavior should remain
>> here, presumably in form of a (replacement) comment.
> 
> What about adding a comment in rtc_pf_callback:
> 
> /*
>  * The current RTC implementation will inject an interrupt regardless
>  * of whether REG_C has been read since the last interrupt was
>  * injected. This is why the ACPI WAET 'RTC good' flag must be
>  * unconditionally set by hvmloader.
>  */

For one I'm unconvinced this is "must"; I think it is "may". We're
producing excess interrupts for an unaware guest, aiui. Presumably most
guests can tolerate this, but - second - it may be unnecessary overhead.
Which in turn may be why nobody has complained so far, as this sort of
overhead my be hard to notice. I also suspect the RTC may not be used
very often for generating a periodic interrupt. (I've also not seen the
flag named "RTC good" - the ACPI constant is ACPI_WAET_RTC_NO_ACK, for
example.)

>>> @@ -337,8 +336,7 @@ int pt_update_irq(struct vcpu *v)
>>>      {
>>>          if ( pt->pending_intr_nr )
>>>          {
>>> -            /* RTC code takes care of disabling the timer itself. */
>>> -            if ( (pt->irq != RTC_IRQ || !pt->priv) && pt_irq_masked(pt) &&
>>> +            if ( pt_irq_masked(pt) &&
>>>                   /* Level interrupts should be asserted even if masked. */
>>>                   !pt->level )
>>>              {
>>
>> I'm struggling to relate this to any other part of the patch. In
>> particular I can't find the case where a periodic timer would be
>> registered with RTC_IRQ and a NULL private pointer. The only use
>> I can find is with a non-NULL pointer, which would mean the "else"
>> path is always taken at present for the RTC case (which you now
>> change).
> 
> Right, the else case was always taken because as the comment noted RTC
> would take care of disabling itself (by calling destroy_periodic_time
> from the callback when using strict_mode). When no_ack mode was
> implemented this wasn't taken into account AFAICT, and thus the RTC
> was never removed from the list even when masked.
> 
> I think with no_ack mode the RTC shouldn't have this specific handling
> in pt_update_irq, as it should behave like any other virtual timer.
> I could try to split this as a separate bugfix, but then I would have
> to teach pt_update_irq to differentiate between strict_mode and no_ack
> mode.

A fair part of my confusion was about "&& !pt->priv". I've looked back
at 9607327abbd3 ("x86/HVM: properly handle RTC periodic timer even when
!RTC_PIE"), where this was added. It was, afaict, to cover for
hpet_set_timer() passing NULL with RTC_IRQ. Which makes me suspect that
be07023be115 ("x86/vhpet: add support for level triggered interrupts")
may have subtly broken things.

> Would you be fine if the following is added to the commit message
> instead:
> 
> "Note that the special handling of the RTC timer done in pt_update_irq
> is wrong for the no_ack mode, as the RTC timer callback won't disable
> the timer anymore when it detects the guest is not reading REG_C. As
> such remove the code as part of the removal of strict_mode, and don't
> special case the RTC timer anymore in pt_update_irq."

Not sure yet - as per above I'm still not convinced this part of the
change is correct.

Jan

