Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B89E653DD0
	for <lists+xen-devel@lfdr.de>; Thu, 22 Dec 2022 11:01:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.468404.727499 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8INd-0007Ho-SU; Thu, 22 Dec 2022 10:00:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 468404.727499; Thu, 22 Dec 2022 10:00:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p8INd-0007EN-P3; Thu, 22 Dec 2022 10:00:49 +0000
Received: by outflank-mailman (input) for mailman id 468404;
 Thu, 22 Dec 2022 10:00:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s9VX=4U=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1p8INc-0007EH-DI
 for xen-devel@lists.xenproject.org; Thu, 22 Dec 2022 10:00:48 +0000
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 811d512b-81df-11ed-91b6-6bf2151ebd3b;
 Thu, 22 Dec 2022 11:00:47 +0100 (CET)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 1E2D43200063;
 Thu, 22 Dec 2022 05:00:45 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 22 Dec 2022 05:00:45 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Dec 2022 05:00:43 -0500 (EST)
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
X-Inumbo-ID: 811d512b-81df-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1671703244; x=
	1671789644; bh=+w3WSY0c/uMG1tHSVcU8TJZR3ot/GHWuEknsItEmruE=; b=M
	1DP4aFw8pMRTeiVe7KzDeZw+tBTJ1z7vnxO2MAJ2ll5UvwSJDeQP7eHfFNUR8719
	L5ttrEr3NpvC5saHbGcAmG84/SHTmpSqT8ZtX/iqUmnIe8K1myzj1yP702oEZuPp
	BkgyYi5lXUF1GsCIhOAAG6vlmKe+wbV3dfCtNXWTYNvb9dxeTEzlFFZ0kqLaAEPi
	0If0bAhDoe6W1SER/ztXAAaIeJBGcQkiifVTiBzx53rEpAydfr1y+PVnoA8kdesv
	ZPziZbp/Lk721DuK5WtOw1UX8bTOOoFlcG7eiAmSiU0ZOuPJ0Vg/ZLikxeYhl0Em
	w909htdWIaYWOSKaEW6Kw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1671703244; x=1671789644; bh=+w3WSY0c/uMG1tHSVcU8TJZR3ot/
	GHWuEknsItEmruE=; b=T6rojTKgd46AliecfXhKe7lPGBhKtBLI0HXyFV+JvWX0
	oEdX37fOk59g/BvdaXrkRAyjBpttS9+YdQCGcWOKwOYI4/Wx2neLihN5A5IwL6J8
	vzqWKijB4iYJNFVxNvMPgArhqb9hbeUnG3E6/Vzdb3U5S0mU/xfmZCyL/avx5nfR
	9Yl9hzJezlAwvmzvO+v0w97yPB0Odeso+n2GJE5QdYTDtUJ1wiMrEYol40LUzO+y
	IG0PvtTU31MAH+2GfKeEG4Uw8K5aNYi9JmldE/KG6hGkeLkWhNUL74yKA2F3CIHV
	en9pIRnLF1tATTMu+aC9i6lMyN449Om/KsddKJ9wJg==
X-ME-Sender: <xms:zCqkY5IjxgH1sGUtlEBwZELOhl9-Kk8C2JqVku4cy2_MTkL-goRLTw>
    <xme:zCqkY1Jt4HOtx8B3bXS37FWcDu-e7MfpdkpuZLbXxBrzxN0ZhPYpC-d9c8o_VYsrq
    V2TKPAHOoaIGvI>
X-ME-Received: <xmr:zCqkYxuQvtNH6FbggIsdl4K27gHqzg85QaywOeeKgPi4nRi3YvRQ2DMAhegr>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrhedtgddutdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpedvjeetgeekhfetudfhgfetffegfffg
    uddvgffhffeifeeikeektdehgeetheffleenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
    rggsrdgtohhm
X-ME-Proxy: <xmx:zCqkY6YJY-UC_lCKTWIOc51Xo8UFJgcRsl-_8jZs8dKVhlZ4Pgy3pw>
    <xmx:zCqkYwYEIrv4ULwimHCdZ5oM7AqyUn1I2ACXOLz833kr6lOoqyzASw>
    <xmx:zCqkY-C2h6cgOGSiEKC-tDU1ASdGJ5odk7sKNMSWnRGk8i9zGBdKsw>
    <xmx:zCqkYw7wZ2hfF7DCqrzhPPd9F6RJYpXleJYGGv8dxu4MwQy0mE4p1Q>
Feedback-ID: iac594737:Fastmail
Date: Thu, 22 Dec 2022 05:00:40 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v5 08/10] x86/mm: make code robust to future PAT changes
Message-ID: <Y6QqyTzD4FpPtiqH@itl-email>
References: <cover.1671497984.git.demi@invisiblethingslab.com>
 <a8920eef3254cbf470a0d35a887dbaf0e4907a6d.1671497984.git.demi@invisiblethingslab.com>
 <06dff83a-b120-a2b4-c61f-7864935d4c3e@suse.com>
 <Y6QodBfEc828o988@itl-email>
 <700e86ac-7efc-9d6d-43dd-a06bb541a1fb@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kDiZFmu2A0PiXt8a"
Content-Disposition: inline
In-Reply-To: <700e86ac-7efc-9d6d-43dd-a06bb541a1fb@suse.com>


