Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 562DED04DD
	for <lists+xen-devel@lfdr.de>; Wed,  9 Oct 2019 02:45:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iI01v-00083U-LN; Wed, 09 Oct 2019 00:40:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=RT5Q=YC=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1iI01u-00083P-K0
 for xen-devel@lists.xenproject.org; Wed, 09 Oct 2019 00:40:38 +0000
X-Inumbo-ID: 697ccd58-ea2d-11e9-8c93-bc764e2007e4
Received: from wout2-smtp.messagingengine.com (unknown [64.147.123.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 697ccd58-ea2d-11e9-8c93-bc764e2007e4;
 Wed, 09 Oct 2019 00:40:38 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id CBFA771C;
 Tue,  8 Oct 2019 20:40:36 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Tue, 08 Oct 2019 20:40:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=aGv456
 b7LOi5NeeTBD6AP8TtE9bRQkFKJDgFAOcI6zM=; b=gBtj0qj2M4gb9ISAluEAk6
 FzLGzAFmzjklEtdgMkp6hZcXYQCNq44C4GJRPgJEEo1pOnidpw+eaRPOeCovQp5g
 JESPUfHj0+FTH4B62pWpBfe7ved6iaPScsHpGvsIk1w+v8OeLqcOpR/lhoJstb7J
 wouGxOE1m3DXfeZzSHyDWJZ3a7luOIpJ25K1zU569UASPG1BqKHM/DFY14YgD4Cx
 uVyHqolDK4TQ48eZ8LNyUnEg1Ss2j3sWE8+ViDVOvo1ParxO439iefpjG6QqcK4R
 jHQTkpx1uqnQ/yO18L3oap0RElKr06U35ZsHe1XmdpgYVk0v7Ph+eMzalnuKk5uw
 ==
X-ME-Sender: <xms:gyydXYiBxU0MJRmccTtjUFxP-vlnoQbRq1iBlZ3ow7fagzUQCy3SYg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedriedtgdefiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
 ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
 hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecukfhppeeluddrieehrdefgedrfeef
 necurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvg
 hthhhinhhgshhlrggsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:gyydXRLokyuk525BGlAyVj04tl3REbAcCjv_pQjluIFOp2ArRoN_TQ>
 <xmx:gyydXXgQR4SzvKr6BZPBQx5eWYngwRxtI9PgxD2qUAVmXvjAWzCKBA>
 <xmx:gyydXf1ydBb1e5jPP0_FfbOcFudcFkKnHU0cGqZoYR-fDfQIsHWpLQ>
 <xmx:hCydXe8anO031u3qsv76zJ4nCmLg4782UJ1V0nMqPwlnik4VJWWRBg>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1EF4A8006B;
 Tue,  8 Oct 2019 20:40:35 -0400 (EDT)
Date: Wed, 9 Oct 2019 02:40:32 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191009004032.GM8065@mail-itl>
References: <20190807160451.GB3257@mail-itl>
 <f8f28f3a-0fad-cbd2-44e0-9a0ecf8ac06d@suse.com>
 <20190807192557.GC3257@mail-itl> <20190808025321.GF3257@mail-itl>
 <36989497-d4d5-a9b3-7de1-8ebb3582cd0a@suse.com>
 <20191008115014.GI8065@mail-itl>
 <d7974227-0a42-c86c-d87e-18ce3168cd59@suse.com>
 <20191008135252.GK8065@mail-itl>
 <3251752c-117b-7a71-88ef-18e49aa63329@suse.com>
 <20191008162922.GL8065@mail-itl>
MIME-Version: 1.0
In-Reply-To: <20191008162922.GL8065@mail-itl>
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
Content-Type: multipart/mixed; boundary="===============7264324829606796482=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============7264324829606796482==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6q+u6D6tObQc8sPg"
Content-Disposition: inline


--6q+u6D6tObQc8sPg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Xen-devel] Xen 4.12 panic on Thinkpad W540 with UEFI mutiboot2,
 efi=no-rs workarounds it

On Tue, Oct 08, 2019 at 06:29:27PM +0200, Marek Marczykowski-G=C3=B3recki w=
rote:
> On Tue, Oct 08, 2019 at 04:19:13PM +0200, Jan Beulich wrote:
> > On 08.10.2019 15:52, Marek Marczykowski-G=C3=B3recki  wrote:
> > > Regardless of SetVirtualAddressMap() discussion, I propose to
> > > automatically map boot services code/data, to make Xen work on more
> > > machines (even if _we_ consider those buggy).=20
> >=20
> > I remain on my prior position: Adding command line triggerable
> > workarounds for such cases is fine. Defaulting to assume buggy
> > firmware is acceptable only if this means no extra penalty to
> > systems with conforming firmware. Hence, for the case at hand,
> > I object to doing this automatically; we already have the
> > /mapbs workaround in place to deal with the case when xen.efi
> > is used. Judging from the title here there may need to be an
> > addition to also allow triggering this from the MB2 boot path.
>=20
> What about mirroring Linux behavior? I.e. mapping those regions for the
> SetVirtualAddressMap() time (when enabled) and unmapping after - unless
> tagged with EFI_MEMORY_RUNTIME?=20

Oh, even better: I can call SetVirtualAddressMap() while still in 1:1,
just after ExitBootServices(), giving it 1:1-like map (for areas marked
with EFI_MEMORY_RUNTIME). This way I don't need to really map BootServices
areas (and exclude from Xen memory allocator), so there is no penalty
for systems with conforming firmware. And indeed calling
SetVirtualAddressMap() is enough for other runtime services (like
GetVariable*) to behave correctly, even if boot services are not mapped
anymore.
So, the only downside is incompatibility with kexec.

> Similarly to Andrew, I'd really prefer for Xen to work out of the box,
> with as little as possible manual tweaks needed.

> > Allowing SetVirtualAddressMap() when !KEXEC would be fine with me.
> > The fly in the ointment here is that we'd prefer not to have such
> > Kconfig options (at least not without EXPERT qualifier), as
> > (security) supporting all the possible combinations would be a
> > nightmare. If an EXPERT dependency is okay with you, then I'll be
> > looking forward to your patch.
>=20
> EXPERT is fine with me.


--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--6q+u6D6tObQc8sPg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl2dLH8ACgkQ24/THMrX
1yw6sgf/feqvCgBJgsKW8gzWAQdoYhDiENUaISDTPWK/NhnqpuwA/12S5X4c8P1q
I4v5wSyXLAnyc0kKO66bnfUP/aAD5qExHW7WI8SB1xn4hklw8neNRuietl/Q0ppT
UpWumRxk7x8uNA2DhPVAOlIwe41BZd/lkSOIXUJmZHzLR79PPGlyoJfVQ/+rANQ/
fw8D5pc1hTNnETdlfOqyE7FdQHEYC+gZdk1Fcj0oOJ8q5OaIb0sbGc07pirJShQC
Ya6ZXsSCQEcaN4ErnFzC37EyPaLVeG6r/1eMAVOo+dINq/XXOoMhOmJDlJvWPfpz
66fNTgROZxrLjVTDckzR+ynsnf5y4g==
=AsZW
-----END PGP SIGNATURE-----

--6q+u6D6tObQc8sPg--


--===============7264324829606796482==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7264324829606796482==--

