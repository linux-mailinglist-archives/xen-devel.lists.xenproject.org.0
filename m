Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF56B455F0
	for <lists+xen-devel@lfdr.de>; Fri,  5 Sep 2025 13:14:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1111779.1460357 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuUOP-0007QC-8q; Fri, 05 Sep 2025 11:14:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1111779.1460357; Fri, 05 Sep 2025 11:14:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuUOP-0007Oj-66; Fri, 05 Sep 2025 11:14:09 +0000
Received: by outflank-mailman (input) for mailman id 1111779;
 Fri, 05 Sep 2025 11:14:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=URqW=3Q=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uuUON-0007Od-TS
 for xen-devel@lists.xenproject.org; Fri, 05 Sep 2025 11:14:07 +0000
Received: from fhigh-b5-smtp.messagingengine.com
 (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6ce9bbff-8a49-11f0-9809-7dc792cee155;
 Fri, 05 Sep 2025 13:14:02 +0200 (CEST)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 8DCAF7A047F;
 Fri,  5 Sep 2025 07:14:00 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-02.internal (MEProxy); Fri, 05 Sep 2025 07:14:00 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Sep 2025 07:13:58 -0400 (EDT)
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
X-Inumbo-ID: 6ce9bbff-8a49-11f0-9809-7dc792cee155
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1757070840;
	 x=1757157240; bh=2gUJQvwKTk9w1wg8VRkiY5l8wLd2YIUqfy1haDWQtCw=; b=
	YxGirV0x1khglL8Yyd8fnkOzOgKdD/6gI8UJiHbduxk78ZF7LLqo0gKlaHgLggup
	W5EF6t0PzsBFgE7O8E8rmMw+i3FmrJzl5Dj0v1CvZb9P/3cBeZ9JR8qtRuWD3Nds
	KsyZtlPoO85RqedkhCx6IUAbuOYw8p0EffFTIYFSW9rDROoNAHDIzw+1tFaXcweM
	IkAG9Ly3P/C/VOCBGwrCFyP/PFHRat521JOdykIyq7FT3FbG12GOERovaOcCQIf5
	Wt/ZbZuKZEG1fyicnoiftGhU6VJ4NYTXALrQ/OyNCuhf39p+5K1sAr8DtXO1oN3G
	//ZKGH9rMfheF+saCoGiUg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1757070840; x=1757157240; bh=2gUJQvwKTk9w1wg8VRkiY5l8wLd2YIUqfy1
	haDWQtCw=; b=WZFzSaZbQpoYUIVeSzMvo4w6s96aqDBxhgyK8mMpnSh3jOT5bRj
	BZty3+CAo757Zm5//n7Cvr9pGrhqTM9NAqhA/RFjWbPWeeUeq2orrXDtLmQg7FLm
	HTAtSUNXOr5hksXVwLglPDP00pnjzg3m1gE+iTqKa+WkECLGEWAWGwXwYUo/35Ue
	YDD9AHTCjoI6wvoXYOeRPRLYnh2JiVLnGQ4oIWgMkFGutLr/QV+KCF8R9IXGpfVZ
	O6xRmAm/3HJPtXLC46eHjp2Noqw1AmUtVyLuIoFJMeYwz7T1lsMFjrN7CPx1oWd3
	C4j/sT8ICZVlB+WSf9PK0ZzRwJS8niAdEqA==
X-ME-Sender: <xms:98W6aAiSp0gRXyMfw0cOHu_Cgd07YeGBMRSxb0T8BMWjAGKbALvERA>
    <xme:98W6aIsfZ5VWjxTyKL1qzbaEfFDgB7AZXNzz5VduG6tBF7OKb5_8OABBo6JfoMfhN
    bXj6Okzgk5y1A>
X-ME-Received: <xmr:98W6aDvW20NxyTPCDsOVIR2_BR7_firLrbbaQES8YlWSzWQii3SJYYNHYBhQbXManVBogxOs4wm9uJEF4_0bDpH2OabO2sQFfLs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdekjeegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcuofgr
    rhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvihhsih
    gslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfduleetfeev
    hfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhv
    ihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepuddupdhmoh
    guvgepshhmthhpohhuthdprhgtphhtthhopehgvghrrghlugdrvghluggvrhdqvhgrshhs
    segtlhhouhgurdgtohhmpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgi
    gvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtohepkhgvvhhinhdrlhgrmhhpihhssegt
    lhhouhgurdgtohhmpdhrtghpthhtohepughpshhmihhthhesrghpvghrthhushhsohhluh
    htihhonhhsrdgtohhmpdhrtghpthhtohepjhgsvghulhhitghhsehsuhhsvgdrtghomhdp
    rhgtphhtthhopegrnhgurhgvfidrtghoohhpvghrfeestghithhrihigrdgtohhmpdhrtg
    hpthhtoheprghnthhhohhnhidrphgvrhgrrhgusehvrghtvghsrdhtvggthhdprhgtphht
    thhopehmihgthhgrlhdrohhriigvlhesrghmugdrtghomhdprhgtphhtthhopehjuhhlih
    gvnhesgigvnhdrohhrgh
X-ME-Proxy: <xmx:98W6aNF8xQagxpTxLZfD_ldfHE6vKOOIQtEIKWqHFzM0V-Dj1us1tA>
    <xmx:98W6aOO9ypU9zTgJZMugldjWBuEqdE93rAXxmbWoKTxMxh48Kfd3cw>
    <xmx:98W6aMLm-6SNxCmjr-rg7bzcSjtC3tgGCOE8c6EzlmDf5jCIq5G2Wg>
    <xmx:98W6aH_3nER-LDcA4QkYt49Qw0z22rJTUbx4N-XBtbmA-1v14JNK6Q>
    <xmx:-MW6aOeAqRiawB00cer3l0rqA7xCLzVrH9QYTFAhLrJ2sX5aEXIQL2a->
Feedback-ID: i1568416f:Fastmail
Date: Fri, 5 Sep 2025 13:13:56 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Gerald Elder-Vass <gerald.elder-vass@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Kevin Lampis <kevin.lampis@cloud.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v3 2/2] efi: Support using Shim's LoadImage protocol
Message-ID: <aLrF9AMOXiZDWEQO@mail-itl>
References: <cover.1757066332.git.gerald.elder-vass@cloud.com>
 <7f4a47d5dacf5b2db2ddd2ac72c5e0f236f9be46.1757066332.git.gerald.elder-vass@cloud.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZEJWihP4AAxfnDTA"
