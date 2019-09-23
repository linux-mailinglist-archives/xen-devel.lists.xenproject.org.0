Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E8257BB270
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2019 12:50:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCLsq-0002tv-Ug; Mon, 23 Sep 2019 10:47:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dYCr=XS=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1iCLsp-0002tm-KU
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2019 10:47:55 +0000
X-Inumbo-ID: 98ce1228-ddef-11e9-95fc-12813bfff9fa
Received: from new4-smtp.messagingengine.com (unknown [66.111.4.230])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 98ce1228-ddef-11e9-95fc-12813bfff9fa;
 Mon, 23 Sep 2019 10:47:54 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id 001682AFF;
 Mon, 23 Sep 2019 06:47:53 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Mon, 23 Sep 2019 06:47:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=VBUeuH
 d2pA+FFx7kjnLIIxMTbsnAHyBwlK/qW0AeInk=; b=iC82eSS02Zh4UQqnaAkqk9
 5/7D9OJi6Gl9oxhmnzOrgmJYmKy6MtdVZ35G3MxCPk2tao2D+tif+6dtRSUINpD8
 V26DmwXHBNa2wi613BpzIwB0b9/42ea3G/21MZ6gvgaY5/k0K8vQWzKFRJ7o0iQJ
 EQoGxuoM5WkLn7aUl8/4GYFzNA40uezl+QJExMw/wESReirchXcTqb3hRBuqEv5+
 1gwZeL7ZnmJwBu88+MaQgvfaZ31+vA/9wwkXXuqXa74sY2f3ktI0U8g5yV+f40Bk
 c9rRGpfnHbBYivXBbgpb+PV4IUrhyEHMXtdhPAblMyd7+5lwefntCybT2aT+ayhw
 ==
X-ME-Sender: <xms:2aKIXfVY-6gQO5YmXpVl6XLWU5yK5ypJuCQjMLMNRF20vpxnNX_HXg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdekgdefvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
 ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
 hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecukfhppeekfedrleejrddvfedrvdel
 necurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvg
 hthhhinhhgshhlrggsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:2aKIXVTl4EVhx1_lmb_zWtnpN6gtA0a0UTVVlYkPCwKVLWxGGDcr3w>
 <xmx:2aKIXdIGrmNn-7QRlos-PsyG07FxnQKHLgVYcVBDxrk4Nb8Dy8i6yg>
 <xmx:2aKIXW1MPazChd89UTqSxafTQf6EuDZdbw000Nax3oXkUVIXqWLs0A>
 <xmx:2aKIXdrPkJhrBWewtvKRg9rG41ehaSTN9Ig9SbvTG-ol_rxetmdjSQ>
Received: from mail-itl (unknown [83.97.23.29])
 by mail.messagingengine.com (Postfix) with ESMTPA id 121EFD6005D;
 Mon, 23 Sep 2019 06:47:50 -0400 (EDT)
Date: Mon, 23 Sep 2019 12:47:46 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20190923104746.GD8065@mail-itl>
References: <cover.4c97023e719e059ea99137f2cadea319eb87495d.1568475323.git-series.marmarek@invisiblethingslab.com>
 <819398f808613a1109bc06440268b8746e7540d4.1568475323.git-series.marmarek@invisiblethingslab.com>
 <fc4dcc0e-fd7a-a25d-0f6f-b722f6ba8122@suse.com>
 <20190920160250.GA8065@mail-itl>
 <7a954000-904d-57aa-2524-5d0c51a8d422@suse.com>
MIME-Version: 1.0
In-Reply-To: <7a954000-904d-57aa-2524-5d0c51a8d422@suse.com>
Subject: Re: [Xen-devel] [PATCH v6 5/6] xen/x86: add
 PHYSDEVOP_interrupt_control
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============5010017486913821505=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============5010017486913821505==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="a7qI9m+4lZX6A7IJ"
Content-Disposition: inline


--a7qI9m+4lZX6A7IJ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Xen-devel] [PATCH v6 5/6] xen/x86: add
 PHYSDEVOP_interrupt_control

