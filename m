Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B72021EFBEA
	for <lists+xen-devel@lfdr.de>; Fri,  5 Jun 2020 16:55:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jhDkC-00049Z-5R; Fri, 05 Jun 2020 14:54:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lb65=7S=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jhDkA-00049P-LT
 for xen-devel@lists.xenproject.org; Fri, 05 Jun 2020 14:54:50 +0000
X-Inumbo-ID: 80eaccf2-a73c-11ea-9b55-bc764e2007e4
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 80eaccf2-a73c-11ea-9b55-bc764e2007e4;
 Fri, 05 Jun 2020 14:54:49 +0000 (UTC)
Authentication-Results: esa2.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: xMF6ONnsvuGDgfTrGR3onGFb2dEtP6Is4PLLBJDnhH/f21UoVhdi1W1JDiSkoj3IQBDDIYUWFO
 /4KUqZynHp3pgIcHyEa5G9xa6FeXj28mhGTCcz4ecVjEYeh+PN6KGfqMg10DzeT7aJCSaJUEbm
 wtzGttxmOdubgkNBi5hqPWTsIdtX1aFfmILqMLrG8r75NGY8FxA+B8pwF9VBSf/tY4AebXNTcl
 BM/ezMA4OLRTfewpaVtSgFKVprIHPZtbh5JuymP+lQdSPJgYh1ZC/lECyICStw0xC8qlFsCpdz
 WS0=
X-SBRS: 2.7
X-MesageID: 19352124
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,476,1583211600"; d="scan'208";a="19352124"
Date: Fri, 5 Jun 2020 16:54:42 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH for-4.14] x86/rtc: provide mediated access to RTC for PVH
 dom0
Message-ID: <20200605145442.GB660@Air-de-Roger>
References: <20200605075006.51238-1-roger.pau@citrix.com>
 <ac523b3f-cc96-e63e-732c-2aa7ac3eac59@suse.com>
 <20200605092035.GL1195@Air-de-Roger>
 <e88b3427-dfbb-d244-e3cd-1fb57187dec4@suse.com>
 <20200605141636.GN1195@Air-de-Roger>
 <e8ee25bd-0120-8de7-3f16-08ef73c05deb@suse.com>
 <20200605144528.GA660@Air-de-Roger>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200605144528.GA660@Air-de-Roger>
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
Cc: xen-devel@lists.xenproject.org, paul@xen.org, Wei Liu <wl@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, Jun 05, 2020 at 04:45:28PM +0200, Roger Pau Monné wrote:
> On Fri, Jun 05, 2020 at 04:20:31PM +0200, Jan Beulich wrote:
> > On 05.06.2020 16:16, Roger Pau Monné wrote:
> > > On Fri, Jun 05, 2020 at 12:05:12PM +0200, Jan Beulich wrote:
> > >> On 05.06.2020 11:20, Roger Pau Monné wrote:
> > >>> On Fri, Jun 05, 2020 at 10:48:48AM +0200, Jan Beulich wrote:
> > >>>> On 05.06.2020 09:50, Roger Pau Monne wrote:
> > >>>>> This patch provides such mediated access to the
> > >>>>> RTC for PVH dom0, just like it's provided for a classic PV dom0.
> > >>>>>
> > >>>>> Instead of re-using the PV paths implement such handler together with
> > >>>>> the vRTC code for HVM, so that calling rtc_init will setup the
> > >>>>> appropriate handlers for all HVM based guests.
> > >>>>
> > >>>> Hooking this into rtc_init() makes sense as long as it's really
> > >>>> just the RTC. Looking at the PV code you're cloning from, I
> > >>>> wonder though whether pv_pit_handler() should also regain callers
> > >>>> for PVH. As it stands the function is called for PV only, yet was
> > >>>> deliberately put/kept outside of pv/.
> > >>>
> > >>> IIRC pv_pit_handler was also used by PVHv1 dom0, but we decided to not
> > >>> enable it for PVHv2 because no one really knew why the PIT was
> > >>> actually needed for by dom0.
> > >>
> > >> I think the reason PV Dom0 has it applies to PVH Dom0 as well:
> > >> At least back at the time there were video BIOSes needing this.
> > >> As it now turns out to have been a mistake to not enable the
> > >> RTC handling for v2, I would still think it would be better to
> > >> enable the PIT logic as well there, just to be on the safe side.
> > > 
> > > I have to admit I haven't used video output very much with PVH, I've
> > > had reports of people having success with it, but I have no idea how
> > > many failures there might be.
> > > 
> > > Enabling the PIT for PVH dom0 is mostly a matter of adding
> > > XEN_X86_EMU_PIT to the emulation flags, like it's currently done for
> > > PV dom0.
> > > 
> > > There's going to be a slight issue though, which is that the PIT will
> > > try to inject the interrupts using the PIC IRQ0, and thus would either
> > > need to also enable the PIC, or to instead set the timer source to
> > > PTSRC_ioapic instead of PTSRC_isa and use GSI 0. I haven't actually
> > > tried whether this would work, but seems better than enabling the PIC.
> > 
> > But what we do for PV Dom0 doesn't go as far as injecting IRQs (let
> > alone IRQ0). It's just the few port accesses that we allow them to
> > make (successfully, i.e. seeing the relevant bare hardware bits).
> 
> It seems cleaner to me to just provide the whole thing for PVH, rather
> than what we do for classic PV, in which we allow some accesses to the
> real hardware.
> 
> I understand there's no need to give dom0 access to the real PIC, and
                                                               ^ PIT.
> that using the emulated one should work just fine.
> 
> Roger.
> 

