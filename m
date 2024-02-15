Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 873F48558F0
	for <lists+xen-devel@lfdr.de>; Thu, 15 Feb 2024 03:21:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.681216.1059851 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raRLv-0004oI-9u; Thu, 15 Feb 2024 02:19:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 681216.1059851; Thu, 15 Feb 2024 02:19:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1raRLv-0004lp-77; Thu, 15 Feb 2024 02:19:55 +0000
Received: by outflank-mailman (input) for mailman id 681216;
 Thu, 15 Feb 2024 02:19:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+jew=JY=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1raRLt-0004lj-2w
 for xen-devel@lists.xenproject.org; Thu, 15 Feb 2024 02:19:53 +0000
Received: from wfout7-smtp.messagingengine.com
 (wfout7-smtp.messagingengine.com [64.147.123.150])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b09a6bbe-cba8-11ee-98f5-efadbce2ee36;
 Thu, 15 Feb 2024 03:19:48 +0100 (CET)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailfout.west.internal (Postfix) with ESMTP id 6A0E81C0007E;
 Wed, 14 Feb 2024 21:19:45 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 14 Feb 2024 21:19:46 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 14 Feb 2024 21:19:43 -0500 (EST)
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
X-Inumbo-ID: b09a6bbe-cba8-11ee-98f5-efadbce2ee36
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1707963584;
	 x=1708049984; bh=06HGHn4qudP95v7fKy2/rJ9whPfa1kXdI0kdXfazAos=; b=
	KMU4j/Gc3lvPxbPvT56BKfJegMpwLNfhYum+q+OSc3o03xAq1nv+1uANTvfgl2eI
	959NpA7kfIjU9xi/FNrJj+62DbRn4RmPyLpIV2J+H0+YXmyANZoALrk1uSQtsJLP
	+LRhi2TobcHffhKDYWhJ/eh49Yesx1HhwMT5NdmTnB+XJH3MuR9LhjL687YVii8u
	O5LKvX3N79H/gN2cxc2oUHppkgW/cBRbdzMC1Fdij1+h7lANDpi6DCJkNPPQBx32
	g8OG957UiKxcK+d/Yg7gkhnFtaJvPlLe4uVxowUUTrOGVkZ/fGJveBViikgIMmcD
	NK9h7HVBGrnx8SeazIP/VA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1707963584; x=1708049984; bh=06HGHn4qudP95v7fKy2/rJ9whPfa
	1kXdI0kdXfazAos=; b=j3bGFNF3/NY2umt82z1K86+QpCdS+Yn3EtXigbqjT4DD
	3c/rOwJu3BQ9YIDzCaz6RwhHQfA6paBEKNXvX34rckkhmn/LQFVHBeWAVHjnjTU+
	VgsH9J3LXSp5dQv8g6nGRAxzWPvEtgld2UTfbn0ky8Bs4KxVOtjYSx2zSo2ony41
	KB4GSPVttWxwv77GDm2+pVb+jb+VXVEd2gIfWCgkqD/hVE8jXEZgT/mD3mo55bCN
	GunA5fVs8uLUCrXjePEc4JlBtPMBwrrT11RdfGw3NriTEl0WSI5fS9FnAzBcDYrk
	ilcK6P5mWGZtc7evIbmaT/Rl+gAdw/BAkgQmaqmLmw==
X-ME-Sender: <xms:wHTNZW-BwOeR_hTCn5LNHyVyFVpAUbJjiQOvXyewS9MgonvOc_D_JQ>
    <xme:wHTNZWvyin0j6HZkRLBufKYgsj5NEM8x_ttLzmGqA7w0QcKg56HR4DaVD1udR9Sp5
    VKPaDUCAguPjQ>
X-ME-Received: <xmr:wHTNZcCx-YVMHH1-9eS3rorTPOLUn8c8GL5zL_gD8FVTNqkVXKOWRduGNuf93xeV62khK4hg55xgKhlauWLQhi-IUTu7af9lZQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudekgdegfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihcuoehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthh
    hinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeeihfelhfekhefgveejjeet
    vedtgfduveelgeekteehueeufeefudegveejueefhfenucffohhmrghinhepghhithhhuh
    gsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
    mhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:wHTNZeea5gKxh_42nSv0JFfY-qXbRtZ18TANY2oqtl0UjJ4pf__K-Q>
    <xmx:wHTNZbNCk8aNY41ub-vOoODjHV0XJEdaG7fuj2X3GSqLzEl68HMlkw>
    <xmx:wHTNZYnUihLP8ZTcyTuJlVYt51oDfZ6sjRLtzwr9K9TYj6QoPz7w1w>
    <xmx:wHTNZXAgnUqUuFowZvi-1UIQIn8-ndt6A0LC5q3d_fPrsrO2wO4CpdcHvwI>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 15 Feb 2024 03:19:40 +0100
