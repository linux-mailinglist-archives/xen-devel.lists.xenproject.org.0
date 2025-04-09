Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45F29A827D2
	for <lists+xen-devel@lfdr.de>; Wed,  9 Apr 2025 16:27:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.944268.1342787 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2WP7-0001xV-NB; Wed, 09 Apr 2025 14:27:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 944268.1342787; Wed, 09 Apr 2025 14:27:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2WP7-0001us-JV; Wed, 09 Apr 2025 14:27:49 +0000
Received: by outflank-mailman (input) for mailman id 944268;
 Wed, 09 Apr 2025 14:27:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=np/6=W3=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1u2WP6-0001um-OG
 for xen-devel@lists.xenproject.org; Wed, 09 Apr 2025 14:27:48 +0000
Received: from fhigh-b5-smtp.messagingengine.com
 (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id cd99044a-154e-11f0-9ffb-bf95429c2676;
 Wed, 09 Apr 2025 16:27:46 +0200 (CEST)
Received: from phl-compute-08.internal (phl-compute-08.phl.internal
 [10.202.2.48])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 708822540135;
 Wed,  9 Apr 2025 10:27:44 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-08.internal (MEProxy); Wed, 09 Apr 2025 10:27:44 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 9 Apr 2025 10:27:43 -0400 (EDT)
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
X-Inumbo-ID: cd99044a-154e-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1744208864;
	 x=1744295264; bh=MfijyQYDcPda47DdSZRiIYkh/3eI28U/U8OcAgi76Ng=; b=
	eEDeBgs7WWdLWx0jc3AjFOGLuAeTp7yUnMK/cYX8NDkrvLmOs+4EiZ+jyVPa+i4N
	xu34YIAvT+T/3X5bxD5aQKw/fcLTAL47IJBpjJK5Xfop1wYRpRcB2+pGVTjXu1Dn
	RtPTDqcA8JplFhoannqCX0ZYdhqBF7l6tLYrls0hdC9BOZQe9kcypmpR/YSGiS+D
	yRtm7b6NmZtQcxbrLsxJRKplXqbdarzFYrBpq7KcUy4lSP8U135BIBfuZXbZzHSa
	hCBI7E2Ye/GsN6gouZumRJE1HuHlemfp3gks3B/wxlVb5X6dTJal1Pz4VHCo8fy9
	ZVdICr7UG5fGtBVGDxDCZQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1744208864; x=1744295264; bh=MfijyQYDcPda47DdSZRiIYkh/3eI28U/U8O
	cAgi76Ng=; b=QyF6h7CXZiGXrhRGny4A2ertdba5J23lerGWe5HVcuJ5sQWixHN
	zBFvp7D3A707X7hJVquTdbrPRiZ1tnXQfi4i+IeUTwO1gQfjMROc+k55TYQOF28Q
	gP/cauv4lsaQGl5N2IZHfdgXcyg8vUL2Saz3p4fswi4iBQiifrCKe3yu/B/BJQKa
	5tu3U4XUvYccJ5IIjUKHexkkP9GML1ZO41m66JHZON+X/wgZ9jKZ9NhHAKbrhz4L
	u/SrOfEAlcC4rmemr6hx/OlDmFbnBMHC6Up9/9zQzdwNoU/7Ek51u6cLY7ZI/tbm
	hdI70glx4oYMEhBCKxDmdCJvgAp2AgOZdmw==
X-ME-Sender: <xms:34P2Z2aEVqiDXtGgvlmu5A6Q0pcO3McQfEATZQu4Y2WfnL6rPoBxmA>
    <xme:34P2Z5YfyDFXb1YPj0glIh2ouG82sjbNS5f4YMdFCrMaNOYtixYHThXJbR0aiBcoR
    Z6qnToWg0g8Rw>
X-ME-Received: <xmr:34P2Zw-PPiif2lIuvn9gEC2F89rLtcFAIU68lFQMsztodfKKcJR975U936Z015Dj9VoF01emd5lpYLJfsjnG6K5ZVwEOPRjQBQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvtdeivdegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddt
    jeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiuceomhgrrhhmrghrvg
    hksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghr
    nhepgfekuddtffettefhieeuheffkeeuffelvdffuddtteetledtveekfeekleehjefgne
    cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhm
    rghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpth
    htohepgedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepjhgsvghulhhitghhsehs
    uhhsvgdrtghomhdprhgtphhtthhopehrohhgvghrrdhprghusegtihhtrhhigidrtghomh
    dprhgtphhtthhopegrnhgurhgvfidrtghoohhpvghrfeestghithhrihigrdgtohhmpdhr
    tghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprhhojhgvtghtrdhorh
    hg
X-ME-Proxy: <xmx:4IP2Z4rP4X-GWnjrK56VPYZ_Spl5SZk2uFAUmQLdpn1tvdBfihBoFA>
    <xmx:4IP2ZxoeF4-z7K-NxAB8iFYFVG-oN8SAZVaORFca_P2FFwdlHYINMg>
    <xmx:4IP2Z2TJwX5_swOYPBFna4oKMcywKm5gBxpT2dAFt24RDV6urRcgqw>
    <xmx:4IP2ZxopQOajVFx3GcBATX2tC-BmY2XtSx3J2Df-rfyMyA13WnwgBg>
    <xmx:4IP2Z4hX-tisiiPQt_mo9hhBDN0BEQmuEmtmErKf0SWtTpGJFbZn3zvW>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 9 Apr 2025 16:27:40 +0200
From: Marek Marczykowski <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/2] x86/hvm: fix write emulation of RO ranges
Message-ID: <Z_aD3TsQgrc3_id7@mail-itl>
References: <20250408093156.83277-1-roger.pau@citrix.com>
 <20250408093156.83277-3-roger.pau@citrix.com>
 <16c73cae-2ac0-4811-97d3-b25c95ed5abc@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Atdwa1+445GMBMc4"
