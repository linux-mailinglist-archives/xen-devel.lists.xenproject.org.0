Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC952EC561
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jan 2021 21:56:30 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62686.111121 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxFqP-00055R-1s; Wed, 06 Jan 2021 20:55:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62686.111121; Wed, 06 Jan 2021 20:55:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kxFqO-000552-UY; Wed, 06 Jan 2021 20:55:48 +0000
Received: by outflank-mailman (input) for mailman id 62686;
 Wed, 06 Jan 2021 20:55:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=HzCB=GJ=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kxFqN-00054x-Qv
 for xen-devel@lists.xenproject.org; Wed, 06 Jan 2021 20:55:47 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6360cfec-f03e-41e5-81bc-724ec2e82d23;
 Wed, 06 Jan 2021 20:55:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8340623139;
 Wed,  6 Jan 2021 20:55:45 +0000 (UTC)
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
X-Inumbo-ID: 6360cfec-f03e-41e5-81bc-724ec2e82d23
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1609966545;
	bh=rQT07618w2hNOKYaBILkkf6VFT9pN2w3thOsrnqhpOg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=oaOjAaMJuIR3DBRQpwKgtdMeT9HRrhufr99nOB5qZUbAO4UdjqTNUlmToYRb1FEOJ
	 bFEVwdbycD9gTjCC65kwaO1hlCgx6vQIZ1tydNTr7fyNvmxMVSNyqe3q6wmgBP1G4J
	 ZJ5FBa+9XrksQd08mCK744G6Z7E4no0XlslyZGpw7FTF0v3eP+KgltnZk1Xa+kyZ4f
	 UkDN+BbAUnBcSEkbQEgMX+HbTvLOxadzZWvte3CdKFahkoFY0oAonEFMA4bIVJP8/d
	 UtP0DI8OPA0QFM55xCWBSNwhczo+DAg5CPvdbOANlJtxPHxCI0Xju3JzXkYpwJ00uF
	 5XlhuI2weiZvQ==
Date: Wed, 6 Jan 2021 12:55:37 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Julien Grall <julien@xen.org>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    =?UTF-8?Q?Andr=C3=A9_Przywara?= <andre.przywara@arm.com>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>
Subject: Re: Smoke test failure on Arm (was Re: [PATCH v4 0/8] xen/arm:
 Emulate ID registers)
In-Reply-To: <db69c99b-d7b5-fe10-b24b-2a673c7b9e28@xen.org>
Message-ID: <alpine.DEB.2.21.2101061235160.7075@sstabellini-ThinkPad-T480s>
References: <cover.1608214355.git.bertrand.marquis@arm.com> <ea8e117c-26c0-5c94-e06a-12027d25d7d6@xen.org> <338ef917-4b67-d839-82e4-164bbf46f85e@arm.com> <alpine.DEB.2.21.2101051042230.4307@sstabellini-ThinkPad-T480s> <7942af32-6bae-36c4-e1ee-dd3edc85097a@xen.org>
 <alpine.DEB.2.21.2101051425360.4307@sstabellini-ThinkPad-T480s> <db69c99b-d7b5-fe10-b24b-2a673c7b9e28@xen.org>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1608129811-1609966081=:7075"
Content-ID: <alpine.DEB.2.21.2101061248060.7075@sstabellini-ThinkPad-T480s>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1608129811-1609966081=:7075
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2101061248061.7075@sstabellini-ThinkPad-T480s>

