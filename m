Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 419D2B9A084
	for <lists+xen-devel@lfdr.de>; Wed, 24 Sep 2025 15:30:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1129404.1469375 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1PZT-000190-Jp; Wed, 24 Sep 2025 13:30:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1129404.1469375; Wed, 24 Sep 2025 13:30:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v1PZT-00016J-Gh; Wed, 24 Sep 2025 13:30:11 +0000
Received: by outflank-mailman (input) for mailman id 1129404;
 Wed, 24 Sep 2025 13:30:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kInu=4D=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1v1PZS-00015u-4C
 for xen-devel@lists.xenproject.org; Wed, 24 Sep 2025 13:30:10 +0000
Received: from fout-a7-smtp.messagingengine.com
 (fout-a7-smtp.messagingengine.com [103.168.172.150])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 95e1269f-994a-11f0-9d14-b5c5bf9af7f9;
 Wed, 24 Sep 2025 15:30:07 +0200 (CEST)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
 by mailfout.phl.internal (Postfix) with ESMTP id 55198EC01B1;
 Wed, 24 Sep 2025 09:30:06 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-05.internal (MEProxy); Wed, 24 Sep 2025 09:30:06 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 24 Sep 2025 09:30:04 -0400 (EDT)
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
X-Inumbo-ID: 95e1269f-994a-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1758720606;
	 x=1758807006; bh=513jZbBrdfpU61xZqq4wuE9Lce/OwZsVPgheNUmfSoY=; b=
	aRIp4rn3YbF/ufdqlaG8YYEiyHOUcGDljDsSFlBkT7AZfNbGrbfTdZZH3CFRgZFp
	hA7xWmJ1LasG10mj+sPDYbMlvBWgdxhiKdB5d7RrfKAJ+WU9XGanjYMgFnMTQs7c
	lCWHvoRQFmQkJ0V86xR7Hun6myOHSfj5PTka47OhZEboAZBwBrBs34S5q4oSG0sw
	iU0Ku5vyl3/vWX3N7eniuti2T4CdT10J1Idmo+AgdK1pvFbNcYOH3opCOSmsiwIj
	3JvIkiYrqJWsCXsi21ILTqONhv0dnVlbv6QVfDLce7P4imm/ndFkEnDShn7+DyTM
	Ejt1Tg3BWrPB3oNDUz52Bg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1758720606; x=1758807006; bh=513jZbBrdfpU61xZqq4wuE9Lce/OwZsVPgh
	eNUmfSoY=; b=dw9MS/KQ9FfYzDdUMLqSYQV+uZxa+me3n1JgMYvrtN+Zcfp5t2A
	X+eSDYZYjucl8Q4n186BL0Zwy6ds/3jOnG2ftds/ZfrVNnlx3x0nc1AcH7NxL9bs
	1XAMjWznItkMpv5wiyXdPQNJ6WBqYqvgWjQhArX6r+t6y9SVbmtiH44qVfSRL7Ki
	dtOTys1hr0NU39vaRwlsGLahoMyvh0PiRBkgtN1I8GPZ+I+gaY+AKlT2EQyJJpxQ
	2hWdDrIB/efvg58VCQKPLe34Bq4UayKYWv5aTFkKg1ejQCP7BTSxPpzp9+VsShLC
	E343/Y4YJ2TVDe13zj2546ymI6LwCN61uYA==
X-ME-Sender: <xms:XfLTaArbVlazzSNFdrrnchBqqdIEzLuYZvwEdqMX96i9Q0_-AKyO4A>
    <xme:XfLTaKWAb1yK5n1LN3c3CkM8oNE6T2p0E3nzgx2EQVafvGL1UPgiQFNTwezRwyImI
    SqJB69bORxM7ulnqVrf5zJOOZ4SNGy9NCIetBUMKTbnw1kShA>
