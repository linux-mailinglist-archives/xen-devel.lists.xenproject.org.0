Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 503BB589D79
	for <lists+xen-devel@lfdr.de>; Thu,  4 Aug 2022 16:28:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.380448.614602 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJbq1-0001LH-Ke; Thu, 04 Aug 2022 14:28:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 380448.614602; Thu, 04 Aug 2022 14:28:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJbq1-0001IX-Gb; Thu, 04 Aug 2022 14:28:37 +0000
Received: by outflank-mailman (input) for mailman id 380448;
 Thu, 04 Aug 2022 14:28:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nGyI=YI=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1oJbpz-0001IP-E4
 for xen-devel@lists.xenproject.org; Thu, 04 Aug 2022 14:28:35 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b7a33386-1401-11ed-924f-1f966e50362f;
 Thu, 04 Aug 2022 16:28:34 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 5EC135C00ED;
 Thu,  4 Aug 2022 10:28:32 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 04 Aug 2022 10:28:32 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 4 Aug 2022 10:28:30 -0400 (EDT)
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
X-Inumbo-ID: b7a33386-1401-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm3; t=1659623312; x=
	1659709712; bh=7auNTiPFXfFcp0PRa6neXG9e4sL0arhf11uk1U3KXpY=; b=K
	dyL5XSbXUyK20ctfotJr3vuG/4aatsiOiJ9CgI8p3CvQR4lFSqi6+xXJLiImt8tc
	lZcCwlSNcLpDKmzUPHs86BUBtHquHFE9d1knxAEloqUJ9pXPYrPNmXUO3fMAxcAd
	guRQRHx/cLIOYhFbzf/Y0bL9fznzobb4yyOTSnoZwwG/9QjU+I9XNjk8nGZ0zYZJ
	WFg2O/jlyEywZQXX3EW9KMP0K44s2mi2uJ/XXA4Mq+3nOs9kWQKq7qGbNqK9XPNV
	5wb6zdFpbd6/yeeYMEhDrmGBOzyQTUQg8KXtz1yfU2TYFyIUrBmiCAHNdcI8YuBF
	FU2OdSgKZPlyW4buhUkkA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1659623312; x=1659709712; bh=7auNTiPFXfFcp0PRa6neXG9e4sL0
	arhf11uk1U3KXpY=; b=uk+QgxVexr1I7BayrcAsF+I3Z7N3rfAeH79k70bXnIVd
	7Nyz++ujan4KDNTFpJVKok4UwuEBLvB5hZmdMH19/vKFKbqbSZ6qAUyCeN6XkaCI
	536odXyvEO7o0UGwO8iF4n24Bg32blYQATccwxY7ZWsvAfI1tL0orlQQkLLjz5zN
	GGu0ZSjk+KqWKtn2J/5c9EmdvPEKMIIEqYEcHKAbPfq3r1+zvENtVxTuXEoveXAA
	rnuoyZQ3bh0QCwUYEj+VQTH+um6Zx0sQXc1IhQtIM8SMQKyZVFBZhoVRU1xH0AoH
	KBpV8qOM4kBaOvCYOeUVnHvZ2ZllIsjGmsDuo9WI2g==
X-ME-Sender: <xms:kNfrYlI7MvLvyyIAKPbl0moAEjMSc6fSjbMNG1VZa5ZXzLovcy2rZw>
    <xme:kNfrYhIKPVQaxZcW8CzoMuyAWsZCq-cnUUwGcEdk680AHXazEWIfYgoBcR4i7Z2lx
    V2e03JoFDz_2A>
X-ME-Received: <xmr:kNfrYtvNAZHFmaoTr-g44sDt7J50i-sHzzxnR6S35EFq3goZAH1zaysKaaUnc6YvGzXOlNIDJeOng9K9KuxjaxNIEgD3DYMnidAk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvddvledgjeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtroertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnheptdet
    vdfhkedutedvleffgeeutdektefhtefhfffhfeetgefhieegledvtddtkedtnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:kNfrYmbUflGdFlNK2fr8Nt3gsKLdkqkzC0nChn0qA6mQklLGU_nn_g>
    <xmx:kNfrYsbXHySnMIX039qkTy26ligAW6L_8KwLMtPSkPBgVWFwhrCZwg>
    <xmx:kNfrYqBf2RzOcR7Dsdw65BcIkXqZXZ60b0XcLY4GlY2mthRKWbdP7Q>
    <xmx:kNfrYrz4wGXJaO-XzgYCNwYojqT8JPSptSQVX4nNu8RMUEHS7VDsBw>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 4 Aug 2022 16:28:28 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 01/10] drivers/char: Add support for USB3 DbC debugger
