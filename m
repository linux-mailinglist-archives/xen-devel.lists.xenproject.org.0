Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E4D6BD7E4
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 19:13:14 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510791.789164 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcs5s-00078E-9O; Thu, 16 Mar 2023 18:12:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510791.789164; Thu, 16 Mar 2023 18:12:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcs5s-000758-6a; Thu, 16 Mar 2023 18:12:52 +0000
Received: by outflank-mailman (input) for mailman id 510791;
 Thu, 16 Mar 2023 18:12:51 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ItE1=7I=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1pcs5r-000752-0g
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 18:12:51 +0000
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 278d65ee-c426-11ed-b464-930f4c7d94ae;
 Thu, 16 Mar 2023 19:12:48 +0100 (CET)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 93BB832007F0;
 Thu, 16 Mar 2023 14:12:45 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 16 Mar 2023 14:12:46 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Mar 2023 14:12:44 -0400 (EDT)
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
X-Inumbo-ID: 278d65ee-c426-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1678990365; x=1679076765; bh=Ab9R1HCydFujHJtOFpON+M3dVibwjpcCjV4
	o4gMcFRE=; b=G6C3S4Y/N/jwMzG3MwZqi2QoDAei3ps6AZ1+w2OhCkz1nKGcEpH
	k9EgvRCoSDFlD25bQ+S3TwbnRugbSbNVcxD++GPXNzEEfGfarHL3ED5JlyC4bHs6
	qsSDBIE0x4Kfh1uLBS5QFiBD8doenNs9vIzQdV//7S0WcOsxgGsMRXvAnkYpXJmj
	SBtrOjWuQdT4oqbDgKT9m10I4yaKlanVCYRUEncL18YV1cBG9fMG5PvGIgJTJnVD
	oqXxaQEu9EA2s79zaRkEwFigeebddi4t3129ZQQLNoVgOZrQ3BGHJ8WXZLvqQQQx
	4pDkFxMANOOYZPnwML3HTO9R0vdvv1o5ZJg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1678990365; x=1679076765; bh=Ab9R1HCydFujH
	JtOFpON+M3dVibwjpcCjV4o4gMcFRE=; b=OEmIQHt+Oj1vIp8SJT4A+T/rEcy+R
	+g3+bRo6Q53yS5vLv8vnIwwpphNkNqAL5Rooi4lHr5lKaGZmuocKB1n+4XupaDNZ
	Jj+7hHtU+JMM51lMepBndaqLkiu2TvZUKC/I0eVGxCUBWPc8GXP9HAUOMEeGC52W
	RcYdIloPV4b/byMLE2sEW5JFF7jQDslVK9DskJ92YI42EHDLv73vaZ/kFGpojpsa
	GtfH++o2dqyaeca55wXhdxzVIEemOJZLvxdR0bnC5ozDoIRAttQSNQnRQAuUSLvQ
	aNn54NcBTGoa6xSNzAHn4iGDAcu0rLGS6GMTYuf5x2dm3bv/N+/NcoYoQ==
X-ME-Sender: <xms:HFwTZN-PSh27KQhxG8raAgd2Ie-5wC_Qt69ASBJZqHK6MiclYS-DiQ>
    <xme:HFwTZBu4i8Fd3fdpfHUmRz6yf3PyEn-PmX7xVWV_7aCbx7YgENYoDlKbwEcwFC-e-
    80r9wEHRFrN3g>
X-ME-Received: <xmr:HFwTZLD9KQp4KSTnuX7BlX-ca_vd9A0ncXz2Zob0TMfFpJWsxU1M6U62aWtCFs1-fP8AglLNd2OAcq5XtWmcgnexSHcrBa6Ncvc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeftddgudduudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    udelteefvefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:HFwTZBeQ8NCtKB3tqdilISk7ASCNuIeMigici_nme7iBNlnSlXZ4Ow>
    <xmx:HFwTZCPIWRt9tiy8K85wC7JBTdISspIC_VS13s0U4bETTnG0bgHWiQ>
    <xmx:HFwTZDlFNKrZpXxnTqHdPbNERBfKjIOTtRHm2_lqdVt01mQVJ5EcGA>
    <xmx:HVwTZLaWurB8YE1crgCl3g_qnAB4Fh2ItkmniNQf2_yiHemQlvBLFA>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 16 Mar 2023 19:12:40 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Bernhard Kaindl <bernhard.kaindl@citrix.com>
Subject: Re: [PATCH 7/7] tools/python: Drop shebangs from library files
Message-ID: <ZBNcGSJvOh0h3Den@mail-itl>
References: <20230314141520.3652451-1-andrew.cooper3@citrix.com>
 <20230314141520.3652451-8-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UGj6/sWBERrGyvzU"
Content-Disposition: inline
In-Reply-To: <20230314141520.3652451-8-andrew.cooper3@citrix.com>


--UGj6/sWBERrGyvzU
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Mar 2023 19:12:40 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Bernhard Kaindl <bernhard.kaindl@citrix.com>
Subject: Re: [PATCH 7/7] tools/python: Drop shebangs from library files

On Tue, Mar 14, 2023 at 02:15:20PM +0000, Andrew Cooper wrote:
> These aren't runable scripts, so shouldn't have shebangs.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

