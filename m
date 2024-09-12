Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BABB2976A9D
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2024 15:31:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.797492.1207464 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sojuG-0004lk-KN; Thu, 12 Sep 2024 13:30:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 797492.1207464; Thu, 12 Sep 2024 13:30:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sojuG-0004kD-H0; Thu, 12 Sep 2024 13:30:44 +0000
Received: by outflank-mailman (input) for mailman id 797492;
 Thu, 12 Sep 2024 13:30:42 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kInE=QK=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1sojuE-0004k5-FN
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2024 13:30:42 +0000
Received: from fhigh7-smtp.messagingengine.com
 (fhigh7-smtp.messagingengine.com [103.168.172.158])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 330a4d47-710b-11ef-99a1-01e77a169b0f;
 Thu, 12 Sep 2024 15:30:39 +0200 (CEST)
Received: from phl-compute-07.internal (phl-compute-07.phl.internal
 [10.202.2.47])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 3F5A311404FB;
 Thu, 12 Sep 2024 09:30:38 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-07.internal (MEProxy); Thu, 12 Sep 2024 09:30:38 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 Sep 2024 09:30:36 -0400 (EDT)
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
X-Inumbo-ID: 330a4d47-710b-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1726147838;
	 x=1726234238; bh=XYR/dI2arv9nAge2kQ/nsURa11u2UZnEGb1BUCiM6Q0=; b=
	lViXQBijueOcCqrnRqdCWJolJ3LIDS1trWQWtJi83f7PR2RkpRCthF8IspVeKaXy
	QoGk7wk+0dWnV/Khlj/wmYzSaCX2c5cmwe8FEtKGBdbstviPTxL1xwPR2OrI24lH
	Yx7pDfbQSBheMq2g9P8w6F3GwjsJ8faItvBVrNngXs82KVVwQfk62LmiLMLNm+2j
	LrkS/DBtQU+MGQpVCKIXhetJPyAfENZH8h8/fCLUz0L+OwuNzrOJD1UHS4Y+qbDB
	tyUWe6OUZgLKDbeIOIukblI7hIACDl1R7NeVFwV8nhJqxfjKjNAxW+1efpSajMxF
	oX6h/xzphCCXQgzYCMp7Fw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1726147838; x=1726234238; bh=XYR/dI2arv9nAge2kQ/nsURa11u2
	UZnEGb1BUCiM6Q0=; b=MwC6Eg9UHTsB7CV8hmPsd31giaiaoAXrG7fBHUBvIcj1
	qzWL7Rlvck2qClu1Bp1KXLPX+2EodBq5mSfMo8I3gSsby139fjvdxX98weBJNgGF
	D/QGxvxI0VsyieNuK5mVnAIV3kOXRGeEBh7PlAMEW+QZ28YfBrjW/rDKpF/2z9C3
	TPu6b7CJLJca0PxPBznQtk3AkTB5Cvg6BEocEU+wezHXhUHSJOIiNuYaHpTqZBR0
	GaVzmiX3wNh7corgH2T/LXEvRvdAdGmfeBTRz+a5nDXPxvnnkYVw66uMkbKzqj6P
	5yChyDkb9pHntwjrOeJuP4Wr+Vgl4KieoKQeJLjA4g==
X-ME-Sender: <xms:_eziZgGoCt9fAN9qBFIgVl6Pb-kBN2PXf9uq5NC47Euc_gjgTiKeHw>
    <xme:_eziZpWKXJFOgFwmp8Tz2h8eKobsNuVwP3YmaXjIu1V0RQBVbxwh1gw_NYNSTi4f0
    m8udi-g3l6qIQ>
