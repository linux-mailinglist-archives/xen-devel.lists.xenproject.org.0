Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D253B1EF3EE
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jun 2020 11:21:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jh8Wu-0002k7-0q; Fri, 05 Jun 2020 09:20:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lb65=7S=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jh8Wr-0002k1-QP
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2020 09:20:45 +0000
X-Inumbo-ID: d49f7b9c-a70d-11ea-af92-12813bfff9fa
Received: from esa1.hc3370-68.iphmx.com (unknown [216.71.145.142])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id d49f7b9c-a70d-11ea-af92-12813bfff9fa;
 Fri, 05 Jun 2020 09:20:43 +0000 (UTC)
Authentication-Results: esa1.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: Y4RzL7ZlZtLJOn65u7lt07CElv8iMPCsqdoRiOwZegPpKjaQQAjeYkp3dOz+df6GnNvtbrq7+d
 uwQCauS7MSRrIcsoXAs7/lku7RTfK7IeByYJ3sCwsuJ0HY2dZKrujactrmMUAlOqAHP6URbJ9D
 +YN0k4iDsT7yPoQ7Rh82jbML4CVp+XdA/3IOZHtim+FGbce0twK6+3CsvWTY4q6iW8/F96ZKbf
 QEoBXQtZ4PGcie4zJPPjjNiyi7ERjiJ3EFW66tLQna9anauLURW94kJDdl2NUxFUFWIQ2oy2oh
 1Yc=
X-SBRS: 2.7
X-MesageID: 19601042
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,475,1583211600"; d="scan'208";a="19601042"
Date: Fri, 5 Jun 2020 11:20:35 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH for-4.14] x86/rtc: provide mediated access to RTC for PVH
 dom0
Message-ID: <20200605092035.GL1195@Air-de-Roger>
References: <20200605075006.51238-1-roger.pau@citrix.com>
 <ac523b3f-cc96-e63e-732c-2aa7ac3eac59@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <ac523b3f-cc96-e63e-732c-2aa7ac3eac59@suse.com>
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
Cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 Wei Liu <wl@xen.org>, paul@xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Jun 05, 2020 at 10:48:48AM +0200, Jan Beulich wrote:
> On 05.06.2020 09:50, Roger Pau Monne wrote:
> > At some point (maybe PVHv1?) mediated access to the RTC was provided
> > for PVH dom0 using the PV code paths (guest_io_{write/read}). At some
> > point this code has been made PV specific and unhooked from the
> > current PVH IO path.
> 
> I don't suppose you've identified the commit which did? This would
> help deciding whether / how far to backport such a change.

I've attempted to, but failed to find the exact commit. I guess it
might have happened at ecaba067e1e433 when guest_io_{read/write} was
moved into emul-priv-op.c and made PV specific, but that's just a hint.

> > This patch provides such mediated access to the
> > RTC for PVH dom0, just like it's provided for a classic PV dom0.
> > 
> > Instead of re-using the PV paths implement such handler together with
> > the vRTC code for HVM, so that calling rtc_init will setup the
> > appropriate handlers for all HVM based guests.
> 
> Hooking this into rtc_init() makes sense as long as it's really
> just the RTC. Looking at the PV code you're cloning from, I
> wonder though whether pv_pit_handler() should also regain callers
> for PVH. As it stands the function is called for PV only, yet was
> deliberately put/kept outside of pv/.

IIRC pv_pit_handler was also used by PVHv1 dom0, but we decided to not
enable it for PVHv2 because no one really knew why the PIT was
actually needed for by dom0.

I think it's in emul-i8524.c (outside of pv/) because it calls into
static functions on that file that are also used by HVM
(handle_pit_io)?

> So along the lines of Paul's reply I think it would be better if
> code was shared between PV and PVH Dom0, perhaps by breaking out
> respective pieces from guest_io_{read,write}().

OK, I can try but it will involve more code churn.

> 
> > Note that such issue doesn't happen on domUs because the ACPI
> > NO_CMOS_RTC flag is set in FADT, which prevents the OS from accessing
> > the RTC.
> 
> Will it? I'm pretty sure Linux may (have?) ignore(d) this flag.

Seems like it's acknowledged now:

https://elixir.bootlin.com/linux/latest/source/arch/x86/kernel/acpi/boot.c#L969

PVHv2 support is fairly recent anyway, and I wouldn't recommend using
anything below Linux 4.19, which also has this implemented.

> > --- a/xen/arch/x86/hvm/rtc.c
> > +++ b/xen/arch/x86/hvm/rtc.c
> > @@ -808,10 +808,79 @@ void rtc_reset(struct domain *d)
> >      s->pt.source = PTSRC_isa;
> >  }
> >  
> > +/* RTC mediator for HVM hardware domain. */
> > +static unsigned int hw_read(unsigned int port)
> > +{
> > +    const struct domain *currd = current->domain;
> > +    unsigned long flags;
> > +    unsigned int data = 0;
> > +
> > +    switch ( port )
> > +    {
> > +    case RTC_PORT(0):
> > +          data = currd->arch.cmos_idx;
> > +          break;
> > +
> > +    case RTC_PORT(1):
> > +          spin_lock_irqsave(&rtc_lock, flags);
> > +          outb(currd->arch.cmos_idx & 0x7f, RTC_PORT(0));
> > +          data = inb(RTC_PORT(1));
> > +          spin_unlock_irqrestore(&rtc_lock, flags);
> 
> Avoiding to clone the original code would also avoid omissions
> like the ioports_access_permitted() calls you've dropped from
> here as well as the write counterpart. This may seem redundant
> as we never deny access right now, but should imo be there in
> case we decide to do (e.g. on NO_CMOS_RTC systems).
> 
> Actually, "never" wasn't quite right I think: Late-hwdom
> creation will revoke access from dom0 and instead grant it to
> the new hwdom. Without the check, dom0 would continue to be
> able to access the RTC.

TBH I'm not sure late-hwdom switching from an initial PVH domain will
work work very well, as we would already have to modify the vmcs/vmcb
io_bitmap in order to convey the changes to the allowed IO port ranges
which we don't do now.

Let me see if I can split the helpers.

Roger.

