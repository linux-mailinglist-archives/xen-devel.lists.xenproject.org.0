Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3E0716A88
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 19:12:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541316.843952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q42t4-0006oK-JI; Tue, 30 May 2023 17:11:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541316.843952; Tue, 30 May 2023 17:11:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q42t4-0006mI-Gg; Tue, 30 May 2023 17:11:58 +0000
Received: by outflank-mailman (input) for mailman id 541316;
 Tue, 30 May 2023 17:11:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BJNG=BT=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1q42t3-0006mC-CV
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 17:11:57 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1362bc0f-ff0d-11ed-8611-37d641c3527e;
 Tue, 30 May 2023 19:11:55 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-631-dPfcO2s9MyOy4_j1vs0myg-1; Tue, 30 May 2023 13:11:50 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8340C38025FF;
 Tue, 30 May 2023 17:11:49 +0000 (UTC)
Received: from localhost (unknown [10.39.192.201])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F367FC154D2;
 Tue, 30 May 2023 17:11:48 +0000 (UTC)
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
X-Inumbo-ID: 1362bc0f-ff0d-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685466714;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=bmkH+iq/OmPHas9aSt5XErWUo4Wcii5lkj8crDV/n3g=;
	b=ZJv+NYpUa4iyMZZjIMCDWij5hLhsxc4hfxqWlyiwn7d0ss41ej/yiNbGRdOZ0XiPIYAvih
	gleicbcOm3a7EY/6wAu1ADzpjTiFQdrYrjYZ3l/6GYcTZMEqPOyW1aNStW1yFQPiEPvASj
	Ow/oKuVIKWJ2AXwkhJILBSfMqxuSSWI=
X-MC-Unique: dPfcO2s9MyOy4_j1vs0myg-1
Date: Tue, 30 May 2023 13:11:47 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Cc: qemu-devel@nongnu.org, Aarushi Mehta <mehta.aaru20@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Julia Suvorova <jusual@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paul Durrant <paul@xen.org>, Hanna Reitz <hreitz@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
	xen-devel@lists.xenproject.org, eblake@redhat.com,
	Anthony Perard <anthony.perard@citrix.com>, qemu-block@nongnu.org
Subject: Re: [PATCH v2 5/6] block/linux-aio: convert to blk_io_plug_call() API
Message-ID: <20230530171147.GA991054@fedora>
References: <20230523171300.132347-1-stefanha@redhat.com>
 <20230523171300.132347-6-stefanha@redhat.com>
 <n6hik7dbl26lomhxvfal2kjrq6jhdiknjepb372dvxavuwiw6q@3l3mo4eywoxq>
 <20230524193634.GB17357@fedora>
 <63lutuyufibun4jscbjjlshbqqw6otetzfi67rfnfrxacwutnj@igewwxh4uwys>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="E6/uC6M7CDHnrLPP"
Content-Disposition: inline
In-Reply-To: <63lutuyufibun4jscbjjlshbqqw6otetzfi67rfnfrxacwutnj@igewwxh4uwys>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8