Message-ID: <YuvXjEZMlwjsuIGA@mail-itl>
References: <cover.981658add2114d2558989cedba5877aa8b82d8a4.1658804819.git-series.marmarek@invisiblethingslab.com>
 <e2e536b4b3d6ef417efbc399842b58aa420c1e3f.1658804819.git-series.marmarek@invisiblethingslab.com>
 <3bd56b9d-023b-1991-90bf-bc44d3c75bc8@suse.com>
 <YuvM7vElH/IdBJjq@mail-itl>
 <c9f9c980-6045-c697-eaf1-11e14a87e71a@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="WPqlAE/Con2AfZs7"
Content-Disposition: inline
In-Reply-To: <c9f9c980-6045-c697-eaf1-11e14a87e71a@suse.com>


--WPqlAE/Con2AfZs7
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 4 Aug 2022 16:28:28 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 01/10] drivers/char: Add support for USB3 DbC debugger

On Thu, Aug 04, 2022 at 04:21:01PM +0200, Jan Beulich wrote:
> On 04.08.2022 15:43, Marek Marczykowski-G=C3=B3recki wrote:
> > I need to keep this structure somewhere DMA-reachable for the device (as
> > in - included in appropriate IOMMU context). Patch 8/10 is doing it. And
> > also, patch 8/10 is putting it together with other DMA-reachable
> > structures (not a separate page on its own). If I'd make it a separate
> > static variable (not part of that later struct), I'd need to reserve the
> > whole page for it - to guarantee no unrelated data lives on the same
> > (DMA-reachable) page.
> >=20
> > As for statically initializing it, if would require the whole
> > (multi-page DMA-reachable) thing living in .data, not .bss, so a bigger
> > binary (not a huge concern due to compression, but still). But more
> > importantly, I don't know how to do it in a readable way, and you have
> > complained about readability of initializer of this structure in v2.
> >=20
> >> That struct will be quite a bit less than a page's worth in size.
> >=20
> > See above - it cannot share page with unrelated Xen data.
>=20
> I have to admit that I'd see no issue if these lived side by side with
> e.g. other string literals. The more that the device is supposed to be
> exposed to Dom0 only anyway, and hence that'll be the only domain able
> to get at that data.

Other string literals are fine. But for example `struct dbc` itself is
not.
See how it is combined with other data in patch 8.

> >> If you build the file with -fshort-wchar, you may even be able to
> >> use easy to read string literals for the initializer.
> >=20
> > I can try, but I'm not exactly sure how to make readable UTF-16
> > literals...
>=20
> L"Xen" looks sufficiently readable to me. We use this all over the
> place in the EFI interfacing code.

Ok, I can try that. But given later adjustments, IIUC it will make the
whole 50+ pages structure land in .data. Is that okay?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--WPqlAE/Con2AfZs7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmLr14wACgkQ24/THMrX
1yzuFgf/SHUOTqpfW0/yrmNUDMDB32B29XxdkGznzM7KlPkTfIt/jzG4kxwb3CxO
gu7XW+eonRMkxetLPZdXdfSe7F6ZVwrZpTRwdcG6CSGrpXaq2OZy+o7Gu1//i314
Kdlq0UJeZ+FKOD7y3tTM1Yy/6dLw7v81R/8zq2vo2xYYWfPCqZFCdCTp/D9wBllY
R/2fGH+xZGyjP95oNKWkr4zSK/nkgZcP+mFn/v5/FlAXzhHNbbVQJ55Svn2kOfI+
OepN7vbekP7K7zICJO8TaN7G5wjTOH3lZ1pIDzor0jNeqvHdda48nguYDrMuIn5E
Zj/x+eLVnTd5lfpSq0gavfyYo1jwMg==
=Nv1A
-----END PGP SIGNATURE-----

--WPqlAE/Con2AfZs7--

