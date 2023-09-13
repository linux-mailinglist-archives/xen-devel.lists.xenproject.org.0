Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E8E579F283
	for <lists+xen-devel@lfdr.de>; Wed, 13 Sep 2023 22:01:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.601544.937568 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgW2h-0006Ta-AZ; Wed, 13 Sep 2023 20:00:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 601544.937568; Wed, 13 Sep 2023 20:00:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgW2h-0006RP-7w; Wed, 13 Sep 2023 20:00:55 +0000
Received: by outflank-mailman (input) for mailman id 601544;
 Wed, 13 Sep 2023 20:00:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=KJQj=E5=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1qgW2f-0006RI-PN
 for xen-devel@lists.xenproject.org; Wed, 13 Sep 2023 20:00:53 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3cd519d6-5270-11ee-9b0d-b553b5be7939;
 Wed, 13 Sep 2023 22:00:51 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-581-1gwriteAPry7x7A5OQM54w-1; Wed, 13 Sep 2023 16:00:48 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AC275805B29;
 Wed, 13 Sep 2023 20:00:47 +0000 (UTC)
Received: from localhost (unknown [10.39.192.13])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2074A2156721;
 Wed, 13 Sep 2023 20:00:46 +0000 (UTC)
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
X-Inumbo-ID: 3cd519d6-5270-11ee-9b0d-b553b5be7939
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694635250;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=nD7AyJZmmyRxiB9nG0IYAzAL7ZwFQ3Xa6S9su6nyaIc=;
	b=cH38GwRvBahH8OF9o5wQco8JAbqxLxIcHnrBH5np0/eue6GNmz5lHWCFHfIEyTsfkE3aQo
	NkTjSKJRjThQ3+4ueKSMKOWI6jSN9KIa0x3cYO2uHVT8XFsIegQN9PoLS1zaagzkdBdFLc
	uy14Lbk2n0KthbA2Z9m1nt18ics/gQk=
X-MC-Unique: 1gwriteAPry7x7A5OQM54w-1
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	Ilya Maximets <i.maximets@ovn.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Kevin Wolf <kwolf@redhat.com>,
	xen-devel@lists.xenproject.org,
	Anthony Perard <anthony.perard@citrix.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	<qemu-block@nongnu.org>,
	Julia Suvorova <jusual@redhat.com>,
	Aarushi Mehta <mehta.aaru20@gmail.com>,
	Paul Durrant <paul@xen.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Fam Zheng <fam@euphon.net>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>
Subject: [PATCH v3 0/4] virtio-blk: use blk_io_plug_call() instead of notification BH
Date: Wed, 13 Sep 2023 16:00:41 -0400
Message-ID: <20230913200045.1024233-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6

v3:
- Add comment pointing to API documentation in .c file [Philippe]
- Add virtio_notify_irqfd_deferred_fn trace event [Ilya]
- Remove outdated #include [Ilya]
v2:
- Rename blk_io_plug() to defer_call() and move it to util/ so the net
  subsystem can use it [Ilya]
- Add defer_call_begin()/end() to thread_pool_completion_bh() to match Linux
  AIO and io_uring completion batching

Replace the seldom-used virtio-blk notification BH mechanism with
blk_io_plug(). This is part of an effort to enable the multi-queue block layer
in virtio-blk. The notification BH was not multi-queue friendly.

The blk_io_plug() mechanism improves fio rw=randread bs=4k iodepth=64 numjobs=8
IOPS by ~9% with a single IOThread and 8 vCPUs (this is not even a multi-queue
block layer configuration) compared to no completion batching. iodepth=1
decreases by ~1% but this could be noise. Benchmark details are available here:
https://gitlab.com/stefanha/virt-playbooks/-/tree/blk_io_plug-irqfd

Stefan Hajnoczi (4):
  block: rename blk_io_plug_call() API to defer_call()
  util/defer-call: move defer_call() to util/
  virtio: use defer_call() in virtio_irqfd_notify()
  virtio-blk: remove batch notification BH

 MAINTAINERS                       |   3 +-
 include/qemu/defer-call.h         |  16 +++
 include/sysemu/block-backend-io.h |   4 -
 block/blkio.c                     |   9 +-
 block/io_uring.c                  |  11 ++-
 block/linux-aio.c                 |   9 +-
 block/nvme.c                      |   5 +-
 block/plug.c                      | 159 ------------------------------
 hw/block/dataplane/virtio-blk.c   |  48 +--------
 hw/block/dataplane/xen-block.c    |  11 ++-
 hw/block/virtio-blk.c             |   5 +-
 hw/scsi/virtio-scsi.c             |   7 +-
 hw/virtio/virtio.c                |  13 ++-
 util/defer-call.c                 | 156 +++++++++++++++++++++++++++++
 util/thread-pool.c                |   5 +
 block/meson.build                 |   1 -
 hw/virtio/trace-events            |   1 +
 util/meson.build                  |   1 +
 18 files changed, 231 insertions(+), 233 deletions(-)
 create mode 100644 include/qemu/defer-call.h
 delete mode 100644 block/plug.c
 create mode 100644 util/defer-call.c

-- 
2.41.0


