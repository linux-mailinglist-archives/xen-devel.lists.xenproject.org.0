Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B603952D662
	for <lists+xen-devel@lfdr.de>; Thu, 19 May 2022 16:46:24 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.333068.556856 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrhPp-0008IO-JD; Thu, 19 May 2022 14:46:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 333068.556856; Thu, 19 May 2022 14:46:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrhPp-0008GS-EX; Thu, 19 May 2022 14:46:13 +0000
Received: by outflank-mailman (input) for mailman id 333068;
 Thu, 19 May 2022 14:46:11 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Krf0=V3=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1nrhPn-0008F0-7P
 for xen-devel@lists.xenproject.org; Thu, 19 May 2022 14:46:11 +0000
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6575c809-d782-11ec-bd2c-47488cf2e6aa;
 Thu, 19 May 2022 16:46:02 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id DDA18320091A;
 Thu, 19 May 2022 10:45:57 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 19 May 2022 10:45:58 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 May 2022 10:45:56 -0400 (EDT)
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
X-Inumbo-ID: 6575c809-d782-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1652971557; x=
	1653057957; bh=oB+ldJHY4tOV0pnetVPWTYdJNqusaNeb1y9bZQDgR4Q=; b=H
	EUmJo6b8rkiKCBC6yRqfhm5Pr9YDa40ZQNDDk5GsNBtq8YTQYW5bH3kzhsSPTskp
	tAcnigIK6lwBXKpwO290HCMyxLTyLw/0GCtjdQY69jAUJHFvP0nrW8ZDwH4d0Usk
	CkXyVAQ2wXKxTSC8kzt+jZWAxfya5EYlxtDq1OpA1rYVEoi9twsZC8URBDc0Hhzz
	REdQxJWQHkQthC65ZZVAUXk/XkjC5eNSijMjSLkfQelRiaI97J8R8XB7RLrVilTf
	yDhDAhWPLDFJCrHPW68/K1HRvBY/IdEX9g8qCCMhcCec/yKixMZg+eoPqPG0RV/E
	Ay7eRaQ/dLRA6lnoUMEwA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1652971557; x=1653057957; bh=oB+ldJHY4tOV0pnetVPWTYdJNqus
	aNeb1y9bZQDgR4Q=; b=fcykL4k7IXMKUByRq1mxH/KL/jXE6xJOR4W8UWkUyxqN
	6bxTKWT0ivalKMS8A36UJ3EJ+KUdr3dI1QISu5siRruHiR7UBqZzHKpqvZIRWRKT
	UVjZS1fJ46eIuc5dkvOKBLIIsBLJq3qWp1iHUTW66E11vjWbxQtSzVylNWyvR81B
	zJ8HQDV2tlHw1WFY8oc9qxpnUzvN8vq/vcLoGO/txuWXAH2ykygs92pd0DGZcFSF
	WMKsFimdJk+E0XsYHTvM6qr2Mjv1J4X9WnymdaVGvCLhCeAWCoRISpaIC2kL1xKt
	pplb7345ogV5xKQcMzA043g42EAMi3mERpGAKERO+g==
X-ME-Sender: <xms:JViGYkKx4_m5lT8e600YMABir1wMQyA89ONFhHIE3_hUb7kVCJ0NWA>
    <xme:JViGYkLhAeT8a4A-dDHIpblwEeNmPtKP5NplldUbQXfGvBQ28_Lh-SE2sVE62rByP
    _Gji7A3K_09Q4o>
X-ME-Received: <xmr:JViGYkuNZqFK4HIBJPjNsOub38ybiSQ4OvrbWiEtgMw31fxi38XqitFV7gxh>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedriedugdejkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeduieelfeeutedvleehueetffejgeej
    geffkeelveeuleeukeejjeduffetjeekteenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
    rggsrdgtohhm
X-ME-Proxy: <xmx:JViGYhb3omvLUk3B-c0x391v4-mw0Hhk-7P6-U2Zsamgz3WJPLuPxA>
    <xmx:JViGYra87FaJ11KYKTODmSg6hcs7p5eJliw8CyQ2y50Ayt_OnIs_gw>
    <xmx:JViGYtB5BgHwANSv8YSctA5Mwo9-g8wmAM_4-Fz5B-Y_WrvoRBNY1Q>
    <xmx:JViGYl06dIt1YmjGY5N9AeOgyILoOO2T0amuMz8oa6_L7bXDahk7sw>
Feedback-ID: iac594737:Fastmail
Date: Thu, 19 May 2022 10:45:51 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v6] Preserve the EFI System Resource Table for dom0
Message-ID: <YoZYI9ZJzkd4WqFf@itl-email>
References: <YoUtuDhVimlP7r8F@itl-email>
 <2add184c-04a5-3ca0-876d-e354f35df62a@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ys4fH9DfKD++O4Sh"
