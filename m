Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C4CA9A9C8
	for <lists+xen-devel@lfdr.de>; Thu, 24 Apr 2025 12:16:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.966119.1356438 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7tc8-0004ar-9a; Thu, 24 Apr 2025 10:15:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 966119.1356438; Thu, 24 Apr 2025 10:15:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7tc8-0004Yi-6p; Thu, 24 Apr 2025 10:15:28 +0000
Received: by outflank-mailman (input) for mailman id 966119;
 Thu, 24 Apr 2025 10:15:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nqL3=XK=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1u7tc6-0004Yc-8R
 for xen-devel@lists.xenproject.org; Thu, 24 Apr 2025 10:15:26 +0000
Received: from fhigh-a4-smtp.messagingengine.com
 (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 0853b065-20f5-11f0-9ffb-bf95429c2676;
 Thu, 24 Apr 2025 12:15:23 +0200 (CEST)
Received: from phl-compute-07.internal (phl-compute-07.phl.internal
 [10.202.2.47])
 by mailfhigh.phl.internal (Postfix) with ESMTP id 4A4B71140290;
 Thu, 24 Apr 2025 06:15:22 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-07.internal (MEProxy); Thu, 24 Apr 2025 06:15:22 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 24 Apr 2025 06:15:20 -0400 (EDT)
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
X-Inumbo-ID: 0853b065-20f5-11f0-9ffb-bf95429c2676
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1745489722;
	 x=1745576122; bh=8ZIxeMnNYV9bIC9uK3BPzHnYzNxrxB9Rg8+EHp20Euc=; b=
	RebdoSyVqHcUvjHnMXYMonb6PNJ7PkVtbazla/9LdlUAmqIS+h8mZptMpl7LSPph
	njNDAywgHBsco7ubivyzGkSzsinPIBwsnFlsLdmh7fFv7QfGCZTQy1R5vzQxYDFJ
	p0ykg2Y770LIw92KnJA17IwmwaK6j1CS56mbgX1F6VmL7WcQ32KNbNPvvJtvS9LN
	pL7eARyFoQn9Qh7ENuqFF0ufX689lmKSdCWiHTQq0tVOFNGJcwkw2LcO2sKAnPC0
	2JOOY8J2ZNAy4bPnKZLJiJJ/tTq/bChDD6OyBOXfJjuLNc3qlM4WW1iJqho2EbP7
	k/0OLeAXUQHIbzdYBaOzAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1745489722; x=1745576122; bh=8ZIxeMnNYV9bIC9uK3BPzHnYzNxrxB9Rg8+
	EHp20Euc=; b=YGqpSUbcqW4w8k/LBk/u9EUeDxPwdDRhle1wlLdU1242UFptyb+
	Y/1iTrG6/kYWOrWoEFE/lcJVWD4iMll+FOeqHsZjGd1YM+1wl4hVjUFlMEIOEu90
	JG38HOF0ffRsXBC1LjwBvIVN6tkhzFhYhQ+Igj0wEPAkex2puVD5MJEm2GxNHTSw
	BMGspEMqO9QeciUldZ9M7+UadhQuf9D9R5acIiXoVfR8p6TbtLTURK28DZIpnUDc
	6/wME/XwKn8xF+cTpKi2qqpLa+KHYqokLJJEUke4KbfV5WuMAGsEKR3kKukNud5t
	W5Yl3FGw18HOeGwja297TK7sE5DzEjfTX2Q==
X-ME-Sender: <xms:OQ8KaMDUokeJ2Z9fk948F2cOJC61bvHxBcdvq6XvHfOTkoVh6z35qg>
    <xme:OQ8KaOgxb7Q_2-ofAYtjfGbREkGnnZ1ISgJBu1PlQAKTqxfxIAMXjlkh_x4s5H92R
    3fLXvulSU1OcQ>
X-ME-Received: <xmr:OQ8KaPkHb-P9xV8XRgJdj2MR1JdgBckDgOGmBr_zyfWoxXLWAsPADBOaH_CfHzXQzhd-0alSjoVodcKDwdvcsJtKWQmVdI9XyQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeelvddtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesghdtroertddt
    jeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuc
    eomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecu
    ggftrfgrthhtvghrnheptdetvdfhkedutedvleffgeeutdektefhtefhfffhfeetgefhie
    egledvtddtkedtnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
    dpnhgspghrtghpthhtohepledpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprhho
    ghgvrhdrphgruhestghithhrihigrdgtohhmpdhrtghpthhtohepvhhitghtohhrmhdrlh
    hirhgrsegrmhgurdgtohhmpdhrtghpthhtohepjhgrshhonhdrrghnughrhihukhesrghm
    ugdrtghomhdprhgtphhtthhopehsshhtrggsvghllhhinhhisehkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdr
    ohhrghdprhgtphhtthhopegrnhgurhgvfidrtghoohhpvghrfeestghithhrihigrdgtoh
    hmpdhrtghpthhtohepjhgsvghulhhitghhsehsuhhsvgdrtghomhdprhgtphhtthhopeig
    vghnihgrrdhrrghgihgruggrkhhouhesrghmugdrtghomhdprhgtphhtthhopegrlhgvjh
    grnhgurhhordhgrghrtghirghvrghllhgvjhhosegrmhgurdgtohhm
X-ME-Proxy: <xmx:OQ8KaCyH3yNpK_JzrW9rS0SaiUjKqIPz-Az6S_nWosUM0Jocc2k_tQ>
    <xmx:OQ8KaBTacRp357yKcs_BmMuEQ0HjNllI_ooA2LxOsjSZfbxd-m4jmg>
    <xmx:OQ8KaNZuvm_9j3Z8o6FwNX3duYoSgCFgPpDO62_bdSa-HcT424G4hQ>
    <xmx:OQ8KaKQGj9-lX3jtJB1RuLKCPJREi0XwFpm2RV6dj1Rs1GNtB2RLCQ>
    <xmx:Og8KaDR1tvoYQgT879dKBLUv0MVMlJknBEJg_QyFFg5kKveQh7Ch_UTM>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 24 Apr 2025 12:15:17 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: "Lira, Victor M" <VictorM.Lira@amd.com>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Xenia.Ragiadakou@amd.com,
	Alejandro.GarciaVallejo@amd.com
Subject: Re: [RFC] xen/x86: allow overlaps with non-RAM regions
Message-ID: <aAoPNTsLjMMfsHvJ@mail-itl>
References: <alpine.DEB.2.22.394.2504031755440.3529306@ubuntu-linux-20-04-desktop>
 <Z--0USril0UIhR4R@macbook.lan>
 <3c5dfd26-3c12-498b-aca4-0beac4e991a5@amd.com>
 <Z_jFSb2-efexUNlL@macbook.lan>
 <9ed89e50-c645-407d-80b4-5b78cb6e36fa@amd.com>
 <Z_zGdE91KwlYxu_A@macbook.lan>
 <ce06ec74-1a73-4a02-87fc-3e829399cc77@amd.com>
 <aAnvRMgJxAskbCtE@macbook.lan>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DiGgUl5sZK8OOW9n"
Content-Disposition: inline
In-Reply-To: <aAnvRMgJxAskbCtE@macbook.lan>


--DiGgUl5sZK8OOW9n
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Apr 2025 12:15:17 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: "Lira, Victor M" <VictorM.Lira@amd.com>,
	Jason Andryuk <jason.andryuk@amd.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Jan Beulich <jbeulich@suse.com>, Xenia.Ragiadakou@amd.com,
	Alejandro.GarciaVallejo@amd.com
Subject: Re: [RFC] xen/x86: allow overlaps with non-RAM regions

On Thu, Apr 24, 2025 at 09:59:00AM +0200, Roger Pau Monn=C3=A9 wrote:
> On Wed, Apr 23, 2025 at 04:51:16PM -0700, Lira, Victor M wrote:
> > [    4.570354] Intel(R) 2.5G Ethernet Linux Driver
> >=20
> > [    4.579535] Copyright(c) 2018 Intel Corporation.
> >=20
> > [    4.588898] sky2: driver version 1.30
> >=20
> > (XEN) [   21.644361] d0v3 unable to fixup memory read from 0xfe91000c s=
ize 4: -1
>=20
> This fault is unexpected, according to the identity mappings done at
> domain build time:
>=20
> d0: identity mappings for IOMMU:
>  [00000000a0, 00000000ff] RW
>  [0000009bff, 0000009fff] RW
>  [00000cabc9, 00000cc14c] RW
>  [00000cc389, 00000cc389] RW
>  [00000cc70a, 00000cd1fe] RW
>  [00000ce000, 00000cffff] RW
>  [00000fd000, 00000fd2ff] RW
>=20
> The page at 0xfe910 should be covered by the last range above.  I
> think we have a bug somewhere that unexpectedly unmaps that address.

You sure? 0xfe910 is outside of [00000fd000, 00000fd2ff].

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--DiGgUl5sZK8OOW9n
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmgKDzUACgkQ24/THMrX
1ywMqQf6AksEN1hvyqXWFLs4R+dOImpkM5FWFJTe93r0SEJb5lJ18tA9wCl9w8S5
JOsPxeMd4ZEdD8R4AlJwW5U70IXKKI+QkyrZZ9ddVtDz9XmapcTegSnN0bVbrTK9
oFSiTA2gi4MW0bD8F7kEtz0BcOFXwhnvlGnu58vdlMeFCevyzc4XYvGzTRmrzltw
nX2i8zICeAhoNKXCtUO9n0MMSkaPSmQWhYszn8SovjZVrrAwG8ruxof9VE54gdPA
bIzL749lmRGx3CCAsrywJBRC6szSp7Mz1GPcTTqpOzGz4+4wEiTSw1qGFqyI/T5P
S5lW/cCZgHFg+CnfGaNsgMBPssgczg==
=/jyu
-----END PGP SIGNATURE-----

--DiGgUl5sZK8OOW9n--

