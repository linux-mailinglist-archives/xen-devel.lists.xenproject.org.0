Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 091C6805D19
	for <lists+xen-devel@lfdr.de>; Tue,  5 Dec 2023 19:20:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.648182.1012273 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAa1x-0002ia-LM; Tue, 05 Dec 2023 18:20:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 648182.1012273; Tue, 05 Dec 2023 18:20:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rAa1x-0002h1-IA; Tue, 05 Dec 2023 18:20:25 +0000
Received: by outflank-mailman (input) for mailman id 648182;
 Tue, 05 Dec 2023 18:20:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=I6T2=HQ=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1rAa1w-0002fT-A5
 for xen-devel@lists.xenproject.org; Tue, 05 Dec 2023 18:20:24 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f3add748-939a-11ee-98e5-6d05b1d4d9a1;
 Tue, 05 Dec 2023 19:20:22 +0100 (CET)
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-407-Kqz6uEAtM--M6ZQHnqRW-Q-1; Tue,
 05 Dec 2023 13:20:16 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B0314280640A;
 Tue,  5 Dec 2023 18:20:15 +0000 (UTC)
Received: from localhost (unknown [10.39.194.111])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 07EE92026F95;
 Tue,  5 Dec 2023 18:20:12 +0000 (UTC)
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
X-Inumbo-ID: f3add748-939a-11ee-98e5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701800421;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=eFkXBHi0g9elebJAxvoO9P+CWlnlZ1lnQhrpQ4+NAns=;
	b=W4+y4mZfSY1XemyaU19m1xoAbrs3Hirecr/8oAGgu3giSiwYyo0+zFGsBLmLbpel7UWiZ3
	16R3ZM24SfhzoUHGewpWVLl2Q5S0QJyyOteXe5kLduV9jG74x6Xcls069z/LHcnJ6K9MBn
	0y9cEfIYXVRjtnHwgMzfnj0kAW9p4L0=
X-MC-Unique: Kqz6uEAtM--M6ZQHnqRW-Q-1
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
	Cleber Rosa <crosa@redhat.com>,
	Xie Changlong <xiechanglong.d@gmail.com>,
	Paul Durrant <paul@xen.org>,
	Ari Sundholm <ari@tuxera.com>,
	Jason Wang <jasowang@redhat.com>,
	Eric Blake <eblake@redhat.com>,
	John Snow <jsnow@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Wen Congyang <wencongyang2@huawei.com>,
	Alberto Garcia <berto@igalia.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	qemu-block@nongnu.org,
	Juan Quintela <quintela@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Coiby Xu <Coiby.Xu@gmail.com>,
	Fabiano Rosas <farosas@suse.de>,
	Hanna Reitz <hreitz@redhat.com>,
	Zhang Chen <chen.zhang@intel.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
	Peter Xu <peterx@redhat.com>,
	Emanuele Giuseppe Esposito <eesposit@redhat.com>,
	Fam Zheng <fam@euphon.net>,
	Leonardo Bras <leobras@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Li Zhijian <lizhijian@fujitsu.com>,
	xen-devel@lists.xenproject.org
Subject: [PATCH v2 00/14] aio: remove AioContext lock
Date: Tue,  5 Dec 2023 13:19:57 -0500
Message-ID: <20231205182011.1976568-1-stefanha@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4

v2:
- Add Patch 2 "scsi: assert that callbacks run in the correct AioContext" [Kevin]
- Add Patch 7 "block: remove bdrv_co_lock()" [Eric and Kevin]
- Remove stray goto label in Patch 8 [Kevin]
- Fix "eeked" -> "eked" typo in Patch 10 [Eric]

This series removes the AioContext locking APIs from QEMU.
aio_context_acquire() and aio_context_release() are currently only needed to
support the locking discipline required by AIO_POLL_WHILE() (except for a stray
user that I converted in Patch 1). AIO_POLL_WHILE() doesn't really need the
AioContext lock anymore, so it's possible to remove the API. This is a nice
simplification because the AioContext locking rules were sometimes tricky or
underspecified, leading to many bugs of the years.

This patch series removes these APIs across the codebase and cleans up the
documentation/comments that refers to them.

Patch 1 is a AioContext lock user I forgot to convert in my earlier SCSI
conversion series.

Patch 2 adds an assertion to the SCSI code to ensure that callbacks are invoked
in the correct AioContext.

Patch 3 removes tests for the AioContext lock because they will no longer be
needed when the lock is gone.

Patches 4-10 remove the AioContext lock. These can be reviewed by categorizing
the call sites into 1. places that take the lock because they call an API that
requires the lock (ultimately AIO_POLL_WHILE()) and 2. places that take the
lock to protect state. There should be no instances of case 2 left. If you see
one, you've found a bug in this patch series!

