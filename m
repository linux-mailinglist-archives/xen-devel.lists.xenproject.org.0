Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A9A6F52B8
	for <lists+xen-devel@lfdr.de>; Wed,  3 May 2023 10:09:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.529021.822930 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pu7Xo-0002dm-5G; Wed, 03 May 2023 08:09:00 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 529021.822930; Wed, 03 May 2023 08:09:00 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pu7Xo-0002bm-19; Wed, 03 May 2023 08:09:00 +0000
Received: by outflank-mailman (input) for mailman id 529021;
 Wed, 03 May 2023 08:08:59 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=+yte=AY=redhat.com=kwolf@srs-se1.protection.inumbo.net>)
 id 1pu7Xn-0002AX-5e
 for xen-devel@lists.xenproject.org; Wed, 03 May 2023 08:08:59 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c0e62e46-e989-11ed-b225-6b7b168915f2;
 Wed, 03 May 2023 10:08:58 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-36-vLcfhCiUOwuGWkdaAmksmg-1; Wed, 03 May 2023 04:08:51 -0400
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C56C810504AC;
 Wed,  3 May 2023 08:08:50 +0000 (UTC)
Received: from redhat.com (dhcp-192-205.str.redhat.com [10.33.192.205])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4DD9F492B00;
 Wed,  3 May 2023 08:08:47 +0000 (UTC)
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
X-Inumbo-ID: c0e62e46-e989-11ed-b225-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683101337;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GdsrTvtpKiwphnVpAamWYth1JM74zuqKQh3Am2keHQg=;
	b=DrcBo0DMnCv/KYxjqbWPFEyuBQ5x0xjmLkCGM4iu9AWTD7bMDcq3Wb9YyNkcujEtAfsvw/
	j+MCnqqGLEWWFB1X3FiTInfVcS+E9cAVWuKkQJdECig6CHgi8sOGjV7gIO0ZE6SJgaxxPl
	EOqzB54vB61LF8uKV5o2rajrMYOoT1w=
X-MC-Unique: vLcfhCiUOwuGWkdaAmksmg-1
Date: Wed, 3 May 2023 10:08:46 +0200
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
Message-ID: <ZFIWjuST/9tHVNMG@redhat.com>
References: <20230425172716.1033562-1-stefanha@redhat.com>
 <20230425172716.1033562-8-stefanha@redhat.com>
 <ZFE0iFnbr2ey0A7X@redhat.com>
 <20230502200645.GE535070@fedora>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8uIPJqxz2LaoW5Jz"
Content-Disposition: inline
In-Reply-To: <20230502200645.GE535070@fedora>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10


--8uIPJqxz2LaoW5Jz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Am 02.05.2023 um 22:06 hat Stefan Hajnoczi geschrieben:
> On Tue, May 02, 2023 at 06:04:24PM +0200, Kevin Wolf wrote:
> > Am 25.04.2023 um 19:27 hat Stefan Hajnoczi geschrieben:
> > > vhost-user activity must be suspended during bdrv_drained_begin/end().
> > > This prevents new requests from interfering with whatever is happening
> > > in the drained section.
> > >=20
> > > Previously this was done using aio_set_fd_handler()'s is_external
> > > argument. In a multi-queue block layer world the aio_disable_external=
()
> > > API cannot be used since multiple AioContext may be processing I/O, n=
ot
> > > just one.
> > >=20
> > > Switch to BlockDevOps->drained_begin/end() callbacks.
> > >=20
> > > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > > ---
> > >  block/export/vhost-user-blk-server.c | 43 ++++++++++++++------------=
--
> > >  util/vhost-user-server.c             | 10 +++----
> > >  2 files changed, 26 insertions(+), 27 deletions(-)
> > >=20
> > > diff --git a/block/export/vhost-user-blk-server.c b/block/export/vhos=
t-user-blk-server.c
> > > index 092b86aae4..d20f69cd74 100644
> > > --- a/block/export/vhost-user-blk-server.c
> > > +++ b/block/export/vhost-user-blk-server.c
> > > @@ -208,22 +208,6 @@ static const VuDevIface vu_blk_iface =3D {
> > >      .process_msg           =3D vu_blk_process_msg,
> > >  };
> > > =20
> > > -static void blk_aio_attached(AioContext *ctx, void *opaque)
> > > -{
> > > -    VuBlkExport *vexp =3D opaque;
> > > -
> > > -    vexp->export.ctx =3D ctx;
> > > -    vhost_user_server_attach_aio_context(&vexp->vu_server, ctx);
> > > -}
> > > -
> > > -static void blk_aio_detach(void *opaque)
> > > -{
> > > -    VuBlkExport *vexp =3D opaque;
> > > -
> > > -    vhost_user_server_detach_aio_context(&vexp->vu_server);
> > > -    vexp->export.ctx =3D NULL;
> > > -}
> >=20
> > So for changing the AioContext, we now rely on the fact that the node to
> > be changed is always drained, so the drain callbacks implicitly cover
> > this case, too?
>=20
> Yes.

