Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5953E3056E5
	for <lists+xen-devel@lfdr.de>; Wed, 27 Jan 2021 10:28:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.75860.136719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4h7m-0004ym-B0; Wed, 27 Jan 2021 09:28:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 75860.136719; Wed, 27 Jan 2021 09:28:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l4h7m-0004yN-7m; Wed, 27 Jan 2021 09:28:30 +0000
Received: by outflank-mailman (input) for mailman id 75860;
 Wed, 27 Jan 2021 09:28:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Shlr=G6=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l4h7l-0004yI-1M
 for xen-devel@lists.xenproject.org; Wed, 27 Jan 2021 09:28:29 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d5750458-b62a-4218-a977-324d255b428b;
 Wed, 27 Jan 2021 09:28:27 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0A1C7AD78;
 Wed, 27 Jan 2021 09:28:27 +0000 (UTC)
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
X-Inumbo-ID: d5750458-b62a-4218-a977-324d255b428b
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611739707; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WQUzc95Ds0j47+zAhEtZgH511zumbdn+h8Fh0Wd21Os=;
	b=JdL1L/ohgD5m6RxxmW7GKHhKCxzDjMXU05Pki+Ojy+05BsBviqEJ8ls/0kZX1JwY+tXlgR
	NSM5Csa4XxVHWYBMhqcN5S/OfZClU4suSFkE8Z3LdDvT6oeO17ptG9W9pTd/M4IR+1VZbN
	9XgEEclGn9590AM8Zj1wE5ZDr+GLBkg=
Subject: Re: [PATCH] x86/timer: Fix boot on Intel systems using ITSSPRC static
 PIT clock gating
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Wei Liu <wl@xen.org>, Aaron Janse <aaron@ajanse.me>,
 Jason Andryuk <jandryuk@gmail.com>, Ondrej Balaz <blami@blami.net>,
 Tamas K Lengyel <tamas@tklengyel.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
 <marmarek@invisiblethingslab.com>, Xen-devel <xen-devel@lists.xenproject.org>
References: <20210107010625.5993-1-andrew.cooper3@citrix.com>
 <6be85030-11aa-4143-b202-48a086bb5595@suse.com>
 <b8cd8e04-bf6f-f22c-74be-788ab1e39932@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <50d6935c-0225-215c-b7c4-ce75fbdb2d0a@suse.com>
Date: Wed, 27 Jan 2021 10:28:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <b8cd8e04-bf6f-f22c-74be-788ab1e39932@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 26.01.2021 18:31, Andrew Cooper wrote:
> On 07/01/2021 13:53, Jan Beulich wrote:
>>> +         !((hpet_cfg = hpet_read32(HPET_CFG)) & HPET_CFG_LEGACY) )
>>> +    {
>>> +        unsigned int c0_cfg, ticks, count;
>>> +
>>> +        /* Stop the main counter. */
>>> +        hpet_write32(hpet_cfg & ~HPET_CFG_ENABLE, HPET_CFG);
>>> +
>>> +        /* Reconfigure channel 0 to be 32bit periodic. */
>>> +        c0_cfg = hpet_read32(HPET_Tn_CFG(0));
>>> +        c0_cfg |= (HPET_TN_ENABLE | HPET_TN_PERIODIC | HPET_TN_SETVAL |
>>> +                   HPET_TN_32BIT);
>>> +        hpet_write32(c0_cfg, HPET_Tn_CFG(0));
>>> +
>>> +        /*
>>> +         * The exact period doesn't have to match a legacy PIT.  All we need
>>> +         * is an interrupt queued up via the IO-APIC to check routing.
>>> +         *
>>> +         * Use HZ as the frequency.
>>> +         */
>>> +        ticks = (SECONDS(1) / HZ) * div_sc(hpet_rate, SECONDS(1), 32)) >> 32;
>>> +
>>> +        count = hpet_read32(HPET_COUNTER);
>>> +
>>> +        /*
>>> +         * HPET_TN_SETVAL above is atrociously documented in the spec.
>>> +         *
>>> +         * Periodic HPET channels have a main comparator register, and cache
>>> +         * the "last write to cmp", as a hidden register.
>>> +         *
>>> +         * The semantics on generating a periodic interrupt is:
>>> +         *   cmp += "last value written to the cmp register"
>>> +         * which will reload a new period.
>>> +         *
>>> +         * Normally, writes to cmp update the main comparator as well as being
>>> +         * cached for the reload value.  However, under these semantics, the
>>> +         * HPET main counter needs resetting to 0 to be able to configure the
>>> +         * period correctly.
>>> +         *
>>> +         * Instead, HPET_TN_SETVAL is a self-clearing control bit which we can
>>> +         * use for periodic timers to mean that the second write to the
>>> +         * comparator updates only the "last written" cache, and not the
>>> +         * absolute comparator value.
>>> +         *
>>> +         * This lets us set a period when the main counter isn't at 0.
>>> +         */
>>> +        hpet_write32(count + ticks, HPET_Tn_CMP(0));
>>> +        hpet_write32(ticks,         HPET_Tn_CMP(0));
>> As you say, documentation is poor here. In fact the wording in the
>> HPET spec talks about updating of the "accumulator" instead;
>> perhaps just an unhelpful use of a different term. (Respective
>> Linux code has a comment indicating this is needed on a specific
>> AMD chipset only.)
> 
> I'm fairly certain that Linux's comment is wrong.  This behaviour is
> described in the HPET spec, which is an Intel spec.

