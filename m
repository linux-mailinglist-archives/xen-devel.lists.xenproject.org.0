Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCF166D506A
	for <lists+xen-devel@lfdr.de>; Mon,  3 Apr 2023 20:31:10 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.517554.803083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjOwv-0005Zv-10; Mon, 03 Apr 2023 18:30:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 517554.803083; Mon, 03 Apr 2023 18:30:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pjOwu-0005Vk-Rh; Mon, 03 Apr 2023 18:30:36 +0000
Received: by outflank-mailman (input) for mailman id 517554;
 Mon, 03 Apr 2023 18:30:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h1aQ=72=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1pjOwt-00058E-6y
 for xen-devel@lists.xenproject.org; Mon, 03 Apr 2023 18:30:35 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9cf0bae2-d24d-11ed-b464-930f4c7d94ae;
 Mon, 03 Apr 2023 20:30:32 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-274-Q2KxycS7PhakuOgluqVi7g-1; Mon, 03 Apr 2023 14:30:26 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4CDFC88FA4C;
 Mon,  3 Apr 2023 18:30:09 +0000 (UTC)
Received: from localhost (unknown [10.39.192.107])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 16D77140EBF4;
 Mon,  3 Apr 2023 18:30:05 +0000 (UTC)
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
X-Inumbo-ID: 9cf0bae2-d24d-11ed-b464-930f4c7d94ae
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1680546630;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CjLb/A1nTO72rleg3tgXtfILFOYKYMPMoC5OW2A0i4g=;
	b=iNAIOtkg78eEKcmpYmR0bZGz8Jp4V+2PT9d/T93TVVpQuQfWrBcjWDFicoh/J7sND0V+LD
	XEqoahedqHHkFAQXdF5L9jCjERMESwkprs71k+g2QL1AioEy7X2Vbrn2jcL0RCa7TEZzQn
	LoHFi1UDp6kiqr7Bf699zpcmZ/xR+Rk=
X-MC-Unique: Q2KxycS7PhakuOgluqVi7g-1
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Julia Suvorova <jusual@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Peter Lieven <pl@kamp.de>,
	Coiby Xu <Coiby.Xu@gmail.com>,
	xen-devel@lists.xenproject.org,
	Richard Henderson <richard.henderson@linaro.org>,
	Stefano Garzarella <sgarzare@redhat.com>,
	<qemu-block@nongnu.org>,
	Eduardo Habkost <eduardo@habkost.net>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Paul Durrant <paul@xen.org>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Aarushi Mehta <mehta.aaru20@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Fam Zheng <fam@euphon.net>,
	David Woodhouse <dwmw2@infradead.org>,
	Stefan Weil <sw@weilnetz.de>,
	Juan Quintela <quintela@redhat.com>,
	Xie Yongji <xieyongji@bytedance.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	eesposit@redhat.com,
	"Michael S. Tsirkin" <mst@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>
Subject: [PATCH 00/13] block: remove aio_disable_external() API
Date: Mon,  3 Apr 2023 14:29:51 -0400
Message-Id: <20230403183004.347205-1-stefanha@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7

The aio_disable_external() API temporarily suspends file descriptor monitoring
in the event loop. The block layer uses this to prevent new I/O requests being
submitted from the guest and elsewhere between bdrv_drained_begin() and
bdrv_drained_end().

While the block layer still needs to prevent new I/O requests in drained
sections, the aio_disable_external() API can be replaced with
.drained_begin/end/poll() callbacks that have been added to BdrvChildClass and
BlockDevOps.

This newer .bdrained_begin/end/poll() approach is attractive because it works
without specifying a specific AioContext. The block layer is moving towards
multi-queue and that means multiple AioContexts may be processing I/O
simultaneously.

The aio_disable_external() was always somewhat hacky. It suspends all file
descriptors that were registered with is_external=true, even if they have
nothing to do with the BlockDriverState graph nodes that are being drained.
It's better to solve a block layer problem in the block layer than to have an
odd event loop API solution.

