Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 165AE1F1816
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 13:46:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiGE8-0003Ru-V5; Mon, 08 Jun 2020 11:46:04 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QWP5=7V=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jiGE7-0003Rp-53
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 11:46:03 +0000
X-Inumbo-ID: a0610478-a97d-11ea-96fb-bc764e2007e4
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a0610478-a97d-11ea-96fb-bc764e2007e4;
 Mon, 08 Jun 2020 11:46:01 +0000 (UTC)
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: SlCQF7zaoajRaZFx5izKWPMrCbcod7XzR2/jdNmFHN6Y0YYkWphxMDVFA6IbwcLGi7aVvakZZg
 PRrnNmiJMwHF9c0tA/lA3+jRpF3lU23JWL4lvhHlrfy74/i6gdzFO69Z8kYqMupjWhtntmJe35
 OThdpy3+dJ46veB40dM65krPcNxfEmxXatKhg8cNir7pmxrgCMF2wQaKe7kV5QfZELaWMjv+87
 Uw+bJ/2qpqAguesfvaVYQW6VpCEJgzG0sgWDkR3G9k9wbXHP9/DTuryeUvnpYrvW/hfTYi8nUS
 1Zk=
X-SBRS: 2.7
X-MesageID: 19814205
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,487,1583211600"; d="scan'208";a="19814205"
Date: Mon, 8 Jun 2020 13:45:52 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: <paul@xen.org>
Subject: Re: [PATCH for-4.14 v3] x86/rtc: provide mediated access to RTC for
 PVH dom0
Message-ID: <20200608114552.GA722@Air-de-Roger>
References: <20200608102948.7327-1-roger.pau@citrix.com>
 <002c01d63d85$ba36da30$2ea48e90$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <002c01d63d85$ba36da30$2ea48e90$@xen.org>
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
Cc: xen-devel@lists.xenproject.org, 'Wei Liu' <wl@xen.org>,
 'Jan Beulich' <jbeulich@suse.com>, 'Andrew Cooper' <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Jun 08, 2020 at 12:12:40PM +0100, Paul Durrant wrote:
