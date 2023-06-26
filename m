Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B517D73EA86
	for <lists+xen-devel@lfdr.de>; Mon, 26 Jun 2023 20:52:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.555638.867541 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDrK1-0002ap-D8; Mon, 26 Jun 2023 18:52:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 555638.867541; Mon, 26 Jun 2023 18:52:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qDrK1-0002Yz-AJ; Mon, 26 Jun 2023 18:52:21 +0000
Received: by outflank-mailman (input) for mailman id 555638;
 Mon, 26 Jun 2023 18:52:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xEDn=CO=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1qDrK0-0002Yt-JZ
 for xen-devel@lists.xenproject.org; Mon, 26 Jun 2023 18:52:20 +0000
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 92ca4255-1452-11ee-b237-6b7b168915f2;
 Mon, 26 Jun 2023 20:52:18 +0200 (CEST)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 2518A3200971;
 Mon, 26 Jun 2023 14:52:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Mon, 26 Jun 2023 14:52:16 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 26 Jun 2023 14:52:12 -0400 (EDT)
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
X-Inumbo-ID: 92ca4255-1452-11ee-b237-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1687805535; x=1687891935; bh=tXZ71alGKxL1L2Jgq+exPzmNgEqTh8KcN/R
	gEzPenow=; b=QwxvAEh8S0ZzI5xsg4rAW9vX8hxms6JsPkjW0+wmE88/jDCBuqS
	egXM9YZvyQUsCmGpKZJpoLZhG3GCOkF/xhP4gZJ3yMS23ZYLl1GJgYq4qqPKsVEE
	RUX0xOyOL9Slj2qYakeioVJhOB5s1FSGihdEFoSOWokdcQqR4oj8dervcig48X1a
	HpY5jtKoAEJMUoXf/f4VpZUp34VASQ/0uuFSDWH575zHrLNejJhr/fiPrbY3IdV3
	K7dLUw4tAQnf04fLNvuNpaYRh2Y3PNqVYwBUm4+yfThXIRJzmxEbtx5/HIg1vpJB
	1nhxnbFUytI59bVxaXJjU3puunaJVesZaJQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1687805535; x=1687891935; bh=tXZ71alGKxL1L
	2Jgq+exPzmNgEqTh8KcN/RgEzPenow=; b=isrsh9ANDFueHW4C1Avpa9gTWxDPf
	9H5O79Mukjga/LFXeK1i5oKYpRgiRgzAtlMbHwyV7Nwsk9CRwUSu/5vQc2Ujs0E/
	FwxTSMb6T9jSSIWD+7WT9wV5rG/AqvaFVVC+ujCXcWj0oO+YKJI/uCbfMOrE6ugV
	zeIOrBbbr17m3KMMNSft1GsZLW7FL19TsRLjE+jS2LS7Kz8Ypr0ZfXgOWrqDDDX4
	x1WmCOikTOfcmlXupKfjs6AAeRiPQXN4bfQPTGXkPZSwIXez6++mr8vbJFEg08BP
	vlXyzkLGBlbPbxe8XOMoQXNERge4SntIN3axJYiYzvfGfOJcYWsaE41jw==
X-ME-Sender: <xms:X96ZZGWuYe711ypUcBvJ-cNMzsbW4TCrG3yfvGPUSwgW9g5NCndC8Q>
    <xme:X96ZZCkbWOU-murSxxA_9AwIVddYjTNOfZINDEs3eZn2IMCnraJwrXEgAQEAd-DKt
    g48fFpic3ZJSQ>
X-ME-Received: <xmr:X96ZZKa-Fl5JwwCSeLM322ps3xb3dycr6pEMW1H5lq5J5E0Z2dEq-c7_OD4t>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgeehfedguddviecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    udelteefvefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:X96ZZNW843gTtcCJ6Igy3kGTVVxHXWyZISKfRNJalI7DaXtrDtLzjg>
    <xmx:X96ZZAmJPhtdxJdKCcNEi_T9sU8hQ-b4x4CBsu4wqEDoq9ie185Myw>
    <xmx:X96ZZCcL8WsFdALCVFvNKPvV1DBFCBGK8jSxky4fcloyJ1eQHKBT0Q>
    <xmx:X96ZZBDNk1nE4fy1m01Fa2cy4yvV7KvAPYA8eOmCrNfKWjLQQJr20A>
Feedback-ID: i1568416f:Fastmail
Date: Mon, 26 Jun 2023 20:52:08 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com,
	wei.chen@arm.com, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/2] tools: Fix ifdef for aarch64 that should include
 also arm
