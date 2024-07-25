Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B5193C3E6
	for <lists+xen-devel@lfdr.de>; Thu, 25 Jul 2024 16:17:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.765017.1175566 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWzGz-0000zW-F7; Thu, 25 Jul 2024 14:16:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 765017.1175566; Thu, 25 Jul 2024 14:16:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWzGz-0000xU-BJ; Thu, 25 Jul 2024 14:16:49 +0000
Received: by outflank-mailman (input) for mailman id 765017;
 Thu, 25 Jul 2024 14:16:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KREk=OZ=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1sWzGx-0000xO-Su
 for xen-devel@lists.xenproject.org; Thu, 25 Jul 2024 14:16:48 +0000
Received: from fhigh3-smtp.messagingengine.com
 (fhigh3-smtp.messagingengine.com [103.168.172.154])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 857de9b5-4a90-11ef-bbff-fd08da9f4363;
 Thu, 25 Jul 2024 16:16:46 +0200 (CEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailfhigh.nyi.internal (Postfix) with ESMTP id 09C17114013D;
 Thu, 25 Jul 2024 10:16:44 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 25 Jul 2024 10:16:44 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 25 Jul 2024 10:16:42 -0400 (EDT)
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
X-Inumbo-ID: 857de9b5-4a90-11ef-bbff-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1721917004;
	 x=1722003404; bh=P+yMhEs/3exhTu1otUV2BqNOR4YwMMDZGrRzIhCfZdQ=; b=
	tZqObzARqiUdRcvBlXpwoVr9YC3FO2jvNsGKfGFwmIl9dNZurVkOAOTJLK9DLQoU
	KXrrw/V1TaH9LerFmH3Seuf09L0ahniY40SJDnFb0azJ/cfaIJ09wUOOZSjJYEht
	He7kFE2xRQl2rXNe/D+4nsi4xyRXnqr8MgxcJ3w/0llAs4nlIruEHl9LZWEzsFfx
	oSUHOO/O+s9n7Lz+Jz9SSEs+YFx2Rxnud/KDnS9W1R0rXq/B1OWPgGr0nnOAPjWA
	PCl+e0kIAJjInzSZQJMdm9i2hwqrZCWmL4FONFN5+kPMUmHI7Oee41HXmXmkFZ1x
	COOpPApE3rF1WluJEXf2+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1721917004; x=1722003404; bh=P+yMhEs/3exhTu1otUV2BqNOR4Yw
	MMDZGrRzIhCfZdQ=; b=BS5+M0li9kxZaNCkZGStZBc+1yxhwcdQIZGD04rBYSiO
	FYjBdrAeAFWN9+1pSC5DXUFYxcGqYq9svxfaRANIH3lP1M1BRJqz4bbX4uoNfLE7
	rWk8m9IAnGVIAVBp3FioE+Qr4KIuGQgJu0MnfW3xKI6oHSuBs/4GLOjh+vBPqfds
	zVot6+w6LD2p9qENELAI3PYOJ1rKzGIOwB8DYaTzs7+OpK63+/ZjN4ilhaGmzqaW
	u1bzsMocjd7D7j6le7xfgHU8f91BPimfgXaT/+GJYi5m3LYPWriSzPQUc+PV/G/M
	ATEtzatutqQEqV2DHjC1jb+ayeNX7pJR+jqAJ52dGQ==
X-ME-Sender: <xms:S16iZvjJrOyPBQINx7i4ugtV18lcD4NfPTyePlt44ZlFs83aIpcjZA>
    <xme:S16iZsDqnIuVUOlbqYy1Vj4Bx_sh8MILCsUqpEsUylrnEJ3Ktjd-gYmtf--T53TWo
    zAhEcc67Y_Zcg>
X-ME-Received: <xmr:S16iZvHLGE1ePZBrkDvcDodCttumH9NTNLxNTlwWf3c1D9duXMEtueYDwP0aTn5tSjGXtYwwtiykmTtauVoIFNnjcx6YkOX-2Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrieefgdejgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgudel
    teefvefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopedt
X-ME-Proxy: <xmx:S16iZsTH2F80yKUkUHE76S3I0GtaY66RLBdjonxcdpIk79Y7I65zfw>
    <xmx:S16iZszquu9gKjHhED-vSwkymth2-AZJYjWPgms8kubhhR03LPX95Q>
    <xmx:S16iZi7df94atpmg2ykyeI6l0TCRKCU2-YjyGF8221_fYwdhMjVaPg>
    <xmx:S16iZhwSLtrf1xsDMAGoIAavYnfITsvj_RdGuonMBY5tAJYJrMVDxQ>
    <xmx:TF6iZn8FNF9dQI_QgYUWfXjRL1mz7EEWIKzcxEXzKZCc1QOTc9UoTO6P>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 25 Jul 2024 16:16:37 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 07/12] libxl: Allow stubdomain to control interupts of
 PCI device
