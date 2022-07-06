Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 09B0B568649
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 12:58:31 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362119.592027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o92jY-0002Aq-1B; Wed, 06 Jul 2022 10:58:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362119.592027; Wed, 06 Jul 2022 10:58:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o92jX-00027N-TX; Wed, 06 Jul 2022 10:58:15 +0000
Received: by outflank-mailman (input) for mailman id 362119;
 Wed, 06 Jul 2022 10:58:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=91kg=XL=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1o92jW-00027F-Qr
 for xen-devel@lists.xenproject.org; Wed, 06 Jul 2022 10:58:14 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 87d08568-fd1a-11ec-924f-1f966e50362f;
 Wed, 06 Jul 2022 12:58:13 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id C80235C00D7;
 Wed,  6 Jul 2022 06:58:12 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 06 Jul 2022 06:58:12 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 6 Jul 2022 06:58:12 -0400 (EDT)
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
X-Inumbo-ID: 87d08568-fd1a-11ec-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1657105092; x=
	1657191492; bh=hIAYHdDG10sBEFuuNt2DnlsfYXNg/iIRj5NijnFQs8E=; b=q
	fQC6tVtxBUBWeAKjVGW9c7DEiKBOgyRRvYBNnT3pP+Qg/HJgITnrcbwIta4bQS0I
	omD9C0Iw0GzF0+8MjDf3PwAu/P/2u+8j37sAMssOErBkPA9QHxYBf6BFvFwM8Uvq
	7f4lKW253DY/LLi9P1n3q5mpYGvO9EnpDj/hNkXtIjFXKh2q8mZwqC82lIIomHYr
	pc9CHWq9HsWvW3AcQgvZ65JQ7s45rvi+zLVNKSVSY8tEWoKuKlDC9JfJEKdQlQ8i
	dhlHvkq6+a3a6fQ3es2Sa3vlKxZY3jY0CVy3SBjcvPvbTNK0aMWsTrCHAg6Szrsm
	qT5EPWSOfrrSZho4gSw3w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1657105092; x=1657191492; bh=hIAYHdDG10sBEFuuNt2DnlsfYXNg
	/iIRj5NijnFQs8E=; b=q/0/IngZmROthYJZITAfml8iU5fV4+OJDxNRQ9viojM7
	zMSq6X5i7crlUkLcDgJctxsjLzQLwU7P0B1gEghZf4jvuw5ZNrUngFcWYDR6SUgL
	i4qOrq5XmkUnK64/iwef7j9D+VUAHpNa7Zx7vqOSpqRAsnbludFU+O+Zm1nJTXLS
	VljIDCkn3xNfbDwLI2a7aTLjTDsNJwcit0L3TA1GLynB8HoIbN7sx79vLIIsQRF8
	eQwJIOnLhVNllE2EZUZ8jmpUUaSAnoVTaAKgo7uz/n0neChLDTapxpC+BcpobF4a
	d/9Iq3kCU0XXrrQVv34gRl+xPj3fM1s27RN7XEZ6ww==
X-ME-Sender: <xms:xGrFYgaZGl4RmAUPdMxItJOhGvIXBltiCvpkTEmFSfkYgVeEbq3PDA>
    <xme:xGrFYranTIRA6VBCz-TdmmROzWh23P26Wfv6pUsYPdDNCK0AZbTkQCgCZR5Vacapy
    4jcntccFq_uedI>
X-ME-Received: <xmr:xGrFYq9EeZrHmrTkHWMJ4h-vm-R2qpEE9gePQPnF5HyXmrSvsumQrlWCUggq>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeifedgfeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepffgvmhhi
    ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepvdejteegkefhteduhffgteffgeff
    gfduvdfghfffieefieekkedtheegteehffelnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhs
    lhgrsgdrtghomh
