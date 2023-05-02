Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9A1C6F4AE4
	for <lists+xen-devel@lfdr.de>; Tue,  2 May 2023 22:07:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.528812.822428 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptwH1-0003jO-T4; Tue, 02 May 2023 20:06:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 528812.822428; Tue, 02 May 2023 20:06:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ptwH1-0003gt-Pc; Tue, 02 May 2023 20:06:55 +0000
Received: by outflank-mailman (input) for mailman id 528812;
 Tue, 02 May 2023 20:06:54 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GGWT=AX=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1ptwH0-0003gj-Er
 for xen-devel@lists.xenproject.org; Tue, 02 May 2023 20:06:54 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id e0bd3cb8-e924-11ed-b225-6b7b168915f2;
 Tue, 02 May 2023 22:06:52 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-228-EPMPoQX1NfuQ2XU-a2gp2Q-1; Tue, 02 May 2023 16:06:48 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5758A85A588;
 Tue,  2 May 2023 20:06:47 +0000 (UTC)
Received: from localhost (unknown [10.39.192.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C37E1C15BAE;
 Tue,  2 May 2023 20:06:46 +0000 (UTC)
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
X-Inumbo-ID: e0bd3cb8-e924-11ed-b225-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683058011;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LgDhtbpQWSSNsgeEph8esneZJVWEPWcWGLZOnDkeVKE=;
	b=Kdbe6o3RSShoyolv1BJEpZjDP6CP1+4m4XuVtcQZgsQ8LZnWJ0ZRruYghKu6UwyXZPiH6I
	qEb+XNd2k/EysxjXB5O8vTPgiIC9pDlAMRg4iKbCoMn30TV93xjZDaSZ0cHl1p6ydQ5qJg
	fz0cE2caF7n03Xrp0fzPYt9s6obYr9Y=
X-MC-Unique: EPMPoQX1NfuQ2XU-a2gp2Q-1
Date: Tue, 2 May 2023 16:06:45 -0400
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
Message-ID: <20230502200645.GE535070@fedora>
References: <20230425172716.1033562-1-stefanha@redhat.com>
 <20230425172716.1033562-8-stefanha@redhat.com>
 <ZFE0iFnbr2ey0A7X@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="O5xAqfWJ9HxCWIfk"
Content-Disposition: inline
In-Reply-To: <ZFE0iFnbr2ey0A7X@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8


--O5xAqfWJ9HxCWIfk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 02, 2023 at 06:04:24PM +0200, Kevin Wolf wrote:
> Am 25.04.2023 um 19:27 hat Stefan Hajnoczi geschrieben:
> > vhost-user activity must be suspended during bdrv_drained_begin/end().
> > This prevents new requests from interfering with whatever is happening
> > in the drained section.
> >=20
> > Previously this was done using aio_set_fd_handler()'s is_external
> > argument. In a multi-queue block layer world the aio_disable_external()
> > API cannot be used since multiple AioContext may be processing I/O, not
> > just one.
> >=20
> > Switch to BlockDevOps->drained_begin/end() callbacks.
> >=20
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> >  block/export/vhost-user-blk-server.c | 43 ++++++++++++++--------------
> >  util/vhost-user-server.c             | 10 +++----
> >  2 files changed, 26 insertions(+), 27 deletions(-)
> >=20
> > diff --git a/block/export/vhost-user-blk-server.c b/block/export/vhost-=
user-blk-server.c
> > index 092b86aae4..d20f69cd74 100644
> > --- a/block/export/vhost-user-blk-server.c
> > +++ b/block/export/vhost-user-blk-server.c
> > @@ -208,22 +208,6 @@ static const VuDevIface vu_blk_iface =3D {
> >      .process_msg           =3D vu_blk_process_msg,
> >  };
> > =20
> > -static void blk_aio_attached(AioContext *ctx, void *opaque)
> > -{
> > -    VuBlkExport *vexp =3D opaque;
> > -
> > -    vexp->export.ctx =3D ctx;
> > -    vhost_user_server_attach_aio_context(&vexp->vu_server, ctx);
> > -}
> > -
> > -static void blk_aio_detach(void *opaque)
> > -{
> > -    VuBlkExport *vexp =3D opaque;
> > -
> > -    vhost_user_server_detach_aio_context(&vexp->vu_server);
> > -    vexp->export.ctx =3D NULL;
> > -}
>=20
> So for changing the AioContext, we now rely on the fact that the node to
> be changed is always drained, so the drain callbacks implicitly cover
> this case, too?

Yes.

> >  static void
> >  vu_blk_initialize_config(BlockDriverState *bs,
> >                           struct virtio_blk_config *config,
> > @@ -272,6 +256,25 @@ static void vu_blk_exp_resize(void *opaque)
> >      vu_config_change_msg(&vexp->vu_server.vu_dev);
> >  }
> > =20
> > +/* Called with vexp->export.ctx acquired */
> > +static void vu_blk_drained_begin(void *opaque)
> > +{
> > +    VuBlkExport *vexp =3D opaque;
> > +
> > +    vhost_user_server_detach_aio_context(&vexp->vu_server);
> > +}
>=20
> Compared to the old code, we're losing the vexp->export.ctx =3D NULL. This
> is correct at this point because after drained_begin we still keep
> processing requests until we arrive at a quiescent state.
>=20
> However, if we detach the AioContext because we're deleting the
> iothread, won't we end up with a dangling pointer in vexp->export.ctx?
> Or can we be certain that nothing interesting happens before drained_end
> updates it with a new valid pointer again?

If you want I can add the detach() callback back again and set ctx to
NULL there?

Stefan

--O5xAqfWJ9HxCWIfk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmRRbVUACgkQnKSrs4Gr
c8i4OAf+KMBGicSKs6PxKeNThQpFSMAOYw12vnQg0N97hfarjPeaKf9lZmdJLKB7
McPjsLuRThNx0snklzDlcRovZKNZcV5EjEddXKA1ikDqZXDeLue4X717xIIV1RF0
oYAyyPcTXr9V1JKG2nKQzz1fK/zb0oXyEycRI1uPB1YjiL/NnBUZEdAG3DEZmBXK
qjZcFpvChPe6DFydAfunLcRtoSASIb6cBLCeOFHXuTrKixFZeG9QDW87ONOMnG7D
JF3Cjcfsn94R6SFWDOK2TGeKF7IY6kVJa+gOJXyTE2+n2vZhpezwmroM4kprRJGc
TiMUeoBbZl3Oi5FrMOcj7MOeMEdRlw==
=PCPd
-----END PGP SIGNATURE-----

--O5xAqfWJ9HxCWIfk--


