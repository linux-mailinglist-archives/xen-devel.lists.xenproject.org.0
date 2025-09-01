Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DD98B3ED6F
	for <lists+xen-devel@lfdr.de>; Mon,  1 Sep 2025 19:41:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1105274.1456201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut8Wr-0003Hw-Te; Mon, 01 Sep 2025 17:41:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1105274.1456201; Mon, 01 Sep 2025 17:41:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ut8Wr-0003GS-P7; Mon, 01 Sep 2025 17:41:17 +0000
Received: by outflank-mailman (input) for mailman id 1105274;
 Mon, 01 Sep 2025 17:41:16 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2QE7=3M=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1ut8Wq-0003GL-A6
 for xen-devel@lists.xenproject.org; Mon, 01 Sep 2025 17:41:16 +0000
Received: from fhigh-b7-smtp.messagingengine.com
 (fhigh-b7-smtp.messagingengine.com [202.12.124.158])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d7e3bb11-875a-11f0-8adc-4578a1afcccb;
 Mon, 01 Sep 2025 19:41:09 +0200 (CEST)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 02B7C7A028B;
 Mon,  1 Sep 2025 13:41:07 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-06.internal (MEProxy); Mon, 01 Sep 2025 13:41:08 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 1 Sep 2025 13:41:05 -0400 (EDT)
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
X-Inumbo-ID: d7e3bb11-875a-11f0-8adc-4578a1afcccb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1756748467;
	 x=1756834867; bh=wWR4mlZntfDuqG+/ioo66gHv6xU4Ml0wEsxTSXc+XDM=; b=
	MbyyxlX4ROoOd+1rXVKcx6khHI1yaBGhYhrJzqzFxnpQ1HJ2X4phh6ctSGzHd895
	EzWONAYnuLu20wIHRo+FVtPWbsfKuQph0JKBtd+1WjIYMkPkTpBIYXCSVbejj3ni
	RB4aQJWjywkX/tQE/iJg61Qn2pvLXuyIYwikRVOD106xfEHLSLHVyKH6jVAIJguc
	KqWyhgwDoeZfTLW4LNKJbRSWvDBlLfIaVuycu5baWHh/oenVVw+t4CwXHKDAjUPu
	4EJgUXvpuLw9CvSqomQs0drQDU489kyvLb4nwoH6y5RxvjcgJGr1EKw0qi/mS3rG
	oU2ZJ1jThSTq7Ypm5DFDUw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1756748467; x=1756834867; bh=wWR4mlZntfDuqG+/ioo66gHv6xU4Ml0wEsx
	TSXc+XDM=; b=gS+9t3ehRylqGT7w1l6XUJ5FjQF+CQ7yAo4Hge0lgHL0NdbvAmd
	0lcMz8RJ8kmeVE7GSDwFkx8g0rLnr5tWpdQXMS6mR+2EIAFYxi2mf1T6es/Tu4Gn
	csLds+w+Sa7jlhsXwkQRh6+oUh53CeY9Ir1pyypL4NfgEoj8pj09xeNdd2IhajZ/
	u+3xPMLDSfJbMgCQeWFvAwRZMSbDSHf6dDYjBtq8TOzL6zdIf0/u2HrUghGlpkbt
	K+2qKqbP98fBoBN2ERoW/x+9bB8mPiGl6ltV8RdPnOrAO9DN8ow+YRHeMaufYBFm
	qgc3aIvGktRT5tdhwjNgUOg0im0SqMnzC8A==
X-ME-Sender: <xms:s9q1aJ0cZvA1Yqx_NtbDr15KxkDWf32v4mdJs_BBtqc-PgKeMnYvoQ>
    <xme:s9q1aPz-ZSmT0QBIfDJoikvdNYuFW6Yik1rZUOx_8FPQvszEutvo3FQr3NFONCJBI
    R08YyP4u2Tw2A>
X-ME-Received: <xmr:s9q1aFh_TD5EuTaNqMubwGzPRlgfz0CQ6gTJG7BR1jp_moEJGCuB8A8wnuRgad_dwzgvKh7_wkcRBqJqSUtjMxdHS-MlzzYGAIU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduledvjeejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfduleet
    feevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepuddupd
    hmohguvgepshhmthhpohhuthdprhgtphhtthhopehgvghrrghlugdrvghluggvrhdqvhgr
    shhssegtlhhouhgurdgtohhmpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtsh
    drgigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheprghnughrvgifrdgtohhophgv
    rhefsegtihhtrhhigidrtghomhdprhgtphhtthhopegrnhhthhhonhihrdhpvghrrghrug
    esvhgrthgvshdrthgvtghhpdhrtghpthhtohepmhhitghhrghlrdhorhiivghlsegrmhgu
    rdgtohhmpdhrtghpthhtohepjhhulhhivghnseigvghnrdhorhhgpdhrtghpthhtoheprh
    hoghgvrhdrphgruhestghithhrihigrdgtohhmpdhrtghpthhtohepshhsthgrsggvlhhl
    ihhniheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhgvvhhinhdrlhgrmhhpihhsse
    gtlhhouhgurdgtohhm