Ok. This surprised me a bit at first, but I think it's fine.

We just need to remember it if we ever decide that once we have
multiqueue, we can actually change the default AioContext without
draining the node. But maybe at that point, we have to do more
fundamental changes anyway.

> > >  static void
> > >  vu_blk_initialize_config(BlockDriverState *bs,
> > >                           struct virtio_blk_config *config,
> > > @@ -272,6 +256,25 @@ static void vu_blk_exp_resize(void *opaque)
> > >      vu_config_change_msg(&vexp->vu_server.vu_dev);
> > >  }
> > > =20
> > > +/* Called with vexp->export.ctx acquired */
> > > +static void vu_blk_drained_begin(void *opaque)
> > > +{
> > > +    VuBlkExport *vexp =3D opaque;
> > > +
> > > +    vhost_user_server_detach_aio_context(&vexp->vu_server);
> > > +}
> >=20
> > Compared to the old code, we're losing the vexp->export.ctx =3D NULL. T=
his
> > is correct at this point because after drained_begin we still keep
> > processing requests until we arrive at a quiescent state.
> >=20
> > However, if we detach the AioContext because we're deleting the
> > iothread, won't we end up with a dangling pointer in vexp->export.ctx?
> > Or can we be certain that nothing interesting happens before drained_end
> > updates it with a new valid pointer again?
>=20
> If you want I can add the detach() callback back again and set ctx to
> NULL there?

I haven't thought enough about it to say if it's a problem. If you have
and are confident that it's correct the way it is, I'm happy with it.

But bringing the callback back is the minimal change compared to the old
state. It's just unnecessary code if we don't actually need it.

Kevin

--8uIPJqxz2LaoW5Jz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE3D3rFZqa+V09dFb+fwmycsiPL9YFAmRSFo4ACgkQfwmycsiP
L9bGwQ/9HZIvpsXG7HrllRtRSZut7ucmoWbVO6oQFsVMI4RFuShXz3jZHU1roMAs
tCqrZRC6M8Y+JA/pROYtwBTcrvOE/FUc6d/KXFXblg/NGTFDUGwmPWa3t8kZPul/
wfOG8F/BRVLtOhY1DtJhAqO1cXkda/bZxqFDrCgyqtfLpXh+kuVQSOCHbontOMYu
vNfhY3FYP0FH44fRnPsUJQVsx0pmZ07waR5lc2ukINv8d0uSN2L7U8Vw8JrNaWAK
xGJmpznwr+eZla+/lsWQCQhWysYQIuZGuk/WFeXbitwLEnw7CiJc7qpYf55v4v8Z
AOLuMBQVN7QGGrKmpbwuzoD09MOWsIk7dd6X30DxiF7eaE5kO/4jkIeVYPtiaXg2
WUJpZYL1bRX04Tg2snXA4fw06fWMOO1LdAhrDHbU8P+WmxgjDpSO6zFGySFEjukb
NHi9p14nSXwrhFUD5wOREzVRR828cmgltcrVypCRPXwISwqxfHuAvqRdrG4/+pIh
5u/VTqxrKerXIPxMgiU9yqJAwaRJkyK/+yFmg9vYUiBcR4sGw5HQIUzeEif5V+pd
ckV5NxGX/Wbuyo5RpiL1YnzwB4LthdVaRYLQBuR3RaKyY7G6VSUP9ARQjBg6hEr/
fDnW23q/JH7Gr7CIdAKWz/D9Q4aL+rw4z9CbfBFkq4oG7naqDIU=
=3jaa
-----END PGP SIGNATURE-----

--8uIPJqxz2LaoW5Jz--


