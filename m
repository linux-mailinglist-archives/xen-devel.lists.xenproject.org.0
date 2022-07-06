Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D132D568628
	for <lists+xen-devel@lfdr.de>; Wed,  6 Jul 2022 12:52:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.362107.592005 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o92dd-0000gN-5T; Wed, 06 Jul 2022 10:52:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 362107.592005; Wed, 06 Jul 2022 10:52:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o92dd-0000dV-19; Wed, 06 Jul 2022 10:52:09 +0000
Received: by outflank-mailman (input) for mailman id 362107;
 Wed, 06 Jul 2022 10:52:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=91kg=XL=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1o92db-0000dP-Gc
 for xen-devel@lists.xenproject.org; Wed, 06 Jul 2022 10:52:07 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aaf0c005-fd19-11ec-924f-1f966e50362f;
 Wed, 06 Jul 2022 12:52:05 +0200 (CEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 339F45C00E8;
 Wed,  6 Jul 2022 06:52:02 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 06 Jul 2022 06:52:02 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 6 Jul 2022 06:52:01 -0400 (EDT)
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
X-Inumbo-ID: aaf0c005-fd19-11ec-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1657104722; x=
	1657191122; bh=9c4hdoBeP2Q0FjUJjioREfh5qqdrnbT9BntwAOAyppI=; b=E
	U03QxCB7C8j7dUWQNfIUfo1SZmEVErpdDgpz4bbLKJNn63VcNJvO0mHytkRhzIcQ
	cUFp0xx+DOmCO4CZtOR3FI7dcC7XYqM8cI2KBozoSa9Jt2rjIDRGrO9rif9qxiou
	yW31wKldFBLwRmggATdGRv0E8460rDC17VaMvNzQlknHgqMX5GgYaHCtop1hZyob
	KmuhIzpFt19w9xwvLZPm2X2FAxX5i15Tt938nqRmHpI+3Zp/cGcZNCH2l7lxrQHL
	nW1olAkQz8ykTsKE0wLZwluX3+BeFbPOMAkXjqeOSPnJvm6o9RdVnTBLjoTZGxry
	HE6rCM+m+05tl8TS/ZGOQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1657104722; x=1657191122; bh=9c4hdoBeP2Q0FjUJjioREfh5qqdr
	nbT9BntwAOAyppI=; b=kHH8VuWLsIGJ2lcPAouGbXiZ18gBXtDJ577tKJrlddXo
	GtV1x+pcSzD9gH95DeZOjUdk7Wx+j6Ckn+nrMXFu6h5s3B/aFGKKv3sVl/oxggXs
	tbW1T0F0HunT7+zWsG6z0gWy1fjqWkJD3Fmm709206HlNWsRtShRZMvBOlYHLO7W
	fiJIK01fRbtfovhfOY6DTXD0AOVzmxQNZ7RxtfJdsKfBRanhnvFDOpdLH8VQnV12
	HsSKSgJU6wmFafgqNhRyUtHhG/tC4yaeXfddtye3MbPwrkb2opkiLqB/O5cPh3GN
	vA6w8QUWSe2/rTHrpcclkqhyW1Gp1ZUKq7KOAgCQww==
X-ME-Sender: <xms:UWnFYom6B_bfe58MVfYVt1ul7Kl4DwWQyRqkXq34RLuqnbn1NqUTlQ>
    <xme:UWnFYn2eI7-goye0J_rfh4TcUzMPN1LD1qS4vUTcOsC-BolKzAA_HocoQ3ENEDaja
    ojXyVd99UP0tvU>
X-ME-Received: <xmr:UWnFYmohK9vZkm22-p0Pl0d2RLG7TgAUTKueKuEwkw_vCvA6lmcv6pvDo2zf>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeifedgfedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepffgvmhhi
    ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepvdejteegkefhteduhffgteffgeff
    gfduvdfghfffieefieekkedtheegteehffelnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhs
    lhgrsgdrtghomh
X-ME-Proxy: <xmx:UWnFYkni_Q_JxfVxcfjDtbV1rjw0PtW4DLLflvSqPhAZSgfVfJlXsw>
    <xmx:UWnFYm2z9g3OoAFa3FvZi0a5jGih1FsQ_ZhPEx4uzDF-lKorzSi02Q>
    <xmx:UWnFYrvvoAZN1gjd_2IY3fWruhD_SGwj-zEe-_tCih4Yef8zrDAcdQ>
    <xmx:UmnFYkDhyWQxAq3sPiX7gOsq5sQmmquusje63sK9P8VGl-ZPLGa01g>
Feedback-ID: iac594737:Fastmail
Date: Wed, 6 Jul 2022 06:51:54 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
	Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH v8] Preserve the EFI System Resource Table for dom0
