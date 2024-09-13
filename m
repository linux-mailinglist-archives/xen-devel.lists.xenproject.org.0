Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 822D49787B4
	for <lists+xen-devel@lfdr.de>; Fri, 13 Sep 2024 20:20:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.798404.1208613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1spAtj-0000UU-Fz; Fri, 13 Sep 2024 18:19:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 798404.1208613; Fri, 13 Sep 2024 18:19:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1spAtj-0000Sa-DN; Fri, 13 Sep 2024 18:19:59 +0000
Received: by outflank-mailman (input) for mailman id 798404;
 Fri, 13 Sep 2024 18:19:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=qEot=QL=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1spAth-0000SS-JA
 for xen-devel@lists.xenproject.org; Fri, 13 Sep 2024 18:19:57 +0000
Received: from fout5-smtp.messagingengine.com (fout5-smtp.messagingengine.com
 [103.168.172.148]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c52092f0-71fc-11ef-a0b5-8be0dac302b0;
 Fri, 13 Sep 2024 20:19:53 +0200 (CEST)
Received: from phl-compute-08.internal (phl-compute-08.phl.internal
 [10.202.2.48])
 by mailfout.phl.internal (Postfix) with ESMTP id ED53513801DD;
 Fri, 13 Sep 2024 14:19:51 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-08.internal (MEProxy); Fri, 13 Sep 2024 14:19:51 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 13 Sep 2024 14:19:51 -0400 (EDT)
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
X-Inumbo-ID: c52092f0-71fc-11ef-a0b5-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1726251591;
	 x=1726337991; bh=7XWAy5uubcapICWI7YqdFppXKAK9Jh6IdWjV5c5Kjqk=; b=
	u7vKgMr4jpLk2ibtfWAVh9zgmVhgI1PWdQP8MZM6L9SKg/ZrXymDuBzkY3Mt+Jco
	e5rDUq+M6SVoPCLZ6X+f9ukqda+wenJGYT1KR9XDHCe4oFyVzyceAUZ0WMc0Wyz2
	249zM6BtUaEyW0tCfVnWX82P4TPFP3ndEga84Rfxr5egp5cLUOHhl8JtHy9iToDo
	MMU4CEJvWSXgJdURLP9yVTxe1rK6z7RAZFEhJrFTDXBtzKJKPjasZht5fmw6dwPS
	QRJy/anJR/mgSonaTKs705nZqC5hSkJKYmGWcr6ee09p4/JFGAMhvxlhHFiOWLho
	u6O7JlmAIVbO8m9p7y9jRg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1726251591; x=1726337991; bh=7XWAy5uubcapICWI7YqdFppXKAK9
	Jh6IdWjV5c5Kjqk=; b=GQIYGQmUDnG98+oLijyhDCd/DvEOF5jX/0ldLuUpwG+i
	mLb35OpA8DDwrkx6ma8vD6jSInYGNQ4qnBblHBsqAqiHPTjWaLeudgfgtf/7Q8tM
	Cg8HZ/rIzlKHo+6mRM1VOXfmgsPwLoIcoOx+naKnyFqIFoiwuiV5kZHAjuiu1vfT
	tPLbg4MxHxGlUZpim6owE2SHppWROkgI6rx6B1mzHmLOkoGauoOBKrWSZXuD0HnL
	1ir9FFKpU8udBjcB/OkmytaF3tjyliR6oYVtelzjHnMTY88NJWo3W6bmIn6FXQah
	hMlmPboHeUyAXd1KhuMqmnyLR7PLOxDeZcuBzVO6SQ==
X-ME-Sender: <xms:R4LkZpGXZmxbJcv775G6-frM4G_jj43xuGDqN3uU4iT49CmxKm9ycA>
    <xme:R4LkZuXqfBM1o1KbOvrACFswB3cSbBCGg5nekncCKdgJzQoFy4fop3Qe6SN0-nOrb
    0vtmschS6ARpSQ>
X-ME-Received: <xmr:R4LkZrIZtp_QEr0QPGh-IFvtAvCBS62UV4fMeGDB9s5pdFxEbcikFdSeSyh0R7BCp6PZ7KOBArgdM_5T2I601xKQ7h8pEwQHDcIJBvUeOcEYH6q6>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudejjedguddvvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdej
    necuhfhrohhmpeffvghmihcuofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpedvjeet
    geekhfetudfhgfetffegfffguddvgffhffeifeeikeektdehgeetheffleenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhi
    shhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeegpdhmohguvg
    epshhmthhpohhuthdprhgtphhtthhopegrnhgurhgvfidrtghoohhpvghrfeestghithhr
    ihigrdgtohhmpdhrtghpthhtohepgigvnhdquggvvhgvlheslhhishhtshdrgigvnhhprh
    hojhgvtghtrdhorhhgpdhrtghpthhtohepjhgsvghulhhitghhsehsuhhsvgdrtghomhdp
    rhgtphhtthhopehrohhgvghrrdhprghusegtihhtrhhigidrtghomh
X-ME-Proxy: <xmx:R4LkZvFImuwKyu7tyKyDnWkhOkvn3EBmRGPKNkw4RAQBuBXlK1u8WQ>
    <xmx:R4LkZvVYqdNNi1GWd6DczwFePpXjcb6mhY7Yq42mExqvz0CPe1wTyw>
    <xmx:R4LkZqOayT1AR33AjZFEcPx_BRw0_B90CQc7gjjg-C8zGWKQy-Obnw>
    <xmx:R4LkZu3apsq0SGP9P92rXoU8DFTZPgNo62YvPV50LeSbkTd2w-glrA>
    <xmx:R4LkZqSRP6qR7bMCZ3IMAFO7i-UiqpHBNNB6Pf4mYbymzD5clGmzWSzK>
Feedback-ID: iac594737:Fastmail
Date: Fri, 13 Sep 2024 14:19:37 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH] xen/ucode: Fix buffer under-run when parsing AMD
 containers
