Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA951F14BC
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 10:52:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiDV8-0004mp-Fe; Mon, 08 Jun 2020 08:51:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QWP5=7V=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jiDV6-0004mk-Jj
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 08:51:24 +0000
X-Inumbo-ID: 39420d54-a965-11ea-9b55-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 39420d54-a965-11ea-9b55-bc764e2007e4;
 Mon, 08 Jun 2020 08:51:21 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: WkzJplbcHVLuGXCyzD+krEYJAgBiqjevj8lTqBRu6DKpR+wObQr3i/rNtwTi8CJuDtdA0yfGdI
 SSFxwAVgoXXLMZsuYtoeRaoPwdknN3oVpFNTJTEQaodLlD+SxGt2sbqrAgOHD7RPtg7cbpzmt2
 IBDABhFCRMW6SdJyUGMhPHXh93jkAU6qrE8vEruZoBHwWAYy1vTyd+J+P8BYKJtp34ybQnoVyF
 x2l+wAPiPYrFCYpJp8ZK8MMoJRzU2sjt42TvWbdD2Imdgp33qlB1vKoExhoEOj3EdVjf+AB7k7
 71U=
X-SBRS: 2.7
X-MesageID: 19697928
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,487,1583211600"; d="scan'208";a="19697928"
Date: Mon, 8 Jun 2020 10:51:10 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Roman Shaposhnik <roman@zededa.com>
Subject: Re: [PATCH for-4.14 v2] x86/rtc: provide mediated access to RTC for
 PVH dom0
Message-ID: <20200608085110.GD660@Air-de-Roger>
References: <20200605110240.52545-1-roger.pau@citrix.com>
 <CAMmSBy8=8tGwLgs+eMbrHcRbSahJHCpts7ODiK-cf-ZATfosxw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <CAMmSBy8=8tGwLgs+eMbrHcRbSahJHCpts7ODiK-cf-ZATfosxw@mail.gmail.com>
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Paul Durrant <paul@xen.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Jun 05, 2020 at 04:43:12PM -0700, Roman Shaposhnik wrote:
> On Fri, Jun 5, 2020 at 4:03 AM Roger Pau Monne <roger.pau@citrix.com> wrote:
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
> 
> For the dense guys like me: what is the user-visible feature that is now being
> offered with this? Would really appreciate a pointer or two.

Without this dom0 is not able to change the date. Note that
XENPF_settime{32/64} doesn't write the changes to the RTC (at least on
x86), so dom0 needs to write such changes to the RTC so they can
survive a poweroff.

However dom0 cannot be given direct access to the registers, since the
RTC uses an indirect access interface using two IO registers, so Xen
needs to trap such accesses by dom0 in order to serialize them and
prevent conflicts with Xen accesses to the RTC.

Roger.