Patches 11-14 remove comments.

Based-on: 20231204164259.1515217-1-stefanha@redhat.com ("[PATCH v2 0/4] scsi: eliminate AioContext lock")
Since SCSI needs to stop relying on the AioContext lock before we can remove
the lock.

Stefan Hajnoczi (14):
  virtio-scsi: replace AioContext lock with tmf_bh_lock
  scsi: assert that callbacks run in the correct AioContext
  tests: remove aio_context_acquire() tests
  aio: make aio_context_acquire()/aio_context_release() a no-op
  graph-lock: remove AioContext locking
  block: remove AioContext locking
  block: remove bdrv_co_lock()
  scsi: remove AioContext locking
  aio-wait: draw equivalence between AIO_WAIT_WHILE() and
    AIO_WAIT_WHILE_UNLOCKED()
  aio: remove aio_context_acquire()/aio_context_release() API
  docs: remove AioContext lock from IOThread docs
  scsi: remove outdated AioContext lock comment
  job: remove outdated AioContext locking comments
  block: remove outdated AioContext locking comments

 docs/devel/multiple-iothreads.txt    |  45 ++--
 include/block/aio-wait.h             |  16 +-
 include/block/aio.h                  |  17 --
 include/block/block-common.h         |   3 -
 include/block/block-global-state.h   |  23 +-
 include/block/block-io.h             |  12 +-
 include/block/block_int-common.h     |   2 -
 include/block/graph-lock.h           |  21 +-
 include/block/snapshot.h             |   2 -
 include/hw/virtio/virtio-scsi.h      |  17 +-
 include/qemu/job.h                   |  20 --
 block.c                              | 363 ++++-----------------------
 block/backup.c                       |   4 +-
 block/blklogwrites.c                 |   8 +-
 block/blkverify.c                    |   4 +-
 block/block-backend.c                |  33 +--
 block/commit.c                       |  16 +-
 block/copy-before-write.c            |  22 +-
 block/export/export.c                |  22 +-
 block/export/vhost-user-blk-server.c |   4 -
 block/graph-lock.c                   |  44 +---
 block/io.c                           |  45 +---
 block/mirror.c                       |  41 +--
 block/monitor/bitmap-qmp-cmds.c      |  20 +-
 block/monitor/block-hmp-cmds.c       |  29 ---
 block/qapi-sysemu.c                  |  27 +-
 block/qapi.c                         |  18 +-
 block/qcow2.c                        |   4 +-
 block/quorum.c                       |   8 +-
 block/raw-format.c                   |   5 -
 block/replication.c                  |  72 +-----
 block/snapshot.c                     |  26 +-
 block/stream.c                       |  12 +-
 block/vmdk.c                         |  20 +-
 block/write-threshold.c              |   6 -
 blockdev.c                           | 319 +++++------------------
 blockjob.c                           |  30 +--
 hw/block/dataplane/virtio-blk.c      |  10 -
 hw/block/dataplane/xen-block.c       |  17 +-
 hw/block/virtio-blk.c                |  45 +---
 hw/core/qdev-properties-system.c     |   9 -
 hw/scsi/scsi-bus.c                   |   2 -
 hw/scsi/scsi-disk.c                  |  46 ++--
 hw/scsi/virtio-scsi.c                |  80 +++---
 job.c                                |  16 --
 migration/block.c                    |  33 +--
 migration/migration-hmp-cmds.c       |   3 -
 migration/savevm.c                   |  22 --
 net/colo-compare.c                   |   2 -
 qemu-img.c                           |   4 -
 qemu-io.c                            |  10 +-
 qemu-nbd.c                           |   2 -
 replay/replay-debugging.c            |   4 -
 system/dma-helpers.c                 |   3 +
 tests/unit/test-aio.c                |  67 +----
 tests/unit/test-bdrv-drain.c         |  91 ++-----
 tests/unit/test-bdrv-graph-mod.c     |  26 +-
 tests/unit/test-block-iothread.c     |  31 ---
 tests/unit/test-blockjob.c           | 137 ----------
 tests/unit/test-replication.c        |  11 -
 util/async.c                         |  14 --
 util/vhost-user-server.c             |   3 -
 scripts/block-coroutine-wrapper.py   |   7 +-
 tests/qemu-iotests/202               |   2 +-
 tests/qemu-iotests/203               |   3 +-
 tests/tsan/suppressions.tsan         |   1 -
 66 files changed, 340 insertions(+), 1741 deletions(-)

-- 
2.43.0