X-ME-Proxy: <xmx:xGrFYqrkjhF9_We2Hea_uwMr3RDLlVcGvm_-DYnpNngnYKDUpLUOGA>
    <xmx:xGrFYrrcQ1D7me2AupFt5sely7qMLWJAXxrDbkVppZbRuKat62f3DQ>
    <xmx:xGrFYoSzkm2Ih7IYpKCdWEf4g9btimjcZxy0ooobzLd1FzKZeWtiog>
    <xmx:xGrFYi0HhKiZvUjzEK1HxeMFaJTnIMd59oThTF_wnZCGwzJuBuYKUw>
Feedback-ID: iac594737:Fastmail
Date: Wed, 6 Jul 2022 06:58:09 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Julien Grall <julien@xen.org>,
	Luca Fancellu <Luca.Fancellu@arm.com>
Subject: Re: [PATCH v8] Preserve the EFI System Resource Table for dom0
Message-ID: <YsVqwbZ9dOz8WG5E@itl-email>
References: <7f773ea8d3967fc3dd2a485384a852c006fd82b9.1656093756.git.demi@invisiblethingslab.com>
 <863733AF-212D-4059-B780-3DDC0AC58FD7@arm.com>
 <19e001c3-fb66-2306-1e63-578239e91ad3@citrix.com>
 <ef9cde4f-be13-134b-3c26-194484d165de@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ct2p07v3Jt0Vg8Dz"
Content-Disposition: inline
In-Reply-To: <ef9cde4f-be13-134b-3c26-194484d165de@suse.com>


--Ct2p07v3Jt0Vg8Dz
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 6 Jul 2022 06:58:09 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <Andrew.Cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Julien Grall <julien@xen.org>,
	Luca Fancellu <Luca.Fancellu@arm.com>
Subject: Re: [PATCH v8] Preserve the EFI System Resource Table for dom0

