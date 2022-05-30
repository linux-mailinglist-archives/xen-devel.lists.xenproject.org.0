Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC5F5386E9
	for <lists+xen-devel@lfdr.de>; Mon, 30 May 2022 19:51:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.338713.563522 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvjXC-0004h9-9e; Mon, 30 May 2022 17:50:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 338713.563522; Mon, 30 May 2022 17:50:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nvjXC-0004di-6J; Mon, 30 May 2022 17:50:30 +0000
Received: by outflank-mailman (input) for mailman id 338713;
 Mon, 30 May 2022 17:50:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=wtgc=WG=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1nvjXA-0004dc-0Z
 for xen-devel@lists.xenproject.org; Mon, 30 May 2022 17:50:28 +0000
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fb5111e6-e040-11ec-bd2c-47488cf2e6aa;
 Mon, 30 May 2022 19:50:25 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 94CB55C0076;
 Mon, 30 May 2022 13:50:23 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Mon, 30 May 2022 13:50:23 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 30 May 2022 13:50:22 -0400 (EDT)
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
X-Inumbo-ID: fb5111e6-e040-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1653933023; x=
	1654019423; bh=HYNcAzcvwA3jPOCMpvHYfWi0Skxi5GTfqaUV0qrK9gg=; b=S
	pth8jQdSuwO44sgJMv3Y/gIHQTpHZs7u2XzstVORSqkekW5iLTQthWKeXk4kdDGs
	mzhaH4W/e6bDoH9yiD3hQiUzRhquJZXpWXJYU9jdwWJgUykV7GJg/rbfB1pTKVC0
	4pXA4P50DLAHQX35VMnzfZn+4RNmTZ7fXz6EqM6AMl8e+EJ+e/Pr3JbPfivGwVc9
	AesmDKjQw+gSd9z4g60SEyyoSD6eeoS+UWFTwF3rnsnlLJMt7Wpti04xq9X6eRCD
	XH2XuDRuPeUtBMT0LhiX1zPNVPwMl6Bbvw2mNo9KAHB/610qmgwLenAAocAMmy84
	UqFyzSzZaViuKAG/FNQxw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1653933023; x=1654019423; bh=HYNcAzcvwA3jPOCMpvHYfWi0Skxi
	5GTfqaUV0qrK9gg=; b=motbhBUaedsrcp8VBHcEXOM7zJtYgWkWTCLIGce60Pex
	NgePkc1lkZcnd8qB6TuXgfKQ5CabyBuilZzHTNKlIq1QLOhw7ORU3dufS8wBOlhr
	BI37skxdCWZ9uBQ/gRoJ7w+TbWm40CZur8ERsdUwVY1tpTpDJbKpbuan7y2f9FpL
	ireLzXAOVOsQf2WTIRxEhimz0lce8mUy31JZsi70fjXJ+oYmkXKR2Xontut+FvZq
	tSz+SQKT6TVHhAdRKAfkIq22eqHXJ8wS7MNip4IehFsMdCeW+yHv4CZ+zDUUEdB3
	+vF4YhbvgMOIRhaicG61Myv3HXcMgnl8wyaorZ3eCg==
X-ME-Sender: <xms:3gOVYjlzBz9YZzJlJESVixC8NY-hyK3T07xFExjhQImxsTTMzhEfhw>
    <xme:3gOVYm1hM3aNtnOmeTx3Ci_YsQBaJxlFYJcqQ68wfslKIHIKv418-N0-uxud69jc7
    L5hOPWxrSDuHeA>
X-ME-Received: <xmr:3gOVYprBRMtMGMtQMgnDi_pasorwka3jsQij_cU-jQPdI6gs1IYzis_PfyY1>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrkeeigdduudefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepffgvmhhi
    ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepuedthefhtddvffefjeejvdehvdej
    ieehffehkeekheegleeuleevleduteehteetnecuffhomhgrihhnpehgihhthhhusgdrtg
    homhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegu
    vghmihesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:3gOVYrk2Ep01XP_9ABWxv3Ys7wNAAkhn6JbFi1O6Bvtz26sjqu4UCw>
    <xmx:3gOVYh1Hu1pt2OH1pYuVL53UyLLlsc-SZxoxz2uzgzXjy6HdMfFt8w>
    <xmx:3gOVYqvxQxktpotj1P-djgSAvb5yVaVSw4C99Dh_SQsiDTPQlF1xQQ>
    <xmx:3wOVYp86AkeK_yh4n0H2p9_8v2Xh4hwLML3ofnlECYn-9y3pY2BwcA>
Feedback-ID: iac594737:Fastmail
Date: Mon, 30 May 2022 13:50:18 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jennifer Herbert <jennifer.herbert@citrix.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] xen/gntdev: Avoid blocking in unmap_grant_pages()
Message-ID: <YpUD3PnPoGj84jMq@itl-email>
References: <20220525184153.6059-1-demi@invisiblethingslab.com>
 <00c0b10c-a35d-6729-5b4f-424febd9d5a3@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+4H1oyCNBJ2i7PTh"
