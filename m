Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B5CC6C4751
	for <lists+xen-devel@lfdr.de>; Wed, 22 Mar 2023 11:16:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.513288.794099 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pevVQ-0005DX-Cc; Wed, 22 Mar 2023 10:15:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 513288.794099; Wed, 22 Mar 2023 10:15:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pevVQ-0005AA-9V; Wed, 22 Mar 2023 10:15:44 +0000
Received: by outflank-mailman (input) for mailman id 513288;
 Wed, 22 Mar 2023 10:15:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=q7fH=7O=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1pevVO-0005A4-Am
 for xen-devel@lists.xenproject.org; Wed, 22 Mar 2023 10:15:42 +0000
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7df2fd17-c89a-11ed-85db-49a42c6b2330;
 Wed, 22 Mar 2023 11:15:39 +0100 (CET)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id EC7263200893;
 Wed, 22 Mar 2023 06:15:35 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 22 Mar 2023 06:15:36 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Mar 2023 06:15:33 -0400 (EDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 7df2fd17-c89a-11ed-85db-49a42c6b2330
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1679480135; x=1679566535; bh=ajzN/RU4/jN42dxnys9v1HEgdoXr2VrhQ1k
	m67fOvLs=; b=hhSvfbyXrkeyXTuHmt8SdLe1ttuzcAXB+tJseycivUxX57l/kUR
	owpCl5A1aTqGa18FdvhjsArAflT+/vcruX4WEc4rYssdsdHX88aycQiejPJ6lQxa
	xRq0R7sisX3MC7xSNe/CzIWGMO8voMRvMd8I0PyWk4jeImQknNQpxxY3/Y3pVt4v
	zZVGahnDUMqNRuRr+9bAgcHyGWHvs5U/TaGyo9PxfrkRUW/EGHRIRc4FlF+s5RIS
	uc6DmBW9y2sXF0s95Qfptol2GYjgJq0p0Th2hu8p8cIzJe6ipYjRJNXZfArrIxC9
	Pn6hpJssRoibj6x8kA3itdoaNCVvLURXNUA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1679480135; x=1679566535; bh=ajzN/RU4/jN42
	dxnys9v1HEgdoXr2VrhQ1km67fOvLs=; b=oiZPCgfM5ms9JbC/N/3/sphA/HvRj
	JswiDd4IHId/LOqcFqBHxH6R0tLZzlaleiquuyRUJuT8tzNXP85R8hkoSiVNWgtt
	Jw6AZyC/nPzSomp6m+cMuXB0KFWnAUpXtwClSqoDbMHMbVa4iOD2BIs2rBidfeLe
	bqe0F1ozTG54Ns7GvBC0ZD2wN80IQlvLIxpQ2fAgpbS7sXGP7k1VZkApnQRIA5yC
	TNsaDM0P+oxchyCXVDdHC5hCdrIDrO3Jz+VIbzA/Ic8O/GldN6C81N4HkI8pDDRu
	j/V5V0Vc0SSEywa0I1Mrj1cUSy3qQ3elm2N9326fSXB5LWveF5GinMOhQ==
X-ME-Sender: <xms:RtUaZF0p2N6tKbJ2JiwM8_LQOnk8OguA2i-dc_aCeBK6yHIThiSB4g>
    <xme:RtUaZMFG5SZc9lct15gnmGFfjiWxH1HTWUq6DzXy5bDX870zVt0GIDKim6mKgBXVX
    0eXbWeyyTHsCw>
X-ME-Received: <xmr:RtUaZF7efBwiELiD2hin8AWFtdwIMJ24Pqy9GvLgNFWrq9XW8EgI_OwF9bi6d1MZty5RlvnzG_W97cBnUfCrGgupWpKXQ5ZADBs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdegvddgudegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgeff
    udduleffkefhjeelfeegkeegteeikeduteevleefudfhfeehueduhfdugeffnecuffhomh
    grihhnpeigvghnrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehm
    rghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsg
    drtghomh
X-ME-Proxy: <xmx:RtUaZC2OfhgqOtM8CYpe4_asPeyWLuUtK00gqZj5AF1z17GwZyHKIQ>
    <xmx:RtUaZIG7XnXMnDOpOSCGAXg_0Ye-ibSOhDP0-UzmOHW2fsiZl-H6Ww>
    <xmx:RtUaZD9Ynk9VzDWjHYae8P2aEL92ijB5FGUM5-751Fri1HTcKGsxew>
    <xmx:R9UaZD0DogzaQ95qZq6SVPl-prCtQQ0b14rpEaqWKlZjxRV7XZEWGw>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 22 Mar 2023 11:15:27 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v6 1/5] Use HTTPS for all xenbits.xen.org Git repos
Message-ID: <ZBrVP1LPtbn4Il2q@mail-itl>
References: <cover.1679412247.git.demi@invisiblethingslab.com>
 <69fdc220c4cf7cd571e60a9e5bc89150cfb52017.1679412247.git.demi@invisiblethingslab.com>
 <0806d3d3-ebb1-f9cf-2746-4619ac1b125c@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="AXfiXvVcdOo/s9FV"
Content-Disposition: inline
In-Reply-To: <0806d3d3-ebb1-f9cf-2746-4619ac1b125c@suse.com>


--AXfiXvVcdOo/s9FV
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Mar 2023 11:15:27 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v6 1/5] Use HTTPS for all xenbits.xen.org Git repos

On Wed, Mar 22, 2023 at 09:32:53AM +0100, Jan Beulich wrote:
> On 21.03.2023 18:33, Demi Marie Obenour wrote:
> > Obtaining code over an insecure transport is a terrible idea for
> > blatently obvious reasons.  Even for non-executable data, insecure
> > transports are considered deprecated.
> >=20
> > This patch enforces the use of secure transports for all xenbits.xen.org
> > Git repositories.  It was generated with the following shell script:
> >=20
> >     git ls-files -z |
> >     xargs -0 -- sed -Ei -- 's@(git://xenbits\.xen\.org|http://xenbits\.=
xen\.org/git-http)/@https://xenbits.xen.org/git-http/@g'
>=20
> I thought I had asked already, but looking through earlier conversation
> it looks like I only meant to: Why not git+ssh:// instead? Iirc there
> are efficiency differences between http and git protocols.

git+ssh requires authentication, so you can't use it without an account
on xenbits.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--AXfiXvVcdOo/s9FV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmQa1T8ACgkQ24/THMrX
1yzyKgf/d1/gbOnwbP17XZbrKBDtfbWuF6n59gMl1vBXKlBSkceQN5crX0EgO7Eg
E40Efg6oQeBbbbj3jmAO8V10LtN8dHRJoNPjdduGSTiiK7C+muyXIf7iWS24cFXq
s2BuhTk8S+Ww9WkcYv1LFTXqXh0VAcYvERB+Gh1PHuWlrhX9R4e9j40ktF47NUnB
f1gOmdL4Bq25VLhRcY4dGn8SPiQ+qwFqDNk/CYfUbTsMgP3S9Cv0AbVUQFsc55WJ
wRU9tbaMRGlciS9cqFWamz/cw/ZGamOd8Y54vrhELtjrXy6yLBlcMLshgWY1luUa
3TZScZ176Z/KVD9W+LuqiRSg7hpWPg==
=8Xv7
-----END PGP SIGNATURE-----

--AXfiXvVcdOo/s9FV--

