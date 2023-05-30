Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 06FD4716BF3
	for <lists+xen-devel@lfdr.de>; Tue, 30 May 2023 20:11:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.541336.844018 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q43nr-0006wg-Ms; Tue, 30 May 2023 18:10:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 541336.844018; Tue, 30 May 2023 18:10:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q43nr-0006tY-Iy; Tue, 30 May 2023 18:10:39 +0000
Received: by outflank-mailman (input) for mailman id 541336;
 Tue, 30 May 2023 18:10:37 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BJNG=BT=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1q43np-0006Ma-T3
 for xen-devel@lists.xenproject.org; Tue, 30 May 2023 18:10:37 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 46a5f28c-ff15-11ed-b231-6b7b168915f2;
 Tue, 30 May 2023 20:10:37 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-567-RcpP8Yb5O6-KCdzFrDVW0w-1; Tue, 30 May 2023 14:10:32 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EB7E5185A78F;
 Tue, 30 May 2023 18:10:31 +0000 (UTC)
Received: from localhost (unknown [10.39.192.97])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5A43B40CFD45;
 Tue, 30 May 2023 18:10:31 +0000 (UTC)
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
X-Inumbo-ID: 46a5f28c-ff15-11ed-b231-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1685470236;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zspNQDN9x15zA+5+5xrrc00UJFsGuayW0uokDFqy9AA=;
	b=XYJHL/P/KkDEEsC3eMla+VJrQ9/wsycqctSeYSkgrjLhbvoivv+mIXuqkS56XGA8AZoV5z
	2nQGTswtB+0pS9NKMGkNoPneDSyQhK6ORRoAULjDWOfxqPUXuo+u9tHZTHYgIejRrFOC/T
	O2JgVR4X3NOK1s8tiHy7o0ndgvije8Y=
X-MC-Unique: RcpP8Yb5O6-KCdzFrDVW0w-1
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	eblake@redhat.com,
	Hanna Reitz <hreitz@redhat.com>,
	Fam Zheng <fam@euphon.net>,
	sgarzare@redhat.com,
	qemu-block@nongnu.org,
	xen-devel@lists.xenproject.org,
	Julia Suvorova <jusual@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Paul Durrant <paul@xen.org>,
	Kevin Wolf <kwolf@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Aarushi Mehta <mehta.aaru20@gmail.com>
Subject: [PATCH v3 0/6] block: add blk_io_plug_call() API
Date: Tue, 30 May 2023 14:09:53 -0400
Message-Id: <20230530180959.1108766-1-stefanha@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1

v3
- Patch 5: Mention why dev_max_batch condition was dropped [Stefano]
v2
- Patch 1: "is not be freed" -> "is not freed" [Eric]
- Patch 2: Remove unused nvme_process_completion_queue_plugged trace event
  [Stefano]
- Patch 3: Add missing #include and fix blkio_unplug_fn() prototype [Stefano]
- Patch 4: Removed whitespace hunk [Eric]

The existing blk_io_plug() API is not block layer multi-queue friendly because
the plug state is per-BlockDriverState.

Change blk_io_plug()'s implementation so it is thread-local. This is done by
introducing the blk_io_plug_call() function that block drivers use to batch
calls while plugged. It is relatively easy to convert block drivers from
.bdrv_co_io_plug() to blk_io_plug_call().

Random read 4KB performance with virtio-blk on a host NVMe block device:

iodepth   iops   change vs today
1        45612   -4%
2        87967   +2%
4       129872   +0%
8       171096   -3%
16      194508   -4%
32      208947   -1%
64      217647   +0%
128     229629   +0%

The results are within the noise for these benchmarks. This is to be expected
because the plugging behavior for a single thread hasn't changed in this patch
series, only that the state is thread-local now.

The following graph compares several approaches:
https://vmsplice.net/~stefan/blk_io_plug-thread-local.png
- v7.2.0: before most of the multi-queue block layer changes landed.
- with-blk_io_plug: today's post-8.0.0 QEMU.
- blk_io_plug-thread-local: this patch series.
- no-blk_io_plug: what happens when we simply remove plugging?
- call-after-dispatch: what if we integrate plugging into the event loop? I
  decided against this approach in the end because it's more likely to
  introduce performance regressions since I/O submission is deferred until the
  end of the event loop iteration.

Aside from the no-blk_io_plug case, which bottlenecks much earlier than the
others, we see that all plugging approaches are more or less equivalent in this
benchmark. It is also clear that QEMU 8.0.0 has lower performance than 7.2.0.

The Ansible playbook, fio results, and a Jupyter notebook are available here:
https://github.com/stefanha/qemu-perf/tree/remove-blk_io_plug

Stefan Hajnoczi (6):
  block: add blk_io_plug_call() API
  block/nvme: convert to blk_io_plug_call() API
  block/blkio: convert to blk_io_plug_call() API
  block/io_uring: convert to blk_io_plug_call() API
  block/linux-aio: convert to blk_io_plug_call() API
  block: remove bdrv_co_io_plug() API

 MAINTAINERS                       |   1 +
 include/block/block-io.h          |   3 -
 include/block/block_int-common.h  |  11 ---
 include/block/raw-aio.h           |  14 ---
 include/sysemu/block-backend-io.h |  13 +--
 block/blkio.c                     |  43 ++++----
 block/block-backend.c             |  22 -----
 block/file-posix.c                |  38 -------
 block/io.c                        |  37 -------
 block/io_uring.c                  |  44 ++++-----
 block/linux-aio.c                 |  41 +++-----
 block/nvme.c                      |  44 +++------
 block/plug.c                      | 159 ++++++++++++++++++++++++++++++
 hw/block/dataplane/xen-block.c    |   8 +-
 hw/block/virtio-blk.c             |   4 +-
 hw/scsi/virtio-scsi.c             |   6 +-
 block/meson.build                 |   1 +
 block/trace-events                |   6 +-
 18 files changed, 239 insertions(+), 256 deletions(-)
 create mode 100644 block/plug.c

-- 
2.40.1


