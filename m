Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D362A644D92
	for <lists+xen-devel@lfdr.de>; Tue,  6 Dec 2022 21:54:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.455543.713039 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2ex3-0007Ir-Ey; Tue, 06 Dec 2022 20:54:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 455543.713039; Tue, 06 Dec 2022 20:54:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p2ex3-0007F6-C7; Tue, 06 Dec 2022 20:54:05 +0000
Received: by outflank-mailman (input) for mailman id 455543;
 Tue, 06 Dec 2022 20:54:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mhi9=4E=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1p2ex2-0007F0-4J
 for xen-devel@lists.xenproject.org; Tue, 06 Dec 2022 20:54:04 +0000
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1bf7a823-75a8-11ed-8fd2-01056ac49cbb;
 Tue, 06 Dec 2022 21:54:02 +0100 (CET)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 2685C3200681;
 Tue,  6 Dec 2022 15:53:58 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 06 Dec 2022 15:53:59 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 6 Dec 2022 15:53:55 -0500 (EST)
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
X-Inumbo-ID: 1bf7a823-75a8-11ed-8fd2-01056ac49cbb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1670360037; x=
	1670446437; bh=AkgBJ3qAkEQO/DsyaJo9CWlLvoHIge8ZXPlKrw+Xs+s=; b=m
	xp8nTJIfbdhGk760i+9NAQ36Dju7mC4wtnMl3EYi3u/zzUNEFQeAUOzjZGI7dUP1
	mslkBkPj+6VhBn+9iGLTSV3i8S6h46G8nDQ2Ehzjx9VIoMle5MrEbFZ2BEZd2YeI
	tPIzeppTy920kyqVzfhOnwFe9qKpqzOH6UouFfVXN9+cmuficfNb3spCHf3zZ6kS
	JhyLnLKRwZKH6MdFn1PNjj2SMn6+3McwoWMRpJhUSSkxwSOaH8pCko0l04KOaSoE
	WKpWkK+DwNuSNmMhk8/QUkbyTf/aUkg3HWNJSC2JS0+AWWaBqpmis3NadnmVHi7Y
	uUKAmvyBKy7LJCce4FOxw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1670360037; x=1670446437; bh=AkgBJ3qAkEQO/DsyaJo9CWlLvoHI
	ge8ZXPlKrw+Xs+s=; b=LCsuCs6hdPpz8BnEGt+6fDY5Dn9a9c6C4gYLmIIBZDxj
	w0sLqWSkkXFEW7Df/IPzR3sPVdUsKH9yxaldTB+IzEOIYv0CsEfFAKHSSFRfGJJg
	ghRRFIf7iJx1bPI5j96nbPPWMDYUg68Xr1OpYn8W7sGcP1oFfjn43tDuLyJeVLaA
	ZxeYkxS0e5Kid9arln/oUlLPuRSMUPrrs5KSzjW9wTBh/d7FTpL01RRBdVeYi8Dm
	EiDUwwSI4QH4z/+L9FqnE8UhUD3KOqRwVnwbCDr9Ol8x1tjg7+ZxwcVAVerkgsze
	2lrcOB+eVnMVkO32DHEO3ZacKXYKr/nkTwweGBkI8g==
X-ME-Sender: <xms:5auPY-2Kr0sneLfy9J1IBsb9oJlJhOGf5TVnBll5W60-ELmYgxGXkA>
    <xme:5auPYxExAdGtU4F4b__HEtA2AtYC1CXxYX0PnXbbn9WjUBT25R277qUF8zneY-qpw
    6WG-x-86UiKQw>
