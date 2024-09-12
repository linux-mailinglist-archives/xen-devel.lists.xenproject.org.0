Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D67976B62
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2024 16:00:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.797521.1207494 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sokMC-0001Q3-BG; Thu, 12 Sep 2024 13:59:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 797521.1207494; Thu, 12 Sep 2024 13:59:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sokMC-0001Mz-87; Thu, 12 Sep 2024 13:59:36 +0000
Received: by outflank-mailman (input) for mailman id 797521;
 Thu, 12 Sep 2024 13:59:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kInE=QK=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1sokMA-0001Mt-QO
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2024 13:59:34 +0000
Received: from fhigh8-smtp.messagingengine.com
 (fhigh8-smtp.messagingengine.com [103.168.172.159])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3bcd4926-710f-11ef-99a1-01e77a169b0f;
 Thu, 12 Sep 2024 15:59:32 +0200 (CEST)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal
 [10.202.2.50])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 0AD7911404BD;
 Thu, 12 Sep 2024 09:59:31 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-10.internal (MEProxy); Thu, 12 Sep 2024 09:59:31 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 Sep 2024 09:59:29 -0400 (EDT)
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
X-Inumbo-ID: 3bcd4926-710f-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1726149571;
	 x=1726235971; bh=9SX5KOiDQADbUOKv1NMLkK95AqIZd46VkUhkctVMPbE=; b=
	UrTZ1H0yfiE80DmbVPDtbRpry06xbIHEd7seh7Ijq6YP4TSGoKuvc1Brn0/+hL6i
	tf3POGO8PW1hsBj/xHPDFBpUKS3+2uKgzQ6+khJTNxjVeFHyhMEO1Jkr8MWtezaX
	ElSrUGRFXrO7VzCLjslUAybSmRwL5vF9gTFEeLDFLAh6sFRebbozGtMHImka146t
	gKtEx9DqRpGwxXT6apwBuw1dX9//R6XmcwUhizKWc8krvS+096NbFueVphOmIvGl
	VtHac8ZsmVBEph2ZMcoNOftg5nL20Tc6wxU8QJUfH1kuYcUbIkrekbWxUFCjzOI6
	TFDGzlL3Teo7wrX4l8BYwA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1726149571; x=1726235971; bh=9SX5KOiDQADbUOKv1NMLkK95AqIZ
	d46VkUhkctVMPbE=; b=B1EkeDtf/YBeTn9yqNyrSKV1iz1Nc/e5X4Za8Ej9c4Dk
	PmlZkMSdIHG/RIoePIXwJ6aVXM8qXf6nl6JiLyUQ6c08rmkk+UQ34LJ98hrsxRjR
	nML0SuM+2eNMDVCcqPLSDo0ji4qRKO1AqzAc2IgZJUJZO4CIEWNr9xNfBHcc/oZn
	bSrl66ZMo0ahTgvlDpNIf4GVFnlXwf6EG6DYhIB9bSF/YrQlsqWk6vYPzOt+j3VT
	kLQJ1FqN+f/dG9ohsb1eeQL3dAA5ax/D3M6bU+Q3ClkaI6K8rHZjwDGHLsPhpJxL
	eNJM6vqV6q+vObUyc8BN57ncqzkg25tPlrTJ1BL64Q==
X-ME-Sender: <xms:wvPiZuGXG1xu3n4nVQAiofdNXAHCZLLM7o-pVHgxVeKXMDPzDdHKSg>
    <xme:wvPiZvXslWuyLpD1rSFjb_gpum6AZNxwXL1R7pSwnstKHj6aZV9-PuWyKsrf1Yszj
    uCbqYjcVVRO8g>
