Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C9B8509F
	for <lists+xen-devel@lfdr.de>; Wed,  7 Aug 2019 18:07:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hvOQu-0002wB-Bz; Wed, 07 Aug 2019 16:05:00 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WRzl=WD=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1hvOQt-0002w4-M3
 for xen-devel@lists.xenproject.org; Wed, 07 Aug 2019 16:04:59 +0000
X-Inumbo-ID: 1a280631-b92d-11e9-8980-bc764e045a96
Received: from wout5-smtp.messagingengine.com (unknown [64.147.123.21])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 1a280631-b92d-11e9-8980-bc764e045a96;
 Wed, 07 Aug 2019 16:04:57 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id DC4CC499;
 Wed,  7 Aug 2019 12:04:56 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Wed, 07 Aug 2019 12:04:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=7NBkxE
 /diznqLXdeYsHnPtWej3sjxeIiC1WtGb4t3E4=; b=BAD5XVV0M8wRx1nR9rGTQx
 h8cD4W0T2phQaD0E4syOUtVT6AkSzrgpLMqhQbYJ7RCImbPt4FNbXXHTAItaw308
 +46TsID4J5ZXIehBtjDpgvnE8IJuRM5PAZbIk8GkTgKN5yFaKAeGRd3lMTSq95C6
 wcW3M/GAMSJWRoF7jbeEj/Z9YEIuBQc1O6MFtW3gOTA0NtWGPULGZoO/6DbcGRqG
 KCrcG/9kYi86GjSii+5y+H+/3nnNTJ7cTNxWbvmESkktnsYTvCiA3TyxOVZ74pgE
 dIpsq9aaAVXqSeXOWJTTyQYyO2Ssc37A7CZ9CAosZNxaAzHRzjgkXyuU3z30Wu4Q
 ==
X-ME-Sender: <xms:qPZKXeZqM7HlIbNeUFllHyPnWXPMkWy0xGKnxQjCprvvRml2FJvz5A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudduvddgleeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucffohhmrghinhepvghfihdrihgu
 necukfhppeeluddrieehrdefgedrfeefnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 hrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmnecuvehluhhs
 thgvrhfuihiivgeptd
X-ME-Proxy: <xmx:qPZKXV-7codebFd7SezXgIwsT14LI3-TFeQFzEKoolv1tL1fG1dmXQ>
 <xmx:qPZKXWGhpR7pXn8ZVovCqQllN-dQAyU8BNZH7uX0rQWYXhVWymSEFw>
 <xmx:qPZKXXdtqgFtGNtamX6gZXBS-GLkI5_XEKVx8ONZvpp1hslBiZ1yng>
 <xmx:qPZKXaPYAJJFtuN0ybn24yDJEmJr4B_TJMy5HYeCG25WYXrVYygY3w>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5F6EF80066;
 Wed,  7 Aug 2019 12:04:55 -0400 (EDT)
Date: Wed, 7 Aug 2019 18:04:51 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Message-ID: <20190807160451.GB3257@mail-itl>
References: <20190807132657.GA2852@mail-itl>
 <7e7da376-462f-9bd0-5b82-137c059feb13@suse.com>
 <20190807151703.GA2659@mail-itl>
 <59f6c90b-3dbb-b0eb-ff45-0f8fd4c915de@suse.com>
 <20190807155112.GA3257@mail-itl>
 <642fe1a7-741d-2b42-f810-7c9cdb9c5120@suse.com>
MIME-Version: 1.0
In-Reply-To: <642fe1a7-741d-2b42-f810-7c9cdb9c5120@suse.com>
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============8633728256668070888=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============8633728256668070888==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tjCHc7DPkfUGtrlw"
Content-Disposition: inline


--tjCHc7DPkfUGtrlw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 07, 2019 at 05:58:59PM +0200, Jan Beulich wrote:
> On 07.08.2019 17:51, Marek Marczykowski-G=C3=B3recki  wrote:
> > On Wed, Aug 07, 2019 at 05:33:05PM +0200, Jan Beulich wrote:
> > > On 07.08.2019 17:17, Marek Marczykowski-G=C3=B3recki  wrote:
> > > > Actually, I've already tried, but every other build I try, I get ev=
en
> > > > less useful call trace, for example debug unstable build:
> > > >=20
> > > >       Xen call trace:
> > > >          [<000000007b751c09>] 000000007b751c09
> > > >          [<8c2b0398e0000daa>] 8c2b0398e0000daa
> > > > ...
> > > >       GENERAL PROTECTION FAULT
> > > >       [error_code=3D0000]
> > >=20
> > > But this makes reasonable sense: The faulting insn is "call *0x18(%ra=
x)"
> > > and %rax is 6954b2b0, which points into a block of type
> > > EfiBootServicesData (and hence likely reused by the time of the crash
> > > for other purposes). Hence the "/mapbs" option of xen.efi might help
> > > here too, but iirc there's no equivalent for it in the MB2 case.
> >=20
> > Oh, yes, indeed in Qubes we have /mapbs enabled by default with xen.efi.
> > I'd like to add it to MB2 case too. Is command line parsed at this point
> > (efi_exit_boot()) already?
>=20
> I'm struggling a little how to reply, considering that I've already
> said "iirc there's no equivalent for it in the MB2 case". So I guess
> I'm simply not understanding your question, or more specifically
> where you want to get with it.

/mapbs option is very specific to xen.efi. I'd like to add a means to
set map_bs variable in MB2 case too. I'm asking whether I can use
standard command line parser, or do I need something special extracting
it from MB2 structures directly.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--tjCHc7DPkfUGtrlw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl1K9qQACgkQ24/THMrX
1yyuAAgAjzu+KzY7iC6CqrdlBra1Pyb3lHSALo7uLxQdg6lyDxoIN2CyjlPl8luO
sXaOCXibLB4ULq24yGn7jJ7vk9o25Cg9eb46dFdsLnB2FgdLKquSy2zNeTpv4CEk
X1VC6vdUxegLSmiD+Zz8Eu0YIsPLYw2PM38Mvkkl4lfN/GjMsQry+Kd3Mg9EumL0
SdNCDjLaBo04AkNBtwT8dyX3TAQKqx5iV1RTvdCYhA15StBA39u5C/TSBL7hrVPn
VyRvOYWoAoeEOogGUhn1U0sTlE7m6Z+Mv94M5oZDoHl8VRZ7tnL0fQ1JDSX/oarO
iaZf6QTBK42+rqJKiVzOpGt0aFn9cA==
=CMYd
-----END PGP SIGNATURE-----

--tjCHc7DPkfUGtrlw--


--===============8633728256668070888==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8633728256668070888==--

