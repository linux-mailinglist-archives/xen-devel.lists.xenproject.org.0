Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7754B8FED3
	for <lists+xen-devel@lfdr.de>; Mon, 22 Sep 2025 12:09:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1127752.1468356 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v0dU6-000739-3Q; Mon, 22 Sep 2025 10:09:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1127752.1468356; Mon, 22 Sep 2025 10:09:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1v0dU6-000702-0L; Mon, 22 Sep 2025 10:09:26 +0000
Received: by outflank-mailman (input) for mailman id 1127752;
 Mon, 22 Sep 2025 10:09:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+tSg=4B=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1v0dU4-0006zw-Ep
 for xen-devel@lists.xenproject.org; Mon, 22 Sep 2025 10:09:24 +0000
Received: from fout-b3-smtp.messagingengine.com
 (fout-b3-smtp.messagingengine.com [202.12.124.146])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 35c7580d-979c-11f0-9d14-b5c5bf9af7f9;
 Mon, 22 Sep 2025 12:09:23 +0200 (CEST)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
 by mailfout.stl.internal (Postfix) with ESMTP id 6D9C31D0006A;
 Mon, 22 Sep 2025 06:09:21 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-03.internal (MEProxy); Mon, 22 Sep 2025 06:09:21 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 22 Sep 2025 06:09:20 -0400 (EDT)
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
X-Inumbo-ID: 35c7580d-979c-11f0-9d14-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1758535761;
	 x=1758622161; bh=LaDcwF2RDStxElNAadMYTwEC3oddn3HOqej1bLn2VXs=; b=
	SGnRJQKB29IgSE1m+6HFoI7Ko7fud7x1iXPL9i1WRvVEZr+3kssG7zodpzS8GAac
	6IQkHTq5+GbgR479HbBtZ425vcJLMpXobxjM7nFB18u3LVjVAyE1HPfQar6oazVH
	WURZ3sOdOucUgs3edoPaHeaROCshModUo0zmgLttY++eA46zPx3WFIfVCHHsDTtL
	Y/JQ/n6G3747+zyxrLD/Hj/qNoQDZOPHcQ1Ce3VxRV/yG8tGx/FFuczSYqhyrekI
	FGXt77O+frzBq7NIOQMwUTEixSYNZDqxYpB8c2cJ69AEwllqkjwmto43nisAQvYg
	jliclHm1CakUgVHKEZSqTQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1758535761; x=1758622161; bh=LaDcwF2RDStxElNAadMYTwEC3oddn3HOqej
	1bLn2VXs=; b=W3ql9YdUvVWEPbnBWKhz+wW2t5aSj8NWEgE3KtZlBveshpQpSEA
	e+Oig+GBlnwL5N1HHnngqq+rbYbWtdvNLUyS9o8pbXwF8Q5/hBAVnopxpV+jInzc
	M0w4C+vuiUwwImX4SwyzoHg4sSK6v8csACQseFFZCMYRCcrbn8PZpcoCoj7FgSAT
	FazAY1Wmf7cdcmypGJF6ABiVqHQgSu9phC73GC9uW2iE1aZ8mPONrNxzuXrlVIF2
	Wv1vLo/UdK3/A3qkke0UWsEAJWiwxs4LWE5VxXUrDtPqjieKZXp4BgkIKpW59jgi
	aD00y8rNJsiXZm7H0x9ypDSeKf/SWIm4ZvQ==
X-ME-Sender: <xms:USDRaIUr0k5r-Mc4FpQm4KzGaqtyGApTzl2JeiWwITAMhtZi7VapGQ>
    <xme:USDRaIGYRHrTwD77CbBVKSaj7eIDMh0OSCtG_1NfPjhZLV_u4sJwD9haBJnJh4b3y
    imPrwrpv580kQ>
