Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 909EE1D4920
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2020 11:10:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZWMP-00061k-JW; Fri, 15 May 2020 09:10:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I0w9=65=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jZWMO-00061e-55
 for xen-devel@lists.xenproject.org; Fri, 15 May 2020 09:10:28 +0000
X-Inumbo-ID: e9ec7a64-968b-11ea-b07b-bc764e2007e4
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e9ec7a64-968b-11ea-b07b-bc764e2007e4;
 Fri, 15 May 2020 09:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589533826;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=xdjmvN1D6FBQUS/kuHUoMyL1ugNzbdErb0hAIANClc4=;
 b=Cx3lg4gyA26CeQuUUt5I0JtgAekLKs8vOCRI2HsQphIPtDucTkXVW1ct
 EJelueAKu5EtrGR/ARikYBR+ttiUrwJ7ZqWe33sle4pihDZcfrun/bnAp
 v3NCT5dr/2b+sjAYiL7tXka7b6hvSK09e9naVtUyDlzq6ycGLiStpn790 U=;
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa5.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa5.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa5.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: +6oWXEnq6SYeWqe2XD4AQsFlUL2k3pmYzkhab/zL3v8THIosWCBVH2q84Bkr5VsT3w2WTTZ/53
 8Hx06LQiAs+DTAmsUHISOCPInMr1aR8Z4A/Rg/dA5143syntf+q1tlz5cP9OHB0pd1J4lzduk/
 t9yZ5aLWfjokfhHpgE/ueZf9tBxcOH+ota9arepS6hQMTyccR+qeGhIvyatvUsdHN7H3ILrSkw
 jqcvjQ458cF2U4/fyV0IA31+IEV6UkwqhFGxHNovKeYynyqQIEnDY3WuHh6JfFQQ3NnqnSOUKU
 XyE=
