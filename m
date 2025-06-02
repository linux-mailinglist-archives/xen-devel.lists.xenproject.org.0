Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C57C7ACB182
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 16:20:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003491.1383057 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM61h-0001m8-Kd; Mon, 02 Jun 2025 14:20:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003491.1383057; Mon, 02 Jun 2025 14:20:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM61h-0001kL-HR; Mon, 02 Jun 2025 14:20:33 +0000
Received: by outflank-mailman (input) for mailman id 1003491;
 Mon, 02 Jun 2025 14:20:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zRGa=YR=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1uM61g-00008u-KC
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 14:20:32 +0000
Received: from fhigh-b3-smtp.messagingengine.com
 (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bca2daae-3fbc-11f0-b894-0df219b8e170;
 Mon, 02 Jun 2025 16:20:30 +0200 (CEST)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal
 [10.202.2.45])
 by mailfhigh.stl.internal (Postfix) with ESMTP id B126B2540166;
 Mon,  2 Jun 2025 10:20:29 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-05.internal (MEProxy); Mon, 02 Jun 2025 10:20:29 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 2 Jun 2025 10:20:28 -0400 (EDT)
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
X-Inumbo-ID: bca2daae-3fbc-11f0-b894-0df219b8e170
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1748874029;
	 x=1748960429; bh=AV/igsfrrFWvo9IG6lLn9Rt0La8NTlknG/qFtz69sJY=; b=
	kHyTEFDTlxfk3VRrr14Z3H8wcYR38pAalGbKRI6eSXIOHxuIh1kzNL3YamEHI6al
	+2tx6U4YZjZyhuy8z0V11GtgusQmh39VKLjlqPZjx+ZCt3ZBLCpM0J4qi2BhfCyU
	gMjoRhOVNHWJHW72sOahnv8hgYFkUR97z2ZQwPPIaoZaCwtKmj7UxrJl8RK07fv5
	hAIwC+yzDb1xnQ1SIYy8KSfeapJyRPLjzCU6sXSZdA239Jypn8v7IYIDBD4t83ga
	tqMRBwZr5U4ImYA9VmiI0nnok659XYaYGzNhmMmyIdQmVbK/aNKwPuzdfH1s42C7
	ht+JhCQR/WJm5DanXgYL/w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1748874029; x=1748960429; bh=AV/igsfrrFWvo9IG6lLn9Rt0La8NTlknG/q
	Ftz69sJY=; b=PUvaREDggQpJbbKSgyuOjqdXHPoBzJKW+R8m22hRkGuSD9GtWT9
	bXqLYL157WmQEJx+l60VCIXOD/TFXnB95qlOgDyr2CXG0V9w7jJIAdzCwkfpugdG
	J5kNdHejHwKW4Ul1OXDwm7GptgAiBk+Bu8Jop8jRloUKPVo7+SWK59q4ftO7wZsI
	MOl8H5SDmU131o9uSOQ07Ojl2S+r5abERX3Rvnl321GS/H1VnIN+8ZU0M+xZOkBu
	SYiUFkORMC6srkhTPI6YHjoMWNKxe93bUgtpC6FkRajmMI5Z2Lam0H+BWaeJIK6B
	/m1BDohqj+ILiJcgoLxeQjJawteZSOxUWaA==
X-ME-Sender: <xms:LbM9aDmlqjVj2ZGLREtr7cLlx-7EAGSsA1wZ8ECg4slcA33nFU_KOA>
    <xme:LbM9aG2rmzCsfU0NBtFajTe7rE1rWgFb6_0pA5wFkDwPSQ33fd23IxoiH1sYyk6Np
    -Wmja2o4U8teQ>
X-ME-Received: <xmr:LbM9aJpDKBSpaqTNEmnptzo4lwP62Gpbvx1dT1ZG6f2x3qHAKr2GflPGMmRBREXsPu9JuvoRsdjNBQ1EjcbUm4552GapwTO_0q0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtddtgdefjeeltdculddtuddrgeefvddrtd
    dtmdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggft
    fghnshhusghstghrihgsvgdpuffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftd
    dtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhf
    gggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghkucforghrtgiihihkohifsh
    hkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhg
    shhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgudelteefvefhfeehieetleeihf
    ejhfeludevteetkeevtedtvdegueetfeejudenucevlhhushhtvghrufhiiigvpedtnecu
    rfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthh
    hinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeefpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopehkvghvihhnrdhlrghmphhishestghlohhuugdrtghomhdprhgtph
    htthhopeigvghnqdguvghvvghlsehlihhsthhsrdigvghnphhrohhjvggtthdrohhrghdp
    rhgtphhtthhopehrohhsshdrlhgrghgvrhifrghllhestghithhrihigrdgtohhm
