Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A588038CD
	for <lists+xen-devel@lfdr.de>; Mon,  4 Dec 2023 16:29:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.647133.1009885 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAAsO-0001ai-HW; Mon, 04 Dec 2023 15:28:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 647133.1009885; Mon, 04 Dec 2023 15:28:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAAsO-0001Yr-ES; Mon, 04 Dec 2023 15:28:52 +0000
Received: by outflank-mailman (input) for mailman id 647133;
 Mon, 04 Dec 2023 15:28:50 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PgPa=HP=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1rAAsM-0001XU-Ac
 for xen-devel@lists.xenproject.org; Mon, 04 Dec 2023 15:28:50 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c448153c-92b9-11ee-9b0f-b553b5be7939;
 Mon, 04 Dec 2023 16:28:26 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-352-_Yfp09vsNCuBjPIILTtLvw-1; Mon,
 04 Dec 2023 10:28:23 -0500
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 84BD21C0652D;
 Mon,  4 Dec 2023 15:28:21 +0000 (UTC)
Received: from localhost (unknown [10.39.192.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C79C3492BE0;
 Mon,  4 Dec 2023 15:28:19 +0000 (UTC)
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
X-Inumbo-ID: c448153c-92b9-11ee-9b0f-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701703705;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Mw1n2iwWlxYJr/7HBbY1pvYJV1N7+O+g4l43V+wCbdA=;
	b=P3E2VSMkpXhM/I0q3w8L0RLl149dOua8TmUCDxSqoNCy94QatNWqAa7yzGqLLi+ApDSZ9m
	4/S22d/UassbhVNX98N3fasByOC7HA2S1t7PzdLH5zEcgfYs9jPomd/kuO/7+PCxpHCPqB
	OsPm2xBKeZUsKHIUM7fCtBZdcT/LJfM=
X-MC-Unique: _Yfp09vsNCuBjPIILTtLvw-1
Date: Mon, 4 Dec 2023 10:28:17 -0500
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
	Paul Durrant <paul@xen.org>, Paolo Bonzini <pbonzini@redhat.com>,
	Alberto Garcia <berto@igalia.com>,
	Emanuele Giuseppe Esposito <eesposit@redhat.com>,
	John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
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
Message-ID: <20231204152817.GD1492005@fedora>
References: <20231129195553.942921-1-stefanha@redhat.com>
 <20231129195553.942921-6-stefanha@redhat.com>
 <haqk3uaxn25it4myxsockwyqxarroyqpzpticpxfdzld4qwewh@edcz4bipmqlw>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="HAuHzOT83qxPp7gF"
Content-Disposition: inline
In-Reply-To: <haqk3uaxn25it4myxsockwyqxarroyqpzpticpxfdzld4qwewh@edcz4bipmqlw>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9


--HAuHzOT83qxPp7gF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 30, 2023 at 03:31:37PM -0600, Eric Blake wrote:
> On Wed, Nov 29, 2023 at 02:55:46PM -0500, Stefan Hajnoczi wrote:
> > This is the big patch that removes
> > aio_context_acquire()/aio_context_release() from the block layer and
> > affected block layer users.
> >=20
> > There isn't a clean way to split this patch and the reviewers are likely
> > the same group of people, so I decided to do it in one patch.
> >=20
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
>=20
> > +++ b/block.c
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
>=20
> Is this assertion worth keeping in the short term?...

Probably not because coroutine vs non-coroutine functions don't change
in this patch series, so it's unlikely that this will break.

>=20
> > -    if (ctx !=3D qemu_get_aio_context()) {
> > -        aio_context_acquire(ctx);
> > -    }
> > +    /* TODO removed in next patch */
> >  }
>=20
> ...I guess I'll see in the next patch.
>=20
> > =20
> >  void coroutine_fn bdrv_co_unlock(BlockDriverState *bs)
> >  {
> > -    AioContext *ctx =3D bdrv_get_aio_context(bs);
> > -
> > -    assert(qemu_in_coroutine());
> > -    if (ctx !=3D qemu_get_aio_context()) {
> > -        aio_context_release(ctx);
> > -    }
> > +    /* TODO removed in next patch */
> >  }
>=20
> Same comment.
>=20
> > +++ b/blockdev.c
> > @@ -1395,7 +1352,6 @@ static void external_snapshot_action(TransactionA=
ction *action,
> >      /* File name of the new image (for 'blockdev-snapshot-sync') */
> >      const char *new_image_file;
> >      ExternalSnapshotState *state =3D g_new0(ExternalSnapshotState, 1);
> > -    AioContext *aio_context;
> >      uint64_t perm, shared;
> > =20
> >      /* TODO We'll eventually have to take a writer lock in this functi=
on */
>=20
> I'm guessing removal of the locking gets us one step closer to
> implementing this TODO at a later time?  Or is it now a stale comment?
> Either way, it doesn't affect this patch.

I'm not sure. Kevin can answer questions about the graph lock.

> > +++ b/tests/unit/test-blockjob.c
>=20
> > -static void test_complete_in_standby(void)
> > -{
>=20
> > @@ -531,13 +402,5 @@ int main(int argc, char **argv)
> >      g_test_add_func("/blockjob/cancel/standby", test_cancel_standby);
> >      g_test_add_func("/blockjob/cancel/pending", test_cancel_pending);
> >      g_test_add_func("/blockjob/cancel/concluded", test_cancel_conclude=
d);
> > -
> > -    /*
> > -     * This test is flaky and sometimes fails in CI and otherwise:
> > -     * don't run unless user opts in via environment variable.
> > -     */
> > -    if (getenv("QEMU_TEST_FLAKY_TESTS")) {
> > -        g_test_add_func("/blockjob/complete_in_standby", test_complete=
_in_standby);
> > -    }
>=20
> Looks like you ripped out this entire test, because it is no longer
> viable.  I might have mentioned it in the commit message, or squashed
> the removal of this test into the earlier 02/12 patch.

I have sent a separate patch to remove this test and once it's merged
this hunk will disappear this patch series:
https://lore.kernel.org/qemu-devel/20231127170210.422728-1-stefanha@redhat.=
com/

Stefan

--HAuHzOT83qxPp7gF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmVt8BEACgkQnKSrs4Gr
c8hIDgf5AYIr9dtEi7g5tsNLswyVkC2lDiMCBpf3ojJvX75zC6z2Y8fKDhunSi4B
7HpCHDeCFhoBFNQj7eXRbQgkdgqX7gLeBbXbwh+MT8q24VjfKHprjXuQJz4HFFNx
tls/oGcNkdSoPqfkO9Paso1BNF9gl9xQIAubT7foM3O0eJ9gQk+vEiBIw5/8QykZ
QKIHF6LkP6S7r7QOwhP9X4TBtudTZ9O2GIGXFdcpT9H4rYiTKSnT06NWziHZqqX6
3hViBZQI4yJySS9/wNhqX813PUjgfZAdZUGeye3eUHbdwlxNtYr6zF+4FshxfaI9
n4t6uI9nuJAyXYDz4wCBh3QI2yauuw==
=/mcM
-----END PGP SIGNATURE-----

--HAuHzOT83qxPp7gF--


