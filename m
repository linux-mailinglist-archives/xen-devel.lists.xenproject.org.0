Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6B9FB081F9
	for <lists+xen-devel@lfdr.de>; Thu, 17 Jul 2025 02:58:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1045994.1416238 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucCwk-0007ls-V0; Thu, 17 Jul 2025 00:58:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1045994.1416238; Thu, 17 Jul 2025 00:58:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ucCwk-0007kC-SD; Thu, 17 Jul 2025 00:58:02 +0000
Received: by outflank-mailman (input) for mailman id 1045994;
 Thu, 17 Jul 2025 00:58:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j2gO=Z6=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1ucCwj-0007k6-In
 for xen-devel@lists.xenproject.org; Thu, 17 Jul 2025 00:58:01 +0000
Received: from fhigh-a1-smtp.messagingengine.com
 (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 14498058-62a9-11f0-b894-0df219b8e170;
 Thu, 17 Jul 2025 02:57:58 +0200 (CEST)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal
 [10.202.2.50])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 455E0140014A;
 Wed, 16 Jul 2025 20:57:57 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-10.internal (MEProxy); Wed, 16 Jul 2025 20:57:57 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 16 Jul 2025 20:57:55 -0400 (EDT)
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
X-Inumbo-ID: 14498058-62a9-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1752713877;
	 x=1752800277; bh=bw9GxOoId4dbYO3fFIVpWtcw8PCG3TPsvbewrYDkYPM=; b=
	wb+vkCDjaaHGlp+i5MsoqzKwtjCBT9Aa1ciXiSsBHBarJiLqaDHPZ6ApNcmmABHl
	CJ9fJqB462O8wSYa5nfeSeDj43tzNHMp4w35w5iYdw+fLVrk5Tm5SLBxvNSz9cTo
	CsosO/no9zzlFeK73u2RUQ5iXxGfZR/qBnEg2RezDvwVQbb2kuVcPU48OD4T5ZXC
	sGxsnyetlKI2mOnpVZgIa0PEG/qx8vMA5qEFO8evkR1CMNubOt9RQPFNn4CFKj9/
	fJwlgiV5BIJkbvDcRuMjM9U3q7lwIQQTzRo2Fh7ZEBAbMd2S6uVLBzysjo9UUDm6
	MxWeG7zowR7VikM0u+OCBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1752713877; x=1752800277; bh=bw9GxOoId4dbYO3fFIVpWtcw8PCG3TPsvbe
	wrYDkYPM=; b=oMbOsSaCkRRMVLdOQR40Q8olMDbVCAeheBjB0Fp+fKAPLK/Aa5x
	pU3oa94dHcuh4rRa5MW9TizF87FoCVud5Y8yTyZlStsQEyHQD/SYFdclKOfRpc+3
	Tp+zFEZIWdt1v1xff9f7OksvU6/SejMiWEmFKh0cIWf31tJiK8bp2DnwPzovOwMe
	00/ONL7CrBrlK6B92vt/iyIy9bIno8ECRV6g4BsbgItaoH4r8drCyb4vJcWly20w
	7EoW913YgRgWcBIK6pmOKhYXDWp0db1iMLLWI2KDi+VnImbFxRkRcuiBnmYgckMl
	t4enDAzJD1xOguJBwW++11fm4QCFmlqE1MQ==
X-ME-Sender: <xms:lEp4aO0bJrWOzSMGnWAQxpq1VTaOJ_NW_eQQJAhEjqNHVfLEQX2eSg>
    <xme:lEp4aLrfthD4SKPL9Ff0wSfX-3dwIKon71Aa3WzvBILz4oTg2gCiOw7JHn37-3Cth
    PaEkzammoVR7w>
X-ME-Received: <xmr:lEp4aDdsds8uAJJ1Q6esnwxTLEXsmK677Vu-blvQIGQRAaePLMTBNCQZPs7r-Srim2nWjWuN9X2Jmke3SAsHh-pKW1jRmBA6itY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdehledvudcutefuodetggdotefrod
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
X-ME-Proxy: <xmx:lEp4aCqzmtwvLEOFUyqyxjstgHd9v1pg4t1tz_H23RkllYA2JfUKaQ>
    <xmx:lEp4aMFSJNBLvyrXGj70jgWXL2ka2EGBzp1HvQeKZzGBENlw9YTOlQ>
    <xmx:lEp4aKu1p3EP0BF8Z9yRQl5UNNNKaBIG7eHfbzbg04xgn_4d0Nt_Zw>
    <xmx:lEp4aGXicPDqVyItwS36gUROo1741G3zMJV7hnbiWPitMqg-TTlrlg>
    <xmx:lUp4aGyeYwtjZxoOxD2ygi7YBWquD9USnHV-B8hw4NicYk1TbMzRfGhW>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 17 Jul 2025 02:57:53 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v5] xen/efi: Update error flow for read_file function
Message-ID: <aHhKktS328hdWHT9@mail-itl>
References: <20250628064630.2222323-1-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8nNsOcZTyESHWUwM"
Content-Disposition: inline
In-Reply-To: <20250628064630.2222323-1-frediano.ziglio@cloud.com>


--8nNsOcZTyESHWUwM
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Jul 2025 02:57:53 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH v5] xen/efi: Update error flow for read_file function

On Sat, Jun 28, 2025 at 07:46:18AM +0100, Frediano Ziglio wrote:
> Use more explicit goto statements to handle common error code
> path instead of a lot of if/else.
>=20
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>

Reviewed-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.c=
om>


