Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B60778F34A
	for <lists+xen-devel@lfdr.de>; Thu, 31 Aug 2023 21:26:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.594061.927247 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbnJN-0001eN-3v; Thu, 31 Aug 2023 19:26:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 594061.927247; Thu, 31 Aug 2023 19:26:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbnJN-0001bv-0r; Thu, 31 Aug 2023 19:26:37 +0000
Received: by outflank-mailman (input) for mailman id 594061;
 Thu, 31 Aug 2023 19:26:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sl68=EQ=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1qbnJM-0001bp-8j
 for xen-devel@lists.xenproject.org; Thu, 31 Aug 2023 19:26:36 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4b7d888b-4834-11ee-8783-cb3800f73035;
 Thu, 31 Aug 2023 21:26:34 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-477-gwiFUeAGNQ2HHFaa0uilvQ-1; Thu, 31 Aug 2023 15:26:29 -0400
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F27088030AC;
 Thu, 31 Aug 2023 19:26:27 +0000 (UTC)
Received: from localhost (unknown [10.39.192.52])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5D944492C13;
 Thu, 31 Aug 2023 19:26:27 +0000 (UTC)
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
X-Inumbo-ID: 4b7d888b-4834-11ee-8783-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693509993;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oZBIgsu/9Q8JHPWS5y+/fJ21ZwefezbfyrSqCYIGrpA=;
	b=WBKU3OfSc9Cj74ZBTNJKPln2o0VrLl5panr9wB2wD5xVbQA+twrhGx5P+tkzm4mHth1Cgj
	dH8AlLauO80EKnN1pYlC2uATgMC9L55otpCgiTW/d80LEqhZst/COHL9hrZatp5Y84Vp7w
	esMgJS5bgeTu6XgLKedML40w5R6GFf4=
X-MC-Unique: gwiFUeAGNQ2HHFaa0uilvQ-1
Date: Thu, 31 Aug 2023 15:26:26 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, kwolf@redhat.com, hreitz@redhat.com,
	eblake@redhat.com, vsementsov@yandex-team.ru, jsnow@redhat.com,
	idryomov@gmail.com, pl@kamp.de, sw@weilnetz.de,
	sstabellini@kernel.org, anthony.perard@citrix.com, paul@xen.org,
	pbonzini@redhat.com, marcandre.lureau@redhat.com,
	berrange@redhat.com, thuth@redhat.com, philmd@linaro.org,
	fam@euphon.net, quintela@redhat.com, peterx@redhat.com,
	leobras@redhat.com, kraxel@redhat.com, qemu-block@nongnu.org,
	xen-devel@lists.xenproject.org, alex.bennee@linaro.org,
	peter.maydell@linaro.org
Subject: Re: [PATCH 5/7] block/vdi: Clean up local variable shadowing
Message-ID: <20230831192626.GC532982@fedora>
References: <20230831132546.3525721-1-armbru@redhat.com>
 <20230831132546.3525721-6-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZAG2EDmh/L6KrbjK"
Content-Disposition: inline
In-Reply-To: <20230831132546.3525721-6-armbru@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9


--ZAG2EDmh/L6KrbjK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 31, 2023 at 03:25:44PM +0200, Markus Armbruster wrote:
> Local variables shadowing other local variables or parameters make the
> code needlessly hard to understand.  Tracked down with -Wshadow=3Dlocal.
> Clean up: delete inner declarations when they are actually redundant,
> else rename variables.
>=20
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  block/vdi.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--ZAG2EDmh/L6KrbjK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmTw6WIACgkQnKSrs4Gr
c8jt1Af9FbEzEqEiYZ2++01IYNbKg2fjGgZKNRFpaSRJSazW5ch2jS/28TJe2Pwp
NT6kVOmB1FB3HuvXTzHST9ifgRKh5mamqnqtVre6zBCbP//mbtG2wDngEhIcaqqM
qexeP3U4cHfODlv386zwdux1d/PJYM91nrUkjKoHb4dJVZfMpaiGjDkiDlpawpuQ
bzO/VuHDG5qIyj4AJRzdhoYMoLE5tRadCI1jHhuGFv/rc8u38vFlpoF89W2FfJ0w
fUQJ78b915zTp0ySkqZdqU2+0ZjHWUiJi0A822E6VKpXRWm/VSfhZ2vmk/ykbH2U
ImrSPRecSMfh7F4RSi0SBsZauw/f7g==
=bDUq
-----END PGP SIGNATURE-----

--ZAG2EDmh/L6KrbjK--


