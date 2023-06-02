Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A092720A14
	for <lists+xen-devel@lfdr.de>; Fri,  2 Jun 2023 21:59:30 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.543239.848045 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q5AuZ-0007LY-Ck; Fri, 02 Jun 2023 19:58:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 543239.848045; Fri, 02 Jun 2023 19:58:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q5AuZ-0007J7-9t; Fri, 02 Jun 2023 19:58:11 +0000
Received: by outflank-mailman (input) for mailman id 543239;
 Fri, 02 Jun 2023 19:58:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Y5qr=BW=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1q5AuX-0007Ii-Op
 for xen-devel@lists.xenproject.org; Fri, 02 Jun 2023 19:58:09 +0000
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c8ec5b1b-017f-11ee-b232-6b7b168915f2;
 Fri, 02 Jun 2023 21:58:06 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id 192CB32008FB;
 Fri,  2 Jun 2023 15:58:02 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Fri, 02 Jun 2023 15:58:02 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 2 Jun 2023 15:58:00 -0400 (EDT)
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
X-Inumbo-ID: c8ec5b1b-017f-11ee-b232-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	invisiblethingslab.com; h=cc:cc:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1685735881; x=1685822281; bh=W67iEbZbu2cqCQ2PuNdJ3W0wASP2gqnBbbH
	ikiCrwHo=; b=lijd6ErMGcYUIyeuCuyW6uwngiNVR6o2tebHMFyhH7whPWd1g0R
	G/jkBWvA/gcax0591e6yJXjUw5FNkr14fCc7kx1QZOvM3DVjcnI3ghZCl2L4GTJe
	zXl57Wv2ZH7/ol0k+hO5Ewi9fvTIubjKXUW3AQmNEsjRR7TkhVlhnmxXgIsk/Lyb
	JFi/zQvMkVVLfEDfVEzanEKARpfO2zTky3k3AVGuouTkXYvnblhyWyMVZmS9bZi4
	CQ/8+YGbOkXjWOsCeCxRlJwysMF9n/Lu4Yj32Wnqa0EmAxUdI6NjR19gQq1XAl9W
	mIoWnETB1rBzmuUcQD23DbVDSfM36My2Wng==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1685735881; x=1685822281; bh=W67iEbZbu2cqC
	Q2PuNdJ3W0wASP2gqnBbbHikiCrwHo=; b=QcNwtsvAWx5oieEjAviVd+yPVe4h6
	fupQCb8ovVlove3fl24+GO4K5H1qv1CpefFUDIXECN2m8lEfhWduo4ZJd30qmY44
	/WrlZaYZht1PdYuu/k2G/n8wmQ6O6qWyLgjxVOCeTPXJQCrvgl4ePtKJMNKXSWCM
	9e99yJc2SoTYz3Zltv/pj4noy8vg5R42Dah2+iuqCgH7+ALrdVbKuFFMS2qcWDkp
	ZquFZk4uHOtb4fdlQa94nZBv3zAoYuYjVXoyTb48/8E9y418Jad5uO7uISHhdR7g
	rRRBt9Z6TOV6EnIO2cI0/xGX37178hxJWT7wd0TQAL9jQfazr1li/pBzw==
X-ME-Sender: <xms:yUl6ZGgrAn6-mWpXJAuRehjwbOg9q-ZVwYmReS2pLe7rFzLVJw4CHw>
    <xme:yUl6ZHAHwhUGj7Qct-04j50RDZq_5KZPn4koJsnonoQFabEr4eU3OYtsv6rIV3Ul2
    QAP1k3L6tgw5w>
