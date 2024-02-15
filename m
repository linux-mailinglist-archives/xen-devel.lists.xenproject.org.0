Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A39548560E7
	for <lists+xen-devel@lfdr.de>; Thu, 15 Feb 2024 12:09:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.681596.1060447 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raZbi-0004cD-S7; Thu, 15 Feb 2024 11:08:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 681596.1060447; Thu, 15 Feb 2024 11:08:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raZbi-0004Z5-P4; Thu, 15 Feb 2024 11:08:46 +0000
Received: by outflank-mailman (input) for mailman id 681596;
 Thu, 15 Feb 2024 11:08:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+jew=JY=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1raZbg-0004Yy-Fb
 for xen-devel@lists.xenproject.org; Thu, 15 Feb 2024 11:08:44 +0000
Received: from fhigh2-smtp.messagingengine.com
 (fhigh2-smtp.messagingengine.com [103.168.172.153])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 93062b4a-cbf2-11ee-98f5-efadbce2ee36;
 Thu, 15 Feb 2024 12:08:41 +0100 (CET)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.48])
 by mailfhigh.nyi.internal (Postfix) with ESMTP id E638911400ED;
 Thu, 15 Feb 2024 06:08:39 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Thu, 15 Feb 2024 06:08:39 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 15 Feb 2024 06:08:38 -0500 (EST)
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
X-Inumbo-ID: 93062b4a-cbf2-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1707995319;
	 x=1708081719; bh=X1VMQlH+2KYLHk9ISCkEh8Nsox2VLqcKIH1L8SnH2Yk=; b=
	hp2EvROFT2jjGsfS0PlMIovxx2+MbM8cPNJPy3vieKcBqFyX2pMjXtcdGHDxAZEx
	3UJZFqSqT0VDapDHxBIcuDGp9nGfqAdY9KolHSDx4FjQdrj1NCegSMCbOMpS7+OS
	ibLuuc0u4PT9sVbgjPGgJEqa7zyAZZCeb2HLku13Fx3CLfKbcTroYdRQkLtZ74U+
	g9z6QzGBboWVfF08a2sv8CUb8wIGtdnCdK6Dy+KkKP1UkmzE2//vDyaYtLIWFagw
	suTFReg9nyjJSpumU0O/nhbYICzBiXzuyeNsbNgOkD5Kp6TaAsVaLLXK7BLmTSBa
	e9sRA6LncMvAHdmqd0eIMA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1707995319; x=1708081719; bh=X1VMQlH+2KYLHk9ISCkEh8Nsox2V
	LqcKIH1L8SnH2Yk=; b=e2/g24Um89kE2DWAC0RbaLFIBCNe1nADSXmvs4Qa8ouW
	xKG6QeEfDxn6VAu06+9iWskjrfxgpYwzw1zjmXdkRZ9AV5GoaJmH8Ya6p8J7ldQJ
	pioAjN5yAlAdoaJ1FdKt7XmQYJXOMWJN3Jn8Ks8+rtD2ndbn0jaFLXZuoIwXy4vK
	mY1joe4hccNugQKYKC0xcp93MMTWSVbFIw7B5dAWiTPwl2LrxZU5u9BEPTK3mLXg
	9hfR5yetFV3mLGAS3drR4LnrTrbk8a793vAaeHz8Fw73aCkR3y5a/XUaTedS/QyV
	/lDwfCIb1lr9IUX4n714KYNa2fQYLKiK77S3YUlSWg==
X-ME-Sender: <xms:t_DNZfy132ZxK4b0xEJjuFxyrEX9Z9hWf1YTaIsBkr5RchFDkB6yxQ>
    <xme:t_DNZXQAB1-uwP7X3bjyI6Cb_uWPLzVPZoxhPMx9DxxRHlw_mUI1HQr8Oyc1gVZqY
    -mhO-Q9xI1tLg>
X-ME-Received: <xmr:t_DNZZXBs7rtmK-RVRRQkGOQBIfW5iJLqimwCnAltygt9vlccH-dlWdgY27YvPqo7oBTYkSiyNS4ruelQpfMlKgDGwz7zvNXbg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvddtgddvhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihcuoehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthh
    hinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeeihfelhfekhefgveejjeet
    vedtgfduveelgeekteehueeufeefudegveejueefhfenucffohhmrghinhepghhithhhuh
    gsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
    mhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:t_DNZZi2tO4g156Tf37OTFXSb4Tp9lZxMi_5ZYdsMZjABAH7eak_zQ>
    <xmx:t_DNZRATYl_KVOBsll2fHc48Y9fWNehGDVUbU1fcGxA7xgS9OwRADA>
    <xmx:t_DNZSIaia2xphcgqOWdlcojRwpOqebsyAYWcXPfuzaqBzXbUCUbFg>
    <xmx:t_DNZT2S1n8agJ0aYZVq11tlyM_wNuQ6CJ7HBeijvB8L1Gh17Z0h5w>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 15 Feb 2024 12:08:34 +0100
