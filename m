Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B171C2EB57F
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jan 2021 23:44:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62206.110010 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwv37-0001jx-87; Tue, 05 Jan 2021 22:43:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62206.110010; Tue, 05 Jan 2021 22:43:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwv37-0001jY-4u; Tue, 05 Jan 2021 22:43:33 +0000
Received: by outflank-mailman (input) for mailman id 62206;
 Tue, 05 Jan 2021 22:43:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z2QB=GI=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kwv34-0001jT-TS
 for xen-devel@lists.xenproject.org; Tue, 05 Jan 2021 22:43:31 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e003734c-1ff6-4845-8c08-217e8cbaa4f9;
 Tue, 05 Jan 2021 22:43:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id ABB6422D6E;
 Tue,  5 Jan 2021 22:43:28 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: e003734c-1ff6-4845-8c08-217e8cbaa4f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1609886608;
	bh=0tUQYsnN75qedhu6j62adTCGcg4H+FPj5yJurq8zvPg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=mCo9BQFQ6/zHef/0OSE+G7lDrMZxOhSXxk/5eNvvh+thCNfwlX4F/jbqbpVWUIzCR
	 OVuj5GKnCmClU9aaeR+9abvNeQyo3NaGlQ7HtSBWW70Apngr+uYWLOsEfaOjSSsBt5
	 7esnSBgk6PdrHa8lFnXqoOAJ4X97DsBlai1tvHcToyrSiUzmQDousCh1DLTfPQ8s+d
	 94jcnswl1enpdi+/A6RdwM80onww+m7EzuDSU7ZGN6u96GFcfbJhErBbc8ByElxNz8
	 +KB8cIbunXaMsJ021qP5RD2dhz9qtDHBcNEDYk3fHIpszBuQF7NzFTs0zGOqmrZNyb
	 nMFRt8NVDWeNA==
Date: Tue, 5 Jan 2021 14:43:28 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    =?UTF-8?Q?Andr=C3=A9_Przywara?= <andre.przywara@arm.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>
Subject: Re: Smoke test failure on Arm (was Re: [PATCH v4 0/8] xen/arm:
 Emulate ID registers)