> ---
> CC: Wei Liu <wl@xen.org>
> CC: Anthony PERARD <anthony.perard@citrix.com>
> CC: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>
> CC: Bernhard Kaindl <bernhard.kaindl@citrix.com>
> ---
>  tools/python/xen/migration/legacy.py | 1 -
>  tools/python/xen/migration/libxc.py  | 1 -
>  tools/python/xen/migration/libxl.py  | 1 -
>  tools/python/xen/migration/public.py | 1 -
>  tools/python/xen/migration/tests.py  | 1 -
>  tools/python/xen/migration/verify.py | 1 -
>  tools/python/xen/migration/xl.py     | 1 -
>  tools/python/xen/util.py             | 1 -
>  8 files changed, 8 deletions(-)
>=20
> diff --git a/tools/python/xen/migration/legacy.py b/tools/python/xen/migr=
ation/legacy.py
> index 6456d6157ce3..e196ca876095 100644
> --- a/tools/python/xen/migration/legacy.py
> +++ b/tools/python/xen/migration/legacy.py
> @@ -1,4 +1,3 @@
> -#!/usr/bin/env python
>  # -*- coding: utf-8 -*-
> =20
>  """
> diff --git a/tools/python/xen/migration/libxc.py b/tools/python/xen/migra=
tion/libxc.py
> index 9881f5ced4ea..e52e632cb106 100644
> --- a/tools/python/xen/migration/libxc.py
> +++ b/tools/python/xen/migration/libxc.py
> @@ -1,4 +1,3 @@
> -#!/usr/bin/env python
>  # -*- coding: utf-8 -*-
> =20
>  """
> diff --git a/tools/python/xen/migration/libxl.py b/tools/python/xen/migra=
tion/libxl.py
> index 5c4d4fe0631b..5dcb50fe0207 100644
> --- a/tools/python/xen/migration/libxl.py
> +++ b/tools/python/xen/migration/libxl.py
> @@ -1,4 +1,3 @@
> -#!/usr/bin/env python
>  # -*- coding: utf-8 -*-
> =20
>  """
> diff --git a/tools/python/xen/migration/public.py b/tools/python/xen/migr=
ation/public.py
> index fab2f84587b7..23183ef67db8 100644
> --- a/tools/python/xen/migration/public.py
> +++ b/tools/python/xen/migration/public.py
> @@ -1,4 +1,3 @@
> -#!/usr/bin/env python
>  # -*- coding: utf-8 -*-
> =20
>  """
> diff --git a/tools/python/xen/migration/tests.py b/tools/python/xen/migra=
tion/tests.py
> index f22e2c2b7cf0..fcf94b0bb264 100644
> --- a/tools/python/xen/migration/tests.py
> +++ b/tools/python/xen/migration/tests.py
> @@ -1,4 +1,3 @@
> -#!/usr/bin/env python
>  # -*- coding: utf-8 -*-
> =20
>  """
> diff --git a/tools/python/xen/migration/verify.py b/tools/python/xen/migr=
ation/verify.py
> index 1e38f4a3c01e..b847c4bd220f 100644
> --- a/tools/python/xen/migration/verify.py
> +++ b/tools/python/xen/migration/verify.py
> @@ -1,4 +1,3 @@
> -#!/usr/bin/env python
>  # -*- coding: utf-8 -*-
> =20
>  """
> diff --git a/tools/python/xen/migration/xl.py b/tools/python/xen/migratio=
n/xl.py
> index 978e744dfd95..139d496654df 100644
> --- a/tools/python/xen/migration/xl.py
> +++ b/tools/python/xen/migration/xl.py
> @@ -1,4 +1,3 @@
> -#!/usr/bin/env python
>  # -*- coding: utf-8 -*-
> =20
>  """
> diff --git a/tools/python/xen/util.py b/tools/python/xen/util.py
> index a11358eefa13..47ceb5bd21fe 100644
> --- a/tools/python/xen/util.py
> +++ b/tools/python/xen/util.py
> @@ -1,4 +1,3 @@
> -#!/usr/bin/env python
>  # -*- coding: utf-8 -*-
> =20
>  import os
> --=20
> 2.30.2
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--UGj6/sWBERrGyvzU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmQTXBkACgkQ24/THMrX
1ywVyAf+N5FjzNJ/Y5DkQWD9kQKmtWwl1wdIhG6CHUeyLnvImRTlko90Hmjra5DC
Ln8EXA9bDokcrkXQsA5VdWkGVu2lQ8absUqfWzCd3kxT2oIGXlvpyKh9WDVJ7GXS
yQHIL1Q6qyBOE6nQ6xnbsw65Tighdn1pw/6wV3fNZe87sFSeBnQmbR1td7TDxW9z
hQm+O/0VUpc8AIEVo/HI8CFzvGtX0xwNWZfzdXQK4rdW/vdMJd9P1QSYr7g8m8q9
ZVN+2N2wgGpyN6dskpLqgfgyO3TDtvHgvQ/dNYqV39zNzE79EeQ1sBgL+0dVOa/a
rtAGqrhRwPspAgQOtocuvchlulckAg==
=5vEd
-----END PGP SIGNATURE-----

--UGj6/sWBERrGyvzU--

