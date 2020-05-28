Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 583921E6DD9
	for <lists+xen-devel@lfdr.de>; Thu, 28 May 2020 23:40:25 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeQFy-0002hz-QL; Thu, 28 May 2020 21:40:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=leMz=7K=yandex-team.ru=rvkagan@srs-us1.protection.inumbo.net>)
 id 1jeQFw-0002UC-So
 for xen-devel@lists.xenproject.org; Thu, 28 May 2020 21:40:04 +0000
X-Inumbo-ID: c8016bb2-a12b-11ea-9947-bc764e2007e4
Received: from forwardcorp1j.mail.yandex.net (unknown [2a02:6b8:0:1619::183])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c8016bb2-a12b-11ea-9947-bc764e2007e4;
 Thu, 28 May 2020 21:40:00 +0000 (UTC)
Received: from mxbackcorp2j.mail.yandex.net (mxbackcorp2j.mail.yandex.net
 [IPv6:2a02:6b8:0:1619::119])
 by forwardcorp1j.mail.yandex.net (Yandex) with ESMTP id E14EF2E0E4D;
 Fri, 29 May 2020 00:39:58 +0300 (MSK)
Received: from vla5-58875c36c028.qloud-c.yandex.net
 (vla5-58875c36c028.qloud-c.yandex.net [2a02:6b8:c18:340b:0:640:5887:5c36])
 by mxbackcorp2j.mail.yandex.net (mxbackcorp/Yandex) with ESMTP id
 57WkjCjfeF-drfO2KuB; Fri, 29 May 2020 00:39:58 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1590701998; bh=QhaZGhUGT//OQOhXA4U9vk1hEzoswycgPYq+LACJTvA=;
 h=In-Reply-To:Message-Id:References:Date:Subject:To:From:Cc;
 b=J1hsV3Zu3Kdk9x90+JIO4BvbwGSJO3/RF4PmBR4BmaXKQVKnQcKyItZ63s7RucraM
 CURaYPuDINuwrQULpzWQrWMzSkGQLZf249L/ihkF3TkWOuuHW6eEBstRKf1TXLJltz
 yU/dtNb2Jdb5G1Tu53A2QGg3GUdAA+fck6P5utdE=
Authentication-Results: mxbackcorp2j.mail.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b081:1318::1:10])
 by vla5-58875c36c028.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 KqoauPPys3-drXq1Pqx; Fri, 29 May 2020 00:39:53 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Roman Kagan <rvkagan@yandex-team.ru>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 1/8] virtio-blk: store opt_io_size with correct size
Date: Fri, 29 May 2020 00:39:39 +0300
Message-Id: <20200528213946.1636444-2-rvkagan@yandex-team.ru>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200528213946.1636444-1-rvkagan@yandex-team.ru>
References: <20200528213946.1636444-1-rvkagan@yandex-team.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
 Max Reitz <mreitz@redhat.com>, Anthony Perard <anthony.perard@citrix.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Keith Busch <kbusch@kernel.org>,
 xen-devel@lists.xenproject.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 John Snow <jsnow@redhat.com>
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
- split out into separate patch [Philippe]

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


