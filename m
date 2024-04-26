Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BA68B3B5C
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 17:27:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712933.1113843 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0NTj-00015M-NR; Fri, 26 Apr 2024 15:27:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712933.1113843; Fri, 26 Apr 2024 15:27:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s0NTj-000132-Jn; Fri, 26 Apr 2024 15:27:11 +0000
Received: by outflank-mailman (input) for mailman id 712933;
 Fri, 26 Apr 2024 15:27:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/r3b=L7=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1s0NTh-0000yt-Rs
 for xen-devel@lists.xenproject.org; Fri, 26 Apr 2024 15:27:10 +0000
Received: from wfout1-smtp.messagingengine.com
 (wfout1-smtp.messagingengine.com [64.147.123.144])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 705108b8-03e1-11ef-909a-e314d9c70b13;
 Fri, 26 Apr 2024 17:27:07 +0200 (CEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailfout.west.internal (Postfix) with ESMTP id 5153D1C0015E;
 Fri, 26 Apr 2024 11:27:04 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Fri, 26 Apr 2024 11:27:04 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 26 Apr 2024 11:27:02 -0400 (EDT)
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
X-Inumbo-ID: 705108b8-03e1-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1714145223;
	 x=1714231623; bh=F93DfMBe8i7di6qR58W+TimZ8RaG79w85iZRctNxY0U=; b=
	jz33NJVGR6l8V40unp5l4x4puNDcBtqjs2jWK4bVq6sf+uJUdBkZYeE42HigtqII
	U+LgmYjq8KRE/cE94afWDz80gH9qemELRHFO7HubHjnUo26jQSK+kcJCk7bqSx+x
	yrFywEMPEvy3Npij8y4o01/Un8XreMHnbpZCiAEkEfh+skClCZw3wOy+T7JfeaVv
	XqZ7Coo9kpmCQaXgrxHfF74xlgPWP4r1iIHyGG5bWLgGgfbUfMkqdtzVF/xJLwhE
	H2sUncAxPPM3dHDpGKlOHax74fgopNEKatQM6xg2t1k4wSZ1zYSTnbfZS+2nHc2V
	sXy3/zip2GCf8PBnF727+Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1714145223; x=1714231623; bh=F93DfMBe8i7di6qR58W+TimZ8RaG
	79w85iZRctNxY0U=; b=ARQrxv1wOIyxrHiraz/YL6R8WaxGGpNBBrZcsVdQ7W5H
	pCaCVJA6spNwgC5j+sRy3TTw/D7V7qd8w7CEpR9Q7N59fLvshH0xAYN/OD9ITvzj
	r7kGJs5A5Rcj2YalKGPfmBsMornF3NmDGfi2ERXEQVB0xj+Rx15mUPH9yIEDVJij
	yYMtUKEjCLeegO7gEpNrYFfaUxJ2nhaMdXg1CiOg9VhCOxhxo+xc3wMyOkNnI10K
	JdRhmCl8FpdJPzow/m/G+Bj08WniN3YJUDTV6j4D+U6bZAYhmDxdioqWSCjm4fL1
	4eCFAe8FXyr6EJ9GaTqXo8yX9Y+NwM7b0ioV+XXfWw==
X-ME-Sender: <xms:x8crZkRMyiAt3nx_raIh5PZpVokFZ27Yy5pzQRtK_k5zRjCiyiyksw>
    <xme:x8crZhytTUW_pTIUg5T3ywoNoUchMb7m4jho2LHSFSGbw81UK93vJnanwCvaQWPju
    6Y6BVJyQYP43Q>
X-ME-Received: <xmr:x8crZh01yiCNmDSRYrwjiqBgIqE97UDOmrZI8s8sewlUgvy5-q8x2EiRmD-tgYCl-O0cn4rfluQEUNGrfjj_CJoHom0EgkACnA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudelledgkeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:x8crZoAXcAPYNB_-YZon4HFshqYFtZuA6s3WRK1m8GUCA-XVkHkisg>
    <xmx:x8crZtjFGhKZjjuhabmhcwZ2yqKU55mXhH07T0q8dhbryKlBuJv0Tw>
    <xmx:x8crZkrpLPfwiTVJFzWS6XMtT_fvNcPBJ4N74B9LPfuSqsRXBmBcWw>
    <xmx:x8crZghijUZeZrCuWB687RxTA52h3Z-TGYxjeMAo8F_50PBAucYS4w>
    <xmx:x8crZtcpNmCb0tv970oYEUXno1SewfgYmkH--bQonTKcPJV9Ao97kE4N>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 26 Apr 2024 17:26:49 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v5 3/7] x86/hvm: Allow access to registers on the same
 page as MSI-X table
Message-ID: <ZivHw9RUUN1CV4Hi@mail-itl>
References: <cover.afa2d89161590f5193dd6bfd340c5e9347877aae.1710342968.git-series.marmarek@invisiblethingslab.com>
 <a040f703a884ff4516314f88b22ee0f9f17329a9.1710342968.git-series.marmarek@invisiblethingslab.com>
 <68f99f0a-e27a-449f-8d13-fb5ca9f6069a@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CKYVC/vicUnx3hS2"
Content-Disposition: inline
In-Reply-To: <68f99f0a-e27a-449f-8d13-fb5ca9f6069a@suse.com>


--CKYVC/vicUnx3hS2
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 26 Apr 2024 17:26:49 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
Subject: Re: [PATCH v5 3/7] x86/hvm: Allow access to registers on the same
 page as MSI-X table