> ---
> Change since v4:
> - fixed label indentation.
> ---
>  xen/common/efi/boot.c | 80 +++++++++++++++++++++++--------------------
>  1 file changed, 43 insertions(+), 37 deletions(-)
>=20
> diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> index 9306dc8953..1019de6950 100644
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -792,6 +792,8 @@ static bool __init read_file(EFI_FILE_HANDLE dir_hand=
le, CHAR16 *name,
> =20
>      if ( !name )
>          PrintErrMesg(L"No filename", EFI_OUT_OF_RESOURCES);
> +
> +    what =3D L"Open";
>      if ( dir_handle )
>          ret =3D dir_handle->Open(dir_handle, &FileHandle, name,
>                                 EFI_FILE_MODE_READ, 0);
> @@ -800,54 +802,58 @@ static bool __init read_file(EFI_FILE_HANDLE dir_ha=
ndle, CHAR16 *name,
>      if ( file =3D=3D &cfg && ret =3D=3D EFI_NOT_FOUND )
>          return false;
>      if ( EFI_ERROR(ret) )
> -        what =3D L"Open";
> -    else
> -        ret =3D FileHandle->SetPosition(FileHandle, -1);
> +        goto fail;
> +
> +    what =3D L"Seek";
> +    ret =3D FileHandle->SetPosition(FileHandle, -1);
>      if ( EFI_ERROR(ret) )
> -        what =3D what ?: L"Seek";
> -    else
> -        ret =3D FileHandle->GetPosition(FileHandle, &size);
> +        goto fail;
> +
> +    what =3D L"Get size";
> +    ret =3D FileHandle->GetPosition(FileHandle, &size);
>      if ( EFI_ERROR(ret) )
> -        what =3D what ?: L"Get size";
> -    else
> -        ret =3D FileHandle->SetPosition(FileHandle, 0);
> +        goto fail;
> +
> +    what =3D L"Seek";
> +    ret =3D FileHandle->SetPosition(FileHandle, 0);
>      if ( EFI_ERROR(ret) )
> -        what =3D what ?: L"Seek";
> -    else
> -    {
> -        file->addr =3D min(1UL << (32 + PAGE_SHIFT),
> -                         HYPERVISOR_VIRT_END - DIRECTMAP_VIRT_START);
> -        ret =3D efi_bs->AllocatePages(AllocateMaxAddress, EfiLoaderData,
> -                                    PFN_UP(size), &file->addr);
> -    }
> +        goto fail;
> +
> +    what =3D L"Allocation";
> +    file->addr =3D min(1UL << (32 + PAGE_SHIFT),
> +                     HYPERVISOR_VIRT_END - DIRECTMAP_VIRT_START);
> +    ret =3D efi_bs->AllocatePages(AllocateMaxAddress, EfiLoaderData,
> +                                PFN_UP(size), &file->addr);
>      if ( EFI_ERROR(ret) )
> -        what =3D what ?: L"Allocation";
> -    else
> -    {
> -        file->need_to_free =3D true;
> -        file->size =3D size;
> -        handle_file_info(name, file, options);
> +        goto fail;
> =20
> -        ret =3D FileHandle->Read(FileHandle, &file->size, file->str);
> -        if ( !EFI_ERROR(ret) && file->size !=3D size )
> -            ret =3D EFI_ABORTED;
> -        if ( EFI_ERROR(ret) )
> -            what =3D L"Read";
> -    }
> +    file->need_to_free =3D true;
> +    file->size =3D size;
> +    handle_file_info(name, file, options);
> =20
> -    if ( FileHandle )
> -        FileHandle->Close(FileHandle);
> +    what =3D L"Read";
> +    ret =3D FileHandle->Read(FileHandle, &file->size, file->str);
> +    if ( !EFI_ERROR(ret) && file->size !=3D size )
> +        ret =3D EFI_ABORTED;
> +    if ( EFI_ERROR(ret) )
> +        goto fail;
> =20
> -    if ( what )
> -    {
> -        PrintErr(what);
> -        PrintErr(L" failed for ");
> -        PrintErrMesg(name, ret);
> -    }
> +    FileHandle->Close(FileHandle);
> =20
>      efi_arch_flush_dcache_area(file->ptr, file->size);
> =20
>      return true;
> +
> + fail:
> +    if ( FileHandle )
> +        FileHandle->Close(FileHandle);
> +
> +    PrintErr(what);
> +    PrintErr(L" failed for ");
> +    PrintErrMesg(name, ret);
> +
> +    /* not reached */
> +    return false;
>  }
> =20
>  static bool __init read_section(const EFI_LOADED_IMAGE *image,
> --=20
> 2.43.0
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--8nNsOcZTyESHWUwM
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmh4SpEACgkQ24/THMrX
1yzZ4wf+I2ALr3d/vYrrNbRTGbj5Ncdp4NcjNZpgoXevQGZujGasGUcIPwUxh3dK
e2MVEZ6KTQ3g6dNLcEsgR341NPwuv3Qi+C6pu3Herw4OuTmDkVUMyDF12zeQKSkD
zZ8hLpEpD8PuSuJv0rfjTu3jax9N5c+KDDpfUDiGv3r6iQZXARG6AH2P2hDdkTZH
wVMrPo9ZeLII1BLg0GlQmAIpKlMhJwveVv5A2MhnSWIDuT+axNrlbkKoWfM/cNqW
fuKsx5OcuTbzT/RZ5YTs7oOAdOt2fyFPU1Hdd4cVPnY8MMjaw2m8j8iviSkKYMWU
bw+ZZaM+OlfZ6Y6ysFtEsNOkwQ4rqg==
=JCFo
-----END PGP SIGNATURE-----

--8nNsOcZTyESHWUwM--