X-ME-Received: <xmr:wvPiZoJa9mCu-Xw52165CT6eNRSonpfi07krAcIujUPje-zi5Tfd6LG7ZErXXxzNBHf0RXon3-YUDa6RNP206YZTaDYVHYJBDw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudejfedgjedvucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:wvPiZoHB8A677iqkjE24xomumCjdeEXawlicp5r3KmGzWPaNlT_Gxw>
    <xmx:wvPiZkUOjCcp2uqqcAQRqUHJSKdygEWoEhJ9CFv5SAFcBSle1uZn4g>
    <xmx:wvPiZrOt9ikVV5i1L3oVx7X-7xIAHTBwKwLhhQU3YHB4jxedMMKWuQ>
    <xmx:wvPiZr1YuEvbktU1gXgzJHigf341Om2lX4J_Ag6TUiGrFLv8D5xdyg>
    <xmx:w_PiZmK3kneWw8Zzj22ZGM-Vt6bPNqCjhT7KPWr4Xen6adPzRQcAaFn_>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 12 Sep 2024 15:59:27 +0200
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
Message-ID: <ZuLzv2a5pp5yFNmc@mail-itl>
References: <20240912111514.26934-1-roger.pau@citrix.com>
 <20240912111514.26934-2-roger.pau@citrix.com>
 <51c8a98b-145c-4834-865c-b75b61f1d5b0@suse.com>
 <ZuLlF1PKSOmbqr8u@macbook.local>
 <ZuLs-htt3Kvw-M6A@mail-itl>
 <ZuLxCXuxFbJq-rK_@macbook.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9pmeCvxIqipccCDk"
Content-Disposition: inline
In-Reply-To: <ZuLxCXuxFbJq-rK_@macbook.local>


--9pmeCvxIqipccCDk
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Sep 2024 15:59:27 +0200
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

