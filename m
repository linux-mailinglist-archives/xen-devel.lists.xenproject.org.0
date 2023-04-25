Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FF036EE5F2
	for <lists+xen-devel@lfdr.de>; Tue, 25 Apr 2023 18:43:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526158.817674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prLkl-0001ed-RE; Tue, 25 Apr 2023 16:42:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526158.817674; Tue, 25 Apr 2023 16:42:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prLkl-0001bi-NB; Tue, 25 Apr 2023 16:42:55 +0000
Received: by outflank-mailman (input) for mailman id 526158;
 Tue, 25 Apr 2023 16:42:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Bb6=AQ=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1prLkk-0001bc-DV
 for xen-devel@lists.xenproject.org; Tue, 25 Apr 2023 16:42:54 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 37c8516a-e388-11ed-8611-37d641c3527e;
 Tue, 25 Apr 2023 18:42:52 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-36-0_Np5WYHP7OPCu59TXqr_g-1; Tue, 25 Apr 2023 12:42:45 -0400
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1EC7F811E7B;
 Tue, 25 Apr 2023 16:42:44 +0000 (UTC)
Received: from localhost (unknown [10.39.193.242])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 14022492B03;
 Tue, 25 Apr 2023 16:42:42 +0000 (UTC)
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
X-Inumbo-ID: 37c8516a-e388-11ed-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682440970;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YU7EZWrc/q5d2oIlsofGQO2gCk+XKR8YPiDYAdpL+Z0=;
	b=dJQFApdILoFuhcQyq7J6uptySBD6w+VnziUOQAG8Tv9aKtWqWjvAGMxe4AlGKTBuVu3GKY
	oxxflVEAMQTCJFoHPqDjfysT1vMencROLGFdfQLS5Qu04oMA1Di90jf+fU/MRVbEOBxJmf
	jGjgg/8cFG3WTZOLGHIb4yHMEq1dtYg=
X-MC-Unique: 0_Np5WYHP7OPCu59TXqr_g-1
Date: Tue, 25 Apr 2023 12:42:41 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Yongji Xie <xieyongji@bytedance.com>
Cc: qemu devel list <qemu-devel@nongnu.org>, Peter Lieven <pl@kamp.de>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	Juan Quintela <quintela@redhat.com>, qemu-block@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>,
	Richard Henderson <richard.henderson@linaro.org>,
	David Woodhouse <dwmw2@infradead.org>, Stefan Weil <sw@weilnetz.de>,
	Fam Zheng <fam@euphon.net>, Julia Suvorova <jusual@redhat.com>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	xen-devel@lists.xenproject.org, Hanna Reitz <hreitz@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>, eesposit@redhat.com,
	Kevin Wolf <kwolf@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paul Durrant <paul@xen.org>, Aarushi Mehta <mehta.aaru20@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	Coiby Xu <Coiby.Xu@gmail.com>,
	Stefano Garzarella <sgarzare@redhat.com>
Subject: Re: [PATCH v3 13/20] block/export: rewrite vduse-blk drain code
Message-ID: <20230425164241.GC725672@fedora>
References: <20230420113732.336620-1-stefanha@redhat.com>
 <20230420113732.336620-14-stefanha@redhat.com>
 <CACycT3suSR+nYhe4z2zuocYsBBVSDBCE+614zT0jfDZCBRveaA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="taPYnWD+LbJQX+JL"
Content-Disposition: inline
In-Reply-To: <CACycT3suSR+nYhe4z2zuocYsBBVSDBCE+614zT0jfDZCBRveaA@mail.gmail.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10


