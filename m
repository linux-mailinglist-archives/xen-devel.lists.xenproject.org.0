Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B735258A62
	for <lists+xen-devel@lfdr.de>; Tue,  1 Sep 2020 10:34:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kD1jU-00024I-JC; Tue, 01 Sep 2020 08:33:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=M6GQ=CK=citrix.com=roger.pau@srs-us1.protection.inumbo.net>)
 id 1kD1jS-00024D-VD
 for xen-devel@lists.xenproject.org; Tue, 01 Sep 2020 08:33:35 +0000
X-Inumbo-ID: 30143e6f-8150-4fe3-a423-867b3cda60ee
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 30143e6f-8150-4fe3-a423-867b3cda60ee;
 Tue, 01 Sep 2020 08:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1598949213;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rfRW5+bl+qCIe+HR0i2S+LLMqYFuztw2ljG4SK2rpSY=;
 b=MQUf5hM19rSKWaLinRUTa+bsXFGrhJ29dalwKEb7NEqqjSj/trziRIFc
 ZVxCGqMgANKSMLWlnzwcxQjemDjM6VzbtePRYptVw8tFgP5lK9b2XIvvJ
 DB2w4Hd7ubBvohscB0gbeN8zxrtUD0YVHGBrhPJ+Qz8ivKem4ugle8Vc0 w=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: Gjn7i185+YEUIKot2BoXXzYXkOG4zv/dbnSJSGJh/8iittMRR/+2+79/Z27aJIpb/vwzQTArOv
 R47sk99jf88ZGQSNTRehWVcFN+uWUOlb49/FB4g3FMNsM7GyKquitD9NoFaPIPLg/AP8MEvEWP
 fwkwF/lnnc0p474ESAeUZTBD5RfUqIXZh4Nnkj8y3kFJ/fIcPxgnAI+GoYAxfB3phnT1+OIrdo
 K8fq7RhQ2rbIAmhlPDTRFY4lVXDR3mA3DoCF4fl2PLh4Gsos3aHeb/CSbKe+/G5Eta7CyaYmZY
 xMY=
X-SBRS: 2.7
X-MesageID: 25850300
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.76,378,1592884800"; d="scan'208";a="25850300"
From: Roger Pau Monne <roger.pau@citrix.com>
To: <linux-kernel@vger.kernel.org>
CC: Roger Pau Monne <roger.pau@citrix.com>, Boris Ostrovsky
 <boris.ostrovsky@oracle.com>, Juergen Gross <jgross@suse.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>, <xen-devel@lists.xenproject.org>
Subject: [PATCH v5 0/3] xen/balloon: fixes for memory hotplug
Date: Tue, 1 Sep 2020 10:33:23 +0200
Message-ID: <20200901083326.21264-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hello,

The following series contain some fixes in order to split Xen
unpopulated memory handling from the ballooning driver using the
ZONE_DEVICE functionality, so that physical memory regions used to map
foreign pages are not tied to memory hotplug.

Note this is currently only available for x86 due to Arm using an
identity map for dom0 p2m and thus needing special handling.

Thanks, Roger.

Roger Pau Monne (3):
  xen/balloon: add header guard
  memremap: rename MEMORY_DEVICE_DEVDAX to MEMORY_DEVICE_GENERIC
  xen: add helpers to allocate unpopulated memory

 drivers/dax/device.c                    |   2 +-
 drivers/gpu/drm/xen/xen_drm_front_gem.c |   9 +-
 drivers/xen/Kconfig                     |  11 ++
 drivers/xen/Makefile                    |   1 +
 drivers/xen/balloon.c                   |   4 +-
 drivers/xen/grant-table.c               |   4 +-
 drivers/xen/privcmd.c                   |   4 +-
 drivers/xen/unpopulated-alloc.c         | 185 ++++++++++++++++++++++++
 drivers/xen/xenbus/xenbus_client.c      |   6 +-
 drivers/xen/xlate_mmu.c                 |   4 +-
 include/linux/memremap.h                |   9 +-
 include/xen/balloon.h                   |   4 +
 include/xen/xen.h                       |   9 ++
 mm/memremap.c                           |   2 +-
 14 files changed, 232 insertions(+), 22 deletions(-)
 create mode 100644 drivers/xen/unpopulated-alloc.c

-- 
2.28.0


