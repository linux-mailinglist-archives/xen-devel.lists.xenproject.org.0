Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1182C63E9
	for <lists+xen-devel@lfdr.de>; Fri, 27 Nov 2020 12:30:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.39194.72007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kibwX-00040v-1u; Fri, 27 Nov 2020 11:29:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 39194.72007; Fri, 27 Nov 2020 11:29:37 +0000
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
	id 1kibwW-00040W-Ug; Fri, 27 Nov 2020 11:29:36 +0000
Received: by outflank-mailman (input) for mailman id 39194;
 Fri, 27 Nov 2020 11:29:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rmeX=FB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1kibwV-00040R-Pn
 for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 11:29:35 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1a5075ca-9156-4512-8c52-904a7ea1b812;
 Fri, 27 Nov 2020 11:29:35 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3D4FBABD7;
 Fri, 27 Nov 2020 11:29:34 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=rmeX=FB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
	id 1kibwV-00040R-Pn
	for xen-devel@lists.xenproject.org; Fri, 27 Nov 2020 11:29:35 +0000
X-Inumbo-ID: 1a5075ca-9156-4512-8c52-904a7ea1b812
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 1a5075ca-9156-4512-8c52-904a7ea1b812;
	Fri, 27 Nov 2020 11:29:35 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1606476574; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=goPbyqWpRwaSLpYInMxYycqxofYVEUeukrRN1EBxPwc=;
	b=ipBG18eBzyXJYd40nN1b+NYMn+pfzA4q7EBEiO+OO63590YUV47JQhTzrb+diLhj/kAAMl
	+gyjCCWIpXlRywvmEW5THjHQ1jqXrC4SvXsuPYDDuiQSTPA6WHfQRb7aBI8ztr0OLmcPUb
	0zh7PN4bM/zxBbb4H/huu/m0LJIdRlE=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 3D4FBABD7;
	Fri, 27 Nov 2020 11:29:34 +0000 (UTC)
Subject: Re: NetBSD dom0 PVH: hardware interrupts stalls
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>,
 Manuel Bouyer <bouyer@antioche.eu.org>
Cc: xen-devel@lists.xenproject.org
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
Message-ID: <e9610278-84e5-dc32-b568-8867011de4e4@suse.com>
Date: Fri, 27 Nov 2020 12:29:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201127105948.ji5gxv4e7axrvgpo@Air-de-Roger>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 27.11.2020 11:59, Roger Pau Monné wrote:
> --- a/xen/arch/x86/hvm/irq.c
> +++ b/xen/arch/x86/hvm/irq.c
> @@ -187,6 +187,10 @@ void hvm_gsi_assert(struct domain *d, unsigned int gsi)
>       * to know if the GSI is pending or not.
>       */
>      spin_lock(&d->arch.hvm.irq_lock);
> +    if ( gsi == TRACK_IRQ )
> +        debugtrace_printk("hvm_gsi_assert irq %u trig %u assert count %u\n",
> +                          gsi, trig, hvm_irq->gsi_assert_count[gsi]);

This produces

81961 hvm_gsi_assert irq 34 trig 1 assert count 1

Since the logging occurs ahead of the call to assert_gsi(), it
means we don't signal anything to Dom0, because according to our
records there's still an IRQ in flight. Unfortunately we only
see the tail of the trace, so it's not possible to tell how / when
we got into this state.

Manuel - is this the only patch you have in place? Or did you keep
any prior ones? Iirc there once was one where Roger also suppressed
some de-assert call.

Jan


