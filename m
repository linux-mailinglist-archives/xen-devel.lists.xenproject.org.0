Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B32CC1E6FBE
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 00:55:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jeRQw-0001SS-28; Thu, 28 May 2020 22:55:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=leMz=7K=yandex-team.ru=rvkagan@srs-us1.protection.inumbo.net>)
 id 1jeRQt-0001SN-N8
 for xen-devel@lists.xenproject.org; Thu, 28 May 2020 22:55:28 +0000
X-Inumbo-ID: 50c1c4d8-a136-11ea-8993-bc764e2007e4
Received: from forwardcorp1p.mail.yandex.net (unknown [77.88.29.217])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 50c1c4d8-a136-11ea-8993-bc764e2007e4;
 Thu, 28 May 2020 22:55:25 +0000 (UTC)
Received: from mxbackcorp1o.mail.yandex.net (mxbackcorp1o.mail.yandex.net
 [IPv6:2a02:6b8:0:1a2d::301])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 7FE012E14E9;
 Fri, 29 May 2020 01:55:23 +0300 (MSK)
Received: from iva4-7c3d9abce76c.qloud-c.yandex.net
 (iva4-7c3d9abce76c.qloud-c.yandex.net [2a02:6b8:c0c:4e8e:0:640:7c3d:9abc])
 by mxbackcorp1o.mail.yandex.net (mxbackcorp/Yandex) with ESMTP id
 42411HDFKv-tGx0AjR1; Fri, 29 May 2020 01:55:23 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1590706523; bh=bUJnbRB6fLAgdvUHR4vxsn1k8XIGmwL4yvdLETP4YEw=;
 h=Message-Id:Date:Subject:To:From:Cc;
 b=eHQklP5M7jKdipoVYcPit0Q9YR1xnbAZbfwiHxyU18yqXF8RL4w0ZWEIaaqkQfqFX
 d/QwHBTTr/nXZhih1CCsXqjZ12d0H3UYKhWSFeqX0j+VJMiBHvsyEU1y98I5AgL7Ix
 1roQi0iBKl3xvR7GGgpcnQLmwDeFQ4PaAlyCHp3o=
Authentication-Results: mxbackcorp1o.mail.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b081:1318::1:10])
 by iva4-7c3d9abce76c.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 tdfEhvD3Vg-tGWSfLS8; Fri, 29 May 2020 01:55:16 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Roman Kagan <rvkagan@yandex-team.ru>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 0/8] block: enhance handling of size-related BlockConf
 properties
Date: Fri, 29 May 2020 01:55:08 +0300
Message-Id: <20200528225516.1676602-1-rvkagan@yandex-team.ru>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Paul Durrant <paul@xen.org>, John Snow <jsnow@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Eric Blake <eblake@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

BlockConf includes several properties counted in bytes.=0D
=0D
Enhance their handling in some aspects, specifically=0D
=0D
- accept common size suffixes (k, m)=0D
- perform consistency checks on the values=0D
- lift the upper limit on physical_block_size and logical_block_size=0D
=0D
Also fix the accessor for opt_io_size in virtio-blk to make it consistent w=
ith=0D
the size of the field.=0D
=0D
History:=0D
v7 -> v8:=0D
- replace stringify with %u in error messages [Eric]=0D
- fix wording in logs [Eric]=0D
=0D
v6 -> v7:=0D
- avoid overflow in min_io_size check [Eric]=0D
- try again to perform the art form in patch splitting [Eric]=0D
=0D
v5 -> v6:=0D
- fix forgotten xen-block and swim=0D
- add prop_size32 instead of going with 64bit=0D
=0D
v4 -> v5:=0D
- re-split the patches [Philippe]=0D
- fix/reword error messages [Philippe, Kevin]=0D
- do early return on failed consistency check [Philippe]=0D
- use QEMU_IS_ALIGNED instead of open coding [Philippe]=0D
- make all BlockConf size props support suffixes=0D
- expand the log for virtio-blk opt_io_size [Michael]=0D
=0D
v3 -> v4:=0D
- add patch to fix opt_io_size width in virtio-blk=0D
- add patch to perform consistency checks [Kevin]=0D
- check min_io_size against truncation [Kevin]=0D
=0D
v2 -> v3:=0D
- mention qcow2 cluster size limit in the log and comment [Eric]=0D
=0D
v1 -> v2:=0D
- cap the property at 2 MiB [Eric]=0D
- accept size suffixes=0D
=0D
Roman Kagan (8):=0D
  virtio-blk: store opt_io_size with correct size=0D
  block: consolidate blocksize properties consistency checks=0D
  qdev-properties: blocksize: use same limits in code and description=0D
  qdev-properties: add size32 property type=0D
  qdev-properties: make blocksize accept size suffixes=0D
  block: make BlockConf size props 32bit and accept size suffixes=0D
  qdev-properties: add getter for size32 and blocksize=0D
  block: lift blocksize property limit to 2 MiB=0D
=0D
 include/hw/block/block.h     |  14 +-=0D
 include/hw/qdev-properties.h |   5 +-=0D
 hw/block/block.c             |  40 ++-=0D
 hw/block/fdc.c               |   5 +-=0D
 hw/block/nvme.c              |   5 +-=0D
 hw/block/swim.c              |   5 +-=0D
 hw/block/virtio-blk.c        |   9 +-=0D
 hw/block/xen-block.c         |   6 +-=0D
 hw/core/qdev-properties.c    |  85 +++++-=0D
 hw/ide/qdev.c                |   5 +-=0D
 hw/scsi/scsi-disk.c          |  12 +-=0D
 hw/usb/dev-storage.c         |   5 +-=0D
 tests/qemu-iotests/172.out   | 532 +++++++++++++++++------------------=0D
 13 files changed, 419 insertions(+), 309 deletions(-)=0D
=0D
-- =0D
2.26.2=0D
=0D

