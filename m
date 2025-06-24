Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5242AE6533
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 14:39:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023637.1399636 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU2v4-0002Ax-21; Tue, 24 Jun 2025 12:38:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023637.1399636; Tue, 24 Jun 2025 12:38:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU2v3-000283-VY; Tue, 24 Jun 2025 12:38:33 +0000
Received: by outflank-mailman (input) for mailman id 1023637;
 Tue, 24 Jun 2025 12:38:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fpib=ZH=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uU2v2-00027x-6z
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 12:38:32 +0000
Received: from fhigh-b5-smtp.messagingengine.com
 (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 218ffeb2-50f8-11f0-a30f-13f23c93f187;
 Tue, 24 Jun 2025 14:38:30 +0200 (CEST)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal
 [10.202.2.45])
 by mailfhigh.stl.internal (Postfix) with ESMTP id AAE3D7A0136;
 Tue, 24 Jun 2025 08:38:28 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-05.internal (MEProxy); Tue, 24 Jun 2025 08:38:28 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Jun 2025 08:38:26 -0400 (EDT)
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
X-Inumbo-ID: 218ffeb2-50f8-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1750768708;
	 x=1750855108; bh=JgxsKQcCxG7jaWZi5t/3ZSbAPgDnmVw9S0ZC4z0+eEg=; b=
	JMyc9pIYgVPAZQ3YizG3QrDH83bj71R6gavq3TgaNfN3gKcQ/ULisk3TCuisjDJf
	9L2SitgE6P+lhp8d7S47JvZbiqDBNJ5cTQCt5r25YHxqZDjPnBi4P257JgldXKOR
	s+TS8CQ4HHJp+13AlrD41xLGnPZr8zzYIvOX5vfV1PMqGPkFnMrNw0e9EUnamqtX
	Io6ej7YWSt+R/m1iHllvuRUWjUMicWt86/t2WCAJ+PavlI2ra47ycDN/tLcqb9vD
	6s0ZkNBOEufQDQAh3Ln8W2Ii2fpPElAM8K8wvzlKwJXwKoEC29pnYfGjNi7DqKlj
	aqTZrLo+2YF+pld2OwZKhg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1750768708; x=1750855108; bh=JgxsKQcCxG7jaWZi5t/3ZSbAPgDnmVw9S0Z
	C4z0+eEg=; b=h1ezKYW1ehowNNWix6MML1FHj/XsvuXjwPmmnQJ4oVrj3aVRvMh
	eX9XfN3iDtFoDVETzIqYo83x93tUnkxmYQdlPrex7pHDOKsGR9hHfv26w0Sfeygb
	FLpyZTcwkz5sJo/hBfEbGw1gg1nl4vIFp2580QbEMxvP/GU/G93vC1xritkl+VGa
	QxeAbhiTJG3Ynab9+14XgKP7+5DzsqRvnxgSTBdxnYe1Mo9c15Z3LFJSQeFTOet2
	HGjCSdwHcrh6tBaW9bvQhs78of6Sx89t6h8G0pBkupetH2tmNmapQqqjMf4r45Kx
	tskhMVa8YPukSDgyiMcW8XCLEU5gSW5W3fg==
X-ME-Sender: <xms:RJxaaDsWwO-2J5BZsjaKmBhNivr_8vSIGL4q36MNxvrs0GQz26H5Ew>
    <xme:RJxaaEeVHJmzQKmUXHn74EIYCKuwmEacG3w2OYAsNILqJtZ1xnTaOdkK2z28PxM13
    uzPPXkbo9_UlQ>
X-ME-Received: <xmr:RJxaaGyxHQZLaqLqqjKCdJLsaKFyUGll29RAw868pdo8kSyNQK1Seq2zp0akkTGCuyuMj812rKpaWCgNulzG85OP3Es8rwjxBZY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdduleeludcutefuodetggdotefrod
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
X-ME-Proxy: <xmx:RJxaaCP_fsTbghBt08qZ_p6tHjt8dDbFWr7ftZHmFOrGUCdNgqvm3g>
    <xmx:RJxaaD_Y042a-76v-6k8nGaWppHOMybaUQ54SRz2Af2ibMbqXPBXoQ>
    <xmx:RJxaaCVJdjRausCM9f5V5BqsfcHLMhGUdKewOrSyXYdKwI0ZudSF_w>
    <xmx:RJxaaEf0zZJSiL0ezhn4ecvmKzkupzioI0ZX5GUweeG4hiL94sGFrA>
    <xmx:RJxaaJKUko8gCtSzSQ0d6LPOjEAKwwGsYxcwYw1v5ML4LmteofpLC1wq>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 24 Jun 2025 14:38:25 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 1/2] xen/efi: Handle cases where file didn't come from ESP
