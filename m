Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A397379D063
	for <lists+xen-devel@lfdr.de>; Tue, 12 Sep 2023 13:52:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.600413.936055 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qg1v4-00088G-Qb; Tue, 12 Sep 2023 11:51:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 600413.936055; Tue, 12 Sep 2023 11:51:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qg1v4-00085y-No; Tue, 12 Sep 2023 11:51:02 +0000
Received: by outflank-mailman (input) for mailman id 600413;
 Tue, 12 Sep 2023 11:51:01 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=n0tO=E4=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1qg1v2-00084Z-Kw
 for xen-devel@lists.xenproject.org; Tue, 12 Sep 2023 11:51:01 +0000
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a2ecb9c2-5162-11ee-8786-cb3800f73035;
 Tue, 12 Sep 2023 13:50:58 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 6053B5C0179;
 Tue, 12 Sep 2023 07:50:57 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 12 Sep 2023 07:50:57 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 12 Sep 2023 07:50:55 -0400 (EDT)
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
X-Inumbo-ID: a2ecb9c2-5162-11ee-8786-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1694519457; x=1694605857; bh=pGBUjopvGIqsMF05ub/bUR9JHr+RXhuj7Ug
	1J2Vh15s=; b=nJA3l2cVVQ60E3JOMSpFx6WJgFpI5RqjyW/ozC75DG03HvjnBk3
	pv1gRo0pPHPsXUILDQzjGZgNE0GJjrvlfKbrwPNymSrj5ViMtS85x+G68ffmFxht
	0YuIgtEfIWY5xA+DNqHaWYWKQLN5cdXymbHI1qHgnIM2nSFxImRU7yuruujD5tV1
	V9Y5sab2xrEl8MMVkxD+In0PzWdPAmJUwaZJgPrCbmXSuHJbze6oVYHnnJP9noW4
	EIhg++KCndmNGH0M12hc8MQAy6nthfbjK2L6MZqO62xCx+G8Rpoor9oRuL0cxZhd
	MxucrYmqa/k81MdTOHINpQDEAH6P4xIrFwA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1694519457; x=1694605857; bh=pGBUjopvGIqsM
	F05ub/bUR9JHr+RXhuj7Ug1J2Vh15s=; b=CFjEEkfg7TZWNfuBidOlZmPosZPGw
	xbNgcvKdbCOlvDbfxrwCoPKVZtaFDD7uHrWwWC2JqVKvkkzXbWPF4EQxVVpQ0Xrb
	vlR79IzX9n2eNDI80IcZkalJbBAdTRCkL+5JsWzVb6yMygxePDVxglD/sjgCoJ4k
	XQdm9nBrLW8LLQgfCIJF92N11ojSpROeTEOw8B5qGGOIPDtGDsB1Ue1ppASHl3r5
	GmZzUZhfsMp7/kgEj2lhNMa4NX3cqUfNafdTt26XvDJeGWzoWKDh3AHiiwgVog5x
	2k33zgbRs59E/KtXycNLGyJ92DVNfDuriTTyVHhykln1lkscFk0uKWZcw==
X-ME-Sender: <xms:oFAAZbHf-bIS4jSV1yOb113P3GkgBaitsuF7HvqVw1vWZWVu18ZYow>
    <xme:oFAAZYVgf7B4GJGefBorul4AhetLWTG5fYrb7SZVnpG_cZr-QIAsITIMS9MRRKqij
    3JsGN8xGNh1Sg>
X-ME-Received: <xmr:oFAAZdLu796zTOj5xIENacIdnaEDUKaLUXYdilm5PuoS7Wo2ZkJsbcMw_S6Fsa4YfbHtOWHFfreEPMx92RlsJB8-fmDKR1nlB3A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudeiiedggeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepgfdu
    leetfeevhfefheeiteeliefhjefhleduveetteekveettddvgeeuteefjedunecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:oVAAZZHHNAd7xdKCT2XAtA-5vHX_c_-NigEb3wqujejCL6xh6jQgxg>
    <xmx:oVAAZRUDtXBDhuwMRDkvQAMejMWeVK-LXCH4uZVZpNDRnQklwBVa0w>
    <xmx:oVAAZUPKGSwFNfQ77hhf7yqA2BdEEUzL_qGkbLwVa9AFM3bIjlEGkQ>
    <xmx:oVAAZfdzj5zMXH6bitgpp8e8vVhpUd91qC7-j8bN10FM8VV9Cy8kvw>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 12 Sep 2023 13:50:52 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Javi Merino <javi.merino@cloud.com>, xen-devel@lists.xenproject.org,
	Jan Beulich <jbeulich@suse.com>,
	George Dunlap <george.dunlap@cloud.com>, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [XEN PATCH v2 3/5] tools: don't use distutils in configure nor
 Makefile
Message-ID: <ZQBQnGOU/voT6QcV@mail-itl>
References: <cover.1694450145.git.javi.merino@cloud.com>
 <7b3ecf211f60e0d6f7a4d146b62f9c28eff003f5.1694450145.git.javi.merino@cloud.com>
 <fdf87d82-aa3c-fd2e-6271-848f1a806fb2@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="iUjA78LAEWtaJC1k"
Content-Disposition: inline
In-Reply-To: <fdf87d82-aa3c-fd2e-6271-848f1a806fb2@citrix.com>


--iUjA78LAEWtaJC1k
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 12 Sep 2023 13:50:52 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Javi Merino <javi.merino@cloud.com>, xen-devel@lists.xenproject.org,
	Jan Beulich <jbeulich@suse.com>,
	George Dunlap <george.dunlap@cloud.com>, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [XEN PATCH v2 3/5] tools: don't use distutils in configure nor
 Makefile

