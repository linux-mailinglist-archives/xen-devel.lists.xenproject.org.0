Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDDE6BD7C9
	for <lists+xen-devel@lfdr.de>; Thu, 16 Mar 2023 19:07:17 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.510787.789155 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcs0J-0005At-Lf; Thu, 16 Mar 2023 18:07:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 510787.789155; Thu, 16 Mar 2023 18:07:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pcs0J-00058P-II; Thu, 16 Mar 2023 18:07:07 +0000
Received: by outflank-mailman (input) for mailman id 510787;
 Thu, 16 Mar 2023 18:07:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ItE1=7I=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1pcs0H-00056c-Ly
 for xen-devel@lists.xenproject.org; Thu, 16 Mar 2023 18:07:05 +0000
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5a405009-c425-11ed-b464-930f4c7d94ae;
 Thu, 16 Mar 2023 19:07:03 +0100 (CET)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 0B2283200094;
 Thu, 16 Mar 2023 14:07:00 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Thu, 16 Mar 2023 14:07:01 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Mar 2023 14:06:59 -0400 (EDT)
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
X-Inumbo-ID: 5a405009-c425-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1678990020; x=1679076420; bh=Flh9CyEO3fIBvHzcnNvViG5ZR9X+htA/Ssi
	tMWKyjTo=; b=bjF96hRjxspC6+Fhq5bkxQoQepL6zf3idoFm4Dk/m1d79bVdVdP
	nQzYocpsn5Bz+6F2yN+J07wZAno79gEdbJqRYiI9p6jggaf8HY86FdMQjYUcg6Xg
	Qg91iUzIA4U1bl5e2569JorfUSdH16FdWOG01Jjyp6sICHz/cs0yNC7M6NDw0J0u
	VJ54HWU2IMGJCOg0CTqY42QLlVtD29jY8dZnHOWox8GCpMAbR99ekGnhWkE9q/jF
	Ws/b+HYRaXC0+1mp0LMoeZBpqeLPWJi0Juv2jY3wc6JcnJ0MP+8bdGx254gj6THE
	Cx3M6PYAJmx7OqrZ65Y0DSX+q1q/akEV0OA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1678990020; x=1679076420; bh=Flh9CyEO3fIBv
	HzcnNvViG5ZR9X+htA/SsitMWKyjTo=; b=jGeRui3w5ccOk8zVlu3YOgaivvwm7
	czJJq3nkFR1sMchztH79cNpfiX6bjMsNCSy1cR+iA7TDQ+qf5IhEzDEDpROHiWcU
	QUOCpxfkZYEbuYCzTet1iAy0lHpkcoxS4dYRrH3W1rRmJT17pvn5joLnvCOUKcg8
	D2mn37B49bBzqVFfrUYtK797t4wWCs+r/fxCweli0S2KYhegot1Huk9Epq8eWcCS
	XXchkPxS3Zz5RsT01h8HxUWwJ9qpI9vA/ufShJ/1VbNnhC5XbSdjs+DlzaNt6AAI
	QHRdFUg1fNFs4nCdHM4J9xJ8oDQkHiJuWYLx4nOmB+rsm8ySlmSPbHfyA==
X-ME-Sender: <xms:xFoTZFKM-dYcRfCH7MqahhUup0cBbwTySEmlDRwpxqudPMS595TG-Q>
    <xme:xFoTZBKH4HtQVm7Hm2aji1rKR_zJew1M3ynrwM-JKZy42HQbXGkbTtEOrl7dZSmn1
    ccjcf6lTdNixA>
X-ME-Received: <xmr:xFoTZNsG7I_MMCUBx4theu3ra_aoZ7oFRtGQQCeQNer6uU2M-Pd52tVlfrwqQEGJO39ZMwXGt_Z_fjNREk3bJRSupPn-MXHRME8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeftddguddutdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    udelteefvefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:xFoTZGYZb9blsYZSQikDhM43-6bdgNype0I4GyJ9iTDoZlFi36C7hg>
    <xmx:xFoTZMY4aziy1k0LHynozW7Ldu6Ku56x9QOhP0HNFVSGWQqAzE4djw>
    <xmx:xFoTZKCsF-azvnDYvpA5JBpvliZq2jElaBdRvTb3RJ8gXtzmBl5_uQ>
    <xmx:xFoTZLlYfsm6i12LNBx-rMJomn6yHY7kP4TW162P0V2L50iJeStGzg>
Feedback-ID: i1568416f:Fastmail
Date: Thu, 16 Mar 2023 19:06:56 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Bernhard Kaindl <bernhard.kaindl@citrix.com>
Subject: Re: [PATCH 6/7] tools/python: Improve unit test handling
Message-ID: <ZBNawV2qvDer22h4@mail-itl>
References: <20230314141520.3652451-1-andrew.cooper3@citrix.com>
 <20230314141520.3652451-7-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="UTV0HImSynLG2qpS"
