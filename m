Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3E652E07C
	for <lists+xen-devel@lfdr.de>; Fri, 20 May 2022 01:23:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.333326.557140 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrpUC-0002EH-7a; Thu, 19 May 2022 23:23:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 333326.557140; Thu, 19 May 2022 23:23:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nrpUC-0002B0-4q; Thu, 19 May 2022 23:23:16 +0000
Received: by outflank-mailman (input) for mailman id 333326;
 Thu, 19 May 2022 23:23:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Krf0=V3=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1nrpU9-0002Au-VO
 for xen-devel@lists.xenproject.org; Thu, 19 May 2022 23:23:14 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a4692d36-d7ca-11ec-bd2c-47488cf2e6aa;
 Fri, 20 May 2022 01:23:11 +0200 (CEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id DEC7F5C0109
 for <xen-devel@lists.xenproject.org>; Thu, 19 May 2022 19:23:07 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 19 May 2022 19:23:07 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <xen-devel@lists.xenproject.org>; Thu, 19 May 2022 19:23:07 -0400 (EDT)
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
X-Inumbo-ID: a4692d36-d7ca-11ec-bd2c-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1653002587; x=1653088987; bh=zqjTFcLaia
	d3MqNunNtu7UVCBZfKCDjBEpQDzT8tflI=; b=kFK9casaG8C+rdIaQV4g8Zrvvk
	Ktc4X2r/CMTXY00nq9h7J1591clfasO5Ue4ELIwatDGGEYDKA7UJvUcnnsyumwyy
	T5KUYhV24Dv95fyLdLcW88KghJEYTdRjlBc/h/YOPyUQjjRhMzHisFyhgzrb3Lb7
	V20xzB3nIbY4fNa3ExrNhHDtXyvhPr3OByjmik2U2hPDXfsFJ3c2DCsDkynYsIfX
	wnvEg3YJvRLDaloayv/Xn+VFQpKHolYfLfrBMvAIxphe6Pb1PWvZnHG2HCwoo8yR
	MCB6nfwDkOCETGAXMZwE4ulk4G2TDBzOZiJNwc+4mj1ns2+/1ryds10AgNDw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:message-id:mime-version
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1653002587; x=
	1653088987; bh=zqjTFcLaiad3MqNunNtu7UVCBZfKCDjBEpQDzT8tflI=; b=T
	aK+XoUp3RwF4BOiKXulvX17c3F1SuFmDBNW2RWRwAEz/ZJuOYYyqdxQe6IwjCOlf
	sftmwpdBJJJW1H/5En8HHti3C8AQQS/uT3HCOrZLCF7OO4gcKbERO3qzQRVWn0gK
	70eMktajrCWi4q5ixxdGRNKNKbxjU9Ku6B86tXF+2iERi9aF9LOH7dc4/6RWV6m+
	DC8TKwwtgCG3fINu+TmE0v43BSUchncNhkhKAx9O4odYAOWIIFzCr2XXVIOKQ0Pq
	shv1HHrshsoYNjpaOix0vkw8a6f8WGhXRQlOwbdvZJsklsO6CBxE1zZ222V9MRKU
	cXGlzkk05Qxj+Iphh1QtQ==
X-ME-Sender: <xms:W9GGYvIFOvqgOxJRLzMgFZtCIiBzoFGAAI3AI1KJa4jIXedJZzcb4g>
    <xme:W9GGYjIQGkvrgb4ZQgY2yboOfqfaGvAGBy-e5BQvBfX2Dg8TqVhEkq18qkLytgdNQ
    e0QgGDhldvIaKw>
X-ME-Received: <xmr:W9GGYnspHqaxcZYRYu7Ctu7UAEHwnulLXi0cbEW7XEu2cqgQMd46IaY7t4hy>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedriedvgddvvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkgggtugesghdtreertddtjeenucfhrhhomhepffgvmhhiucforghr
    ihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhnghhslhgrsg
    drtghomheqnecuggftrfgrthhtvghrnhepleejtdegjeffleevfeeuleehjefgvdefhfeh
    gfejgeelteegtdetjeelueeuveefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhslhgrsgdr
    tghomh
X-ME-Proxy: <xmx:W9GGYoaXYwCQ6nTeuS7aGtGWVfGmwvvs-nZeSXy3og3p0ABSN338VA>
    <xmx:W9GGYmasVcShdRgmsCxwYKKY5CEPdpOSXZfrlAmewra5su-w8lbFJQ>
    <xmx:W9GGYsCnTHT1hUqvqleqttmHwtwBzJhyltHbjd-xW3hFoxJZkvl0mg>
    <xmx:W9GGYvl8dgHVUuZJIRJciE5ABSltNCrLDxyikyo3Q_h6-mtvJUMbmw>
Feedback-ID: iac594737:Fastmail
Date: Thu, 19 May 2022 19:22:33 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Xen developer discussion <xen-devel@lists.xenproject.org>
Subject: Grant operation batching
Message-ID: <YobRWXY/xVli4UUf@itl-email>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="L0eN+3MD/NWPHsz0"
Content-Disposition: inline


--L0eN+3MD/NWPHsz0
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 May 2022 19:22:33 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Xen developer discussion <xen-devel@lists.xenproject.org>
Subject: Grant operation batching

It is well known that mapping and unmapping grants is expensive, which
is why blkback has persistent grants.  Could this cost be mitigated by
batching, and if it was, would it affect the tradeoff of memcpy() vs
grant table operations?

Alternatively, would there be any interest in an =E2=80=9Cunsafe=E2=80=9D m=
ode for
blkback that skips both the copy and the grant operations?  This is
obviously unsafe (hence the name!), but in many cases that unsafety does
not actually matter.  For instance, a Qubes dom0 can execute any shell
command it wants in any Qubes VM via qvm-run.  Much easier than trying
to exploit some UaF or race condition =F0=9F=99=82.  More generally, when t=
he
backend is the all-powerful dom0, trying to defend against a malicious
backend is (at least in the absence of SEV-SNP or TDX) pointless, so one
might as well not bother and take the free performance.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--L0eN+3MD/NWPHsz0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmKG0VgACgkQsoi1X/+c
IsHFIw//Uh5sIZUsANcp+T81YUAzTZZV5G+V1dktrmsETESPXsVrx8FpnVr3l0Us
X+0Ny717o9Xxe9xZ8ER9OtFNa6CcDreaKisCyC4jyw6wVo6N7QRNRR/EdVpIBIZl
cDMC5FzIcPTOkxkYeagixHfmIN+5dtBW/pEh1N907wLYu217DNG9hnqciP2PkzvP
sVsaI48HMAGe68bbxcXmhT2h4tPaB6lucpfUKLC4/7TIRkTxxuRrMQKcUfNqeA0f
WfEsRP+RzYq+qvHXXoMw44rTxmX0aXu3cq7dlpQsRVXpXVLZkGxbPieN+xmdJZS8
qaIxaY+tVcHgIbjCT5V4thTYYrjfNvwOywBKintrinPXvBfj5gSSGxItrh59ypWp
n5/fH6TuhOkyQrLWkULbh6ow2wOYwpq8xij7TQb3ybE3vpspR5IwyLihXN2XwN1N
7E2iTQdZ6FuIE54ch1+5q48SZT6LCxeNGoFU8I1RarT4xCu66LYS0sjeQSsMbagy
5EXE/qMm2IdLXSwCHhKajHMUZ8aZ4bWH4yAKykPpJQEKnPFSlGcllq9SUbWptPPK
4IRH4k0ZBhpCEioaQULuphOlAmZAj+CBCM2wChOfgUXnb8Xf6SUAWXQfbGmSTMyA
MKUOe/85yv3e2bS4oEWD3rfMRznt8gL6D8GS2Th2QJ8Gxh3bplw=
=HO26
-----END PGP SIGNATURE-----

--L0eN+3MD/NWPHsz0--