X-ME-Proxy: <xmx:LbM9aLmQvOQ9gs-H0o9pAiFgOmKMThA6MiPfnWtRQRld4XzWYSxp6g>
    <xmx:LbM9aB2ZH-P7vFQrs6wCSjDUyFIIkpqGBsYbPfvpXvqM--jCr_LSDQ>
    <xmx:LbM9aKvbpuUC2JBR3y2JEoMS18AkCZldQaHfltS2mlPQ_Bwjledsog>
    <xmx:LbM9aFW7qO8L0_nOJlCkg9j8uE3wgfMLxMee4Dfafm6xYguNDdzIwQ>
    <xmx:LbM9aLOSB9XDM5poxqwV2chDSTQtNELk7goYEVPgFv606M3QkpWvT3Mo>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 2 Jun 2025 16:20:26 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Kevin Lampis <kevin.lampis@cloud.com>
Cc: xen-devel@lists.xenproject.org,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: Re: [PATCH v2 2/3] Add lockdown mode
Message-ID: <aD2zKsIcsQt-LQlt@mail-itl>
References: <20250602134656.3836280-1-kevin.lampis@cloud.com>
 <20250602134656.3836280-3-kevin.lampis@cloud.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ws1tl/B/3EL9OFd3"
Content-Disposition: inline
In-Reply-To: <20250602134656.3836280-3-kevin.lampis@cloud.com>


--ws1tl/B/3EL9OFd3
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 2 Jun 2025 16:20:26 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Kevin Lampis <kevin.lampis@cloud.com>
Cc: xen-devel@lists.xenproject.org,
	Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: Re: [PATCH v2 2/3] Add lockdown mode

On Mon, Jun 02, 2025 at 02:46:55PM +0100, Kevin Lampis wrote:
> From: Ross Lagerwall <ross.lagerwall@citrix.com>
>=20
> The intention of lockdown mode is to prevent attacks from a rogue dom0
> userspace from compromising the system. Lockdown mode can be controlled b=
y a
> Kconfig option and a command-line parameter. It is also enabled automatic=
ally
> when Secure Boot is enabled and it cannot be disabled in that case.
>=20
> If enabled from the command-line then it is required to be first in the
> list otherwise Xen may process some insecure parameters before reaching
> the lockdown parameter.
>=20
> Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
> Signed-off-by: Kevin Lampis <kevin.lampis@cloud.com>
> ---
> Changes in v2:
> - Remove custom command line parsing
> - Print warning if lockdown is not first on command line
> ---
=2E..

> diff --git a/xen/common/lockdown.c b/xen/common/lockdown.c
> new file mode 100644
> index 0000000000..84eabe9c83
> --- /dev/null
> +++ b/xen/common/lockdown.c
> @@ -0,0 +1,54 @@
> +/* SPDX-License-Identifier: GPL-2.0-or-later */
> +
> +#include <xen/efi.h>
> +#include <xen/lockdown.h>
> +#include <xen/param.h>
> +
> +#define FIRST_ARG_FLAG 2
> +
> +static int __ro_after_init lockdown =3D IS_ENABLED(CONFIG_LOCKDOWN_DEFAU=
LT);
> +
> +void __init lockdown_set_first_flag(void)
> +{
> +    lockdown |=3D FIRST_ARG_FLAG;
> +}
> +
> +void __init lockdown_clear_first_flag(void)
> +{
> +    lockdown &=3D ~FIRST_ARG_FLAG;
> +}
> +
> +static int __init parse_lockdown_opt(const char *s)
> +{
> +    if ( strncmp("no", s, 2) =3D=3D 0 )

This is rather inconsistent with other bool options. I think you want to
use parse_bool() here.

> +        if ( efi_secure_boot )
> +            printk("lockdown can't be disabled because Xen booted in Sec=
ure Boot mode\n");
> +        else
> +            lockdown =3D 0;
> +    else
> +    {
> +        if ( !(lockdown & FIRST_ARG_FLAG) )
> +            printk("lockdown was not the first argument, unsafe argument=
s may have been already processed\n");
> +
> +        lockdown =3D 1;
> +    }
> +
> +    return 0;
> +}
> +custom_param("lockdown", parse_lockdown_opt);

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--ws1tl/B/3EL9OFd3
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmg9syoACgkQ24/THMrX
1ywGAAgAkkdGb+Ji+h1zoL1o9UKy6Md6/Yf6cqEdulcY7MvpAwQM0tZ9p19Hlx2U
w+ZD933uNMhpZYEMj/9+v6dgjnnzDKF3Aqni3j2zAG206LzNWyNj4j6SWGKK5dLD
82iQ8j+AgPQMH+Uhd7fWrn4azDs0Yn7gIoLRFXJ/6XBqEcS3DWMocM25zhkvPq8m
mFJ6AfXMHCtTOaE+jbEarrms8IB9/Pd/G9uPr4rj2MPaNC52aBt91xeyIVe/vWLW
Q5ln68x4/FSPEDb6ullh0m7j1evSn9ud9X678L/xEs3M0wW9+mKIK68GCOFBzN/C
ptxuECA+UgAi+nKICY/Y/7gIepW27A==
=DS/K
-----END PGP SIGNATURE-----

--ws1tl/B/3EL9OFd3--