--E6/uC6M7CDHnrLPP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 29, 2023 at 10:50:34AM +0200, Stefano Garzarella wrote:
> On Wed, May 24, 2023 at 03:36:34PM -0400, Stefan Hajnoczi wrote:
> > On Wed, May 24, 2023 at 10:52:03AM +0200, Stefano Garzarella wrote:
> > > On Tue, May 23, 2023 at 01:12:59PM -0400, Stefan Hajnoczi wrote:
> > > > Stop using the .bdrv_co_io_plug() API because it is not multi-queue
> > > > block layer friendly. Use the new blk_io_plug_call() API to batch I=
/O
> > > > submission instead.
> > > >
> > > > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > > > Reviewed-by: Eric Blake <eblake@redhat.com>
> > > > ---
> > > > include/block/raw-aio.h |  7 -------
> > > > block/file-posix.c      | 28 ----------------------------
> > > > block/linux-aio.c       | 41 +++++++++++---------------------------=
---
> > > > 3 files changed, 11 insertions(+), 65 deletions(-)
> > > >
> > > > diff --git a/include/block/raw-aio.h b/include/block/raw-aio.h
> > > > index da60ca13ef..0f63c2800c 100644
> > > > --- a/include/block/raw-aio.h
> > > > +++ b/include/block/raw-aio.h
> > > > @@ -62,13 +62,6 @@ int coroutine_fn laio_co_submit(int fd, uint64_t=
 offset, QEMUIOVector *qiov,
> > > >
> > > > void laio_detach_aio_context(LinuxAioState *s, AioContext *old_cont=
ext);
> > > > void laio_attach_aio_context(LinuxAioState *s, AioContext *new_cont=
ext);
> > > > -
> > > > -/*
> > > > - * laio_io_plug/unplug work in the thread's current AioContext, th=
erefore the
> > > > - * caller must ensure that they are paired in the same IOThread.
> > > > - */
> > > > -void laio_io_plug(void);
> > > > -void laio_io_unplug(uint64_t dev_max_batch);
> > > > #endif
> > > > /* io_uring.c - Linux io_uring implementation */
> > > > #ifdef CONFIG_LINUX_IO_URING
> > > > diff --git a/block/file-posix.c b/block/file-posix.c
> > > > index 7baa8491dd..ac1ed54811 100644
> > > > --- a/block/file-posix.c
> > > > +++ b/block/file-posix.c
> > > > @@ -2550,26 +2550,6 @@ static int coroutine_fn raw_co_pwritev(Block=
DriverState *bs, int64_t offset,
> > > >     return raw_co_prw(bs, offset, bytes, qiov, QEMU_AIO_WRITE);
> > > > }
> > > >
> > > > -static void coroutine_fn raw_co_io_plug(BlockDriverState *bs)
> > > > -{
> > > > -    BDRVRawState __attribute__((unused)) *s =3D bs->opaque;
> > > > -#ifdef CONFIG_LINUX_AIO
> > > > -    if (s->use_linux_aio) {
> > > > -        laio_io_plug();
> > > > -    }
> > > > -#endif
> > > > -}
> > > > -
> > > > -static void coroutine_fn raw_co_io_unplug(BlockDriverState *bs)
> > > > -{
> > > > -    BDRVRawState __attribute__((unused)) *s =3D bs->opaque;
> > > > -#ifdef CONFIG_LINUX_AIO
> > > > -    if (s->use_linux_aio) {
> > > > -        laio_io_unplug(s->aio_max_batch);
> > > > -    }
> > > > -#endif
> > > > -}
> > > > -
> > > > static int coroutine_fn raw_co_flush_to_disk(BlockDriverState *bs)
> > > > {
> > > >     BDRVRawState *s =3D bs->opaque;
> > > > @@ -3914,8 +3894,6 @@ BlockDriver bdrv_file =3D {
> > > >     .bdrv_co_copy_range_from =3D raw_co_copy_range_from,
> > > >     .bdrv_co_copy_range_to  =3D raw_co_copy_range_to,
> > > >     .bdrv_refresh_limits =3D raw_refresh_limits,
> > > > -    .bdrv_co_io_plug        =3D raw_co_io_plug,
> > > > -    .bdrv_co_io_unplug      =3D raw_co_io_unplug,
> > > >     .bdrv_attach_aio_context =3D raw_aio_attach_aio_context,
> > > >
> > > >     .bdrv_co_truncate                   =3D raw_co_truncate,
> > > > @@ -4286,8 +4264,6 @@ static BlockDriver bdrv_host_device =3D {
> > > >     .bdrv_co_copy_range_from =3D raw_co_copy_range_from,
> > > >     .bdrv_co_copy_range_to  =3D raw_co_copy_range_to,
> > > >     .bdrv_refresh_limits =3D raw_refresh_limits,
> > > > -    .bdrv_co_io_plug        =3D raw_co_io_plug,
> > > > -    .bdrv_co_io_unplug      =3D raw_co_io_unplug,
> > > >     .bdrv_attach_aio_context =3D raw_aio_attach_aio_context,
> > > >
> > > >     .bdrv_co_truncate                   =3D raw_co_truncate,
> > > > @@ -4424,8 +4400,6 @@ static BlockDriver bdrv_host_cdrom =3D {
> > > >     .bdrv_co_pwritev        =3D raw_co_pwritev,
> > > >     .bdrv_co_flush_to_disk  =3D raw_co_flush_to_disk,
> > > >     .bdrv_refresh_limits    =3D cdrom_refresh_limits,
> > > > -    .bdrv_co_io_plug        =3D raw_co_io_plug,
> > > > -    .bdrv_co_io_unplug      =3D raw_co_io_unplug,
> > > >     .bdrv_attach_aio_context =3D raw_aio_attach_aio_context,
> > > >
> > > >     .bdrv_co_truncate                   =3D raw_co_truncate,
> > > > @@ -4552,8 +4526,6 @@ static BlockDriver bdrv_host_cdrom =3D {
> > > >     .bdrv_co_pwritev        =3D raw_co_pwritev,
> > > >     .bdrv_co_flush_to_disk  =3D raw_co_flush_to_disk,
> > > >     .bdrv_refresh_limits    =3D cdrom_refresh_limits,
> > > > -    .bdrv_co_io_plug        =3D raw_co_io_plug,
> > > > -    .bdrv_co_io_unplug      =3D raw_co_io_unplug,
> > > >     .bdrv_attach_aio_context =3D raw_aio_attach_aio_context,
> > > >
> > > >     .bdrv_co_truncate                   =3D raw_co_truncate,
> > > > diff --git a/block/linux-aio.c b/block/linux-aio.c
> > > > index 442c86209b..5021aed68f 100644
> > > > --- a/block/linux-aio.c
> > > > +++ b/block/linux-aio.c
> > > > @@ -15,6 +15,7 @@
> > > > #include "qemu/event_notifier.h"
> > > > #include "qemu/coroutine.h"
> > > > #include "qapi/error.h"
> > > > +#include "sysemu/block-backend.h"
> > > >
> > > > /* Only used for assertions.  */
> > > > #include "qemu/coroutine_int.h"
> > > > @@ -46,7 +47,6 @@ struct qemu_laiocb {
> > > > };
> > > >
> > > > typedef struct {
> > > > -    int plugged;
> > > >     unsigned int in_queue;
> > > >     unsigned int in_flight;
> > > >     bool blocked;
> > > > @@ -236,7 +236,7 @@ static void qemu_laio_process_completions_and_s=
ubmit(LinuxAioState *s)
> > > > {
> > > >     qemu_laio_process_completions(s);
> > > >
> > > > -    if (!s->io_q.plugged && !QSIMPLEQ_EMPTY(&s->io_q.pending)) {
> > > > +    if (!QSIMPLEQ_EMPTY(&s->io_q.pending)) {
> > > >         ioq_submit(s);
> > > >     }
> > > > }
> > > > @@ -277,7 +277,6 @@ static void qemu_laio_poll_ready(EventNotifier =
*opaque)
> > > > static void ioq_init(LaioQueue *io_q)
> > > > {
> > > >     QSIMPLEQ_INIT(&io_q->pending);
> > > > -    io_q->plugged =3D 0;
> > > >     io_q->in_queue =3D 0;
> > > >     io_q->in_flight =3D 0;
> > > >     io_q->blocked =3D false;
> > > > @@ -354,31 +353,11 @@ static uint64_t laio_max_batch(LinuxAioState =
*s, uint64_t dev_max_batch)
> > > >     return max_batch;
> > > > }
> > > >
> > > > -void laio_io_plug(void)
> > > > +static void laio_unplug_fn(void *opaque)
> > > > {
> > > > -    AioContext *ctx =3D qemu_get_current_aio_context();
> > > > -    LinuxAioState *s =3D aio_get_linux_aio(ctx);
> > > > +    LinuxAioState *s =3D opaque;
> > > >
> > > > -    s->io_q.plugged++;
> > > > -}
> > > > -
> > > > -void laio_io_unplug(uint64_t dev_max_batch)
> > > > -{
> > > > -    AioContext *ctx =3D qemu_get_current_aio_context();
> > > > -    LinuxAioState *s =3D aio_get_linux_aio(ctx);
> > > > -
> > > > -    assert(s->io_q.plugged);
> > > > -    s->io_q.plugged--;
> > > > -
> > > > -    /*
> > > > -     * Why max batch checking is performed here:
> > > > -     * Another BDS may have queued requests with a higher dev_max_=
batch and
> > > > -     * therefore in_queue could now exceed our dev_max_batch. Re-c=
heck the max
> > > > -     * batch so we can honor our device's dev_max_batch.
> > > > -     */
> > > > -    if (s->io_q.in_queue >=3D laio_max_batch(s, dev_max_batch) ||
> > >=20
> > > Why are we removing this condition?
> > > Could the same situation occur with the new API?
> >=20
> > The semantics of unplug_fn() are different from .bdrv_co_unplug():
> > 1. unplug_fn() is only called when the last blk_io_unplug() call occurs,
> >   not every time blk_io_unplug() is called.
> > 2. unplug_fn() is per-thread, not per-BlockDriverState, so there is no
> >   way to get per-BlockDriverState fields like dev_max_batch.
> >=20
> > Therefore this condition cannot be moved to laio_unplug_fn().
>=20
> I see now.
>=20
> >=20
> > How important is this condition? I believe that dropping it does not
> > have much of an effect but maybe I missed something.
>=20
> With Kevin we agreed to add it to avoid extra latency in some devices,
> but we didn't do much testing on this.
>=20
> IIRC what solved the performance degradation was the check in
> laio_do_submit() that we still have after this changes.
>=20
> So it may not have much effect, but maybe it's worth mentioning in
> the commit description.

I'll update the commit description.

> >=20
> > Also, does it make sense to define per-BlockDriverState batching limits
> > when the AIO engine (Linux AIO or io_uring) is thread-local and shared
> > between all BlockDriverStates? I believe the fundamental reason (that we
> > discovered later) why dev_max_batch is effective is because the Linux
> > kernel processes 32 I/O request submissions at a time. Anything above 32
> > adds latency without a batching benefit.
>=20
> This is a good point, maybe we should confirm it with some tests though.

Yes, I would benchmark it. Also, switching to per-thread max_batch
involves a command-line interface change and we still need to keep
aio-max-batch for compatibility for some time, so it's not urgent.

Stefan

--E6/uC6M7CDHnrLPP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmR2LlMACgkQnKSrs4Gr
c8h/Ggf7B7c65EZOrTNGL/839KEM85T6s0FUc1sNOCzsZju0RUmP/RLa23pmgTLW
RftvkboiCIe370CmfeiDz98h7g9BE2QFqNIrztwxbq2SK3AC8N48lUCS0Ssn0ZgA
Xtt6Qr9hiMBGBYmucYTp3SX7bw+eity223jOvhru/HRBUb9bvFq60fSwE8q5bTwT
rWIAfW8HKeC/z9Kqb8hgtgpIQc3hxRP/B9LpwTRnAWy/0JPFgY0eHf0E7wtiAbKp
9InSWGn55VQeAZDIqhgrDf3dSdcPYRMRq4UF9gU3hMvjVnCGZ/5KJk9VyZASenVS
wzOd5uBnaXVA42cN7HLszt7UgwGr0A==
=+o/P
-----END PGP SIGNATURE-----

--E6/uC6M7CDHnrLPP--


