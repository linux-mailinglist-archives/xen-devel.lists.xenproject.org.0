Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD5A65AA45
	for <lists+xen-devel@lfdr.de>; Sun,  1 Jan 2023 16:01:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.470113.729550 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pBzpm-0001DM-LG; Sun, 01 Jan 2023 15:01:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 470113.729550; Sun, 01 Jan 2023 15:01:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pBzpm-0001A0-IY; Sun, 01 Jan 2023 15:01:10 +0000
Received: by outflank-mailman (input) for mailman id 470113;
 Sun, 01 Jan 2023 15:01:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=11tG=46=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1pBzpk-00019u-T3
 for xen-devel@lists.xenproject.org; Sun, 01 Jan 2023 15:01:09 +0000
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1bc8970d-89e5-11ed-91b6-6bf2151ebd3b;
 Sun, 01 Jan 2023 16:01:04 +0100 (CET)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id F206132002FB;
 Sun,  1 Jan 2023 10:01:00 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Sun, 01 Jan 2023 10:01:01 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 1 Jan 2023 10:00:56 -0500 (EST)
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
X-Inumbo-ID: 1bc8970d-89e5-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to; s=fm2; t=1672585260; x=
	1672671660; bh=X7obdlIu9PYYeP+uZsieZNOt5OQU6gNv6h9CZLugzpQ=; b=E
	jOj39WEP4Ya9aiY5z1cNiMq59QPtZ5lSR1Fz7SKlt/qt480vfBRKFNEsItcGF31z
	BU9TxV7WbMyICR1unSeS/EACE/cV4CkVGKmHxAQWPQeZqIVykcGmOLgi57amXdpA
	hYNs3+cg8apMBM3kmtfgliJnO/TPJWxlOceYhila7CL26JMa674XNe1lB5XRtXSs
	OA2CDb1iEJDlc4iy5BKyqRCd8PN9zqRusraZLrrWv0L1xVK/KdY5tpcHZ4J5/Pzy
	DZi6Rta6MuDFvxgS3okcA/x9VHSlxSeKK3JY2RDpDUAtZyXzYHC9XAiYS3uqrXh2
	9APFOUzMNRTeuDviBzx5g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1672585260; x=1672671660; bh=X7obdlIu9PYYeP+uZsieZNOt5OQU
	6gNv6h9CZLugzpQ=; b=hSQokPzcSPcDKmZporw7m5E0UIGhIkehrm/AiA/nRecW
	oTaPm4r0UO5v8lfTGNmnLcRHmhzvzXl9Uh41y8MxCPSl3LUTI4XILY4SPUBI30z9
	3qyBV/j438ksvWRxF+IHVKraC7LO/CM1k+SxxmC7MZfHYRMm3s2foaeZqFSw11jk
	tVemo1wsIflh/bYCJ10aG3CshRnyZSk1R6IzPD6HAb6/mjjGR4NLAYxdWV/Kzfnk
	679LbJbNkwzWVTVjG1GyjK7VO36NOIITTNMp48BCKPqPyKn4gW1Fm0NA5SsIfMuk
	7ICNLmMG/rd+9cBev1+4lKf2ZL+l24DBxq4uz4dM6A==
X-ME-Sender: <xms:LKCxY8WZqMc2eGTAPIOT4YF24c2IkasVNbfuWpMyHsbcyY3yFX4VRQ>
    <xme:LKCxYwmTglwkrGYKGcwCDa0_t6gojO7koEqeIf5hsfFGRr4C-NK0BCK_zIpUuBhGM
    fJcDTMD6MEIZg>
X-ME-Received: <xmr:LKCxYwYJXwVddni7u8DHbOuOx2qrpdJgqWNeOTeE5nMruTFsx4_sq4rdE7nK>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrjedtgdeijecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgudel
    teefvefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:LKCxY7Wn_XWyX3gE5b8sZ4RA-VihSeZM6x7vNcErCLKL181wpoJOMA>
    <xmx:LKCxY2nKzO6SVRp9WwNcehUFwoGk-kcjU0m_51bcvtFYId6uxIbc-g>
    <xmx:LKCxYwchv9L1yvysLFR5F2_hpBY9JRfE7MSfn9-QOyKqWb60vynorQ>
    <xmx:LKCxY7xbFS_xzW0r2fYjLCHfNJMoa2EVnN0IlE-I88mXOVYJuYe3rw>
