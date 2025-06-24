Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC9E9AE690B
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 16:39:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023801.1399871 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU4nq-0001Um-PY; Tue, 24 Jun 2025 14:39:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023801.1399871; Tue, 24 Jun 2025 14:39:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU4nq-0001TK-LU; Tue, 24 Jun 2025 14:39:14 +0000
Received: by outflank-mailman (input) for mailman id 1023801;
 Tue, 24 Jun 2025 14:39:12 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fpib=ZH=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uU4no-0001TC-Lt
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 14:39:12 +0000
Received: from fhigh-b6-smtp.messagingengine.com
 (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fde1818f-5108-11f0-a30f-13f23c93f187;
 Tue, 24 Jun 2025 16:39:11 +0200 (CEST)
Received: from phl-compute-09.internal (phl-compute-09.phl.internal
 [10.202.2.49])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 993527A01A0;
 Tue, 24 Jun 2025 10:39:10 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-09.internal (MEProxy); Tue, 24 Jun 2025 10:39:10 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Jun 2025 10:39:08 -0400 (EDT)
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
X-Inumbo-ID: fde1818f-5108-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1750775950;
	 x=1750862350; bh=W52Wu+jkJr796AN2LGGOEbnR5/30FkLvN8/chEch3p4=; b=
	JHjcofCwz6MEA1UNCeICT6PP9RAzzBixa5G5PtdQUhOlmiUcjYynZ/a5wxcg+fxc
	xBI4DHZ+xYWb1eOiYFCK1fuHDY03vpDApNvWqeU+OksSdOn9mql0OOYwMG49HZHr
	r78rqYM+Yaki+VLSl5VwHzUsZDXP8a6G717Zy7hAgNOuS/1okuBWtf9QyP2N6Tae
	niHPbphXKVqi7mWJcJxIhX6NZLU6WjTWoayLWQ3lR4EEzzU0eBowVcUaD2USM9TR
	OKmHuhcERGTc093nbr7lEPhA3WdUoE5kYGIGGRJbqYnC4sb1WNd8nJS2GuigUatE
	09D/Qes0ZUMzRQWDDSRedQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1750775950; x=1750862350; bh=W52Wu+jkJr796AN2LGGOEbnR5/30FkLvN8/
	chEch3p4=; b=Fk+ysJ8WOORw7Buaa3RTsqVstKUQaNjGyaTeMIhaRLeHDWhA9Yg
	Xmts17pwiMQxk2CRxctKOYx/ONq7iER5hytoScKiO07gyZuCVGUYX1TKOD7se4uU
	bV634deORriP42stHPW4YPID+YMTdGLhCkzzJKXvUXfANJuWeJc0YIonMDtVmNhV
	gyk4iHCWpug6CTgoRqoTz0awP++FqvJed55iX4TDt6/u+4+MbY52Aa7f/e+bBRqd
	9OA8Wmn7aOQdx7byyfH7F1rlVAq6CFQ+zvw/IEctDIWnV7vd76sQg4U0zpjqY75D
	UWlJ9BJf9gtDnhTHVD006n6RFiR7h+PuQyQ==
X-ME-Sender: <xms:jrhaaFLLQWA3MJ6pQemJ7HnQM3UypP7eGbUyRMVBMYpUWN1qL363tg>
    <xme:jrhaaBJaPeyP7oxLX2BnxHahV3SREpCCCeO1l9n_MsKN9UKMCfuWFKQltB3vLSGfw
    5eylaSw_2SLww>
X-ME-Received: <xmr:jrhaaNvdA1FWAqJw3XSwlBAQZsdMv_PH5S-zLmtfuF7pBRs4MF6sllGPgs8xNlW7M5Ea4AV6uDeMFUsei_O2Xtng0_MWAANmbRU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgddvtdduhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghkucfo
    rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgudelteef
    vefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhn
    vhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeegpdhmoh
    guvgepshhmthhpohhuthdprhgtphhtthhopehfrhgvughirghnohdriihighhlihhosegt
    lhhouhgurdgtohhmpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnh
    hprhhojhgvtghtrdhorhhgpdhrtghpthhtohepughpshhmihhthhesrghpvghrthhushhs
    ohhluhhtihhonhhsrdgtohhmpdhrtghpthhtohepjhgsvghulhhitghhsehsuhhsvgdrtg
    homh
X-ME-Proxy: <xmx:jrhaaGakv6xGDBsij_gzJXTlMhk4gQOPXhKF-QOppN-1fGy66pnldA>
    <xmx:jrhaaMZnmPnPy2u_RzaUziS8zSMndq7avba2BC3SF_L95au44wbMaw>
    <xmx:jrhaaKCvjhIJ3ZgJTDNvWAq6a01ezs8JRZcmDTFavmESBzQ1MrFC_A>
    <xmx:jrhaaKYYqDLVW4SNeCwwltAbuuwLdHDL9esQQuB0j7K6oUfe3avUfQ>
    <xmx:jrhaaIGr9YsJIqzqOdssizi9TYnIttqAr2FSBp7Q68SIGGVbjzU8Aaee>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 24 Jun 2025 16:39:07 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v2 1/2] xen/efi: Handle cases where file didn't come from
 ESP
