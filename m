Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 064B81E42C0
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2020 14:53:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdvXi-0001Sh-Pv; Wed, 27 May 2020 12:52:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mVnz=7J=yandex-team.ru=rvkagan@srs-us1.protection.inumbo.net>)
 id 1jdvR0-0000fO-UW
 for xen-devel@lists.xenproject.org; Wed, 27 May 2020 12:45:26 +0000
X-Inumbo-ID: ee852c98-a017-11ea-a740-12813bfff9fa
Received: from forwardcorp1p.mail.yandex.net (unknown [77.88.29.217])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ee852c98-a017-11ea-a740-12813bfff9fa;
 Wed, 27 May 2020 12:45:24 +0000 (UTC)
Received: from mxbackcorp1j.mail.yandex.net (mxbackcorp1j.mail.yandex.net
 [IPv6:2a02:6b8:0:1619::162])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 693EE2E15B2;
 Wed, 27 May 2020 15:45:22 +0300 (MSK)
Received: from iva4-7c3d9abce76c.qloud-c.yandex.net
 (iva4-7c3d9abce76c.qloud-c.yandex.net [2a02:6b8:c0c:4e8e:0:640:7c3d:9abc])
 by mxbackcorp1j.mail.yandex.net (mxbackcorp/Yandex) with ESMTP id
 NncoSmAIxp-jIF4FJjI; Wed, 27 May 2020 15:45:22 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1590583522; bh=oIN03DAZ4lQYUkl3lhide6Xs43zEdrUrV/56BgwHQX0=;
 h=In-Reply-To:Message-Id:References:Date:Subject:To:From:Cc;
 b=NI0AJsTTemllPECSfi+BL/N/9mtkS20hZ1UfRKA0K7Uhqy5GZMQwxjcKYKDr7hmtr
 //+nYgUXvj6RJUl+sDbsrRYAVCdOTsWshvGUgRhw/6Gd/7gE0esW0D/P+hHpqQqIKu
 j16B7hxVho1S7RMx409aZaf2tvAyPB6vHESIDjaQ=
Authentication-Results: mxbackcorp1j.mail.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b080:8308::1:12])
 by iva4-7c3d9abce76c.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 bzO5qPtczO-jIWOql5q; Wed, 27 May 2020 15:45:18 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Roman Kagan <rvkagan@yandex-team.ru>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 1/5] virtio-blk: store opt_io_size with correct size
Date: Wed, 27 May 2020 15:45:07 +0300
Message-Id: <20200527124511.986099-2-rvkagan@yandex-team.ru>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200527124511.986099-1-rvkagan@yandex-team.ru>
References: <20200527124511.986099-1-rvkagan@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 27 May 2020 12:52:22 +0000
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Paul Durrant <paul@xen.org>, Eric Blake <eblake@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Max Reitz <mreitz@redhat.com>, John Snow <jsnow@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

The width of opt_io_size in virtio_blk_config is 32bit.  However, it's
written with virtio_stw_p; this may result in value truncation, and on
big-endian systems with legacy virtio in completely bogus readings in
the guest.

Use the appropriate accessor to store it.

Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
v4 -> v5:
- expand the log [Michael]

 hw/block/virtio-blk.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/block/virtio-blk.c b/hw/block/virtio-blk.c
index f5f6fc925e..413083e62f 100644
--- a/hw/block/virtio-blk.c
+++ b/hw/block/virtio-blk.c
@@ -918,7 +918,7 @@ static void virtio_blk_update_config(VirtIODevice *vdev, uint8_t *config)
     virtio_stw_p(vdev, &blkcfg.geometry.cylinders, conf->cyls);
     virtio_stl_p(vdev, &blkcfg.blk_size, blk_size);
     virtio_stw_p(vdev, &blkcfg.min_io_size, conf->min_io_size / blk_size);
-    virtio_stw_p(vdev, &blkcfg.opt_io_size, conf->opt_io_size / blk_size);
+    virtio_stl_p(vdev, &blkcfg.opt_io_size, conf->opt_io_size / blk_size);
     blkcfg.geometry.heads = conf->heads;
     /*
      * We must ensure that the block device capacity is a multiple of
-- 
2.26.2


