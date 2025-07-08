Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FED7AFD539
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 19:22:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1036960.1409557 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZC1P-0005JK-Md; Tue, 08 Jul 2025 17:22:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1036960.1409557; Tue, 08 Jul 2025 17:22:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZC1P-0005Ga-Hy; Tue, 08 Jul 2025 17:22:23 +0000
Received: by outflank-mailman (input) for mailman id 1036960;
 Tue, 08 Jul 2025 17:22:22 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=K7vD=ZV=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uZC1N-0005GG-VI
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 17:22:22 +0000
Received: from fhigh-a5-smtp.messagingengine.com
 (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 19cbebb1-5c20-11f0-a317-13f23c93f187;
 Tue, 08 Jul 2025 19:22:19 +0200 (CEST)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal
 [10.202.2.44])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 7CDC5140022A;
 Tue,  8 Jul 2025 13:22:18 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-04.internal (MEProxy); Tue, 08 Jul 2025 13:22:18 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 8 Jul 2025 13:22:17 -0400 (EDT)
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
X-Inumbo-ID: 19cbebb1-5c20-11f0-a317-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1751995338;
	 x=1752081738; bh=2lEng6asoAvcGg7V3LfCjoP5Fhm2pdlfgF5qmpECCsQ=; b=
	g94hMvIo9CdDYjOfTg8b3Qm2tZl0hdZ4zAEHYzZnLQWvnxl8IpURCaQ5a8SFGLKl
	YKla0zmff0afR3/1eTqJ9hZ7PclCE+kLg1ZS7uBxkvsk+vC6SfvyNEkbrWQUT54H
	4TpePasWB2WTf1ZG9RvrKhuBNxTumBpEvdAvDI367OewrK90FKpdqWBZDRTlSFiE
	w1OZlM/Nqj4tz6zMN2s1hgC1bRnZv4YONxLhP8khY+CNwCzGbbdrAGuvW7CvUxxQ
	AVAfVyEWQ58bZNoQAEIe/C8L3jrIDwLYRMu1N4XxVj0+5qFrjOOAJSf0dmJEOlDz
	rpSwtFwkxUPZBQJuBVypYw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1751995338; x=1752081738; bh=2lEng6asoAvcGg7V3LfCjoP5Fhm2pdlfgF5
	qmpECCsQ=; b=SWQLLNr4aJvsuYAnCHzIwdkF0+uerZxBN1GcOTGPRMEVa1bzJIz
	X6TPFuAhIMZAFtDEJV3GyJ1tA6XuyRbFlM5q3DPlq3RAalwrRifqjMLtNemkO8o8
	ce1Rf/VGhPTamQvIbBZOUzhSNr11APCkMJl/kqIj8K+fLabf0S77v7KOISk73ouB
	gCYfLgGpxgjEB066yszf8zpHDskrNiHe0kQ9FIBLrQ/KCkdeqsca3aTdGCEl6Uu/
	meLRGeBfBVeeNBAbAp7vrYxK6oCdjI5eWPGskJBXjSxmhj73sSgw3SWmpobfOoMT
	iZoWbfp/kqiJUWRl/4h3bkDL4yid6QstG+w==
X-ME-Sender: <xms:yVNtaN7J84j6f1mL13xB1QB6MChrh9kQij8BGqkSygsjCjVQgWO-og>
    <xme:yVNtaFd1vGEJl36XJHVHIEWVi1xEdX-Wpiki37Xz_6qQEZttTvnZzQShho4rhfC_h
    OynBND_W3dR7g>
X-ME-Received: <xmr:yVNtaBAu_mXDUSFfQ5haj101wl5bgy4eoNsOoTRXosrIxusiRL4YG37MyTnqVrn92xVIZ6g83OVySWreR2NYw9ZwdEovMLnWW08>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdefhedvjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghkucfo
    rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgudelteef
    vefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhn
    vhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeegpdhmoh
    guvgepshhmthhpohhuthdprhgtphhtthhopehjsggvuhhlihgthhesshhushgvrdgtohhm
    pdhrtghpthhtohepfhhrvgguihgrnhhordiiihhglhhiohestghlohhuugdrtghomhdprh
    gtphhtthhopeguphhsmhhithhhsegrphgvrhhtuhhsshholhhuthhiohhnshdrtghomhdp
    rhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdroh
    hrgh
