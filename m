Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 907626F5935
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 15:44:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529233.823400 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puClP-0002fv-6m; Wed, 03 May 2023 13:43:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529233.823400; Wed, 03 May 2023 13:43:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puClP-0002cs-3y; Wed, 03 May 2023 13:43:23 +0000
Received: by outflank-mailman (input) for mailman id 529233;
 Wed, 03 May 2023 13:43:21 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+yte=AY=redhat.com=kwolf@srs-se1.protection.inumbo.net>)
 id 1puClN-0002ck-Fl
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 13:43:21 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 749eda3a-e9b8-11ed-8611-37d641c3527e;
 Wed, 03 May 2023 15:43:16 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-63-BMx0iVPUPgGDcLgQ7YyuzA-1; Wed, 03 May 2023 09:43:10 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 92812852AF6;
 Wed,  3 May 2023 13:43:09 +0000 (UTC)
Received: from redhat.com (dhcp-192-205.str.redhat.com [10.33.192.205])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 164622166B29;
 Wed,  3 May 2023 13:43:05 +0000 (UTC)
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
X-Inumbo-ID: 749eda3a-e9b8-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683121395;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LnWGqGWWdJPHGGU1rFwcwMAX+ugZvyvG/DLBRKCKxQk=;
	b=IrjBXvGomeoyBrVgohlnRrrk8WFPFBDsym+7DJT6odAmaLlcn44QKw3ATnui2caZk5U7N2
	5j+/lqhdBSrCq0d+mmLhDQ1TUJgSV8DnkADDlUhiOXuk0CfJ3Gr4UT3k+WW4pIY4+68f0B
	zFJF4s3ltd6cGJeSIWYeFrYpL+gaUq8=
X-MC-Unique: BMx0iVPUPgGDcLgQ7YyuzA-1
Date: Wed, 3 May 2023 15:43:05 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org,
	Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	Julia Suvorova <jusual@redhat.com>, xen-devel@lists.xenproject.org,
	eesposit@redhat.com,
	Richard Henderson <richard.henderson@linaro.org>,
	Fam Zheng <fam@euphon.net>, "Michael S. Tsirkin" <mst@redhat.com>,
	Coiby Xu <Coiby.Xu@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Peter Lieven <pl@kamp.de>, Paul Durrant <paul@xen.org>,
	"Richard W.M. Jones" <rjones@redhat.com>, qemu-block@nongnu.org,
	Stefano Garzarella <sgarzare@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Stefan Weil <sw@weilnetz.de>, Xie Yongji <xieyongji@bytedance.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Aarushi Mehta <mehta.aaru20@gmail.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Hanna Reitz <hreitz@redhat.com>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>
Subject: Re: [PATCH v4 07/20] block/export: stop using is_external in
 vhost-user-blk server
Message-ID: <ZFJjicw0Kjfvl5qN@redhat.com>
References: <20230425172716.1033562-1-stefanha@redhat.com>
 <20230425172716.1033562-8-stefanha@redhat.com>
 <ZFE0iFnbr2ey0A7X@redhat.com>
 <20230502200645.GE535070@fedora>
 <ZFIWjuST/9tHVNMG@redhat.com>
 <20230503131125.GB757667@fedora>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3jXylBdepGNQTKaY"
Content-Disposition: inline
In-Reply-To: <20230503131125.GB757667@fedora>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6


