Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97CFABB531
	for <lists+xen-devel@lfdr.de>; Mon, 23 Sep 2019 15:27:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iCOK9-0000AC-AJ; Mon, 23 Sep 2019 13:24:17 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dYCr=XS=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1iCOK7-0000A7-Qi
 for xen-devel@lists.xenproject.org; Mon, 23 Sep 2019 13:24:15 +0000
X-Inumbo-ID: 70148ef0-de05-11e9-95fc-12813bfff9fa
Received: from new1-smtp.messagingengine.com (unknown [66.111.4.221])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 70148ef0-de05-11e9-95fc-12813bfff9fa;
 Mon, 23 Sep 2019 13:24:14 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailnew.nyi.internal (Postfix) with ESMTP id 9FB26109C;
 Mon, 23 Sep 2019 09:24:14 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Mon, 23 Sep 2019 09:24:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=g/0qaV
 Ps7oAvn4vs5YoWK5WDpsu93E640frFQkZmLcM=; b=dnas+H2sWP4HUnlKH5NblP
 mHGWyASX82Aa0+fYlJjFEuVK3VkUgio0wN2BpYnxnlNwVea4p7Wzkl3FopTsto4D
 emKtY0rzn1RupeINl/eeDZkroKACK/gC+gEYGcfGvENWZdSXRWOQEY8c/R5V+wPq
 cW5zilbZeQ0foJvYQmMQMRnwRCQ1TAfuMNnkz+zW58+vFlhVE8u5p+eXtHoC1qSr
 Awryft73TyU6rVHIKblFChVlhAS/Hv2b0PDI8ONahoEKkldnc34ANsx8L5+OixSY
 9mWH+LaJXTamvk6Uns3I4MPBwlFhpYXAzvYO9wEcyGYAyIiXFmzi5zF/TDo8GPww
 ==
X-ME-Sender: <xms:fceIXYJN88R1VJS9SIpFTDIfKpz4J0fWKQTqnAPA-wnDIFmhmsxIBA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvdekgdeifecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
 ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
 hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecukfhppeekfedrleejrddvfedrvdel
 necurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvg
 hthhhinhhgshhlrggsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:fceIXULKyoMEQrXZrKAghi65qMB8GbNFa2-U3CBtdqai-NkJh0T3RQ>
 <xmx:fceIXa66qoLX2PWlOUJMx-3NaKXXYrIBL1adzvEKnBx5ymGw6TpKaA>
 <xmx:fceIXWewhTU79YKr8hgU1CnW85YClRrkPzeGxNdyTesrn0gXdkLgNA>
 <xmx:fseIXaViRdc9g7wA1BFzoZUrqZK_no3cH6tbtS8RJvoQUwuZEHgtwA>
Received: from mail-itl (unknown [83.97.23.29])
 by mail.messagingengine.com (Postfix) with ESMTPA id 94B7DD60057;
 Mon, 23 Sep 2019 09:24:10 -0400 (EDT)
Date: Mon, 23 Sep 2019 15:24:06 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20190923132406.GO1222@mail-itl>
References: <cover.4c97023e719e059ea99137f2cadea319eb87495d.1568475323.git-series.marmarek@invisiblethingslab.com>
 <819398f808613a1109bc06440268b8746e7540d4.1568475323.git-series.marmarek@invisiblethingslab.com>
 <fc4dcc0e-fd7a-a25d-0f6f-b722f6ba8122@suse.com>
 <20190920160250.GA8065@mail-itl>
 <7a954000-904d-57aa-2524-5d0c51a8d422@suse.com>
 <20190923104746.GD8065@mail-itl>
 <81326ccd-c27d-d97c-2a20-b39c1f42f5f0@suse.com>
 <20190923122549.GA15942@mail-itl>
 <262d6664-0b0d-77b5-ce17-abafbf3f313c@suse.com>
MIME-Version: 1.0
In-Reply-To: <262d6664-0b0d-77b5-ce17-abafbf3f313c@suse.com>
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
Content-Type: multipart/mixed; boundary="===============3159733420593201144=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============3159733420593201144==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8HhMLSHvAouSipEr"
Content-Disposition: inline


--8HhMLSHvAouSipEr
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Xen-devel] [PATCH v6 5/6] xen/x86: add
 PHYSDEVOP_interrupt_control

On Mon, Sep 23, 2019 at 03:02:49PM +0200, Jan Beulich wrote:
> On 23.09.2019 14:25, Marek Marczykowski-G=C3=B3recki  wrote:
> > What about this: HVM guest can already do all of this when qemu is
> > running in dom0. So, allowing those actions when qemu is running in
> > stubdomain should not introduce _additional_ risks.
>=20
> Well, in a way - yes. But I don't think it's right to have qemu do
> the direct writes it does (and I wouldn't be surprised if there
> were still actual issues with this model). Hence it's not going to
> be an improvement if this suspicious underlying design got
> extended to other components.

This sounds like any workflow involving qemu would be inferior. And I
agree with that. But also I do need PCI passthrough working, so I need a
solution until we have an alternative implementation. If that alternative
is going to happen soon, I'm also fine with carrying patches in Qubes
package (like I already do). This wouldn't be nice for the rest of the
community (I believe many other Xen-based projects also carry similar
patches already), but it looks like upstreaming this is taking way too
much effort than it's worth for a temporary solution.

So, in the next version of this series I'm going to drop this patch (and
the next one).

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--8HhMLSHvAouSipEr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl2Ix3UACgkQ24/THMrX
1yyOzgf+Kad+tmlcbvLGkqUQvI1OYBWeM5pT3agw0ZU1jno5KT3NifrT7j0SlDD8
bliVgO1EBdOSNUBcde6C8sC7NTLX0GQk+ijS66NB+ViphVky9oKNZJqKasvMqPxs
4fnOMUl/roG/pl3yzltaPYHFGRuIwRVkCJnLgBNtfiTTD69IHvW4kerLXoEY3SmH
dp4XjSryreE7FUCDPR8pPavTXZivdmZsAyUpFdh/YYaQ+Yr3rsp4Jp0JQWO/Q1lC
lGfzle+lr1oifV/sjjZ72nm2lXrfCMYIGyqJ+0UjHmGZNb+HO55fRmYp8whsMphW
LhwsmlU8BYCNGiooUont+2z1bXFEHA==
=fFvg
-----END PGP SIGNATURE-----

--8HhMLSHvAouSipEr--


--===============3159733420593201144==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3159733420593201144==--

