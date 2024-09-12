Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF9B977341
	for <lists+xen-devel@lfdr.de>; Thu, 12 Sep 2024 23:02:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.797817.1207870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soqwl-0004GT-Tt; Thu, 12 Sep 2024 21:01:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 797817.1207870; Thu, 12 Sep 2024 21:01:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1soqwl-0004EH-Qa; Thu, 12 Sep 2024 21:01:47 +0000
Received: by outflank-mailman (input) for mailman id 797817;
 Thu, 12 Sep 2024 21:01:47 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IWCI=QK=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1soqwk-0004EB-Q4
 for xen-devel@lists.xenproject.org; Thu, 12 Sep 2024 21:01:47 +0000
Received: from fout8-smtp.messagingengine.com (fout8-smtp.messagingengine.com
 [103.168.172.151]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 36c35ee6-714a-11ef-99a1-01e77a169b0f;
 Thu, 12 Sep 2024 23:01:44 +0200 (CEST)
Received: from phl-compute-01.internal (phl-compute-01.phl.internal
 [10.202.2.41])
 by mailfout.phl.internal (Postfix) with ESMTP id D6266138014F;
 Thu, 12 Sep 2024 17:01:42 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-01.internal (MEProxy); Thu, 12 Sep 2024 17:01:42 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 Sep 2024 17:01:40 -0400 (EDT)
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
X-Inumbo-ID: 36c35ee6-714a-11ef-99a1-01e77a169b0f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1726174902;
	 x=1726261302; bh=rF7g4X4nFSaDc2QzWHPLFvht4zb8B0v4Kc6/IgJLVag=; b=
	uJ2K12+juerwGKVdp3QXo84TJgmQa3fWnXqY0eVO+q1tDcJQF0nyJlCIoKuCA9gS
	mQQnUYnEq5/3bRjgcfi9bP7D+JXmWiQpuV/oVmT/sfJBbGe7WWNqZkNy4dnLbGf2
	E16YxxuxZY6fR8XkOfMFY8MIJId6VYJrKveY3sy5V9FaL3hKHA9czveF/lrUsziA
	6CK6RKvbbwU32LB5k9JQ0lMNZgY4StJ/oIW+IQHKreOG6Pgar/dpU9gFkKZlJKxb
	dD0JOLuoKqsAY7vVC1r89BmWk0mkBHy/eCeEWMt/7mzPzMFCfiX7rEu9RtIFYHUH
	rTITIVz/6Q97byHMV2nwzQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1726174902; x=1726261302; bh=rF7g4X4nFSaDc2QzWHPLFvht4zb8
	B0v4Kc6/IgJLVag=; b=mUDZsqM6A7HaXtocPJcniHKbQzeu2misj0AguZ6p990J
	o6tSsgssibraJ/Mus3cRsjNx1wquRQelNmmG5KJN9k/dMNvYpnwv1KiLwuCiFaTA
	nJpxd0rSh93CsNdWQJPDsS6AVw79n+Lu1cmAYCtq+ToEpd/KrAC5JJ1Llw7yGwvJ
	HaKL4ofNhB25bMSMEl2jaU6DvmjcZlTFiFQTQl+u6sKPkdq/ZqI4tcwwsSO7LQLi
	7mbjmxgCqkmYxhVbMrLv+EXhdx1OFc7LN/cyrPnCdrz72lg7U4Uo52OEP5D1OIWB
	YEAU7XnusHjhMG0hlDTPiGbCnkaiu2JTM8gamOooAA==
X-ME-Sender: <xms:tlbjZgpul2FQKqC8thgAFsq8Lh8IL81iNXelhxiyLMoXNISqXvSyFg>
    <xme:tlbjZmryhP9xMOVl1fV9_NvcsnGjfYxH5dA9vY1h0YKIdL1Ye4hL-I5xRcHZiykSy
    _MgQeWD2TBL7As>
X-ME-Received: <xmr:tlbjZlPLfpqTZuckwaxaBKdoJosgrjO6tuJ-d4IaQpTcNUs9W3gzSxhDxv6eS21q-XfAHjY8hc5BDETMpgIwx729r2Bx5cM3EjiTQopAH76q-v18>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudejfedgudehkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdej
    necuhfhrohhmpeffvghmihcuofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpedvjeet
    geekhfetudfhgfetffegfffguddvgffhffeifeeikeektdehgeetheffleenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhi
    shhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeehpdhmohguvg
    epshhmthhpohhuthdprhgtphhtthhopegrnhgurhgvfidrtghoohhpvghrfeestghithhr
    ihigrdgtohhmpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprh
    hojhgvtghtrdhorhhgpdhrtghpthhtohepjhgsvghulhhitghhsehsuhhsvgdrtghomhdp
    rhgtphhtthhopehrohhgvghrrdhprghusegtihhtrhhigidrtghomhdprhgtphhtthhope
    hmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:tlbjZn6QEGKDSxB9kcNJBYqnV8PE8YZL9FlEUMr8PTgAfC1lZobJxQ>
    <xmx:tlbjZv59SlewEwHeBVTHd4_AInWPLSanBwI3qnq4GyJgOicihRcDcQ>
    <xmx:tlbjZnh1-AJ6tH8__iZxHtjWiOMboE0DReMML6j09wBK-w6dqN7rXg>
    <xmx:tlbjZp5lkUopCDcthZPAjLD-c2JUXHzqTPrFT4Ck9-_FNztzYTD7xw>
    <xmx:tlbjZi3KohH3Hq12FIBEcKxrsfmJelPOOxYF-ZKO0ebPpmNihP1iiL2s>
Feedback-ID: iac594737:Fastmail
Date: Thu, 12 Sep 2024 17:01:36 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH] Fix two problems in the microcode parsers
Message-ID: <ZuNWsunfoBrTZ2ob@itl-email>
References: <06edbbb7831620bc04c6453b95aad80eaebb20a1.1726162000.git.demi@invisiblethingslab.com>
 <49c43c98-a8b2-4943-af89-dfbf2030e478@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oUYCQ0oVQhtPAKJ+"
