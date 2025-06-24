Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C087AE6557
	for <lists+xen-devel@lfdr.de>; Tue, 24 Jun 2025 14:46:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1023650.1399671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU32z-00047D-12; Tue, 24 Jun 2025 12:46:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1023650.1399671; Tue, 24 Jun 2025 12:46:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uU32y-00045c-UU; Tue, 24 Jun 2025 12:46:44 +0000
Received: by outflank-mailman (input) for mailman id 1023650;
 Tue, 24 Jun 2025 12:46:43 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Fpib=ZH=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uU32x-00045W-QO
 for xen-devel@lists.xenproject.org; Tue, 24 Jun 2025 12:46:43 +0000
Received: from fhigh-b5-smtp.messagingengine.com
 (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 473eafe6-50f9-11f0-a30f-13f23c93f187;
 Tue, 24 Jun 2025 14:46:42 +0200 (CEST)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal
 [10.202.2.41])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 5B3617A0136;
 Tue, 24 Jun 2025 08:46:41 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-01.internal (MEProxy); Tue, 24 Jun 2025 08:46:41 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Jun 2025 08:46:39 -0400 (EDT)
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
X-Inumbo-ID: 473eafe6-50f9-11f0-a30f-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1750769201;
	 x=1750855601; bh=VX9e5XC3c5rl9CNnxhACIxF0/jLrmMLiHD41lh7PGlQ=; b=
	Yh1+ih8BY/V9K1lsZ6jZizID1JtmQODAH8AKL0d7R1niqzy49+eAmBNZceW9MCf4
	YSFM4ZvWZTfJEERTUt2OWGm5wcA5gBLgmDvBcXuqf/30HEPdHzrIQpC0g1JVhIWp
	Wb9L0SAXorECieMsSS3cscnbFpAfrpzvBxjfmJjxw2148jLwlTjZRYFMssFosorz
	xLCxmkiDSozjwK9+XxPPZ5Rycg2/LsId55Pb0bGmgzbhFxI7QYOQzvZiiabxozu+
	CAzFSzKRX3xTgmSD6t/+pcHGHNH764XjJx4q/Ur6rsOVyJvJARM7W3EKdTQ0iYNf
	mDODcnGU0hEF/Xzyx1BHPw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1750769201; x=1750855601; bh=VX9e5XC3c5rl9CNnxhACIxF0/jLrmMLiHD4
	1lh7PGlQ=; b=jWfetVvk8ANPW5iKcS0nDZkYnMJWL0c87slMe+JIKUL+NgfnPUZ
	hzWXdWwhdUdJc9yXP6pL7KtsxmOKChv0gpkGhRz9yvRrEtQvAFMFphEqxjBR5yub
	8vpJIyN+ZE8KYQeWBF4uPZ5aKNiZA8F0eQHduazLLKCZ61fvyer1Niql02EWqNek
	SD9PfCM/g+m2Ns6xLSGYk6VCYezOqJ/w93w55eU2O8+fXBoTCE0CaODMHpjLsSuy
	DuIpDwiMyWH5knOnrkRM+PojYYZnaZsORWaXnZGarvnG9Rvy6zOie9stJRevjx70
	I/IhZbF4WSrwrTIsDfvRXASfXt0yqfvomHg==
X-ME-Sender: <xms:MJ5aaDLITQIxY14gjGHRP277GTbhbjTuoQ5ncO6-X-xLdSw9ZcSCXw>
    <xme:MJ5aaHJFCQ8bF-6yFhzKgU9kwKN9K4Pj5derqkl166MnpJKJRfE_mCThY4yu4V-KZ
    8xY7A8yGNkYfQ>
X-ME-Received: <xmr:MJ5aaLtVz5PCtKuCz1cfK2T61FsxBnjbectZJZFedJNt-TANrnev9DKdARvAJbF1JQknYb_glV12t7WsM1oy97cJ1cLDrRtqepc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddvgdduleelfecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:MJ5aaMbulK0YXHE8zVdhsPHDVQlPuzQdp6Yz2YxxzPOVdnSzUC6a4Q>
    <xmx:MJ5aaKZSu8VDz18UBbUtfYaJvZlvk6upUyQfZmQ6SuvDScY4-jQCGA>
    <xmx:MJ5aaADx8SIXvpCT-7djl0IZc5mfnuHjLHpZAzkNiSFcu6Q3MoSxmw>
    <xmx:MJ5aaIYuJ97vfcRGan5H_tNlLcT0aT3-orzXF7Qx2xTHgA--GnpQgg>
    <xmx:MZ5aaGFzlbfHKvnjytFk4Lmpk2q1l4Dstes09R4gKKoXVXNuEchpMbSU>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 24 Jun 2025 14:46:37 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 2/2] xen/efi: Support loading initrd using GRUB2
 LoadFile2 protocol
