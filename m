Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E3A2ED133
	for <lists+xen-devel@lfdr.de>; Thu,  7 Jan 2021 14:53:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62902.111577 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxVj1-0001Kk-Nn; Thu, 07 Jan 2021 13:53:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62902.111577; Thu, 07 Jan 2021 13:53:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxVj1-0001KL-KJ; Thu, 07 Jan 2021 13:53:15 +0000
Received: by outflank-mailman (input) for mailman id 62902;
 Thu, 07 Jan 2021 13:53:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=3gRj=GK=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kxVj0-0001KG-OK
 for xen-devel@lists.xenproject.org; Thu, 07 Jan 2021 13:53:14 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ae64f9f0-cf11-40b7-b794-b04ecae7c3c8;
 Thu, 07 Jan 2021 13:53:13 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 88A9BACAF;
 Thu,  7 Jan 2021 13:53:12 +0000 (UTC)
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
X-Inumbo-ID: ae64f9f0-cf11-40b7-b794-b04ecae7c3c8
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1610027592; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h4ja43Ckh3ZAmrOzQT3YVlQhiwfDgKEu9JSAX1OJGSQ=;
	b=Wlv4LLxAnVbqzOY/mXxp+84vdYvGeJLl9MKYVnsDmhTL7EJ/p4csWDBXHu3hwhsPb8Gj5m
	YmVnIFMvRzvw2xp8bVLbWgP2XoggATcuhe1Wl7f6lHAnTS+mOnw3L5umjDsT3vYH7BSWyQ
	tpWKv57mKDYfvogoscuap4xgID0OQ4w=
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
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <6be85030-11aa-4143-b202-48a086bb5595@suse.com>
Date: Thu, 7 Jan 2021 14:53:11 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210107010625.5993-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 07.01.2021 02:06, Andrew Cooper wrote:
> Slightly RFC.  On older platforms this does generate some spurious PIC
> interrupts during boot, but they're benign.  I was hoping to have time to fix
> those too, but I'm getting an increasing number of requests to post this
> patch.

We still will want to try to suppress those by the release of 4.15,
and ideally even before we backport this one.

> @@ -793,6 +793,71 @@ u64 __init hpet_setup(void)
>      if ( (rem * 2) > hpet_period )
>          hpet_rate++;
>  
> +    /*
> +     * Intel chipsets from Skylake/ApolloLake onwards can statically clock
> +     * gate the 8259 PIT.  This option is enabled by default in slightly later
> +     * systems, as turning the PIT off is a prerequisite to entering the C11
> +     * power saving state.
> +     *
> +     * Xen currently depends on the legacy timer interrupt being active while
> +     * IRQ routing is configured.
> +     *
> +     * Reconfigure the HPET into legacy mode to re-establish the timer
> +     * interrupt.
> +     */
> +    if ( hpet_id & HPET_ID_LEGSUP &&

Add parentheses here?

> +         !((hpet_cfg = hpet_read32(HPET_CFG)) & HPET_CFG_LEGACY) )
> +    {
> +        unsigned int c0_cfg, ticks, count;
> +
> +        /* Stop the main counter. */
> +        hpet_write32(hpet_cfg & ~HPET_CFG_ENABLE, HPET_CFG);
> +
> +        /* Reconfigure channel 0 to be 32bit periodic. */
> +        c0_cfg = hpet_read32(HPET_Tn_CFG(0));
> +        c0_cfg |= (HPET_TN_ENABLE | HPET_TN_PERIODIC | HPET_TN_SETVAL |
> +                   HPET_TN_32BIT);
> +        hpet_write32(c0_cfg, HPET_Tn_CFG(0));
> +
> +        /*
> +         * The exact period doesn't have to match a legacy PIT.  All we need
> +         * is an interrupt queued up via the IO-APIC to check routing.
> +         *
> +         * Use HZ as the frequency.
> +         */
> +        ticks = (SECONDS(1) / HZ) * div_sc(hpet_rate, SECONDS(1), 32)) >> 32;
> +
> +        count = hpet_read32(HPET_COUNTER);
> +
> +        /*
> +         * HPET_TN_SETVAL above is atrociously documented in the spec.
> +         *
> +         * Periodic HPET channels have a main comparator register, and cache
> +         * the "last write to cmp", as a hidden register.
> +         *
> +         * The semantics on generating a periodic interrupt is:
> +         *   cmp += "last value written to the cmp register"
> +         * which will reload a new period.
> +         *
> +         * Normally, writes to cmp update the main comparator as well as being
> +         * cached for the reload value.  However, under these semantics, the
> +         * HPET main counter needs resetting to 0 to be able to configure the
> +         * period correctly.
> +         *
> +         * Instead, HPET_TN_SETVAL is a self-clearing control bit which we can
> +         * use for periodic timers to mean that the second write to the
> +         * comparator updates only the "last written" cache, and not the
> +         * absolute comparator value.
> +         *
> +         * This lets us set a period when the main counter isn't at 0.
> +         */
> +        hpet_write32(count + ticks, HPET_Tn_CMP(0));
> +        hpet_write32(ticks,         HPET_Tn_CMP(0));

As you say, documentation is poor here. In fact the wording in the
HPET spec talks about updating of the "accumulator" instead;
perhaps just an unhelpful use of a different term. (Respective
Linux code has a comment indicating this is needed on a specific
AMD chipset only.)

It would seem more natural to me if things were explained a little
differently: Writes to the comparator with SETVAL clear always
update the "last written" value, i.e. the increment to be used
once the main counter equals the comparator. Writes with SETVAL set
update the comparator itself. (Assuming that's how it really is, of
course, but that's what I infer from the doc available.)

Linux additionally puts udelay(1) between the two writes. Do you
think we're fine without such, on all platforms?

> +        /* Restart the main counter, and legacy mode. */
> +        hpet_write32(hpet_cfg | HPET_CFG_ENABLE | HPET_CFG_LEGACY, HPET_CFG);

This isn't necessarily "restart" - you may start the counter for
the first time. Hence in the comment maybe "(Re)start ..."?

As to the spurious IRQs, does it perhaps matter at which point
CFG_LEGACY gets set? We could try setting it when clearing
CFG_ENABLE further up, or we could also try two separate writes
each setting just one of the bits. (At least I can't deduce
from the spec that we ought to be prepared to observe spurious
IRQs here.)

Jan

