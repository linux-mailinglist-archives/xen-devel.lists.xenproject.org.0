Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C6E7C005E
	for <lists+xen-devel@lfdr.de>; Tue, 10 Oct 2023 17:28:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.615100.956294 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqEdd-0006OS-3N; Tue, 10 Oct 2023 15:27:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 615100.956294; Tue, 10 Oct 2023 15:27:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qqEdd-0006Lj-0B; Tue, 10 Oct 2023 15:27:13 +0000
Received: by outflank-mailman (input) for mailman id 615100;
 Tue, 10 Oct 2023 15:27:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Phjn=FY=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1qqEda-0006Ld-KB
 for xen-devel@lists.xenproject.org; Tue, 10 Oct 2023 15:27:10 +0000
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 78e3d9e5-6781-11ee-98d3-6d05b1d4d9a1;
 Tue, 10 Oct 2023 17:27:08 +0200 (CEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id AE2DC5C00D6;
 Tue, 10 Oct 2023 11:27:06 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 10 Oct 2023 11:27:06 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 10 Oct 2023 11:27:05 -0400 (EDT)
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
X-Inumbo-ID: 78e3d9e5-6781-11ee-98d3-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1696951626; x=1697038026; bh=EWuTQUZrHYAty7+hic0E/Wo96JiZ+s+YocD
	ALHROmKU=; b=LJAp0wbmUnKyehflqNkCM4Dsi1p0vMhLOlzQ0/1ybq4FYcDxIBx
	LVRPfivFGLVFuBV3JDRQMgRLoEjY0cLf3jQMIyS6qupA7ZnEgdYV89iD7dz3gCTR
	jiPkc+GQmZ9zn2NddBwYixVMQ4Vn9pWgBWzePqeymGaZhNUgtcAG5AgyaKYw1FTD
	S5NAx2yQ31u34ITZV5h1B6qH8VgGZvPZxfZdyytfae1gWYrY/NkAIv6nwH6/tPhl
	56NeT8WDtcGm/wpVbzvoTQ4pO8DUDOlDNzfYBYxbUETK3ecQd/AYiOT9+S0Q8IMB
	i/E8R5aomVvQt2U1iYEFE1K2z+o6sGmcvow==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1696951626; x=1697038026; bh=EWuTQUZrHYAty
	7+hic0E/Wo96JiZ+s+YocDALHROmKU=; b=diYc6WLp2JQIjDAXR25KoW0B3dMzd
	+s9XOPQqdnotJ8Hqoo7ZbXcUCEj7nEnVXS3M8cszxapTnMPIy8vqPmr0R+ioWxSZ
	XTABbE79UPq57pxtPFa8aRCOWOYiXsFG7Ilt/L2YMacHVKJSDL96wE13EqayfPYw
	+R30Qc2u3lSwjZ6HKnBiL7TP4rAq27KBa8QzjPBJ88pZJzMDNmYxrpDriLAiE5TF
	cz2kchMUAnwwit37fAT0kUZQAtHWm11Du3/pMERZ83a9Pt3JaHy7QbXGlAgULmpp
	uasZVPNlsPwSvG8UuGkO0vh0sv3RN4da+tis0llUGnGIgI/vZAdXVR6lg==
X-ME-Sender: <xms:Sm0lZQubFBdfoyETH2M6ukjcZl2MZ9Qh8wwNgxXbO9FeuwbtZVV_8A>
    <xme:Sm0lZdcBLBeLQEtxnhAVtzsANXlEwrXK_u56c7cdmzc5i91expD1dS900w_UdulQr
    9zRcqVmLOlZ3Q>
X-ME-Received: <xmr:Sm0lZbxK-ILXyobf0Uwk7mRy2ibU3hRhkulXOhw3eyBptipFWiM29TOPMP1bziCT_il7SrpJNtskW0qpg9SjRr7ujAn65CbFAN8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrheehgdekjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgudel
    teefvefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:Sm0lZTMmEAkW-Jyfb78tohEB1PzxcmdcIdyC9a49qo1pudBj-PWHVA>
    <xmx:Sm0lZQ_aeQvcv_utkn0Iv3lvGkYJuF3lDc9c_i3_dPyP2Qg69Vht7w>
    <xmx:Sm0lZbXuheU8vmtV8W1AL3pO4CdQCMFFM5TJoODP0cffkqQWtAcKYQ>
    <xmx:Sm0lZSJ6Grvg-WiFS5ldVfshMjcUFUujx4mQcbyGrqALbf6UNnvGVg>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 10 Oct 2023 17:27:03 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Javi Merino <javi.merino@cloud.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH v1] tools/python: Add python3 compatibility
