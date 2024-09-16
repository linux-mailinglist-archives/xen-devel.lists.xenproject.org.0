Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A3297A2DD
	for <lists+xen-devel@lfdr.de>; Mon, 16 Sep 2024 15:22:05 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.799528.1209528 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqBfC-0001Hn-Rf; Mon, 16 Sep 2024 13:21:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 799528.1209528; Mon, 16 Sep 2024 13:21:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sqBfC-0001Fc-P3; Mon, 16 Sep 2024 13:21:10 +0000
Received: by outflank-mailman (input) for mailman id 799528;
 Mon, 16 Sep 2024 13:21:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=OOdV=QO=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1sqBfA-0001FW-MG
 for xen-devel@lists.xenproject.org; Mon, 16 Sep 2024 13:21:09 +0000
Received: from fout6-smtp.messagingengine.com (fout6-smtp.messagingengine.com
 [103.168.172.149]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 84634914-742e-11ef-99a2-01e77a169b0f;
 Mon, 16 Sep 2024 15:21:01 +0200 (CEST)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal
 [10.202.2.45])
 by mailfout.phl.internal (Postfix) with ESMTP id 83CD2138022B;
 Mon, 16 Sep 2024 09:21:00 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-05.internal (MEProxy); Mon, 16 Sep 2024 09:21:00 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 Sep 2024 09:20:58 -0400 (EDT)
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
X-Inumbo-ID: 84634914-742e-11ef-99a2-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1726492860;
	 x=1726579260; bh=6h+gY4/iOKUw2eWXEqLXr2FCw/P/6oUY3f3INUPVXJY=; b=
	dRmLPee3ZLN4b8vhT8/y87ehy5fELsPxdRQXMEZLJFOwrqMdkIojVwl91pLrCBxw
	w5PMiJ7yiW8fKlrEVuDlylbq6GfrIzA4FYkGiYI5wWMi0x8chsh7it0dqFrlYYe9
	BjuDawjzUyhkjTTSHjG4wxrxky3SOb1sYQCBIaxDV6QYZoDt0aBtbK/BZIL1ZbgO
	GywMU2S4134/0b8YFPkCE7Iga9sbAMyGZk2esCv+kGIDcDSmq4ULNbij9DIybwS4
	KYiun1cXtOe5wyzb84OQoCxrzG3pT2hhpDvRSmJpXnSsDIqWTWc+qohZ3nmLubvu
	Lf6W22DaIV2GxvaS8fLShA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1726492860; x=1726579260; bh=6h+gY4/iOKUw2eWXEqLXr2FCw/P/
	6oUY3f3INUPVXJY=; b=Odq5EpDGyvbExfuJ5H5rP/3eGxbBYuAEOX0VtnWtLw+c
	GjdRhzZd8Ehwqs3ozXxyf0cxZ4fVsnMxWqUHPVDiuY3Bb9WE7VKWqtmpsrLcyzdg
	76U0tVc+wgf0CadULQ9fX4FbB8HDhi45FzpKgMC9+NoHKxhcndkzKVMkzXjA1oZP
	FHc0YdaC3yCLVghSIPc0U8UeTPR1qiBpvCHmLyNaa/oQOaqllmly0OuLt32a5EZX
	Ftpua2giY6Eqm9m1BZDey5yYZf52zVHaei5b5LqU8npAzZTrfPZcD+Vi4YhX0Dt5
	Zrw5WF18JJFaGWB/mo1mFv5z77dfSHnHVp3gxPUmHA==
X-ME-Sender: <xms:vDDoZnQaBLP8XvHHi1BnEBsga1aGZ-vapAUFdsvjMCnK9YjqdgrxYQ>
    <xme:vDDoZoyXaStywP0ewEQU6zyiNVlyVlESA_s1KoUWHIXesbtRvGRJJUqxLVnZ_ze-n
    9RuzZAOGgxDLA>
