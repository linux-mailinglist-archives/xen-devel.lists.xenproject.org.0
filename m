Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12BB88C2C80
	for <lists+xen-devel@lfdr.de>; Sat, 11 May 2024 00:15:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.720087.1123079 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5YVp-0003kB-52; Fri, 10 May 2024 22:14:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 720087.1123079; Fri, 10 May 2024 22:14:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s5YVp-0003iC-2A; Fri, 10 May 2024 22:14:45 +0000
Received: by outflank-mailman (input) for mailman id 720087;
 Fri, 10 May 2024 22:14:43 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aEqs=MN=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1s5YVn-0003i4-4t
 for xen-devel@lists.xenproject.org; Fri, 10 May 2024 22:14:43 +0000
Received: from wfout6-smtp.messagingengine.com
 (wfout6-smtp.messagingengine.com [64.147.123.149])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b01fd2dd-0f1a-11ef-b4bb-af5377834399;
 Sat, 11 May 2024 00:14:38 +0200 (CEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
 by mailfout.west.internal (Postfix) with ESMTP id 6CD921C000E1;
 Fri, 10 May 2024 18:14:35 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Fri, 10 May 2024 18:14:35 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 May 2024 18:14:34 -0400 (EDT)
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
X-Inumbo-ID: b01fd2dd-0f1a-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1715379275;
	 x=1715465675; bh=NiJLpQcs0yme5KQLluRGxF758s0CI5seD6WPvuBOpgg=; b=
	tdKrJoJrLQZtCetaZOlXrAMZ0iPo6YDpni1RrcHzLlwkpC1ZoJYmK5Z6LgDQkan/
	a9I3V5+nAtHvTfGGOMhAcY860fi+G4G2nXwzWqyQjfoigWhZgPdaUbwyLtoLN1Yy
	ArF86Y6wsU84+GYY2R5QScqHKVJY0orHTdYazxke0NxMFmsm3erh40Soe7tGu/97
	ibulekWAGQeI/BjvvD2+PTFydbVU9KX8yOOyj0YcDIgfgUzate+YQ4ZorbWlruMS
	kTKHXt4UBi3sVYWp8pMVKvCF/05LieMvwU7ZgdnemIylmDD9Ld2NkbEJxWD5t9gq
	KqpNbDo8qOA33SDoTpMsSw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1715379275; x=1715465675; bh=NiJLpQcs0yme5KQLluRGxF758s0C
	I5seD6WPvuBOpgg=; b=KG+NwuBHGdoJ0adLFYEqqJkuNVvS3yO4gLp64T5TfEb5
	eD6jOKicRl1q46fO6WeyoO1l+n3yUAtl7ofdusFRC+HqTsMukeaQ3/0lwqbUJghl
	DP9vvpIlTOyzJROerWAG03sb+ENisTy91HJ5HQhhtYXkIPbG8geTFWR2FJIBgFdS
	pDdugSzDTI+2Wp/t/btQtx2CuxsEOlj5SGxac5kQZL1yIOcEICVZMCtV03hcrazE
	E6xSI3BtR3auMZwPhU6an4o46/VB2Cx/5LbH6yiYc4au0V90jndUy+8uIv/ybA3T
	xe6u2/RMMFB1Vk7qtMSJd9HGvMOsHOkP11juyq9TSA==
X-ME-Sender: <xms:Spw-Zn7EWC_YbqGfixjoNchGbQJxIVfVBrHgygRoH6r_xl-H0qlp5A>
    <xme:Spw-Zs75cploQw-3w9Np8PUJqaRVCA9Wfuwe0x3YoRloKc0A04melaPHcvz-LW9ge
    v43M2fu--dl4Xg>
X-ME-Received: <xmr:Spw-ZufIq4da1KNYzmniiLObCIHxcTilP_77wztRYUaFK2y8w3FUOFCJ9s3MId0wmLakMQJRmmKItyd6IMLX2RpwID88jkT7AZHjd7y5703k2M05>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrvdefledgtdejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepffgvmhhi
    ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepvdejteegkefhteduhffgteffgeff
    gfduvdfghfffieefieekkedtheegteehffelnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhs
    lhgrsgdrtghomh
X-ME-Proxy: <xmx:Spw-ZoKAe-aA8HpesJIJR7QuN6Jfw-8TqcK_Tpt-PU4rRsEBcoSR-Q>
    <xmx:Spw-ZrJHJohV40lDquEX40rphKL57PvqVoEgOUe5b9OwJuFczyNNNQ>
    <xmx:Spw-ZhwPtVE6qsIQplZI0xlyECW6yPxvVURy-TKyStMCCP1GSTftzA>
    <xmx:Spw-ZnIoGB613FLEkzdEOZlVVXN5ZYEr9nzS84DjMT6H0UUeqv6Z8g>
    <xmx:S5w-ZoGTp912U1_hrfll_4KBgG34apJGPCYHbSP35w5ZlOvOO1lVMMLv>
Feedback-ID: iac594737:Fastmail
Date: Fri, 10 May 2024 18:14:20 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@citrix.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH] libxl: Fix handling XenStore errors in device creation
Message-ID: <Zj6cSdiyu31BoFkE@itl-email>
References: <84a6e6376ab9f5aafac8f33bf772d73fcfd0d818.1713998669.git.demi@invisiblethingslab.com>
 <c978ac2b-0529-4bd8-a493-55e806740808@suse.com>
 <7384a44d-0eb8-4033-98b6-ddb7fd9a8131@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zHTcFoPsAYLYMqmE"
