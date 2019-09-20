Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9742DB94E7
	for <lists+xen-devel@lfdr.de>; Fri, 20 Sep 2019 18:06:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iBLN4-0006ia-Vf; Fri, 20 Sep 2019 16:02:58 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LEuF=XP=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1iBLN3-0006iV-EH
 for xen-devel@lists.xenproject.org; Fri, 20 Sep 2019 16:02:57 +0000
X-Inumbo-ID: 1c44893e-dbc0-11e9-b299-bc764e2007e4
Received: from new2-smtp.messagingengine.com (unknown [66.111.4.224])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1c44893e-dbc0-11e9-b299-bc764e2007e4;
 Fri, 20 Sep 2019 16:02:56 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id 6D08C20FC;
 Fri, 20 Sep 2019 12:02:56 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Fri, 20 Sep 2019 12:02:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Fgjo9i
 JElKfW6xIZid7H/s/kz5opDaWEifBCyleIcKU=; b=dj9JUoPYNsv5IpywA4LWRp
 BU+mqFxkM1l9ydblmv6D2Ppwn4bh0XYCN41O7f7GMsUKVEj9z01lrgBIAPiQtqWx
 e6dQ/m0Imn8oahKJDTBTu/NXWIT7nh/UeTkLd43lweptESwkr0z47eIWKUZCh59R
 HfVButOddMQQb50yWzHTkQA7iYMOymYO6cA1zcriv74iAScEGYjG1V9V2QYRQHdK
 IKWrFMBIqjKLzWY6XB2OqlRiIvlH5A43ELoAAHnywHCMifDac5mcNVTnQ73PomXA
 vb5qab0fn+RMweAnQYvuz8phglukJIBhY3fvuab8u5MVNYlE3UAnJzu5k4emfdZg
 ==
X-ME-Sender: <xms:L_iEXdpPxmOGEpdDSwdG4vk6QRuXTD9wkpRlFR-gUbmEyPoq_1Mm8w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvddvgdelhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
 ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
 hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuffhomhgrihhnpeigvghnphhrohhj
 vggtthdrohhrghenucfkphepledurdeihedrfeegrdeffeenucfrrghrrghmpehmrghilh
 hfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtgho
 mhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:L_iEXRJ4BxNdUv0XU0jIMUvglHY4tpaMs75F21eMEZMn-_ihz0YYBw>
 <xmx:L_iEXX0kTD-_7LXdNnc6FDVlbFvD1dRAnie4kyxWbH5wWf1zrSmrag>
 <xmx:L_iEXQWKL3KAmnNFcguRc1GuQD89R2OPzy0JNrxmtGbEIKCIyzmnEg>
 <xmx:MPiEXcXJ11r5s-2Fm9crpp73RNR49D6yvld830ZahPFoGECxR_OOAw>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3045380063;
 Fri, 20 Sep 2019 12:02:54 -0400 (EDT)
Date: Fri, 20 Sep 2019 18:02:50 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20190920160250.GA8065@mail-itl>
References: <cover.4c97023e719e059ea99137f2cadea319eb87495d.1568475323.git-series.marmarek@invisiblethingslab.com>
 <819398f808613a1109bc06440268b8746e7540d4.1568475323.git-series.marmarek@invisiblethingslab.com>
 <fc4dcc0e-fd7a-a25d-0f6f-b722f6ba8122@suse.com>
MIME-Version: 1.0
In-Reply-To: <fc4dcc0e-fd7a-a25d-0f6f-b722f6ba8122@suse.com>
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
Content-Type: multipart/mixed; boundary="===============7841397798511216656=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============7841397798511216656==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OesXTvlsfeLEOFyS"
Content-Disposition: inline


--OesXTvlsfeLEOFyS
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Xen-devel] [PATCH v6 5/6] xen/x86: add
 PHYSDEVOP_interrupt_control

On Fri, Sep 20, 2019 at 12:10:09PM +0200, Jan Beulich wrote:
> On 14.09.2019 17:37, Marek Marczykowski-G=C3=B3recki  wrote:
> > Allow device model running in stubdomain to enable/disable INTx/MSI(-X),
> > bypassing pciback. While pciback is still used to access config space
> > from within stubdomain, it refuse to write to
> > PCI_MSI_FLAGS_ENABLE/PCI_MSIX_FLAGS_ENABLE/PCI_COMMAND_INTX_DISABLE
> > in non-permissive mode. Which is the right thing to do for PV domain
> > (the main use case for pciback), as PV domain should use XEN_PCI_OP_*
> > commands for that. Unfortunately those commands are not good for
> > stubdomain use, as they configure MSI in dom0's kernel too, which should
> > not happen for HVM domain.
>=20
> Why the "for HVM domain" here? I.e. why would this be correct for
> a PV domain? Besides my dislike for such a bypass (imo all of the
> handling should go through pciback, or none of it) I continue to
> wonder whether the problem can't be addressed by a pciback change.
> And even if not, I'd still wonder whether the request shouldn't go
> through pciback, to retain proper layering. Ultimately it may be
> better to have even the map/unmap go through pciback (it's at
> least an apparent violation of the original physdev-op model that
> these two are XSM_DM_PRIV).

Technically it should be possible to move this part to pciback, and in
fact this is what I've considered in the first version of this series.
But Roger points out on each version[1] of this series that pciback is
meant to serve *PV* domains, where a PCI passthrough is a completely
different different beast. In fact, I even consider that using pcifront
in a Linux stubdomain as a proxy for qemu there may be a bad idea (one
needs to be careful to avoid stubdomain kernel fighting with qemu about
device state).

Roger, what is the state of Xen internal vPCI? If handling PCI
passthrough in Xen (or maybe standalone emulator), without qemu help is
going to happen sooner than later (I guess not 4.13, but maybe 4.14?),
then maybe this whole patch doesn't make sense as a temporary measure?

Anyway, if you all agree that pciback should be the way to go, I can go
that route too. In practice, it would be a flag (set by the toolstack?)
allowing writes to appropriate config space registers directly (with
appropriate checks, as in this patch).

[1] https://lists.xenproject.org/archives/html/xen-devel/2019-08/msg00486.h=
tml

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--OesXTvlsfeLEOFyS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl2E+CoACgkQ24/THMrX
1yxJTwf/VZTOlZ1rdJhMexjCTXG6rMtSeaphh9rTwXJ5Bns1x6PpQqOiMSWOjNTE
04SiAZJ44Q3IcME6VISXUeetCfOj7wAYHOrykrFW9mzr4U5yN968mu/6a3nIYkQt
WGx08br0QJ8ka6C+NxtrH8jH0GBb2Je7j2rzka9T/BlwUgfpBr7TEejcOcoI9s2s
i4xfRkj2wo4DakB/zvybxHQw8lBl2PMtLrlihJz5urjXSxGF1MWYXsqvL+uJqRFJ
CAmI6to03CUXFKUvRTdYKv23l6YmUWKv4BGs4YweXossOjCyl3vaa01PZ6H4H6mF
Fuh7RZKOmYtNTf8hmbATcEyNxC6SBQ==
=O7kD
-----END PGP SIGNATURE-----

--OesXTvlsfeLEOFyS--


--===============7841397798511216656==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7841397798511216656==--

