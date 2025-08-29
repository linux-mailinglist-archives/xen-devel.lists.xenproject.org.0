Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BED50B3B1F6
	for <lists+xen-devel@lfdr.de>; Fri, 29 Aug 2025 06:07:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1100490.1453910 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urqO7-00055R-04; Fri, 29 Aug 2025 04:06:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1100490.1453910; Fri, 29 Aug 2025 04:06:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1urqO6-00053n-TJ; Fri, 29 Aug 2025 04:06:54 +0000
Received: by outflank-mailman (input) for mailman id 1100490;
 Fri, 29 Aug 2025 04:06:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UceS=3J=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1urqO5-00053h-31
 for xen-devel@lists.xenproject.org; Fri, 29 Aug 2025 04:06:53 +0000
Received: from fhigh-b3-smtp.messagingengine.com
 (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 964b9aa5-848d-11f0-8dd7-1b34d833f44b;
 Fri, 29 Aug 2025 06:06:50 +0200 (CEST)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
 by mailfhigh.stl.internal (Postfix) with ESMTP id F219B7A017E;
 Fri, 29 Aug 2025 00:06:48 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-03.internal (MEProxy); Fri, 29 Aug 2025 00:06:49 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 29 Aug 2025 00:06:47 -0400 (EDT)
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
X-Inumbo-ID: 964b9aa5-848d-11f0-8dd7-1b34d833f44b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1756440408;
	 x=1756526808; bh=w+qvlJ6G851p21YYLT2tiVTZYY83pLg+4pXtJ53wR+4=; b=
	HnksmT3rFMgy4rNPUD0opAm6bgixJjbUaQdqASakjOt+OX18C9uD0jugV/S37q5y
	WVCIuPrIK1+rbwncNwn9HGYzg9vJ5K86BCv5tnX+JDlv/6u2t3erRhdT2UqDcLsl
	7Cbmnuz3d4uddSK8jIQFHUFGXGVL3V6sqDlEyfdrCOeXZWPKM6EqN2IgjgPzyzHB
	4S3sU6y1UJGCxIE4O1o1VmKGsJyOROsj2aMvw07JSINpA4ozJOuUA2m0zBOPf+WT
	rFTJgt6pOJ5DzaFXsJSForPLfnBjHERbMq7M8wxw4TEA74jiRkdQ4w5YzYVQOy12
	rgumGeJRpEyTkS+n3bzG+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1756440408; x=1756526808; bh=w+qvlJ6G851p21YYLT2tiVTZYY83pLg+4pX
	tJ53wR+4=; b=iXSQIIwkma5QTjbSlbMiQ1XYvs5WmIVaD14Qw0kngeemjDYlgpI
	YliCzXAvTPkvHzSffbFo6Z78/Im2qf8DRIBPyKxybmoXOA/9V1XL9PUhf6tnAU5P
	VjWC1xOWcngGzBAjHalPyDhLTvA0Ppd8q2sN/p6zvO5ERC+CojdAOBDqFAxWy/Xm
	b7N7CDLSwZatOs3L9L9zydpFh/XU15aQu8c/13rGukJ6g979HwVGKOIK2lPRdemO
	ciHqny7ZGBIhz24NM8SOYGQDkot+jK16hXPmI4BvYyiaoobAnCS16cQOMnEseekZ
	8I4HxFUQavq/ua1sh51QntL6YHMJ94/43hQ==
X-ME-Sender: <xms:WCexaK2DdbGMQeIOpfM5vZl4-siEycAOaVMAHfnjBtdmvnyr8x1cWw>
    <xme:WCexaHqMvPqnh7o2UhVdbjR-GgS46vxp1iV8p7j1UUZv5lT7t4HameRnCxtNteRlg
    PCcaRQntfZ49g>
X-ME-Received: <xmr:WCexaPd5FU4o2Qaw9yE5LtIIdbVxFS48zswqk5MvYpOzfm1E3gcADT-iePKZXEt2r9amCQFL6R2sAFE9zQXRGVYTg8VUwW4XSXg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgddukedvkeekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfduleet
    feevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepgedpmh
    houggvpehsmhhtphhouhhtpdhrtghpthhtohepfhhrvgguihgrnhhordiiihhglhhiohes
    tghlohhuugdrtghomhdprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvg
    hnphhrohhjvggtthdrohhrghdprhgtphhtthhopeguphhsmhhithhhsegrphgvrhhtuhhs
    shholhhuthhiohhnshdrtghomhdprhgtphhtthhopehjsggvuhhlihgthhesshhushgvrd
    gtohhm
X-ME-Proxy: <xmx:WCexaOoNrtkC0PRGvfjWmF5cUvri1BocSW-r8pL0QXRGjuehVEdr4g>
    <xmx:WCexaIF26h3yp_nGxdT-7pg0ElTLkbinXTy9J2DvHRy5imnFN9DwDw>
    <xmx:WCexaGtuIwglJZ9dBAqM8QKRSybzPUzx9ZkPJuy0RsNSms9_fi6_hw>
    <xmx:WCexaCUMG_xvDjnFQ5rbgZReu7hdf2QGHmaTr8PhkDKHrNjNHYsG5w>
    <xmx:WCexaCxMYJ_1xmzlihBsOJxLV2f3UsDBZoLosMpeVAd-aRxAGW034ke7>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 29 Aug 2025 06:06:45 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v2] xen/efi: Fix crash with initial empty EFI options
Message-ID: <aLEnVSCil2JtDiFY@mail-itl>
References: <20250708135701.119601-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tBbIxz5i4JPwS3AS"
Content-Disposition: inline
In-Reply-To: <20250708135701.119601-1-frediano.ziglio@cloud.com>


