Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B61114D8F1
	for <lists+xen-devel@lfdr.de>; Thu, 30 Jan 2020 11:30:26 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ix73E-0002qR-C9; Thu, 30 Jan 2020 10:27:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dbc6=3T=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1ix73C-0002qM-JA
 for xen-devel@lists.xenproject.org; Thu, 30 Jan 2020 10:27:54 +0000
X-Inumbo-ID: 2c572262-434b-11ea-b211-bc764e2007e4
Received: from wout4-smtp.messagingengine.com (unknown [64.147.123.20])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2c572262-434b-11ea-b211-bc764e2007e4;
 Thu, 30 Jan 2020 10:27:53 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 4CA70497;
 Thu, 30 Jan 2020 05:27:52 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Thu, 30 Jan 2020 05:27:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=T0k+xG
 i9qf9F63aTQGNkeIks+dpL8kQUWCnhfa/a2T4=; b=EDwnapMxNR5+VJuJuP5Yrr
 zFMVPl8YnimwvsB/axD6iDREPTUGDW5tHu8UWR+rhUPMk6+aO7l5ZJHWjtFkn+yn
 qt5wMk6GGDCV49ElN8ZQYOjZCl6jr+ISn1VIIqv11M17jZoAp0O7J/iMLOYHrcd/
 p3HgpTSOTkDeCEfr7TrqBR/x9PCJpUExL+u3/BnKKVxPUuzWIwHaubky3REBOiri
 w3fDQnTx2qTqIEK/2BgAfnu6Ln6rtlnrA68TmyiwZIiVMQOJpE4s/sPgZIeoTlTN
 a4D8GOTSmqNIZCPk4Wig22/L12c5f/SaXNrMxbvwMjXTI1KT1ZntWqdwoQfAjRhg
 ==
X-ME-Sender: <xms:p68yXg2xi9cRuITf9SuMJkuzcwJK6rTRPebcrSj7iXGfgxvuX87zig>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrfeekgddujecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
 ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
 hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecukfhppeeluddrieehrdefgedrfeef
 necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrh
 hmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:p68yXvUFrWYZMDYfAKDJIHGQhYKGjiOOhxKLm_9Zf6GUCTySP8Rcig>
 <xmx:p68yXj6UjOCIxnPwghTbujmQiEkr8DTDL9LwMT4CFyhVNkPafEemRw>
 <xmx:p68yXuLbMWUcpgOOFZGKeH9ybuE9fD0MiaNQnaPiZZ0Txo3QvTxQlQ>
 <xmx:p68yXqEV4fCqRYJSfqFs58JscTuy8fsqvLdIn9qonu8GNbAAhQTX7w>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 6EEAF328005D;
 Thu, 30 Jan 2020 05:27:50 -0500 (EST)
Date: Thu, 30 Jan 2020 11:27:46 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: "Durrant, Paul" <pdurrant@amazon.co.uk>
Message-ID: <20200130102746.GM15453@mail-itl>
References: <20200129144702.1543-1-pdurrant@amazon.com>
 <20200129144702.1543-3-pdurrant@amazon.com>
 <20200129212313.GD2995@mail-itl>
 <6ac0ec3ffd1749b79a34c3d96d99ccf4@EX13D32EUC003.ant.amazon.com>
MIME-Version: 1.0
In-Reply-To: <6ac0ec3ffd1749b79a34c3d96d99ccf4@EX13D32EUC003.ant.amazon.com>
Subject: Re: [Xen-devel] [PATCH v4 2/2] docs/designs: Add a design document
 for migration of xenstore data
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============3655625622445355937=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============3655625622445355937==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ztcJpsdPpsnnlAp8"
Content-Disposition: inline


--ztcJpsdPpsnnlAp8
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Xen-devel] [PATCH v4 2/2] docs/designs: Add a design document
 for migration of xenstore data

On Thu, Jan 30, 2020 at 08:45:49AM +0000, Durrant, Paul wrote:
> > -----Original Message-----
> > From: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>
> > Sent: 29 January 2020 21:23
> > To: Durrant, Paul <pdurrant@amazon.co.uk>
> > Cc: xen-devel@lists.xenproject.org; Stefano Stabellini
> > <sstabellini@kernel.org>; Julien Grall <julien@xen.org>; Wei Liu
> > <wl@xen.org>; Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>; George
> > Dunlap <George.Dunlap@eu.citrix.com>; Andrew Cooper
> > <andrew.cooper3@citrix.com>; Ian Jackson <ian.jackson@eu.citrix.com>
> > Subject: Re: [Xen-devel] [PATCH v4 2/2] docs/designs: Add a design
> > document for migration of xenstore data
> >=20
> > On Wed, Jan 29, 2020 at 02:47:02PM +0000, Paul Durrant wrote:
> >=20
> > <snip>
> >=20
> > > +**node data**
> > > +
> > > +
> > > +`<path>|<value>|<perm-as-string>|`
> > > +
> > > +
> > > +`<path>` is considered relative to the domain path
> > `/local/domain/$domid`
> > > +and hence must not begin with `/`.
> >=20
> > How backend settings are going to be serialized?
>=20
> They're not going to be. The toolstack will construct new backends; co-op=
eration will be required from them in that they must support re-binding (wh=
ich the latest versions of blkback and netback do). We will need to white-l=
ist backends that are known to do this and refuse non-cooperative migration=
 if any other backend is use.
>=20
> > For example vif backend
> > has a bunch of feature-* entries, which should not change under the
> > guest feet during non-cooperative migration.
> >=20
>=20
> The frontend will normally come back in 'connected' state, in which case =
a change in any feature flags will be irrelevant until the next (if any) re=
-connection (since the protocols only sample them at that point). If the fr=
ontend is not connected then it will sample the feature flags in the usual =
way. If the frontend/backend are in transition then the locking in the back=
end should prevent the 'unbind' from completing until some level of stabili=
ty has been reached.

Yes, but regardless of xenstore entries, those do represent what backend
can and is willing to do. If some feature disappears (in actual backend,
not only its xenstore representation) during non-cooperative migration,
I guess frontent won't be happy about that.

How are they related to feature-* entries in frontent? Are frontend
features separate set, or a confirmation what backend's features will be
used?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--ztcJpsdPpsnnlAp8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl4yr6IACgkQ24/THMrX
1ywmugf/bD9G4qqNutf8KcklNahYJH33INOl1JtABdD9KY15SgMCgHQ2dIFoi974
Vn1aqSEkv5aHeJE9rpVuvOF1vmkuEPRbN70luFplq9mUyIZv+r1cdUkxd1v+Uu2M
Pg+W0TqZKr/oihOe5bW/2TDUKvHmGRQDWuzX/MeyNleBs+sbDaHxQT7AGWIZCcG7
xtmsZwjpnhKVvixvFJLAL0KU6L5PxdNAWZ3XKm0Oy8s8B9qEfrCTC0cEXohUBCMm
p4i8w0cWS7l9tO83NamZ01KCIM7uCOjTBgwDqZcy5Eq/u8yOGJ7eOy4+cMnu1C0L
VNYyPZEkXJTz8Pl+oifndcMg9s+lew==
=ePKR
-----END PGP SIGNATURE-----

--ztcJpsdPpsnnlAp8--


--===============3655625622445355937==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3655625622445355937==--

