Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6560E473110
	for <lists+xen-devel@lfdr.de>; Mon, 13 Dec 2021 17:02:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.246225.424658 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwnlg-000280-I8; Mon, 13 Dec 2021 16:01:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 246225.424658; Mon, 13 Dec 2021 16:01:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwnlg-00025L-EZ; Mon, 13 Dec 2021 16:01:36 +0000
Received: by outflank-mailman (input) for mailman id 246225;
 Mon, 13 Dec 2021 16:01:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nyhA=Q6=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1mwnle-00025F-Ot
 for xen-devel@lists.xenproject.org; Mon, 13 Dec 2021 16:01:35 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f0606d78-5c2d-11ec-85d3-df6b77346a89;
 Mon, 13 Dec 2021 17:01:32 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-153-sg8h4fjDPAOo2S6CJo_5FA-1; Mon, 13 Dec 2021 11:01:28 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F30D3102C858;
 Mon, 13 Dec 2021 16:01:25 +0000 (UTC)
Received: from localhost (unknown [10.39.193.244])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 66ED57AB5B;
 Mon, 13 Dec 2021 16:01:24 +0000 (UTC)
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
X-Inumbo-ID: f0606d78-5c2d-11ec-85d3-df6b77346a89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1639411291;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ne7qoKfSxVoINZDLm3Ayt6jcoqtbCFcdhO3c1Ja29ko=;
	b=AjlHrdDe0yt9q06yDqQQNWQPiQvvWPYAdgKpWVfhzFWf3xWmimdIuDUm2zzk+KWophgPh4
	MmaJjYLMhjrSQ5ps+9XEej0yRj72LmEDcmN50HasSLNhMcWonpDE5JgyzbT3ZmQjZdhyco
	Ta9dPJ/eGnh5s/xEmFv2LitH3f2He7k=
X-MC-Unique: sg8h4fjDPAOo2S6CJo_5FA-1
Date: Mon, 13 Dec 2021 16:01:23 +0000
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Julia Suvorova <jusual@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Juan Quintela <quintela@redhat.com>, xen-devel@lists.xenproject.org,
	Aarushi Mehta <mehta.aaru20@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Coiby Xu <Coiby.Xu@gmail.com>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
	Fam Zheng <fam@euphon.net>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
	Paul Durrant <paul@xen.org>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Peter Lieven <pl@kamp.de>
Subject: Re: [PATCH v3 0/6] aio-posix: split poll check from ready handler
Message-ID: <YbduUxqibwDie3Vt@stefanha-x1.localdomain>
References: <20211207132336.36627-1-stefanha@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211207132336.36627-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Ax/RBNHfth0NNMo5"
Content-Disposition: inline

--Ax/RBNHfth0NNMo5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 07, 2021 at 01:23:30PM +0000, Stefan Hajnoczi wrote:
> v3:
> - Fixed FUSE export aio_set_fd_handler() call that I missed and double-ch=
ecked
>   for any other missing call sites using Coccinelle [Rich]
> v2:
> - Cleaned up unused return values in nvme and virtio-blk [Stefano]
> - Documented try_poll_mode() ready_list argument [Stefano]
> - Unified virtio-blk/scsi dataplane and non-dataplane virtqueue handlers =
[Stefano]
>=20
> The first patch improves AioContext's adaptive polling execution time
> measurement. This can result in better performance because the algorithm =
makes
> better decisions about when to poll versus when to fall back to file desc=
riptor
> monitoring.
>=20
> The remaining patches unify the virtio-blk and virtio-scsi dataplane and
> non-dataplane virtqueue handlers. This became possible because the datapl=
ane
> handler function now has the same function signature as the non-dataplane
> handler function. Stefano Garzarella prompted me to make this refactoring=
.
>=20
> Stefan Hajnoczi (6):
>   aio-posix: split poll check from ready handler
>   virtio: get rid of VirtIOHandleAIOOutput
>   virtio-blk: drop unused virtio_blk_handle_vq() return value
>   virtio-scsi: prepare virtio_scsi_handle_cmd for dataplane
>   virtio: use ->handle_output() instead of ->handle_aio_output()
>   virtio: unify dataplane and non-dataplane ->handle_output()
>=20
>  include/block/aio.h             |  4 +-
>  include/hw/virtio/virtio-blk.h  |  2 +-
>  include/hw/virtio/virtio.h      |  5 +-
>  util/aio-posix.h                |  1 +
>  block/curl.c                    | 11 ++--
>  block/export/fuse.c             |  4 +-
>  block/io_uring.c                | 19 ++++---
>  block/iscsi.c                   |  4 +-
>  block/linux-aio.c               | 16 +++---
>  block/nfs.c                     |  6 +--
>  block/nvme.c                    | 51 ++++++++++++-------
>  block/ssh.c                     |  4 +-
>  block/win32-aio.c               |  4 +-
>  hw/block/dataplane/virtio-blk.c | 16 +-----
>  hw/block/virtio-blk.c           | 14 ++----
>  hw/scsi/virtio-scsi-dataplane.c | 60 +++-------------------
>  hw/scsi/virtio-scsi.c           |  2 +-
>  hw/virtio/virtio.c              | 73 +++++++++------------------
>  hw/xen/xen-bus.c                |  6 +--
>  io/channel-command.c            |  6 ++-
>  io/channel-file.c               |  3 +-
>  io/channel-socket.c             |  3 +-
>  migration/rdma.c                |  8 +--
>  tests/unit/test-aio.c           |  4 +-
>  util/aio-posix.c                | 89 +++++++++++++++++++++++++--------
>  util/aio-win32.c                |  4 +-
>  util/async.c                    | 10 +++-
>  util/main-loop.c                |  4 +-
>  util/qemu-coroutine-io.c        |  5 +-
>  util/vhost-user-server.c        | 11 ++--
>  30 files changed, 219 insertions(+), 230 deletions(-)
>=20
> --=20
> 2.33.1
>=20
>=20

Thanks, applied to my block-next tree:
https://gitlab.com/stefanha/qemu/commits/block-next

Stefan

--Ax/RBNHfth0NNMo5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmG3blMACgkQnKSrs4Gr
c8iqcgf/dPRV3F1SsSIbqM0FdwEE60A00v6lVdZPUOkO7Q/WKqfO0bMBCh4j7cCt
/SeyrgrCLFH2cACI4jssYC+5EEvzNoxr/PUx3l+verGNr701uvth0z6T5IUkI5b3
r6Mmb+jeKlbW+K1L0AYA5Keo2eHVj9ci4Nt2+uFmXqRXkAwADUDNuYWHmY2IqMNs
T49i5IZyHwxO4wp0gKIA+jSpEvxhaQ8zabGWN+W/P8UtC1ZQ+Scu4fFekTOtV/zv
a4OBp6wfnbbEJ9MNbWFH/YkUSzx4ggq1xSu1kUvszLIQaEQFqBUhBoy9RJFelUnj
ov+bJByWyD5w7tXUU1Z6wdXJkghzJg==
=H9XI
-----END PGP SIGNATURE-----

--Ax/RBNHfth0NNMo5--