On Mon, Sep 23, 2019 at 09:58:27AM +0200, Jan Beulich wrote:
> On 20.09.2019 18:02, Marek Marczykowski-G=C3=B3recki  wrote:
> > On Fri, Sep 20, 2019 at 12:10:09PM +0200, Jan Beulich wrote:
> >> On 14.09.2019 17:37, Marek Marczykowski-G=C3=B3recki  wrote:
> >>> Allow device model running in stubdomain to enable/disable INTx/MSI(-=
X),
> >>> bypassing pciback. While pciback is still used to access config space
> >>> from within stubdomain, it refuse to write to
> >>> PCI_MSI_FLAGS_ENABLE/PCI_MSIX_FLAGS_ENABLE/PCI_COMMAND_INTX_DISABLE
> >>> in non-permissive mode. Which is the right thing to do for PV domain
> >>> (the main use case for pciback), as PV domain should use XEN_PCI_OP_*
> >>> commands for that. Unfortunately those commands are not good for
> >>> stubdomain use, as they configure MSI in dom0's kernel too, which sho=
uld
> >>> not happen for HVM domain.
> >>
> >> Why the "for HVM domain" here? I.e. why would this be correct for
> >> a PV domain? Besides my dislike for such a bypass (imo all of the
> >> handling should go through pciback, or none of it) I continue to
> >> wonder whether the problem can't be addressed by a pciback change.
> >> And even if not, I'd still wonder whether the request shouldn't go
> >> through pciback, to retain proper layering. Ultimately it may be
> >> better to have even the map/unmap go through pciback (it's at
> >> least an apparent violation of the original physdev-op model that
> >> these two are XSM_DM_PRIV).
> >=20
> > Technically it should be possible to move this part to pciback, and in
> > fact this is what I've considered in the first version of this series.
> > But Roger points out on each version[1] of this series that pciback is
> > meant to serve *PV* domains, where a PCI passthrough is a completely
> > different different beast. In fact, I even consider that using pcifront
> > in a Linux stubdomain as a proxy for qemu there may be a bad idea (one
> > needs to be careful to avoid stubdomain kernel fighting with qemu about
> > device state).
>=20
> Well, not using pciback _at all_ in this case would be another option.
> What I dislike is the furthering of hybrid-ness.

Ah, I see. This may be a good idea, if this type of PCI passthrough is
going to stay. If we're going away from qemu towards other options
mentioned in previous email, I'd say such a rework is too much work for a
time limited usefulness.
>=20
> > Anyway, if you all agree that pciback should be the way to go, I can go
> > that route too. In practice, it would be a flag (set by the toolstack?)
> > allowing writes to appropriate config space registers directly (with
> > appropriate checks, as in this patch).
>=20
> I'm afraid I don't agree: How would allowing writes to more config space
> registers by a stubdom be safe?

Exactly the same as in this patch: pciback would perform the same
validation (prohibit enabling MSI together with INTx etc).

BTW what are the risks (besides DoS) of allowing full config space
access, assuming VT-d with interrupt remapping present? This sounds
similar to risks of malicious device connected to some domU, right? Can
such device (or a domain controlling such device) break out to Xen or
dom0? Can it steal data from other domains?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--a7qI9m+4lZX6A7IJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl2IotIACgkQ24/THMrX
1yxwZwf+MTwVKCWtNEkvdO+YNNmsgVH7lJ2qInlYpxhmfVS1D09l4518FPbHtJAR
hJQrvoWXfiHiz8zhaijCoGDGA/I6AZA79qOPXSZEzDrRxzl/s/5HFhOVUAlsOUKZ
0eHMCvDJF2cXzSHi984qypAyTEfCzbDXwFfdhivShhbIte+8W7S+ecHEnPEZJ8AI
5ZQshsl1Jy+qWNnj6uMwJzms9vm8bzsnXNF2XMhsu5HSCAr0oGVuMrvgSzaNMBtI
CXAshdPuF+vdv+kxdQ7mAfVquO6QI5THR+WWmIkDCH4JsZTBjEJDbKGmrRC+MkyT
ioAbaSrnr5vvaurbSzj4t22byBJZdg==
=MLT2
-----END PGP SIGNATURE-----

--a7qI9m+4lZX6A7IJ--


--===============5010017486913821505==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5010017486913821505==--

