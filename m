Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51DBA1FF4AF
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2020 16:27:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlvUZ-0000Zo-2Y; Thu, 18 Jun 2020 14:26:11 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=fT7M=77=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1jlvUX-0000Zj-2C
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2020 14:26:09 +0000
X-Inumbo-ID: a651e484-b16f-11ea-baa3-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a651e484-b16f-11ea-baa3-12813bfff9fa;
 Thu, 18 Jun 2020 14:26:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 67436AC5E;
 Thu, 18 Jun 2020 14:26:06 +0000 (UTC)
Subject: Re: [PATCH for-4.14 3/8] x86/hvm: fix ISA IRQ 0 handling when set as
 lowest priority mode in IO APIC
To: Roger Pau Monne <roger.pau@citrix.com>
References: <20200612155640.4101-1-roger.pau@citrix.com>
 <20200612155640.4101-4-roger.pau@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <ec8e6328-59d6-8f6e-53db-dc6410897c2e@suse.com>
Date: Thu, 18 Jun 2020 16:26:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200612155640.4101-4-roger.pau@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 12.06.2020 17:56, Roger Pau Monne wrote:
> --- a/xen/arch/x86/hvm/vioapic.c
> +++ b/xen/arch/x86/hvm/vioapic.c
> @@ -422,12 +422,13 @@ static void vioapic_deliver(struct hvm_vioapic *vioapic, unsigned int pin)
>      case dest_LowestPrio:
>      {
>  #ifdef IRQ0_SPECIAL_ROUTING
> -        /* Force round-robin to pick VCPU 0 */
> -        if ( (irq == hvm_isa_irq_to_gsi(0)) && pit_channel0_enabled() )
> -        {
> -            v = d->vcpu ? d->vcpu[0] : NULL;
> -            target = v ? vcpu_vlapic(v) : NULL;
> -        }
> +        struct vlapic *lapic0 = vcpu_vlapic(d->vcpu[0]);
> +
> +        /* Force to pick vCPU 0 if part of the destination list */
> +        if ( (irq == hvm_isa_irq_to_gsi(0)) && pit_channel0_enabled() &&
> +             vlapic_match_dest(lapic0, NULL, 0, dest, dest_mode) &&
> +             vlapic_enabled(lapic0) )

The vlapic_enabled() part needs justification in the commit message
(if it is to stay), the more that the other path that patch 2 touched
doesn't have / gain it. I'm unconvinced this is a helpful check here
(or anywhere when it's not current's LAPIC that gets probed), as its
result may be stale right after probing.

Having thought about this (including patch 2) some more, I also wonder
whether, if no destination match was found, the IRQ0_SPECIAL_ROUTING
hack should become to nevertheless deliver to CPU0.

Jan