--3jXylBdepGNQTKaY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Am 03.05.2023 um 15:11 hat Stefan Hajnoczi geschrieben:
> On Wed, May 03, 2023 at 10:08:46AM +0200, Kevin Wolf wrote:
> > Am 02.05.2023 um 22:06 hat Stefan Hajnoczi geschrieben:
> > > On Tue, May 02, 2023 at 06:04:24PM +0200, Kevin Wolf wrote:
> > > > Am 25.04.2023 um 19:27 hat Stefan Hajnoczi geschrieben:
> > > > > vhost-user activity must be suspended during bdrv_drained_begin/e=
nd().
> > > > > This prevents new requests from interfering with whatever is happ=
ening
> > > > > in the drained section.
> > > > >=20
> > > > > Previously this was done using aio_set_fd_handler()'s is_external
> > > > > argument. In a multi-queue block layer world the aio_disable_exte=
rnal()
> > > > > API cannot be used since multiple AioContext may be processing I/=
O, not
> > > > > just one.
> > > > >=20
> > > > > Switch to BlockDevOps->drained_begin/end() callbacks.
> > > > >=20
> > > > > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > > > > ---
> > > > >  block/export/vhost-user-blk-server.c | 43 ++++++++++++++--------=
------
> > > > >  util/vhost-user-server.c             | 10 +++----
> > > > >  2 files changed, 26 insertions(+), 27 deletions(-)
> > > > >=20
> > > > > diff --git a/block/export/vhost-user-blk-server.c b/block/export/=
vhost-user-blk-server.c
> > > > > index 092b86aae4..d20f69cd74 100644
> > > > > --- a/block/export/vhost-user-blk-server.c
> > > > > +++ b/block/export/vhost-user-blk-server.c
> > > > > @@ -208,22 +208,6 @@ static const VuDevIface vu_blk_iface =3D {
> > > > >      .process_msg           =3D vu_blk_process_msg,
> > > > >  };
> > > > > =20
> > > > > -static void blk_aio_attached(AioContext *ctx, void *opaque)
> > > > > -{
> > > > > -    VuBlkExport *vexp =3D opaque;
> > > > > -
> > > > > -    vexp->export.ctx =3D ctx;
> > > > > -    vhost_user_server_attach_aio_context(&vexp->vu_server, ctx);
> > > > > -}
> > > > > -
> > > > > -static void blk_aio_detach(void *opaque)
> > > > > -{
> > > > > -    VuBlkExport *vexp =3D opaque;
> > > > > -
> > > > > -    vhost_user_server_detach_aio_context(&vexp->vu_server);
> > > > > -    vexp->export.ctx =3D NULL;
> > > > > -}
> > > >=20
> > > > So for changing the AioContext, we now rely on the fact that the no=
de to
> > > > be changed is always drained, so the drain callbacks implicitly cov=
er
> > > > this case, too?
> > >=20
> > > Yes.
> >=20
> > Ok. This surprised me a bit at first, but I think it's fine.
> >=20
> > We just need to remember it if we ever decide that once we have
> > multiqueue, we can actually change the default AioContext without
> > draining the node. But maybe at that point, we have to do more
> > fundamental changes anyway.
> >=20
> > > > >  static void
> > > > >  vu_blk_initialize_config(BlockDriverState *bs,
> > > > >                           struct virtio_blk_config *config,
> > > > > @@ -272,6 +256,25 @@ static void vu_blk_exp_resize(void *opaque)
> > > > >      vu_config_change_msg(&vexp->vu_server.vu_dev);
> > > > >  }
> > > > > =20
> > > > > +/* Called with vexp->export.ctx acquired */
> > > > > +static void vu_blk_drained_begin(void *opaque)
> > > > > +{
> > > > > +    VuBlkExport *vexp =3D opaque;
> > > > > +
> > > > > +    vhost_user_server_detach_aio_context(&vexp->vu_server);
> > > > > +}
> > > >=20
> > > > Compared to the old code, we're losing the vexp->export.ctx =3D NUL=
L. This
> > > > is correct at this point because after drained_begin we still keep
> > > > processing requests until we arrive at a quiescent state.
> > > >=20
> > > > However, if we detach the AioContext because we're deleting the
> > > > iothread, won't we end up with a dangling pointer in vexp->export.c=
tx?
> > > > Or can we be certain that nothing interesting happens before draine=
d_end
> > > > updates it with a new valid pointer again?
> > >=20
> > > If you want I can add the detach() callback back again and set ctx to
> > > NULL there?
> >=20
> > I haven't thought enough about it to say if it's a problem. If you have
> > and are confident that it's correct the way it is, I'm happy with it.
> >
> > But bringing the callback back is the minimal change compared to the old
> > state. It's just unnecessary code if we don't actually need it.
>=20
> The reasoning behind my patch is that detach() sets NULL today and we
> would see crashes if ctx was accessed between detach() -> attach().
> Therefore, I'm assuming there are no ctx accesses in the code today and
> removing the ctx =3D NULL assignment doesn't break anything.

Sometimes ctx =3D NULL defaults to qemu_get_aio_context(), so in theory
there could be cases where NULL works, but a dangling pointer wouldn't.

> However, my approach is not very defensive. If the code is changed in
> a way that accesses ctx when it's not supposed to, then a dangling
> pointer will be accessed.
>=20
> I think leaving the detach() callback there can be justified because it
> will make it easier to detect bugs in the future. I'll add it back in
> the next revision.

Ok, sounds good me.

Kevin

--3jXylBdepGNQTKaY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE3D3rFZqa+V09dFb+fwmycsiPL9YFAmRSZOgACgkQfwmycsiP
L9Z4eQ/+LgU+OhaX4MhIHoKVbBeqTOHQYSWlDg/eh/I3pVF0g/HToZc1vLm0azxU
NhSqg87kLo3DRKFUh25e5370t219xFbDW4rz4RVy0OJLklLfj7qi59XOxE0MLiVI
5ySbG1FxdFTNS9dAoYmPuxrucX+RPEpwHw1gIpmIx+GqLGuYhrjvjqOeB/Nx7tm6
dAUmxB4Vt16wsTPs92zA09I8KtiWqr+fm+P2u/jfdsC1HqtWL93uiyQoon7LoCqO
c3VwmyR+aFr5AUmlIkS0dxzd9Bbnixd0jnHUEdaowCVLmAYbKvDJkl5HTjYEyF+D
p7Lm7GRdQPaJgu4GyKtj8NWwfra2VXEDW0M+VhWEYCLMrka00wXGO1bxjUZzEpP5
8F25eFcpNb2rixwMHlEU3UQJxNS+wtODzmkjIcj4N8F0aM7eNZDuUIDnwGMQirid
9VubITTJZtDtnp+AOO2B3zMhuAqi7EslMXOYHb5NZ9Yi31otsYE5BKScKxaCy5jq
w1h+o7sNoyW+48yvjUhxkH1bU/CHbhv9VLQ1QTHgy+uR5lADMjEba7XHBQnclHs2
rzyA9WgwuQcdq4pbUCH/hFMpoPCSNdL/Dw7riadrx7hoJB+GRr7AYfR9NEk6NtAd
uBfxOOO5MBpngMUdiDQdlDHmigg2QSJMyFacVTs/NVGFuAO1B6c=
=+t1f
-----END PGP SIGNATURE-----

--3jXylBdepGNQTKaY--


