Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B991E42BE
	for <lists+xen-devel@lfdr.de>; Wed, 27 May 2020 14:53:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jdvXi-0001Sb-HH; Wed, 27 May 2020 12:52:22 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mVnz=7J=yandex-team.ru=rvkagan@srs-us1.protection.inumbo.net>)
 id 1jdvQw-0000f6-1I
 for xen-devel@lists.xenproject.org; Wed, 27 May 2020 12:45:22 +0000
X-Inumbo-ID: ec23362a-a017-11ea-a740-12813bfff9fa
Received: from forwardcorp1o.mail.yandex.net (unknown [95.108.205.193])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ec23362a-a017-11ea-a740-12813bfff9fa;
 Wed, 27 May 2020 12:45:20 +0000 (UTC)
Received: from mxbackcorp1o.mail.yandex.net (mxbackcorp1o.mail.yandex.net
 [IPv6:2a02:6b8:0:1a2d::301])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 2C5E72E1581;
 Wed, 27 May 2020 15:45:18 +0300 (MSK)
Received: from iva4-7c3d9abce76c.qloud-c.yandex.net
 (iva4-7c3d9abce76c.qloud-c.yandex.net [2a02:6b8:c0c:4e8e:0:640:7c3d:9abc])
 by mxbackcorp1o.mail.yandex.net (mxbackcorp/Yandex) with ESMTP id
 yGuxnAsuRm-jBxmk9RU; Wed, 27 May 2020 15:45:18 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1590583518; bh=42hnJ6RHsswvNBcGuhOx1Vid5BV/7/IOuRuXw9PtENo=;
 h=Message-Id:Date:Subject:To:From:Cc;
 b=GT+rFY3/A/0GhjPSqnGNvn8/0KVp00ezEslGbKJi1h1CVFHRFaME8nksjJwjD6zVw
 raZBgRPM5mlp8y4/rx6hWXKRnNlkNTSuGd95/scuF9tESi9pzKpbstRV6qtHXXiAtn
 i85pJ9QEsSf4mIai+JIHe8xloikKTWVzzaQUhOKI=
Authentication-Results: mxbackcorp1o.mail.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b080:8308::1:12])
 by iva4-7c3d9abce76c.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 bzO5qPtczO-jBWOPpYZ; Wed, 27 May 2020 15:45:11 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Roman Kagan <rvkagan@yandex-team.ru>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 0/5] block: enhance handling of size-related BlockConf
 properties
Date: Wed, 27 May 2020 15:45:06 +0300
Message-Id: <20200527124511.986099-1-rvkagan@yandex-team.ru>
X-Mailer: git-send-email 2.26.2
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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

BlockConf includes several properties counted in bytes.=0D
=0D
Enhance their handling in a some aspects, specifically=0D
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
Roman Kagan (5):=0D
  virtio-blk: store opt_io_size with correct size=0D
  block: consolidate blocksize properties consistency checks=0D
  qdev-properties: blocksize: use same limits in code and description=0D
  block: make size-related BlockConf properties accept size suffixes=0D
  block: lift blocksize property limit to 2 MiB=0D
=0D
 include/hw/block/block.h     |  14 +-=0D
 include/hw/qdev-properties.h |   5 +-=0D
 hw/block/block.c             |  41 ++-=0D
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
 13 files changed, 420 insertions(+), 309 deletions(-)=0D
=0D
-- =0D
2.26.2=0D
=0D

