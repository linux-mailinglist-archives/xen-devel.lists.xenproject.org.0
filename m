Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 23176D0D59
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2019 13:04:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iI9iG-0005kE-HY; Wed, 09 Oct 2019 11:01:00 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RT5Q=YC=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1iI9iE-0005k9-6w
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2019 11:00:58 +0000
X-Inumbo-ID: 11cd7b8c-ea84-11e9-97ed-12813bfff9fa
Received: from wout4-smtp.messagingengine.com (unknown [64.147.123.20])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 11cd7b8c-ea84-11e9-97ed-12813bfff9fa;
 Wed, 09 Oct 2019 11:00:57 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id D372835B;
 Wed,  9 Oct 2019 07:00:55 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Wed, 09 Oct 2019 07:00:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=RPljAu
 t/zVYIWrkwMX/1AYgcti6WZj3X1qrAEQysqDU=; b=thz0PfkZ6vBk9/AYhaU+O2
 78gmimUeju3I7Ke9X+en1yphjzG6r9OLQXQ2EW/Lu7XAvRE77XfSUSBMGzeqp8ej
 Z0UB1ielGggrB0evvdMdAFTU1PwGjz5zmKKm34DCzLxBl0I8xqfS0a26lyS1lJPe
 6i01NCc2sWdnabBLOtN0iQf2zH+x5tDPfR6+TyzUh7WyWSVPL+UJxkGCcQzGUlQM
 ziw30pDd71K+eccU8tnLKc5+o4rzVQGebERLoChanjNbMiwj0COkO8uVpBWDOxw5
 kAIMpLoqPt0WjSW8VKZidHNK7JJi115YFMAIa9kkilzE3J0rexxZLgUlEBoNXUsw
 ==
X-ME-Sender: <xms:572dXeyq90PgOIOzvVN0vPgKcBvdYtx8IFSY8kWC5VKf9RMgpbycWw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedriedugdduudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
 ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
 hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecukfhppedukeekrddugeejrdduudef
 rddvfeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhish
 hisghlvghthhhinhhgshhlrggsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:572dXVPtwzzvd8TQChwc4BhHPbRBj5tg_OYOzTp_nA6-WV_LPAPHLg>
 <xmx:572dXfUUMbdBS8INWlT5NthmJu6wwkM-99Ef5uU4bEv-cHH4XcyOtg>
 <xmx:572dXZ0OZN9DyUq4bxEbziXEh9hyisUZG1RnY8e4ADi7692wIi4ImA>
 <xmx:572dXUI6Zakmx0fe_dvJRvb8a_0BHf_tLscPx87ZqxFKiP0B1EvU-w>
Received: from mail-itl (188.147.113.233.nat.umts.dynamic.t-mobile.pl
 [188.147.113.233])
 by mail.messagingengine.com (Postfix) with ESMTPA id 29C188005C;
 Wed,  9 Oct 2019 07:00:54 -0400 (EDT)
Date: Wed, 9 Oct 2019 13:00:51 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191009110051.GP8065@mail-itl>
References: <20190808025321.GF3257@mail-itl>
 <36989497-d4d5-a9b3-7de1-8ebb3582cd0a@suse.com>
 <20191008115014.GI8065@mail-itl>
 <d7974227-0a42-c86c-d87e-18ce3168cd59@suse.com>
 <20191008135252.GK8065@mail-itl>
 <3251752c-117b-7a71-88ef-18e49aa63329@suse.com>
 <20191008162922.GL8065@mail-itl>
 <815f3cbc-22c3-5a02-429b-0cdf12d84917@suse.com>
 <20191009103153.GO8065@mail-itl>
 <13c61616-25eb-019d-75fd-7ac72f8bf133@suse.com>