From: Marek Marczykowski <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 1/8] serial: fake IRQ-regs context in poll handlers
Message-ID: <Zc3wsijDk7J7QgF6@mail-itl>
References: <b591cd2a-2b49-436e-9cf7-788d9064a778@xen.org>
 <4530606b-1b5e-47a4-aa41-e12e9178b06d@suse.com>
 <ZcrlcuNU9y8WymiK@mail-itl>
 <817ceec4-ed12-4360-a6ce-f87732f62251@suse.com>
 <ZcuCTnMpFib4ArHW@mail-itl>
 <b52fa3fa-4e33-4211-af18-f00aaa0b365b@suse.com>
 <ZcuGo_vQhiTAQep0@mail-itl>
 <23bcd506-f843-42f7-a541-0d8db7c319ab@suse.com>
 <Zc10vFQtG40isDHK@mail-itl>
 <6dbb77a9-0a2d-4eb2-a484-d43d007e4182@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="p4AyXtQcOganAOZU"
Content-Disposition: inline
In-Reply-To: <6dbb77a9-0a2d-4eb2-a484-d43d007e4182@suse.com>


--p4AyXtQcOganAOZU
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Feb 2024 12:08:34 +0100
From: Marek Marczykowski <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 1/8] serial: fake IRQ-regs context in poll handlers