--tBbIxz5i4JPwS3AS
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 Aug 2025 06:06:45 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v2] xen/efi: Fix crash with initial empty EFI options

On Tue, Jul 08, 2025 at 02:56:58PM +0100, Frediano Ziglio wrote:
> EFI code path split options from EFI LoadOptions fields in 2
> pieces, first EFI options, second Xen options.
> "get_argv" function is called first to get the number of arguments
> in the LoadOptions, second, after allocating enough space, to
> fill some "argc"/"argv" variable. However the first parsing could
> be different from second as second is able to detect "--" argument
> separator. So it was possible that "argc" was bigger that the "argv"
> array leading to potential buffer overflows, in particular
> a string like "-- a b c" would lead to buffer overflow in "argv"
> resulting in crashes.

I wouldn't call it "buffer overflow" - the argv array is big enough
here. But if there is "--" in cmdline, it has fewer than argc elements
initialized. If there is at least one efi option (IOW, "--" is not the
first one), the sentinel NULL inserted by get_argv() will prevent
reading past the initialized part. But if "--" is the first one, the
NULL is inserted into argv[0], which is skipped by the loop in
efi_start(). Which makes the loop go beyond initialized part of argv
(crash happens even before it goes beyond end of argv allocation).

So, maybe change it to: bigger than the initialized portion of "argv"
array, leading to potential uninitialized pointer dereference, ...?

> Using EFI shell is possible to pass any kind of string in
> LoadOptions.
>=20
> Fixes: bf6501a62e80 ("x86-64: EFI boot code")

Technically, the issue was covered for few months by another issue and
got re-exposed by 926e680aadde ("EFI: suppress bogus loader warning").
While it fixed one issue, it also made it possible to put sentinel NULL
into argv[0] again. But the original EFI code had this issue too, so
IMO the Fixes tag is correct.

While there is convention to put file name as the first option, I don't
see anything in the UEFI spec requiring it. So, Xen should not crash
when it's missing.

> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>

With commit message adjusted:
Reviewed-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.c=
om>

> ---
> Changes since v1:
> - use argc to make code more clear;
> - fix commit reference;
> - improve commit message.
> ---
>  xen/common/efi/boot.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
>=20
> diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> index 9306dc8953..385292ad4e 100644
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -350,10 +350,11 @@ static unsigned int __init get_argv(unsigned int ar=
gc, CHAR16 **argv,
> =20
>      if ( argc )
>      {
> +        argc =3D 0;
>          cmdline =3D data + *offset;
>          /* EFI_LOAD_OPTION does not supply an image name as first compon=
ent. */
>          if ( *offset )
> -            *argv++ =3D NULL;
> +            argv[argc++] =3D NULL;
>      }
>      else if ( size > sizeof(*cmdline) && !(size % sizeof(*cmdline)) &&
>                (wmemchr(data, 0, size / sizeof(*cmdline)) =3D=3D
> @@ -414,14 +415,14 @@ static unsigned int __init get_argv(unsigned int ar=
gc, CHAR16 **argv,
>                  ++argc;
>              else if ( prev && wstrcmp(prev, L"--") =3D=3D 0 )
>              {
> -                --argv;
> +                --argc;
>                  if ( options )
>                      *options =3D cmdline;
>                  break;
>              }
>              else
>              {
> -                *argv++ =3D prev =3D ptr;
> +                argv[argc++] =3D prev =3D ptr;
>                  *ptr =3D *cmdline;
>                  *++ptr =3D 0;
>              }
> @@ -429,7 +430,7 @@ static unsigned int __init get_argv(unsigned int argc=
, CHAR16 **argv,
>          prev_sep =3D cur_sep;
>      }
>      if ( argv )
> -        *argv =3D NULL;
> +        argv[argc] =3D NULL;
>      return argc;
>  }
> =20
> @@ -1348,8 +1349,8 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE Im=
ageHandle,
>                                    (argc + 1) * sizeof(*argv) +
>                                        loaded_image->LoadOptionsSize,
>                                    (void **)&argv) =3D=3D EFI_SUCCESS )
> -            get_argv(argc, argv, loaded_image->LoadOptions,
> -                     loaded_image->LoadOptionsSize, &offset, &options);
> +            argc =3D get_argv(argc, argv, loaded_image->LoadOptions,
> +                            loaded_image->LoadOptionsSize, &offset, &opt=
ions);
>          else
>              argc =3D 0;
>          for ( i =3D 1; i < argc; ++i )
> --=20
> 2.43.0
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--tBbIxz5i4JPwS3AS
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmixJ1UACgkQ24/THMrX
1yxlcgf/UIdK3nGShLUt2TD8cVy/hVz11YNYuVuXMQuuScYifCSc37fhlw3P5DqC
kkVD1CtQabvjc4i4LBUMpQfUrM/knYTsYFqVcKwkZQBqTY2voixdpM1YRXpn/24b
Ifi9FmhbmXagZlbRDo+nkP94Ccf/VXeyokMtbGgDuPI0a8gxFn25k5TrFCE5lo14
RzqzLKM8oxILMOZNFsj6iKuSYnu3/bbRS6TnbAcCuXG+ZoYNi7yMW3fKap79NDeW
uSMaA86ZbeNHmEPgc4rLAUjW/PBqilUSjcWqyxRbQvZtId+HzOMES5RtiUfPexgT
azVwVwO1trOOrF8CvrM+ukXd2KLtSQ==
=6cn5
-----END PGP SIGNATURE-----

--tBbIxz5i4JPwS3AS--