X-ME-Proxy: <xmx:ylNtaI8ync6nQknyiK7eFyfVRTLpz3zWBVj-_uwzkTQTaVP3GmYY9w>
    <xmx:ylNtaMJOxSDAz21ZKBK1zPBLEVMK48J5ELjre-sK1gygqXLIzrEARA>
    <xmx:ylNtaBjoh5dsOurkWoTo_7_t8PVkztdApOoSLWtLCAC1vPxh8ItrEQ>
    <xmx:ylNtaM5IsIB4oWJpblV96I3QbY7cyOcXqEE0EmgSYgtN8qrCTelqIQ>
    <xmx:ylNtaMXBOslcvPCQQufgjCZjVU4aD23FP4UVf11b-HfKPnWIppMPFvSm>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 8 Jul 2025 19:22:14 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] xen/efi: Fix crash with initial empty EFI options
Message-ID: <aG1Tx5dYcOw8X7uw@mail-itl>
References: <20250708135701.119601-1-frediano.ziglio@cloud.com>
 <662366f6-7442-4b36-81a6-90ddcad6e59d@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dIzevSgriLcV0QOH"
Content-Disposition: inline
In-Reply-To: <662366f6-7442-4b36-81a6-90ddcad6e59d@suse.com>


--dIzevSgriLcV0QOH
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 8 Jul 2025 19:22:14 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Frediano Ziglio <frediano.ziglio@cloud.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v2] xen/efi: Fix crash with initial empty EFI options

On Tue, Jul 08, 2025 at 05:41:07PM +0200, Jan Beulich wrote:
> On 08.07.2025 15:56, Frediano Ziglio wrote:
> > EFI code path split options from EFI LoadOptions fields in 2
> > pieces, first EFI options, second Xen options.
> > "get_argv" function is called first to get the number of arguments
> > in the LoadOptions, second, after allocating enough space, to
> > fill some "argc"/"argv" variable. However the first parsing could
> > be different from second as second is able to detect "--" argument
> > separator. So it was possible that "argc" was bigger that the "argv"
> > array leading to potential buffer overflows, in particular
> > a string like "-- a b c" would lead to buffer overflow in "argv"
> > resulting in crashes.
> > Using EFI shell is possible to pass any kind of string in
> > LoadOptions.
> >=20
> > Fixes: bf6501a62e80 ("x86-64: EFI boot code")
>=20
> Have you convinced yourself that your change isn't a workaround for a
> bug elsewhere? You said you repro-ed with grub's chainloader, but that
> doesn't imply things are being got correct there. I can certainly
> accept that I may have screwed up back then. But I'd like to understand
> what the mistake was, and so far I don't see any. As before, being
> passed just "-- a b c" looks like a bug in the code generating the
> command line.

Even if that's invalid command line (is it? what if you want to pass
only options to dom0, but not to xen itself?), it shouldn't result in a
crash but in an error message.

> > @@ -429,7 +430,7 @@ static unsigned int __init get_argv(unsigned int ar=
gc, CHAR16 **argv,
> >          prev_sep =3D cur_sep;
> >      }
> >      if ( argv )
> > -        *argv =3D NULL;
> > +        argv[argc] =3D NULL;
>=20
> Strictly speaking the need for this sentinel now disappears, doesn't it?
> As does ...
>=20
> >      return argc;
> >  }
> > =20
> > @@ -1348,8 +1349,8 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE =
ImageHandle,
> >                                    (argc + 1) * sizeof(*argv) +
> >                                        loaded_image->LoadOptionsSize,
> >                                    (void **)&argv) =3D=3D EFI_SUCCESS )
> > -            get_argv(argc, argv, loaded_image->LoadOptions,
> > -                     loaded_image->LoadOptionsSize, &offset, &options);
> > +            argc =3D get_argv(argc, argv, loaded_image->LoadOptions,
> > +                            loaded_image->LoadOptionsSize, &offset, &o=
ptions);
> >          else
> >              argc =3D 0;
> >          for ( i =3D 1; i < argc; ++i )
>=20
> ... the need for
>=20
>             if ( !ptr )
>                 break;
>=20
> just out of context here?
>=20
> Jan

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--dIzevSgriLcV0QOH
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmhtU8YACgkQ24/THMrX
1yxMcggAiS2Lxhnz/kjpgSqij183TSrZQlRQtezqR+RN7tiq4/3GTaqKfhaU+Wc5
D/3mtpe59iKIDp6GLEvC7s7BtNIp/yiOX98QWO5NJu1JTFAVQplWwaQszGXikS+L
Kguu/iTcNkO/P95uQ4wgnav3EcKYuuLXi7XrZ+hsK0EJU/FpyA5defsm03zxHQvM
VkTCxAKjC1T+QDT8388dG5++uO6rWQ2nIyfoyLY/RAFokj+A2b77PkuP1fypBspv
98a6D1LbQNCTuNOcCLf50VCyN3plnokMoNbFAPVVEyVHh9faPYDHflnWsuwa7Mut
D7t/Wim/v0+oChxWNvuuobqK9NTHUQ==
=HhmJ
-----END PGP SIGNATURE-----

--dIzevSgriLcV0QOH--

