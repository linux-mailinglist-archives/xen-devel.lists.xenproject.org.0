Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE56E20D5
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 18:40:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNJeZ-0006Ri-MK; Wed, 23 Oct 2019 16:38:31 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bla1=YQ=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1iNJeX-0006RY-QB
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 16:38:30 +0000
X-Inumbo-ID: 8a5a5aea-f5b3-11e9-9487-12813bfff9fa
Received: from out3-smtp.messagingengine.com (unknown [66.111.4.27])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8a5a5aea-f5b3-11e9-9487-12813bfff9fa;
 Wed, 23 Oct 2019 16:38:28 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id E0B1121D73;
 Wed, 23 Oct 2019 12:38:27 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Wed, 23 Oct 2019 12:38:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=eq8yIQ
 PMKPa8F4CHBTzzE0yxH42p+yr6pp4J8ewZaV8=; b=bEn11u9eV7su03HiBuwFEW
 YqCwtKH8QrvlgPrLfD7zU1d96nl0mDSyEKTpBbMq0A6gIsNZSHadmvf2MIoh4kQm
 jdzHLjeLIA4OeIoS6E66G3bkdlwGMlPo7OKjS0ipltdIAfPpJ3dZz54bpM8/u5Qb
 CjQaW+v5VksdpipH0b88sqbblMGi7hwgcajVSJyxYQIROCXgiY0MvUMM8EMh1zPr
 67cYdKAZmdIcCikgkSlh55ap8Xp9+OYt72Flxv9+/o3NXl/jR/uxEy9MSqoh6MoM
 9Rg9nJvmwIKu+vR+Q8tSHO77bw4BdZNf/aaT6oFu27U+7Yyjz6k8rntEx4AgS/1A
 ==
X-ME-Sender: <xms:A4KwXZs38xcnUOsKLOX_ttos4nCfht7BFO7E9CiWyqbsafuIDu_2tw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrkeelgddutdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucfkphepkeefrdeljedrvdefrddv
 leenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslh
 gvthhhihhnghhslhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:A4KwXYBOGxd_3Ny9ifg4Kxgj4pBmiMG3O2Y53yfVUgpCt2fBnFOIzQ>
 <xmx:A4KwXWX0eNFQh8ZJ6G7P7L29x7jSubaeQFzBDq3pebSkF2krhdPbOA>
 <xmx:A4KwXRELtZ5FmHNqlRDLnVBh_s-aVz3AdvZuGkY-MQ2h2dpLM4uRiQ>
 <xmx:A4KwXU-v1y45H7yR9clt_vMR3iUdR2B0yi2fh-LWtawOG_yM8u4pig>
Received: from mail-itl (unknown [83.97.23.29])
 by mail.messagingengine.com (Postfix) with ESMTPA id 26CB98005A;
 Wed, 23 Oct 2019 12:38:25 -0400 (EDT)
Date: Wed, 23 Oct 2019 18:38:22 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191023163822.GK1410@mail-itl>
References: <20191023153643.GI1410@mail-itl>
 <d7e16767-94ef-a83c-3995-3f991c54c69d@suse.com>
MIME-Version: 1.0
In-Reply-To: <d7e16767-94ef-a83c-3995-3f991c54c69d@suse.com>
Subject: Re: [Xen-devel] [PATCH v3 1/2] efi: remove old
 SetVirtualAddressMap() arrangement
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
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
 Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: multipart/mixed; boundary="===============3721512083681088923=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============3721512083681088923==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="yr/DzoowOgTDcSCF"
Content-Disposition: inline


--yr/DzoowOgTDcSCF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 1/2] efi: remove old SetVirtualAddressMap() arrangement

On Wed, Oct 23, 2019 at 06:10:55PM +0200, Jan Beulich wrote:
> On 23.10.2019 17:36, Marek Marczykowski-G=C3=B3recki wrote:
> > No, it still setup 1:1 page tables for the runtime calls, exactly as it
> > was before.
>=20
> But the "physical" is no longer correct.

Ok, I'll add it to the other patch (as it is where UEFI is informed it
isn't "physical").

> > This is also why I don't need to adjust efi_rs.
>=20
> Well, you may not _need_ to with the current code structure, but I
> wonder if you better would. In fact I wonder whether the #ifdef
> around the line further up shouldn't have been removed already
> (and hence that's what you want to do): Take the processing of
> XEN_EFI_query_variable_info - it could do the version check
> outside of the efi_rs_{enter,exit}() region if efi_rs was properly
> relocated. Right now it's a requirement to make all accesses to
> efi_rs within such regions.

Right, this could be a further improvement. But given the conditional
nature of this patch series for 4.13, I'm not sure if it should be done
here. I can post it as a separate patch and let you/Juergen decide
whether commit it to 4.13 or next.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--yr/DzoowOgTDcSCF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl2wgf0ACgkQ24/THMrX
1ywTRgf9FDWy/r7xOs3hNB079RjQXzeMHtl+K3mcD/Ks6zlpAHZ0iKk2UyJe2Ct1
0fMFOlgINH7lBMPK5UmISOKKy38LRXGbKnEtJe8GS2XO7IrSQ/cgMcNklL7uzq+I
50YWK9MfqawI1S+1SKbCYyTtoGLwMbX3ubczq8cHkFY+8bqmTg0DA5ydTzy1D5MK
1ib2OR3TSkRdzLJDRg+0s7PZ3O9WhUdttK+zJ5lDgCmUT2pfTjJtmxWhWcKH0xUK
W8J5+bBb96SPFDi/OF8xE+ExxWlaxtBbWcd79VjvjfhPmoX6iVGYIfU274cm211f
Ci2yepoQuuoIsPpgCAm5wezs7xpxow==
=/dS5
-----END PGP SIGNATURE-----

--yr/DzoowOgTDcSCF--


--===============3721512083681088923==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3721512083681088923==--

