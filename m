Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Glk8J/h5TmooNgIAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 18:25:28 +0200
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A798E728ABA
	for <lists+xen-devel@lfdr.de>; Wed, 08 Jul 2026 18:25:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=invisiblethingslab.com header.s=fm1 header.b=Mdo8fuML;
	dkim=pass header.d=messagingengine.com header.s=fm2 header.b=q2We3xUL;
	dmarc=pass (policy=none) header.from=invisiblethingslab.com;
	spf=pass (mail.lfdr.de: domain of xen-devel-bounces@lists.xenproject.org designates 192.237.175.120 as permitted sender) smtp.mailfrom=xen-devel-bounces@lists.xenproject.org
Received: from list by lists.xenproject.org with outflank-mailman.1357204.1611700 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whV4O-0007AZ-17; Wed, 08 Jul 2026 16:24:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1357204.1611700; Wed, 08 Jul 2026 16:24:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1whV4N-00078s-U5; Wed, 08 Jul 2026 16:24:19 +0000
Received: by outflank-mailman (input) for mailman id 1357204;
 Wed, 08 Jul 2026 16:24:18 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <marmarek@invisiblethingslab.com>) id 1whV4M-00078m-Cu
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 16:24:18 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1whV4L-000cra-Hu
 for xen-devel@lists.xenproject.org; Wed, 08 Jul 2026 18:24:17 +0200
Received: from [10.42.69.3] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a4e79a5-e002-0a2a0a5209dd-0a2a45039ef6-4
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 18:24:17 +0200
Received: from [103.168.172.148] (helo=fout-a5-smtp.messagingengine.com)
 by tlsNG-33051d.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <marmarek@invisiblethingslab.com>)
 id 6a4e79af-ec1a-0a2a45030019-67a8ac94e659-3
 for <xen-devel@lists.xenproject.org>; Wed, 08 Jul 2026 18:24:16 +0200
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
 by mailfout.phl.internal (Postfix) with ESMTP id A894BEC008B;
 Wed,  8 Jul 2026 12:24:15 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
 by phl-compute-09.internal (MEProxy); Wed, 08 Jul 2026 12:24:15 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 8 Jul 2026 12:24:14 -0400 (EDT)
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
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1783527855;
	 x=1783614255; bh=Qc0d4sWwqqkYotZzMnl690e/5aTEieZ0dM3nOJFia9E=; b=
	Mdo8fuMLlGeWfucTIBGQJi0BDAfW/X69GnM67SGgct8zEUWz4Wqm3FsC8ZrV6bw9
	zwhm2A/FgdLDSrS1uQlhhE+BPlzNW4LlBghpufJ5uSdtWDOhIQ+TghZ75O14bYF2
	DmrZcA4ykN6/46acQgik1Rw5gIfMoNAr0KSdwlOy2wjuYivsVLDmVFbQlcsEH/X3
	y+hfiLZNYijA85XKsqm+abftdhKERB6O2hEG4WtZTuMndUmpMvOkoivBRt+90wI5
	ndTG76pqTFI5l79iv4xFgZY6250q22or9l0cgMl1gf/Y5ktPbRmQD2pOWhMdRGp1
	ySdvI9bzNOXU4pS7l9CHgQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1783527855; x=1783614255; bh=Qc0d4sWwqqkYotZzMnl690e/5aTEieZ0dM3
	nOJFia9E=; b=q2We3xULxD3dZQ4DRrsQuEFUc5Dejtxa5/vT/JW+5l+DvbhcZNz
	C/28K9KbJOD7sV1NQzGeA6rm+RJimj5CgmNRe1D4ufBJtEP/Wyk2fvYItNDSIFHE
	bALNVqVIjozXIrzOnLd9coVOmb3ary9J6YU7IUYWrLWvhoFa5+kakIUySgaxqlp7
	NKOw+QifsbJHgBueeh+Wzi5H6w2PEe8jDzsHYRhgey/D3um8fO2wsgXQ6RFoqnii
	zWacXWDU87OfvyKhDthhph6JqrcwOLh05dST/39z8zZ2teYGR1PXrNDwiQ8PrWLf
	wxag0yM3ck09C0NiLVd8A1uSF2gmHIefNTg==