X-ME-Proxy: <xmx:s9q1aCqMae1czXKV-YUUk8NrGnCj_cRnEU-x_ahfW66p0YhXwDuuIg>
    <xmx:s9q1aMg8e4Nxu4ezUvffwh47mT3BXUxo9FJCpcSrGI72tYP5d_VlKQ>
    <xmx:s9q1aEOsP_yUaTvY9mIpFjjJlFRtS_gzH-sSzT4RPPtFhyimY5hGYg>
    <xmx:s9q1aGz11UD-w_9kXPtHi01CPaCHn2dLFEuHIwjMsk1lZVKbLES0cA>
    <xmx:s9q1aMAyMqZfzLyKxsYYOESL28WzYODreqAA-1TwEz8LKaQpJ8ky_HaP>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 1 Sep 2025 19:41:03 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Gerald Elder-Vass <gerald.elder-vass@cloud.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Kevin Lampis <kevin.lampis@cloud.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [XEN PATCH] efi: Use Shim's LoadImage to verify the Dom0 kernel
Message-ID: <aLXar3-VZbcONci3@mail-itl>
References: <766be642204043b779cef688ec0ca2f1d64313ad.1756740104.git.gerald.elder-vass@cloud.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="AD1kqb47YP3xYDSX"
Content-Disposition: inline
In-Reply-To: <766be642204043b779cef688ec0ca2f1d64313ad.1756740104.git.gerald.elder-vass@cloud.com>


--AD1kqb47YP3xYDSX
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 1 Sep 2025 19:41:03 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Gerald Elder-Vass <gerald.elder-vass@cloud.com>
Cc: xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Kevin Lampis <kevin.lampis@cloud.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [XEN PATCH] efi: Use Shim's LoadImage to verify the Dom0 kernel

On Mon, Sep 01, 2025 at 03:33:54PM +0000, Gerald Elder-Vass wrote:
> The existing Verify functionality of the Shim lock protocol is
> deprecated and will be removed, instead we must use the LoadImage
> interface to perform the verification.

But IIUC shim lock protocol isn't removed yet, and some people may still
rely on it. Better to try locating new protocol first, but keep using
old one if new is not found. IMO removal of old protocol support should
only follow removal it from shim and maybe even a bit longer, like wait
for expiration of old shim versions (like revocation of old versions via
SBAT, or maybe expiration of old MS 3rd party cert).

