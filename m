Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B02ECC2
	for <lists+xen-devel@lfdr.de>; Tue, 30 Apr 2019 00:28:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hLEiM-0000AA-E9; Mon, 29 Apr 2019 22:25:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=JedT=S7=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1hLEiL-0000A5-0L
 for xen-devel@lists.xenproject.org; Mon, 29 Apr 2019 22:25:33 +0000
X-Inumbo-ID: b2ef6192-6acd-11e9-b51d-17633c9ddb2d
Received: from out4-smtp.messagingengine.com (unknown [66.111.4.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b2ef6192-6acd-11e9-b51d-17633c9ddb2d;
 Mon, 29 Apr 2019 22:25:31 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 35EFC21947;
 Mon, 29 Apr 2019 18:25:31 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Mon, 29 Apr 2019 18:25:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=hGuMmt
 +aKyFjbdfDA6eUCzoy5eXFniZlDdox77nvBag=; b=efW98ANlfgnNan6EeE0b7o
 CkV7cNDqzJ8p2sr9APwvXGVHLwm1+zv471ntYFYpkxSxY7KpnOqyVLsGgUxd8nWx
 Q9FGr+RvLEgH47t/K025G39oqOqpgrSOVVHzqSb07Gtst24+BE07w+w8MUKHzTGw
 dPAuV0XWJ07vGunyBxIJo1WIjMetHBGC1Tah4lLYGXz81yi+9x5zrzD/FBDDZ2H1
 uQFZeCD0b8f58BDti/75WMl0sEA04IJpdrjYK6d3vl5g3EzAYdLcx5NcT0Ttdgg3
 Tl1III+TAgoRL+IiydfimWtadWx/bKvtf7/mwsIcUFqlHDuc4epq8xJjglEW/L8g
 ==
X-ME-Sender: <xms:2nnHXAmu3GJmERaB9T6wpxCYxe8Hg6hW38p8_54OP1LSOFIwIhbTDw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrieefgdduudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujggfsehgtderredtreejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucfkphepledurdeihedrfeegrdef
 feenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslh
 gvthhhihhnghhslhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:2nnHXEElwzvSC5m2g11sJocjLopDnJRDt5As9bW5-omtNeeh-red5w>
 <xmx:2nnHXJovJj35WIQj4-2iOTR2ZKpHws0GW91BlL2kt8Y5bzeGtNyBPQ>
 <xmx:2nnHXA6q_dTM8XneAgZN-ZH-qpFl2NquaUA8pA6GtfctmdTpRqlmLQ>
 <xmx:23nHXPwjfG6Bv1CMQ6PM_34Oac8vTq-Tu6NKKPmY3wUqKiSePq8yzA>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7A6F710319;
 Mon, 29 Apr 2019 18:25:29 -0400 (EDT)
Date: Tue, 30 Apr 2019 00:25:26 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Ian Jackson <ian.jackson@citrix.com>
Message-ID: <20190429222526.GI1502@mail-itl>
References: <20190428190824.28029-1-marmarek@invisiblethingslab.com>
 <23750.52986.475586.327869@mariner.uk.xensource.com>
 <20190429220835.GH1502@mail-itl>
MIME-Version: 1.0
In-Reply-To: <20190429220835.GH1502@mail-itl>
User-Agent: Mutt/1.11.1+94 (9b965fac) (2019-01-05)
Subject: Re: [Xen-devel] [PATCH] python: Adjust xc_physinfo wrapper for
 updated virt_caps bits
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wei.liu2@citrix.com>
Content-Type: multipart/mixed; boundary="===============0028964772610029262=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============0028964772610029262==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7OjtA+nCOeniMjk8"
Content-Disposition: inline


--7OjtA+nCOeniMjk8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 30, 2019 at 12:08:38AM +0200, Marek Marczykowski-G=C3=B3recki w=
rote:
> On Mon, Apr 29, 2019 at 11:16:26AM +0100, Ian Jackson wrote:
> > Marek Marczykowski-G=C3=B3recki writes ("[PATCH] python: Adjust xc_phys=
info wrapper for updated virt_caps bits"):
> > > Commit f089fddd94 "xen: report PV capability in sysctl and use it in
> > > toolstack" changed meaning of virt_caps bit 1 - previously it was
> > > "directio", but was changed to "pv" and "directio" was moved to bit 2.
> > > Adjust python wrapper, and add reporting of both "pv_directio" and
> > > "hvm_directio".
> >=20
> > Thanks for your attention to this...
> >=20
> > But:
> >=20
> > > index cc8175a11e..0a8d8f407e 100644
> > > --- a/tools/python/xen/lowlevel/xc/xc.c
> > > +++ b/tools/python/xen/lowlevel/xc/xc.c
> > > @@ -973,7 +973,8 @@ static PyObject *pyxc_physinfo(XcObject *self)
> > >      xc_physinfo_t pinfo;
> > >      char cpu_cap[128], virt_caps[128], *p;
> > >      int i;
> > > -    const char *virtcap_names[] =3D { "hvm", "hvm_directio" };
> > > +    const char *virtcap_names[] =3D { "hvm", "pv",
> > > +                                    "hvm_directio", "pv_directio" };
> >=20
> > It seems quite wrong that we have no way to keep this in sync - and
> > not even comments in both places!  (This is not your fault...)
>=20
> I'll add a comment...

Actually, this would work much better if the loop below would use
#defines from sysctl.h, instead of hardcoded values. I'll update it this
way.

> > > @@ -989,6 +990,10 @@ static PyObject *pyxc_physinfo(XcObject *self)
> > >      for ( i =3D 0; i < 2; i++ )
> > >          if ( (pinfo.capabilities >> i) & 1 )
> > >            p +=3D sprintf(p, "%s ", virtcap_names[i]);
> > > +    if (pinfo.capabilities & XEN_SYSCTL_PHYSCAP_directio)
> > > +        for ( i =3D 0; i < 2; i++ )
> > > +            if ( (pinfo.capabilities >> i) & 1 )
> > > +              p +=3D sprintf(p, "%s ", virtcap_names[i+2]);
> > >      if ( p !=3D virt_caps )
> > >        *(p-1) =3D '\0';
> >=20
> > I'm not sure I like this.  AFAICT the +2 is magic, and you in fact
> > treat the two halves of this array together as a single array.  So
> > this should either be two arrays, or, more likely, something like this
> > maybe:
> >=20
> >   +              p +=3D sprintf(p, "%s_directio ", virtcap_names[i]);
> >=20
> > What do you think ?
>=20
> Makes sense.
>=20



--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--7OjtA+nCOeniMjk8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlzHedcACgkQ24/THMrX
1yyb0wf+My4pQ3jrB2hSry+H2n+rULhHTJdGlAeZQrt0qYq5qUZj7C1Bo9bsUCiy
S+meSXS0bQNzK+xBdltRY2lgFXEPCGFVl4XnFzrZ4SNgLqa1rk4eGPmfIb67DbLx
MUn33AL0Tr1Kl+aFDDpDCCykF/UzT4P+fPqioFmg9DkXH8tqC6IanPyBBTox0Du6
oPlbX5QgVJz27ND6p0rHLcLz0FXbvRS+HidCq2+F1wUgZYk3L6I3T17QWBQF8538
nhdZ1ZEfOHm7uSrXCS/ILcmnvN2vdjjgj/yyeEMaJGv2gq5HM3XHr4vasGmgD3g1
S/kd6No3B8E40/Rw3FVPwLo7LIjR+A==
=vmmk
-----END PGP SIGNATURE-----

--7OjtA+nCOeniMjk8--


--===============0028964772610029262==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0028964772610029262==--

