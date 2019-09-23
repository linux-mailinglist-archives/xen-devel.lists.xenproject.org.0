Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1317FBB3BD
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2019 14:28:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCNPk-0002mw-Id; Mon, 23 Sep 2019 12:26:00 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dYCr=XS=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1iCNPi-0002mq-Pt
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2019 12:25:58 +0000
X-Inumbo-ID: 4b780ab6-ddfd-11e9-b299-bc764e2007e4
Received: from new1-smtp.messagingengine.com (unknown [66.111.4.221])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4b780ab6-ddfd-11e9-b299-bc764e2007e4;
 Mon, 23 Sep 2019 12:25:57 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id 3F1EF224C;
 Mon, 23 Sep 2019 08:25:57 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Mon, 23 Sep 2019 08:25:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=kylsJm
 ALKnqK1gz78v74rR07aWsIwmKwPNFPgp8Pn4s=; b=bkCXJnxi0dPbGryPntwP98
 0lArrH8Cp6YtvsDJ7kFbjJ08RiQUFqD8UR0zSbrMdUAfGs9PuRk/B0fpzdZzjbOM
 fhotDeW3ZcybJffMK18jyL1hHW/oupzsvdBCndg/sGyv/85mC9XIWs4UeEj8u22K
 0H8xFQM2MGXTmmLdCW7hAnqldPccEkYBwD7x0hoeS6WSlkpigRtrgQZgq2rbCT2F
 hZeAuHthxhNKqSebeBfrv23z4UmGG1qgTaSdZO6YL+4smyfEjnZ4beQzag93d7ok
 N1uBDhWdb0Oxv7GEKHFeIKYXJQOVbLb0WUv1yXc8C9dJ8m7kYXxeH0scqFGVe+1A
 ==
X-ME-Sender: <xms:1LmIXRAkYvjeXc47BlVCimQFRfnj9FU--2mk-t3D-gXSDdhXXH4Zag>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdekgdehudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
 ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
 hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecukfhppeekfedrleejrddvfedrvdel
 necurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvg
 hthhhinhhgshhlrggsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:1LmIXSzDbUEkKV0seLbzVlrM61huJMPDqUGSGg8HltlWXnFNljJFZw>
 <xmx:1LmIXWAlcHaTuELl4RfglWzwF78P8zLCUAiea1_9nCtKeWE8qlCAdQ>
 <xmx:1LmIXXalNU4z9M3zMW6XsC04aoiHpTWrm9C8tRqL5eXeoQvWz1e2rg>
 <xmx:1bmIXTLQ1quS-oUdqPlOvf3PulU09bSqazSL9H3jGq5vH0zgdybU6w>
Received: from mail-itl (unknown [83.97.23.29])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2DB54D6005B;
 Mon, 23 Sep 2019 08:25:54 -0400 (EDT)
Date: Mon, 23 Sep 2019 14:25:49 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20190923122549.GA15942@mail-itl>
References: <cover.4c97023e719e059ea99137f2cadea319eb87495d.1568475323.git-series.marmarek@invisiblethingslab.com>
 <819398f808613a1109bc06440268b8746e7540d4.1568475323.git-series.marmarek@invisiblethingslab.com>
 <fc4dcc0e-fd7a-a25d-0f6f-b722f6ba8122@suse.com>
 <20190920160250.GA8065@mail-itl>
 <7a954000-904d-57aa-2524-5d0c51a8d422@suse.com>
 <20190923104746.GD8065@mail-itl>
 <81326ccd-c27d-d97c-2a20-b39c1f42f5f0@suse.com>
MIME-Version: 1.0
In-Reply-To: <81326ccd-c27d-d97c-2a20-b39c1f42f5f0@suse.com>
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
Content-Type: multipart/mixed; boundary="===============3344544660334389830=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============3344544660334389830==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YZ5djTAD1cGYuMQK"
Content-Disposition: inline


--YZ5djTAD1cGYuMQK
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Xen-devel] [PATCH v6 5/6] xen/x86: add
 PHYSDEVOP_interrupt_control

On Mon, Sep 23, 2019 at 02:05:58PM +0200, Jan Beulich wrote:
> On 23.09.2019 12:47, Marek Marczykowski-G=C3=B3recki  wrote:
> > On Mon, Sep 23, 2019 at 09:58:27AM +0200, Jan Beulich wrote:
> >> On 20.09.2019 18:02, Marek Marczykowski-G=C3=B3recki  wrote:
> >>> Anyway, if you all agree that pciback should be the way to go, I can =
go
> >>> that route too. In practice, it would be a flag (set by the toolstack=
?)
> >>> allowing writes to appropriate config space registers directly (with
> >>> appropriate checks, as in this patch).
> >>
> >> I'm afraid I don't agree: How would allowing writes to more config spa=
ce
> >> registers by a stubdom be safe?
> >=20
> > Exactly the same as in this patch: pciback would perform the same
> > validation (prohibit enabling MSI together with INTx etc).
> >=20
> > BTW what are the risks (besides DoS) of allowing full config space
> > access, assuming VT-d with interrupt remapping present? This sounds
> > similar to risks of malicious device connected to some domU, right? Can
> > such device (or a domain controlling such device) break out to Xen or
> > dom0? Can it steal data from other domains?
>=20
> There shouldn't be, but this would need proving. The direction of
> proof then should be the other way around (and I realize it may be
> [close to] impossible): Widening what guests (including stub
> domains) are allowed to do should be proven to add no additional
> risks. It shouldn't be (by example, as I imply from your question)
> that an actual issue needs to be pointed out.

What about this: HVM guest can already do all of this when qemu is
running in dom0. So, allowing those actions when qemu is running in
stubdomain should not introduce _additional_ risks.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--YZ5djTAD1cGYuMQK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl2Iuc0ACgkQ24/THMrX
1yxxXAf+LLO2tL6AooBCw1t7V9OU56DnEaskTT6iVxhM7ve5ubROefrnB5BrlvH/
XmK4Z0rQ+qE9FZoBeKT376GS9g2JbskOL9QMyiqXetJjm3FN4nP5SAcGLFzc5iBp
XDafk2KKeOgaHZZ3zXR+QN6sqPxQHo2K9jyK7Ukcdt0Y4BUVtPKJe6qQ10fY/niW
nQH65zt4l/Ql+KG3U2XwYXar/R7v6c7PVIQkuW0f27jaEv/xWRZI4aCXtjYgd++Q
cN1y3WS21rzDdaIqhSOcYf7UVNwd9MsghOs/RuQ1QguXtLfUNDkNf5CplRQQ3LcR
ocdrDcePSa9gPIS8lk0tVFMQqFsBZQ==
=/iLk
-----END PGP SIGNATURE-----

--YZ5djTAD1cGYuMQK--


--===============3344544660334389830==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3344544660334389830==--