X-ME-Received: <xmr:XfLTaPBe7X--4VFT1KJYoasyefRjujMi3_ceQ1-Y1__q6_jwLCrwCAdNWf1fx3K-BqKwblP0P-dmGykm8xmqD5eWT03aeHch9iI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdeifeejfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghkucfo
    rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeeukeetteeg
    gffgkeduheetgeeileejjeeiiefhjeegvefhtefggfetueetteeuteenucffohhmrghinh
    epghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehm
    rghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsg
    drtghomhdpnhgspghrtghpthhtohepiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthht
    ohepghhrhihgohhrihhipghsthhrrghshhhkohesvghprghmrdgtohhmpdhrtghpthhtoh
    epjhhgrhhoshhssehsuhhsvgdrtghomhdprhgtphhtthhopeigvghnqdguvghvvghlsehl
    ihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtthhopehsshhtrggsvghllh
    hinhhisehkvghrnhgvlhdrohhrghdprhgtphhtthhopeholhgvkhhsrghnughrpghthihs
    hhgthhgvnhhkohesvghprghmrdgtohhmpdhrtghpthhtohepsghorhhishdrohhsthhroh
    hvshhkhiesohhrrggtlhgvrdgtohhm
X-ME-Proxy: <xmx:XfLTaO17ikSuyjrO-dRbHwe0Mqu30BvUvUI6Qnv64tLV51FOKllR0A>
    <xmx:XfLTaB2BP8WETjznV7tqAgivQozdO7r26h1HOswEeSIRWbCSGutW-g>
    <xmx:XfLTaDAm9sX5xH2I9iRXjc6KuJisNzFXdMGwwCFS71OzVHq8PdAsLQ>
    <xmx:XfLTaA7ZZVKrC6iWL5FY_uuEjFMDHslvuF-wlevON0n-JQ1ptKS5-Q>
    <xmx:XvLTaLxsA7twQFsVJcNeRQgl1iik632QBa0W0DAHrNEswJbjz13Q6Swa>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 24 Sep 2025 15:30:03 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	xen-devel <xen-devel@lists.xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: domU suspend issue - freeze processes failed - Linux 6.16
Message-ID: <aNPyW5a7BHni-SuI@mail-itl>
References: <aKiBJeqsYx_4Top5@mail-itl>
 <aKiBwEsogK420kwo@mail-itl>
 <05e9628d-83e5-4feb-881d-5854b72bd560@suse.com>
 <aKi6Foj-Lx_n0L6l@mail-itl>
 <aNEgTgis2JeyQ4HA@mail-itl>
 <8f6b8f08-ca62-467b-a6be-4d33208e5393@epam.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CW/IsT6ZQUUs61cd"
Content-Disposition: inline
In-Reply-To: <8f6b8f08-ca62-467b-a6be-4d33208e5393@epam.com>


--CW/IsT6ZQUUs61cd
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 24 Sep 2025 15:30:03 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Grygorii Strashko <grygorii_strashko@epam.com>
Cc: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	xen-devel <xen-devel@lists.xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: domU suspend issue - freeze processes failed - Linux 6.16

On Wed, Sep 24, 2025 at 01:17:15PM +0300, Grygorii Strashko wrote:
>=20
>=20
> On 22.09.25 13:09, Marek Marczykowski-G=C3=B3recki wrote:
> > On Fri, Aug 22, 2025 at 08:42:30PM +0200, Marek Marczykowski-G=C3=B3rec=
ki wrote:
> > > On Fri, Aug 22, 2025 at 05:27:20PM +0200, J=C3=BCrgen Gro=C3=9F wrote:
> > > > On 22.08.25 16:42, Marek Marczykowski-G=C3=B3recki wrote:
> > > > > On Fri, Aug 22, 2025 at 04:39:33PM +0200, Marek Marczykowski-G=C3=
=B3recki wrote:
> > > > > > Hi,
> > > > > >=20
> > > > > > When suspending domU I get the following issue:
> > > > > >=20
> > > > > >       Freezing user space processes
> > > > > >       Freezing user space processes failed after 20.004 seconds=
 (1 tasks refusing to freeze, wq_busy=3D0):
