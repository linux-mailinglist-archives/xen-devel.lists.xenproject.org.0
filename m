Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4098B10AEC9
	for <lists+xen-devel@lfdr.de>; Wed, 27 Nov 2019 12:37:46 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iZvb3-0004EM-VE; Wed, 27 Nov 2019 11:35:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=NEU6=ZT=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1iZvb2-0004EF-Fk
 for xen-devel@lists.xenproject.org; Wed, 27 Nov 2019 11:35:00 +0000
X-Inumbo-ID: f1bf7c08-1109-11ea-a55d-bc764e2007e4
Received: from out1-smtp.messagingengine.com (unknown [66.111.4.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f1bf7c08-1109-11ea-a55d-bc764e2007e4;
 Wed, 27 Nov 2019 11:34:59 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 8F56122758;
 Wed, 27 Nov 2019 06:34:59 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Wed, 27 Nov 2019 06:34:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=tWkHhw
 z1GVFtSzYUoi/PYe+OETktHaJy9FCFfsTLM5E=; b=wwgOkFHS9QM+pOXo//oQVJ
 wZh4IdUKML1D3jrgzMz4Cg4PfQCG682QH03gkCZhDQWzx0A9RNXmxLdxnljYVjAS
 l8teTYtDpt0t3vX4xXFPivBS4cEsJoX5H0i5Z9GBePH/dyELlpb2jtLGpso9wv9G
 H2vBpK7SfQXz7C8p5rHoPd6XoWKFwo6I+B0l1bXmtphsauhfK1mAsxtRqXK5sGoB
 BbaOoW/w1AL/V9Gh1a6vYFu36pTQR+WprFcpjNRgG/4lZEjC1fYCzCI5azp2chAC
 Loza3iPmkxgSJ+e8366LQQBE9UW1SEaDSmpFr7LNYQ+dgFXLqNjLk9+yElsLtbJA
 ==
X-ME-Sender: <xms:Y1_eXY5PKtFwvONMja-LzPvuSWwqmYPNKX1QNZl0eHIw76Q1fQj0zg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudeihedgvdekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucfkphepledurdeihedrfeegrdef
 feenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslh
 gvthhhihhnghhslhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:Y1_eXcseJhnbeZ_6hdUKAEKYwcXCzqn1DlKM8vDk0r-sYGmUUk_AVQ>
 <xmx:Y1_eXaOHfKPkAHghla50SL0c98pioYXQER0B8i8CLIsK7Tj5XNJXkw>
 <xmx:Y1_eXQpi6w9W0cAr0Z2CyHrZpGAqbsiO3zxsm9vTUINlMLkLs_wk8w>
 <xmx:Y1_eXZnjKRN3v0zv5KlwSLjntZv2zkWc8heI7CZ521DD9x6dqcvkFA>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4CD67306005E;
 Wed, 27 Nov 2019 06:34:58 -0500 (EST)
Date: Wed, 27 Nov 2019 12:34:55 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20191127113455.GC2012@mail-itl>
References: <9A92C0ED-DF7C-4951-BF4A-06763F60F266@gmail.com>
 <1c83d62d-cecd-96b4-a856-8294128ebe4e@suse.com>
MIME-Version: 1.0
In-Reply-To: <1c83d62d-cecd-96b4-a856-8294128ebe4e@suse.com>
Subject: Re: [Xen-devel] UEFI support on Dell boxes (was: Re: Status of 4.13)
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
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>, Rich Persaud <persaur@gmail.com>,
 Roman Shaposhnik <roman@zededa.com>, Lars Kurth <lars.kurth@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============5253073257840491191=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============5253073257840491191==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="iFRdW5/EC4oqxDHL"
Content-Disposition: inline


--iFRdW5/EC4oqxDHL
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Xen-devel] UEFI support on Dell boxes (was: Re: Status of 4.13)

On Wed, Nov 27, 2019 at 10:14:56AM +0100, Jan Beulich wrote:
> On 26.11.2019 22:20, Rich Persaud wrote:
> > As an intermediate step, could we have an umbrella opt-in
> > Kconfig option (CONFIG_EFI_NONSPEC_COMPATIBILITY?) that
> > enables multiple EFI options for maximum hardware compatibility?
> >  For this thread and Xen 4.13, that would be
> > EFI_SET_VIRTUAL_ADDRESS_MAP and efi=3Dattr=3Duc.  If more
> > options/quirks are added in the future, downstreams using
> > EFI_NONSPEC_COMPATIBILITY would get them by default.
>=20
> While I don't particularly like it, I'd be okay with having such
> an option, provided it doesn't hamper code readability too much.
> However - why would you stop at those two things? Why not also
> exclude reboot through UEFI (as indicated by Andrew), or use of
> runtime services as a whole? What about /mapbs? The fundamental
> problem I see here really is - where would we draw the line?

Yes, it isn't easy to draw that line for all the downstream projects at
once. For example it looks like efi=3Dno-rs is an acceptable compromise
for Project EVE, while it isn't for Qubes or OpenXT. But moving from
"apply this set of patches" to "enable those options" would be an
improvement.=20

Ideally Xen should work out of the box on as many boxes as possible. If
that means enabling some workarounds by default, I'm fine with it
(unless it _severely_ impact other configurations). In Qubes we struggle
with hardware compatibility because of large variety of client hardware,
firmware and configuration.  Whatever we say here, in the end it boils
down to "does project X work on my hardware?". Not sure about other Xen
use cases, but we prefer to have the answer "yes", whenever it's
reasonably possible. I think enabling efi=3Dattr=3Duc and
EFI_SET_VIRTUAL_ADDRESS_MAP by default is a reasonable approach.
Defaulting to a different reboot method may be too, but I haven't seen
too many machines impacted by this particular issue. Maybe because
Xen+UEFI breaks much earlier there.

FWIW we do enable efi=3Dattr=3Duc, /mapbs and /noexitboot by default (until
EFI_SET_VIRTUAL_ADDRESS_MAP was added).

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--iFRdW5/EC4oqxDHL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl3eX18ACgkQ24/THMrX
1yxutQgAjIsgTPtGHENgrfqM076kkzMBm32gnt0kSPZib0fibhfr4XMgTdT72im0
7vC6hwLO2uwWI1tyNQNJjFYlrOQ9kfUj4TeEoOzmxq2VXWAHsXLaaYQ99YAPZHJw
X6bg4Bbr1A1kvpQlFvUbJGMQWNzWwImgfuBKeEUllZE8xsCV/2pnm8qQDTJDNmnG
8cyFg1H4WB5APocxdELMuf3AXFYHATR8JbgGseiX1VovoPZLOjdOiY33P3th3pXt
O3kTQkYryVryRWqPPHaxKTnhY7SXlbbepFyjYcwBUag3VBDSig+f35lCgppchTCq
Jii2DZawi8+9IJAtiJNXPf4NH/Kf2A==
=wt/+
-----END PGP SIGNATURE-----

--iFRdW5/EC4oqxDHL--


--===============5253073257840491191==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5253073257840491191==--

