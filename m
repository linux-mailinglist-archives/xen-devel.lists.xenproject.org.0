Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A331F1C7B
	for <lists+xen-devel@lfdr.de>; Mon,  8 Jun 2020 17:56:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiK8I-0002EV-8f; Mon, 08 Jun 2020 15:56:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QWP5=7V=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jiK8H-0002EP-Gr
 for xen-devel@lists.xenproject.org; Mon, 08 Jun 2020 15:56:17 +0000
X-Inumbo-ID: 96097db6-a9a0-11ea-b292-12813bfff9fa
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 96097db6-a9a0-11ea-b292-12813bfff9fa;
 Mon, 08 Jun 2020 15:56:17 +0000 (UTC)
Authentication-Results: esa3.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: TdRVyyo1WdLADr7FIMNHOZuR+T+wR9CKWiMtxMpEb3QPJgm/ybSpj2olenmc5Yzzipw/SqPL5E
 RM3hdg5St3t51PeEqInlFaENnzNAApIPJ51WiQASDUUkcijtq3Im4ibtKYg5wjMx9cHjRAa+F4
 XSQO5LyK6YcR0bFzsNZcesRPFrJp/l0E9nwBNVDoLnvTHf7GY4KwiUben+B0SwQM9rU7qyue3Q
 y9emQU14tSTkQXrkhOOs8dEQd0i/S30ziZwFPVGOux0yAMfnHvUUYMRowm0dcHyG79bpvGfH1l
 ytk=
X-SBRS: 2.7
X-MesageID: 19491858
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,487,1583211600"; d="scan'208";a="19491858"
Date: Mon, 8 Jun 2020 17:56:06 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH for-4.14 v3] x86/rtc: provide mediated access to RTC for
 PVH dom0
Message-ID: <20200608155606.GB722@Air-de-Roger>
References: <20200608102948.7327-1-roger.pau@citrix.com>
 <71e0d073-165b-8fcc-62b9-3fb028b3c526@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <71e0d073-165b-8fcc-62b9-3fb028b3c526@suse.com>
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

On Mon, Jun 08, 2020 at 01:47:26PM +0200, Jan Beulich wrote:
> On 08.06.2020 12:29, Roger Pau Monne wrote:
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
> 
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> preferably with ...
> 
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
> ... at least the 2nd sentence of this and ...
> 
> > +void rtc_guest_write(unsigned int port, unsigned int data)
> > +{
> > +    struct domain *currd = current->domain;
> > +    unsigned long flags;
> > +
> > +    switch ( port )
> > +    {
> > +    case RTC_PORT(0):
> > +        /*
> > +         * All PV domains are allowed to write to the latched value of the
> > +         * first RTC port. This is useful in order to store data when
> > +         * debugging.
> > +         */
> 
> ... this comment dropped again. This justification of the possible
> usefulness is my very private guessing. Just like the original code
> was, I think we could leave this uncommented altogether.

Hm, as you wish. I would prefer to leave something similar to the
first part of the comment, what about:

/*
 * All PV domains (and PVH dom0) are allowed to write/read to the
 * latched value of the first RTC port, as there's no access to the
 * physical IO ports.
 */

I can adjust and then add a newline after the break in the RTC_PORT(0)
case which I missed.

Thanks, Roger.

