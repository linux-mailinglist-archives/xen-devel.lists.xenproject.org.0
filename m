Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 43FFC1668A
	for <lists+xen-devel@lfdr.de>; Tue,  7 May 2019 17:21:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hO1so-0000gf-Gq; Tue, 07 May 2019 15:19:54 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=vvNG=TH=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1hO1sm-0000gX-MX
 for xen-devel@lists.xenproject.org; Tue, 07 May 2019 15:19:52 +0000
X-Inumbo-ID: 8e6396a4-70db-11e9-b911-f72f26adfb74
Received: from out4-smtp.messagingengine.com (unknown [66.111.4.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8e6396a4-70db-11e9-b911-f72f26adfb74;
 Tue, 07 May 2019 15:19:50 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id CEA8522237;
 Tue,  7 May 2019 11:19:49 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Tue, 07 May 2019 11:19:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=3DYDQU
 J4FuhD5FK/7/1v9yO6bDPcHrEjkMSYA0UbI5w=; b=x4HuWXGFG8z1mW9lmoEdT0
 xavICydNIo/VQq12AoEKAf2l0dnLMuTkir8uAerxB8y7sU7x2LoGIr/NHJYWZSKV
 lyMxcHcX1Z2WRdcejPMPDZVbmh2TUV45TNZ/p/0cnpF6DySHCibwvzKMYzTtt7T3
 g+ObXZhRBOhyb3/xhF0MsiMZv2e0SWuCjhnh1uYmBeOhhdW4aI0ChzmUOFLL6/X0
 DVOo+YcWqaLZPTDyB1p/YCslmF6FdwYzZHhaEAr161RiAKs+NeSLGg/lvIph+U1I
 gXnG9oxegs68ObGYzcMMqCMsKprNMxL2Ol1H8+EFs5SAqzGhmZTCzqo8CaUsLmsw
 ==
X-ME-Sender: <xms:FaLRXO_xO4wcRyqK7odxXzgNFRlkKMS0KbH0OGp_DC4sC6pgdswUUA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrkedtgdelvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujggfsehgtderredtreejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihcuoehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthh
 hinhhgshhlrggsrdgtohhmqeenucfkphepledurdeihedrfeegrdeffeenucfrrghrrghm
 pehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslh
 grsgdrtghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:FaLRXP8wDIfj0bp4ZzVt7gq5sLbFKjBFlFUITG_v_Uy3kKAUConxIQ>
 <xmx:FaLRXBFUXFx5bdLh8R6k5jxxdMsrZPliDdoUzbUEe0iBpHdOXC5dWQ>
 <xmx:FaLRXJcTp1egFomkA6EzyE_0DER7naJcIfdLYD7fMkG0zlI6mPT3Vw>
 <xmx:FaLRXH4bqpEJ6D1AIHbfGMW845GssirKGaFZjSoiQhERQ11nSomZXA>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id B4CC4103C8;
 Tue,  7 May 2019 11:19:47 -0400 (EDT)
Date: Tue, 7 May 2019 17:19:45 +0200
From: Marek Marczykowski <marmarek@invisiblethingslab.com>
To: Jan Beulich <JBeulich@suse.com>
Message-ID: <20190507151945.GZ1502@mail-itl>
References: <cover.5027956268821f50401d0ecdfad2447cbe4fdd6c.1557154206.git-series.marmarek@invisiblethingslab.com>
 <cover.5027956268821f50401d0ecdfad2447cbe4fdd6c.1557154206.git-series.marmarek@invisiblethingslab.com>
 <e54979f9ce16c254c78e4a48e3e5c0eb223f6dac.1557154206.git-series.marmarek@invisiblethingslab.com>
 <5CD13D6C020000780022C5CA@prv1-mh.provo.novell.com>
MIME-Version: 1.0
In-Reply-To: <5CD13D6C020000780022C5CA@prv1-mh.provo.novell.com>
User-Agent: Mutt/1.11.1+94 (9b965fac) (2019-01-05)
Subject: Re: [Xen-devel] [PATCH 1/5] xen/bitmap: fix bitmap_fill with
 zero-sized bitmap
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============4590294856483203615=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============4590294856483203615==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dA3KA1Bq6vhZBZVs"
Content-Disposition: inline


--dA3KA1Bq6vhZBZVs
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 07, 2019 at 02:10:20AM -0600, Jan Beulich wrote:
> >>> On 06.05.19 at 16:50, <marmarek@invisiblethingslab.com> wrote:
> > Found while debugging framebuffer located above 4GB. In that case 32bit
> > variable for it overflows and framebuffer initialization zeroed
> > unrelated memory. Specifically, it hit mbi->mods_count, so later on
> > bitmap_fill(module_map, mbi->mods_count) in __start_xen() crashed.
>=20
> The origin of your problem being a truncation one, it seems pretty
> clear to me that if we want to be able to gracefully handle that,
> then we need to stop using plain int in all the involved functions.
> I'm curious though which bitmap_fill() it was that you saw misbehave:
> There's no such call at all in xen/drivers/video/, and I'm also having
> a hard time seeing how the address (rather than the size) of the
> frame buffer could be involved here.

Truncated framebuffer address (0x0) caused memset() in vesa_init() to
zero (among other things) mbi->mods_count. This triggered the crash as
described above.
Obviously, bitmap_fill() crash was just a fallout here, not the root
cause.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--dA3KA1Bq6vhZBZVs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlzRohEACgkQ24/THMrX
1yzPsggAj2gO+ZICqYmXZHyVYEJVYaNpJjFeTvJ/yLeON6OhXQJf0a4179QMEN7t
e4KzfZR6tNSm9Tu4QDsoxn942Qzq98G7P2jg4X4/b6IDUBckB1jQ/sJJAhy/SZSc
/PaQBOH4Rb/cLlSPt4dc5sKMVEI7wdamqcb8tJBxIXsOwSFdHJdcByuQs9p/TCHj
yjAzia/+Be1WZOBW/SHf/j/On7G53VbxhxLPLca8oOllY02wkOM5ath3vcdvGuba
VngNWkFiqhtuv3uZSc+V5MzCCsa0WZBw88gobuwSYp5B9hBrL13EbaLh18iBnoxv
H+O4wv8dVyvIPrCsQHFtsuiJXeYalQ==
=Psk7
-----END PGP SIGNATURE-----

--dA3KA1Bq6vhZBZVs--


--===============4590294856483203615==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4590294856483203615==--

