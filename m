Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D03B96A46EB
	for <lists+xen-devel@lfdr.de>; Mon, 27 Feb 2023 17:24:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.502802.774795 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWgI8-00075y-1S; Mon, 27 Feb 2023 16:23:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 502802.774795; Mon, 27 Feb 2023 16:23:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pWgI7-00073w-UG; Mon, 27 Feb 2023 16:23:55 +0000
Received: by outflank-mailman (input) for mailman id 502802;
 Mon, 27 Feb 2023 16:23:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=vtXI=6X=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1pWgI5-00073q-Sj
 for xen-devel@lists.xenproject.org; Mon, 27 Feb 2023 16:23:54 +0000
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1dee41cd-b6bb-11ed-88bb-e56d68cac8db;
 Mon, 27 Feb 2023 17:23:51 +0100 (CET)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 3062B5C00D5;
 Mon, 27 Feb 2023 11:23:49 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Mon, 27 Feb 2023 11:23:49 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 27 Feb 2023 11:23:46 -0500 (EST)
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
X-Inumbo-ID: 1dee41cd-b6bb-11ed-88bb-e56d68cac8db
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1677515029; x=
	1677601429; bh=TT98fbPrsAnVgTTz/U2A9TwwJ3y9+jei+vvXNtF5ooI=; b=g
	nnoenF7mnMgy2S84lpP+RGMzzkDDPJwqVKi2XhFNv9/mzZyDdWnQRIVJeF+9xLsj
	JaPO0DRCExIoa6W40ELMGX2xx4QlocqUsoUrBoRW1ASEjjUDJV5lhL+bHCnb0V/q
	lMKVVFuTGHlcF28KlzLs31tc/5Kb71i43Yex1B+xDOkzas/sD4nYkh4ZgJXcqSyX
	Hkv0eR8ywjubxTEm7tGfoc1LPRT8SHPLxYt4/gCC6Z6HyXGZ/OElEohsxiAjC46b
	CJTZOFAvxuprQdri3ODZ3RAJkrbMBNBdMwmkTXNWAAiJddpwjZQX2oYhiUzVqd1b
	9YrHBkJ1HN6slQMPlH3VA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1677515029; x=1677601429; bh=TT98fbPrsAnVgTTz/U2A9TwwJ3y9
	+jei+vvXNtF5ooI=; b=lkCNkY+GzcPOxmC/UAzhRoNN8lCQQirbG6vD0PK67Bag
	n+wAs2frXwumVTfUoH8zkl6DFSJnkm71XM1xFlwCiLQBhnZO3sAEmASepZrsgoLK
	MGU4EH4YQ3EZKYwGd9MyR7Weo5WtnTeMG9jhQXlbVVzSKoLYRuCVsOt9woFd3glY
	KNAtbWkpVfWNRbRcni9K2T4izgbh0UnvNhCffh5ur7B44oBy2VstGZwSTsBAhp7N
	pIrSxBi048xYJd5jvi60ANeB5OK/aGmpzdhfKx23TipeWW2eVkUhBIwWZnoh1XsS
	Tcx1MgOt5injwpJzopxqkUpMRzYkUOAk0fiddry+dg==
X-ME-Sender: <xms:FNn8YzgvN6pxlD8oxWrIg5vj9DUQV3-FZos6EoBzkSI_pLNHL3tadQ>
    <xme:FNn8YwCHgW2igvr5oWkjV1yJGnemAuiEky8SWtdckWeEKVDPUeVk-IeYoiT61r3if
    6Az71FYhSpFSQ>
X-ME-Received: <xmr:FNn8YzHT0GpOybZx-5cHuHlEfdK5bGWZOMagwlRki8W907M2i4Pew46Sso8SJZtrx00I8xxcLZcv6Oqn4VntFHmtQsMC1ytLDGI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeltddgkeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:FNn8YwRet4wwiSCfc4Gs0qMIqEujK_bUQMdd7Nhh9EU-K7CWdzMWGQ>
    <xmx:FNn8Ywxkfginu4mjwnhG6jhZqpj4yDgNviwJ-AQP_ZXBwKfi18Sg3g>
    <xmx:FNn8Y279qU8GqIdhGyxr51gmJI9elCd0ZdQG_mfTbXdVj-KqliHo4g>
    <xmx:Fdn8Y8gSHexd9aTe1ZzJpZ9uByDXVyavMHMCG_RdIvXwZLvzyf01Fg>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 27 Feb 2023 17:23:43 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>, Julien Grall <julien@xen.org>,
	George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH v2 1/4] tools: rename xen-tools/libs.h file to
 common-macros.h
Message-ID: <Y/zZDxWR0sG7DULn@mail-itl>
References: <20230227154153.31080-1-jgross@suse.com>
 <20230227154153.31080-2-jgross@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6PMJ75IG6KqTb/H3"
Content-Disposition: inline
In-Reply-To: <20230227154153.31080-2-jgross@suse.com>


--6PMJ75IG6KqTb/H3
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 27 Feb 2023 17:23:43 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Tamas K Lengyel <tamas@tklengyel.com>,
	Alexandru Isaila <aisaila@bitdefender.com>,
	Petre Pircalabu <ppircalabu@bitdefender.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Ross Lagerwall <ross.lagerwall@citrix.com>,
	Christian Lindig <christian.lindig@citrix.com>,
	David Scott <dave@recoil.org>, Julien Grall <julien@xen.org>,
	George Dunlap <george.dunlap@citrix.com>
Subject: Re: [PATCH v2 1/4] tools: rename xen-tools/libs.h file to
 common-macros.h

On Mon, Feb 27, 2023 at 04:41:50PM +0100, Juergen Gross wrote:
> In order to better reflect the contents of the header and to make it
> more appropriate to use it for different runtime environments like
> programs, libraries, and firmware, rename the libs.h include file to
> common-macros.h. Additionally ad a comment pointing out the need to be
> self-contained.
>=20
> Suggested-by: Andrew Cooper <andrew.cooper3@citrix.com>
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V2:
> - new patch
> ---

For this (assuming header rename itself will be acked):

>  tools/python/xen/lowlevel/xc/xc.c                  |  2 +-

Acked-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>


--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--6PMJ75IG6KqTb/H3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmP82Q8ACgkQ24/THMrX
1yy1bAf+N1xPbmUjnZ3RvdvXrrZ01d5p92WNW8nmd8/V6lR86RiU99LrfFTpIah3
tRqSsqxUjGxFVEpMju/Un7abBfK1pJ4n7Qy/Lri5vdRiL8qVQvUG/E3dVCLUVv8r
hIGXqqF5iF9Am32hOM26cZj4VrxvuMoiI1+Sn3RHA7nM634dR7cX7qfxmHqdnL6S
ouII4lDBeCJqi50QFEtXsb2JR6qAJtO0l/cetAoNRb/IIRSZURGIP7fkXnxyf6GG
VhbsXZ8QcZ9rAghbbH9SBqIzvxyuv6uBwcJmIFODQtc6PepMcrJjiRFiAgDUD++x
3/YMnNNNRL6sCF2yVLcHMoiryLVRbQ==
=cJ0k
-----END PGP SIGNATURE-----

--6PMJ75IG6KqTb/H3--

