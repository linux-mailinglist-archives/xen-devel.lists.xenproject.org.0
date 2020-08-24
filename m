Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFBEC250337
	for <lists+xen-devel@lfdr.de>; Mon, 24 Aug 2020 18:41:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kAFVt-0003JW-2s; Mon, 24 Aug 2020 16:40:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=61pB=CC=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kAFVr-00034N-5z
 for xen-devel@lists.xenproject.org; Mon, 24 Aug 2020 16:40:03 +0000
X-Inumbo-ID: 1b59e6f5-2ece-42ee-8bb9-28262ba9384d
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 1b59e6f5-2ece-42ee-8bb9-28262ba9384d;
 Mon, 24 Aug 2020 16:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1598287201;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=OTLN75NlUWPuWNxefqTy3oZgzYM60HTegkqGN2Yw6QY=;
 b=iEuaQiO3CPgnhepIJMBugjOuqyTvNw7cc/7DCrjUI8JkIvaNh+S4VHcL
 9KIp8eLWX2jAPpdqScKXrKHNqUpHK8ra7Li1bmhI4gQHogiRfo1t3SU2J
 KjK3PvIAeJZCTt7krv/uYyG67pzpv3oLapJEv+aWrJJhr/17V19HjKZqC 4=;
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: rxKObjcmUH4JpsncydvA67vWFTOxo6lsnEaCwFyAFq+57sdzdqKUUiGK1qAPh0BHf+l+QHvuEK
 wSnMVnuw9GVLl7JTUX0dm16H8ytXYrRP0pn4cPjoevW7eM+/buKe0KXJdHuN04jU1Ekrnr2exZ
 fgc+EdXfBDoge4DkzQD7x68aNtydKcflxog2QFhKtS4245H/LIrsyOcVhAts7vqsdQ9PwWMYoe
 Bp445y1yZUyvsPAp3XfEi3r24xBd23WCR0QuQL7onMhnnfNHW6RedNog7U+HojZAk/bw+TdFUx
 kVo=
X-SBRS: 2.7
X-MesageID: 25182513
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,349,1592884800"; d="scan'208";a="25182513"
Date: Mon, 24 Aug 2020 18:39:52 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
CC: <xen-devel@lists.xenproject.org>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>, Paul Durrant
 <paul@xen.org>
Subject: Re: [PATCH 3/5] x86/vmsi: use the newly introduced EOI callbacks
Message-ID: <20200824163952.GE1587@Air-de-Roger>
References: <20200812124709.4165-1-roger.pau@citrix.com>
 <20200812124709.4165-4-roger.pau@citrix.com>
 <0d3afbb2-a2a8-f570-6f59-fd3c3d56e6dd@suse.com>
 <20200824144440.GD1587@Air-de-Roger>
 <f1913d9a-a0a3-3eef-5427-f10573d5385a@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f1913d9a-a0a3-3eef-5427-f10573d5385a@suse.com>
X-ClientProxiedBy: AMSPEX02CAS02.citrite.net (10.69.22.113) To
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Aug 24, 2020 at 06:07:28PM +0200, Jan Beulich wrote:
> On 24.08.2020 16:44, Roger Pau Monné wrote:
> > On Mon, Aug 24, 2020 at 04:06:31PM +0200, Jan Beulich wrote:
> >> On 12.08.2020 14:47, Roger Pau Monne wrote:
> >>> Remove the unconditional call to hvm_dpci_msi_eoi in vlapic_handle_EOI
> >>> and instead use the newly introduced EOI callback mechanism in order
> >>> to register a callback for MSI vectors injected from passed through
> >>> devices.
> >>
> >> In patch 2 you merely invoke the callback when the EOI arrived,
> >> but you don't clear the callback (unless I've missed something).
> >> Here you register the callback once per triggering of the IRQ,
> >> without clearing it from the callback itself either.
> > 
> > It gets cleared on the next call to vlapic_set_irq_callback, or set to
> > a new callback value if the passed callback is not NULL.
> > 
> >> Why is it
> >> correct / safe to keep the callback registered?
> > 
> > The next vector injected is going to clear it, so should be safe, as
> > no vector can be injected without calling vlapic_set_irq_callback.
> 
> But what about duplicate EOIs, even if just by bug or erratum?
> I notice, for example, that VMX'es VMEXIT handler directly
> calls vlapic_handle_EOI().

Yes, but that's expected and required, because when using VMX LAPIC
virtualization you get an explicit vmexit (EXIT_REASON_EOI_INDUCED) on
EOI of requested vectors by using the EOI exit bitmap
(vmx_update_eoi_exit_bitmap).

> I'd find it more safe if an
> unexpected EOI didn't get any callback invoked.

OK, the callback can be certainly cleared in vlapic_handle_EOI.

> 
> >> What about
> >> conflicting callbacks for shared vectors?
> > 
> > In this callback model for vlapic only the last injected vector
> > callback would get executed. It's my understanding that lapic
> > vectors cannot be safely shared unless there's a higher level
> > interrupt controller (ie: an IO-APIC) that does the sharing.
> 
> As said on a different, but pretty recent thread: I do think
> sharing is possible if devices and drivers meet certain criteria
> (in particular have a way to determine which of the devices
> actually require service). It's just not something one would
> normally do. But iirc such a model was used in good old DOS to
> overcome the 15 IRQs limit (of which quite a few had fixed
> purposes, so for add-in devices there were only very few left).

So my callback model for the vIO-APIC/vPIC is different from the one
used for the vlapic. In that case callers must use a helper to
register/remove a callback for GSIs, and a single GSI can have
multiple callbacks attached.

Such interface works well with the vIO-APIC/vPIC because interrupts
from devices are statically assigned a GSI, and you only need to
register the callback when the device is instantiated.

For vlapic OTOH this would be more complex, as a guest might decide to
change MSI vectors constantly and thus require a non-trivial amount of
registrations/removals of callbacks.

I was assuming that any sane OS wouldn't share a lapic vector for
multiple devices, and that hence we could get away without having to
implement multiple per-vector callback support.

Would you be fine with clearing the callback in vlapic_handle_EOI and
then vlapic_set_irq_callback complaining if it finds there's a
previous callback different than the one provided already set for the
to be injected vector?

Thanks, Roger.

