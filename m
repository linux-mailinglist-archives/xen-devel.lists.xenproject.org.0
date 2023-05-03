Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF9B6F58B9
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 15:12:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529215.823369 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puCGe-0006UR-2u; Wed, 03 May 2023 13:11:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529215.823369; Wed, 03 May 2023 13:11:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puCGe-0006SD-04; Wed, 03 May 2023 13:11:36 +0000
Received: by outflank-mailman (input) for mailman id 529215;
 Wed, 03 May 2023 13:11:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0hrU=AY=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1puCGc-0006S7-6o
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 13:11:34 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 04e02d26-e9b4-11ed-8611-37d641c3527e;
 Wed, 03 May 2023 15:11:31 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-400-scHiVcTtPcyrb409VnmdJw-1; Wed, 03 May 2023 09:11:29 -0400
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C73D1185A7A2;
 Wed,  3 May 2023 13:11:27 +0000 (UTC)
Received: from localhost (unknown [10.39.195.169])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CD6E3492C1B;
 Wed,  3 May 2023 13:11:26 +0000 (UTC)
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
X-Inumbo-ID: 04e02d26-e9b4-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683119490;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zDf5y2EkHT9U0n319r/7zDgcT1di3Iez/iSIsbs73yg=;
	b=DomLdPxnEEBmpmTt9RiVVGSaBm/Lr0x7JARg2vzdbJJJAxynU7WHPUMN54enoHsBr5g1Jh
	6kopnctjm6D7lonwZK+1NEDnU3slT4BrfzMz8YwXsl8ciOOevVc8T6C0KuwusR7VOXHmlP
	1FEAf5WtU243XZ/9zD5UZpZ1aicqSuY=
X-MC-Unique: scHiVcTtPcyrb409VnmdJw-1
Date: Wed, 3 May 2023 09:11:25 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
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
Message-ID: <20230503131125.GB757667@fedora>
References: <20230425172716.1033562-1-stefanha@redhat.com>
 <20230425172716.1033562-8-stefanha@redhat.com>
 <ZFE0iFnbr2ey0A7X@redhat.com>
 <20230502200645.GE535070@fedora>
 <ZFIWjuST/9tHVNMG@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7BkvsqboKjcTwbWK"
Content-Disposition: inline
In-Reply-To: <ZFIWjuST/9tHVNMG@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9


--7BkvsqboKjcTwbWK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 03, 2023 at 10:08:46AM +0200, Kevin Wolf wrote:
> Am 02.05.2023 um 22:06 hat Stefan Hajnoczi geschrieben:
> > On Tue, May 02, 2023 at 06:04:24PM +0200, Kevin Wolf wrote:
> > > Am 25.04.2023 um 19:27 hat Stefan Hajnoczi geschrieben:
> > > > vhost-user activity must be suspended during bdrv_drained_begin/end=
().
> > > > This prevents new requests from interfering with whatever is happen=
ing
> > > > in the drained section.
> > > >=20
> > > > Previously this was done using aio_set_fd_handler()'s is_external
> > > > argument. In a multi-queue block layer world the aio_disable_extern=
al()
> > > > API cannot be used since multiple AioContext may be processing I/O,=
 not
> > > > just one.
> > > >=20
> > > > Switch to BlockDevOps->drained_begin/end() callbacks.
> > > >=20
> > > > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > > > ---
> > > >  block/export/vhost-user-blk-server.c | 43 ++++++++++++++----------=
----
> > > >  util/vhost-user-server.c             | 10 +++----
> > > >  2 files changed, 26 insertions(+), 27 deletions(-)
> > > >=20
> > > > diff --git a/block/export/vhost-user-blk-server.c b/block/export/vh=
ost-user-blk-server.c
> > > > index 092b86aae4..d20f69cd74 100644
> > > > --- a/block/export/vhost-user-blk-server.c
> > > > +++ b/block/export/vhost-user-blk-server.c
> > > > @@ -208,22 +208,6 @@ static const VuDevIface vu_blk_iface =3D {
> > > >      .process_msg           =3D vu_blk_process_msg,
> > > >  };
> > > > =20
> > > > -static void blk_aio_attached(AioContext *ctx, void *opaque)
> > > > -{
> > > > -    VuBlkExport *vexp =3D opaque;
> > > > -
> > > > -    vexp->export.ctx =3D ctx;
> > > > -    vhost_user_server_attach_aio_context(&vexp->vu_server, ctx);
> > > > -}
> > > > -
> > > > -static void blk_aio_detach(void *opaque)
> > > > -{
> > > > -    VuBlkExport *vexp =3D opaque;
> > > > -
> > > > -    vhost_user_server_detach_aio_context(&vexp->vu_server);
> > > > -    vexp->export.ctx =3D NULL;
> > > > -}
> > >=20
> > > So for changing the AioContext, we now rely on the fact that the node=
 to