--kDiZFmu2A0PiXt8a
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 22 Dec 2022 05:00:40 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>, Jun Nakajima <jun.nakajima@intel.com>,
	Kevin Tian <kevin.tian@intel.com>,
	George Dunlap <george.dunlap@citrix.com>, Tim Deegan <tim@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v5 08/10] x86/mm: make code robust to future PAT changes

On Thu, Dec 22, 2022 at 10:54:48AM +0100, Jan Beulich wrote:
> On 22.12.2022 10:50, Demi Marie Obenour wrote:
> > On Thu, Dec 22, 2022 at 10:35:08AM +0100, Jan Beulich wrote:
> >> On 20.12.2022 02:07, Demi Marie Obenour wrote:
> >>> --- a/xen/arch/x86/mm.c
> >>> +++ b/xen/arch/x86/mm.c
> >>> @@ -6352,6 +6352,11 @@ unsigned long get_upper_mfn_bound(void)
> >>>      return min(max_mfn, 1UL << (paddr_bits - PAGE_SHIFT)) - 1;
> >>>  }
> >>> =20
> >>> +
> >>> +/*
> >>> + * A bunch of static assertions to check that the XEN_MSR_PAT is val=
id
> >>> + * and consistent with the _PAGE_* macros, and that _PAGE_WB is zero.
> >>> + */
> >>>  static void __init __maybe_unused build_assertions(void)
> >>>  {
> >>>      /*
> >>> @@ -6361,6 +6366,72 @@ static void __init __maybe_unused build_assert=
ions(void)
> >>>       * using different PATs will not work.
> >>>       */
> >>>      BUILD_BUG_ON(XEN_MSR_PAT !=3D 0x050100070406ULL);
> >>> +
> >>> +    /*
> >>> +     * _PAGE_WB must be zero for several reasons, not least because =
Linux
> >>> +     * assumes it.
> >>> +     */
> >>> +    BUILD_BUG_ON(_PAGE_WB);
> >>
> >> Strictly speaking this is a requirement only for PV guests. We may not
> >> want to go as far as putting "#ifdef CONFIG_PV" around it, but at least
> >> the code comment (and then also the part of the description referring
> >> to this) will imo want to say so.
> >=20
> > Does Xen itself depend on this?
>=20
> With the wording in the description I was going from the assumption that
> you have audited code and found that we properly use _PAGE_* constants
> everywhere.

There could be other hard-coded uses of magic numbers I haven=E2=80=99t fou=
nd,
and _PAGE_WB is currently zero so I would be quite surpised if no code
in Xen omits it.  Linux also has a BUILD_BUG_ON() to check the same
thing.

> >>> +} while (0)
> >>> +
> >>> +    /*
> >>> +     * If one of these trips, the corresponding _PAGE_* macro is inc=
onsistent
> >>> +     * with XEN_MSR_PAT.  This would cause Xen to use incorrect cach=
eability
> >>> +     * flags, with results that are undefined and probably harmful.
> >>
> >> Why "undefined"? They may be wrong / broken, but the result is still w=
ell-
> >> defined afaict.
> >=20
> > =E2=80=9Cundefined=E2=80=9D is meant as =E2=80=9Cone has violated a cor=
e assumption that
> > higher-level stuff depends on, so things can go arbitrarily wrong,
> > including e.g. corrupting memory or data=E2=80=9D.  Is this accurate?  =
Should I
> > drop the dependent clause, or do you have a suggestion for something
> > better?
>=20
> s/undefined/unknown/ ?

Will fix in v6.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--kDiZFmu2A0PiXt8a
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmOkKskACgkQsoi1X/+c
IsGFuw/7BD2/akwUPE7gydadNlnI9Ejs9zgE/0C7emD81MXoUQd2/+d2hidDHVer
4wNRfXpvBKSsq9AhxeaH8vIUDQUa3/16dXDyWdRbijJzYs6LhUpC+1bN7GSnTo1Q
nlCRTipz9ihC/H+25RkMy4BRixHpPhw8dRP9Z8gXsf6DOxNQ6IzmFlDP2JOwcTLi
ZAAzZ0qIc6YMvPkGqVNZVilY0muypjTrxNdLBp9LDx5AOUyT7djhRqt4JqneE962
VAY/K6qqu1K/DBALaFurGasAwmJ+z67blPb80FbwLDr1mAkG/Y1YVexFdVEZVARs
He2bUP8zu9DnRgT9kk1C28Jb030W410zXwrFyv+u1bgmFk8Rtvgxi5DQDy0lGiAx
gUWRb7Exgl0Ly+ZykRL3OuNLT8l1AqAEq2LcdneB+dSKMiRlwpcrw+ogUkjqtnU4
/GEq5hs46hMLl1d4ldAouKXOgc1gkphPusZH7+W/cNuZ+SOi5hLfq23suylVqUw+
eHlAFB4owMwVjV5fDP1uh0AVP3ER3lFJMR7GPMy8J5pLKTARYWnHFiFVXvmlQPQu
yME8hSBBpKQHwr0ef8xm//v2VMF6tW/T/TWexDuPff5uOC6g2DC/ww1dAhFmVq5a
j9s2c+3AGGSzCvChDUKcuZBGntW9KdJT0kd1Oam/nDrqJh9DkR0=
=KxSV
-----END PGP SIGNATURE-----

--kDiZFmu2A0PiXt8a--