Content-Disposition: inline
In-Reply-To: <2add184c-04a5-3ca0-876d-e354f35df62a@suse.com>


--ys4fH9DfKD++O4Sh
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 May 2022 10:45:51 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v6] Preserve the EFI System Resource Table for dom0

On Thu, May 19, 2022 at 12:32:33PM +0200, Jan Beulich wrote:
> On 18.05.2022 19:32, Demi Marie Obenour wrote:
> > @@ -567,6 +587,39 @@ static int __init efi_check_dt_boot(const EFI_LOAD=
ED_IMAGE *loaded_image)
> >  }
> >  #endif
> > =20
> > +static UINTN __initdata esrt =3D EFI_INVALID_TABLE_ADDR;
>=20
> Just out of curiosity: It's an arbitrary choice to use this initializer,
> i.e. no initializer (and hence zero) would do as well (with ...

That is correct.  I chose EFI_INVALID_TABLE_ADDR because it seemed meant
for this purpose.

> > +static size_t __init get_esrt_size(const EFI_MEMORY_DESCRIPTOR *desc)
> > +{
> > +    size_t available_len, len;
> > +    const UINTN physical_start =3D desc->PhysicalStart;
> > +    const EFI_SYSTEM_RESOURCE_TABLE *esrt_ptr;
> > +
> > +    len =3D desc->NumberOfPages << EFI_PAGE_SHIFT;
> > +    if ( esrt =3D=3D EFI_INVALID_TABLE_ADDR )
>=20
> ... an adjustment here, of course)?
>=20
> > +        return 0;
> > +    if ( physical_start > esrt || esrt - physical_start >=3D len )
> > +        return 0;
> > +    /*
> > +     * The specification requires EfiBootServicesData, but accept
> > +     * EfiRuntimeServicesData, which is a more logical choice.
> > +     */
> > +    if ( (desc->Type !=3D EfiRuntimeServicesData) &&
> > +         (desc->Type !=3D EfiBootServicesData) )
> > +        return 0;
> > +    available_len =3D len - (esrt - physical_start);
> > +    if ( available_len <=3D offsetof(EFI_SYSTEM_RESOURCE_TABLE, Entrie=
s) )
> > +        return 0;
> > +    available_len -=3D offsetof(EFI_SYSTEM_RESOURCE_TABLE, Entries);
> > +    esrt_ptr =3D (const EFI_SYSTEM_RESOURCE_TABLE *)esrt;
> > +    if ( esrt_ptr->FwResourceVersion !=3D EFI_SYSTEM_RESOURCE_TABLE_FI=
RMWARE_RESOURCE_VERSION ||
>=20
> Nit (style): Overlong line.

Where is the best place to split this?
EFI_SYSTEM_RESOURCE_TABLE_FIRMWARE_RESOURCE_VERSION is a rather long
identifier.

> > +         !esrt_ptr->FwResourceCount )
> > +        return 0;
> > +    if ( esrt_ptr->FwResourceCount > available_len / sizeof(esrt_ptr->=
Entries[0]) )
> > +        return 0;
> > +    return esrt_ptr->FwResourceCount * sizeof(esrt_ptr->Entries[0]);
> > +}
>=20
> Nit (style again): We generally put a blank line ahead of a function's
> main return statement.

Will fix in v7.

