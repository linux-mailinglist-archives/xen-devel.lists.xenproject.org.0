Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 234CD77FB5F
	for <lists+xen-devel@lfdr.de>; Thu, 17 Aug 2023 17:59:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585495.916649 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWfOj-0005cl-Qh; Thu, 17 Aug 2023 15:58:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585495.916649; Thu, 17 Aug 2023 15:58:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWfOj-0005ZR-MT; Thu, 17 Aug 2023 15:58:57 +0000
Received: by outflank-mailman (input) for mailman id 585495;
 Thu, 17 Aug 2023 15:58:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=bmM2=EC=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1qWfOh-0005Z2-Tq
 for xen-devel@lists.xenproject.org; Thu, 17 Aug 2023 15:58:55 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f6546bdc-3d16-11ee-877c-cb3800f73035;
 Thu, 17 Aug 2023 17:58:53 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-370-_PYTQOiYObCub5SvCMnmSQ-1; Thu, 17 Aug 2023 11:58:50 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4639D8DC66D;
 Thu, 17 Aug 2023 15:58:50 +0000 (UTC)
Received: from localhost (unknown [10.39.193.48])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3C3F9C15BAE;
 Thu, 17 Aug 2023 15:58:48 +0000 (UTC)
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
X-Inumbo-ID: f6546bdc-3d16-11ee-877c-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1692287932;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=oTT7bKV9KwvS314ipvuTanKXvhR68UXiljwmEfE3uNo=;
	b=PqgDYOj9BhQqTMA3u3EApxvp5PJ+wERBkitvRNaWxTkZoFhCvqLNIguwR4nMxKAYOEGDhr
	kJB+/onlyuy2YqjvTP1v2bbik+5RNiNj+yrFh7j1ustM1I1tYgLeQqU/Idnvc1gBXThChl
	+s34cnqDJLjn30BsKT2IPGMUX4qwu1s=
X-MC-Unique: _PYTQOiYObCub5SvCMnmSQ-1
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: <qemu-block@nongnu.org>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Fam Zheng <fam@euphon.net>,
	xen-devel@lists.xenproject.org,
	Anthony Perard <anthony.perard@citrix.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Kevin Wolf <kwolf@redhat.com>,
	Julia Suvorova <jusual@redhat.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Aarushi Mehta <mehta.aaru20@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Paul Durrant <paul@xen.org>,
	Ilya Maximets <i.maximets@ovn.org>
Subject: [PATCH v2 0/4] virtio-blk: use blk_io_plug_call() instead of notification BH
Date: Thu, 17 Aug 2023 11:58:43 -0400
Message-ID: <20230817155847.3605115-1-stefanha@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8

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
 include/qemu/defer-call.h         |  15 +++
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
 hw/virtio/virtio.c                |  11 ++-
 util/defer-call.c                 | 156 +++++++++++++++++++++++++++++
 util/thread-pool.c                |   5 +
 block/meson.build                 |   1 -
 util/meson.build                  |   1 +
 17 files changed, 227 insertions(+), 233 deletions(-)
 create mode 100644 include/qemu/defer-call.h
 delete mode 100644 block/plug.c
 create mode 100644 util/defer-call.c

-- 
2.41.0