X-ME-Received: <xmr:yUl6ZOEi7IiTs3xz6tgXoKTb4K56qYrtKx6S1_vmn_gIYg0yNu7jbQlZSGIMHpCZrkU4cnY1Evu2r2uZg-fcH6aI_MlpoOFVyXU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeelfedgudegudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghr
    vghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpefg
    udelteefvefhfeehieetleeihfejhfeludevteetkeevtedtvdegueetfeejudenucevlh
    hushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgv
    khesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:yUl6ZPRrMP4fKXQWPaz95WobHZcQISvxr6D-NSHCrF31rmGVVWgTKA>
    <xmx:yUl6ZDzzzhQqAz7Di-eZdxiscBQbHReoFfnA3j52Bj6Tebg9y1sFkg>
    <xmx:yUl6ZN4U3I7rTbsmPPU74hH2M0ARFUlc1klU8wBOWtcJHLuOYcR2Cg>
    <xmx:yUl6ZMqB5RjNTmkjGN_v8W4eS8Pz27AFobQ--KZo7RYDfCqCiz1R8g>
Feedback-ID: i1568416f:Fastmail
Date: Fri, 2 Jun 2023 21:57:52 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com,
	Stefano Stabellini <stefano.stabellini@amd.com>
Subject: Re: [PATCH] automation: zen3 dom0pvh test
Message-ID: <ZHpJxXhGG0h++JUQ@mail-itl>
References: <20230531234921.2291367-1-sstabellini@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dnU5jHBX5k5d/p/h"
Content-Disposition: inline
In-Reply-To: <20230531234921.2291367-1-sstabellini@kernel.org>


--dnU5jHBX5k5d/p/h
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 2 Jun 2023 21:57:52 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, michal.orzel@amd.com,
	Stefano Stabellini <stefano.stabellini@amd.com>
Subject: Re: [PATCH] automation: zen3 dom0pvh test

On Wed, May 31, 2023 at 04:49:21PM -0700, Stefano Stabellini wrote:
> From: Stefano Stabellini <stefano.stabellini@amd.com>
>=20
> Add a PVH Dom0 test for the zen3 runner.
>=20
> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

Acked-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

> ---
>  automation/gitlab-ci/test.yaml | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/automation/gitlab-ci/test.yaml b/automation/gitlab-ci/test.y=
aml
> index fbe2c0589a..d5cb238b0a 100644
> --- a/automation/gitlab-ci/test.yaml
> +++ b/automation/gitlab-ci/test.yaml
> @@ -202,6 +202,14 @@ zen3p-smoke-x86-64-gcc-debug:
>      - *x86-64-test-needs
>      - alpine-3.12-gcc-debug
> =20
> +zen3p-smoke-x86-64-dom0pvh-gcc-debug:
> +  extends: .zen3p-x86-64
> +  script:
> +    - ./automation/scripts/qubes-x86-64.sh dom0pvh 2>&1 | tee ${LOGFILE}
> +  needs:
> +    - *x86-64-test-needs
> +    - alpine-3.12-gcc-debug
> +
>  zen3p-pci-hvm-x86-64-gcc-debug:
>    extends: .zen3p-x86-64
>    script:
> --=20
> 2.25.1
>=20

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--dnU5jHBX5k5d/p/h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmR6ScYACgkQ24/THMrX
1yxHhAgAh+1mcHHt1EIbg/OJUv4i6QmKojat/jzKwtwqePzdSC8+dtJC3Z4JGSyU
UnKPWtQ/UV+EDQOp7W/q4NwaZFtjrGfxlGw7zrbBVoXtVnaL1t8e3dBsvJh/uDNS
Wikvv6K7y2wflmwZEMK+1BxWiEsfnY01kM8VOxrT3BnWiotEsaodsS0CHnFqqUGr
0XezL7Bz1f9h/A1o6HEhKJv8e5qxVZAYW4zZd3JDl72DOhruEdmlmiUzf9uaqJnX
HtyqDGegQc9bDk1LOAjMvmlbwdJAJ2dIH6Y3q/ca88vV4lJLxJIrwrYxqr8LL7UW
yhK9Pdo1Wh1EpVZV/9MgOktz5hDMMA==
=u0EB
-----END PGP SIGNATURE-----

--dnU5jHBX5k5d/p/h--