> > > > > >       task:xl              state:D stack:0     pid:466   tgid:4=
66   ppid:1      task_flags:0x400040 flags:0x00004006
> > > > > >       Call Trace:
> > > > > >        <TASK>
> > > > > >        __schedule+0x2f3/0x780
> > > > > >        schedule+0x27/0x80
> > > > > >        schedule_preempt_disabled+0x15/0x30
> > > > > >        __mutex_lock.constprop.0+0x49f/0x880
> > > > > >        unregister_xenbus_watch+0x216/0x230
> > > > > >        xenbus_write_watch+0xb9/0x220
> > > > > >        xenbus_file_write+0x131/0x1b0
> > > > > >        vfs_writev+0x26c/0x3d0
> > > > > >        ? do_writev+0xeb/0x110
> > > > > >        do_writev+0xeb/0x110
> > > > > >        do_syscall_64+0x84/0x2c0
> > > > > >        ? do_syscall_64+0x200/0x2c0
> > > > > >        ? generic_handle_irq+0x3f/0x60
> > > > > >        ? syscall_exit_work+0x108/0x140
> > > > > >        ? do_syscall_64+0x200/0x2c0
> > > > > >        ? __irq_exit_rcu+0x4c/0xe0
> > > > > >        entry_SYSCALL_64_after_hwframe+0x76/0x7e
> > > > > >       RIP: 0033:0x79b618138642
> > > > > >       RSP: 002b:00007fff9a192fc8 EFLAGS: 00000246 ORIG_RAX: 000=
0000000000014
> > > > > >       RAX: ffffffffffffffda RBX: 00000000024fd490 RCX: 000079b6=
18138642
> > > > > >       RDX: 0000000000000003 RSI: 00007fff9a193120 RDI: 00000000=
00000014
> > > > > >       RBP: 00007fff9a193000 R08: 0000000000000000 R09: 00000000=
00000000
> > > > > >       R10: 0000000000000000 R11: 0000000000000246 R12: 00000000=
00000014
> > > > > >       R13: 00007fff9a193120 R14: 0000000000000003 R15: 00000000=
00000000
> > > > > >        </TASK>
> > > > > >       OOM killer enabled.
> > > > > >       Restarting tasks: Starting
> > > > > >       Restarting tasks: Done
> > > > > >       xen:manage: do_suspend: freeze processes failed -16
> > > > > >=20
> > > > > > The process in question is `xl devd` daemon. It's a domU servin=
g a
> > > > > > xenvif backend.
> > > > > >=20
> > > > > > I noticed it on 6.16.1, but looking at earlier test logs I see =
it with
> > > > > > 6.16-rc6 already (but interestingly, not 6.16-rc2 yet? feels we=
ird given
> > > > > > seemingly no relevant changes between rc2 and rc6).
> > > > >=20
> > > > > I forgot to include link for (a little) more details:
> > > > > https://github.com/QubesOS/qubes-linux-kernel/pull/1157
> > > > >=20
> > > > > Especially, there is another call trace with panic_on_warn enable=
d -
> > > > > slightly different, but looks related.
> > > > >=20
> > > >=20
> > > > I'm pretty sure the PV variant for suspending is just wrong: it is =
calling
> > > > dpm_suspend_start() from do_suspend() without taking the required
> > > > system_transition_mutex, resulting in the WARN() in pm_restrict_gfp=
_mask().
> > > >=20
> > > > It might be as easy as just adding the mutex() call to do_suspend()=
, but I'm
> > > > really not sure that will be a proper fix.
> > >=20
> > > Hm, this might explain the second call trace, but not the freeze fail=
ure
> > > quoted here above, I think?
> >=20
> > While the patch I sent appears to fix this particular issue, it made me
> > wonder: is there any fundamental reason why do_suspend() is not using
> > pm_suspend() and register Xen-specific actions via platform_suspend_ops
> > (and maybe syscore_ops)? From a brief look at the code, it should
> > theoretically be possible, and should avoid issues like this.
> >=20
> > I tried to do a quick&dirty attempt at that[1], and it failed (panic). I
> > surely made several mistakes there (and also left a ton of todo
> > comments). But before spending any more time at that, I'd like to ask
> > if this is a viable option at all.
>=20
> I think it might, but be careful with this, because there are two "System=
 Low power" paths in Linux