Message-ID: <aFqcQe5quyjhu24P@mail-itl>
References: <20250624083157.9334-1-frediano.ziglio@cloud.com>
 <20250624083157.9334-2-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wCYRVLT9hZdC2Cuv"
Content-Disposition: inline
In-Reply-To: <20250624083157.9334-2-frediano.ziglio@cloud.com>


--wCYRVLT9hZdC2Cuv
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Jun 2025 14:38:25 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 1/2] xen/efi: Handle cases where file didn't come from ESP

On Tue, Jun 24, 2025 at 09:31:54AM +0100, Frediano Ziglio wrote:
> A boot loader can load files from outside ESP.
> In these cases device could be not provided or path could
> be something not supported.
> In these cases allows to boot anyway, all information
> could be provided using UKI or using other boot loader
> features.
>=20
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> ---
>  xen/common/efi/boot.c | 27 +++++++++++++++++++++++++--
>  1 file changed, 25 insertions(+), 2 deletions(-)
>=20
> diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> index 1a9b4e7dae..2a49c6d05d 100644
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
> +    *leaf =3D buffer;

This feels wrong, if DeviceHandle is NULL, it will point at the
empty buffer that shouldn't really be used for anything anyway.

IMO a better option would be to add "&& dir_handle" to the condition
guarding use of file_name in efi_start() instead.

BTW, by my reading of get_parent_handle() theoretically it should be
possible to get _some_ name out of loaded_image->FilePath even without
dir_handle. But since it isn't going to be used, it's not worth it.

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
> @@ -772,6 +792,8 @@ static bool __init read_file(EFI_FILE_HANDLE dir_hand=
le, CHAR16 *name,
> =20
>      if ( !name )
>          PrintErrMesg(L"No filename", EFI_OUT_OF_RESOURCES);
> +    if ( !dir_handle )
> +        return false;

There are a lot of places where read_file() is used without checking its
return value. Which made sense since before this change the only cases
where read_file() would return false was for the config file, in all
other cases it handled errors via blexit().
Most of those read_file() calls seems to be fine (as in, will not
explode), but may still be confusing. For example when you embed a
config with "xsm=3Dpolicy" (but the actual policy is not embedded) now the
failure to load it will result just a warning ("Xen image loaded without
providing a device") not even related to the file name and it will
continue booting with unintended configuration.

For me it looks like this change is wrong: if the config specified a
file to load (and that blob was not embedded in the UKI), and yet it
couldn't be loaded, it should fail early.
Is there any (new) case where where read_file() failure (when it
actually gets to calling it) should really be non-fatal now?=20

In relation to the next patch - such UKI should simply not specify
ramdisk in the embedded config, to allow loading it via "initrd"
command. This would avoid calling read_file().

>      ret =3D dir_handle->Open(dir_handle, &FileHandle, name,
>                             EFI_FILE_MODE_READ, 0);
>      if ( file =3D=3D &cfg && ret =3D=3D EFI_NOT_FOUND )
> @@ -1515,7 +1537,8 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE Im=
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

--wCYRVLT9hZdC2Cuv
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmhanEEACgkQ24/THMrX
1ywPMAf+LxMKXIHh06rw2WDwIA+RrXaRNH7zqa3LONZ9p0W1a8cueVCt51bSljz7
89HzyIIJJB+1C8GuNNEF/8uUXpkrBiGz9Vf3qXBBqxoXInRndVRMQox1FEpLg6oZ
TmmLJ3rnPHU3LBrgzQt5YpDHcS0LtZ4Ogl+gs3daxe2y6u82QR1dGC/xa/lL7xxX
lgOAcAoKw9eG2kz3tGzNpVYk5VWv7gJADKXrInGBZsLr47u0UoHAVw0A12Wk1iYz
W60X94IouEOafE1h6K6l8kW315JbQn+7lELnnpEL9kK6OedDlI6EM8+pfz3BQ3yA
LcFntC3rm4xuOzbXfh70vKSEG9quKw==
=CNHA
-----END PGP SIGNATURE-----

--wCYRVLT9hZdC2Cuv--