From: Marek Marczykowski <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 1/8] serial: fake IRQ-regs context in poll handlers
Message-ID: <Zc10vFQtG40isDHK@mail-itl>
References: <ebc330a9-eafa-4858-b5cf-5694c4da911d@suse.com>
 <893be03d-22cc-4b8c-8a54-6479961c5aa2@suse.com>
 <b591cd2a-2b49-436e-9cf7-788d9064a778@xen.org>
 <4530606b-1b5e-47a4-aa41-e12e9178b06d@suse.com>
 <ZcrlcuNU9y8WymiK@mail-itl>
 <817ceec4-ed12-4360-a6ce-f87732f62251@suse.com>
 <ZcuCTnMpFib4ArHW@mail-itl>
 <b52fa3fa-4e33-4211-af18-f00aaa0b365b@suse.com>
 <ZcuGo_vQhiTAQep0@mail-itl>
 <23bcd506-f843-42f7-a541-0d8db7c319ab@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="PMzvEAhlaWIXeocq"
Content-Disposition: inline
In-Reply-To: <23bcd506-f843-42f7-a541-0d8db7c319ab@suse.com>


--PMzvEAhlaWIXeocq
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Feb 2024 03:19:40 +0100
From: Marek Marczykowski <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <julien@xen.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v3 1/8] serial: fake IRQ-regs context in poll handlers

On Tue, Feb 13, 2024 at 04:44:04PM +0100, Jan Beulich wrote:
> On 13.02.2024 16:11, Marek Marczykowski wrote:
> > On Tue, Feb 13, 2024 at 04:00:32PM +0100, Jan Beulich wrote:
> >> On 13.02.2024 15:53, Marek Marczykowski wrote:
> >>> On Tue, Feb 13, 2024 at 08:45:54AM +0100, Jan Beulich wrote:
> >>>> On 13.02.2024 04:43, Marek Marczykowski wrote:
> >>>>> On Mon, Feb 12, 2024 at 10:04:38AM +0100, Jan Beulich wrote:
> >>>>>> On 08.02.2024 23:00, Julien Grall wrote:
> >>>>>>> On 05/02/2024 13:27, Jan Beulich wrote:
> >>>>>>>> In preparation of dropping the register parameters from
> >>>>>>>> serial_[rt]x_interrupt() and in turn from IRQ handler functions,
> >>>>>>>> register state needs making available another way for the few key
> >>>>>>>> handlers which need it. Fake IRQ-like state.
> >>>>>>>>
> >>>>>>>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >>>>>>>> ---
> >>>>>>>> The use of guest_cpu_user_regs() in dbc_uart_poll() is inconsist=
ent with
> >>>>>>>> other console poll functions we have, and it's unclear whether t=
hat's
> >>>>>>>> actually generally correct.
> >>>>>>>
> >>>>>>> Is it? Looking at ns16550_poll() we would pass guest_user_regs() =
if=20
> >>>>>>> run_in_exception() doesn't exist. But looking at the caller, no-o=
n seems=20
> >>>>>>> to care about the 'regs'. So is this just a latent bug?
> >>>>>>
> >>>>>> What do you mean by "doesn't exist"? ns16550_poll() assumes it exi=
sts.
> >>>>>> And I can spot any use of guest_user_regs() on the respective gene=
ric
> >>>>>> or Arm-specific bug.c paths.
> >>>>>>
> >>>>>>> BTW, do you have an idea why the poll function is not run in an=
=20
> >>>>>>> exception handler?
> >>>>>>
> >>>>>> "The poll function" being which one? If you mean the one in xhci-d=
bc.c
> >>>>>> then that's why I had Cc-ed Marek. Moving him to To: - maybe that
> >>>>>> manages to finally catch his attention.
> >>>>>
> >>>>> TBH, I don't know. That's part of the original xue patch at
> >>>>> https://github.com/connojd/xue/blob/master/patches/xen-xue-dbgp.pat=
ch
> >>>>> and it works for me as it is.
> >>>>
> >>>> "Works" meaning what? Doesn't crash on you? Or does also provide
> >>>> sensible output in _all_ cases (i.e. including when e.g. the poll
> >>>> happens to run on an idle vCPU)?
> >>>
> >>> Generally provides sensible output, for example during boot (it is us=
ing
> >>> idle vCPU then, right?).
> >>
> >> Before Dom0 is started: Yes. With the exception of the phase where PV
> >> Dom0's page tables are constructed, albeit in that time window
> >> guest_cpu_user_regs() shouldn't yield sensible data either. I can only
> >> say I'm surprised; since I have no way to properly test with an XHCI
> >> debug port, I'd have to see about faking something to convince myself
> >> (unless you were to supply example output).
> >=20
> > Would you like me to test this series with xhci console?
>=20
> The behavior shouldn't really be connected to this series. But yes, 'd'
> debug key output (just the part for the CPU the key handling was
> actually invoked from) with the xhci debug console would be of
> interest, for the case where that CPU at that time runs an idle vCPU.