>=20
> When the loading is successful we won't be using the newly loaded image
> (as of yet) so we must then immediately unload the image to clean up.
>=20
> Signed-off-by: Gerald Elder-Vass <gerald.elder-vass@cloud.com>
> Signed-off-by: Kevin Lampis <kevin.lampis@cloud.com>
> ---
>  xen/common/efi/boot.c | 39 +++++++++++++++++++++++++++------------
>  1 file changed, 27 insertions(+), 12 deletions(-)
>=20
> diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> index 453b1ba099cd..67e7220d8fa3 100644
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -36,8 +36,8 @@
> =20
>  #define SMBIOS3_TABLE_GUID \
>    { 0xf2fd1544U, 0x9794, 0x4a2c, {0x99, 0x2e, 0xe5, 0xbb, 0xcf, 0x20, 0x=
e3, 0x94} }
> -#define SHIM_LOCK_PROTOCOL_GUID \
> -  { 0x605dab50U, 0xe046, 0x4300, {0xab, 0xb6, 0x3d, 0xd8, 0x10, 0xdd, 0x=
8b, 0x23} }
> +#define SHIM_IMAGE_LOADER_GUID \
> +  { 0x1f492041U, 0xfadb, 0x4e59, {0x9e, 0x57, 0x7c, 0xaf, 0xe7, 0x3a, 0x=
55, 0xab} }
>  #define APPLE_PROPERTIES_PROTOCOL_GUID \
>    { 0x91bd12feU, 0xf6c3, 0x44fb, {0xa5, 0xb7, 0x51, 0x22, 0xab, 0x30, 0x=
3a, 0xe0} }
>  #define EFI_SYSTEM_RESOURCE_TABLE_GUID    \
> @@ -66,9 +66,12 @@ typedef EFI_STATUS
>      IN const VOID *Buffer,
>      IN UINT32 Size);
> =20
> -typedef struct {
> -    EFI_SHIM_LOCK_VERIFY Verify;
> -} EFI_SHIM_LOCK_PROTOCOL;
> +typedef struct _SHIM_IMAGE_LOADER {
> +    EFI_IMAGE_LOAD LoadImage;
> +    EFI_IMAGE_START StartImage;
> +    EFI_EXIT Exit;
> +    EFI_IMAGE_UNLOAD UnloadImage;
> +} SHIM_IMAGE_LOADER;
> =20
>  struct _EFI_APPLE_PROPERTIES;
> =20
> @@ -1333,13 +1336,13 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE =
ImageHandle,
>                                        EFI_SYSTEM_TABLE *SystemTable)
>  {
>      static EFI_GUID __initdata loaded_image_guid =3D LOADED_IMAGE_PROTOC=
OL;
> -    static EFI_GUID __initdata shim_lock_guid =3D SHIM_LOCK_PROTOCOL_GUI=
D;
>      EFI_LOADED_IMAGE *loaded_image;
>      EFI_STATUS status;
> +    EFI_HANDLE loaded_kernel;
>      unsigned int i;
>      CHAR16 *file_name, *cfg_file_name =3D NULL, *options =3D NULL;
>      UINTN gop_mode =3D ~0;
> -    EFI_SHIM_LOCK_PROTOCOL *shim_lock;
> +    SHIM_IMAGE_LOADER *shim_loader;
>      EFI_GRAPHICS_OUTPUT_PROTOCOL *gop =3D NULL;
>      union string section =3D { NULL }, name;
>      bool base_video =3D false;
> @@ -1590,12 +1593,24 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE =
ImageHandle,
>       * device tree through the efi_check_dt_boot function, in this stage
>       * verify it.
>       */
> -    if ( kernel.ptr &&
> -         !kernel_verified &&
> -         !EFI_ERROR(efi_bs->LocateProtocol(&shim_lock_guid, NULL,
> -                                           (void **)&shim_lock)) &&
> -         (status =3D shim_lock->Verify(kernel.ptr, kernel.size)) !=3D EF=
I_SUCCESS )
> +    if ( kernel.ptr && !kernel_verified )
> +    {
>          PrintErrMesg(L"Dom0 kernel image could not be verified", status);
> +    status =3D efi_bs->LocateProtocol(&((EFI_GUID) SHIM_IMAGE_LOADER_GUI=
D),
> +                                     NULL, (void **)&shim_loader);

Something is wrong with indentation / brackets here - it's all under "if
( kernel.ptr && !kernel_verified )". Rebase fail?


> +    if ( EFI_ERROR(status) )
> +        PrintErrMesg(L"Error LocateProtocol IMAGE_LOADER", status);
> +
> +    if ( kernel.ptr ) {
> +        status =3D shim_loader->LoadImage(false, ImageHandle, NULL, (voi=
d *)kernel.ptr, kernel.size, &loaded_kernel);
> +        if ( EFI_ERROR(status) )
> +            PrintErrMesg(L"LoadImage failed", status);
> +
> +        // LoadImage performs verification, now unload it to clean up
> +        status =3D shim_loader->UnloadImage(loaded_kernel);
> +        if ( EFI_ERROR(status) )
> +            PrintErrMesg(L"UnloadImage failed", status);
> +    }
> =20
>      efi_arch_edd();
> =20
> --=20
> 2.47.3
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--AD1kqb47YP3xYDSX
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmi12q8ACgkQ24/THMrX
1yyGnAf+NZXlQaOYGOSnYztOphBVH1BLcSCBZjL1tMCemWxulqFWazf18YIkmGM5
zI82vFkFsLbL1mHr2QiK12c2YKUBRQvZ+u++CmoG7J//HstR/Z8RiecTxGmv6jKV
VdbRZf3SpbwZJsGxpI8PPuxgWjvMNoQEFba+Suj5aD4tDar5oV4FikVZJBNBQ9K6
p9lO4ZhMw73lHK36vt4Pz0sg4S2CV91Wy+I8j/S6bJ68Gd8zPYt2dWW2QxY3LfJs
u98WgS36JZgc5SJFf4u5sTGY7/snPzj9nfCgtDCmscEYaFwtbTvPCra7rh6CkFyt
8vU7vqZ97HtT1igVxFelpFDvJECgNA==
=3GyR
-----END PGP SIGNATURE-----

--AD1kqb47YP3xYDSX--