X-ME-Sender: <xms:r3lOauhiIu1IThHPcmKIcqlbPH5sYWbiAwvYRayTL4VcO4d_wSzHww>
    <xme:r3lOaivO0THZ0y8H2OvgRECJavOItpsfABfUXClXEbS4vbtrdfw9T3TVQtY59F3Ya
    fkDSTsgtnLeqPnmEZal5xXWVPR1yGTf36mZOyiL2ya1MYMTzw>
X-ME-Received: <xmr:r3lOav7E9lctyQtYstIgVf58JwnvTDBmQ9j4YZOmDaQRwQgctAg5i7svobguKmYdmyCMVBOZ5Hto1f2z3QepmwgmuLZthPovWjU>
X-ME-Proxy-Cause: dmFkZTGX/PPuNqUKyfehzhdebfKiWdOlOpyAmB7Gn0JAyFL/NDU1zTEaO+BRnVTtMZ+Bov
    kMZvNn1rd0DNcWgs88B8/A0TUS9cLUB6GkfA0mMhtrYGhbVOfaW5VpkYVua2LR5aD8iJK3
    W1jy0SvO8NyOohowBjFQnXjOyJHGB5EZdaq2/93sClFrIrTD7MHzeUXPNzMNncUhs55/si
    m8FpTnhc7d/dWYnJ8DeGVm1tA7d89DPIKHzb4XM54ncelOzgeOn+6S99W2rsK5wOPLI2RB
    mV9C3GwBJv5u0P+L7NT5RpgLfWQdy9yKkAZyf7NTtlAd1e1Dgmbj3u661oW8O1t5XTUvEn
    EyNKbpbIlhmXU/yaW9352W76EY6vDBhweL+aPSBKIHaqeNriapfqpfqkAgnC5RR4aV7mO0
    S2fpqkfNysMyCKgUI/F7IDX1HgQRvZSxxOliCQcQwl4CRs9dS/na2fG9VzDz8A8TscmUdz
    xRbYouennlZzbb5L/Fn0pnDVG7XEk9odKCRu6nk4XSk0RyYONe+n/03H5G0quqhtDTqPJT
    Ap04dB5gO/2sEy9SXGr6zeaQ024inQYN7OehiOpL6GMk6aYKuKLH7qw0n7/5OY8SeCuwh/
    UKq6UYhpRLIb9uuJWbDQoO1eDJfdvxSNz5L4cA/bFEPuKmueA8mUbsnzXXSQ
X-ME-Proxy: <xmx:r3lOauODI-sMx1Pv6IhJNIDYlGvoQRaz9O_d6jegEk_kxc_PEqObDw>
    <xmx:r3lOatvoVtwVD3GdOp2H_bYHmUrADbdF2g5XJNYaJmyv3joeHUI8sA>
    <xmx:r3lOahYGSgnhg6wG4z1K4j3RneGzrXeZm8hiXpOkxxAUmu6UwY-rpg>
    <xmx:r3lOavzRTDRllOQB_eH8G5pO-aPGxx_8DLuc7yQPbOjUiMi3ihaIzA>
    <xmx:r3lOanz4LJm5whRfuTkLSAwbvxwZ8ViZC4tTVPmA_yfIcRBveG31mkgm>
