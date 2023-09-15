Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA187A2438
	for <lists+xen-devel@lfdr.de>; Fri, 15 Sep 2023 19:04:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.603323.940285 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhCEh-0007Mh-Rt; Fri, 15 Sep 2023 17:04:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 603323.940285; Fri, 15 Sep 2023 17:04:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qhCEh-0007Kh-OC; Fri, 15 Sep 2023 17:04:07 +0000
Received: by outflank-mailman (input) for mailman id 603323;
 Fri, 15 Sep 2023 17:04:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DYUW=E7=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1qhCEg-0007KZ-Ii
 for xen-devel@lists.xenproject.org; Fri, 15 Sep 2023 17:04:06 +0000
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id de210d87-53e9-11ee-9b0d-b553b5be7939;
 Fri, 15 Sep 2023 19:04:03 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 007BE5C00F7;
 Fri, 15 Sep 2023 13:04:01 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 15 Sep 2023 13:04:00 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 15 Sep 2023 13:03:59 -0400 (EDT)
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
X-Inumbo-ID: de210d87-53e9-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1694797440; x=1694883840; bh=LVbBNxpAeKgLQAa3HP57HtgBVcAKesVrZi0
	FcBdP+GQ=; b=01AJ+dho/1xrJtILnT1BFvcAQFhPQuV6IY0Nlxk6YI/MTbC9DZT
	gONsTxP23M9cdG+Crvwe2aWlSrBJSWMEIU39lSeqZulmEkGKXQNjz2/etct8Ghld
	2ehSJ1ycIg9EVpVgAMyhIE1wc1VMnEd5hLxFFcNfoMzZIEFsXHJKfsyM4xrsM/eG
	9x4khxMDySP8N78w0If5SwRj5vZo7hFH24Cwc6P1PvRnRPyhKhi0hmUcMlip79qL
	BlFcZfr+OGZaK3VwYBjNjGlNbhWWZhedlXY4Ot0fsDXPfl+BG52IufLhS4wkINKm
	Y4D06tkilSdO2BbhiJVg4yW0Ccy5UQHhxaQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1694797440; x=1694883840; bh=LVbBNxpAeKgLQ
	Aa3HP57HtgBVcAKesVrZi0FcBdP+GQ=; b=DMd8VSTHdy++jeVpic+l1hEUXVO7t
	PdZn901UthHgb9IFV374jyqdkGhTmT7OXeVcD/h4cLjdDfcgmsyifdhbcAvhVu2h
	GZ+CYWmw1dQmgw/JJn+k5NpOADFWl3IsWKc3Ad4Cb8tM8CR9ZJ8B5d2yLMuaEwTX
	n3sgflNdFmY/KBX1id3MFrqO9W4hP3YGJypp7DUg0v5pyebjs6iYXpz81jyCXHZv
	EvTni5ZLQ+bwInHTUlTmAqolYAk1LjzJbMVh2ktE7bhaPa8U/D0MZfo1HZuAz0Zd
	6Ep7nzk1zm9G5rYxBE62i2yOCCQkvHEsPgqWSfOjT3nbWGxkvv46QIv6A==
X-ME-Sender: <xms:gI4EZSuual_D5cDAmKu-83fC0FQciOXxnFunwdsyEi8JJd_6H7rupA>
    <xme:gI4EZXfmgJrn6AQkl9a-Ne1wG7Yi2lqv7F8QulIqAQynqRybpnUJ0zTLF-D3_wX0f
    Og4BEZ0_O56zA>
X-ME-Received: <xmr:gI4EZdxiBTfLKgZGvkI8D0gAMV2k9zQwY7ZaPPv3P547t_oC8V2MVFSSDhuxDchEXI0hZqj3EmkVPKtMK7iWXEb2KYJko0rg5Gk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudejvddguddthecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    udelteefvefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:gI4EZdMr0HOykIdiDPz1p38aL39gHs2HalcZJdk4JuyEwn_SaYF0SQ>
    <xmx:gI4EZS__yfOhw5DbhS5CFb2lRkz7gw4k9Qjg3vaD1thGuQnqzlE2nQ>
    <xmx:gI4EZVV9gMoFkZzYTMwMjTwbRp3Gv-UsbqTjsDa_KToOIIIok2Kovg>
    <xmx:gI4EZUIjHrJZRiTy4iulOVXeoUAcnOrKRPw4zhIMAmHZpYOmKHBoTw>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 15 Sep 2023 19:03:52 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/shutdown: change default reboot method preference
Message-ID: <ZQSOfOvO4xKO/nvz@mail-itl>
References: <20230914152120.92696-1-roger.pau@citrix.com>
 <2d767f96-9f20-e786-9148-cae5c30a41fd@citrix.com>
 <ZQQDthWFElFEOhZ_@MacBook-MacBook-Pro-de-Roger.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="naEGlt9VSeCl9SNW"
Content-Disposition: inline
In-Reply-To: <ZQQDthWFElFEOhZ_@MacBook-MacBook-Pro-de-Roger.local>


--naEGlt9VSeCl9SNW
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 15 Sep 2023 19:03:52 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/shutdown: change default reboot method preference

