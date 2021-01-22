Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A252FFEEB
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jan 2021 10:02:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72581.130717 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2sKl-0000gT-M9; Fri, 22 Jan 2021 09:02:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72581.130717; Fri, 22 Jan 2021 09:02:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2sKl-0000g4-Ik; Fri, 22 Jan 2021 09:02:23 +0000
Received: by outflank-mailman (input) for mailman id 72581;
 Fri, 22 Jan 2021 09:02:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=83/a=GZ=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1l2sKk-0000fz-1v
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 09:02:22 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c0a7388f-4e16-4c54-a3c6-9c28c80a56b8;
 Fri, 22 Jan 2021 09:02:20 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E9A2EABD6;
 Fri, 22 Jan 2021 09:02:19 +0000 (UTC)
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
X-Inumbo-ID: c0a7388f-4e16-4c54-a3c6-9c28c80a56b8
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611306140; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5/Oo4DXJaauVQ1+1rUhcUi5RuJE3qTNLG24bBXHE05Q=;
	b=WgmPK+hcxlzMCWMqw3NRS851bdsjkhqdprl45bRRK6nLayGyChM2yyb2u/rnfQRbPZP4p7
	lEGUZCYyT+ZWz+wASIkmktmQNyi6+nruVXHo8Cqobah1frwbKN+iEbmdaPoq9CFl5QFEc4
	/b4VZVF9TW9sWX5B6/46FRPBb0rEKyY=
Subject: Re: [PATCH v2 3/4] x86/vpic: issue dpci EOI for cleared pins at ICW1
To: Roger Pau Monne <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210115142820.35224-1-roger.pau@citrix.com>
 <20210115142820.35224-4-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <2ebcf745-cee2-b90d-9983-42c7297c7f3a@suse.com>
Date: Fri, 22 Jan 2021 10:02:15 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210115142820.35224-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 15.01.2021 15:28, Roger Pau Monne wrote:
> When pins are cleared from either ISR or IRR as part of the
> initialization sequence forward the clearing of those pins to the dpci
> EOI handler, as it is equivalent to an EOI. Not doing so can bring the
> interrupt controller state out of sync with the dpci handling logic,
> that expects a notification when a pin has been EOI'ed.

The question though is what this clearing of ISR and some of
IRR during ICW1 is based upon: Going through various manuals
(up-to-date from Nov 2020, intermediate, and all the way
through to an old hard copy from 1993) I can't find a single
mention of ICW1 having any effect on ISR or IRR, despite both
soft copy ones being detailed about other state getting
changed.

There is "Following initialization, an interrupt request (IRQ)
input must make a low-to-high transition to generate an
interrupt", but I'm afraid this can be read to mean different
things. And if it was meant to describe an effect on ISR
and/or IRR, it would imo be in conflict with us keeping IRR
bits of level triggered interrupts.

> @@ -217,6 +219,24 @@ static void vpic_ioport_write(
>              }
>  
>              vpic->init_state = ((val & 3) << 2) | 1;
> +            vpic_update_int_output(vpic);
> +            vpic_unlock(vpic);
> +
> +            /*
> +             * Forward the EOI of any pending or in service interrupt that has
> +             * been cleared from IRR or ISR, or else the dpci logic will get
> +             * out of sync with the state of the interrupt controller.
> +             */
> +            while ( pending )
> +            {
> +                unsigned int pin = __scanbit(pending, 8);
> +
> +                ASSERT(pin < 8);
> +                hvm_dpci_eoi(current->domain,
> +                             hvm_isa_irq_to_gsi((addr >> 7) ? (pin | 8) : pin));
> +                __clear_bit(pin, &pending);
> +            }
> +            goto unmask;

A similar consideration applies here (albeit just as an
observation, as being orthogonal to your change): A PIC
becomes ready for handling interrupts only at the end of the
ICWx sequence. Hence it would seem to me that invoking
pt_may_unmask_irq() (maybe also vpic_update_int_output()) at
ICW1 is premature. To me this seems particularly relevant
considering that ICW1 clears IMR, and hence an interrupt
becoming pending between ICW1 and ICW2 wouldn't know which
vector to use.

Or maybe on that side of things, vpic_update_int_output()
should really do

    if ( vpic->int_output == (!vpic->init_state && irq >= 0) )
        return;

    /* INT line transition L->H or H->L. */
    vpic->int_output = !vpic->init_state && !vpic->int_output;

?

Jan