On Thu, Apr 25, 2024 at 01:15:34PM +0200, Jan Beulich wrote:
> On 13.03.2024 16:16, Marek Marczykowski-G=C3=B3recki wrote:
> > Some devices (notably Intel Wifi 6 AX210 card) keep auxiliary registers
> > on the same page as MSI-X table. Device model (especially one in
> > stubdomain) cannot really handle those, as direct writes to that page is
> > refused (page is on the mmio_ro_ranges list). Instead, extend
> > msixtbl_mmio_ops to handle such accesses too.
> >=20
> > Doing this, requires correlating read/write location with guest
> > of MSI-X table address. Since QEMU doesn't map MSI-X table to the guest,
> > it requires msixtbl_entry->gtable, which is HVM-only. Similar feature
> > for PV would need to be done separately.
> >=20
> > This will be also used to read Pending Bit Array, if it lives on the sa=
me
> > page, making QEMU not needing /dev/mem access at all (especially helpful
> > with lockdown enabled in dom0). If PBA lives on another page, QEMU will
> > map it to the guest directly.
> > If PBA lives on the same page, discard writes and log a message.
> > Technically, writes outside of PBA could be allowed, but at this moment
> > the precise location of PBA isn't saved, and also no known device abuses
> > the spec in this way (at least yet).
> >=20
> > To access those registers, msixtbl_mmio_ops need the relevant page
> > mapped. MSI handling already has infrastructure for that, using fixmap,
> > so try to map first/last page of the MSI-X table (if necessary) and save
> > their fixmap indexes. Note that msix_get_fixmap() does reference
> > counting and reuses existing mapping, so just call it directly, even if
> > the page was mapped before. Also, it uses a specific range of fixmap
> > indexes which doesn't include 0, so use 0 as default ("not mapped")
> > value - which simplifies code a bit.
> >=20
> > GCC 12.2.1 gets confused about 'desc' variable:
> >=20
> >     arch/x86/hvm/vmsi.c: In function =E2=80=98msixtbl_range=E2=80=99:
> >     arch/x86/hvm/vmsi.c:553:8: error: =E2=80=98desc=E2=80=99 may be use=
d uninitialized [-Werror=3Dmaybe-uninitialized]
> >       553 |     if ( desc )
> >           |        ^
> >     arch/x86/hvm/vmsi.c:537:28: note: =E2=80=98desc=E2=80=99 was declar=
ed here
> >       537 |     const struct msi_desc *desc;
> >           |                            ^~~~
> >=20
> > It's conditional initialization is actually correct (in the case where
> > it isn't initialized, function returns early), but to avoid
> > build failure initialize it explicitly to NULL anyway.
> >=20
> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
>=20
> Sadly there are further more or less cosmetic issues. Plus, as indicated
> before, I'm not really happy for us to gain all of this extra code. In
> the end I may eventually give an R-b not including the usually implied
> A-b, to indicate the code (then) looks okay to me but I still want
> someone else to actually ack it to allow it going in.

I understand. Given similar code is committed for vPCI already, I hope
somebody will be comfortable with acking this one too (yes, I do realize
the vPCI one is much less exposed, but still).

> > +static int adjacent_read(
> > +    unsigned int fixmap_idx,
> > +    paddr_t address, unsigned int len, uint64_t *pval)
> > +{
> > +    const void __iomem *hwaddr;
> > +
> > +    *pval =3D ~0UL;
> > +
> > +    ASSERT(fixmap_idx !=3D ADJACENT_DISCARD_WRITE);
>=20
> Why only one of the special values? And before you add the other here:
> Why not simply ASSERT(fixmap_idx <=3D FIX_MSIX_IO_RESERV_END)? (Could of
> course bound at the other end, too, i.e. against FIX_MSIX_IO_RESERV_BASE.)

That's the most likely bug that could happen, but indeed broader assert
would be better.

> > +    hwaddr =3D fix_to_virt(fixmap_idx) + PAGE_OFFSET(address);
> > +
> > +    switch ( len )
> > +    {
> > +    case 1:
> > +        *pval =3D readb(hwaddr);
> > +        break;
> > +
> > +    case 2:
> > +        *pval =3D readw(hwaddr);
> > +        break;
> > +
> > +    case 4:
> > +        *pval =3D readl(hwaddr);
> > +        break;
> > +
> > +    case 8:
> > +        *pval =3D readq(hwaddr);
> > +        break;
> > +
> > +    default:
> > +        ASSERT_UNREACHABLE();
>=20
> Misra demands "break;" to be here for release builds. In fact I wonder
> why "*pval =3D ~0UL;" isn't put here, too. Question of course is whether
> in such a case a true error indicator wouldn't be yet better.

I don't think it possible for the msixtbl_read() (that calls
adjacent_read()) to be called with other sizes. The default label is
here exactly to make it obvious for the reader.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--CKYVC/vicUnx3hS2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmYrx8MACgkQ24/THMrX
1yzTcwgAjG8h+IjL5Gce745Xo2IASDRNlb7nJ2Wh2N9vEeolQidSAgZOLlUU5MxX
CrL7Ojkpuex+Pkqbi3OJwVWZKlPPRc0+EQhwjGvx/7DgTmTUKUanHMjk5RZt+yzI
ruDvj6FQnXkZVRYTkxEanjKbqCk1b5WDwRliFsQt+H69pPbLHvnjBaz9h6V5gjPZ
Dn87tgi7JR002rcowbtPQPNil8gpwoWlZEltlNDl6aD2KW8oLS3Ev08VHRRfCBCp
znHibNL5EUGk4TU/yeP+M4IEoEb5A2XaShFs4ueXGC6aADCVbm3qH5lj74kijBYf
8HJ2osfLdlatO8JiVZQteJYsCzKWDA==
=5gps
-----END PGP SIGNATURE-----

--CKYVC/vicUnx3hS2--