Content-Disposition: inline
In-Reply-To: <49c43c98-a8b2-4943-af89-dfbf2030e478@citrix.com>


--oUYCQ0oVQhtPAKJ+
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Sep 2024 17:01:36 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH] Fix two problems in the microcode parsers

On Thu, Sep 12, 2024 at 07:44:05PM +0100, Andrew Cooper wrote:
> On 12/09/2024 6:39 pm, Demi Marie Obenour wrote:
> > The microcode might come from a questionable source, so it is necessary
> > for the parsers to treat it as untrusted.  The CPU will validate the
> > microcode before applying it, so loading microcode from unofficial
> > sources is actually a legitimate thing to do in some cases.
>=20
> While true, the better argument is that ucode blobs are mostly encrypted
> data, so a mis-step tends to fall over a very long way.
>=20
> >
> > Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
> > ---
> >  xen/arch/x86/cpu/microcode/amd.c   | 1 +
> >  xen/arch/x86/cpu/microcode/intel.c | 5 +++--
> >  2 files changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microc=
ode/amd.c
> > index d2a26967c6dbc4695602dd46d5836a6d88e15072..31ee5717c5f1c7d0b7e29d9=
90cf4d1024d775900 100644
> > --- a/xen/arch/x86/cpu/microcode/amd.c
> > +++ b/xen/arch/x86/cpu/microcode/amd.c
> > @@ -338,6 +338,7 @@ static struct microcode_patch *cf_check cpu_request=
_microcode(
> >          if ( size < sizeof(*et) ||
> >               (et =3D buf)->type !=3D UCODE_EQUIV_CPU_TABLE_TYPE ||
> >               size - sizeof(*et) < et->len ||
> > +             et->len < sizeof(et->eq[0]) ||
> >               et->len % sizeof(et->eq[0]) ||
> >               et->eq[(et->len / sizeof(et->eq[0])) - 1].installed_cpu )
> >          {
>=20
> This is complicated by AMD having no spec in the slightest on their
> container format, but this change makes Xen reject a case that I
> reasoned was well formed (if unwise).
>=20
> IMO, the following binary is well formed:
>=20
> =C2=A0=C2=A0=C2=A0 0x00414d44 /* MAGIC */
> =C2=A0=C2=A0=C2=A0 0x00000000 /* type=3Dequiv */
> =C2=A0=C2=A0=C2=A0 0x00000000 /* len=3D0, =3D=3D no entries */
> =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /* =
no equiv entries */
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0 =C2=A0 =C2=A0 /* =
no ucode entries */
> =C2=A0=C2=A0=C2=A0 0x00414d44 /* MAGIC */
> =C2=A0=C2=A0=C2=A0 ...
>=20
> and I believe that Xen would parse it correctly.=C2=A0 Unless you think
> there's another case I've failed to consider?

The problem is that (et->len / sizeof(et->eq[0])) - 1 will underflow,
causing Xen to access et->eq[UINT32_MAX], which will (hopefully) crash.
The simplest solution is to drop that check, since
scan_equiv_cpu_table() already checks for terminating entries.

> AFACT the check you put in rejects the len < "1 entry" case.
>=20
> There is no shortage of ambiguity here; the equiv table has both an
> explicit length, and commonly has a NULL entry at the end.=C2=A0 But, we =
can
> parse with a length of 0.
>=20
>=20
> > diff --git a/xen/arch/x86/cpu/microcode/intel.c b/xen/arch/x86/cpu/micr=
ocode/intel.c
> > index 6f6957058684d7275d62e525e88ff678db9eb6d2..7a383adbdf1b5cb58f2e4c8=
9e3a1c11ecc053993 100644
> > --- a/xen/arch/x86/cpu/microcode/intel.c
> > +++ b/xen/arch/x86/cpu/microcode/intel.c
> > @@ -158,8 +158,9 @@ static int microcode_sanity_check(const struct micr=
ocode_patch *patch)
> >       * Total size must be a multiple of 1024 bytes.  Data size and the=
 header
> >       * must fit within it.
> >       */
> > -    if ( (total_size & 1023) ||
> > -         data_size > (total_size - MC_HEADER_SIZE) )
> > +    if ( (total_size & 1023) || (total_size < MC_HEADER_SIZE) ||
> > +         data_size > (total_size - MC_HEADER_SIZE) ||
> > +         (data_size % 4) !=3D 0 )
>=20
> The caller has already checked some properties.
>=20
> Furthermore, total_size of 0 in the header is a special case for
> pre-Pentium4 ucode and is substituted with a constant, so can never be 0
> in the variable here.=C2=A0 Therefore, I don't think the (total_size <
> MC_HEADER_SIZE) check can ever fail.

Correct.  Anything nonzero will either be greater than MC_HEADER_SIZE or
will be rejected due to (total_size & 1023) not being zero.  That said,
the new code is much more obviously correct.

> data_size being 4-byte aligned probably should be checked, although I
> think the later cross-check (ext_sigtable fits exactly in the remaining
> space) should catch this before the function wanders off the buffer.
>=20
> ~Andrew

It's still undefined behavior (cast to an unaligned pointer).
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--oUYCQ0oVQhtPAKJ+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmbjVrIACgkQsoi1X/+c
IsG/kA//duDwGWViyUI+jSqXiYz9w0D1LGzmnlvDkHdCR1DyMRj44z+IQi6ikeHR
jfV/kByovI7hVctTcEhqcOLGj1mLgPOmHeGnV2q9FyVImldCoEhsaShKiZ9bjmBq
XAo06EmpxYML1flmUHlj1CJasZ4hSbSHqFEQ4e8HTiDPawONOofWc+ScSMI20zd0
TA1MXYFNx/aLYoiMGXMqjrMx4Dpv4KNg4NgVU+b5nOj9BEXwpAMgsluuJK1KvDNq
tq1TqEM/hQGhox5Ze4o15oxp+8GgaJrLhUnD2UPj0pjcLKzUIEO79RwCYu2Q66zG
Fe/5SwMC3Xsg3CY7b/GVkRN2yADM4RmUAtnvVZPdw7nX/aV/HPgGqU4Jnm7oBgKR
LyRug0J4mUxhsEwALKYnz/kLSV8iMUsCQw61E8QzspwumJyO0wpgglHqbjEaa5o8
kPZMhzvEeMqBZSBP6OSTNEXu8P6BW0jKXdMECUd/RRj8aJMG69ZcDEmeCGM1K9DK
ttrGETeTjjXh/q9Cxrjaf5V9eMPzCgZWPwQ1QWsI8tvaImFm98ML7RogZJ09jG6g
HTqNiVrAZJ9qeRcGN4MPqIEprzj2wLVQp3Ad5DBIiu2N9HpcjvXf5nJjzY8TEp3g
Np0zwfOwOegKNcVgrQCpQShhP0ms2+MANUxcLav7shyYQHnza1w=
=wtEb
-----END PGP SIGNATURE-----

--oUYCQ0oVQhtPAKJ+--