Content-Disposition: inline
In-Reply-To: <16c73cae-2ac0-4811-97d3-b25c95ed5abc@suse.com>


--Atdwa1+445GMBMc4
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 9 Apr 2025 16:27:40 +0200
From: Marek Marczykowski <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Roger Pau Monne <roger.pau@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH 2/2] x86/hvm: fix write emulation of RO ranges

On Tue, Apr 08, 2025 at 03:57:17PM +0200, Jan Beulich wrote:
> On 08.04.2025 11:31, Roger Pau Monne wrote:
> > When running on AMD hardware in HVM mode the guest linear address (GLA)
> > will not be provided to hvm_emulate_one_mmio(), and instead is
> > unconditionally set of ~0.  As a consequence mmio_ro_emulated_write() w=
ill
> > always report an error, as the fault GLA generated by the emulation of =
the
> > access won't be ~0.
>=20
> Which means subpage_mmio_write_accept() is flawed, too, on AMD (or more
> generally whenever .gla_valid isn't set).

That may explain issues I see when using XHCI console on AMD (I can
crash the whole thing using sequence of driver binding/unbinding in
dom0). That's actually the hw12 runner in the other series, but tests
that are included in gitlab do not trigger the issue (fortunately?). But
also, it may be a different issue, as it affects PV dom0 too...

Anyway, I can probably test a patch if subpage_mmio_write_accept() works
as intended (I'll need to check if that path is exercised on AMD too as
it depends on xhci caps layout - it was definitely used on Intel).

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--Atdwa1+445GMBMc4
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmf2g90ACgkQ24/THMrX
1ywcWQf/WRp1tx6i9Rj+PUYBG7IO7OjPjcumPru4On5EnXBkfoxDHWE6t9AAHJDE
FqFAthJ08xbBhPbwVlMelHa0b8Jv9qDNUSRlXS4ve6/VnK4Mc91wg8DUNr65S9ol
jTl2gF+B75ueieejtBprJrbhH8QilLHtSiO3FYZ9K5owZzOVVrFa+p5dnXASgiTs
Y6kNH/xgVCaZdHZ9JVTG5uxWxy1BD8by/ZqvP8vCbTOoegtTG5g2PPBpSwwlvvbN
TIMP6er/lHvLeMYJD5VkSksKnc3FmW5o3a6DtSoPIh6QRzEqjI7P4JpbpvmNNecb
40n787rMBZcNg7QFciYu4TtL/uXq3w==
=PnyM
-----END PGP SIGNATURE-----

--Atdwa1+445GMBMc4--

