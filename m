Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7BF6A09A5
	for <lists+xen-devel@lfdr.de>; Thu, 23 Feb 2023 14:08:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.500355.771693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVBKj-0006Bz-Ka; Thu, 23 Feb 2023 13:08:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 500355.771693; Thu, 23 Feb 2023 13:08:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pVBKj-00069V-HU; Thu, 23 Feb 2023 13:08:25 +0000
Received: by outflank-mailman (input) for mailman id 500355;
 Thu, 23 Feb 2023 13:08:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Qn+w=6T=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1pVBKh-00069P-IX
 for xen-devel@lists.xenproject.org; Thu, 23 Feb 2023 13:08:24 +0000
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 24b2a7e6-b37b-11ed-88bb-e56d68cac8db;
 Thu, 23 Feb 2023 14:08:21 +0100 (CET)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id F284E320097D;
 Thu, 23 Feb 2023 08:08:17 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 23 Feb 2023 08:08:18 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Feb 2023 08:08:15 -0500 (EST)
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
X-Inumbo-ID: 24b2a7e6-b37b-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1677157697; x=
	1677244097; bh=tC+EKaTyhfy6CUNQVZY9EIZIrBIujtfGARt93sd6F5U=; b=R
	SZb8NArHqBf7oClawfys+UU+GAEg0cAkBFVYQZMgR6SzijLKErNX5hcaFhRS149f
	wWP+yq9jcb1v3ztMCSPak38E8peNjnU1txa4Xs24GfStDVR4RkGk2Sn1+Z1/P/gc
	qhyM6KD45jMxg0LzrlTwsxx5bHdonLS3AwAOXvjW6IyritLg9UYKxkkWOT8iL+Cx
	ySr/IpXAF8n3pKoip9nnLLFiDNyo7skgBKziDEbdTh6rQVJ8u4EmqoTJDDXnFUMQ
	QGHGpo0u/XNAkVuzPUlVOk0fkP8ImFKSd/QDNZIHUzLcW2gBOTJnFa8yhOxng+hr
	c7+T7yrQ9d4zfR+NT1c9A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1677157697; x=1677244097; bh=tC+EKaTyhfy6CUNQVZY9EIZIrBIu
	jtfGARt93sd6F5U=; b=W0oXX0szqDgdSTeB/KEeZh7Cl2cIze+CyzopAHfap8qN
	32R3ImpWrthY81ghneDUHxt/l+imx11Zi/u/2FYTZx2EQRUAwq93fU92+qqoFrSL
	Zk43bB2tKEzoq42Yp+64gWr+X5ys09o73ALmW2p/y59r0DmZUdOpxN5+poGtaUt4
	nFEHL2ZkkL/RKZRIQWbKJINKLa7y7pz7IVeG+43qsbZ8St/TwMOoRI0JIyJ+YSod
	EI/ekuY4ZalUPN/Yk2FhEUuSZCAfX5Jibu9/ttnC/iVXmdifA8ljOcd6x7uBz4w4
	seQ+1rpA3/KreXTETgnUQeJNyViGo8NsTbKvJtOmfw==
X-ME-Sender: <xms:QWX3Y-cALZPLDFRmrgAasX6NAmZMiNBHqSvSEInLXXWyoR4t_vMQOA>
    <xme:QWX3Y4MI44e2YlgAyfKsYGDMgRuHPVl8AcveghOJ9_fk1-Nsv_fta2EGalkIQPZ4I
    e1Xymp_KmS8_Q>
X-ME-Received: <xmr:QWX3Y_ipdD_wZ3dWSKaLDSTDObT2aj6oUmNozCiy0o2J0FFLfi4Hs9U0HCQT1H2wxmTrfrHi59fd47pB8F4Ooaskfx3OK0UZxYc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudekuddggeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepieel
    uddvkeejueekhfffteegfeeiffefjeejvdeijedvgfejheetuddvkeffudeinecuffhomh
    grihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgr
    mhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhm
