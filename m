Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 502C352D70B
	for <lists+xen-devel@lfdr.de>; Thu, 19 May 2022 17:09:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.333110.556899 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrhmO-0004GF-Hi; Thu, 19 May 2022 15:09:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 333110.556899; Thu, 19 May 2022 15:09:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrhmO-0004Dj-E2; Thu, 19 May 2022 15:09:32 +0000
Received: by outflank-mailman (input) for mailman id 333110;
 Thu, 19 May 2022 15:09:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Krf0=V3=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1nrhmM-0004Db-Id
 for xen-devel@lists.xenproject.org; Thu, 19 May 2022 15:09:30 +0000
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aca95c00-d785-11ec-837e-e5687231ffcc;
 Thu, 19 May 2022 17:09:28 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id ACBAB3200956;
 Thu, 19 May 2022 11:09:25 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 19 May 2022 11:09:25 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 May 2022 11:09:24 -0400 (EDT)
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
X-Inumbo-ID: aca95c00-d785-11ec-837e-e5687231ffcc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1652972965; x=
	1653059365; bh=8OcZJCdW56cWb9j78h7kTBMhLSl25Igl3mKMZFBwYp0=; b=Y
	Thvar2qo+vuHydAWOra6T4whdZXbjH2KCYYGeFgJzdRTi375EGIoyP9iYH+y+GAD
	1cHGsTYqOIL3IT7aiDx46UkZGkj5EGBUax3YtIh9DaVyBGKdIQgT482GJEbYTbsr
	NpS4nXshFzpWSLGFVOf0DNZcUd1hUcXmlJbD0v2DbPJGv0gWhWwGo2DMfQq1epYj
	cm2YRS3A8Y7vTatU59aIZIayRHCsSnJjFsDle9f/V3AqTC9aeQYhHo9waJI4Re0f
	p2gS/0v6vLT3BNeCQpcv2yN9l6xnk4oLjNHvcXMiIf5iOWviJLDOCUpmFYmrX5In
	SKVm1j+at5ysE1CjwhqdA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1652972965; x=1653059365; bh=8OcZJCdW56cWb9j78h7kTBMhLSl2
	5Igl3mKMZFBwYp0=; b=xkuCzmMFFKI0JQnfCR6eO/hs9NH4d4mm/EQQmlohnOf7
	mUrJ09prCNi6D0e/7/qmLYwvQpd7KxXW6aonMT/3X3VBcfDZ/tXjsYEjpOUTcZVE
	WFyrJdwvvWyOVvLAFNrmXr+QFHO+7eIIN6WaGcJNfMKXyI8B0xjmB/ndik8YVvWK
	JhE+XqhQkn0WjarQlYEmbIzy4kK7xh6wkmKsrpuzMSJANweiQ0Dyr8cUMwjtyOMD
	e1dWWzH7buCHRishYLlsK5xVZAsEtV24qYusv/EvO1bGpRrNokCpvAqL2ZACTye+
	pEg0DJg1slBlIi3K0u1ge8lGyXPcM4GJrZGeoeZ5hg==
X-ME-Sender: <xms:pF2GYlX6TKbgWt3Yy5tDixxPj5M9x4pBuZRYb4FtnnQDQRTinOfMfQ>
    <xme:pF2GYlkQAbyPknIESt56hjjlJ68JJL7ZvIA6NGHVU3o7PAwe96H43d_lr_1hZeQq1
    4FJO2zia39Z38Q>
X-ME-Received: <xmr:pF2GYhZEkDgRHQubdB6kzi8GnA1_NJMPJJyG4Ctbs9kDDgRMxF3rB0ZLqdsO>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedriedugdekfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpedvjeetgeekhfetudfhgfetffegfffg
    uddvgffhffeifeeikeektdehgeetheffleenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
    rggsrdgtohhm
X-ME-Proxy: <xmx:pF2GYoUtxM-AnD9koCteeiO3HWSwJNSJh0ChaiYPQhEUL6a5Rvg9zw>
    <xmx:pF2GYvmjTED-7F-AYGx7tHvcvCY1cUKKzXRDphS-9yU2squB3tkgIw>
    <xmx:pF2GYlcjZtQBSYwyG_W5mrbrVZ4MMLeOubUNaxx41BZh-7eJld3M-Q>
    <xmx:pV2GYlSV6_gcLBTQbm2kyDXl7cHyWg1QyVv9OvvVwVu6lhwLfVuSbQ>
