Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B0898E7BF
	for <lists+xen-devel@lfdr.de>; Thu,  3 Oct 2024 02:26:13 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.809117.1221289 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sw9eO-0001Ri-DO; Thu, 03 Oct 2024 00:25:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 809117.1221289; Thu, 03 Oct 2024 00:25:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sw9eO-0001Od-Aa; Thu, 03 Oct 2024 00:25:00 +0000
Received: by outflank-mailman (input) for mailman id 809117;
 Thu, 03 Oct 2024 00:24:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GA31=Q7=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1sw9eN-0001OV-BI
 for xen-devel@lists.xenproject.org; Thu, 03 Oct 2024 00:24:59 +0000
Received: from fout-a1-smtp.messagingengine.com
 (fout-a1-smtp.messagingengine.com [103.168.172.144])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ea590aa0-811d-11ef-a0ba-8be0dac302b0;
 Thu, 03 Oct 2024 02:24:56 +0200 (CEST)
Received: from phl-compute-08.internal (phl-compute-08.phl.internal
 [10.202.2.48])
 by mailfout.phl.internal (Postfix) with ESMTP id 30ABB138069B;
 Wed,  2 Oct 2024 20:24:55 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-08.internal (MEProxy); Wed, 02 Oct 2024 20:24:55 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 2 Oct 2024 20:24:54 -0400 (EDT)
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
X-Inumbo-ID: ea590aa0-811d-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1727915095;
	 x=1728001495; bh=51heNHMuj9nRTyZhOVpYS0SLENNRLrsddpl1z1kRidw=; b=
	dNKKdzIPfmBVJ7/4WwX/kmvG5q9G05xFr25tZrxarVwa4w/GNg7ipbRU8uUapJkx
	Wj3zRz1d2TQWKQJJMx5LJhJJ2TgAny98YAHxQgGB5RJFI03jzMCrcx3GYSOfF+wf
	NMpdKlhHHk9jKrczcTlh1Cc+HnuVeGxDDalOPzH8zfQF2OHmCrhcq30hxCkPx3xJ
	jX0vcTtgqVwNDU1btJO6f/KKjzFXzYXLchoj/FUKiFZD/hyCW20ho4KLGtGLv+Zn
	zcgHiGJ6OdRMe+hPZuQbh1ha7dcsYP/TvGldlB8ibkEB021jyvYB6nzbGfN0MDaD
	CDWJ0CBOYSfX3CDflgatZA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1727915095; x=1728001495; bh=51heNHMuj9nRTyZhOVpYS0SLENNR
	Lrsddpl1z1kRidw=; b=bJShgPpOppsVBgUP37MG+tIXVneviV+skce8/dierDDN
	S4dmz6AJkkDCZ44omhNRi44eJYtB4S5b/ppwoJKrYx+aKGnZoeqbDZQ8ixtFYOc7
	fwtRBFSBvc61gLrZPatdSoKZLxiQfr+NfU1JsogH1lLE2vuWsaUEkaJfXpSuDByD
	jCsGXwI4e7QddDsfPZUHeydmMQQnYIktGTVp6WdihsrdTk0yrxFVrc0nuCDbQm3Y
	CrC7T77m01WFAHoaa+TFGNFpYoFdvg8FldNiT0EH73GP3cnbeCoZcUJSq+uSLX1d
	vRjQMCgc+swnIGtLKhp95gRpUvlsY5e2GOi33oWPOg==
X-ME-Sender: <xms:VuT9ZqqVnNGr2ooyxg2-Urj1b4knNLjmL9vta_fWhV_SaoT2qNOiVQ>
    <xme:VuT9ZoqR0JqK73CIdZWaCWlc0OCyc7fzWD564KsVgmfpGgoAaSLGsdpVeFKAAmRyD
    -IvP1Bo4Eg5kA>
X-ME-Received: <xmr:VuT9ZvNLKBx45j0rwM8V1d8tq3ysfegW5NEtyUR2rYTy4q_WmJSq3TeoX0ZZ3MnilU7usPfvuAWVe8Uk7NzYnmJaXyqg0ekhnw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddvtddgfeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeen
    ucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomh
    grrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggft
    rfgrthhtvghrnhepgfduleetfeevhfefheeiteeliefhjefhleduveetteekveettddvge
    euteefjedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhho
    mhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhdpnh
    gspghrtghpthhtohepfedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepshhsthgr
    sggvlhhlihhniheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepgigvnhdquggvvhgvlh
    eslhhishhtshdrgigvnhhprhhojhgvtghtrdhorhhgpdhrtghpthhtoheptggrrhguohgv
    segtrghrughovgdrtghomh