Content-Disposition: inline
In-Reply-To: <20230314141520.3652451-7-andrew.cooper3@citrix.com>


--UTV0HImSynLG2qpS
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 16 Mar 2023 19:06:56 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Bernhard Kaindl <bernhard.kaindl@citrix.com>
Subject: Re: [PATCH 6/7] tools/python: Improve unit test handling

On Tue, Mar 14, 2023 at 02:15:19PM +0000, Andrew Cooper wrote:
>  * Add X86_{CPUID,MSR}_POLICY_FORMAT checks which were missed previously.
>  * Drop test_suite().  It hasn't been necessary since the Py2.3 era.
>  * Drop the __main__ logic.  This can't be used without manually adjustin=
g the
>    include path, and `make test` knows how to do the right thing.
>  * For `make test`, use `-v` to see which tests have been discovered and =
run.
>=20
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

> ---
> CC: Wei Liu <wl@xen.org>
> CC: Anthony PERARD <anthony.perard@citrix.com>
> CC: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>
> CC: Bernhard Kaindl <bernhard.kaindl@citrix.com>
> ---
>  tools/python/Makefile               |  2 +-
>  tools/python/xen/migration/tests.py | 14 ++------------
>  2 files changed, 3 insertions(+), 13 deletions(-)
>=20
> diff --git a/tools/python/Makefile b/tools/python/Makefile
> index 511e7deae409..697299bf2802 100644
> --- a/tools/python/Makefile
> +++ b/tools/python/Makefile
> @@ -36,7 +36,7 @@ uninstall:
> =20
>  .PHONY: test
>  test:
> -	LD_LIBRARY_PATH=3D$$(readlink -f ../libs/ctrl):$$(readlink -f ../xensto=
re) $(PYTHON) -m unittest discover
> +	LD_LIBRARY_PATH=3D$$(readlink -f ../libs/ctrl):$$(readlink -f ../xensto=
re) $(PYTHON) -m unittest discover -v
> =20
>  .PHONY: clean
>  clean:
> diff --git a/tools/python/xen/migration/tests.py b/tools/python/xen/migra=
tion/tests.py
> index ff2768946bb5..f22e2c2b7cf0 100644
> --- a/tools/python/xen/migration/tests.py
> +++ b/tools/python/xen/migration/tests.py
> @@ -26,6 +26,8 @@ class TestLibxc(unittest.TestCase):
>                           (libxc.X86_TSC_INFO_FORMAT, 24),
>                           (libxc.HVM_PARAMS_ENTRY_FORMAT, 16),
>                           (libxc.HVM_PARAMS_FORMAT, 8),
> +                         (libxc.X86_CPUID_POLICY_FORMAT, 24),
> +                         (libxc.X86_MSR_POLICY_FORMAT, 16),
>                           ):
>              self.assertEqual(calcsize(fmt), sz)
> =20
> @@ -40,15 +42,3 @@ class TestLibxl(unittest.TestCase):
>                           (libxl.EMULATOR_HEADER_FORMAT, 8),
>                           ):
>              self.assertEqual(calcsize(fmt), sz)
> -
> -
> -def test_suite():
> -    suite =3D unittest.TestSuite()
> -
> -    suite.addTest(unittest.makeSuite(TestLibxc))
> -    suite.addTest(unittest.makeSuite(TestLibxl))
> -
> -    return suite
> -
> -if __name__ =3D=3D "__main__":
> -    unittest.main()
> --=20
> 2.30.2
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--UTV0HImSynLG2qpS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmQTWsAACgkQ24/THMrX
1yxlcAf/bDZ2qkC63gETKEioQPtEeYqso6cJdL8N03xwbfMgzjg6GRpjwQOd4FBX
ppneZon9XJlq214QczYr0iwgKsg4T23ms4kVVjnQ4NVKlRXipxNQQ+9hl3v0qQHU
QWi+PNK7OnJx7IhB7HqCZ7X58oSkWHQifMO2Ew6I7AW2iLNSViMe9OHvzAipwQGm
zxvXKUOLiYo/FhaNEhiojkiknMc3Slu9yg9RsEh7irjYWxcNQXuO3InG1apVPPRy
lHxT6nIm+67/axKWoBBwu+KFWilfL5umiD3jZwJB2xFhGxVeBvb3xWbCddldQchs
qlO0Hx32v3GaNkVYtnvitaO1VC0W9w==
=wLAh
-----END PGP SIGNATURE-----

--UTV0HImSynLG2qpS--

