Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B592D9F39
	for <lists+xen-devel@lfdr.de>; Mon, 14 Dec 2020 19:36:33 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.52459.91841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kosht-0003bv-Dl; Mon, 14 Dec 2020 18:36:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 52459.91841; Mon, 14 Dec 2020 18:36:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1koshr-0003VZ-ST; Mon, 14 Dec 2020 18:36:23 +0000
Received: by outflank-mailman (input) for mailman id 52459;
 Mon, 14 Dec 2020 17:05:39 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=O6EJ=FS=redhat.com=slp@srs-us1.protection.inumbo.net>)
 id 1korI3-0001vO-4j
 for xen-devel@lists.xenproject.org; Mon, 14 Dec 2020 17:05:39 +0000
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTP
 id 6889cd7e-a680-41df-9e47-d6ff21a639d1;
 Mon, 14 Dec 2020 17:05:38 +0000 (UTC)
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-490-gNP_Li97NzyoS-gY09zc6A-1; Mon, 14 Dec 2020 12:05:35 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F0CE11074640;
 Mon, 14 Dec 2020 17:05:33 +0000 (UTC)
Received: from toolbox.redhat.com (ovpn-112-231.rdu2.redhat.com
 [10.10.112.231])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 02D775D6AB;
 Mon, 14 Dec 2020 17:05:20 +0000 (UTC)
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
X-Inumbo-ID: 6889cd7e-a680-41df-9e47-d6ff21a639d1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1607965537;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Ofxiw979EA5hQ5retJsvejrszYOaT4OA8K7Ptz7ohEw=;
	b=bJv4+7bcsGHslvrR2SpcOQv+eqAXGpjE4cZ2NqR9DF2TQ4UQ1YOkVPy/uhg0tBjHNF2oFq
	zwUoQ++i3hOQ8yFmhrjtldlxwKT3vbEzbzi+wQNLuMYGKbWvYK7IYPixOYrANgCQU/uXch
	7vTFl0exfGBqiXEi/V2YrnkXVZYJTXE=
X-MC-Unique: gNP_Li97NzyoS-gY09zc6A-1
From: Sergio Lopez <slp@redhat.com>
To: qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	qemu-block@nongnu.org,
	Anthony Perard <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org,
	Paul Durrant <paul@xen.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Fam Zheng <fam@euphon.net>,
	Eric Blake <eblake@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Max Reitz <mreitz@redhat.com>,
	Sergio Lopez <slp@redhat.com>
Subject: [PATCH v2 0/4] nbd/server: Quiesce coroutines on context switch
Date: Mon, 14 Dec 2020 18:05:15 +0100
Message-Id: <20201214170519.223781-1-slp@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=slp@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

This series allows the NBD server to properly switch between AIO contexts,=
=0D
having quiesced recv_coroutine and send_coroutine before doing the transiti=
on.=0D
=0D
We need this because we send back devices running in IO Thread owned contex=
ts=0D
to the main context when stopping the data plane, something that can happen=
=0D
multiple times during the lifetime of a VM (usually during the boot sequenc=
e or=0D
on a reboot), and we drag the NBD server of the correspoing export with it.=
=0D
=0D
While there, fix also a problem caused by a cross-dependency between=0D
closing the export's client connections and draining the block=0D
layer. The visible effect of this problem was QEMU getting hung when=0D
the guest request a power off while there's an active NBD client.=0D
=0D
v2:=0D
 - Replace "virtio-blk: Acquire context while switching them on=0D
 dataplane start" with "block: Honor blk_set_aio_context() context=0D
 requirements" (Kevin Wolf)=0D
 - Add "block: Avoid processing BDS twice in=0D
 bdrv_set_aio_context_ignore()"=0D
 - Add "block: Close block exports in two steps"=0D
 - Rename nbd_read_eof() to nbd_server_read_eof() (Eric Blake)=0D
 - Fix double space and typo in comment. (Eric Blake)=0D
=0D
Sergio Lopez (4):=0D
  block: Honor blk_set_aio_context() context requirements=0D
  block: Avoid processing BDS twice in bdrv_set_aio_context_ignore()=0D
  nbd/server: Quiesce coroutines on context switch=0D
  block: Close block exports in two steps=0D
=0D
 block.c                         |  27 ++++++-=0D
 block/export/export.c           |  10 +--=0D
 blockdev-nbd.c                  |   2 +-=0D
 hw/block/dataplane/virtio-blk.c |   4 ++=0D
 hw/block/dataplane/xen-block.c  |   7 +-=0D
 hw/scsi/virtio-scsi.c           |   6 +-=0D
 include/block/export.h          |   4 +-=0D
 nbd/server.c                    | 120 ++++++++++++++++++++++++++++----=0D
 qemu-nbd.c                      |   2 +-=0D
 stubs/blk-exp-close-all.c       |   2 +-=0D
 10 files changed, 156 insertions(+), 28 deletions(-)=0D
=0D
--=20=0D
2.26.2=0D
=0D


