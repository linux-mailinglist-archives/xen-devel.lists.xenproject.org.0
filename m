Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 56FF86FFBCF
	for <lists+xen-devel@lfdr.de>; Thu, 11 May 2023 23:23:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533636.830451 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxDkj-0001Nr-8i; Thu, 11 May 2023 21:23:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533636.830451; Thu, 11 May 2023 21:23:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxDkj-0001L4-5J; Thu, 11 May 2023 21:23:09 +0000
Received: by outflank-mailman (input) for mailman id 533636;
 Thu, 11 May 2023 21:23:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hqDu=BA=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1pxDkh-0001Ky-6h
 for xen-devel@lists.xenproject.org; Thu, 11 May 2023 21:23:07 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 03777d16-f042-11ed-8611-37d641c3527e;
 Thu, 11 May 2023 23:23:04 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-475-3xO6SSSRNHmyv7vq4yn9MA-1; Thu, 11 May 2023 17:23:01 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B1EFD101A54F;
 Thu, 11 May 2023 21:23:00 +0000 (UTC)
Received: from localhost (unknown [10.39.194.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C76ED1121314;
 Thu, 11 May 2023 21:22:59 +0000 (UTC)
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
X-Inumbo-ID: 03777d16-f042-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683840183;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=15TTAtwTe95TssE/QqqHEBqg7HkRY26GkLUlrAlX6ug=;
	b=IBSoeGcHRY15VNV+mWpW266dTOYTC1LlX/5veW5WpPm/kbrJEvnRqKlkhfSnvT1qYBIA/7
	q9fx/J8aKiO3/LGw4OPCGiFmzS6kFDXHquCxYt5wRxXEaUDPbJ8zpWqxUUsLVfdmQxeafy
	kxV/0jyTggNl8JR7Vg20/d9oc1VHZJA=
X-MC-Unique: 3xO6SSSRNHmyv7vq4yn9MA-1
Date: Thu, 11 May 2023 17:22:57 -0400
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
Subject: Re: [PATCH v4 17/20] virtio-blk: implement
 BlockDevOps->drained_begin()
Message-ID: <20230511212257.GC1425915@fedora>
References: <20230425172716.1033562-1-stefanha@redhat.com>
 <20230425172716.1033562-18-stefanha@redhat.com>
 <ZFQgBvWShB4NCymj@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Oiaj1dMwGdbo2z3S"
Content-Disposition: inline
In-Reply-To: <ZFQgBvWShB4NCymj@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3


--Oiaj1dMwGdbo2z3S
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 04, 2023 at 11:13:42PM +0200, Kevin Wolf wrote:
> Am 25.04.2023 um 19:27 hat Stefan Hajnoczi geschrieben:
> > Detach ioeventfds during drained sections to stop I/O submission from
> > the guest. virtio-blk is no longer reliant on aio_disable_external()
> > after this patch. This will allow us to remove the
> > aio_disable_external() API once all other code that relies on it is
> > converted.
> >=20
> > Take extra care to avoid attaching/detaching ioeventfds if the data
> > plane is started/stopped during a drained section. This should be rare,
> > but maybe the mirror block job can trigger it.
> >=20
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> >  hw/block/dataplane/virtio-blk.c | 17 +++++++++------
> >  hw/block/virtio-blk.c           | 38 ++++++++++++++++++++++++++++++++-
> >  2 files changed, 48 insertions(+), 7 deletions(-)
> >=20
> > diff --git a/hw/block/dataplane/virtio-blk.c b/hw/block/dataplane/virti=
o-blk.c
> > index bd7cc6e76b..d77fc6028c 100644
> > --- a/hw/block/dataplane/virtio-blk.c
> > +++ b/hw/block/dataplane/virtio-blk.c
> > @@ -245,13 +245,15 @@ int virtio_blk_data_plane_start(VirtIODevice *vde=
v)
> >      }
> > =20
> >      /* Get this show started by hooking up our callbacks */
> > -    aio_context_acquire(s->ctx);
> > -    for (i =3D 0; i < nvqs; i++) {
> > -        VirtQueue *vq =3D virtio_get_queue(s->vdev, i);
> > +    if (!blk_in_drain(s->conf->conf.blk)) {
> > +        aio_context_acquire(s->ctx);
> > +        for (i =3D 0; i < nvqs; i++) {
> > +            VirtQueue *vq =3D virtio_get_queue(s->vdev, i);
> > =20
> > -        virtio_queue_aio_attach_host_notifier(vq, s->ctx);
> > +            virtio_queue_aio_attach_host_notifier(vq, s->ctx);
> > +        }
> > +        aio_context_release(s->ctx);
> >      }
> > -    aio_context_release(s->ctx);
> >      return 0;
> > =20
> >    fail_aio_context:
> > @@ -317,7 +319,10 @@ void virtio_blk_data_plane_stop(VirtIODevice *vdev)
> >      trace_virtio_blk_data_plane_stop(s);
> > =20
> >      aio_context_acquire(s->ctx);
> > -    aio_wait_bh_oneshot(s->ctx, virtio_blk_data_plane_stop_bh, s);
> > +
> > +    if (!blk_in_drain(s->conf->conf.blk)) {
> > +        aio_wait_bh_oneshot(s->ctx, virtio_blk_data_plane_stop_bh, s);
> > +    }
>=20
> So here we actually get a semantic change: What you described as the
> second part in the previous patch, processing the virtqueue one last
> time, isn't done any more if the device is drained.
>=20
> If it's okay to just skip this during drain, why do we need to do it
> outside of drain?

I forgot to answer why we need to process requests one last time outside
drain.

This approach comes from how vhost uses ioeventfd. When switching from
vhost back to QEMU emulation, there's a chance that a final virtqueue
kick snuck in while ioeventfd was being disabled.

This is not the case with dataplane nowadays (it may have in the past).
The only state dataplane transitions are device reset and 'stop'/'cont'.
Neither of these require QEMU to process new requests in while stopping
dataplane.

My confidence is not 100%, but still pretty high that the
virtio_queue_host_notifier_read() call could be dropped from dataplane
code. Since I'm not 100% sure I didn't attempt that.

Stefan

--Oiaj1dMwGdbo2z3S
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmRdXLEACgkQnKSrs4Gr
c8jaKwf/fkopq41ZCcEWQFE6onRfieKs07b9qdmYnv9Ly46C4LHZe6PGnV7WnARH
Io4P4+i62gfIqhSteatqauqvYq0TKi/1WtWlzzOZhBU4J2zQGkJ29d5j7Z5YCTb7
uNx4J0SysXXmIau/T/Tg0KbpTI8srRIYOW5j7qlrEiLcINJvXaK10xjyz3ANbGkl
uh/ieO4H2Yuf4IZn51Lm7xQhUfcHCVNOS2Or0s2zrhu4wI8UpJUIrcH56yQIoXis
isUj+u0Yh4B7BMeBVYSOfV4omMO8NhBALqjpJBJ4frnh+1RZ0aeZKB0PWPafYYrc
UkYTFhgJIK8F7OpXUii69DxnOfDAmQ==
=Ls32
-----END PGP SIGNATURE-----

--Oiaj1dMwGdbo2z3S--


