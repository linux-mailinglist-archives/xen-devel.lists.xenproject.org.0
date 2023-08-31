Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7607178F342
	for <lists+xen-devel@lfdr.de>; Thu, 31 Aug 2023 21:25:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.594055.927237 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbnHt-000137-LX; Thu, 31 Aug 2023 19:25:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 594055.927237; Thu, 31 Aug 2023 19:25:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbnHt-00010k-HH; Thu, 31 Aug 2023 19:25:05 +0000
Received: by outflank-mailman (input) for mailman id 594055;
 Thu, 31 Aug 2023 19:25:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sl68=EQ=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1qbnHr-00010d-Ig
 for xen-devel@lists.xenproject.org; Thu, 31 Aug 2023 19:25:03 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 12cb788c-4834-11ee-9b0d-b553b5be7939;
 Thu, 31 Aug 2023 21:24:59 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-152-3z7pV_keMIyc36zB9mNkRA-1; Thu, 31 Aug 2023 15:24:54 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1BA39299E742;
 Thu, 31 Aug 2023 19:24:53 +0000 (UTC)
Received: from localhost (unknown [10.39.192.52])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4C68240C2063;
 Thu, 31 Aug 2023 19:24:51 +0000 (UTC)
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
X-Inumbo-ID: 12cb788c-4834-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1693509898;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aCX7Roe7lgAeuJ04Wd+aBj3yNRL+/6WAn3/NsVYv67o=;
	b=VuzYV8i14GMupkqLR34ogz3XisY706YB454+DrGYbTRHdmYEMoTPvuYOhykvbYv+s6H1OJ
	Qw7KNsTbaIGoktKc0moP1UurQQQ6Uf93IZWHfhA3cg33867QNAU+XczfwAOpknxYxI4h3o
	owDV4Yr/8BCrWKMB/kbTlzEk7PdRzQo=
X-MC-Unique: 3z7pV_keMIyc36zB9mNkRA-1
Date: Thu, 31 Aug 2023 15:24:50 -0400
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
Subject: Re: [PATCH 6/7] block: Clean up local variable shadowing
Message-ID: <20230831192450.GB532982@fedora>
References: <20230831132546.3525721-1-armbru@redhat.com>
 <20230831132546.3525721-7-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="V8X+bYL3C2bPPQtN"
Content-Disposition: inline
In-Reply-To: <20230831132546.3525721-7-armbru@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1


--V8X+bYL3C2bPPQtN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 31, 2023 at 03:25:45PM +0200, Markus Armbruster wrote:
> Local variables shadowing other local variables or parameters make the
> code needlessly hard to understand.  Tracked down with -Wshadow=3Dlocal.
> Clean up: delete inner declarations when they are actually redundant,
> else rename variables.
>=20
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  block.c              |  7 ++++---
>  block/rbd.c          |  2 +-
>  block/stream.c       |  1 -
>  block/vvfat.c        | 34 +++++++++++++++++-----------------
>  hw/block/xen-block.c |  6 +++---
>  5 files changed, 25 insertions(+), 25 deletions(-)

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

--V8X+bYL3C2bPPQtN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmTw6QIACgkQnKSrs4Gr
c8jv+wgAp6Bn3IdAxQ34Kzvg5ACHF4Zw7LSLIBoSZ7iindUoJORMnR9rAszp98Xd
YLGEToT0e5nBhrzISbSOj2i4dSGQvdqDx0KhhKApn4VwPMzk2EAN43j2Ek0eMIoe
/zABxa3splVjeZ1OygB7xLXB0DozqvTT4g9nxmTi+CLw/bUsqY0vys9LPlXHsvmS
YzQNXX+0/dyK29KRdYouoWJO7NOhUgW/uI5uND3B3272/tQH8PA4qin9n3jIKTiN
RS4bCzd2dAf/Jmj8f4t8JvnS3lod3mmOv8ofbFjdZrtHxiMhtLn5lJGTNEI5wtIr
hUDMx/dmvONyEsCY6ZHUqfDH3EDE5w==
=NToX
-----END PGP SIGNATURE-----

--V8X+bYL3C2bPPQtN--


