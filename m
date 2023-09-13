Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4DA79F245
	for <lists+xen-devel@lfdr.de>; Wed, 13 Sep 2023 21:41:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.601537.937559 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgViX-0002vv-PL; Wed, 13 Sep 2023 19:40:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 601537.937559; Wed, 13 Sep 2023 19:40:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgViX-0002tl-Kk; Wed, 13 Sep 2023 19:40:05 +0000
Received: by outflank-mailman (input) for mailman id 601537;
 Wed, 13 Sep 2023 19:40:04 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KJQj=E5=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1qgViW-0002L0-3R
 for xen-devel@lists.xenproject.org; Wed, 13 Sep 2023 19:40:04 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 52e60c16-526d-11ee-9b0d-b553b5be7939;
 Wed, 13 Sep 2023 21:40:00 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-688-ChcbR3hJOZ-Ea6N80BKXWA-1; Wed, 13 Sep 2023 15:39:55 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CA548185A790;
 Wed, 13 Sep 2023 19:39:54 +0000 (UTC)
Received: from localhost (unknown [10.39.192.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 044F12156721;
 Wed, 13 Sep 2023 19:39:53 +0000 (UTC)
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
X-Inumbo-ID: 52e60c16-526d-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694633998;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=76/ewL4c7/k1SZpXhmL+Sg/xYYAmvWTOVxC4Gwpe93c=;
	b=D4g5yeG5aeqEM0gMXaIlJNS+ODFtDPFwx/ryvj5vQpGdeahIM7h90isnI6YlWFOo5AbRZo
	p/cWqXqj6TrCg3HCeQuYmRh15J9LF0omHehVtYJuIRr7xKOlLxt0kOCrClItnQTrKlSvDy
	UTWs9MY54qirUae9T7mjZWBnuPjoQP4=
X-MC-Unique: ChcbR3hJOZ-Ea6N80BKXWA-1
Date: Wed, 13 Sep 2023 15:39:52 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org,
	Fam Zheng <fam@euphon.net>, xen-devel@lists.xenproject.org,
	Anthony Perard <anthony.perard@citrix.com>,
	Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
	Julia Suvorova <jusual@redhat.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Aarushi Mehta <mehta.aaru20@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paul Durrant <paul@xen.org>, Ilya Maximets <i.maximets@ovn.org>
Subject: Re: [PATCH v2 2/4] util/defer-call: move defer_call() to util/
Message-ID: <20230913193952.GA917540@fedora>
References: <20230817155847.3605115-1-stefanha@redhat.com>
 <20230817155847.3605115-3-stefanha@redhat.com>
 <5ad95579-f8f3-2926-dd37-bd84151f10ac@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lyQbDpdO8ddpDhX4"
Content-Disposition: inline
In-Reply-To: <5ad95579-f8f3-2926-dd37-bd84151f10ac@linaro.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6


--lyQbDpdO8ddpDhX4
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 18, 2023 at 10:31:40AM +0200, Philippe Mathieu-Daud=E9 wrote:
> Hi Stefan,
>=20
> On 17/8/23 17:58, Stefan Hajnoczi wrote:
> > The networking subsystem may wish to use defer_call(), so move the code
> > to util/ where it can be reused.
> >=20
> > As a reminder of what defer_call() does:
> >=20
> > This API defers a function call within a defer_call_begin()/defer_call_=
end()
> > section, allowing multiple calls to batch up. This is a performance
> > optimization that is used in the block layer to submit several I/O requ=
ests
> > at once instead of individually:
> >=20
> >    defer_call_begin(); <-- start of section
> >    ...
> >    defer_call(my_func, my_obj); <-- deferred my_func(my_obj) call
> >    defer_call(my_func, my_obj); <-- another
> >    defer_call(my_func, my_obj); <-- another
> >    ...
> >    defer_call_end(); <-- end of section, my_func(my_obj) is called once
> >=20
> > Suggested-by: Ilya Maximets <i.maximets@ovn.org>
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> >   MAINTAINERS                       |  3 ++-
> >   include/qemu/defer-call.h         | 15 +++++++++++++++
> >   include/sysemu/block-backend-io.h |  4 ----
> >   block/blkio.c                     |  1 +
> >   block/io_uring.c                  |  1 +
> >   block/linux-aio.c                 |  1 +
> >   block/nvme.c                      |  1 +
> >   hw/block/dataplane/xen-block.c    |  1 +
> >   hw/block/virtio-blk.c             |  1 +
> >   hw/scsi/virtio-scsi.c             |  1 +
> >   block/plug.c =3D> util/defer-call.c |  2 +-
> >   block/meson.build                 |  1 -
> >   util/meson.build                  |  1 +
> >   13 files changed, 26 insertions(+), 7 deletions(-)
> >   create mode 100644 include/qemu/defer-call.h
> >   rename block/plug.c =3D> util/defer-call.c (99%)
> >=20
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 6111b6b4d9..7cd7132ffc 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -2676,12 +2676,13 @@ S: Supported
> >   F: util/async.c
> >   F: util/aio-*.c
> >   F: util/aio-*.h
> > +F: util/defer-call.c
>=20
> If used by network/other backends, maybe worth adding a
> brand new section instead, rather than "Block I/O path".

Changes to defer-call.c will go through my block tree. We don't split
out the event loop (async.c, aio-*.c, etc) either even though it's
shared by other subsystems. The important thing is that
scripts/get_maintainer.pl identifies the maintainers.

I'd rather not create lots of micro-subsystems in MAINTAINERS that
duplicate my email and block git repo URL.

>=20
> >   F: util/fdmon-*.c
> >   F: block/io.c
> > -F: block/plug.c
> >   F: migration/block*
> >   F: include/block/aio.h
> >   F: include/block/aio-wait.h
> > +F: include/qemu/defer-call.h
> >   F: scripts/qemugdb/aio.py
> >   F: tests/unit/test-fdmon-epoll.c
> >   T: git https://github.com/stefanha/qemu.git block
> > diff --git a/include/qemu/defer-call.h b/include/qemu/defer-call.h
> > new file mode 100644
> > index 0000000000..291f86c987
> > --- /dev/null
> > +++ b/include/qemu/defer-call.h
> > @@ -0,0 +1,15 @@
> > +/* SPDX-License-Identifier: GPL-2.0-or-later */
> > +/*
> > + * Deferred calls
> > + *
> > + * Copyright Red Hat.
> > + */
> > +
> > +#ifndef QEMU_DEFER_CALL_H
> > +#define QEMU_DEFER_CALL_H
> > +
>=20
> Please add smth like:
>=20
>    /* See documentation in util/defer-call.c */

Sure, will fix.

>=20
> > +void defer_call_begin(void);
> > +void defer_call_end(void);
> > +void defer_call(void (*fn)(void *), void *opaque);
> > +
> > +#endif /* QEMU_DEFER_CALL_H */
>=20
> Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@linaro.org>
>=20

--lyQbDpdO8ddpDhX4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmUCEAgACgkQnKSrs4Gr
c8hAmgf9E2O/DQNWurhzEXWw4NoN8tFv+RFmdKRjgSWppte+VSUZO46QaWB4y6/C
B1LwPQTljnRoxfLeThTaVcryoGp74Bpt9KmA6X1/0WIz+eQBV7EpEGZtYfgJVaPI
idS4XylvuP7bW34HjBT8dnRo/femAuCiheV/cK/mXu/w1N2pnqmRL3wwsjjh9uh+
msGLG3NbFr+GoJDX/XyogX+em9DiNZeiKNKs1b6VIqOxQIYKV/Tm9lh/ujDjwtu+
whUB+602U4J1IHG46NOfPYrt3jskfKbduRBn4za/lyFB7UHv/a1HeshAIIkrDDsK
fWnDKU89QGtDJT7heQeFsu8ek/TJZQ==
=qWcW
-----END PGP SIGNATURE-----

--lyQbDpdO8ddpDhX4--