Content-Disposition: inline
In-Reply-To: <00c0b10c-a35d-6729-5b4f-424febd9d5a3@suse.com>


--+4H1oyCNBJ2i7PTh
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 30 May 2022 13:50:18 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Jennifer Herbert <jennifer.herbert@citrix.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: xen-devel@lists.xenproject.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] xen/gntdev: Avoid blocking in unmap_grant_pages()

On Mon, May 30, 2022 at 08:41:20AM +0200, Juergen Gross wrote:
> On 25.05.22 20:41, Demi Marie Obenour wrote:
> > unmap_grant_pages() currently waits for the pages to no longer be used.
> > In https://github.com/QubesOS/qubes-issues/issues/7481, this lead to a
> > deadlock against i915: i915 was waiting for gntdev's MMU notifier to
> > finish, while gntdev was waiting for i915 to free its pages.  I also
> > believe this is responsible for various deadlocks I have experienced in
> > the past.
> >=20
> > Avoid these problems by making unmap_grant_pages async.  This requires
> > making it return void, as any errors will not be available when the
> > function returns.  Fortunately, the only use of the return value is a
> > WARN_ON(), which can be replaced by a WARN_ON when the error is
> > detected.  Additionally, a failed call will not prevent further calls
> > from being made, but this is harmless.
> >=20
> > Because unmap_grant_pages is now async, the grant handle will be sent to
> > INVALID_GRANT_HANDLE too late to prevent multiple unmaps of the same
> > handle.  Instead, a separate bool array is allocated for this purpose.
> > This wastes memory, but stuffing this information in padding bytes is
> > too fragile.  Furthermore, it is necessary to grab a reference to the
> > map before making the asynchronous call, and release the reference when
> > the call returns.
>=20
> I think there is even more syncing needed:
>=20
> - In the error path of gntdev_mmap() unmap_grant_pages() is being called =
and
>   it is assumed, map is available afterwards again. This should be rather=
 easy
>   to avoid by adding a counter of active mappings to struct gntdev_grant_=
map
>   (number of pages not being unmapped yet). In case this counter is not z=
ero
>   gntdev_mmap() should bail out early.

Is it possible to just unmap the pages directly here?  I don=E2=80=99t think
there can be any other users of these pages yet.  Userspace could race
against the unmap and cause a page fault, but that should just cause
userspace to get SIGSEGV or SIGBUS.  In any case this code can use the
sync version; if it gets blocked that=E2=80=99s userspace=E2=80=99s problem.

> - gntdev_put_map() is calling unmap_grant_pages() in case the refcount has
>   dropped to zero. This call can set the refcount to 1 again, so there is
>   another delay needed before freeing map. I think unmap_grant_pages() sh=
ould
>   return in case the count of mapped pages is zero (see above), thus avoi=
ding
>   to increment the refcount of map if nothing is to be done. This would e=
nable
>   gntdev_put_map() to just return after the call of unmap_grant_pages() i=
n case
>   the refcount has been incremented again.

I will change this in v3, but I do wonder if gntdev is using the wrong
MMU notifier callback.  It seems that the appropriate callback is
actually release(): if I understand correctly, release() is called
precisely when the refcount on the physical page is about to drop to 0,
and that is what we want.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--+4H1oyCNBJ2i7PTh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmKVA9wACgkQsoi1X/+c
IsF9ZBAAikctLY/AMtbOiBJtLzm10XD7eKKXsULHrVKCvoqXCVKzLGw58uboGyGB
hrLD5nM0b5fkiOdvsHuau4hm72mJIX7m/WBrtpUStMeipOUl5dZWNuz5NENNGnsx
y5zafYGmc3VSx+bAv7+K8xb8GNJCX9HkNXT4frPrnYPSC4b/SzFpdxQyCQhreyyx
4w8FYVcSC0piMYJ5qY1JfZUIukFLGoCP0ckmn/lsjeYkTCG1FdxMYUdgkD7bLowr
a34wI8z5a38UKADYZMdCdKuDR7zVvdj3hMrmuRsQygRhnYkzTCpWT8/3tkM8+cxP
VnriSTIWNI8mnfbub1po8OmQJ3A1oIEYItiONFxhHXUmRxNwPkNwWpT3KdX6vk63
xmA1rUvuBfmVFlBQ3Oa2WJWUhknSxfcHA+g5/MDqKzoA5gv7h//O1lIAEwmgLXkb
EHXPzI5KJmA/MyuMaILpCmJP6dI2OoWHv9fn+b+piG0Jlc+VUOBAB/yyXK3hKjLp
C0sIJ4LIdrCTDnCr9enl69IuVH+yoIicflGuXmB7lWn5VO8rTgRz/RVpzdWNvVdM
YJp5gvWl6JM/fwFcPBGVZmQArGubWKEaQ3LO1YOadIcOBuogOpCipsOBaYUPQ/Yc
9yI54267qpe32hXoC5kiVVUSassMgvi70p142cl7csLbhNRbJ8A=
=PRoO
-----END PGP SIGNATURE-----

--+4H1oyCNBJ2i7PTh--

