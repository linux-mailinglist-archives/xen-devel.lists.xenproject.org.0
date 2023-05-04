Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F386F74DE
	for <lists+xen-devel@lfdr.de>; Thu,  4 May 2023 21:54:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.530060.825329 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puf1G-0003lU-Gq; Thu, 04 May 2023 19:53:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 530060.825329; Thu, 04 May 2023 19:53:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1puf1G-0003iJ-DP; Thu, 04 May 2023 19:53:38 +0000
Received: by outflank-mailman (input) for mailman id 530060;
 Thu, 04 May 2023 19:53:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EoaW=AZ=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1puf1E-0003iB-Hz
 for xen-devel@lists.xenproject.org; Thu, 04 May 2023 19:53:36 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 598eaa43-eab5-11ed-b226-6b7b168915f2;
 Thu, 04 May 2023 21:53:34 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-600-HQNHFjJIMHiplNqYoaDlwg-1; Thu, 04 May 2023 15:53:31 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8C9BF3813F3C;
 Thu,  4 May 2023 19:53:30 +0000 (UTC)
Received: from localhost (unknown [10.39.192.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 562674020960;
 Thu,  4 May 2023 19:53:29 +0000 (UTC)
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
X-Inumbo-ID: 598eaa43-eab5-11ed-b226-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1683230012;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9XCfQf87U8+YhGmnm4aQEFf11a+HXKX39xdjDXLXz/w=;
	b=PCrWMAxwV6XlwprH9mgZ6MQFY9ox4cOXJ/exukdB+LxPOiGzGAIISueVeSe7ivTIjZzabF
	WZdQSUV2W7P3vSeEKUF/mr++5RSUlJiqTDjgHCyZCLt13GdDWfPpiVIKbFuCyH9YLZec+u
	zkpvjssjtSI06mpMte+bpPUVCyElddg=
X-MC-Unique: HQNHFjJIMHiplNqYoaDlwg-1
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Ronnie Sahlberg <ronniesahlberg@gmail.com>,
	Aarushi Mehta <mehta.aaru20@gmail.com>,
	qemu-block@nongnu.org,
	Paul Durrant <paul@xen.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Peter Lieven <pl@kamp.de>,
	Stefan Weil <sw@weilnetz.de>,
	Xie Yongji <xieyongji@bytedance.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Leonardo Bras <leobras@redhat.com>,
	Peter Xu <peterx@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Coiby Xu <Coiby.Xu@gmail.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Stefano Garzarella <sgarzare@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Julia Suvorova <jusual@redhat.com>,
	xen-devel@lists.xenproject.org,
	eesposit@redhat.com,
	Juan Quintela <quintela@redhat.com>,
	"Richard W.M. Jones" <rjones@redhat.com>,
	Fam Zheng <fam@euphon.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH v5 00/21] block: remove aio_disable_external() API
Date: Thu,  4 May 2023 15:53:06 -0400
Message-Id: <20230504195327.695107-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2

v5:
- Use atomic accesses for in_flight counter in vhost-user-server.c [Kevin]
- Stash SCSIDevice id/lun values for VIRTIO_SCSI_T_TRANSPORT_RESET event
  before unrealizing the SCSIDevice [Kevin]
- Keep vhost-user-blk export .detach() callback so ctx is set to NULL [Kevin]
- Narrow BdrvChildClass and BlockDriver drained_{begin/end/poll} callbacks from
  IO_OR_GS_CODE() to GLOBAL_STATE_CODE() [Kevin]
- Include Kevin's "block: Fix use after free in blockdev_mark_auto_del()" to
  fix a latent bug that was exposed by this series

v4:
- Remove external_disable_cnt variable [Philippe]
- Add Patch 1 to fix assertion failure in .drained_end() -> blk_get_aio_context()
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

Kevin Wolf (1):
  block: Fix use after free in blockdev_mark_auto_del()

Stefan Hajnoczi (20):
  block-backend: split blk_do_set_aio_context()
  hw/qdev: introduce qdev_is_realized() helper
  virtio-scsi: avoid race between unplug and transport event
  virtio-scsi: stop using aio_disable_external() during unplug
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
 include/block/aio.h                         |  57 ---------
 include/block/block_int-common.h            |  90 +++++++-------
 include/block/export.h                      |   2 +
 include/hw/qdev-core.h                      |  17 ++-
 include/hw/scsi/scsi.h                      |  14 +++
 include/qemu/vhost-user-server.h            |   8 +-
 include/sysemu/block-backend-common.h       |  25 ++--
 include/sysemu/block-backend-global-state.h |   1 +
 util/aio-posix.h                            |   1 -
 block.c                                     |   7 --
 block/blkio.c                               |  15 +--
 block/block-backend.c                       |  78 ++++++------
 block/curl.c                                |  10 +-
 block/export/export.c                       |  13 +-
 block/export/fuse.c                         |  56 ++++++++-
 block/export/vduse-blk.c                    | 128 ++++++++++++++------
 block/export/vhost-user-blk-server.c        |  52 +++++++-
 block/io.c                                  |  16 ++-
 block/io_uring.c                            |   4 +-
 block/iscsi.c                               |   3 +-
 block/linux-aio.c                           |   4 +-
 block/nfs.c                                 |   5 +-
 block/nvme.c                                |   8 +-
 block/ssh.c                                 |   4 +-
 block/win32-aio.c                           |   6 +-
 blockdev.c                                  |  18 ++-
 hw/block/dataplane/virtio-blk.c             |  19 ++-
 hw/block/dataplane/xen-block.c              |  42 +++++--
 hw/block/virtio-blk.c                       |  38 +++++-
 hw/block/xen-block.c                        |  24 +++-
 hw/i386/kvm/xen_xenstore.c                  |   2 +-
 hw/scsi/scsi-bus.c                          |  46 ++++++-
 hw/scsi/scsi-disk.c                         |  27 ++++-
 hw/scsi/virtio-scsi-dataplane.c             |  31 +++--
 hw/scsi/virtio-scsi.c                       | 127 ++++++++++++++-----
 hw/virtio/virtio.c                          |   6 +-
 hw/xen/xen-bus.c                            |  11 +-
 io/channel-command.c                        |   6 +-
 io/channel-file.c                           |   3 +-
 io/channel-socket.c                         |   3 +-
 migration/rdma.c                            |  16 +--
 tests/unit/test-aio.c                       |  27 +----
 tests/unit/test-bdrv-drain.c                |  15 +--
 tests/unit/test-fdmon-epoll.c               |  73 -----------
 util/aio-posix.c                            |  20 +--
 util/aio-win32.c                            |   8 +-
 util/async.c                                |   3 +-
 util/fdmon-epoll.c                          |  18 +--
 util/fdmon-io_uring.c                       |   8 +-
 util/fdmon-poll.c                           |   3 +-
 util/main-loop.c                            |   7 +-
 util/qemu-coroutine-io.c                    |   7 +-
 util/vhost-user-server.c                    |  33 ++---
 hw/scsi/trace-events                        |   2 +
 tests/unit/meson.build                      |   3 -
 56 files changed, 738 insertions(+), 534 deletions(-)
 delete mode 100644 tests/unit/test-fdmon-epoll.c

-- 
2.40.1