On Wed, 6 Jan 2021, Julien Grall wrote:
> On 05/01/2021 22:43, Stefano Stabellini wrote:
> > On Tue, 5 Jan 2021, Julien Grall wrote:
> > > Hi Stefano,
> > > 
> > > On 05/01/2021 18:44, Stefano Stabellini wrote:
> > > > On Tue, 5 Jan 2021, André Przywara wrote:
> > > > > On 05/01/2021 16:06, Julien Grall wrote:
> > > > > > (+ Ian and Andre)
> > > > > > 
> > > > > > Hi Bertrand,
> > > > > > 
> > > > > > On IRC, Ian pointed out that the smoke test was failing on
> > > > > > Cubietruck.
> > > > > > The only patches because the last success and the failure are your
> > > > > > series.
> > > > > > 
> > > > > > This seems to be a very early failure as there is no output from Xen
> > > > > > [1].
> > > > > > 
> > > > > > I originally thought the problem was because some of the ID
> > > > > > registers
> > > > > > (such as ID_PFR2) introduced in patch #2 doesn't exist in Armv7.
> > > > > > 
> > > > > > But per B7.2.1 in ARM DDI 0406C.d, unallocated ID registers should
> > > > > > be
> > > > > > RAZ. So it would result to a crash. Andre confirmed that PFR2 can be
> > > > > > accessed by writing a small baremetal code and booted on Cortex-A7
> > > > > > and
> > > > > > Cortex-A20.
> > > > > > 
> > > > > > So I am not entirely sure what's the problem. Andre kindly accepted
> > > > > > to
> > > > > > try to boot Xen on his board. Hopefully, this will give us a clue on
> > > > > > the
> > > > > > problem.
> > > > > > 
> > > > > > If not, I will borrow a Cubietruck in OssTest and see if I can
> > > > > > reproduce
> > > > > > it and debug it.
> > > > > 
> > > > > 
> > > > > So I just compiled master and staging and ran just that on an
> > > > > Allwinner
> > > > > H3 (Cortex-A7 r0p5). Master boots fine (till it complains about the
> > > > > missing Dom0, as expected). However staging indeed fails:
> > > > > 
> > > > > (XEN) Xen version 4.15-unstable (andprz01@slackpad.lan)
> > > > > (arm-slackware-linux-gnueabihf-gcc (GCC) 8.2.0) debug=y  Tue Jan  5
> > > > > 16:09:40 GMT 2021
> > > > > (XEN) Latest ChangeSet: Sun Nov 8 15:59:42 2020 +0100 git:c992efd06a
> > > > > (XEN) build-id: 85d361b8565b90d4e0defe2beb2419e191fd76b4
> > > > > (XEN) CPU0: Unexpected Trap: Undefined Instruction
> > > > > (XEN) ----[ Xen-4.15-unstable  arm32  debug=y   Not tainted ]----
> > > > > (XEN) CPU:    0
> > > > > (XEN) PC:     0026b8c8 identify_cpu+0xc0/0xd4
> > > > > (XEN) CPSR:   600001da MODE:Hypervisor
> > > > > (XEN)      R0: 002acb20 R1: 00000000 R2: 00000000 R3: 11111111
> > > > > (XEN)      R4: 002acb1c R5: 002acb20 R6: 4e000000 R7: 00000000
> > > > > (XEN)      R8: 00000002 R9: 002d8200 R10:00008000 R11:002f7e6c
> > > > > R12:00000080
> > > > > (XEN) HYP: SP: 002f7e68 LR: 002c419c
> > > > > (XEN)
> > > > > (XEN)   VTCR_EL2: 80002646
> > > > > (XEN)  VTTBR_EL2: 00000018e628bb80
> > > > > (XEN)
> > > > > (XEN)  SCTLR_EL2: 30cd187f
> > > > > (XEN)    HCR_EL2: 00000038
> > > > > (XEN)  TTBR0_EL2: 000000004013a000
> > > > > (XEN)
> > > > > (XEN)    ESR_EL2: 00000000
> > > > > (XEN)  HPFAR_EL2: 0003fff0
> > > > > (XEN)      HDFAR: 9d110000
> > > > > (XEN)      HIFAR: 0000a04a
> > > > > (XEN)
> > > > > (XEN) Xen stack trace from sp=002f7e68:
> > > > > (XEN)    00000000 002f7f54 00008000 00000000 00002000 002a4584
> > > > > 00000000
> > > > > 00000000
> > > > > (XEN)    00000000 00008000 49ff5000 002d81f0 40000000 00000000
> > > > > 00002000
> > > > > 00000001
> > > > > (XEN)    00000000 50000000 49ffd000 00000000 50000000 00000000
> > > > > 00000000
> > > > > 50000000
> > > > > (XEN)    4c000000 00000000 4e000000 00000000 ffffffff ffffffff
> > > > > 50000000
> > > > > 00000000
> > > > > (XEN)    50000000 00000000 50000000 00000000 00000000 00000000
> > > > > 00000000
> > > > > 00000000
> > > > > (XEN)    00000000 00000003 00000000 00000000 ffffffff 00000040
> > > > > ffffffff
> > > > > 00000000
> > > > > (XEN)    00000000 00000000 00000000 002a7000 40008050 0000001a
> > > > > 00000000
> > > > > 49ff5000
> > > > > (XEN)    40008000 3fe08000 00000004 0020006c 00000000 00000000
> > > > > 00000000
> > > > > 00000000
> > > > > (XEN)    00000000 00000000 00000000 00000000 00000000 00000000
> > > > > 00000000
> > > > > 00000000
> > > > > (XEN)    00000000 00000000 00000000 00000000 00000000 00000000
> > > > > 00000000
> > > > > 00000000
> > > > > (XEN)    00000000 00000000 00000000 00000000 00000000 00000000
> > > > > 00000000
> > > > > 00000000
> > > > > (XEN)    00000000 00000000 00000000 00000000 00000000 00000000
> > > > > 00000000
> > > > > 00000000
> > > > > (XEN)    00000000 00000000 00000000 00000000 00000000 00000000
> > > > > (XEN) Xen call trace:
> > > > > (XEN)    [<0026b8c8>] identify_cpu+0xc0/0xd4 (PC)
> > > > > (XEN)    [<002c419c>] start_xen+0x778/0xe50 (LR)
> > > > > (XEN)    [<002f7f54>] 002f7f54
> > > > > (XEN)
> > > > > (XEN)
> > > > > (XEN) ****************************************
> > > > > (XEN) Panic on CPU 0:
> > > > > (XEN) CPU0: Unexpected Trap: Undefined Instruction
> > > > > (XEN) ****************************************
> > > > > (XEN)
> > > > > (XEN) Reboot in five seconds...
> > > > > 
> > > > > 
> > > > > The code in question:
> > > > >     26b8c0:       eef63a10        vmrs    r3, mvfr1
> > > > >     26b8c4:       e5803058        str     r3, [r0, #88]   ; 0x58
> > > > > > 26b8c8:       eef53a10        vmrs    r3, mvfr2
> > > > >     26b8cc:       e580305c        str     r3, [r0, #92]   ; 0x5c
> > > > >     26b8d0:       e28bd000        add     sp, fp, #0
> > > > >     26b8d4:       e49db004        pop     {fp}       ; (ldr fp, [sp],
> > > > > #4)
> > > > >     26b8d8:       e12fff1e        bx      lr
> > > > > 
> > > > > And indeed MVFR2 is not mentioned in the ARMv7 ARM, and in contrast to
> > > > > the CP15 CPUID registers this is using the VMRS instruction, so it's
> > > > > not
> > > > > protected by future-proof CPUID register scheme.
> > > > > 
> > > > > Not sure what to do about this, maybe #ifdef'ing this register access
> > > > > with arm64?
> > > > > I guess this comes from the slightly too optimistic code-sharing
> > > > > between
> > > > > arm32 and arm64?
> > > > 
> > > > Yes and #ifdef'ing is what we have been doing with the other registers.
> > > 
> > > There is a catch here. This register is accessible from AArch32 on all
> > > Armv8
> > > HW. It is just not accessible on Armv7.
> > > 
> > > So hiding the MVFR2 behind #ifdef CONFIG_ARM_64 is technically not
> > > correct.
> > > 
> > > I know that we said that we don't officially support Xen on Arm32 on Armv8
> > > HW
> > > (I can't find where it is written though). So we could argue that
> > > shadowing
> > > MVFR2 is not worth it.
> > > 
> > > I do use Armv8 HW to test 32-bit, so I would at least like to get Xen
> > > booting.
> > 
> > Yep, me too.
> > 
> > 
> > > In addition to that, Linux 32-bit doesn't access MVFR2 at the moment.
> > > 
> > > Therefore, a #ifdef may be acceptable for now. However, I would suggest to
> > > introduce name it MAY_BE_UNDEFINED (or similar) that will be used to avoid
> > > reading the system register on 32-bit.
> > > 
> > > For the 32-bit case, I would just hardcode the value based on the Arm (it
> > > looks like for Armv8-A there is only one valid value).
> > > 
> > > IOW, the hack would be self-contained in cpufeature.c.
> > 
> > I think it makes sense that the hack should be self-contained in
> > cpufeature.c, leaving the definition of struct mvfr to 3 register_t also
> > on arm32 as it is today. Also leaving vcpreg.c as it is today so that a
> > guest can try to read mvfr2 without crashing thanks to
> > GENERATE_TID3_INFO(MVFR2, mvfr, 2).
> > 
> > For the arm32 case in cpufeature.c:identify_cpu, the two permitted
> > values are 0 and 0b0100, which one did you have in mind? I take you
> > meant 0 which stands for "not implemented, or no support for
> > miscellaneous features"?
> 
> It looks like I misread the spec. :/ I thought it would only be a single
> possible value.
> 
> Hmmm... I am not sure about the value here as I don't know what would be the
> impact.
> 
> It might be better to detect whether we are running on Armv8 HW or Armv7 HW. I
> haven't figured out an obvious way for that yet.
> 
> On IRC, Andre suggested a couple of options on IRC
> 
>  1) read ISAR5: This doesn't  seem to work as it is UNK on Armv7
>  2) detect the VFP subarchitecture: It is not clear how this can be leveraged
> 
> While skimming through the spec, I noticed that ID_DFR0.CopDbg requires a
> specific value for Armv8.x spec. This is the debug architecture, but maybe we
> can leverage it?
> 
> Any better ideas?

One thing to note is that if Xen has difficulties in distinguishing
between armv7 and armv8/aarch32 a guest will have the same issue. Given
that mvfr2 is not available on armv7, how can a guest safely attempt to
read it?

If somehow the guest figures out that it is running on armv8/aarch32,
then it could read mvfr2, but we could return "not implemented" in that
case, right? In other words, part of me thinks that maybe we are
overcomplicating this, especially because we don't officially support
Xen on armv8/aarch32 as you wrote (we need to update SUPPORT.md).

So I would be tempted to only do the following:

- read mvfr2 on arm64
- never read mvfr2 on aarch32 (no matter armv7 or armv8)
- keep c->mvfr.bits[2] as zero on armv7 and armv8/aarch32 so that if the
  guest attempts to read it, it won't crash but simply return zero


The most important things in regards to armv8/aarch32 are:

- be able to boot Xen armv8/aarch32 for our own arm32 testing of Xen
- be able to boot an armv7 and armv8/aarch32 guest on Xen armv8/aarch64

Both these things should work correctly with the simple approach above.


Your idea of trying to figure out if we are running on armv8/aarch32 via
ID_DFR0.CopDbg is clever but I think it is a bit overkill for a mode of
execution that we don't support. I don't think is worth the effort.

But if you think differently, I can invest some time in investigating
this further, following your line of thought on finding a register to
detect the mode of execution. (However I don't have any hardware to test
this anymore.) Otherwise, if you agree that the simpler approach is
sufficient, then I'll send a patch as described above.
--8323329-1608129811-1609966081=:7075--