Feedback-ID: i1568416f:Fastmail
Date: Sun, 1 Jan 2023 16:00:50 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH 1/2] x86/cpuid: Infrastructure for leaves 7:1{ecx,edx}
Message-ID: <Y7GgJJ5wyds83Uwn@mail-itl>
References: <20221231003007.26916-1-andrew.cooper3@citrix.com>
 <20221231003007.26916-2-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tMAtNi7zpm7M/yTn"
Content-Disposition: inline
In-Reply-To: <20221231003007.26916-2-andrew.cooper3@citrix.com>


--tMAtNi7zpm7M/yTn
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sun, 1 Jan 2023 16:00:50 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH 1/2] x86/cpuid: Infrastructure for leaves 7:1{ecx,edx}

On Sat, Dec 31, 2022 at 12:30:06AM +0000, Andrew Cooper wrote:
> We don't actually need ecx yet, but adding it in now will reduce the amou=
nt to
> which leaf 7 is out of order in a featureset.
>=20
> cpufeatureset.h remains in leaf architectrual order for the sanity of any=
one
> trying to locate where to insert new rows.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> ---
>  tools/misc/xen-cpuid.c                      | 10 ++++++++++
>  xen/arch/x86/cpu/common.c                   |  3 ++-
>  xen/include/public/arch-x86/cpufeatureset.h |  3 +++
>  xen/include/xen/lib/x86/cpuid.h             | 15 ++++++++++++++-
>  4 files changed, 29 insertions(+), 2 deletions(-)
>=20
> diff --git a/tools/misc/xen-cpuid.c b/tools/misc/xen-cpuid.c
> index d5833e9ce879..0091a11a67bc 100644
> --- a/tools/misc/xen-cpuid.c
> +++ b/tools/misc/xen-cpuid.c
> @@ -202,6 +202,14 @@ static const char *const str_7b1[32] =3D
>      [ 0] =3D "ppin",
>  };
> =20
> +static const char *const str_7c1[32] =3D
> +{
> +};
> +
> +static const char *const str_7d1[32] =3D
> +{
> +};
> +
>  static const char *const str_7d2[32] =3D
>  {
>      [ 0] =3D "intel-psfd",
> @@ -229,6 +237,8 @@ static const struct {
>      { "0x80000021.eax",  "e21a", str_e21a },
>      { "0x00000007:1.ebx", "7b1", str_7b1 },
>      { "0x00000007:2.edx", "7d2", str_7d2 },
> +    { "0x00000007:1.ecx", "7b1", str_7c1 },
> +    { "0x00000007:1.edx", "7b1", str_7d1 },

"7c1" and "7d1" ?



--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--tMAtNi7zpm7M/yTn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmOxoCQACgkQ24/THMrX
1ywWTggAlO6Y2XPzgM/eZh8mSyzx8sApwoYd3Qa8kz/xV1Kj3HSX4kI6tL7z+RMH
yXC6bideqATvzFRzTWWzgQ+3nwiSi/EFe0H3W4EeKy1En2SBjpVNeZDjeLk+uPj4
1cbbv61BDcBd196DLrMG71L0UTJYe+RnJPOwGPtp/gSgzy2/zqAHfsj7707qOJOe
QnqxuZeP7D42+cHJ6ot8e31x7ScCL4V0Aa0LOR7svmBPHm1bPNjpjgguELfdGYQC
UjmJgrAUHIL+00S4r488PeL22YuLnX3PkW8YqNjtB1awLyiOuKtSZxO9sDr5rGPy
onuMim5IYhj9HkxrTWhak1vI0xxvyg==
=W6fD
-----END PGP SIGNATURE-----

--tMAtNi7zpm7M/yTn--

