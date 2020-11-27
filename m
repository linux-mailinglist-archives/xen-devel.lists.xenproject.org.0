Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1294D2C63C0
	for <lists+xen-devel@lfdr.de>; Fri, 27 Nov 2020 12:19:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.39171.71971 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kiblu-0002kQ-9i; Fri, 27 Nov 2020 11:18:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 39171.71971; Fri, 27 Nov 2020 11:18:38 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kiblu-0002jy-52; Fri, 27 Nov 2020 11:18:38 +0000
Received: by outflank-mailman (input) for mailman id 39171;
 Fri, 27 Nov 2020 11:18:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rmeX=FB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kibls-0002jt-Of
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 11:18:36 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 951e8e8f-b19f-4f49-8b58-9a2e698755cf;
 Fri, 27 Nov 2020 11:18:35 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6E5D3AC2F;
 Fri, 27 Nov 2020 11:18:34 +0000 (UTC)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=rmeX=FB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kibls-0002jt-Of
	for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 11:18:36 +0000
X-Inumbo-ID: 951e8e8f-b19f-4f49-8b58-9a2e698755cf
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 951e8e8f-b19f-4f49-8b58-9a2e698755cf;
	Fri, 27 Nov 2020 11:18:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606475914; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cvoOrWHyB+9oRM6OEMfIKcaLGjMbphGjIujoDFw01jU=;
	b=F74ErVc+dsrYbgWH3PxcRpIbdDvKfc/XgFcorVRdrZK8KJLIBurDZDQOm2OO5s7XIStinP
	2iAPZRZ/H4Z9D+OLyyzyBeRHGDpXfITGyPKHvI6gM1ryrjRG5yaxJ8ELmzXXq29hJAOERs
	S0SzwAwAokdXHflekSkCOu3TSBYxOSg=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 6E5D3AC2F;
	Fri, 27 Nov 2020 11:18:34 +0000 (UTC)
Subject: Re: NetBSD dom0 PVH: hardware interrupts stalls
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Manuel Bouyer <bouyer@antioche.eu.org>
References: <20201124142713.GM2020@antioche.eu.org>
 <e6a0fc84-e7ed-825c-5356-29b8a6359a2b@suse.com>
 <20201124150842.GN2020@antioche.eu.org>
 <20201124154917.l3jwa6w4ejumjuqw@Air-de-Roger>
 <20201124160914.GQ2020@antioche.eu.org>
 <20201126133444.r2oi24i3umh7shb3@Air-de-Roger>
 <20201126141608.GA4123@antioche.eu.org>
 <20201126142635.uzi643co3mxp5h42@Air-de-Roger>
 <20201126150937.jhbfp7iefkmtedx7@Air-de-Roger>
 <20201126172034.GA7642@antioche.eu.org>
 <20201127105948.ji5gxv4e7axrvgpo@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <90b6f981-2494-34c8-c611-37bc16d473b6@suse.com>
Date: Fri, 27 Nov 2020 12:18:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201127105948.ji5gxv4e7axrvgpo@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 27.11.2020 11:59, Roger Pau Monné wrote:
> On Thu, Nov 26, 2020 at 06:20:34PM +0100, Manuel Bouyer wrote:
>> On Thu, Nov 26, 2020 at 04:09:37PM +0100, Roger Pau Monné wrote:
>>>>
>>>> Oh, that's actually very useful. The interrupt is being constantly
>>>> injected from the hardware and received by Xen, it's just not then
>>>> injected into dom0 - that's the bit we are missing. Let me look into
>>>> adding some more debug to that path, hopefully it will tell us where
>>>> things are getting blocked.
>>>
>>> So I have yet one more patch for you to try, this one has more
>>> debugging and a slight change in the emulated IO-APIC behavior.
>>> Depending on the result I might have to find a way to mask the
>>> interrupt so it doesn't spam the whole buffer in order for us to see
>>> exactly what triggered this scenario you are in.
>>
>> OK, here it is:
>> http://www-soc.lip6.fr/~bouyer/xen-log9.txt
>>
>> I had to restart from a clean source tree to apply this patch, so to make
>> sure we're in sync I attached the diff from my sources
> 
> I'm quite confused about why your trace don't even get into
> hvm_do_IRQ_dpci, so I've added some more debug info.

Are you sure it doesn't? I'm somewhat worried we may ...

> --- a/xen/drivers/passthrough/io.c
> +++ b/xen/drivers/passthrough/io.c
> @@ -828,6 +828,9 @@ int hvm_do_IRQ_dpci(struct domain *d, struct pirq *pirq)
>           !pirq_dpci || !(pirq_dpci->flags & HVM_IRQ_DPCI_MAPPED) )
>          return 0;
>  
> +    if ( pirq->pirq == TRACK_IRQ )
> +        debugtrace_printk("hvm_do_IRQ_dpci irq %u\n", pirq->pirq);

... take the early exit path up from here. I still wouldn't be
able to say why that is, because when I looked yesterday I
think I found all failure paths leading to HVM_IRQ_DPCI_MAPPED
remaining clear to have a log message associated, while Manuel
said there were no other log messages.

In the context of this I also started wondering whether it's
the right thing to do to start the EOI timer if the subsequent
call to send_guest_pirq() also doesn't actually send any event.
In this case the guest is effectively guaranteed to not handle
the interrupt. When the interrupt isn't shared, I think we
ought to ->end() it right away, but without unmasking it, to
unblock same or lower priority interrupts. What to do in the
shared case is less obvious to me ...

Jan