X-ME-Received: <xmr:USDRaC3_xarcZU45nQn8JfSbdUr2rUTa9E-GIEpEWF_1zdgwFns-NS2MFxcubFNoHKRSsL5XoB3wuj-frF9L4ypqc9hb6-HF0hU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdehjeehkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghkucfo
    rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeeukeetteeg
    gffgkeduheetgeeileejjeeiiefhjeegvefhtefggfetueetteeuteenucffohhmrghinh
    epghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehm
    rghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsg
    drtghomhdpnhgspghrtghpthhtohephedpmhhouggvpehsmhhtphhouhhtpdhrtghpthht
    ohepjhhgrhhoshhssehsuhhsvgdrtghomhdprhgtphhtthhopeigvghnqdguvghvvghlse
    hlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtthhopehsshhtrggsvghl
    lhhinhhisehkvghrnhgvlhdrohhrghdprhgtphhtthhopeholhgvkhhsrghnughrpghthi
    hshhgthhgvnhhkohesvghprghmrdgtohhmpdhrtghpthhtohepsghorhhishdrohhsthhr
    ohhvshhkhiesohhrrggtlhgvrdgtohhm
X-ME-Proxy: <xmx:USDRaCPRIRIlzbQ3K4kwALWqebThkD85vrB574SIB8YLIQmdmLb7DQ>
    <xmx:USDRaJ7Xi0S7A1jzCKbPgVGpG6Z-KlSUELwst6PJZSxIpSYniP2sIA>
    <xmx:USDRaE0KJPPy1FqxOAwHjCFPD-eWYbRlih1OsqbYkaMbBzsXoTRmxQ>
    <xmx:USDRaCzSBiR83y14uLxCFjGSX7j-_AkoIhy58v3lCF6JcoMTCfagSQ>
    <xmx:USDRaBbZXMgDYKfN1VdrJ-2sO-pAeWDK4zosxWNCBMCpmwxc9EqCbXQz>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 22 Sep 2025 12:09:18 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: domU suspend issue - freeze processes failed - Linux 6.16
Message-ID: <aNEgTgis2JeyQ4HA@mail-itl>
References: <aKiBJeqsYx_4Top5@mail-itl>
 <aKiBwEsogK420kwo@mail-itl>
 <05e9628d-83e5-4feb-881d-5854b72bd560@suse.com>
 <aKi6Foj-Lx_n0L6l@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="y2aJ/Rwljl2qe2Gi"
Content-Disposition: inline
In-Reply-To: <aKi6Foj-Lx_n0L6l@mail-itl>


--y2aJ/Rwljl2qe2Gi
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 22 Sep 2025 12:09:18 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: domU suspend issue - freeze processes failed - Linux 6.16

