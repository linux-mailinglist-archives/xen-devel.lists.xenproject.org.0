Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 772FB801A31
	for <lists+xen-devel@lfdr.de>; Sat,  2 Dec 2023 04:08:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.645923.1008495 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9GMP-0003rV-AE; Sat, 02 Dec 2023 03:08:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 645923.1008495; Sat, 02 Dec 2023 03:08:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r9GMP-0003pC-6w; Sat, 02 Dec 2023 03:08:05 +0000
Received: by outflank-mailman (input) for mailman id 645923;
 Sat, 02 Dec 2023 03:08:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pE22=HN=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1r9GMM-0003p6-Uh
 for xen-devel@lists.xenproject.org; Sat, 02 Dec 2023 03:08:03 +0000
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fe938d5b-90bf-11ee-98e5-6d05b1d4d9a1;
 Sat, 02 Dec 2023 04:08:00 +0100 (CET)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 38CD53200BAA;
 Fri,  1 Dec 2023 22:07:56 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Fri, 01 Dec 2023 22:07:56 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 1 Dec 2023 22:07:54 -0500 (EST)
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
X-Inumbo-ID: fe938d5b-90bf-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1701486475; x=1701572875; bh=kES0Bd33S/OE0IMR0t1k/qrCTXa/bJ8w5LP
	RDFw4ydM=; b=gRJyiFlHoLU4LhmBgvh06fcDSau9gDAB597FYd7O7sUsqr1yH/N
	oHeQipBQN6siUOm1XZRAbzh2hzMmqkAp95BjqD6M9Zaj385Suk+WBhAAh/Ee6hus
	6AggNSaIiszjZQDFxAQ4QQwxJJ3UgXS2rpOR35suW4hdLAI0O2zp0iKN64XJaXH6
	qm7QTJ1KjfmexZLy/pXYq5IggAiPU9WqkRz2aDXggO+pDaVU73g9U1We7yBqgO+p
	q6zwYJChMZdIyj0yrCYRZglRI9PR7d5Tc+PNYJH+UV8Xk4a1bhfX4nX3nRSEXJZ0
	XBD85+zclUigLl9Uvgo9V5Mu8tcAal9qH4g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1701486475; x=1701572875; bh=kES0Bd33S/OE0
	IMR0t1k/qrCTXa/bJ8w5LPRDFw4ydM=; b=DWO8NIrp1+zhQPPixZdhTRUydnEVP
	cAd8HlDAxVTGShhUL/jBjX/4C2A5yDoCpbYtKEkUPwuhcN+8RKWGSZKiHlyN+jsE
	486YPKqFWmWwoyLCi/xkFpXHhDtQMHf50JyVd5QJr/3A+R1RtsALNEcjWPaG/Atp
	31Isv3QSqSSrfzxtVi6qVgEdNrwl6c0wbgFM6TlgaM3u+vGb19RbbmMJUMpZesQE
	gEjFNuXBOxTnRViLgCtFkwo2l6XGLklMjNIMVP4jJkn8OIy4bWtaDJ4UhCz1zWEx
	y30gRc4spxid7SExD9HZGMwxYUnNbPnOWsN5jFBE6c+LJZDd0v48nbywg==
X-ME-Sender: <xms:i59qZb4juPCNqqMaGDSOc35twCBZVURXcXLs0cXCfE5SmvuJPh-Lvg>
    <xme:i59qZQ4Iou0WHox0w2HQ89bXb2k3klLdZt68ZaVEq5USA1r3upCM1eJxYma2xcMoS
    kF0OT0VM-mp5g>
X-ME-Received: <xmr:i59qZSdagkk6cbOdSDRhEdUFkfSj7uGq6ZRP650YCbrPBjCv904EKUDrhX5WXAW-kx9NC8G6YxXmm5SuJCJAwjEahp7hHkte7u0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudejtddgheehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:i59qZcLYVpypPhO18a062L_JJG_wQtWYVe_VzSxiGP_l-haneBDYZg>
    <xmx:i59qZfJa1OIMFJufXao6ICHJnsbPqfWBvuHRU1OwE6PZYvuZT7F6Bg>
    <xmx:i59qZVzBHpK2Z4cf3TEzARcM52rt0KF2eTDOiVxo5iaKEH1nxNMAKQ>
    <xmx:i59qZWUUoVEjrZ5EED5eAt4lMU342kzY7__wCafVY6KlPC1rjjr7fg>