On Wed, Jul 06, 2022 at 12:55:50PM +0200, Jan Beulich wrote:
> On 06.07.2022 12:44, Andrew Cooper wrote:
> > On 06/07/2022 11:32, Luca Fancellu wrote:
> >>> On 24 Jun 2022, at 19:17, Demi Marie Obenour <demi@invisiblethingslab=
=2Ecom> wrote:
> >>>
> >>> diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> >>> index a25e1d29f1..f6f34aa816 100644
> >>> --- a/xen/common/efi/boot.c
> >>> +++ b/xen/common/efi/boot.c
> >>> @@ -567,6 +587,41 @@ static int __init efi_check_dt_boot(const EFI_LO=
ADED_IMAGE *loaded_image)
> >>> }
> >>> #endif
> >>>
> >>> +static UINTN __initdata esrt =3D EFI_INVALID_TABLE_ADDR;
> >>> +
> >>> +static size_t __init get_esrt_size(const EFI_MEMORY_DESCRIPTOR *desc)
> >>> +{
> >>> +    size_t available_len, len;
> >>> +    const UINTN physical_start =3D desc->PhysicalStart;
> >> Hi,
> >>
> >> From my tests on an arm64 machine so far I can tell that desc is NULL =
here,
> >> for this reason we have the problem.
> >>
> >> I=E2=80=99ll have a further look on the cause of this, but if you are =
faster than me you are
> >> welcome to give your opinion on that.
> >=20
> > Given this observation, there's clearly ...
> >=20
> >> @@ -1051,6 +1110,70 @@ static void __init efi_set_gop_mode(EFI_GRAPHIC=
S_OUTPUT_PROTOCOL *gop, UINTN gop
> >> #define INVALID_VIRTUAL_ADDRESS (0xBAAADUL << \
> >>                                  (EFI_PAGE_SHIFT + BITS_PER_LONG - 32))
> >>
> >> +static void __init efi_relocate_esrt(EFI_SYSTEM_TABLE *SystemTable)
> >> +{
> >> +    EFI_STATUS status;
> >> +    UINTN info_size =3D 0, map_key, mdesc_size;
> >> +    void *memory_map =3D NULL;
> >> +    UINT32 ver;
> >> +    unsigned int i;
> >> +
> >> +    for ( ; ; ) {
> >> +        status =3D efi_bs->GetMemoryMap(&info_size, memory_map, &map_=
key,
> >> +                                      &mdesc_size, &ver);
> >> +        if ( status =3D=3D EFI_SUCCESS && memory_map !=3D NULL )
> >> +            break;
> >> +        if ( status =3D=3D EFI_BUFFER_TOO_SMALL || memory_map =3D=3D =
NULL )
> >> +        {
> >> +            info_size +=3D 8 * efi_mdesc_size;
> >> +            if ( memory_map !=3D NULL )
> >> +                efi_bs->FreePool(memory_map);
> >> +            memory_map =3D NULL;
> >> +            status =3D efi_bs->AllocatePool(EfiLoaderData, info_size,=
 &memory_map);
> >> +            if ( status =3D=3D EFI_SUCCESS )
> >> +                continue;
> >> +            PrintErr(L"Cannot allocate memory to relocate ESRT\r\n");
> >> +        }
> >> +        else
> >> +            PrintErr(L"Cannot obtain memory map to relocate ESRT\r\n"=
);
> >> +        return;
> >> +    }
> >> +
> >> +    /* Try to obtain the ESRT.  Errors are not fatal. */
> >> +    for ( i =3D 0; i < info_size; i +=3D efi_mdesc_size )
> >> +    {
> >> +        /*
> >> +         * ESRT needs to be moved to memory of type EfiRuntimeService=
sData
> >> +         * so that the memory it is in will not be used for other pur=
poses.
> >> +         */
> >> +        void *new_esrt =3D NULL;
> >> +        size_t esrt_size =3D get_esrt_size(efi_memmap + i);
> >=20
> > ... a NULL pointer here.=C2=A0 And the only way that could happen is if
> > efi_memmap is NULL.
>=20
> Incomplete refactoring - this needs to be memory_map, not efi_memmap.
> Of course efi_mdesc_size also needs to be mdesc_size. Didn't check
> for further leftover from the earlier patch version. I'm going to
> revert the commit.

Sorry about that.  Want me to submit a v9?
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--Ct2p07v3Jt0Vg8Dz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmLFasIACgkQsoi1X/+c
IsG5iA/+JI7johb6M2AFFrTshQVWX55/gp8RfDq23nFiGazRzlkl7FJ7x/hODVms
tEQUSg9C25fa/OhC969evu18JKxMPt3qwT+Qe6Zdr8uEYDCe4ooAdBQjXDOXoGV0
PB59ORNgO62IknxPmGoKAJ/ILsL/U1ZISZaoCZq1njZjoa5xHj2irzJlwGlKdRi+
4Lcg5WTYDz7d8VISbMIghKFYBrWYGEy5LKTBc26x7RqSxFzyEpDw0xLEH6x3R3xB
AZGwWFk8ibrDONQLz9XyeI4T7kbmIsxHlODo5H0yuq2jGF/814soP1I2PQ2j9+yF
+2FBfDpVBYefaTcyVcekYyqfOy5F4/X1HJQVlE9zfNzuxn4Djil7VJBJZmwQbTmo
VxlBTIE3pHOgskylb6M42EJ6ft3JI4UFh5Fojowc1gOl0OSLxF1nMaEuPtNp+v5s
7LEPdY6uOvsaoA0wk62YTkSTqnNPhomvHAxqnWhRv/RPngRGN9amUh6Nbu9a6rbn
XIcpUXsWVRMW9/U4Cd3Tn96rhHoPdzF4w7l85pgQSA1e6cMwqLuMdpOxVIMuklPL
Edgrb4XjkGtunMjz2DCICGsLrAUiDYTcHOdXY7mk/VQ2eSeqw/5dX0b4PpLJ8JFU
jbCtxGNsG99+WgWV8is1hq8KE3ZJZPeJhdurghbRvwbK8klndAw=
=lpY5
-----END PGP SIGNATURE-----

--Ct2p07v3Jt0Vg8Dz--

