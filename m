Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41D02803882
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 16:18:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647110.1009835 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAAi6-0001pJ-He; Mon, 04 Dec 2023 15:18:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647110.1009835; Mon, 04 Dec 2023 15:18:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAAi6-0001mv-ES; Mon, 04 Dec 2023 15:18:14 +0000
Received: by outflank-mailman (input) for mailman id 647110;
 Mon, 04 Dec 2023 15:18:13 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PgPa=HP=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1rAAi5-0001jk-1p
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 15:18:13 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 552210c3-92b8-11ee-98e5-6d05b1d4d9a1;
 Mon, 04 Dec 2023 16:18:10 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-373-Q7vPoqGuPbqZZ9WrmOSLTg-1; Mon, 04 Dec 2023 10:18:04 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AD91B81B56A;
 Mon,  4 Dec 2023 15:18:03 +0000 (UTC)
Received: from localhost (unknown [10.39.192.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 89EDE40C6EBB;
 Mon,  4 Dec 2023 15:18:02 +0000 (UTC)
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
X-Inumbo-ID: 552210c3-92b8-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701703089;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kBZ1SZVWRnkDiTr92kHl7AK+tPgCY2ZrLpcj1yanM/w=;
	b=bsl+/Horf9FBZiWUIjzZptUawgJe9roBE6cA99oL9d7md34MVkcIZmSa8Tk7z8hEThgi84
	aGi2+gEQC8GK2gFEjFavZrMtNqhuKt/q34I2euLNVg/Xp4UvS4qg1UvYL6MfaM/1FKAIvk
	tEVIC9d+Qisv6dsaPS6dIYWZh6Ssr7M=
X-MC-Unique: Q7vPoqGuPbqZZ9WrmOSLTg-1
Date: Mon, 4 Dec 2023 10:17:55 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
	Paul Durrant <paul@xen.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Alberto Garcia <berto@igalia.com>,
	Emanuele Giuseppe Esposito <eesposit@redhat.com>,
	John Snow <jsnow@redhat.com>, Eric Blake <eblake@redhat.com>,
	Wen Congyang <wencongyang2@huawei.com>, qemu-block@nongnu.org,
	xen-devel@lists.xenproject.org, Coiby Xu <Coiby.Xu@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Xie Changlong <xiechanglong.d@gmail.com>,
	Ari Sundholm <ari@tuxera.com>, Li Zhijian <lizhijian@fujitsu.com>,
	Cleber Rosa <crosa@redhat.com>, Juan Quintela <quintela@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	Zhang Chen <chen.zhang@intel.com>, Peter Xu <peterx@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Leonardo Bras <leobras@redhat.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Fam Zheng <fam@euphon.net>, Fabiano Rosas <farosas@suse.de>
Subject: Re: [PATCH 05/12] block: remove AioContext locking
Message-ID: <20231204151755.GC1492005@fedora>
References: <20231129195553.942921-1-stefanha@redhat.com>
 <20231129195553.942921-6-stefanha@redhat.com>
 <ZW3jVZZ_Kuf99g8O@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+4Jsw1CxaxIgWzJ/"
Content-Disposition: inline
In-Reply-To: <ZW3jVZZ_Kuf99g8O@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2


--+4Jsw1CxaxIgWzJ/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 04, 2023 at 03:33:57PM +0100, Kevin Wolf wrote:
> Am 29.11.2023 um 20:55 hat Stefan Hajnoczi geschrieben:
> > This is the big patch that removes
> > aio_context_acquire()/aio_context_release() from the block layer and
> > affected block layer users.
> >=20
> > There isn't a clean way to split this patch and the reviewers are likely
> > the same group of people, so I decided to do it in one patch.
> >=20
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
>=20
> > @@ -7585,29 +7433,12 @@ void coroutine_fn bdrv_co_leave(BlockDriverStat=
e *bs, AioContext *old_ctx)
> > =20
> >  void coroutine_fn bdrv_co_lock(BlockDriverState *bs)
> >  {
> > -    AioContext *ctx =3D bdrv_get_aio_context(bs);
> > -
> > -    /* In the main thread, bs->aio_context won't change concurrently */
> > -    assert(qemu_get_current_aio_context() =3D=3D qemu_get_aio_context(=
));
> > -
> > -    /*
> > -     * We're in coroutine context, so we already hold the lock of the =
main
> > -     * loop AioContext. Don't lock it twice to avoid deadlocks.
> > -     */
> > -    assert(qemu_in_coroutine());
> > -    if (ctx !=3D qemu_get_aio_context()) {
> > -        aio_context_acquire(ctx);
> > -    }
> > +    /* TODO removed in next patch */
> >  }
>=20
> It's still there at the end of the series.

Will fix in v2. Thanks!

--+4Jsw1CxaxIgWzJ/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmVt7aMACgkQnKSrs4Gr
c8jOnAgAroCsRM62VuXidh1DiXsdM/0hkCfNnvZSyW8BYwcZlOo16u9i6w1n4+fW
HrkQPylQsCI5gHfj72kqrfphVoxWDdjCeaTN+ILBnSbbvKzvym2bNtsYfuuZpMGO
v9wItcMUPP0UkEwiPgSTj28FlfAj9SqzjDEiaIqgJjzL6jVEqQ/xuI9tvESarulP
SKVf02Lwrz2y4dH25crdvwyP1w2x0ZK9TtaE59g5hElfOC/bhBiFiPtVEeAFOwDw
5HXPwJA9U0NOzjVxvYg1Bg2rxhlTxRu3A22b7T+zYwKHIG+FYan3ejiDvOz1YwF3
baMaVDb0ovZiApd+ipPwctALD+HI9g==
=TuU3
-----END PGP SIGNATURE-----

--+4Jsw1CxaxIgWzJ/--