> > > be changed is always drained, so the drain callbacks implicitly cover
> > > this case, too?
> >=20
> > Yes.
>=20
> Ok. This surprised me a bit at first, but I think it's fine.
>=20
> We just need to remember it if we ever decide that once we have
> multiqueue, we can actually change the default AioContext without
> draining the node. But maybe at that point, we have to do more
> fundamental changes anyway.
>=20
> > > >  static void
> > > >  vu_blk_initialize_config(BlockDriverState *bs,
> > > >                           struct virtio_blk_config *config,
> > > > @@ -272,6 +256,25 @@ static void vu_blk_exp_resize(void *opaque)
> > > >      vu_config_change_msg(&vexp->vu_server.vu_dev);
> > > >  }
> > > > =20
> > > > +/* Called with vexp->export.ctx acquired */
> > > > +static void vu_blk_drained_begin(void *opaque)
> > > > +{
> > > > +    VuBlkExport *vexp =3D opaque;
> > > > +
> > > > +    vhost_user_server_detach_aio_context(&vexp->vu_server);
> > > > +}
> > >=20
> > > Compared to the old code, we're losing the vexp->export.ctx =3D NULL.=
 This
> > > is correct at this point because after drained_begin we still keep
> > > processing requests until we arrive at a quiescent state.
> > >=20
> > > However, if we detach the AioContext because we're deleting the
> > > iothread, won't we end up with a dangling pointer in vexp->export.ctx?
> > > Or can we be certain that nothing interesting happens before drained_=
end
> > > updates it with a new valid pointer again?
> >=20
> > If you want I can add the detach() callback back again and set ctx to
> > NULL there?
>=20
> I haven't thought enough about it to say if it's a problem. If you have
> and are confident that it's correct the way it is, I'm happy with it.
>
> But bringing the callback back is the minimal change compared to the old
> state. It's just unnecessary code if we don't actually need it.

The reasoning behind my patch is that detach() sets NULL today and we
would see crashes if ctx was accessed between detach() -> attach().
Therefore, I'm assuming there are no ctx accesses in the code today and
removing the ctx =3D NULL assignment doesn't break anything.

However, my approach is not very defensive. If the code is changed in a
way that accesses ctx when it's not supposed to, then a dangling pointer
will be accessed.

I think leaving the detach() callback there can be justified because it
will make it easier to detect bugs in the future. I'll add it back in
the next revision.

Stefan

--7BkvsqboKjcTwbWK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmRSXX0ACgkQnKSrs4Gr
c8gM4wf9EGB7urw2+olwINpeSZIIcwDydnYjHtFLdg2c1j5VCnMBvL9ZLGU43pUg
9ZjyblYuKFxm/lepAy8L67L9X7MWyUDAC5RVjvTKviQuEcYzsXdKqxCM7FDLz5/G
z+jOU1ds4cfCAL6RhRfkEZPClubmNTp9kuWXpsbISy6+WfMGui4957grADrXgH47
qL7ERau5lMwU+NVljzZ7q0U+hPdu1j7jVM5qq34NXLoZTAmDNpaUr29MGJGCYgEP
xnv2eAJ/2+bJ4uDvd0G8L93nbpXSulv9l+bTViQEjDP1R4tPxtiXQ7WNfkRoVrHe
H4iug75lp6O5k2vDRwNAbqrlaRJZLw==
=6nP0
-----END PGP SIGNATURE-----

--7BkvsqboKjcTwbWK--