On Fri, Sep 15, 2023 at 09:11:50AM +0200, Roger Pau Monn=C3=A9 wrote:
> On Thu, Sep 14, 2023 at 06:42:03PM +0100, Andrew Cooper wrote:
> > On 14/09/2023 4:21 pm, Roger Pau Monne wrote:
> > > The current logic to chose the preferred reboot method is based on th=
e mode Xen
> > > has been booted into, so if the box is booted from UEFI, the preferre=
d reboot
> > > method will be to use the ResetSystem() run time service call.
> > >
> > > However, that call seems to be widely untested once the firmware has =
exited
> > > boot services, and quite often leads to a result similar to:
> >=20
> > I don't know how true this is.=C2=A0 What Xen does differently to most =
of the
> > rest of the world is not calling SetVirtualAddressMap()
>=20
> Hm, but that doesn't seem to affect the rest of the run-time services
> (at least on this box), it's (just?) ResetSystem() that misbehaves.

I've seen (too) many firmwares where also GetVariable crashes without
SetVirtualAddressMap(). That's why we have a build-time option to
actually call SetVirtualAddressMap().

Anyway, I agree that preferring ACPI reboot even when booted through
UEFI is a good idea.

> I can remove that sentence however, it is more of a guess rather than
> a fact.
>=20
> >=20
> > >
> > > Hardware Dom0 shutdown: rebooting machine
> > > ----[ Xen-4.18-unstable  x86_64  debug=3Dy  Tainted:   C    ]----
> > > CPU:    0
> > > RIP:    e008:[<0000000000000017>] 0000000000000017
> > > RFLAGS: 0000000000010202   CONTEXT: hypervisor
> > > [...]
> > > Xen call trace:
> > >    [<0000000000000017>] R 0000000000000017
> > >    [<ffff83207eff7b50>] S ffff83207eff7b50
> > >    [<ffff82d0403525aa>] F machine_restart+0x1da/0x261
> > >    [<ffff82d04035263c>] F apic_wait_icr_idle+0/0x37
> > >    [<ffff82d040233689>] F smp_call_function_interrupt+0xc7/0xcb
> > >    [<ffff82d040352f05>] F call_function_interrupt+0x20/0x34
> > >    [<ffff82d04033b0d5>] F do_IRQ+0x150/0x6f3
> > >    [<ffff82d0402018c2>] F common_interrupt+0x132/0x140
> > >    [<ffff82d040283d33>] F arch/x86/acpi/cpu_idle.c#acpi_idle_do_entry=
+0x113/0x129
> > >    [<ffff82d04028436c>] F arch/x86/acpi/cpu_idle.c#acpi_processor_idl=
e+0x3eb/0x5f7
> > >    [<ffff82d04032a549>] F arch/x86/domain.c#idle_loop+0xec/0xee
> > >
> > > ****************************************
> > > Panic on CPU 0:
> > > FATAL TRAP: vector =3D 6 (invalid opcode)
> > > ****************************************
> > >
> > > Which in most cases does lead to a reboot, however that's unreliable.
> > >
> > > Change the default reboot preference to prefer ACPI over UEFI if avai=
lable and
> > > not in reduced hardware mode.
> > >
> > > This is in line to what Linux does, so it's unlikely to cause issues =
on current
> > > and future hardware, since there's a much higher chance of vendors te=
sting
> > > hardware with Linux rather than Xen.
> > >
> > > I'm not aware of using ACPI reboot causing issues on boxes that do ha=
ve
> > > properly implemented ResetSystem() methods.
> > >
> > > Signed-off-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> >=20
> > Wording aside, Reviewed-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >=20
> > This is a giant embarrassment to Xen, and needs fixing.
>=20
> Looking at Linux I think we need to add an override for Acer
> TravelMate X514-51T to force it to use UEFI, will send v2 with it.
>=20
> I do wonder if we need to keep the reboot_dmi_table[] entries that
> force systems to use ACPI, as it would now be the default?  My
> thinking is that it's likely better to keep it just in case we change
> the default again in the future.
>=20
> Thanks, Roger.
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--naEGlt9VSeCl9SNW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmUEjnwACgkQ24/THMrX
1yyUmgf+KVDSstlk/HfwG36LjiP89S39wNOI7zwy/zzWmnN4qS07BRIhW/muwiKb
li7ckrSDLvngAcdrE1YOHfcPAN1pBbLJoHmV2pJMmGFcSs2T5uiTXs5ORi1418Z0
7dqzUidozSrRcweuHr6V5HOgR+5sgyU8xm1pOvUvcMRwBVDDrjK11ar+QW1WvQz7
lGSPdKzJ45N0EV4M1ERA5ydXmIHbSwM7QANAxXw5JD1lO+EuR7iFlBzi02v6ePwE
i9Mm7u1di6EzbCBvQgGGnd6sB/rBIPxCyoKAWbo63hr5VP1RoMGkM19sBOXb6uKv
t312auwifr4kDK+XfgH0XTjuqBgvcQ==
=4nFk
-----END PGP SIGNATURE-----

--naEGlt9VSeCl9SNW--