Feedback-ID: i1568416f:Fastmail
Date: Wed, 8 Jul 2026 18:24:10 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH TEST-ARTEFACTS] Add PantherLake microcode
Message-ID: <ak55rFeP3DPEg6vm@mail-itl>
References: <20260708145623.1441067-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tS1ZpbeSmUBY6q4r"
Content-Disposition: inline
In-Reply-To: <20260708145623.1441067-1-andrew.cooper3@citrix.com>
X-purgate-ID: tlsNG-33051d/1783527857-B652F5D1-386BB2B7/0/0
X-purgate-type: clean
X-purgate-size: 2592
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.78 / 15.00];
	SIGNED_PGP(-2.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[invisiblethingslab.com,none];
	R_DKIM_ALLOW(-0.20)[invisiblethingslab.com:s=fm1,messagingengine.com:s=fm2];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	MAILLIST(-0.18)[generic];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[mailman];
	FORGED_RECIPIENTS(0.00)[m:andrew.cooper3@citrix.com,m:xen-devel@lists.xenproject.org,m:anthony.perard@vates.tech,m:sstabellini@kernel.org,m:michal.orzel@amd.com,m:cardoe@cardoe.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[xen-devel@lists.xenproject.org];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[marmarek@invisiblethingslab.com,xen-devel-bounces@lists.xenproject.org];
	DKIM_TRACE(0.00)[invisiblethingslab.com:+,messagingengine.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	RCVD_COUNT_SEVEN(0.00)[11]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A798E728ABA


--tS1ZpbeSmUBY6q4r
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 8 Jul 2026 18:24:10 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Michal Orzel <michal.orzel@amd.com>,
	Doug Goldstein <cardoe@cardoe.com>
Subject: Re: [PATCH TEST-ARTEFACTS] Add PantherLake microcode

On Wed, Jul 08, 2026 at 03:56:23PM +0100, Andrew Cooper wrote:
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.c=
om>

And it seems to already apply to the new runner:
https://gitlab.com/xen-project/people/marmarek/xen/-/pipelines/2662156525

    (XEN) [0000001882e96f95] microcode: CPU0 updated from revision 0x115 to=
 0x11b, date =3D 2026-03-24

> ---
> CC: Anthony PERARD <anthony.perard@vates.tech>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Michal Orzel <michal.orzel@amd.com>
> CC: Doug Goldstein <cardoe@cardoe.com>
> CC: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>
> ---
>  scripts/x86-microcode.sh | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/scripts/x86-microcode.sh b/scripts/x86-microcode.sh
> index cb55a3bd2d52..7442e0ae9671 100755
> --- a/scripts/x86-microcode.sh
> +++ b/scripts/x86-microcode.sh
> @@ -21,6 +21,7 @@ tar xf intel-latest.tar --strip-components=3D1
>      cd intel-ucode
>      cat 06-97-02 # adl-*
>      cat 06-8e-09 # kbl-*
> +    cat 06-cc-03 # ptl-*
>  ) > "${UCODEDIR}/GenuineIntel.bin"
> =20
>  #
>=20
> base-commit: fe26bfd25cf09cd5ad11ecdf69699d3dde2c865d
> --=20
> 2.39.5
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--tS1ZpbeSmUBY6q4r
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmpOeawACgkQ24/THMrX
1ywQrAf9GkklBAN8hwIP/mn8GSi079iaxTpVKA6DpkBgExZ7Sii1WfCwBJyAxJeb
K9/iO736Eku+U1YsOch6VSl5aY+N5mPxP8Wdoq0VIQeORzieIVGqWeAfWOyfsYpO
qd2WXiRNdnqLzncETXwIKpfXhzZEtgHLsZLgyDDbjD+rw1IsyIAIQHSsm4xyQuAl
QlyEOJ1l/B8VCqTX9HpFjUUcRi2/K1CJlQFAf9yinEbl8+AzjsfgAH3ZuLmv8Tue
6w1Q2Al/5Q3pL18hN5qMqDZ6T2w4CX9ROhXhzyRohIJHztQKVPnM62egJiYi05Y8
bDvVbpy6K61X7bW3glfmJvPYjlE4+Q==
=Fxos
-----END PGP SIGNATURE-----

--tS1ZpbeSmUBY6q4r--