> > -----Original Message-----
> > From: Roger Pau Monne <roger.pau@citrix.com>
> > Sent: 08 June 2020 11:30
> > To: xen-devel@lists.xenproject.org
> > Cc: paul@xen.org; Roger Pau Monne <roger.pau@citrix.com>; Jan Beulich <jbeulich@suse.com>; Andrew
> > Cooper <andrew.cooper3@citrix.com>; Wei Liu <wl@xen.org>
> > Subject: [PATCH for-4.14 v3] x86/rtc: provide mediated access to RTC for PVH dom0
> > 
> > Mediated access to the RTC was provided for PVHv1 dom0 using the PV
> > code paths (guest_io_{write/read}), but those accesses where never
> > implemented for PVHv2 dom0. This patch provides such mediated accesses
> > to the RTC for PVH dom0, just like it's provided for a classic PV
> > dom0.
> > 
> > Pull out some of the RTC logic from guest_io_{read/write} into
> > specific helpers that can be used by both PV and HVM guests. The
> > setup of the handlers for PVH is done in rtc_init, which is already
> > used to initialize the fully emulated RTC.
> > 
> > Without this a Linux PVH dom0 will read garbage when trying to access
> > the RTC, and one vCPU will be constantly looping in
> > rtc_timer_do_work.
> > 
> > Note that such issue doesn't happen on domUs because the ACPI
> > NO_CMOS_RTC flag is set in FADT, which prevents the OS from accessing
> > the RTC. Also the X86_EMU_RTC flag is not set for PVH dom0, as the
> > accesses are not emulated but rather forwarded to the physical
> > hardware.
> > 
> > No functional change expected for classic PV dom0.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > for-4.14 reasoning: the fix is mostly isolated to PVH dom0, and as
> > such the risk is very low of causing issues to other guests types, but
> > without this fix one vCPU when using a Linux dom0 will be constantly
> > looping over rtc_timer_do_work with 100% CPU usage, at least when
> > using Linux 4.19 or newer.
> > ---
> > Changes since v2:
> >  - Move the access check into the read/write handler.
> >  - Allow access to the latched first RTC port by all PV guests.
> >  - Register the handlers for HVM native accesses if vRTC is disabled.
> > 
> > Changes since v1:
> >  - Share the code with PV.
> >  - Add access checks to the IO ports.
> > ---
> >  xen/arch/x86/hvm/rtc.c            | 26 +++++++++++++
> >  xen/arch/x86/pv/emul-priv-op.c    | 30 ++-------------
> >  xen/arch/x86/time.c               | 62 +++++++++++++++++++++++++++++++
> >  xen/include/asm-x86/mc146818rtc.h |  3 ++
> >  4 files changed, 95 insertions(+), 26 deletions(-)
> > 
> > diff --git a/xen/arch/x86/hvm/rtc.c b/xen/arch/x86/hvm/rtc.c
> > index 5bbbdc0e0f..3150f5f147 100644
> > --- a/xen/arch/x86/hvm/rtc.c
> > +++ b/xen/arch/x86/hvm/rtc.c
> > @@ -808,12 +808,38 @@ void rtc_reset(struct domain *d)
> >      s->pt.source = PTSRC_isa;
> >  }
> > 
> > +/* RTC mediator for HVM hardware domain. */
> > +static int hw_rtc_io(int dir, unsigned int port, unsigned int size,
> > +                     uint32_t *val)
> > +{
> > +    if ( dir == IOREQ_READ )
> > +        *val = ~0;
> > +
> > +    if ( size != 1 )
> > +    {
> > +        gdprintk(XENLOG_WARNING, "bad RTC access size (%u)\n", size);
> > +        return X86EMUL_OKAY;
> > +    }
> > +
> > +    if ( dir == IOREQ_WRITE )
> > +        rtc_guest_write(port, *val);
> > +    else
> > +        *val = rtc_guest_read(port);
> > +
> > +    return X86EMUL_OKAY;
> > +}
> > +
> >  void rtc_init(struct domain *d)
> >  {
> >      RTCState *s = domain_vrtc(d);
> > 
> >      if ( !has_vrtc(d) )
> > +    {
> > +        if ( is_hardware_domain(d) )
> > +            /* Hardware domain gets mediated access to the physical RTC. */
> > +            register_portio_handler(d, RTC_PORT(0), 2, hw_rtc_io);
> >          return;
> > +    }
> > 
> >      spin_lock_init(&s->lock);
> > 
> > diff --git a/xen/arch/x86/pv/emul-priv-op.c b/xen/arch/x86/pv/emul-priv-op.c
> > index fad6c754ad..2cedaab6b9 100644
> > --- a/xen/arch/x86/pv/emul-priv-op.c
> > +++ b/xen/arch/x86/pv/emul-priv-op.c
> > @@ -280,19 +280,9 @@ static uint32_t guest_io_read(unsigned int port, unsigned int bytes,
> >          {
> >              sub_data = pv_pit_handler(port, 0, 0);
> >          }
> > -        else if ( port == RTC_PORT(0) )
> > +        else if ( (port == RTC_PORT(0) || port == RTC_PORT(1)) )
> >          {
> > -            sub_data = currd->arch.cmos_idx;
> > -        }
> > -        else if ( (port == RTC_PORT(1)) &&
> > -                  ioports_access_permitted(currd, RTC_PORT(0), RTC_PORT(1)) )
> > -        {
> > -            unsigned long flags;
> > -
> > -            spin_lock_irqsave(&rtc_lock, flags);
> > -            outb(currd->arch.cmos_idx & 0x7f, RTC_PORT(0));
> > -            sub_data = inb(RTC_PORT(1));
> > -            spin_unlock_irqrestore(&rtc_lock, flags);
> > +            sub_data = rtc_guest_read(port);
> >          }
> >          else if ( (port == 0xcf8) && (bytes == 4) )
> >          {
> > @@ -413,21 +403,9 @@ static void guest_io_write(unsigned int port, unsigned int bytes,
> >          {
> >              pv_pit_handler(port, (uint8_t)data, 1);
> >          }
> > -        else if ( port == RTC_PORT(0) )
> > -        {
> > -            currd->arch.cmos_idx = data;
> > -        }
> > -        else if ( (port == RTC_PORT(1)) &&
> > -                  ioports_access_permitted(currd, RTC_PORT(0), RTC_PORT(1)) )
> > +        else if ( (port == RTC_PORT(0) || port == RTC_PORT(1)) )
> >          {
> > -            unsigned long flags;
> > -
> > -            if ( pv_rtc_handler )
> > -                pv_rtc_handler(currd->arch.cmos_idx & 0x7f, data);
> > -            spin_lock_irqsave(&rtc_lock, flags);
> > -            outb(currd->arch.cmos_idx & 0x7f, RTC_PORT(0));
> > -            outb(data, RTC_PORT(1));
> > -            spin_unlock_irqrestore(&rtc_lock, flags);
> > +            rtc_guest_write(port, data);
> >          }
> >          else if ( (port == 0xcf8) && (bytes == 4) )
> >          {
> > diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
> > index bbaea3aa65..9863108f41 100644
> > --- a/xen/arch/x86/time.c
> > +++ b/xen/arch/x86/time.c
> > @@ -27,6 +27,7 @@
> >  #include <xen/keyhandler.h>
> >  #include <xen/guest_access.h>
> >  #include <asm/io.h>
> > +#include <asm/iocap.h>
> >  #include <asm/msr.h>
> >  #include <asm/mpspec.h>
> >  #include <asm/processor.h>
> > @@ -1110,6 +1111,67 @@ static unsigned long get_cmos_time(void)
> >      return mktime(rtc.year, rtc.mon, rtc.day, rtc.hour, rtc.min, rtc.sec);
> >  }
> > 
> > +/* Helpers for guest accesses to the physical RTC. */
> > +unsigned int rtc_guest_read(unsigned int port)
> > +{
> > +    const struct domain *currd = current->domain;
> > +    unsigned long flags;
> > +    unsigned int data = ~0;
> > +
> > +    switch ( port )
> > +    {
> > +    case RTC_PORT(0):
> > +        /*
> > +         * All PV domains are allowed to read the latched value of the first
> > +         * RTC port. This is useful in order to store data when debugging.
> > +         */
> 
> Is this comment correct. AFAICT your call to register_portio_handler() would allow a PVH dom0 to access this too.

Oh, maybe this is not clear enough. Yes, PV/PVH dom0 will get access
to both ports, but a PV domU will also get read/write access to the
latched value in the first RTC port, even when it doesn't have access
to the second RTC port. Note that PVH domU however don't get access to
such latched value at all.

This was requested by Jan in order to keep the previous behavior,
that allows a domU to access the latched RTC_PORT(0) value which is
helpful for debugging purposes.

> > +        data = currd->arch.cmos_idx;
> > +        break;
> > +
> > +    case RTC_PORT(1):
> > +        if ( !ioports_access_permitted(currd, RTC_PORT(0), RTC_PORT(1)) )
> 
> Why RTC_PORT(0) (and not RC_PORT(1)) as base here?

Guest accesses to RTC_PORT(0) don't really translate into Xen
accessing the RTC_PORT(0), they just latch the guest value in
d->arch.cmos_idx.

OTOH Accesses to RTC_PORT(1) do translate into accesses to the
physical ports RTC_PORT(0) and RTC_PORT(1), so hence the check
performed here. Just checking for RTC_PORT(1) won't be fully correct,
because the code accesses both RTC_PORT(0) and RTC_PORT(1). In
practice I don't expect a domain to be given access just to
RTC_PORT(1).

Roger.