Feedback-ID: i1568416f:Fastmail
Date: Sat, 2 Dec 2023 04:07:52 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH v4 2/6] x86/hvm: Allow access to registers on the same
 page as MSI-X table
Message-ID: <ZWqfiN+sIOMHoB9m@mail-itl>
References: <cover.e8ee4f1e4458c19070007220034a9bfdc34190d5.1700790421.git-series.marmarek@invisiblethingslab.com>
 <de5e66c790c9fc5e7f668f06826c7ee781b6d6e1.1700790421.git-series.marmarek@invisiblethingslab.com>
 <277f832d-20ce-437d-a7a3-7935aa6cf34e@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="PmoxiU9FQRt6LvJw"
Content-Disposition: inline
In-Reply-To: <277f832d-20ce-437d-a7a3-7935aa6cf34e@suse.com>


--PmoxiU9FQRt6LvJw
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sat, 2 Dec 2023 04:07:52 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH v4 2/6] x86/hvm: Allow access to registers on the same
 page as MSI-X table

On Mon, Nov 27, 2023 at 06:00:57PM +0100, Jan Beulich wrote:
> On 24.11.2023 02:47, Marek Marczykowski-G=C3=B3recki wrote:
> > GCC gets confused about 'desc' variable:
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
>=20
> This could do with also indicating the gcc version. Issues like this
> tend to get fixed over time.

Sure, I'll add it's GCC 12.2.1.
And indeed, GCC 13.2.1 does not complain anymore.

> > +
> > +    if ( !msix->adj_access_idx[adj_type] )
> > +    {
> > +        gprintk(XENLOG_WARNING,
> > +                "Page for adjacent(%d) MSI-X table access not initiali=
zed for %pp (addr %#lx, gtable %#lx\n",
> > +                adj_type, &entry->pdev->sbdf, addr, entry->gtable);
> > +
> > +        return ADJACENT_DONT_HANDLE;
> > +    }
> > +
> > +    /* If PBA lives on the same page too, discard writes. */
> > +    if ( write &&
> > +         ((adj_type =3D=3D ADJ_IDX_LAST &&
> > +           msix->table.last =3D=3D msix->pba.first) ||
> > +          (adj_type =3D=3D ADJ_IDX_FIRST &&
> > +           msix->table.first =3D=3D msix->pba.last)) )
> > +    {
> > +        gprintk(XENLOG_WARNING,
> > +                "MSI-X table and PBA of %pp live on the same page, "
> > +                "writing to other registers there is not implemented\n=
",
> > +                &entry->pdev->sbdf);
>=20
> Here and above I think verbosity needs limiting to the first instance per
> device per domain.

Is there some clever API for that already, or do I need to introduce
extra variable in some of those structures (msixtbl_entry? pci_dev?) ?

(other requested changes ok)

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--PmoxiU9FQRt6LvJw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmVqn4gACgkQ24/THMrX
1yxoUQf/VBJvvrA2qQ+libZtyefew7N2vCA+yWJRsqiEuvjb+I1P3URAEYWG1phD
v6UcqThacj5KRva5tAgqdSxrcZsLqx1t/2mAiQdSj2Jat7vHCUaHZdvicJG/jL/4
wCXU4UEbywvTe7JiuaCYe6Nfcxsdoisdmd5WQpcuREZTE+SyBo5/nyv3hjqDKa8o
F+mD56xkClFTKCoYdC7/3NKysdC+YHy4w6d1IofjcQKa6foEJg+d31K00IW4NRR8
oU6JGOkhCtUbTJ8Ghr9nJdMPeh+2+iNl3YWkTQ2ji+3v8AQW1S0/F5M5yw6txw8B
Zb4vbz9SGbUqCMcsKnL/Cv1tB8ok5Q==
=pG7y
-----END PGP SIGNATURE-----

--PmoxiU9FQRt6LvJw--