Content-Disposition: inline
In-Reply-To: <7384a44d-0eb8-4033-98b6-ddb7fd9a8131@citrix.com>


--zHTcFoPsAYLYMqmE
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 May 2024 18:14:20 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	=?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
	xen-devel@lists.xenproject.org
Cc: Anthony PERARD <anthony.perard@citrix.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH] libxl: Fix handling XenStore errors in device creation

On Fri, May 10, 2024 at 07:00:49PM +0100, Andrew Cooper wrote:
> On 10/05/2024 9:05 am, J=C3=BCrgen Gro=C3=9F wrote:
> > On 27.04.24 04:17, Demi Marie Obenour wrote:
> >> If xenstored runs out of memory it is possible for it to fail operatio=
ns
> >> that should succeed.=C2=A0 libxl wasn't robust against this, and could=
 fail
> >> to ensure that the TTY path of a non-initial console was created and
> >> read-only for guests.=C2=A0 This doesn't qualify for an XSA because gu=
ests
> >> should not be able to run xenstored out of memory, but it still needs =
to
> >> be fixed.
> >>
> >> Add the missing error checks to ensure that all errors are properly
> >> handled and that at no point can a guest make the TTY path of its
> >> frontend directory writable.
> >>
> >> Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
> >
> > Apart from one nit below:
> >
> > Reviewed-by: Juergen Gross <jgross@suse.com>
> >
> >> ---
> >> =C2=A0 tools/libs/light/libxl_console.c | 10 ++---
> >> =C2=A0 tools/libs/light/libxl_device.c=C2=A0 | 72 ++++++++++++++++++++=
------------
> >> =C2=A0 tools/libs/light/libxl_xshelp.c=C2=A0 | 13 ++++--
> >> =C2=A0 3 files changed, 59 insertions(+), 36 deletions(-)
> >>
> >> diff --git a/tools/libs/light/libxl_console.c
> >> b/tools/libs/light/libxl_console.c
> >> index
> >> cd7412a3272a2faf4b9dab0ef4dd077e55472546..adf82aa844a4f4989111bfc8a94a=
f18ad8e114f1
> >> 100644
> >> --- a/tools/libs/light/libxl_console.c
> >> +++ b/tools/libs/light/libxl_console.c
> >> @@ -351,11 +351,10 @@ int libxl__device_console_add(libxl__gc *gc,
> >> uint32_t domid,
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 flexarray_appen=
d(front, "protocol");
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 flexarray_appen=
d(front, LIBXL_XENCONSOLE_PROTOCOL);
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> >> -=C2=A0=C2=A0=C2=A0 libxl__device_generic_add(gc, XBT_NULL, device,
> >> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 libxl__xs_kvs_of_flexarray(gc, back),
> >> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 libxl__xs_kvs_of_flexarray(gc, front),
> >> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 libxl__xs_kvs_of_flexarray(gc,
> >> ro_front));
> >> -=C2=A0=C2=A0=C2=A0 rc =3D 0;
> >> +=C2=A0=C2=A0=C2=A0 rc =3D libxl__device_generic_add(gc, XBT_NULL, dev=
ice,
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 libxl__xs_kvs_=
of_flexarray(gc,
> >> back),
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 libxl__xs_kvs_=
of_flexarray(gc,
> >> front),
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 libxl__xs_kvs_=
of_flexarray(gc,
> >> ro_front));
> >> =C2=A0 out:
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return rc;
> >> =C2=A0 }
> >> @@ -665,6 +664,7 @@ int libxl_device_channel_getinfo(libxl_ctx *ctx,
> >> uint32_t domid,
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 */
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 if (!val) val =3D "/NO-SUCH-PATH";
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 channelinfo->u.pty.path =3D strdup(val);
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 if (channelinfo->u.pty.path =3D=3D NULL) abort();
> >
> > Even with the bad example 2 lines up, please put the "abort();" into a
> > line of its own.
>=20
> I've fixed this on commit.
>=20
> ~Andrew

Thank you.

Should this be backported to stable braches?  It's not a security
vulnerability from a Xen upstream PoV, but "running Xenstore out of
memory" should be denial of service only, not a potential privilege
escalation.  This is especially true if Xenstore is in dom0, where there
might be other processes that could eat up lots of memory.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--zHTcFoPsAYLYMqmE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmY+nEgACgkQsoi1X/+c
IsH6ww/+JgKGiVdt6utiKU47BftXQFvoWqOq1a2VOJlf57u4unbSC7s5eANu2g6c
QQoHDHwhdIKMhtOsd5a1JOrkZsG6D8aUWKXp6x/z0IehK7TTZr6twRL50+v6BqY6
/dmW6rdanwO3W7PqAKw93sY6jT61Phi+bPE+cSgIPtvSiMxFpW+ZGUi2FmjSRAmK
eEuQMh1XlztIKOATspWwWWu7Y9xXU+Bi9mAtSz6R+41ju/Ai0n8BrspNZN/drYmR
gDpp6nvoxfX+VR2lNPWZPIia85D29BTlp7VPp8kFPgPpgBSM5X9urEfquGyJf8fi
fcyAHr+vQHYnTE5wsXJEIdtp0MZvP4M2qSDWm0fPpXWQwn8IqI4ujLS3vZ4VPNXe
aYhtHWBGIoHTxJm6s+bqctEslBnuFmAv9ArAR4TKJuPu4cYIEPAgZeONkRjXHjE7
KSjnFAtI6XL1YnIK0VTjTefzuAwKNLnWHR6jM7HuQDeGQR0P9Oe2zn5EfRpq7wSI
tb+4ZAPXU5zTxIbNxb4KMHL9hqJE88FkETS8hF9jD/fCYR32f6ZxyfUT0GDdzgmk
l1AL/C0O75CFOkh7Oeg/jkLrlmwvYILD2evm/kpTeNyAseEl+pqIzEXDynrtq/Ec
YrmssBTT4mFqlsRuH9ongZu9O6dFT9PLaYsxfL5Z+OvX63Y//2s=
=msjs
-----END PGP SIGNATURE-----

--zHTcFoPsAYLYMqmE--