> > @@ -1067,6 +1122,46 @@ static void __init efi_exit_boot(EFI_HANDLE Imag=
eHandle, EFI_SYSTEM_TABLE *Syste
> >      if ( !efi_memmap )
> >          blexit(L"Unable to allocate memory for EFI memory map");
> > =20
> > +    efi_memmap_size =3D info_size;
>=20
> I don't think this global needs setting here, yet? The local will
> do just fine here, likely yielding smaller code. But I realize that's
> connected to how you did your change vs what I was expecting you to
> do (see below).
>=20
> > +    status =3D SystemTable->BootServices->GetMemoryMap(&efi_memmap_siz=
e,
> > +                                                     efi_memmap, &map_=
key,
> > +                                                     &efi_mdesc_size,
> > +                                                     &mdesc_ver);
> > +    if ( EFI_ERROR(status) )
> > +        PrintErrMesg(L"Cannot obtain memory map", status);
> > +
> > +    /* Try to obtain the ESRT.  Errors are not fatal. */
> > +    for ( i =3D 0; i < efi_memmap_size; i +=3D efi_mdesc_size )
> > +    {
> > +        /*
> > +         * ESRT needs to be moved to memory of type EfiRuntimeServices=
Data
> > +         * so that the memory it is in will not be used for other purp=
oses.
> > +         */
> > +        void *new_esrt =3D NULL;
> > +        size_t esrt_size =3D get_esrt_size(efi_memmap + i);
> > +
> > +        if ( !esrt_size )
> > +            continue;
> > +        if ( ((EFI_MEMORY_DESCRIPTOR *)(efi_memmap + i))->Type =3D=3D
> > +             EfiRuntimeServicesData )
> > +            break; /* ESRT already safe from reuse */
> > +        status =3D efi_bs->AllocatePool(EfiRuntimeServicesData, esrt_s=
ize,
> > +                                      &new_esrt);
>=20
> I should have re-raised the earlier voiced concern when reviewing v5 (or
> maybe already v4), and I'm sorry for not having paid close enough
> attention: This may add up to two more entries in the memory map (if an
> entry is split and its middle part is used; of course with an unusual
> implementation there could be even more of a growth). Yet below your
> addition, before obtaining the final memory map, you don't re- obtain
> (and re-increase) the size needed. As to (re-)increase: In fact, prior
> to the allocation you do there shouldn't be a need to bump the space by
> 8 extra entries. That's a safety measure only for possible allocations
> happening across ExitBootServices().
>=20
> And yes, in earlier versions you had
>=20
> -    info_size +=3D 8 * efi_mdesc_size;
> +    info_size +=3D 8 * (efi_mdesc_size + 1);
>=20
> there, but that's not what would be needed anyway (if trying to avoid
> a 2nd pass of establishing the needed size). Instead in such an event
> you need to bump 8 to 10 (or at least 9, when assuming that normally it
> wouldn't be the middle part of a new range which would be used, but
> rather the leading or trailing one).
>=20
> While I'd be okay with addressing the two nits above while committing,
> this allocation size aspect first wants settling on. Personally I'd
> prefer the more involved solution, but I'd be okay with merely
> bumping the 8 (plus the addition of a suitable comment, explaining
> the now multiple [two] constituent parts of a seemingly arbitrary
> number). If you want to go this easier route, I guess I could also
> make that adjustment while committing (and adding my R-b).

I would prefer the more involved solution too, but I am not quite sure
how to implement it.  Should Xen call GetMemoryMap() in a loop, retrying
as long as it returns EFI_BUFFER_TOO_SMALL?  If I do get
EFI_BUFFER_TOO_SMALL, how should I allocate memory for the new buffer?
Should I ask ebmalloc() to provide all remaining memory, and then tell
it how much was actually used?

Once I understand how to allocate the memory for the new memory map, and
where to split the long line mentioned above, I will send a v7.

--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--ys4fH9DfKD++O4Sh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmKGWCQACgkQsoi1X/+c
IsFhfw/9EDQqHs9BDO/twYIZ7YIHjJP6YIHTahbJ02jBQBSgcPDpCO0JJtzncCDr
dKxR2zJUlw6Y5jtBJr6DGWIG1lkb2b9Cc3FlKskoeYDywpjC0OqkR4DiwRh1D+Ix
2vN5/HpJDfdsU76gsa5ixvvV6x/kGOlydzzMlzOfH6ZOxM9TXzMj4Qk92dHN+pSa
qzJNAR98Fij9caStfqyULkG6w5jxQ/wT/Bzir8hkzBsC8AEJDH/s7hcjLcLu9ZZL
fNQ08xduFkLwe94YJmspPNTgWnCxm3YhF0gGcYT/k/NaacQN99iZwMbDz+cKn0gL
sV3xXZoG+WsUHwTeSoVTpdq0XXezP74X2HSmx7h2qWvj0+/9P0hyBsUOSIPgdXDt
mf1fiNWRL6e3RpAzVmg0g6ZkCFL7C9WToHhewoxU+wrZjUYUfsjpxEDYkTtoIVpA
uTEMph+zPN+Q+2nPpC3khqls/GZxIApdKh/y+yoOHJ5Q3qsb9iSEKAGM0I52LpXD
wk5O5bC4pXJpsVMW47cukujlUyyGaDkeSrTIT1qcfcVduvwQNZ9/tYltqoxAx37b
JLWaIKhZZ7H2yFfxB48JIYOKN3EAxpnKdCUggIKnggTtNTepWdLeJFipINR4b1fS
cgmIdQ3uD4KNSayyFcfvRZkfZaVawXDEbM0YjCwOEXKkQMhkL9E=
=ZC0K
-----END PGP SIGNATURE-----

--ys4fH9DfKD++O4Sh--