X-SBRS: 2.7
X-MesageID: 17873503
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,394,1583211600"; d="scan'208";a="17873503"
Date: Fri, 15 May 2020 11:10:18 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Julien Grall <julien@xen.org>
Subject: Re: Error during update_runstate_area with KPTI activated
Message-ID: <20200515091018.GO54375@Air-de-Roger>
References: <C6B0E24F-60E6-4621-8448-C8DBAE3277A9@arm.com>
 <2c4437e9-d513-3e3c-7fec-13ffadc17df2@xen.org>
 <2E95C767-FFE1-4A48-B56D-F858A8CEE5D7@arm.com>
 <ab4f3c2a-95aa-1256-f6f4-0c3057f5600c@xen.org>
 <b6511a29-35a4-a1d0-dd29-7de4103ec98e@citrix.com>
 <CAJ=z9a1H2C6sWiScYw9XXLRcezBfUxYz2semj33D5GpB5=EE_w@mail.gmail.com>
 <478C4829-CCAF-495B-860E-6BA3D86AA47D@arm.com>
 <20200515083838.GN54375@Air-de-Roger>
 <d2033adc-3f98-2d14-ae6d-f8dcd8b90002@xen.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d2033adc-3f98-2d14-ae6d-f8dcd8b90002@xen.org>
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
Cc: Stefano Stabellini <stefano.stabellini@xilinx.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 Julien Grall <julien.grall.oss@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Fri, May 15, 2020 at 09:53:54AM +0100, Julien Grall wrote:
> [CAUTION - EXTERNAL EMAIL] DO NOT reply, click links, or open attachments unless you have verified the sender and know the content is safe.
> 
> Hi,
> 
> On 15/05/2020 09:38, Roger Pau Monné wrote:
> > On Fri, May 15, 2020 at 07:39:16AM +0000, Bertrand Marquis wrote:
> > > 
> > > 
> > > On 14 May 2020, at 20:13, Julien Grall <julien.grall.oss@gmail.com<mailto:julien.grall.oss@gmail.com>> wrote:
> > > 
> > > On Thu, 14 May 2020 at 19:12, Andrew Cooper <andrew.cooper3@citrix.com<mailto:andrew.cooper3@citrix.com>> wrote:
> > > 
> > > On 14/05/2020 18:38, Julien Grall wrote:
> > > Hi,
> > > 
> > > On 14/05/2020 17:18, Bertrand Marquis wrote:
> > > 
> > > 
> > > On 14 May 2020, at 16:57, Julien Grall <julien@xen.org<mailto:julien@xen.org>> wrote:
> > > 
> > > 
> > > 
> > > On 14/05/2020 15:28, Bertrand Marquis wrote:
> > > Hi,
> > > 
> > > Hi,
> > > 
> > > When executing linux on arm64 with KPTI activated (in Dom0 or in a
> > > DomU), I have a lot of walk page table errors like this:
> > > (XEN) p2m.c:1890: d1v0: Failed to walk page-table va
> > > 0xffffff837ebe0cd0
> > > After implementing a call trace, I found that the problem was
> > > coming from the update_runstate_area when linux has KPTI activated.
> > > I have the following call trace:
> > > (XEN) p2m.c:1890: d1v0: Failed to walk page-table va
> > > 0xffffff837ebe0cd0
> > > (XEN) backtrace.c:29: Stacktrace start at 0x8007638efbb0 depth 10
> > > (XEN)    [<000000000027780c>] get_page_from_gva+0x180/0x35c
> > > (XEN)    [<00000000002700c8>] guestcopy.c#copy_guest+0x1b0/0x2e4
> > > (XEN)    [<0000000000270228>] raw_copy_to_guest+0x2c/0x34
> > > (XEN)    [<0000000000268dd0>] domain.c#update_runstate_area+0x90/0xc8
> > > (XEN)    [<000000000026909c>] domain.c#schedule_tail+0x294/0x2d8
> > > (XEN)    [<0000000000269524>] context_switch+0x58/0x70
> > > (XEN)    [<00000000002479c4>] core.c#sched_context_switch+0x88/0x1e4
> > > (XEN)    [<000000000024845c>] core.c#schedule+0x224/0x2ec
> > > (XEN)    [<0000000000224018>] softirq.c#__do_softirq+0xe4/0x128
> > > (XEN)    [<00000000002240d4>] do_softirq+0x14/0x1c
> > > Discussing this subject with Stefano, he pointed me to a discussion
> > > started a year ago on this subject here:
> > > https://lists.xenproject.org/archives/html/xen-devel/2018-11/msg03053.html
> > > 
> > > And a patch was submitted:
> > > https://lists.xenproject.org/archives/html/xen-devel/2019-05/msg02320.html
> > > 
> > > I rebased this patch on current master and it is solving the
> > > problem I have seen.
> > > It sounds to me like a good solution to introduce a
> > > VCPUOP_register_runstate_phys_memory_area to not depend on the area
> > > actually being mapped in the guest when a context switch is being
> > > done (which is actually the problem happening when a context switch
> > > is trigger while a guest is running in EL0).
> > > Is there any reason why this was not merged at the end ?
> > > 
> > > I just skimmed through the thread to remind myself the state.
> > > AFAICT, this is blocked on the contributor to clarify the intended
> > > interaction and provide a new version.
> > > 
> > > What do you mean here by intended interaction ? How the new hyper
> > > call should be used by the guest OS ?
> > > 
> > >  From what I remember, Jan was seeking clarification on whether the two
> > > hypercalls (existing and new) can be called together by the same OS
> > > (and make sense).
> > > 
> > > There was also the question of the handover between two pieces of
> > > sotfware. For instance, what if the firmware is using the existing
> > > interface but the OS the new one? Similar question about Kexecing a
> > > different kernel.
> > > 
> > > This part is mostly documentation so we can discuss about the approach
> > > and review the implementation.
> > > 
> > > 
> > > 
> > > I am still in favor of the new hypercall (and still in my todo list)
> > > but I haven't yet found time to revive the series.
> > > 
> > > Would you be willing to take over the series? I would be happy to
> > > bring you up to speed and provide review.
> > > 
> > > Sure I can take it over.
> > > 
> > > I ported it to master version of xen and I tested it on a board.
> > > I still need to do a deep review of the code myself but I have an
> > > understanding of the problem and what is the idea.
> > > 
> > > Any help to get on speed would be more then welcome :-)
> > > I would recommend to go through the latest version (v3) and the
> > > previous (v2). I am also suggesting v2 because I think the split was
> > > easier to review/understand.
> > > 
> > > The x86 code is probably what is going to give you the most trouble as
> > > there are two ABIs to support (compat and non-compat). If you don't
> > > have an x86 setup, I should be able to test it/help write it.
> > > 
> > > Feel free to ask any questions and I will try my best to remember the
> > > discussion from last year :).
> > > 
> > > At risk of being shouted down again, a new hypercall isn't necessarily
> > > necessary, and there are probably better ways of fixing it.
> > > 
> > > The underlying ABI problem is that the area is registered by virtual
> > > address.  The only correct way this should have been done is to register
> > > by guest physical address, so Xen's updating of the data doesn't
> > > interact with the guest pagetable settings/restrictions.  x86 suffers
> > > the same kind of problems as ARM, except we silently squash the fallout.
> > > 
> > > The logic in Xen is horrible, and I would really rather it was deleted
> > > completely, rather than to be kept for compatibility.
> > > 
> > > The runstate area is always fixed kernel memory and doesn't move.  I
> > > believe it is already restricted from crossing a page boundary, and we
> > > can calculate the va=>pa translation when the hypercall is made.
> > > 
> > > Yes - this is a technically ABI change, but nothing is going to break
> > > (AFAICT) and the cleanup win is large enough to make this a *very*
> > > attractive option.
> > > 
> > > I suggested this approach two years ago [1] but you were the one
> > > saying that buffer could cross page-boundary on older Linux [2]:
> > > 
> > > "I'd love to do this, but we cant.  Older Linux used to have a virtual
> > > buffer spanning a page boundary.  Changing the behaviour under that will
> > > cause older setups to explode."
> > 
> > Sorry this was long time ago, and details have faded. IIRC there was
> > even a proposal (or patch set) that took that into account and allowed
> > buffers to span across a page boundary by taking a reference to two
> > different pages in that case.
> 
> I am not aware of a patch set. Juergen suggested a per-domain mapping but
> there was no details how this could be done (my e-mail was left unanswered
> [1]).
> 
> If we were using the vmap() then we would need up 1MB per domain (assuming
> 128 vCPUs). This sounds quite a bit and I think we need to agree whether it
> would be an acceptable solution (this was also left unanswered [1]).

Could we map/unmap the runtime area on domain switch at a per-cpu
based linear space area? There's no reason to have all the runtime
areas mapped all the time, you just care about the one from the
running vcpu.

Maybe the overhead of that mapping and unmapping would be
too high? But seeing that we are aiming at a secret-free Xen we would
have to eventually go that route anyway.

> > 
> > Another option would be to just return -EINVAL or -EOPNOTSUPP in that
> > case and just get on with it. runstate info shouldn't be mandatory for
> > guests to function properly, I would say it's just extra info that's
> > provided in good faith from the hypervisor in order to help the guest
> > make better scheduling decisions.
> 
> Linux will panic if the VCPUOP_register_runstate_memory_area returns an
> error (see xen_setup_runstate_info()).

Oh, that's dull. That hypercall was never noted to be optional, so it
failing would mean Linux has somehow screwed the call which is not
expected.

Roger.