Message-ID: <ZqJeRpv0leu3vWuf@mail-itl>
References: <cover.f23e316613d8f82981f99b5fb90e36255c4adc63.1715867907.git-series.marmarek@invisiblethingslab.com>
 <aeba05a5ec7a0657217933f165ee0ac7e86e1b1b.1715867907.git-series.marmarek@invisiblethingslab.com>
 <ZqJby/TBLQOmzQPH@l14>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="L8u8qAmv491cOECL"
Content-Disposition: inline
In-Reply-To: <ZqJby/TBLQOmzQPH@l14>


--L8u8qAmv491cOECL
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 25 Jul 2024 16:16:37 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Anthony PERARD <anthony.perard@vates.tech>
Cc: xen-devel@lists.xenproject.org, Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 07/12] libxl: Allow stubdomain to control interupts of
 PCI device

On Thu, Jul 25, 2024 at 02:06:04PM +0000, Anthony PERARD wrote:
> On Thu, May 16, 2024 at 03:58:28PM +0200, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > Especially allow it to control MSI/MSI-X enabling bits. This part only
> > writes a flag to a sysfs, the actual implementation is on the kernel
> > side.
> >
> > This requires Linux >=3D 5.10 in dom0 (or relevant patch backported).
>=20
> Does it not work before 5.10? Because the
> Documentation/ABI/testing/sysfs-driver-pciback in linux tree say that
> allow_interrupt_control is in 5.6.

For MSI-X to work at least with Linux it needs a fixup
2c269f42d0f382743ab230308b836ffe5ae9b2ae, which was backported to
5.10.201, but not further.=20

> > diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
> > index 96cb4da0794e..6f357b70b815 100644
> > --- a/tools/libs/light/libxl_pci.c
> > +++ b/tools/libs/light/libxl_pci.c
> > @@ -1513,6 +1513,14 @@ static void pci_add_dm_done(libxl__egc *egc,
> >              rc =3D ERROR_FAIL;
> >              goto out;
> >          }
> > +    } else if (libxl_is_stubdom(ctx, domid, NULL)) {
> > +        /* Allow acces to MSI enable flag in PCI config space for the =
stubdom */
>=20
> s/acces/access/
>=20
> > +        if ( sysfs_write_bdf(gc, SYSFS_PCIBACK_DRIVER"/allow_interrupt=
_control",
> > +                             pci) < 0 ) {
> > +            LOGD(ERROR, domainid, "Setting allow_interrupt_control for=
 device");
> > +            rc =3D ERROR_FAIL;
> > +            goto out;
>=20
> Is it possible to make this non-fatal for cases where the kernel is
> older than the introduction of the new setting? Or does pci passthrough
> doesn't work at all with a stubdom before the change in the kernel?

MSI/MSI-X will not work. And if QEMU wouldn't hide MSI/MSI-X (upstream
one doesn't), Linux won't fallback to INTx, so the device won't work at
all.

> If making this new setting conditional is an option, you could
> potentially improve the error code returned by sysfs_write_bdf() to
> distinguish between an open() failure and write() failure, to avoid
> checking the existance of the path ahead of the call. But maybe that
> pointless because it doesn't appear possible to distinguish between
> permission denied and not found.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--L8u8qAmv491cOECL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmaiXkYACgkQ24/THMrX
1yyC0wf/Us3IBId7hFMmgTOWzWQBPTBFkJ2aWsFbtjRGsMF6kum1OQQ3QvUEzKJT
0Qox5NzOBG1o/qVjy/2oUzMDvO1F41iDEXwsFb/lqLlRg7TKuqDOpMN/85VPxWpE
h8UUnctl0Mwy1gd1bC6vG78L0QcCCS2GdaNuSUNWn4ZDvjtLoImYZaglDfZK2OFI
TQ5BqhxJny44/WBoQegtmuL4L8FSwwzScGtI3vSlXVuB1Co1ZdebMa7yHF+kDP/3
xY0K95l+UHOmsciSx2svR6uDultse9k6v5bSAocVM034cRG+r2pGTfexQ0kOtaUv
iJCRzyNdOh/SbApZXTXAr6ucgnOo7w==
=q68+
-----END PGP SIGNATURE-----

--L8u8qAmv491cOECL--