On Fri, Aug 22, 2025 at 08:42:30PM +0200, Marek Marczykowski-G=C3=B3recki w=
rote:
> On Fri, Aug 22, 2025 at 05:27:20PM +0200, J=C3=BCrgen Gro=C3=9F wrote:
> > On 22.08.25 16:42, Marek Marczykowski-G=C3=B3recki wrote:
> > > On Fri, Aug 22, 2025 at 04:39:33PM +0200, Marek Marczykowski-G=C3=B3r=
ecki wrote:
> > > > Hi,
> > > >=20
> > > > When suspending domU I get the following issue:
> > > >=20
> > > >      Freezing user space processes
> > > >      Freezing user space processes failed after 20.004 seconds (1 t=
asks refusing to freeze, wq_busy=3D0):
> > > >      task:xl              state:D stack:0     pid:466   tgid:466   =
ppid:1      task_flags:0x400040 flags:0x00004006
> > > >      Call Trace:
> > > >       <TASK>
> > > >       __schedule+0x2f3/0x780
> > > >       schedule+0x27/0x80
> > > >       schedule_preempt_disabled+0x15/0x30
> > > >       __mutex_lock.constprop.0+0x49f/0x880
> > > >       unregister_xenbus_watch+0x216/0x230
> > > >       xenbus_write_watch+0xb9/0x220
> > > >       xenbus_file_write+0x131/0x1b0
> > > >       vfs_writev+0x26c/0x3d0
> > > >       ? do_writev+0xeb/0x110
> > > >       do_writev+0xeb/0x110
> > > >       do_syscall_64+0x84/0x2c0
> > > >       ? do_syscall_64+0x200/0x2c0
> > > >       ? generic_handle_irq+0x3f/0x60
> > > >       ? syscall_exit_work+0x108/0x140
> > > >       ? do_syscall_64+0x200/0x2c0
> > > >       ? __irq_exit_rcu+0x4c/0xe0
> > > >       entry_SYSCALL_64_after_hwframe+0x76/0x7e
> > > >      RIP: 0033:0x79b618138642
> > > >      RSP: 002b:00007fff9a192fc8 EFLAGS: 00000246 ORIG_RAX: 00000000=
00000014
> > > >      RAX: ffffffffffffffda RBX: 00000000024fd490 RCX: 000079b618138=
642
> > > >      RDX: 0000000000000003 RSI: 00007fff9a193120 RDI: 0000000000000=
014
> > > >      RBP: 00007fff9a193000 R08: 0000000000000000 R09: 0000000000000=
000
> > > >      R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000=
014
> > > >      R13: 00007fff9a193120 R14: 0000000000000003 R15: 0000000000000=
000
> > > >       </TASK>
> > > >      OOM killer enabled.
> > > >      Restarting tasks: Starting
> > > >      Restarting tasks: Done
> > > >      xen:manage: do_suspend: freeze processes failed -16
> > > >=20
> > > > The process in question is `xl devd` daemon. It's a domU serving a
> > > > xenvif backend.
> > > >=20
> > > > I noticed it on 6.16.1, but looking at earlier test logs I see it w=
ith
> > > > 6.16-rc6 already (but interestingly, not 6.16-rc2 yet? feels weird =
given
> > > > seemingly no relevant changes between rc2 and rc6).
> > >=20
> > > I forgot to include link for (a little) more details:
> > > https://github.com/QubesOS/qubes-linux-kernel/pull/1157
> > >=20
> > > Especially, there is another call trace with panic_on_warn enabled -
> > > slightly different, but looks related.
> > >=20
> >=20
> > I'm pretty sure the PV variant for suspending is just wrong: it is call=
ing
> > dpm_suspend_start() from do_suspend() without taking the required
> > system_transition_mutex, resulting in the WARN() in pm_restrict_gfp_mas=
k().
> >=20
> > It might be as easy as just adding the mutex() call to do_suspend(), bu=
t I'm
> > really not sure that will be a proper fix.
>=20
> Hm, this might explain the second call trace, but not the freeze failure
> quoted here above, I think?

While the patch I sent appears to fix this particular issue, it made me
wonder: is there any fundamental reason why do_suspend() is not using
pm_suspend() and register Xen-specific actions via platform_suspend_ops
(and maybe syscore_ops)? From a brief look at the code, it should
theoretically be possible, and should avoid issues like this.

I tried to do a quick&dirty attempt at that[1], and it failed (panic). I
surely made several mistakes there (and also left a ton of todo
comments). But before spending any more time at that, I'd like to ask
if this is a viable option at all.

[1] https://github.com/marmarek/linux/commit/47cfdb991c85566c9c333570511e67=
bf477a5da6
--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--y2aJ/Rwljl2qe2Gi
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmjRIE4ACgkQ24/THMrX
1yzjYQf/dkvWv8WyxX7AXNmw4fUQIj6Sb9+0XA7TYLo5Io5wuScg3TlDnOq5RsSU
BDqgX3yBYxMmObBpG630w02U7Uf5Hkn7QIfNCaHUMlJyPU/Jz8qgaN0AJK1DDpog
05/0DQ2JOjHCo5p25oKLAtGGhofGSE2fxBQJTeOozft5RF7IeTeZ2TNf+wcgATj3
3ilKt81kypFAQO1k1yk9GE7YS5pGbUeNTrB5N7PY5kxwyZ0UJKecCIXL9HRyfOwy
M6Rifg4iFtcHsj62f0/PFgw7mGvE2EO/BhdYuA6KYi+u2Aena6K3hRscKyuBYsFA
EB0pDt7ymLekaWZUb2nsFcuOoCG28A==
=KC7E
-----END PGP SIGNATURE-----

--y2aJ/Rwljl2qe2Gi--