> 1) Suspend2RAM and Co
> 2) Hybernation
>=20
> While "Suspend2RAM and Co" path is relatively straight forward and expect=
ed to be always
> started through pm_suspend(). In general, it's expected to happen
>  - from sysfs (User space)
>  - from autosuspend (wakelocks).
>=20
> the "hibernation" path is more complicated:(
> - Genuine Linux hybernation hibernate()/hibernate_quiet_exec()

IIUC hibernation is very different as it puts Linux in charge of dumping
all the state to the disk. In case of Xen, the primary use case for
suspend is preparing VM for Xen toolstack serializing its state to disk
(or migrating to another host).=20
Additionally, VM suspend may be used as preparation for host suspend
(this is what I actually do here). This is especially relevant if the VM
has some PCI passthrough - to properly suspend (and resume) devices
across host suspend.

> I'm not sure what path Xen originally implemented :( It seems like "suspe=
nd2RAM",
> but, at the same time "hybernation" specific staff is used, like PMSG_FRE=
EZE/PMSG_THAW/PMSG_RESTORE.
> As result, Linux suspend/hybernation code moves forward while Xen stays b=
ehind and unsync.

Yeah, I think it's supposed to be suspend2RAM. TBH the
PMSG_FREEZE/PMSG_THAW/PMSG_RESTORE confuses me too and Qubes OS has a
patch[2] to switch it to PMSG_SUSPEND/PMSG_RESUME.

> So it sounds reasonable to avoid custom implementation, but may be not ea=
sy :(
>=20
> Suspending Xen features can be split between suspend stages, but
> not sure if platform_suspend_ops can be used.
>=20
> Generic suspend stages list
> - freeze
> - prepare
> - suspend
> - suspend_late
> - suspend_noirq (SPIs disabled, except wakeups)
>   [most of Xen specific staff has to be suspended at this point]
> - disable_secondary_cpus
> - arch disable IRQ (from this point no IRQs allowed, no timers, no schedu=
ling)
> - syscore_suspend
>   [rest here]
> - platform->enter() (suspended)
>=20
> You can't just overwrite platform_suspend_ops, because ARM64 is expected =
to enter
> suspend through PSCI FW interface:
> drivers/firmware/psci/psci.c
>  static const struct platform_suspend_ops psci_suspend_ops =3D {

Does this apply to a VM on ARM64 too? At least on x86, the VM is
supposed to make a hypercall to tell Xen it suspended (the hypercall
will return only on resume).

> As an option, some Xen components could be converted to use syscore_ops (=
but not xenstore),
> and some might need to use DD(dev_pm_ops).
>=20
> >=20
> > [1] https://github.com/marmarek/linux/commit/47cfdb991c85566c9c33357051=
1e67bf477a5da6
>=20
> --=20
> Best regards,
> -grygorii
>=20

[2] https://github.com/QubesOS/qubes-linux-kernel/blob/main/xen-pm-use-susp=
end.patch

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--CW/IsT6ZQUUs61cd
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmjT8lsACgkQ24/THMrX
1yzVCgf/RedEYV3RMxwKwUdKHRyb9e7+GwToxwOjxy8RRxMo7G3kiDU1JHwAbfvR
eRS9xAvoHhKnSKMd/xFlSkZlf0vf5Q+CrZay6ACNa7oUFLvXauBZCCtIOyC6kjUs
D3bK5PPYOotbsfR/MtgNdjoa7Lb3iJdIAEzAo1LO+7SUlob3RdUoNCNlcAHfuwnZ
vM5N85FkRF8G37CVvAKkI76vT8VnFAekT2gm2g/d4RAWvtSUAOQN8Ki1Ku1lJ3AM
6VUoGebLFjor+Km0S/ZmSy6bd2cIAqq+XV5NlRObwCOL0bNkdzqVETNLXjidn/76
owM4rVxzdyUI/VUnpJH7/tySz5tCRA==
=9U9s
-----END PGP SIGNATURE-----

--CW/IsT6ZQUUs61cd--