I managed to press 'd' before dom0 started. Full output at
https://gist.github.com/marmarek/a495cd666f4aafed3a5cfcb8393f515b (it's
Alder Lake, and smt=3Doff, so CPU numbering is weird).
Interestingly, I do _not_ see output for CPU0, where I'd expect the
key handler to run... I see all the idle ones, plus one doing memory
scrubbing.
But also, I don't see info about the handling CPU when doing `xl
debug-key d`. At one time, with `xl debug-key d` I got this:

(XEN) *** Dumping CPU6 guest state (d0v7): ***
(XEN) ----[ Xen-4.18-unstable  x86_64  debug=3Dy  Tainted:  M     ]----
(XEN) CPU:    6
(XEN) RIP:    e033:[<ffffffff81e1546a>]
(XEN) RFLAGS: 0000000000000286   EM: 0   CONTEXT: pv guest (d0v7)
(XEN) rax: 0000000000000023   rbx: 0000000000000005   rcx: ffffffff81e1546a
(XEN) rdx: 0000000000000000   rsi: 0000000000000000   rdi: 000079147611e010
(XEN) rbp: ffff88810db53200   rsp: ffffc90041c6bde0   r8:  0000000000000000
(XEN) r9:  0000000000000000   r10: 0000000000000000   r11: 0000000000000286
(XEN) r12: 0000000000305000   r13: 00007ffc61097f40   r14: ffff88810db53200
(XEN) r15: 0000000000000000   cr0: 0000000080050033   cr4: 0000000000b526e0
(XEN) cr3: 00000004ae2a7000   cr2: 00000000006d3118
(XEN) fsb: 0000791475b8a380   gsb: ffff8881897c0000   gss: 0000000000000000
(XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: e02b   cs: e033
(XEN) Guest stack trace from rsp=3Dffffc90041c6bde0:
(XEN)    0000000000000001 0000000000000000 ffffffffc02905a6 0000000000000023
(XEN)    000079147611e010 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 8064129fc747f100 ffffffffc0291568 0000000000305000
(XEN)    8064129fc747f100 0000000000000005 ffffffff813f7d4d ffffc90041c6bf58
(XEN)    ffffc90041c6bf48 0000000000000000 0000000000000000 0000000000000000
(XEN)    ffffffff81e16158 00000000006d3118 ffffc90041c6bf58 0000000000000040
(XEN)    ffffffff8132f6bb 0000000000000006 ffffc90041c6bf58 00000000006d3118
(XEN)    0000000000000255 ffff888102cf8880 ffff888102cf88f0 ffffffff8108746f
(XEN)    0000000000000000 0000000000000002 ffffc90041c6bf58 ffffc90041c6bf58
(XEN)    00000000006d3118 0000000000000000 0000000000000006 0000000000000000
(XEN)    0000000000000000 ffffffff81e1a975 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 ffffffff8200009b 000000000043d9b0
(XEN)    000000000043d990 00007ffc61097f90 00007ffc61097fc0 00007ffc61099d16
(XEN)    00000000006cab40 0000000000000246 0000000000000001 0000000000000000
(XEN)    0000000000000006 ffffffffffffffda 0000791475f1ed6f 00007ffc61097f40
(XEN)    0000000000305000 0000000000000005 0000000000000010 0000791475f1ed6f
(XEN)    0000000000000033 0000000000000246 00007ffc61097ed0 000000000000002b
(XEN)     Fault while accessing guest memory.
(XEN)=20
(XEN) *** Dumping CPU0 host state: ***
(XEN) ----[ Xen-4.18-unstable  x86_64  debug=3Dy  Tainted:  M     ]----
(XEN) CPU:    0
(XEN) RIP:    e008:[<ffff82d04022c07e>] _spin_unlock_irqrestore+0x21/0x27
(XEN) RFLAGS: 0000000000000206   CONTEXT: hypervisor
(XEN) rax: ffff82d0405c1038   rbx: 0000000000000200   rcx: 0000000000000008
(XEN) rdx: ffff830856d07fff   rsi: ffff8308529d5b28   rdi: ffff8308529d5b20
(XEN) rbp: ffff830856d07dc8   rsp: ffff830856d07dc0   r8:  0000000000000001
(XEN) r9:  ffff8308529d5b20   r10: ffff82d0405c13a0   r11: 000000d091e62221
(XEN) r12: ffff82d040476898   r13: 0000000000000296   r14: ffff82d040476918
(XEN) r15: ffff82cffff04700   cr0: 0000000080050033   cr4: 0000000000b526e0
(XEN) cr3: 000000082e7ff000   cr2: ffff888109538618
(XEN) fsb: 0000000000000000   gsb: ffff888189600000   gss: 0000000000000000
(XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: e010   cs: e008
(XEN) Xen code around <ffff82d04022c07e> (_spin_unlock_irqrestore+0x21/0x27=
):
(XEN)  fd ff ff 48 09 1c 24 9d <48> 8b 5d f8 c9 c3 0f b7 47 04 66 25 ff 0f =
66 3d
(XEN) Xen stack trace from rsp=3Dffff830856d07dc0:
(XEN)    ffff82d0405d0c80 ffff830856d07e08 ffff82d040257c3f 0000000040476898
(XEN)    ffff82d0405c1280 ffff82d040257bca ffff82d040476898 000000d0911fcbc4
(XEN)    0000000000000000 ffff830856d07e30 ffff82d04022d55c ffff82d0405c1280
(XEN)    ffff8308529d5f00 ffff82d0405d0d68 ffff830856d07e70 ffff82d04022de59
(XEN)    ffff830856d07ef8 ffff82d0405c7f00 ffffffffffffffff ffff82d0405c7f00
(XEN)    ffff830856d07fff 0000000000000000 ffff830856d07ea8 ffff82d04022b53e
(XEN)    0000000000000000 0000000000007fff ffff82d0405c7f00 ffff82d0405c11d0
(XEN)    ffff82d0405db2a0 ffff830856d07eb8 ffff82d04022b5d1 ffff830856d07ef0
(XEN)    ffff82d0402fcd15 ffff82d0402fcc88 ffff8308528cb000 ffff830856d07ef8
(XEN)    ffff830856ce2000 0000000000000000 ffff830856d07e18 0000000000000000
(XEN)    0000000000000000 0000000000000000 0000000000000000 ffffffff82c1aa40
(XEN)    0000000000000000 0000000000000246 0000000000007ff0 0000000000000000
(XEN)    000000000fd109eb 0000000000000000 ffffffff81e153aa 4000000000000000
(XEN)    deadbeefdeadf00d deadbeefdeadf00d 0000010000000000 ffffffff81e153aa
(XEN)    000000000000e033 0000000000000246 ffffffff82c03dd0 000000000000e02b
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000e01000000000 ffff830856ce1000 0000000000000000 0000000000b526e0
(XEN)    0000000000000000 0000000000000000 0006030300000000 0000000000000000
(XEN) Xen call trace:
(XEN)    [<ffff82d04022c07e>] R _spin_unlock_irqrestore+0x21/0x27
(XEN)    [<ffff82d040257c3f>] F xhci-dbc.c#dbc_uart_poll+0x75/0x17c
(XEN)    [<ffff82d04022d55c>] F timer.c#execute_timer+0x45/0x5c
(XEN)    [<ffff82d04022de59>] F timer.c#timer_softirq_action+0x71/0x275
(XEN)    [<ffff82d04022b53e>] F softirq.c#__do_softirq+0x94/0xbe
(XEN)    [<ffff82d04022b5d1>] F do_softirq+0x13/0x15
(XEN)    [<ffff82d0402fcd15>] F domain.c#idle_loop+0x8d/0xe6

(other CPUs in mwait-idle)

> > Or maybe add
> > some extra debug prints and include their output? But note, printk from
> > inside console code generally leads to deadlocks. What I did for some
> > debugging was to log into some separate buffer and dump it later.
>=20
> Right, this would be more involved.
>=20
> Jan

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--PMzvEAhlaWIXeocq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmXNdLwACgkQ24/THMrX
1yxqlgf+NOQt0926sb4bVt3vGsTb1ua6SF6ggpCt1mqSjifDwDpKQslyOtL5sWCv
y2LkaiqiSj+iLHRnyt/9XR9l/NKwe83o7nNd1p3Z/2x0EpaIwdWJkC04Oc3/YXup
GRqgHOiOoG+eJQqRQnLsu+6+Z8KckINvYt14RycdwpqUBhY+nn+Jm/sl8hJ44QdP
grW2rYoyxMh1WIzs5d90FEVAKsUIUMp1OuWykKMcGWPewxg6lq10zItryhXQiu3f
mei1wRfbjjb4oME7jc8tB8rs8DOU2/iYQ32WjcioAiayb0FoPLgse8uQYPSm5Pys
Ew0zoWYRcql1wO3ACqPtl7Qcc+BDdQ==
=1IKe
-----END PGP SIGNATURE-----

--PMzvEAhlaWIXeocq--