Message-ID: <aFqeLXnOzyfb1GOF@mail-itl>
References: <20250624083157.9334-1-frediano.ziglio@cloud.com>
 <20250624083157.9334-3-frediano.ziglio@cloud.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VHZAk3GJEJ7l8I77"
Content-Disposition: inline
In-Reply-To: <20250624083157.9334-3-frediano.ziglio@cloud.com>


--VHZAk3GJEJ7l8I77
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 24 Jun 2025 14:46:37 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Frediano Ziglio <frediano.ziglio@cloud.com>
Cc: xen-devel@lists.xenproject.org,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH 2/2] xen/efi: Support loading initrd using GRUB2
 LoadFile2 protocol

On Tue, Jun 24, 2025 at 09:31:55AM +0100, Frediano Ziglio wrote:
> Allows to load Xen using "linux" and "initrd" GRUB2 commands.
> This can be used with UKI to separate initrd in a different module
> instead of bundling all together.
> Bundling all together can be a problem with Secure Boot where
> we need to sign the bundle making harder to change it.
> As initrd content does not need to be signed for Secure Boot
> bundling it force it to be signed too.
>=20
> Signed-off-by: Frediano Ziglio <frediano.ziglio@cloud.com>
> ---
>  xen/common/efi/boot.c     | 71 ++++++++++++++++++++++++++++++++++++++-
>  xen/include/efi/efidevp.h | 21 ++++++++++++
>  2 files changed, 91 insertions(+), 1 deletion(-)
>=20
> diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> index 2a49c6d05d..87eb8bb8ae 100644
> --- a/xen/common/efi/boot.c
> +++ b/xen/common/efi/boot.c
> @@ -849,6 +849,74 @@ static bool __init read_file(EFI_FILE_HANDLE dir_han=
dle, CHAR16 *name,
>      return true;
>  }
> =20
> +#pragma pack(1)
> +typedef struct {
> +    VENDOR_DEVICE_PATH              VenMediaNode;
> +    EFI_DEVICE_PATH                 EndNode;
> +} SINGLE_NODE_VENDOR_MEDIA_DEVPATH;
> +#pragma pack()
> +
> +static bool __init initrd_load_file2(const CHAR16 *name, struct file *fi=
le)

This function I haven't tested yet, but it looks okay I think.

> +{
> +    static const SINGLE_NODE_VENDOR_MEDIA_DEVPATH __initconst initrd_dev=
_path =3D {
> +        {
> +            {
> +                MEDIA_DEVICE_PATH, MEDIA_VENDOR_DP, { sizeof (VENDOR_DEV=
ICE_PATH) }
> +            },
> +            LINUX_EFI_INITRD_MEDIA_GUID
> +        },
> +        {
> +            END_DEVICE_PATH_TYPE, END_ENTIRE_DEVICE_PATH_SUBTYPE,
> +            { sizeof (EFI_DEVICE_PATH) }
> +        }
> +    };
> +    static EFI_GUID __initdata lf2_proto_guid =3D EFI_LOAD_FILE2_PROTOCO=
L_GUID;
> +    EFI_DEVICE_PATH *dp;
> +    EFI_LOAD_FILE2_PROTOCOL *lf2;
> +    EFI_HANDLE handle;
> +    EFI_STATUS ret;
> +    UINTN size;
> +
> +    dp =3D (EFI_DEVICE_PATH *)&initrd_dev_path;
> +    ret =3D efi_bs->LocateDevicePath(&lf2_proto_guid, &dp, &handle);
> +    if ( EFI_ERROR(ret) )
> +    {
> +        if ( ret =3D=3D EFI_NOT_FOUND)
> +            return false;
> +        PrintErrMesg(L"Error getting file with LoadFile2 interface", ret=
);
> +    }
> +
> +    ret =3D efi_bs->HandleProtocol(handle, &lf2_proto_guid, (void **)&lf=
2);
> +    if ( EFI_ERROR(ret) )
> +        PrintErrMesg(L"LoadFile2 file does not provide correct protocol"=
, ret);
> +
> +    size =3D 0;
> +    ret =3D lf2->LoadFile(lf2, dp, false, &size, NULL);
> +    if ( ret !=3D EFI_BUFFER_TOO_SMALL )
> +        PrintErrMesg(L"Loading failed", ret);
> +
> +    file->addr =3D min(1UL << (32 + PAGE_SHIFT),
> +                     HYPERVISOR_VIRT_END - DIRECTMAP_VIRT_START);
> +    ret =3D efi_bs->AllocatePages(AllocateMaxAddress, EfiLoaderData,
> +                                PFN_UP(size), &file->addr);
> +    if ( EFI_ERROR(ret) )
> +        PrintErrMesg(L"Allocation failed", ret);
> +
> +    file->need_to_free =3D true;
> +    file->size =3D size;
> +
> +    ret =3D lf2->LoadFile(lf2, dp, false, &size, file->str);
> +    if ( EFI_ERROR(ret) )
> +    {
> +        efi_bs->FreePages(file->addr, PFN_UP(size));
> +        PrintErrMesg(L"Loading failed", ret);
> +    }
> +
> +    efi_arch_handle_module(file, name, NULL);
> +
> +    return true;
> +}
> +
>  static bool __init read_section(const EFI_LOADED_IMAGE *image,
>                                  const CHAR16 *name, struct file *file,
>                                  const char *options)
> @@ -1492,7 +1560,8 @@ void EFIAPI __init noreturn efi_start(EFI_HANDLE Im=
ageHandle,
>              kernel_verified =3D true;
>          }
> =20
> -        if ( !read_section(loaded_image, L"ramdisk", &ramdisk, NULL) )
> +        if ( !initrd_load_file2(L"ramdisk", &ramdisk) &&
> +             !read_section(loaded_image, L"ramdisk", &ramdisk, NULL) )