X-ME-Received: <xmr:_eziZqI3pffIpR6Kgep8EtNylVKHAYrGhVq223cQRT90_7rG30sGWDP5ArH2NgSqsMcR9216VyOagyOluFqj4qaiCq8o7SJ7vQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudejfedgieeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeen
    ucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomh
    grrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggft
    rfgrthhtvghrnhepgfduleetfeevhfefheeiteeliefhjefhleduveetteekveettddvge
    euteefjedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
    mhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnh
    gspghrtghpthhtohepjedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprhhoghgv
    rhdrphgruhestghithhrihigrdgtohhmpdhrtghpthhtohepjhgsvghulhhitghhsehsuh
    hsvgdrtghomhdprhgtphhtthhopeguphhsmhhithhhsegrphgvrhhtuhhsshholhhuthhi
    ohhnshdrtghomhdprhgtphhtthhopegrnhgurhgvfidrtghoohhpvghrfeestghithhrih
    igrdgtohhmpdhrtghpthhtohepjhhulhhivghnseigvghnrdhorhhgpdhrtghpthhtohep
    shhsthgrsggvlhhlihhniheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepgigvnhdqug
    gvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhg
X-ME-Proxy: <xmx:_eziZiGoj-uvMjBsjLc7I-c3Zsvro2FybKZuI8wgJhm50Tp0zPBXXQ>
    <xmx:_eziZmUA6DWB2PzFFdToy_M9zwvJ5SaiKEBjp_kF-SUzLnsEc58n3A>
    <xmx:_eziZlOFJdj-1dcLGcBEzkUbNZIwhpj-DkwPulwoY6yG3hSSr5txdg>
    <xmx:_eziZt3n4xJmQl8WSs4qamqERX-LkyfUTZpPNUn83-bsKgUPAh0TCw>
    <xmx:_uziZoIP5uJGKrk3U4lCpXhYmpV_kbRVqJ2-NoHNzhUdlR0LMJbRKV3u>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 12 Sep 2024 15:30:29 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v6 1/2] x86/time: introduce command line option to select
 wallclock
Message-ID: <ZuLs-htt3Kvw-M6A@mail-itl>
References: <20240912111514.26934-1-roger.pau@citrix.com>
 <20240912111514.26934-2-roger.pau@citrix.com>
 <51c8a98b-145c-4834-865c-b75b61f1d5b0@suse.com>
 <ZuLlF1PKSOmbqr8u@macbook.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YhAOuzDy+q6+jw/Q"
Content-Disposition: inline
In-Reply-To: <ZuLlF1PKSOmbqr8u@macbook.local>


--YhAOuzDy+q6+jw/Q
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Sep 2024 15:30:29 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v6 1/2] x86/time: introduce command line option to select
 wallclock