X-ME-Received: <xmr:vDDoZs2mjW7RhseTYAQ8RzU_1an2l0XbMiUXtZ_ijC54milOmtcWB7M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudekhedgieduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeen
    ucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomh
    grrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggft
    rfgrthhtvghrnhepgfduleetfeevhfefheeiteeliefhjefhleduveetteekveettddvge
    euteefjedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
    mhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnh
    gspghrtghpthhtohepjedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprghnughr
    vgifrdgtohhophgvrhefsegtihhtrhhigidrtghomhdprhgtphhtthhopehrohhgvghrrd
    hprghusegtihhtrhhigidrtghomhdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhs
    thhsrdigvghnphhrohhjvggtthdrohhrghdprhgtphhtthhopeguphhsmhhithhhsegrph
    gvrhhtuhhsshholhhuthhiohhnshdrtghomhdprhgtphhtthhopehjsggvuhhlihgthhes
    shhushgvrdgtohhmpdhrtghpthhtohepjhhulhhivghnseigvghnrdhorhhgpdhrtghpth
    htohepshhsthgrsggvlhhlihhniheskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:vDDoZnCfCybQ7jnZcYj7f9iWSAQP4zMsUQ3L-dxL9VCPl0Kb1nLjSg>
    <xmx:vDDoZghHtftjhbhPC6njDa_iwHB_qgA77mqLKW3RovbyY21jDtoRUw>
    <xmx:vDDoZroKR_YpD9vRQ5sC9_26aADiJzoHjCKIwIoL3Pl0kQmgqeSzJw>
    <xmx:vDDoZrg--FGpmhXVTcjLeEmIcP1OcbvD8SNhjFXgC25UBeb0px-zyA>
    <xmx:vDDoZrUEPaT4-nDWiQpYtPIRvVyP7eBbEbnlyyhJYRO1KSqZuk3YHBrG>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 16 Sep 2024 15:20:56 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v7 1/2] x86/time: introduce command line option to select
 wallclock
Message-ID: <ZugwuGWIl2Xg7EMD@mail-itl>
References: <20240913075907.34460-1-roger.pau@citrix.com>
 <20240913075907.34460-2-roger.pau@citrix.com>
 <01b4b04f-d7ba-4526-b45f-2146bfc03cbe@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VuPRpe/WJOiDCIlt"
Content-Disposition: inline
In-Reply-To: <01b4b04f-d7ba-4526-b45f-2146bfc03cbe@citrix.com>


--VuPRpe/WJOiDCIlt
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 16 Sep 2024 15:20:56 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>, xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v7 1/2] x86/time: introduce command line option to select
 wallclock

On Mon, Sep 16, 2024 at 02:11:08PM +0100, Andrew Cooper wrote:
> On 13/09/2024 8:59 am, Roger Pau Monne wrote:
> > diff --git a/docs/misc/xen-command-line.pandoc b/docs/misc/xen-command-=
line.pandoc
> > index 959cf45b55d9..2a9b3b9b8975 100644
> > --- a/docs/misc/xen-command-line.pandoc
> > +++ b/docs/misc/xen-command-line.pandoc
> > @@ -2816,6 +2816,27 @@ vwfi to `native` reduces irq latency significant=
ly. It can also lead to
> >  suboptimal scheduling decisions, but only when the system is
> >  oversubscribed (i.e., in total there are more vCPUs than pCPUs).
> > =20
> > +### wallclock (x86)
> > +> `=3D auto |=C2=A0xen | cmos | efi`
> > +
> > +> Default: `auto`
> > +
> > +Allow forcing the usage of a specific wallclock source.
> > +
> > + * `auto` let the hypervisor select the clocksource based on internal
> > +   heuristics.
> > +
> > + * `xen` force usage of the Xen shared_info wallclock when booted as a=
 Xen
> > +   guest.  This option is only available if the hypervisor was compile=
d with
> > +   `CONFIG_XEN_GUEST` enabled.
> > +
> > + * `cmos` force usage of the CMOS RTC wallclock.
> > +
> > + * `efi` force usage of the EFI_GET_TIME run-time method when booted f=
rom EFI
> > +   firmware.
>=20
> For both `xen` and `efi`, something should be said about "if selected
> and not satisfied, Xen falls back to other heuristics".
>=20
> > +
> > +If the selected option is invalid or not available Xen will default to=
 `auto`.
