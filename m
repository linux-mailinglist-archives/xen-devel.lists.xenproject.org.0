Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C24071A28D
	for <lists+xen-devel@lfdr.de>; Thu,  1 Jun 2023 17:26:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.542619.846676 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4kBg-0004Ew-Ng; Thu, 01 Jun 2023 15:26:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 542619.846676; Thu, 01 Jun 2023 15:26:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1q4kBg-0004Cq-Jh; Thu, 01 Jun 2023 15:26:04 +0000
Received: by outflank-mailman (input) for mailman id 542619;
 Thu, 01 Jun 2023 15:26:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z77Y=BV=redhat.com=stefanha@srs-se1.protection.inumbo.net>)
 id 1q4kBf-0004Ci-1P
 for xen-devel@lists.xenproject.org; Thu, 01 Jun 2023 15:26:03 +0000
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9b7eb5e0-0090-11ee-8611-37d641c3527e;
 Thu, 01 Jun 2023 17:25:58 +0200 (CEST)
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-277-5FE_cTMtMk-QY0HLTJnTJQ-1; Thu, 01 Jun 2023 11:25:56 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2D09B806105;
 Thu,  1 Jun 2023 15:25:55 +0000 (UTC)
Received: from localhost (unknown [10.39.194.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4A1CB8162;
 Thu,  1 Jun 2023 15:25:54 +0000 (UTC)
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
X-Inumbo-ID: 9b7eb5e0-0090-11ee-8611-37d641c3527e
X-MC-Unique: 5FE_cTMtMk-QY0HLTJnTJQ-1
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
	Stefano Stabellini <sstabellini@kernel.org>,
	Aarushi Mehta <mehta.aaru20@gmail.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Thomas Huth <thuth@redhat.com>,
	Julia Suvorova <jusual@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Fam Zheng <fam@euphon.net>,
	Hanna Reitz <hreitz@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Stefano Garzarella <sgarzare@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	xen-devel@lists.xenproject.org,
	Paul Durrant <paul@xen.org>,
	Kevin Wolf <kwolf@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	Eric Blake <eblake@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Raphael Norwitz <raphael.norwitz@nutanix.com>,
	kvm@vger.kernel.org
Subject: [PULL 0/8] Block patches
Date: Thu,  1 Jun 2023 11:25:44 -0400
Message-Id: <20230601152552.1603119-1-stefanha@redhat.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5

The following changes since commit c6a5fc2ac76c5ab709896ee1b0edd33685a67ed1:

  decodetree: Add --output-null for meson testing (2023-05-31 19:56:42 -0700)

are available in the Git repository at:

  https://gitlab.com/stefanha/qemu.git tags/block-pull-request

for you to fetch changes up to 98b126f5e3228a346c774e569e26689943b401dd:

  qapi: add '@fdset' feature for BlockdevOptionsVirtioBlkVhostVdpa (2023-06-01 11:08:21 -0400)

----------------------------------------------------------------
Pull request

- Stefano Garzarella's blkio block driver 'fd' parameter
- My thread-local blk_io_plug() series

----------------------------------------------------------------

Stefan Hajnoczi (6):
  block: add blk_io_plug_call() API
  block/nvme: convert to blk_io_plug_call() API
  block/blkio: convert to blk_io_plug_call() API
  block/io_uring: convert to blk_io_plug_call() API
  block/linux-aio: convert to blk_io_plug_call() API
  block: remove bdrv_co_io_plug() API

Stefano Garzarella (2):
  block/blkio: use qemu_open() to support fd passing for virtio-blk
  qapi: add '@fdset' feature for BlockdevOptionsVirtioBlkVhostVdpa

 MAINTAINERS                       |   1 +
 qapi/block-core.json              |   6 ++
 meson.build                       |   4 +
 include/block/block-io.h          |   3 -
 include/block/block_int-common.h  |  11 ---
 include/block/raw-aio.h           |  14 ---
 include/sysemu/block-backend-io.h |  13 +--
 block/blkio.c                     |  96 ++++++++++++------
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
 20 files changed, 293 insertions(+), 265 deletions(-)
 create mode 100644 block/plug.c

-- 
2.40.1