In-Reply-To: <7942af32-6bae-36c4-e1ee-dd3edc85097a@xen.org>
Message-ID: <alpine.DEB.2.21.2101051425360.4307@sstabellini-ThinkPad-T480s>
References: <cover.1608214355.git.bertrand.marquis@arm.com> <ea8e117c-26c0-5c94-e06a-12027d25d7d6@xen.org> <338ef917-4b67-d839-82e4-164bbf46f85e@arm.com> <alpine.DEB.2.21.2101051042230.4307@sstabellini-ThinkPad-T480s>
 <7942af32-6bae-36c4-e1ee-dd3edc85097a@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-994217882-1609886608=:4307"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-994217882-1609886608=:4307
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 5 Jan 2021, Julien Grall wrote:
> Hi Stefano,
> 
> On 05/01/2021 18:44, Stefano Stabellini wrote:
> > On Tue, 5 Jan 2021, André Przywara wrote:
> > > On 05/01/2021 16:06, Julien Grall wrote:
> > > > (+ Ian and Andre)
> > > > 
> > > > Hi Bertrand,
> > > > 
> > > > On IRC, Ian pointed out that the smoke test was failing on Cubietruck.
> > > > The only patches because the last success and the failure are your
> > > > series.
> > > > 
> > > > This seems to be a very early failure as there is no output from Xen
> > > > [1].
> > > > 
> > > > I originally thought the problem was because some of the ID registers
> > > > (such as ID_PFR2) introduced in patch #2 doesn't exist in Armv7.
> > > > 
> > > > But per B7.2.1 in ARM DDI 0406C.d, unallocated ID registers should be
> > > > RAZ. So it would result to a crash. Andre confirmed that PFR2 can be
> > > > accessed by writing a small baremetal code and booted on Cortex-A7 and
> > > > Cortex-A20.
> > > > 
> > > > So I am not entirely sure what's the problem. Andre kindly accepted to
> > > > try to boot Xen on his board. Hopefully, this will give us a clue on the
> > > > problem.
> > > > 
> > > > If not, I will borrow a Cubietruck in OssTest and see if I can reproduce
> > > > it and debug it.
> > > 
> > > 
> > > So I just compiled master and staging and ran just that on an Allwinner
> > > H3 (Cortex-A7 r0p5). Master boots fine (till it complains about the
> > > missing Dom0, as expected). However staging indeed fails:
> > > 
> > > (XEN) Xen version 4.15-unstable (andprz01@slackpad.lan)
> > > (arm-slackware-linux-gnueabihf-gcc (GCC) 8.2.0) debug=y  Tue Jan  5
> > > 16:09:40 GMT 2021
> > > (XEN) Latest ChangeSet: Sun Nov 8 15:59:42 2020 +0100 git:c992efd06a
> > > (XEN) build-id: 85d361b8565b90d4e0defe2beb2419e191fd76b4
> > > (XEN) CPU0: Unexpected Trap: Undefined Instruction
> > > (XEN) ----[ Xen-4.15-unstable  arm32  debug=y   Not tainted ]----
> > > (XEN) CPU:    0
> > > (XEN) PC:     0026b8c8 identify_cpu+0xc0/0xd4
> > > (XEN) CPSR:   600001da MODE:Hypervisor
> > > (XEN)      R0: 002acb20 R1: 00000000 R2: 00000000 R3: 11111111
> > > (XEN)      R4: 002acb1c R5: 002acb20 R6: 4e000000 R7: 00000000
> > > (XEN)      R8: 00000002 R9: 002d8200 R10:00008000 R11:002f7e6c
> > > R12:00000080
> > > (XEN) HYP: SP: 002f7e68 LR: 002c419c
> > > (XEN)
> > > (XEN)   VTCR_EL2: 80002646
> > > (XEN)  VTTBR_EL2: 00000018e628bb80
> > > (XEN)
> > > (XEN)  SCTLR_EL2: 30cd187f
> > > (XEN)    HCR_EL2: 00000038
> > > (XEN)  TTBR0_EL2: 000000004013a000
> > > (XEN)
> > > (XEN)    ESR_EL2: 00000000
> > > (XEN)  HPFAR_EL2: 0003fff0
> > > (XEN)      HDFAR: 9d110000
> > > (XEN)      HIFAR: 0000a04a
> > > (XEN)
> > > (XEN) Xen stack trace from sp=002f7e68:
> > > (XEN)    00000000 002f7f54 00008000 00000000 00002000 002a4584 00000000
> > > 00000000
> > > (XEN)    00000000 00008000 49ff5000 002d81f0 40000000 00000000 00002000
> > > 00000001
> > > (XEN)    00000000 50000000 49ffd000 00000000 50000000 00000000 00000000
> > > 50000000
> > > (XEN)    4c000000 00000000 4e000000 00000000 ffffffff ffffffff 50000000
> > > 00000000
> > > (XEN)    50000000 00000000 50000000 00000000 00000000 00000000 00000000
> > > 00000000
> > > (XEN)    00000000 00000003 00000000 00000000 ffffffff 00000040 ffffffff
> > > 00000000
> > > (XEN)    00000000 00000000 00000000 002a7000 40008050 0000001a 00000000
> > > 49ff5000
> > > (XEN)    40008000 3fe08000 00000004 0020006c 00000000 00000000 00000000
> > > 00000000
> > > (XEN)    00000000 00000000 00000000 00000000 00000000 00000000 00000000
> > > 00000000
> > > (XEN)    00000000 00000000 00000000 00000000 00000000 00000000 00000000
> > > 00000000
> > > (XEN)    00000000 00000000 00000000 00000000 00000000 00000000 00000000
> > > 00000000
> > > (XEN)    00000000 00000000 00000000 00000000 00000000 00000000 00000000
> > > 00000000
> > > (XEN)    00000000 00000000 00000000 00000000 00000000 00000000
> > > (XEN) Xen call trace:
> > > (XEN)    [<0026b8c8>] identify_cpu+0xc0/0xd4 (PC)
> > > (XEN)    [<002c419c>] start_xen+0x778/0xe50 (LR)
> > > (XEN)    [<002f7f54>] 002f7f54
> > > (XEN)
> > > (XEN)
> > > (XEN) ****************************************
> > > (XEN) Panic on CPU 0:
> > > (XEN) CPU0: Unexpected Trap: Undefined Instruction
> > > (XEN) ****************************************
> > > (XEN)
> > > (XEN) Reboot in five seconds...
> > > 
> > > 
> > > The code in question:
> > >    26b8c0:       eef63a10        vmrs    r3, mvfr1
> > >    26b8c4:       e5803058        str     r3, [r0, #88]   ; 0x58
> > > > 26b8c8:       eef53a10        vmrs    r3, mvfr2
> > >    26b8cc:       e580305c        str     r3, [r0, #92]   ; 0x5c
> > >    26b8d0:       e28bd000        add     sp, fp, #0
> > >    26b8d4:       e49db004        pop     {fp}       ; (ldr fp, [sp], #4)
> > >    26b8d8:       e12fff1e        bx      lr
> > > 
> > > And indeed MVFR2 is not mentioned in the ARMv7 ARM, and in contrast to
> > > the CP15 CPUID registers this is using the VMRS instruction, so it's not
> > > protected by future-proof CPUID register scheme.
> > > 
> > > Not sure what to do about this, maybe #ifdef'ing this register access
> > > with arm64?
> > > I guess this comes from the slightly too optimistic code-sharing between
> > > arm32 and arm64?
> > 
> > Yes and #ifdef'ing is what we have been doing with the other registers.
> 
> There is a catch here. This register is accessible from AArch32 on all Armv8
> HW. It is just not accessible on Armv7.
> 
> So hiding the MVFR2 behind #ifdef CONFIG_ARM_64 is technically not correct.
> 
> I know that we said that we don't officially support Xen on Arm32 on Armv8 HW
> (I can't find where it is written though). So we could argue that shadowing
> MVFR2 is not worth it.
> 
> I do use Armv8 HW to test 32-bit, so I would at least like to get Xen booting.

Yep, me too.


> In addition to that, Linux 32-bit doesn't access MVFR2 at the moment.
>
> Therefore, a #ifdef may be acceptable for now. However, I would suggest to
> introduce name it MAY_BE_UNDEFINED (or similar) that will be used to avoid
> reading the system register on 32-bit.
> 
> For the 32-bit case, I would just hardcode the value based on the Arm (it
> looks like for Armv8-A there is only one valid value).
> 
> IOW, the hack would be self-contained in cpufeature.c.

I think it makes sense that the hack should be self-contained in
cpufeature.c, leaving the definition of struct mvfr to 3 register_t also
on arm32 as it is today. Also leaving vcpreg.c as it is today so that a
guest can try to read mvfr2 without crashing thanks to
GENERATE_TID3_INFO(MVFR2, mvfr, 2).

For the arm32 case in cpufeature.c:identify_cpu, the two permitted
values are 0 and 0b0100, which one did you have in mind? I take you
meant 0 which stands for "not implemented, or no support for
miscellaneous features"?


In regards to:
> I would suggest to introduce name it MAY_BE_UNDEFINED (or similar)
> that will be used to avoid reading the system register on 32-bit.

Did you mean something like the following on arm32 (maybe to
xen/include/asm-arm/arm32/sysregs.h):

#define MVFR2_MAYBE_UNDEFINED


Then in identify_cpu:

#ifndef MVFR2_MAYBE_UNDEFINED
    c->mvfr.bits[2] = READ_SYSREG(MVFR2_EL1);
#endif
--8323329-994217882-1609886608=:4307--

