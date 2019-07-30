Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8717A824
	for <lists+xen-devel@lfdr.de>; Tue, 30 Jul 2019 14:23:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hsR7z-0005YK-Dr; Tue, 30 Jul 2019 12:21:15 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hz7M=V3=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1hsR7x-0005YD-GD
 for xen-devel@lists.xenproject.org; Tue, 30 Jul 2019 12:21:13 +0000
X-Inumbo-ID: 84a42c7d-b2c4-11e9-8980-bc764e045a96
Received: from out2-smtp.messagingengine.com (unknown [66.111.4.26])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 84a42c7d-b2c4-11e9-8980-bc764e045a96;
 Tue, 30 Jul 2019 12:21:12 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id C422D21C39;
 Tue, 30 Jul 2019 08:21:11 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Tue, 30 Jul 2019 08:21:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=fVlkDk
 7quNjEJT7l8+PjdjcgLIn1XuBp8NxUIJ5S9Kg=; b=xqNhwgMDRJ16RGH875TaDN
 iLWcZDZKLitqiDRgv/gFCY7WdLASYe6Xa45mUPVlcTiZitHKUyMTIkojRC9rDIr8
 Xr+dtGip0Khh9KSuhXGe8vd0kYUvBSZULWSz56APEX3B6f2Ll+RRvAOriaGaQ8ad
 SCSzxqFVA0PhNE99+Mm242zUhqyMWPd9RXom6fCb5CcCCxUFnOS+m6gmhpsKrvY1
 xhRDcs1oGRQlL1qP9lsoEsnmoGX+X5UcNOpDFwQMTuK7F7iQ8DhsDfN90sHNrJtI
 HqleNwR2SydwwzGFO6R6Z3ImiDBgo4TAFbTYfx7I4J8Hs2SCm6QEmAbY8hpjo+Rw
 ==
X-ME-Sender: <xms:NjZAXbibE4qv3CszSO7qKH6dA2V15l57zkv6LWrlZ9HP2FFO6Spk9A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrleefgdeglecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujggfsehgtderredtreejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucfkphepledurdeihedrfeegrdef
 feenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslh
 gvthhhihhnghhslhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:NjZAXSC7yfoPaCr3s4g4OhddYNGF-jQSSg5P0NsdN_WyXwr042Xgcw>
 <xmx:NjZAXRv7wW8p0fZwTAHaBclY1svsyR-5RmdDtdML3RCDleBqhnAuYg>
 <xmx:NjZAXWcqzqR1h8LT3AGvN6kfFZncn4lRcJNxLNs9NZMnXmFuZlJNNg>
 <xmx:NzZAXdsIVUEElf0PccG_A1yWudKkdE4pUkljDTdnjnibWqmtHAlt4A>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8EE6A380086;
 Tue, 30 Jul 2019 08:21:09 -0400 (EDT)
Date: Tue, 30 Jul 2019 14:21:06 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190730122106.GB20589@mail-itl>
References: <20190729154112.7644-1-ross.lagerwall@citrix.com>
 <d9cb90b9-1d58-9514-0f35-0c1dbb1476be@suse.com>
 <7dc7166d-dae2-45b2-4119-eda08f63cd83@citrix.com>
 <0fcde4fe-fc59-316e-b53b-619bd18a27a3@suse.com>
MIME-Version: 1.0
In-Reply-To: <0fcde4fe-fc59-316e-b53b-619bd18a27a3@suse.com>
User-Agent: Mutt/1.12+29 (a621eaed) (2019-06-14)
Subject: Re: [Xen-devel] [PATCH] xen: Avoid calling device suspend/resume
 callbacks
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
Cc: Juergen Gross <JGross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ross Lagerwall <ross.lagerwall@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: multipart/mixed; boundary="===============8134715162115197454=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============8134715162115197454==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hHWLQfXTYDoKhP50"
Content-Disposition: inline