Message-ID: <ZuSCRv8g_AbHd_1x@itl-email>
References: <20240913110907.1902340-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="J2amY4CIGiATeEKI"
Content-Disposition: inline
In-Reply-To: <20240913110907.1902340-1-andrew.cooper3@citrix.com>


--J2amY4CIGiATeEKI
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Sep 2024 14:19:37 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>,
	Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH] xen/ucode: Fix buffer under-run when parsing AMD
 containers

On Fri, Sep 13, 2024 at 12:09:07PM +0100, Andrew Cooper wrote:
> From: Demi Marie Obenour <demi@invisiblethingslab.com>
>=20
> The AMD container format has no formal spec.  It is, at best, precision
> guesswork based on AMD's prior contributions to open source projects.  The
> Equivalence Table has both an explicit length, and an expectation of havi=
ng a
> NULL entry at the end.
>=20
> Xen was sanity checking the NULL entry, but without confirming that an en=
try
> was present, resulting in a read off the front of the buffer.  With some
> manual debugging/annotations this manifests as:
>=20
>   (XEN) *** Buf ffff83204c00b19c, eq ffff83204c00b194
>   (XEN) *** eq: 0c 00 00 00 44 4d 41 00 00 00 00 00 00 00 00 00 aa aa aa =
aa
>                             ^-Actual buffer-------------------^
>   (XEN) *** installed_cpu: 000c
>   (XEN) microcode: Bad equivalent cpu table
>   (XEN) Parsing microcode blob error -22
>=20
> When loaded by hypercall, the 4 bytes interpreted as installed_cpu happen=
 to
