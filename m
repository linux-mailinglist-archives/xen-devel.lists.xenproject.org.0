Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6F91FF488
	for <lists+xen-devel@lfdr.de>; Thu, 18 Jun 2020 16:18:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jlvMu-0008Ar-8p; Thu, 18 Jun 2020 14:18:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HRl3=77=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jlvMs-0008Am-Eg
 for xen-devel@lists.xenproject.org; Thu, 18 Jun 2020 14:18:14 +0000
X-Inumbo-ID: 8af14df2-b16e-11ea-bb8b-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 8af14df2-b16e-11ea-bb8b-bc764e2007e4;
 Thu, 18 Jun 2020 14:18:12 +0000 (UTC)
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: DNPYnxDFCiZ1iRya1W0zExaA/pzdco9IwLZmalLqQYQzRgX4QlOjh0tv28dFJgMB8dzSYjosTS
 nqR9wljgaTtXWgTvpyWTwpv98ZG78WU4fvYeqS/9wlT8ErcT40tv6F9gG1qgp1Sp1Mk0wTVyeN
 H6sA+jCU8b/j14mcfdjasKaP1o7oaKX0HY88Rzx07VIHQvcVWAkj/xxM36aZqGHqZimuXdW3uo
 UWKqY+I+SyiuxQ+QIgvBkm1Nng2vBkLZh/Hxe/vKeLTwbN+hbiivZOMYefz68krIMe2n//sZrt
 0LQ=
X-SBRS: 2.7
X-MesageID: 20603131
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,526,1583211600"; d="scan'208";a="20603131"
Date: Thu, 18 Jun 2020 16:18:05 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH for-4.14 2/8] x86/hvm: don't force vCPU 0 for IRQ 0 when
 using fixed destination mode
Message-ID: <20200618141805.GR735@Air-de-Roger>
References: <20200612155640.4101-1-roger.pau@citrix.com>
 <20200612155640.4101-3-roger.pau@citrix.com>
 <ac179f79-3b40-9ff3-9437-16a30e019813@suse.com>
 <20200618134841.GQ735@Air-de-Roger>
 <ddaeb562-1d61-1855-508c-40bb2b796357@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ddaeb562-1d61-1855-508c-40bb2b796357@suse.com>
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

On Thu, Jun 18, 2020 at 04:08:28PM +0200, Jan Beulich wrote:
> On 18.06.2020 15:48, Roger Pau Monné wrote:
> > On Thu, Jun 18, 2020 at 03:43:00PM +0200, Jan Beulich wrote:
> >> On 12.06.2020 17:56, Roger Pau Monne wrote:
> >>> When the IO APIC pin mapped to the ISA IRQ 0 has been configured to
> >>> use fixed delivery mode do not forcefully route interrupts to vCPU 0,
> >>> as the OS might have setup those interrupts to be injected to a
> >>> different vCPU, and injecting to vCPU 0 can cause the OS to miss such
> >>> interrupts or errors to happen due to unexpected vectors being
> >>> injected on vCPU 0.
> >>>
> >>> In order to fix remove such handling altogether for fixed destination
> >>> mode pins and just inject them according to the data setup in the
> >>> IO-APIC entry.
> >>>
> >>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> >>
> >> Technically
> >> Reviewed-by: Jan Beulich <jbeulich@suse.com>
> >>
> >> I wonder though why this was done in the first place - it very much
> >> feels like a workaround for certain guest behavior, and hence
> >> getting rid of it may mean a certain risk of regressions. Not a
> >> very good point in time to make risky changes ...
> > 
> > We can defer to after the release I guess, but I will still ask for
> > the changes to be backported.
> 
> That's fine, albeit if we decide to delay it until 4.15 was branched,
> then I think we want to also wait longer than usual until it would hit
> the stable trees. Unfortunately c8e79412c001's description is of no
> help to understand what or why "time jumps" may result from delivering
> the interrupt as requested.

Yes, I've also looked at the original commit and have no idea what it
was actually trying to fix, and why delivering to vCPU 0 fixed it.
FWIW, I tried delivering to a different vCPU and it seems to work
fine.

Note that other timers (ie: RTC or HPET) are not tied to vCPU 0, so it
must have been something related to the PIT?

Thanks, Roger.