That covers the motivation for this change, now on to the specifics of this
series:

While it would be nice if a single conceptual approach could be applied to all
is_external=true file descriptors, I ended up looking at callers on a
case-by-case basis. There are two general ways I migrated code away from
is_external=true:

1. Block exports are typically best off unregistering fds in .drained_begin()
   and registering them again in .drained_end(). The .drained_poll() function
   waits for in-flight requests to finish using a reference counter.

2. Emulated storage controllers like virtio-blk and virtio-scsi are a little
   simpler. They can rely on BlockBackend's request queuing during drain
   feature. Guest I/O request coroutines are suspended in a drained section and
   resume upon the end of the drained section.

The first two virtio-scsi patches were already sent as a separate series. I
included them because they are necessary in order to fully remove
aio_disable_external().

Based-on: 087bc644b7634436ca9d52fe58ba9234e2bef026 (kevin/block-next)

Stefan Hajnoczi (13):
  virtio-scsi: avoid race between unplug and transport event
  virtio-scsi: stop using aio_disable_external() during unplug
  block/export: only acquire AioContext once for
    vhost_user_server_stop()
  util/vhost-user-server: rename refcount to in_flight counter
  block/export: wait for vhost-user-blk requests when draining
  block/export: stop using is_external in vhost-user-blk server
  virtio: do not set is_external=true on host notifiers
  hw/xen: do not use aio_set_fd_handler(is_external=true) in
    xen_xenstore
  hw/xen: do not set is_external=true on evtchn fds
  block/export: rewrite vduse-blk drain code
  block/fuse: take AioContext lock around blk_exp_ref/unref()
  block/fuse: do not set is_external=true on FUSE fd
  aio: remove aio_disable_external() API

 include/block/aio.h                  |  55 -----------
 include/qemu/vhost-user-server.h     |   8 +-
 util/aio-posix.h                     |   1 -
 block.c                              |   7 --
 block/blkio.c                        |  15 +--
 block/curl.c                         |  10 +-
 block/export/fuse.c                  |  62 ++++++++++++-
 block/export/vduse-blk.c             | 132 +++++++++++++++++++--------
 block/export/vhost-user-blk-server.c |  73 +++++++++------
 block/io.c                           |   2 -
 block/io_uring.c                     |   4 +-
 block/iscsi.c                        |   3 +-
 block/linux-aio.c                    |   4 +-
 block/nfs.c                          |   5 +-
 block/nvme.c                         |   8 +-
 block/ssh.c                          |   4 +-
 block/win32-aio.c                    |   6 +-
 hw/i386/kvm/xen_xenstore.c           |   2 +-
 hw/scsi/scsi-bus.c                   |   3 +-
 hw/scsi/scsi-disk.c                  |   1 +
 hw/scsi/virtio-scsi.c                |  21 ++---
 hw/virtio/virtio.c                   |   6 +-
 hw/xen/xen-bus.c                     |   6 +-
 io/channel-command.c                 |   6 +-
 io/channel-file.c                    |   3 +-
 io/channel-socket.c                  |   3 +-
 migration/rdma.c                     |  16 ++--
 tests/unit/test-aio.c                |  27 +-----
 tests/unit/test-fdmon-epoll.c        |  73 ---------------
 util/aio-posix.c                     |  20 +---
 util/aio-win32.c                     |   8 +-
 util/async.c                         |   3 +-
 util/fdmon-epoll.c                   |  10 --
 util/fdmon-io_uring.c                |   8 +-
 util/fdmon-poll.c                    |   3 +-
 util/main-loop.c                     |   7 +-
 util/qemu-coroutine-io.c             |   7 +-
 util/vhost-user-server.c             |  38 ++++----
 tests/unit/meson.build               |   3 -
 39 files changed, 298 insertions(+), 375 deletions(-)
 delete mode 100644 tests/unit/test-fdmon-epoll.c

-- 
2.39.2


