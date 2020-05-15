Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3671D4A7C
	for <lists+xen-devel@lfdr.de>; Fri, 15 May 2020 12:08:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jZXFy-0002v2-5R; Fri, 15 May 2020 10:07:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I0w9=65=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1jZXFw-0002ux-K3
 for xen-devel@lists.xenproject.org; Fri, 15 May 2020 10:07:52 +0000
X-Inumbo-ID: ee72a30a-9693-11ea-a545-12813bfff9fa
Received: from esa6.hc3370-68.iphmx.com (unknown [216.71.155.175])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ee72a30a-9693-11ea-a545-12813bfff9fa;
 Fri, 15 May 2020 10:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1589537270;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ve+XuuDfXh9Md/H4t5Pjko2ru3NNvfZtHyKdl89tmFk=;
 b=XFfi0WrzYAD2QEBSTujJDJFDX/iaSwjQUS0/5MyjhO36D3DHAj4Oq8z3
 EXcK6juQ7cTyXWrObLZqRrjlYIXgTTPEVTXSz9+WCNj5EZJDZHPVKF5ZO
 LV1RtB0AcTVZHOCGmDEtPSLc6/4B2AXFBSZ3yXns87zynTSvNi43GzFRr g=;
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 roger.pau@citrix.com) identity=pra; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com"; x-conformance=sidf_compatible
Received-SPF: Pass (esa6.hc3370-68.iphmx.com: domain of
 roger.pau@citrix.com designates 162.221.158.21 as permitted
 sender) identity=mailfrom; client-ip=162.221.158.21;
 receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="roger.pau@citrix.com";
 x-conformance=sidf_compatible; x-record-type="v=spf1";
 x-record-text="v=spf1 ip4:209.167.231.154 ip4:178.63.86.133
 ip4:195.66.111.40/30 ip4:85.115.9.32/28 ip4:199.102.83.4
 ip4:192.28.146.160 ip4:192.28.146.107 ip4:216.52.6.88
 ip4:216.52.6.188 ip4:162.221.158.21 ip4:162.221.156.83
 ip4:168.245.78.127 ~all"
Received-SPF: None (esa6.hc3370-68.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@mail.citrix.com) identity=helo;
 client-ip=162.221.158.21; receiver=esa6.hc3370-68.iphmx.com;
 envelope-from="roger.pau@citrix.com";
 x-sender="postmaster@mail.citrix.com";
 x-conformance=sidf_compatible
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none;
 spf=None smtp.pra=roger.pau@citrix.com;
 spf=Pass smtp.mailfrom=roger.pau@citrix.com;
 spf=None smtp.helo=postmaster@mail.citrix.com;
 dmarc=pass (p=none dis=none) d=citrix.com
IronPort-SDR: JTsJ4/YCKDvMoXHQJuOhjO3npv41XJmknYZeV2rKyV7j9iEhFXQuzf13v6vovf7XM2JGC7AskP
 neacPEuh2I2xNtGj6yh0d4xkcjxkqkxND4durRz2wMlTgwmCPvxQwacAKR9SjffZLDfpoa7nXT
 OwGEsvuiZ4pIKTxbAQID15noTPeM/50apKYdJlpp5b5fOc+OpbLLZLG7dy7nDmUlrqOO0Q2kMK
 VSbWYzo57aNzHnrCjTb6hP3qAyLGUuhJJSlFnuh5/e7kAbuTDtz+EK37h0f1j3fJoqJN4gnhLu
 tug=
X-SBRS: 2.7
X-MesageID: 17971316
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.73,394,1583211600"; d="scan'208";a="17971316"
Date: Fri, 15 May 2020 12:07:42 +0200
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: Re: Error during update_runstate_area with KPTI activated
Message-ID: <20200515100742.GR54375@Air-de-Roger>
References: <2c4437e9-d513-3e3c-7fec-13ffadc17df2@xen.org>
 <2E95C767-FFE1-4A48-B56D-F858A8CEE5D7@arm.com>
 <ab4f3c2a-95aa-1256-f6f4-0c3057f5600c@xen.org>
 <b6511a29-35a4-a1d0-dd29-7de4103ec98e@citrix.com>
 <CAJ=z9a1H2C6sWiScYw9XXLRcezBfUxYz2semj33D5GpB5=EE_w@mail.gmail.com>
 <478C4829-CCAF-495B-860E-6BA3D86AA47D@arm.com>
 <20200515083838.GN54375@Air-de-Roger>
 <d2033adc-3f98-2d14-ae6d-f8dcd8b90002@xen.org>
 <20200515091018.GO54375@Air-de-Roger>
 <93D7EBEF-E3E0-4DBB-A5BC-7D326B7AE0DB@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <93D7EBEF-E3E0-4DBB-A5BC-7D326B7AE0DB@arm.com>
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
Cc: Stefano
 Stabellini <stefano.stabellini@xilinx.com>, Julien Grall <julien@xen.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 Julien Grall <julien.grall.oss@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Can you please fix your email client to properly indent replies? It's
