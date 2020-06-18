Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 681821FF5DA
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2020 16:55:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlvwh-0003Yl-Vt; Thu, 18 Jun 2020 14:55:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HRl3=77=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jlvwg-0003Yg-Gz
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2020 14:55:14 +0000
X-Inumbo-ID: b69e75ec-b173-11ea-bb8b-bc764e2007e4
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b69e75ec-b173-11ea-bb8b-bc764e2007e4;
 Thu, 18 Jun 2020 14:55:13 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: gsYsOBanvS8i2IL8WXSDyyvzQ9ABEf3u8LFFqIncaBkGc30Z4ys3EiQh7YkXY/ZIO0csGLjCRk
 IN0sjbdyUkwadk88QzZq1Ql4KasXlmTWRX0JkcyhnuHUBTmg4bXWEYrGBvO+xyhzuXYbL/CMl3
 men/r1AmUH0OqZGCS4i93SK1i2wxvHyIUJswuy/wOZVo4R9W0Kjdb3ZQdMyd9psrrzRnTqWHRw
 L17jIf24CXi3GejgykGi6MJGNPjrqlucIXABafZ/hbOgRSDQQaWAVr5B7E2HQwE/BGxkFEHZFK
 E4o=
X-SBRS: 2.7
X-MesageID: 20681234
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,251,1589256000"; d="scan'208";a="20681234"
Date: Thu, 18 Jun 2020 16:55:06 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH for-4.14 3/8] x86/hvm: fix ISA IRQ 0 handling when set as
 lowest priority mode in IO APIC
Message-ID: <20200618145506.GT735@Air-de-Roger>
References: <20200612155640.4101-1-roger.pau@citrix.com>
 <20200612155640.4101-4-roger.pau@citrix.com>
 <ec8e6328-59d6-8f6e-53db-dc6410897c2e@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <ec8e6328-59d6-8f6e-53db-dc6410897c2e@suse.com>
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 AMSPEX02CL02.citrite.net (10.69.22.126)
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

On Thu, Jun 18, 2020 at 04:26:08PM +0200, Jan Beulich wrote:
> On 12.06.2020 17:56, Roger Pau Monne wrote:
> > --- a/xen/arch/x86/hvm/vioapic.c
> > +++ b/xen/arch/x86/hvm/vioapic.c
> > @@ -422,12 +422,13 @@ static void vioapic_deliver(struct hvm_vioapic *vioapic, unsigned int pin)
> >      case dest_LowestPrio:
> >      {
> >  #ifdef IRQ0_SPECIAL_ROUTING
> > -        /* Force round-robin to pick VCPU 0 */
> > -        if ( (irq == hvm_isa_irq_to_gsi(0)) && pit_channel0_enabled() )
> > -        {
> > -            v = d->vcpu ? d->vcpu[0] : NULL;
> > -            target = v ? vcpu_vlapic(v) : NULL;
> > -        }
> > +        struct vlapic *lapic0 = vcpu_vlapic(d->vcpu[0]);
> > +
> > +        /* Force to pick vCPU 0 if part of the destination list */
> > +        if ( (irq == hvm_isa_irq_to_gsi(0)) && pit_channel0_enabled() &&
> > +             vlapic_match_dest(lapic0, NULL, 0, dest, dest_mode) &&
> > +             vlapic_enabled(lapic0) )
> 
> The vlapic_enabled() part needs justification in the commit message
> (if it is to stay), the more that the other path that patch 2 touched
> doesn't have / gain it. I'm unconvinced this is a helpful check here
> (or anywhere when it's not current's LAPIC that gets probed), as its
> result may be stale right after probing.

This is modeled after what vlapic_lowest_prio does, which includes the
vlapic_enabled check. I assumed this was done to prevent injecting to
disabled lapics if possible.

I agree it's stale by the point it gets acted upon, but anyone playing
with enabling/disabling a lapic part of a destination list shouldn't
expect anything sensible to happen IMO.

> Having thought about this (including patch 2) some more, I also wonder
> whether, if no destination match was found, the IRQ0_SPECIAL_ROUTING
> hack should become to nevertheless deliver to CPU0.

Hm, that wouldn't match what real hardware would do, but would indeed
match what old Xen would do for IRQ 0. TBH I would be more comfortable
with attempting to remove this behaviour, and hence don't inject to
any vCPU if none match the list.

Thanks, Roger.

