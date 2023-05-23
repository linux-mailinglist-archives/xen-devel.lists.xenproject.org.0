Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A07C570E0D7
	for <lists+xen-devel@lfdr.de>; Tue, 23 May 2023 17:47:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.538521.838507 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1UEM-0005pj-34; Tue, 23 May 2023 15:47:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 538521.838507; Tue, 23 May 2023 15:47:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q1UEM-0005n1-0L; Tue, 23 May 2023 15:47:22 +0000
Received: by outflank-mailman (input) for mailman id 538521;
 Tue, 23 May 2023 15:47:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YZ9c=BM=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1q1UEJ-0005mv-Sr
 for xen-devel@lists.xenproject.org; Tue, 23 May 2023 15:47:20 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 18001ae8-f981-11ed-8611-37d641c3527e;
 Tue, 23 May 2023 17:47:17 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-66-SxXu0-qlNDqLb0_bLpXO-w-1; Tue, 23 May 2023 11:47:11 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1F1CE8039AD;
 Tue, 23 May 2023 15:47:11 +0000 (UTC)
Received: from localhost (unknown [10.39.195.107])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 14A2640C6CD7;
 Tue, 23 May 2023 15:47:09 +0000 (UTC)
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
X-Inumbo-ID: 18001ae8-f981-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1684856836;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=NbSCT8maNtke0NQg6LjoQCaLDrMfiYyIwfNxs+qRW+U=;
	b=D7YFJUnhURPQZO+wzaL4HlP3cN8Yl3gzaFka/Q6my6Cor6HxaVyHtfqmuc0KtB4ooDU2ba
	VgtkIyfy1QsJXnYRf9hBCIHr7c6URvZV3aBmzfGwanfKG8sH9ffm+Ivqz+KDqMTSo1afYG
	zzv1t4OGpWxdLJquU9k+0QxXKZ7NmgY=
X-MC-Unique: SxXu0-qlNDqLb0_bLpXO-w-1
Date: Tue, 23 May 2023 11:47:08 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: qemu-devel@nongnu.org, xen-devel@lists.xenproject.org,
	Julia Suvorova <jusual@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
	Paul Durrant <paul@xen.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Aarushi Mehta <mehta.aaru20@gmail.com>,
	Hanna Reitz <hreitz@redhat.com>
Subject: Re: [PATCH 1/6] block: add blk_io_plug_call() API
Message-ID: <20230523154708.GB96478@fedora>
References: <20230517221022.325091-1-stefanha@redhat.com>
 <20230517221022.325091-2-stefanha@redhat.com>
 <mzxjz4d3ab3sq6grwsle6wlacysh2uffz42ojpdze3hmqimbr5@fxgkad47nnim>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IMmHh1O73W2Mz05r"
Content-Disposition: inline
In-Reply-To: <mzxjz4d3ab3sq6grwsle6wlacysh2uffz42ojpdze3hmqimbr5@fxgkad47nnim>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2