--taPYnWD+LbJQX+JL
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 21, 2023 at 11:36:02AM +0800, Yongji Xie wrote:
> Hi Stefan,
>=20
> On Thu, Apr 20, 2023 at 7:39=E2=80=AFPM Stefan Hajnoczi <stefanha@redhat.=
com> wrote:
> >
> > vduse_blk_detach_ctx() waits for in-flight requests using
> > AIO_WAIT_WHILE(). This is not allowed according to a comment in
> > bdrv_set_aio_context_commit():
> >
> >   /*
> >    * Take the old AioContex when detaching it from bs.
> >    * At this point, new_context lock is already acquired, and we are now
> >    * also taking old_context. This is safe as long as bdrv_detach_aio_c=
ontext
> >    * does not call AIO_POLL_WHILE().
> >    */
> >
> > Use this opportunity to rewrite the drain code in vduse-blk:
> >
> > - Use the BlockExport refcount so that vduse_blk_exp_delete() is only
> >   called when there are no more requests in flight.
> >
> > - Implement .drained_poll() so in-flight request coroutines are stopped
> >   by the time .bdrv_detach_aio_context() is called.
> >
> > - Remove AIO_WAIT_WHILE() from vduse_blk_detach_ctx() to solve the
> >   .bdrv_detach_aio_context() constraint violation. It's no longer
> >   needed due to the previous changes.
> >
> > - Always handle the VDUSE file descriptor, even in drained sections. The
> >   VDUSE file descriptor doesn't submit I/O, so it's safe to handle it in
> >   drained sections. This ensures that the VDUSE kernel code gets a fast
> >   response.
> >
> > - Suspend virtqueue fd handlers in .drained_begin() and resume them in
> >   .drained_end(). This eliminates the need for the
> >   aio_set_fd_handler(is_external=3Dtrue) flag, which is being removed f=
rom
> >   QEMU.
> >
> > This is a long list but splitting it into individual commits would
> > probably lead to git bisect failures - the changes are all related.
> >
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> >  block/export/vduse-blk.c | 132 +++++++++++++++++++++++++++------------
> >  1 file changed, 93 insertions(+), 39 deletions(-)
> >
> > diff --git a/block/export/vduse-blk.c b/block/export/vduse-blk.c
> > index f7ae44e3ce..35dc8fcf45 100644
> > --- a/block/export/vduse-blk.c
> > +++ b/block/export/vduse-blk.c
> > @@ -31,7 +31,8 @@ typedef struct VduseBlkExport {
> >      VduseDev *dev;
> >      uint16_t num_queues;
> >      char *recon_file;
> > -    unsigned int inflight;
> > +    unsigned int inflight; /* atomic */
> > +    bool vqs_started;
> >  } VduseBlkExport;
> >
> >  typedef struct VduseBlkReq {
> > @@ -41,13 +42,24 @@ typedef struct VduseBlkReq {
> >
> >  static void vduse_blk_inflight_inc(VduseBlkExport *vblk_exp)
> >  {
> > -    vblk_exp->inflight++;
> > +    if (qatomic_fetch_inc(&vblk_exp->inflight) =3D=3D 0) {
>=20
> I wonder why we need to use atomic operations here.

The inflight counter is only modified by the vhost-user export thread,
but it may be read by another thread here:

  static bool vduse_blk_drained_poll(void *opaque)
  {
      BlockExport *exp =3D opaque;
      VduseBlkExport *vblk_exp =3D container_of(exp, VduseBlkExport, export=
);

      return qatomic_read(&vblk_exp->inflight) > 0;

BlockDevOps->drained_poll() calls are invoked when BlockDriverStates are
drained (e.g. blk_drain_all() and related APIs).

> > @@ -355,13 +410,12 @@ static void vduse_blk_exp_delete(BlockExport *exp)
> >      g_free(vblk_exp->handler.serial);
> >  }
> >
> > +/* Called with exp->ctx acquired */
> >  static void vduse_blk_exp_request_shutdown(BlockExport *exp)
> >  {
> >      VduseBlkExport *vblk_exp =3D container_of(exp, VduseBlkExport, exp=
ort);
> >
> > -    aio_context_acquire(vblk_exp->export.ctx);
> > -    vduse_blk_detach_ctx(vblk_exp);
> > -    aio_context_acquire(vblk_exp->export.ctx);
> > +    vduse_blk_stop_virtqueues(vblk_exp);
>=20
> Can we add a AIO_WAIT_WHILE() here? Then we don't need to
> increase/decrease the BlockExport refcount during I/O processing.

I don't think so because vduse_blk_exp_request_shutdown() is not the
only place where we wait for requests to complete. There would still
need to be away to wait for requests to finish (without calling
AIO_WAIT_WHILE()) in vduse_blk_drained_poll().

Stefan

--taPYnWD+LbJQX+JL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmRIAwEACgkQnKSrs4Gr
c8hhBggAqyQ3QbuCykGssGed+Wva5piRrv+slVXsp6pWuyvi67KwteSenyU8jyVK
0nAuF6fpgfMC44OAy/Cqt5JYbZg0883laglZxoFjJIJ52FvhtMCDOetwnVhjmkN7
U1CdvipfqjL7dKNx316HDrqikr28F8CBTMmgyLP9HLUEegIh1RpGyUyvE8G0FmXJ
cTYoJPC6PJZE1TNwJ0hlsUIsSvR+IL8s5JpqUPEiybpZAl5ro9a3O/4QnExGxsIl
cakAXaxPfK2wgbbbvDirQefgDT1nnexKs7hpMRMoci9FHPUyWv+V1OLNuakp0XMf
gUwutPZE/o7Yw4PJJiH8duPpAKz5wQ==
=rvpQ
-----END PGP SIGNATURE-----

--taPYnWD+LbJQX+JL--


