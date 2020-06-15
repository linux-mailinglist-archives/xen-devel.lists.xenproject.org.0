Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B641F9584
	for <lists+xen-devel@lfdr.de>; Mon, 15 Jun 2020 13:44:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jknXF-0002ko-F6; Mon, 15 Jun 2020 11:44:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=p+Ae=74=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jknXE-0002kf-FD
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2020 11:44:16 +0000
X-Inumbo-ID: 89484200-aefd-11ea-b7f9-12813bfff9fa
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 89484200-aefd-11ea-b7f9-12813bfff9fa;
 Mon, 15 Jun 2020 11:44:16 +0000 (UTC)
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: +VCt2J+qFnmXbnirkPW43krISHVsBsidrbcUAhuV+z63IMl+vyqY1cjb5X0Odoyvv5FIoGpH++
 Klwuay9ouLxBTBLRHL8CpkQg8ZUa3MkaVzi4G8OAztRXR69xBUZqjdBdtWOhy2mIGkk+Mu1EGR
 ep/VX8l26GoDNFCbocdoIF8ZVs5cwU2JWDJrPKrezRJHwFUbR1r4v7psvt1du9Lu0/MblpBa7R
 iv6m+gmejscEMep/q8V8OHoY4oUDj6zx9msqGQWADrwzEmW3uJ04yw7LSneNlllnIcWmwa4fAe
 9M0=
X-SBRS: 2.7
X-MesageID: 20822063
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,514,1583211600"; d="scan'208";a="20822063"
Date: Mon, 15 Jun 2020 13:44:09 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: <paul@xen.org>
Subject: Re: [PATCH for-4.14 1/8] x86/hvm: fix vIO-APIC build without
 IRQ0_SPECIAL_ROUTING
Message-ID: <20200615114409.GD735@Air-de-Roger>
References: <20200612155640.4101-1-roger.pau@citrix.com>
 <20200612155640.4101-2-roger.pau@citrix.com>
 <002b01d642fb$d2e229b0$78a67d10$@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <002b01d642fb$d2e229b0$78a67d10$@xen.org>
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
Cc: xen-devel@lists.xenproject.org, 'Wei Liu' <wl@xen.org>,
 'Jan Beulich' <jbeulich@suse.com>, 'Andrew Cooper' <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Jun 15, 2020 at 11:00:38AM +0100, Paul Durrant wrote:
> > -----Original Message-----
> > From: Roger Pau Monne <roger.pau@citrix.com>
> > Sent: 12 June 2020 16:57
> > To: xen-devel@lists.xenproject.org
> > Cc: paul@xen.org; Roger Pau Monne <roger.pau@citrix.com>; Jan Beulich <jbeulich@suse.com>; Andrew
> > Cooper <andrew.cooper3@citrix.com>; Wei Liu <wl@xen.org>
> > Subject: [PATCH for-4.14 1/8] x86/hvm: fix vIO-APIC build without IRQ0_SPECIAL_ROUTING
> > 
> > pit_channel0_enabled needs to be guarded with IRQ0_SPECIAL_ROUTING
> > since it's only used when the special handling of ISA IRQ 0 is enabled.
> > 
> > No functional change.
> > 
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> >  xen/arch/x86/hvm/vioapic.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/xen/arch/x86/hvm/vioapic.c b/xen/arch/x86/hvm/vioapic.c
> > index b87facb0e0..bd41036137 100644
> > --- a/xen/arch/x86/hvm/vioapic.c
> > +++ b/xen/arch/x86/hvm/vioapic.c
> > @@ -391,10 +391,12 @@ static void ioapic_inj_irq(
> >      vlapic_set_irq(target, vector, trig_mode);
> >  }
> > 
> > +#ifdef IRQ0_SPECIAL_ROUTING
> >  static inline int pit_channel0_enabled(void)
> >  {
> >      return pt_active(&current->domain->arch.vpit.pt0);
> >  }
> > +#endif
> 
> It's only called in two places. How about just manually inlining?

That would be fine, as I'm also removing one of the callers in a
following patch.

Thanks, Roger.

