Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE08E52DA6F
	for <lists+xen-devel@lfdr.de>; Thu, 19 May 2022 18:40:52 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.333152.556936 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrjCI-00073w-3s; Thu, 19 May 2022 16:40:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 333152.556936; Thu, 19 May 2022 16:40:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrjCI-00071o-0p; Thu, 19 May 2022 16:40:22 +0000
Received: by outflank-mailman (input) for mailman id 333152;
 Thu, 19 May 2022 16:40:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Krf0=V3=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1nrjCG-00071i-96
 for xen-devel@lists.xenproject.org; Thu, 19 May 2022 16:40:20 +0000
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5c4f5cb1-d792-11ec-bd2c-47488cf2e6aa;
 Thu, 19 May 2022 18:40:17 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id E0FEC3200976;
 Thu, 19 May 2022 12:40:12 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Thu, 19 May 2022 12:40:14 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 19 May 2022 12:40:10 -0400 (EDT)
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
X-Inumbo-ID: 5c4f5cb1-d792-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm1; t=1652978412; x=
	1653064812; bh=iyV8Eu14mHuegnfdclejo0S/9e+seMI1lnnSy6NkAK4=; b=E
	AiFsdBDzYgW5IFDHFRT9kLEZc6KU5gvX0jMc3PeOBK9928OjngEwI/C2XbM4Oc6+
	/+putqYFBX/iPXqzO59LLClAAkji+prFK1oPtxEmlTTy8ABHvJw1oxcR9j+KQ0VD
	JDHm4wMA5dtH0lYPYabAMG/detnsYJ7d0eW2ut+77d5AixjZEnJ+qpDe69b2OoXz
	xycTI4VvwC5Br2mo/Jz3ls9NS/aYIkuJ5VLnhZy38yjkuTi3CZreiQbL2v2jDuW0
	nU/vEd0jmsLEwSY2p14CYJswQunuSNCKcTTJNZjgsER0+fzlyaAjsBDfDN0RPTyR
	ZKlx606YDCRarILOTMhmQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1652978412; x=1653064812; bh=iyV8Eu14mHuegnfdclejo0S/9e+s
	eMI1lnnSy6NkAK4=; b=wboXbzf7gyIUHkCYjUmsq2UDBZMwfK2FP6TVvWTkr3n3
	lPOE2CVN829Wqbv8jv5XI5sCOah2+2gYj/VCmhyFlu1GnFtLBL6YkOXejfU09PSE
	rsvAXL/rtyNNnEprkfO8Ud1KT0o5a9T9wb/1sNpjCip7UFD2U8FPhIX8azJ1Yuu3
	B0Dm6cdXdMNXDifzbOr+O90Ut31G8r0dnjwo8ozgQV6vjgkpHzV2XIgP9yFPyOrQ
	IalkVDHLk/Dm/lAPTRq1kOlcWeQakBcdG1BczKlGUjKskivNtfVsOIddGj3t7N5o
	258Oxavq3PrGr1MWGa+5giUCIHn61evk5r9IRsxvGw==
X-ME-Sender: <xms:63KGYibA8cQFR6tmQAM4Kb67ntVmtQw6y8QgBkRcqJJxUODflRqDBA>
    <xme:63KGYlYQj2xoEsUpir2VffFuYE2NobmqwKUWryGZtXPdzn_Whm0Gr2M0eedpBJa5u
    Z1Vfin0tdH76FM>
X-ME-Received: <xmr:63KGYs-QP1yaYMAGdVA2UD6ym30TS3gm3y2TfxgyN5SouV6l2MVufwqPVc2g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedriedugddutddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepffgvmhhi
    ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepuedthefhtddvffefjeejvdehvdej
    ieehffehkeekheegleeuleevleduteehteetnecuffhomhgrihhnpehgihhthhhusgdrtg
    homhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegu
    vghmihesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:63KGYkoO4qh2TTHW_AWOAQri-ymBDx1U52iBwoserjjcj9BjIu4iTQ>
    <xmx:63KGYtpVkpUjzBan5-D2k-E6ZNUfi3dvTUx6RmhHtmNdO9lDUazFPA>
    <xmx:63KGYiQGT9pxxxkrvWfxxlAwYUlSKFqEN4P9x3Nmu7seVG-Z1zFuqw>
    <xmx:7HKGYu625XycL6RnKiYuUANQ4U-mLSXYHcjXrtBi4Rj3bpJrAJIyTw>
Feedback-ID: iac594737:Fastmail
Date: Thu, 19 May 2022 12:39:40 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>,
	Xen developer discussion <xen-devel@lists.xenproject.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Boris Ostrovski <boris.ostrovsky@oracle.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	linux-kernel@vger.kernel.org,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
	David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
	Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
	DRI Development <dri-devel@lists.freedesktop.org>,
	Linux Memory Management <linux-mm@kvack.org>,
	regressions@lists.linux.dev
Subject: [REGRESSION] Hang in 5.17.4+ that appears to be due to Xen
Message-ID: <YoZy6BRIkfoeY8af@itl-email>
References: <Yn/Tgj1Ehs/BdpHp@itl-email>
 <55436ae1-8255-1898-00df-51261080cd41@suse.com>
 <YoJZcUsiE3y6oul5@itl-email>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="P1/QErjS2jIercDB"
Content-Disposition: inline
In-Reply-To: <YoJZcUsiE3y6oul5@itl-email>


