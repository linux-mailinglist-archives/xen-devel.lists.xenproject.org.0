Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 199BC34ACD4
	for <lists+xen-devel@lfdr.de>; Fri, 26 Mar 2021 17:49:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101959.195335 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPpdm-0007Ha-AP; Fri, 26 Mar 2021 16:48:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101959.195335; Fri, 26 Mar 2021 16:48:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPpdm-0007HB-6G; Fri, 26 Mar 2021 16:48:54 +0000
Received: by outflank-mailman (input) for mailman id 101959;
 Fri, 26 Mar 2021 16:48:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=G+eI=IY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lPpdk-0007H6-6F
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 16:48:52 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 231cfd64-918f-418a-bc98-d899df1f28c6;
 Fri, 26 Mar 2021 16:48:51 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6814FADE3;
 Fri, 26 Mar 2021 16:48:50 +0000 (UTC)
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
X-Inumbo-ID: 231cfd64-918f-418a-bc98-d899df1f28c6
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1616777330; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JmlvPn47hJx4TuJ845ZxapNklJNDAeBnURgObrJQFy8=;
	b=mn2miW0zn/HalnLNjeF1YZl3hddRtWJpwOL8ksgtCEtAz8v8N6NHegsEgV+NcRSi0LuG0H
	4KM3yNMdllBemTllV1B3Bcx1DQJgZ334eVxgRjt43TVb0WRiqrXdr+SyiRZCOYDCSx6H5f
	X/9tUigjMyg0FyhNz7zUp9EazudesZQ=
Subject: Re: [PATCH v1.1 2/2] x86/hpet: Don't enable legacy replacement mode
 unconditionally
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Ian Jackson <iwj@xenproject.org>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>,
 =?UTF-8?B?RnLDqWTDqXJpYyBQaWVycmV0?= <frederic.pierret@qubes-os.org>,
 Xen-devel <xen-devel@lists.xenproject.org>
References: <20210325165224.10306-3-andrew.cooper3@citrix.com>
 <20210325172132.14980-1-andrew.cooper3@citrix.com>
 <e7e94820-b71a-4cfa-8c40-614373215362@suse.com>
 <19ed3f8f-1dcd-dfde-ffb3-67da569b15c4@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <36510d2b-a5d0-d5a7-ceb7-c92c7b5e6e2a@suse.com>
Date: Fri, 26 Mar 2021 17:48:49 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <19ed3f8f-1dcd-dfde-ffb3-67da569b15c4@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 26.03.2021 17:32, Andrew Cooper wrote:
> On 26/03/2021 09:51, Jan Beulich wrote:
>> On 25.03.2021 18:21, Andrew Cooper wrote:
>>> @@ -1922,14 +1924,38 @@ static void __init check_timer(void)
>>>             vector, apic1, pin1, apic2, pin2);
>>>  
>>>      if (pin1 != -1) {
>>> +        bool hpet_changed = false;
>>> +
>>>          /*
>>>           * Ok, does IRQ0 through the IOAPIC work?
>>>           */
>>>          unmask_IO_APIC_irq(irq_to_desc(0));
>>> +    retry_ioapic_pin:
>>>          if (timer_irq_works()) {
>>>              local_irq_restore(flags);
>>>              return;
>>>          }
>>> +
>>> +        /*
>>> +         * Intel chipsets from Skylake/ApolloLake onwards can statically clock
>>> +         * gate the 8259 PIT.  This option is enabled by default in slightly
>>> +         * later systems, as turning the PIT off is a prerequisite to entering
>>> +         * the C11 power saving state.
>>> +         *
>>> +         * Xen currently depends on the legacy timer interrupt being active
>>> +         * while IRQ routing is configured.
>>> +         *
>>> +         * If the user hasn't made an explicit option, attempt to reconfigure
>>> +         * the HPET into legacy mode to re-establish the timer interrupt.
>>> +         */
>>> +        if ( opt_hpet_legacy_replacement < 0 &&
>>> +             !hpet_changed && hpet_enable_legacy_replacement_mode() )
>>> +        {
>>> +            printk(XENLOG_ERR "..no 8254 timer found - trying HPET Legacy Replacement Mode\n");
>>> +            hpet_changed = true;
>>> +            goto retry_ioapic_pin;
>>> +        }
>>> +
>>>          clear_IO_APIC_pin(apic1, pin1);
>>>          printk(KERN_ERR "..MP-BIOS bug: 8254 timer not connected to "
>>>                 "IO-APIC\n");
>> As mentioned on irc already, I'm somewhat concerned by doing this change
>> first (and also not undoing it if it didn't work). An AMD Turion based
>> laptop I was using many years ago required one of the other fallbacks to
>> be engaged, and hence I'd expect certain other (old?) systems to be
>> similarly affected. Sadly (for the purposes here) I don't have this
>> laptop anymore, so wouldn't be able to verify whether the above actually
>> breaks there.
> 
> Turion is K8, so very obsolete these days.  If it doesn't have an
> IO-APIC, its even less likely to have an HPET.

It did have an IO-APIC, but required one of the virtual-wire modes to
be enabled iirc.

> Even if it does have an HPET, there isn't anything to suggest that
> legacy replacement mode is broken.

With one firmware flaw there is about as much chance for another one
as there is for HPET to be working, I'd say. Iirc (very vaguely) it
did have a HPET, but no ACPI table entry for it, so we wouldn't have
used it.

> Would you prefer me to undo the change?  Its not easy - we have the boot
> time config stashed, but if it was periodic before, the accumulator is
> broken because we can never read that value back out.

I didn't think the accumulator change would matter. I did think though
not having been in legacy replacement mode before might be better to
also not be in after, if its enabling didn't help anyway.

Jan