MIME-Version: 1.0
In-Reply-To: <13c61616-25eb-019d-75fd-7ac72f8bf133@suse.com>
Subject: Re: [Xen-devel] Xen 4.12 panic on Thinkpad W540 with UEFI mutiboot2,
 efi=no-rs workarounds it
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
Cc: Juergen Gross <jgross@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============3362509467736602357=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============3362509467736602357==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IJVQSCEsm6ceb9tV"
Content-Disposition: inline


--IJVQSCEsm6ceb9tV
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Xen-devel] Xen 4.12 panic on Thinkpad W540 with UEFI mutiboot2,
 efi=no-rs workarounds it

On Wed, Oct 09, 2019 at 12:50:09PM +0200, Jan Beulich wrote:
> On 09.10.2019 12:31, Marek Marczykowski-G=C3=B3recki  wrote:
> > On Wed, Oct 09, 2019 at 10:56:56AM +0200, Jan Beulich wrote:
> >> On 08.10.2019 18:29, Marek Marczykowski-G=C3=B3recki  wrote:
> >>> On Tue, Oct 08, 2019 at 04:19:13PM +0200, Jan Beulich wrote:
> >>>> On 08.10.2019 15:52, Marek Marczykowski-G=C3=B3recki  wrote:
> >>>>> In Linux case, it looks like it passes around the EFI memory map us=
ing
> >>>>> some Linux-specific mechanism, but I don't find it particularly
> >>>>> appealing option.
> >>
> >> ... that this would require Xen following a Linux protocol.
> >> This is nothing that can work building on EFI interfaces alone.
> >=20
> > Actually, there is something that could be used: presence of boot
> > services. If the call to SetVirtualAddressMap() is bound to initial
> > presence of boot services, then it surely won't happen after kexec, as
> > boot services are not available anymore. In fact the patch I've sent
> > does exactly that - call SetVirtualAddressMap() directly after
> > ExitBootServices(), but I've realized this property only now. In this
> > case, maybe kconfig option is not needed anymore?
>=20
> I'm unaware of a property telling an EFI application whether
> boot services are available. By the definition I know they're
> available up and until ExitBootServices() gets called.

Regardless of how it is done, calling SetVirtualAddressMap() directly
after ExitBootServices() should be fine. If for some reason Xen would
try to call ExitBootServices() when boot services are already gone, it
is a bug elsewhere (and probably will crash Xen before it event gets to
SetVirtualAddressMap() call). I'm simply relying on this property,
regardless of how it is technically done.

> > BTW How runtime services work after kexec? I don't see EFI handles
> > handed over kexec, are they somehow re-discovered?
>=20
> What EFI handles are you talking about? For runtime services
> what a consumer needs is a table pointer, which is a field
> in the system table, which in turn is an argument passed to
> the EFI application's entry point.

Yes, I'm talking about those pointers (system table specifically).

> I didn't think there are
> provisions in the spec for either of these pointers being NULL.

But I don't see kexec using EFI application entry point. Am I missing
something?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--IJVQSCEsm6ceb9tV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl2dveAACgkQ24/THMrX
1yyJaAf6AkQKWuWSZ0Nc0RPc4dqgg6/9nQOaRg8lvcgq9LiEgYsIRLRDaxKkydzY
Dqev0Rtz5cYBupiatBsFi/4JWpA+y8Afu71dWWsqN2ItCLvpXO4vRHLccY/R0EF5
QtYWzZg0zlqFYOaHMzcSrs8BszCTBwDDGf1C1n4a6zUy4vrcSyBgvM4DTvc7OFXN
TcOCu+/Gcp6Jcg4b1w4ju2DY991BDdSNOBTO8aHxcgBNHdBSyUOUlpKdfWK5RtgV
SVJaf+hlgPr25/IqlWjhbn6gCkyeS6brx6x1xszEwc21dA9/U8fi8Z7ttc6KYyg6
uL+B6186+CWSObA30A+JZ7NjRa71qA==
=6hLi
-----END PGP SIGNATURE-----

--IJVQSCEsm6ceb9tV--


--===============3362509467736602357==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3362509467736602357==--