X-ME-Received: <xmr:5auPY26CowCVGb28dVLppTQT671dY9g89I0mFuZfypFJquXkOB1G1pBLdx9zJE-jlz3DbWM3ubm0O_pGWv3GLo0_qVEOcj3FPA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeigddugedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:5auPY_3IGBOj9d8fP4i29je44p73jykzSjXiv0Lp33ot-ayWU6gP9A>
    <xmx:5auPYxGmoFFFmJT9tEJ2ss4Rl9BSX0A1q_hyn7BXYVluvH4KrwOciA>
    <xmx:5auPY4-XLG1bJXXW7e5SlYw71SsQbkSPC2hBrwd4Yb03MEUvqvPnpw>
    <xmx:5auPY26FeRUYZpLvQ4kAVhKspJXt4QlKfgvgRbP_QWZz16eStrN00Q>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 6 Dec 2022 21:53:53 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <George.Dunlap@citrix.com>,
	"Tim (Xen.org)" <tim@xen.org>, Juergen Gross <jgross@suse.com>
Subject: Re: [RFC PATCH 8/8] Use Linux's PAT
Message-ID: <Y4+r4Wphip1+yhlr@mail-itl>
References: <cover.1670300446.git.demi@invisiblethingslab.com>
 <9f0bd911ba6c7fe1b7285f232154d42807145ced.1670300446.git.demi@invisiblethingslab.com>
 <4b2a87e1-89d1-b5fb-bd92-b891c8cea98a@citrix.com>
 <Y4+Die8lcZUwwGmK@itl-email>
 <Y4+F9iujzOmoOAVe@mail-itl>
 <Y4+cYuLNfIbKGN+X@itl-email>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6lQh8AuYuEEEtM/P"
Content-Disposition: inline
In-Reply-To: <Y4+cYuLNfIbKGN+X@itl-email>


--6lQh8AuYuEEEtM/P
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 6 Dec 2022 21:53:53 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>,
	Roger Pau Monne <roger.pau@citrix.com>, Wei Liu <wl@xen.org>,
	George Dunlap <George.Dunlap@citrix.com>,
	"Tim (Xen.org)" <tim@xen.org>, Juergen Gross <jgross@suse.com>
Subject: Re: [RFC PATCH 8/8] Use Linux's PAT

On Tue, Dec 06, 2022 at 02:47:42PM -0500, Demi Marie Obenour wrote:
> On Tue, Dec 06, 2022 at 07:12:06PM +0100, Marek Marczykowski-G=C3=B3recki=
 wrote:
> > On Tue, Dec 06, 2022 at 01:01:41PM -0500, Demi Marie Obenour wrote:
> > > On Tue, Dec 06, 2022 at 11:38:03AM +0000, Andrew Cooper wrote:
> > > > 2) The translation logic between Linux's idea of cacheability and X=
en's
> > > > PAT values is buggy.
> > >=20
> > > How could I check for this?
> >=20
> > See Andy's unit test idea on #xendevel:
> >=20
> >     as a pretty simple "unit" test in dom0, it might be a good idea to
> >     have a module which watches the PTE in question, and cycles through
> >     various of the memremap_*() APIs and checks the raw PTE that gets
> >     written after Linux and Xen are done fighting with it
>=20
> Which PTEs should I check?

The ones adjusted by the memremap_*() call.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--6lQh8AuYuEEEtM/P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmOPq+AACgkQ24/THMrX
1yxyrQgAhllxa7uz08a3QlN4jzBh7zfAbkEC8x/fLssXpz79V22VRIJHBn8T8ltj
x/bRBC6YuTFmHunzCw5EwNb0UD8EgtTRBHLXiTOK/x34ZqYU4tyLT7XeKU5BxIfY
QdaazDQleH1ZY0YrC0RVFgO2RutkHRxxz6zKvq4RuBaHv/9WthJMntqyM0gx8ULe
7yndTIAvTcB9GLOOS2i/eWPHWQhjZhEs7nO3cTSBIltBFEjwwPwNLODwau3nvlMC
3+UW9mtCf9a2zJvIHRaDEU4mR1yoqFgDaKFOaQfQ6EB8Hekn5je8obbco6zJEg9W
UrQfO1xsg0LQiojPr3tM9M8olZC0oA==
=DhcA
-----END PGP SIGNATURE-----

--6lQh8AuYuEEEtM/P--

