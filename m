Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D49034A4EA
	for <lists+xen-devel@lfdr.de>; Fri, 26 Mar 2021 10:52:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.101666.194570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPj7u-0004tC-Ck; Fri, 26 Mar 2021 09:51:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 101666.194570; Fri, 26 Mar 2021 09:51:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lPj7u-0004sn-7s; Fri, 26 Mar 2021 09:51:34 +0000
Received: by outflank-mailman (input) for mailman id 101666;
 Fri, 26 Mar 2021 09:51:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=G+eI=IY=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lPj7s-0004si-Nj
 for xen-devel@lists.xenproject.org; Fri, 26 Mar 2021 09:51:32 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3ea8c81e-d997-46f4-9163-286d09254eee;
 Fri, 26 Mar 2021 09:51:31 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5AB86AB8A;
 Fri, 26 Mar 2021 09:51:30 +0000 (UTC)
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
X-Inumbo-ID: 3ea8c81e-d997-46f4-9163-286d09254eee
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1616752290; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9IvZABonwQA8TGKk4D4h6Qkucq4GlpikUjv4HoZ0AQw=;
	b=BTnkNtgbSmIh83Ze35IxldUhB+KnwN4BdEqyd4fKAkNpgB1onmBab4Gd9EkAC2IjSHOZVC
	mGHEG403plBz/DLEya/8KccurTPBvKzKqa40I40UzKjqMlm8fBWbwzhKbswaYOO7K9/TTK
	vk5VeHGA9wtJkR2MSo0NilICHCIGTo8=
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
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <e7e94820-b71a-4cfa-8c40-614373215362@suse.com>
Date: Fri, 26 Mar 2021 10:51:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210325172132.14980-1-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 25.03.2021 18:21, Andrew Cooper wrote:
> --- a/docs/misc/xen-command-line.pandoc
> +++ b/docs/misc/xen-command-line.pandoc
> @@ -1274,9 +1274,42 @@ supported. See docs/misc/arm/big.LITTLE.txt for more information.
>  When the hmp-unsafe option is disabled (default), CPUs that are not
>  identical to the boot CPU will be parked and not used by Xen.
>  
> +### hpet (x86)
> +    = List of [ <bool> | broadcast=<bool> | legacy-replacement=<bool> ]
> +
> +    Applicability: x86

If this is the more modern form to express this information, then the
(x86) I did put on the sub-title line should imo be dropped.

> +Controls Xen's use of the system's High Precision Event Timer.  By default,
> +Xen will use an HPET when available and not subject to errata.  Use of the
> +HPET can be disabled by specifying `hpet=0`.
> +
> + * The `broadcast` boolean is disabled by default, but forces Xen to keep
> +   using the broadcast for CPUs in deep C-states even when an RTC interrupt is
> +   enabled.  This then also affects raising of the RTC interrupt.
> +
> + * The `legacy-replacement` boolean allows for control over whether Legacy
> +   Replacement mode is enabled.
> +
> +   Legacy Replacement mode is intended for hardware which does not have an
> +   8025 PIT, and allows the HPET to be configured into a compatible mode.

8254 ?

> @@ -1922,14 +1924,38 @@ static void __init check_timer(void)
>             vector, apic1, pin1, apic2, pin2);
>  
>      if (pin1 != -1) {
> +        bool hpet_changed = false;
> +
>          /*
>           * Ok, does IRQ0 through the IOAPIC work?
>           */
>          unmask_IO_APIC_irq(irq_to_desc(0));
> +    retry_ioapic_pin:
>          if (timer_irq_works()) {
>              local_irq_restore(flags);
>              return;
>          }
> +
> +        /*
> +         * Intel chipsets from Skylake/ApolloLake onwards can statically clock
> +         * gate the 8259 PIT.  This option is enabled by default in slightly

8254?

> +         * later systems, as turning the PIT off is a prerequisite to entering
> +         * the C11 power saving state.
> +         *
> +         * Xen currently depends on the legacy timer interrupt being active
> +         * while IRQ routing is configured.
> +         *
> +         * If the user hasn't made an explicit option, attempt to reconfigure

s/option/choice/ or s/made/given/?

> +         * the HPET into legacy mode to re-establish the timer interrupt.
> +         */
> +        if ( opt_hpet_legacy_replacement < 0 &&
> +             !hpet_changed && hpet_enable_legacy_replacement_mode() )
> +        {
> +            printk(XENLOG_ERR "..no 8254 timer found - trying HPET Legacy Replacement Mode\n");
> +            hpet_changed = true;
> +            goto retry_ioapic_pin;
> +        }
> +
>          clear_IO_APIC_pin(apic1, pin1);
>          printk(KERN_ERR "..MP-BIOS bug: 8254 timer not connected to "
>                 "IO-APIC\n");

As mentioned on irc already, I'm somewhat concerned by doing this change
first (and also not undoing it if it didn't work). An AMD Turion based
laptop I was using many years ago required one of the other fallbacks to
be engaged, and hence I'd expect certain other (old?) systems to be
similarly affected. Sadly (for the purposes here) I don't have this
laptop anymore, so wouldn't be able to verify whether the above actually
breaks there.

As a minor remark, I find the "goto" based approach not very nice (we've
been generally saying we consider "goto" okay largely for simplification
of error handling, to avoid having many [partly] redundant function exit
paths), but I can see how using for() or while() or do/while() would
make the code larger and require deeper indentation.

Jan

