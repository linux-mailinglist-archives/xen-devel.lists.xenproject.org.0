Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BA4E46FFB18
	for <lists+xen-devel@lfdr.de>; Thu, 11 May 2023 22:12:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.533590.830403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxCe9-0007t4-5a; Thu, 11 May 2023 20:12:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 533590.830403; Thu, 11 May 2023 20:12:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pxCe9-0007r2-2n; Thu, 11 May 2023 20:12:17 +0000
Received: by outflank-mailman (input) for mailman id 533590;
 Thu, 11 May 2023 20:12:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hqDu=BA=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1pxCe7-0007qw-Hv
 for xen-devel@lists.xenproject.org; Thu, 11 May 2023 20:12:15 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1dcc3142-f038-11ed-b229-6b7b168915f2;
 Thu, 11 May 2023 22:12:13 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-302-MgAbwRbGPoSDIs3I0ntU4g-1; Thu, 11 May 2023 16:12:07 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E91CB29DD9A1;
 Thu, 11 May 2023 20:12:06 +0000 (UTC)
Received: from localhost (unknown [10.39.194.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9072FC15BA0;
 Thu, 11 May 2023 20:12:05 +0000 (UTC)
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
X-Inumbo-ID: 1dcc3142-f038-11ed-b229-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683835932;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=T2V413X5+i82I8ibkxixPdg5TkN8XN0+FCl19AWIH/c=;
	b=QRh12wCp32nzI8mjp5Z2TWz64rT1/LF1FjWFoGSnLFddpF2IAKZTYzaVf1P4xlFrxGaiQk
	4Vr4yy3XX5vMN+vETUS8nNveV4odBfe/qmIdo+di4zLvD6XH8d3CRvXU3lsI1aJN7C/A4t
	Bote9QZzlaytpNl7sqIHOfQgqHRui5w=
X-MC-Unique: MgAbwRbGPoSDIs3I0ntU4g-1
Date: Wed, 10 May 2023 17:40:00 -0400
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
Subject: Re: [PATCH v4 16/20] virtio: make it possible to detach host
 notifier from any thread
Message-ID: <20230510214000.GC1287730@fedora>
References: <20230425172716.1033562-1-stefanha@redhat.com>
 <20230425172716.1033562-17-stefanha@redhat.com>
 <ZFQc89cFJuoGF+qI@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5oxBC66SYAo2b05z"
Content-Disposition: inline
In-Reply-To: <ZFQc89cFJuoGF+qI@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8


--5oxBC66SYAo2b05z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 04, 2023 at 11:00:35PM +0200, Kevin Wolf wrote:
> Am 25.04.2023 um 19:27 hat Stefan Hajnoczi geschrieben:
> > virtio_queue_aio_detach_host_notifier() does two things:
> > 1. It removes the fd handler from the event loop.
> > 2. It processes the virtqueue one last time.
> >=20
> > The first step can be peformed by any thread and without taking the
> > AioContext lock.
> >=20
> > The second step may need the AioContext lock (depending on the device
> > implementation) and runs in the thread where request processing takes
> > place. virtio-blk and virtio-scsi therefore call
> > virtio_queue_aio_detach_host_notifier() from a BH that is scheduled in
> > AioContext
> >=20
> > Scheduling a BH is undesirable for .drained_begin() functions. The next
> > patch will introduce a .drained_begin() function that needs to call
> > virtio_queue_aio_detach_host_notifier().
>=20
> Why is it undesirable? In my mental model, .drained_begin() is still
> free to start as many asynchronous things as it likes. The only
> important thing to take care of is that .drained_poll() returns true as
> long as the BH (or other asynchronous operation) is still pending.
>=20
> Of course, your way of doing things still seems to result in simpler
> code because you don't have to deal with a BH at all if you only really
> want the first part and not the second.

I have clarified this in the commit description. We can't wait
synchronously, but we could wait asynchronously as you described. It's
simpler to split the function instead of implementing async wait using
=2Edrained_poll().

>=20
> > Move the virtqueue processing out to the callers of
> > virtio_queue_aio_detach_host_notifier() so that the function can be
> > called from any thread. This is in preparation for the next patch.
>=20
> Did you forget to remove it in virtio_queue_aio_detach_host_notifier()?
> If it's unchanged, I don't think the AioContext requirement is lifted.

Yes! Thank you :)

>=20
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> >  hw/block/dataplane/virtio-blk.c | 2 ++
> >  hw/scsi/virtio-scsi-dataplane.c | 9 +++++++++
> >  2 files changed, 11 insertions(+)
> > diff --git a/hw/block/dataplane/virtio-blk.c b/hw/block/dataplane/virti=
o-blk.c
> > index b28d81737e..bd7cc6e76b 100644
> > --- a/hw/block/dataplane/virtio-blk.c
> > +++ b/hw/block/dataplane/virtio-blk.c
> > @@ -286,8 +286,10 @@ static void virtio_blk_data_plane_stop_bh(void *op=
aque)
> > =20
> >      for (i =3D 0; i < s->conf->num_queues; i++) {
> >          VirtQueue *vq =3D virtio_get_queue(s->vdev, i);
> > +        EventNotifier *host_notifier =3D virtio_queue_get_host_notifie=
r(vq);
> > =20
> >          virtio_queue_aio_detach_host_notifier(vq, s->ctx);
> > +        virtio_queue_host_notifier_read(host_notifier);
> >      }
> >  }
>=20
> The existing code in virtio_queue_aio_detach_host_notifier() has a
> comment before the read:
>=20
>     /* Test and clear notifier before after disabling event,
>      * in case poll callback didn't have time to run. */
>=20
> Do we want to keep it around in the new places? (And also fix the
> "before after", I suppose, or replace it with a similar, but better
> comment that explains why we're reading here.)

I will add the comment.

Stefan

--5oxBC66SYAo2b05z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmRcDzAACgkQnKSrs4Gr
c8i8mQf5AYxgNAuDvbOU1XvzA5Q6jeekOXOQm5LcsUhp7ukc76FAwjsIrpvmfZxR
8v6pkq1ReqvvojVK6qpC9HRB/WX94Ss+128FOa7TJ0pmD9jJHJbyHNEIg722GVk4
EdSE1Or7d97FsMOt5EqwJxQ8RtXgei/lpfyx4OhKXLLYQ+puTlrq8TW8O7wzBFDe
ZR9Sr8wDH9/yseUnOl17U6fJa9cUYroFGg6oZifWuTOPZAxwwgnryMOylwsknfUg
pSTtGXkph5Ugf+KOxdrG98eXR+MCiCs/DrnIUuy0RBf7jEqcqT4STNAqIVb8TJaa
gXzKpleSUOXubjuUJPcjpkQOP5ytMQ==
=8VSX
-----END PGP SIGNATURE-----

--5oxBC66SYAo2b05z--