Message-ID: <YsVpT/msXv8AKI1G@itl-email>
References: <7f773ea8d3967fc3dd2a485384a852c006fd82b9.1656093756.git.demi@invisiblethingslab.com>
 <863733AF-212D-4059-B780-3DDC0AC58FD7@arm.com>
 <19e001c3-fb66-2306-1e63-578239e91ad3@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8hAxd1sWeykijlYZ"
Content-Disposition: inline
In-Reply-To: <19e001c3-fb66-2306-1e63-578239e91ad3@citrix.com>


--8hAxd1sWeykijlYZ
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 6 Jul 2022 06:51:54 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Andrew Cooper <Andrew.Cooper3@citrix.com>,
	Luca Fancellu <Luca.Fancellu@arm.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>
Subject: Re: [PATCH v8] Preserve the EFI System Resource Table for dom0

On Wed, Jul 06, 2022 at 10:44:46AM +0000, Andrew Cooper wrote:
> On 06/07/2022 11:32, Luca Fancellu wrote:
> >> On 24 Jun 2022, at 19:17, Demi Marie Obenour <demi@invisiblethingslab.=
com> wrote:
> >>
> >> diff --git a/xen/common/efi/boot.c b/xen/common/efi/boot.c
> >> index a25e1d29f1..f6f34aa816 100644
> >> --- a/xen/common/efi/boot.c
> >> +++ b/xen/common/efi/boot.c
> >> @@ -567,6 +587,41 @@ static int __init efi_check_dt_boot(const EFI_LOA=
DED_IMAGE *loaded_image)
> >> }
> >> #endif
> >>
> >> +static UINTN __initdata esrt =3D EFI_INVALID_TABLE_ADDR;
> >> +
> >> +static size_t __init get_esrt_size(const EFI_MEMORY_DESCRIPTOR *desc)
> >> +{
> >> +    size_t available_len, len;
> >> +    const UINTN physical_start =3D desc->PhysicalStart;
> > Hi,
> >
> > From my tests on an arm64 machine so far I can tell that desc is NULL h=
ere,
> > for this reason we have the problem.
> >
> > I=E2=80=99ll have a further look on the cause of this, but if you are f=
aster than me you are
> > welcome to give your opinion on that.
>=20
> Given this observation, there's clearly ...
>=20
> > @@ -1051,6 +1110,70 @@ static void __init efi_set_gop_mode(EFI_GRAPHICS=
_OUTPUT_PROTOCOL *gop, UINTN gop
> > #define INVALID_VIRTUAL_ADDRESS (0xBAAADUL << \
> >                                  (EFI_PAGE_SHIFT + BITS_PER_LONG - 32))
> >
> > +static void __init efi_relocate_esrt(EFI_SYSTEM_TABLE *SystemTable)
> > +{
> > +    EFI_STATUS status;
> > +    UINTN info_size =3D 0, map_key, mdesc_size;
> > +    void *memory_map =3D NULL;
> > +    UINT32 ver;
> > +    unsigned int i;
> > +
> > +    for ( ; ; ) {
> > +        status =3D efi_bs->GetMemoryMap(&info_size, memory_map, &map_k=
ey,
> > +                                      &mdesc_size, &ver);
> > +        if ( status =3D=3D EFI_SUCCESS && memory_map !=3D NULL )
> > +            break;
> > +        if ( status =3D=3D EFI_BUFFER_TOO_SMALL || memory_map =3D=3D N=
ULL )
> > +        {
> > +            info_size +=3D 8 * efi_mdesc_size;
> > +            if ( memory_map !=3D NULL )
> > +                efi_bs->FreePool(memory_map);
> > +            memory_map =3D NULL;
> > +            status =3D efi_bs->AllocatePool(EfiLoaderData, info_size, =
&memory_map);
> > +            if ( status =3D=3D EFI_SUCCESS )
> > +                continue;
> > +            PrintErr(L"Cannot allocate memory to relocate ESRT\r\n");
> > +        }
> > +        else
> > +            PrintErr(L"Cannot obtain memory map to relocate ESRT\r\n");
> > +        return;
> > +    }
> > +
> > +    /* Try to obtain the ESRT.  Errors are not fatal. */
> > +    for ( i =3D 0; i < info_size; i +=3D efi_mdesc_size )
> > +    {
> > +        /*
> > +         * ESRT needs to be moved to memory of type EfiRuntimeServices=
Data
> > +         * so that the memory it is in will not be used for other purp=
oses.
> > +         */
> > +        void *new_esrt =3D NULL;
> > +        size_t esrt_size =3D get_esrt_size(efi_memmap + i);
>=20
> ... a NULL pointer here.=C2=A0 And the only way that could happen is if
> efi_memmap is NULL.
>=20
> Which perhaps isn't surprising because presumably ARM gets memory
> information from the DT, not EFI?
>=20
> ~Andrew

Which in turn would explain why the problem is ARM-specific, and would
mean that disabling this on ARM would solve the problem.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--8hAxd1sWeykijlYZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmLFaU8ACgkQsoi1X/+c
IsHVYhAAg5WrGsuRxiWCx+8Z38t4ygs2nGk0jTI+pxeSQZrmW3Gotx3RPu43KHTH
D9HavUqlXGHuYJsJoXVCg1D6FQpI5LMXNzul+YDL7AgHoTYb4qebr+LlZRLVc5Cl
Zg8nK6X8efyKQu6Kzobt1FxCLfxTxt3vd5FxGSPiYt6k7w/Beig2N7d3MoGvjXpd
hz1VK07YMOicrfkt7HfnndFJQyeR7YPFo5AIBR3QoJgN2o8Ml3wC8CwnvpJkWdVL
nucD3MEjcz/VfGT95Z9Wna+Hbgf+XXYZxvG+KR9OAJjFyjHGYbMvy1mEODa5u2Ov
uEUsxpgTybzKP+nQ6JFzf7TuXvebosMkB7rqBmnPA7dyQiOqsWt4SucqA9Tifenm
jE8t7I3LlD5l/AAENica3K/gqhwCr8DHJTTMVWDgaoHcBIEZvGfzZioMAa1NvKZS
okjAUI41puUp0tEEctt6Uzg6RAwU+Y/N86qX82jYrwC02/sl6dUj1AsbRTiUJHw2
iKLxLfBQHeP/7jlOa6JH3TTNio3fXwcwooy9R+vMcUfpCLcLxnrJzeIAygajwjAH
Dg+YwDmNx1xzSmbw8+/1IA9BxaF+smQXXNo40y0Vb/fvTm5PgmsLVV8Rqwae+E/i
TBax8sFf3vjxaT/0xPgFKQpvdsiTMIFA6pjbHAq+1o4S6DoMR8U=
=Dium
-----END PGP SIGNATURE-----

--8hAxd1sWeykijlYZ--