Feedback-ID: iac594737:Fastmail
Date: Thu, 19 May 2022 11:09:20 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v6] Preserve the EFI System Resource Table for dom0
Message-ID: <YoZdogi8RZHV2GML@itl-email>
References: <YoUtuDhVimlP7r8F@itl-email>
 <2add184c-04a5-3ca0-876d-e354f35df62a@suse.com>
 <YoZYI9ZJzkd4WqFf@itl-email>
 <05d4fa5b-78d6-96e6-b643-a98d26ec954f@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Nj+Vcc5uU4o32Esz"
Content-Disposition: inline
In-Reply-To: <05d4fa5b-78d6-96e6-b643-a98d26ec954f@suse.com>


--Nj+Vcc5uU4o32Esz
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 May 2022 11:09:20 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH v6] Preserve the EFI System Resource Table for dom0

On Thu, May 19, 2022 at 04:55:10PM +0200, Jan Beulich wrote:
> On 19.05.2022 16:45, Demi Marie Obenour wrote:
> > On Thu, May 19, 2022 at 12:32:33PM +0200, Jan Beulich wrote:
> >> On 18.05.2022 19:32, Demi Marie Obenour wrote:
> >>> +    /*
> >>> +     * The specification requires EfiBootServicesData, but accept
> >>> +     * EfiRuntimeServicesData, which is a more logical choice.
> >>> +     */
> >>> +    if ( (desc->Type !=3D EfiRuntimeServicesData) &&
> >>> +         (desc->Type !=3D EfiBootServicesData) )
> >>> +        return 0;
> >>> +    available_len =3D len - (esrt - physical_start);
> >>> +    if ( available_len <=3D offsetof(EFI_SYSTEM_RESOURCE_TABLE, Entr=
ies) )
> >>> +        return 0;
> >>> +    available_len -=3D offsetof(EFI_SYSTEM_RESOURCE_TABLE, Entries);
> >>> +    esrt_ptr =3D (const EFI_SYSTEM_RESOURCE_TABLE *)esrt;
> >>> +    if ( esrt_ptr->FwResourceVersion !=3D EFI_SYSTEM_RESOURCE_TABLE_=
FIRMWARE_RESOURCE_VERSION ||
> >>
> >> Nit (style): Overlong line.
> >=20
> > Where is the best place to split this?
> > EFI_SYSTEM_RESOURCE_TABLE_FIRMWARE_RESOURCE_VERSION is a rather long
> > identifier.
>=20
> There's no good place to split; the only possible (imo) place is after
> the !=3D .

Will do in v7, along with parentheses to avoid any visual confusion.

> >>> @@ -1067,6 +1122,46 @@ static void __init efi_exit_boot(EFI_HANDLE Im=
ageHandle, EFI_SYSTEM_TABLE *Syste
> >>>      if ( !efi_memmap )
> >>>          blexit(L"Unable to allocate memory for EFI memory map");
> >>> =20
> >>> +    efi_memmap_size =3D info_size;
> >>
> >> I don't think this global needs setting here, yet? The local will
> >> do just fine here, likely yielding smaller code. But I realize that's
> >> connected to how you did your change vs what I was expecting you to
> >> do (see below).
> >>
> >>> +    status =3D SystemTable->BootServices->GetMemoryMap(&efi_memmap_s=
ize,
> >>> +                                                     efi_memmap, &ma=
p_key,
> >>> +                                                     &efi_mdesc_size,
> >>> +                                                     &mdesc_ver);
> >>> +    if ( EFI_ERROR(status) )
> >>> +        PrintErrMesg(L"Cannot obtain memory map", status);
> >>> +
> >>> +    /* Try to obtain the ESRT.  Errors are not fatal. */
> >>> +    for ( i =3D 0; i < efi_memmap_size; i +=3D efi_mdesc_size )
> >>> +    {
> >>> +        /*
> >>> +         * ESRT needs to be moved to memory of type EfiRuntimeServic=
esData
> >>> +         * so that the memory it is in will not be used for other pu=
rposes.
> >>> +         */
> >>> +        void *new_esrt =3D NULL;
> >>> +        size_t esrt_size =3D get_esrt_size(efi_memmap + i);
> >>> +
> >>> +        if ( !esrt_size )
> >>> +            continue;
> >>> +        if ( ((EFI_MEMORY_DESCRIPTOR *)(efi_memmap + i))->Type =3D=3D
> >>> +             EfiRuntimeServicesData )
> >>> +            break; /* ESRT already safe from reuse */
> >>> +        status =3D efi_bs->AllocatePool(EfiRuntimeServicesData, esrt=
_size,
> >>> +                                      &new_esrt);
> >>
> >> I should have re-raised the earlier voiced concern when reviewing v5 (=
or
> >> maybe already v4), and I'm sorry for not having paid close enough
> >> attention: This may add up to two more entries in the memory map (if an
> >> entry is split and its middle part is used; of course with an unusual
> >> implementation there could be even more of a growth). Yet below your
> >> addition, before obtaining the final memory map, you don't re- obtain
> >> (and re-increase) the size needed. As to (re-)increase: In fact, prior
> >> to the allocation you do there shouldn't be a need to bump the space by
> >> 8 extra entries. That's a safety measure only for possible allocations
> >> happening across ExitBootServices().
> >>
> >> And yes, in earlier versions you had
> >>
> >> -    info_size +=3D 8 * efi_mdesc_size;
> >> +    info_size +=3D 8 * (efi_mdesc_size + 1);
> >>
> >> there, but that's not what would be needed anyway (if trying to avoid
> >> a 2nd pass of establishing the needed size). Instead in such an event
> >> you need to bump 8 to 10 (or at least 9, when assuming that normally it
> >> wouldn't be the middle part of a new range which would be used, but
> >> rather the leading or trailing one).
> >>
> >> While I'd be okay with addressing the two nits above while committing,
> >> this allocation size aspect first wants settling on. Personally I'd
> >> prefer the more involved solution, but I'd be okay with merely
> >> bumping the 8 (plus the addition of a suitable comment, explaining
> >> the now multiple [two] constituent parts of a seemingly arbitrary
> >> number). If you want to go this easier route, I guess I could also
> >> make that adjustment while committing (and adding my R-b).
> >=20
> > I would prefer the more involved solution too, but I am not quite sure
> > how to implement it.  Should Xen call GetMemoryMap() in a loop, retrying
> > as long as it returns EFI_BUFFER_TOO_SMALL?  If I do get
> > EFI_BUFFER_TOO_SMALL, how should I allocate memory for the new buffer?
> > Should I ask ebmalloc() to provide all remaining memory, and then tell
> > it how much was actually used?
>=20
> Well, there are certainly multiple options. I was thinking that you'd
> add a new call to size the memory map, add a few (again 8?) extra
> entries there as well for the allocation, and leave the present sizing
> call effectively alone (and sitting after all of your additions).

How should I allocate memory for the new memory map?  Getting the size
is easy; allocating the memory is the tricky part.  That=E2=80=99s where the
idea of calling AllocatePool() and GetMemoryMap() in a loop came from.

--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--Nj+Vcc5uU4o32Esz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmKGXaMACgkQsoi1X/+c
IsFzrg/9HokvWhpxi+ZEC4W6ublKkDi7fU0cPgUA4BUfqy/q8uVrYn2yHRZmsjKP
txysmNDcvQIMGRLm45DA2TvKr05Kwq19K2ZsMEUe/DcxLUubM8wO8hI02j/VMf1t
/aO6CesvyyV+91re8qJXp5M5QhZrf/OPGL2G0gVYE7nLLXp03vqTvhJcx8R/XLaP
LT7XElGBt7gFCOT41iAbUomiAvh8Qw9jjb1eZBylGNNcAV1FqLcda50GSS2pSY4A
1W2l7SU06NWAuCUmrnmEN/jdlikIxk7mS4Ydk/l9bpNx6XavTkOMLuASVlf9vJx6
AZrFjYwklv5q1aGVOat8sii14/YHTIe0YnCYbw71+OaSFjeRvdnyNBl9LwPHnHHG
KJOBeZ3+e/A9mIWF7moh5LpobVITecY0kEH5WJhe4+jtx3UKfNLypinWnUejLR3o
7Y58ypiA3GMuw4sbmMzcZ8hXTQEm3AkOq4ZGtm7MMkUh1x+iWmmGELdTmnRRiJ0U
OAufk07/VCZhv/ubCu304h318oVAQa1Cg43rOJYNCScstMiFBlR0FJWPs3J6sT4A
373dbcK89WlF79WMNw89yX0jC5PTjXi9wJPKJTPx9h5p8LSBglLy1EzMKAQD65OD
mgvajRVzrDDhseNVHG/HVkOpfHu926Ka0zD1wdFBe7wIggJYKBw=
=ZXkn
-----END PGP SIGNATURE-----

--Nj+Vcc5uU4o32Esz--

