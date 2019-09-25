Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 11892BDE1B
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 14:34:02 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD6QX-0003kM-S6; Wed, 25 Sep 2019 12:29:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=CquU=XU=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1iD6QW-0003kH-4f
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 12:29:48 +0000
X-Inumbo-ID: 2952c7c0-df90-11e9-97fb-bc764e2007e4
Received: from new4-smtp.messagingengine.com (unknown [66.111.4.230])
 by localhost (Halon) with ESMTPS
 id 2952c7c0-df90-11e9-97fb-bc764e2007e4;
 Wed, 25 Sep 2019 12:29:47 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id 203E3269D;
 Wed, 25 Sep 2019 08:29:47 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Wed, 25 Sep 2019 08:29:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=JSG8O2
 ilh5D2k+hwZl8oJGrGbASPAU0xKpdhiG4rGJk=; b=LEbX+0Q+jTNUSSvmyzSTO5
 nAwmmoj+6AL6RaJxRkYOtP9mOAJzflL1L3Jn5QgpNj3cHqR4OfMXHWdtV0ZQfKpd
 bL5TsBT7S0kGJPJYegaia3Ehn+uRfYnkzXLKRXSQJL25DwnSqC0Yf4SD6fBdEmrI
 qO0fNqQKm+odWvBLnXJZ73E6OKnifSsCvxTqSH171wvFIayA866/TC7ayl5oJ77l
 eT9UtxdsI5802GeyRvhwcHoZIqq3s4NLJYYTPkJDgprp58TSwRoFzVtBfeDAfkQX
 9QmkEDRLKwnNLRrID3T3HQ4zE/C9xhQByWdbKcilPZPWNGJnr9+6LISNHAny5gPg
 ==
X-ME-Sender: <xms:uV2LXUb4KByo2Sgi-ISMBSGRlmpqAVNvXScxcQz8qH7YAdZrXmA1pg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrfedvgdehfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
 ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
 hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecukfhppeeluddrieehrdefgedrfeef
 necurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvg
 hthhhinhhgshhlrggsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:uV2LXfh5EM_zXlkwdys8nBZ_zItFRd8uybfXo7295Ui9Gx4rfnCpAQ>
 <xmx:uV2LXcwcD3P6CP4nLmcIIHPc-OxfHH6aPzliHuxRtktGPBRXzKL14g>
 <xmx:uV2LXS7KU5k91SIYPNkTA-qRUANeTG3auNOyEpS6-Zy16h9ACKgYAQ>
 <xmx:u12LXbFUNPOQgT_kTPQTfOgw5odwaG0icudPQ7YF60ETRzB5BN19KA>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id D3010D6005E;
 Wed, 25 Sep 2019 08:29:43 -0400 (EDT)
Date: Wed, 25 Sep 2019 14:29:41 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Message-ID: <20190925122941.GP8065@mail-itl>
References: <cover.e819a32509fb1a6bdcbdcefb2de053ccf2361d59.1569379186.git-series.marmarek@invisiblethingslab.com>
 <7d011094eed3f5c3cf6971cc8760874fd56ca443.1569379186.git-series.marmarek@invisiblethingslab.com>
 <20190925094150.qibuqwj6nynjo6vi@Air-de-Roger>
MIME-Version: 1.0
In-Reply-To: <20190925094150.qibuqwj6nynjo6vi@Air-de-Roger>
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
Content-Type: multipart/mixed; boundary="===============1454282017460384104=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============1454282017460384104==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KsUBxXnnTURmGdap"
Content-Disposition: inline


--KsUBxXnnTURmGdap
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v7 4/4] xen/x86: Allow stubdom access to irq created for
 msi.

On Wed, Sep 25, 2019 at 11:41:50AM +0200, Roger Pau Monn=C3=A9 wrote:
> It would still be nice to get the missing bits (interrupt enabling),
> or else this patch is kind of pointless, since it still doesn't allow
> stubdomains to work correctly with passed through devices.

Well, that part, as discussed, doesn't need to be in Xen. For example
the solution deployed in current Qubes stable version is based on
pciback for this purpose.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--KsUBxXnnTURmGdap
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl2LXbUACgkQ24/THMrX
1yxH6wgAjHX7EDg4ZKp+g7vYjcaIfSFYE/9MSJ9l+1ztLU69a4m+gtyLWtVqmaUe
8CWnGhWHaiX/Wd0g4tDuKWxG+eqpPWhOr9fgeyqORrfhMvW7mso6/QTw0J/yFcVl
QZ4mHcvDZOlGG+9KtqlEvzwSbBj0f2k3tfETr3xPAnAKkl4Ja6HWV8Wy2h1Gy+CU
/BEEG9A/fCFpvPIBAPL6g3mFzJhPOGR71+hYBAYwHhDtEB6er22iek2Wu05H29Qi
fUOBIu81GjsM3RuHsoju/LKJuTokHLrPOJgLjwToqmLJ5qbO4AMuHifTT+8cMI8r
56Nlg2N0fbA5urdzkORCRE1X5m0K9A==
=YPrw
-----END PGP SIGNATURE-----

--KsUBxXnnTURmGdap--


--===============1454282017460384104==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1454282017460384104==--

