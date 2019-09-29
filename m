Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4677AC12B3
	for <lists+xen-devel@lfdr.de>; Sun, 29 Sep 2019 03:39:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEO83-0006YU-Co; Sun, 29 Sep 2019 01:36:03 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LuaF=XY=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1iEO81-0006XS-3q
 for xen-devel@lists.xenproject.org; Sun, 29 Sep 2019 01:36:01 +0000
X-Inumbo-ID: 7d77f6ce-e259-11e9-8628-bc764e2007e4
Received: from new4-smtp.messagingengine.com (unknown [66.111.4.230])
 by localhost (Halon) with ESMTPS
 id 7d77f6ce-e259-11e9-8628-bc764e2007e4;
 Sun, 29 Sep 2019 01:35:59 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id 5BE9526E6;
 Sat, 28 Sep 2019 21:35:59 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Sat, 28 Sep 2019 21:35:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=aXjgeq
 yYORTacxJLJvWcCXVgSU6Y5U04oZ6GbAxKhWs=; b=qdGS6z6FiTIke7ESVrht8k
 hIg5+cHiH8pXN2nxzYYoc3/9zy9WtlSUDKePJry2LNB3PHrAW5n8Z9BLeJ6p2hpe
 I5RPyHqwEcPf59LD8+K+245253jlAQEU5VUj+ddbv6hBunI57Tmq/zujkTuMNM6r
 VvHtye4cQo+0MkGkjYWelXvIdpgnirOPYJka3FF6mebsorhtvIg7Lt7vc4Rf7DcW
 J3xmcU0OlZ32EPtDvEb+fkPSWopE0nG4kJRqF+DgGasqBZn4hRyOrhAhcPopzsZ9
 YsONHlGCikK3c4PxdPaq3oWbIW5IKdCLXmnwrH2z+2uvhfchCDvrqJ3E0W5SOSTg
 ==
X-ME-Sender: <xms:fgqQXfxwo6HSw38tn-jLKiNdws-Y87XrKftOcre0zzmR9nbTbAwQHA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrfeelgdegkecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
 ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
 hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecukfhppeeluddrieehrdefgedrfeef
 necurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvg
 hthhhinhhgshhlrggsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:fgqQXfobrsQSG7-HA_77YBw7NmHFKuu82dRPBKbm27xVVgazrGI3tQ>
 <xmx:fgqQXbjdgOxDyaD140KG4W3tK5ckzbo9QLw2UQtkiJ9uJdKe4saVTw>
 <xmx:fgqQXRXpD2FlIXg2Zz3_aTqmnG-N6Zv4rG6nziTR8dbocNGwlsHUKQ>
 <xmx:fwqQXYMzwSHyalAGAvvIYmBZLrRMcPubgezQpCTlMa28MXUQukOZkA>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 8B5EED6005A;
 Sat, 28 Sep 2019 21:35:56 -0400 (EDT)
Date: Sun, 29 Sep 2019 03:35:54 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Message-ID: <20190929013554.GA24160@mail-itl>
References: <cover.e819a32509fb1a6bdcbdcefb2de053ccf2361d59.1569379186.git-series.marmarek@invisiblethingslab.com>
 <7d011094eed3f5c3cf6971cc8760874fd56ca443.1569379186.git-series.marmarek@invisiblethingslab.com>
 <20190925094150.qibuqwj6nynjo6vi@Air-de-Roger>
 <20190925122941.GP8065@mail-itl>
 <20190925132617.73qdovaeddl45f2o@Air-de-Roger>
 <20190926041606.GR8065@mail-itl>
 <20190926071017.yztb44ho7tyt5aqz@Air-de-Roger>
MIME-Version: 1.0
In-Reply-To: <20190926071017.yztb44ho7tyt5aqz@Air-de-Roger>
Subject: Re: [Xen-devel] [PATCH v7 4/4] xen/x86: Allow stubdom access to irq
 created for msi.
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Simon Gaiser <simon@invisiblethingslab.com>,
 Julien Grall <julien.grall@arm.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 xen-devel@lists.xenproject.org, Brian Woods <brian.woods@amd.com>
Content-Type: multipart/mixed; boundary="===============4308252142708716533=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============4308252142708716533==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="pf9I7BMVVzbSWLtt"
Content-Disposition: inline


--pf9I7BMVVzbSWLtt
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Xen-devel] [PATCH v7 4/4] xen/x86: Allow stubdom access to irq
 created for msi.

On Thu, Sep 26, 2019 at 09:10:17AM +0200, Roger Pau Monn=C3=A9 wrote:
> On Thu, Sep 26, 2019 at 06:16:06AM +0200, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > On Wed, Sep 25, 2019 at 03:26:17PM +0200, Roger Pau Monn=C3=A9 wrote:
> > > On Wed, Sep 25, 2019 at 02:29:41PM +0200, Marek Marczykowski-G=C3=B3r=
ecki wrote:
> > > > On Wed, Sep 25, 2019 at 11:41:50AM +0200, Roger Pau Monn=C3=A9 wrot=
e:
> > > > > It would still be nice to get the missing bits (interrupt enablin=
g),
> > > > > or else this patch is kind of pointless, since it still doesn't a=
llow
> > > > > stubdomains to work correctly with passed through devices.
> > > >=20
> > > > Well, that part, as discussed, doesn't need to be in Xen. For examp=
le
> > > > the solution deployed in current Qubes stable version is based on
> > > > pciback for this purpose.
> > >=20
> > > Ack. Do you think it would make sense to submit that part to Linux
> > > then?
> >=20
> > How would an interface with toolstack (when to allow enabling MSI)
> > should look like? Right now I have it as extra attribute in sysfs of
> > pciback and libxl writes to it. Or rather should it be in xenstore?
>=20
> I think xenstore would be more suitable for this. There are already
> some flags passed to pciback there: msitranslate, power_mgmt and
> permissive (see libxl_pci.c:63).

Hmm, I see permissive is also set in sysfs
(libxl_pci.c:pci_add_dm_done). And I think that is used by pciback,
based on inspection of its source code.
In fact, I don't see anything in pciback parsing opts-%d xenstore entry
at all. It looks like it's only used by the toolstack to reconstruct
libxl_device_pci struct from xenstore.

> > Or maybe pciback should somehow detect itself if it's talking to
> > stubdomain while the device is assigned to a HVM domain, or to a target
> > PV domain itself?
>=20
> I think doing it in the toolstack and just passing an option to
> pciback is likely easier than adding more logic to pciback.

Agree.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--pf9I7BMVVzbSWLtt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl2QCnkACgkQ24/THMrX
1yzALgf8DS6/ytKoD7VxsrZ7gEEJ7mYasYYlNty17Shv1qYQ9FZQ/Jf00oECZu3k
8KlmG1ZrTx9xEwp200PESos2x6p+AoQd0cEvNsbf83P8M2NKhG2L98DErCWRznOU
+h93WfR2eW3V24ig7xwgT1VvFNtB6DkR/Rtuiu5x/+lEsbLkdXxzHzy8RWT0tyQ5
c2GuW9FhGUJeJQwol+8AtBqfAD6xLCkc+z9XFBqJsOvGcrRc0YXEQ/h31aCedmUv
rP30ufzNxd1BXqtoCA31oQKq2KGkuY3PpEvxYcobvz61Z+9OvcY309sVXeNfcBbW
vjUu6FOuMajtIDY8i2s3SvF5K8F4cg==
=vnw4
-----END PGP SIGNATURE-----

--pf9I7BMVVzbSWLtt--


--===============4308252142708716533==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4308252142708716533==--

