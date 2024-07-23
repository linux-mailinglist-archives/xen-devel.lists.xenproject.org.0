Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1427939EB7
	for <lists+xen-devel@lfdr.de>; Tue, 23 Jul 2024 12:24:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.762969.1173213 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWCgk-0002RJ-S6; Tue, 23 Jul 2024 10:24:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 762969.1173213; Tue, 23 Jul 2024 10:24:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sWCgk-0002PJ-Oq; Tue, 23 Jul 2024 10:24:10 +0000
Received: by outflank-mailman (input) for mailman id 762969;
 Tue, 23 Jul 2024 10:24:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xgPy=OX=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1sWCgj-0002PD-5n
 for xen-devel@lists.xenproject.org; Tue, 23 Jul 2024 10:24:09 +0000
Received: from fout7-smtp.messagingengine.com (fout7-smtp.messagingengine.com
 [103.168.172.150]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af59c1e9-48dd-11ef-bbfe-fd08da9f4363;
 Tue, 23 Jul 2024 12:24:06 +0200 (CEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailfout.nyi.internal (Postfix) with ESMTP id 59C4B1380521;
 Tue, 23 Jul 2024 06:24:03 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Tue, 23 Jul 2024 06:24:03 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 23 Jul 2024 06:24:01 -0400 (EDT)
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
X-Inumbo-ID: af59c1e9-48dd-11ef-bbfe-fd08da9f4363
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1721730243;
	 x=1721816643; bh=Uzk9y7b0LvyRMNuN0uE2uPhPtiBU94dfsnk4x657QoU=; b=
	NoKW/bpMGvjtEoe4J5VeEi1sBEyzkLoSyHzHOcIllBwIVlB45hVMozWR7YdUr6a/
	fDuBNMEYK2Ki6Z7kh6dV3ho8FC+ntj+bJqYRkdHt4KY5tFpBDGaSRTsIty/kqrQc
	q/FuyCVnxfnOBEsBoTWvIOZJdDZefYCXDoiRB37FHIhdYhVnGYeOjoZkBXuyZms1
	7rzn7A66vj2s9eEPpjlPVp4cbAa2I2a+aeSi8sNiI5KI0UezH75ah9Hwr2A6Xz4z
	yw1wAyz9BTpBKD7tPtlOsWJaRMZOHBPjMzUTe1cMY/39neV5EajiR+0Osfq+mEzK
	i3Zv/mFqWnF1Od/bs6Wrtg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1721730243; x=1721816643; bh=Uzk9y7b0LvyRMNuN0uE2uPhPtiBU
	94dfsnk4x657QoU=; b=dUFz/SYkGt2Y8u1bKKq8n90mQoGDbVjWM8p6dOb23t8w
	pBYIpdGC2a2ql96EIFWmj0Ha5Z0e6BicZvv5p/FCg9YdyLZk89AgUhopU2PZ+g1P
	FCy+nN0CO+TsPYW2RFFdjKtmGPn6VOJlgfWJAoSApqwTRF1HRGTcQdDmzLWA5haQ
	r6o16NoaAh9mwnrdSSjvPNHJPWe7aoQ43W7idYmTsYbeNBoFXQkzUkLKU7snIL2O
	6DHNrrH4QPJTcPA0yUZAEkXSOut4o/lkdBuqpuIW1M7FUdFVqS2Hnlhm2kPKUfrV
	PCK/wMxBMG7oYB/lXYFHdWBizLKuF8QBfQrtxQhwLQ==
X-ME-Sender: <xms:w4SfZrNvTPxH7adKRsAHx-T1XcUgn4UJLSHHPnWOCXKgi35DsFBgCA>
    <xme:w4SfZl994JNC8Y_9BrtZG6pk7TY1mb0Wcm997tllzjl_5mcJef52b58ubcRfjdU2l
    ccHEge_unbVtw>
X-ME-Received: <xmr:w4SfZqQTLZRpWoZOBkw6hp9jyaNiJfNbmhqjArQy6HsA7-dJK75OZgM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrheelgddvjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefgudel
    teefvefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopedt
X-ME-Proxy: <xmx:w4SfZvsg6i4nVq7CXvsJ7n-1_qAW5ZcbIBba3cVTXO_Z8YQ1qEeDEA>
    <xmx:w4SfZjdR-aA7tNoxqwEiP3ttQ-RmLna7tQo7o9RVeuJ_47lHOJbMzg>
    <xmx:w4SfZr2auZo7kbPPiLVtZrBulWpCShtaRafI90DFGZac0zF8vOIzHA>
    <xmx:w4SfZv9B5qBpwCddVS7hLCvKthaDWqA2QF1HY2i2sliIstCameG4EQ>
    <xmx:w4SfZrQn0RBGqutikHQoAUk-nB5yCtgBHeQrAboxfv7BfhTIfSFM302W>
Feedback-ID: i1568416f:Fastmail
Date: Tue, 23 Jul 2024 12:23:58 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Gene Bright <gene@cyberlight.us>
Subject: Re: [PATCH 1/2] x86/efi: Simplify efi_arch_cpu() a little
Message-ID: <Zp-Ev__kc3xQRgf_@mail-itl>
References: <20240722101838.3946983-1-andrew.cooper3@citrix.com>
 <20240722101838.3946983-2-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lEMPaGzDlhaGp2++"
Content-Disposition: inline
In-Reply-To: <20240722101838.3946983-2-andrew.cooper3@citrix.com>


--lEMPaGzDlhaGp2++
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 23 Jul 2024 12:23:58 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	"Daniel P . Smith" <dpsmith@apertussolutions.com>,
	Alejandro Vallejo <alejandro.vallejo@cloud.com>,
	Gene Bright <gene@cyberlight.us>
Subject: Re: [PATCH 1/2] x86/efi: Simplify efi_arch_cpu() a little

On Mon, Jul 22, 2024 at 11:18:37AM +0100, Andrew Cooper wrote:
> Make the "no extended leaves" case fatal and remove one level of indentat=
ion.
> Defer the max-leaf aquisition until it is first used.
>=20
> No functional change.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Daniel P. Smith <dpsmith@apertussolutions.com>
> CC: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>
> CC: Alejandro Vallejo <alejandro.vallejo@cloud.com>
> CC: Gene Bright <gene@cyberlight.us>
> ---
>  xen/arch/x86/efi/efi-boot.h | 31 ++++++++++++++++---------------
>  1 file changed, 16 insertions(+), 15 deletions(-)
>=20
> diff --git a/xen/arch/x86/efi/efi-boot.h b/xen/arch/x86/efi/efi-boot.h
> index f282358435f1..4e4be7174751 100644
> --- a/xen/arch/x86/efi/efi-boot.h
> +++ b/xen/arch/x86/efi/efi-boot.h
> @@ -738,29 +738,30 @@ static void __init efi_arch_handle_module(const str=
uct file *file,
> =20
>  static void __init efi_arch_cpu(void)
>  {
> -    uint32_t eax =3D cpuid_eax(0x80000000U);
> +    uint32_t eax;
>      uint32_t *caps =3D boot_cpu_data.x86_capability;
> =20
>      boot_tsc_stamp =3D rdtsc();
> =20
>      caps[FEATURESET_1c] =3D cpuid_ecx(1);
> =20
> -    if ( (eax >> 16) =3D=3D 0x8000 && eax > 0x80000000U )
> -    {
> -        caps[FEATURESET_e1d] =3D cpuid_edx(0x80000001U);
> +    eax =3D cpuid_eax(0x80000000U);
> +    if ( (eax >> 16) !=3D 0x8000 || eax < 0x80000000U )
> +        blexit(L"In 64bit mode, but no extended CPUID leaves?!?");
> =20
> -        /*
> -         * This check purposefully doesn't use cpu_has_nx because
> -         * cpu_has_nx bypasses the boot_cpu_data read if Xen was compiled
> -         * with CONFIG_REQUIRE_NX
> -         */
> -        if ( IS_ENABLED(CONFIG_REQUIRE_NX) &&
> -             !boot_cpu_has(X86_FEATURE_NX) )
> -            blexit(L"This build of Xen requires NX support");
> +    caps[FEATURESET_e1d] =3D cpuid_edx(0x80000001U);
> =20
> -        if ( cpu_has_nx )
> -            trampoline_efer |=3D EFER_NXE;
> -    }
> +    /*
> +     * This check purposefully doesn't use cpu_has_nx because
> +     * cpu_has_nx bypasses the boot_cpu_data read if Xen was compiled
> +     * with CONFIG_REQUIRE_NX
> +     */
> +    if ( IS_ENABLED(CONFIG_REQUIRE_NX) &&
> +         !boot_cpu_has(X86_FEATURE_NX) )
> +        blexit(L"This build of Xen requires NX support");
> +
> +    if ( cpu_has_nx )
> +        trampoline_efer |=3D EFER_NXE;
>  }
> =20
>  static void __init efi_arch_blexit(void)
> --=20
> 2.39.2
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--lEMPaGzDlhaGp2++
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmafhL8ACgkQ24/THMrX
1yzlfAf8Cu7uEXig3naKT5T2Elyf+v4qaJWz0DjN08jj6vPi6UC36vyy+AKw9ulU
cw+l+RCQfex48HsXl28K94hFvBdcV9NuowoFcw/hU1juO2Ykzj6s5/zQrq/4zNbW
0C0em+NYlaYfM6N66TAOmZwmqk7zzcREzIFa4qQNsZwp89LWUV9lvWQK8BAt/W/7
BZ5fHM8tTgisiYSz0aHK7mrnp6UY8oBmQ6yLZOXsVK6bBtZTtJNd1YZMZJlS4aSS
jLNm1H++0vADKjH3uVMv4OoyHNDcmsM5GN5s+iskMHH5Xq+sCEjQxNKDSlfQ2lI8
Kcn7RGVh6X1MNDy8SpQFi2OIHdR3HQ==
=lqXV
-----END PGP SIGNATURE-----

--lEMPaGzDlhaGp2++--