On Thu, Feb 15, 2024 at 09:39:41AM +0100, Jan Beulich wrote:
> On 15.02.2024 03:19, Marek Marczykowski wrote:
> > On Tue, Feb 13, 2024 at 04:44:04PM +0100, Jan Beulich wrote:
> >> On 13.02.2024 16:11, Marek Marczykowski wrote:
> >>> On Tue, Feb 13, 2024 at 04:00:32PM +0100, Jan Beulich wrote:
> >>>> On 13.02.2024 15:53, Marek Marczykowski wrote:
> >>>>> Generally provides sensible output, for example during boot (it is =
using
> >>>>> idle vCPU then, right?).
> >>>>
> >>>> Before Dom0 is started: Yes. With the exception of the phase where PV
> >>>> Dom0's page tables are constructed, albeit in that time window
> >>>> guest_cpu_user_regs() shouldn't yield sensible data either. I can on=
ly
> >>>> say I'm surprised; since I have no way to properly test with an XHCI
> >>>> debug port, I'd have to see about faking something to convince myself
> >>>> (unless you were to supply example output).
> >>>
> >>> Would you like me to test this series with xhci console?
> >>
> >> The behavior shouldn't really be connected to this series. But yes, 'd'
> >> debug key output (just the part for the CPU the key handling was
> >> actually invoked from) with the xhci debug console would be of
> >> interest, for the case where that CPU at that time runs an idle vCPU.
> >=20
> > I managed to press 'd' before dom0 started. Full output at
> > https://gist.github.com/marmarek/a495cd666f4aafed3a5cfcb8393f515b (it's
> > Alder Lake, and smt=3Doff, so CPU numbering is weird).
> > Interestingly, I do _not_ see output for CPU0, where I'd expect the
> > key handler to run... I see all the idle ones, plus one doing memory
> > scrubbing.
>=20
> Which is precisely the problem, just in not exactly the manifestation
> I expected. In dump_execstate() we dump host state only if the
> incoming regs don't indicate guest state. Yet for the idle vCPU they
> (wrongly) do here - see how guest_mode() calculates the delta to what
> guest_cpu_user_regs() returns, i.e. 0 when what guest_cpu_user_regs()
> returned is passed in.
>=20
> Guest state dumping is suppressed for idle vCPU-s. Hence no output
> at all for the CPU where the key processing was actually invoked
> from.
>=20
> > But also, I don't see info about the handling CPU when doing `xl
> > debug-key d`.
>=20
> I'm afraid I'm confused, ...
>=20
> > At one time, with `xl debug-key d` I got this:
> >=20
> > (XEN) *** Dumping CPU6 guest state (d0v7): ***
> > (XEN) ----[ Xen-4.18-unstable  x86_64  debug=3Dy  Tainted:  M     ]----
> > (XEN) CPU:    6
> > (XEN) RIP:    e033:[<ffffffff81e1546a>]
> > (XEN) RFLAGS: 0000000000000286   EM: 0   CONTEXT: pv guest (d0v7)
> > (XEN) rax: 0000000000000023   rbx: 0000000000000005   rcx: ffffffff81e1=
546a
> > (XEN) rdx: 0000000000000000   rsi: 0000000000000000   rdi: 000079147611=
e010
> > (XEN) rbp: ffff88810db53200   rsp: ffffc90041c6bde0   r8:  000000000000=
0000
> > (XEN) r9:  0000000000000000   r10: 0000000000000000   r11: 000000000000=
0286
> > (XEN) r12: 0000000000305000   r13: 00007ffc61097f40   r14: ffff88810db5=
3200
> > (XEN) r15: 0000000000000000   cr0: 0000000080050033   cr4: 0000000000b5=
26e0
> > (XEN) cr3: 00000004ae2a7000   cr2: 00000000006d3118
> > (XEN) fsb: 0000791475b8a380   gsb: ffff8881897c0000   gss: 000000000000=
0000
> > (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: e02b   cs: e033
> > (XEN) Guest stack trace from rsp=3Dffffc90041c6bde0:
> > (XEN)    0000000000000001 0000000000000000 ffffffffc02905a6 00000000000=
00023
> > (XEN)    000079147611e010 0000000000000000 0000000000000000 00000000000=
00000
> > (XEN)    0000000000000000 8064129fc747f100 ffffffffc0291568 00000000003=
05000
> > (XEN)    8064129fc747f100 0000000000000005 ffffffff813f7d4d ffffc90041c=
6bf58
> > (XEN)    ffffc90041c6bf48 0000000000000000 0000000000000000 00000000000=
00000
> > (XEN)    ffffffff81e16158 00000000006d3118 ffffc90041c6bf58 00000000000=
00040
> > (XEN)    ffffffff8132f6bb 0000000000000006 ffffc90041c6bf58 00000000006=
d3118
> > (XEN)    0000000000000255 ffff888102cf8880 ffff888102cf88f0 ffffffff810=
8746f
> > (XEN)    0000000000000000 0000000000000002 ffffc90041c6bf58 ffffc90041c=
6bf58
> > (XEN)    00000000006d3118 0000000000000000 0000000000000006 00000000000=
00000
> > (XEN)    0000000000000000 ffffffff81e1a975 0000000000000000 00000000000=
00000
> > (XEN)    0000000000000000 0000000000000000 ffffffff8200009b 00000000004=
3d9b0
> > (XEN)    000000000043d990 00007ffc61097f90 00007ffc61097fc0 00007ffc610=
99d16
> > (XEN)    00000000006cab40 0000000000000246 0000000000000001 00000000000=
00000
> > (XEN)    0000000000000006 ffffffffffffffda 0000791475f1ed6f 00007ffc610=
97f40
> > (XEN)    0000000000305000 0000000000000005 0000000000000010 0000791475f=
1ed6f
> > (XEN)    0000000000000033 0000000000000246 00007ffc61097ed0 00000000000=
0002b
> > (XEN)     Fault while accessing guest memory.
> > (XEN)=20
> > (XEN) *** Dumping CPU0 host state: ***
> > (XEN) ----[ Xen-4.18-unstable  x86_64  debug=3Dy  Tainted:  M     ]----
> > (XEN) CPU:    0
> > (XEN) RIP:    e008:[<ffff82d04022c07e>] _spin_unlock_irqrestore+0x21/0x=
27
> > (XEN) RFLAGS: 0000000000000206   CONTEXT: hypervisor
> > (XEN) rax: ffff82d0405c1038   rbx: 0000000000000200   rcx: 000000000000=
0008
> > (XEN) rdx: ffff830856d07fff   rsi: ffff8308529d5b28   rdi: ffff8308529d=
5b20
> > (XEN) rbp: ffff830856d07dc8   rsp: ffff830856d07dc0   r8:  000000000000=
0001
> > (XEN) r9:  ffff8308529d5b20   r10: ffff82d0405c13a0   r11: 000000d091e6=
2221
> > (XEN) r12: ffff82d040476898   r13: 0000000000000296   r14: ffff82d04047=
6918
> > (XEN) r15: ffff82cffff04700   cr0: 0000000080050033   cr4: 0000000000b5=
26e0
> > (XEN) cr3: 000000082e7ff000   cr2: ffff888109538618
> > (XEN) fsb: 0000000000000000   gsb: ffff888189600000   gss: 000000000000=
0000
> > (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: e010   cs: e008
> > (XEN) Xen code around <ffff82d04022c07e> (_spin_unlock_irqrestore+0x21/=
0x27):
> > (XEN)  fd ff ff 48 09 1c 24 9d <48> 8b 5d f8 c9 c3 0f b7 47 04 66 25 ff=
 0f 66 3d
> > (XEN) Xen stack trace from rsp=3Dffff830856d07dc0:
> > (XEN)    ffff82d0405d0c80 ffff830856d07e08 ffff82d040257c3f 00000000404=
76898
> > (XEN)    ffff82d0405c1280 ffff82d040257bca ffff82d040476898 000000d0911=
fcbc4
> > (XEN)    0000000000000000 ffff830856d07e30 ffff82d04022d55c ffff82d0405=
c1280
> > (XEN)    ffff8308529d5f00 ffff82d0405d0d68 ffff830856d07e70 ffff82d0402=
2de59
> > (XEN)    ffff830856d07ef8 ffff82d0405c7f00 ffffffffffffffff ffff82d0405=
c7f00
> > (XEN)    ffff830856d07fff 0000000000000000 ffff830856d07ea8 ffff82d0402=
2b53e
> > (XEN)    0000000000000000 0000000000007fff ffff82d0405c7f00 ffff82d0405=
c11d0
> > (XEN)    ffff82d0405db2a0 ffff830856d07eb8 ffff82d04022b5d1 ffff830856d=
07ef0
> > (XEN)    ffff82d0402fcd15 ffff82d0402fcc88 ffff8308528cb000 ffff830856d=
07ef8
> > (XEN)    ffff830856ce2000 0000000000000000 ffff830856d07e18 00000000000=
00000
> > (XEN)    0000000000000000 0000000000000000 0000000000000000 ffffffff82c=
1aa40
> > (XEN)    0000000000000000 0000000000000246 0000000000007ff0 00000000000=
00000
> > (XEN)    000000000fd109eb 0000000000000000 ffffffff81e153aa 40000000000=
00000
> > (XEN)    deadbeefdeadf00d deadbeefdeadf00d 0000010000000000 ffffffff81e=
153aa
> > (XEN)    000000000000e033 0000000000000246 ffffffff82c03dd0 00000000000=
0e02b
> > (XEN)    0000000000000000 0000000000000000 0000000000000000 00000000000=
00000
> > (XEN)    0000e01000000000 ffff830856ce1000 0000000000000000 0000000000b=
526e0
> > (XEN)    0000000000000000 0000000000000000 0006030300000000 00000000000=
00000
> > (XEN) Xen call trace:
> > (XEN)    [<ffff82d04022c07e>] R _spin_unlock_irqrestore+0x21/0x27
> > (XEN)    [<ffff82d040257c3f>] F xhci-dbc.c#dbc_uart_poll+0x75/0x17c
> > (XEN)    [<ffff82d04022d55c>] F timer.c#execute_timer+0x45/0x5c
> > (XEN)    [<ffff82d04022de59>] F timer.c#timer_softirq_action+0x71/0x275
> > (XEN)    [<ffff82d04022b53e>] F softirq.c#__do_softirq+0x94/0xbe
> > (XEN)    [<ffff82d04022b5d1>] F do_softirq+0x13/0x15
> > (XEN)    [<ffff82d0402fcd15>] F domain.c#idle_loop+0x8d/0xe6
>=20
> ... this looks to be the issuing CPU. What I don't understand is why we
> are in _spin_unlock_irqrestore() here, called out of dbc_uart_poll().
>=20
> Btw - was any/all of this with or without the series here applied?

This was without this series applied.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--p4AyXtQcOganAOZU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmXN8LIACgkQ24/THMrX
1yxeBggAjG9IN3wpgsYqfMVkmGRZZEiL9QpHQ71F73vwkTOaBVjJcjqBoFpczGTl
UuH/6LTtKrIPqU5SJBTw8h6RXYoNwQdplrL67VjSN6fg6YGqWRKtORQ7VhTr/liM
maa5Z8tW1SAJUjz3rvY81V6Stz+oPUvw0hsz9htBnawFW7nX4HUjfBSLlnfmJ88S
ZGriX2kSK27upHBGRAw/TAEJu3pnItzF5CbWZLvXz9TpSi9go/9WrS9ckPPyeDpk
47EL+wX6JELFmnt+S4eq3LwOTtMCmf+/s1/tLJtoZhX0hlUw3En+Xglu/Ju1sWAz
o+b7PxqqAcmGT0NJe0EWBmrNfNcb2w==
=vsqu
-----END PGP SIGNATURE-----

--p4AyXtQcOganAOZU--