impossible to distinguish your added text when you reply from the
original email, as it's not indented in any way.

On Fri, May 15, 2020 at 09:21:34AM +0000, Bertrand Marquis wrote:
> On 15 May 2020, at 10:10, Roger Pau Monné <roger.pau@citrix.com<mailto:roger.pau@citrix.com>> wrote:
> 
> On Fri, May 15, 2020 at 09:53:54AM +0100, Julien Grall wrote:
> [CAUTION - EXTERNAL EMAIL] DO NOT reply, click links, or open attachments unless you have verified the sender and know the content is safe.
> 
> Hi,
> 
> On 15/05/2020 09:38, Roger Pau Monné wrote:
> On Fri, May 15, 2020 at 07:39:16AM +0000, Bertrand Marquis wrote:
> 
> 
> On 14 May 2020, at 20:13, Julien Grall <julien.grall.oss@gmail.com<mailto:julien.grall.oss@gmail.com><mailto:julien.grall.oss@gmail.com>> wrote:
> 
> On Thu, 14 May 2020 at 19:12, Andrew Cooper <andrew.cooper3@citrix.com<mailto:andrew.cooper3@citrix.com><mailto:andrew.cooper3@citrix.com>> wrote:
> 
> On 14/05/2020 18:38, Julien Grall wrote:
> Hi,
> 
> On 14/05/2020 17:18, Bertrand Marquis wrote:
> 
> 
> On 14 May 2020, at 16:57, Julien Grall <julien@xen.org<mailto:julien@xen.org><mailto:julien@xen.org>> wrote:
> 
> 
> 
> On 14/05/2020 15:28, Bertrand Marquis wrote:
> Hi,
> 
> Hi,
> 
> When executing linux on arm64 with KPTI activated (in Dom0 or in a
> DomU), I have a lot of walk page table errors like this:
> (XEN) p2m.c:1890: d1v0: Failed to walk page-table va
> 0xffffff837ebe0cd0
> After implementing a call trace, I found that the problem was
> coming from the update_runstate_area when linux has KPTI activated.
> I have the following call trace:
> (XEN) p2m.c:1890: d1v0: Failed to walk page-table va
> 0xffffff837ebe0cd0
> (XEN) backtrace.c:29: Stacktrace start at 0x8007638efbb0 depth 10
> (XEN)    [<000000000027780c>] get_page_from_gva+0x180/0x35c
> (XEN)    [<00000000002700c8>] guestcopy.c#copy_guest+0x1b0/0x2e4
> (XEN)    [<0000000000270228>] raw_copy_to_guest+0x2c/0x34
> (XEN)    [<0000000000268dd0>] domain.c#update_runstate_area+0x90/0xc8
> (XEN)    [<000000000026909c>] domain.c#schedule_tail+0x294/0x2d8
> (XEN)    [<0000000000269524>] context_switch+0x58/0x70
> (XEN)    [<00000000002479c4>] core.c#sched_context_switch+0x88/0x1e4
> (XEN)    [<000000000024845c>] core.c#schedule+0x224/0x2ec
> (XEN)    [<0000000000224018>] softirq.c#__do_softirq+0xe4/0x128
> (XEN)    [<00000000002240d4>] do_softirq+0x14/0x1c
> Discussing this subject with Stefano, he pointed me to a discussion
> started a year ago on this subject here:
> https://lists.xenproject.org/archives/html/xen-devel/2018-11/msg03053.html
> 
> And a patch was submitted:
> https://lists.xenproject.org/archives/html/xen-devel/2019-05/msg02320.html
> 
> I rebased this patch on current master and it is solving the
> problem I have seen.
> It sounds to me like a good solution to introduce a
> VCPUOP_register_runstate_phys_memory_area to not depend on the area
> actually being mapped in the guest when a context switch is being
> done (which is actually the problem happening when a context switch
> is trigger while a guest is running in EL0).
> Is there any reason why this was not merged at the end ?
> 
> I just skimmed through the thread to remind myself the state.
> AFAICT, this is blocked on the contributor to clarify the intended
> interaction and provide a new version.
> 
> What do you mean here by intended interaction ? How the new hyper
> call should be used by the guest OS ?
> 
> From what I remember, Jan was seeking clarification on whether the two
> hypercalls (existing and new) can be called together by the same OS
> (and make sense).
> 
> There was also the question of the handover between two pieces of
> sotfware. For instance, what if the firmware is using the existing
> interface but the OS the new one? Similar question about Kexecing a
> different kernel.
> 
> This part is mostly documentation so we can discuss about the approach
> and review the implementation.
> 
> 
> 
> I am still in favor of the new hypercall (and still in my todo list)
> but I haven't yet found time to revive the series.
> 
> Would you be willing to take over the series? I would be happy to
> bring you up to speed and provide review.
> 
> Sure I can take it over.
> 
> I ported it to master version of xen and I tested it on a board.
> I still need to do a deep review of the code myself but I have an
> understanding of the problem and what is the idea.
> 
> Any help to get on speed would be more then welcome :-)
> I would recommend to go through the latest version (v3) and the
> previous (v2). I am also suggesting v2 because I think the split was
> easier to review/understand.
> 
> The x86 code is probably what is going to give you the most trouble as
> there are two ABIs to support (compat and non-compat). If you don't
> have an x86 setup, I should be able to test it/help write it.
> 
> Feel free to ask any questions and I will try my best to remember the
> discussion from last year :).
> 
> At risk of being shouted down again, a new hypercall isn't necessarily
> necessary, and there are probably better ways of fixing it.
> 
> The underlying ABI problem is that the area is registered by virtual
> address.  The only correct way this should have been done is to register
> by guest physical address, so Xen's updating of the data doesn't
> interact with the guest pagetable settings/restrictions.  x86 suffers
> the same kind of problems as ARM, except we silently squash the fallout.
> 
> The logic in Xen is horrible, and I would really rather it was deleted
> completely, rather than to be kept for compatibility.
> 
> The runstate area is always fixed kernel memory and doesn't move.  I
> believe it is already restricted from crossing a page boundary, and we
> can calculate the va=>pa translation when the hypercall is made.
> 
> Yes - this is a technically ABI change, but nothing is going to break
> (AFAICT) and the cleanup win is large enough to make this a *very*
> attractive option.
> 
> I suggested this approach two years ago [1] but you were the one
> saying that buffer could cross page-boundary on older Linux [2]:
> 
> "I'd love to do this, but we cant.  Older Linux used to have a virtual
> buffer spanning a page boundary.  Changing the behaviour under that will
> cause older setups to explode."
> 
> Sorry this was long time ago, and details have faded. IIRC there was
> even a proposal (or patch set) that took that into account and allowed
> buffers to span across a page boundary by taking a reference to two
> different pages in that case.
> 
> I am not aware of a patch set. Juergen suggested a per-domain mapping but
> there was no details how this could be done (my e-mail was left unanswered
> [1]).
> 
> If we were using the vmap() then we would need up 1MB per domain (assuming
> 128 vCPUs). This sounds quite a bit and I think we need to agree whether it
> would be an acceptable solution (this was also left unanswered [1]).
> 
> Could we map/unmap the runtime area on domain switch at a per-cpu
> based linear space area? There's no reason to have all the runtime
> areas mapped all the time, you just care about the one from the
> running vcpu.
> 
> Maybe the overhead of that mapping and unmapping would be
> too high? But seeing that we are aiming at a secret-free Xen we would
> have to eventually go that route anyway.
> 
> Maybe the new hypercall should be a bit different:
> - we have this area allocated already inside Xen and we do a copy of it on any context switch
> - the guest is not supposed to modify any data in this area
> 
> We could introduce a new hypercall:
> - Xen allocate the runstate area using a page aligned address and size

It's generally best if we can use a guest provided memory area that's
already populated, because...

> - the guest provide a free guest physical space to the hypercall

... it's hard for the guest to figure out which non-populated areas
are safe for mapping arbitrary things. Ie: you might attempt to map
the runstate area on top of some MMIO area the guest is not aware of
for example if it has passthrough enabled.

> - Xen maps read-only its own area to the guest at the provided address
> - Xen shall not modify any data in the runstate area of other cores/guests (should already be the case)

I'm not sure those two restrictions are relevant, it's not relevant to
Xen whether the guest decided to overwrite the runstate area. Xen will
just write to it when doing a context switch in order to update it,
but it should never read from it.

Or are you meaning to map vcpu->runstate directly into the guest
physmap?

I think that's a bad idea as we would then have to force each vCPU
runstate to take up to a whole page, wasting lots of memory.

Thanks, Roger.