Unverified initrd loaded by the bootloader should _not_ take precedence
over embedded (signed) one - if whoever decided to bundle initrd into
UKI and sign it this way, that choice should be respected. The order of
conditions should be reversed here.

>          {
>              name.s =3D get_value(&cfg, section.s, "ramdisk");
>              if ( name.s )
> diff --git a/xen/include/efi/efidevp.h b/xen/include/efi/efidevp.h
> index beb5785a45..b240c15d2a 100644
> --- a/xen/include/efi/efidevp.h
> +++ b/xen/include/efi/efidevp.h
> @@ -398,5 +398,26 @@ typedef union {
> =20
>  } EFI_DEV_PATH_PTR;
> =20
> +#define EFI_LOAD_FILE2_PROTOCOL_GUID \
> +    { 0x4006c0c1, 0xfcb3, 0x403e, {0x99, 0x6d, 0x4a, 0x6c, 0x87, 0x24, 0=
xe0, 0x6d } }
> +
> +typedef struct EFI_LOAD_FILE2_PROTOCOL EFI_LOAD_FILE2_PROTOCOL;
> +
> +typedef
> +EFI_STATUS
> +(EFIAPI *EFI_LOAD_FILE2)(
> +    IN EFI_LOAD_FILE2_PROTOCOL      *This,
> +    IN EFI_DEVICE_PATH              *FilePath,
> +    IN BOOLEAN                      BootPolicy,
> +    IN OUT UINTN                    *BufferSize,
> +    IN VOID                         *Buffer OPTIONAL
> +    );
> +
> +struct EFI_LOAD_FILE2_PROTOCOL {
> +    EFI_LOAD_FILE2                  LoadFile;
> +};
> +
> +#define LINUX_EFI_INITRD_MEDIA_GUID \
> +    { 0x5568e427, 0x68fc, 0x4f3d, {0xac, 0x74, 0xca, 0x55, 0x52, 0x31, 0=
xcc, 0x68} }
> =20
>  #endif
> --=20
> 2.43.0
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--VHZAk3GJEJ7l8I77
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmhani4ACgkQ24/THMrX
1yzhJggAjBISiQMSTBJaz207SX38ye/iTuq1k4IZ1Xehj4wqNtuoMamndV4YUD51
pwnhvSej25aOTCilaOCgo3BUV4pDzLYEQcZT1XSFZjeQl8PQhia9sUw15cjX1A5I
nl07tgx+5IhQMVajnn2BpInGuKyfXMGhyyj8DZuh8xSzER0R82NGtKw+5O960F/o
GOdMdGj560K8iDi2/oaU6pGfm0MJCR6tDX2uZNjghn/e33lubd//rI1FZbszQ1Pt
sJ7n9Eq7I0xgrN+X1ydi+SqlndCqHjfEEm95bNzUGXCukdNhbZ+9jOfvPfKycX33
kHiyqLkiCxE0eGrX2sWI+bnFTeVcYA==
=6v4V
-----END PGP SIGNATURE-----

--VHZAk3GJEJ7l8I77--