On Thu, Sep 12, 2024 at 02:56:55PM +0200, Roger Pau Monn=C3=A9 wrote:
> On Thu, Sep 12, 2024 at 01:57:00PM +0200, Jan Beulich wrote:
> > On 12.09.2024 13:15, Roger Pau Monne wrote:
> > > --- a/xen/arch/x86/time.c
> > > +++ b/xen/arch/x86/time.c
> > > @@ -1552,6 +1552,35 @@ static const char *__init wallclock_type_to_st=
ring(void)
> > >      return "";
> > >  }
> > > =20
> > > +static int __init cf_check parse_wallclock(const char *arg)
> > > +{
> > > +    if ( !arg )
> > > +        return -EINVAL;
> > > +
> > > +    if ( !strcmp("auto", arg) )
> > > +        wallclock_source =3D WALLCLOCK_UNSET;
> > > +    else if ( !strcmp("xen", arg) )
> > > +    {
> > > +        if ( !xen_guest )
> > > +            return -EINVAL;
> > > +
> > > +        wallclock_source =3D WALLCLOCK_XEN;
> > > +    }
> > > +    else if ( !strcmp("cmos", arg) )
> > > +        wallclock_source =3D WALLCLOCK_CMOS;
> > > +    else if ( !strcmp("efi", arg) )
> > > +        /*
> > > +         * Checking if run-time services are available must be done =
after
> > > +         * command line parsing.
> > > +         */
> > > +        wallclock_source =3D WALLCLOCK_EFI;
> > > +    else
> > > +        return -EINVAL;
> > > +
> > > +    return 0;
> > > +}
> > > +custom_param("wallclock", parse_wallclock);
> > > +
> > >  static void __init probe_wallclock(void)
> > >  {
> > >      ASSERT(wallclock_source =3D=3D WALLCLOCK_UNSET);
> > > @@ -2527,7 +2556,15 @@ int __init init_xen_time(void)
> > > =20
> > >      open_softirq(TIME_CALIBRATE_SOFTIRQ, local_time_calibration);
> > > =20
> > > -    probe_wallclock();
> > > +    /*
> > > +     * EFI run time services can be disabled from the command line, =
hence the
> > > +     * check for them cannot be done as part of the wallclock option=
 parsing.
> > > +     */
> > > +    if ( wallclock_source =3D=3D WALLCLOCK_EFI && !efi_enabled(EFI_R=
S) )
> > > +        wallclock_source =3D WALLCLOCK_UNSET;
> > > +
> > > +    if ( wallclock_source =3D=3D WALLCLOCK_UNSET )
> > > +        probe_wallclock();
> >=20
> > I don't want to stand in the way, and I can live with this form, so I'd=
 like to
> > ask that EFI folks or Andrew provide the necessary A-b / R-b. I'd like =
to note
> > though that there continue to be quirks here. They may not be affecting=
 the
> > overall result as long as we have only three possible wallclocks, but t=
here
> > might be problems if a 4th one appeared.
> >=20
> > With the EFI_RS check in the command line handler and assuming the defa=
ult case
> > of no "efi=3Dno-rs" on the command line, EFI_RS may still end up being =
off by the
> > time the command line is being parsed. With "wallclock=3Dcmos wallclock=
=3Defi" this
> > would result in no probing and "cmos" chosen if there was that check in=
 place.
> > With the logic as added here there will be probing in that case. Replac=
e "cmos"
> > by a hypothetical non-default 4th wallclock type (i.e. probing picking =
"cmos"),
> > and I expect you can see how the result would then not necessarily be as
> > expected.
>=20
> My expectation would be that if "wallclock=3Dcmos wallclock=3Defi" is used
> the last option overrides any previous one, and hence if that last
> option is not valid the logic will fallback to the default selection
> (in this case to probing).

That would be my expectation too. If some kind of preference would be
expected, it should looks like wallclock=3Defi,cmos, but I don't think we
need that.

> Thinking about this, it might make sense to unconditionally set
> wallclock_source =3D WALLCLOCK_UNSET at the start of parse_wallclock()
> to avoid previous instances carrying over if later ones are not valid.

This may be a good idea. But more importantly, the behavior should be
included in the option documentation (that if a selected value is not
available, it fallback to auto). And maybe a log message when that
happens (but I'm okay with skipping this one, as selected wallclock
source is logged already)?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--YhAOuzDy+q6+jw/Q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmbi7PoACgkQ24/THMrX
1yzUCgf+PBKd0T9CXsbQda4IBRKClntXuQBjkeZxGsO/ja9TTJqlMywRhoAaNzao
CtE6lGKfVFMU3MoSwOYuTT3AJ327E0BfEX5nOrj+MFSDXVxc1OHeYkykP3r0mviX
eop72u1Lnoa3p7V+0x08Qc2Xl6gSNlY71wkHBwQA6NJ1KERgZTRgtvW7DEL8l4e0
A05J0ycM+IhNyiK7JQjMkknaij9b/sv2S9DWRv+om/FjYOPg9ce2CxLS3qIwU1N2
QHvVKc/XOFrlprTsTUcVXnKDnxSykYtnS9VycLUyp32HuPY/aCGIpS8F7ox0pFG8
LZidTdHfG+KFD+IlnrrR7CnBiYag2g==
=DV5v
-----END PGP SIGNATURE-----

--YhAOuzDy+q6+jw/Q--

