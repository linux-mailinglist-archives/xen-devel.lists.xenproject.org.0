Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11001C1A12
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 04:04:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEkyJ-0001bB-2z; Mon, 30 Sep 2019 01:59:31 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kTCF=XZ=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1iEkyH-0001b2-3P
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 01:59:29 +0000
X-Inumbo-ID: ef368fce-e325-11e9-bf31-bc764e2007e4
Received: from new4-smtp.messagingengine.com (unknown [66.111.4.230])
 by localhost (Halon) with ESMTPS
 id ef368fce-e325-11e9-bf31-bc764e2007e4;
 Mon, 30 Sep 2019 01:59:28 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id 7B3D218AA;
 Sun, 29 Sep 2019 21:59:27 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Sun, 29 Sep 2019 21:59:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=p1+/Zt
 vq/NbkqtjCtMs/EHIRtO1tFG/9gkXXgRQ/tSY=; b=Hx0rzVuHdLKCK+PbQRHs8r
 tFJEumYSDcpXH4R5y8Jhw3muhKSOjUSsSFaOk24cpzmipPGfxWXZU7zvmNH107Ni
 7FUzMG/0WdGjWzE4Bn8BGC2qn8w9I9oe5htdI3G18BFdw3krlObULqKURPm4tyDi
 cb3vJlNyw6vQnkQwB7KuIdAOkVv2hC2ZIj12yOozlZOvQrm/+k2YczJ2KgyGZzlf
 7l0Qj8fcJXydlvz5WUlpEufZdTR5brBAKtJBf3wY7OymPvOGY/vtu3gt11lDR8UB
 Rzc1ib5+wA1oEawYKZ9o1oc7G9ntaDpxt3rnSNmdzJ6zfXlTsTwF6mwxKWadWFkQ
 ==
X-ME-Sender: <xms:fmGRXdFjPAd62VHHjmuVHGK7rYimjf4lKgKDbiQM0JgIh7LijWHlpg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrgedugdehudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
 ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
 hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecukfhppeeluddrieehrdefgedrfeef
 necurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvg
 hthhhinhhgshhlrggsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:fmGRXSfHoaOJQ8zhfPvpD3zZKlkxFhSybCWMOqQUcERzRUweyLX12w>
 <xmx:fmGRXXHfldxZ6NQRZ5wTgm1SIGJBubspmiMik1DsxcacPlfFKIpVJw>
 <xmx:fmGRXbVp6u8huoUHr4LeIAR7LRPBXkhs1K_0hBk1asfkKp5DvZI8Lw>
 <xmx:f2GRXcEmUyB1zcRAggbBKDnjRRfgFHDQBzPBV20o4T6L-SPIjIaO8w>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id A638B8005A;
 Sun, 29 Sep 2019 21:59:23 -0400 (EDT)
Date: Mon, 30 Sep 2019 03:59:20 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Message-ID: <20190930015920.GU1222@mail-itl>
References: <cover.e819a32509fb1a6bdcbdcefb2de053ccf2361d59.1569379186.git-series.marmarek@invisiblethingslab.com>
 <7d011094eed3f5c3cf6971cc8760874fd56ca443.1569379186.git-series.marmarek@invisiblethingslab.com>
 <20190925094150.qibuqwj6nynjo6vi@Air-de-Roger>
 <20190925122941.GP8065@mail-itl>
 <20190925132617.73qdovaeddl45f2o@Air-de-Roger>
 <20190926041606.GR8065@mail-itl>
 <20190926071017.yztb44ho7tyt5aqz@Air-de-Roger>
 <20190929013554.GA24160@mail-itl>
MIME-Version: 1.0
In-Reply-To: <20190929013554.GA24160@mail-itl>
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
Content-Type: multipart/mixed; boundary="===============5265425764046077647=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============5265425764046077647==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oXXuwmZolLKlWh2N"
Content-Disposition: inline


--oXXuwmZolLKlWh2N
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Xen-devel] [PATCH v7 4/4] xen/x86: Allow stubdom access to irq
 created for msi.

On Sun, Sep 29, 2019 at 03:35:57AM +0200, Marek Marczykowski-G=C3=B3recki w=
rote:
> On Thu, Sep 26, 2019 at 09:10:17AM +0200, Roger Pau Monn=C3=A9 wrote:
> > On Thu, Sep 26, 2019 at 06:16:06AM +0200, Marek Marczykowski-G=C3=B3rec=
ki wrote:
> > > On Wed, Sep 25, 2019 at 03:26:17PM +0200, Roger Pau Monn=C3=A9 wrote:
> > > > On Wed, Sep 25, 2019 at 02:29:41PM +0200, Marek Marczykowski-G=C3=
=B3recki wrote:
> > > > > On Wed, Sep 25, 2019 at 11:41:50AM +0200, Roger Pau Monn=C3=A9 wr=
ote:
> > > > > > It would still be nice to get the missing bits (interrupt enabl=
ing),
> > > > > > or else this patch is kind of pointless, since it still doesn't=
 allow
> > > > > > stubdomains to work correctly with passed through devices.

BTW it is useful with permissive mode enabled.=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--oXXuwmZolLKlWh2N
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl2RYXgACgkQ24/THMrX
1yyDOAf+MStrtOuTtJWgC4QXpGllmbYpR5WNxQTW3XD0lTrJHR1cbmoErWQ2z9vY
Qhw1qgd4NlQ7LQqXCI8xAERtjYS9BmGNKrYmGIonzoOJGLL8kj6dGyT6x3yNMB6+
UdXkSDw9NXltprY/t0F+gGX2UxZRqigLXnj6SbGFD+WzA0pVSGXAd5j1qIbKgrV8
YNXXu3P9f6vfcBD0KhgLOp4AJWRPJyf912ORNgnPdEVGttJClPjDd7ExtYnKJ+Fm
4GkvB71lIuDChsEpeu/UwdLinaeb6N8DJg3BdOGxktDhtX8fmyGNFpb/ayu9KBhr
bC4CO9Bf2TWnpt/2iWnQ/gSHL1cb3w==
=wYVk
-----END PGP SIGNATURE-----

--oXXuwmZolLKlWh2N--


--===============5265425764046077647==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5265425764046077647==--