On Thu, Sep 12, 2024 at 03:47:53PM +0200, Roger Pau Monn=C3=A9 wrote:
> On Thu, Sep 12, 2024 at 03:30:29PM +0200, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > On Thu, Sep 12, 2024 at 02:56:55PM +0200, Roger Pau Monn=C3=A9 wrote:
> > > On Thu, Sep 12, 2024 at 01:57:00PM +0200, Jan Beulich wrote:
> > > > On 12.09.2024 13:15, Roger Pau Monne wrote:
> > > > > --- a/xen/arch/x86/time.c
> > > > > +++ b/xen/arch/x86/time.c
> > > > > @@ -1552,6 +1552,35 @@ static const char *__init wallclock_type_t=
o_string(void)
> > > > >      return "";
> > > > >  }
> > > > > =20
> > > > > +static int __init cf_check parse_wallclock(const char *arg)
> > > > > +{
> > > > > +    if ( !arg )
> > > > > +        return -EINVAL;
> > > > > +
> > > > > +    if ( !strcmp("auto", arg) )
> > > > > +        wallclock_source =3D WALLCLOCK_UNSET;
> > > > > +    else if ( !strcmp("xen", arg) )
> > > > > +    {
> > > > > +        if ( !xen_guest )
> > > > > +            return -EINVAL;
> > > > > +
> > > > > +        wallclock_source =3D WALLCLOCK_XEN;
> > > > > +    }
> > > > > +    else if ( !strcmp("cmos", arg) )
> > > > > +        wallclock_source =3D WALLCLOCK_CMOS;
> > > > > +    else if ( !strcmp("efi", arg) )
> > > > > +        /*
> > > > > +         * Checking if run-time services are available must be d=
one after
> > > > > +         * command line parsing.
> > > > > +         */
> > > > > +        wallclock_source =3D WALLCLOCK_EFI;
> > > > > +    else
> > > > > +        return -EINVAL;
> > > > > +
> > > > > +    return 0;
> > > > > +}
> > > > > +custom_param("wallclock", parse_wallclock);
> > > > > +
> > > > >  static void __init probe_wallclock(void)
> > > > >  {
> > > > >      ASSERT(wallclock_source =3D=3D WALLCLOCK_UNSET);
> > > > > @@ -2527,7 +2556,15 @@ int __init init_xen_time(void)
> > > > > =20
> > > > >      open_softirq(TIME_CALIBRATE_SOFTIRQ, local_time_calibration);
> > > > > =20
> > > > > -    probe_wallclock();
> > > > > +    /*
> > > > > +     * EFI run time services can be disabled from the command li=
ne, hence the
> > > > > +     * check for them cannot be done as part of the wallclock op=
tion parsing.
> > > > > +     */
> > > > > +    if ( wallclock_source =3D=3D WALLCLOCK_EFI && !efi_enabled(E=
FI_RS) )
> > > > > +        wallclock_source =3D WALLCLOCK_UNSET;
> > > > > +
> > > > > +    if ( wallclock_source =3D=3D WALLCLOCK_UNSET )
> > > > > +        probe_wallclock();
> > > >=20
> > > > I don't want to stand in the way, and I can live with this form, so=
 I'd like to
> > > > ask that EFI folks or Andrew provide the necessary A-b / R-b. I'd l=
ike to note
> > > > though that there continue to be quirks here. They may not be affec=
ting the
> > > > overall result as long as we have only three possible wallclocks, b=
ut there
> > > > might be problems if a 4th one appeared.
> > > >=20
> > > > With the EFI_RS check in the command line handler and assuming the =
default case
> > > > of no "efi=3Dno-rs" on the command line, EFI_RS may still end up be=
ing off by the
> > > > time the command line is being parsed. With "wallclock=3Dcmos wallc=
lock=3Defi" this
> > > > would result in no probing and "cmos" chosen if there was that chec=
k in place.
> > > > With the logic as added here there will be probing in that case. Re=
place "cmos"
> > > > by a hypothetical non-default 4th wallclock type (i.e. probing pick=
ing "cmos"),
> > > > and I expect you can see how the result would then not necessarily =
be as
> > > > expected.
> > >=20
> > > My expectation would be that if "wallclock=3Dcmos wallclock=3Defi" is=
 used
> > > the last option overrides any previous one, and hence if that last
> > > option is not valid the logic will fallback to the default selection
> > > (in this case to probing).
> >=20
> > That would be my expectation too. If some kind of preference would be
> > expected, it should looks like wallclock=3Defi,cmos, but I don't think =
we
> > need that.
> >=20
> > > Thinking about this, it might make sense to unconditionally set
> > > wallclock_source =3D WALLCLOCK_UNSET at the start of parse_wallclock()
> > > to avoid previous instances carrying over if later ones are not valid.
> >=20
> > This may be a good idea. But more importantly, the behavior should be
> > included in the option documentation (that if a selected value is not
> > available, it fallback to auto). And maybe a log message when that
> > happens (but I'm okay with skipping this one, as selected wallclock
> > source is logged already)?
>=20
> Thanks, would you be fine with:
>=20
> ### wallclock (x86)
> > `=3D auto | xen | cmos | efi`
>=20
> > Default: `auto`
>=20
> Allow forcing the usage of a specific wallclock source.
>=20
>  * `auto` let the hypervisor select the clocksource based on internal
>    heuristics.
>=20
>  * `xen` force usage of the Xen shared_info wallclock when booted as a Xen
>    guest.  This option is only available if the hypervisor was compiled w=
ith
>    `CONFIG_XEN_GUEST` enabled.
>=20
>  * `cmos` force usage of the CMOS RTC wallclock.
>=20
>  * `efi` force usage of the EFI_GET_TIME run-time method when booted from=
 EFI
>    firmware.
>=20
> If the selected option is not available Xen will default to `auto`.

Looks good.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--9pmeCvxIqipccCDk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmbi878ACgkQ24/THMrX
1yzvfAf8DUw5Fo4sdy0PoB4Y+FQmWwZY07xc6AOVM3kG44Bkf14QO5jJLkME9ZwV
qXFyewe+N2+zcPSaG3of2Ax2BOPCsLwaS1goTAIy+Ttn1Ep1GZSSELjtZrsQCIhQ
UWpnQWeIDFSu87WyxC5VYuLXyKv4s8s9YdnO6F+hXLSrbal7DoMCWObkHkRoXpjJ
w09Erz9TkEHJkNFNXJXI2usXxwgN3//wC+cBxBDDOu9k0wSXIO9acopJ8nb2OVzY
lNq4wCT8jUtY9UqutEOH5MPreZ10CVNSCbYoAMnJ+7d9LD69zeVf8+nl/N/t+SAX
lSkKZuFwYP0CtLBUHCya8kYFkVUGjw==
=8sHb
-----END PGP SIGNATURE-----

--9pmeCvxIqipccCDk--

