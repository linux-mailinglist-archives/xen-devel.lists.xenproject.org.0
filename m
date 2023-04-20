Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 037D76E92F4
	for <lists+xen-devel@lfdr.de>; Thu, 20 Apr 2023 13:38:07 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.524121.814761 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppSbh-0001Ak-Qi; Thu, 20 Apr 2023 11:37:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 524121.814761; Thu, 20 Apr 2023 11:37:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ppSbh-000180-Np; Thu, 20 Apr 2023 11:37:45 +0000
Received: by outflank-mailman (input) for mailman id 524121;
 Thu, 20 Apr 2023 11:37:44 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=onos=AL=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1ppSbg-00017u-Jp
 for xen-devel@lists.xenproject.org; Thu, 20 Apr 2023 11:37:44 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c28d34f5-df6f-11ed-b21f-6b7b168915f2;
 Thu, 20 Apr 2023 13:37:42 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-178-a4reCKcJMC-maL8cmDVnuQ-1; Thu, 20 Apr 2023 07:37:37 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0F9FB280BF69;
 Thu, 20 Apr 2023 11:37:36 +0000 (UTC)
Received: from localhost (unknown [10.39.193.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7A6FC2166B33;
 Thu, 20 Apr 2023 11:37:34 +0000 (UTC)
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
X-Inumbo-ID: c28d34f5-df6f-11ed-b21f-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1681990661;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NjZzjvFlly0+fag4k7wDm16HnoaaLh2yTrNsegeJk9A=;
	b=bhWwn3VHQNh+DU/GBBa7Q41H1799jHIO6uQCtz5oqe/vY6OpX+W3z9IaDNwaYgKszDVahE
	9p05l5pGaS77sdJHGSjb69jdECyJBgR2FJh9H39O2dikonbZHpUTuSRwv6AttxP3yWo4/1
	KdTqRVqcqru/RtQTGA1w2pFIeiK1ZQo=
X-MC-Unique: a4reCKcJMC-maL8cmDVnuQ-1
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Lieven <pl@kamp.de>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Xie Yongji <xieyongji@bytedance.com>,
	Juan Quintela <quintela@redhat.com>,
	qemu-block@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>,
	Richard Henderson <richard.henderson@linaro.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Stefan Weil <sw@weilnetz.de>,
	Fam Zheng <fam@euphon.net>,
	Julia Suvorova <jusual@redhat.com>,
	Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	xen-devel@lists.xenproject.org,
	Hanna Reitz <hreitz@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	eesposit@redhat.com,
	Kevin Wolf <kwolf@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paul Durrant <paul@xen.org>,
	Aarushi Mehta <mehta.aaru20@gmail.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	Coiby Xu <Coiby.Xu@gmail.com>,
	Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH v3 00/20] block: remove aio_disable_external() API
Date: Thu, 20 Apr 2023 07:37:12 -0400
Message-Id: <20230420113732.336620-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6

v3:
- Resend full patch series. v2 was sent in the middle of a git rebase and was
  missing patches. [Eric]
- Apply Reviewed-by tags.
v2:
- Do not rely on BlockBackend request queuing, implement .drained_begin/end()
  instead in xen-block, virtio-blk, and virtio-scsi [Paolo]
- Add qdev_is_realized() API [Philippe]
- Add patch to avoid AioContext lock around blk_exp_ref/unref() [Paolo]
- Add patch to call .drained_begin/end() from main loop thread to simplify
  callback implementations

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

The approach in this patch series is to implement BlockDevOps
.drained_begin/end() callbacks that temporarily stop file descriptor handlers.
This ensures that new I/O requests are not submitted in drained sections.

The first two virtio-scsi patches were already sent as a separate series. I
included them because they are necessary in order to fully remove
aio_disable_external().

Based-on: 087bc644b7634436ca9d52fe58ba9234e2bef026 (kevin/block-next)

Stefan Hajnoczi (20):
  hw/qdev: introduce qdev_is_realized() helper
  virtio-scsi: avoid race between unplug and transport event
  virtio-scsi: stop using aio_disable_external() during unplug
  block/export: only acquire AioContext once for
    vhost_user_server_stop()
  util/vhost-user-server: rename refcount to in_flight counter
  block/export: wait for vhost-user-blk requests when draining
  block/export: stop using is_external in vhost-user-blk server
  hw/xen: do not use aio_set_fd_handler(is_external=true) in
    xen_xenstore
  block: add blk_in_drain() API
  block: drain from main loop thread in bdrv_co_yield_to_drain()
  xen-block: implement BlockDevOps->drained_begin()
  hw/xen: do not set is_external=true on evtchn fds
  block/export: rewrite vduse-blk drain code
  block/export: don't require AioContext lock around blk_exp_ref/unref()
  block/fuse: do not set is_external=true on FUSE fd
  virtio: make it possible to detach host notifier from any thread
  virtio-blk: implement BlockDevOps->drained_begin()
  virtio-scsi: implement BlockDevOps->drained_begin()
  virtio: do not set is_external=true on host notifiers
  aio: remove aio_disable_external() API

 hw/block/dataplane/xen-block.h              |   2 +
 include/block/aio.h                         |  55 ---------
 include/block/export.h                      |   2 +
 include/hw/qdev-core.h                      |  17 ++-
 include/hw/scsi/scsi.h                      |  14 +++
 include/qemu/vhost-user-server.h            |   8 +-
 include/sysemu/block-backend-common.h       |  25 ++--
 include/sysemu/block-backend-global-state.h |   1 +
 util/aio-posix.h                            |   1 -
 block.c                                     |   7 --
 block/blkio.c                               |  15 +--
 block/block-backend.c                       |   7 ++
 block/curl.c                                |  10 +-
 block/export/export.c                       |  13 +-
 block/export/fuse.c                         |  58 ++++++++-
 block/export/vduse-blk.c                    | 128 ++++++++++++++------
 block/export/vhost-user-blk-server.c        |  73 +++++++----
 block/io.c                                  |   5 +-
 block/io_uring.c                            |   4 +-
 block/iscsi.c                               |   3 +-
 block/linux-aio.c                           |   4 +-
 block/nfs.c                                 |   5 +-
 block/nvme.c                                |   8 +-
 block/ssh.c                                 |   4 +-
 block/win32-aio.c                           |   6 +-
 hw/block/dataplane/virtio-blk.c             |  19 ++-
 hw/block/dataplane/xen-block.c              |  42 +++++--
 hw/block/virtio-blk.c                       |  38 +++++-
 hw/block/xen-block.c                        |  24 +++-
 hw/i386/kvm/xen_xenstore.c                  |   2 +-
 hw/scsi/scsi-bus.c                          |  46 ++++++-
 hw/scsi/scsi-disk.c                         |  28 ++++-
 hw/scsi/virtio-scsi-dataplane.c             |  31 +++--
 hw/scsi/virtio-scsi.c                       |  59 +++++++--
 hw/virtio/virtio.c                          |   6 +-
 hw/xen/xen-bus.c                            |  11 +-
 io/channel-command.c                        |   6 +-
 io/channel-file.c                           |   3 +-
 io/channel-socket.c                         |   3 +-
 migration/rdma.c                            |  16 +--
 tests/unit/test-aio.c                       |  27 +----
 tests/unit/test-fdmon-epoll.c               |  73 -----------
 util/aio-posix.c                            |  20 +--
 util/aio-win32.c                            |   8 +-
 util/async.c                                |   3 +-
 util/fdmon-epoll.c                          |  10 --
 util/fdmon-io_uring.c                       |   8 +-
 util/fdmon-poll.c                           |   3 +-
 util/main-loop.c                            |   7 +-
 util/qemu-coroutine-io.c                    |   7 +-
 util/vhost-user-server.c                    |  38 +++---
 hw/scsi/trace-events                        |   2 +
 tests/unit/meson.build                      |   3 -
 53 files changed, 582 insertions(+), 436 deletions(-)
 delete mode 100644 tests/unit/test-fdmon-epoll.c

-- 
2.39.2