>=20
> I'm afraid that I'm firmly of the opinion that "auto" on the cmdline is
> unnecessary complexity.=C2=A0 Auto is the default, and doesn't need
> specifying explicitly.=C2=A0 That in turn simplifies ...

What about overriding earlier choice? For example overriding a built-in
cmdline? That said, with the current code, the same can be achieved with
wallclock=3Dfoo, and living with the warning in boot log...

> > +
> >  ### watchdog (x86)
> >  > `=3D force | <boolean>`
> > =20
> > diff --git a/xen/arch/x86/time.c b/xen/arch/x86/time.c
> > index 29b026735e5d..e4751684951e 100644
> > --- a/xen/arch/x86/time.c
> > +++ b/xen/arch/x86/time.c
> > @@ -1552,6 +1552,37 @@ static const char *__init wallclock_type_to_stri=
ng(void)
> >      return "";
> >  }
> > =20
> > +static int __init cf_check parse_wallclock(const char *arg)
> > +{
> > +    wallclock_source =3D WALLCLOCK_UNSET;
> > +
> > +    if ( !arg )
> > +        return -EINVAL;
> > +
> > +    if ( !strcmp("auto", arg) )
> > +        ASSERT(wallclock_source =3D=3D WALLCLOCK_UNSET);
>=20
> ... this.
>=20
> Hitting this assert will manifest as a system reboot/hang with no
> information on serial/VGA, because all of this runs prior to getting up
> the console.=C2=A0 You only get to see it on a PVH boot because we bodge =
the
> Xen console into default-existence.

This assert is no-op as wallclock_source is unconditionally set to WALLCLOC=
K_UNSET few lines above.

> So, ASSERT()/etc really need avoiding wherever possible in cmdline parsin=
g.
>=20
> In this case, all it serves to do is break examples like `wallclock=3Dxen
> wallclock=3Dauto` case, which is unlike our latest-takes-precedence
> behaviour everywhere else.
>=20
> > +    else if ( !strcmp("xen", arg) )
> > +    {
> > +        if ( !xen_guest )
>=20
> We don't normally treat this path as an error when parsing (we know what
> it is, even if we can't action it).=C2=A0 Instead, there's no_config_para=
m()
> to be more friendly (for PVH at least).
>=20
> It's a bit awkward, but this should do:
>=20
> =C2=A0=C2=A0=C2=A0 {
> #ifdef CONFIG_XEN_GUEST
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 wallclock_source =3D WALLCLOCK_XEN;
> #else
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 no_config_param("XEN_GUEST", "wallc=
lock", s, ss);
> #endif
> =C2=A0=C2=A0=C2=A0 }

Can you boot the binary build with CONFIG_XEN_GUEST=3Dy as native? If so,
the above will not be enough, a runtime check is needed anyway.

> There probably wants to be something similar for EFI, although it's not
> a plain CONFIG so it might be more tricky.

It needs to be runtime check here even more. Not only because of
different boot modes, but due to interaction with efi=3Dno-rs (or any
other reason for not having runtime services). See the comment there.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--VuPRpe/WJOiDCIlt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmboMLgACgkQ24/THMrX
1yx1sggAmlrjTdo2osU57WfjboWvEJXVc4c/1InzCnK8l6I2ThSYpcOiiPKuAIF9
b8fpQov3xQS0/1jAqoJ/BiAyMKXab6QdH8QC5B14tuUFCAelPMPzZWNu/u1UFiD/
4sGTfeoZjwUqCetHQQC55WPW4z1HYWIZ14vl21kst+FMNgnXprMRnWVNj+Tuv0nS
i1yqXpC19Rq8h9tERfDXVh0AP74l0YxQvfF9vsY7ayOA4PgKUPAUB4I/mMTwt+e+
8hPaAKiiLsoxnlJ7GUq6WaFZiiqgZvAg8zw699KuNawT8ehOGhfyhJxNaQenoOwu
DI4yrr7UbuXIgjmrc5fJQXozPIySJw==
=NPUA
-----END PGP SIGNATURE-----

--VuPRpe/WJOiDCIlt--