X-ME-Proxy: <xmx:VuT9Zp4UTDQDpqzdtTnymPvzg2eCNjNP2F2BGpHepgPQPlhcb6pgNA>
    <xmx:VuT9Zp5_1uCDTKAm-btJLjocBRrA81-sCqiBlt9zaNEr2RwFt1MGww>
    <xmx:VuT9ZpjmipyiwTPA1fagXtws2-GJYpfRp-wM1bjK1YfUMA-J3xQQqA>
    <xmx:VuT9Zj5QDkkQWJ3rhBZ3dg9ySa09Fb-u76metPDMBQ9kq6lEGb54Ww>
    <xmx:V-T9ZpGiioU7LLLCTeY17vhnn0UwCgPW92sNezQAYgRNI9bmOU8uu43T>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 3 Oct 2024 02:24:51 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH 2/2] automation: add a smoke test for xen.efi on X86
Message-ID: <Zv3kVEljCcM-Ww91@mail-itl>
References: <20241002124245.716302-1-marmarek@invisiblethingslab.com>
 <20241002124245.716302-2-marmarek@invisiblethingslab.com>
 <alpine.DEB.2.22.394.2410021516180.1138574@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2410021517500.1138574@ubuntu-linux-20-04-desktop>
 <Zv3Pbx1gkeypGQem@mail-itl>
 <alpine.DEB.2.22.394.2410021618540.1138574@ubuntu-linux-20-04-desktop>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eph3G+gSaCOwf5OZ"
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.22.394.2410021618540.1138574@ubuntu-linux-20-04-desktop>


--eph3G+gSaCOwf5OZ
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 3 Oct 2024 02:24:51 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH 2/2] automation: add a smoke test for xen.efi on X86

On Wed, Oct 02, 2024 at 04:30:25PM -0700, Stefano Stabellini wrote:
> On Thu, 3 Oct 2024, Marek Marczykowski-G=C3=B3recki wrote:
> > The problem is this doesn't work. The group-level variable overrides the
> > one in yaml. See the commit message and the link there...
>=20
> Now I understand the problem, well spotted, thanks!
>=20
> The idea behind having TEST_TIMEOUT defined as a project CI/CD variable
> is that it depends on the test infrastructure rather than the Xen code.
> So if we suddenly had slower runners we could change TEST_TIMEOUT
> without having to change the Xen code itself. So I think we should keep
> TEST_TIMEOUT as a project CI/CD variable.
>=20
> I am not a fan of overwriting the TEST_TIMEOUT variable in the test
> scripts, because one test script can be used for multiple different
> tests, possibly even with different runners. For instance
> qubes-x86-64.sh works with a couple of different hardware runners that
> could have different timeout values. But I think it would work OK for
> now for our hardware-based tests (e.g. xilinx-smoke-dom0less-arm64.sh
> and qubes-x86-64.sh could overwrite TEST_TIMEOUT).
>=20
> For this specific XTF test, I am not sure it is worth optimizing the
> timeout, maybe we should leave it as default.=20

The default of 25min is quite wasteful for XTF test that failed...

> However if we wanted to
> lower the timeout value, overwriting it the way you did is OKish as I
> cannot think of another way.

If we'd need this option more often, Maybe we could set
TEST_TIMEOUT_OVERRIDE in test yaml, and then test script use that (if
present) instead? Or maybe have few "classes" of timeouts set globally
(TEST_TIMEOUT_SHORT, TEST_TIMEOUT_MEDIUM, TEST_TIMEOUT_LONG? or some
better named categories). But I don't think it's worth it for this XTF
test yet.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--eph3G+gSaCOwf5OZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmb95FQACgkQ24/THMrX
1yyrYQf+J5CCNQ6tZsxbDis1rKP/bqhvES+tiXzi+FuavEYzr07ES1qgmSf62Ytc
bH2NSOkZpbY0bDGbLxYNF2SorFR2/CedmOY86aRTk8fXvBcnb2wLJZNegAI/0b8q
sYcjRTRjCq+3KmiVQdmT3ELyC9PdulUdmkXsNyCuGhA6liP4tSuvH/9VbXkdYsxl
0sOx7wqNB/4kxSBUgoMR2Atd8h8PuSGyaGUyyY7p/aeoXPUi1mCnyamrPiEXFWui
bX6UOlu9PogjP0Xp0WoJwDSr9KTXSAR86/q1VqZBhxN8GQhM8/RapgY473AxZxLV
x5lWobzMpJRaw5K7X4Wv6VKQ37w9SQ==
=bgbt
-----END PGP SIGNATURE-----

--eph3G+gSaCOwf5OZ--

