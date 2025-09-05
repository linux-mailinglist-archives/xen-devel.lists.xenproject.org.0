Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97BF2B4642D
	for <lists+xen-devel@lfdr.de>; Fri,  5 Sep 2025 22:03:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1112357.1460668 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuceR-0003kk-7X; Fri, 05 Sep 2025 20:03:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1112357.1460668; Fri, 05 Sep 2025 20:03:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uuceR-0003il-3n; Fri, 05 Sep 2025 20:03:15 +0000
Received: by outflank-mailman (input) for mailman id 1112357;
 Fri, 05 Sep 2025 20:03:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=URqW=3Q=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uuceP-0003if-VK
 for xen-devel@lists.xenproject.org; Fri, 05 Sep 2025 20:03:13 +0000
Received: from fhigh-a8-smtp.messagingengine.com
 (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 59e17d9b-8a93-11f0-9d12-b5c5bf9af7f9;
 Fri, 05 Sep 2025 22:03:12 +0200 (CEST)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 17AA21400166;
 Fri,  5 Sep 2025 16:03:12 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-04.internal (MEProxy); Fri, 05 Sep 2025 16:03:12 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Sep 2025 16:03:10 -0400 (EDT)
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
X-Inumbo-ID: 59e17d9b-8a93-11f0-9d12-b5c5bf9af7f9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1757102592;
	 x=1757188992; bh=yTJmYk2jAFBxEe0tEVUQwPU5zQxCRQdlLX4xJPUKZ6A=; b=
	LeVWsQp6yrQ+6Hxzq8fZV6CPhoE+XFPBSo0TFdemCmtunjz2lZKAJHgmnCnSB/N7
	AsQx9SwoINwZKaKnvOjlF/WUs1UbAkwTtmBmll0uzs11ed+6/b/S5dJhvPKG5scO
	wrTKUwxdstLZz3NjdEQKOycmNlgoOilc52BI0GfeLDlkzCzRwU1kpWsGNma+V1cY
	i933SIvx0gDKXIstIF5YvklT6AT4QjS/7yf3dPjyKU0JRDcz9Drco39qOzYA3LeZ
	XkQPnAbULidFVhwGcaGE3FKQk3jwQrwJ3YQ+4z/W0P6Yqyna1iIeoNFoNf7IxYy1
	IuK6rY52gUsssozWXciU+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1757102592; x=1757188992; bh=yTJmYk2jAFBxEe0tEVUQwPU5zQxCRQdlLX4
	xJPUKZ6A=; b=FhRgkFt8a1tIs2VxJAm6UgeXZdBtOcCwnhFR4VW1TknlgawEB8d
	Rk/yTZ5uUhqr764wHznvqNThwCSkrWtjh4dyS8XP62WekAc/Yp+x21Ie5AfS35hJ
	/4ht4MTsgrPCQaeersq2LYgzVoGz/Dp0B07gHeOlp+mikOUTZxxlzY0endvG0RiX
	CTeE/og36PpMN53EZ9hPdgN2c7ViSiy9RW0dZXOFZXYzpGzKl3TxsLl+HsoHDiv6
	a0QrmI7bkbNo7TiPk9BZzIzNfRJNJtuY6iUoqeDnfob037EMK2Dh6zizqpFuS6YJ
	v/iDcf4uYp6u97RWtOExa97yu/Vvwe/97vQ==
X-ME-Sender: <xms:_0G7aLZZM8woUP2CS7j92JD4wbEChkoQUvmeltKr1eK8cVjDXx9SpQ>
    <xme:_0G7aKF4uSXHPH9iHMRimT9m3a57rK5onSlVLbdm7oDR3IFHgT568Xn08e6mX9GZy
    bIhxm7745yw0w>
X-ME-Received: <xmr:_0G7aJmIPecMR4oHvR5ANUvSBiJKQ4vcKABtgq-PKIBRqizoNPJ1F36GIPHhHn3nhiLgkICzNLBQI18MPYxc513XBwlZqy6WZlI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdelkedtucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:_0G7aNfiRlCCQB3KMYyCwP2UcSyWnDmdiIMVIkS0byZxoJp_Jd_Qyw>
    <xmx:_0G7aHGSFGXRb7q1dvqt6lDPkAeqVIwTL94znDblgCxrCQnS2LP40g>
    <xmx:_0G7aDj7SlNsArrcsi-GNQRwVN04Pwc0hQjYbHXuE1CKNwBQjjeg9A>
    <xmx:_0G7aL2xcrkVlpaNFX8KcEY7Yo3ul8SSo5kNm2igT9tHRSazbwqTyg>
    <xmx:AEK7aO1NSehz6HKVycbbo_WGa_aq9NqdLgbJN2STEGr6tv_HDCfrfFVN>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 5 Sep 2025 22:03:08 +0200
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
Subject: Re: [PATCH v4 2/2] efi: Support using Shim's LoadImage protocol
Message-ID: <aLtB_JFMOAnWzXFF@mail-itl>
References: <cover.1757071716.git.gerald.elder-vass@cloud.com>
 <93ffff66c08d05bc2d912be1831954911e17a27c.1757071716.git.gerald.elder-vass@cloud.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DFPUPugwv6mACCPu"
Content-Disposition: inline
In-Reply-To: <93ffff66c08d05bc2d912be1831954911e17a27c.1757071716.git.gerald.elder-vass@cloud.com>


--DFPUPugwv6mACCPu
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 5 Sep 2025 22:03:08 +0200
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
Subject: Re: [PATCH v4 2/2] efi: Support using Shim's LoadImage protocol

On Fri, Sep 05, 2025 at 12:10:18PM +0000, Gerald Elder-Vass wrote:
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


Acked-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

Preferably with comment adjustment as suggested by Andrew.

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
> v4:
> - Updated error message when failing due to lack of verification
>=20
> v3:
> - Use Shim Image by default, fall back to Shim Lock
> ---
>  xen/common/efi/boot.c | 59 +++++++++++++++++++++++++++++++++++++------
>  1 file changed, 51 insertions(+), 8 deletions(-)
>=20
> diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> index ccbfc401f7ba..0a72c293301d 100644
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
> +            blexit(L"Refusing to boot unverified kernel with UEFI Secure=
Boot enabled");
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

--DFPUPugwv6mACCPu
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmi7QfwACgkQ24/THMrX
1ywdpgf+MwRbdFKr4yxFkRsX6My6MtYx7RtTm3q9euEz+yyj6V0Ua3y7j0FC9s97
fuUeiIHqTDAXWL2aELUTTgQXAHGuqk2xlbKBu0cHoo2wVy7kqtm5FKgGb/rqEk00
TGWy4d+FpmgwM+M+PZx7JK4Ql2PIrfD2Lzgw9EpLIH0rbxSIESJ5ZGdB5zeHuBCx
FbDBuPWSy4M9bwAfP2V86MNdAUWjVa9dfG75Fk0Oddvnfms+ERDW59YeqtI6Huxo
N8TuwOUgiDblI7a+xi1WVxXdkY+J9HLvUFIhv7DlW06dlDmdc7mgS/H4VB8ouSFV
t/pWEvDGOP70c66gTOXLhJZtA1ffZg==
=2FuS
-----END PGP SIGNATURE-----

--DFPUPugwv6mACCPu--

