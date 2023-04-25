Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD416EE5BB
	for <lists+xen-devel@lfdr.de>; Tue, 25 Apr 2023 18:29:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526138.817641 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prLXp-0006YK-UZ; Tue, 25 Apr 2023 16:29:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526138.817641; Tue, 25 Apr 2023 16:29:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prLXp-0006VJ-RC; Tue, 25 Apr 2023 16:29:33 +0000
Received: by outflank-mailman (input) for mailman id 526138;
 Tue, 25 Apr 2023 16:29:33 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7Bb6=AQ=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1prLXp-0006VD-5Z
 for xen-devel@lists.xenproject.org; Tue, 25 Apr 2023 16:29:33 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 5a9a9ab9-e386-11ed-b223-6b7b168915f2;
 Tue, 25 Apr 2023 18:29:31 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-111-R8bTjhhCPLi9WY5oOQOfhw-1; Tue, 25 Apr 2023 12:29:27 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 225DF185A790;
 Tue, 25 Apr 2023 16:29:26 +0000 (UTC)
Received: from localhost (unknown [10.39.193.242])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 562ACC15BA0;
 Tue, 25 Apr 2023 16:29:24 +0000 (UTC)
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
X-Inumbo-ID: 5a9a9ab9-e386-11ed-b223-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1682440170;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=42lP/ytKQA/eCGkNRdBo0J2DfrHW7Ye9O5dUPefMkOg=;
	b=hvU607e+l1zQvvJL7Vl099u/mVJ5Pjx+LZ2ifsEsgrcRKM5zNZLPn7yr7fljpbzXtIVhET
	WjsDxjV95dypPPEo12NbeGt8EjynlU2EgI5ZLE/11J0bT6LY/HYuLpw0KS8awg3MULYjHn
	M+VcrYcPHDl2KdnOHifD7lT7p5jxC+I=
X-MC-Unique: R8bTjhhCPLi9WY5oOQOfhw-1
Date: Tue, 25 Apr 2023 12:29:22 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Peter Lieven <pl@kamp.de>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	Xie Yongji <xieyongji@bytedance.com>,
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
Subject: Re: [PATCH v3 00/20] block: remove aio_disable_external() API
Message-ID: <20230425162922.GA725672@fedora>
References: <20230420113732.336620-1-stefanha@redhat.com>
 <1e1f3a54-7113-7929-38a1-23d97bfa4d45@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lTQFmEIU0pfkRcw9"
Content-Disposition: inline
In-Reply-To: <1e1f3a54-7113-7929-38a1-23d97bfa4d45@linaro.org>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8


--lTQFmEIU0pfkRcw9
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 20, 2023 at 03:39:59PM +0200, Philippe Mathieu-Daud=E9 wrote:
> Hi Stefan,
>=20
> On 20/4/23 13:37, Stefan Hajnoczi wrote:
> > v3:
> > - Resend full patch series. v2 was sent in the middle of a git rebase a=
nd was
> >    missing patches. [Eric]
> > - Apply Reviewed-by tags.
>=20
> > Based-on: 087bc644b7634436ca9d52fe58ba9234e2bef026 (kevin/block-next)
>=20
> It seems kevin/block-next got rebased and doesn't contain 087bc644b76.
>=20
> Based on 3d1ba50c4b ("vmdk: make vmdk_is_cid_valid a coroutine_fn")
> I get:
>=20
> Applying: hw/qdev: introduce qdev_is_realized() helper
> Applying: virtio-scsi: avoid race between unplug and transport event
> Applying: virtio-scsi: stop using aio_disable_external() during unplug
> Applying: block/export: only acquire AioContext once for
> vhost_user_server_stop()
> error: patch failed: util/vhost-user-server.c:346
> error: util/vhost-user-server.c: patch does not apply
> Patch failed at 0004 block/export: only acquire AioContext once for
> vhost_user_server_stop()
>=20
> Hmm patch #4 is already merged as commit 2957dc40a2, let's skip it:
>=20
> $ git am --skip
> Applying: util/vhost-user-server: rename refcount to in_flight counter
> Applying: block/export: wait for vhost-user-blk requests when draining
> Applying: block/export: stop using is_external in vhost-user-blk server
> Applying: hw/xen: do not use aio_set_fd_handler(is_external=3Dtrue) in
> xen_xenstore
> Applying: block: add blk_in_drain() API
> Applying: block: drain from main loop thread in bdrv_co_yield_to_drain()
> Applying: xen-block: implement BlockDevOps->drained_begin()
> Applying: hw/xen: do not set is_external=3Dtrue on evtchn fds
> Applying: block/export: rewrite vduse-blk drain code
> Applying: block/export: don't require AioContext lock around
> blk_exp_ref/unref()
> Applying: block/fuse: do not set is_external=3Dtrue on FUSE fd
> Applying: virtio: make it possible to detach host notifier from any thread
> Applying: virtio-blk: implement BlockDevOps->drained_begin()
> Applying: virtio-scsi: implement BlockDevOps->drained_begin()
> Applying: virtio: do not set is_external=3Dtrue on host notifiers
> Applying: aio: remove aio_disable_external() API
> error: patch failed: util/fdmon-epoll.c:131
> error: util/fdmon-epoll.c: patch does not apply
> Patch failed at 0020 aio: remove aio_disable_external() API
>=20
> Now this clashes with commit e62da98527 ("aio-posix: fix race between epo=
ll
> upgrade and aio_set_fd_handler()").
>=20
> Indeed reverting both e62da98527 / 2957dc40a2, I can apply your
> series.

Thanks, I will rebase to origin/master now to make this patch series
easier to merge.

Stefan

--lTQFmEIU0pfkRcw9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmRH/+IACgkQnKSrs4Gr
c8iYggf/b4293BgOm1R5DDER4USW/3OSKh2P4LwY7cqAodChEJo2dbRViaYECV2Q
bSxEGgsjB6wPdZYKwNFWfPiBpVQswZHeF0JDoupXILM4ZnsMtOXuhQKCIREPvPcj
nwMdkECDC6G/aIyzybY4xHV4lYoUvv61OlvEzuG5p+6jmyiUIB7WYwftBdG0Vfsy
eo5110kPiYRdcAlMsL7QpgS01WT9DBCSw98NhH0x0dWLBYlgkgGhP7GRnIMfriFc
o+v31v9eCHe7J1wvvqdbniWgas9xqxzQyyLhXcvbVffHlUftAZ2KL/fhYIXyRwtk
vl3prMrg4+6AVRr5K4a+zoJ8eK8ETg==
=cT+E
-----END PGP SIGNATURE-----

--lTQFmEIU0pfkRcw9--