X-ME-Proxy: <xmx:QWX3Y7-a5NogF9kKH9qqiobUHkvEfTILKmkwfEfef_Hu6lUnVX1UFw>
    <xmx:QWX3Y6tBtRyxb2how8UiuD3__nZVc7oT2pA23BlcEt5ND1c5eT9NUw>
    <xmx:QWX3YyE0t2b2LM9iU6EJwWz_85q0ZGE-j3mMC8WsiNS4Z8GMhIhujQ>
    <xmx:QWX3Y8U_3D50lyxSKr0QjsyG31TCZxXhFkO7Y0iwBNrRZ0dmlmqfsA>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 23 Feb 2023 14:08:13 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] Call SetVirtualAddressMap() by default
Message-ID: <Y/dlPXeJlPRwEB1s@mail-itl>
References: <9a0e5021a612951c4174c45099edc8a4fb5bd3bb.1677091168.git.demi@invisiblethingslab.com>
 <dc46acc1-9eb9-8091-28df-405a66879a85@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Qf6HhAtMH2yMFTkg"
Content-Disposition: inline
In-Reply-To: <dc46acc1-9eb9-8091-28df-405a66879a85@suse.com>


--Qf6HhAtMH2yMFTkg
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Feb 2023 14:08:13 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH] Call SetVirtualAddressMap() by default

On Thu, Feb 23, 2023 at 11:16:28AM +0100, Jan Beulich wrote:
> On 22.02.2023 20:14, Demi Marie Obenour wrote:
> > To quote Andrew Cooper:
> >=20
> >> I know we've had this argument before, but not calling
> >> SetVirtualAddressMap() isn't a viable option.  It's a prerequisite to
> >> function on literally millions of devices
> >=20
> > Qubes OS has been shipping EFI_SET_VIRTUAL_ADDRESS_MAP for years, and I
> > believe OpenXT and EVE ship it as well. Mark EFI_SET_VIRTUAL_ADDRESS_MAP
> > as SUPPORTED and enable it by default.
>=20
> This is insufficient justification. The main reason why we don't call
> it is because it can be called only once. Any entity taking over later
> (e.g. via kexec) can't do anything anymore about the virtual address
> associations once set. Hence what's needed to justify a change like
> this is an explanation of why this restriction is not really an issue
> to anyone in any case.

AFAIR from the discussion about the original patch, kexec under Xen does
not preserve runtime services working anyway, so this limitation is more
about some possible kexec implementation in the future, not actually
breaking something right now. And since Linux calls
SetVirtualAddressMap() _and_ supports kexec just fine, it's definitely
possible to design this future kexec extension to work after
SetVirtualAddressMap() too.

Relevant parts of that older discussion:
- https://lore.kernel.org/all/272a9354-bcb4-50a4-a251-6a453221d6e3@citrix.c=
om/T/#u
- https://lore.kernel.org/all/20191009235725.GT8065@mail-itl/T/#u

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--Qf6HhAtMH2yMFTkg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmP3ZTwACgkQ24/THMrX
1yzLBggAlJUX6xnte1Yvtl2HFhnzX/AW+FzB4FV3hWSaJH2gmqurshobv4tCR2qe
aRb32CUPiG7PKwWIbBxQfsMsdKMMZb6UJgqyLmeqGCf3ktdWtvfDVVj17bBTXIEo
R0cGXexrh2kIUp+41OL/aob0OvOr8RbvjCWGgv0i4/JzL1AV0dL5/vd8Yj4GQDMm
3NRgZCIyl+HptTJBAD4PInI6IQq9TDNnjWnkksfDA3KPoKN70HlJTlTPUtf2MTtT
L6A1F1p+C2UX08YpwAAo1TFBkonYVUzNgpzC8T18dWwG2FrSMHhpqDK/4v9ncO9g
GLLJN+DyhJk4BSE1H/IvT58ETbfStg==
=Vrkm
-----END PGP SIGNATURE-----

--Qf6HhAtMH2yMFTkg--