Message-ID: <ZJneWcpdfxIc5KUo@mail-itl>
References: <20230608135913.560413-1-luca.fancellu@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9mYewJK/SwC36Ru1"
Content-Disposition: inline
In-Reply-To: <20230608135913.560413-1-luca.fancellu@arm.com>


--9mYewJK/SwC36Ru1
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Jun 2023 20:52:08 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: xen-devel@lists.xenproject.org, bertrand.marquis@arm.com,
	wei.chen@arm.com, Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 1/2] tools: Fix ifdef for aarch64 that should include
 also arm

On Thu, Jun 08, 2023 at 02:59:12PM +0100, Luca Fancellu wrote:
> Commit 56a7aaa16bfe introduced some SVE related code that is protected by
> '#if defined(__aarch64__)', the issue is that this doesn't take into
> consideration when the toolstack is compiled for an arm32 Dom0 running on
> an arm64 platform, it should be able to create SVE enabled guests but with
> the current code it's not.
>=20
> So fix the issue by compiling the code when the toolstack is compiled for
> both arm32 and arm64.
>=20
> Fixes: 56a7aaa16bfe ("tools: add physinfo arch_capabilities handling for =
Arm")
> Signed-off-by: Luca Fancellu <luca.fancellu@arm.com>
> Reported-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

> ---
>  tools/include/xen-tools/arm-arch-capabilities.h | 2 +-
>  tools/python/xen/lowlevel/xc/xc.c               | 2 +-
>  tools/xl/xl_info.c                              | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/tools/include/xen-tools/arm-arch-capabilities.h b/tools/incl=
ude/xen-tools/arm-arch-capabilities.h
> index 3849e897925d..4aa4c6c34a99 100644
> --- a/tools/include/xen-tools/arm-arch-capabilities.h
> +++ b/tools/include/xen-tools/arm-arch-capabilities.h
> @@ -14,7 +14,7 @@
>  static inline
>  unsigned int arch_capabilities_arm_sve(unsigned int arch_capabilities)
>  {
> -#if defined(__aarch64__)
> +#if defined(__arm__) || defined(__aarch64__)
>      unsigned int sve_vl =3D MASK_EXTR(arch_capabilities,
>                                      XEN_SYSCTL_PHYSCAP_ARM_SVE_MASK);
> =20
> diff --git a/tools/python/xen/lowlevel/xc/xc.c b/tools/python/xen/lowleve=
l/xc/xc.c
> index 491e88977fd3..e14e223ec903 100644
> --- a/tools/python/xen/lowlevel/xc/xc.c
> +++ b/tools/python/xen/lowlevel/xc/xc.c
> @@ -911,7 +911,7 @@ static PyObject *pyxc_physinfo(XcObject *self)
>                             "hw_caps",          cpu_cap,
>                             "virt_caps",        virt_caps);
> =20
> -#if defined(__aarch64__)
> +#if defined(__arm__) || defined(__aarch64__)
>      if ( objret ) {
>          unsigned int sve_vl_bits;
>          PyObject *py_arm_sve_vl;
> diff --git a/tools/xl/xl_info.c b/tools/xl/xl_info.c
> index ddc42f96b979..72e87eac46d1 100644
> --- a/tools/xl/xl_info.c
> +++ b/tools/xl/xl_info.c
> @@ -226,7 +226,7 @@ static void output_physinfo(void)
>          );
> =20
>      /* Print arm SVE vector length only on ARM platforms */
> -#if defined(__aarch64__)
> +#if defined(__arm__) || defined(__aarch64__)
>      maybe_printf("arm_sve_vector_length  : %u\n",
>           arch_capabilities_arm_sve(info.arch_capabilities)
>          );
> --=20
> 2.34.1
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--9mYewJK/SwC36Ru1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmSZ3lkACgkQ24/THMrX
1yyydQf/dNiLi0dAXMus45Pad29fbPOuTQg7bnA3ey7iygLbPsCPARcWtFsVh/N9
fANneqbx0B3JvBB/DBYs0Dnw8Ey6nCoV80sGdugm3nZxoHlZzPnGMXicUa5q8IGv
A/Tghj4VkzNvG2zJf1nkOfA2zKzui69hdkd7KthT+XOT6ztFpLaKcwzXWS/O4XXS
K68I5rmh0L9YumVBgFpHDlrmo8J2Ko/yBaUfnEVcAFQ4nLXKdD924ioBoufYDf+P
hFPqcceQpyjGwKjZcZkp3h2KsiB0sQkvwvWI7YIT4sRBYP90zdQ6QLMmz8XToN8d
pIqS/sdpNz7nskJ32s3qifLAr0HiEg==
=nMW+
-----END PGP SIGNATURE-----

--9mYewJK/SwC36Ru1--

