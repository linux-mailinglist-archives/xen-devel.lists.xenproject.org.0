Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 78CE7BEB22
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 06:18:05 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDLCQ-0006eN-Ca; Thu, 26 Sep 2019 04:16:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lLXC=XV=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1iDLCP-0006eH-Fz
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 04:16:13 +0000
X-Inumbo-ID: 6029f33e-e014-11e9-bf31-bc764e2007e4
Received: from new1-smtp.messagingengine.com (unknown [66.111.4.221])
 by localhost (Halon) with ESMTPS
 id 6029f33e-e014-11e9-bf31-bc764e2007e4;
 Thu, 26 Sep 2019 04:16:12 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id B29D6208D;
 Thu, 26 Sep 2019 00:16:12 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Thu, 26 Sep 2019 00:16:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=A1TWCo
 08y9Oz8RWuzp8Kwsz1xB2SFThBEJn4+RSNiQE=; b=KtWJHSag9rSHCu/BCyO+ML
 H7Qpmbk2Fb1afAL3axAsGIH1EFBKkGvgPsswG9ed7nwB7EAJ76Jg7PTyJqoKN7vy
 vwdY6nSPYfrhy/6OH9zgowQCjNyFv3D6XdDleTjH4D8xnnoSyVR2jR1gFMTM9I2W
 RJqClhD6gEpBjP2IVPm5h9SNkupxAcNL4umCEHSBSh04PnmpVPE89wc5/+cNdFoq
 hbZYaVsTEYZnKXzQy38iSmerRm3aLa4UfkcbHxpxSxB6CDVouHxXBt4dTJhoCDqk
 udlz14HuED0je1R1k9Axeq0MZq/3dLFdFffTXJLYxeNZ58ptI8IPlP3w2dKmAg/A
 ==
X-ME-Sender: <xms:izuMXdGiT8CiTTDyG2zx3J2o4X3R8-MVBbmANqS1gX56v-qRghYsvg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrfeefgdekudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
 ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
 hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuffhomhgrihhnpehgihhthhhusgdr
 tghomhenucfkphepledurdeihedrfeegrdeffeenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhenucev
 lhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:izuMXRYURVO10QSOYuT63i_Wop2aBMfomCqXlckgCEEGeUyKw6blmg>
 <xmx:izuMXVUPSrCk3m5a8sABL9xeQGTUEDKsgoO-uI64ru5uDbzqHgrAtw>
 <xmx:izuMXfkClOZ0nQ_SZypT3IQElOMPBI-hlfzs-OLR_t049Ku48fG-oA>
 <xmx:jDuMXQPzqwOM_UVhnPPLdfklert-UXRikBSQ6AGM14qDJZsBBFJwzQ>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0CA04D6005F;
 Thu, 26 Sep 2019 00:16:09 -0400 (EDT)
Date: Thu, 26 Sep 2019 06:16:06 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Message-ID: <20190926041606.GR8065@mail-itl>
References: <cover.e819a32509fb1a6bdcbdcefb2de053ccf2361d59.1569379186.git-series.marmarek@invisiblethingslab.com>
 <7d011094eed3f5c3cf6971cc8760874fd56ca443.1569379186.git-series.marmarek@invisiblethingslab.com>
 <20190925094150.qibuqwj6nynjo6vi@Air-de-Roger>
 <20190925122941.GP8065@mail-itl>
 <20190925132617.73qdovaeddl45f2o@Air-de-Roger>
MIME-Version: 1.0
In-Reply-To: <20190925132617.73qdovaeddl45f2o@Air-de-Roger>
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
 Stefano Stabellini <sstabellini@kernel.org>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Simon Gaiser <simon@invisiblethingslab.com>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 xen-devel@lists.xenproject.org, Brian Woods <brian.woods@amd.com>
Content-Type: multipart/mixed; boundary="===============0879157371455289584=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============0879157371455289584==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DXai+D0O/pduKrS9"
Content-Disposition: inline


--DXai+D0O/pduKrS9
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v7 4/4] xen/x86: Allow stubdom access to irq created for
 msi.

On Wed, Sep 25, 2019 at 03:26:17PM +0200, Roger Pau Monn=C3=A9 wrote:
> On Wed, Sep 25, 2019 at 02:29:41PM +0200, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > On Wed, Sep 25, 2019 at 11:41:50AM +0200, Roger Pau Monn=C3=A9 wrote:
> > > It would still be nice to get the missing bits (interrupt enabling),
> > > or else this patch is kind of pointless, since it still doesn't allow
> > > stubdomains to work correctly with passed through devices.
> >=20
> > Well, that part, as discussed, doesn't need to be in Xen. For example
> > the solution deployed in current Qubes stable version is based on
> > pciback for this purpose.
>=20
> Ack. Do you think it would make sense to submit that part to Linux
> then?

How would an interface with toolstack (when to allow enabling MSI)
should look like? Right now I have it as extra attribute in sysfs of
pciback and libxl writes to it. Or rather should it be in xenstore?
Or maybe pciback should somehow detect itself if it's talking to
stubdomain while the device is assigned to a HVM domain, or to a target
PV domain itself?

The actual patch is here:
https://github.com/QubesOS/qubes-linux-kernel/blob/master/0014-xen-pciback-=
add-attribute-to-allow-MSI-enable-flag-w.patch
and the toolstack part:
https://github.com/QubesOS/qubes-vmm-xen/blob/xen-4.8/patch-stubdom-allow-m=
si-enable.patch

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--DXai+D0O/pduKrS9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl2MO4YACgkQ24/THMrX
1yzecwf/SCGEl77lGHDEt4ICjUX2sg6lWdpQSno5fTQboPZzJvxL3N6ekG2Fe+0b
yhUW4ZhmNoTabFWNwF3LchQOGlFNK8Y8WRJUWh5zQge7tFDxEui8nFS9bg+CTMNm
IA/4fUxUSh7GXlJ6ZEI3DaSRUW4wTc1MDC1cIxzyscahZTX0MD4TWxa3ni34OTCl
kOFe3PbRcHsbleGdU+zTQTx3JgD1Jm9Dzl7KFyucaogwiZ7jDNQArZ05V/p2qfPe
1+1c1eyjXQHGImTWUJogQNmYs7QU84376dYG3As/N7XN6bKb55+GJYeMuJb5yHi5
Sqw7j/Lx6DQZrhJjrvWh9kZGv2Aa+A==
=KFuj
-----END PGP SIGNATURE-----

--DXai+D0O/pduKrS9--


--===============0879157371455289584==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0879157371455289584==--