--P1/QErjS2jIercDB
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 May 2022 12:39:40 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>,
	Xen developer discussion <xen-devel@lists.xenproject.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Boris Ostrovski <boris.ostrovsky@oracle.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	linux-kernel@vger.kernel.org,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
	David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
	Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
	DRI Development <dri-devel@lists.freedesktop.org>,
	Linux Memory Management <linux-mm@kvack.org>,
	regressions@lists.linux.dev
Subject: [REGRESSION] Hang in 5.17.4+ that appears to be due to Xen

On Mon, May 16, 2022 at 10:00:07AM -0400, Demi Marie Obenour wrote:
> On Mon, May 16, 2022 at 08:48:17AM +0200, Juergen Gross wrote:
> > On 14.05.22 17:55, Demi Marie Obenour wrote:
> > > In https://github.com/QubesOS/qubes-issues/issues/7481, a user report=
ed
> > > that Xorg locked up when resizing a VM window.  While I do not have t=
he
> > > same hardware the user does and thus cannot reproduce the bug, the st=
ack
> > > trace seems to indicate a deadlock between xen_gntdev and i915.  It
> > > appears that gnttab_unmap_refs_sync() is waiting for i915 to free the
> > > pages, while i915 is waiting for the MMU notifier that called
> > > gnttab_unmap_refs_sync() to return.  Result: deadlock.
> > >=20
> > > The problem appears to be that a mapped grant in PV mode will stay in
> > > the =E2=80=9Cinvalidating=E2=80=9D state until it is freed.  While MM=
U notifiers are
> > > allowed to sleep, it appears that they cannot wait for the page to be
> > > freed, as is happening here.  That said, I am not very familiar with
> > > this code, so my diagnosis might be incorrect.
> >=20
> > All I can say for now is that your patch seems to be introducing a use =
after
> > free issue, as the parameters of the delayed work might get freed now b=
efore
> > the delayed work is being executed.
>=20
> I figured it was wrong, not least because I don=E2=80=99t think it compil=
es
> (invalid use of void value).  That said, the current behavior is quite
> suspicious to me.  For one, it appears that munmap() on a grant in a PV
> domain will not return until nobody else is using the page.  This is not
> what I would expect, and I can easily imagine it causing deadlocks in
> userspace.  Instead, I would expect for gntdev to automatically release
> the grant when the reference count hits zero.  This would also allow for
> the same grant to be mapped in multiple processes, and might even unlock
> DMA-BUF support.
>=20
> > I don't know why this is happening only with rather recent kernels, as =
the
> > last gntdev changes in this area have been made in kernel 4.13.
> >=20
> > I'd suggest to look at i915, as quite some work has happened in the code
> > visible in your stack backtraces rather recently. Maybe it would be pos=
sible
> > to free the pages in i915 before calling the MMU notifier?
>=20
> While I agree that the actual problem is almost certainly in i915, the
> gntdev code does appear rather fragile.  Since so few people use i915 +
> Xen, problems with the combination generally don=E2=80=99t show up until =
some
> Qubes user makes a bug report, which isn=E2=80=99t great.  It would be be=
tter if
> Xen didn=E2=80=99t introduce requirements on other kernel code that did n=
ot hold
> when not running on Xen.
>=20
> In this case, if it is actually an invariant that one must not call MMU
> notifiers for pages that are still in use, it would be better if this
> was caught by a WARN_ON() or BUG_ON() in the core memory management
> code.  That would have found the bug instantly and deterministically on
> all platforms, whereas the current failure is nondeterministic and only
> happens under Xen.
>=20
> I also wonder if this is a bug in the core MMU notifier infrastructure.
> My reading of the mmu_interval_notifier_remove() documentation is that
> it should only wait for the specific notifier being removed to finish,
> not for all notifiers to finish.  Adding the memory management
> maintainers.

Also adding the kernel regression tracker.

#regzbot introduced v5.16..v5.17.4
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--P1/QErjS2jIercDB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmKGcugACgkQsoi1X/+c
IsG0sg//ZqBwhdpDjpK+PYyQI+aJdCfEVMWueglKYpsUmrNPhYgxCNbALIrELYEy
Tw9tkJGJU7ENVh81aaAx6tCfj4wHEbxX6EOJzuTiwwAVtMHqeoPzX9d6vygcqWXL
TJpjCVhcQ/F+kIjZcjPq2F7eIfmj2w+gfi64X0h0CtkNCVoFaiD638Hp0T/OF6sb
yvgcleR94ObA6Tjz1jGFddEZSrQPEpZ4RVIg/Ak6OIHSI3phEtbwfoDyig59FT6O
U5KmBswlz/7jTyjl9UPKLMEZidv3LWBbhEICX/6rCvZUPpdQ/hi3FlkpjMFh00wz
vVAq4JIkvfY0YrOZHnHqitjZSLcpIvH7aVTxP0iWa6fGBopua0ZeyNDSmL6uFe6D
MbvfojPY04p20pkuma3OfR1WIkAstnZdOn9oxGMbGokvGBd1lWZLbe94YZzV9bvi
HTCVN2pn/YCRqktnUyAiaIQcnHKzEoEe7pDJR4OgNND0l9mg/GBMS9y7mHfw9SMI
4fSZr8xMgLwnUYHLFIFdfGaOlsf6wNhGOWGROY7FpetrlJ+R8A9x6SxBfVq9VffF
B9Pu7kwEnIgaCGrwcQz6mU1h0Hz7fS7Ffig9YepRlYmNHuC1zhM2PraUjkbm+IRE
2NU3mQjopmT5Nb+gWTNgt2m0jo3K+z6GcMSvcYoQ4ef66GjW9A8=
=KIy2
-----END PGP SIGNATURE-----

--P1/QErjS2jIercDB--

