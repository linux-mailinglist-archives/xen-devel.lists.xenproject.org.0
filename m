Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D80D514D
	for <lists+xen-devel@lfdr.de>; Sat, 12 Oct 2019 19:12:17 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iJKtc-00054U-EW; Sat, 12 Oct 2019 17:09:36 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=QqvL=YF=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1iJKta-00054K-9t
 for xen-devel@lists.xenproject.org; Sat, 12 Oct 2019 17:09:34 +0000
X-Inumbo-ID: 0e60cb3e-ed13-11e9-9353-12813bfff9fa
Received: from out3-smtp.messagingengine.com (unknown [66.111.4.27])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0e60cb3e-ed13-11e9-9353-12813bfff9fa;
 Sat, 12 Oct 2019 17:09:31 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id DBB662151C;
 Sat, 12 Oct 2019 13:09:30 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Sat, 12 Oct 2019 13:09:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=ry6FzF
 cH+1u/3//QSthnqc++rPxW6XAr6zDUQf2YMSA=; b=B5nycedr8iW0lDr7tR93aL
 JwORE6QZep9KZguUd1AO8HDWgmD4WgE7ftjg8CXpiT28YZtGxrTECRWr5p/8j1l6
 SqtaLak5HboGYkd1IZ8YnlozYvV3XXNeUJSoawHkyu9dYMVbWBBQ5NyE/Gmc6q7A
 b6O0dwK8kncGRCccCjq1QVMTr7uuEkfWv/ybKF9WhmwisA91MMEjKzJZCwPAT6/y
 eZJNMM2pctokzussbbjQZUEIRg14xsgSRdnHtQdFzOjEM/J6fkESPLDe0vDMQlG0
 SWammGpVgNwswyXYI95BV+76/Y20OUU1ejvprGG20Z1VkvV1qrkcfAu7FNPnXPYQ
 ==
X-ME-Sender: <xms:ygiiXc2elfrMLFO_iaimYg6m1S8nVfuEeGCI-UhqYEaUSYJk7KXrAg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrieejgdduuddtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucfkphepledurdeihedrfeegrdef
 feenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslh
 gvthhhihhnghhslhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:ygiiXaQoMGbFxVeMdcnf3FpebRqJf1FYrsiLh-M7XUp1OUZahTtCtQ>
 <xmx:ygiiXbu7Ye_sTnNFfFVIVSmRv8K1mE-o97yOdQcKj-dOmU3SI8AirQ>
 <xmx:ygiiXa4NPJNHO96wWtmyED8yB9V_tCOPewRdft4jqf_vHOyph-T8GQ>
 <xmx:ygiiXWHE721QAgRu7AlZtkZRrY5VHCvDC5kNfbUW3v79ySogRUIU-g>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0515CD6005E;
 Sat, 12 Oct 2019 13:09:28 -0400 (EDT)
Date: Sat, 12 Oct 2019 19:09:25 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20191012170925.GC28966@mail-itl>
References: <cover.39cf5c05f6ef01e3793327a459cad5d884dc0a9c.1570890895.git-series.marmarek@invisiblethingslab.com>
 <bf29c0ca9c1622e980883f11030e21f013312d3e.1570890895.git-series.marmarek@invisiblethingslab.com>
 <272a9354-bcb4-50a4-a251-6a453221d6e3@citrix.com>
 <20191012170040.GB28966@mail-itl>
MIME-Version: 1.0
In-Reply-To: <20191012170040.GB28966@mail-itl>
Subject: Re: [Xen-devel] [PATCH v2 2/2] xen/efi: optionally call
 SetVirtualAddressMap()
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
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Content-Type: multipart/mixed; boundary="===============6156308284445187312=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============6156308284445187312==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XWOWbaMNXpFDWE00"
Content-Disposition: inline


--XWOWbaMNXpFDWE00
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 2/2] xen/efi: optionally call SetVirtualAddressMap()

On Sat, Oct 12, 2019 at 07:00:43PM +0200, Marek Marczykowski-G=C3=B3recki w=
rote:
> On Sat, Oct 12, 2019 at 05:29:34PM +0100, Andrew Cooper wrote:
> > On 12/10/2019 15:36, Marek Marczykowski-G=C3=B3recki wrote:
> > > SetVirtualAddressMap() can be called only once,
> >=20
> > True.
> >=20
> > > hence it's incompatible with kexec.
> >=20
> > Most certainly not.
> >=20
> > Linux unconditionally enters virtual mode, citing a huge slew of EFI
> > firmware bugs, and is perfectly capable of kexec-ing on the resulting
> > systems.
> >=20
> > This is how Xen should behave as well, and I suspect it will have a
> > marked improvement on our ability to actually boot on EFI systems.
> >=20
> >=20
> > Now - it may be true that Xen is missing some piece of plumbing to allow
> > kexec in virtual mode to work, and that is a fine reason to leave a note
> > in the text of an EXPERT option noting what what is/isn't expected to
> > work (and what may or may not have been tested).
> >=20
> > > For this reason, make it an optional feature, depending on
> > > !KEXEC.
> >=20
> > This presupposes (at Xen's build time) that a kexec'd kernel is going to
> > want/need to use runtime services.=C2=A0 I'm not convinced this is
> > universally true,
>=20
> In fact, as it turned out in the discussion, right now it definitely
> can't, as it doesn't get runtime services table (or efi system table or
> any other info required for this). So, it looks like it should read "it
> might be incompatible with some future Xen implementation of kexec".

Specifically, dependency on !KEXEC isn't needed right now.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--XWOWbaMNXpFDWE00
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl2iCMUACgkQ24/THMrX
1ywRVQf9HRlV2Da2Frq6SwFwqpBcUz4pqamB2fQQDRhYAagHFSOq+WFx73Vamx2+
zHAv+1W/sXcWC1rCmNPpvyPN4+0KiLQ08hwSdO9G4dHPtXmiiII+6hbgGkWC+QIz
bWMMUjhe+5CCYN+HdtUg64UZ/YLHhZ80Eu11PHiJCVTTjIF0ubs2/UW/rzBMdYL5
Nfo4CsRj38NnMDd3ibNn6ygjyhnWUs4BxgdptgDsTPhp88gwP/FKV3zOi5se8vEL
kT44uvq7ywdXl69OEkbn5AIc+JYbetggaZOKXQ3TlLi5MJR9lxHqHdPO/RPT9Sh0
e1hvMfXw/HRNtvMhSRC6H1pDIPVbFA==
=+rfJ
-----END PGP SIGNATURE-----

--XWOWbaMNXpFDWE00--


--===============6156308284445187312==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6156308284445187312==--