Message-ID: <ZSVtR1ct4Hik4XM8@mail-itl>
References: <efb10e537e37df1995dd8f87c28a8eb64ec9b61e.1696947009.git.javi.merino@cloud.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XrEe8fIA8+tO70cE"
Content-Disposition: inline
In-Reply-To: <efb10e537e37df1995dd8f87c28a8eb64ec9b61e.1696947009.git.javi.merino@cloud.com>


--XrEe8fIA8+tO70cE
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 10 Oct 2023 17:27:03 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Javi Merino <javi.merino@cloud.com>
Cc: xen-devel@lists.xenproject.org, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [XEN PATCH v1] tools/python: Add python3 compatibility

On Tue, Oct 10, 2023 at 03:18:45PM +0100, Javi Merino wrote:
> Most of the work for python3 compatibility was done in
> 1430c5a8cad4 (tools/python: Python 3 compatibility, 2019-12-18).  This
> just adds a few builtins needed for python3.
>=20
> Resolves: xen-project/xen#156
>=20
> Signed-off-by: Javi Merino <javi.merino@cloud.com>
> ---
>=20
> I haven't tested it.
>=20
>  README                                     | 1 +
>  tools/python/scripts/convert-legacy-stream | 3 +++
>  2 files changed, 4 insertions(+)
>=20
> diff --git a/README b/README
> index 855db01d36..44ed88c392 100644
> --- a/README
> +++ b/README
> @@ -51,6 +51,7 @@ provided by your OS distributor:
>      * POSIX compatible awk
>      * Development install of zlib (e.g., zlib-dev)
>      * Development install of Python 2.7 or later (e.g., python-dev)
> +      - If using Python 2.7, you also need the future module.  This is n=
ot needed for Python 3.
>      * Development install of curses (e.g., libncurses-dev)
>      * Development install of openssl (e.g., openssl-dev)
>      * Development install of x11 (e.g. xorg-x11-dev)
> diff --git a/tools/python/scripts/convert-legacy-stream b/tools/python/sc=
ripts/convert-legacy-stream
> index 7fe375a668..26a66c50fc 100755
> --- a/tools/python/scripts/convert-legacy-stream
> +++ b/tools/python/scripts/convert-legacy-stream
> @@ -8,6 +8,9 @@ Convert a legacy migration stream to a v2 stream.
>  from __future__ import print_function
>  from __future__ import division
> =20
> +from builtins import zip
> +from builtins import range
> +from builtins import object

In which python version it's needed? The thing about builtins is they
are available without explicit import.

>  import sys
>  import os, os.path
>  import syslog
> --=20
> 2.42.0
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--XrEe8fIA8+tO70cE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmUlbUcACgkQ24/THMrX
1ywoTAgAmFUC4ImQoWXVAkUdUym0pvzujiWGRzQSjcZJB+HJ1TZc/phOOWKeSrC5
bz09Xq8RxmsMGk9374a0rShXCOOM83Y24tMMV+HIVk8nHGzViPCsvqqyXQ49Ek+k
c3Yz5muKzMLJhaY5RcjxwEYzZ4J4BNBn6P1vMDE+rPi91BW4U9zhMtd41Zl9KUBY
3a/Fubqf1hyowHBA6c4+7YzJDdgTw1T49/efCM/TFFeHCfVJDX3dTVWxxsi43Ycq
FJxvcdIroHwGfHefGp9B4rZ8a8PyQmIz7aapQEKnQbJ1uUD89qrxc1x5xV9UgugJ
A2Iqt+nsy44dTykFL26e4heYsLxo8w==
=i62F
-----END PGP SIGNATURE-----

--XrEe8fIA8+tO70cE--