> be the containing struct ucode_buf's len field, and luckily will be nonze=
ro.
>=20
> When loaded at boot, it's possible for the access to #PF if the module ha=
ppens
> to have been placed on a 2M boundary by the bootloader.  Under Linux, it =
will
> commonly be the end of the CPIO header.
>=20
> Drop the probe of the NULL entry; Nothing else cares.  A container withou=
t one
> is well formed, insofar that we can still parse it correctly.  With this
> dropped, the same container results in:
>=20
>   (XEN) microcode: couldn't find any matching ucode in the provided blob!
>=20
> Fixes: 4de936a38aa9 ("x86/ucode/amd: Rework parsing logic in cpu_request_=
microcode()")
> Signed-off-by: Demi Marie Obenour <demi@invisiblethingslab.com>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Demi Marie Obenour <demi@invisiblethingslab.com>
>=20
> Split out of joint patch, and analyse.
>=20
> I couldn't trigger any of the sanitisers with this, hence the manual
> debugging.
>=20
> This patch intentionally doesn't include patch 2's extra hunk changing:
>=20
>   @@ -364,7 +364,8 @@ static struct microcode_patch *cf_check cpu_request=
_microcode(
>                if ( size < sizeof(*mc) ||
>                     (mc =3D buf)->type !=3D UCODE_UCODE_TYPE ||
>                     size - sizeof(*mc) < mc->len ||
>   -                 mc->len < sizeof(struct microcode_patch) )
>   +                 mc->len < sizeof(struct microcode_patch) ||
>   +                 mc->len % 4 !=3D 0 )
>                {
>                    printk(XENLOG_ERR "microcode: Bad microcode data\n");
>                    error =3D -EINVAL;
>=20
> Intel have a spec saying the length is mutliple of 4.  AMD do not, and ha=
ve
> microcode which genuinely isn't a multiple of 4.

In this case the structs at the top should be __attribute__((packed)) to
avoid undefined behavior.  That can be a separate patch, though.

> ---
>  xen/arch/x86/cpu/microcode/amd.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/xen/arch/x86/cpu/microcode/amd.c b/xen/arch/x86/cpu/microcod=
e/amd.c
> index d2a26967c6db..32490c8b7d2a 100644
> --- a/xen/arch/x86/cpu/microcode/amd.c
> +++ b/xen/arch/x86/cpu/microcode/amd.c
> @@ -338,8 +338,7 @@ static struct microcode_patch *cf_check cpu_request_m=
icrocode(
>          if ( size < sizeof(*et) ||
>               (et =3D buf)->type !=3D UCODE_EQUIV_CPU_TABLE_TYPE ||
>               size - sizeof(*et) < et->len ||
> -             et->len % sizeof(et->eq[0]) ||
> -             et->eq[(et->len / sizeof(et->eq[0])) - 1].installed_cpu )
> +             et->len % sizeof(et->eq[0]) )
>          {
>              printk(XENLOG_ERR "microcode: Bad equivalent cpu table\n");
>              error =3D -EINVAL;
> --=20
> 2.39.2
>=20

Reviewed-by: Demi Marie Obenour <demi@invisiblethingslab.com>
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--J2amY4CIGiATeEKI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmbkgkUACgkQsoi1X/+c
IsGwbA//c2xF6zFYI7gWwqy5SZJJXx3sSqBTBBSWHUOn7fSWCm10Biwe28afNukD
l2q5YadoGzLH7EHr68ElJFt4S1dAofUaTITlmiLqMxvWAmmhSOWziJ9Y5YIpjPBw
QlEEjHjeKhUEE+5xTHpW9y8pI6ejgOrazWaUgIdiPGpx+JcEprvKeyNyU0PiLKoS
KnQXkM4kVQhuTCb2sAZ+D4NjkTmZXO/V2cKB2q8XDkAjHGzicW+hqn50PS+WXqoY
WUhG26Iz2bmMLzQBIIC3S3UIiE4T1jJsy6KylJA6HpNkwyt7YzeqyLplBDKHEx/m
S6mu0JLG10u2eN68g+4FbmacwNyj8SBS4fln6STKANtV+S0C9WDkpb7dF/LjKfKv
4tiQCWT2HYkaEWVdQCDPO2P085xQMkODryjObF6Wrla1ahu8rGmeEYIuxk5mPIkf
OliEKs6vAWVqTZGAexFmkMV3pc2VG3/XbGTOpz2CcHyrSC5M7L6vmevlFXIymXtf
iTMyGslerpG7bIQ+vkPwNPQIaKt+NcqPhivBzJvtxhMYS1LiCWywZ0wVO3hGno5Z
ne94ew6EmkLac5PagIiXyDtITmFcMGVgOXWmAV+dgQ3EjvJ7WzEkj9Y+1M8MtYxc
ZWqHr/OFehKaQDI3OwflGxmTkeW3DUnwBVfYCvkHWSEzST5X7DA=
=f5i9
-----END PGP SIGNATURE-----

--J2amY4CIGiATeEKI--