Message-ID: <aFq4i_lfznUXZpWt@mail-itl>
References: <20250624142711.54925-1-frediano.ziglio@cloud.com>
 <20250624142711.54925-2-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4qOJssDTK0c5RCyZ"
Content-Disposition: inline
In-Reply-To: <20250624142711.54925-2-frediano.ziglio@cloud.com>


--4qOJssDTK0c5RCyZ
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Jun 2025 16:39:07 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v2 1/2] xen/efi: Handle cases where file didn't come from
 ESP

On Tue, Jun 24, 2025 at 03:27:08PM +0100, Frediano Ziglio wrote:
> A boot loader can load files from outside ESP.
> In these cases device could be not provided or path could
> be something not supported.
> In these cases allows to boot anyway, all information
> could be provided using UKI or using other boot loader
> features.
>=20
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>

Acked-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

> ---
> Changes since v1:
> - set "leaf" to NULL instead of a buffer with an empty string;
> - keep read_file fatal if cannot load file (except configuration).
> ---
>  xen/common/efi/boot.c | 34 +++++++++++++++++++++++++++++-----
>  1 file changed, 29 insertions(+), 5 deletions(-)
>=20
> diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> index 1a9b4e7dae..b18af2f1f4 100644
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -443,6 +443,18 @@ static EFI_FILE_HANDLE __init get_parent_handle(cons=
t EFI_LOADED_IMAGE *loaded_i
>      CHAR16 *pathend, *ptr;
>      EFI_STATUS ret;
> =20
> +    /*
> +     * In some cases the image could not come from a specific device.
> +     * For instance this can happen if Xen was loaded using GRUB2 "linux"
> +     * command.
> +     */
> +    *leaf =3D NULL;
> +    if ( !loaded_image->DeviceHandle )
> +    {
> +        PrintStr(L"Xen image loaded without providing a device\r\n");
> +        return NULL;
> +    }
> +
>      do {
>          EFI_FILE_IO_INTERFACE *fio;
> =20
> @@ -466,7 +478,15 @@ static EFI_FILE_HANDLE __init get_parent_handle(cons=
t EFI_LOADED_IMAGE *loaded_i
> =20
>          if ( DevicePathType(dp) !=3D MEDIA_DEVICE_PATH ||
>               DevicePathSubType(dp) !=3D MEDIA_FILEPATH_DP )
> -            blexit(L"Unsupported device path component");
> +        {
> +            /*
> +             * The image could come from an unsupported device.
> +             * For instance this can happen if Xen was loaded using GRUB2
> +             * "chainloader" command and the file was not from ESP.
> +             */
> +            PrintStr(L"Unsupported device path component\r\n");
> +            return NULL;
> +        }
> =20
>          if ( *buffer )
>          {
> @@ -772,8 +792,11 @@ static bool __init read_file(EFI_FILE_HANDLE dir_han=
dle, CHAR16 *name,
> =20
>      if ( !name )
>          PrintErrMesg(L"No filename", EFI_OUT_OF_RESOURCES);
> -    ret =3D dir_handle->Open(dir_handle, &FileHandle, name,
> -                           EFI_FILE_MODE_READ, 0);
> +    if ( dir_handle )
> +        ret =3D dir_handle->Open(dir_handle, &FileHandle, name,
> +                               EFI_FILE_MODE_READ, 0);
> +    else
> +        ret =3D EFI_NOT_FOUND;
>      if ( file =3D=3D &cfg && ret =3D=3D EFI_NOT_FOUND )
>          return false;
>      if ( EFI_ERROR(ret) )
> @@ -1404,7 +1427,7 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE Im=
ageHandle,
>          /* Read and parse the config file. */
>          if ( read_section(loaded_image, L"config", &cfg, NULL) )
>              PrintStr(L"Using builtin config file\r\n");
> -        else if ( !cfg_file_name )
> +        else if ( !cfg_file_name && file_name)
>          {
>              CHAR16 *tail;
> =20
> @@ -1515,7 +1538,8 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE Im=
ageHandle,
>          efi_bs->FreePages(cfg.addr, PFN_UP(cfg.size));
>          cfg.addr =3D 0;
> =20
> -        dir_handle->Close(dir_handle);
> +        if ( dir_handle )
> +            dir_handle->Close(dir_handle);
> =20
>          if ( gop && !base_video )
>          {
> --=20
> 2.43.0
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--4qOJssDTK0c5RCyZ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmhauIsACgkQ24/THMrX
1yx6OQf+PH7GKtDpAMx6h3t2OCITY5qSCjnr74XiWl9Vj2WHQGfHD04Qo7XvaODL
KxL3C3sWNS35BEbR8XJ/Mlaa77KKSjz+sMxnJtoC12F84XCkPlr016SHf6MX2bGn
xPBv1V/hnzCo82a8guJfbMQQDwhQ2Ml2HjdcXqQg0uHF2xY8L/oTltjzk6GYxIq6
qXIiHSyp5gabzt9PflegPW8CoL1M0hWOAhnWoXesI+pRfsCBsAqtmj3VVjy0hEpz
p1n8pyJuZULobpxZ1O7DLNZhlvnCYeySBhGUUpFjWZvkZEDMD0b4a23MHUzbK+vJ
nVLSj0bThnn2xiyuWdoEGX+bm+TLsQ==
=NmM9
-----END PGP SIGNATURE-----

--4qOJssDTK0c5RCyZ--

