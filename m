Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6F246BC6E
	for <lists+xen-devel@lfdr.de>; Tue,  7 Dec 2021 14:24:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.241091.417922 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muaSV-0004OM-Bu; Tue, 07 Dec 2021 13:24:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 241091.417922; Tue, 07 Dec 2021 13:24:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muaSV-0004LQ-8c; Tue, 07 Dec 2021 13:24:39 +0000
Received: by outflank-mailman (input) for mailman id 241091;
 Tue, 07 Dec 2021 13:24:37 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=5Kpq=QY=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1muaST-0004L1-OU
 for xen-devel@lists.xenproject.org; Tue, 07 Dec 2021 13:24:37 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 04fe7926-5761-11ec-a831-37629979565c;
 Tue, 07 Dec 2021 14:24:35 +0100 (CET)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-85-pq0CVYb0N9-a5LHy6DfeXw-1; Tue, 07 Dec 2021 08:24:31 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 35D621B2C981;
 Tue,  7 Dec 2021 13:24:29 +0000 (UTC)
Received: from localhost (unknown [10.39.194.90])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3765276612;
 Tue,  7 Dec 2021 13:23:37 +0000 (UTC)
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
X-Inumbo-ID: 04fe7926-5761-11ec-a831-37629979565c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1638883474;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=r2isEaCd6xk+f4LxeTB/xnxK27KBL9Gzn5hEP87ohGk=;
	b=K9Kw4gYbiqKvwaxtXtLmibEbGmcL02Rkgllho55+fvcLfhh1hRquX+6SL7y3Tgf98cGeW2
	worgxb943zmHilFavZldmtgfDOa5eYz8sXDJT5mh6g3STN3VlMLqbd7HXN3bUlLWkJ/2qI
	P8bRcKpwUEQlDQr5h7txQATRYwiBwZc=
X-MC-Unique: pq0CVYb0N9-a5LHy6DfeXw-1
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Julia Suvorova <jusual@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	xen-devel@lists.xenproject.org,
	Aarushi Mehta <mehta.aaru20@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Coiby Xu <Coiby.Xu@gmail.com>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	qemu-block@nongnu.org,
	Fam Zheng <fam@euphon.net>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Paul Durrant <paul@xen.org>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Peter Lieven <pl@kamp.de>
Subject: [PATCH v3 0/6] aio-posix: split poll check from ready handler
Date: Tue,  7 Dec 2021 13:23:30 +0000
Message-Id: <20211207132336.36627-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

v3:=0D
- Fixed FUSE export aio_set_fd_handler() call that I missed and double-chec=
ked=0D
  for any other missing call sites using Coccinelle [Rich]=0D
v2:=0D
- Cleaned up unused return values in nvme and virtio-blk [Stefano]=0D
- Documented try_poll_mode() ready_list argument [Stefano]=0D
- Unified virtio-blk/scsi dataplane and non-dataplane virtqueue handlers [S=
tefano]=0D
=0D
The first patch improves AioContext's adaptive polling execution time=0D
measurement. This can result in better performance because the algorithm ma=
kes=0D
better decisions about when to poll versus when to fall back to file descri=
ptor=0D
monitoring.=0D
=0D
The remaining patches unify the virtio-blk and virtio-scsi dataplane and=0D
non-dataplane virtqueue handlers. This became possible because the dataplan=
e=0D
handler function now has the same function signature as the non-dataplane=
=0D
handler function. Stefano Garzarella prompted me to make this refactoring.=
=0D
=0D
Stefan Hajnoczi (6):=0D
  aio-posix: split poll check from ready handler=0D
  virtio: get rid of VirtIOHandleAIOOutput=0D
  virtio-blk: drop unused virtio_blk_handle_vq() return value=0D
  virtio-scsi: prepare virtio_scsi_handle_cmd for dataplane=0D
  virtio: use ->handle_output() instead of ->handle_aio_output()=0D
  virtio: unify dataplane and non-dataplane ->handle_output()=0D
=0D
 include/block/aio.h             |  4 +-=0D
 include/hw/virtio/virtio-blk.h  |  2 +-=0D
 include/hw/virtio/virtio.h      |  5 +-=0D
 util/aio-posix.h                |  1 +=0D
 block/curl.c                    | 11 ++--=0D
 block/export/fuse.c             |  4 +-=0D
 block/io_uring.c                | 19 ++++---=0D
 block/iscsi.c                   |  4 +-=0D
 block/linux-aio.c               | 16 +++---=0D
 block/nfs.c                     |  6 +--=0D
 block/nvme.c                    | 51 ++++++++++++-------=0D
 block/ssh.c                     |  4 +-=0D
 block/win32-aio.c               |  4 +-=0D
 hw/block/dataplane/virtio-blk.c | 16 +-----=0D
 hw/block/virtio-blk.c           | 14 ++----=0D
 hw/scsi/virtio-scsi-dataplane.c | 60 +++-------------------=0D
 hw/scsi/virtio-scsi.c           |  2 +-=0D
 hw/virtio/virtio.c              | 73 +++++++++------------------=0D
 hw/xen/xen-bus.c                |  6 +--=0D
 io/channel-command.c            |  6 ++-=0D
 io/channel-file.c               |  3 +-=0D
 io/channel-socket.c             |  3 +-=0D
 migration/rdma.c                |  8 +--=0D
 tests/unit/test-aio.c           |  4 +-=0D
 util/aio-posix.c                | 89 +++++++++++++++++++++++++--------=0D
 util/aio-win32.c                |  4 +-=0D
 util/async.c                    | 10 +++-=0D
 util/main-loop.c                |  4 +-=0D
 util/qemu-coroutine-io.c        |  5 +-=0D
 util/vhost-user-server.c        | 11 ++--=0D
 30 files changed, 219 insertions(+), 230 deletions(-)=0D
=0D
--=20=0D
2.33.1=0D
=0D