I agree. I nevertheless wanted to mention it because it has been
there all the time, for many years.

>> It would seem more natural to me if things were explained a little
>> differently: Writes to the comparator with SETVAL clear always
>> update the "last written" value, i.e. the increment to be used
>> once the main counter equals the comparator. Writes with SETVAL set
>> update the comparator itself. (Assuming that's how it really is, of
>> course, but that's what I infer from the doc available.)
> 
> By default, all writes update both the accumulator and comparator registers.
> 
> Except for the 2nd write of CMP following a write of SETVAL, where only
> the accumulator is updated, and the comparator retains its old value.

IOW you don't want to change how you describe it. I found it
somewhat confusing (or at least not clear enough) to read this
way, so had to compare and match the comment with the spec to
follow what exactly you mean.

>>> +        /* Restart the main counter, and legacy mode. */
>>> +        hpet_write32(hpet_cfg | HPET_CFG_ENABLE | HPET_CFG_LEGACY, HPET_CFG);
>> This isn't necessarily "restart" - you may start the counter for
>> the first time. Hence in the comment maybe "(Re)start ..."?
> 
> Well - it is strictly a restart because of how the logic is laid out,
> and even if that weren't the case, "restart" is fine to use in this context.

I don't follow you here. If it was strictly a restart, where
is the place where we first started it? Higher up you have

        /* Stop the main counter. */
        hpet_write32(hpet_cfg & ~HPET_CFG_ENABLE, HPET_CFG);

which of course stops the counter only if HPET_CFG_ENABLE
was set at that point. In find it less relevant to point out
this fact in the comment here, than I do in the "restart"
case; in fact I wouldn't have commented at all if the
comment simply was saying "Start ...".

Furthermore, wrt legacy mode I'm even less convinced there's
necessarily any _re_-starting.

>> As to the spurious IRQs, does it perhaps matter at which point
>> CFG_LEGACY gets set? We could try setting it when clearing
>> CFG_ENABLE further up, or we could also try two separate writes
>> each setting just one of the bits. (At least I can't deduce
>> from the spec that we ought to be prepared to observe spurious
>> IRQs here.)
> 
> It will an (extra) electrical load stabilising on the line into the
> PIC.  Repositioning control writes of the HPET won't make a difference.

I didn't think chipsets, where all of the various functionality
is bundled in a single chip, would necessarily use electrical
signals over an actual "line", but instead components would act
on a set of shared registers, using effectively software along
the lines of e.g. our vPIC emulation state machine. But I may
be entirely wrong with this ...

Assuming my implications above are correct that you don't really
want to change any of the commentary, I guess I don't want to
further hold this up, so preferably with the one pair of missing
parentheses added
Acked-by: Jan Beulich <jbeulich@suse.com>

Jan