Content-Disposition: inline
In-Reply-To: <7f4a47d5dacf5b2db2ddd2ac72c5e0f236f9be46.1757066332.git.gerald.elder-vass@cloud.com>


--ZEJWihP4AAxfnDTA
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 5 Sep 2025 13:13:56 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Gerald Elder-Vass <gerald.elder-vass@cloud.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Kevin Lampis <kevin.lampis@cloud.com>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v3 2/2] efi: Support using Shim's LoadImage protocol

On Fri, Sep 05, 2025 at 10:05:32AM +0000, Gerald Elder-Vass wrote:
> The existing Verify functionality of the Shim lock protocol is
> deprecated and will be removed, the alternative it to use the LoadImage
> interface to perform the verification.
>=20
> When the loading is successful we won't be using the newly loaded image
> (as of yet) so we must then immediately unload the image to clean up.
>=20
> If the LoadImage protocol isn't available then fall back to the Shim
> Lock (Verify) interface.
>=20
> Log when the kernel is not verified and fail if this occurs
> when secure boot mode is enabled.
>=20
> Signed-off-by: Gerald Elder-Vass <gerald.elder-vass@cloud.com>
> Signed-off-by: Kevin Lampis <kevin.lampis@cloud.com>
> ---
> CC: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>
> CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>
> CC: Jan Beulich <jbeulich@suse.com>
> CC: Andrew Cooper <andrew.cooper3@citrix.com>
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Julien Grall <julien@xen.org>
> CC: "Roger Pau Monn=C3=A9" <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
>=20
> v3:
> - Use Shim Image by default, fall back to Shim Lock
> ---
>  xen/common/efi/boot.c | 59 +++++++++++++++++++++++++++++++++++++------
>  1 file changed, 51 insertions(+), 8 deletions(-)
>=20
> diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> index e7e3dffa7ddc..1f63473d264d 100644
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -38,6 +38,8 @@
>    { 0xf2fd1544U, 0x9794, 0x4a2c, {0x99, 0x2e, 0xe5, 0xbb, 0xcf, 0x20, 0x=
e3, 0x94} }
>  #define SHIM_LOCK_PROTOCOL_GUID \
>    { 0x605dab50U, 0xe046, 0x4300, {0xab, 0xb6, 0x3d, 0xd8, 0x10, 0xdd, 0x=
8b, 0x23} }
> +#define SHIM_IMAGE_LOADER_GUID \
> +  { 0x1f492041U, 0xfadb, 0x4e59, {0x9e, 0x57, 0x7c, 0xaf, 0xe7, 0x3a, 0x=
55, 0xab} }
>  #define APPLE_PROPERTIES_PROTOCOL_GUID \
>    { 0x91bd12feU, 0xf6c3, 0x44fb, {0xa5, 0xb7, 0x51, 0x22, 0xab, 0x30, 0x=
3a, 0xe0} }
>  #define EFI_SYSTEM_RESOURCE_TABLE_GUID    \
> @@ -70,6 +72,13 @@ typedef struct {
>      EFI_SHIM_LOCK_VERIFY Verify;
>  } EFI_SHIM_LOCK_PROTOCOL;
> =20
> +typedef struct _SHIM_IMAGE_LOADER {
> +    EFI_IMAGE_LOAD LoadImage;
> +    EFI_IMAGE_START StartImage;
> +    EFI_EXIT Exit;
> +    EFI_IMAGE_UNLOAD UnloadImage;
> +} SHIM_IMAGE_LOADER;
> +
>  struct _EFI_APPLE_PROPERTIES;
> =20
>  typedef EFI_STATUS
> @@ -1047,6 +1056,46 @@ static UINTN __init efi_find_gop_mode(EFI_GRAPHICS=
_OUTPUT_PROTOCOL *gop,
>      return gop_mode;
>  }
> =20
> +static void __init efi_verify_kernel(EFI_HANDLE ImageHandle)
> +{
> +    static EFI_GUID __initdata shim_image_guid =3D SHIM_IMAGE_LOADER_GUI=
D;
> +    static EFI_GUID __initdata shim_lock_guid =3D SHIM_LOCK_PROTOCOL_GUI=
D;
> +    SHIM_IMAGE_LOADER *shim_loader;
> +    EFI_HANDLE loaded_kernel;
> +    EFI_SHIM_LOCK_PROTOCOL *shim_lock;
> +    EFI_STATUS status;
> +    bool verified =3D false;
> +
> +    /* Look for LoadImage first */
> +    if ( !EFI_ERROR(efi_bs->LocateProtocol(&shim_image_guid, NULL,
> +                                           (void **)&shim_loader)) )
> +    {
> +        status =3D shim_loader->LoadImage(false, ImageHandle, NULL,
> +                                        (void *)kernel.ptr, kernel.size,
> +                                        &loaded_kernel);
> +        if ( !EFI_ERROR(status) )
> +            verified =3D true;
> +
> +        /* LoadImage performed verification, now clean up with UnloadIma=
ge */
> +        shim_loader->UnloadImage(loaded_kernel);

Is UnloadImage really appropriate even if LoadImage failed?

> +    }
> +
> +    /* else fall back to Shim Lock */
> +    if ( !verified &&
> +         !EFI_ERROR(efi_bs->LocateProtocol(&shim_lock_guid, NULL,
> +                                           (void **)&shim_lock)) &&
> +         !EFI_ERROR(shim_lock->Verify(kernel.ptr, kernel.size)) )
> +        verified =3D true;
> +
> +    if ( !verified )
> +    {
> +        PrintStr(L"Kernel was not verified\n");
> +
> +        if ( efi_secure_boot )
> +            blexit(L"Failed to verify kernel");

Better be more explicit why it's fatal, like "Refusing to boot
unverified kernel with UEFI SecureBoot enabled".

> +    }
> +}
> +
>  static void __init efi_tables(void)
>  {
>      unsigned int i;
> @@ -1334,13 +1383,11 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE =
ImageHandle,
>                                        EFI_SYSTEM_TABLE *SystemTable)
>  {
>      static EFI_GUID __initdata loaded_image_guid =3D LOADED_IMAGE_PROTOC=
OL;
> -    static EFI_GUID __initdata shim_lock_guid =3D SHIM_LOCK_PROTOCOL_GUI=
D;
>      EFI_LOADED_IMAGE *loaded_image;
>      EFI_STATUS status;
>      unsigned int i;
>      CHAR16 *file_name, *cfg_file_name =3D NULL, *options =3D NULL;
>      UINTN gop_mode =3D ~0;
> -    EFI_SHIM_LOCK_PROTOCOL *shim_lock;
>      EFI_GRAPHICS_OUTPUT_PROTOCOL *gop =3D NULL;
>      union string section =3D { NULL }, name;
>      bool base_video =3D false;
> @@ -1591,12 +1638,8 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE I=
mageHandle,
>       * device tree through the efi_check_dt_boot function, in this stage
>       * verify it.
>       */
> -    if ( kernel.ptr &&
> -         !kernel_verified &&
> -         !EFI_ERROR(efi_bs->LocateProtocol(&shim_lock_guid, NULL,
> -                                           (void **)&shim_lock)) &&
> -         (status =3D shim_lock->Verify(kernel.ptr, kernel.size)) !=3D EF=
I_SUCCESS )
> -        PrintErrMesg(L"Dom0 kernel image could not be verified", status);
> +    if ( kernel.ptr && !kernel_verified )
> +        efi_verify_kernel(ImageHandle);
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

--ZEJWihP4AAxfnDTA
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmi6xfQACgkQ24/THMrX
1yxK6Qf+PMGpqTAa2Afbd119yRf0dxtTIuWQtaLGvHW1rmI+qfqH9la4FeXYU3d6
M2tT+O6+3TGmyf8qMyfAic8llWBPJ++vYSHuZUxGwO5JnrPEuFdi/CgEcWs8AXrJ
kkpx7ae5Pzom5BmVGmYjZ0keoFxCgJmETnWB/7joGmXAYBma58XPq1XZKxsb3nBc
quzvzqHx+s45bgiXG/D7Y3Uf3WQnhkrAJa9wBU1jm+QswxWRcVG8z3VrDaz494sw
nUYul0hPkhjvDx7Diw9z6XTIyrBjJqyVFN948oUrsHUcgQgA6QRZWU/awTHBt2Rl
EDmV4gCC8kfdyzyLhLnmMh6I6bHojw==
=ASyp
-----END PGP SIGNATURE-----

--ZEJWihP4AAxfnDTA--