--hHWLQfXTYDoKhP50
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 30, 2019 at 07:55:02AM +0000, Jan Beulich wrote:
> On 29.07.2019 19:06, Andrew Cooper wrote:
> > On 29/07/2019 16:57, Jan Beulich wrote:
> >> On 29.07.2019 17:41, Ross Lagerwall wrote:
> >>> When suspending/resuming or migrating under Xen, there isn't much need
> >>> for suspending and resuming all the attached devices since the Xen/QE=
MU
> >>> should correctly maintain the hardware state. Drop these calls and
> >>> replace with more specific calls to ensure Xen frontend devices are
> >>> properly reconnected.
> >> Is this true for the general pass-through case as well? While migration
> >> may not be (fully) compatible with pass-through, iirc save/restore is.
> >=20
> > What gives you this impression?
> >=20
> > Migration and save/restore are *literally* the same thing, except that
> > in one case you're piping the data to/from disk, and in the other you're
> > piping it to the destination and restoring it immediately.
> >=20
> > If you look at the toolstack code, it is all in terms of reading/writing
> > an fd (including libxl's API) which is either a network socket or a
> > file, as chosen by xl.
>=20
> Sure. The main difference is where the restore happens (by default):
> For live migration I expect this to be on a different host, whereas
> for a non-live restore I'd expect this to be the same host. And it
> is only the "same host" case where one can assume the same physical
> piece of hardware to be available again for passing through to this
> guest. In the "different host" case restore _may_ be possible, using
> identical hardware. (And yes, in the "same host" case restore may
> also be impossible, if the hardware meanwhile has been assigned to
> another guest. But as said, I'm talking about the default case here.)
>=20
> >> Would qemu restore state of physical PCI devices?
> >=20
> > What state would Qemu be in a position to know about, which isn't
> > already present in Qemu's datablob?
>=20
> That's a valid (rhetorical) question, but not helping to answer mine.
>=20
> > What we do with graphics cards is to merge Xens logdirty bitmap, with a
> > dirty list provided by the card itself.=C2=A0 This needs a device-speci=
fic
> > knowledge.=C2=A0 In addition, there is an opaque blob of data produced =
by the
> > source card, which is handed to the destination card.=C2=A0 That also l=
ives
> > in the stream.
> >=20
> > Intel's Scalable IOV spec is attempting to rationalise this by having a
> > standard ways of getting logdirty and "internal state" information out
> > of a device, but for the moment, it requires custom device-driver
> > specific code to do anything migration related with real hardware.
>=20
> Which isn't very nice, since it doesn't scale well as a model.
>=20
> > As for why its safe to do like this, the best argument is that this is
> > how all other vendors do migration, including KVM.=C2=A0 Xen is the
> > odd-one-out using the full S3 path.
>=20
> So how do "all other vendors" deal with device specific state? So
> far I was under the impression that to deal with this is precisely
> why we use the S3 logic in the kernel.

FWIW in Qubes we specifically S3 domUs with PCI devices assigned just
before host S3 - to let the driver save the state and later restore it.
AFAIR in same cases (but it might be PV, not HVM then) not doing so was
breaking host S3 altogether.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--hHWLQfXTYDoKhP50
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl1ANjEACgkQ24/THMrX
1yzaPwf+KvpDCngWKZ+Beo2GnE7Ca/T88+BWO8GSUXpBvnpgcmymdSY98fonX5+k
acUOWurSd2Jr1xioVPaG9i4qKKCO+g/DXD/c7mfaNYgb0yOSpzdtcLwMzkuP+B86
do9oQoW8KIOtczdMSnJd0slImi9rQ+E/CfLV4RxORxlQzEO1VdH7GdDtiOLZb4Pp
jwTTFEjSghS7ypWyYWuaZRbjKfMdJ51a3aGJMeNrh0BmzEOzKAmM7Kg4exYad877
qbb8CC0d3bMi4dp6ua8cGZZW/1aUr7vrdj6Oq0yEwJ1ELK9OBMHdtNUemAzfPSJ0
KorKNc1ytVO7UhxQhSt8hEZSD2h9RQ==
=JiRl
-----END PGP SIGNATURE-----

--hHWLQfXTYDoKhP50--


--===============8134715162115197454==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8134715162115197454==--

