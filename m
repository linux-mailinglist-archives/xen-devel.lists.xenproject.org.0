Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D7AB1536E
	for <lists+xen-devel@lfdr.de>; Tue, 29 Jul 2025 21:33:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1062992.1428753 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugq45-0005Rh-6v; Tue, 29 Jul 2025 19:32:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1062992.1428753; Tue, 29 Jul 2025 19:32:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ugq45-0005PI-2Q; Tue, 29 Jul 2025 19:32:45 +0000
Received: by outflank-mailman (input) for mailman id 1062992;
 Tue, 29 Jul 2025 19:32:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FK0b=2K=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1ugq42-0005P8-OR
 for xen-devel@lists.xenproject.org; Tue, 29 Jul 2025 19:32:42 +0000
Received: from fhigh-b6-smtp.messagingengine.com
 (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c9f16ae0-6cb2-11f0-a320-13f23c93f187;
 Tue, 29 Jul 2025 21:32:40 +0200 (CEST)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal
 [10.202.2.50])
 by mailfhigh.stl.internal (Postfix) with ESMTP id F36D27A0093;
 Tue, 29 Jul 2025 15:32:38 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-10.internal (MEProxy); Tue, 29 Jul 2025 15:32:39 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 29 Jul 2025 15:32:37 -0400 (EDT)
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
X-Inumbo-ID: c9f16ae0-6cb2-11f0-a320-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1753817558;
	 x=1753903958; bh=XubVYMv3W8ABTX3u5VGOiZiVJvO6FFXh2KfnU/zZIMk=; b=
	fulNF+A12psHSV0MAsr0zObxiJhft309tMaIAe92pCsvv8GovIhdAMZJT1HqigtA
	w5Lfmg1s2rspVOG2ztBCOFiVDWNE4dYWm7dQfeILz6ByR7EFprYbeYKYi+3ECkrP
	ShXcw2Uit+Uqr3WKixxbDDf1F43MssiK/jHrUB5j6uu7DN/T74177fGDGELIgH3w
	WtL7MNc0FqYpR5tmL4G65U4eCiF0fnpOafFtiDTj0Ppgx3yFQefofdAEAi4gTDBO
	HkMs7CjcXgMnG/g915btEJGEw2kSTjIfk7kaB5tC8jMZDyRXGLUymt+bHLCBEit6
	s10W5Uw9B++Gz0REwWpWRg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1753817558; x=1753903958; bh=XubVYMv3W8ABTX3u5VGOiZiVJvO6FFXh2Kf
	nU/zZIMk=; b=CZ37plvIJufpmX42z860a8QhscmwpIM+4fRZs3qb6UQhm+LIu7R
	bMlfuYKJZdjMAJxdvCo6KLC2Dk3k7rBENaOI6nS+DJRYWDZNrA9l3mWSqkTKCkSg
	V8xF+NTmFg5JJ3doPBkwkyaMW+YSyoUMBOYrD2cGj4aAq1eQmQEbIKshTS365FJQ
	aYpIqyafMsftV5vR+fpbp6uHWcZe+871mgbFSVl6wuFJ6akmDJIh8AnuRVRXbn0v
	lvwJ2LQ2FPsj+ClxQF11Ui8ivXdqr0s/lUfbZ3DeWmK1hxkR0IfJpaVfJZV9xWwo
	UszA9xhZiOwF5FzIQXSaoJZ17N4BPmIowdw==
X-ME-Sender: <xms:1iGJaEqAus6UIeOM4-F6TKdsYrfKzL1Bi8nMp-VWU23Jw90maz7IzA>
    <xme:1iGJaGKu9aetNFEDRBLLjeQ3yKDlCUnCGjYzW65lttLfZ2QIHKjF0SVeGU-1NPh-0
    YmVxCpTIldPnQ>
X-ME-Received: <xmr:1iGJaPp1QIJJLml1E32mueCwno2G2vyZrjqgk1E-HRJtY_9QDIvSyiqKgGQOJsVVIUabsMzR4HSMnEmNr9AgPx0YP3yOHryt_-s>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdelheeltdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghkucfo
    rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgudelteef
    vefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhn
    vhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeehpdhmoh
    guvgepshhmthhpohhuthdprhgtphhtthhopehfrhgvughirghnohdriihighhlihhosegt
    lhhouhgurdgtohhmpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnh
    hprhhojhgvtghtrdhorhhgpdhrtghpthhtohepughpshhmihhthhesrghpvghrthhushhs
    ohhluhhtihhonhhsrdgtohhmpdhrtghpthhtohepjhgsvghulhhitghhsehsuhhsvgdrtg
    homhdprhgtphhtthhopegrnhgurhgvfidrtghoohhpvghrfeestghithhrihigrdgtohhm