On Tue, Sep 12, 2023 at 11:38:04AM +0100, Andrew Cooper wrote:
> On 11/09/2023 5:51 pm, Javi Merino wrote:
> > From: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>
> >
> > Python distutils is deprecated and is going to be removed in Python
> > 3.12. The distutils.sysconfig is available as sysconfig module in
> > stdlib since Python 3.2, so use that directly.
> >
> > Signed-off-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblething=
slab.com>
>=20
> This breaks Py2, doesn't it?

I was thinking that too, but "sysconfig" module seems to be in Python
2.7 too.

> > ---
> >  m4/python_devel.m4       | 28 ++++++++++++++--------------
> >  tools/libs/stat/Makefile |  4 ++--
> >  2 files changed, 16 insertions(+), 16 deletions(-)
> >
> > diff --git a/m4/python_devel.m4 b/m4/python_devel.m4
> > index bbf1e0354b..bb60857b03 100644
> > --- a/m4/python_devel.m4
> > +++ b/m4/python_devel.m4
> > @@ -5,21 +5,21 @@ ac_previous_libs=3D$LIBS
> >  AC_PATH_PROG([pyconfig], [$PYTHON-config], [no])
> >  AS_IF([test x"$pyconfig" =3D x"no"], [
> >      dnl For those that don't have python-config
> > -    CPPFLAGS=3D"$CFLAGS `$PYTHON -c 'import distutils.sysconfig; \
> > -        print("-I" + distutils.sysconfig.get_config_var("INCLUDEPY"))'=
`"
> > -    CPPFLAGS=3D"$CPPFLAGS `$PYTHON -c 'import distutils.sysconfig; \
> > -        print(distutils.sysconfig.get_config_var("CFLAGS"))'`"
> > -    LDFLAGS=3D"$LDFLAGS `$PYTHON -c 'import distutils.sysconfig; \
> > -        print("-L" + distutils.sysconfig.get_python_lib(plat_specific=
=3D1,\
> > +    CPPFLAGS=3D"$CFLAGS `$PYTHON -c 'import sysconfig; \
> > +        print("-I" + sysconfig.get_config_var("INCLUDEPY"))'`"
> > +    CPPFLAGS=3D"$CPPFLAGS `$PYTHON -c 'import sysconfig; \
> > +        print(sysconfig.get_config_var("CFLAGS"))'`"
> > +    LDFLAGS=3D"$LDFLAGS `$PYTHON -c 'import sysconfig; \
> > +        print("-L" + sysconfig.get_python_lib(plat_specific=3D1,\
> >          standard_lib=3D1) + "/config")'`"
> > -    LDFLAGS=3D"$LDFLAGS `$PYTHON -c 'import distutils.sysconfig; \
> > -        print(distutils.sysconfig.get_config_var("LINKFORSHARED"))'`"
> > -    LDFLAGS=3D"$LDFLAGS `$PYTHON -c 'import distutils.sysconfig; \
> > -        print(distutils.sysconfig.get_config_var("LDFLAGS"))'`"
> > -    LIBS=3D"$LIBS `$PYTHON -c 'import distutils.sysconfig; \
> > -        print(distutils.sysconfig.get_config_var("LIBS"))'`"
> > -    LIBS=3D"$LIBS `$PYTHON -c 'import distutils.sysconfig; \
> > -        print(distutils.sysconfig.get_config_var("SYSLIBS"))'`"
> > +    LDFLAGS=3D"$LDFLAGS `$PYTHON -c 'import sysconfig; \
> > +        print(sysconfig.get_config_var("LINKFORSHARED"))'`"
> > +    LDFLAGS=3D"$LDFLAGS `$PYTHON -c 'import sysconfig; \
> > +        print(sysconfig.get_config_var("LDFLAGS"))'`"
> > +    LIBS=3D"$LIBS `$PYTHON -c 'import sysconfig; \
> > +        print(sysconfig.get_config_var("LIBS"))'`"
> > +    LIBS=3D"$LIBS `$PYTHON -c 'import sysconfig; \
> > +        print(sysconfig.get_config_var("SYSLIBS"))'`"
>=20
> I know the code was terrible to start with, but it's absurd to fork
> multiple processes just to append different fields into the same variable.
>=20
> Why not have a config.py in this directory which takes
> CPPFLAGS/LDFLAGS/LIBS as an input prints everything it needs.=C2=A0 Then =
you
> can repeat the import trick to prefer sysconfig and fall back to
> distutils if sysconfig isn't available.
>=20
> ~Andrew

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--iUjA78LAEWtaJC1k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmUAUJwACgkQ24/THMrX
1yzc9AgAkDt3fMmS4w0CS3b+7KS7z6rh3EsGvrTR0Sw0Z7sXRJHKiz0VYk1iFEpj
FC37Ct0fvnOw+rtGabLl2BaJmW6Kg9aUxyHxOUZOMq88XA9S+kJrsIU/J0IfW/fR
iJw2jRWrSYNY1fOzID7oIKKdbjT/sH2lbB5vVJgJGp/vh7NteM8YB8kT6P7Vbc2c
fMpWgUzAWusOdkQAtLjuAir0nfZK6sdzOhfKcGODgUw9zDOXpzpYR9p+5j+N69EP
Opzr66olyY+V72kHV+nR2f/V97yzyt/oTQ1iYZWOmGki2fx0/v9fMlkPLOcy7Dup
3dyewzYNNFP+EXvrgrvBw17bXcx6qw==
=2C75
-----END PGP SIGNATURE-----

--iUjA78LAEWtaJC1k--