--IMmHh1O73W2Mz05r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 19, 2023 at 10:45:57AM +0200, Stefano Garzarella wrote:
> On Wed, May 17, 2023 at 06:10:17PM -0400, Stefan Hajnoczi wrote:
> > Introduce a new API for thread-local blk_io_plug() that does not
> > traverse the block graph. The goal is to make blk_io_plug() multi-queue
> > friendly.
> >=20
> > Instead of having block drivers track whether or not we're in a plugged
> > section, provide an API that allows them to defer a function call until
> > we're unplugged: blk_io_plug_call(fn, opaque). If blk_io_plug_call() is
> > called multiple times with the same fn/opaque pair, then fn() is only
> > called once at the end of the function - resulting in batching.
> >=20
> > This patch introduces the API and changes blk_io_plug()/blk_io_unplug().
> > blk_io_plug()/blk_io_unplug() no longer require a BlockBackend argument
> > because the plug state is now thread-local.
> >=20
> > Later patches convert block drivers to blk_io_plug_call() and then we
> > can finally remove .bdrv_co_io_plug() once all block drivers have been
> > converted.
> >=20
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> > MAINTAINERS                       |   1 +
> > include/sysemu/block-backend-io.h |  13 +--
> > block/block-backend.c             |  22 -----
> > block/plug.c                      | 159 ++++++++++++++++++++++++++++++
> > hw/block/dataplane/xen-block.c    |   8 +-
> > hw/block/virtio-blk.c             |   4 +-
> > hw/scsi/virtio-scsi.c             |   6 +-
> > block/meson.build                 |   1 +
> > 8 files changed, 173 insertions(+), 41 deletions(-)
> > create mode 100644 block/plug.c
> >=20
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 50585117a0..574202295c 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -2644,6 +2644,7 @@ F: util/aio-*.c
> > F: util/aio-*.h
> > F: util/fdmon-*.c
> > F: block/io.c
> > +F: block/plug.c
> > F: migration/block*
> > F: include/block/aio.h
> > F: include/block/aio-wait.h
> > diff --git a/include/sysemu/block-backend-io.h b/include/sysemu/block-b=
ackend-io.h
> > index d62a7ee773..be4dcef59d 100644
> > --- a/include/sysemu/block-backend-io.h
> > +++ b/include/sysemu/block-backend-io.h
> > @@ -100,16 +100,9 @@ void blk_iostatus_set_err(BlockBackend *blk, int e=
rror);
> > int blk_get_max_iov(BlockBackend *blk);
> > int blk_get_max_hw_iov(BlockBackend *blk);
> >=20
> > -/*
> > - * blk_io_plug/unplug are thread-local operations. This means that mul=
tiple
> > - * IOThreads can simultaneously call plug/unplug, but the caller must =
ensure
> > - * that each unplug() is called in the same IOThread of the matching p=
lug().
> > - */
> > -void coroutine_fn blk_co_io_plug(BlockBackend *blk);
> > -void co_wrapper blk_io_plug(BlockBackend *blk);
> > -
> > -void coroutine_fn blk_co_io_unplug(BlockBackend *blk);
> > -void co_wrapper blk_io_unplug(BlockBackend *blk);
> > +void blk_io_plug(void);
> > +void blk_io_unplug(void);
> > +void blk_io_plug_call(void (*fn)(void *), void *opaque);
> >=20
> > AioContext *blk_get_aio_context(BlockBackend *blk);
> > BlockAcctStats *blk_get_stats(BlockBackend *blk);
> > diff --git a/block/block-backend.c b/block/block-backend.c
> > index ca537cd0ad..1f1d226ba6 100644
> > --- a/block/block-backend.c
> > +++ b/block/block-backend.c
> > @@ -2568,28 +2568,6 @@ void blk_add_insert_bs_notifier(BlockBackend *bl=
k, Notifier *notify)
> >     notifier_list_add(&blk->insert_bs_notifiers, notify);
> > }
> >=20
> > -void coroutine_fn blk_co_io_plug(BlockBackend *blk)
> > -{
> > -    BlockDriverState *bs =3D blk_bs(blk);
> > -    IO_CODE();
> > -    GRAPH_RDLOCK_GUARD();
> > -
> > -    if (bs) {
> > -        bdrv_co_io_plug(bs);
> > -    }
> > -}
> > -
> > -void coroutine_fn blk_co_io_unplug(BlockBackend *blk)
> > -{
> > -    BlockDriverState *bs =3D blk_bs(blk);
> > -    IO_CODE();
> > -    GRAPH_RDLOCK_GUARD();
> > -
> > -    if (bs) {
> > -        bdrv_co_io_unplug(bs);
> > -    }
> > -}
> > -
> > BlockAcctStats *blk_get_stats(BlockBackend *blk)
> > {
> >     IO_CODE();
> > diff --git a/block/plug.c b/block/plug.c
> > new file mode 100644
> > index 0000000000..6738a568ba
> > --- /dev/null
> > +++ b/block/plug.c
> > @@ -0,0 +1,159 @@
> > +/* SPDX-License-Identifier: GPL-2.0-or-later */
> > +/*
> > + * Block I/O plugging
> > + *
> > + * Copyright Red Hat.
> > + *
> > + * This API defers a function call within a blk_io_plug()/blk_io_unplu=
g()
> > + * section, allowing multiple calls to batch up. This is a performance
> > + * optimization that is used in the block layer to submit several I/O =
requests
> > + * at once instead of individually:
> > + *
> > + *   blk_io_plug(); <-- start of plugged region
> > + *   ...
> > + *   blk_io_plug_call(my_func, my_obj); <-- deferred my_func(my_obj) c=
all
> > + *   blk_io_plug_call(my_func, my_obj); <-- another
> > + *   blk_io_plug_call(my_func, my_obj); <-- another
> > + *   ...
> > + *   blk_io_unplug(); <-- end of plugged region, my_func(my_obj) is ca=
lled once
> > + *
> > + * This code is actually generic and not tied to the block layer. If a=
nother
> > + * subsystem needs this functionality, it could be renamed.
> > + */
> > +
> > +#include "qemu/osdep.h"
> > +#include "qemu/coroutine-tls.h"
> > +#include "qemu/notify.h"
> > +#include "qemu/thread.h"
> > +#include "sysemu/block-backend.h"
> > +
> > +/* A function call that has been deferred until unplug() */
> > +typedef struct {
> > +    void (*fn)(void *);
> > +    void *opaque;
> > +} UnplugFn;
> > +
> > +/* Per-thread state */
> > +typedef struct {
> > +    unsigned count;       /* how many times has plug() been called? */
> > +    GArray *unplug_fns;   /* functions to call at unplug time */
> > +} Plug;
> > +
> > +/* Use get_ptr_plug() to fetch this thread-local value */
> > +QEMU_DEFINE_STATIC_CO_TLS(Plug, plug);
> > +
> > +/* Called at thread cleanup time */
> > +static void blk_io_plug_atexit(Notifier *n, void *value)
> > +{
> > +    Plug *plug =3D get_ptr_plug();
> > +    g_array_free(plug->unplug_fns, TRUE);
> > +}
> > +
> > +/* This won't involve coroutines, so use __thread */
> > +static __thread Notifier blk_io_plug_atexit_notifier;
> > +
> > +/**
> > + * blk_io_plug_call:
> > + * @fn: a function pointer to be invoked
> > + * @opaque: a user-defined argument to @fn()
> > + *
> > + * Call @fn(@opaque) immediately if not within a blk_io_plug()/blk_io_=
unplug()
> > + * section.
>=20
> Just to understand better, what if two BlockDrivers share the same
> iothread but one calls blk_io_plug()/blk_io_unplug(), while the other
> calls this function not in a blk_io_plug()/blk_io_unplug() section?
>=20
> If the call is in the middle of the other BlockDriver's section, it is
> deferred, right?

Yes, the call is deferred until blk_io_unplug().

> Is this situation possible?

One scenario I can think of is when aio_poll() is called between
plug/unplug. In that case, some I/O associated with device B might
happen while device A is with plug/unplug.

> Or should we prevent blk_io_plug_call() from being called out of a
> blk_io_plug()/blk_io_unplug() section?

blk_io_plug_call() is called outside blk_io_plug()/blk_io_unplug() when
device emulation doesn't use plug/unplug. For example, IDE doesn't use
it but still calls down into the same Linux AIO or io_uring code that
invokes blk_io_plug_call(). This is why blk_io_plug_call() calls fn()
immediately when invoked outside plug/unplug.

Stefan

--IMmHh1O73W2Mz05r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmRs3/wACgkQnKSrs4Gr
c8gnMQgAw4yEMupKiX1brU9yWHDC6XCDoa4S8rVmoAMRaPx6lVyo7Czly5q2X5Do
dHWWXPts7lZpMttrxye8v6fupyADoE6kQC9kocucLL1HZdBLabIpQxCxB/tEGVzv
uGXtBsHOApqYGQQ5z4/VR3u5pVXW/GHCcJLxsEPptmRx4zDA9JNyf9d/CBZs2gaq
trm7E3o8rOPuTlbafOzTfGmgTYIGmFHHJzqmFbNdQwvakovTSOhLv5q/o2kRxEvm
3y1VV3vrmlQo3CwNzIJmU3iOyj38m3tKthfLpr0tXKMhRQsQfOXIKRvOCwjruZib
K8i7Fu810Z5RzMPkk8gXCRT6WST5GA==
=1bHM
-----END PGP SIGNATURE-----

--IMmHh1O73W2Mz05r--