X-ME-Proxy: <xmx:1iGJaGyU_iIzep3MnEeLdIGVj9mPT1kp89XJFS5iu8EdF3o-0o_Hlw>
    <xmx:1iGJaLOTSh-zLikhHEiJ-7Ie-YxA1_5sIlB3KdYGC2r2ACXlrFLdaQ>
    <xmx:1iGJaD79sAz8V8OyH6mZLYCFzQHxBIclukA4NUTda_DfDUnMv4wX2Q>
    <xmx:1iGJaMnIepu_gTtfEwbF0eg0_HjqPS51vs0o8FTTASqL3rPKOntYbg>
    <xmx:1iGJaONkOD7sG-Pyl2BJtgApWg7eNeu3JJSYV6U3Gbn7FEiWqyiAwMVf>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 29 Jul 2025 21:32:35 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] xen/efi: Reduce variable scope to void compiler warning
Message-ID: <aIkh0zTDV-OCZELz@mail-itl>
References: <20250721083707.7964-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="t3F2Rds0loUM98bE"
Content-Disposition: inline
In-Reply-To: <20250721083707.7964-1-frediano.ziglio@cloud.com>


--t3F2Rds0loUM98bE
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Jul 2025 21:32:35 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH] xen/efi: Reduce variable scope to void compiler warning

On Mon, Jul 21, 2025 at 09:37:06AM +0100, Frediano Ziglio wrote:
> This change removes some pieve of code working around with
> some compiler warnings.
> No functional change.
>=20
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>

Acked-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

> ---
>  xen/common/efi/boot.c | 15 ++++-----------
>  1 file changed, 4 insertions(+), 11 deletions(-)
>=20
> diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> index 6c2ef13bc5..80d60ed54f 100644
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -1320,8 +1320,8 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE Im=
ageHandle,
>      static EFI_GUID __initdata shim_lock_guid =3D SHIM_LOCK_PROTOCOL_GUI=
D;
>      EFI_LOADED_IMAGE *loaded_image;
>      EFI_STATUS status;
> -    unsigned int i, argc;
> -    CHAR16 **argv, *file_name, *cfg_file_name =3D NULL, *options =3D NUL=
L;
> +    unsigned int i;
> +    CHAR16 *file_name, *cfg_file_name =3D NULL, *options =3D NULL;
>      UINTN gop_mode =3D ~0;
>      EFI_SHIM_LOCK_PROTOCOL *shim_lock;
>      EFI_GRAPHICS_OUTPUT_PROTOCOL *gop =3D NULL;
> @@ -1352,6 +1352,8 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE Im=
ageHandle,
> =20
>      if ( use_cfg_file )
>      {
> +        unsigned int argc;
> +        CHAR16 **argv;
>          UINTN offset =3D 0;
> =20
>          argc =3D get_argv(0, NULL, loaded_image->LoadOptions,
> @@ -1405,15 +1407,6 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE I=
mageHandle,
>          if ( !base_video )
>              efi_console_set_mode();
>      }
> -    else
> -    {
> -        /*
> -         * Some compilers may emit a false "uninitialized use" warning f=
or argc,
> -         * so initialize argc/argv here to avoid the warning.
> -         */
> -        argc =3D 0;
> -        argv =3D NULL;
> -    }
> =20
>      PrintStr(L"Xen " XEN_VERSION_STRING XEN_EXTRAVERSION
>  	     " (c/s " XEN_CHANGESET ") EFI loader\r\n");
> --=20
> 2.43.0
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--t3F2Rds0loUM98bE
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmiJIdMACgkQ24/THMrX
1yxxLgf/Qa5JJqN2wsZW/NiBUvARvUjVIIDgf5EJconG10vW6PNKhH+1u8TcBsUu
9xIGCd72Ggf47Liu210si+P/TXMUXMLgCvdD4TdYxK3QfW3oJqBBiHPuHNJqDiq8
P+S6jPugS6OkL7VwiscZn++317ooIEmxsjod/wYjUOykyZQ5qx8vaIQDKEX5tlUQ
O3wAoRAnX/DlkXOzESFYby6Fvb4WSMPkcDyKNI4ckPLRLhMz0+u804XiSJCQwMfN
KOH6kSGZ3XLuW/wivgqAtDggUQK+uyzFwz1SUm6TALjRa0c/dtsyT0q4oT/TPaCY
U7ZpZejhDJw0tF68KhAWQ082K3MLQw==
=nYD1
-----END PGP SIGNATURE-----

--t3F2Rds0loUM98bE--

